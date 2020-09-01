USE sql_invoicing;

SELECT *
FROM invoices
WHERE invoice_total > ALL(
	SELECt invoice_total
    FROM invoices
    WHERE client_id = 3
 )
