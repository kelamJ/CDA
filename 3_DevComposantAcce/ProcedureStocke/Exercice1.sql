--Exercice 1.
DELIMITER |

CREATE PROCEDURE Lst_fournis()
BEGIN
    SELECT numfou, numcom FROM Entcom;
    END |

DELIMITER ;

SHOW CREATE PROCEDURE Lst_fournis;

CALL Lst_fournis;


--Exercice 2.

DELIMITER |

CREATE PROCEDURE Lst_Commandes(In obscom Varchar(50))

BEGIN
   SELECT produit.codart, produit.libart
	FROM produit
         INNER JOIN ligcom ON produit.codart = ligcom.codart
         INNER JOIN entcom ON ligcom.numcom = entcom.numcom
	WHERE entcom.obscom LIKE '%urgent%';
END |

DELIMITER ;

CALL Lst_Commandes('urgent');


--Exercice 3.

DELIMITER |

CREATE PROCEDURE CA_Fournisseur(
    In numfou varchar (25), 
    In annee date(10)
)

BEGIN
    SELECT fournis.numfou, fournis.nomfou, SUM(ligcom.qtecde * ligcom.priuni * 1.2)   
    FROM fournis
    JOIN entcom ON entcom.numfou = fournis.numfou
    JOIN ligcom ON ligcom.numcom = entcom.numcom
    WHERE YEAR (datcom) = annee AND fournis.numfou = numfou
    GROUP BY fournis.numfou, nomfou;
END |

DELIMITER ;

CALL CA_Fournisseur(66, 2018);
