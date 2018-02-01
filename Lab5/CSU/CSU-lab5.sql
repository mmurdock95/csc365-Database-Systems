-- Michael Murdock
-- rmurdock@calpoly.edu
-- CSC365 EBuckalew
-- Lab 5

USE csu;

--Q1
SELECT SUM(d.Degrees) AS "total num degrees" FROM campuses c
   INNER JOIN degrees d ON d.CampusId = c.Id
   WHERE c.Campus = "California Polytechnic State University-San Luis Obispo" AND
               d.Year >= 1995 AND d.Year <= 2000;

-- Q2 
SELECT MAX(f.fee) AS "MAX", MIN(f.fee) AS "MIN", AVG(f.fee)  AS "AVG" FROM fees f
   WHERE f.Year = 2005;

-- Q3
SELECT AVG(e.FTE/f.FTE) AS "AVG ratio" FROM enrollments e
   INNER JOIN faculty f ON f.CampusId = e.CampusId AND f.Year = e.Year
   WHERE e.Year = 2004 AND e.FTE > 15000;

-- Q4
SELECT DISTINCT e.Year FROM enrollments e
   INNER JOIN degrees d ON  d.CampusId = e.CampusId
   INNER JOIN campuses c ON c.Id = e.CampusId
   WHERE (e.Enrolled > 17000 AND c.Campus = "California Polytechnic State University-San Luis Obispo") OR
               (d.Degrees > 3500 AND c.Campus = "California Polytechnic State University-San Luis Obispo")
   ORDER BY e.Year;