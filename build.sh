#!/bin/sh
# Builds betanken-eder.epub and checks it. Needs pandoc and epubcheck (brew install pandoc epubcheck).
set -e
cd "$(dirname "$0")"
out="$PWD/betanken-eder.epub"
pandoc metadata.yaml text/title-page.md text/preface.md text/betanken-eder.md text/colophon.md \
  -f markdown+ascii_identifiers --css epub.css --epub-title-page=false --shift-heading-level-by=-1 --toc-depth=1 \
  -o "$out"
# Pandoc always adds a cover page as page 1; take it out so the book opens on the title page, as Standard Ebooks do (the cover image stays the book's cover, and the landmarks list points to the title page instead).
tmp=$(mktemp -d)
unzip -q "$out" -d "$tmp"
rm "$tmp/EPUB/text/cover.xhtml" "$out"
perl -0pi -e 's#\s*<item id="cover_xhtml"[^>]*/>##; s#\s*<itemref idref="cover_xhtml" />##; s#\s*<reference type="cover"[^>]*/>##' "$tmp/EPUB/content.opf"
perl -0pi -e 's#<a href="text/cover.xhtml" epub:type="cover">[^<]*</a>#<a href="text/ch001.xhtml" epub:type="titlepage">Titelsida</a>#' "$tmp/EPUB/nav.xhtml"
(cd "$tmp" && zip -X0q "$out" mimetype && zip -Xr9Dq "$out" . -x mimetype)
rm -rf "$tmp"
epubcheck -q "$out" && echo "betanken-eder.epub: ok"
