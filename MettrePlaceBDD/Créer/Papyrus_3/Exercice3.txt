CREATE TABLE Produit(
   codart CHAR(4) ,
   libart VARCHAR(30)  NOT NULL,
   stkale INT NOT NULL,
   stkphy INT NOT NULL,
   qteann INT NOT NULL,
   unimes CHAR(5)  NOT NULL,
   PRIMARY KEY(codart)
);

CREATE TABLE Fournisseur(
   numfou SMALLINT,
   nomfou VARCHAR(25)  NOT NULL,
   ruefou VARCHAR(50)  NOT NULL,
   posfou CHAR(5)  CHECK NOT NULL,
   vilfou VARCHAR(30)  NOT NULL,
   confou VARCHAR(15)  NOT NULL,
   satisf SMALLINT,
   PRIMARY KEY(numfou)
);

CREATE TABLE Entcom(
   numfou SMALLINT,
   numcom INT AUTO_INCREMENT,
   obscom VARCHAR(50) ,
   datcom DATE NOT NULL,
   PRIMARY KEY(numfou, numcom),
   FOREIGN KEY(numfou) REFERENCES Fournisseur(numfou)
);

CREATE UNIQUE index fourninum
on Entcom (numfou);

CREATE TABLE Ligcom(
   numlig SMALLINT,
   qtecde INT,
   priuni DECIMAL(9,2)  ,
   derliv DATE,
   numfou SMALLINT NOT NULL,
   numcom INT NOT NULL,
   codart CHAR(4)  NOT NULL,
   PRIMARY KEY(numlig),
   FOREIGN KEY(numfou, numcom) REFERENCES Entcom(numfou, numcom),
   FOREIGN KEY(codart) REFERENCES Produit(codart)
);

CREATE TABLE Vente(
   codart CHAR(4) ,
   numfou SMALLINT,
   delliv SMALLINT NOT NULL,
   qte1 INT NOT NULL,
   prix1 DECIMAL(9,2)   NOT NULL,
   qte2 INT,
   prix2 DECIMAL(9,2)  ,
   qte3 INT,
   prix3 DECIMAL(9,2)  ,
   PRIMARY KEY(codart, numfou),
   FOREIGN KEY(codart) REFERENCES Produit(codart),
   FOREIGN KEY(numfou) REFERENCES Fournisseur(numfou)
);

