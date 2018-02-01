-- Michael Murdock
-- rmurdock@calpoly.edu
-- CSC365 EBuckalew
-- Lab 5

use katzenjammer;

-- Q1
SELECT COUNT(*) AS "NUMBER TIMES Tured PLAYED bass" FROM Band b 
   INNER JOIN Instruments i ON i.Bandmate = b.Id
   WHERE b.Firsname = "Turid" AND i.Instrument = 'bass balalaika';

-- Q2
SELECT COUNT(*) AS "Number times solveig center" FROM (Band b, Band b2)
   INNER JOIN Instruments i ON i.Bandmate = b.Id
   INNER JOIN Instruments i2 ON i.Bandmate = b2.Id
   INNER JOIN Performance p ON p.Bandmate = b.Id AND p.Song = i.Song
   WHERE (b.Firsname = "Solveig" AND p.StagePosition = "center")
               AND (b2.Firsname = "Marianne" AND i2.Instrument = "drums");

-- Q3
SELECT COUNT(*) AS "Number times solveig lead" FROM (Band b, Band b2)
   INNER JOIN Performance p ON p.Song = b.Id
   INNER JOIN Vocals v ON v.Bandmate = b.Id
   WHERE (b.Firsname = "Solveig" AND v.VocalType = "lead") AND (b.Firsname = "Marianne"
      AND (p.StagePosition = "left" OR p.StagePosition = "right" OR p.StagePosition = "center"));

-- Q4 
SELECT COUNT(DISTINCT(i.Instrument)) AS "Total num of diff instuments by anne-marit" FROM Band b
    INNER JOIN Instruments i ON i.Bandmate = b.Id
    WHERE b.Firsname = "Anne-Marit";

-- Q5
SELECT DISTINCT i.Instrument FROM Band b
   INNER JOIN Instruments i ON i.Bandmate = b.Id
   WHERE b.Firsname = "Marianne" 
      AND i.Instrument = (SELECT DISTINCT i.Instrument FROM Band b2
                                          INNER JOIN Instruments i2 ON i2.Bandmate = b2.Id
                                          WHERE b2.Firsname = "Turid");

-- Q6
SELECT COUNT(DISTINCT(i.Bandmate)) AS "num different guitarists" FROM Instruments i
   WHERE i.Instrument = "guitar";

-- Q7
SELECT COUNT(DISTINCT(i.Song)) AS "num songs at least two perfmors played same instrument" FROM Instruments i, Instruments i2
   WHERE i.Instrument = i2.Instrument AND i.Song = i2.Song AND i.Bandmate != i2.Bandmate;

-- Q8
SELECT COUNT(i.Bandmate) AS "num times lead vocalist plays bass" FROM Instruments i
   INNER JOIN Vocals v ON v.Bandmate = i.Bandmate AND v.Song = i.Song
   WHERE i.Instrument = "bass balalaika" AND v.VocalType = "lead";
