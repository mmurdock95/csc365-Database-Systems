#Michael Murdock
#rmurdock@calpoly.edu
#CSC365 EBuckalew
#Lab 3
DELETE FROM carsData
   WHERE ( (year != 1979 AND year != 1980) OR (mpg < 20) ) AND
         ( (mpg < 26) OR (mpg IS NULL) OR (horsepower < 110) OR (horsepower IS NULL) ) AND
         ( (cylinders != 8) OR (accelerate >= 10) );
SELECT * FROM carsData
   ORDER BY year, id;
ALTER TABLE carsData
   DROP COLUMN eDispl,
   DROP COLUMN horsepower,
   DROP COLUMN weight;
DELETE FROM carsData
   WHERE cylinders < 6;
SELECT * FROM carsData
   ORDER BY year, id;