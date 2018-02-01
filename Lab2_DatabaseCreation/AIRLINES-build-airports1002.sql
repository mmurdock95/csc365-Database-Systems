#Michael Murdock
#CSC365 EBuckalew
#Lab 2
LOAD DATA LOCAL INFILE 'airports100.csv'
INTO TABLE airports100
FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(city, airportCode, airportName, country, countryAbbrev);