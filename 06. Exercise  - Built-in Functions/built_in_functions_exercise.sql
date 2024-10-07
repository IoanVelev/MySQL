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


-- Problem 8
CREATE VIEW `v_employees_hired_after_2000` AS 
SELECT first_name, last_name FROM employees
WHERE YEAR(hire_date) > 2000;

SELECT * FROM v_employees_hired_after_2000;

-- Problem 9
SELECT first_name, last_name FROM employees
WHERE LENGTH(last_name) = 5;

-- Problem 10
SELECT country_name, iso_code FROM countries
WHERE country_name LIKE '%A%A%A%'
ORDER BY iso_code;

-- Problem 11
SELECT peak_name, river_name,
LOWER(CONCAT(peak_name, SUBSTRING(river_name, 2))) AS 'mix'
FROM peaks, rivers
WHERE RIGHT(peak_name, 1) LIKE LEFT(river_name, 1)
ORDER BY mix;

-- Problem 12
SELECT name, DATE_FORMAT(start, '%Y-%m-%d') FROM games
WHERE YEAR(start) IN (2011, 2012)
ORDER BY start, name
LIMIT 50;

-- Problem 13
SELECT user_name, SUBSTRING(MID(email, POSITION('@' IN email)), 2) AS email_provider
FROM users
ORDER BY email_provider, user_name;

-- Problem 14
SELECT user_name, ip_address FROM users
WHERE ip_address LIKE '___.1%.%.___'
ORDER BY user_name;