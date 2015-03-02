<?xml version="1.0" encoding="UTF-8"?>
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


</xsl:stylesheet>