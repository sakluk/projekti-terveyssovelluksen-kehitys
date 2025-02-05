# 05. Taustapalvelimen testaus

## Asennusohjeet
```bash
pip install robotframework-requests
```

## Ohjeita ja vinkkejä

### Ohjeet
- [RequestsLibrary - Readme](https://github.com/MarketSquare/robotframework-requests#readme)
- [RequestsLibrary dokumentaatio](https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html#library-documentation-top)
- [How to perform API testing in Robot Framework | TesterDoc](https://testersdock.com/api-testing-robot-framework/)
- [API testing with Robot Framework (part 1) | medium.com](https://fmgprado.medium.com/api-testing-with-robot-framework-part-1-997a3cb5bffe)
- [API testing with Robot Framework (part 1) | medium.com](https://fmgprado.medium.com/api-testing-with-robot-framework-part-2-a1b80eae4208)
 
### REST API rajapintojen testaussivustoja
- https://jsonplaceholder.typicode.com/ - käytetty RequestsLibraryn dokumentaation esimerkkeissä
- https://restful-booker.herokuapp.com/ - käytetty Restful booker -esimerkissä
- https://thetestingworldapi.com/ - käytetty REST API Automation - Robot Framework -esimerkissä

### Youtube videot
- [RoboCon 2023 - API testing with Robot Framework](https://youtu.be/GeJiVcLUxGY?si=3ygQkexJAu34CCWC) - Robin Mackaij ([Enqore](https://www.enqore.tech/)) esittelee RBC2023 konferenssissa peruskäsitteitä ja API rajapintojen testaustyökaluja, kesto n. 30 min.
- [RestAPI testing using Robot Framework (playlist)](https://youtube.com/playlist?list=PLUDwpEzHYYLvMLbma_Rp-6jrrpxkeH0VJ&si=H36_lMiHOq1j4gg9) - Mr. Pavanin vuonna 2019 tekemä pidempi videolista (n. 5 h), jossa hän esittelee yksityiskohtaisesti miten voidaan tehdä REST API rajapintatestausta Robot Frameworkin avulla

### Kirjoja (MetCat)
- [Winteringham, M. (2022). Testing Web APIs. Manning Publications](https://metropolia.finna.fi/Record/nelli15.25605264500041?sid=4488449508)
- [API framework](https://github.com/mwinteringham/api-framework/) - kirjaan liittyvä oheismateriaali

### Esimerkkikoodit
- [REST API Automation - Robot-Framework](https://github.com/shakir-mairaj/REST-API-Automation--Robot-Framework)

## Esimerkkejä

### Pikatesti
Oheinen esimerkki on muokattu RequestsLibraryn [Readme - Quick Start](https://github.com/MarketSquare/robotframework-requests#readme) esimerkistä.

```robotframework
*** Settings ***
Library               RequestsLibrary

*** Test Cases ***

Quick Get A JSON Body Test
    ${response}=    GET  https://jsonplaceholder.typicode.com/posts/1
    Should Be Equal As Strings    1  ${response.json()}[id]
```

### Toinen esimerkki

Tämä esimerkki on myös muokattu RequestsLibraryn [Readme - Quick Start](https://github.com/MarketSquare/robotframework-requests#readme) esimerkeistä. Esimerkki käyttää `Suite Setup` luomaan yhteys palvelimelle. Yhteys on käytössä koko testisarjan ajan.

Ensimmäisessä testissä `Get Request Test` esitellään 
- miten voit testata onko palautteena tulevassa JSON-rakenteessa tietty otsikko,
- sisältääkö JSON tietyn tekstin ja kolmanneksi,
- onko otsikko tietyn tekstin mukainen

Lisätietoa: [Robot Frameworkin standardikirjastot](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#standard-libraries) > [Builtin](https://robotframework.org/robotframework/latest/libraries/BuiltIn.html).

```robotframework
*** Settings ***                                                                                       
Library    Collections                                                                                 
Library    RequestsLibrary                                                                             
                                                                                                       
Suite Setup    Create Session    jsonplaceholder    https://jsonplaceholder.typicode.com                   
                                                                                                       
*** Test Cases ***                                                                                     
                                                                                                       
Get Request Test                                                                                       
    ${resp}=     GET On Session    jsonplaceholder    /posts/1

    Log    ${resp.json()}     # Log the response json

    Status Should Be    200    ${resp}
    Dictionary Should Contain Key    ${resp.json()}  title
    Dictionary Should Contain Value    ${resp.json()}    sunt aut facere repellat provident occaecati excepturi optio reprehenderit
    Should Be Equal As Strings    ${resp.json()}[title]    sunt aut facere repellat provident occaecati excepturi optio reprehenderit                                                                             
    Should Contain    ${resp.json()}[title]    sunt aut facere
                                                                                                       
Post Request Test                                                                                      
    &{data}=    Create dictionary    title=Robotframework requests    body=This is a test!    userId=1       
    ${resp}=    POST On Session      jsonplaceholder    /posts    json=${data}    expected_status=anything     
    
    Log    ${resp.json()}     # Log the response json
                                                                                                       
    Status Should Be    201    ${resp}    
```

### Restful booker -esimerkki

Tämä esimerkki muokattu Robot Frameworkin dokumentaatiossa esitetystä [esimerkistä](https://docs.robotframework.org/docs/examples/restfulbooker). Koodi on järjestelty uudelleen, jotta se on helpompi
ymmärtää. Testin alussa asetuksissa on määritelty [Suite Setup](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#suite-setup-and-teardown), jolloin `Authenticate as Admin` suorittama sisäänkirjautuminen ja siitä saatava kirjautumisavain (token) on käytössä koko testisarjan ajan.

Kopioi koodi esim. tiedostoon `requests_demo3.robot`.

```robotframework
*** Settings ***
Library    RequestsLibrary
Library    Collections
Suite Setup    Authenticate as Admin         # Suoritetaan ennen testitapauksia

*** Keywords ***
Authenticate as Admin
    [Documentation]  Kirjaudutaan sisään ylläpitäjän oikeuksilla.
    ...              - Aluksi luodaan rakenne (Dictionary), joka sisältää käyttäjänimen ja salasanan
    ...              - body-rakenne annetaan POST metodille JSON-parametrina
    ...              - Palautteena tuleva JSON-rakenne tulostetaan lokitiedostoon
    ...              - JSON rakenteesta kaivetaan esiin token
    ...              - Token tulostetaan myös lokitiedostoon
    ...              - Lopuksi token tallennetaa testijoukon muuttujiin muita kutsuja varten 
    ${body}    Create Dictionary    username=admin    password=password123
    ${response}    POST    url=https://restful-booker.herokuapp.com/auth    json=${body}
    Log    ${response.json()}
    ${token}    Set Variable    ${response.json()}[token]
    Log    ${token}
    Set Suite Variable    ${token}

*** Test Cases ***
Get Bookings from Restful Booker
    [Documentation]   Lukee kaikki varaukset palvelimelta.
    ...               Koska *Authenticate as Admin* on määritetty asetuksissa Suite Setup -parametriksi,
    ...               suoritetaan se ennen testitapauksia. Jos kirjautuminen on onnistunut, ei kirjautumista
    ...               tarvitse suorittaa erikseen jokaisessa testitapauksessa. Tässä testitapauksessa jatketaan
    ...               seuraavaksi varausten lukemista palvelimelta. Jos luku onnistuu response.status == 200 ja
    ...               testi yritää lukea jokaisen varauksen tiedot erikseen käyttäen FOR-silmukkaa.
    ${body}    Create Dictionary    firstname=John
    ${response}    GET    https://restful-booker.herokuapp.com/booking    ${body}
    Status Should Be    200
    Log List    ${response.json()}
    FOR  ${booking}  IN  @{response.json()}
        ${response}    GET    https://restful-booker.herokuapp.com/booking/${booking}[bookingid]
        TRY
            Log    ${response.json()}
        EXCEPT
            Log    Cannot retrieve JSON due to invalid data
        END
    END

Create a Booking at Restful Booker
    [Documentation]    Luodaan uusi varaus palvelimelle.
    ...                Testi luo uuden varauksen palvelimelle ja tämän jälkeen testaa, että varaus löytyy
    ...                järjestelmästä.
    # Luo uusi varaus
    ${booking_dates}    Create Dictionary    checkin=2024-01-01    checkout=2024-04-11
    ${body}    Create Dictionary    firstname=Hannu    lastname=Kuoppanen    totalprice=205    depositpaid=false    bookingdates=${booking_dates}
    ${response}    POST    url=https://restful-booker.herokuapp.com/booking    json=${body}

    # Hae palautteesta varauksen uusi ID
    ${id}    Set Variable    ${response.json()}[bookingid]
    Set Suite Variable    ${id}

    # Hae palvelimelta varaus ID:n perusteella
    ${response}    GET    https://restful-booker.herokuapp.com/booking/${id}
    Log    ${response.json()}

    # Tarkista, että varaus on kunnossa
    Should Be Equal    ${response.json()}[lastname]    Kuoppanen
    Should Be Equal    ${response.json()}[firstname]    Hannu   
    Should Be Equal As Numbers    ${response.json()}[totalprice]    205
    Dictionary Should Contain Value     ${response.json()}    Kuoppanen

Delete Booking
    [Documentation]    Poista varaus palvelimelta.
    ${header}    Create Dictionary    Cookie=token\=${token}
    ${response}    DELETE    url=https://restful-booker.herokuapp.com/booking/${id}    headers=${header}   
    Status Should Be    201    ${response}
```

## Suorita testi
Suorita testi antamalla komento:
```bash
robot --log requests_demo3_log.html --report requests_demo3_report.html requests_demo3.robot
```

Oheisen testin loki ja raportti tallennetaan komentorivillä määritettyihin tiedostoihin. Lisätietoa esim. [User Guide > Output files](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#output-files) tai pikaopas antamalla komento:

```bash
robot --help
```
