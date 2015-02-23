<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!-- TEMPLATE SEMESTRE -->

	<xsl:template name="semestre">
		<div class="cadre">
			<xsl:value-of select="nom_sem" />
			<div>
				<xsl:for-each select="bloc_ue">
					<b>
						<xsl:value-of select="nom_bloc_ue" />
					</b>
					<ul>
						<xsl:for-each select="ref_ue">
							<xsl:variable name="ue" select="//ue[@id = current()]" />
							<li>
								<a href="ue-{.}.html">
									<xsl:value-of select="$ue/nom_ue" />
								</a>
								(
								<xsl:value-of select="$ue/nb_credits" />
								crédits)
							</li>
						</xsl:for-each>
					</ul>

				</xsl:for-each>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>