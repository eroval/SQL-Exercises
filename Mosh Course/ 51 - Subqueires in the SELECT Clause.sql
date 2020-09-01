USE sql_invoicing;

SELECT
	client_id,
    (SELECT
    SUM(invoice_total)
    FROM invoices
    WHERE client_id = c.client_id
    ) as total_sales,
    (SELECT
    AVG(invoice_total)
    FROM invoices
    ) as average,
    ((SELECT total_sales) - (SELECT average)) AS difference
FROM clients c
