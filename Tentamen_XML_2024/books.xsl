<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!-- Filnamn: books.xsl -->
    <!-- Författare: Olivia Fabreschi -->
    <!-- Datum: 31 maj 2024 -->

    <xsl:template match="/">
        <html>
            <body>
                <!-- tabell-->

                <h2>Books</h2>
                <table border="1">
                    <tr bgcolor="#ffcd32">
                        <th>Ordningsnr</th>
                        <th>Title</th>
                        <th>publish_date</th>
                        <th>price</th>

                    </tr>
                    <xsl:for-each select="catalog/book">
                        <!-- sorterarså billigast överst-->

                        <xsl:sort select="price" data-type="number" />

                        <!--Sortera böckerna i ordning så att den dyraste hamnar överst,
                     utgivningsåret är senare än 2005 samt har lägre id än 10.-->

                        <!--  <xsl:sort select="price" data-type="number" order= "descending"/>

                        <xsl:if test="publish_date &gt;  2005" >
                            <xsl:if test="@ID &gt; 10" >   -->

                                <tr>
                            <!-- skriver ut-->
                                <td><xsl:value-of select="position()"/></td>
                                <td><xsl:value-of select="author"/></td>
                                <td><xsl:value-of select="publish_date"/></td>
                                <td><xsl:value-of select="price"/></td>
                            </tr>

                        <!-- </xsl:if>
                        </xsl:if>  -->


                    </xsl:for-each>
                </table>


                <h2>Priserna</h2>

                <xsl:for-each select="catalog/book">
                    <!-- sorterarså billigast överst-->
                    <xsl:sort select="price" data-type="number"/>
                </xsl:for-each>

                <!-- sorterar för att få variabel för att sedan kunna hitta dyrast och billigastboken-->
                    <xsl:for-each select="catalog">
                        <xsl:sort select="price" data-type="number" />

                        <xsl:variable name="lowPrice" select="book[1]/price"/>
                        <xsl:variable name="highPrice" select="book[12]/price"/>


                    </xsl:for-each>



                <table border="1">
                    <tr bgcolor="#ffcd32">
                        <th>Lägsta pris</th>
                        <th>Högsta pris</th>
                        <th>medelpris</th>
                        <th>sammanlagda pris</th>
                    </tr>
                    <!-- räknar ut-->
                    <xsl:variable name="totalPrice" select="sum(catalog/book/price)"/>

                    <!-- skriver ut-->
                    <tr>
                        <!-- väljer första och sista boken ur listan som bör vara ordnad i pris-ordning,har inte lyckats fa till sorteringen helt-->
                        <td><xsl:value-of select="catalog/book[1]/price"/></td>
                        <td><xsl:value-of select="catalog/book[12]/price"/></td>
                        <!-- medelvärde-->
                        <td><xsl:value-of select="$totalPrice div count(catalog/book)"/></td>
                        <!-- skriver ut totalpriset-->
                        <td><xsl:value-of select="$totalPrice"/></td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>

