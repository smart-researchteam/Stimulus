#-----------------------------------------------------
# Makefile to bake the outputs
EXT = adoc
ASCIIDOCTOR=asciidoctor -a icons=font -a data-uri
HIGHLIGHT=pygments
DZSLIDES=../asciidoctor-backends/slim/dzslides
#-----------------------------------------------------

default: stimulus.html

all: QuickStartGuide.html QuickStartGuide.pdf QuickStartGuide.slides.html \
LGS.html LGS.pdf LGS.slides.html \
AutomaticDoor.html AutomaticDoor.pdf AutomaticDoor.slides.html \
Porte.html Porte.pdf Porte.slides.html

#-----------------------------------------------------
QuickStartGuide.html: main.adoc QuickStartGuide/*.adoc
	@echo '==> Compiling asciidoc files to generate html'
	asciidoctor -b html5 -a data-uri -a uk \
	-a caseStudy=QuickStartGuide \
	-a caseStudyTitle="Quick Start Guide" \
	-a stimulusVersion=2018.09.1 \
	main.adoc -o $@

QuickStartGuide.pdf: main.adoc QuickStartGuide/*.adoc
	@echo '==> Compiling asciidoc files to generate pdf'
	asciidoctor-pdf -a toc2 -a uk \
	-a caseStudy=QuickStartGuide \
	-a caseStudyTitle="Quick Start Guide" \
	-a stimulusVersion=2018.09.1 \
	main.adoc -o $@

QuickStartGuide.slides.html: main.adoc QuickStartGuide/*.adoc
	@echo '==> Compiling asciidoc files to generate Dzslides'
	asciidoctor -a icons=font -a data-uri -b dzslides -a uk \
	-a defaultwidth=100% \
	-a defaultwidthmenu=50% \
	-T $(DZSLIDES) -E slim \
    -a slides -a dzslides \
	-r asciidoctor-diagram \
    -a source-highlighter=$(HIGHLIGHT) \
 	-a caseStudy=QuickStartGuide \
	-a caseStudyTitle="Quick Start Guide" \
	-a stimulusVersion=2018.09.1 \
	main.adoc -o $@
#-----------------------------------------------------

#-----------------------------------------------------
LGS.html: main.adoc LGS/*.adoc
	asciidoctor -b html5 -a uk \
	-a caseStudy=LGS \
	-a caseStudyTitle="Landing Gear System" \
	-a stimulusVersion=2018.09.1 \
	main.adoc -o $@

LGS.pdf: main.adoc LGS/*.adoc
	asciidoctor-pdf -a toc2 -a uk \
	-a caseStudy=LGS \
	-a caseStudyTitle="Landing Gear Sytem" \
	-a stimulusVersion=2018.09.1 \
	main.adoc -o $@

LGS.slides.html: main.adoc LGS/*.adoc
	@echo '==> Compiling asciidoc files to generate Dzslides'
	asciidoctor -a icons=font -a data-uri -b dzslides -a uk \
	-a defaultwidth=100% \
	-a defaultwidthmenu=50% \
	-T $(DZSLIDES) -E slim \
    -a slides -a dzslides \
	-r asciidoctor-diagram \
    -a source-highlighter=$(HIGHLIGHT) \
	-a caseStudy=LGS \
	-a caseStudyTitle="Landing Gear System" \
	-a stimulusVersion=2018.09.1 \
	main.adoc -o $@
#-----------------------------------------------------

#-----------------------------------------------------
Porte.html: main.adoc AutomaticDoor/*.adoc
	asciidoctor -b html5 -a fr \
	-a caseStudy=AutomaticDoor \
	-a caseStudyTitle="Porte Automatique [FR]" \
	-a stimulusVersion=2018.09.1 \
	main.adoc -o $@

Porte.pdf: main.adoc AutomaticDoor/*.adoc
	asciidoctor-pdf -a toc2 -a fr \
	-a caseStudy=AutomaticDoor \
	-a caseStudyTitle="Porte Automatique" \
	-a stimulusVersion=2018.09.1 \
	main.adoc -o $@

Porte.slides.html: main.adoc AutomaticDoor/*.adoc
	@echo '==> Compiling asciidoc files to generate Dzslides'
	asciidoctor -a icons=font -a data-uri -b dzslides -a fr \
	-a defaultwidth=100% \
	-a defaultwidthmenu=50% \
	-T $(DZSLIDES) -E slim \
    -a slides -a dzslides \
	-r asciidoctor-diagram \
    -a source-highlighter=$(HIGHLIGHT) \
	-a caseStudy=AutomaticDoor \
	-a caseStudyTitle="Porte Automatique" \
	-a stimulusVersion=2018.09.1 \
	main.adoc -o $@
#-----------------------------------------------------

#-----------------------------------------------------
AutomaticDoor.html: main.adoc AutomaticDoor/*.adoc
	asciidoctor -b html5 -a uk \
	-a caseStudy=AutomaticDoor \
	-a caseStudyTitle="Porte Automatique [FR]" \
	-a stimulusVersion=2018.09.1 \
	main.adoc -o $@

AutomaticDoor.pdf: main.adoc AutomaticDoor/*.adoc
	asciidoctor-pdf -a toc2 -a uk \
	-a caseStudy=AutomaticDoor \
	-a caseStudyTitle="Porte Automatique" \
	-a stimulusVersion=2018.09.1 \
	main.adoc -o $@

AutomaticDoor.slides.html: main.adoc AutomaticDoor/*.adoc
	@echo '==> Compiling asciidoc files to generate Dzslides'
	asciidoctor -a icons=font -a data-uri -b dzslides -a uk \
	-a defaultwidth=100% \
	-a defaultwidthmenu=50% \
	-T $(DZSLIDES) -E slim \
    -a slides -a dzslides \
	-r asciidoctor-diagram \
    -a source-highlighter=$(HIGHLIGHT) \
	-a caseStudy=AutomaticDoor \
	-a caseStudyTitle="Porte Automatique" \
	-a stimulusVersion=2018.09.1 \
	main.adoc -o $@
#-----------------------------------------------------

publish:
	asciidoctor README.adoc
	git commit -am "publishing web site"
	git push

%.html: %.$(EXT) 
	@echo '==> Compiling asciidoc files with Asciidoctor to generate HTML'
	asciidoctor -b html5 $<

%.pdf: %.$(EXT) 
	@echo '==> Compiling asciidoc files with Asciidoctor to generate HTML'
	asciidoctor-pdf -a toc2 $<

%.dzslides.html: %.$(EXT) 
	@echo '==> Compiling asciidoc files to generate Dzslides'
	asciidoctor  -a icons=font -a data-uri -b dzslides \
	-T $(DZSLIDES) -E slim \
    -a slides -a dzslides \
	-r asciidoctor-diagram \
    -a source-highlighter=$(HIGHLIGHT) \
    -o $@ $<

