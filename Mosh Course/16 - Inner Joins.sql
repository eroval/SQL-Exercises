USE sql_store;

SELECT o.order_id,
	   o.product_id,
       o.quantity,
       o.unit_price,
       p.name
FROM order_items o
JOIN products p USING (product_id)
