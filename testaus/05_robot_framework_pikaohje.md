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


## Testidatan eri osiot
Robot Frameworkin testidatat määritellään eri osioissa, joita kutsutaan usein myös taulukoiksi ja jotka luetellaan jäljempänä:
Osio Käytetään
Asetukset	
1) Testikirjastojen, resurssitiedostojen ja muuttujatiedostojen tuonti.
2) Testisarjojen ja testitapausten metatietojen määrittäminen.
Muuttujat Muuttujien määrittäminen, joita voidaan käyttää muualla testidatassa.
Testitapaukset Testitapausten luominen käytettävissä olevista avainsanoista.
Tehtävät Tehtävien luominen käytettävissä olevien avainsanojen avulla. Yksi tiedosto voi sisältää vain joko testejä tai tehtäviä.
Avainsanat Käyttäjän avainsanojen luominen olemassa olevista alemman tason avainsanoista.
Kommentit Lisäkommentit tai -tiedot. Robot Framework ei huomioi niitä.
Eri osiot tunnistetaan niiden otsikkorivin perusteella. Suositeltava otsikkorivin muoto on *** Asetukset ***, mutta otsikkorivi ei erota isoja ja pieniä kirjaimia, ympäröivät välilyönnit ovat valinnaisia ja tähti-merkkien määrä voi vaihdella, kunhan alussa on vähintään yksi tähti. Esimerkiksi myös *settings tunnistettaisiin jakson otsikoksi.

Translated with DeepL.com (free version)


