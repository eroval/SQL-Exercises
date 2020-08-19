/*
IF example: 
SELECT
	order_id,
    order_date,
    IF(YEAR(order_date)= YEAR(NOW()),
    'Active',
    'Archived') AS catageory
FROM orders
*/

USE sql_store;

SELECT
	product_id,
    name,
	COUNT(product_id) AS orders,
    IF(COUNT(product_id)>1, 'Many times','Once')
FROM products p
JOIN order_items oi
	USING(product_id)
GROUP BY product_id