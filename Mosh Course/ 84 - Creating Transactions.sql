-- Transactions:
/*

A group of SQL statements that
represent a single unit of work.

-- SYNTAX:
START TRANSCATION; -- declares the start
{ ... }
{ ... } -- code
{ ... }
COMMIT; -- ends the transaction
-- IF a line of code fails, the whole transaction is undone,
-- no matter if the previous lines completed

-- manual line handling can be done with 'ROLLBACK'
*/

USE sql_store;

START TRANSACTION;

INSERT INTO orders (customer_id, order_date, status)
VALUES (1, '2019-01-01', 1);

INSERT INTO order_items
VALUES (LAST_INSERT_ID(), 1, 1, 1);

COMMIT;
