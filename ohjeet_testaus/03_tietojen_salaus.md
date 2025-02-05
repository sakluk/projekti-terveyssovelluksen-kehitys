# 03. Tietojen salaus ja piilottaminen

Salasanoja ei pidä koskaan kirjoittaa testeihin suoraan seuraavista syistä:

1. Salasanojen kirjoittaminen suoraan koodiin tekee niistä helposti saatavilla olevia kaikille, joilla on pääsy kooditiedostoihin. Tämä lisää riskiä, että salasanat vuotavat ja joutuvat vääriin käsiin.

2. Jos salasanat ovat suoraan koodissa, ne tallentuvat versionhallintajärjestelmään (esim. Git). Tämä tarkoittaa, että kaikki, joilla on pääsy versionhallintaan, voivat nähdä salasanat, ja ne voivat myös jäädä historiaan, vaikka ne poistettaisiin myöhemmin koodista.

3. Salasanojen muuttaminen on vaikeampaa, jos ne on kovakoodattu useisiin tiedostoihin. Yhden keskitetyn `.env`-tiedoston käyttäminen helpottaa salasanojen hallintaa ja päivittämistä.

4.  Eri ympäristöissä (kehitys, testaus, tuotanto) käytetään usein eri salasanoja. `.env`-tiedostojen avulla voit helposti määrittää ympäristökohtaiset asetukset ilman, että sinun tarvitsee muuttaa koodia.

## `.env`-tiedoston käyttö

Käyttämällä `.env`-tiedostoa salasanojen piilottamiseen voit varmistaa, että salasanat pysyvät turvassa ja hallittavissa. `.env`-tiedostoja ei tulisi koskaan lisätä versionhallintaan, vaan ne tulisi pitää paikallisina ja suojattuina. Tässä on esimerkki `.env`-tiedoston käytöstä Robot Framework testauksessa.


1. Luo .env-tiedosto ja lisää siihen salasanat ja muut luottamukselliset tiedot:
```
# .env file
API_KEY=mysecretapikey
BASE_URL=http://localhost:3000
```
2. Asenna python-dotenv-kirjasto, joka mahdollistaa .env-tiedoston lataamisen Pythonissa:
```bash
pip install python-dotenv
```
3. Luo Python-kirjasto, joka lataa .env-tiedoston ja määrittelee muuttujat Robot Frameworkille:
```Python
"""load_env.py"""
import os
from dotenv import load_dotenv

load_dotenv()

API_KEY = os.getenv('API_KEY')
BASE_URL = os.getenv('BASE_URL')
```
4. Käytä Python-kirjastoa Robot Framework -testissä:
```robotframework
*** Settings ***
Documentation     Esimerkki ympäristömuuttujien käytöstä
Library           Collections
Variables         load_env.py

*** Test Cases ***
Example Test Case
    [Documentation]    Esimerkkitapaus, jossa käytetään ympäristömuuttujia
    Log    API Key: ${API_KEY}
    Log    Base URL: ${BASE_URL}
```
Tässä esimerkissä `.env`-tiedosto sisältää salasanat ja muut luottamukselliset tiedot, `load_env.py`-tiedosto lataa nämä tiedot ja tarjoaa ne Robot Framework -testille. Testissä voit sitten käyttää näitä muuttujia ilman, että ne näkyvät suoraan koodissa.

**Huom! Muista lisätä `.env`-tiedosto `.gitignore`-listalle, jotta se ei tallennu GitHub-hakemistoon.**

## Tietojen salaaminen

