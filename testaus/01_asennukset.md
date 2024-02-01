# 01_asennukset

## Tavoite
Tavoitteena on asentaa projektissa käytettävät automaatiotestaustyökalut.
## Taustaa
Tulemme käyttämään kurssilla seuraavia työkaluja:
- [Robot Framework](https://robotframework.org/) - yleiskäyttöinen avoimeen lähdekoodiin perustuva automaatiokehys. Sitä voidaan käyttää testiautomaatiossa ja RPA-tehtävissä.
- [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/) - verkkosovellusten testaamisen tarkoitettu lisätyökalu, käytetään Robot Frameworkin yhteydessä
- Selainajurit - tarvittaessa asennetaan testiautomaatiossa tarvittavat selainajurit
- [QWeb](https://pypi.org/project/QWeb/) - Robot Framework lisäkirjasto, joka on tarkoitettu erityisesti verkkosovellusten testaamiseen
- [Cucumber](https://cucumber.io/) - työkalu käytttäytymiseen perustuvien (BDD) automaatiotestien suunnitteluun ja toteuttamiseen
- [Gherkin](https://cucumber.io/docs/gherkin/) - Cucumberin yhteydessä käytettävä tapa kirjoittaa BDD-testejä

  ## Asennukset
  ### pip päivitys
  Ensimmäiseksi kannattaa tarkistaa, että pip on päivitetty viimeisimpään versioon. Tämän voi tehdä ajamalla komentorivillä seuraavan komennon:
  > python.exe -m pip install --upgrade pip
