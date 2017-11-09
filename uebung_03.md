# Tutorium - Grundlagen Datenbanken - Blatt 3

## Vorbereitungen
* Für dieses Aufgabenblatt wird die SQL-Dump-Datei `tutorium.sql` benötigt, die sich im Verzeichnis `sql` befindet.
* Die SQL-Dump-Datei wird in SQL-Plus mittels `start <Dateipfad/zur/sql-dump-datei.sql>` in die Datenbank importiert.
* Beispiele
  * Linux `start ~/Tutorium.sql`
  * Windows `start C:\Users\max.mustermann\Desktop\Tutorium.sql`

## Datenbankmodell
![Datenbankmodell](./img/datamodler_schema.png)

##Aufgaben

### Aufgabe 1
Erstelle eine `INNER JOIN` (optional `WHERE`) Abfrage um die Beziehungen zwischen den Tabellen `GAS_STATION`, `Provider`, `COUNTRY` und `ADDRESS` aufzulösen, sodass eine ähnliche Ausgabe erstellt wird wie abgebildet.

| Anbieter  | Straße            | PLZ   | Ort         | Land        | Steuer  |
| --------- | ----------------- | ----- | ----------- | ----------- | ------- |
| Shell     | Zurlaubener 1     | 54292 | Trier       | Deutschland | 0.19    |
| Esso      | Triererstraße 10  | 53937 | Hellenthal  | Deutschland | 0,19    |
| ...       | ...               | ...   | ...         | ...         | ...     |

#### Lösung
```sql
SELECT 	provider_name "Anbieter",
		gs.street "Straße",
		a.plz "PLZ",
		a.city "Stadt",
		c.country_name "Land",
		c.duty_amount "Steuer"
FROM gas_station gs
	Inner Join address a ON (gs.address_id = a.address_id)
	Inner Join country c ON (c.country_id = gs.country_id)
	Inner Join provider p ON (gs.provider_id = p.provider_id);
```

### Aufgabe 2
Suche alle Tankstelle raus, deren Straßenname an zweiter Stelle ein `U` haben (case-insensetive). Verändere dazu die Abfrage aus Aufgabe 1. Optional für Enthusiasten, suche mittels Regulärem Ausdruck.

#### Lösung
```sql
SELECT 	provider_name "Anbieter",
		gs.street "Straße",
		a.plz "PLZ",
		a.city "Stadt",
		c.country_name "Land",
		c.duty_amount "Steuer"
FROM gas_station gs
	Inner Join address a ON (gs.address_id = a.address_id)
	Inner Join country c ON (c.country_id = gs.country_id)
	Inner Join provider p ON (gs.provider_id = p.provider_id)
	WHERE gs.street LIKE '_U$';

```

### Aufgabe 3
Suche alle Tankstellen raus, die sich in Trier befinden.

#### Lösung
```sql

SELECT provider_name
FROM gas_station gs
	INNER JOIN provider pr ON (pr.provider_id = gs.provider_id)
	INNER JOIN country cr ON(cr.country_id = gs.country_id)
	INNER JOIN address ad ON (ad.address_id = gs.address_id)
	WHERE city = 'Tier';
	
```

#### Aufgabe 4
Füge eine fiktive Tankstelle hinzu. Sie darf auf keine bestehenden Informationen basieren. Nutze möglichst wenige SQL-Befehle. Rufe fehlende Informationen möglichst direkt ab.

#### Lösung
```sql
INSERT into provider
	VALUES ((SELECT MAX(PROVIDER_ID)+1 FROM PROVIDER), 'Agip');


```

### Aufgabe 5
Erstelle eine INNER JOIN (optional `WHERE`) Abfrage um die Beziehung zwischen den Tabellen `ACCOUNT`, `VEHICLE`, `VEHICLE_TYPE`, `GAS` und `PRODUCER` aufzulösen und zeige die Spalten `FORNAME`, `SURNAME`, `VEHICLE_TYPE_NAME`, `VERSION`, `BUILD_YEAR`, `PRODUCER_NAME` und `GAS_NAME` an. Richte SQL-Plus so ein, dass möglicht jeder Datensatz nur eine Zeile belegt.

