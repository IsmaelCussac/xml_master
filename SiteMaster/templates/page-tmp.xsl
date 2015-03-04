<?xml version="1.0" encoding="UTF-8"?>
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
				<li>
					<a href="xq.html">Question XQuery</a>
				</li>
				<li>
					<a href="../dom.txt">Question Java arbre DOM</a>
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

</xsl:stylesheet>