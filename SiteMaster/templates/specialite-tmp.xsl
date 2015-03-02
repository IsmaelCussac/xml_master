<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!-- TEMPLATE SPECIALITE -->

	<xsl:import href="utils-tmp.xsl" />

	<xsl:template name="specialite">
		<h3>
			<xsl:value-of select="nom_spe" />
		</h3>


		<b>Responsables de la spécialité:</b>
		<ul>
			<xsl:for-each select="responsable">
				<xsl:variable name="respon"
					select="//intervenant[@id = current()/@ref]" />
				<li>
					<a href="intervenant-{current()/@ref}.html">
						<xsl:value-of select="$respon/nom_inter" />
					</a>
				</li>
			</xsl:for-each>
		</ul>



		<b>Parcours:</b>
		<ul>
			<xsl:for-each select="ref_parcours">
				<xsl:variable name="parc" select="//parcours[@id = current()]" />
				<li>
					<a href="parcours-{current()}.html">
						<xsl:value-of select="$parc/nom_parc" />
					</a>
				</li>
			</xsl:for-each>
		</ul>



		<div class="cadre">
			<b>Description de la spécialité:</b>
			&#160;
			<xsl:copy-of select="description/*" />

		</div>
		<div class="cadre">
			<b>Débouchés:</b>
			&#160;
			<xsl:copy-of select="debouche/*" />
		</div>

		<xsl:if test="finalite[ (normalize-space(.) != '') ]">

			<b>Finalité:</b>
			&#160;
			<xsl:if test="finalite='R'">
				Recherche
			</xsl:if>
			<xsl:if test="finalite='P'">
				Professionnelle
			</xsl:if>

		</xsl:if>
	</xsl:template>
</xsl:stylesheet>