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
Der Datentyp `NUMBER` ermöglicht das speichern von positiven als auch negativen Ganzzahlen und Fließkommazahlen. Die Werte in den Klammern haben unterschiedliche Bedeutungen. Die erste Stelle in der Klammer steht für die Gesamte Anzahl von Zahlen und die zweite Stelle, wie viele Zahlen hinter dem Komma stehen.

Einige Beispiele:

| Deklaration   | Beispielmöglichkeiten                   |
| ------------- | --------------------------------------- |
| NUMBER(38,0)  | 9999999999999999999999999999999999999   |
| NUMBER(3,2)   | 1.81, 9.74, 0.54                        |
| NUMBER(5,2)   | 842.52, 965.45, 14.45                   |

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

#### Lösung
Eine `n` zu `m` Beziehung beschreibt, dass `n` Datensätze mit `m` Datensätze verknüpft werden können. Als Beispiel kann hier eine Person mehrere Hobbys haben. Die Verknüpfung welche Hobbies eine Person hat wird in der Tabelle `PERSON_HOBBY` abgebildet.

### Aufgabe 4
Was bedeutet der Buchstabe `P` und `F` neben den Attributen von Tabellen?

#### Lösung
Das `P` steht für Primary-Key und `F` steht für Foreign-Key.

### Aufgabe 5
Importiere die SQL-Dump-Datei in dein eigenes Schema. Wie lautet dazu der Befehl um dem import zu starten?

#### Lösung
```sql
start /Users/nicowolf/workspace/github.com/RICK-SANCHES/tgdb_ws1718/01_tutorium.sql
```

### Aufgabe 6
Gebe alle Datensätze der Tabelle `ACCOUNT` aus.

#### Lösung
```sql
SELECT *
FROM account;
```

### Aufgabe 7
Modifiziere Aufgabe 6 so, dass nur die Spalte `ACCOUNT_ID` ausgegeben wird.

#### Lösung
```sql
SELECT account_id
FROM account;
```

### Aufgabe 8
Gebe alle Spalten der Tabelle `VEHICLE` aus.

#### Lösung
```sql
SELECT *
FROM vehicle;
```

### Aufgabe 9
Kombiniere Aufgabe 7 und 8 so, dass nur Personen (`ACCOUNT`) angezeigt werden, die ein Auto (`VEHICLE`) besitzen.

#### Lösung
```sql
SELECT surname, forename
FROM account
WHERE account_id IN (
  SELECT account_id
  FROM vehicle
);
```

### Aufgabe 10
Modifizierde die Aufgabe 9 so, dass nur die Person mit der `ACCOUNT_ID` = `7` angezeigt wird.

#### Lösung
```sql
SELECT surname, forename
FROM account
WHERE account_id IN (
  SELECT account_id
  FROM vehicle
)
AND account_id = 7;
```

### Aufgabe 11
Erstelle für dich einen neuen Benutzer.
> Achtung, nutze für die Spalten `C_DATE` und `U_DATE` vorerst die Syntax `SYSDATE` - [Dokumentation](https://docs.oracle.com/cd/B19306_01/server.102/b14200/functions172.htm)

#### Lösung
```sql
INSERT INTO account (account_id, surname, forename, email, c_date)
VALUES (999, 'Wolf', 'Nicolas', 'wolfni@fh-trier.de', SYSDATE);
```

### Aufgabe 12
Erstelle für deinen neuen Benutzer ein neues Auto. Dieses Auto dient als Vorlage für die nächten Aufgaben.

#### Lösung
```sql
-- VEHICLE_TYPE_ID = 1 (PKW)
SELECT *
FROM vehicle_type;

-- PRODUCER_ID = 4 (Volvo)
SELECT *
FROM producer;

-- Erstellen des Autos
INSERT INTO vehicle
VALUES (999, 1, 4, 'Focus', NULL, 150, SYSDATE, '5', SYSDATE, SYSDATE);

-- Dynamisches SQL (Alles in einem)
INSERT INTO vehicle (vehicle_id, vehicle_type_id, producer_id, version, default_gas_id, ps, c_date, u_date)
VALUES (
          (SELECT MAX(vehicle_id) + 1 FROM vehicle),
          (SELECT vehicle_type_id FROM vehicle_type WHERE vehicle_type_name = 'PKW'),
          (SELECT producer_id FROM producer WHERE producer_name = 'Ford'),
          'Focus',
          NULL,
          105,
          SYSDATE,
          SYSDATE);
```

### Aufgabe 13
Verknüpfe das aus Aufgabe 12 erstellte neue Auto mit deinem neuen Benutzer aus Aufgabe 11 in der Tabelle `ACC_VEHIC` und erstelle den ersten Rechnungsbeleg.

#### Lösung
```sql
INSERT INTO acc_vehic (acc_vehic_id, account_id, , identicator, alias, buy_price, buy_kilometer, sold_price, sold_kilometer, registration, checkout, default_gas_station, c_date, u_date)
VALUES (9, 999, 13, 'TR:NW:23', 'Meine Karre', 4750.00, 15240, NULL, NULL, SYSDATE, NULL, NULL, SYSDATE, SYSDATE);
```

### Aufgabe 14
Ändere den Vorname `SURNAME` des Datensatzes mit der ID `7` in der Tabelle `ACCOUNT` auf `Zimmermann`.

#### Lösung
```sql
UPDATE account
SET surname='Zimmermann'
WHERE account_id=7;
```

### Aufgabe 15
Speichere alle Änderungen deiner offenen Transaktion. Wie lautet der SQL-Befehl dazu?

#### Lösung
```sql
COMMIT;
```
