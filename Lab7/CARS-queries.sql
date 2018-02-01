-- Michael Murdock
-- rmurdock@calpoly.edu
-- CSC365 EBuckalew
-- Lab 7

USE cars;

-- Q1
SELECT m.Make, d.Year FROM makes m 
   INNER JOIN cardata d on d.Id = m.Id
   WHERE d.MPG = (
      SELECT MAX(MPG) FROM cardata d
      );

-- Q2

SELECT m.Make, d.Year FROM makes m 
   INNER JOIN cardata d on d.Id = m.Id
   WHERE d.Accelerate = (
      SELECT MIN(d.Accelerate) FROM makes m 
         INNER JOIN cardata d on d.Id = m.Id
         WHERE d.MPG = (
            SELECT MAX(MPG) FROM cardata d
            )
      );

-- Q6
SELECT max8 - min4 FROM(
   SELECT MAX(d1.MPG) as max8
      FROM cardata d1
      WHERE d1.Cylinders = 8
   ) b, (
   SELECT MIN(d2.MPG) as min4
      FROM cardata d2
      WHERE d2.Cylinders = 4
   ) w
;
