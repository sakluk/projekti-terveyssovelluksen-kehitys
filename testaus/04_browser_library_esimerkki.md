# 04. Browser library esimerkki

Tämän ohjeen tarkoitus on esitellä perusesimerkki, kuinka ottaa yhteys verkkosovellukseen ja käyttää resurssitiedostoja piilottamaan kirjautumissalasana. Tämä esimerkki on jatkokehitetty versio [Browser Libraryn 3. esimerkistä](https://robotframework-browser.org/#examples).

Avaa uusi tiedosto, nimeä se `Keywords.robot` ja kirjoita tiedostoon seuraavat rivit

```robotframework
*** Variables ***
${Username}     somebody@example.com
${Password}     SuperSecret!
${Message}      Hello, Robot Framework!\nHow are you today?
```

Tee toinen tiedosto, nimeä se `browser_demo.robot` ja kopioi seuraavat rivit

```robotframework
*** Settings ***
Library     Browser    auto_closing_level=KEEP
Resource    Keywords.robot  

*** Test Cases ***
Test Web Form
    New Browser    chromium    headless=No  
    New Page    https://www.selenium.dev/selenium/web/web-form.html 
#    Set Browser Timeout    10 sec  
    Get Title    ==    Web form  
    Type Text    [name="my-text"]    ${Username}    delay=0.1 s 
    Type Secret    [name="my-password"]    $Password    delay=0.1 s
    Type Text    [name="my-textarea"]    ${Message}    delay=0.1 s
    Click With Options    button    delay=2 s
    Get Text    id=message    ==    Received!
```

Tämä koodi suorittaa testin Chromium-selaimella, avaa selaimen, lataa lomakkeen, täyttää kentät ja lähettää lomakkeen. Lopuksi tarkistetaan, että lomakkeen lähettäminen onnistui. Tässä on vielä lyhyet selitykset koodiriveille:

- ```Library     Browser    auto_closing_level=KEEP``` määrittää, että selain pysyy auki testin jälkeen.
- ```Resource    Keywords.robot``` viittaa ulkoiseen tiedostoon, joka sisältää määriteltyjä avainsanoja.
- ```New Browser    chromium    headless=No```  avaa uuden Chromium-selaimen ei-headless-tilassa, jolloin selainikkuna näkyy.
- ```New Page    https://www.selenium.dev/selenium/web/web-form.html```  avaa uuden välilehden ja lataa annetun URL-osoitteen.
- ```#Set Browser Timeout    10 sec```  asettaa aikakatkaisun selaimelle, mutta tämä rivi on kommentoitu pois (#).
- ```Get Title    ==    Web form```  tarkistaa, että sivun otsikko on "Web form".
- ```Type Text    [name="my-text"]    ${Username}    delay=0.1 s```  kirjoittaa tekstin nimellä "my-text" olevaan kenttään viiveellä.
- ```Type Secret    [name="my-password"]    $Password    delay=0.1 s```  kirjoittaa salasanan nimellä "my-password" olevaan kenttään viiveellä.
- ```Type Text    [name="my-textarea"]    ${Message}    delay=0.1 s```  kirjoittaa viestin nimellä "my-textarea" olevaan kenttään viiveellä.
- ```Click With Options    button    delay=2 s```  klikkaa nappia viiveellä.
- ```Get Text    id=message    ==    Received!```  tarkistaa, että elementin, jonka id on "message", teksti on "Received!".

Aja testi antamalla terminaalissa komento
```Bash
robot browser_demo.robot
```
