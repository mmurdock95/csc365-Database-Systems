-- Michael Murdock
-- rmurdock@calpoly.edu
-- CSC365 EBuckalew
-- Lab 7

use students;
-- Q1
SELECT t.First, t.Last, COUNT(DISTINCT(s.LastName)) AS "num students" FROM teachers t
   INNER JOIN list s ON s.classroom = t.classroom
   GROUP BY s.classroom
   ORDER BY COUNT(DISTINCT(s.LastName)) DESC LIMIT 1;


-- Q3
SELECT Classroom FROM (
   SELECT Classroom, COUNT(LastName)
      FROM list
      GROUP BY Classroom
      HAVING COUNT(LastName) < (
         SELECT AVG(count) FROM (
            SELECT COUNT(LastName) AS count
               FROM list
               GROUP BY Classroom
            ) c
         )
   ) a
   ORDER BY Classroom DESC;

-- Q5
SELECT t.Last FROM teachers t
   INNER JOIN list s ON s.classroom = t.classroom
   GROUP BY s.Grade
   HAVING COUNT(DISTINCT(s.Classroom)) > 1
   ORDER BY s.Grade;