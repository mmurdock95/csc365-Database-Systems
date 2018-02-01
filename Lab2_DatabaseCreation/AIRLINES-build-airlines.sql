#Michael Murdock
#CSC365 EBuckalew
#Lab 2
LOAD DATA LOCAL INFILE 'airlines.csv'
INTO TABLE airlines
FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@IGNORE, name, abbreviation, country);