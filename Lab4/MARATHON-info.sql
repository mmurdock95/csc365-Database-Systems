use marathon;

SELECT RunTIme, Pace, Place FROM marathon
   WHERE FirstName = 'TEDDY' AND LastName = 'BRASEL';

SELECT FirstName, LastName, RunTime, Place, GroupPlace FROM marathon
   WHERE Sex = 'F' AND Town = 'QUINCY' AND State = 'MA'
   ORDER BY Place;

SELECT FirstName, LastName, Town, RunTime FROM marathon
   WHERE Sex = 'F' AND Age = 34 AND State = 'CT'
   ORDER BY RunTime;

SELECT DISTINCT m1.BibNumber FROM marathon m1
   WHERE EXISTS (
                              SELECT 1 FROM marathon m2
                                 WHERE m2.BibNumber  = m1.BibNumber
                                 LIMIT 1, 1)
   ORDER BY m1.BibNumber;


--Must do # 5
-- SELECT FirstName, LastName, Age, GroupPlace, AgeGroup, Sex FROM marathon
--    WHERE GroupPlace = 1 OR GroupPlace = 2
--    ORDER BY Sex, AgeGroup;

-- SELECT DISTINCT m1.FirstName, m1.LastName, m1.Age, m1.GroupPlace, m2.FirstName, 
--                               m2.LastName, m2.Age, m2.GroupPlace, m1.AgeGroup, m1.Sex FROM marathon m1
--    WHERE EXISTS (
--                               SELECT 1 FROM marathon m2
--                                  WHERE m2.AgeGroup  = m1.AgeGroup AND (m1.GroupPlace = 1 AND m2.GroupPlace=2)
--                                  LIMIT 1, 1) 
--    ORDER BY m1.Sex, m1.AgeGroup;
