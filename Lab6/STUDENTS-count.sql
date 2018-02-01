-- Michael Murdock
-- rmurdock@calpoly.edu
-- CSC365 EBuckalew
-- Lab 6

USE students;

-- Q1
--1. Report the names of teachers who have between seven and eight (inclusive, on both ends) 
--students in their classes. Sort the output in alphabetical order by teacher’s last name.
SELECT t.First, t.Last FROM teachers t
   INNER JOIN list s ON s.classroom = t.classroom
   GROUP BY s.classroom
   HAVING COUNT(*) >= 7 && COUNT(*) <= 8
   ORDER BY t.Last;


-- Q2
--2. For each grade, report the number of classrooms in which it is taught and the total number 
--of students in the grade. Sort the output by the number of classrooms in descending order, 
--then by grade in ascending order.
SELECT s.grade, COUNT(DISTINCT(s.classroom)) AS "Num Classrooms", COUNT(*) AS "Num Students"
   FROM list s
   GROUP BY s.grade
   ORDER BY s.classroom DESC, s.grade;


-- Q3
--3. For each kindergarten classroom, report the total number of students. Sort the output in descending 
--order by the number of students.
SELECT s.classroom, COUNT(*) AS "Num Students" FROM list s
   WHERE s.grade = 0
   GROUP BY s.classroom
   ORDER BY COUNT(*) DESC;


-- Q4
--4. For each fourth grade classroom, report the student (last name) who is the last (alphabetically) on 
--the class roster. Sort output by classroom.
SELECT MAX(s.LastName) AS "Last-Last Name", s.classroom FROM list s
   where s.grade = 4
   GROUP BY s.classroom
   ORDER BY s.classroom;