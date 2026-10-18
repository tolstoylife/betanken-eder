# Betänken Eder!

Leo Tolstoys upprop mot rysk-japanska kriget, *Betänken Eder! Ett bref till krigets män och tsaren*, i den svenska utgåvan från 1904 (Björck & Börjesson, Stockholm). Texten återges med 1904 års stavning; uppenbara tryckfel är rättade och ovanliga ord förklarade i fotnoter.

Skanningar av originalet: <https://archive.org/details/leo-tolstoy_betanken-eder_jed>

## Filer

- `betanken-eder.md` – Tolstoys text, källan för både e-boken och webbversionen
- `titelsida.md`, `dedikation.md`, `forord.md`, `kolofon.md` – inledning och avslutning i e-boken
- `metadata.yaml`, `epub.css`, `images/` – e-bokens metadata, utseende och bilder
- `docs/anteckningar.md` – hur varje redaktionell anteckning och rättelse är hanterad

## Bygga e-boken

Kräver [Pandoc](https://pandoc.org) och [epubcheck](https://www.w3.org/publishing/epubcheck/):

```bash
brew install pandoc epubcheck
```

```bash
./build.sh
```

## Fel i texten?

Öppna ett ärende under Issues med sidnummer i originalet (synligt i skanningarna) och vad som står där.

## Licens

Tillägnad allmän egendom under [Soli Deo Gloria](https://github.com/pjedlund/soli-deo-gloria-dedication) (CC0 1.0). Se `LICENSE`.
