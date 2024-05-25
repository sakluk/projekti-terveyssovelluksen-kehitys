# 01. Robot Frameworkin ja lisäosien asennukset

## Tavoite
Tavoitteena on asentaa projektissa käytettävä Robot Framework automaatiotestaustyökalu ja sen lisäosat.

## Taustaa
Tulemme käyttämään kurssilla seuraavia työkaluja:
- [Robot Framework](https://robotframework.org/) - yleiskäyttöinen avoimeen lähdekoodiin perustuva automaatiokehys. Sitä voidaan käyttää testiautomaatiossa ja RPA-tehtävissä.
- [Browser library](https://robotframework-browser.org/) - moderni vaihtoehto verkkosovellusten testaamisen. Lisäkirjasto Robot Frameworkiin.
- [Requests library](https://github.com/MarketSquare/robotframework-requests#readme) - Taustapalvelimen HTTP API testaamiseen. Lisäkirjasto Robot Frameworkiin.
- [CryptoLibrary](https://pypi.org/project/robotframework-crypto/) - Python-lisäkirjasto salasanojen turvalliseen käsittelyyn.
- [Robotidy](https://robotidy.readthedocs.io/en/stable/index.html) - työkalu, joka automaattisesti muotoilee Robot Framework koodit.

**Huom!** Verkkosovellusten testaamisessa käytetään usein [SeleniumLibrarya](https://robotframework.org/SeleniumLibrary/). Se on vanhempi lisäkirjasto kuin `Browser Library` ja siihen löytyy erittäin hyvin esimerkkejä. `SeleniumLibraryn` asentamisen jälkeen on vielä asennettava selain- ja käyttöjärjestelmäkohtaiset [selainohjaimet](https://robotframework.org/SeleniumLibrary/#browser-drivers) selaimille. Päälisätyökalu verkkosovelluksen käyttöliittymän testaamiseen tällä kurssilla on kuitenkin `Browser Library`.

**Huom 2!** Kolmas verkkosovellusten testaamiseen soveltuva lisätyökalu on [QWeb](https://pypi.org/project/QWeb/). Sitä käytetään SeleniumLibraryn kanssa. QWeb vaatii toimiakseen Python version väliltä 3.8-3.11.

## Asennusohjeet

Seuraavissa ohjeissa oletetaan, että käytät sovelluskehitykseen [Visual Studio Codea](https://code.visualstudio.com/) (VSCode). Tehtävät suoritetaan käyttäen VSCoden käyttöliittymää ja työkaluja. Jos käytät sovelluskehitykseen esim. [JetBrains IDE](https://www.jetbrains.com/ides/) (mm. PyCharm), joudut soveltamaan ohjeita ympäristön mukaan.

Samoin oletetaan, että olet aiemmassa jaksossa suorittanut Web-sovelluskehitys-kurssin, käytössäsi on terveyspäiväkirja-web-sovelluksen koodit sekä Github-kansio. 

Tavoitteena on, että oheinen asennus ja testit suoritetaan omalle terveyspäiväkirja-web-sovellukselle.

### 1. Avaa projekti ja luo testaus-kansio

1. Avaa projektikansiosi (File > Open Folder) VSCodessa.
2. Lisää projektin juurihakemistoon alihakemisto nimeltä: `testaus`.
3. Lisää `testaus` hakemiston alle kaksi alihakemistoa: `gui` ja `server`. 

Näitä uusia kansioita käytetään ohjelmistotestauksen opetteluun. Myöhemmin tulette ryhmänne kanssa tekemään samanlaisen kansiorakenteen omalle terveyssovelluksellenne. Projektin kansiorakenne tulee näyttää seuraavanlaiselta:
```
oman-projektin-nimi
   > front
   > back
   > testaus
      > gui
      > server
``` 

### 2. Python-testi
Testaa ensiksi, että Python-asennus on kunnossa.

1. VSCodessa valitse `testaus` -kansio.
2. Luo uusi Python-kooditiedosto nimeltä: `asennustesti_01.py`.
3. Kirjoita tiedostoon seuraava koodi:
```python
import sys
print('Python:', sys.version)
```
4. Suorita koodi. Terminaalissa pitäisi tuloksena näkyä, esim.
```
Python: 3.11.2 (tags/v3.11.2:878ead1, Feb  7 2023, 16:38:35) [MSC v.1934 64 bit (AMD64)]
```
Ongelmia? Katso, esim.
- [Python Tutorial | VSCode docs](https://code.visualstudio.com/docs/python/python-tutorial)

### 3. pip päivitys
Seuraavaksi kannattaa tarkistaa, että Python-pakettien asentaja (pip), on päivitetty viimeisimpään versioon. 
1. Avaa VSCodessa terminaali-ikkuna (View > Terminal).
2. Anna terminaalissa komento:
**Windows**  
```bash
py -m pip install --upgrade pip
```
**MacOS**  
```bash
python -m pip install --upgrade pip
```
**Linux**  
```bash
python -m pip install --upgrade pip
```
Ongelmia? Katso, esim.
- [Installation | pip documentation](https://pip.pypa.io/en/stable/installation/)
- [Getting started | pip documentation](https://pip.pypa.io/en/stable/getting-started/)

### 3. Robot Framework asennus
Kun Python ja pip on asennettu ja päivitetty, seuraavaksi asennetaan Robot Framework. 

1. Kirjoita VSCoden terminaali-ikkunaan seuraava komento:
```bash
pip install robotframework
```
Huom! Jos koneesi ei tunnista `pip` komentoa, kirjoita sen sijaan: 
```bash
py -m pip install robotframework
``` 
Lisätietoa: 
- [Should I use pip or pip3 | Stackoverflow](https://stackoverflow.com/questions/61664673/should-i-use-pip-or-pip3)

Testaa, että asennus on onnistunut antamalla komentorivillä seuraava komento:
```bash
robot --version
```
Huom! Jos koneesi ei tunnista `robot` komentoa, kokeile:
```bash
py -m robot --version
```
Lisätietoa:
- [User Guide | (robotframework.org)](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#installing-using-pip)

### 4. Browser library asennus
Browser library tarvitsee toimiakseen sekä Pythonin että Node.JS asennukset. Tarkista ensiksi, että sinulla on molemmat asennettuina.

Browser library voidaan asentaa joko selainajurien kanssa tai erikseen. Suositeltavaa on asentaa selainajureiden kanssa. Ohessa on ohjeet kuinka voit Browser library asennetaan selainajurien kanssa.

1. Avaa VSCodessa terminaali-ikkuna.
2. Asenna Browser library -kirjasto ja selainajurit antamalla komento:
```bash
pip install robotframework-browser
```
3. Alusta kirjaston toiminta:
```bash
rfbrowser init
```
Jos `rfbrowser` komentoa ei löydy, kokeile 
```bash
py -m Browser.entry init
```
Tarkemmat ohjeet: 
- [Installation | robotframework-browser.org](https://robotframework-browser.org/#installation)

### 5. Requests libraryn asennus
Anna terminaali-ikkunassa komento (Python 3.8+):
```bash
pip install robotframework-requests --pre
```
Ongelmia? Lisätietoja:
- [RequestsLibrary - Readme](https://github.com/MarketSquare/robotframework-requests#readme)

### 6. Cryptolibraryn asennus
Asenna CryptoLibrary antamalla komento:
```bash
pip install --upgrade robotframework-crypto
```
Lisätietoa:
- [Robot Framework CryptoLibrary | pypi.org](https://pypi.org/project/robotframework-crypto/)

### 7. Robotidyn asennus
Asenna Robotidy antamalla komento:
```bash
pip install robotframework-tidy
```

### 8. Asennusten testaus
Tähän Python-koodi, jolla voidaan testata kaikki asennukset.

----
** TÄSTÄ ETEENPÄIN SIIRRETÄÄN TOISIIN DOKUMENTTEIHIN!!! **

### Browser Libraryn testaaminen
Tallenna seuraava koodi, esim. tekstitiedostoon `demo1.robot`:
```Python
*** Settings ***
Library   Browser

*** Test Cases ***
Example Test
    New Page    https://playwright.dev
    Get Text    h1    contains    Playwright
```
Suorita tämän jälkeen seuraava komento komentoriviltä:
```bash
robot demo1.robot
```
Terminaalissa tulee näkyä seuraavanlainen teksti:
```
==============================================================================
Demo2
==============================================================================
Example Test                                                          | PASS |
------------------------------------------------------------------------------
Demo2                                                                 | PASS |
1 test, 1 passed, 0 failed
==============================================================================
```
Lisäksi samasta kansiosta suorituksen jälkeen tulisi löytyä seuraavat tiedostot:
- log.html
- report.html

Lisää esimerkkejä: [examples | robotframework-browser.org](https://robotframework-browser.org/#examples).

### ROBOTTIDY OHJEET
Robotidya käytetään antamalla hakemisto tai robot-tiedosto:
```bash
robotidy tests
robotidy demo1.robot
```
Pikaohjeet:
```bash
robotidy --help
```
Lisätietoa: [robotidy | readthedocs](https://robotidy.readthedocs.io/en/stable/index.html)

---------------------------------
### SeleniumLibrary asennus (vaihtoehtoinen työkalu)
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
...
robotframework-browser          18.0.0
...
robotframework-seleniumlibrary  6.2.0
...
```
Tarkemmat ohjeet: [SeleniumLibrary | (robotframework.org)](https://robotframework.org/SeleniumLibrary/)

### Selainajurien asennus (vaihtoehtoinen työkalu)


Tarvittaessa voit asentaa selainajurit manuaalisesti. Tässä on linkit yleisimpiin selainajureihin:
- Chrome:	https://chromedriver.chromium.org/downloads
- Edge:	https://developer.microsoft.com/en-us/microsoft-edge/tools/webdriver/
- Firefox:	https://github.com/mozilla/geckodriver/releases
- Safari:	https://webkit.org/blog/6900/webdriver-support-in-safari-10/

Lisätietoa aiheesta: 
- [Installation - SeleniumLibrary | (robotframework.org)](https://robotframework.org/SeleniumLibrary/#installation)
- [Installation - SeleniumLibrary | (github.com)](https://github.com/robotframework/SeleniumLibrary?tab=readme-ov-file#installation)

### Selainajurien testaaminen (vaihtoehtoinen työkalu)
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
### QWeb asennus (vaihtoehtoinen työkalu)
Huomaa, että QWeb vaatii toimiakseen Python version väliltä 3.8-3.11. Tarkista ensiksi Python-versio antamalla komento:
```bash
python --version
```
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


