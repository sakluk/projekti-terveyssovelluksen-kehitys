*** Settings ***
Documentation     Esimerkki ympäristömuuttujien käytöstä
Library           Collections
Variables         load_env.py


*** Test Cases ***
Example Test Case
    [Documentation]    Esimerkkitapaus, jossa käytetään ympäristömuuttujia
    Log    API Key: ${API_KEY}
    Log    Base URL: ${BASE_URL}