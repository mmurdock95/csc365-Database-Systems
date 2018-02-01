#Michael Murdock
#rmurdock@calpoly.edu
#CSC365 EBuckalew
#Lab 3
UPDATE Instruments
   SET instrument = 'awesome bass balalaika'
   WHERE instrument = 'bass balalaika';

UPDATE Instruments
   SET instrument = 'acoustic guitar'
   WHERE instrument = 'guitar';

DELETE FROM Instruments
   WHERE instrument != 'acoustic guitar' AND bandmateId != 4;

SELECT * FROM Instruments
   ORDER BY songID, bandmateId; 

ALTER TABLE Albums
   ADD totalSongs INTEGER;

UPDATE Albums
   SET totalSongs = (
      SELECT COUNT(*)
      FROM  Tracklists 
      WHERE Tracklists.albumId = Albums.id
      );

SELECT * FROM Albums 
   ORDER BY year;