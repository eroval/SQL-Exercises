/*

Collations are rules which determine how characters in
different languages are sorted.
-- note: ci stands for: case insensitive
		 maxlen: number of bytes for chars
         
*/

SHOW CHARSET
# CHAR(10) -> 10 x 3 = 30 x 1 000 000 = 30M if char is 3 bytes
# Changes of which charset we use can be done the followfing ways:




# ---------------------------------------------------------------- #


CREATE DATABASE db_name -- when creating
	CHARACTER SET latin1 # <--------------------------------------
# OR
ALTER DATABASE db_name -- when altering
	CHARACTER SET latin1 # <--------------------------------------
# OR
CREATE TABLE table1
	CHARACTER SET latin1 # <--------------------------------------
# OR
ALTER TABLE table1
	CHARACTER SET latin1 # <--------------------------------------





# ---------------------------------------------------------------- #


CREATE DATABASE IF NOT EXISTS sql_store2;
-- DROP DATABASE IF EXISTS sql_store2;

USE sql_store2;
CREATE TABLE IF NOT EXISTS customers
(
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
# ---------  altering for specific table while creating ---------- #
    first_name  VARCHAR(50) CHARACTER SET latin1 NOT NULL, # <------
    points 		INT NOT NULL DEFAULT 0,
    email		VARCHAR(255) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS orders;
CREATE TABLE orders
(
	order_id 	INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    FOREIGN KEY fk_orders_customers (customer_id)
		REFERENCES customers (customer_id)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
)
