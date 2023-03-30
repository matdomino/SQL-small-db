DROP TABLE IF EXISTS Dostawcy
DROP TABLE IF EXISTS Dostawy
DROP TABLE IF EXISTS Kategorie_produktow
DROP TABLE IF EXISTS Asortyment
DROP TABLE IF EXISTS Zamowienia
DROP TABLE IF EXISTS Rabaty
DROP TABLE IF EXISTS Rachunek
DROP TABLE IF EXISTS Uslugi
DROP TABLE IF EXISTS Klienci

CREATE TABLE Dostawcy
(
id_dostawcy INT PRIMARY KEY IDENTITY,
NIP_dostawcy VARCHAR(10),
nazwa_dostawcy VARCHAR(30)
)

INSERT INTO Dostawcy VALUES
('8374058736','Asus_polska'),
('7674338521','hp_polska'),
('9328243229','Komputerowa Hurtownia'),
('2873219841','microsoft_polska'),
('4823471245','dell_polska'),
('9284619204','acer_polska')

CREATE TABLE Dostawy
(
id_dostawy INT PRIMARY KEY IDENTITY,
id_dostawcy INT,
data_dostawy DATE,
ilosc_produktow INT,
suma_netto FLOAT
)
INSERT INTO Dostawy VALUES
('6','2022-12-05','3','3989.23'),
('4','2022-12-12','10','4987.87'),
('3','2022-12-16','46','581.72'),
('5','2022-12-17','9','414.15'),
('2','2022-12-22','11','6102.54'),
('1','2022-12-29','9','2012.99'),
('4','2023-01-04','7','2876.13'),
('2','2023-01-08','5','2108.33'),
('6','2023-01-11','2','3612.89')


CREATE TABLE Kategorie_produktow
(
id_kategori INT PRIMARY KEY IDENTITY,
nazwa_kategori VARCHAR(30)
)

INSERT INTO Kategorie_produktow VALUES
('Laptopy'),
('Monitory'),
('Myszki'),
('Klawiatury'),
('Komputery stacjonarne'),
('Konsole'),
('Gry'),
('Akcesoria komputerowe'),
('Drukarki')



CREATE TABLE Asortyment
(
id_produktu INT PRIMARY KEY IDENTITY,
id_dostawy INT,
id_kategori INT,
nazwa_produktu VARCHAR(30),
ilosc_produktu INT,
cena_netto FLOAT
)

INSERT INTO Asortyment VALUES
('1','1','Laptop Acer x1','2','1300.42'),
('9','1','Laptop Acer x2','0','1672.12'),
('1','1','Laptop Acer x3','1','2345.23'),
('4','3','Mysz Dell','5','39.90'),
('4','4','Klawiatura Dell','4','76.42'),
('2','6','Xbox X','1','2000.52'),
('7','6','Xbox S','2','1200.64'),
('2','7','Gra xbox forza','2','130.22'),
('2','7','Gra xbox fifa','3','179.87'),
('7','7','Gra xbox minecraft','2','86.87'),
('7','7','Gra xbox rayman','1','47.87'),
('3','8','Kabel hdmi','4','25.87'),
('3','8','Kabel displayport','6','32.85'),
('3','8','Sprezone powietrze','8','10.98'),
('3','8','Kabel sata','0','13.23'),
('6','2','Monitor asus x91','1','652.87'),
('6','2','Monitor asus s48','2','512.98'),
('6','8','Adapter asus bluetooth','2','34.29'),
('6','8','Adapter wifi asus','3','46.63'),
('3','8','Zestaw srub','6','5.99'),
('3','8','Pasta termoprzewodzaca','4','17.98'),
('3','8','Bateria 2032','10','4.65'),
('5','9','Drukarka hp atramentowa','2','400.76'),
('5','9','Drukarka hp laserowa','1','1223.48'),
('8','5','Komputer hp cx42','2','1623.87'),
('5','5','Komputer hp as783','1','2891.87'),
('8','8','Pendrive hp','3','28.76'),
('8','8','Karta sd hp','4','31.87')

CREATE TABLE Zamowienia
(
id_zamowionego INT PRIMARY KEY IDENTITY,
id_produktu INT,
id_rachunku INT,
data_zamowienia DATE,
ilosc INT,
czy_zrealizowane BIT
)

