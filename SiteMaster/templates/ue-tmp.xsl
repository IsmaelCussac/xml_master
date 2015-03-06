<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!-- TEMPLATE UE -->

	<xsl:import href="utils-tmp.xsl" />

	<xsl:template name="ue">

		<h3>
			<xsl:value-of select="nom_ue" />
		</h3>

		<b>Crédits:</b>
		&#160;
		<xsl:value-of select="nb_credits" />
		<br />
		<br />

		<xsl:if test="ref_intervenant">
			<b>Intervenants</b>
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

		<b>Description</b>
		<div class="cadre">
			<xsl:choose>

				<xsl:when test="resume[ (normalize-space(.) != '') ]">
					<xsl:copy-of select="resume/*" />
				</xsl:when>
				<xsl:otherwise>
					Aucune description disponible pour le moment.
				</xsl:otherwise>
			</xsl:choose>

		</div>

		<xsl:if
			test="vol_cm[ (normalize-space(.) != '') ]|vol_td[ (normalize-space(.) != '') ]|vol_tp[ (normalize-space(.) != '') ]|vol_total[ (normalize-space(.) != '') ]">
			<br />
			<b>Organisation de l'UE</b>
			<table summary="Valeur en heure">
				<caption>Valeurs en heure</caption>
				<tr>
					<xsl:if test="vol_cm[ (normalize-space(.) != '') ]">
						<td>CM</td>
					</xsl:if>
					<xsl:if test="vol_td[ (normalize-space(.) != '') ]">
						<td>TD</td>
					</xsl:if>
					<xsl:if test="vol_tp[ (normalize-space(.) != '') ]">
						<td>TP</td>
					</xsl:if>
					<xsl:if test="vol_total[ (normalize-space(.) != '') ]">
						<td>Total</td>
					</xsl:if>
				</tr>
				<tr>
					<xsl:if test="vol_cm[ (normalize-space(.) != '') ]">
						<td>
							<xsl:value-of select="vol_cm" />
						</td>
					</xsl:if>
					<xsl:if test="vol_td[ (normalize-space(.) != '') ]">
						<td>
							<xsl:value-of select="vol_td" />
						</td>
					</xsl:if>
					<xsl:if test="vol_tp[ (normalize-space(.) != '') ]">
						<td>
							<xsl:value-of select="vol_tp" />
						</td>
					</xsl:if>
					<xsl:if test="vol_total[ (normalize-space(.) != '') ]">
						<td>
							<xsl:value-of select="vol_total" />
						</td>
					</xsl:if>
				</tr>
			</table>
			<xsl:value-of select="plan" />
		</xsl:if>

		<b>Enseigné dans les parcours suivants</b>
		<ul>
			<xsl:for-each select="//ref_ue[. = current()/@id]">
				<li>
					<a href="parcours-{ancestor::parcours/@id}.html">
						<xsl:value-of select="ancestor::parcours/nom_parc" />
					</a>
				</li>
			</xsl:for-each>
		</ul>
		<br />
		<br />
		<br />
		<br />

	</xsl:template>

</xsl:stylesheet>