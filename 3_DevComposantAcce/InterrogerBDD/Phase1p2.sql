Phase 2: Exercise sur la base exemple

Jointures :

1.
Select employe.prenom, noregion
from employe
inner join dept on employe.nodep = dept.nodept

2.
Select nodept, dept.nom, employe.nom
from employe, dept
order by dept.nodept

3.
Select employe.nom from employe, dept where dept.nom = "distribution"

4.
Select e1.nom, e1.salaire
from employe e1 INNER JOIN employe e2
ON e1.salaire = e2.salaire

5.
Select employe.nom, employe.titre
from employe
where titre
IN (select titre from employe where nom="amartakaldire");

6.
Select e.nom, e.nodep ,e.salaire
from employe e
where e.salaire >
          ANY (select salaire from employe where nodep=31)
order by nodep

7.
Select e.nom, e.nodep ,e.salaire
from employe e
where e.salaire >
          ALL (select salaire from employe where nodep=31)
order by nodep

8.
Select e.nom, e.titre
from employe e
where nodep = 31
and titre IN
(select titre from employe
where nodep = 32)

9.
Select e.nom, e.titre
from employe e
where nodep = 31
and titre NOT IN
(select titre from employe
where nodep = 32)

10.
Select employe.nom, employe.titre, employe.salaire
from employe
where titre IN
      (Select titre from employe where employe.nom = "fairent" )
and salaire IN (select salaire from employe where employe.nom = "fairent" )

11.
SELECT d.nodept, d.nom AS nom_departement, e.nom AS nom_employe
FROM dept d
LEFT JOIN employe e ON d.nodept = e.nodep
ORDER BY d.nodept;

EXERCICE SUITE
1.
SELECT titre, COUNT(*) AS nombre_d_employes
FROM employe
GROUP BY titre
ORDER BY nombre_d_employes DESC;

2.
SELECT d.noregion, AVG(e.salaire) AS moyenne_des_salaires, SUM(e.salaire) AS somme_des_salaires
FROM employe e
         INNER JOIN dept d ON e.nodep = d.nodept
GROUP BY d.noregion;

3.
SELECT nodep
FROM employe
GROUP BY nodep
HAVING COUNT(*) >= 3;

4.
SELECT SUBSTRING(nom, 1, 1) AS initiale, COUNT(*) AS nombre_employes
FROM employe
GROUP BY initiale
HAVING COUNT(*) >= 3;

5.
SELECT MAX(salaire) AS salaire_maximum, MIN(salaire) AS salaire_minimum,
       MAX(salaire) - MIN(salaire) AS ecart_salaire
FROM employe;

6.
Select COUNT( DISTINCT titre)
from employe

7.
SELECT titre, COUNT(*) AS nombre_d_employes
FROM employe
GROUP BY titre;

8.
SELECT d.nom AS nom_departement, COUNT(*) AS nombre_employes
FROM dept d
LEFT JOIN employe e ON d.nodept = e.nodep
GROUP BY d.nom;

9.
SELECT titre, AVG(salaire) AS moyenne_des_salaires
FROM employe
GROUP BY titre
HAVING AVG(salaire) > (
SELECT AVG(salaire)
FROM employe
WHERE titre = 'représentant'
);

10.
SELECT
COUNT(salaire IS NOT NULL) AS nombre_de_salaires_renseignes,
COUNT(tauxcom IS NOT NULL) AS nombre_de_taux_de_commission_renseignes
FROM employe;