<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.1"
  xmlns:fo="http://www.w3.org/1999/XSL/Format"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:svg="http://www.w3.org/2000/svg">

  <xsl:variable name="canvasWidth" select="550" />
  <xsl:variable name="canvasHeight" select="370" />

  <xsl:variable name="plotWidth" select="500" />
  <xsl:variable name="plotHeight" select="300" />
  <xsl:variable name="plotStartX" select="50" />
  <xsl:variable name="xOffset" select="6.9" />
  <xsl:variable name="yOffset" select="30" />

  <xsl:variable name="colorGasoline" select="'#9dd966'" />
  <xsl:variable name="colorFirewood" select="'#c54930'" />
  <xsl:variable name="colorDiesel" select="'#92ddd0'" />
  <xsl:variable name="colorDistrictHeat" select="'#f2ca60'" />
  <xsl:variable name="colorGas" select="'#6f4d7c'" />
  <xsl:variable name="colorHeatingOil" select="'#faa257'" />
  <xsl:variable name="colorElectricity" select="'#2883a5'" />

  <xsl:template match="/">
    <fo:root>
      <fo:layout-master-set>
        <fo:simple-page-master master-name="standard" page-height="29.7cm" page-width="21cm" margin-top="1cm" margin-bottom="2cm" margin-left="2.1cm" margin-right="2.1cm">
          <fo:region-body region-name="body" />
        </fo:simple-page-master>
      </fo:layout-master-set>

      <fo:page-sequence master-reference="standard">
        <fo:flow flow-name="body">
          <fo:block text-align-last="end" margin-top="0.25in" margin-right="0.25in">
            <fo:external-graphic src="../assets/logo-placeholder.png" content-width="2.5in" />
          </fo:block>
          <fo:block text-align="center" margin-top="10%" font-size="20pt">
            Energy Prices over the Years
          </fo:block>
          <fo:block text-align="center" margin-top="10%">
            <fo:instream-foreign-object>
              <svg:svg width="{$canvasWidth}" height="{$canvasHeight}">
                <svg:rect x="{$plotStartX}" y="0" width="{$plotWidth}" height="{$plotHeight}" fill="#FAFAFA" />
                <svg:line x1="{$plotStartX}" y1="0" x2="{$plotStartX}" y2="{$plotHeight}" stroke="#000000" stroke-width="3" />
                <svg:line x1="{$plotStartX}" y1="{$plotHeight}" x2="{$canvasWidth}" y2="{$plotHeight}" stroke="#000000" stroke-width="3" />
                <svg:text font-size="10" fill="black" x="0" y="0" transform="rotate(270) translate(-{$plotHeight div 2}, {$plotStartX - 30})">Energie
    Preis CHF</svg:text>
                <svg:text font-size="10" fill="black" x="{$plotWidth div 2}" y="{$plotHeight + 60}">Energie Preis Datum</svg:text>

                <xsl:call-template name="drawPriceReference">
                  <xsl:with-param name="i">9</xsl:with-param>
                </xsl:call-template>

                <xsl:call-template name="drawData">
                </xsl:call-template>
              </svg:svg>
            </fo:instream-foreign-object>
          </fo:block>
          <fo:block text-align="center">
            <fo:table width="100%" color="#000000" font-size="10pt" font-weight="bold">
              <fo:table-column column-width="13%" />
              <fo:table-column column-width="14%" />
              <fo:table-column column-width="12%" />
              <fo:table-column column-width="17%" />
              <fo:table-column column-width="10%" />
              <fo:table-column column-width="16%" />
              <fo:table-column column-width="14%" />
              <fo:table-body>
                <fo:table-row>
                  <fo:table-cell>
                    <fo:block text-align="center">
                      <fo:inline font-size="17pt" vertical-align="middle">
                        <xsl:attribute name="color">
                          <xsl:value-of select="$colorGasoline" />
                        </xsl:attribute>
                      •
                      </fo:inline>
                      <fo:inline vertical-align="middle">Gasoline</fo:inline>
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell>
                    <fo:block text-align="center">
                      <fo:inline font-size="17pt" vertical-align="middle">
                        <xsl:attribute name="color">
                          <xsl:value-of select="$colorFirewood" />
                        </xsl:attribute>
                      •
                      </fo:inline>
                      <fo:inline vertical-align="middle">Firewood</fo:inline>
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell>
                    <fo:block text-align="center">
                      <fo:inline font-size="17pt" vertical-align="middle">
                        <xsl:attribute name="color">
                          <xsl:value-of select="$colorDiesel" />
                        </xsl:attribute>
                      •
                      </fo:inline>
                      <fo:inline vertical-align="middle">Diesel</fo:inline>
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell>
                    <fo:block text-align="center">
                      <fo:inline font-size="17pt" vertical-align="middle">
                        <xsl:attribute name="color">
                          <xsl:value-of select="$colorDistrictHeat" />
                        </xsl:attribute>
                      •
                      </fo:inline>
                      <fo:inline vertical-align="middle">District Heat</fo:inline>
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell>
                    <fo:block text-align="center">
                      <fo:inline font-size="17pt" vertical-align="middle">
                        <xsl:attribute name="color">
                          <xsl:value-of select="$colorGas" />
                        </xsl:attribute>
                      •
                      </fo:inline>
                      <fo:inline vertical-align="middle">Gas</fo:inline>
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell>
                    <fo:block text-align="center">
                      <fo:inline font-size="17pt" vertical-align="middle">
                        <xsl:attribute name="color">
                          <xsl:value-of select="$colorHeatingOil" />
                        </xsl:attribute>
                      •
                      </fo:inline>
                      <fo:inline vertical-align="middle">Heating Oil</fo:inline>
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell>
                    <fo:block text-align="center">
                      <fo:inline font-size="17pt" vertical-align="middle">
                        <xsl:attribute name="color">
                          <xsl:value-of select="$colorElectricity" />
                        </xsl:attribute>
                      •
                      </fo:inline>
                      <fo:inline vertical-align="middle">Electricity</fo:inline>
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-body>
            </fo:table>
          </fo:block>
        </fo:flow>
      </fo:page-sequence>

      <fo:page-sequence master-reference="standard">
        <fo:flow flow-name="body">
          <fo:block text-align="center" margin-top="10%" font-size="20pt">
            List of Energy Prices
          </fo:block>
          <fo:block text-align="center" font-size="10pt" margin-top="10%">
            <fo:table width="100%" border="1pt solid black">
              <fo:table-column border="1pt solid black" column-width="16%" />
              <fo:table-column border="1pt solid black" column-width="12%" />
              <fo:table-column border="1pt solid black" column-width="12%" />
              <fo:table-column border="1pt solid black" column-width="8%" />
              <fo:table-column border="1pt solid black" column-width="16%" />
              <fo:table-column border="1pt solid black" column-width="7%" />
              <fo:table-column border="1pt solid black" column-width="16%" />
              <fo:table-column border="1pt solid black" column-width="13%" />

              <fo:table-header>
                <fo:table-row font-weight="bold" color="#FFFFFF">
                  <fo:table-cell padding="5pt" background-color="#0047AB">
                    <fo:block text-align="center">Date</fo:block>
                  </fo:table-cell>
                  <fo:table-cell padding="5pt">
                    <xsl:attribute name="background-color">
                      <xsl:value-of select="$colorGasoline" />
                    </xsl:attribute>
                    <fo:block text-align="center">Gasoline</fo:block>
                  </fo:table-cell>
                  <fo:table-cell padding="5pt">
                    <xsl:attribute name="background-color">
                      <xsl:value-of select="$colorFirewood" />
                    </xsl:attribute>
                    <fo:block text-align="center">Firewood</fo:block>
                  </fo:table-cell>
                  <fo:table-cell padding="5pt">
                    <xsl:attribute name="background-color">
                      <xsl:value-of select="$colorDiesel" />
                    </xsl:attribute>
                    <fo:block text-align="center">Diesel</fo:block>
                  </fo:table-cell>
                  <fo:table-cell padding="5pt">
                    <xsl:attribute name="background-color">
                      <xsl:value-of select="$colorDistrictHeat" />
                    </xsl:attribute>
                    <fo:block text-align="center">District Heat</fo:block>
                  </fo:table-cell>
                  <fo:table-cell padding="5pt">
                    <xsl:attribute name="background-color">
                      <xsl:value-of select="$colorGas" />
                    </xsl:attribute>
                    <fo:block text-align="center">Gas</fo:block>
                  </fo:table-cell>
                  <fo:table-cell padding="5pt">
                    <xsl:attribute name="background-color">
                      <xsl:value-of select="$colorHeatingOil" />
                    </xsl:attribute>
                    <fo:block text-align="center">Heating Oil</fo:block>
                  </fo:table-cell>
                  <fo:table-cell padding="5pt">
                    <xsl:attribute name="background-color">
                      <xsl:value-of select="$colorElectricity" />
                    </xsl:attribute>
                    <fo:block text-align="center">Electricity</fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </fo:table-header>

              <fo:table-body>
                <xsl:apply-templates select="document('../database.xml')/energyml/entry" />
              </fo:table-body>
            </fo:table>
          </fo:block>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>

  <xsl:template match="entry">
    <fo:table-row>
      <xsl:attribute name="background-color">
        <xsl:choose>
          <xsl:when test="position() mod 2 = 0">#F0F8FF</xsl:when>
          <xsl:otherwise>#B9D9EB</xsl:otherwise>
        </xsl:choose>
      </xsl:attribute>

      <fo:table-cell padding="2pt">
        <fo:block text-align="center">
          <xsl:value-of select="date" />
        </fo:block>
      </fo:table-cell>
      <fo:table-cell padding="2pt">
        <fo:block text-align="center">
          <xsl:value-of select="priceGasoline" />
        </fo:block>
      </fo:table-cell>
      <fo:table-cell padding="2pt">
        <fo:block text-align="center">
          <xsl:value-of select="priceFirewood" />
        </fo:block>
      </fo:table-cell>
      <fo:table-cell padding="2pt">
        <fo:block text-align="center">
          <xsl:value-of select="priceDiesel" />
        </fo:block>
      </fo:table-cell>
      <fo:table-cell padding="2pt">
        <fo:block text-align="center">
          <xsl:value-of select="priceDistrictHeat" />
        </fo:block>
      </fo:table-cell>
      <fo:table-cell padding="2pt">
        <fo:block text-align="center">
          <xsl:value-of select="priceGas" />
        </fo:block>
      </fo:table-cell>
      <fo:table-cell padding="2pt">
        <fo:block text-align="center">
          <xsl:value-of select="priceHeatingOil" />
        </fo:block>
      </fo:table-cell>
      <fo:table-cell padding="2pt">
        <fo:block text-align="center">
          <xsl:value-of select="priceElectricity" />
        </fo:block>
      </fo:table-cell>
    </fo:table-row>
  </xsl:template>


  <xsl:template name="drawPriceReference">
    <xsl:param name="i"></xsl:param>
    <xsl:choose>
      <xsl:when test="$i &gt; 0">
        <xsl:variable name="val" select="number($i) - 10" />
        <xsl:variable name="abs" select="$val*($val >=0) - $val*($val &lt; 0)" />

        <svg:text font-size="8" fill="black" x="{$plotStartX  - 20}" y="{$abs * $yOffset}">
          <xsl:value-of select="$i * 15 + 80" />
        </svg:text>
        <svg:line x1="{$plotStartX}" y1="{$abs * $yOffset}" x2="{$canvasWidth}" y2="{$abs * $yOffset}" stroke="#DADADA" stroke-width="1" stroke-dasharray="7 3" />

        <xsl:call-template name="drawPriceReference">
          <xsl:with-param name="i">
            <xsl:number value="number($i)-1" />
          </xsl:with-param>
        </xsl:call-template>
      </xsl:when>
      <xsl:otherwise></xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="drawData">
    <xsl:for-each select="document('../database.xml')/energyml/entry">
      <!-- Draw Date Reference -->
      <xsl:if test="position() = 1">
        <svg:text font-size="8" fill="black" x="0" y="0" transform="rotate(90) translate({$plotHeight + 5}, -{$plotStartX + position() * $xOffset - 5})">
          <xsl:value-of select="date" />
        </svg:text>
      </xsl:if>
      <xsl:if test="position() mod 12 = 0">
        <svg:text font-size="8" fill="black" x="0" y="0" transform="rotate(90) translate({$plotHeight + 5}, -{$plotStartX + position() * $xOffset - 5})">
          <xsl:value-of select="date" />
        </svg:text>
      </xsl:if>

      <svg:line x1="{$plotStartX + position() * $xOffset}" y1="0" x2="{$plotStartX + position() * $xOffset}" y2="{$plotHeight}" stroke="#DADADA" stroke-width="1" stroke-dasharray="7 3" />


      <!-- Draw Points -->
      <xsl:variable name="start">
        <xsl:value-of select="1.535 * $plotHeight" />
      </xsl:variable>
      <xsl:variable name="multiplier">
        <xsl:value-of select="2" />
      </xsl:variable>
      <xsl:variable name="priceGasoline">
        <xsl:value-of select="priceGasoline" />
      </xsl:variable>
      <svg:circle cx="{$plotStartX + position() * $xOffset}" cy="{$start - $multiplier * $priceGasoline }" r="2" fill="{$colorGasoline}" />
      <xsl:variable name="priceFirewood">
        <xsl:value-of select="priceFirewood" />
      </xsl:variable>
      <svg:circle cx="{$plotStartX + position() * $xOffset}" cy="{$start - $multiplier * $priceFirewood }" r="2" fill="{$colorFirewood}" />
      <xsl:variable name="priceDiesel">
        <xsl:value-of select="priceDiesel" />
      </xsl:variable>
      <svg:circle cx="{$plotStartX + position() * $xOffset}" cy="{$start - $multiplier * $priceDiesel }" r="2" fill="{$colorDiesel}" />
      <xsl:variable name="priceDistrictHeat">
        <xsl:value-of select="priceDistrictHeat" />
      </xsl:variable>
      <svg:circle cx="{$plotStartX + position() * $xOffset}" cy="{$start - $multiplier * $priceDistrictHeat }" r="2" fill="{$colorDistrictHeat}" />
      <xsl:variable name="priceGas">
        <xsl:value-of select="priceGas" />
      </xsl:variable>
      <svg:circle cx="{$plotStartX + position() * $xOffset}" cy="{$start - $multiplier * $priceGas }" r="2" fill="{$colorGas}" />
      <xsl:variable name="priceHeatingOil">
        <xsl:value-of select="priceHeatingOil" />
      </xsl:variable>
      <svg:circle cx="{$plotStartX + position() * $xOffset}" cy="{$start - $multiplier * $priceHeatingOil }" r="2" fill="{$colorHeatingOil}" />
      <xsl:variable name="priceElectricity">
        <xsl:value-of select="priceElectricity" />
      </xsl:variable>
      <svg:circle cx="{$plotStartX + position() * $xOffset}" cy="{$start - $multiplier * $priceElectricity }" r="2" fill="{$colorElectricity}" />

    </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>
