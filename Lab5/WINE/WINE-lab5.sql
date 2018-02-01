-- Michael Murdock
-- rmurdock@calpoly.edu
-- CSC365 EBuckalew
-- Lab 5

USE wine;

-- Q1
SELECT  DISTINCT w.Name FROM wine w
   INNER JOIN appellations a ON a.Appellation = w.Appellation
   WHERE w.Vintage = 2006 AND a.County = "Napa" 
               AND w.Cases*w.Price > (SELECT w2.Cases*w2.Price FROM wine w2
                                                      WHERE w2.Name = "Appelation Series" AND w2.Grape = "Zinfandel"
                                                            AND w2.Winery = "Rosenblum" AND w2.Appellation = "Paso Robles")
   ORDER BY w.Cases*w.Price;

-- Q2
SELECT AVG(w.Score) AS "Average paso zinfandel score" FROM wine w
   WHERE w.Appellation = "Paso Robles" AND w.Grape = "Zinfandel";

-- Q3
SELECT SUM((w.Cases*w.Price)) AS "total revenue" FROM wine w
   INNER JOIN grapes g ON  g.Grape= w.Grape
   WHERE g.Color = "Red" AND w.Winery = "Kosta Browne";

-- Q4
SELECT AVG(w.Cases) AS "Average Cases" FROM wine w
   INNER JOIN appellations a ON a.Appellation = w.Appellation
   WHERE a.Area = "Central Coast" AND w.Grape = "Pinot Noir";

-- Q5
SELECT COUNT(*) AS "Overal Number of Differnt red wines" FROM wine w
   INNER JOIN grapes g ON  g.Grape= w.Grape
   INNER JOIN appellations a ON a.Appellation = w.Appellation
   WHERE g.Color = "Red" AND w.Appellation = "Russian River Valley" 
      AND a.isAVA = "Yes" AND w.Score = 98;
