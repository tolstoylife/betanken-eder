#!/bin/sh
# Bygger betanken-eder.epub och kontrollerar den. Kräver pandoc och epubcheck (brew install pandoc epubcheck).
set -e
cd "$(dirname "$0")"
pandoc metadata.yaml text/titelsida.md text/dedikation.md text/forord.md text/betanken-eder.md text/kolofon.md \
  --css epub.css --epub-title-page=false --shift-heading-level-by=-1 --toc --toc-depth=1 \
  -o betanken-eder.epub
epubcheck -q betanken-eder.epub && echo "betanken-eder.epub: ok"
