-- 1
CREATE TRIGGER maj_total
    AFTER INSERT ON lignedecommande
    FOR EACH ROW
BEGIN
    DECLARE total_amount DECIMAL(10, 2);

    -- Calculer le nouveau total de la commande
    SELECT SUM(prix * quantite) INTO total_amount
    FROM lignedecommande
    WHERE id_commande = NEW.id_commande;

    -- Mettre à jour le champ total dans la table commande
    UPDATE commande
    SET total = total_amount
    WHERE id = NEW.id_commande;
END;

INSERT INTO lignedecommande (id_commande, id_produit, quantite, prix)
VALUES (1, 1, 2, 10.00);
-- Le champ total est bien mis a jour

-- 2
DELIMITER //
CREATE TRIGGER maj_total_update_delete
    AFTER UPDATE, DELETE ON lignedecommande
FOR EACH ROW
BEGIN
    DECLARE total_amount DECIMAL(10, 2);

    -- Calculer le nouveau total de la commande
SELECT SUM(prix * quantite) INTO total_amount
FROM lignedecommande
WHERE id_commande = OLD.id_commande;

-- Mettre à jour le champ total dans la table commande
UPDATE commande
SET total = total_amount
WHERE id = OLD.id_commande;
END;
//
DELIMITER ;

-- 3
DELIMITER //
CREATE TRIGGER maj_total_update_delete
    AFTER UPDATE, DELETE ON lignedecommande
    FOR EACH ROW
BEGIN
    DECLARE total_amount DECIMAL(10, 2);

    -- Calculer le nouveau total de la commande en prenant en compte la remise
    SELECT SUM((prix * quantite) * (1 - remise / 100)) INTO total_amount
    FROM lignedecommande
    WHERE id_commande = OLD.id_commande;

    -- Mettre à jour le champ total dans la table commande
    UPDATE commande
    SET total = total_amount
    WHERE id = OLD.id_commande;
END;
//
DELIMITER ;