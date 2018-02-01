#Michael Murdock
#rmurdock@calpoly.edu
#CSC365 EBuckalew
#Lab 3
ALTER TABLE students
  ADD GPA DECIMAL(6,3);
DELETE FROM students
   WHERE grade != 5 AND grade != 6;
INSERT INTO teachers(lastName,firstName,classroom) VALUES ('AP-MAWR','GAWAIN',120);
UPDATE students
   SET classroom = 120
   WHERE (lastName = "FLACHS" AND firstName = "JEFFERY") OR 
         (lastName = "HUANG" AND firstName = "TAWANNA") OR
         (lastName = "GRUNIN" AND firstName = "EMILE");
UPDATE students
   set GPA = 3.25
   WHERE grade = 6;
UPDATE students
   set GPA = 2.9
   WHERE grade = 5 AND classroom = 109;
UPDATE students
   set GPA = 3.5
   WHERE grade = 5 AND classroom = 120;
UPDATE students
   set GPA = 4.0
   where lastName = "Maciag" AND firstName = "CHET";
UPDATE students
   set GPA = GPA + .3
   where lastName = "GERSTEIN" AND firstName = "AL";
UPDATE students
   set GPA = GPA * 1.1
   where (lastName = "HUANG" AND firstName = "TAWANNA") OR 
         (lastName = "JAGNEAUX" AND firstName = "ELVIRA");
SELECT * FROM students
   ORDER BY GPA, grade, lastName;
SELECT * FROM teachers;