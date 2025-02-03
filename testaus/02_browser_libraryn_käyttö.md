# 02. Browser libraryn käyttö

## Tausta ja tavoite
Tämän ohjeen tarkoitus on esitellä perusesimerkki, kuinka ottaa yhteys verkkosovellukseen ja käyttää resurssitiedostoja piilottamaan kirjautumissalasana. Tämä esimerkki on jatkokehitetty versio [Browser Libraryn 3. esimerkistä](https://robotframework-browser.org/#examples). Esimerkissä käytetään `Type Secret` avainsanaa piilotettujen käyttäjätietojen syöttämiseen verkkosivulle. Lisäksi opetuksillisista syistä selainikkuna jätetään testin jälkeen auki ja tietojen syöttämiseen on lisätty viiveitä, joita normaaleissa verkkosovellustesteissä ei tarvita. 

Esimerkissä käytetään testisivua: https://www.selenium.dev/selenium/web/web-form.html, mistä löytyy tyypillisimmät verkkosivujen visuaaliset ja interaktiiviset komponentit. Alla on kuvankaappaus testisivusta. 

![Selenium Web Form Example](./kuvat/selenium_web_form.png)<br>
*Kuva 1. Verkkolomake, jota käytetään oheisessa esimerkissä.*


## Keyword - tiedosto
Avaa uusi tiedosto, nimeä se `Keywords.robot` ja kirjoita tiedostoon seuraavat rivit

```robotframework
*** Variables ***
${Username}     somebody@example.com
${Password}     SuperSecret!
${Message}      Hello, Robot Framework!\nHow are you today?
```

## Testitapaus
Tee toinen tiedosto, nimeä se `browser_demo.robot` ja kopioi seuraavat rivit

```robotframework {.line-numbers}
*** Settings ***
Library     Browser    auto_closing_level=KEEP
Resource    Keywords.robot  

*** Test Cases ***
Test Web Form
    New Browser    chromium    headless=No  
    New Page       https://www.selenium.dev/selenium/web/web-form.html 
    Get Title      ==    Web form  
    Type Text      [name="my-text"]        ${Username}    delay=0.1 s 
    Type Secret    [name="my-password"]    $Password      delay=0.1 s
    Type Text      [name="my-textarea"]    ${Message}     delay=0.1 s
    Click With Options    button    delay=2 s
    Get Text       id=message    ==    Received!
```

Tämä koodi suorittaa testin Chromium-selaimella, avaa selaimen, lataa lomakkeen, täyttää kentät ja lähettää lomakkeen. Lopuksi tarkistetaan, että lomakkeen lähettäminen onnistui. Tässä on vielä lyhyet selitykset koodiriveille:

- ```Library     Browser    auto_closing_level=KEEP``` määrittää, että selain pysyy auki testin jälkeen.
- ```Resource    Keywords.robot``` viittaa ulkoiseen tiedostoon, joka sisältää määriteltyjä avainsanoja.
- ```New Browser    chromium    headless=No```  avaa uuden Chromium-selaimen ei-headless-tilassa, jolloin selainikkuna näkyy.
- ```New Page    https://www.selenium.dev/selenium/web/web-form.html```  avaa uuden välilehden ja lataa annetun URL-osoitteen.
- ```Get Title    ==    Web form```  tarkistaa, että sivun otsikko on "Web form".
- ```Type Text    [name="my-text"]    ${Username}    delay=0.1 s```  kirjoittaa tekstin nimellä "my-text" olevaan kenttään viiveellä.
- ```Type Secret    [name="my-password"]    $Password    delay=0.1 s```  kirjoittaa salasanan nimellä "my-password" olevaan kenttään viiveellä. **Huom! Normaali Robot Framework muuttujan käyttö  `${Password}` ei toimi, vaan salasana-muuttuja pitää antaa muodossa `$Password`.**
- ```Type Text    [name="my-textarea"]    ${Message}    delay=0.1 s```  kirjoittaa viestin nimellä "my-textarea" olevaan kenttään viiveellä.
- ```Click With Options    button    delay=2 s```  klikkaa nappia viiveellä.
- ```Get Text    id=message    ==    Received!```  tarkistaa, että elementin, jonka id on "message", teksti on "Received!".
 
## Aja testi
Aja testi antamalla terminaalissa komento
```Bash
robot browser_demo.robot
```

## Esimerkki Moodle-kirjautuminen

Joskus kirjautumisprosessi voi olla monivaiheinen. Esimerkiksi [moodle.metropolia.fi](https://moodle.metropolia.fi)-sivulla pitää ensiksi valita "Kirjaudu" -linkki, jonka jälkeen pääsee valitsemaan kirjautumistavan (Metropolia, Haka tunnus, Paikallinen tunnus). Vasta tämän jälkeen aukeaa kirjautumissivu. Kirjautumissivulla on oletuskirjautumiskentät (username, password), joihin syötetään käyttäjänimi ja salasana. Nämä on tallennettu ``Keywords.robot`-tiedostoon. Oman sovelluksesi kirjautumissivu voi vaatia ensiksi jonkin elementin valitsemista. 

![Moodle etusivu ja Kirjaudu nappula](./kuvat/moodle_aloitussivu.png)<br>
*Kuva 2. Moodlen etusivun oikeassa ylänurkasta löytyy linkki: Kirjaudu.*

Tässä esimerkkikoodi [moodle.robot](./robot/moodle.robot). Huomaa, että esimerkissä on käytetty `Click with Options` hidastamaan toimintaa, jotta näet mitä eri sivuilla tapahtuu. Omissa testeissäsi voit poistaa nämä hidasteet ja käyttää suoraan `Click`-avainsanaa.

```robotframework
*** Settings ***
Library     Browser    auto_closing_level=KEEP
Resource    Keywords.robot

*** Test Cases ***
Login to Moodle
    New Browser    chromium    headless=No
    New Page    https://moodle.metropolia.fi

    # Hae sivun otsikko ja tarkista, että se on odotettu
    ${PageTitle}=  Get Title 
    Should Be Equal As Strings    ${PageTitle}    Etusivu | Moodle 
    
    # Hae elementti kirjautumispainikkeelle ja napsauta sitä
    ${kirjaudu}=    Get Element    xpath=(//a[@href='https://moodle.metropolia.fi/login/index.php' and text()='Kirjaudu'])[1]
    Click with Options    ${kirjaudu}    delay=3 s

    # Etsi elementti <div class="text_to_html">Metropolia</div> perusteella
    ${metropolia}=    Get Element    xpath=//div[@class='text_to_html' and text()='Metropolia']
    Click with Options    ${metropolia}    delay=3 s

    # Kirjoita käyttäjätunnus ja salasana
    Type Text    id=username    ${Username}     # Huom: ${Username} on muuttuja tiedostosta Keywords.robot
    Type Secret  id=password    $Password       # Huom: $Password on muuttuja tiedostosta Keywords.robot
    
    # Seuraavaksi olisi kirjautumispainikkeen napsauttaminen
     Click with Options   "Login"   delay= 5 s     # Tämä epäonnistuu, mutta se on ok, koska meillä ei ole oikeaa Moodle-tiliä
```

## Lisätietoa
- [Browser library homepage](https://robotframework-browser.org/)
- [Browser library at GitHub](https://github.com/MarketSquare/robotframework-browser)

### Avainsanoja
- [Keywords documentation](https://marketsquare.github.io/robotframework-browser/Browser.html)
  - [Importing](https://marketsquare.github.io/robotframework-browser/Browser.html?tag=BrowserControl#Importing)
  - [Browser, Context and Page](https://marketsquare.github.io/robotframework-browser/Browser.html?tag=BrowserControl#Browser%2C%20Context%20and%20Page)
  - [Get Title](https://marketsquare.github.io/robotframework-browser/Browser.html?tag=BrowserControl#Get%20Title)
  -  [Fill Text](https://marketsquare.github.io/robotframework-browser/Browser.html?tag=BrowserControl#Fill%20Text)
  -  [Type Text](https://marketsquare.github.io/robotframework-browser/Browser.html?tag=BrowserControl#Type%20Text)
  -  [Fill Secret](https://marketsquare.github.io/robotframework-browser/Browser.html?tag=BrowserControl#Fill%20Secret)
  -  [Type Secret](https://marketsquare.github.io/robotframework-browser/Browser.html?tag=PageContent#Type%20Secret)
  -  [Click](https://marketsquare.github.io/robotframework-browser/Browser.html?tag=BrowserControl#Click)
  -  [Click With Options](https://marketsquare.github.io/robotframework-browser/Browser.html?tag=BrowserControl#Click%20With%20Options)

