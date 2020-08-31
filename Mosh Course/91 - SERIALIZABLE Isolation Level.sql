/*
Serializable waits for the other to finish.
It's like one user using the whole db.
*/

-- user 1:
USE sql_store;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
START TRANSACTION;
SELECT * FROM customers WHERE state = 'VA';
COMMIT;

-- user 2:
USE sql_store;
START TRANSACTION;
UPDATE customers
SET state = 'VA'
WHERE customer_id = 1; -- change to 3 after first execution
COMMIT;