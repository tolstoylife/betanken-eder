# Betänken Eder! — svensk utgåva som EPUB och webbtext

## Bakgrund och syfte

Johan har ett eget exemplar av den svenska pamfletten *Betänken Eder! Ett bref till krigets män och tsaren* (Björck & Börjesson, Stockholm 1904, 25 öre; tryckt av V. Pettersons A.-B., 1904). Han skannade och transkriberade den vintern 2025 och laddade upp skanningarna till Internet Archive i mars 2026 (`leo-tolstoy_betanken-eder_jed`, CC0). Arbetet stannade efter transkriptionen. Nu ska det bli klart: en svensk e-bok som vem som helst får läsa, kopiera och sprida, och samma text läsbar på johanedlund.se.

Utgåvan bär Tolstoys egen hållning till upphovsrätt vidare. Den dediceras under Soli Deo Gloria (SDG), Johans egen allmängodsdedikation, som har sitt ursprung i just Tolstoys avstående från upphovsrätt.

## Vad som redan finns (i `leo-tolstoy_betanken-eder_pj/`)

- `texts/allPages.md`: hela texten korrläst, cirka 11 600 ord, alla tolv kapitelrubriker, 1904 års stavning. Den innehåller 83 egna anteckningar i formen `[^text]` (arbetsfrågor och läsarförklaringar blandat) och cirka 45 Obsidian-länkar `[[…]]`.
- `texts/runbergl.txt`: en oberoende transkription av samma utgåva (troligen Project Runeberg), med hårda radbrytningar och `<h2>`-rubriker. Den används som jämförelse vid korrläsning.
- `texts/backCover.md`: förlagets reklambaksida. Den tas inte med i utgåvan.
- `images/LeoTolstoy-BetankenEder-Framsida-1439x2197.png` (plus en 8-bitarsversion): det restaurerade omslaget.
- `images/scans/`: OCR-filerna per sida. Själva bilderna är gitignorerade och ligger på Internet Archive.
- `leo-tolstoy_bethink-yourselves-pg/`: den engelska Gutenberg-utgåvan (pg27189), som referens.
- Projektet är ett lokalt git-repo (en commit, ingen fjärrkopia).

## Mål

1. En ren markdown-källfil med hela texten, som både EPUB:en och webbsidan byggs från.
2. En EPUB 3 som klarar epubcheck utan fel.
3. Projektet förberett för ett GitHub-repo under `tolstoylife/`. Johan skapar repot och pushar själv.
4. (Separat arbete, efter 1–3) En ny inläggstyp Projects på johanedlund.se, med *Betänken Eder!* som första projekt.

## Det vi inte gör

- Ingen moderniserad version (kan bli ett senare, separat steg).
- Inga wikilänkar till tolstoy.life. `[[…]]` blir vanlig text.
- Förlagets reklambaksida tas inte med.
- `tl`-verktygen (`/Volumes/Graugear/Tolstoy/tools`) används inte. De är byggda för engelska texter och för tolstoy.life-utgivningen, och OCR-steget de var till för är redan gjort.

## Det som skulle göra det misslyckat

- Tolstoys text ändras utöver rena tryckfel: ord ändras, stavningen jämnas ut eller meningar "förbättras".
- Johans arbetsfrågor ("stavning?", "komma här?") syns i den färdiga utgåvan.
- Förordet står i Claudes röst i stället för Johans.

## Beslut Johan har tagit

