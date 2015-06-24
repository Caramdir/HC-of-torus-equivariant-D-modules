default: paper-nounicode.pdf

paper-nounicode.tex: paper.tex Makefile
	cp paper{,-nounicode}.tex
	sed -i -e 's/ck-article/ck-article-nounicode/g' $@
	sed -i -e 's/α/\\alpha /g' $@
	sed -i -e 's/β/\\beta /g' $@
	sed -i -e 's/γ/\\gamma /g' $@
	sed -i -e 's/δ/\\delta /g' $@
	sed -i -e 's/Δ/\\Delta /g' $@
	sed -i -e 's/μ/\\mu /g' $@
	sed -i -e 's/η/\\eta /g' $@
	sed -i -e 's/ϕ/\\phi /g' $@
	sed -i -e 's/φ/\\phi /g' $@
	sed -i -e 's/ι/\\iota /g' $@
	sed -i -e 's/Γsub/Gsub/g' $@
	sed -i -e 's/ΓdR/GdR/g' $@
	sed -i -e 's/Γ/\\Gamma /g' $@
	sed -i -e 's/τ/\\tau /g' $@
	sed -i -e 's/π/\\pi /g' $@
	sed -i -e 's/ε/\\epsilon /g' $@
	sed -i -e 's/ω/\\omega /g' $@
	sed -i -e 's/ℂ/\\mathbb{C}/g' $@
	sed -i -e 's/ℤ/\\mathbb{Z}/g' $@
	sed -i -e 's/ℝ/\\mathbb{R}/g' $@
	sed -i -e 's/∈/\\in /g' $@
	sed -i -e 's/∞/\\infty /g' $@
	sed -i -e 's/≤/\\leq /g' $@
	sed -i -e 's/≥/\\geq /g' $@
	sed -i -e 's/⊆/\\subseteq /g' $@
	sed -i -e 's/∩/\\cap /g' $@
	sed -i -e 's/∪/\\cup /g' $@
	sed -i -e 's/₁₃/_{13}/g' $@
	sed -i -e 's/₁₂/_{12}/g' $@
	sed -i -e 's/₂₃/_{23}/g' $@
	sed -i -e 's/₀/_0/g' $@
	sed -i -e 's/₁/_1/g' $@
	sed -i -e 's/₂/_2/g' $@
	sed -i -e 's/¹/^1/g' $@
	sed -i -e 's/²/^2/g' $@
	sed -i -e 's/³/^3/g' $@
	sed -i -e 's/→/\\to /g' $@
	sed -i -e 's/∘/\\circ /g' $@
	sed -i -e 's/×/\\times /g' $@
	sed -i -e 's/ / /g' $@
	sed -i -e 's/ / /g' $@
	echo "Do not forget to update the date!"

paper-nounicode.pdf: paper-nounicode.tex
	latexmk --pdf $<

dist: paper-nounicode.pdf
	cp -r /usr/local/texlive/2014/texmf-dist/tex/latex/biblatex/* .
	tar czvf arXiv.tar.gz *.tex *.bbl *.sty *.cls b* cbx lbx

clean:
	rm *.aux *.bbl *.bcf *.blg *.fdb_latexmk *.fls *.log *.pdf *.run.xml paper-nounicode.*
