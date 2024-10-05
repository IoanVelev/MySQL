SELECT * FROM departments
ORDER BY department_id;

SELECT name FROM departments
ORDER BY department_id;

SELECT first_name, last_name, salary FROM employees
ORDER BY employee_id;

SELECT first_name, middle_name, last_name FROM employees
ORDER BY employee_id;

SELECT CONCAT(first_name, '.', last_name, '@softuni.bg') AS `full_email_address`
FROM employees;

SELECT DISTINCT salary FROM employees;

SELECT * FROM employees
WHERE job_title = 'Sales Representative'
ORDER BY employee_id;

SELECT first_name, last_name, job_title FROM employees
WHERE salary BETWEEN 20000 AND 30000
ORDER BY employee_id;

SELECT CONCAT_WS(' ', first_name, middle_name, last_name) AS 'Full Name' FROM employees
WHERE salary IN (25000, 14000, 12500, 23600);

SELECT first_name, last_name FROM employees
WHERE manager_id IS NULL;

SELECT first_name, last_name, salary FROM employees
WHERE salary > 50000
ORDER BY salary DESC;

SELECT first_name, last_name FROM employees
ORDER BY salary DESC
LIMIT 5;


