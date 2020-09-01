USE sql_invoicing;


/*
Normal Default:

	DROP PROCEDURE IF EXISTS get_clients_by_state;

	DELIMITER $$
	CREATE PROCEDURE get_clients_by_state
	(
		state CHAR(2)
	)
	BEGIN
		IF state IS NULL THEN
			SET state = 'CA';
		END IF;

		SELECT * FROM clients c
		WHERE c.state = state;
	END $$

	DELIMITER ;
*/

/*
'Advanced' Default:

-- WITH IF ELSE:

	DROP PROCEDURE IF EXISTS get_clients_by_state;

	DELIMITER $$
	CREATE PROCEDURE get_clients_by_state
	(
		state CHAR(2)
	)
	BEGIN
		IF state IS NULL THEN
			SELECT * FROM clients;
		ELSE
			SELECT * FROM clients c
			WHERE c.state = state;
		END IF;
	END $$
	DELIMITER ;
    
-- WITH IFNULL:

	DROP PROCEDURE IF EXISTS get_clients_by_state;

	DELIMITER $$
	CREATE PROCEDURE get_clients_by_state
	(
		state CHAR(2)
	)
	BEGIN
		SELECT * FROM clients c
		WHERE c.state = IFNULL(state, c.state); -- CHECK IF NULL 
	END $$
	DELIMITER ;
*/


DROP PROCEDURE IF EXISTS get_payments;

DELIMITER $$
CREATE PROCEDURE get_payments
(
	client_id INT,
    payment_method_id TINYINT
)
BEGIN
	SELECT* FROM payments p
    WHERE 
		p.client_id = IFNULL(client_id, p.client_id) AND
        p.payment_method = IFNULL(payment_method_id, p.payment_method);
    
END$$

DELIMITER ;








