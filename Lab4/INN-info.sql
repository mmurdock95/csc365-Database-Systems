use inn;

SELECT ro.RoomName, ro.RoomCode FROM rooms ro
   WHERE ro.decor = 'modern' AND ro.basePrice < 160 AND ro.Beds = 2
   ORDER BY ro.RoomCode;

SELECT re.LastName, re.CheckIn, re.Checkout, re.Adults+re.Kids AS 'Total People', re.Rate FROM reservations re
   INNER JOIN rooms ro ON ro.RoomCode = re.Room
   WHERE re.CheckIn LIKE '2010-08-%' AND re.Checkout LIKE '2010-08-%' AND ro.RoomName = 'Convoke and sanguine'
   ORDER BY re.CODE;

SELECT  ro.RoomName, re.CheckIn, re.Checkout FROM reservations re
   INNER JOIN rooms ro ON ro.RoomCode = re.Room
   WHERE '2010-02-06' BETWEEN re.CheckIn AND re.Checkout
   ORDER BY ro.RoomName;

SELECT re.CODE, re.CheckIn, re.Checkout, ro.RoomName, re.Rate*datediff(re.Checkout, re.CheckIn) AS 'Total' FROM reservations re
   INNER JOIN rooms ro ON ro.RoomCode = re.Room
   WHERE re.LastName = 'KNERIEN' AND re.FirstName = 'GRANT'
   ORDER BY re.CheckIn;

SELECT ro.RoomName, re.Rate, datediff(re.Checkout, re.CheckIn) AS 'Nights', re.Rate*datediff(re.Checkout, re.CheckIn) AS 'Total' FROM reservations re
   INNER JOIN rooms ro ON ro.RoomCode = re.Room
   WHERE re.CheckIn = '2010-12-31'
   ORDER BY datediff(re.Checkout, re.CheckIn) DESC;

SELECT re.CODE, ro.RoomName, ro.RoomCode, re.CheckIn, re.CheckOut FROM reservations re
   INNER JOIN rooms ro ON ro.RoomCode = re.Room
   WHERE ro.bedType = 'Double' AND maxOcc = 4
   ORDER BY re.CheckIn, ro.RoomCode;