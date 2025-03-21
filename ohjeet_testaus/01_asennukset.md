# 01. Asennukset

## Tavoite
Tavoitteena on asentaa projektissa käytettävä Robot Framework automaatiotestaustyökalu ja sen lisäosat.

## Taustaa
Tulemme käyttämään kurssilla seuraavia työkaluja:
- [Robot Framework](https://robotframework.org/) - yleiskäyttöinen avoimeen lähdekoodiin perustuva automaatiokehys. Sitä voidaan käyttää testiautomaatiossa ja RPA-tehtävissä.
- [Browser library](https://robotframework-browser.org/) - moderni vaihtoehto verkkosovellusten testaamisen. Lisäkirjasto Robot Frameworkiin.
- [Requests library](https://github.com/MarketSquare/robotframework-requests#readme) - Taustapalvelimen HTTP API testaamiseen. Lisäkirjasto Robot Frameworkiin.
- [CryptoLibrary](https://pypi.org/project/robotframework-crypto/) - Python-lisäkirjasto salasanojen turvalliseen käsittelyyn.
- [Robotidy](https://robotidy.readthedocs.io/en/stable/index.html) - työkalu, joka automaattisesti muotoilee Robot Framework koodit.

-----
**Huom!** 

Robot Frameworkin kanssa verkkosovellusten testaamisessa käytetään usein [SeleniumLibrarya](https://robotframework.org/SeleniumLibrary/). Se on vanhempi lisäkirjasto kuin `BrowserLibrary` ja siihen löytyy erittäin hyvin esimerkkejä. Käytämme kuitenkin tällä kurssilla `BrowserLibrarya`. 

## Asennusohjeet

Seuraavissa ohjeissa oletetaan, että käytät sovelluskehitykseen [Visual Studio Codea](https://code.visualstudio.com/) (VSCode). Tehtävät suoritetaan käyttäen VSCoden käyttöliittymää, työkaluja ja VSCoden terminaali-ikkunaa. Jos käytät sovelluskehitykseen esim. [JetBrains IDE](https://www.jetbrains.com/ides/) (mm. PyCharm), joudut soveltamaan ohjeita ympäristön mukaan.

Samoin oletetaan, että olet aiemmassa jaksossa suorittanut Web-sovelluskehitys-kurssin, käytössäsi on terveyspäiväkirja-web-sovelluksen koodit sekä Github-kansio. Tavoitteena on, että oheinen asennus ja testit suoritetaan omalle terveyspäiväkirja-web-sovellukselle ja käyttäen sovelluksen projektihakemistoa.

### 1. Avaa projekti ja luo testaus-kansio

1. Avaa VSCodessa oman sovelluksesi projektikansio (File > Open Folder).
2. Lisää projektin juurihakemistoon alihakemisto nimeltä: `tests`.
3. Lisää `testaus` hakemiston alle kaksi alihakemistoa: `front` ja `back`. 

Näitä uusia kansioita käytetään ohjelmistotestauksen opetteluun. Myöhemmin tulette ryhmänne kanssa tekemään samanlaisen kansiorakenteen omalle terveyssovelluksellenne. Projektin kansiorakenne tulee näyttämään esim. seuraavanlaiselta:
```
oman-projektin-nimi
   > Frontend/
   > Backend/
   > tests/
   > resources/   
   > outputs/   
``` 
**Huom!** Jos sovelluksesi selain (Frontend) ja taustapalvelin (Backend) ovat erillisiä projekteja, eli sijaitsevat eri kansioissa, tee Python asennukset selaimen (Frontend) alle, esim.
```
selain-projektin-nimi
   > js
   > assets/
   > ...
   > tests/
   > resources/   
   > outputs/   
``` 

Lisätietoa: [Project structure](https://docs.robotframework.org/docs/examples/project_structure)

### 2. Python-testi
Testaa ensiksi, että Python-asennus on kunnossa.

1. Avaa terminaali-ikkuna (CTRL+ö).
2. Anna terminaalissa komento:
```bash
python --version
```
Terminaalissa pitäisi tuloksena näkyä, esim.
```bash
Python: 3.11.2
```
Ongelmia? Katso, esim.
- [Python Tutorial | VSCode docs](https://code.visualstudio.com/docs/python/python-tutorial)

### 3. Virtuaaliympäristön luominen

Python-virtuaaliympäristö auttaa pitämään projektin riippuvuudet erillään muista projekteista. Näin voit helposti hallita ja päivittää projektin riippuvuksia ilman, että se vaikuttaa muihin projekteihin. Virtuaaliympäristö luodaan seuraavasti:

1. Jatka terminaali-ikkunan käyttöä (CTRL+ö tai View > Terminal).
2. Aja seuraava komento:
```bash
python -m venv .venv
```
Tämä luo uuden hakemiston nimeltä `.venv`, joka sisältää virtuaaliympräistön.

3. Aktivoi virtuaaliympäristö antamalla komento
- Windows:
```bash
.venv\Scripts\activate
```
- macOS tai Linux:
```bash
source myenv/bin/activate
```
Kun virtuaaliympäristö on aktivoitu, terminaalin prompt muuttuu ja näyttää, että työskentelet nyt virtuaaliympäristössä.

Voit nyt asentaa projektin riippuvuudet virtuaaliympäristön sisälle.

### 34 Virtuaaliympäristön lisääminen .gitignore -tiedostoon
Jotta virtuaaliympäristön tiedostot eivät kopioituisi GitHub-kansioon, lisää `.gitignore` -tiedostoon seuraava rivi:
```bash
# Lisätään .venv hakemisto .gitignoreen
.venv
```
Tämä estää virtuaaliympäristön kopioinnin, kun julkaiset uuden version koodeistasi GitHubissa.

### 5. pip päivitys
Seuraavaksi kannattaa tarkistaa, että Python-pakettien asentaja (pip), on päivitetty viimeisimpään versioon. Anna terminaalissa komento:
```bash
python -m pip install --upgrade pip
```
Ongelmia? Katso, esim.
- [Installation | pip documentation](https://pip.pypa.io/en/stable/installation/)
- [Getting started | pip documentation](https://pip.pypa.io/en/stable/getting-started/)

### 6. Robot Framework asennus
Kun Python ja pip on asennettu ja päivitetty sekä olet luonut virtuaaliympäristön, seuraavaksi asennetaan Robot Framework. 

1. Kirjoita VSCoden terminaali-ikkunaan seuraava komento:
    ```bash
    pip install robotframework
    ```
    Huom! Jos koneesi ei tunnista `pip` komentoa, kirjoita sen sijaan: 
    ```bash
    python -m pip install robotframework
    ``` 
Lisätietoa: [Should I use pip or pip3 | Stackoverflow](https://stackoverflow.com/questions/61664673/should-i-use-pip-or-pip3)

2. Testaa, että asennus on onnistunut antamalla komentorivillä seuraava komento:
    ```bash
    robot --version
    ```
    Huom! Jos koneesi ei tunnista `robot` komentoa, kokeile:
    ```bash
    python -m robot --version
    ```
Lisätietoa: [User Guide | (robotframework.org)](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#installing-using-pip)

### 7. Browser library asennus
**Huom!** Browser library tarvitsee toimiakseen sekä Pythonin että **Node.JS** asennukset. Tarkista ensiksi, että sinulla on molemmat asennettuina. Anna terminaali-ikkunassa komento:
```bash
node -v
```

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
    python -m Browser.entry init
    ```
Tarkemmat ohjeet: [Installation | robotframework-browser.org](https://robotframework-browser.org/#installation)

### 8. Requests libraryn asennus
Anna terminaali-ikkunassa komento:
```bash
pip install robotframework-requests
```
Ongelmia? Katso [RequestsLibrary - Readme](https://github.com/MarketSquare/robotframework-requests#readme)

### 9. Cryptolibraryn asennus
Asenna CryptoLibrary antamalla komento:
```bash
pip install --upgrade robotframework-crypto
```
Lisätietoa: [Robot Framework CryptoLibrary | pypi.org](https://pypi.org/project/robotframework-crypto/)

### 10. Robotidyn asennus
Asenna Robotidy antamalla komento:
```bash
pip install robotframework-tidy
```
Lisätietoa: [Robotidy documentation](https://robotidy.readthedocs.io/en/stable/index.html)

### 11. Asennuslistan tarkistus
`pip freeze`on komento, joka listaa kaikki nykyisessä Python-ympäristössä asennetut paketit ja niiden versiot. Anna terminaalissa komento:
```bash
pip freeze
```
Tarkista, että listasta löytyvät seuraavat modulit (**Huom. versionumerot voivat olla uudemmat**):
```
...
robotframework==7.2
robotframework-assertion-engine==3.0.3
robotframework-browser==19.3.0
robotframework-crypto==0.4.2
robotframework-pythonlibcore==4.4.1
robotframework-requests==0.9.7
robotframework-tidy==4.16.0         
...
```

### 12. Luo `requirements.txt`-asennuslista
Voit myös ohjata `pip freeze`-komennon luettelon tiedostoon käyttämällä uudelleenohjausta:
```bash
pip freeze > requirements.txt
```
Tämä luo `requirements.txt`-tiedoston, joka sisältää kaikki nykyisessä ympäristössä asennetut paketit ja niiden versiot. Tämän tiedoston avulla voit asentaa samata paketit toisessa ympäristössä käyttämällä seuraavaa komentoa:
```bash
pip install -r requirements.txt
```


### 13. Asennusten testaus
Kopioi [asennustesti.py](../python/asennustesti.py) tiedosto oman projektisi kansioon ja aja se. Jos asennukset ovat kunnossa, tuloksena terminaali-ikkunaan tulostuu, esim.
```
Robot Framework: 7.2
Browser: 19.3.0
requests: 2.32.3
CryptoLibrary: 0.4.2
```
