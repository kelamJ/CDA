-- Mise a jour de données cas papyrus
-- 1.
    UPDATE vente
    SET
    prix1 = prix1 * 1.04,
    prix2 = prix2 *0.02
    WHERE numfou = 9180
-- 2.
    UPDATE vente
    SET
    prix2 = prix1
    WHERE prix2 = 0
3.
    UPDATE entcom
    JOIN fournis ON  fournis.numfou = entcom.numfou
    SET obscom = '*****'
    WHERE satisf < 5
4.
    DELETE FROM vente WHERE codart
    IN (SELECT codart FROM produit WHERE (codart LIKE "I110%"));