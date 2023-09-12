-- Créez un déclencheur BEFORE INSERT sur la table order details qui vérifie la règle de gestion avant d'insérer les données.

--Dans le déclencheur, utilisez des requêtes SQL pour vérifier si le client et le fournisseur du produit appartiennent au même pays pour chaque produit de la commande. Vous devrez effectuer des jointures entre les tables order details, products, customers (pour le client), et suppliers (pour le fournisseur) pour obtenir ces informations.

--Si la règle de gestion n'est pas respectée pour au moins un produit de la commande, le déclencheur doit générer une erreur qui empêchera l'insertion de la commande dans la table order details.


DELIMITER //

CREATE TRIGGER CheckShippingCountry
BEFORE INSERT ON `order details`
FOR EACH ROW
BEGIN
  DECLARE clientCountry VARCHAR(15);
  DECLARE supplierCountry VARCHAR(15);

  -- Obtenir le pays du client
  SELECT customers.Country INTO clientCountry
  FROM customers
  JOIN orders ON customers.CustomerID = NEW.OrderID;

  -- Obtenir le pays du fournisseur du produit
  SELECT suppliers.Country INTO supplierCountry
  FROM suppliers
  JOIN products ON suppliers.SupplierID = NEW.ProductID;

  -- Vérifier si les pays correspondent
  IF clientCountry <> supplierCountry THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Le client et le fournisseur ne sont pas dans le même pays pour ce produit.';
  END IF;
END //

DELIMITER ;





