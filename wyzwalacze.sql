DROP TRIGGER Rachunek_staly_klient
DROP TRIGGER Aktualizacja_towaru
DROP TRIGGER Nowa_usluga

--1

CREATE TRIGGER Rachunek_staly_klient
ON Rachunek
AFTER INSERT, UPDATE
AS
UPDATE Rachunek
SET suma_calosc_netto = suma_calosc_netto * 0.97
FROM Rachunek
INNER JOIN Klienci ON Rachunek.PESEL = Klienci.PESEL
WHERE Klienci.staly_klient = 1






Update Rachunek
SET suma_calosc_netto = 1000
WHERE id_rachunku = 1

SELECT*FROM Rachunek


--2

CREATE TRIGGER Aktualizacja_towaru
ON zamowienia
AFTER UPDATE
AS
BEGIN
DECLARE @zamow_id_tmp INT, @prod_id_tmp INT, @zamowienie_ilosc_tmp INT
SELECT @zamow_id_tmp = id_zamowionego, @prod_id_tmp = id_produktu,
@zamowienie_ilosc_tmp = ilosc
FROM inserted
IF EXISTS (SELECT 1 FROM inserted WHERE czy_zrealizowane = 1)
BEGIN
UPDATE Asortyment
SET ilosc_produktu = ilosc_produktu - @zamowienie_ilosc_tmp
WHERE id_produktu = @prod_id_tmp
END
END





UPDATE Zamowienia
SET czy_zrealizowane = 1
WHERE id_zamowionego = 20

SELECT*FROM Zamowienia
SELECT*FROM Asortyment



--3

CREATE TRIGGER Nowa_usluga
ON Uslugi
AFTER INSERT
AS
BEGIN
DECLARE @id_rachunku INT, @suma_uslug FLOAT
SELECT @id_rachunku = id_rachunku, @suma_uslug = SUM(DISTINCT wysokosc_netto)
FROM Uslugi
WHERE id_rachunku IN (SELECT DISTINCT id_rachunku FROM inserted)
GROUP BY id_rachunku;
UPDATE Rachunek
SET suma_uslug = @suma_uslug
WHERE id_rachunku = @id_rachunku
END



INSERT INTO Uslugi (id_rachunku, nazwa_uslugi, wysokosc_netto)
VALUES ('28','Usluga Testowa','1000')

SELECT*FROM Uslugi
SELECT*FROM Rachunek