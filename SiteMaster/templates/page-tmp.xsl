<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<!-- TEMPLATE HEAD -->
	<xsl:template name="head">
		<xsl:param name="title" />
		<head>
			<title>
				<xsl:value-of select="$title" />
			</title>
			<link rel="stylesheet" type="text/css" href="../style.css" />
		</head>
	</xsl:template>

	<!-- TEMPLATE MENU PRINCIPAL -->
	<xsl:template name="menu">
		<div class="leftFrame menu">
			<b>Menu</b>
			<a href="../documentation.html" class="menu1">Documentation</a>
			<a href="intervenants.html" class="menu2">Intervenants</a>
			<a href="unites.html" class="menu1">Unités</a>
			<a href="masters.html" class="menu2">Masters</a>
			<a href="xq.html" class="menu1">Question XQuery</a>
			<a href="../dom.txt" class="menu2">Question Java arbre DOM</a>
			<a href="ue3crluminy.html" class="menu1">UEs à 3 crédits sur Luminy</a>
			<a href="interluminy.html" class="menu2">Enseignants de Luminy</a>
			
		</div>
	</xsl:template>


	<!-- TEMPLATE MENU AUTRES PAGES -->
	<xsl:template name="header">
		<xsl:param name="title" />
		<p class="new">
			<img src="http://www.latp.univ-mrs.fr/~richard/mi3s/logo-sciences.png"
				alt="Logo" class="title" />
			<xsl:value-of select="$title" />
		</p>
		<div class="leftFrame menu">
			<b>Menu</b>
			<a href="index.html" class="menu1">Accueil</a>
			<a href="intervenants.html" class="menu2">Intervenants</a>
			<a href="unites.html" class="menu1">Unités</a>
			<a href="masters.html" class="menu2">Masters</a>
		</div>
	</xsl:template>

</xsl:stylesheet>