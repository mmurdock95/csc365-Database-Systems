#Michael Murdock
#rmurdock@calpoly.edu
#rmurdock@calpoly.edu
#CSC365 EBuckalew
#Lab 2
CREATE TABLE appellations(
  id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
  appelation VARCHAR(150) NOT NULL,
  county VARCHAR(100),
  state VARCHAR(100) NOT NULL,
  area VARCHAR(100),
  isAVA VARCHAR(10) NOT NULL,
  UNIQUE KEY appellation (appelation)
);

CREATE TABLE grapes(
  id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
  grape VARCHAR(100) NOT NULL,
  color VARCHAR(50) NOT NULL,
  UNIQUE KEY grapes(grape)
);

CREATE TABLE wine(
  id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
  grape VARCHAR(100) NOT NULL,
  winery VARCHAR(100) NOT NULL,
  appelation VARCHAR(150) NOT NULL,
  state VARCHAR(100) NOT NULL,
  name VARCHAR(100) NOT NULL,
  year INTEGER NOT NULL,
  price INTEGER NOT NULL,
  score INTEGER NOT NULL,
  cases INTEGER,
  drink VARCHAR(100) NOT NULL,
  FOREIGN KEY (grape) REFERENCES grapes(grape)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  FOREIGN KEY (appelation) REFERENCES appellations(appelation)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);