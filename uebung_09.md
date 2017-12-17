# Tutorium - Grundlagen Datenbanken - Blatt 9

## Vorbereitungen
* Für dieses Aufgabenblatt wird die SQL-Dump-Datei `tutorium.sql` benötigt, die sich im Verzeichnis `sql` befindet.
* Die SQL-Dump-Datei wird in SQL-Plus mittels `start <Dateipfad/zur/sql-dump-datei.sql>` in die Datenbank importiert.
* Beispiele
  * Linux `start ~/Tutorium.sql`
  * Windows `start C:\Users\max.mustermann\Desktop\Tutorium.sql`

## Datenbankmodell
![Datenbankmodell](./img/datamodler_schema.png)

### Aufgabe 1
Wo liegen die Vor- und Nachteile eines Trigger in Vergleich zu einer Prozedur?

#### Lösung
Deine Lösung

Ein Trigger kann bei relationalen Datenbankmodellen ein abgespeichertes Programm aufrufen, welches beispielsweise bestimmte Änderungen blockiert oder verhindert.

### Aufgabe 2
Wo drin unterscheidet sich der `Row Level Trigger` von einem `Statement Trigger`?

#### Lösung

Der Unterschied besteht in der Anzahl zugelassner Änderungen.


### Aufgabe 3
Schaue dir den folgenden PL/SQL-Code an. Was macht er?

```sql
CREATE SEQUENCE seq_account_id
START WITH 1000
INCREMENT BY 1
MAXVALUE 99999999
CYCLE
CREATE SEQUENCE seq_fachbereich
START WITH 15
INCREMENT BY 1
MAXVALUE 1000
CYCLE
CACHE 20;

CREATE OR REPLACE TRIGGER BIU_FACHBEREICH
BEFORE INSERT OR UPDATE OF fachbereich ON fachbereich
FOR EACH ROW
DECLARE

BEGIN
  IF UPDATING('fachbereichnr') THEN
    RAISE_APPLICATION_ERROR(-20001, 'Die Fachbereichnr darf nicht verändert oder frei gewählt werden!');
  END IF;
  ;
CACHE 20;

CREATE OR REPLACE TRIGGER BIU_ACCOUNT
BEFORE INSERT OR UPDATE OF account_id ON account
FOR EACH ROW
DECLARE

BEGIN
  IF UPDATING('account_id') THEN
    RAISE_APPLICATION_ERROR(-20001, 'Die Account-ID darf nicht verändert oder frei gewählt werden!');
  END IF;

  IF INSERTING THEN
    :NEW.account_id := seq_account_id.NEXTVAL;
  END IF;
END;
/
```

#### Lösung

Der Trigger verhindert, dass eine Account_ID einfach vom User 'frei' hinzugfügt wird. Es soll bei der Wahl der ID auf die erstellte Sequenz zugegriffen werden.


### Aufgabe 4
Verbessere den Trigger aus Aufgabe 2 so, dass
+ wenn versucht wird einen Datensatz mit `NULL` Werten zu füllen, die alten Wert für alle Spalten, die als `NOT NULL` gekennzeichnet sind, behalten bleiben.
+ es nicht möglich ist, dass die Werte für `C_DATE` und `U_DATE` in der Zukunkt liegen
+ `U_DATE` >= `C_DATE` sein muss
+ der erste Buchstabe jedes Wortes im Vor- und Nachnamen groß geschrieben wird
+ die Account-ID aus einer `SEQUENCE` entnommen wird
CREATE OR REPLACE TRIGGER BIU_FACHBEREICH
BEFORE INSERT OR UPDATE OF fachbereich ON fachbereich
FOR EACH ROW
DECLARE

BEGIN
  IF UPDATING('fachbereichnr') THEN
    RAISE_APPLICATION_ERROR(-20001, 'Die Fachbereichnr darf nicht verändert oder frei gewählt werden!');
  END IF
  IF INSERTING THEN
    :NEW.fachbereichnr := seq_fachbereich.NEXTVAL;
  END IF;
END;
/
  
Nutze die Lösung der Aufgabe 2, Aufgabenblatt 8 um die Aufgabe zu lösen. Dort solltest du einige Hilfestellungen finden.

#### Lösung
```sql

CREATE OR REPLACE TRIGGER BIU_ACCOUNT_2
BEFORE INSERT OR UPDATE OF account_id ON account
FOCREATE OR REPLACE TRIGGER BIU_FACHBEREICH
BEFORE INSERT OR UPDATE OF fachbereichnr ON fachbereich
FOR EACH ROW
DECLARE

BEGIN
  IF UPDATING('fachbereichnr') THEN
    RAISE_APPLICATION_ERROR(-20001, 'Die Fachbereichnr darf nicht verändert oder frei gewählt werden!');
  END IF;
  IF INSERTING THEN
    :NEW.fachbereichnr := seq_fachbereich.NEXTVAL;
  END IF;
END;
/
  R EACH ROW
DECLARE

BEGIN
  IF UPDATING('account_id') = NULL THEN
    RAISE_APPLICATION_ERROR(-20002, 'Die Account-ID darf nicht NULL sein!');
	
	ELSE IF Updating ('U_DATE')
    RAISE_APPLICATION_ERROR(-20003, 'Das Datum darf nicht in der Vergangenheit liegen');
	
  END IF;

  IF INSERTING THEN
    :NEW.account_id := seq_account_id.NEXTVAL;
  END IF;
END;
/
```

### Aufgabe 5
Angenommen der Steuersatz in Deutschland sinkt von 19% auf 17%.
+ Aktualisiere den Steuersatz von Deutschland und
+ alle Quittungen die nach dem `01.10.2017` gespeichert wurden.

#### Lösung
```sql
Deine Lösung
```

### Aufgabe 6
Liste alle Hersteller auf, die LKW's produzieren und verknüpfe diese ggfl. mit den Eigentümern.

#### Lösung
```sql
Deine Lösung
```


























