--------------------------------------------------------
--  DDL for Table BESTELLUNG
--------------------------------------------------------

--------------------------------------------------------
--  DDL for Table BESTELL_POSITION
--------------------------------------------------------
CREATE TABLE "BESTELL_POSITION" (
  "BESTELLNR" NUMBER(10,0) NOT NULL,
  "ARTIKELNR" NUMBER(10,0) NOT NULL,
  "MENGE" NUMBER(10,0) NOT NULL,
  "POSITIONSNUMMER" NUMBER(10,0)
);

--------------------------------------------------------
--  DDL for Table KUNDE
--------------------------------------------------------
CREATE TABLE "KUNDE" (
  "KUNDENNR" NUMBER(10,0) NOT NULL,
  "NAME" VARCHAR2(30) NOT NULL,
  CONSTRAINT "PK_KUNDE" PRIMARY KEY ("KUNDENNR")
);

INSERT INTO BESTELLUNG (BESTELLNR,KUNDENNR,BESTELLDATUM,LIEFERDATUM) VALUES ('893','4',TO_DATE('08.03.11','DD.MM.RR'),NULL);
INSERT INTO BESTELLUNG (BESTELLNR,KUNDENNR,BESTELLDATUM,LIEFERDATUM) VALUES ('1141','3',TO_DATE('15.12.09','DD.MM.RR'),NULL);
INSERT INTO BESTELLUNG (BESTELLNR,KUNDENNR,BESTELLDATUM,LIEFERDATUM) VALUES ('2912','2',TO_DATE('15.11.10','DD.MM.RR'),NULL);
INSERT INTO BESTELLUNG (BESTELLNR,KUNDENNR,BESTELLDATUM,LIEFERDATUM) VALUES ('1302','3',TO_DATE('28.09.04','DD.MM.RR'),NULL);
INSERT INTO BESTELLUNG (BESTELLNR,KUNDENNR,BESTELLDATUM,LIEFERDATUM) VALUES ('4065','4',TO_DATE('01.10.06','DD.MM.RR'),NULL);
INSERT INTO BESTELLUNG (BESTELLNR,KUNDENNR,BESTELLDATUM,LIEFERDATUM) VALUES ('4229','2',TO_DATE('13.05.08','DD.MM.RR'),NULL);
INSERT INTO BESTELLUNG (BESTELLNR,KUNDENNR,BESTELLDATUM,LIEFERDATUM) VALUES ('3399','3',TO_DATE('27.09.06','DD.MM.RR'),NULL);
INSERT INTO BESTELLUNG (BESTELLNR,KUNDENNR,BESTELLDATUM,LIEFERDATUM) VALUES ('3552','2',TO_DATE('19.06.06','DD.MM.RR'),NULL);
INSERT INTO BESTELLUNG (BESTELLNR,KUNDENNR,BESTELLDATUM,LIEFERDATUM) VALUES ('3714','3',TO_DATE('18.01.06','DD.MM.RR'),NULL);
INSERT INTO BESTELLUNG (BESTELLNR,KUNDENNR,BESTELLDATUM,LIEFERDATUM) VALUES ('5471','3',TO_DATE('22.04.10','DD.MM.RR'),NULL);
INSERT INTO BESTELLUNG (BESTELLNR,KUNDENNR,BESTELLDATUM,LIEFERDATUM) VALUES ('5544','4',TO_DATE('09.09.05','DD.MM.RR'),NULL);
INSERT INTO BESTELLUNG (BESTELLNR,KUNDENNR,BESTELLDATUM,LIEFERDATUM) VALUES ('4473','3',TO_DATE('31.12.08','DD.MM.RR'),NULL);
INSERT INTO BESTELLUNG (BESTELLNR,KUNDENNR,BESTELLDATUM,LIEFERDATUM) VALUES ('6721','3',TO_DATE('03.12.06','DD.MM.RR'),NULL);
INSERT INTO BESTELLUNG (BESTELLNR,KUNDENNR,BESTELLDATUM,LIEFERDATUM) VALUES ('7866','2',TO_DATE('04.02.08','DD.MM.RR'),NULL);
INSERT INTO BESTELLUNG (BESTELLNR,KUNDENNR,BESTELLDATUM,LIEFERDATUM) VALUES ('10799','4',TO_DATE('26.06.05','DD.MM.RR'),NULL);
INSERT INTO BESTELLUNG (BESTELLNR,KUNDENNR,BESTELLDATUM,LIEFERDATUM) VALUES ('9571','2',TO_DATE('30.10.05','DD.MM.RR'),NULL);
INSERT INTO BESTELLUNG (BESTELLNR,KUNDENNR,BESTELLDATUM,LIEFERDATUM) VALUES ('9693','3',TO_DATE('10.07.10','DD.MM.RR'),NULL);
INSERT INTO BESTELLUNG (BESTELLNR,KUNDENNR,BESTELLDATUM,LIEFERDATUM) VALUES ('10257','2',TO_DATE('24.04.08','DD.MM.RR'),NULL);
INSERT INTO BESTELLUNG (BESTELLNR,KUNDENNR,BESTELLDATUM,LIEFERDATUM) VALUES ('12654','4',TO_DATE('27.11.10','DD.MM.RR'),NULL);
INSERT INTO BESTELLUNG (BESTELLNR,KUNDENNR,BESTELLDATUM,LIEFERDATUM) VALUES ('12672','2',TO_DATE('07.09.05','DD.MM.RR'),NULL);
INSERT INTO BESTELLUNG (BESTELLNR,KUNDENNR,BESTELLDATUM,LIEFERDATUM) VALUES ('11761','4',TO_DATE('02.03.10','DD.MM.RR'),NULL);
INSERT INTO BESTELLUNG (BESTELLNR,KUNDENNR,BESTELLDATUM,LIEFERDATUM) VALUES ('12872','4',TO_DATE('24.06.09','DD.MM.RR'),NULL);
INSERT INTO BESTELLUNG (BESTELLNR,KUNDENNR,BESTELLDATUM,LIEFERDATUM) VALUES ('14592','4',TO_DATE('04.04.09','DD.MM.RR'),NULL);
INSERT INTO BESTELLUNG (BESTELLNR,KUNDENNR,BESTELLDATUM,LIEFERDATUM) VALUES ('16856','4',TO_DATE('01.08.06','DD.MM.RR'),NULL);
INSERT INTO BESTELLUNG (BESTELLNR,KUNDENNR,BESTELLDATUM,LIEFERDATUM) VALUES ('17276','4',TO_DATE('07.01.09','DD.MM.RR'),NULL);
INSERT INTO BESTELLUNG (BESTELLNR,KUNDENNR,BESTELLDATUM,LIEFERDATUM) VALUES ('15952','3',TO_DATE('18.08.09','DD.MM.RR'),NULL);
INSERT INTO BESTELLUNG (BESTELLNR,KUNDENNR,BESTELLDATUM,LIEFERDATUM) VALUES ('19366','2',TO_DATE('09.01.11','DD.MM.RR'),NULL);
INSERT INTO BESTELLUNG (BESTELLNR,KUNDENNR,BESTELLDATUM,LIEFERDATUM) VALUES ('19494','2',TO_DATE('12.11.09','DD.MM.RR'),NULL);
INSERT INTO BESTELLUNG (BESTELLNR,KUNDENNR,BESTELLDATUM,LIEFERDATUM) VALUES ('22497','3',TO_DATE('16.03.10','DD.MM.RR'),NULL);

INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('893','11','5','1');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('893','14','3','2');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('893','15','3','3');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('893','21','2','4');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('893','46','5','5');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('893','58','3','6');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('893','6','5','7');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('1141','26','5','1');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('1302','27','3','1');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('1302','5','2','2');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('1302','58','3','3');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('2912','29','2','1');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('2912','31','4','2');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('2912','57','2','4');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('2912','58','5','5');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('2912','61','3','6');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('3399','30','4','1');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('3399','47','5','2');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('3399','49','4','3');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('3552','10','2','1');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('3552','21','5','2');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('3552','51','3','3');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('3552','54','3','4');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('3552','62','3','5');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('3714','24','2','1');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('3714','25','4','3');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('3714','38','3','4');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('3714','43','5','5');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('3714','51','4','6');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('3714','56','4','7');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('3714','63','2','8');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('4065','13','3','1');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('4065','14','5','2');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('4065','9','5','3');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('4229','12','2','1');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('4229','32','5','2');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('4229','56','2','3');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('4473','19','3','1');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('4473','30','2','2');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('4473','33','4','3');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('4473','42','3','4');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('4473','47','2','5');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('4473','8','5','6');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('5471','10','4','1');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('5471','15','4','2');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('5471','20','5','3');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('5471','39','3','4');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('5471','41','5','5');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('5471','42','3','6');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('5471','48','2','7');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('5471','50','2','8');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('5544','29','5','1');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('5544','30','2','2');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('5544','5','5','3');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('6721','11','4','1');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('6721','38','5','2');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('6721','6','3','3');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('7866','14','2','1');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('7866','28','4','2');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('7866','33','3','3');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('7866','52','3','4');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('7866','61','4','5');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('9571','14','5','1');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('9571','17','2','2');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('9571','29','4','3');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('9693','8','2','1');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('10257','13','5','1');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('10257','28','2','2');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('10257','29','5','3');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('10257','42','4','4');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('10257','49','4','6');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('10257','61','2','7');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('10257','64','3','8');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('10257','8','2','9');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('10799','44','2','1');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('10799','5','4','2');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('11761','12','5','1');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('11761','18','5','2');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('11761','35','2','3');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('11761','39','2','4');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('11761','59','3','5');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('12654','26','2','1');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('12654','41','2','2');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('12654','55','3','5');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('12654','6','2','6');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('12672','21','5','1');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('12672','42','2','2');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('12672','46','4','3');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('12672','47','4','4');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('12872','12','5','1');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('12872','29','4','2');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('12872','3','2','3');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('12872','47','2','4');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('12872','48','4','5');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('12872','61','4','6');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('14592','17','5','1');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('14592','21','2','2');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('14592','28','5','3');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('14592','31','3','4');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('14592','32','5','5');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('14592','35','2','6');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('14592','40','2','7');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('14592','61','2','8');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('15952','27','2','1');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('16856','3','4','1');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('16856','42','4','2');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('16856','5','3','3');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('16856','59','2','4');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('16856','8','4','5');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('17276','29','3','1');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('17276','53','2','2');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('19366','17','2','1');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('19366','18','5','2');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('19366','2','2','3');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('19366','22','5','4');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('19366','47','2','6');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('19494','16','3','1');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('19494','19','5','2');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('19494','40','3','3');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('19494','41','2','4');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('19494','4','4','6');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('19494','45','5','7');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('22497','34','4','1');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('22497','43','5','2');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('22497','50','3','3');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('22497','52','4','4');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('22497','58','3','5');
INSERT INTO BESTELL_POSITION (BESTELLNR,ARTIKELNR,MENGE,POSITIONSNUMMER) VALUES ('22497','62','3','6');

INSERT INTO KUNDE (KUNDENNR,NAME) VALUES ('1','BASF Farben und Lacke');
INSERT INTO KUNDE (KUNDENNR,NAME) VALUES ('2','Deutsche Bundebahn');
INSERT INTO KUNDE (KUNDENNR,NAME) VALUES ('4','Grund- und Bodenanstalt');
INSERT INTO KUNDE (KUNDENNR,NAME) VALUES ('3','Bayer Leverkusen');