INSERT INTO Zamowienia VALUES
('2','1','2022-12-05','2','1'),
('2','2','2022-12-07','1','1'),
('9','2','2022-12-07','1','1'),
('11','2','2022-12-07','1','1'),
('6','3','2022-12-08','1','1'),
('23','5','2022-12-12','1','1'),
('11','5','2022-12-12','2','1'),
('25','7','2022-12-16','1','1'),
('27','8','2022-12-18','1','1'),
('17','9','2022-12-19','1','1'),
('12','9','2022-12-19','1','1'),
('20','12','2022-12-22','3','1'),
('22','16','2022-12-28','2','1'),
('6','16','2022-12-28','1','1'),
('15','18','2023-01-03','1','1'),
('13','18','2023-01-03','1','1'),
('6','19','2023-01-05','1','0'),
('3','21','2023-01-07','1','0'),
('1','25','2023-01-11','1','0'),
('4','27','2023-01-14','1','0')

CREATE TABLE Rabaty
(
id_rabatu INT PRIMARY KEY IDENTITY,
nazwa_rabatu VARCHAR(30),
wysokosc_rabatu INT
)

INSERT INTO Rabaty VALUES
('Rabat noworoczny','30'), --powyzej 300zl
('Rabat na produkty Dell','10'),
('Rabat sta³ego klienta',NULL) --naliczany procentowo(3%)



CREATE TABLE Rachunek
(
id_rachunku INT PRIMARY KEY IDENTITY,
PESEL VARCHAR(11),
id_rabatu INT,
suma_uslug INT,
suma_zamowienia FLOAT,
suma_calosc_netto FLOAT,
status_platnosci BIT,
data_wystawienia DATE
)

INSERT INTO Rachunek VALUES
('27361152931',NULL,'0','3344.24','3344.24','1','2022-12-05'),
('83194650582',NULL,'50','314.61','364.61','1','2022-12-07'),
('49271086543',NULL,'0','2000.52','2000.52','1','2022-12-08'),
('61538472910',NULL,'80','0','80','1','2022-12-09'),
('27361152931',NULL,'0','849.39','849.39','1','2022-12-12'),
('61538472910',NULL,'100','0','100','1','2022-12-13'),
('73029485167',NULL,'0','1623.87','1623.87','1','2022-12-16'),
('84917236580',NULL,'0','28.76','28.76','1','2022-12-18'),
('92104736842',NULL,'0','538.85','538.85','1','2022-12-19'),
('53478260870',NULL,'30','0','30','1','2022-12-20'),
('10987654321',NULL,'150','0','150','1','2022-12-21'),
('12357986432',NULL,'0','17.97','17.97','1','2022-12-22'),
('53478260870',NULL,'50','0','50','1','2022-12-23'),
('26985478652',NULL,'100','0','100','1','2022-12-27'),
('95821369874',NULL,'130','0','130','1','2022-12-27'),
('66942873409',NULL,'0','1209.94','1209.94','1','2022-12-28'),
('23633679812',NULL,'80','0','80','1','2022-12-30'),
('21410698342',NULL,'100','46.08','146.08','1','2023-01-03'),
('23633679812','1','0','2000.52','1970.52','1','2023-01-05'),
('76967412309',NULL,'160','0','160','1','2023-01-06'),
('88078498653','1','0','2345.23','2315.23','1','2023-01-07'),
('65856329861',NULL,'50','0','50','1','2023-01-08'),
('35856198763',NULL,'30','0','30','1','2023-01-09'),
('27361152931',NULL,'100','0','100','1','2023-01-10'),
('88078498653','1','50','1300.42','1350.42','1','2023-01-11'),
('32522587309',NULL,'100','0','100','0','2023-01-12'),
('35856198763','2','0','39.90','29.90','1','2023-01-14'),
('35856198763',NULL,'80','0','80','0','2023-01-16')

CREATE TABLE Uslugi
(
id_uslugi INT PRIMARY KEY IDENTITY,
id_rachunku INT,
nazwa_uslugi VARCHAR(30),
wysokosc_netto INT
)

