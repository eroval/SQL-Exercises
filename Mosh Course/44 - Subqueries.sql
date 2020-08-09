USE sql_hr;

SELECT *
FROM employees
WHERE salary > (
				SELECT AVG(salary)
                FROM employees
)