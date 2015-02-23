XSLT = xsltproc
LINT = xmllint --noout

all: clean gen dtd web tidy 

gen: donnees-to-xml.xsl donnees-master.xml
	$(XSLT) donnees-to-xml.xsl donnees-master.xml
	@echo "Fichier de donnée xml construit"
	
dtd: master-gen.xml master-dtd.dtd
	$(LINT) --valid  master-gen.xml
	@echo "dtd valide"

xsd: master-gen.xml master-schema.xsd
	$(LINT) --schema  master-schema.xsd master-gen.xml
	@echo "xsd valide"

web: master-gen.xml master-stylesheet.xsl
	$(XSLT) master-stylesheet.xsl master-gen.xml
	@echo "Dossier www/ généré"

tidy:
	tidy -utf8 -imqe -asxhtml www/*.html

xq:

java:

clean:
	@rm -rf master-gen.xml
	@rm -rf www/


