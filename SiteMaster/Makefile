XSLT = xsltproc
LINT = xmllint --noout

all: clean dtd xsd web tidy xq java

dtd: Site.xml Site.dtd
	$(LINT) --valid  Site.xml
	@echo "dtd valide"

xsd: Site.xml Site_dtd.xsd
	$(LINT) --schema  Site_dtd.xsd Site.xml
	@echo "xsd valide"

web: Site.xml Site.xsl
	$(XSLT) Site.xsl Site.xml
	@echo "Dossier www/ généré"

tidy:
	tidy -utf8 -im -asxhtml www/*.html

xq:

java:

clean:
	@rm -rf www/
	@rm *~

