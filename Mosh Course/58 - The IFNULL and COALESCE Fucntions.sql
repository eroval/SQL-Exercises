USE sql_store;

/*

SELECT 
	order_id,
    IFNULL(shipper_id, 'Not assigned') AS shipper, -- checks if the value is NULL and if it is it assigns the second arguement we passed
	COALESCE(shipper_id, comments, 'Not assigned 2') AS shipper2

-- checks if the value is NULL,
-- if it is NULL it returns a value from another field
-- if the field is also null it returns the value we assigned
-- In other words. It returns the first not null value.
-- shipper_id -> comments value -> 'Not assigned 2' in this case
FROM orders

*/

SELECT 
	CONCAT(first_name," ", last_name)  AS customer,
    COALESCE(phone, 'Unknown')
FROM customers