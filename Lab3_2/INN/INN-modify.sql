#Michael Murdock
#rmurdock@calpoly.edu
#CSC365 EBuckalew
#Lab 3

ALTER TABLE Rooms
   ADD description VARCHAR(400);

UPDATE Rooms 
   SET description = "Defeat all your mortal enemies in this hidden get away."
   WHERE roomName = "Recluse and defiance";

UPDATE Rooms 
   SET description = "If I knew either of these words I'd given a stellar description, but I'm sure the room is dope."
   WHERE roomName = "Interim but salutary";

UPDATE Rooms 
   SET description = "Wanna feel pridful? Well bolster your self here."
   WHERE roomName = "Abscond or bolster";

UPDATE Rooms 
   SET description = "Dyscipher your way to this warm lovely abode."
   WHERE roomName = "Mendicant with cryptic";


UPDATE Rooms 
   SET description = "Need purpose in life? Find a quest worth living here."
   WHERE roomName = "Harbinger but bequest";

UPDATE Rooms 
   SET description = "No talking here. Sadly we are all mute but its dope."
   WHERE roomName = "Immutable before decorum";

UPDATE Rooms 
   SET description = "Super Cheap. Used goods. All you need for a room."
   WHERE roomName = "Thrift and accolade";


UPDATE Rooms 
   SET description = "Think of something. Become something. Dine and sleep."
   WHERE roomName = "Convoke and sanguine";

UPDATE Rooms 
   SET description = "Is it an african swallow or a european swallow? Answer correctly and you may sleep."
   WHERE roomName = "Riddle to exculpate";

UPDATE Rooms 
   SET description = "Cheapest inn in all of middle earth."
   WHERE roomName = "Frugal not apropos";

SELECT * FROM Rooms ORDER BY id \G;



