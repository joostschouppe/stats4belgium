* Encoding: windows-1252.
* in LOCALE aanmaken en verwerken, anders geeft het fouten bij de verwerking.
* eventuele verrijken met GIS: locatie, oppervlakte; hier niet gebeurd.

* locatie van je bestanden.
* pas dit aan naar de map waar je legger staat.
DEFINE basismap () 'G:\OD_IF_AUD\2_04_Statistiek\2_04_01_Data_en_kaarten\kadaster_percelen\kadaster_gebouwdelen_2015\legger\' !ENDDEFINE.


* Belangrijke tabel: eigenaars.
GET DATA  /TYPE=TXT
  /FILE=
    '' + basismap + 'pe.txt'
  /DELCASE=LINE
  /DELIMITERS=";"
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=1
  /IMPORTCASE=ALL
  /VARIABLES=
Eig_naam a110
Eig_code a15
Art_nr a10
pos f1
eigenaar_post_stad a30
Eig_adres a46
leeg a5
Eig_deel a36
eig_deel_einderecht a10.
CACHE.
EXECUTE.
DATASET NAME eigenaars WINDOW=FRONT.
variable labels eig_naam "pe".
variable labels Eig_code "cod".
variable labels eigenaar_post_stad "adr1".
variable labels Eig_adres "adr2".
variable labels pos "pos (eigenaar volgnummer)".
variable labels leeg "lt (taal)".
variable labels Art_nr "daa".
variable labels Eig_deel "dr (recht)".
variable labels eig_deel_einderecht "dr+ (einde recht)".

SAVE OUTFILE='' + basismap + 'pe.sav'
  /COMPRESSED.


* belangrijke tabel: eigenaarsdelen.
GET DATA  /TYPE=TXT
  /FILE=
       '' + basismap + 'prc.txt'
  /DELCASE=LINE
  /DELIMITERS=";"
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=1
  /IMPORTCASE=ALL
  /VARIABLES=
 daa A10
ord A4
in A2
anta A9
sl1 A37
prc A12
na1 A14
co1 F12
ha1 A8
cod1 A2
ri1 A7
cac A4
ddi A2
cc A38
notif A4
caoo A237
rscod A5
rslt A1
rsnr A4
rspos A2
acj A4
n1 A1
tv A1
mo A2
ha F12
pw1 A2
sl2 A47
pw2 A2
na2 A14
n2 A1
co2 F12
ha2 A8
cod2 A2
ri2 F12.
CACHE.
EXECUTE.
DATASET NAME prc WINDOW=FRONT.

SAVE OUTFILE='' + basismap + 'prc.sav'
  /COMPRESSED.


* niet gebruikte tabellen.
GET DATA  /TYPE=TXT
  /FILE=
    '' + basismap + 'pas.txt'
  /DELCASE=LINE
  /DELIMITERS=";"
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=1
  /IMPORTCASE=ALL
  /VARIABLES=
  da F5.0
  inA F2.0
  artA F5.0
  ordA F4.0
  prcA A12
  sl2A A10
  crscA A3
  inB F2.0
  artB F5.0
  ordB F4.0
  prcB A12.
CACHE.
EXECUTE.
DATASET NAME pastemp WINDOW=FRONT.

SAVE OUTFILE='' + basismap + 'pas_temp.sav'
  /COMPRESSED.

GET DATA  /TYPE=TXT
  /FILE=
    '' + basismap + 'map.txt'
  /DELCASE=LINE
  /DELIMITERS=";"
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=1
  /IMPORTCASE=ALL
  /VARIABLES=
  da  F5.0
  prc_ A12
  sheet A6.
CACHE.
EXECUTE.
DATASET NAME maptemp WINDOW=FRONT.
SAVE OUTFILE='' + basismap + 'maptemp.sav'
  /COMPRESSED.

GET DATA  /TYPE=TXT
  /FILE=
    '' + basismap + 'da.txt'
  /DELCASE=LINE
  /DELIMITERS=";"
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=1
  /IMPORTCASE=ALL
  /VARIABLES=
  da F5.0
  dan1 A32
  lt_kadaster A1
  admnr a5
  da1 a2
  adm1 a25
  mut a2.
CACHE.
EXECUTE.
DATASET NAME da WINDOW=FRONT.
SAVE OUTFILE='' + basismap + 'da.sav'
  /COMPRESSED.

GET DATA  /TYPE=TXT
  /FILE=
    '' + basismap + 'art.txt'
  /DELCASE=LINE
  /DELIMITERS=";"
  /ARRANGEMENT=DELIMITED
  /FIRSTCASE=1
  /IMPORTCASE=ALL
  /VARIABLES=
  daa F10.0
  t05 F1.0
  t06 F6.0
  t07 F4.0
  t01 F1.0
  t02 F5.0
  t03 F1.0
  t04 F1.0
  t08 F1.0
  t09 F4.0
  t10 F1.0
  t11 F1.0
  t12 F1.0
  t13 F6.0
  t14 F5.0.
CACHE.
EXECUTE.
DATASET NAME art WINDOW=FRONT.
SAVE OUTFILE='' + basismap + 'art.sav'
  /COMPRESSED.



dataset close da.
dataset close maptemp.
dataset close art.
dataset close pastemp.