[CryptoLibrary](https://pypi.org/project/robotframework-crypto/) on Python-kirjasto salasanojen turvalliseen käsittelyyn. CryptoLibrary käyttää [epäsymmetristä elliptistä salausta](https://en.wikipedia.org/wiki/Elliptic-curve_cryptography) luottamuksellisten tietojen turvalliseen tallentamiseen. 

Avainparit (yksityinen ja julkinen avain) luodaan testiympäristöä varten komennolla `CryptoLibrary`. Avainparin julkista avainta (public key) käytetään salaamaan kaikki luottamuksellinen tieto, joita ei haluta julkisiksi (salasanat, henkilökohtaiset tiedot jne.) ja yksityisellä avaimella (private key) avataan salattu data.

Komennolla `CryptoClient` salataan tietoja. Salatut tiedot näyttävät esim. tältä:
`crypt:tIdr5s65+ggfJZl46pJgljioCUePUdZLozgiwquznw+xSlmzT3dcvfrTL9wIdRwmNOJuONT7FBW5`. 

Salattu tieto voidaan purkaa Robot Frameworkin CryptoLibraryn avulla.

Lisätietoa:
- [Protect your test data with Robot Framework CryptoLibrary](https://michaelhallik.github.io/blog/2021/11/24/Robot-Framework-Crypto-Library)
- [Robot Framework CryptoLibrary | pypi.org](https://pypi.org/project/robotframework-crypto/)

### Asennus
Asenna CryptoLibrary antamalla komento:
```bash
pip install --upgrade robotframework-crypto
```
### Salausavainten generointi
Aloita CryptoLibraryn käyttö antamalla komento: 
```bash
python -m CryptoLibrary
```
Generoi avaimet valitsemalla:
- `Open config` -> `Configure key pair`-> `Generate key pair`.

Kaksi avainta ja salasana on nyt luotu ja kirjoitettu levylle:
- `password_hash.json` -tiedosto, joka sisältää yksityisen avaimen suojaavan (hashed) salasanan.
- `private_key.json` -tiedosto, joka sisältää (AES-salatun) yksityisen avaimen.
- `public_key.key`-tiedosto, joka sisältää julkisen avaimen.

Konsoli tulostaa lisäksi polun mistä tiedostot löytyvät, esim. `.venv/site-packages/CryptoLibrary/keys/public_key.key`. Lopuksi myös julkinen avain tulostetaan konsoliin. Pidä kaikki avaimet tallessa.

Yksityistä avainta tarvitaan arvojen purkamiseen testipalvelimella. Se on kopioitava manuaalisesti tai lisättävä komentorivikäyttöliittymän (CLI) kautta.

### Tietojen salaaminen
Tiedot salataan käyttämällä CryptoClient työkalua. Anna komento:
```bash
python -m CryptoClient
```
Valitse `Encrypt` -> `Enter the password to encrypt` ja kirjoita salattava tieto. Kopioi salattu tieto osaksi koodia. Muista kopioida myös teksti `crypt:`.

### Salattujen tietojen käyttö testeissä
Ohessa on esimerkki, jossa on salattu sekä käyttäjätunnus että salasana. Kun testi ajetaan, molempien muuttujien salaus puretaan ja tiedot syötetään normaalisti verkkosovelluksen kenttiin. Jos argumentti `variable_decryption=True`, kaikki testisarjan tai testitapauksen yhteydessä käytettävissä olevat muuttujat, jotka sisältävät salattua tekstiä, puretaan automaattisesti. Huomaa kuitenkin, että lokitiedostossa kaikki puretut tekstit korvataan merkkijonolla `***`.

```robotframework
*** Settings ***
Library     Browser     	    auto_closing_level=SUITE
Library     CryptoLibrary     variable_decryption=True   #Kryptatut muuttujat puretaan automaattisesti

*** Variables ***
${Username}    crypt:vo3X+rL2c/oc6YEZpX2/UI9cCnhCnbTwNWa23KMnA2/T5U0AAEj2U9Dk752O9y2gsR/kUUjfF3RIfqOdmDgRGQ==
${Password}    crypt:Ykew9/KogtKZu+Sju2KRp4q03VK49CLiW2ADwO9YwUv0FTJXSQS18lDZh2Xxo5B7LKc4N6sohur2K5dkY0s= 
${Message}     Hello, Robot Framework!\nHow are you today?

*** Test Cases ***
Test Web Form
    New Browser     chromium    headless=No
    New Context     viewport={'width': 800, 'height': 600}
    New Page        https://www.selenium.dev/selenium/web/web-form.html 
    Get Title       ==    Web form  
    Type Text       [name="my-text"]        ${Username}    delay=0.1 s 
    Type Secret     [name="my-password"]    $Password      delay=0.1 s
    Type Text       [name="my-textarea"]    ${Message}     delay=0.1 s
    Click With Options    button                           delay=2 s
    Get Text        id=message    ==    Received!
    Sleep           2.0 s
```
Ohessa on esimerkki lokitiedoston (`log.html`) sisällöstä:
```
KEYWORD Browser . Type Text   [name="my-text"]    ${Username}    delay=0.1 s
Documentation:	Types the given txt into the text field found by selector.
...
10:11:54.407	INFO	Types the text '***' in the given field.
```
