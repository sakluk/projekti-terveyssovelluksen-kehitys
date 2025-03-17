# Projektien yhdistäminen

Miten saan yhdistettyä kaksi projektia yhdeksi, eli jos minulla on selain (Frontend) ja taustapalvelin (Backend) erillisissä hakemistoista, kuinka yhdistän nämä ja teen yhden projektin?

Oheiset ohjeet on saatu käyttäen Copilot tekoälytyökalua. Näitä ohjeita ei ole tarkistettu ja testattu.

1. **Kloonaa repositoriot paikallisesti**:
   ```bash
   git clone https://github.com/käyttäjänimi/frontend-repo.git
   git clone https://github.com/käyttäjänimi/backend-repo.git
   ```

2. **Luo uusi repositorio** (tai käytä yhtä olemassa olevista):
   ```bash
   git init yhdistetty-repo
   cd yhdistetty-repo
   ```

3. **Lisää frontend-repositorio etäyhteydeksi ja hae sen sisältö**:
   ```bash
   git remote add frontend ../frontend-repo
   git fetch frontend
   git merge frontend/main --allow-unrelated-histories
   ```

4. **Siirrä frontend-tiedostot alihakemistoon**:
   ```bash
   mkdir frontend
   git mv * frontend/
   git commit -m "Siirrä frontend-tiedostot alihakemistoon"
   ```

5. **Lisää backend-repositorio etäyhteydeksi ja hae sen sisältö**:
   ```bash
   git remote add backend ../backend-repo
   git fetch backend
   git merge backend/main --allow-unrelated-histories
   ```

6. **Siirrä backend-tiedostot alihakemistoon**:
   ```bash
   mkdir backend
   git mv * backend/
   git commit -m "Siirrä backend-tiedostot alihakemistoon"
   ```

7. **Puske yhdistetty repositorio GitHubiin**:
   ```bash
   git remote add origin https://github.com/käyttäjänimi/yhdistetty-repo.git
   git push -u origin main
   ```

Tämä prosessi säilyttää molempien repositorioiden commit-historian ja järjestää tiedostot `frontend` ja `backend` alihakemistoihin yhden repositorion sisällä.

Jos kohtaat ongelmia tai tarvitset lisämuokkauksia, kysy rohkeasti!

## Lisätietoa:

- [How do you merge two Git repositories? - stackoverflow.com](https://stackoverflow.com/questions/1425892/how-do-you-merge-two-git-repositories)
- [Combining two git repositories - gist.github.com](https://gist.github.com/msrose/2feacb303035d11d2d05)

