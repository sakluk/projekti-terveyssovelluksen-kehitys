#07. Muuttujien arvojen piilottaminen

Asenna robotframework crypto:
```bash
pip install --upgrade robotframework-crypto
```

Voit aloittaa CryptoLibraryn käytön käynnistämällä 
```bash
python -m CryptoLibrary
```
ja valitsemalla 
- `Open config` -> `Configure key pair`-> `Generate key pair`.

Tämä luo yksityisen ja julkisen avaimen `private_key.json` a `public_key.key` tiedostoihin. 
`private_key.json` tiedostoa tarvitaan arvojen purkamiseen testipalvelimella, ja se on 
kopioitava manuaalisesti tai lisättävä CLI-käyttöliittymän kautta.

Seuraavaksi voit salata testipalvelimella tarvittavat arvot. Anna komento:
```bash
python -m CryptoClient
```
Valitse 
- `Encrypt` -> `Enter the password to encrypt`
- Kirjoita salasana
- Kopioi salattu salasana (kopioi myös teksti "crypt:")



Tarkista public_key valitsemalla Get public key from string, esim: 
`Public Key: cC6BTxsD5A5Q8yG3g9Pi3FxSSrwwcFyP9N6XfqUmg3U=`


