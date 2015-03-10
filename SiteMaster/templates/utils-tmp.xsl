<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!-- TEMPLATE MAIL -->
	<xsl:template name="mail">
		<xsl:param name="email" />
		<a href="mailto:{$email}">
			<xsl:value-of select="$email" />
		</a>
	</xsl:template>

	<!-- TEMPLATE SITE -->
	<xsl:template name="site">
		<xsl:param name="site" />
		<a href="{$site}">
			<xsl:value-of select="$site" />
		</a>
	</xsl:template>

	<!-- LISTE -->
	<xsl:template name="faire-une-liste">
		<xsl:param name="objets" />
		<xsl:param name="nom_fichier" />
		<xsl:param name="nom_elem" />
		<ul>
			<xsl:for-each select="$objets">
				<xsl:sort select="current()/*[1]" />
				<li>
					<a href="{$nom_fichier}-{current()/@id}.html">
						<xsl:value-of select="current()/*[name()=$nom_elem]" />
					</a>
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>

</xsl:stylesheet>