- **Språket:** 1904 års stavning behålls (hvad, af, äfven, låtom oss). Bara uppenbara tryckfel rättas. Svåra eller ålderdomliga ord förklaras i korta fotnoter.
- **Bokens ordning:** omslaget som faksimil → 1904 års titelsida återgiven som text ("Till krig emot kriget! / Betänken Eder! / Ett bref till krigets män och tsaren / af Leo Tolstoy / Stockholm, Björck & Börjesson"; pris och stämpel utelämnas) → dedikationssida → kort förord → Tolstoys text → kolofon. Pandocs automatiska titelsida stängs av, så att den inte blir dubbel.
- **Repo:** ett nytt, rent repo `betanken-eder` (blir `tolstoylife/betanken-eder`) som bara innehåller den svenska utgåvan: källfil, titelsida, dedikation, förord, kolofon, omslag, SDG-logotyp, `metadata.yaml`, `epub.css`, `build.sh`, README och LICENSE. Det nuvarande `bethink-yourselves`-repot blir kvar som lokal arbetsmapp (engelska källor, OCR, `allPages.md`).
- **Dedikation:** SDG-monogrammet (`~/Projects/soli-deo-gloria-dedication/logo/SDG-logo.svg`) och "Soli Deo Gloria" på en egen sida. I kolofonen står SDG:s *korta form* översatt till svenska, med länk till originaltexten och till CC0. Att färdigställa SDG 2.0 (grenen `sdg-2.0.0-beta`) är ett eget projekt.
- **Förord:** Claude skriver ett kort utkast, och Johan skriver om det med sin röst.
- **Webben:** johanedlund.se, i en ny generell inläggstyp Projects (fler projekt kommer: Soli Deo Gloria, tolstoy.life, dimma). Projektsidan har omslag, förord, kolofon och nedladdning, och länkar till en egen lässida med hela texten. Notisen `/notes/bethink-yourselves/` flyttas och vidarebefordras dit.

## Hur det byggs (Claudes val)

- **Pandoc** (`brew install pandoc`, version 3.12) gör om markdown till EPUB 3, och **epubcheck** (redan installerat) kontrollerar resultatet. Ett kort `build.sh` med ett enda `pandoc`-kommando gör om bygget varje gång.
- **Fotnoter skrivs inline som `^[…]`.** Det formatet förstår både Pandoc och johanedlund.se (som använder `markdown-it-footnote`), och Obsidian visar det också. Då räcker en källfil för båda utdata.
- **Metadata** (titel, författare, språk `sv`, utgivare, datum, `dc:rights` = `SPDX-License-Identifier: CC0-1.0`, omslag) ligger i ett `metadata.yaml`. En kort `epub.css` sätter typsnitt, marginaler och dedikationssidan.
- **Kapitelrubrikerna** blir `##`. Pandoc delar boken i ett kapitel per rubrik och bygger innehållsförteckningen ur dem.

## Steg

### 1. Gå igenom anteckningarna (med Johan)

Gå igenom alla 83 `[^…]` och sortera dem i tre högar:
- **tryckfel att rätta**: rätta i texten och ta bort anteckningen
- **läsarförklaring att behålla**: skriv om till en kort svensk fotnot `^[…]`
- **fråga utan svar**: ta upp med Johan

För varje osäker stavning, jämför mot `runbergl.txt` och skanningen på Internet Archive. Avgör inte själv något som rör Tolstoys ordval. Lägg fram förslagen i en tabell (original | förslag | skäl) och låt Johan godkänna, eftersom det här är redaktionellt arbete.

Ett förslag att ta ställning till: några av de borttagna wikilänkarna (dukhoborerna, Makarov, Haagkonferensen, Nikolaj Romanov) kan behöva en egen förklarande fotnot.

### 2. Jämför mot Runeberg

Gör ett ord-för-ord-diff mellan den rensade texten och `runbergl.txt` (efter att radbrytningar och taggar har tagits bort). Varje skillnad är antingen ett fel hos Johan, ett fel hos Runeberg eller en avsiktlig rättelse. Lista skillnaderna och låt Johan avgöra de osäkra.

### 3. Skapa källfilen `betanken-eder.md`

Skapa först den nya mappen `/Volumes/Graugear/Tolstoy/projects/betanken-eder/` med `git init`, och lägg alla nya filer där. Kopiera in omslags-PNG:n och `SDG-logo.svg`. Den gamla `allPages.md` lämnas orörd i `bethink-yourselves/` som arbetskopia. I källfilen:
- Ta bort `# allPages`, `[Stamp] EDVARD JANSSON` och prisraden som brödtext. Titelsidans uppgifter flyttas till metadata och kolofon.
- Ta bort `<span class=“nummer”>` (typografiska citattecken och trasig HTML).
- Gör om `[[x]]` till x.
- Gör om de godkända anteckningarna till `^[…]`.
- Behåll svenska citattecken »…» och tankstreck — som de står.
- Titelsidans text flyttas till en egen `titelsida.md` (se Beslut). Kontrollera ordningen mot skanningen p000.

