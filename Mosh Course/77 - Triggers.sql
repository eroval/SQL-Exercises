-- A Trigger is a block of SQL code that executes
-- BEFORE or AFTER an insert, update or delete statement

DELIMITER $$

CREATE TRIGGER payments_after_insert
	-- TEST:
	-- we can modify every table except the trigger for the current (payments)
    -- because it will create an infinite loop
	AFTER INSERT ON payments -- [AFTER/BEFORE] [DELETE/UPDATE/INSERT]
    FOR EACH ROW -- get triggered for each row we insert
BEGIN
	UPDATE invoices
    SET payment_total = payment_total + NEW.amount
    -- OLD instead of NEW will get the last value for the row.
    -- With a '.' we can access individual attributes
    WHERE invoice_id = NEW.invoice_id;
END $$

DELIMITER ;