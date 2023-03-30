DROP FUNCTION IF EXISTS zliczanie_rachunku
DROP FUNCTION IF EXISTS bilans_miesieczny
DROP FUNCTION IF EXISTS sprawdzenie_statusu_klienta


CREATE FUNCTION zliczanie_rachunku(@id_rachunku INT)
RETURNS TABLE AS
RETURN (
SELECT @id_rachunku AS 'id_rachunku', suma_zamowienia, suma_uslug,
SUM(suma_zamowienia + suma_uslug) AS 'suma_calosc_netto',
ROUND(SUM(suma_zamowienia + suma_uslug) * 1.23, 2) AS 'suma_calosc_brutto',
nazwa_firmy AS 'faktura'
FROM Rachunek
INNER JOIN Klienci ON Rachunek.PESEL = Klienci.PESEL
WHERE id_rachunku = @id_rachunku
GROUP BY id_rachunku, suma_zamowienia, suma_uslug, nazwa_firmy
)

GO 
SELECT*FROM dbo.zliczanie_rachunku(1)




CREATE FUNCTION bilans_miesieczny()
RETURNS TABLE AS
RETURN (
SELECT SUM(Rachunek.suma_calosc_netto) - (SELECT SUM(suma_netto)
FROM Dostawy
WHERE DATEDIFF(day, data_dostawy, GETDATE()) <= 30) AS 'Bilans z 30 dni'
FROM Rachunek
WHERE DATEDIFF(day, Rachunek.data_wystawienia, GETDATE()) <= 30
)

GO
SELECT*FROM dbo.bilans_miesieczny()


CREATE FUNCTION sprawdzenie_statusu_klienta(@PESEL varchar(11))
RETURNS TABLE AS
RETURN (
SELECT @PESEL AS 'PESEL',nazwisko_klienta, nr_telefonu, staly_klient,
COUNT(id_rachunku) AS 'Ilosc rachunkow'
FROM Klienci
INNER JOIN Rachunek ON Klienci.PESEL = Rachunek.PESEL
WHERE Klienci.PESEL = @PESEL
GROUP BY nazwisko_klienta, nr_telefonu, staly_klient
)

GO
SELECT*FROM dbo.sprawdzenie_statusu_klienta(66942873409)