XSLT = xsltproc
LINT = xmllint --noout


all: clean gen dtd xsd web xq tidy java


gen: donnees-to-xml.xsl donnees-master.xml
	@echo "\nConstruction du fichier de données XML"
	$(XSLT) donnees-to-xml.xsl donnees-master.xml
	
	
dtd: master-gen.xml master-dtd.dtd
	@echo "\nValidation de la DTD"
	$(LINT) --valid  master-gen.xml


xsd: master-gen.xml master-schema.xsd
	@echo "\nValidation du schema"
	$(LINT) --schema  master-schema.xsd master-gen.xml
	

web: master-gen.xml master-stylesheet.xsl
	@echo "\nGénération du dossier www/"
	$(XSLT) master-stylesheet.xsl master-gen.xml
	
	
tidy:
	@echo "\nValidation des fichiers www./*.html"
	tidy -ascii -imqe -asxhtml www/*.html
	@echo "\nValidation de la documentation"
	tidy -ascii -imqe -asxhtml documentation.html


xq:
	@echo "\nCréation de la requête XQuery"
	java -cp Outils/saxon9he.jar net.sf.saxon.Query !indent=yes xq.txt > www/xq.html


java:
	@echo "\nCréation du fichier DOM"
	javac CreateDom.java
	java CreateDom > dom.txt
	@echo "\n"


clean:
	@echo "\nSuppression"
	rm -rf master-gen.xml
	rm -rf www/
	rm -rf dom.txt
	rm -rf *.class


