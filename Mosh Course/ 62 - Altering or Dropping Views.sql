-- DROP VIEW sales_by_client -- DELETES THE VIEW

-- Self-explanatory, no need to explicitly drop a view first
CREATE OR REPLACE VIEW sales_by_client AS
SELECT 
	c.client_id,
    c.name,
    SUM(invoice_total) AS total_sales
FROM clients c
JOIN invoices i USING (client_id)
GROUP BY client_id, name
