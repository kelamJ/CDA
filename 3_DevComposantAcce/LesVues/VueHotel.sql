--Exercice 1.

--1.
CREATE VIEW vuehotel
AS
SELECT * FROM hotel
Select hot_id, hot_nom FROM vuehotel

--2.
CREATE VIEW vuechambre
AS
SELECT * FROM chambre, hotel

Select cha_id, hot_nom FROM vuechambre

--3.
CREATE VIEW v_reserv
AS
SELECT * FROM reservation, client
Select res_id, cli_nom FROM v_reserv

--4.
CREATE VIEW v_station
AS
SELECT * FROM chambre, hotel, station
Select cha_id, hot_nom, sta_nom FROM v_station

--5.
CREATE VIEW v_reserv2
AS
SELECT * FROM reservation, client, hotel
Select res_id, cli_nom, hot_nom FROM v_reserv2
