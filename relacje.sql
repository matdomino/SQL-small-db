--GIT r1 1 dostawcy - dostawy n
--GIT r2 1 dostawy - asortyment n
--GIT r3 1 kategorie - asortyment n
--GIT r4 1 asortyment - zamowienia 1
--GIT r5 n zamowien - rachunek 1
--GIT r6 1 rachunek - rabaty 1
--GIT r7 1 rachunek - uslugi n
--GIT r8 n rachunek - klienci 1

--r1

ALTER TABLE Dostawy
ADD CONSTRAINT FK_Dostawcy_id_dostawcy FOREIGN KEY (id_dostawcy)
REFERENCES Dostawcy(id_dostawcy)

--r2

ALTER TABLE Asortyment
ADD CONSTRAINT FK_Dostawy_id_dostawy FOREIGN KEY (id_dostawy)
REFERENCES Dostawy(id_dostawy)

--r3

ALTER TABLE Asortyment
ADD CONSTRAINT FK_Kategorie_produktow_id_kategori FOREIGN KEY (id_kategori)
REFERENCES Kategorie_produktow(id_kategori)

--r4

ALTER TABLE Zamowienia
ADD CONSTRAINT FK_Asortyment_id_produktu FOREIGN KEY(id_produktu)
REFERENCES Asortyment(id_produktu)

--r5

ALTER TABLE Zamowienia
ADD CONSTRAINT FK_Rachunek_id_rachunku FOREIGN KEY (id_rachunku)
REFERENCES Rachunek(id_rachunku)

--r6

ALTER TABLE Rachunek
ADD CONSTRAINT FK_Rabaty_id_rabatu FOREIGN KEY (id_rabatu)
REFERENCES Rabaty(id_rabatu)

--r7

ALTER TABLE Uslugi
ADD CONSTRAINT FK_Rachunek_id_rachunku_2 FOREIGN KEY (id_rachunku)
REFERENCES Rachunek(id_rachunku)

--r8

ALTER TABLE Rachunek
ADD CONSTRAINT FK_Klienci_PESEL FOREIGN KEY (PESEL)
REFERENCES Klienci(PESEL)





--EXEC SP_HELP Dostawy
--EXEC SP_HELP Asortyment
--EXEC SP_HELP Zamowienia
--EXEC SP_HELP Rachunek
--EXEC SP_HELP Uslugi


IF (OBJECT_ID('FK_Dostawcy_id_dostawcy')) IS NOT NULL
ALTER TABLE Dostawy DROP CONSTRAINT FK_Dostawcy_id_dostawcy

IF (OBJECT_ID('FK_Dostawy_id_dostawy')) IS NOT NULL
ALTER TABLE Asortyment DROP CONSTRAINT FK_Dostawy_id_dostawy

IF (OBJECT_ID('FK_Kategorie_produktow_id_kategori')) IS NOT NULL
ALTER TABLE Asortyment DROP CONSTRAINT FK_Kategorie_produktow_id_kategori

IF (OBJECT_ID('FK_Asortyment_id_produktu')) IS NOT NULL
ALTER TABLE Zamowienia DROP CONSTRAINT FK_Asortyment_id_produktu

IF (OBJECT_ID('FK_Rachunek_id_rachunku')) IS NOT NULL
ALTER TABLE Zamowienia DROP CONSTRAINT FK_Rachunek_id_rachunku

IF (OBJECT_ID('FK_Rabaty_id_rabatu')) IS NOT NULL
ALTER TABLE Rachunek DROP CONSTRAINT FK_Rabaty_id_rabatu

IF (OBJECT_ID('FK_Rachunek_id_rachunku_2')) IS NOT NULL
ALTER TABLE Uslugi DROP CONSTRAINT FK_Rachunek_id_rachunku_2

IF (OBJECT_ID('FK_Klienci_PESEL')) IS NOT NULL
ALTER TABLE Rachunek DROP CONSTRAINT FK_Klienci_PESEL
