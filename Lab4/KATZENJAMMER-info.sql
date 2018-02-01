use katzenjammer;

SELECT  s.Title FROM Tracklists t
   INNER JOIN Songs s ON s.SongId = t.Song
      INNER JOIN Albums a ON a.AId = t.Album
   WHERE a.Title = 'Le Pop'
   ORDER BY t.Position;

SELECT b.Firsname, i.Instrument FROM Band b
   INNER JOIN Instruments i ON i.Bandmate = b.Id 
      INNER JOIN Songs s ON s.SongId = i.Song
   WHERE s.Title = 'Rock-Paper-Scissors'
   ORDER BY b.Firsname;

SELECT DISTINCT i.Instrument FROM Instruments i    
   INNER JOIN Band b ON b.Id = i.Bandmate
   WHERE b.Firsname = 'Anne-Marit'
   ORDER BY i.Instrument;

SELECT DISTINCT s.Title FROM Songs s 
   INNER JOIN Instruments i ON i.Song = SongId 
   WHERE i.Instrument = 'ukalele'
   ORDER BY s.Title;

SELECT DISTINCT i.Instrument FROM Instruments i
   INNER JOIN Band b ON b.Id = i.Bandmate
      INNER JOIN Vocals v ON v.Bandmate = i.Bandmate
   WHERE b.Firsname = 'Turid' AND v.VocalType = 'lead'
   ORDER BY i.Instrument;


-- NEED TO DO 6
-- SELECT s.Title, b.Firsname, p.StagePosition FROM Songs s 
--    INNER JOIN Performance p ON p.Song = s.SongId
--       INNER JOIN Band b ON b.Id = p.Bandmate
--    WHERE 