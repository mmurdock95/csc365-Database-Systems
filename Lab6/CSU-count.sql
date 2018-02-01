-- Michael Murdock
-- rmurdock@calpoly.edu
-- CSC365 EBuckalew
-- Lab 6

USE csu;

-- 1. For each campus that averaged more than $2500 in fees between 2000 and 2005, report the total cost of 
-- fees for this five year period. Sort in ascending order by fee.
SELECT c.Campus, SUM(f.fee) AS "total fees" FROM campuses c
   INNER JOIN fees f ON f.CampusId = c.Id
   WHERE f.Year >= 2000 AND f.Year <= 2005
   GROUP BY f.CampusId
   HAVING AVG(f.fee) > 2500
   ORDER BY f.fee;

-- 2. For each campus for which data exists for more than 60 years, report the average, the maximum and 
-- the minimum enrollment (for all years). Sort your output by average enrollment.
SELECT c.Campus, AVG(e.Enrolled) AS "Avg Enrollment", MAX(e.Enrolled) AS "Max Enrollment", 
      MIN(e.Enrolled) AS "Min Enrollment" FROM enrollments e, campuses c
   WHERE e.CampusId = c.Id
   GROUP BY e.CampusId
   HAVING MAX(e.Year) - MIN(e.Year) > 60
   ORDER BY AVG(e.Enrolled) 
;

-- 3. For each campus in ‘LA’ and ‘Orange’ counties report the total number of degrees granted between 1998 
-- and 2002 (inclusive). Sort the output in descending order by the number of degrees.
SELECT c.Campus, SUM(d.Degrees) AS "Sum Desgrees" FROM degrees d, campuses c
   WHERE c.Id = d.CampusId AND (c.County = "Los Angeles" OR c.County = "Orange")
         AND d.Year >= 1998 AND d.Year <= 2002
   GROUP BY c.Id
   ORDER BY SUM(Degrees);

-- 4. For each campus that had more than 20,000 enrolled students in 2004 report the number of disciplines 
-- for which the campus had non-zero graduate enrollment. Sort the output in alphabetical order by the name 
-- of the campus. (This query should exclude campuses that had no graduate enrollment at all).
SELECT c.Campus, COUNT(de.discipline) as "discipline count"
   FROM enrollments en, campuses c, discEnr de
   WHERE en.CampusId = c.Id
      AND de.CampusId = en.CampusId
      AND de.Year = en.Year
      AND en.Enrolled > 20000
      AND en.year = 2004
      AND de.Gr != 0
   GROUP BY de.CampusId
   ORDER BY c.Campus;