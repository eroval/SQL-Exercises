USE sql_store;

SELECT 
	product_id,
    
    -- Option 1:
    # JSON_EXTRACT(properties, '$.weight') AS weight 
    
    -- Option 2:
    
    # properties -> "$.weight"
    -- gets the first item in the arrray
    
    # properties -> '$.manufacturer.name'
    -- gets name key value with ""
    
     properties ->> '$.manufacturer.name'
    -- gets name key value without ""
    
    # $ represents current JSON document
    
FROM products
WHERE product_id = 1;
-- We can also use JSON in other fields like so:
# WHERE properties ->> '$.manufacturer.name' = 'sony';



