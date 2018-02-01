#Michael Murdock
#rmurdock@calpoly.edu
#CSC365 EBuckalew
#Lab 3
DELETE dE FROM disciplineEnrollments dE
   INNER JOIN Campuses c
    ON dE.campus = c.id
   INNER JOIN disciplines d
    ON d.id = dE.discipline
   WHERE ( d.name   != 'Engineering' 
           OR ( c.campus != 'California Polytechnic State University-San Luis Obispo' 
              AND c.campus != 'California State Polytechnic University-Pomona' ) )
         AND
         ( c.campus != 'Long Beach State University' OR dE.graduate <=200 )
         AND
         ( d.name != 'Computer and Info. Sciences' OR dE.undergraduate <=500);

SELECT * FROM disciplineEnrollments
  ORDER BY campus, discipline;


DELETE f FROM fees f
  INNER JOIN Campuses c
    ON f.campus = c.id
  WHERE   (f.campusFee <= 2500)
        OR 
          (f.year != 2002 AND f.year != 2004 AND f.year != 2005 AND f.year != 2006)
        OR
          (c.campus != 'California Polytechnic State University-San Luis Obispo'
          AND c.campus != 'California State Polytechnic University-Pomona'
          AND c.campus != 'San Jose State University');

SELECT * FROM fees
  ORDER BY campus, year;