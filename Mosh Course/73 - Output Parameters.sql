CREATE DEFINER=`root`@`localhost` PROCEDURE `get_unpaid_invoices_for_client`(
	client_id INT,
    OUT invoices_count INT, -- can be used for output with the OUT keyword
    OUT invoices_total DECIMAL(9,2)
)
BEGIN
	SELECT COUNT(*), SUM(invoice_total) -- read values
    INTO invoices_count, invoices_total -- paste values into variables
    FROM invoices i
    WHERE i.client_id = client_id
		AND payment_total = 0;
END