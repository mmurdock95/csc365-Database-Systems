use bakery;

SELECT Flavor, Food, PRICE FROM goods
   WHERE Flavor = 'Chocolate' AND PRICE < 5
   ORDER BY PRICE DESC;

SELECT Flavor, Food, PRICE FROM goods
   WHERE (Food = 'Cookie' AND PRICE > 1.10) OR Flavor = 'Lemon' OR (Flavor = 'Apple' AND Food != 'Pie')
   ORDER BY Flavor, Food;

SELECT DISTINCT c.LastName, c.FirstName FROM customers c
   INNER JOIN receipts r ON r.Customer = c.CId
   WHERE r.SaleDate = '2007-10-03'
   ORDER BY c.LastName;

SELECT DISTINCT g.Flavor, g.Food FROM goods g
   INNER JOIN items i  ON i.Item = g.GId
      INNER JOIN receipts r ON r.RNumber = i.Receipt
   WHERE r.SaleDate = '2007-10-04' AND g.Food = 'Cake'
   ORDER BY g.Flavor;

SELECT g.Flavor, g.Food, g.Price FROM goods g
   INNER JOIN items i ON i.item = g.GId
      INNER JOIN receipts r ON r.RNumber = i.Receipt
         INNER JOIN customers c ON c.CId = r.Customer
   WHERE c.LastName = 'CRUZEN' AND c.FirstName = 'ARIANE' AND r.SaleDate = '2007-10-25'
   ORDER BY r.RNumber;

SELECT DISTINCT g.Flavor, g.Food FROM goods g
   INNER JOIN items i ON i.item = g.GId
      INNER JOIN receipts r ON r.RNumber = i.Receipt
         INNER JOIN customers c ON c.CId = r.Customer
   WHERE c.LastName = 'ARNN' AND c.FirstName = 'KIP' AND g.Food = 'Cookie' AND r.SaleDate LIKE '2007-10-%'
   ORDER BY g.Flavor;