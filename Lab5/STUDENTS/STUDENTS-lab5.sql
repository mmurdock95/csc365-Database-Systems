-- Michael Murdock
-- rmurdock@calpoly.edu
-- CSC365 EBuckalew
-- Lab 5

USE students;

-- Q1
SELECT DISTINCT s1.FirstName, s1.LastName, s1.Grade, s2.FirstName, s2.LastName, s2.Grade
   FROM list s1, list s2
   WHERE s2.LastName != s1.LastName and s2.FirstName = s1.FirstName;

-- Q2
SELECT s.FirstName, s.LastName FROM list s
   INNER JOIN teachers t ON t.classroom = s.classroom
   WHERE t.Last != "MOYER" AND t.First != "OTHA" AND s.Grade = 1
   ORDER BY s.LastName;

   -- Q3
   SELECT COUNT(*) AS "Total 3rd & 4th Graders" FROM list s
      INNER JOIN teachers t ON t.classroom = s.classroom
      WHERE s.Grade = 3 OR s.Grade = 4;

-- Q4 
SELECT COUNT(*) AS "Total students taught by Ondersma" FROM list s
      INNER JOIN teachers t ON t.classroom = s.classroom
      WHERE t.Last = "ONDERSMA" AND t.First = "LORIA";

   