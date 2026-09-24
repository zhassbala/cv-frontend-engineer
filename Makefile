.PHONY: pdf watch clean distclean setup

pdf:
	latexmk -pdf resume.tex

watch:
	latexmk -pdf -pvc resume.tex

clean:
	latexmk -c

distclean:
	latexmk -C

setup:
	./scripts/setup-tex.sh
