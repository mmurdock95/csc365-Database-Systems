-- Michael Murdock
-- rmurdock@calpoly.edu
-- CSC365 EBuckalew
-- Lab 7

USE csu;

-- Q1
SELECT camp.Campus, e.FTE FROM campuses camp
   INNER JOIN enrollments e ON e.CampusId = camp.Id
   WHERE  e.CampusId = camp.Id AND e.FTE = (
      SELECT MAX(e.FTE) FROM enrollments e
         WHERE e.Year = 2000
      );