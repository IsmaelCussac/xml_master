<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:import href="utils-tmp.xsl" />

	<!-- TEMPLATE INTERVENANT -->

	<xsl:template name="intervenant">
		<div class="cadre">
			<h4>
				<xsl:value-of select="nom_inter" />
				&#160;
				<xsl:value-of select="prenom_inter" />
			</h4>

			<xsl:if test="mail[ (normalize-space(.) != '') ]">
				<p>
					<b>Mail:&#160;</b>
					<xsl:call-template name="mail">
						<xsl:with-param name="email" select="./mail" />
					</xsl:call-template>
				</p>
			</xsl:if>
			<xsl:if test="site[ (normalize-space(.) != '') ]">
				<p>
					<b>Site:&#160;</b>
					<xsl:call-template name="site">
						<xsl:with-param name="site" select="./site" />
					</xsl:call-template>
				</p>
			</xsl:if>
			<xsl:if test="//ue[ref_intervenant = current()/@id]">
				<b>UEs enseignées</b>
				<ul>
					<xsl:for-each select="key('ues','all')[ref_intervenant = current()/@id]">
						<li>
							<a href="ue-{@id}.html">
								<xsl:value-of select="nom_ue" />
							</a>
						</li>
					</xsl:for-each>
				</ul>
			</xsl:if>
			<xsl:if test="key('parcours','all')[responsable/@ref = current()/@id]">
				<b>Responsable des parcours</b>
				<ul>
					<xsl:for-each select="key('parcours','all')[responsable/@ref = current()/@id]">
						<li>
							<a href="parcours-{@id}.html">
								<xsl:value-of select="nom_parc" />
							</a>
						</li>
					</xsl:for-each>
				</ul>
			</xsl:if>
		</div>
		<br />
		<br />
		<br />
		<br />
	</xsl:template>

</xsl:stylesheet>