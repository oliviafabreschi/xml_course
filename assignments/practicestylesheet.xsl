<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Filnamn: stylesheet.xsl -->
    <!-- Författare: Olivia Fabreschi -->
    <!-- Datum: 31 Mars 2024 -->

    <xsl:template match="/lexikon">

        <html>
            <body>
                <h2>Lexikon</h2>
                <!-- grafiken -->
                <object data="grafik.svg" width="100" height="100"> </object>
                <br/>
                <!-- Loopa över engelska dictionary -->
                <h2>Engelska till Svenska</h2>
                <xsl:for-each select="document('english.xml')/dictionary">
                    <!-- Sortera i bokstavsordning -->
                    <xsl:for-each select="words/word">
                        <xsl:sort select="."/>
                        <!-- orden-->
                        <b><xsl:value-of select="."/></b>
                        <!-- Hitta ID numret av ordet -->
                        <xsl:variable name="currentID" select="@ID"/>
                        <!-- Hitta orden med samma ID i andra dictionary  -->
                        <xsl:variable name="swedishWord" select="document('swedish.xml')/dictionary/words/word[@ID = $currentID]"/>
                        <!-- skriv ut det svenska ordet -->
                        <span>&#xA0;&#xA0;&#xA0;</span>
                        <xsl:value-of select="$swedishWord"/>

                        <br/>
                    </xsl:for-each>
                </xsl:for-each>

                <br/>
                <!-- Loopa över svenska dictionary -->
                <h2>Svenska till Engelska</h2>
                <xsl:for-each select="document('swedish.xml')/dictionary">
                    <!-- Sortera i bokstavsordning -->
                    <xsl:for-each select="words/word">
                        <xsl:sort select="."/>
                        <!-- orden-->
                        <b><xsl:value-of select="."/></b>
                        <!-- Hitta ID numret av ordet -->
                        <xsl:variable name="currentID" select="@ID"/>
                        <!-- Hitta orden med samma ID i andra dictionary  -->
                        <xsl:variable name="englishWord" select="document('english.xml')/dictionary/words/word[@ID = $currentID]"/>
                        <!-- skriv ut det engelska ordet -->
                        <span>&#xA0;&#xA0;&#xA0;</span>
                        <xsl:value-of select="$englishWord"/>

                        <br/>
                    </xsl:for-each>
                </xsl:for-each>

                <table>
                    <h2>Svenska till Engelska</h2>
                    <tr style="padding: 10px">
                        <th bgcolor="pink">Engelska</th>
                        <th bgcolor="pink">Svenska</th>
                    </tr>
                    <tr>
                        <td style="padding: 10px">
                            <xsl:for-each select="document('english.xml')/dictionary/words/word">
                                <xsl:sort select="."/>
                                <!-- orden-->
                                <b><xsl:value-of select="."/></b>
                                <br/>
                            </xsl:for-each>
                        </td>

                        <td style="padding: 10px">

                            <xsl:for-each select="document('english.xml')/dictionary/words/word">
                                <xsl:sort select="."/>
                                <!-- Hitta orden med samma ID i andra dictionary  -->
                                <xsl:variable name="currentID" select="@ID"/>
                                <xsl:variable name="swedishWord" select="document('swedish.xml')/dictionary/words/word[@ID = $currentID]"/>
                                <!-- skriv ut det engelska ordet -->
                                <xsl:value-of select="$swedishWord"/>
                                <br/>
                            </xsl:for-each>

                        </td>
                    </tr>


                </table>

                <table>
                    <h2>Svenska till Engelska</h2>
                    <tr style="padding: 10px">
                        <th bgcolor="pink" >Svenska</th>
                        <th bgcolor="pink">Engelska</th>
                    </tr>
                    <tr>
                        <td style="padding: 10px">
                            <xsl:for-each select="document('swedish.xml')/dictionary/words/word">
                                <xsl:sort select="."/>
                                <!-- orden-->
                                <b><xsl:value-of select="."/></b>
                                <br/>
                            </xsl:for-each>
                        </td>

                        <td style="padding: 10px">

                            <xsl:for-each select="document('swedish.xml')/dictionary/words/word">
                                <xsl:sort select="."/>
                                <!-- Hitta orden med samma ID i andra dictionary  -->
                                <xsl:variable name="currentID" select="@ID"/>
                                <xsl:variable name="englishWord" select="document('english.xml')/dictionary/words/word[@ID = $currentID]"/>
                                <!-- skriv ut det engelska ordet -->
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