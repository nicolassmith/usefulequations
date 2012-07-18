main = usefulequations
viewer = okular

maindeps = $(main).tex

pdf : $(main).pdf

dvi : $(main).dvi

%.pdf : %.dvi
	dvipdf $<

$(main).dvi : $(maindeps)
	latex $<
#	-bibtex $(main)
#	latex $<
#	latex $<

clean : 
	-rm -f *.log *.orig *.rej *.aux *.dvi *~ *.blg *.lof *.lot *.bbl *.toc .*~ *.out *.pdf *.eps
	-rm -rf _region_.*
	-rm -rf auto

view : $(main).pdf
	$(viewer) $< 2> /dev/null &

.PHONY : view clean pdf dvi
.SECONDARY : 
