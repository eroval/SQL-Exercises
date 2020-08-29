DELIMITER $$

CREATE EVENT yearly_delete_stale_audit_rows
ON SCHEDULE -- provide a schedule when to execute the task
	-- AT '2019-05-01' will execute only once
    EVERY 1 HOUR STARTS '2019-01-01' ENDS '2029-01-01'-- 1 YEAR / 1 MONTH
DO BEGIN
	DELETE FROM payments_audit
    WHERE action_date < NOW() - INTERVAL 1 YEAR;
    -- equal to DATESUB(NOW(), INTERVAL 1 YEAR)
END $$

DELIMITER ;