-- Michael Murdock
-- rmurdock@calpoly.edu
-- CSC365 EBuckalew
-- Lab 5

USE bakery;

-- Q1
SELECT DISTINCT c.FirstName, c.LastName FROM customers c
   INNER JOIN receipts r ON r.Customer = c.CId 
   INNER JOIN items i ON i.Receipt = r.RNumber
   INNER JOIN goods g ON g.GId = i.item
   WHERE g.Food = "Croissant"
   GROUP BY i.Receipt, g.Food
   HAVING COUNT(i.Receipt) > 1 AND COUNT(g.Food) > 1
   ORDER BY c.LastName;

-- Q2
SELECT DISTINCT r.SaleDate FROM customers c
   INNER JOIN receipts r ON r.Customer = c.CId 
   INNER JOIN items i ON i.Receipt = r.RNumber
   INNER JOIN goods g ON g.GId = i.item
   WHERE (c.LastName = "DOMKOWSKI" AND c.FirstName = "ALMETA") OR 
               (g.Food = "Cookie" AND g.Flavor = "Gongolais")
   ORDER BY r.SaleDate;

-- Q3
SELECT SUM(g.Price) AS "SUM" FROM customers c
   INNER JOIN receipts r ON r.Customer = c.CId 
   INNER JOIN items i ON i.Receipt = r.RNumber
   INNER JOIN goods g ON g.GId = i.item
   WHERE c.LastName = "STENZ" AND c.FirstName = "NATACHA" AND r.SaleDate  LIKE '2007-10-%';

-- Q4
SELECT SUM(g.Price) AS "SUM" FROM customers c
   INNER JOIN receipts r ON r.Customer = c.CId 
   INNER JOIN items i ON i.Receipt = r.RNumber
   INNER JOIN goods g ON g.GId = i.item
   WHERE g.Flavor = "Chocolate" AND r.SaleDate  LIKE '2007-10-%';