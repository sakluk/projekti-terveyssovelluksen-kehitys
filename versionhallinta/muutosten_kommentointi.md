# Muutosten kommentointi
## Perussyntaksi
`git commit -m <kommentti>`
## Laajennettu syntaksi
`git commit -m <otsikko> -m <runko>`
## Miksi?
- Muutokset kommentoidaan, jotta säästetään jatkossa omaa ja koko tiimin aikaa.
- Yhteistyö ja kommunikointi on kaikkein tärkeintä insinööritiimissä. Muutoksen kommentointi on perusesimerkki tästä.
- Ilman muutosten kommentointia ei ole jäljitettävää historiaa.
## Perusohjeet
1. Isot alkukirjaimet ja välimerkit: Kirjoita ensimmäinen sana isolla alkukirjaimella, äläkä päätä sitä välimerkkeihin.
   Jos käytät tavanomaisia kommenteja, muista käyttää pienaakkosia.
2. Tunnelma: Käytä imperatiivista tunnelmaa otsikkorivillä. Esimerkki `git commit -m 'Lisää korjaus tumman tilan vaihtotilaan'`.
   Imperatiivinen tunnelma antaa vaikutelman, että annat käskyn tai pyynnön.
3. Tyyppi: Määritä kommentin tyyppi. On suositeltavaa ja hyödyllistä käyttää tavanomaisia sanoja, joilla kuvataan muutoksia. Esimerkiksi:
   uusi ominaisuus, virheenkorjaus, päivitys, parannus, dokumentointi, testi, tehokkuusparannus, jne.
4. Pituus: Ensimmäisen rivin tulisi mieluiten olla enintään 50 merkkiä pitkä, ja koko teksti tulisi rajoittaa 72 merkkiin.
5. Sisältö: Ole suora, yritä välttää täytesanoja, esimerkiksi: vaikka, ehkä, luulen, tavallaan. Ajattele kuin Iltalehden toimittaja.
## Esimerkkejä hyvistä kommenteista
- `git commit -m 'parannus: paranna suorituskykyä kuvien latausnopeuden osalta'`
- `git commit -m 'päivitys: päivitä npm-riippuvuus uusimpaan versioon'`
- `git commit -m 'Korjaa virhe, joka estää käyttäjiä lähettämästä tilauslomaketta'`
- `git commit -m 'Päivitä virheellinen asiakkaan puhelinnumero alatunnisteen rungossa'`
## Alkuperäinen lähde
- Pina, M. (Jan 4, 2022). [How to write better git commit messages | freecodecamp.org](https://www.freecodecamp.org/news/how-to-write-better-git-commit-messages/)
