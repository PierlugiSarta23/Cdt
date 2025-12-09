<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:tei="http://www.tei-c.org/ns/1.0">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html lang="it">
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title>La Rassegna Settimanale - Edizione Digitale</title>
                <link rel="stylesheet" type="text/css" href="stile.css"/>
                <script src="https://code.jquery.com/jquery-3.7.1.slim.js" integrity="sha256-UgvvN8vBkgO0luPSUl2s8TIlOSYRoGFAX4jlCIm9Adc=" crossorigin="anonymous"></script>
                <script src="script.js" defer="defer"></script>
            </head>
            <body>
                <header>
                    <h1>
                        <xsl:value-of select="//tei:title"/>
                    </h1>
                    <p>Codifica TEI realizzata da: <xsl:value-of select="//tei:name[@xml:id='PS']"/>
                    </p>
                </header>
                <main>
                    <section class="metadata">
                        <div class="section">
                            <h2>Note</h2>
                            <xsl:for-each select="//tei:notesStmt/tei:note">
                                <p>
                                    <xsl:value-of select="."/>
                                </p>
                            </xsl:for-each>
                        </div>



                        <div class="section">
                            <h2>Fonte</h2>
                            <div class="subsection">
                                <p>
                                    <span class="label">Lingua:</span>
                                    <xsl:value-of select="//tei:monogr/tei:textLang"/>
                                </p>
                                <p>
                                    <span class="label">Fondata da:</span>
                                    <xsl:value-of select="//tei:monogr/tei:respStmt/tei:name[1]"/>
,                                    <xsl:value-of select="//tei:monogr/tei:respStmt/tei:name[2]"/>
                                </p>
                                <p>
                                    <span class="label">Luogo di pubblicazione:</span>
                                    <xsl:value-of select="//tei:monogr/tei:imprint/tei:pubPlace"/>
                                </p>
                                <p>
                                    <span class="label">Editore:</span>
                                    <xsl:value-of select="//tei:monogr/tei:imprint/tei:publisher"/>
                                </p>
                                <p>
                                    <span class="label">Data:</span>
                                    <xsl:value-of select="//tei:monogr/tei:imprint/tei:date"/>
                                </p>
                                <p>
                                    <span class="label">Volume:</span>
                                    <xsl:value-of select="//tei:monogr/tei:biblScope[@unit='volume']"/>
                                </p>
                                <p>
                                    <span class="label">Fascicolo:</span>
                                    <xsl:value-of select="//tei:monogr/tei:biblScope[@unit='article']"/>
                                </p>
                                <p>
                                    <span class="label">Pagine:</span>
                                    <xsl:value-of select="//tei:monogr/tei:biblScope[@unit='page']"/>
                                </p>
                            </div>
                        </div>

                        <div class="section">
                            <h2>Codifica</h2>
                            <p>
                                <xsl:value-of select="//tei:encodingDesc/tei:projectDesc/tei:p"/>
                            </p>
                        </div>
                        <div id="phenomenon-buttons">
                            <button class="phenomenon-btn legend-item person" id="persone">Persone</button>
                            <button class="phenomenon-btn legend-item place" id="luoghi">Luoghi</button>
                            <button class="phenomenon-btn legend-item role" id="ruoli">Ruoli</button>
                            <button class="phenomenon-btn legend-item organization" id="organizzazione">Organizzazioni</button>
                            <button class="phenomenon-btn legend-item date" id="date">Date</button>
                        </div>
                    </section>
                </main>
                <main>
                    <div class="columns">
                        <div class="column facsimile-column">
                            <h2>Facsimile</h2>
                            <xsl:apply-templates select="//tei:facsimile/tei:surface"/>
                        </div>
                        <div class="column transcription-column">
                            <h2>Trascrizione</h2>
                            <xsl:apply-templates select="//tei:div[@type='article']"/>
                        </div>
                    </div>
                </main>
                <footer>
                    <p>
                        <xsl:value-of select="//tei:publisher"/>
                    </p>
                </footer>
            </body>
        </html>
    </xsl:template>




    <xsl:template match="tei:lb">
        <br />
    </xsl:template>

    <xsl:template match="tei:lb[@break='no']">

    </xsl:template>

    <xsl:template match="tei:surface">
        <xsl:element name="img">
            <xsl:attribute name="src">immagini/<xsl:value-of select="current()/tei:graphic/@url" />
            </xsl:attribute>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:persName">
        <span class="persone">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:placeName">
        <span class="luoghi">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:orgName">
        <span class="organizzazione">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:roleName">
        <span class="ruoli">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:date">
        <span class="date">
            <xsl:apply-templates/>
        </span>
    </xsl:template>



</xsl:stylesheet>