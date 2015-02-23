<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!-- TEMPLATE ZONE DE TEXTE -->
	<xsl:template name="text_zone">
		<xsl:param name="text" />
		<xsl:choose>
			<xsl:when test="$text[li]">
				<ul>
					<xsl:apply-templates select="$text" />
				</ul>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="$text" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>

	<!-- TEMPLATE LISTE -->

	<xsl:template match="ul">
		<ul>
			<xsl:for-each select="li">
				<xsl:call-template name="li" select="." />
			</xsl:for-each>
		</ul>
	</xsl:template>

	<xsl:template match="ol">
		<ol>
			<xsl:for-each select="li">
				<xsl:call-template name="li" select="." />
			</xsl:for-each>
		</ol>
	</xsl:template>

	<xsl:template name="li">
		<li>
			<xsl:call-template name="text_zone">
				<xsl:with-param name="text" select="." />
			</xsl:call-template>
		</li>
	</xsl:template>

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


</xsl:stylesheet>