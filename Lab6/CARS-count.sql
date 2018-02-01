-- Michael Murdock
-- rmurdock@calpoly.edu
-- CSC365 EBuckalew
-- Lab 6

USE cars;

-- 1. For each Japanese car maker (reported by their short name) report the best mileage per gallon 
-- of a car produced by it and the average acceleration. Sort the output in ascending order by the best mileage.
SELECT cm.Maker, MAX(d.MPG) AS "max mpg" , AVG(d.Accelerate) AS "avg acceleration" FROM carmakers cm
   INNER JOIN makes m ON m.Model = cm.Maker
   INNER JOIN cardata d on d.Id = m.Id
   INNER JOIN countries cu ON cu.Id = cm.Country
   INNER JOIN continents co ON co.Id = cu.Continent
   WHERE cu.Name = "japan"
   GROUP BY m.Make
   ORDER BY MAX(d.MPG);

-- 2. For each US car maker (reported by their short name), report the number of 4-cylinder cars that 
-- are lighter than 4000 lbs with 0 to 60 mph acceleration better than 14 seconds. Sort the output
-- in descending order by the number of cars reported.
SELECT cm.Maker, COUNT(d.Id) AS "num cars" FROM carmakers cm
   INNER JOIN makes m ON m.Model = cm.Maker
   INNER JOIN cardata d on d.Id = m.Id
   INNER JOIN countries cu ON cu.Id = cm.Country
   INNER JOIN continents co ON co.Id = cu.Continent
   WHERE cu.Name = "usa" AND d.Cylinders = 4 AND d.Weight < 4000 AND d.Accelerate < 14
   GROUP BY cm.Maker
   ORDER BY COUNT(d.Id) DESC;

-- 3. For each year in which ‘honda’ produced more than two models, report the best, the worst and 
-- the average gas mileage of a ‘toyota’ vehicle. Report results in chronological order.
SELECT  MAX(d4.MPG) AS "Max MPG", MIN(d4.MPG) AS "Min MPG", AVG(d4.MPG) AS "Avg MPG" 
      FROM carmakers cm, models mo, makes m1, makes m2, 
           makes m3, cardata d1, cardata d2, cardata d3, carmakers cm2, 
           models mo2, makes m4, cardata d4
   WHERE cm.Maker = "honda"
      AND d1.Year = d2.Year
      AND d2.Year = d3.Year
      AND cm.Id = mo.Maker
      AND m1.Id != m2.Id
      AND m3.Id != m2.Id
      AND m1.Id != m3.Id
      AND m1.Id < m2.Id
      AND m2.Id < m3.Id
      AND m1.Id = d1.Id
      AND m2.Id = d2.Id
      AND m3.Id = d3.Id
      AND mo.Model = m1.Model
      AND mo.Model = m2.Model
      AND mo.Model = m3.Model
      AND cm2.Maker = "toyota"
      AND cm2.Id = mo2.Maker
      AND mo2.Model = m4.Model
      AND m4.Id = d4.Id
      AND d4.Year = d1.Year
   GROUP BY d4.Year
   ORDER BY d1.Year;

-- 4. For each year when US-manufactured cars averaged less than 100 horsepower, report the highest 
-- and the lowest engine displacement number. Sort in chronological order.
SELECT d.Year, MAX(d.Edispl) AS "Max edispl", MIN(d.Edispl) AS "Min edispl" FROM carmakers cm
   INNER JOIN makes m ON m.Model = cm.Maker
   INNER JOIN cardata d on d.Id = m.Id
   INNER JOIN countries cu ON cu.Id = cm.Country
   WHERE cu.Name = "usa"
   GROUP BY d.Year
   HAVING  AVG(d.Horsepower) < 100
   ORDER BY d.Year;