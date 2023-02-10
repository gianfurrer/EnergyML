<?xml version="1.0" ?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>

    <xsl:template match="feature">
        <html>
            <head>
                <title>Feature #03</title>
                <xsl:copy-of select="document('../template.xml')/template/head/*"/>
            </head>
            <body>
                <xsl:copy-of select="document('../template.xml')/template/menu/*"/>
                <h1>Feature #03</h1>
                

            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>