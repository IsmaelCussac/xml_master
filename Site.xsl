<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:output method="html" encoding="iso-8859-1" indent="yes"
		doctype-system="Site.dtd" />

	<xsl:template match="/">

		<!-- DOC INDEX -->
		<xsl:document href="www/index.html" method="xml"
			encoding="utf-8">
			<html xmlns="http://www.w3.org/1999/xhtml">
				<xsl:call-template name="head">
					<xsl:with-param name="title">
						Master Informatique - Luminy
					</xsl:with-param>
				</xsl:call-template>
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
				<body>
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


		<!-- DOC INTERVENANTS -->
		<xsl:document href="www/intervenants.html" encoding="utf-8">
			<html xmlns="http://www.w3.org/1999/xhtml">
				<xsl:call-template name="head">
					<xsl:with-param name="title">
						Master Informatique - Luminy
					</xsl:with-param>
				</xsl:call-template>
				<body>
					<xsl:call-template name="header" />
					<fieldset>
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
					</fieldset>
				</body>
			</html>
		</xsl:document>

		<!-- DOC UNITES -->
		<xsl:document href="www/unites.html" encoding="utf-8">
			<html xmlns="http://www.w3.org/1999/xhtml">
				<xsl:call-template name="head">
					<xsl:with-param name="title">
						Master Informatique - Luminy
					</xsl:with-param>
				</xsl:call-template>
				<body>
					<xsl:call-template name="header" />
					<fieldset>
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
					</fieldset>
				</body>
			</html>
		</xsl:document>

		<!-- DOC MASTERS -->
		<xsl:document href="www/masters.html" encoding="utf-8">
			<html xmlns="http://www.w3.org/1999/xhtml">
				<xsl:call-template name="head">
					<xsl:with-param name="title">
						Master Informatique - Luminy
					</xsl:with-param>
				</xsl:call-template>
				<body>
					<xsl:call-template name="header" />
					<fieldset>
						<b>Liste des masters:</b>
						<p>
							<xsl:for-each select="//master">
								<xsl:sort select="nom_master" />
								<h1>
									<xsl:value-of select="nom_master" />
								</h1>
								<p>
									<xsl:for-each select="./specialite">
										<xsl:sort select="nom_spe" />
										<h2>
											<xsl:value-of select="nom_spe" />
										</h2>
										<ul>
											<xsl:for-each select="./parcours">
												<xsl:sort select="nom_parc" />
												<li>
													<a href="parcours-{@id}.html">
														<xsl:value-of select="nom_parc" />
													</a>
												</li>

											</xsl:for-each>
										</ul>
									</xsl:for-each>
								</p>
							</xsl:for-each>
						</p>
					</fieldset>
				</body>
			</html>
		</xsl:document>


		<!-- TOUS DOC INTERVENANTS -->
		<xsl:for-each select="//intervenant">
			<xsl:document href="www/intervenant-{@id}.html" method="xml"
				encoding="utf-8">
				<xsl:call-template name="head">
					<xsl:with-param name="title">
						Master Informatique - Luminy
					</xsl:with-param>
				</xsl:call-template>
				<body>
					<xsl:call-template name="header" />
					<xsl:call-template name="intervenant" />
				</body>
			</xsl:document>
		</xsl:for-each>


		<!-- TOUS DOC UEs -->
		<xsl:for-each select="//ue">
			<xsl:document href="www/ue-{@id}.html" method="xml"
				encoding="utf-8">
				<xsl:call-template name="head">
					<xsl:with-param name="title">
						Master Informatique - Luminy
					</xsl:with-param>
				</xsl:call-template>
				<body>
					<xsl:call-template name="header" />
					<xsl:call-template name="ue" />
				</body>
			</xsl:document>
		</xsl:for-each>

		<!-- TOUS DOC PARCOURS -->
		<xsl:for-each select="//parcours">
			<xsl:document href="www/parcours-{@id}.html" method="xml"
				encoding="utf-8">
				<xsl:call-template name="head">
					<xsl:with-param name="title">
						Master Informatique - Luminy
					</xsl:with-param>
				</xsl:call-template>
				<body>
					<xsl:call-template name="header" />
					<xsl:call-template name="parcours" />
				</body>
			</xsl:document>
		</xsl:for-each>

	</xsl:template>

	<!-- ____FIN TEMPLATES DOC____ -->

	<!-- TEMPLATE HEAD -->
	<xsl:template name="head">
		<xsl:param name="title"></xsl:param>
		<head>
			<h1-new>
				<xsl:value-of select="$title" />
			</h1-new>
			<link rel="stylesheet" href="../Site.css"
				type="test/css" />
		</head>
	</xsl:template>

	<!-- TEMPLATE MENU PRINCIPAL -->
	<xsl:template name="menu">
		<fieldset>
			<b>--- Menu ---</b>
			<ul>
				<li>
					<a href="intervenants.html">Intervenants</a>
				</li>
				<li>
					<a href="unites.html">Unités</a>
				</li>
				<li>
					<a href="masters.html">Masters</a>
				</li>
			</ul>
		</fieldset>
	</xsl:template>


	<!-- TEMPLATE MENU AUTRES PAGES -->
	<xsl:template name="header">
		<fieldset>
			<b>--- Menu ---</b>
			<ul>
				<li>
					<a href="index.html">Accueil</a>
				</li>
				<li>
					<a href="intervenants.html">Intervenants</a>
				</li>
				<li>
					<a href="unites.html">Unités</a>
				</li>
			</ul>
		</fieldset>
	</xsl:template>


	<!-- TEMPLATE INTERVENANT -->
	<xsl:template name="intervenant">
		<fieldset>
			<p>
				Intervenant:
				<b>
					<xsl:value-of select="nom_inter" />
				</b>
			</p>
			<p>
				Mail:
				<xsl:call-template name="mail" />
			</p>
			<p>
				Site:
				<xsl:call-template name="site" />
			</p>
			<p>
				UEs enseignées:
				<ul>
					<xsl:for-each select="//ue[ref_intervenant = current()/@id]">
						<li>
							<a href="ue-{@id}.html">
								<xsl:value-of select="nom_ue" />
							</a>
						</li>
					</xsl:for-each>
				</ul>
			</p>
			<xsl:if test="//parcours[responsable/@ref = current()/@id]">
				<p>
					Responsable des parcours:
					<ul>
						<xsl:for-each select="//parcours[responsable/@ref = current()/@id]">
							<li>
								<a href="parcours-{@id}.html">
									<xsl:value-of select="nom_parc" />
									de
									<b>
										<xsl:value-of select="../../nom_master" />
									</b>
								</a>
							</li>
						</xsl:for-each>
					</ul>
				</p>
			</xsl:if>
		</fieldset>
	</xsl:template>


	<!-- TEMPLATE UE -->
	<xsl:template name="ue">
		<p>
			<p>
				<b>
					<xsl:value-of select="nom_ue" />
				</b>
			</p>
			<p>
				<u>Crédits:</u>
				<xsl:value-of select="nb_credits" />
			</p>
			<p>
				<u>Intervenants:</u>
				<ul>
					<xsl:for-each select="ref_intervenant">
						<xsl:variable name="inter" select="//intervenant[@id = current()]"></xsl:variable>
						<li>
							<a href="intervenant-{current()}.html">
								<xsl:value-of select="$inter/nom_inter" />
							</a>
						</li>
					</xsl:for-each>
				</ul>
			</p>
			<p>
				<u>Description:</u>
				<ul>
					<xsl:apply-templates select="resume" />
				</ul>
			</p>
			<xsl:if test="plan[ (normalize-space(.) != '') ]">
				<p>
					<u>Plan:</u>
					<xsl:value-of select="plan" />
				</p>
			</xsl:if>
			<p>
				<u>Campus:</u>
				<xsl:value-of select="lieu_ue" />
			</p>
			<p>
				Enseigné dans les parcours suivants:
				<ul>
					<xsl:for-each select="//ref_ue[. = current()/@id]">
						<li>
							<a href="parcours-{@id}.html">
								<xsl:value-of select="ancestor::parcours/nom_parc" />
								de
								<b>
									<xsl:value-of select="ancestor::master/nom_master" />
								</b>
							</a>
						</li>
					</xsl:for-each>
				</ul>
			</p>
		</p>
	</xsl:template>


	<!-- TEMPLATE LISTE -->
	<xsl:template match="li">
		<li>
			<xsl:value-of select="." />
		</li>
	</xsl:template>

	<!-- TEMPLATE MAIL -->
	<xsl:template name="mail">
		<a href="mailto:{./mail}">
			<xsl:value-of select="./mail" />
		</a>
	</xsl:template>

	<!-- TEMPLATE SITE -->
	<xsl:template name="site">
		<a href="{./site}">
			<xsl:value-of select="./site" />
		</a>
	</xsl:template>


	<!-- TEMPLATE PARCOURS -->
	<xsl:template name="parcours">
		<h3>
			<xsl:value-of select="nom_parc" />
		</h3>
		<xsl:for-each select="semestre">
			<xsl:call-template name="semestre" />
		</xsl:for-each>

		<fieldset>
			Responsables du parcours:
			<xsl:for-each select="responsable">
				<xsl:variable name="respon"
					select="//intervenant[@id = current()/@ref]"></xsl:variable>
				<li>
					<a href="intervenant-{current()/@ref}.html">
						<xsl:value-of select="$respon/nom_inter" />
					</a>
				</li>
			</xsl:for-each>
		</fieldset>
		<fieldset>
			Description du parcours:
			<xsl:apply-templates select="description" />
		</fieldset>
		<fieldset>
			Débouchés:
			<xsl:apply-templates select="debouche" />
		</fieldset>
		<fieldset>
			Intervenants:
			<xsl:for-each select="ref_intervenant">
				<xsl:variable name="inter" select="//intervenant[@id = current()]"></xsl:variable>
				<li>
					<a href="intervenant-{.}.html">
						<xsl:value-of select="$inter/nom_inter" />
					</a>
				</li>
			</xsl:for-each>
		</fieldset>

		<xsl:if test="finalite[ (normalize-space(.) != '') ]">
			<fieldset>
				<u>Finalité:</u>
				<xsl:value-of select="finalite" />
			</fieldset>
		</xsl:if>
		<fieldset>
			Lieu d'enseignement:
			<xsl:apply-templates select="lieu_parc" />
		</fieldset>
	</xsl:template>


	<!-- TEMPLATE SEMESTRE -->
	<xsl:template name="semestre">
		<fieldset>
			<xsl:value-of select="nom_sem" />
		</fieldset>
		<xsl:for-each select="bloc_ue">
			<p>
				<b>
					<xsl:value-of select="nom_bloc_ue" />
				</b>
				<ul>
					<xsl:for-each select="ref_ue">
						<xsl:variable name="ue" select="//ue[@id = current()]"></xsl:variable>
						<li>
							<a href="ue-{.}.html">
								<xsl:value-of select="$ue/nom_ue" />
							</a>
							(
							<xsl:value-of select="$ue/nb_credits" />
							crédits)
						</li>
					</xsl:for-each>
				</ul>
			</p>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>


