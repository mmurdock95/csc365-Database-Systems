USE students;

SELECT FirstName, LastName FROM list
   WHERE classroom = 111
   ORDER BY LastName;

SELECT DISTINCT grade, classroom FROM list
   ORDER BY  classroom DESC;

SELECT DISTINCT t.First, t.Last, t.classroom FROM teachers t
   INNER JOIN list ON t.classroom = list.classroom
   WHERE list.grade = 5
   ORDER BY t.classroom;

SELECT s.LastName, s.FirstName FROM list s
   INNER JOIN teachers t ON t.classroom = s.classroom
   WHERE t.Last= 'MOYER' AND t.First = 'Otha'
   ORDER BY s.LastName;

SELECT DISTINCT t.Last, t.First, s.grade FROM teachers t
   INNER JOIN list s ON t.classroom =  s.classroom
   WHERE s.grade = 0 OR s.grade = 1 OR s.grade = 2 or s.grade = 3
   ORDER BY s.grade, t.Last;