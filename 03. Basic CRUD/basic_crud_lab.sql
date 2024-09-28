SELECT id, first_name, last_name, job_title
FROM employees
ORDER BY id;

/*
Aliases rename a table or a column heading
*/

SELECT 
    id AS '#',
    first_name AS 'First Name',
    last_name AS 'Last Name',
    job_title AS 'Job Title'
FROM employees;


SELECT
    employees.id,
    employees.first_name,
    employees.last_name
FROM hotel.employees;


SELECT
    e.id,
    e.first_name,
    e.last_name
FROM hotel.employees as e;

SELECT 
    id,
    CONCAT(first_name, ' ', last_name) AS 'Full Name'
FROM employees;

SELECT
    id,
    CONCAT_WS(' -> ', first_name, last_name, job_title, salary) AS 'Full Info'
FROM employees;


SELECT 
    id,
    CONCAT(first_name, ' ', last_name) AS 'full_name',
    job_title,
    salary
FROM employees
WHERE salary > 1000.00
ORDER BY id;

SELECT DISTINCT 
    id,
    first_name
FROM employees;

/*
Use distint to eliminate duplicate results
*/

