all:
	latexmk --pdf --pdflatex=lualatex paper.tex

clean:
	rm *.aux *.bbl *.bcf *.blg *.fdb_latexmk *.fls *.log *.pdf *.run.xml
