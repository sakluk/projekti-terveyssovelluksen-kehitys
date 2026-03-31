# Monorepo vs. Multi-repo – Web-projektin versionhallintastrategia

> **Kohderyhmä:** Web-sovellusprojektit, joissa frontend ja backend kehitetään erikseen ja hyväksymistestaus toteutetaan Robot Frameworkilla.

---

## 1. Mikä on ongelma?

Kun web-projekti koostuu useista erillisistä osista – frontendistä, backendistä ja automaatiotesteistä – herää luonnollinen kysymys: **kannattaako kaikki pitää yhdessä repositoriossa vai useassa erillisessä?**

Tämä on arkkitehtuuripäätös, johon ei ole yhtä oikeaa vastausta. Valinta riippuu tiimin koosta, projektin laajuudesta ja CI/CD-kypsyydestä.

---

## 2. Analogia: toimiston layout

| Strategia | Analogia |
|---|---|
| **Monorepo** | Avokonttori – kaikki tiimit samassa tilassa. Kommunikaatio helppoa, mutta häly voi häiritä. |
| **Multi-repo** | Erilliset toimistot – rauha omalle tekemiselle, mutta koordinointi vaatii enemmän vaivaa. |

---

## 3. Vaihtoehto 1: Monorepo

Yksi repositorio sisältää kaikki projektin osat.

### Esimerkki kansiorakenteesta

```
my-project/
├── frontend/
│   ├── src/
│   ├── public/
│   ├── package.json
│   └── README.md
├── backend/
│   ├── src/
│   ├── tests/              ← yksikkö- ja integraatiotestit
│   ├── requirements.txt
│   └── README.md
├── robot-tests/
│   ├── resources/
│   │   ├── keywords/
│   │   └── variables/
│   ├── test_suites/
│   │   ├── smoke/
│   │   ├── acceptance/
│   │   └── regression/
│   ├── results/            ← lisää .gitignore-tiedostoon!
│   └── README.md
├── docs/
├── docker-compose.yml
├── .github/
│   └── workflows/          ← CI/CD-pipeline-konfiguraatiot
├── .gitignore
└── README.md
```

### Hyödyt

- Yksi `git clone` riittää – koko projekti käytössä heti
- Robot Framework -testit näkevät helposti molemmat osat
- **Atomiset commitit:** "Lisätty API-endpoint + siihen liittyvä Robot-testi" yhdessä commitissa
- Yhteiset CI/CD-konfiguraatiot yhdessä paikassa
- Helpompi hallita jaettuja konfiguraatioita (`docker-compose.yml`, ympäristömuuttujat)

### Haitat

- Isommaksi kasvaessaan `git log` voi olla sekavampi
- CI/CD voi ajaa turhaan testejä muuttumattomille osioille (ratkaistavissa path-filterillä)
- Ilman selkeää branch-käytäntöä tiimit voivat häiritä toisiaan

---

## 4. Vaihtoehto 2: Multi-repo

Jokaisella projektin osalla on oma repositorionsa.

```
my-project-frontend/        ← oma repo
my-project-backend/         ← oma repo
my-project-robot-tests/     ← oma repo
```

### Hyödyt

- Selkeä omistajuus ja vastuu per tiimi
- Riippumattomat release-syklit
- Pienempi kognitiivinen kuorma yksittäiselle kehittäjälle

### Haitat

- Robot Framework -testit viittaavat ulkoisiin ympäristöihin → konfiguraatio monimutkaisempaa
- Vaikea tehdä atomisia muutoksia, jotka koskevat useita repoja samanaikaisesti
- CI/CD-koordinointi haastavaa: *"Missä frontendin versiossa testataan tätä backendin versiota?"*

---

## 5. Suositus: milloin valita kumpi?

| Kriteeri | Monorepo ✅ | Multi-repo ✅ |
|---|---|---|
| Pieni tai keskisuuri projekti | Parempi | Ylimitoitettu |
| Robot FW E2E-testit samassa projektissa | Luonteva | Hankala konfiguroida |
| Opiskelijatiimit / oppimisympäristö | Selkeämpi | Koordinointiriski |
| Suuret, itsenäiset tiimit | Voi olla raskas | Parempi |
| Erilliset release-syklit eri osille | Vaikeampi hallita | Parempi |

> **Nyrkkisääntö:** Aloita monorepositiolla. Voit aina pilkkoa repositorion myöhemmin erillisiksi – päinvastainen suunta on huomattavasti työläämpää.

---

## 6. CI/CD-esimerkki: GitHub Actions monoreposssa

Path-filtereiden avulla testit ajetaan vain, kun jokin relevantti osa muuttuu – turhat pipeline-ajot jäävät pois.

```yaml
# .github/workflows/robot-tests.yml
name: Robot Framework Tests

on:
  push:
    paths:
      - 'backend/**'
      - 'frontend/**'
      - 'robot-tests/**'

jobs:
  robot:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Set up Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.11'
      - name: Install dependencies
        run: pip install robotframework robotframework-seleniumlibrary
      - name: Run Robot tests
        run: robot --outputdir robot-tests/results robot-tests/test_suites/
```

---

## 7. .gitignore-muistilista

Seuraavat hakemistot ja tiedostot kannattaa lisätä `.gitignore`-tiedostoon:

```gitignore
# Robot Framework tulokset
robot-tests/results/
*.xml
log.html
output.xml
report.html

# Python
__pycache__/
*.pyc
.env
venv/

# Node / Frontend
node_modules/
dist/
build/
.env.local
```

---

## 8. Akateemiset lähteet

- **Forsgren, N., Humble, J. & Kim, G. (2018).** *Accelerate: The Science of Lean Software and DevOps.* IT Revolution Press. [MetCat](https://metropolia.finna.fi/Record/3amk.271437?sid=5304248061)
  – Osoittaa, että korkean suorituskyvyn tiimit käyttävät trunk-based developmentia, johon monorepo sopii luontevasti.

- **Potvin, R. & Levenberg, J. (2016).** Why Google Stores Billions of Lines of Code in a Single Repository. *Communications of the ACM, 59*(7), 78–87. [MetCat](https://metropolia.finna.fi/PrimoRecord/pci.cdi_crossref_primary_10_1145_2854146?sid=5304249405)
  – Googlen monorepo-kokemus: skaalautuvuushaasteet realisoituvat vasta hyvin suuressa mittakaavassa.

- **Bass, L., Weber, I. & Zhu, L. (2015).** *DevOps: A Software Architect's Perspective.* Addison-Wesley. [MetCat](https://metropolia.finna.fi/PrimoRecord/pci.cdi_proquest_ebookcentral_EBC7116434?sid=5304250146)
  – Käsittelee deployment pipeline -arkkitehtuureja, joissa repositoriorakenne vaikuttaa suoraan CD-kypsyyteen.

---

*Dokumentti laadittu Metropolia Ammattikorkeakoulun web-sovelluskehityksen kurssimateriaalia varten Claude Sonnet 4.6 laajaa kielimallia hyödyntäen.*
