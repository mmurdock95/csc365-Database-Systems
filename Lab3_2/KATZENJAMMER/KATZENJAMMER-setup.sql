#Michael Murdock
#rmurdock@calpoly.edu
#CSC365 EBuckalew
#Lab 3
CREATE TABLE Albums(
   id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   title VARCHAR(150) NOT NULL,
   year INTEGER NOT NULL,
   label VARCHAR(150) NOT NULL,
   type VARCHAR(100) NOT NULL
);

CREATE TABLE Band(
   id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   firstName VARCHAR(150) NOT NULL,
   lastName VARCHAR(150) NOT NULL
);

CREATE TABLE Songs(
   id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   title VARCHAR(150) NOT NULL
);

CREATE TABLE Instruments(
   id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   songId INTEGER NOT NULL,
   bandmateId INTEGER NOT NULL,
   instrument VARCHAR(100) NOT NULL,
   FOREIGN KEY (songId) REFERENCES Songs(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
   FOREIGN KEY (bandmateId) REFERENCES Band(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

CREATE TABLE Performance(
   id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   songId INTEGER NOT NULL,
   bandmateId INTEGER NOT NULL,
   stagePosition VARCHAR(100) NOT NULL,
   FOREIGN KEY (songId) REFERENCES Songs(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
   FOREIGN KEY (bandmateId) REFERENCES Band(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

CREATE TABLE Tracklists(
   id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   albumId INTEGER NOT NULL,
   postion INTEGER NOT NULL,
   songId INTEGER NOT NULL,
   FOREIGN KEY (albumID) REFERENCES Albums(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
   FOREIGN KEY (songId) REFERENCES Songs(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

CREATE TABLE Vocals(
   id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   songId INTEGER NOT NULL,
   bandmateId INTEGER NOT NULL,
   type VARCHAR(100) NOT NULL,
   FOREIGN KEY (bandmateId) REFERENCES Band(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
   FOREIGN KEY (songId) REFERENCES Songs(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);