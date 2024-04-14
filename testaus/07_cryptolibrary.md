# 07. CryptoLibrary

## Johdanto

[CryptoLibrary](https://pypi.org/project/robotframework-crypto/) on Python-kirjasto salasanojen turvalliseen käsittelyyn. CryptoLibrary käyttää [epäsymmetristä elliptistä salausta](https://en.wikipedia.org/wiki/Elliptic-curve_cryptography) luottamuksellisten tietojen turvalliseen tallentamiseen. 

Avainparit (yksityinen ja julkinen avain) luodaan testiympäristöä varten komennolla `CryptoLibrary`. Avainparin julkista avainta (public key) käytetään salaamaan kaikki luottamuksellinen tieto, joita ei haluta julkisiksi (salasanat, henkilökohtaiset tiedot jne.) ja yksityisellä avaimella (private key) avataan salattu data.

Komennolla `CryptoClient` salataan tietoja. Salatut tiedot näyttävät esim. tältä:
`crypt:tIdr5s65+ggfJZl46pJgljioCUePUdZLozgiwquznw+xSlmzT3dcvfrTL9wIdRwmNOJuONT7FBW5`. 

Salattu tieto voidaan purkaa Robot Frameworkin CryptoLibraryn avulla.

Lisätietoa:
- [Protect your test data with Robot Framework CryptoLibrary](https://michaelhallik.github.io/blog/2021/11/24/Robot-Framework-Crypto-Library)
- [Robot Framework CryptoLibrary | pypi.org](https://pypi.org/project/robotframework-crypto/)

## Asennus
Asenna CryptoLibrary antamalla komento:
```bash
pip install --upgrade robotframework-crypto
```
## Salausavainten generointi
Aloita CryptoLibraryn käyttö antamalla komento: 
```bash
python -m CryptoLibrary
```
Generoi avaimet valitsemalla:
- `Open config` -> `Configure key pair`-> `Generate key pair`.

Kaksi avainta ja salasana on nyt luotu ja kirjoitettu levylle:
- `Password_hash.json` -tiedosto, joka sisältää yksityisen avaimen suojaavan (hashed) salasanan.
- `private_key.json` -tiedosto, joka sisältää (AES-salatun) yksityisen avaimen.
- `public_key.key`-tiedosto, joka sisältää julkisen avaimen.

Konsoli tulostaa lisäksi polun mistä tiedostot löytyvät. Lopuksi myös julkinen avain tulostetaan konsoliin. Pidä kaikki avaimet tallessa.

Yksityistä avainta tarvitaan arvojen purkamiseen testipalvelimella. Se on kopioitava manuaalisesti tai lisättävä komentorivikäyttöliittymän (CLI) kautta.

## Tietojen salaaminen
Tiedot salataan käyttämällä CryptoClient työkalua. Anna komento:
```bash
python -m CryptoClient
```
Valitse `Encrypt` -> `Enter the password to encrypt` ja kirjoita salattava tieto. Kopioi salattu tieto osaksi koodia. Muista kopioida myös teksti `crypt:`.

## CryptoLibraryn käyttö testeissä
Ohessa on esimerkki, jossa on salattu sekä käyttäjätunnus että salasana. Kun testi ajetaan, molempien muuttujien salaus puretaan ja tiedot syötetään normaalisti verkkosovelluksen kenttiin. Jos argumentti `variable_decryption=True`, kaikki testisarjan tai testitapauksen yhteydessä käytettävissä olevat muuttujat, jotka sisältävät salattua tekstiä, puretaan automaattisesti. Huomaa kuitenkin, että lokitiedostossa kaikki puretut tekstit korvataan merkkijonolla `***`.

```robotframework
*** Settings ***
Library     Browser    auto_closing_level=SUITE
Library     CryptoLibrary    variable_decryption=True

*** Variables ***
${Username}    crypt:cmypu/F5B/bS1ne9tlocGDZBdgh3ZY4tSDRmUFv2NlX5bYTrvJ+uLK960DEP78zU7PNb30ZF/GgKROT4nOUwXQSJe6M=
${Password}    crypt:X1lHMoitGdxBPfGRoLsiGfgIRYnVLOyBU0TX8GCGFU8hYGGXIYOgTE2Excy3moGUWJaw+iV59NBxpUsx 
${Message}     Hello, Robot Framework!\nHow are you today?

*** Test Cases ***
Test Web Form
    New Browser    chromium    headless=No
    New Context    viewport={'width': 800, 'height': 600}
    New Page    https://www.selenium.dev/selenium/web/web-form.html 
    Get Title    ==    Web form  
    Type Text    [name="my-text"]    ${Username}    delay=0.1 s 
    Type Secret    [name="my-password"]    $Password    delay=0.1 s
    Type Text    [name="my-textarea"]    ${Message}    delay=0.1 s
    Click With Options    button    delay=2 s
    Get Text    id=message    ==    Received!
    Sleep    2.0 s
```
Ohessa on esimerkki lokitiedoston (log.html) sisällöstä:
```
KEYWORD Browser . Type Text   [name="my-text"]    ${Username}    delay=0.1 s
Documentation:	Types the given txt into the text field found by selector.
...
10:11:54.407	INFO	Types the text '***' in the given field.
```
