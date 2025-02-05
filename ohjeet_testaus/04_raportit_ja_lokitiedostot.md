# 04. Raportit ja lokitiedostot

Kun testit ajetaan, useita tulostiedostoja generoidaan. Ne kaikki liittyvät jollakin tavalla testien tuloksiin. Tulostiedostot konfiguroidaan antamalla komentorivillä lisäparametreja. Erikoisarvoa `NONE` voidaan käyttää estämään tiettyjen tulostietojen generoinnin.

## Tuloshakemisto

Kaikkien tulostiedostojen sijainti voidaan asettaa antamalla absoluuttinen hakemistonpolku, mutta useimmiten riittää suhteelisen polun käyttö. Oletushakemisto on se hakemisto, missä testin suoritus on aloitettu, mutta sen voi vaihtaa lisäparametrilla `--outputdir` tai `-d`. Esimerkiksi:

```bash
robot --outputdir output tests/test1.robot
```
suorittaa alihakemistosta `tests` löytyvän `test1.robot` testin ja tallentaa tulostiedostot rinnakkaishakemistoon `output`. Tyypillinen hakemistorakenne on esim. seuraava:
```
projekti/
├── tests/
│   └── test1.robot
│   └── test2.robot
│   └── testX.robot
└── output/
```

## Tulostiedosto

Tulostiedostot sisältävät kaikki testisuoritusten tulokset koneluettavassa XML tai JSON formaatissa. Loki, raportti ja xUnit tiedostot tyypillisesti generoidaan näistä. Tulostiedostoja on mahdollista yhdistellä ja jälkikäsitellä [rebot](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#rebot)-työkalulla.

Komentorivioptio `--output` tai `-o` määrittää minne tulostiedostot luodaan. Polku on aina suhteessa tuloshakemistoon ja oletusarvo suoritettaessa testejä on `output.xml`.

Tulostiedostot on mahdollista poistaa käytöstä käyttämällä erikoisarvoa NONE. Jos tulostiedostoja ei tarvita, voi ne kaikki otta pois käytöstä esim. komennolla
```bash
robot --output NONE --report NONE --log NONE tests/test1.robot
```

## Lokitiedosto

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

## Raportti

Raportti sisältää yhteenvedon testien suorituksesta HTML-formaatissa. Raporttiin kerätään tilastoja perustuen tageihin ja suoritettuihin testijoukkoihin (test suites) sekä listan kaikista suoritetuista testitapauksista (test cases). Kun sekä raportti ja lokitiedosto generoidaan, raportti sisältää linkkejä lokitiedostoon helpottamaan navigointia ja tarkempien tietojen tutkimista varten. 

Raportista on helppo nähdä koko testin suoritus, koska sen taustaväri on vihreä, jos kaikki testit on suoritettu onnistuneesti (Pass) ja kirkkaan punainen, jos yksikään testeistä ei onnistu (Fail). Taustaväri voi olla myös keltainen, mikä tarkoittaa, että kaikki testi on ohitettu (Skipped).

Komentorivin lisäparametri `--report` tai `-r` määrittelee minne raportti luodaan. Samalla tavalla kuin lokitiedoston kanssa, jos raporttia ei tarvita, voit käyttää lisäparametria `--report NONE`. Oletusarvoisesti raportin nimi on `report.html`.

Lisätietoa: [Report file](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#report-file)

## Debuggaustiedosto

Debuggaustiedostot ovat puhtaita tekstitiedostoja, jotka kirjoitetaan testien suorittamisen aikana. Kaikki testikirjastoista saapuvat viestit, testien aloitus ja lopetushetket ja avainsanat tallennetaan niihin. Debuggaustietoja voidaan käyttää testien suorituksen monitorointiin.

Debuggaustietoja ei luoda, ellei erikseen anneta komentorivillä lisäparametria `--debug_file` tai `-b`.

## Tulostiedostojen aikaleimaus

Kaikki generoidut tulostiedostot voidaan automaattisesti aikaleimata antamalla lisäparametri `timestampoutputs` tai `-T`. Kun tätä parametria käytetään, aikaleima muotoa `YYYYMMDD-hhmmss` lisätään tiedostojen nimeen. Esim. antamalla komento:
```bash
robot --timestampoutputs --log mylog.html --report NONE tests/test1.robot
```
luo seuraavat tulostiedostot:
- `output-20250205-201034.xml` ja
- `mylog-20250205-201034.html`

## Muut parametrit

Robot Frameworkin käyttöoppaan kappaleesta [3.6 Output files](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#output-files) löytyy lisätietoa myös muista lisäparametreista.


HTML-sivujen esikatseluun GitHubissa on muutamia tapoja tarpeidesi mukaan. Seuraavassa on joitakin yleisimpiä menetelmiä:

## 1. Nopea esikatselu
Jos haluat nähdä nopean esikatselun HTML-tiedostosta missä tahansa julkisessa arkistossa, voit käyttää [GitHub HTML Preview][ref1], kolmannen osapuolen palvelua, joka renderöi HTML-tiedoston suoraan GitHubista. Liitä vain `https://htmlpreview.github.io/?` HTML-tiedoston alkuperäisen URL-osoitteen eteen. Voit esimerkiksi esikatsella tätä tiedostoa: 

[https://github.com/qentinelqi/qweb/blob/master/test/resources/alert.html](https://github.com/qentinelqi/qweb/blob/master/test/resources/alert.html)

käyttämällä tätä URL-osoitetta: 

[https://htmlpreview.github.io/?https://github.com/necolas/css3-social-signin-buttons/blob/master/index.html](https://htmlpreview.github.io/?https://github.com/qentinelqi/qweb/blob/master/test/resources/alert.html)

## 2. Projektin HTML-sivut
Jos haluat luoda projektillesi verkkosivun HTML-tiedostojen avulla, voit käyttää [GitHub Pages][ref2] -ominaisuutta, jonka avulla voit isännöidä ja julkaista verkkosivuja GitHubin kautta. 

Käyttääksesi GitHub Pagesia sinun täytyy luoda erityinen haara nimeltä `gh-pages` arkistoosi ja työntää HTML-tiedostosi tähän haaraan. Sen jälkeen voit tarkastella verkkosivujasi osoitteessa `http://username.github.io/repo`, jossa `username` on GitHub-käyttäjätunnuksesi ja `repo` on arkistosi nimi.

## 3. HTML-tiedostojen esikatselu paikallisesti
Jos haluat esikatsella HTML-tiedostoja paikallisella koneellasi, voit kloonata arkiston ja avata HTML-tiedostot selaimellasi. Jos haluat kloonata arkistosi, sinun on asennettava [Git](https://git-scm.com/) ja ajettava tämä komento päätelaitteessa: 

`git clone https://github.com/username/repo.git`, jossa 

- `käyttäjätunnus` on GitHub-käyttäjätunnuksesi ja
- `repo` on arkistosi nimi.

Sen jälkeen voit siirtyä kansioon, johon kloonasit arkistosi, ja avata HTML-tiedostot selaimellasi.

Lähde: Keskustelu Bingin kanssa, 2/4/2024

[ref1]: https://htmlpreview.github.io/ "GitHub HTML Preview"
[ref2]: https://docs.github.com/pages/quickstart "Quickstart for Github Pages - Github Docs"
