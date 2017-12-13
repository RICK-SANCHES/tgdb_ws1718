/* 	Aufgabe 1
a)Laden Sie die Datei  k:\steinbus\grund_ws1516.sql in einen Editor und speichern Sie sie in Ihrem Verzeichnis ab. Ergänzen Sie in dieser Datei um die Anlage eines Primary Keys für die Tabelle K_D_S und die beiden Foreign Keys ‚FK_SEMESTER‘ und ‚FK_DOZENT‘ mit geeigneten Delete Rules.

*/
--primary Keys
ALTER TABLE k_d_s
ADD CONSTRAINT pk_kds PRIMARY KEY(Semester);	

ALTER TABLE k_d_s
ADD CONSTRAINT pk_kds_1 PRIMARY KEY(Dozentennr);

ALTER TABLE k_d_s
ADD CONSTRAINT pk_kds_2 PRIMARY KEY(Klausurnr);

-- foreign Keys
ALTER TABLE K_D_S
ADD CONSTRAINT fk_dozent FOREIGN KEY(dozentennr)
REFERENCES dozent;

ALTER TABLE K_D_S
ADD CONSTRAINT fk_Semester FOREIGN KEY(Semster)
REFERENCES Semester;



/*	
b) Starten Sie das so veränderte Skript.
*/

`start K:\Steinbus\grund_ws1516.sql`

/*
c) Stellen Sie sicher, dass beim Einfügen eines neuen Dozenten die Dozentennummer aus einer Sequenz genommen wird. Legen Sie diese Sequenz DOZ_SEQ vorher an mit Start bei 1000.
*/

CREATE SEQUENCE doz_seq
START WITH 1000
INCREMENT BY 1
MAXVALUE 99999999
CYCLE
CACHE 20;

CREATE OR REPLACE TRIGGER doz
BEFORE INSERT OR UPDATE OF dozentennr ON dozent
FOR EACH ROW
DECLARE

BEGIN
  IF UPDATING('dozentennr') THEN
    RAISE_APPLICATION_ERROR(-20001, 'Die Dozentennr darf nicht verändert oder frei gewählt werden!');
  END IF;

  IF INSERTING THEN
    :NEW.dozentennr := doz_seq.NEXTVAL;
  END IF;
END;
/


/*
d) Legen Sie den Foreign Key FK_KLAUSUR an. Bedenken Sie dabei, dass im folgenden Aufgabenteil e) beim Einfügen einer Klausur sichergestellt werden soll, dass zu dieser Klausur vorher bereits ein Eintrag in K_D_S angelegt wurde.
*/

ALTER TABLE KLausur
ADD CONSTRAINT fk_klausur FOREIGN KEY (klausurnr)
REFERENCES klausur (klausurnr)
DEFERRABLE INITIALLY DEFERRED;


/*
e) Stellen Sie sicher, wie in d) schon angedeutet, dass beim Einfügen einer neuen Klausur vorher in der Tabelle K_D_S eine Zuordnung dieser Klausur zu einem Semester und einem verantwortlichen Dozenten erfolgen muss.
*/

??


/*
f) Fügen Sie sich in die Tabelle studentische_person ein und lassen Sie in Ihren Studiengang eine neues Fach ‚Advanced Databases‘ anbieten. Legen Sie zu diesem Fach eine Klausur an. Die Klausur soll im WS2015 von Professor Steinfuss (Dozentennr. 1) betreut werden. 
*/

INSERT INTO studentische_person (matrikelnr ,name, studiengangnr, unix_name)
VALUES (1234,'Wolf',
	(SELECT studiengangnr 
	FROM studiengang 
	WHERE bezeichnung = 'BSc Wirtschaftsinformatik';)
	,'WOLFNI')
;

