#Michael Murdock
#rmurdock@calpoly.edu
#CSC365 EBuckalew
#Lab 2
CREATE TABLE teachers(
  id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
  lastName VARCHAR(100) NOT NULL,
  firstName VARCHAR(100) NOT NULL,
  classroom INTEGER NOT NULL,
  UNIQUE KEY classroom (classroom)
);

CREATE TABLE students(
  id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
  lastName VARCHAR(100) NOT NULL,
  firstName VARCHAR(100) NOT NULL,
  grade INTEGER NOT NULL,
  classroom INTEGER,
  FOREIGN KEY (classroom) REFERENCES teachers(classroom)
    ON DELETE SET NULL
    ON UPDATE SET NULL
);