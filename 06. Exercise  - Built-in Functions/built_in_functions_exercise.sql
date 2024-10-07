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


-- Problem 4
SELECT first_name, last_name FROM employees
WHERE job_title NOT LIKE '%Engineer%'
ORDER BY employee_id;


-- Problem 5
SELECT name FROM towns
WHERE LENGTH(name) IN (5, 6)
ORDER BY name;

-- Problem 6
SELECT town_id, name FROM towns
WHERE name LIKE 'M%' 
    OR name LIKE 'K%' 
    OR name LIKE 'B%' 
    OR name LIKE'E%'
ORDER BY name;

-- Problem 7
SELECT town_id, name FROM towns
WHERE name NOT LIKE 'R%'
    AND name NOT LIKE 'B%'
    AND name NOT LIKE 'D%'
ORDER BY name; -- 1st approach


SELECT town_id, name FROM towns
WHERE LEFT(name, 1) NOT IN ('R', 'B', 'D')
ORDER BY name; -- 2nd approach





