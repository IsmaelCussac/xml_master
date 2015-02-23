
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
			<div class="cadre">
				<u>Responsables du parcours:</u>
				<ul>
					<xsl:copy-of select="$respons" />
				</ul>
			</div>
		</xsl:if>

		<div class="cadre">
			<u>Description du parcours:</u>
			<xsl:call-template name="text_zone">
				<xsl:with-param name="text" select="description" />
			</xsl:call-template>

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
			<div class="cadre">
				<u>Intervenants:</u>
				<ul>
					<xsl:copy-of select="$inter" />
				</ul>
			</div>
		</xsl:if>
		<div class="cadre">
			<u>Lieu d'enseignement:</u>
			<xsl:apply-templates select="lieu_parc" />
		</div>
	</xsl:template>
</xsl:stylesheet>