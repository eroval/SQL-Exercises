-- Code for user 1 and 2 with execution of the code line by line

USE sql_store;
 
START TRANSACTION;
 
UPDATE customers
SET points = points+ 10
WHERE customer_id = 1;
COMMIT;