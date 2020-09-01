USE sql_invoicing;
/*

DELIMITER $$
-- We have to change the default delimeter
-- because mySQL seperates the statements with a ';'
-- which requires changing of the delimeter from ';' to
-- something else (usually '$$')
CREATE PROCEDURE get_clients()
BEGIN
	SELECT * FROM clients;
END$$

DELIMITER ;

-- CALL sql_invoicing.get_clients(); to call it

*/

DELIMITER $$
CREATE PROCEDURE get_invoices_with_balance()
BEGIN
	SELECT *
	FROM invoices
	WHERE invoice_total - payment_total > 0;
END$$

DELIMITER ;
