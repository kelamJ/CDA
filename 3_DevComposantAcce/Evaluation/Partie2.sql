-- 9.
SELECT MAX(OrderDate) FROM `orders`
JOIN customers on customers.CustomerID = orders.CustomerID
WHERE CompanyName = "Du monde entier";

DELIMITER //
CREATE PROCEDURE GetMaxOrderDate(IN companyNameParam VARCHAR(40))
BEGIN
    SELECT MAX(orders.OrderDate)
    FROM orders
             JOIN customers ON customers.CustomerID = orders.CustomerID
    WHERE customers.CompanyName = companyNameParam;
END //
DELIMITER ;

CALL GetMaxOrderDate('Du monde entier');

-- 10.
SELECT round(avg(datediff(ShippedDate, OrderDate))) as "Délai moyen de livraison en jours"
FROM `orders`;

DELIMITER //

CREATE PROCEDURE CalculateAverageDeliveryTime(IN dateRangeParam VARCHAR(100))
BEGIN
  IF dateRangeParam IS NULL OR dateRangeParam = '' THEN
    -- Calculer la moyenne pour toutes les commandes
    SELECT ROUND(AVG(DATEDIFF(ShippedDate, OrderDate))) AS "Délai moyen de livraison en jours"
    FROM orders;
 ELSE
    -- Calculer la moyenne pour la plage de dates spécifiée
    SET @sql = CONCAT('
    SELECT ROUND(AVG(DATEDIFF(ShippedDate, OrderDate))) AS "Délai moyen de livraison en jours"
    FROM orders
    WHERE ShippedDate BETWEEN ', dateRangeParam);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
 END IF;
END //

DELIMITER ;

-- Pour toutes les commandes
CALL CalculateAverageDeliveryTime(NULL);

-- Pour une plage de dates spécifique (par exemple, pour l'année 2023)
CALL CalculateAverageDeliveryTime('2023-01-01' AND '2023-12-31');
