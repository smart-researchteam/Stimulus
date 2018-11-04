#-----------------------------------------------------
# Makefile to bake the outputs
EXT = adoc
ASCIIDOCTOR=asciidoctor -a icons=font -a data-uri
HIGHLIGHT=pygments
DZSLIDES=../asciidoctor-backends/slim/dzslides
#-----------------------------------------------------

default: stimulus.html

all: QuickStartGuide.html QuickStartGuide.pdf QuickStartGuide.slides.html \
LGS.html LGS.pdf LGS.slides.html

#-----------------------------------------------------
QuickStartGuide.html: main.adoc QuickStartGuide
	@echo '==> Compiling asciidoc files to generate html'
	asciidoctor -b html5 -a data-uri \
	-a caseStudy=QuickStartGuide \
	-a caseStudyTitle="Quick Start Guide" \
	-a stimulusVersion=2018.09.1 \
	main.adoc -o $@

QuickStartGuide.pdf: main.adoc QuickStartGuide
	@echo '==> Compiling asciidoc files to generate pdf'
	asciidoctor-pdf -a toc2 \
	-a caseStudy=QuickStartGuide \
	-a caseStudyTitle="Quick Start Guide" \
	-a stimulusVersion=2018.09.1 \
	main.adoc -o $@

QuickStartGuide.slides.html: main.adoc QuickStartGuide
	@echo '==> Compiling asciidoc files to generate Dzslides'
	asciidoctor -a icons=font -a data-uri -b dzslides \
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
	asciidoctor -b html5 \
	-a caseStudy=LGS \
	-a caseStudyTitle="Landing Gear System" \
	-a stimulusVersion=2018.09.1 \
	main.adoc -o $@

LGS.pdf: main.adoc LGS
	asciidoctor-pdf -a toc2 \
	-a caseStudy=LGS \
	-a caseStudyTitle="Landing Gear Sytem" \
	-a stimulusVersion=2018.09.1 \
	main.adoc -o $@

LGS.slides.html: main.adoc LGS
	@echo '==> Compiling asciidoc files to generate Dzslides'
	asciidoctor -a icons=font -a data-uri -b dzslides \
	-T $(DZSLIDES) -E slim \
    -a slides -a dzslides \
	-r asciidoctor-diagram \
    -a source-highlighter=$(HIGHLIGHT) \
	-a caseStudy=LGS \
	-a caseStudyTitle="Landing Gear System" \
	-a stimulusVersion=2018.09.1 \
	main.adoc -o $@
#-----------------------------------------------------

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

