# LoveAtFirstBite
Projekt pri predmetu Praktikum I

<b>Bistvo</b>


Kuharski recepti so učinkovita pomoč pri pripravi zdrave in okusne hrane. Še vedno so
najpogosteje objavljeni v obliki tiskanih knjig ali nestrukturiranih objav na spleti.
Pripravili smo platformo, ki bo omogočala gostovanje kuharskih receptov in njihovo iskanje po
različnih kriterijih (vrsta obroka, čas priprave ipd.). Prav tako smo
omogočili sodelovanje avtorjev in uporabnikov receptov v smislu ocenjevanja receptov
in deljenja.

<b>Navodila za vzpostavitev</b>:
- Potrebno si je kreirati datasource v Wildfly aplikacijskem strežniku. Ugasnemo strežnik in prepišemo datoteke v njegovem imenu z temi, ki so v sledečem imeniku (prenos): https://mega.nz/#!KZMg1DCS!iNFLC8482Xl1U_pn8hj54rDGCMV9ZphFveeV5pOzOBs
- Najprej v MySQL ustvarimo podatkovno bazo "prk_i_recepti"

  `CREATE DATABASE IF NOT EXISTS prk_i_recepti`;

- Nato s pomočjo GUI na administrativni konzoli WF strežnika ustvarimo novi Non XA datasource s pomočjo zaznanega MySQL driverja in nastavimo name na "prk_i_recepti", JNDI na "java:/prk_i_recepti" in povezavo na "jdbc:mysql://localhost:3306/prk_i_recepti"

- Desnim klikom na projekt v razvojnem okolju odpremo Properties->Java Build Path->Add external JARs, najdemo mapo 'knjiznice' in vkljucimo vse jar, ![iText-2.1.7.jar](/knjiznice/iText-2.1.7.jar) in ![itextpdf-5.4.0.jar](/knjiznice/itextpdf-5.4.0.jar) datoteke iz te mape. Nato kliknemo Apply and close.

- V MySQL Workbench-u izberite prk_i_recepti in zaženite preneseno skripto ![baza.sql](/nacrt/baza.sql). Prethodno ustvarjene tabele, prvo drop-ajte.
