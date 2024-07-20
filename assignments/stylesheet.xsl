<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Filnamn: stylesheet.xsl -->
    <!-- Författare: Olivia Fabreschi -->
    <!-- Datum: 31 Mars 2024 -->

    <xsl:template match="/lexikon">

        <html>
            <body>

                <!-- grafiken och titel-->
                <object data="grafik.svg" width="100" height="100" style="padding: 10px"> </object>
                <h1 style="padding: 10px; color: purple;">Lexikon</h1>

                <!-- första tabellen med eng till svenska -->
                <br/><br/>
                <table style="padding-left : 10px">
                    <h3 style="padding-left: 10px; color: purple;">Engelska till Svenska</h3>

                        <tr>
                            <td style="font-size: 10pt;  padding-left : 10px">
                                <!-- loopa över alla ord i english dictionary -->
                                <xsl:for-each select="document('english.xml')/dictionary/words/word">
                                    <!-- sortera i bokstavsordning -->
                                    <xsl:sort select="."/>
                                    <!-- skriva ut orden-->
                                    <b><xsl:value-of select="."/></b>
                                    <br/>
                                </xsl:for-each>
                            </td>

                            <td style="font-size: 10pt; padding : 5px">
                                <xsl:for-each select="document('english.xml')/dictionary/words/word">
                                    <xsl:sort select="."/>
                                    <!-- Hitta orden med samma ID i andra dictionary  -->
                                    <xsl:variable name="currentID" select="@ID"/>
                                    <xsl:variable name="swedishWord" select="document('swedish.xml')/dictionary/words/word[@ID = $currentID]"/>
                                    <!-- skriv ut det svenska ordet -->
                                    <span>&#xA0;&#xA0;&#xA0;</span>
                                    <xsl:value-of select="$swedishWord"/>
                                    <br/>
                                 </xsl:for-each>

                            </td>
                        </tr>
            </table>


                <br/>
                <br/>

                <!-- andra tabellen med svenska till eng -->
                <table style="padding-left : 10px">
                    <h3 style="padding-left: 10px; color: purple">Svenska till Engelska</h3>
                    <tr>
                        <td style="font-size: 10pt;  padding-left : 10px">
                            <!-- loopa över alla ord i svenska dictionary-->
                            <xsl:for-each select="document('swedish.xml')/dictionary/words/word">
                                <xsl:sort select="."/>
                                <!-- orden-->
                                <b><xsl:value-of select="."/></b>
                                <br/>
                            </xsl:for-each>
                        </td>

                        <td style="font-size: 10pt;">

                            <xsl:for-each select="document('swedish.xml')/dictionary/words/word">
                                <xsl:sort select="."/>
                                <!-- Hitta orden med samma ID i andra dictionary  -->
                                <xsl:variable name="currentID" select="@ID"/>
                                <xsl:variable name="englishWord" select="document('english.xml')/dictionary/words/word[@ID = $currentID]"/>
                                <!-- skriv ut det engelska ordet -->
                                <span>&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;&#xA0;</span>
                                <xsl:value-of select="$englishWord"/>
                                <br/>
                            </xsl:for-each>

                        </td>
                    </tr>

                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>