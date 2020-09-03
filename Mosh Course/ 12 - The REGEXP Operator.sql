USE sql_store;
SELECT *
FROM customers
WHERE first_name REGEXP "elka|ambur" AND
	  last_name REGEXP "ey$|on$" AND
      last_name REGEXP "^my|se" AND
      last_name REGEXP "br|bu"
