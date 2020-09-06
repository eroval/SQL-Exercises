CREATE DATABASE IF NOT EXISTS sql_store2;
-- DROP DATABASE IF EXISTS sql_store2;

USE sql_store2;
CREATE TABLE IF NOT EXISTS customers
(
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name  VARCHAR(50) NOT NULL,
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

/*
Since now there is a relationship we have to
delete them in reversed order

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

*/