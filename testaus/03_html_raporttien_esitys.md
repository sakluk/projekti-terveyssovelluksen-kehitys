HTML-sivujen esikatseluun GitHubissa on muutamia tapoja tarpeidesi mukaan. Seuraavassa on joitakin yleisimpiä menetelmiä:

- Jos haluat nähdä nopean esikatselun HTML-tiedostosta missä tahansa julkisessa arkistossa, voit käyttää [GitHub HTML Preview][1], kolmannen osapuolen palvelua, joka renderöi HTML-tiedoston suoraan GitHubista¹. Liitä vain `https://htmlpreview.github.io/?` HTML-tiedoston alkuperäisen URL-osoitteen eteen. Voit esimerkiksi esikatsella tätä tiedostoa: `https://github.com/necolas/css3-social-signin-buttons/blob/master/index.html`, voit käyttää tätä URL-osoitetta: `https://htmlpreview.github.io/?https://github.com/necolas/css3-social-signin-buttons/blob/master/index.html`.
- Jos haluat luoda projektillesi verkkosivun HTML-tiedostojen avulla, voit käyttää [GitHub Pages][3] -ominaisuutta, jonka avulla voit isännöidä ja julkaista verkkosivuja GitHubin kautta³. Käyttääksesi GitHub Pagesia sinun täytyy luoda erityinen haara nimeltä `gh-pages` arkistoosi ja työntää HTML-tiedostosi tähän haaraan. Sen jälkeen voit tarkastella verkkosivujasi osoitteessa `http://username.github.io/repo`, jossa `username` on GitHub-käyttäjätunnuksesi ja `repo` on arkistosi nimi.
- Jos haluat esikatsella HTML-tiedostoja paikallisella koneellasi, voit kloonata arkiston ja avata HTML-tiedostot selaimellasi. Jos haluat kloonata arkistosi, sinun on asennettava [Git](https://git-scm.com/) ja ajettava tämä komento päätelaitteessa: `git clone https://github.com/username/repo.git`, jossa `käyttäjätunnus` on GitHub-käyttäjätunnuksesi ja `repo` on arkistosi nimi. Sen jälkeen voit siirtyä kansioon, johon kloonasit arkistosi, ja avata HTML-tiedostot selaimellasi.

Lähde: Keskustelu Bingin kanssa, 2/4/2024
[1]: https://stackoverflow.com/questions/8446218/how-to-see-an-html-page-on-github-as-a-normal-rendered-html-page-to-see-preview "css - How to see an HTML page on Github as a normal rendered HTML page."
[3]: https://docs.github.com/pages/quickstart "Quickstart for GitHub Pages - GitHub Docs."
[5]: https://stackoverflow.com/questions/7937551/how-to-make-a-page-render-in-browser-in-github "html - How to make a page render in browser in Github? - Stack Overflow."
[6]: https://www.w3.org/WAI/EO/wiki/Preview_files_on_GitHub "Preview files on GitHub - Education & Outreach - World Wide Web."
[8]: https://github.com/necolas/css3-social-signin-buttons/blob/master/index.html
[9]: https://htmlpreview.github.io/
[10]: https://htmlpreview.github.io/?https://github.com/bartaz/impress.js/blob/master/index.html
[11]: https://github.com/sargdavid/
