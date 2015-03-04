
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!-- TEMPLATE PARCOURS -->

	<xsl:import href="utils-tmp.xsl" />
	<xsl:import href="semestre-tmp.xsl" />

	<xsl:template name="parcours">
		<h3>
			<xsl:value-of select="nom_parc" />
		</h3>
		<xsl:for-each select="semestre">
			<xsl:call-template name="semestre" />
		</xsl:for-each>

		<xsl:variable name="respons">
			<xsl:for-each select="current()/responsable/@ref">
				<li>
					<a href="intervenant-{current()}.html">
						<xsl:value-of select="//intervenant[@id=current()]/nom_inter" />
					</a>
				</li>
			</xsl:for-each>
		</xsl:variable>

		<xsl:if test="$respons != '' ">
			<br />
			<b>Responsables du parcours:</b>
			<ul>
				<xsl:copy-of select="$respons" />
			</ul>

		</xsl:if>

		<br />
		<b>Description du parcours:</b>
		<div class="cadre">
			<xsl:copy-of select="description/*" />

		</div>

		<xsl:variable name="inter">
			<xsl:for-each select="semestre/bloc_ue">
				<xsl:for-each select="current()/ref_ue">
					<xsl:for-each select="//ue[@id=current()]">
						<xsl:for-each select="current()/ref_intervenant">
							<li>
								<a href="intervenant-{current()}.html">
									<xsl:value-of select="//intervenant[@id=current()]/nom_inter" />
								</a>
							</li>
						</xsl:for-each>
					</xsl:for-each>
				</xsl:for-each>
			</xsl:for-each>
		</xsl:variable>
		<xsl:if test="$inter != '' ">
			<br />
			<b>Intervenants:</b>
			<ul>
				<xsl:copy-of select="$inter" />
			</ul>

		</xsl:if>

		<b>Lieu d'enseignement:</b>
		&#160;
		<xsl:apply-templates select="lieu_parc" />
		<br />
		<br />
		<br />
	</xsl:template>
</xsl:stylesheet>