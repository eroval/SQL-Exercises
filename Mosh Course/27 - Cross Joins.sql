USE sql_store;

-- implicit --

SELECT *
FROM shippers sh, products p
ORDER BY sh.name

-- explicit --

SELECT *
FROM shippers sh
CROSS JOIN products p
ORDER BY sh.name