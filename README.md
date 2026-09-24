# Resume

pdfLaTeX. Build output goes to `output/`. Saving a `.tex` file in Cursor or VS Code (LaTeX Workshop) rebuilds `output/resume.pdf`.

## Set up

Engine is pdfLaTeX. You need `pdflatex` and `latexmk`, plus the packages in `texlive-packages.txt`.

**macOS.** Install [MacTeX Basic](https://www.tug.org/mactex/morepackages.html) if `pdflatex` is missing, then:

```bash
make setup
make
```

`make setup` installs packages into `~/Library/texmf`. `make watch` rebuilds on change. `make clean` clears `output/`.

**Linux, TeX Live from [tug.org](https://www.tug.org/texlive/).** Same commands.

**Linux, Debian/Ubuntu apt.** `tlmgr` is disabled, so skip `make setup`:

```bash
sudo apt install texlive-latex-extra texlive-fonts-extra latexmk
make
```

**Windows, TeX Live.**

```powershell
powershell -ExecutionPolicy Bypass -File scripts\setup-tex.ps1
latexmk -pdf resume.tex
```

**Windows, MiKTeX.** Set missing packages to install automatically, then `latexmk -pdf resume.tex`. Skip `setup-tex.ps1`.

If install says `sourcesans` does not exist, TeX Live is older than 2026. The setup scripts install `sourcesanspro` instead. The style file still loads `sourcesanspro.sty`.

Layout is adapted from [Timmy Chan's resume template](https://github.com/TimmyChan/data-science-tech-resume-template) ([CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)).
