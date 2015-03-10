<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!-- TEMPLATE SEMESTRE -->

	<xsl:template name="semestre">
		<div class="cadre">
			<b>
				<u>
					<xsl:value-of select="nom_sem" />
				</u>
			</b><br/><br/>
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
								&#160;
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