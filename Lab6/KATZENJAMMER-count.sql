-- Michael Murdock
-- rmurdock@calpoly.edu
-- CSC365 EBuckalew
-- Lab 6

USE katzenjammer;

-- 1. For each performer (use their first names) report how many times she sang lead vocals on a song. Sort the output 
-- in descending order by the number of leads.
SELECT b.FirsName, COUNT(v.VocalType) AS "num times sang"
   FROM Band b, Vocals v
   WHERE b.Id = v.Bandmate AND v.VocalType = "lead"
   GROUP BY b.FirsName
   ORDER BY COUNT(v.VocalType) DESC;

-- 2. Report how many different unique instruments each performer plays on songs from ‘Le Pop’. Sort the output by the 
-- first name of the performers.
SELECT b.FirsName, COUNT(DISTINCT(i.Instrument)) AS "num instruments"
   FROM Albums a, Tracklists t, Songs s, Instruments i, Band b
   WHERE a.Title = "Le Pop" AND a.AId = t.Album AND t.Song = s.SongId AND s.SongId = i.Song AND i.Bandmate = b.Id
   GROUP BY b.FirsName
   ORDER BY b.FirsName;

-- 3. Report the number of times ‘Turid’ stood at each stage position when performing live. Sort output in ascending 
-- order of the number of times she performed in each position.
SELECT p.StagePosition, COUNT(p.Song) AS "total"
   FROM Band b, Performance p
   WHERE b.FirsName = "Turid" AND p.Bandmate = b.Id
   GROUP BY p.StagePosition
   ORDER BY COUNT(p.Song);

-- 4. Report how many times each of the remaining peformers played ‘bass balalaika’ on the songs where ‘Anne-Marit’ 
-- was positioned on the left side of the stage. Sort output alphabet- ically by the name of the performer.
SELECT b.FirsName, COUNT(i.Song) AS "total bass balalaika"
   FROM Band ba, Performance pa, Instruments i, Band b
   WHERE ba.FirsName = "Anne-Marit" AND pa.StagePosition = "left" AND pa.Bandmate = ba.Id
      AND pa.Song = i.Song AND i.Instrument = "bass balalaika" AND b.FirsName <> ba.FirsName AND b.Id = i.Bandmate
   GROUP BY b.FirsName
   ORDER BY b.FirsName;
   
-- 5. Report all instruments (in alphabetical order) that were played by three or more people.
SELECT i.Instrument
   FROM Instruments i
   GROUP BY Instrument
   HAVING COUNT(DISTINCT(Bandmate)) >= 3
   ORDER BY Instrument;

-- 6. For each performer, report the number of times they played more than one instrument on the
-- same song. Sort output in alphabetical order by first name of the performer7.
SELECT b.FirsName, COUNT(DISTINCT i1.Song) AS "total songs"
   FROM Band b, Instruments i1, Instruments i2
   WHERE b.Id = i1.Bandmate AND b.Id = i2.Bandmate AND i1.Song = i2.Song AND i1.Instrument <> i2.Instrument
   GROUP BY b.Id
   ORDER BY b.FirsName;