
CREATE VIEW [nieoplacone_rachunki] AS
SELECT DATEDIFF(DAY, data_wystawienia, GETDATE()) AS 'Ilosc dni po wystawieniu rachunku',
id_rachunku, nazwisko_klienta,nr_telefonu, suma_calosc_netto,
ROUND(suma_calosc_netto * 1.23, 2) AS suma_calosc_brutto
FROM Rachunek,Klienci
WHERE
Rachunek.PESEL = Klienci.PESEL
AND
status_platnosci = '0'
GROUP BY DATEDIFF(DAY, data_wystawienia, GETDATE()), id_rachunku,
nazwisko_klienta,nr_telefonu, suma_calosc_netto, ROUND(suma_calosc_netto * 1.23, 2);
GO

SELECT*FROM nieoplacone_rachunki

---------------------------

CREATE VIEW [niedostepne_produkty] AS
SELECT id_produktu, nazwa_produktu, ilosc_produktu, nazwa_dostawcy,
data_dostawy AS 'Data ostatniej dostawy'
FROM Asortyment, Dostawy, Dostawcy
WHERE Asortyment.id_dostawy = Dostawy.id_dostawy
AND
Dostawy.id_dostawcy = Dostawcy.id_dostawcy
AND ilosc_produktu <= 1
GO 

SELECT*FROM niedostepne_produkty ORDER BY ilosc_produktu ASC

---------------------------

CREATE VIEW [najczesciej_wybierane] AS
SELECT TOP 10 SUM(Zamowienia.ilosc) AS "Ilosc kupionych",
Asortyment.nazwa_produktu,Zamowienia.id_produktu
FROM Zamowienia
INNER JOIN Asortyment ON Zamowienia.id_produktu = Asortyment.id_produktu
WHERE DATEDIFF(month, Zamowienia.data_zamowienia, GETDATE()) <= 3
GROUP BY Asortyment.nazwa_produktu, Zamowienia.id_produktu
ORDER BY "Ilosc kupionych" DESC;
GO

SELECT*FROM najczesciej_wybierane

---------------------------


DROP VIEW IF EXISTS nieoplacone_rachunki
DROP VIEW IF EXISTS niedostepne_produkty
DROP VIEW IF EXISTS najczesciej_wybierane
