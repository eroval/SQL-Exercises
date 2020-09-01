USE sql_invoicing;

/*

-- CREATES temporary virtual tables for structuring data

CREATE VIEW sales_by_client AS
SELECT 
	c.client_id,
    c.name,
    SUM(invoice_total) AS total_sales
FROM clients c
JOIN invoices i USING(client_id)
GROUP BY client_id, name

*/

CREATE VIEW clients_balance AS
SELECT 
	client_id,
    name,
    SUM(invoice_total) - SUM(payment_total) AS balance
FROM clients
LEFT JOIN invoices USING(client_id)
GROUP BY client_id
