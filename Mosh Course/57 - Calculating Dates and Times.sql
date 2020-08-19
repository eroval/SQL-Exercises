SELECT DATE_ADD(NOW(), INTERVAL 1 DAY); -- returns a date with the same time in an interval of time
SELECT DATE_ADD(NOW(), INTERVAL 1 YEAR);
SELECT DATE_ADD(NOW(), INTERVAL -1 YEAR);
SELECT DATE_SUB(NOW(), INTERVAL 1 YEAR); -- substract interval


SELECT DATEDIFF('2020-01-05', '2020-01-01'); -- returns a difference in days
SELECT TIME_TO_SEC('09:00') - TIME_TO_SEC('18:00'); -- calculate difference in time