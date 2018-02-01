-- Michael Murdock
-- rmurdock@calpoly.edu
-- CSC365 EBuckalew
-- Lab 6

USE wine;

-- 1. For each wine score value above ‘88’, report average price, the cheapest price, and the most expensive price for a 
-- bottle of wine with that score (for all vintage Vintages combined), the total number of wines with that score and the 
-- total number of cases produced. Sort by the wine score.
SELECT w.Score, MIN(w.Price) AS "min", MAX(w.Price) AS "max", AVG(w.Price) AS "avg", 
       COUNT(*) AS "total", SUM(w.Cases) AS "total cases"
   FROM wine w
   WHERE Score > 88
   GROUP BY w.Score
   ORDER BY w.Score;


-- 2. For each Vintage, report the total number of red ‘Sonoma County’ wines whose scores are ‘90’ or above. Output in 
-- chronological order.
SELECT w.Vintage, COUNT(Score) AS "total red sonoma > 90"
   FROM wine w
   INNER JOIN grapes g ON  g.Grape= w.Grape
   INNER JOIN appellations a ON a.Appellation = w.Appellation
   WHERE a.County = "Sonoma" AND g.Color = "Red" AND w.Score >= 90
   GROUP BY w.Vintage
   ORDER BY w.Vintage;

-- 3. For each appellation that produced more than two ‘Cabernet Sauvingnon’ wines in ‘2007’, report its name and county, 
-- the total number of ‘Cabernet Sauvingnon’ wines produced in ‘2008’, the average price of a bottle of ‘Cabernet Sauvingnon’ 
-- from that vintage, and the total (known) number of bottles produced5. Sort output in descending order by the number of wines.
 SELECT a.Appellation, a.County, COUNT(DISTINCT(w2.WineId)) AS "total cabs in 2008", AVG(w2.Price) AS "avg",
   (SUM(DISTINCT(w2.Cases))*12) AS "total bottles produced"
   FROM wine w
   INNER JOIN appellations a ON a.Appellation = w.Appellation
   INNER JOIN appellations a2 ON a.Appellation = a2.Appellation
   INNER JOIN wine w2 ON w2.Appellation = a2.Appellation
   WHERE w.Grape  = "Cabernet Sauvingnon" AND w2.Vintage = 2008 AND w2.Grape  = "Cabernet Sauvingnon" AND w.Vintage = 2007
   GROUP BY w.Appellation
   HAVING COUNT(*) > 2
   ORDER BY COUNT(DISTINCT(w2.WineId)) DESC;

-- 4. For each appellation inside ‘Central Coast’, compute the total (known)6 sales volume that it can generate for the wines 
-- produced in ‘2008’. Sort the output in descending order by the total sales volume. (Note: recall what a case of wine is).
SELECT a.Appellation, SUM(w.Cases * w.Price * 12) AS "total sales"
   FROM wine w
   JOIN appellations a ON a.Appellation = w.Appellation
   WHERE a.Area = "Central Coast" AND w.Vintage = 2008
   GROUP BY w.Appellation
   ORDER BY SUM(w.Cases * w.Price * 12) DESC;

-- 5. For each county in the database, report the score of the highest ranked ‘2009’ red wine. Exclude wines that do not have 
-- a county of origin (‘N/A’). Sort output in descending order by the best score.
SELECT a.County, MAX(Score) AS "max score"
   FROM wine w
   JOIN grapes g ON  g.Grape= w.Grape
   JOIN appellations a ON a.Appellation = w.Appellation
   WHERE w.Vintage = 2009 AND a.County != "N/A" AND g.Color = "Red"
   GROUP BY a.County
   ORDER BY MAX(Score)  DESC;