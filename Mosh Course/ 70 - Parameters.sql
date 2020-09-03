USE sql_invoicing;
/*

DROP PROCEDURE IF EXISTS get_clients_by_state;

DELIMITER $$
CREATE PROCEDURE get_clients_by_state
(
	state CHAR(2) -- supply parameters
)
BEGIN
	SELECT * FROM clients c
    WHERE c.state = state;
END $$

DELIMITER ;

*/

USE sql_invoicing;

DROP PROCEDURE IF EXISTS get_invoices_by_client;

DELIMITER $$
CREATE PROCEDURE get_invoices_by_client
(
id INT
)
BEGIN
	SELECT * FROM clients
    WHERE client_id = id;
END$$

DELIMITER ;