INSERT INTO Uslugi VALUES
('2','Instalacja oprogramowania','50'),
('4','Czyszczenie sprzetu','30'),
('4','Instalacja oprogramowania','50'),
('6','Diagnoza sprzetowa','100'),
('10','Czyszczenie sprzetu','30'),
('11','Instalacja oprogramowania','50'),
('11','Montaz komputera','100'),
('13','Instalacja oprogramowania','50'),
('14','Diagnoza sprzetowa','100'),
('15','Montaz komputera','100'),
('15','Czyszczenie sprzetu','30'),
('17','Instalacja podzespolow','30'),
('17','Instalacja oprogramowania','50'),
('18','Diagnoza sprzetowa','50'),
('20','Instalacja podzespolow','30'),
('20','Czyszczenie sprzetu','30'),
('20','Diagnoza sprzetowa','100'),
('22','Instalacja oprogramowania','50'),
('23','Czyszczenie sprzetu','30'),
('24','Diagnoza sprzetowa','100'),
('25','Instalacja oprogramowania','50'),
('26','Montaz komputera','100'),
('28','Czyszczenie sprzetu','30'),
('28','Instalacja oprogramowania','50')

CREATE TABLE Klienci
(
PESEL VARCHAR(11) PRIMARY KEY,
nazwisko_klienta VARCHAR(30),
miasto VARCHAR(30),
ulica VARCHAR(30),
nr_domu VARCHAR(3),
nr_mieszkania VARCHAR(2),
nr_telefonu VARCHAR(11),
NIP VARCHAR(10),
nazwa_firmy VARCHAR(30),
staly_klient BIT
)
INSERT INTO Klienci VALUES
('27361152931','Kowalski','Gdansk','Dluga','27',NULL,'789654123','8284576193','Aurora Innovations','1'),
('83194650582','Nowak','Sopot','Wladyslawa IV','12','13','321456978',NULL,NULL,'0'),
('49271086543','Wisniewski','Gdansk','Dluga','5','9','456987123',NULL,NULL,'0'),
('61538472910','Wojcik','Gdynia','Zgody','4','4','123698754',NULL,NULL,'1'),
('73029485167','Kowalczyk','Gdansk','Pilsudskiego','3','5','987654321',NULL,NULL,'0'),
('84917236580','Kaminski','Gdansk','3 Maja','12','10','754321009',NULL,NULL,'0'),
('92104736842','Lewandowski','Gdynia','Zwyciestwa','34','1','654321987',NULL,NULL,'0'),
('10987654321','Dabrowski','Gdansk','3 Maja','21','9','543216789',NULL,NULL,'0'),
('12357986432','Zielinska','Gdansk','Slowackiego','34',NULL,'432109876',NULL,NULL,'0'),
('53478260870','Szymanska','Gdansk','Pilsudskiego','15','16','321098769',NULL,NULL,'1'),
('26985478652','Wozniak','Sopot','Haffnera','9',NULL,'210987654','9876451230','BrightPath Solutions','0'),
('95821369874','Kaczmarek','Gdansk','Chmielna','16','6','109876543',NULL,NULL,'0'),
('66942873409','Mazur','Gdynia','Zbozowa','13','4','987654321',NULL,NULL,'0'),
('21410698342','Krawczyk','Gdansk','Wita Stwosza','24',NULL,'876543210',NULL,NULL,'0'),
('23633679812','Piotrowski','Gdansk','Slowackiego','23','14','765432109',NULL,NULL,'1'),
('65856329861','Grabowska','Sopot','Monte Cassino','14','17','654321098',NULL,NULL,'0'),
('76967412309','Nowakowski','Gdansk','Lakowa','3','7','543210123',NULL,NULL,'0'),
('88078498653','Pawlowski','Gdynia','Zbozowa','14',NULL,'123546789','432109876','GreenLeaf Industries','0'),
('32522587309','Michalska','Gdansk','Wita Stwosza','9','11','321009876',NULL,NULL,'0'),
('35856198763','Adamczyk','Gdansk','Lakowa','2',NULL,'210009876','6789013456','Infinity Group','1')

--SELECT*FROM Dostawc --GIT
--SELECT*FROM Dostawy --GIT
--SELECT*FROM Kategorie_produktow --GIT
--SELECT*FROM Asortyment --GIT
--SELECT*FROM Zamowienia --GIT
--SELECT*FROM Rabaty --GIT
--SELECT*FROM Rachunek --GIT
--SELECT*FROM Uslugi --GIT
--SELECT*FROM Klienci --GIT