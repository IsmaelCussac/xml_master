<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:output method="html" encoding="iso-8859-1" indent="yes"
		doctype-system="Site.dtd" />

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


		<!-- DOC INTERVENANTS -->
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

		<!-- DOC UNITES -->
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

		<!-- DOC MASTERS -->
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

						<xsl:for-each select="//master">
							<xsl:sort select="nom_master" />
							<h1>
								<xsl:value-of select="nom_master" />
							</h1>
							<ul>
								<xsl:for-each select="./specialite">
									<xsl:sort select="nom_spe" />
									<li>
										<a href="specialite-{@id}.html">
											<xsl:value-of select="nom_spe" />
										</a>
									</li>
								</xsl:for-each>
							</ul>

						</xsl:for-each>

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

	<!-- TEMPLATE HEAD -->
	<xsl:template name="head">
		<xsl:param name="title" />
		<head>
			<title>
				<xsl:value-of select="$title" />
			</title>
			<link rel="stylesheet" href="../Site.css" type="test/css" />
		</head>
	</xsl:template>

	<!-- TEMPLATE MENU PRINCIPAL -->
	<xsl:template name="menu">
		<div class="cadre">
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
		</div>
	</xsl:template>


	<!-- TEMPLATE MENU AUTRES PAGES -->
	<xsl:template name="header">
		<xsl:param name="title" />
		<p class="new">
			<xsl:value-of select="$title" />
		</p>
		<div class="cadre">
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
		</div>
	</xsl:template>


	<!-- TEMPLATE ZONE DE TEXTE -->
	<xsl:template name="text_zone">
		<xsl:param name="text"></xsl:param>
		<xsl:choose>
			<xsl:when test="$text[li]">
				<ul>
					<xsl:apply-templates select="$text" />
				</ul>
			</xsl:when>
			<xsl:otherwise>
				<xsl:apply-templates select="$text" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>


	<!-- TEMPLATE INTERVENANT -->
	<xsl:template name="intervenant">
		<div class="cadre">
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

			<xsl:if test="//parcours[responsable/@ref = current()/@id]">
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
			</xsl:if>
		</div>
	</xsl:template>


	<!-- TEMPLATE UE -->
	<xsl:template name="ue">
		<p>
			<b>
				<xsl:value-of select="nom_ue" />
			</b>
		</p>
		<p>
			<u>Crédits:</u>
			<xsl:value-of select="nb_credits" />
		</p>

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


		<u>Description:</u>
		<xsl:call-template name="text_zone">
			<xsl:with-param name="text" select="resume" />
		</xsl:call-template>
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

		Enseigné dans les parcours suivants:
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


	<!-- TEMPLATE LISTE -->

	<xsl:template match="ul">
		<ul>
			<xsl:for-each select="li">
				<xsl:call-template name="li" select="." />
			</xsl:for-each>
		</ul>
	</xsl:template>

	<xsl:template match="ol">
		<ol>
			<xsl:for-each select="li">
				<xsl:call-template name="li" select="." />
			</xsl:for-each>
		</ol>
	</xsl:template>

	<xsl:template name="li">
		<li>
			<xsl:call-template name="text_zone">
				<xsl:with-param name="text" select="." />
			</xsl:call-template>
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

		<div class="cadre">
			<u>Responsables du parcours:</u>
			<ul>
				<xsl:for-each select="responsable">
					<xsl:variable name="respon"
						select="//intervenant[@id = current()/@ref]"></xsl:variable>
					<li>
						<a href="intervenant-{current()/@ref}.html">
							<xsl:value-of select="$respon/nom_inter" />
						</a>
					</li>
				</xsl:for-each>
			</ul>
		</div>
		<div class="cadre">
			<u>Description du parcours:</u>
			<xsl:call-template name="text_zone">
				<xsl:with-param name="text" select="description" />
			</xsl:call-template>

		</div>

		<div class="cadre">
			<u>Intervenants:</u>
			<ul>
				<xsl:for-each select="ref_intervenant">
					<xsl:variable name="inter" select="//intervenant[@id = current()]"></xsl:variable>
					<li>
						<a href="intervenant-{.}.html">
							<xsl:value-of select="$inter/nom_inter" />
						</a>
					</li>
				</xsl:for-each>
			</ul>
		</div>

		<xsl:if test="finalite[ (normalize-space(.) != '') ]">
			<div class="cadre">
				<u>Finalité:</u>
				<xsl:value-of select="finalite" />
			</div>
		</xsl:if>
		<div class="cadre">
			<u>Lieu d'enseignement:</u>
			<xsl:apply-templates select="lieu_parc" />
		</div>
	</xsl:template>


	<!-- TEMPLATE SPECIALITE -->
	<xsl:template name="specialite">
		<h3>
			<xsl:value-of select="nom_spe" />
		</h3>

		<div class="cadre">
			<u>Responsables du parcours:</u>
			<ul>
				<xsl:for-each select="responsable">
					<xsl:variable name="respon"
						select="//intervenant[@id = current()/@ref]"/>
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
					<xsl:variable name="parc"
						select="//parcours[@id = current()]"/>
					<li>
						<a href="parcours-{current()}.html">
							<xsl:value-of select="$parc/nom_parc" />
						</a>
					</li>
				</xsl:for-each>
			</ul>
		</div>
		
		
		<div class="cadre">
			<u>Description du parcours:</u>
			<xsl:call-template name="text_zone">
				<xsl:with-param name="text" select="description" />
			</xsl:call-template>

		</div>
		<div class="cadre">
			<u>Débouchés:</u>
			<xsl:call-template name="text_zone">
				<xsl:with-param name="text" select="debouche" />
			</xsl:call-template>
		</div>

		<xsl:if test="finalite[ (normalize-space(.) != '') ]">
			<div class="cadre">
				<u>Finalité:</u>
				<xsl:value-of select="finalite" />
			</div>
		</xsl:if>
		<div class="cadre">
			<u>Lieu d'enseignement:</u>
			<xsl:apply-templates select="lieu_parc" />
		</div>
	</xsl:template>



	<!-- TEMPLATE SEMESTRE -->
	<xsl:template name="semestre">
		<div class="cadre">
			<xsl:value-of select="nom_sem" />
			<div>
				<xsl:for-each select="bloc_ue">
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

				</xsl:for-each>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>


