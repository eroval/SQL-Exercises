USE sql_store;

UPDATE products
SET properties = JSON_SET (
	properties, -- first is the JSON object
    '$.weight', 20, -- then the update and the value
    '$.age', 10
)
WHERE product_id = 1;