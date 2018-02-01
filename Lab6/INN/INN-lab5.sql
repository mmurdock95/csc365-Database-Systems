-- Michael Murdock
-- rmurdock@calpoly.edu
-- CSC365 EBuckalew
-- Lab 5

USE inn;

--Q1 
SELECT DISTINCT ro.RoomName, ro.RoomCode FROM rooms ro
   INNER JOIN reservations re ON re.Room =  ro.RoomCode
   INNER JOIN reservations re2 ON re2.Room =  ro.RoomCode
   INNER JOIN reservations re3 ON re3.Room =  ro.RoomCode
   WHERE ('2010-05-15' BETWEEN re.CheckIn AND re.Checkout) AND
               ('2010-08-18' BETWEEN re2.CheckIn AND re2.Checkout)  AND
               ('2010-12-12' BETWEEN re3.CheckIn AND re3.Checkout) 
   ORDER BY ro.RoomName;

-- Q2
SELECT DISTINCT re.FirstName, re.LastName FROM reservations re
   WHERE re.CheckIn BETWEEN (SELECT re2.Checkin FROM reservations re2
                                                      WHERE re2.LastName = "FRYDAY" AND re2.FirstName = "HERBERT") 
                                    AND (SELECT re3.CheckOut FROM reservations re3
                                                      WHERE re3.LastName = "FRYDAY" AND re3.FirstName = "HERBERT") 
               OR 
               re.CheckOut BETWEEN (SELECT re4.Checkin FROM reservations re4
                                                      WHERE re4.LastName = "FRYDAY" AND re4.FirstName = "HERBERT") 
                                    AND (SELECT re5.CheckOut FROM reservations re5
                                                      WHERE re5.LastName = "FRYDAY" AND re5.FirstName = "HERBERT")
   ORDER BY re.LastName;

-- Q3
SELECT COUNT(*) AS "TOTAL" FROM reservations re
   WHERE re.CheckIn LIKE '2010-08-%' AND re.Checkout LIKE '2010-08-%' AND re.Adults = 2 AND re.Kids = 2;

--Q4
SELECT AVG(datediff(re.Checkout, re.CheckIn)) AS "AVG NUM NIGHTS" FROM reservations re
    INNER JOIN rooms ro ON re.Room =  ro.RoomCode
    WHERE ro.RoomName = "Interim but salutary" AND re.CheckIn > '2010-05-01' AND re.CheckOut < '2010-08-31';

--Q5
SELECT COUNT(*) AS "Num trips" FROM reservations re
    INNER JOIN rooms ro ON re.Room =  ro.RoomCode
    WHERE re.Checkin LIKE '2010-07-%' AND re.Checkout LIKE '2010-07-%' AND ro.RoomName = "Interim but salutary";