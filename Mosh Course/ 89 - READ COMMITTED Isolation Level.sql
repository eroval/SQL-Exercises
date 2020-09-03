/*
This isolation level reads correct data if a commit
wasn't done but we get the problem of non-repeatable reads
(inconsistent reads)
*/

-- user 1:
USE sql_store;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED; 
START TRANSACTION;

SELECT points
FROM customers
WHERE customer_id=1; -- execute to here then change the value 

SELECT points
FROM customers
WHERE customer_id=1;

COMMIT;

-- user 2:
USE sql_store;
START TRANSACTION;
UPDATE customers
SET points = 20 -- change value to 30 after first execution
WHERE customer_id = 1;
COMMIT;
