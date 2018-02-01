use wine;

SELECT a.Appellation FROM appellations a
   WHERE a.County = 'Monterey' AND isAVA = 'Yes'
   ORDER BY a.Appellation;

SELECT DISTINCT w.Grape FROM wine w
   INNER JOIN grapes g ON  g.Grape= w.Grape
   WHERE g.Color = 'White' AND w.Vintage = 2008 AND w.Score >= 90
   ORDER BY w.Grape;

SELECT DISTINCT w.Name, a.County FROM appellations a
   INNER JOIN wine w ON w.Appellation = a.Appellation
   WHERE a.County = 'Sonoma' AND w.Grape = 'Grenache'
   ORDER BY a.County, a.Appellation;

SELECT DISTINCT w.Vintage FROM wine w
   INNER JOIN appellations a ON a.Appellation = w.Appellation
   WHERE a.County = 'Sonoma' AND w.Grape = 'Zinfandel' AND w.Score > 92
   ORDER BY w.Vintage;

SELECT w.Name, w.Score, w.Price*12*w.Cases AS 'Revenue' FROM wine w
   WHERE w.Winery = 'Carlisle' AND w.Grape = 'Syrah' AND w.Cases IS NOT NULL
   ORDER BY w.Price*12*w.Cases DESC;

--NEED TO DO #6