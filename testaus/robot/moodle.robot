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