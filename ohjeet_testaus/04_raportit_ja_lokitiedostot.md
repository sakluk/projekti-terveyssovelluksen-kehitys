# 04. Raportit ja lokitiedostot

Lähde: [Robot Framework User Guide - Ch. 3.6 Output files](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#output-files)

Kun testit ajetaan, useita tulostiedostoja generoidaan. Ne kaikki liittyvät jollakin tavalla testien tuloksiin. Tulostiedostot konfiguroidaan antamalla komentoriville lisäparametreja. 

## Tuloshakemisto (`--outputdir`)

Kaikkien tulostiedostojen sijainti voidaan asettaa antamalla absoluuttinen hakemistonpolku, mutta useimmiten riittää suhteelisen polun käyttö. Oletushakemisto on se hakemisto, missä testin suoritus on aloitettu, mutta sen voi vaihtaa lisäparametrilla `--outputdir` tai `-d`. Esimerkiksi:

```bash
robot --outputdir outputs tests/test1.robot
```
suorittaa alihakemistosta `tests` löytyvän `test1.robot` testin ja tallentaa tulostiedostot rinnakkaishakemistoon `output`. Tyypillinen hakemistorakenne on esim. seuraava:
```
projekti/
├── tests/
│   └── test1.robot
│   └── test2.robot
│   └── testX.robot
└── outputs/
```

## Tulostiedosto (`--output`)

Tulostiedostot sisältävät kaikki testisuoritusten tulokset koneluettavassa XML tai JSON formaatissa. Loki, raportti ja xUnit tiedostot tyypillisesti generoidaan näistä. Tulostiedostoja on mahdollista yhdistellä ja jälkikäsitellä [rebot](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#rebot)-työkalulla.

Komentorivioptio `--output` tai `-o` määrittää minne tulostiedostot luodaan. Polku on aina suhteessa tuloshakemistoon ja oletusarvo suoritettaessa testejä on `output.xml`.

Tulostiedostot on mahdollista poistaa käytöstä käyttämällä erikoisarvoa NONE. Jos tulostiedostoja ei tarvita, voi ne kaikki otta pois käytöstä esim. komennolla
```bash
robot --output NONE --report NONE --log NONE tests/test1.robot
```

## Lokitiedosto (`--log`)

Lokitiedosto sisältää yksityiskohtaiset tiedot testitapausten suorituksesta HTML-formaatissa. Ne on järjestetty hierarkisesti testikokonaisuuksiin (test suites), testitapauksiin (test cases) ja avainsanoihin (keywords). Lokitiedostot sisältävät myös tilastoja, kuten 
- kuinka monta testiä suoritettin (Total),
- moniko testeistä on suortettu hyväksytysti (Pass),
- kuinka moni testeistä ei onnistunut (Fail) ja
- kuinka monta testia ohitettiin (Skip)
Lisäksi näytetään testeihin kulunut aika (Elapsed) sekä pylväsdiagrammin avulla onnistuineiden/ei onnistuneiden/ohitettujen testien suhde.

Komentorivin lisäparametri `--log` tai `-l` määrittelee minne lokitiedosto luodaan. Oletusarvoisesti lokitiedoston nimeksi tulee `Log.html`.

Ohessa on esimerkki kuvankaappaus lokitiedostosta:

![Esimerkki lokitiedostosta](https://robotframework.org/robotframework/latest/images/log_passed.png)

Lisätietoja: [Log-file](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#log-file)

## Raportti (`--report`)

Raportti sisältää yhteenvedon testien suorituksesta HTML-formaatissa. Raporttiin kerätään tilastoja perustuen tageihin ja suoritettuihin testijoukkoihin (test suites) sekä listan kaikista suoritetuista testitapauksista (test cases). Kun sekä raportti ja lokitiedosto generoidaan, raportti sisältää linkkejä lokitiedostoon helpottamaan navigointia ja tarkempien tietojen tutkimista varten. 

Raportista on helppo nähdä koko testin suoritus, koska sen taustaväri on vihreä, jos kaikki testit on suoritettu onnistuneesti (Pass) ja kirkkaan punainen, jos yksikään testeistä ei onnistu (Fail). Taustaväri voi olla myös keltainen, mikä tarkoittaa, että kaikki testi on ohitettu (Skipped).

Komentorivin lisäparametri `--report` tai `-r` määrittelee minne raportti luodaan. Samalla tavalla kuin lokitiedoston kanssa, jos raporttia ei tarvita, voit käyttää lisäparametria `--report NONE`. Oletusarvoisesti raportin nimi on `report.html`.

Lisätietoa: [Report file](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#report-file)

## Debuggaustiedosto (`--debug_file`)

Debuggaustiedostot ovat puhtaita tekstitiedostoja, jotka kirjoitetaan testien suorittamisen aikana. Kaikki testikirjastoista saapuvat viestit, testien aloitus ja lopetushetket ja avainsanat tallennetaan niihin. Debuggaustietoja voidaan käyttää testien suorituksen monitorointiin.

**HUOM!** Debuggaustietoja ei luoda, ellei erikseen anneta komentorivillä lisäparametria `--debug_file` tai `-b`.

## Tulostiedostojen aikaleimaus (`--timestampoutputs`)

Kaikki generoidut tulostiedostot voidaan automaattisesti aikaleimata antamalla lisäparametri `timestampoutputs` tai `-T`. Kun tätä parametria käytetään, aikaleima muotoa `YYYYMMDD-hhmmss` lisätään tiedostojen nimeen. Esim. antamalla komento:
```bash
robot --timestampoutputs --log mylog.html --report NONE tests/test1.robot
```
luo seuraavat tulostiedostot:
- `output-20250205-201034.xml` ja
- `mylog-20250205-201034.html`

## Muut parametrit

Robot Frameworkin käyttöoppaan kappaleesta [3.6 Output files](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#output-files) löytyy lisätietoa myös muista lisäparametreista.


## HTML-sivut GitHubissa

Voit luoda Github-projektillesi verkkosivuston käyttämällä [GitHub pages](https://pages.github.com/) -työkalua. GithHub-sivut toimivat suoraan GitHubista käsin.

## GitHub.io sivujen avaaminen

Ohessa on [pikaohjeet](https://docs.github.com/en/pages/quickstart) projektisi GitHub-sivujen luomiseksi.

1. GitHubissa millä tahansa sivulla, valitse oikeasta ylänurkasta `+` (Create new...) > New Repository.
2. Kirjoita uuden repository nimeksi `username.github.io`, missä `username` on GitHub käyttäjätunnuksesi.
3. Valitse uuden repository näkyvyys (visibility).
4. Valitse: **Initialize this repository with a README**.
5. Klikkaa: **Create repository**.

Tämän jälkeen voit julkaista minkä tahansa oman GitHub-hakemistosi osoitteessa: `https://username.github.io`.

## Hakemiston julkaiseminen github.io:ssa

Tämän jälkeen valitse GitHubissa oman sovelluksesi sivusto ja tee seuraavat toimenpiteet:

1. GitHub-hakemistossasi valitse hakemiston asetukset (**Settings**).
2. Siirry Settings-sivulla alaspäin ja valitse **Pages**.
3. Pages-sivulla valitse julkaistavan sovelluksesi haara (**Branch**), esim. `main`.
4. Klikkaa **Save**.

GitHub-hakemistosi (repository) avautuu automaattisesti sivulle: `https://username.github.io/repositoryn_nimi`

## Sivujen muokkaaminen

1. Muokkaa projektiasi VSCodessa niin, että jokaisessa kansiossa on `README.md`-tiedosto. Nämä muutetaan automaattisesti HTML-tiedostoiksi.
2. Lisää jokaiseen `README.md`-tiedostoon hyperlinkit kansiosta löytyviin muihin Markdown- tai HTML-tiedostoihin.
3. Työnnä (Push, Synchronize) uudet versiot kansioiden `README.md`-tiedostoista GitHubiin.

Tämän seurauksena README-tiedostot toimivat hakemistojen index.html tiedostoina, joista on linkit kansiossa oleviin muihin tiedostoihin.

## Esimerkki github.io-sivustosta
- Tutustu https://sakluk.github.io/projekti-terveyssovelluksen-kehitys/ 
- Vertaa GitHub-hakemistoon: https://github.com/sakluk/projekti-terveyssovelluksen-kehitys
