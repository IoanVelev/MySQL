SELECT department_id, SUM(salary) AS `total_salary`
FROM employees
GROUP BY department_id;

-- Problem 1
SELECT department_id, COUNT(id) AS `Number of employees`
FROM employees
GROUP BY department_id
ORDER BY department_id, `Number of employees`;


SELECT department_id, MAX(salary) AS `max_salary`
FROM employees
GROUP BY department_id; -- Display departments with their highest employee salary

SELECT department_id, MIN(salary) AS `min_salary`
FROM employees
GROUP BY department_id; -- Display departments with their lowest employee salary

-- Problem 2
SELECT department_id, ROUND(AVG(salary), 2) AS `Average salary`
FROM employees
GROUP BY department_id -- Display departments with their average salary of all employees
ORDER BY department_id;

-- Problem 3
SELECT department_id, ROUND(MIN(salary), 2) AS `min_salary`
FROM employees
GROUP BY department_id
HAVING min_salary > 800;
-- Side note: Where clause filters the rows before aggregation

-- Problem 4
SELECT COUNT(category_id) AS appetizers_count FROM products
WHERE category_id = 2 AND price > 8;


-- Problem 5
SELECT category_id,
ROUND(AVG(price), 2) AS `Average Price`,
ROUND(MIN(price), 2) AS `Cheapest Product`,
ROUND(MAX(price), 2) AS `Most Expensive Product`
FROM products
GROUP BY category_id;