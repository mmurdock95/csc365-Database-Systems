-- Michael Murdock
-- rmurdock@calpoly.edu
-- CSC365 EBuckalew
-- Lab 6

USE airlines;

-- 1. Find all airports with exactly 17 outgoing flights. Report the airport code and the full name of the airport sorted 
-- in alphabetical order by the code.
SELECT ap.Code, ap.Name FROM flights f, airports ap
   WHERE f.Source = ap.Code
   GROUP BY f.Source
   HAVING  COUNT(*) = 17
   ORDER BY ap.Code;

-- 2. Find the number of airports from which airport ‘ANP’ can be reached with exactly one transfer. (Make sure to exclude 
--    ‘ANP’ itself from the count). Report just the number.
SELECT COUNT(DISTINCT(f2.Destination)) "num anp can be reached"
   FROM flights f1, flights f2
   WHERE f1.Destination = f2.Source AND f1.Source = "ANP" AND f2.Destination != f1.Source;

-- 3. Find the number of airports from which airport ‘ATE’ can be reached with at most one transfer. (Make sure to exclude 
--    ‘ATE’ itself from the count). Report just the number.
SELECT COUNT(DISTINCT(f1.Source)) AS "num ate can be reached"
   FROM flights f1, flights f2
   WHERE ((f1.Destination = f2.Source) AND f1.Source != f2.Destination
         OR (f1.Source = f2.Source AND f1.Destination = f2.Destination))
         AND f2.Destination = "ATE";

-- 4. For each airline, report the total number of airports from which it has at least one outgoing flight. Report the full 
-- name of the airline and the number of airports computed. Report the results sorted by the number of airports in descending 
-- order.
SELECT a.Name, COUNT(DISTINCT(f.Source)) AS "total airports"
   FROM airlines a, flights f
   WHERE a.Id = f.Airline
   GROUP BY a.Name
   ORDER BY COUNT(DISTINCT(f.Source)) DESC;