<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!-- TEMPLATE UE -->

	<xsl:import href="utils-tmp.xsl" />

	<xsl:template name="ue">

		<h3>
			<xsl:value-of select="nom_ue" />
		</h3>
		<p>
			<b>Crédits:</b>
			&#160;
			<xsl:value-of select="nb_credits" />
		</p>

		<xsl:if test="ref_intervenant">
			<b>Intervenants:</b>
			<ul>
				<xsl:for-each select="ref_intervenant">
					<xsl:variable name="inter" select="//intervenant[@id = current()]" />
					<li>
						<a href="intervenant-{current()}.html">
							<xsl:value-of select="$inter/nom_inter" />
						</a>
					</li>
				</xsl:for-each>
			</ul>
		</xsl:if>

		<b>Description:</b>
		<div class="cadre">
			<xsl:copy-of select="resume/*" />
		</div>
		<xsl:if test="plan[ (normalize-space(.) != '') ]">
			<br />
			<p>
				<b>Plan:</b>
				&#160;
				<xsl:value-of select="plan" />
			</p>
		</xsl:if>

		<b>Enseigné dans les parcours suivants:</b>
		<ul>
			<xsl:for-each select="//ref_ue[. = current()/@id]">
				<li>
					<a href="parcours-{ancestor::parcours/@id}.html">
						<xsl:value-of select="ancestor::parcours/nom_parc" />
					</a>
				</li>
			</xsl:for-each>
		</ul>


	</xsl:template>

</xsl:stylesheet>