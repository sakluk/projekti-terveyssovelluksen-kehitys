# 06. RequestsLibrary ja API testaus

Ohjeita:
- [RequestsLibrary dokumentaatio](https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html#library-documentation-top)
- [How to perform API testing in Robot Framework | TesterDoc](https://testersdock.com/api-testing-robot-framework/)
- [API testing with Robot Framework (part 1) | medium.com](https://fmgprado.medium.com/api-testing-with-robot-framework-part-1-997a3cb5bffe)
- [API testing with Robot Framework (part 1) | medium.com](https://fmgprado.medium.com/api-testing-with-robot-framework-part-2-a1b80eae4208)
 
REST API rajapintojen testaussivustoja:
- https://restful-booker.herokuapp.com/ - käytetty alla olevassa esimerkissä
- https://jsonplaceholder.typicode.com/ - käytetty RequestsLibraryn dokumentaation [esimerkeissä](https://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html#Usage)

Youtube videoita:
- [RoboCon 2023 - API testing with Robot Framework](https://youtu.be/GeJiVcLUxGY?si=3ygQkexJAu34CCWC)
- [RestAPI testing using Robot Framework (playlist)](https://youtube.com/playlist?list=PLUDwpEzHYYLvMLbma_Rp-6jrrpxkeH0VJ&si=H36_lMiHOq1j4gg9)

## Esimerkki - restful booker

Tämän esimerkin tavoitteena on esitellä miten
- voidaan testata taustapalvelimien API rajapintoja
- tehdään [Suite Setup](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#suite-setup-and-teardown)
- autentikaatiossa käytettävät avainsanat voidaan piilottaa raporteista ja lokitiedostoista

Esimerkissä esitellyt koodit on kopioitu ja editoitu Robot Frameworkin dokumentaatiossa esitetystä [esimerkistä](https://docs.robotframework.org/docs/examples/restfulbooker). Jotta käyttäjätunnus ja salasana saadaan piilotettua raportista, 
alkuperäinen testitiedosto on jaettu kahteen osaan:
- `restful_booker.robot` - sisältää varsinaiset testit
- `restful_booker_keywords.resource` - sisältää avainsanat, käyttäjätunnuksen ja salasanan

### 1. Määritä resurssitiedosto
Kopioi seuraava resurssitiedosto `restful_booker_keywords.resource` omalle koneellesi.

```robotframework
*** Keywords ***
Authenticate as Admin
    ${body}    Create Dictionary    username=admin    password=password123
    ${response}    POST    url=https://restful-booker.herokuapp.com/auth    json=${body}
    Log    ${response.json()}
    ${token}    Set Variable    ${response.json()}[token]
    Log    ${token}
    Set Suite Variable    ${token}
```

### 2. Määritä testitiedosto
Kopioi seuraava testitiedosto `restful_booker.robot` koneellesi.

```robotframework
*** Settings ***
Library    RequestsLibrary
Library    Collections
Resource   restful_booker_keywords.resource
Suite Setup    Authenticate as Admin

*** Test Cases ***
Get Bookings from Restful Booker
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
    ${booking_dates}    Create Dictionary    checkin=2022-12-31    checkout=2023-01-01
    ${body}    Create Dictionary    firstname=Hans    lastname=Gruber    totalprice=200    depositpaid=false    bookingdates=${booking_dates}
    ${response}    POST    url=https://restful-booker.herokuapp.com/booking    json=${body}
    ${id}    Set Variable    ${response.json()}[bookingid]
    Set Suite Variable    ${id}
    ${response}    GET    https://restful-booker.herokuapp.com/booking/${id}
    Log    ${response.json()}
    Should Be Equal    ${response.json()}[lastname]    Gruber
    Should Be Equal    ${response.json()}[firstname]    Hans   
    Should Be Equal As Numbers    ${response.json()}[totalprice]    200
    Dictionary Should Contain Value     ${response.json()}    Gruber

Delete Booking
    ${header}    Create Dictionary    Cookie=token\=${token}
    ${response}    DELETE    url=https://restful-booker.herokuapp.com/booking/${id}    headers=${header}   
    Status Should Be    201    ${response}
```

### 3. Suorita testi
Suorita testi poistamalla raporteista kaikki avainsanat.

```bash
robot --removekeywords all --log restful_booker_log.html --report restful_booker_report.html restful_booker.robot
```

Oheisen testin loki ja raportti tallennetaan komentorivillä määritettyihin tiedostoihin. Lisätietoa:

```bash
robot --help
```
