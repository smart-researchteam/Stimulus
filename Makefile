#-----------------------------------------------------
# Makefile to bake the outputs
EXT = adoc
#-----------------------------------------------------

default: stimulus.html

%.html: %.$(EXT) 
	@echo '==> Compiling asciidoc files with Asciidoctor to generate HTML'
	asciidoctor -b html5 $<

%.pdf: %.$(EXT) 
	@echo '==> Compiling asciidoc files with Asciidoctor to generate HTML'
	asciidoctor-pdf -a toc2 $<

%.deckjs.html: %.$(EXT) 
	@echo '==> Compiling asciidoc files to generate Deckjs'
	asciidoctor -T ../asciidoctor-deck.js/templates/haml/ \
	-a slides \
	-o $@ $<
