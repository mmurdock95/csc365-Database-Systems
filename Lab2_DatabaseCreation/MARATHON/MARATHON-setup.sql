#Michael Murdock
#rmurdock@calpoly.edu
#CSC365 EBuckalew
#Lab 2
CREATE TABLE marathon(
  id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
  place INTEGER NOT NULL,
  time_ time NOT NULL,
  pace time NOT NULL,
  groupPlace INTEGER NOT NULL,
  group_ VARCHAR(150) NOT NULL,
  age INTEGER NOT NULL,
  sex VARCHAR(10) NOT NULL,
  bibNumber INTEGER NOT NULL,
  firstName VARCHAR(150) NOT NULL,
  lastName VARCHAR(150) NOT NULL,
  town VARCHAR(150) NOT NULL,
  state VARCHAR(10) NOT NULL
);