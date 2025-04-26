# Miksi versionhallinta

Git on hajautettu versionhallintajärjestelmä, joka kehitettiin alun perin Linuxin ytimen kehitystä varten. Se on työkalu, joka seuraa tiedostojen muutoksia ajan mittaan ja mahdollistaa useiden kehittäjien yhteistyön samojen tiedostojen parissa.

Git on välttämätön nykyaikaisessa ohjelmistokehityksessä useista syistä:

1. **Muutoshistoria**: Git tallentaa täydellisen historian kaikista koodiin tehdyistä muutoksista, mikä mahdollistaa aiempiin versioihin palaamisen ja muutosten seuraamisen.

2. **Rinnakkainen kehitys**: Ominaisuus, joka tunnetaan "branchingina" (haaroittumisena), mahdollistaa useiden kehittäjien samanaikaisen työskentelyn samassa projektissa ilman, että he häiritsevät toistensa työtä.

3. **Yhteistyö**: Git helpottaa merkittävästi tiimityöskentelyä tarjoamalla mekanismeja koodin yhdistämiseen (merge) ja konfliktien ratkaisemiseen.

4. **Varmuuskopiointi**: Hajautettuna järjestelmänä Git varmistaa, että koodi on tallennettu useisiin paikkoihin, mikä suojaa tietojen menetykseltä.

5. **Laadunvarmistus**: Git tukee koodikatselmointi- ja testaustyönkulkuja, kuten muutospyyntöjä (pull request), jotka parantavat koodin laatua.

6. **Dokumentaatio**: Tallennusviestit (commit) ja historiaa koskevat merkinnät toimivat epävirallisena dokumentaationa siitä, miksi tiettyjä muutoksia tehtiin.

7. **Kokeilu**: Kehittäjät voivat kokeilla uusia ideoita erillisissä haaroissa riskittömästi.

Kuten professori Brian Fitzgerald on todennut tutkimuksessaan "Continuous Software Engineering" (IEEE Software, 2017): "Versionhallinta on kriittinen infrastruktuuri, joka mahdollistaa nykyaikaiset ketterät kehityskäytännöt ja jatkuvan integraation, jotka puolestaan ovat avainasemassa nykyajan nopeatahtisessa ohjelmistokehityksessä."

## Luettavaa

Fitzgerald, B., & Stol, K. J. (2017). Continuous software engineering: A roadmap and agenda. Journal of Systems and Software, 123, 176-189. https://doi.org/10.1016/j.jss.2015.06.063

Tässä tutkimuksessa Fitzgerald ja Stol käsittelevät laajemmin jatkuvan ohjelmistokehityksen (continuous software engineering) käsitettä, johon versionhallinta kuten Git kuuluu olennaisena osana. He esittävät kattavan näkemyksen siitä, miten versionhallinta on yksi keskeisistä teknologioista, joka tukee jatkuvan integraation (CI) , toimittamisen ja käyttöönoton (CD) käytäntöjä nykyaikaisessa ohjelmistokehityksessä.