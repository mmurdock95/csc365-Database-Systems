use csu;

SELECT c.Campus FROM campuses c
   WHERE c.County = 'Los Angeles'
   ORDER BY c.Campus;

SELECT d.year,  d.degrees FROM degrees d
   INNER JOIN campuses c ON c.Id = d.CampusId
   WHERE d.year >=1994 AND d.year <= 2000 AND c.Campus = 'California  Maritime Academy'
   ORDER BY d.year;

SELECT c.Campus, ds.Name, de.Gr, de.Ug FROM campuses c
   INNER JOIN discEnr de ON de.CampusId = c.Id
      INNER JOIN disciplines ds ON ds.Id = de.discipline
   WHERE (ds.Name = 'Mathematics' OR ds.Name = 'Engineering' OR ds.Name = 'Computer and Info. Sciences')
               AND c.Campus LIKE '%Polytechnic%' AND de.Year = 2004
   ORDER BY c.Campus, ds.Name;

-- must finish #4
-- SELECT DISTINCT c.Campus, ag, bio FROM campuses c
--    INNER JOIN discEnr de ON de.CampusId = c.Id
--       INNER JOIN disciplines ds ON ds.Id = de.discipline
--    WHERE (ds.Name = 'Agriculture' AS ag) AND ds.Name = 'Biological Sciences' AS bio

SELECT c.Campus, ds.Name FROM campuses c
   INNER JOIN discEnr de ON de.CampusId = c.Id
      INNER JOIN disciplines ds ON ds.Id = de.discipline
   WHERE de.Gr > de.Ug*3 AND de.Year = 2004
   ORDER BY c.Campus, ds.Name;

-- Must finish 6

--Must finsih 7

