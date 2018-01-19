<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html"/>
    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="Web/footballCatalog.css" type="text/css"></link>
                <title>Football teams</title>
            </head>
            <body>
                <h1>Football teams</h1>
                <xsl:apply-templates select="catalog"/>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="catalog">
        <table>
            <xsl:for-each select="./leagues/league">
                <xsl:variable name="league_id" select="@id"/>
                <tr>
                  <h2><xsl:value-of select="."/></h2>
                </tr>
                <xsl:for-each select="../../clubs/club/league[@league_id=$league_id]">
                    <tr>
                        <div class="single-team">
                        <h4><xsl:value-of select='../name'/></h4>
                        <xsl:variable name="current_id" select='../@id'/>
                          <!-- <img style="max-width: 200px; height:auto;" src="./images/{$current_id}"/> -->
                        <ul>
                            <li>Founded: <xsl:value-of select='../year_established'/></li>
                        </ul>
                        <xsl:variable name="player_ids" select='../@player_id'/>
                          <h4><small>Players:</small></h4>
                          <ul>
                          <xsl:for-each select="../../../player">
                            <xsl:choose>
                              <xsl:when test="contains($player_ids, @id)">
                                <li><xsl:value-of select='./type'/>
                                    <ul>
                                      <li>Name: <xsl:value-of select='./name'/></li>
                                      <li>Number: <xsl:value-of select='./number'/></li>
                                      <li>Age: <xsl:value-of select='./age'/></li>
                                    </ul>
                                    <br/>
                                </li>
                              </xsl:when>
                            </xsl:choose>
                          </xsl:for-each>
                        </ul>
                        </div>
                    </tr>
                </xsl:for-each>
                <hr/>
            </xsl:for-each>
        </table>
    </xsl:template>


</xsl:stylesheet>