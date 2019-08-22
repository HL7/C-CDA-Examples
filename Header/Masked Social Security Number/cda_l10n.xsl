<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet exclude-result-prefixes="hl7 xsi" version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:hl7="urn:hl7-org:v3"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <xsl:output method="html"/>
    <xsl:template match="translations">
        <html>
            <head>
                <title>CDA Language File</title>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
                <script type="text/javascript" src="../css/gs_sortable.js"/>
                <script type="text/javascript">
                    <xsl:text>var TSort_Data = new Array ('codeList', 's'</xsl:text>
                    <xsl:for-each select="languageList/language">, 's'</xsl:for-each>
                    <xsl:text>);</xsl:text>
                    <xsl:text>var TSort_Initial = 0;</xsl:text>
                    <xsl:text>var TSort_Classes = new Array ('plain', 'alternate');</xsl:text>
                    <xsl:text>tsRegister();</xsl:text>
                </script>
                <link type="text/css" href="../css/nictiz.css" rel="stylesheet"/>
            </head>
            <body>
                <table width="100%">
                    <tr>
                        <td valign="bottom">
                            <h1>CDA Language File</h1>
                        </td>
                        <td align="right">&#160;</td>
                    </tr>
                </table>
                <p/>
                <div class="content">
                    <h2>Supported languages (<xsl:value-of select="count(languageList/language)"/>)</h2>
                    <p/>
                    <div class="level2">
                        <ul>
                            <xsl:for-each select="languageList/language">
                                <li>
                                    <xsl:value-of select="@lang"/>
                                    <xsl:text> - </xsl:text>
                                    <xsl:value-of select="@description"/>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </div>
                    <p/>
                    <table class="values" id="codeList">
                        <thead>
                            <tr>
                                <th>
                                    <xsl:text>Key</xsl:text>
                                    <xsl:text> (</xsl:text>
                                    <xsl:value-of select="count(translation)"/>
                                    <xsl:text>)</xsl:text>
                                </th>
                                <xsl:for-each select="languageList/language">
                                    <xsl:variable name="lang" select="@lang"/>
                                    <xsl:if test="../../translation/value[@lang=$lang]">
                                        <th>
                                            <xsl:value-of select="@lang"/>
                                            <xsl:text> (</xsl:text>
                                            <xsl:value-of select="count(../../translation/value[@lang=$lang])"/>
                                            <xsl:text>)</xsl:text>
                                        </th>
                                    </xsl:if>
                                </xsl:for-each>
                            </tr>
                        </thead>
                        <xsl:apply-templates select="translation"/>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="translation">
        <xsl:variable name="curPos" select="."/>
        <tr>
            <td>
                <xsl:value-of select="@key"/>
            </td>
            <!-- get translations in the same order as their column headers -->
            <xsl:for-each select="//languageList/language">
                <xsl:variable name="lang" select="@lang"/>
                <td>
                    <xsl:value-of select="$curPos/value[@lang = $lang]"/>
                </td>
            </xsl:for-each>
        </tr>
    </xsl:template>
</xsl:stylesheet>
