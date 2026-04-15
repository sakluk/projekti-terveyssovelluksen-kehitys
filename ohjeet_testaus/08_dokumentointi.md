# Vinkkejä dokumentointiin

Ohessa on vinkkejä testaustehtävien dokumentointiin.

## README-tiedostot

Github.io -sivusto etsii hakemistoista automaattisesti joko index.html tai README.md tiedostoa ja näyttää sen. Esimerkiksi tässä kansiossa (./ohjeet-testaus) on README.md tiedosto. Kun avaan selaimessa linkin , Github.io etsii kansiossa olevan README.md -tiedoston ja näyttää (renderöi) sen. 

Samoin kaikista tässä kansiossa olevista Markdown-tiedostoista tehdään automaattisesti html-versiot, jotka näkyvät Github.io -sivustolla. Näin ollen erillisiä html-dokumentaatioita ei tarvitse tehdä, vaan kaikki Markdown-tiedostot konvertoidaan html-tiedostoiksi.

Tutki oheista Github.io linkkiä ja vertaa sitä vastaavaan Github:sta löytyvään kansioon:
- [https://sakluk.github.io/projekti-terveyssovelluksen-kehitys/ohjeet_testaus](https://sakluk.github.io/projekti-terveyssovelluksen-kehitys/ohjeet_testaus)
- [https://github.com/sakluk/projekti-terveyssovelluksen-kehitys/tree/main/ohjeet_testaus](https://github.com/sakluk/projekti-terveyssovelluksen-kehitys/tree/main/ohjeet_testaus)

## Omien linkkien lisääminen Markdown-tiedostoon

Markdown-formaatissa luodaan hyperlinkki koodilla:
```Markdown
[Basic link](https://example.com)
```
Hakasulkeiden sisään laitetaan näytettävä teksti ja normaalien sulkeiden sisään linkki.

Linkeissä voi käyttää joko absoluuttista osoitetta tai suhteellista osoitetta. Erityisesti, kun tehdään projektin sisäisiä linkkejä, kannattaa käyttää suhteellisia osoitteita. Esimerkiksi, aiemmin esitelty linkki tässä kansiossa olevaan README-tiedostoon voidaan lyhentää muotoon:
```Markdown
[README](./README.md)
```
Kokeile tästä: [README](./README.md)

Jos alihakemistossa on README-tiedosto, niin silloin voidaan viitata alihakemistoon, esimerkiksi:
```Markdown
[Versionhallintaohjeet](../ohjeet_versionhallinta/)
```
Kokeile tästä:[Versionhallintaohjeet](../ohjeet_versionhallinta/)

Näitä kannattaa kokeilla omassa projektissa ja testata, että linkit toimivat oikein Githubin kansioissa sekä Github.io-sivustolla.

## Tehtävien dokumentointi

Jokaista suoritettua tehtävää kohden kannattaa kirjoittaa lyhyt dokumentaatio. Dokumentaatiossa voi kertoa miten tehtävä on ratkaistu ja millaisia tuloksia saatiin. Lisäksi kannattaa lisätä linkit testitiedostoihin sekä raportti- ja lokitiedostoihin. Tässä on esimerkki:

```
## Tehtävä 1

Asensin kaikki tarvittavat ohjelmat. Ajoin [asennustesti.py](../python/asennustesti.py) tiedoston ja sain terminaali-ikkunaan tuloksena

(lisää tähän hipsukat)
Robot Framework: 7.2
Browser: 19.3.0
requests: 2.32.3
CryptoLibrary: 0.4.2
(lisää tähän hipsukat)

## Tehtävä 2

Tein tiedostot [Keywords.robot](../tests/Keywords.robot) ja [browser_demo.robot](../test/browser_demo.robot). 

Ajoin testin komennolla:
(lisää tähän hipsukat)
robot browser_demo.robot
(lisää tähän hipsukat)

Sain tuloksena seuraavat loki- ja raporttitiedostot:
- [lokitiedosto](../outputs/log.html)
- [raportti](../outputs/report.html)
```

Tämä Markdown-dokumentti näkyy seuraavasti:

## Tehtävä 1

Asensin kaikki tarvittavat ohjelmat. Ajoin [asennustesti.py](../python/asennustesti.py) tiedoston ja sain terminaali-ikkunaan tuloksena

```
Robot Framework: 7.2
Browser: 19.3.0
requests: 2.32.3
CryptoLibrary: 0.4.2
```

## Tehtävä 2

Tein tiedostot [Keywords.robot](../tests/Keywords.robot) ja [browser_demo.robot](../test/browser_demo.robot). 

Ajoin testin komennolla:
```Bash
robot browser_demo.robot
```

Sain tuloksena seuraavat loki- ja raporttitiedostot:
- [lokitiedosto](../outputs/log.html)
- [raportti](../outputs/report.html)




