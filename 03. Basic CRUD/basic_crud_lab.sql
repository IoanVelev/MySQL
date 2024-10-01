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

SELECT * FROM employees
ORDER BY salary DESC, department_id;
/*
Order data by 2 criteria
*/

SELECT
    id AS 'No.',
    CONCAT(first_name, ' ', last_name) as 'Full Name',
    salary as 'Salary'
FROM employees
WHERE department_id = 1 OR department_id = 2
ORDER BY first_name, last_name;

CREATE VIEW `v_dept_1_2_info` AS
    SELECT
    id AS 'No.',
    CONCAT(first_name, ' ', last_name) as 'Full Name',
    salary as 'Salary'
FROM employees
WHERE department_id = 1 OR department_id = 2
ORDER BY first_name, last_name; 

SELECT * FROM `v_dept_1_2_info`
WHERE salary > 1000;

SELECT * FROM employees
ORDER BY salary DESC
LIMIT 1;

/*
Problem 4
*/

CREATE VIEW `v_top_paid_employee` AS 
    SELECT * FROM employees
    ORDER BY salary DESC
    LIMIT 1;
    
SELECT * FROM v_top_paid_employee;


/*
Problem 3
*/

SET SQL_SAFE_UPDATES = 0;

UPDATE employees
SET salary = salary + 100 
WHERE job_title = 'Manager';

SET SQL_SAFE_UPDATES = 1;

SELECT salary FROM employees;

