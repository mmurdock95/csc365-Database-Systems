#Michael Murdock
#rmurdock@calpoly.edu
#CSC365 EBuckalew
#Lab 2
CREATE TABLE airlines(
  id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
  name VARCHAR(200) NOT NULL,
  abbreviation VARCHAR(50) NOT NULL,
  country VARCHAR(150) NOT NULL
);

CREATE TABLE airports100(
  id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
  city VARCHAR(150) NOT NULL,
  airportCode VARCHAR(150) NOT NULL,
  airportName VARCHAR(150) NOT NULL,
  country VARCHAR(150) NOT NULL,
  countryAbbrev VARCHAR(50) NOT NULL,
  UNIQUE KEY airportCode (airportCode)
);

CREATE TABLE flights(
  id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
  airline INTEGER NOT NULL,
  flightNumber INTEGER NOT NULL,
  sourceAirport VARCHAR(150) NOT NULL,
  destAirport VARCHAR(150) NOT NULL,
  FOREIGN KEY (sourceAirport) REFERENCES airports100(airportCode)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);