USE sql_store;

-- Subquerie
SELECT *
FROM customers
WHERE customer_id IN(
	SELECT o.customer_id
    FROM order_items oi
    JOIN orders o USING(order_id)
    WHERE product_id = 3
)

-- Join
SELECT DISTINCT customer_id, first_name, last_name
FROM customers c
JOIN orders o USING(customer_id)
JOIN order_itmes oi USING (order_id)
WHERE oi.product_id = 3