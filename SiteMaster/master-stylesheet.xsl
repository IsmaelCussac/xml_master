<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:output method="xml" encoding="iso-8859-1" indent="yes"
		doctype-system="master-dtd.dtd" />

	<xsl:include href="templates/includes.xsl" />

	<xsl:template match="/">

		<!-- DOC INDEX -->
		<xsl:document href="www/index.html" method="xml"
			encoding="utf-8" indent="yes" doctype-public="//W3C//DTD XHTML 1.0 Strict//EN"
			doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
			<html xmlns="http://www.w3.org/1999/xhtml">
				<xsl:call-template name="head">
					<xsl:with-param name="title">
						Master Informatique - Luminy
					</xsl:with-param>
				</xsl:call-template>
				<body>
					<p class="new">Master Informatique - Luminy</p>
					<h3>Bienvenue sur la page du Master Informatique de Luminy</h3>
					<p>
						Vous y trouverez toutes les informations concernant les parcours
						ouverts dans l'université
						<br />
						ainsi qu'un détail des matières qu'il vous faudra suivre.
						<br />
						<br />
						<br />
						Bonne visite!!
					</p>

					<xsl:call-template name="menu" />
					<br />
					<br />
					<br />
					<br />
					<br />
					<br />
					<br />
					<br />
					<p>Cette page a été créée par Sarah BOUKRIS et Ismaël CUSSAC</p>
				</body>
			</html>
		</xsl:document>


		<!-- DOC LISTE INTERVENANTS -->
		<xsl:document href="www/intervenants.html" method="xml"
			encoding="utf-8" indent="yes" doctype-public="//W3C//DTD XHTML 1.0 Strict//EN"
			doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
			<html xmlns="http://www.w3.org/1999/xhtml">
				<xsl:call-template name="head">
					<xsl:with-param name="title">
						Master Informatique - Luminy
					</xsl:with-param>
				</xsl:call-template>
				<body>
					<xsl:call-template name="header">
						<xsl:with-param name="title">
							Master Informatique - Luminy
						</xsl:with-param>
					</xsl:call-template>
					<div class="cadre">
						<b>Liste des intervenants:</b>
						<ul>
							<xsl:for-each select="//intervenant">
								<xsl:sort select="nom_inter" />
								<li>
									<a href="intervenant-{@id}.html">
										<xsl:value-of select="nom_inter" />
									</a>
								</li>
							</xsl:for-each>
						</ul>
					</div>
				</body>
			</html>
		</xsl:document>

		<!-- TOUS DOC INTERVENANTS -->
		<xsl:for-each select="//intervenant">
			<xsl:document href="www/intervenant-{@id}.html" method="xml"
				encoding="utf-8" indent="yes" doctype-public="//W3C//DTD XHTML 1.0 Strict//EN"
				doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
				<html xmlns="http://www.w3.org/1999/xhtml">
					<xsl:call-template name="head">
						<xsl:with-param name="title">
							Master Informatique - Luminy
						</xsl:with-param>
					</xsl:call-template>
					<body>
						<xsl:call-template name="header">
							<xsl:with-param name="title">
								Master Informatique - Luminy
							</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="intervenant" />
					</body>
				</html>
			</xsl:document>
		</xsl:for-each>



		<!-- DOC LISTE UNITES -->
		<xsl:document href="www/unites.html" method="xml"
			encoding="utf-8" indent="yes" doctype-public="//W3C//DTD XHTML 1.0 Strict//EN"
			doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
			<html xmlns="http://www.w3.org/1999/xhtml">
				<xsl:call-template name="head">
					<xsl:with-param name="title">
						Master Informatique - Luminy
					</xsl:with-param>
				</xsl:call-template>
				<body>
					<xsl:call-template name="header">
						<xsl:with-param name="title">
							Master Informatique - Luminy
						</xsl:with-param>
					</xsl:call-template>
					<div class="cadre">
						<b>Liste des unités d'enseignement:</b>
						<ul>
							<xsl:for-each select="//ue">
								<xsl:sort select="nom_ue" />
								<li>
									<a href="ue-{@id}.html">
										<xsl:value-of select="nom_ue" />
									</a>
								</li>
							</xsl:for-each>
						</ul>
					</div>
				</body>
			</html>
		</xsl:document>

		<!-- TOUS DOC UEs -->
		<xsl:for-each select="//ue">
			<xsl:document href="www/ue-{@id}.html" method="xml"
				encoding="utf-8" indent="yes" doctype-public="//W3C//DTD XHTML 1.0 Strict//EN"
				doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
				<html xmlns="http://www.w3.org/1999/xhtml">
					<xsl:call-template name="head">
						<xsl:with-param name="title">
							Master Informatique - Luminy
						</xsl:with-param>
					</xsl:call-template>
					<body>
						<xsl:call-template name="header">
							<xsl:with-param name="title">
								Master Informatique - Luminy
							</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="ue" />
					</body>
				</html>
			</xsl:document>
		</xsl:for-each>


		<!-- DOC LISTE MASTERS -->
		<xsl:document href="www/masters.html" method="xml"
			encoding="utf-8" indent="yes" doctype-public="//W3C//DTD XHTML 1.0 Strict//EN"
			doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
			<html xmlns="http://www.w3.org/1999/xhtml">
				<xsl:call-template name="head">
					<xsl:with-param name="title">
						Master Informatique - Luminy
					</xsl:with-param>
				</xsl:call-template>
				<body>
					<xsl:call-template name="header">
						<xsl:with-param name="title">
							Master Informatique - Luminy
						</xsl:with-param>
					</xsl:call-template>
					<div class="cadre">
						<b>Liste des masters:</b>
						<ul>
							<xsl:for-each select="//specialite">
								<xsl:sort select="nom_spe" />
								<li>
									<a href="specialite-{@id}.html">
										<xsl:value-of select="nom_spe" />
									</a>
								</li>
							</xsl:for-each>
						</ul>
					</div>
				</body>
			</html>
		</xsl:document>

		<!-- TOUS DOC SPECIALITE -->
		<xsl:for-each select="//specialite">
			<xsl:document href="www/specialite-{@id}.html" method="xml"
				encoding="utf-8" indent="yes" doctype-public="//W3C//DTD XHTML 1.0 Strict//EN"
				doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
				<html xmlns="http://www.w3.org/1999/xhtml">
					<xsl:call-template name="head">
						<xsl:with-param name="title">
							Master Informatique - Luminy
						</xsl:with-param>
					</xsl:call-template>
					<body>
						<xsl:call-template name="header">
							<xsl:with-param name="title">
								Master Informatique - Luminy
							</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="specialite" />
					</body>
				</html>
			</xsl:document>
		</xsl:for-each>

		<!-- TOUS DOC PARCOURS -->
		<xsl:for-each select="//parcours">
			<xsl:document href="www/parcours-{@id}.html" method="xml"
				encoding="utf-8" indent="yes" doctype-public="//W3C//DTD XHTML 1.0 Strict//EN"
				doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
				<html xmlns="http://www.w3.org/1999/xhtml">
					<xsl:call-template name="head">
						<xsl:with-param name="title">
							Master Informatique - Luminy
						</xsl:with-param>
					</xsl:call-template>
					<body>
						<xsl:call-template name="header">
							<xsl:with-param name="title">
								Master Informatique - Luminy
							</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="parcours" />
					</body>
				</html>
			</xsl:document>
		</xsl:for-each>
	</xsl:template>

	<!-- ____FIN TEMPLATES DOC____ -->

</xsl:stylesheet>