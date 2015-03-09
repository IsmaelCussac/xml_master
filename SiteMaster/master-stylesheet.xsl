<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:output method="xml" encoding="utf-8" indent="yes"
		doctype-system="master-dtd.dtd" />

	<xsl:include href="templates/includes.xsl" />

	<!-- Key pas vraiment utiles -->
	<xsl:key use="'all'" name="enseignants" match="//intervenant" />
	<xsl:key use="'all'" name="ues" match="//ue" />
	<xsl:key use="'all'" name="specialites" match="//specialite" />
	<xsl:key use="'all'" name="parcours" match="//parcours" />

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
					<p class="new">
						<img src="http://www.latp.univ-mrs.fr/~richard/mi3s/logo-sciences.png"
							alt="Logo" class="title" />
						Master Informatique - Luminy
					</p>
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
					<div class="liste">
						<b>Liste des intervenants:</b>
						<xsl:call-template name="faire-une-liste">
							<xsl:with-param name="objets" select="key('enseignants','all')" />
							<xsl:with-param name="nom_fichier" select="'intervenant'" />
							<xsl:with-param name="nom_elem" select="'nom_inter'" />
						</xsl:call-template>
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
					<div class="liste">
						<b>Liste des unités d'enseignement:</b>
						<xsl:call-template name="faire-une-liste">
							<xsl:with-param name="objets" select="key('ues','all')" />
							<xsl:with-param name="nom_fichier" select="'ue'" />
							<xsl:with-param name="nom_elem" select="'nom_ue'" />
						</xsl:call-template>
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
					<div class="liste">
						<b>Liste des masters</b>
						<xsl:call-template name="faire-une-liste">
							<xsl:with-param name="objets" select="key('specialites','all')" />
							<xsl:with-param name="nom_fichier" select="'specialite'" />
							<xsl:with-param name="nom_elem" select="'nom_spe'" />
						</xsl:call-template>
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


		<!-- UEs DE 3 CREDITS DE LUMINY -->
		<xsl:document href="www/ue3crluminy.html" method="xml"
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
					<div class="liste">
						<b>Liste des UEs à 3 crédits qui se déroulent à Luminy</b>
						<xsl:call-template name="faire-une-liste">
							<xsl:with-param name="objets"
								select="//ue[nb_credits = '3'][@id = //ref_ue[./ancestor::parcours/lieu_parc[@site = 'Luminy']]]" />
							<xsl:with-param name="nom_fichier" select="'ue'" />
							<xsl:with-param name="nom_elem" select="'nom_ue'" />
						</xsl:call-template>
					</div>
				</body>
			</html>
		</xsl:document>


		<!-- ENSEIGNANTS DE LUMINY -->
		<xsl:document href="www/interluminy.html" method="xml"
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
					<div class="liste">
						<b>Liste des enseignants qui n'enseignent qu'à Luminy</b>
						<xsl:call-template name="faire-une-liste">
							<xsl:with-param name="objets"
								select="//intervenant[@id = //ue[@id = //ref_ue[./ancestor::parcours/lieu_parc[@site = 'Luminy']]]/ref_intervenant]" />
							<xsl:with-param name="nom_fichier" select="'intervenant'" />
							<xsl:with-param name="nom_elem" select="'nom_inter'" />
						</xsl:call-template>
					</div>
				</body>
			</html>
		</xsl:document>
	</xsl:template>

</xsl:stylesheet>