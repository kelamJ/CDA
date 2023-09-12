-- 1
DELIMITER //
CREATE TRIGGER modif_reservation
    BEFORE UPDATE ON reservation
    FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000'
  SET MESSAGE_TEXT = "La modification des réservations n'est pas autorisée.";
END //
DELIMITER ;
-- Pour tester ->
UPDATE reservation
SET
  res_date = NOW(), -- Mettre la date actuelle
  res_date_debut = DATE_ADD(NOW(), INTERVAL 1 DAY), -- Date de début dans 1 jour
  res_date_fin = DATE_ADD(NOW(), INTERVAL 5 DAY), -- Date de fin dans 5 jours
  res_prix = ROUND(RAND() * 1000, 2), -- Prix aléatoire entre 0 et 1000
  res_arrhes = ROUND(RAND() * 500, 2) -- Arrhes aléatoires entre 0 et 500
WHERE res_id = 1;

-- 2
DELIMITER //
CREATE TRIGGER insert_reservation
    BEFORE INSERT ON reservation
    FOR EACH ROW
BEGIN
    DECLARE reservation_count INT;

  -- Compter le nombre de réservations pour l'hôtel de la nouvelle réservation
    SELECT COUNT(*) INTO reservation_count
    FROM reservation
    WHERE res_cha_id = NEW.res_cha_id;

    IF reservation_count >= 10 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = "L'ajout de réservation n'est pas autorisé, l'hôtel a déjà 10 réservations.";
  END IF;
END //
DELIMITER ;

-- 3
DELIMITER //
CREATE TRIGGER insert_reservation2
    BEFORE INSERT ON reservation
    FOR EACH ROW
BEGIN
    DECLARE reservation_count INT;

  -- Compter le nombre de réservations existantes pour le client de la nouvelle réservation
    SELECT COUNT(*) INTO reservation_count
    FROM reservation
    WHERE res_cli_id = NEW.res_cli_id;

    IF reservation_count >= 3 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = "L'ajout de réservation n'est pas autorisé, le client a déjà 3 réservations.";
END IF;
END //
DELIMITER ;

-- 4
DELIMITER //
CREATE TRIGGER insert_chambre
    BEFORE INSERT ON chambre
    FOR EACH ROW
BEGIN
    DECLARE total_capacity INT;

  -- Calculer le total des capacités des chambres pour l'hôtel de la nouvelle chambre
    SELECT SUM(cha_capacite) INTO total_capacity
    FROM chambre
    WHERE cha_hot_id = NEW.cha_hot_id;

    -- Vérifier si le total des capacités dépasse 50
    IF total_capacity + NEW.cha_capacite > 50 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = "L'ajout de chambre n'est pas autorisé, le total des capacités dépasse 50 pour cet hôtel.";
END IF;
END //
DELIMITER ;