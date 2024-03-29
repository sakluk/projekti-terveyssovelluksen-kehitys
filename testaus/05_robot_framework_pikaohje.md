# 05. Robot Framework pikaohjeet

Nämä Robot Framework pikaohjeet on koostettu käyttäen lähteenä 
[Robot Framework User Guide version 7.0](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#introduction). Alkuperäisestä materiaalista on poimittu
projektin tarpeita varten oleellisimmat osiot ja käännetty ne suomen kielelle käyttäen maksutonta [deepl.com](https://www.deepl.com/) käännöspalvelua.

Alkuperäinen materiaali on lisenssoitu käyttäen [CC BY 3.0 DEED Attribution 3.0 Unported](https://creativecommons.org/licenses/by/3.0/deed.fi) lisenssiä, joka on vanhempi versio.
Alkuperäisen lisenssiehtojen vahvojen suositutsen mukaisesti tässä materiaalissa käytetään uudempaa versiota [CC BY 4.0 DEED
Attribution 4.0 International](https://creativecommons.org/licenses/by/4.0/deed.fi).

## Arkkitehtuuri

Robot Framework on yleinen, sovelluksesta ja teknologiasta riippumaton kehys. Sen arkkitehtuuri on erittäin modulaarinen, kuten alla olevassa kaaviossa on esitetty.

![Robot Frameworkin](https://robotframework.org/robotframework/latest/images/architecture.png)

Kuva 1. Robot Frameworkin arkkitehtuuri

Testidata on yksinkertaisessa, helposti muokattavassa taulukkomuodossa. Kun Robot Framework käynnistetään, se käsittelee tiedot (Test Data), 
suorittaa testitapaukset (Test Cases) ja tuottaa lokitiedot ja raportit. Ydinkehys (Robot Framework) ei tiedä mitään testattavasta kohteesta (System Under Test) ja 
vuorovaikutus sen kanssa hoidetaan kirjastojen (Test Libraries) avulla. Kirjastot voivat joko käyttää suoraan sovellusrajapintoja tai 
käyttää alemman tason testityökaluja (Test Tools) ajureina.

## Testidatan osiot
Robot Frameworkin tiedot määritellään eri osioissa, jotka on lueteltu alla:

| Osio | Käyttötarkoitus |
| ---- | --------------- |
| Asetukset (Settings) | Testikirjastojen, resurssitiedostojen ja muuttujatiedostojen tuonti sekä testisarjojen (Test Suites) ja testitapausten metatietojen määrittäminen. |
| Muuttujat (Variables)| Muuttujien määrittäminen, joita voidaan käyttää muualla testidatassa. |
| Testitapaukset (Test Cases) | Testitapausten luominen käytettävissä olevista avainsanoista. |
| Tehtävät (Tasks) | Tehtävien luominen käytettävissä olevien avainsanojen avulla. Yksi tiedosto voi sisältää vain joko testejä tai tehtäviä. |
| Avainsanat (Keyword) | Käyttäjän avainsanojen luominen olemassa olevista alemman tason avainsanoista. |
| Kommentit (Comments) | Lisäkommentit tai -tiedot. Robot Framework ei huomioi niitä. |

Eri osiot tunnistetaan niiden otsikkorivin perusteella. Suositeltava otsikkorivin muoto on esim `*** Settings ***`, mutta otsikkorivi ei erota isoja ja pieniä kirjaimia. Ympäröivät välilyönnit ovat valinnaisia ja tähti-merkkien määrä voi vaihdella, kunhan alussa on vähintään yksi tähti. Esimerkiksi myös `*settings` tunnistettaisiin osion otsikoksi.

### Lokalisointi

Osioiden otsikkorivit on mahdollista [lokalisoida](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#localization), esim. Robot Framework tunnistaa suomenkieliset otsikot ajamalla komento:

```bash
robot --language Finnish testit.robot
```
Robot Frameworkin dokumentaation liitteestä löytyy [suomenkieliset](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#finnish-fi) vastineet avainsanoille.

## Tuetut tiedostomuodot

Yleisin tapa luoda Robot Framework -tietoja on käyttää välilyönnillä erotettua muotoa, jossa datan osat, kuten avainsanat ja niiden argumentit, erotetaan toisistaan kahdella tai useammalla välilyönnillä. Vaihtoehtoisesti voidaan käyttää putkella erotettua muotoa, jossa erottimena on välilyönneillä ympäröity putkimerkki (|).

Suite-tiedostot käyttävät yleensä `.robot`-päätettä, mutta voidaan myös erikseen määrittää, mitä tiedostoja analysoidaan. Resurssitiedostoissa voidaan käyttää myös ` .robot`-päätettä, mutta `.resource`-päätteen käyttäminen on suositeltavaa ja tulevaisuudessa se saatetaan määrätä pakolliseksi. Tiedostot, jotka sisältävät muita kuin ASCII-merkkejä, on tallennettava UTF-8-koodauksella.

Robot Framework tukee myös reStructuredText-tiedostoja niin, että normaalit Robot Framework -tiedot upotetaan koodilohkoihin. Vain tiedostot, joilla on `.robot.rst`-pääte, käsitellään oletusarvoisesti. Jos haluat käyttää mieluummin vain `.rst`- tai `.rest`-päätettä, se on määritettävä erikseen.

Robot Framework -tietoja voidaan luoda myös JSON-muodossa, joka on suunnattu enemmän työkalujen kehittäjille kuin tavallisille Robot Framework -käyttäjille. Oletusarvoisesti vain JSON-tiedostot, joilla on mukautettu `.rbt`-pääte, analysoidaan.


### Välilyönnillä erotettu muoto
Kun Robot Framework jäsentää dataa, se jakaa datan ensin riveihin ja sitten rivit merkkeihin, kuten avainsanoihin ja argumentteihin. Kun käytetään välilyönti-erotettua muotoa, merkkien välissä on kaksi tai useampia välilyöntejä tai vaihtoehtoisesti yksi tai useampi tabulaattorimerkki. Normaalin ASCII-välimerkin lisäksi mikä tahansa välilyönniksi katsottava Unicode-merkki (esim. välilyönti) toimii erottimena. Välilyöntien määrä voi vaihdella, kunhan niitä on vähintään kaksi, jolloin tiedot voidaan tasata kauniisti asetuksissa ja muualla helpottamaan tietojen ymmärtämistä.

```robotframework
*** Settings ***
Documentation     Example using the space separated format.
Library           OperatingSystem

*** Variables ***
${MESSAGE}        Hello, world!

*** Test Cases ***
My Test
    [Documentation]    Example test.
    Log    ${MESSAGE}
    My Keyword    ${CURDIR}

Another Test
    Should Be Equal    ${MESSAGE}    Hello, world!

*** Keywords ***
My Keyword
    [Arguments]    ${path}
    Directory Should Exist    ${path}
```
