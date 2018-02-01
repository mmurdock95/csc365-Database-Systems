-- Michael Murdock
-- rmurdock@calpoly.edu
-- CSC365 EBuckalew
-- Lab 5

USE cars;

-- Q1
SELECT m.Make, d.Year,  cm.FullName FROM carmakers cm
   INNER JOIN makes m ON m.Model = cm.Maker
   INNER JOIN cardata d on d.Id = m.Id
   WHERE d.Year > 1980 AND d.MPG > (SELECT d1.MPG FROM carmakers cm1
                                                                  INNER JOIN makes m1 ON m1.Model = cm1.Maker
                                                                  INNER JOIN cardata d1 on d1.Id = m1.Id
                                                                  WHERE d1.Year = 1982 AND m1.Make = "honda civic")
   ORDER BY d.MPG DESC;

-- Q2
SELECT AVG(d.Horsepower) AS "Average" , MAX(d.Horsepower) AS "Max" , MIN(d.Horsepower) AS "Min" FROM carmakers cm
   INNER JOIN makes m ON m.Model = cm.Maker
   INNER JOIN cardata d on d.Id = m.Id
   WHERE m.Model = 'renault' AND d.Year >= 1971 AND d.Year <= 1976;

-- Q3
SELECT DISTINCT COUNT(*) AS "Num Cars" FROM carmakers cm
   INNER JOIN makes m ON m.Model = cm.Maker
   INNER JOIN cardata d on d.Id = m.Id
   WHERE d.Year = 1971 AND d.Accelerate > (SELECT d1.Accelerate FROM carmakers cm1
                                                                  INNER JOIN makes m1 ON m1.Model = cm1.Maker
                                                                  INNER JOIN cardata d1 on d1.Id = m1.Id
                                                                  WHERE d1.Year = 1972 AND m1.Make = "volvo 145e (sw)");

-- Q4
SELECT DISTINCT COUNT(cm.Id) AS "Num Manufacturers" FROM carmakers cm
   INNER JOIN makes m ON m.Model = cm.Maker
   INNER JOIN cardata d on d.Id = m.Id
   where d.Weight > 4000;