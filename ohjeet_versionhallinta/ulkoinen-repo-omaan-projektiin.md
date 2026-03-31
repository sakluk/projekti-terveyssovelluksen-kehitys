# Ulkoisen repositorion liittäminen omaan projektiin

> **Kohderyhmä:** Web-sovellusprojektit, joissa halutaan hyödyntää valmista esimerkkikoodia toisesta repositoriosta osana omaa monorepo-projektia.

---

## 1. Mikä on ongelma?

Tiimi haluaa käyttää valmista taustapalvelimen esimerkkikoodia, joka sijaitsee erillisessä repositoriossa, osana omaa projektiaan. Tavoitteena on pitää kaikki koodi yhdessä repositoriossa.

Tähän on kolme pääasiallista lähestymistapaa: **Git Submodule**, **Git Subtree** ja **kopiointi (fork)**.

---

## 2. Vaihtoehto 1: Git Submodule

Submodule on kuin **linkki** toiseen repositorioon – alkuperäinen repo pysyy omana kokonaisuutenaan, mutta se kiinnitetään osaksi omaa projektia.

### Käyttöönotto

```bash
# Lisätään taustapalvelin submoduulina backend/-kansioon
git submodule add https://github.com/alkuperainen/taustapalvelin.git backend
git commit -m "Lisätty taustapalvelin submoduulina"
```

### Kansiorakenne

```
my-project/
├── frontend/
├── backend/          ← submodule (viittaa ulkoiseen repoon)
├── robot-tests/
└── .gitmodules       ← git hallinnoi tätä automaattisesti
```

### Kloonaus submoduulien kanssa

```bash
# Uuden tiimiläisen tulee kloonata näin:
git clone --recurse-submodules https://github.com/oma/my-project.git

# Tai jos repo on jo kloonattu ilman submoduuleja:
git submodule update --init --recursive
```

### Päivitys alkuperäisestä reposta

```bash
git submodule update --remote backend
git commit -m "Päivitetty taustapalvelin uusimpaan versioon"
```

### Hyödyt ja haitat

**Hyödyt:**
- Alkuperäisen repon päivitykset saa helposti mukaan
- Selkeä rakenne – submodule on selvästi erillinen komponentti

**Haitat:**
- Uudet tiimiläiset joutuvat muistamaan `--recurse-submodules`, muuten `backend/`-kansio on tyhjä — tämä on yleisin sudenkuoppa
- Vaatii hieman enemmän git-osaamista

---

## 3. Vaihtoehto 2: Git Subtree

Subtree **kopioi** toisen repon koodin suoraan omaan repoon, mutta säilyttää mahdollisuuden synkronoida muutoksia myöhemmin.

> **Analogia:** Submodule on pikakuvake, subtree on kopio, jota voi päivittää.

### Käyttöönotto

```bash
git subtree add --prefix=backend \
  https://github.com/alkuperainen/taustapalvelin.git main --squash
```

### Päivitys myöhemmin

```bash
git subtree pull --prefix=backend \
  https://github.com/alkuperainen/taustapalvelin.git main --squash
```

### Hyödyt ja haitat

**Hyödyt:**
- Tavallinen `git clone` riittää – ei erityisiä komentoja tiimiläisille
- Kaikki koodi on oikeasti omassa repossa, ei linkkejä ulkopuolelle

**Haitat:**
- Pitkällä aikavälillä monimutkaisempi hallita kuin submodule
- `git log` voi olla sekavampi, koska ulkoisen repon historia yhdistyy omaan

---

## 4. Vaihtoehto 3: Kopiointi (fork)

Forkataan alkuperäinen repo GitHubissa ja kopioidaan koodi suoraan omaan projektiin. Yhteys alkuperäiseen repoon katkeaa – koodi on nyt täysin tiimin omissa käsissä.

### Käytännössä

1. Forkkaa alkuperäinen repo GitHubissa
2. Kloonaa forkattu repo paikallisesti
3. Kopioi tarvittavat tiedostot oman projektin `backend/`-kansioon
4. Committaa muutokset omaan repoon

### Hyödyt ja haitat

**Hyödyt:**
- Yksinkertaisin tapa – ei ylimääräisiä git-konsepteja
- Täysi hallinta koodiin, ei riippuvuuksia ulkopuoliseen repoon

**Haitat:**
- Alkuperäisen repon päivitykset eivät siirry automaattisesti
- Manuaalinen synkronointi tarvittaessa

---

## 5. Vertailu ja suositus

| Tilanne | Suositus |
|---|---|
| Taustapalvelinta ei enää muuteta juurikaan | **Kopiointi/fork** – yksinkertaisin |
| Halutaan saada alkuperäisen repon päivitykset helposti | **Subtree** – helpompi tiimille kuin submodule |
| Tiimillä on vahva git-osaaminen | **Submodule** – selkein rakenne |
| Opiskelijatiimi, git-osaaminen vaihtelee | **Subtree tai kopiointi** – vähemmän sudenkuoppia |

> **Nyrkkisääntö:** Opiskelijatiimeille suositellaan **subtree- tai kopiointilähestymistapaa**. Submodulen "tyhjä kansio" -ongelma aiheuttaa helposti hämmennystä ja sen debuggaamiseen kuluu turhaa aikaa.

---

## 6. Akateemiset lähteet

- **Chacon, S. & Straub, B. (2014).** *Pro Git* (2. painos). Apress. Saatavilla: https://git-scm.com/book/en/v2
  – Kattava Git-opas, joka käsittelee submoduulit (luku 7.11) ja subtreen (luku 7.12) yksityiskohtaisesti.

- **Forsgren, N., Humble, J. & Kim, G. (2018).** *Accelerate: The Science of Lean Software and DevOps.* IT Revolution Press.
  – Käsittelee repositoriorakenteiden vaikutusta tiimin tuottavuuteen ja toimituskykyyn.

- **Loeliger, J. & McCullough, M. (2012).** *Version Control with Git* (2. painos). O'Reilly Media.
  – Syväluotaus Gitin sisäiseen toimintaan ja edistyneisiin ominaisuuksiin kuten submoduuleihin.

---

*Dokumentti laadittu Metropolia Ammattikorkeakoulun web-sovelluskehityksen kurssimateriaalia varten.*