* COLUMN <SPALTENNAME> FORMAT a<Zeichenlänge>
* COLUMN <SPALTENNAME> FORMAT <Zahlenlänge, pro Länge eine 9>
* Beispiel für eine Spalte des Datentyps `VARCHAR2`: `COLUMN SURNAME FORMAT a16`
* Beispiel für eine Spalte des Datentyps `NUMERIC`: `COLUMN SOLD_KILOMETER 9999`

#### Lösung
```sql
SET LINE 256
COLUMN FORENAME FORMAT a16
COLUMN SURNAME FORMAT a16
COLUMN VEHICLE_TYPE_NAME FORMAT a16
COLUMN VERSION FORMAT a11
COLUMN BUILD_YEAR FORMAT a10
COLUMN PRODUCER_NAME FORMAT a16
COLUMN GAS_NAME FORMAT a10


SELECT  ac. FORENAME, ac.SURNAME, vp.VEHICLE_TYPE_NAME, vc.VERSION, vc.BUILD_YEAR, pr.PRODUCER_NAME, gs.GAS_NAME
FROM vehicle vc
	INNER JOIN acc_vehic av ON (vc.vehicle_id = av.vehicle_id)
	INNER JOIN account ac ON (ac.account_id = av.account_id)
	INNER JOIN VEHICLE_TYPE vp ON (vp.VEHICLE_TYPE_ID = vp.VEHICLE_TYPE_ID)
	INNER JOIN PRODUCER pr ON (pr.PRODUCER_ID = vc.PRODUCER_ID)
	LEFT JOIN GAS gs ON (vc.DEFAULT_GAS_ID = gs.GAS_ID);

 

### Aufgabe 6
Welche Fahrzeuge wurden noch keinem Benutzer zugewiesen? Gebe über das Fahrzeug Informationen über den Typ, den Hersteller, das Modell, Baujahr und den Kraftstoff aus.

#### Lösung

SELECT vt.VEHICLE_TYPE_NAME, pr.PRODUCER_NAME, ve.VERSION, ve.BUILD_YEAR, gs.GAS_NAME
FROM VEHICLE ve
	INNER JOIN VEHICLE_TYPE vt ON (vt.VEHICLE_TYPE_ID = ve.VEHICLE_TYPE_ID)
    INNER JOIN PRODUCER pr ON (pr.PRODUCER_ID = ve.PRODUCER_ID)
    LEFT JOIN GAS gs ON (ve.DEFAULT_GAS_ID = gs.GAS_ID)
WHERE ve.VEHICLE_ID NOT IN (SELECT VEHICLE_ID FROM ACC_VEHIC);


### Aufgabe 7
Verknüpfe eines der Autos aus Aufgabe 6 mit deinem Benutzernamen. Verwende dazu möglichst wenige SQL-Statements.

#### Lösung
```
INSERT INTO ACC_VEHIC 
VALUES (
  (SELECT MAX(ACC_VEHIC_ID)+1 FROM ACC_VEHIC),
  (SELECT ACCOUNT_ID FROM ACCOUNT WHERE EMAIL = 'wolfni@hochschule-trier.de'),
  9,
  NULL,
  NULL,
  163233,
  10000,
  124542,
  53000,
  SYSDATE,
  SYSDATE,
  (SELECT GAS_ID FROM GAS WHERE GAS_NAME = 'Diesel'),
  SYSDATE,
  SYSDATE  
);
```

### Aufgabe 8
An welcher Tankstelle wurde noch nie getankt? Gebe zu den Tankstellen die Informationen über den Standort der Tankstellen aus.

#### Lösung
```sql
SELECT pr.provider_name, ad.city
FROM gas_station gs
	INNER JOIN provider pr ON (pr.provider_id = gs.provider_id)
	INNER JOIN address ad ON (ad.address_id = gs.address_id)
	WHERE gs.GAS_STATION_ID NOT IN (SELECT GAS_STATION_ID FROM RECEIPT);
