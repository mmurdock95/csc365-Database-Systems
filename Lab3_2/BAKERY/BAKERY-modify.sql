#Michael Murdock
#rmurdock@calpoly.edu
#CSC365 EBuckalew
#Lab 3

DELETE FROM goods
   WHERE food != 'Cake';

UPDATE goods
   SET price = price * 1.2
   WHERE flavor = 'Chocolate' OR flavor = 'Opera';

UPDATE goods
   SET price = price - 2
   WHERE flavor = 'Lemon' OR flavor = 'Napoleon';

UPDATE goods
   SET price = price*.9
   WHERE flavor != 'Lemon' AND flavor != 'Napoleon' AND flavor != 'Chocolate' AND flavor != 'Opera';

SELECT * FROM goods
   ORDER BY ID;