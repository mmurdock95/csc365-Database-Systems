CREATE DATABASE katzenjammer;

use katzenjammer;

CREATE TABLE albums(
   id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   title VARCHAR(150) NOT NULL,
   year INTEGER NOT NULL,
   label VARCHAR(150) NOT NULL,
   type VARCHAR(100) NOT NULL
);

CREATE TABLE band(
   id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   firstName VARCHAR(150) NOT NULL,
   lastName VARCHAR(150) NOT NULL
);

CREATE TABLE songs(
   id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   title VARCHAR(150) NOT NULL,
   emptyColumn VARCHAR(100)
);

CREATE TABLE instruments(
   songId INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   bandmateId INTEGER NOT NULL,
   instrument VARCHAR(100) NOT NULL,
   FOREIGN KEY (songId) REFERENCES songs(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
   FOREIGN KEY (bandmateId) REFERENCES band(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

CREATE TABLE performance(
   songId INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   bandmateId INTEGER NOT NULL,
   stagePosition VARCHAR(100) NOT NULL,
   FOREIGN KEY (songId) REFERENCES songs(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
   FOREIGN KEY (bandmateId) REFERENCES band(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

CREATE TABLE tracklists(
   albumId INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   postion INTEGER NOT NULL,
   songId INTEGER NOT NULL,
   FOREIGN KEY (albumID) REFERENCES albums(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
   FOREIGN KEY (songId) REFERENCES songs(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

CREATE TABLE vocals(
   songId INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
   bandmateId INTEGER NOT NULL,
   type VARCHAR(100) NOT NULL,
   FOREIGN KEY (bandmateId) REFERENCES band(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
   FOREIGN KEY (songId) REFERENCES songs(id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);