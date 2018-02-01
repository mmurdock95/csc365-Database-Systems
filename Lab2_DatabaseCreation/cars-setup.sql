CREATE DATABASE cars;

use cars;

CREATE TABLE carContinents(
  id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
  continent VARCHAR(200) NOT NULL
);

CREATE TABLE carCountries(
  id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
  countryName VARCHAR(200) NOT NULL,
  continent INTEGER NOT NULL,
  FOREIGN KEY (continent) REFERENCES carContinents(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

CREATE TABLE carMakers(
  id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
  maker VARCHAR(200) NOT NULL,
  fullName VARCHAR(200) NOT NULL,
  country INTEGER,
  FOREIGN KEY (country) REFERENCES carCountries(id)
    ON UPDATE SET NULL
    ON DELETE SET NULL
);

CREATE TABLE carModels(
  id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
  maker INTEGER NOT NULL,
  model VARCHAR(200) NOT NULL,
  UNIQUE KEY model (model),
  FOREIGN KEY (maker) REFERENCES carMakers(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE carNames(
  id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
  model VARCHAR(200) NOT NULL,
  make VARCHAR(200) NOT NULL,
  FOREIGN KEY (model) REFERENCES carModels(model)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE cars(
  id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
  mpg INTEGER,
  cylinders INTEGER,
  eDispl INTEGER,
  horsepower INTEGER,
  weight INTEGER,
  accelerate DECIMAL(4,1),
  year INTEGER,
  FOREIGN KEY (id) REFERENCES carNames(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);