### 4. Förord och kolofon

- **`forord.md`**: Claudes utkast, cirka 250–400 ord, och varför Johan ger ut texten nu. Faktakällan är forskningsdossiern `/Volumes/Graugear/Tolstoy/docs/research/works/non-fiction/essays-and-criticism/1904-bethink-yourselves/index.md`, inte verksidan, vars datum motsäger varandra. Ur dossiern:
  - Huvudtexten och den avslutande eldbilden är daterade 30 april 1904 (g.s.), ett efterord 8 maj (g.s.).
  - Texten trycktes först i The Times, London, 27 juni 1904. I Ryssland beslagtogs den.
  - Den svenska översättaren är okänd.
  - Den svenska texten följer troligen Tjertkovs engelska och inte den ryska, vilket syns i slutorden "sprida och underhålla den".

  Allt som är osäkert markeras för Johan.
- **`kolofon.md`**: vilket exemplar texten bygger på, en länk till skanningarna på Internet Archive, hur texten är bearbetad (stavning behållen, tryckfel rättade, noter av utgivaren), SDG:s korta form på svenska med länk till originalet (`github.com/pjedlund/soli-deo-gloria-dedication`) och CC0, samt utgivare och år. *Claudes val, för Johan att granska:* en mening om att den svenska utgåvan 1904 saknar Tolstoys ett femtiotal kapitelmotton och att den här utgåvan återger den svenska texten som den trycktes. Mottona läggs inte tillbaka.
- **`dedikation.md`**: SDG-monogrammet och "Soli Deo Gloria".

### 5. Bygg EPUB:en

Kör `build.sh`, som ungefär gör: `pandoc metadata.yaml titelsida.md dedikation.md forord.md betanken-eder.md kolofon.md --css epub.css --epub-cover-image=… --epub-title-page=false --toc -o betanken-eder.epub`. Kontrollera resultatet med `epubcheck betanken-eder.epub`. Faksimilet av omslaget hamnar först tack vare `--epub-cover-image`.

### 6. Förbered repot

- Skriv en kort `README.md` (vad det är, hur man bygger, hur man rapporterar fel via Issues) och en `LICENSE` med SDG-CC0-varianten (kopierad från `variants/SDG-CC0.txt`).
- Lägg till `.epub` i gitignore, eller lägg EPUB:en som en release. Det avgör Johan.
- Commita lokalt i `betanken-eder/`. Johan skapar `tolstoylife/betanken-eder` och pushar själv.
- Spara planen som `docs/plan.md` i det nya repot.

### 7. (Separat session) Projects på johanedlund.se

Det här arbetet görs i `~/Projects/JEDEE` och startas som en egen session när steg 1–6 är klara. Använd skillsen `eleventy-excellent`, `microformats`, `indieweb` och `cube-css`:
- Lägg till en ny `projects`-typ (`src/posts/projects/`, ett `category`-fält, registrering i `src/_config/collections.js`, en listsida och en layout).
- Fält: titel, bild, kort text, status och länkar.
- Projektsidan för *Betänken Eder!* får omslag, förord, kolofon och en nedladdningslänk till EPUB:en, och länkar till en lässida (`lang="sv"`) som byggs från `betanken-eder.md`.
- Lägg `redirectFrom: /notes/bethink-yourselves/` på den nya sidan och ta bort notisen.

## Kontroll

- `epubcheck betanken-eder.epub` ger inga fel.
- Öppna EPUB:en i Apple Books (och gärna i Calibre). Kontrollera att omslaget, dedikationssidan och innehållsförteckningen med tolv kapitel finns, och att fotnoterna går att klicka på och tillbaka.
- `grep -nE '\[\^|\[\[|span class|allPages' betanken-eder.md` ger inga träffar.
- Läs tre slumpvisa stycken mot skanningen.
- Johan läser och godkänner förordet och anteckningstabellen.

## Lämnas till den som bygger

Typsnitt och utseende i `epub.css`, filnamn, fotnoternas exakta formuleringar (efter Johans godkännande av sorteringen) och den exakta formuleringen av det svenska SDG-stycket. Johan godkänner det.
