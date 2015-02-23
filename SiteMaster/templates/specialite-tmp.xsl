<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!-- TEMPLATE SPECIALITE -->
	
	<xsl:import href="utils-tmp.xsl"/>
	
	<xsl:template name="specialite">
		<h3>
			<xsl:value-of select="nom_spe" />
		</h3>

		<div class="cadre">
			<u>Responsables du parcours:</u>
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
		</div>

		<div class="cadre">
			<u>Parcours:</u>
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
		</div>


		<div class="cadre">
			<u>Description du parcours:</u>&#160;
			<xsl:call-template name="text_zone">
				<xsl:with-param name="text" select="description" />
			</xsl:call-template>

		</div>
		<div class="cadre">
			<u>Débouchés:</u>&#160;
			<xsl:call-template name="text_zone">
				<xsl:with-param name="text" select="debouche" />
			</xsl:call-template>
		</div>

		<xsl:if test="finalite[ (normalize-space(.) != '') ]">
			<div class="cadre">
				<u>Finalité:</u>&#160;
				<xsl:if test="finalite='R'"> Recherche</xsl:if>
				<xsl:if test="finalite='P'"> Professionnelle</xsl:if>
			</div>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>