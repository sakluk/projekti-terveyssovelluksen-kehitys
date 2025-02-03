*** Settings ***
Library     Browser    auto_closing_level=SUITE
Library     CryptoLibrary    variable_decryption=True   #Kryptatut muuttujat puretaan automaattisesti

*** Variables ***
${Username}    crypt:vo3X+rL2c/oc6YEZpX2/UI9cCnhCnbTwNWa23KMnA2/T5U0AAEj2U9Dk752O9y2gsR/kUUjfF3RIfqOdmDgRGQ==
${Password}    crypt:Ykew9/KogtKZu+Sju2KRp4q03VK49CLiW2ADwO9YwUv0FTJXSQS18lDZh2Xxo5B7LKc4N6sohur2K5dkY0s= 
${Message}     crypt:ilKjOf4q/HnOzaGekMymzW+FKMYk5/JX0TNdxBTgrTVVFmOkkQ5EhE6C0BSrxitQfEqpL1xqlvBF0mFZMOSZylwglcqATDc=

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