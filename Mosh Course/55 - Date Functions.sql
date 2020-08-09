/*
SELECT NOW() -- returns current date with time
SELECT CURDATE() -- returns date without time
SELECT CURTIME() -- returns current time

SELECT YEAR(NOW()) -- returns the component(year as of now)
works with:
- MONTH()
- DAY()
- HOUR()
- MINUTE()
- SECOND()

SELECT DAYNAME(NOW()) -- get current day name(monday, tuesday ... )
SELECT MONTHNAME(NOW()) -- get current month name
SELECT EXTRACT(DAY FROM NOW()) -- extracts the day from the current date 
*/
USE sql_store;

SELECT *
FROM orders
WHERE YEAR(order_date) = YEAR(NOW())