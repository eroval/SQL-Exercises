/*
If we execute all lines of the second user except
the COMMIT statement and user 1 is simultaneously
trying to access the data in sql_store he would be
dealing with data that never really existed.
*/

-- user 1:
USE sql_store;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED; 
-- no need to explicitly start transcation as mySQL wraps it
SELECT points
FROM customers
WHERE customer_id=1

-- user 2:
USE sql_store;
START TRANSACTION;
UPDATE customers
SET points = 20
WHERE customer_id = 1; 
COMMIT;