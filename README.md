# Betänken Eder!

A reminder for everybody to refuse to participate in wars. Tolstoy's appeal came against the backdrop of the Russo-Japanese War that started on 8 February 1904.

The English original is by V. G. Chertkov and I. F. Mayo and appeared in *The Times* on 27 June 1904 as *Bethink Yourselves!*. A Swedish translation was printed in full in Göteborgs Handels- och Sjöfartstidning on 1 July 1904. The translator is unknown.

Björck & Börjesson issued the translation as a pamphlet four days later: *Betänken Eder! Ett bref till krigets män och tsaren*. The pamphlet leaves out chapter IX, the postscript, the datelines and the chapter epigraphs.

The text keeps the spelling of 1904. Obvious misprints are corrected, and unusual words are explained in footnotes.

## Download

- The ebook, newest version: [betanken-eder.epub](https://github.com/tolstoylife/betanken-eder/releases/latest/download/betanken-eder.epub)
- Every version, with what changed: [Releases](https://github.com/tolstoylife/betanken-eder/releases)

The version number and date are in the ebook's colophon (Kolofon).

- Scans of the original: <https://archive.org/details/leo-tolstoy_betanken-eder_pj>
- Background research: [Betänken Eder! in Sweden](https://research.tolstoy.life/research/themes/betanken-eder-in-sweden/)
- Read online, in Swedish, English (with read-along audio) or Russian: [Bethink Yourselves!](https://research.tolstoy.life/reader/non-fiction/essays-and-criticism/bethink-yourselves/bethink-yourselves.sv-1904.html)

## Files

- `text/betanken-eder.md`: Tolstoy's text, the source for both the ebook and the web version
- `text/title-page.md`, `text/preface.md`, `text/colophon.md`: the ebook's front and back matter (file names in English, text in Swedish)
- `metadata.yaml`, `epub.css`, `images/`: the ebook's metadata, styling and images
- `docs/corrections.md`: every misprint corrected in this edition, with page numbers (in Swedish)

## Building the ebook

Needs [Pandoc](https://pandoc.org) and [epubcheck](https://www.w3.org/publishing/epubcheck/):

```bash
brew install pandoc epubcheck
```

```bash
./build.sh
```

## Making a release

1. Raise `version:` in `metadata.yaml`, build with `./build.sh`, then commit and push.
2. Publish the release with the ebook attached (needs the [GitHub CLI](https://cli.github.com)):

```bash
gh release create v1.0 betanken-eder.epub --title "Betänken Eder! 1.0" --notes "What changed."
```

Use the same number as in `metadata.yaml`. The colophon's date is the day the ebook was built.

## Licence

Dedicated to the public domain under [Soli Deo Gloria](https://github.com/pjedlund/soli-deo-gloria-dedication) (CC0 1.0). See `LICENSE`.
