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

SELECT * FROM employees
WHERE department_id = 4 AND salary > 1000
ORDER BY id;

SELECT * FROM employees
WHERE department_id = 3 OR department_id = 4
ORDER BY id;

SELECT * FROM employees
WHERE salary > 1000 AND salary < 2000;

/*
The AND operator displays a record if all the conditions separated by AND are TRUE.
*/

SELECT * FROM employees
WHERE salary BETWEEN 1000 AND 2000;

/*
The BETWEEN operator is inclusive: begin and end values are included.
*/


SELECT * FROM employees
WHERE department_id IN(3, 4, 5, 6);

SELECT * FROM employees
WHERE NOT first_name = 'John';

/*
For NOT EQUAL operator you can use also <> or !=
*/


