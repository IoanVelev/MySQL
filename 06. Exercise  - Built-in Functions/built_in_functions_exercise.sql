-- Problem 1
SELECT first_name, last_name FROM employees
WHERE first_name LIKE 'Sa%'
ORDER BY employee_id;

-- Problem 2
SELECT first_name, last_name FROM employees
WHERE last_name LIKE '%ei%'
ORDER BY employee_id; -- 1st approach

SELECT first_name, last_name FROM employees
WHERE last_name REGEXP 'ei'
ORDER BY employee_id; -- 2nd approach

-- Problem 3
SELECT first_name FROM employees
WHERE department_id IN(3, 10) AND YEAR(hire_date) BETWEEN 1995 AND 2005
ORDER BY employee_id;
