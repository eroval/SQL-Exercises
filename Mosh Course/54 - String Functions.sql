SELECT LENGTH("sky") -- returns length of a string
SELECT UPPER("sky") -- UPPERCASE of a string
SELECT LOWER("sky") -- LOWERCASE of a string
SELECT LTRIM("     sky") -- without left spaces
SELECT RTIM("sky      ") -- without right spaces
SELECT TRIM("    sky  ") -- without any spaces
SELECT LEFT("Kindergarden", 4) -- returns the first 4 characters of a string
SELECT RIGHT("Kindergarden", 4) -- returns the last 4 characters of a string
SELECT SUBSTRING("Kinndergarden", 3, 5) -- return the characters from pos 3 to pos 5 INCLUSIVE
SELECT SUBSTRING("Kindergarden", 3) -- return all the other characters after pos 3
SELECT LOCATE('n' , "Kindergarden") -- returns the first positions a string or a character is met
SELECT LOCATE("garden", "Kindergarden") 
-- return 0 if the chars or string doesn't exist
SELECT REPLACE("Kindergarden", "garden", "garten") -- replaces the substring with the other one
SELECT CONCAT("first", "last") -- concat two strings


/*
CONCATENATION
USE sql_store;

SELECT CONCAT(first_name," ", last_name) as full_name
FROM customers
*/