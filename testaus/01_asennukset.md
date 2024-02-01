# 01_asennukset

## Tavoite
Tavoitteena on asentaa projektissa käytettävät automaatiotestaustyökalut.
## Taustaa
Tulemme käyttämään kurssilla seuraavia työkaluja:
- [Robot Framework](https://robotframework.org/) - yleiskäyttöinen avoimeen lähdekoodiin perustuva automaatiokehys. Sitä voidaan käyttää testiautomaatiossa ja RPA-tehtävissä.
- [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/) - verkkosovellusten testaamisen tarkoitettu lisätyökalu, käytetään Robot Frameworkin yhteydessä
- Selainajurit - tarvittaessa asennetaan testiautomaatiossa tarvittavat selainajurit
- [QWeb](https://pypi.org/project/QWeb/) - Robot Framework lisäkirjasto, joka on tarkoitettu erityisesti verkkosovellusten testaamiseen
- [Cucumber](https://cucumber.io/) - työkalu käytttäytymiseen perustuvien (BDD) automaatiotestien suunnitteluun ja toteuttamiseen
- [Gherkin](https://cucumber.io/docs/gherkin/) - Cucumberin yhteydessä käytettävä tapa kirjoittaa BDD-testejä

## Asennukset
### pip päivitys
  Ensimmäiseksi kannattaa tarkistaa, että pip on päivitetty viimeisimpään versioon. Tämän voi tehdä ajamalla komentorivillä seuraavan komennon:
```bash
python.exe -m pip install --upgrade pip
```
### Robot Framework asennus
Seuraavaksi asennetaan Robot Framework. Anna seuraavaksi komentorivillä seuraava komento:
````bash
pip install robotframework
```
Testaa, että asennus on onnistunut antamalla komentorivillä seuraava komento:
```bash
robot --version
```
### SeleniumLibrary asennus
SeleniumLibrary asennetaan samalla tavalla antamalla komentorivillä seuraava komento:
```bash
pip install --upgrade robotframework-seleniumlibrary
```
Voit tarkistaa, löytyykö asennus antamalla komennon:
```bash
pip list
```
Listasta pitäisi löytyä (esim.):
```bash
Package                         Version
------------------------------- ---------------
...
robotframework                  7.0
robotframework-assertion-engine 3.0.3
robotframework-browser          18.0.0
robotframework-debuglibrary     2.3.0
robotframework-pythonlibcore    4.3.0
robotframework-requests         0.9.6
robotframework-seleniumlibrary  6.2.0
...
```
### Selainajurien asennus
`SeleniumLibrary` asentamisen jälkeen on vielä asennettava selain- ja käyttöjärjestelmäkohtaiset selainohjaimet selaimille. Nämä ovat samat ohjaimet, joita käytetään Seleniumin kanssa. Selenium 4.10.0 selainajurit voidaan ladata ja asentaa automaattisesti Selenium Managerin avulla.

Tarvittaessa voit asentaa selainajurit manuaalisesti. Tässä on linkit yleisimpiin selainajureihin:
- Chrome:	https://chromedriver.chromium.org/downloads
- Edge:	https://developer.microsoft.com/en-us/microsoft-edge/tools/webdriver/
- Firefox:	https://github.com/mozilla/geckodriver/releases
- Safari:	https://webkit.org/blog/6900/webdriver-support-in-safari-10/

Lisätietoa aiheesta löytyy sivulta: https://www.selenium.dev/selenium/docs/api/py/index.html#drivers

