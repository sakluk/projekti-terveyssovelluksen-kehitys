# 04. Raportit ja lokitiedostot

HTML-sivujen esikatseluun GitHubissa on muutamia tapoja tarpeidesi mukaan. Seuraavassa on joitakin yleisimpiä menetelmiä:

## 1. Nopea esikatselu
Jos haluat nähdä nopean esikatselun HTML-tiedostosta missä tahansa julkisessa arkistossa, voit käyttää [GitHub HTML Preview][ref1], kolmannen osapuolen palvelua, joka renderöi HTML-tiedoston suoraan GitHubista. Liitä vain `https://htmlpreview.github.io/?` HTML-tiedoston alkuperäisen URL-osoitteen eteen. Voit esimerkiksi esikatsella tätä tiedostoa: 

[https://github.com/qentinelqi/qweb/blob/master/test/resources/alert.html](https://github.com/qentinelqi/qweb/blob/master/test/resources/alert.html)

käyttämällä tätä URL-osoitetta: 

[https://htmlpreview.github.io/?https://github.com/necolas/css3-social-signin-buttons/blob/master/index.html](https://htmlpreview.github.io/?https://github.com/qentinelqi/qweb/blob/master/test/resources/alert.html)

## 2. Projektin HTML-sivut
Jos haluat luoda projektillesi verkkosivun HTML-tiedostojen avulla, voit käyttää [GitHub Pages][ref2] -ominaisuutta, jonka avulla voit isännöidä ja julkaista verkkosivuja GitHubin kautta. 

Käyttääksesi GitHub Pagesia sinun täytyy luoda erityinen haara nimeltä `gh-pages` arkistoosi ja työntää HTML-tiedostosi tähän haaraan. Sen jälkeen voit tarkastella verkkosivujasi osoitteessa `http://username.github.io/repo`, jossa `username` on GitHub-käyttäjätunnuksesi ja `repo` on arkistosi nimi.

## 3. HTML-tiedostojen esikatselu paikallisesti
Jos haluat esikatsella HTML-tiedostoja paikallisella koneellasi, voit kloonata arkiston ja avata HTML-tiedostot selaimellasi. Jos haluat kloonata arkistosi, sinun on asennettava [Git](https://git-scm.com/) ja ajettava tämä komento päätelaitteessa: 

`git clone https://github.com/username/repo.git`, jossa 

- `käyttäjätunnus` on GitHub-käyttäjätunnuksesi ja
- `repo` on arkistosi nimi.

Sen jälkeen voit siirtyä kansioon, johon kloonasit arkistosi, ja avata HTML-tiedostot selaimellasi.

Lähde: Keskustelu Bingin kanssa, 2/4/2024

[ref1]: https://htmlpreview.github.io/ "GitHub HTML Preview"
[ref2]: https://docs.github.com/pages/quickstart "Quickstart for Github Pages - Github Docs"
