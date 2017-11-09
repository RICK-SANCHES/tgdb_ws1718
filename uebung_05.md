# Tutorium - Grundlagen Datenbanken - Blatt 5

## Vorbereitungen
* Für dieses Aufgabenblatt wird die SQL-Dump-Datei `01_tutorium.sql` benötigt, die sich im Verzeichnis `sql` befindet.
* Die SQL-Dump-Datei wird in SQL-Plus mittels `start <Dateipfad/zur/sql-dump-datei.sql>` in die Datenbank importiert.
* Beispiele
  * Linux `start ~/Tutorium.sql`
  * Windows `start C:\Users\max.mustermann\Desktop\Tutorium.sql`

## Datenbankmodell
![Datenbankmodell](./img/datamodler_schema.png)

## Aufgaben

### Aufgabe 1
Erstelle mit Dia oder einem anderen Werkzeug eine Abbilung der Mengen, die durch `INNER JOIN`, `RIGHT JOIN`, `LEFT JOIN` und `OUTER JOIN` gemeint sind.

#### Lösung
[Joins](./img/joins.png)

### Aufgabe 2
Welche Personen haben kein Fahrzeug? Löse dies einmal mit `LEFT JOIN` und `RIGHT JOIN`.

#### Lösung
```sql
SELECT ac.surname, ac.forename
FROM account ac
LEFT JOIN acc_vehic av ON (ac.account_id = av.account_id)
WHERE acc_vehic_id = NULL
ORDER BY ac.forename;

```
