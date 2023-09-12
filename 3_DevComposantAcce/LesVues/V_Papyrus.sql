-- Exercice 2.

--1.
Create View v_GlobalCde
AS
SELECT * FROM ligcom;
SELECT codart, qtecde AS QteTot, priuni * qtecde AS PrixTot from v_GlobalCde

--2.
Create view v_VentesI100
AS
SELECT * FROM vente;
SELECT * FROM v_VentesI100
WHERE codart = "I100"

--3.
Create view v_VentesI100Grobrigan
AS
SELECT * FROM v_VentesI100
WHERE codart = "I100"
AND numfou = 120;
SELECT * FROM v_VentesI100Grobrigan
