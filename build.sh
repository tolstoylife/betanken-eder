#!/bin/sh
# Builds betanken-eder.epub and checks it. Needs pandoc and epubcheck (brew install pandoc epubcheck).
set -e
cd "$(dirname "$0")"
pandoc metadata.yaml text/title-page.md text/preface.md text/betanken-eder.md text/colophon.md \
  --css epub.css --epub-title-page=false --shift-heading-level-by=-1 --toc-depth=1 \
  -o betanken-eder.epub
epubcheck -q betanken-eder.epub && echo "betanken-eder.epub: ok"
