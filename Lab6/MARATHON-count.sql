
-- Michael Murdock
-- rmurdock@calpoly.edu
-- CSC365 EBuckalew
-- Lab 6

USE marathon;

-- 1. For each gender/age group, report the total number of runners in the group, the overall place of the best runner 
-- in the group, and the overall place of the worst runner in the group. Output the result sorted by age group and then 
-- sorted by gender (‘F’ followed by ‘M’) within each age group.
SELECT m.AgeGroup, m.Sex, COUNT(m.Place) AS "total runners", MIN(m.Place) AS "overall best place", 
       MAX(m.Place) AS "overal worst place"
   FROM marathon m
   GROUP BY m.AgeGroup, m.Sex
   ORDER BY m.AgeGroup, m.Sex;
      
-- 2. Report the total number of gender/age groups for which both the first and the second place runners (within the group) 
-- hail from the same state.
SELECT COUNT(*) AS "1 and 2 from same state" FROM marathon m1, marathon m2
   WHERE m1.AgeGroup = m2.AgeGroup AND m1.AgeGroup = 1 AND m2.AgeGroup = 2 AND m1.Sex = m2.Sex AND m1.State = m2.State
   ORDER BY m1.AgeGroup;
   
-- 3. For each full minute, report the total number of runners whose pace was between that number of minutes and the next. 
-- (That is, how many runners ran the marathon at a pace between 5 and 6 mins, how many at a pace between 6 and 7 mins, and so on).
SELECT MINUTE(m.Pace) AS "Starting Pace Minute", COUNT(*) AS "Num Runners"
   FROM marathon m
   GROUP BY MINUTE(m.Pace);

-- 4. For each state whose representatives participated in the marathon, report the number of runners from it who finished 
-- in top 10 in their gender-age group. (If a state did not have runners in top 10s, exclude information about that state.) 
-- Sort the output in descending order by the computed number.
SELECT  m.State, COUNT(*)AS "total runners" FROM marathon m
   WHERE m.GroupPlace <= 10
   GROUP BY m.State
   ORDER BY COUNT(*) DESC;

-- 5. For each ‘CT’ town with 3 or more participants in the race, report the average time of its resident runners in the race 
-- computed in seconds. Output the results sorted by the average time (best average time first).
SELECT m.Town, AVG(TIME_TO_SEC(m.RunTime)) AS "avg time in seconds" FROM marathon m
   WHERE m.State = "CT"
   GROUP BY m.Town 
   HAVING COUNT(m.Place) >= 3
   ORDER BY AVG(TIME_TO_SEC(m.RunTime));