# Muutospyyntöjen hallinta Visual Studio Codella

Tässä oppaassa esitellään työnkulku GitHub muutospyyntöjen (pull request) luomisesta, lähettämisestä ja hallinnasta käyttäen Visual Studio Coden integroituja versionhallintatyökaluja. Tämä prosessi kattaa repositorion haarauttamisesta (forking) muutosten yhdistämiseen (merging).

## Edellytykset

Ennen aloittamista varmista, että sinulla on:
1. [Visual Studio Code](https://code.visualstudio.com/) asennettuna
2. GitHub-tili
3. Git asennettuna paikalliselle koneellesi
4. Perustietämys Git-käsitteistä (commitit, haarat jne.)

## Vaihe 1: Ympäristön valmistelu

### 1.1 Asenna GitHub Pull Request -laajennus

1. Avaa VS Code
2. Klikkaa Laajennukset-kuvaketta toimintopalkissa (tai paina `Ctrl+Shift+X`)
3. Etsi "GitHub Pull Requests"
4. Asenna laajennus ja lataa VS Code uudelleen

### 1.2 Kirjaudu GitHubiin VS Codesta

1. Klikkaa Tilit-kuvaketta vasemmassa alakulmassa
2. Valitse "Sign in to GitHub"
3. Seuraa todennusprosessia selaimessasi

## Vaihe 2: Repositorion haarauttaminen ja kloonaaminen

### 2.1 Haarauta repositorio (jos osallistut jonkun toisen projektiin)

1. Siirry GitHub-repositorioon, johon haluat osallistua
2. Klikkaa "Fork"-painiketta oikeassa yläkulmassa
3. Valitse oma tilisi haarautuksen kohteeksi

### 2.2 Kloonaa repositorio VS Codessa

1. Paina `Ctrl+Shift+P` avataksesi komentopaletin
2. Kirjoita "Git: Clone" ja valitse se
3. Liitä haarautetun repositorion URL-osoite (tai alkuperäinen, jos se on omasi)
4. Valitse paikallinen kansio repositorion tallentamiseen
5. Kun kehotus tulee, klikkaa "Open" avataksesi kloonatun repositorion

## Vaihe 3: Haaran luominen muutoksillesi

1. VS Codessa klikkaa haaran nimeä tilapalkissa (yleensä "main" tai "master")
2. Klikkaa "+ Create new branch" pudotusvalikosta
3. Syötä kuvaava nimi haarallesi (esim. "feature/add-login-button")
4. Paina Enter luodaksesi uuden haaran ja siirtyäksesi siihen

## Vaihe 4: Muutosten tekeminen ja vahvistaminen (commit)

### 4.1 Tee muutokset

Avaa ja muokkaa tiedostoja, joita sinun tarvitsee muokata VS Code -editorissa.

### 4.2 Vaiheista (stage) muutokset

1. Klikkaa versionhallinnan kuvaketta toimintopalkissa (tai paina `Ctrl+Shift+G`)
2. Tarkastele muutoksiasi "Changes"-osiossa
3. Klikkaa "+" (plus) -kuvaketta kunkin tiedoston vieressä vaiheistaaksesi sen, tai klikkaa "+" "Changes"-kohdan vieressä vaiheistaksesi kaikki tiedostot

### 4.3 Vahvista (commit) muutokset

1. Syötä kuvaava vahvistusviesti tekstikenttään versionhallinnan paneelin yläosassa
2. Paina `Ctrl+Enter` tai klikkaa valintamerkkikuvaketta vahvistaaksesi vaiheistetut muutokset

## Vaihe 5: Muutosten työntäminen ja muutospyynnön (pull request) luominen

### 5.1 Työnnä (push) haarasi GitHubiin

1. Versionhallinnan paneelissa klikkaa "..." (lisätoiminnot) -valikkoa
2. Valitse "Push" työntääksesi haarasi GitHubiin
   - Vaihtoehtoisesti voit klikata synkronointikuvaketta tilapalkissa

### 5.2 Luo muutospyyntö (pull request)

1. Muutosten vahvistamisen jälkeen klikkaa pull request -kuvaketta "Source Control" -sivupalkin yläosassa
2. Tarkista, että paikallinen haara ja repositorio, josta yhdistät, sekä etähaara ja repositorio, johon yhdistät, ovat oikein
3. Anna muutospyynnölle otsikko ja kuvaus, joka selittää muutoksesi
4. Klikkaa "Create" lähettääksesi muutospyyntösi

## Vaihe 6: Muutospyynnön hallinta

### 6.1 Kommentteihin vastaaminen

Jos arvioijat pyytävät muutoksia muutospyyntöösi:

1. VS Codessa klikkaa GitHub-kuvaketta toimintopalkissa
2. "Pull Requests" -kohdassa etsi ja klikkaa muutospyyntöäsi
3. Näet arvioijien kommentit
4. Tee pyydetyt muutokset paikallisessa haarassasi
5. Vahvista (commit) ja työnnä (push) muutokset kuten vaiheissa 4 ja 5.1 on kuvattu
   - Työntö päivittää automaattisesti muutospyyntösi

### 6.2 Muutospyyntöjen arviointi

1. VS Codessa klikkaa GitHub-kuvaketta toimintopalkissa
2. "Pull Requests" -kohdasta löydä ja valitse muutospyyntö, jonka haluat arvioida
3. Lisätäksesi arviokommentin, klikkaa "+"-merkkiä sen rivin numeron vieressä tiedostossa, johon haluat kommentoida
4. Kirjoita arviosi kommentti ja klikkaa "Start Review"
5. Kun olet valmis lisäämään kommentteja, voit lisätä yhteenvetokommentin ja klikata "Comment and Submit", tai valita "Approve and Submit" tai "Request Changes and Submit" pudotusvalikosta

## Vaihe 7: Muutospyynnön yhdistäminen

Kun muutospyyntösi on hyväksytty:

1. Mene muutospyyntösivulle GitHub.comissa
2. Klikkaa "Merge pull request" -painiketta (jos sinulla on tarvittavat oikeudet)
3. Vahvista yhdistäminen
4. Poista haara, jos sitä ei enää tarvita

## Vaihe 8: Paikallisen repositorion synkronointi yhdistämisen jälkeen

1. VS Codessa vaihda takaisin päähaaraan (klikkaa haaran nimeä tilapalkissa)
2. Klikkaa synkronointikuvaketta tilapalkissa vetääksesi (pull) uusimmat muutokset
3. Poistaaksesi paikallisen haarasi, klikkaa haaran nimeä tilapalkissa, sitten klikkaa haaraasi hiiren oikealla painikkeella ja valitse "Delete Branch"

## Lisävinkkejä

- **Vedä ennen kuin työnnät**: Vedä (pull) aina uusimmat muutokset päähaarasta ennen muutostesi työntämistä (push) välttääksesi konflikteja
- **Ratkaise yhdistämiskonfliktit**: Jos konflikteja ilmenee, VS Codessa on sisäänrakennettu konfliktinratkaisueditori auttamaan niiden selvittämisessä
- **Käytä merkityksellisiä vahvistusviestejä**: Kirjoita selkeitä vahvistusviestejä, jotka selittävät, mitä muutoksia tehtiin ja miksi

## Lisätietoa

- [Git Pull Requests | geeksforgeeks.org](https://www.geeksforgeeks.org/git-pull-request/)
- [Creating a pull request | github.com](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/creating-a-pull-request)
- [About branches | github.com](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-branches)
- [git request-pull documentation](https://git-scm.com/docs/git-request-pull)

