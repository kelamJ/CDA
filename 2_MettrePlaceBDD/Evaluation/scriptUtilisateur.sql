CREATE USER 'util1' IDENTIFIED BY 'password';
CREATE USER 'util2' IDENTIFIED BY 'password';
CREATE USER 'util3' IDENTIFIED BY 'password';

GRANT ALL PRIVILEGES ON Papyrus.* TO 'util1';

GRANT SELECT PRIVILEGES ON Papyrus.* TO 'util2';

GRANT select 
ON Papyrus.Fournisseur
TO util3;
