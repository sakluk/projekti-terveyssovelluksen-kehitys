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

**Huom!** Robot Frameworkin kanssa verkkosovellusten testaamisessa käytetään usein [SeleniumLibrarya](https://robotframework.org/SeleniumLibrary/). Se on vanhempi lisäkirjasto kuin `Browser Library` ja siihen löytyy erittäin hyvin esimerkkejä. Käytämme kuitenkin tällä kurssilla `Browser Librarya`. Jos tahdot kokeilla `SeleniumLibrarya`, asentamisen jälkeen on vielä asennettava selain- ja käyttöjärjestelmäkohtaiset [selainohjaimet](https://robotframework.org/SeleniumLibrary/#browser-drivers) selaimille. 

**Huom!** Kolmas verkkosovellusten testaamiseen soveltuva lisätyökalu on [QWeb](https://pypi.org/project/QWeb/). Sitä käytetään SeleniumLibraryn kanssa. QWeb vaatii toimiakseen Python version väliltä 3.8-3.11.

## Asennusohjeet

Seuraavissa ohjeissa oletetaan, että käytät sovelluskehitykseen [Visual Studio Codea](https://code.visualstudio.com/) (VSCode). Tehtävät suoritetaan käyttäen VSCoden käyttöliittymää, työkaluja ja VSCoden terminaali-ikkunaa. Jos käytät sovelluskehitykseen esim. [JetBrains IDE](https://www.jetbrains.com/ides/) (mm. PyCharm), joudut soveltamaan ohjeita ympäristön mukaan.

Samoin oletetaan, että olet aiemmassa jaksossa suorittanut Web-sovelluskehitys-kurssin, käytössäsi on terveyspäiväkirja-web-sovelluksen koodit sekä Github-kansio. Tavoitteena on, että oheinen asennus ja testit suoritetaan omalle terveyspäiväkirja-web-sovellukselle ja käyttäen sovelluksen projektihakemistoa.

### 1. Avaa projekti ja luo testaus-kansio

1. Avaa sovelluksesi projektikansio (File > Open Folder) VSCodessa.
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
2. Luo uusi Python-kooditiedosto nimeltä: `asennustesti.py`.
3. Kirjoita tiedostoon seuraava koodi:
```python
import sys
print('Python:', sys.version)
```
4. Suorita koodi. Terminaalissa pitäisi tuloksena näkyä, esim.
```
Python: 3.11.2 (tags/v3.11.2:878ead1, Feb  7 2023, 16:38:35) [MSC v.1934 64 bit (AMD64)]
```

Toinen tapa tarkistaa Python asennus on antaa Python versiokomento VSCoden terminaalissa (=komentorivi ikkuna).

5. Avaa VSCoden terminaali-ikkuna (Terminal > New Terminal).
6. Kirjota terminaaliin komento:  
    **Windows:**
    ```bash
    py --version
    ```
    **MacOS tai Linux:**
    ```bash
    python --version
    ```
Terminaali-ikkunaan tulostuu, esim.
```bash
Python 3.11.2
```

Ongelmia? Katso, esim.
- [Python Tutorial | VSCode docs](https://code.visualstudio.com/docs/python/python-tutorial)

### 3. pip päivitys
Seuraavaksi kannattaa tarkistaa, että Python-pakettien asentaja (pip), on päivitetty viimeisimpään versioon. 
1. Avaa VSCodessa terminaali-ikkuna (View > Terminal).
2. Anna terminaalissa komento:

    **Windows:**  
    ```bash
    py -m pip install --upgrade pip
    ```
    **MacOS tai Linux:**  
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
Lisätietoa: [Should I use pip or pip3 | Stackoverflow](https://stackoverflow.com/questions/61664673/should-i-use-pip-or-pip3)

2. Testaa, että asennus on onnistunut antamalla komentorivillä seuraava komento:
    ```bash
    robot --version
    ```
    Huom! Jos koneesi ei tunnista `robot` komentoa, kokeile:
    ```bash
    py -m robot --version
    ```
Lisätietoa: [User Guide | (robotframework.org)](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#installing-using-pip)

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
Tarkemmat ohjeet: [Installation | robotframework-browser.org](https://robotframework-browser.org/#installation)

### 5. Requests libraryn asennus
Anna terminaali-ikkunassa komento:
    ```bash
    pip install robotframework-requests
    ```
Ongelmia? Katso [RequestsLibrary - Readme](https://github.com/MarketSquare/robotframework-requests#readme)

### 6. Cryptolibraryn asennus
Asenna CryptoLibrary antamalla komento:
```bash
pip install --upgrade robotframework-crypto
```
Lisätietoa: [Robot Framework CryptoLibrary | pypi.org](https://pypi.org/project/robotframework-crypto/)

### 7. Robotidyn asennus
Asenna Robotidy antamalla komento:
```bash
pip install robotframework-tidy
```

### 8. Asennuslistan tarkistus
Anna terminaalissa komento:
```bash
pip list
```
Tarkista, että listasta löytyvät seuraavat modulit:
```
robotframework                  7.0
robotframework-browser          18.2.0
robotframework-crypto           0.3.0
robotframework-requests         0.9.6
robotframework-tidy             4.11.0
```
Huom. Versionumerot saattavat olla eri.

### 9. Asennusten testaus
Kopioi [asennustesti.py](asennustesti.py) tiedosto `testaus`-kansioon ja aja se. Jos asennukset ovat kunnossa, tuloksena terminaali-ikkunaan tulostuu, esim.
```
Python: 3.11.2 (tags/v3.11.2:878ead1, Feb  7 2023, 16:38:35) [MSC v.1934 64 bit (AMD64)]
Robot Framework: 7.0
Browser: 18.2.0
requests: 2.31.0
CryptoLibrary: 0.3.0
```

