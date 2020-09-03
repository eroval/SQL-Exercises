
-- -- UPDATABLE VIEWS -- --
/*

Does NOT have:
- DISTINCT
- Aggregate Functions(MIN, MAX, SUM ...)
- GROUP BY / HAVING
- UNION 

*/

USE sql_invoicing;

CREATE OR REPLACE VIEW invoices_with_balance AS
SELECT 
	invoice_id,
    number,
    client_id,
    invoice_total,
    payment_total,
    invoice_total - payment_total AS balance,
    invoice_date,
    due_date,
    payment_date
FROM invoices
/* NOT POSSIBLE WITH:
HAVING balance > 0
*/
WHERE invoice_total - payment_total > 0
