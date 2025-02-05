*** Settings ***
Library     Browser    auto_closing_level=SUITE    # Sulje selain vasta, kun kaikki testit on ajettu
Resource    login_variables.resource    # tunnukset ja salasanat on tallennettu erilliseen resource tiedostoon

*** Variables ***
${BROWSER}    chromium    # muut vaihtoehdot: firefox, webkit
${URL}    https://authenticationtest.com/    # Sisältää esimerkkiweb-sovelluksia kirjautumisen testaamiseen 


*** Test Cases ***
Oikea tunnus ja salasana
    [Documentation]  Testaa kirjautumisen oikealla tunnuksella ja salasanalla
    [Tags]  positive auth
    New Browser    ${BROWSER}    headless=false    # headless=true, jos et tarvitse GUI
    New Context    viewport={'width': 800, 'height': 600}
    New Page    ${URL}
    Click    //a[.='Simple Form Auth']    # Valitse sivulta Simple Form Auth
    Fill Text    //input[@id = 'email']    ${EMAIL}    # Syötä sähköposti
    Fill Secret    //input[@id='password']    $PASSWORD    # Syötä salasana
    Click    //input[@type='submit']    # Klikkaa Log in -nappulaa
    Get Text    //h1[.='Login Success']    ==    Login Success    # Tarkista onnistuiko kirjautuminen

Väärä tunnus
    [Documentation]  Testaa kirjautumisen väärällä käyttäjätunnuksella
    [Tags]  negative auth 
    New Page    ${URL}
    Click    //a[.='Simple Form Auth']    
    Fill Text    //input[@id = 'email']    ${WRONG_EMAIL}    # Syötä väärä tunnus
    Fill Secret    //input[@id='password']    $PASSWORD
    Click    //input[@type='submit']
    Get Text    //h1[.='Login Failure']    ==    Login Failure    # Tarkista otsikko

Väärä salasana
    [Documentation]  Testaa kirjautumisen väärällä salasanalla
    [Tags]  negative auth 
    New Page    ${URL}
    Click    //a[.='Simple Form Auth']    
    Fill Text    //input[@id = 'email']    ${EMAIL}
    Fill Secret    //input[@id='password']    $WRONG_PASSWORD    # Syötä väärä salasana
    Click    //input[@type='submit']
    Get Text    //h1[.='Login Failure']    ==    Login Failure