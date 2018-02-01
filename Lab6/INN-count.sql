-- Michael Murdock
-- rmurdock@calpoly.edu
-- CSC365 EBuckalew
-- Lab 6

USE inn;

-- 1. For each room report the total revenue for all stays and the average revenue per stay gen- erated by stays 
-- in the room that originated in the months of ‘September’, ‘October’ and ‘November’. Sort output in descending 
-- order by total revenue. (Output full room names.)
SELECT ro.roomName, SUM(DATEDIFF(re.CheckOut, re.CheckIn) * re.Rate) AS "total rev", 
       AVG(DATEDIFF(re.CheckOut, re.CheckIn) * re.Rate) AS "avg rev" FROM rooms ro
   INNER JOIN reservations re ON re.Room =  ro.RoomCode
   WHERE re.CheckIn LIKE "2010-09-%"  OR re.CheckIn LIKE "2010-10-%" OR re.CheckIn LIKE "2010-11-%"
   GROUP BY ro.roomName
   ORDER BY SUM(DATEDIFF(re.CheckOut, re.CheckIn) * re.Rate) DESC;

-- 2. Report the total number of reservations that commenced on ‘Friday’s and the total revenue they brought in. 
-- (Hint: look up the date of the first ‘Friday’ on the calendar).
SELECT COUNT(re.CheckIn) AS "total checkins", SUM(DATEDIFF(re.CheckOut, re.CheckIn) * re.Rate) AS "total rev"
   FROM reservations re
   WHERE dayname(re.CheckIn) = "friday";


-- 3. For each day of the week, report the total number of reservations that commenced on it and the total revenue 
-- these reservations brought. Report days of week as ‘Monday’, ‘Tuesday’, etc.4
SELECT dayname(re.CheckIn) AS "Day", COUNT(re.CheckIn) AS "total num reservations", 
       SUM(re.Rate * DATEDIFF(re.CheckOut, re.CheckIn)) AS "total revenue"
   FROM reservations re
   GROUP BY dayname(re.CheckIn)
   ORDER BY mod((dayofweek(CheckIn) + 5), 7);

-- 4. For each room report the highest markup against the base price and the smallest markup (i.e., largest markdown). 
-- Report markups and markdowns in absolute terms (absolute difference between the base price and the rate). Sort output 
-- in descending order by the absolute value of the largest markup. Report full names of the rooms.
SELECT ro.roomName, MAX(ro.basePrice - re.Rate) AS "largest markup", ABS(MIN(ro.basePrice - re.Rate)) AS "smallest markup"
   FROM rooms ro
   INNER JOIN reservations re ON re.Room =  ro.RoomCode
   GROUP BY ro.roomName
   ORDER BY MAX(ro.basePrice - re.Rate) DESC;

-- 5. For each room report how many nights in ‘2010’ the room was occupied. Report the room code, the full name of the room, 
-- and the number of occupied nights. Sort in descending order by occupied nights. (Note: it has to be number of nights 
-- in ‘2010’ - the last reservation in each room may and will go beyond ‘December 31, 2010’, so the “extra” nights in 
-- ‘2011’ need to be deducted).
SELECT ro.roomName, SUM(DATEDIFF(IF(re.CheckOut > "2010-12-31", "2010-12-31", re.CheckOut) , 
                                 IF(re.CheckIn < "2010-01-01", "2010-01-01", re.CheckIn) )) AS "num nights"
   FROM rooms ro
   INNER JOIN reservations re ON re.Room = ro.RoomCode
   WHERE (re.CheckOut LIKE "2010-%-%" AND re.CheckOut LIKE "2010-%-%")
      OR (re.CheckIn LIKE "2010-%-%" AND re.CheckIn LIKE "2010-%-%")
   GROUP BY ro.roomName
   ORDER BY SUM(DATEDIFF(IF(re.CheckOut > "2010-12-31", "2010-12-31", re.CheckOut) , 
                                 IF(re.CheckIn < "2010-01-01", "2010-01-01", re.CheckIn) )) DESC;