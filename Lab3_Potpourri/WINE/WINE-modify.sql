#Michael Murdock
#rmurdock@calpoly.edu
#CSC365 EBuckalew
#Lab 3
ALTER TABLE wine    
   DROP FOREIGN KEY wine_ibfk_2;
ALTER TABLE wine
   DROP COLUMN appelation,
   DROP COLUMN name;
DELETE FROM wine
   WHERE grape != "Syrah";  
DELETE FROM wine
   WHERE score < 93;
ALTER TABLE wine
   MODIFY COLUMN winery VARCHAR(15);
ALTER TABLE wine
   ADD Revenue INTEGER; 
UPDATE wine
   SET Revenue = (cases/12) * price;
SELECT * FROM wine
   ORDER BY Revenue;