# Betänken Eder!

Leo Tolstoy's appeal against the Russo-Japanese War, *Одумайтесь!* (1904), in its first Swedish edition: *Betänken Eder! Ett bref till krigets män och tsaren* (Björck & Börjesson, Stockholm, 1904). The English original by V. G. Chertkov and I. F. Mayo appeared in *The Times* on 27 June 1904 as *Bethink Yourselves!*.

The Swedish translation was first printed in full in Göteborgs Handels- och Sjöfartstidning on 1 July 1904. Björck & Börjesson issued it as a 25-öre pamphlet on 5 July, and 35,000 copies sold in two weeks. The translator is unknown. The pamphlet leaves out Tolstoy's chapter IX, the postscript, the datelines and the chapter epigraphs. This edition gives the pamphlet as it was printed.

The text keeps the spelling of 1904. Obvious misprints are corrected, and unusual words are explained in footnotes.

- Scans of the original: <https://archive.org/details/leo-tolstoy_betanken-eder_jed>
- Background research: [Betänken Eder! in Sweden](https://research.tolstoy.life/research/themes/betanken-eder-in-sweden/)
- Read online, in Swedish, English (with read-along audio) or Russian: [Bethink Yourselves!](https://research.tolstoy.life/reader/non-fiction/essays-and-criticism/bethink-yourselves/bethink-yourselves.sv-1904.html)

## Files

- `betanken-eder.md`: Tolstoy's text, the source for both the ebook and the web version
- `titelsida.md`, `dedikation.md`, `forord.md`, `kolofon.md`: the ebook's front and back matter
- `metadata.yaml`, `epub.css`, `images/`: the ebook's metadata, styling and images
- `docs/anteckningar.md`: how each editorial note and correction was handled (in Swedish)

## Building the ebook

Needs [Pandoc](https://pandoc.org) and [epubcheck](https://www.w3.org/publishing/epubcheck/):

```bash
brew install pandoc epubcheck
```

```bash
./build.sh
```

## Found an error?

Open an issue with the page number in the original (visible in the scans) and what it says there.

## Licence

Dedicated to the public domain under [Soli Deo Gloria](https://github.com/pjedlund/soli-deo-gloria-dedication) (CC0 1.0). See `LICENSE`.

## På svenska

Leo Tolstoys upprop mot rysk-japanska kriget, *Betänken Eder! Ett bref till krigets män och tsaren*, i den svenska utgåvan från 1904 (Björck & Börjesson, Stockholm). Texten återges med 1904 års stavning. Uppenbara tryckfel är rättade och ovanliga ord förklarade i fotnoter. E-boken byggs med `./build.sh` (se ovan).

Hittar du ett fel i texten? Öppna ett ärende under Issues med sidnummer i originalet (synligt i skanningarna) och vad som står där.
