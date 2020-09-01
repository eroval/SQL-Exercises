USE sql_store;

UPDATE products
SET properties = JSON_REMOVE (
	properties, -- first is the JSON object
    '$.age'
)
WHERE product_id = 1;