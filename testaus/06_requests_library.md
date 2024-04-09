# 06. Requests Library ja API testaus

https://docs.robotframework.org/docs/different_libraries/requests

Seuraava esimerkki on kopioitu ja editoitu esimerkistä: https://docs.robotframework.org/docs/examples/restfulbooker. Alkuperäinen testitiedosto on jaettu kahteen osaan:
- `restful_booker.robot` - sisältää varsinaiset testit
- `restful_booker_keywords.resource` - sisältää avainsanat, käyttäjätunnuksen ja salasanan

Tavoitteena on esitellä, miten resurssitiedostot, jotka sisältävät käyttäjätunnuksen ja salasanan, voidaan piilottaa testin raportista ja lokista.

1. Kopioi seuraava resurssitiedosto `restful_booker_keywords.resource` omalle koneellesi.

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

2. Kopio testitiedosto `restful_booker.robot` koneellesi.

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

3. Suorita testi poistamalla raporteista kaikki avainsanat.

```
robot --removekeywords all restful_booker.robot
```
