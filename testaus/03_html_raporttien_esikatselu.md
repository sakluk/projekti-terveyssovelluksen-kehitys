# HTML-sivujen esikatselu GitHubissa
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

## Luettavaa
1. ["css - How to see an HTML page on Github as a normal rendered HTML page](https://stackoverflow.com/questions/8446218/how-to-see-an-html-page-on-github-as-a-normal-rendered-html-page-to-see-preview)
2. [Quickstart for GitHub Pages - GitHub Docs](https://docs.github.com/pages/quickstart)
3. [html - How to make a page render in browser in Github? - Stack Overflow.](https://stackoverflow.com/questions/7937551/how-to-make-a-page-render-in-browser-in-github)
4. [Preview files on GitHub - Education & Outreach - World Wide Web.](https://www.w3.org/WAI/EO/wiki/Preview_files_on_GitHub)
5. https://github.com/necolas/css3-social-signin-buttons/blob/master/index.html
6. https://htmlpreview.github.io/