```

### Aufgabe 9
Liste alle Benutzer (Vorname und Nachname) mit Fahrzeug (Hersteller, Modell, Alias) auf, die noch nie einen Beleg hinzugefügt haben.

#### Lösung
```sql
SELECT ac.surname, ac.forename, ve.version
FROM account ac
	INNER JOIN acc_vehic av ON (av.account_id = ac.account_ID)
	INNER JOIN vehicle ve ON (ve.vehicle_id = av.vehicle_id)
		WHERE ac.account_id NOT IN (SELECT DISTINCT account_id  from receipt);



```

### Aufgabe 10
Liste alle Benutzer auf, die mit einem Fahrzeug schonmal im Außland tanken waren.

#### Lösung
```sql
SELECT ac.surname, ac.forename, ve.version
FROM account ac
	INNER JOIN acc_vehic av ON (av.account_id = ac.account_ID)
	INNER JOIN vehicle ve ON (ve.vehicle_id = av.vehicle_id)
	INNER JOIN receipt re ON (re.account_id = ac.account_id)
	INNER JOIN gas_station gs ON (gs.gas_station_id = re.gas_station_id)
	    WHERE gs.COUNTRY_ID != (SELECT COUNTRY_ID FROM COUNTRY WHERE
	       COUNTRY_NAME = 'Deutschland');
```

### Aufgabe 11
Wie viele Benutzer haben einen LKW registriert?

#### Lösung
```sql
SELECT COUNT(DISTINCT ac.ACCOUNT_ID) "LKW_USER"
FROM account ac
	INNER JOIN acc_vehic av ON (av.account_id = ac.account_id)
	INNER JOIN vehicle ve ON (ve.vehicle_id = av.vehicle_id)
	INNER JOIN vehicle_type vp ON (vp.vehicle_type_id = ve.vehicle_type_id)
	WHERE vp.vehicle_type_name = 'LKW';



```

### Aufgabe 12
Wie viele Benutzer haben einen PKW und einen LKW registriert?

#### Lösung
```sql
SELECT COUNT(DISTINCT ac.ACCOUNT_ID) "LKW_USER"
FROM account ac
	INNER JOIN acc_vehic av ON (av.account_id = ac.account_id)
	INNER JOIN vehicle ve ON (ve.vehicle_id = av.vehicle_id)
	INNER JOIN vehicle_type vp ON (vp.vehicle_type_id = ve.vehicle_type_id)
	WHERE vp.vehicle_type_name = 'LKW'
	AND
	(SELECT COUNT(DISTINCT ac.ACCOUNT_ID) "PKW_USER"
	FROM account ac
		INNER JOIN acc_vehic av ON (av.account_id = ac.account_id)
		INNER JOIN vehicle ve ON (ve.vehicle_id = av.vehicle_id)
		INNER JOIN vehicle_type vp ON (vp.vehicle_type_id = ve.vehicle_type_id)
		WHERE vp.vehicle_type_name = 'PKW');

	

```

### Aufgabe 13
Führe den Patch `02_patch.sql`, der sich im Verzeichnis `sql` befindet, in deiner Datenbank aus. Wie lautet der Befehlt zum import?

#### Lösung
```sql

start /Users/nicowolf/workspace/github.com/RICK-SANCHES/tgdb_ws1718/sql/02_patch.sql

```

### Aufgabe 14
Aktualisiere den Steuersatz aller Belege auf den Steuersatz des Landes, indem die Kunden getankt haben.

#### Lösung
```sql

UPDATE receipt re
 SET duty_amount = ( 
   	SELECT co.DUTY_AMOUNT
 	FROM COUNTRY co
 	WHERE co.COUNTRY_ID = (
       SELECT gs.COUNTRY_ID
       FROM GAS_STATION gs
       WHERE gs.GAS_STATION_ID = re.GAS_STATION_ID
     ));	

```


