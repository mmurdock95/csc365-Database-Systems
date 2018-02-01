-- Michael Murdock
-- rmurdock@calpoly.edu
-- CSC365 EBuckalew
-- Lab 6

USE bakery;

-- 1. For each pastry flavor which is found in more than three types of pastries sold by the bakery, 
-- report the average price of an item of this flavor and the total number of different pastries of 
-- this flavor on the menu. Sort the output in ascending order by the average price.
SELECT AVG(g.PRICE) AS "Avg Price", COUNT(g.Food) AS "Total different Pastries", g.Flavor, g.Food FROM goods g
   GROUP BY g.Flavor 
   HAVING COUNT(g.Food) > 3
   ORDER BY AVG(g.PRICE);


-- 2. Find the total amount of money the bakery earned in October 2007 from selling eclairs. Report 
-- just the amount.
SELECT SUM(g.Price) AS "Total Earned" FROM goods g
   INNER JOIN items i ON i.Item = g.GId
   INNER JOIN receipts r ON r.RNumber = i.Receipt
   WHERE r.SaleDate LIKE "2007-10-%" AND g.Food = "Eclair";


-- 3. For each purchase made by ‘NATACHA STENZ’ display the receipt number, the date of purchase, the 
-- total number of items purchased and the amount paid. Sort in descending order by the amount paid1.
SELECT r.RNumber, r.SaleDate, MAX(i.Ordinal) AS "items purchased", SUM(g.Price) AS "amount paid" FROM goods g
   INNER JOIN items i ON i.Item = g.GId
   INNER JOIN receipts r ON r.RNumber = i.Receipt
   INNER JOIN customers c ON c.CId = r.customer
   WHERE c.LastName = "STENZ" AND c.FirstName = "NATACHA"
   GROUP BY r.RNumber
   ORDER BY SUM(g.Price);


-- 4. For each day of the week of October 8 (Monday to Sunday) report the total number of pur- chases 
-- (receipts), the total number of pastries purchased and the overall daily revenue. Report results in 
-- chronological order and include both the day of the week2 and the date3.
SELECT COUNT(r.RNumber) AS "total purchases", COUNT(g.Flavor) AS "total pastries", SUM(g.Price) AS "revenue"
   FROM goods g
   INNER JOIN items i ON i.Item = g.GId
   INNER JOIN receipts r ON r.RNumber = i.Receipt
   WHERE r.SaleDate >= "2007-10-08" AND r.SaleDate <= "2007-10-15"
   GROUP BY r.SaleDate
   ORDER BY r.SaleDate;


-- 5. Report all days on which more than ten tarts were purchased, sorted in chronological order.
SELECT r.SaleDate FROM goods g
   INNER JOIN items i ON i.Item = g.GId
   INNER JOIN receipts r ON r.RNumber = i.Receipt
   WHERE g.Food = "Tart" 
   GROUP BY r.SaleDate
   HAVING COUNT(g.Food) > 10
   ORDER BY r.SaleDate;