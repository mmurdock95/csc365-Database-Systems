#Michael Murdock
#rmurdock@calpoly.edu
#CSC365 EBuckalew
#Lab 2

CREATE TABLE customers(
  id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
  lastName VARCHAR(100) NOT NULL,
  firstName VARCHAR(100) NOT NULL
);

CREATE TABLE goods(
  id VARCHAR(100) PRIMARY KEY NOT NULL,
  flavor VARCHAR(100) NOT NULL,
  food VARCHAR(100) NOT NULL,
  price DECIMAL(5,2) NOT NULL
);

CREATE TABLE receipts(
  id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
  date_ DATE NOT NULL,
  customerId INTEGER NOT NULL,
  FOREIGN KEY (customerId) REFERENCES customers(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE items(
  id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
  receipt INTEGER NOT NULL,
  ordinal INTEGER NOT NULL,
  item VARCHAR(100) NOT NULL,
  FOREIGN KEY (receipt) REFERENCES receipts(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
  FOREIGN KEY (item) REFERENCES goods(id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);