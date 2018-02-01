-- Michael Murdock
-- rmurdock@calpoly.edu
-- CSC365 EBuckalew
-- Lab 7

use bakery;
-- Q1
SELECT c.FirstName, c.LastName FROM customers c
  INNER JOIN receipts r ON r.Customer = c.CId 
  INNER JOIN items i ON i.Receipt = r.RNumber
  INNER JOIN goods g ON g.GId = i.item
  WHERE r.SaleDate LIKE "2007-10-%"
  GROUP BY c.CId
  HAVING SUM(g.Price) = (
    SELECT
       MAX(prices)
       FROM (
          SELECT c.FirstName, c.LastName, SUM(g.Price) AS prices FROM customers c
            INNER JOIN receipts r ON r.Customer = c.CId 
            INNER JOIN items i ON i.Receipt = r.RNumber
            INNER JOIN goods g ON g.GId = i.item
            WHERE  r.SaleDate LIKE "2007-10-%"
            GROUP BY
              c.CId
            ) pricetable
  );

-- Q2
SELECT * FROM customers c
  WHERE c.CId NOT IN (
    SELECT c.CId FROM customers c
      INNER JOIN receipts r ON r.Customer = c.CId 
      INNER JOIN items i ON i.Receipt = r.RNumber
      INNER JOIN goods g ON g.GId = i.item
      WHERE r.SaleDate LIKE "2007-10-%" AND g.Food = 'Twist'
      GROUP BY c.CId );

-- Q3
SELECT g.Food, g.Flavor FROM items i
  INNER JOIN goods g ON g.GId = i.item
  GROUP BY g.GId
  HAVING SUM(g.Price) = (
    SELECT MAX(Sum) FROM(
      SELECT g.Food, g.Flavor, SUM(g.Price) AS `Sum` FROM items i
        INNER JOIN goods g ON g.GId = i.item
          GROUP BY
            g.GId
    ) r
  );
      
-- Q4
SELECT g.Food, g.Flavor, COUNT(i.Receipt) AS "reciept count" FROM items i
  INNER JOIN goods g ON g.GId = i.item
  GROUP BY
    g.GId
  HAVING COUNT(i.Receipt) = (
    SELECT MAX(receipt_count) FROM (
      SELECT g.GId, g.Food, g.Flavor, COUNT(i.Receipt) AS receipt_count FROM items i
        INNER JOIN goods g ON g.GId = i.item
        GROUP BY g.GId
    ) CountTable
  );
-- Q5
SELECT r.SaleDate FROM customers c
  INNER JOIN receipts r ON r.Customer = c.CId 
  INNER JOIN items i ON i.Receipt = r.RNumber
  INNER JOIN goods g ON g.GId = i.item
   WHERE r.SaleDate LIKE "2007-10-%"
   GROUP BY r.SaleDate
   HAVING SUM(g.Price) = (
    SELECT MAX(sum_price) FROM (
      SELECT r.SaleDate, SUM(g.Price) AS sum_price FROM customers c
        INNER JOIN receipts r ON r.Customer = c.CId 
        INNER JOIN items i ON i.Receipt = r.RNumber
        INNER JOIN goods g ON g.GId = i.item
        WHERE  r.SaleDate LIKE "2007-10-%"
        GROUP BY r.SaleDate
    ) r
  )
;
-- Q6
SELECT c.FirstName, c.LastName, COUNT(i.Receipt) AS "num receipts", MAX(r.SaleDate) AS "last sale date" FROM customers c
  INNER JOIN receipts r ON r.Customer = c.CId 
  INNER JOIN items i ON i.Receipt = r.RNumber
  WHERE c.CId NOT IN (
    SELECT c.CId FROM customers c
      INNER JOIN receipts r ON r.Customer = c.CId 
      INNER JOIN items i ON i.Receipt = r.RNumber
      WHERE r.SaleDate = (
        SELECT r.SaleDate FROM customers c
          INNER JOIN receipts r ON r.Customer = c.CId 
          INNER JOIN items i ON i.Receipt = r.RNumber
          INNER JOIN goods g ON g.GId = i.item
          WHERE  r.SaleDate LIKE "2007-10-%"
          GROUP BY r.SaleDate
          HAVING SUM(g.Price) = (
            SELECT MAX(sum_price) FROM (
              SELECT r.SaleDate, SUM(g.Price) AS sum_price FROM customers c
                INNER JOIN receipts r ON r.Customer = c.CId 
                INNER JOIN items i ON i.Receipt = r.RNumber
                INNER JOIN goods g ON g.GId = i.item
                WHERE  r.SaleDate LIKE "2007-10-%"
                GROUP BY r.SaleDate
             ) r
          )
        )
  );

-- Q8
SELECT DISTINCT c.FirstName, c.LastName FROM customers c
  INNER JOIN receipts r ON r.Customer = c.CId 
    WHERE  r.SaleDate >= "2007-10-11" OR r.SaleDate <= "2007-10-05"
  ORDER BY c.LastName;

-- Q9
 SELECT c.FirstName, c.LastName, MIN(r.SaleDate) as "min date" FROM customers c
  INNER JOIN receipts r ON r.Customer = c.CId 
  WHERE r.SaleDate LIKE "2007-10-%" AND c.CId IN (
    SELECT c.CId FROM receipts r1, receipts r2, customers c, (
      SELECT c.CId, MAX(r.SaleDate) AS LastOctPur FROM customers c
        INNER JOIN receipts r ON r.Customer = c.CId 
        WHERE r.SaleDate LIKE "2007-10-%"
        GROUP BY c.CId
      ) l
      WHERE  r1.Customer = l.CId
        AND r2.Customer = l.CId
        AND c.CId = l.CId
        AND r1.RNumber < r2.RNumber
        AND r1.SaleDate = l.LastOctPur
        AND r2.SaleDate = l.LastOctPur
      ORDER BY l.LastOctPur )
   GROUP BY c.CId
   ORDER BY "min date";

-- Q10
SELECT COUNT(g.Flavor) AS "Chocolate" FROM goods g
  WHERE g.Flavor = "Chocolate";