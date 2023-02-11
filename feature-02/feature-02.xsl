<?xml version="1.0"?>

<xsl:stylesheet
    version="1.0"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:svg="http://www.w3.org/2000/svg">

    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" />


    <!-- Global variables -->
    <xsl:variable name="canvasWidth" select="900" />
    <xsl:variable name="canvasHeight" select="550" />

    <xsl:variable name="plotWidth" select="800" />
    <xsl:variable name="plotHeight" select="400" />
    <xsl:variable name="plotStartX" select="100" />
    <xsl:variable name="xOffset" select="11" />
    <xsl:variable name="yOffset" select="40" />

    <xsl:template match="feature">
        <html>
            <head>
                <title>EnergyML Statistics</title>
                <xsl:copy-of select="document('../template.xml')/template/head/*" />
            </head>
            <body>
                <xsl:copy-of select="document('../template.xml')/template/menu/*" />
                <h1>EnergyML Statistics</h1>

                <svg:svg width="{$canvasWidth}" height="{$canvasHeight}">
                    <svg:rect x="{$plotStartX}" y="0" width="{$plotWidth}" height="{$plotHeight}"
                        fill="#DDDDDD" />
                    <svg:line x1="{$plotStartX}" y1="0" x2="100" y2="{$plotHeight}" stroke="#000000"
                        stroke-width="3" />
                    <svg:line x1="{$plotStartX}" y1="{$plotHeight}" x2="{$canvasWidth}"
                        y2="{$plotHeight}" stroke="#000000" stroke-width="3" />
                    <svg:text font-size="15" fill="black" x="0" y="0"
                        transform="rotate(270) translate(-{$plotHeight div 2}, {$plotStartX - 50})">Energie
                        Preis CHF</svg:text>
                    <svg:text font-size="15" fill="black" x="{$plotWidth div 2}"
                        y="{$plotHeight + 110}">Energie Preis Datum</svg:text>

                    <xsl:call-template name="drawPriceReference">
                        <xsl:with-param name="i">9</xsl:with-param>
                    </xsl:call-template>

                    <xsl:apply-templates select="document('../database.xml')/energyml/entry" />
                </svg:svg>
            </body>
        </html>
    </xsl:template>

    <xsl:template name="drawPriceReference">
        <xsl:param name="i"></xsl:param>
        <xsl:choose>
            <xsl:when test="$i &gt; 0">
                <xsl:variable name="val" select="number($i) - 10" />
                <xsl:variable name="abs" select="$val*($val >=0) - $val*($val &lt; 0)" />

                <svg:text font-size="15" fill="black" x="{$plotStartX  - 30}"
                    y="{$abs * $yOffset + 5}">
                    <xsl:value-of select="$i * 20" />
                </svg:text>
                <svg:line x1="{$plotStartX}" y1="{$abs * $yOffset}" x2="{$canvasWidth}"
                    y2="{$abs * $yOffset}" stroke="#B5BDC0" stroke-width="1" stroke-dasharray="7 3" />

                <xsl:call-template name="drawPriceReference">
                    <xsl:with-param name="i">
                        <xsl:number value="number($i)-1" />
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise></xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="entry">
        <!-- Draw Date Reference -->
        <xsl:if test="position() = 1">
            <svg:text font-size="15" fill="black" x="0" y="0"
                transform="rotate(90) translate({$plotHeight + 5}, -{$plotStartX + position() * $xOffset - 5})">
                <xsl:value-of select="date" />
            </svg:text>
        </xsl:if>
        <xsl:if test="position() mod 12 = 0">
            <svg:text font-size="15" fill="black" x="0" y="0"
                transform="rotate(90) translate({$plotHeight + 5}, -{$plotStartX + position() * $xOffset - 5})">
                <xsl:value-of select="date" />
            </svg:text>
        </xsl:if>

        <svg:line x1="{$plotStartX + position() * $xOffset}" y1="0"
            x2="{$plotStartX + position() * $xOffset}"
            y2="{$plotHeight}" stroke="#B5BDC0" stroke-width="1" stroke-dasharray="7 3" />


        <!-- Draw Points -->
        <xsl:variable name="price">
            <xsl:value-of select="priceGasoline" />
        </xsl:variable>
        <svg:circle cx="{$plotStartX + position() * $xOffset}" cy="{$plotHeight - 2 * $price }"
            r="3" fill="#FF0000" />

    </xsl:template>

</xsl:stylesheet>