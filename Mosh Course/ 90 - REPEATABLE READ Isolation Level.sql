/*
Reads correct data if changes aren't committed 
but the values are consistent so if we change 
the values it would still read the same data.
No problem having non-repeatable reads.
This is the default isolation level.
*/

-- user 1:
USE sql_store;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ; 
START TRANSACTION;

SELECT *
FROM customers
WHERE customer_id=1; -- execute to here then change the value 

SELECT points
FROM customers
WHERE customer_id=1; -- still the same value

COMMIT;

-- user 2:
USE sql_store;
START TRANSACTION;
UPDATE customers
SET points = 30 -- change to 40 after first execution
WHERE customer_id = 1; 
COMMIT;

/* 
---- The Problem: ----
If we commit changes to the database we wouldn't get
the correct and relevant information because the strength
of this isolation level is also its weakness which can
be solved with the serializable isolation level.


-- user 1:
USE sql_store;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION;
SELECT * FROM customers WHERE state = 'VA';
COMMIT;

-- user 2:
USE sql_store;
START TRANSACTION;
UPDATE customers
SET state = 'VA'
WHERE customer_id = 1; 
COMMIT;
*/
