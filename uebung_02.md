# Tutorium - Grundlagen Datenbanken - Blatt 2

## Vorbereitungen
* Für dieses Aufgabenblatt wird die SQL-Dump-Datei `tutorium.sql` benötigt, die sich im Verzeichnis `sql` befindet.
* Die SQL-Dump-Datei wird in SQL-Plus mittels `start <Dateipfad/zur/sql-dump-datei.sql>` in die Datenbank importiert.
* Beispiele
  * Linux `start ~/Tutorium.sql`
  * Windows `start C:\Users\max.mustermann\Desktop\Tutorium.sql`

## Datenbankmodell
![Datenbankmodell](./img/datamodler_schema.png)

## Aufgaben

### Aufgabe 1
Schaue dir das Datenbankmodell an. Wofür steht hinter dem Datentyp `NUMBER` die Zahlen in den runden Klammern?
Nehme dir die Oracle [Dokumentation](https://docs.oracle.com/cd/B28359_01/server.111/b28318/datatype.htm#CNCPT012) zu Hilfe.

#### Lösung

Der Datentyp 'Number(n,p)' steht für Dezimalzahlige Werte. 'n' steht für die insgesamt zu vergebenen Stellen, von denen 'p' die Nackommastellen bilden.

### Aufgabe 2
Was bedeuten die durchgezogenen Linien, die zwischen einigen Tabellen abgebildet sind?

#### Lösung
Ein direkter Verweis auf einen andere Tabelle.

### Aufgabe 3
Was bedeutet die gestrichelte Linie, die zwischen der Tabelle `ACC_VEHIC` und `GAS_STATION` abgebildet ist?

#### Lösung
Die gestreichelte Linie bedeutet optionale Partizipation

### Aufgabe 3
Die folgende Abbildung beschreibt eine Beziehung zwischen Tabellen. Sie wird auch `n` zu `m` Beziehung genannt. Beschreibe kurz die Bedeutung dieser Beziehung.
Nehme dir diesen [Artikel](https://glossar.hs-augsburg.de/Beziehungstypen) zu Hilfe.

![n-to-m-relationship](./img/n-to-m-relationship.png)

n zu m Beziehung steht für viele zu viele. 

### Aufgabe 4
Was bedeutet der Buchstabe `P` und `F` neben den Attributen von Tabellen?

#### Lösung
P - Primary Key
F - Foreign Key

### Aufgabe 5
Importiere die SQL-Dump-Datei in dein eigenes Schema. Wie lautet dazu der Befehl um dem import zu starten?

#### Lösung
```sql
START /Users/nicowolf/workspace/github.com/RICK-SANCHES/tgdb_ws1718/sql/tutorium.sql
```

### Aufgabe 6
Gebe alle Datensätze der Tabelle `ACCOUNT` aus.

#### Lösung
```sql
SELECT * 
FROM ACCOUNT;
```

### Aufgabe 7
Modifiziere Aufgabe 6 so, dass nur die Spalte `ACCOUNT_ID` ausgegeben wird.

#### Lösung
```sql
SELECT ACCOUNT_ID
FROM ACCOUNT;
```

### Aufgabe 8
Gebe alle Spalten der Tabelle `VEHICLE` aus.

#### Lösung
```sql
SELECT *
FROM VEHICLE;
```

### Aufgabe 9
Kombiniere Aufgabe 7 und 8 so, dass nur Personen (`ACCOUNT`) angezeigt werden, die ein Auto (`VEHICLE`) besitzen.

#### Lösung
```sql
SELECT DISTINCT ac.surname 
FROM ACCOUNT ac
INNER JOIN ACC_VEHIC ve ON ac.ACCOUNT_ID = ve.ACCOUNT_ID;
```

### Aufgabe 10
Modifizierde die Aufgabe 9 so, dass nur die Person mit der `ACCOUNT_ID` = `7` angezeigt wird.

#### Lösung
```sql
 SELECT DISTINCT ac.surname 
 FROM ACCOUNT ac
 INNER JOIN ACC_VEHIC ve 
 ON ac.ACCOUNT_ID = 7;
```

### Aufgabe 11
Erstelle für dich einen neuen Benutzer.
> Achtung, nutze für die Spalten `C_DATE` und `U_DATE` vorerst die Syntax `SYSDATE` - [Dokumentation](https://docs.oracle.com/cd/B19306_01/server.102/b14200/functions172.htm)

#### Lösung
```sql
Insert into ACCOUNT (ACCOUNT_ID,SURNAME,FORENAME,EMAIL,C_DATE,U_DATE) 
values ('13','Wolf','Nico','wolfni@hochschule-trier.de',SYSDATE,SYSDATE);
```

### Aufgabe 12
Erstelle für deinen neuen Benutzer ein neues Auto. Dieses Auto dient als Vorlage für die nächten Aufgaben.

#### Lösung
```sql
Insert into VEHICLE (VEHICLE_ID,VEHICLE_TYPE_ID,PRODUCER_ID,VERSION,DEFAULT_GAS_ID,PS,BUILD_YEAR,DOORS,C_DATE,U_DATE) 
values ('18','1','12','Ford Focus','1','105',SYSDATE,'5',SYSDATE,SYSDATE);
```

### Aufgabe 13
Verknüpfe das aus Aufgabe 12 erstellte neue Auto mit deinem neuen Benutzer aus Aufgabe 11 in der Tabelle `ACC_VEHIC` und erstelle den ersten Rechnungsbeleg.

#### Lösung
```sql
Insert into ACC_VEHIC (ACC_VEHIC_ID,ACCOUNT_ID,VEHICLE_ID,IDENTICATOR,ALIAS,BUY_PRICE,BUY_KILOMETER,SOLD_PRICE,SOLD_KILOMETER,REGISTRATION,CHECKOUT,DEFAULT_GAS_STATION,C_DATE,U_DATE) 
values ('18','13','116','TR:N 2312','Rostlaube','432','159451',null,null,SYSDATE,null,'1',SYSDATE,SYSDATE);
```

### Aufgabe 14
Ändere den Vorname `SURNAME` des Datensatzes mit der ID `7` in der Tabelle `ACCOUNT` auf `Zimmermann`.

#### Lösung
```sql
UPDATE ACCOUNT
SET SURNAME = 'Zimmermann'
WHERE ACCOUNT_ID = 7;
```

### Aufgabe 15
Speichere alle Änderungen deiner offenen Transaktion. Wie lautet der SQL-Befehl dazu?

#### Lösung
```sql
commit;
```
