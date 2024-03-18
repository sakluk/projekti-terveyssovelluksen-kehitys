# 01. Robot Frameworkin ja lisäosien asennukset

## Tavoite
Tavoitteena on asentaa projektissa käytettävä Robot Framework automaatiotestaustyökalu ja sen lisäosat.
## Taustaa
Tulemme käyttämään kurssilla seuraavia työkaluja:
- [Robot Framework](https://robotframework.org/) - yleiskäyttöinen avoimeen lähdekoodiin perustuva automaatiokehys. Sitä voidaan käyttää testiautomaatiossa ja RPA-tehtävissä.
- [Browser library](https://robotframework-browser.org/) - moderni vaihtoehto verkkosovellusten testaamisen. Lisäkirjasto Robot Frameworkiin
- [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/) - verkkosovellusten testaamisen tarkoitettu klassinen lisätyökalu, käytetään Robot Frameworkin yhteydessä
- Selainajurit - tarvittaessa asennetaan testiautomaatiossa tarvittavat selainajurit
- [QWeb](https://pypi.org/project/QWeb/) - Robot Framework lisäkirjasto, joka on tarkoitettu erityisesti verkkosovellusten testaamiseen. Voidaan käyttää SeleniumLibraryn kanssa.

## Tehtävä
### pip päivitys
  Ensimmäiseksi kannattaa tarkistaa, että pip on päivitetty viimeisimpään versioon. Tämän voi tehdä ajamalla komentorivillä seuraavan komennon:
```bash
python.exe -m pip install --upgrade pip
```
### Robot Framework asennus
Seuraavaksi asennetaan Robot Framework. Anna seuraavaksi komentorivillä seuraava komento:
```bash
pip install robotframework
```
Testaa, että asennus on onnistunut antamalla komentorivillä seuraava komento:
```bash
robot --version
```
Tarkemmat ohjeet: [User Guide | (robotframework.org)](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#installing-using-pip)

### Browser library asennus
Browser library tarvitsee toimiakseen sekä Pythonin että Node.JS asennukset. Tarkista ensiksi, että sinulla on molemmat asennettuina.

Browser library voidaan asentaa joko selainajurien kanssa tai erikseen. Ohessa on ohjeet kuinka voit asentaa Browser libraryn selainajurien kanssa. Tällöin ei välttämättä tarvitse tehdä selainajurien asennuksia erikseen:

Asenna kirjasto ja selainajurit:
> pip install robotframework-browser

Alusta kirjaston toiminta:
> rfbrowser init

Tarkemmat ohjeet: [Installation | robotframework-browser.org](https://robotframework-browser.org/#installation)

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
Tarkemmat ohjeet: [SeleniumLibrary | (robotframework.org)](https://robotframework.org/SeleniumLibrary/)

### Selainajurien asennus
`SeleniumLibrary` asentamisen jälkeen on vielä asennettava selain- ja käyttöjärjestelmäkohtaiset selainohjaimet selaimille. Nämä ovat samat ohjaimet, joita käytetään Seleniumin kanssa. Selenium 4.10.0 selainajurit voidaan ladata ja asentaa automaattisesti Selenium Managerin avulla.

Tarvittaessa voit asentaa selainajurit manuaalisesti. Tässä on linkit yleisimpiin selainajureihin:
- Chrome:	https://chromedriver.chromium.org/downloads
- Edge:	https://developer.microsoft.com/en-us/microsoft-edge/tools/webdriver/
- Firefox:	https://github.com/mozilla/geckodriver/releases
- Safari:	https://webkit.org/blog/6900/webdriver-support-in-safari-10/

Lisätietoa aiheesta: 
- [Installation - SeleniumLibrary | (robotframework.org)](https://robotframework.org/SeleniumLibrary/#installation)
- [Installation - SeleniumLibrary | (github.com)](https://github.com/robotframework/SeleniumLibrary?tab=readme-ov-file#installation)

### Selainajurien testaaminen
Testaa selainajurien toiminta avaamalla Python IDE (esim. PyCharm tai VSCode) ja aja seuraavat Python-koodit:
#### Firefox
```Python
from selenium import webdriver
try:
    browser = webdriver.Firefox()
    browser.get('http://selenium.dev/')
except Exception as e:
    print(e)
```
#### Edge
```Python
from selenium import webdriver
try:
    browser = webdriver.Edge()
    browser.get('http://selenium.dev/')
except Exception as e:
    print(e)
```
#### Chrome
```Python
from selenium import webdriver
try:
    browser = webdriver.Chrome()
    browser.get('http://selenium.dev/')
except Exception as e:
    print(e)
```
### QWeb asennus
Asenna QWeb suorittamalla oheinen koodi komentoikkunassa:
```bash
pip install Qweb
```
Tarkista seuraavalla komennolla, että Qweb löytyy listalta:
```bash
pip list
```
Listasta pitää löytyä (esim.)
```bash
...
QWeb                            3.1.0
...
```
Tarkemmat ohjeet:
- [Qweb Installation | (pypi.org)](https://pypi.org/project/QWeb/#installation) 
### Testaa Qweb:n toiminta
Tee tiedosto `qweb_test.robot` ja kopioi sinne seuraava teksti. Tiedosto pitää löytyä samasta hakemistosta kuin missä annetaan `robot` komento (ks. seuraava kohta).
```
*** Settings ***
Library    QWeb     # Import library

*** Test Cases ***
Basic interaction
    OpenBrowser         https://qentinelqi.github.io/shop      firefox  # Avaa Firefox ja url
    VerifyText          The animal friendly clothing company            # Tarkista sivun otsikko
    ClickText           Scar the Lion                                   # Klikkaa tekstilinkiä: Scar the Lion
    ClickText           Add to cart                                     # Klikkaa nappulaa (Button): Add to cart
    DropDown            Size            Large                           # Valitse (Large) alasvetovalikosta (Size)
```
Sitten testaa Qwebin toiminta antamalla seuraava komento komentoikkunaan:
```bash
robot qweb_test.robot
```
Huomaa, että `qweb_test.robot` tiedosto pitää löytyä hakemistosta, jossa tämä komento suoritetaan.

Lisätietoa:
- [Basic Usage - Qweb | (pypi.org)](https://pypi.org/project/QWeb/#usage)


