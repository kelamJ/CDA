1
Select * from employe

2.
Select * from dept

3.
Select employe.nom, dateemb, nosup, salaire, nodept from employe, dept

4.
Select titre from employe

5.
Select DISTINCT titre from employe

6.
Select employe.nom, noemp, nodep from employe, dept where titre = "secrétaire"

7.
Select dept.nom, nodept from dept where nodept > 40

8.
Select employe.nom, prenom from employe where employe.nom < prenom;
 
9.
Select employe.nom, salaire, nodept 
from employe, dept 
where titre = "représentant" and nodept = 35 and salaire > 20000

10.
Select employe.nom, titre, salaire 
from employe 
where titre = "représentant" or "président"

11.
Select employe.nom, titre, nodept, salaire 
from employe, dept 
where nodept = 34 and titre = "représentant" or "secrétaire"

12.
Select employe.nom, titre, nodept, salaire 
from employe, dept 
where titre = "représentant" or "secrétaire"

13.
Select employe.nom, salaire from employe 
where salaire between 20000 and 30000

14.

15.
Select employe.nom from employe 
where employe.nom like "h%"

16.
Select employe.nom from employe
 where employe.nom like "%n"

17.
Select employe.nom from employe 
where employe.nom like '__u%'

18.
Select salaire, employe.nom from employe 
where nodep = 41 order by salaire ASC

19.
Select salaire, employe.nom from employe
where nodep = 41 order by salaire DESC

20.
Select titre, salaire, employe.nom from employe 
order by salaire DESC, employe.nom ASC;

21.
Select employe.nom, salaire, tauxcom 
from employe order by tauxcom ASC

22.
Select employe.nom, salaire, tauxcom, titre 
from employe where tauxcom is null;

23.
Select employe.nom, salaire, tauxcom, titre 
from employe where tauxcom is not null;

24.
Select employe.nom, salaire, tauxcom, titre 
from employe where tauxcom < 15

25.
Select employe.nom, salaire, tauxcom, titre 
from employe where tauxcom > 15

26.
Select employe.nom, salaire, tauxcom, (tauxcom * salaire) as "Commission" 
from employe, dept

27.
Select employe.nom, salaire, tauxcom, (tauxcom * salaire) as "Commission" 
from employe where tauxcom is not null 
order by tauxcom ASC;

28.
Select CONCAT(employe.nom, prenom) as "NomPrenom" from employe;

29.
Select employe.nom, SUBSTR(nom,1,5) from employe;

30.
Select employe.nom, LOCATE('r') from employe

31.
Select employe.nom, UPPER(employe.nom), LOWER(employe.nom) 
from employe where employe.nom = "vrante"

32.
Select employe.nom, LENGTH(employe.nom) from employe
