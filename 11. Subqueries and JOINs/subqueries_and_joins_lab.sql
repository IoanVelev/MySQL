-- Problem 1
SELECT e.employee_id,
CONCAT(e.first_name, ' ', e.last_name) AS `full_name`,
d.department_id,
d.name AS `department_name`
FROM employees e
JOIN departments d
ON d.manager_id = e.employee_id
ORDER BY e.employee_id
LIMIT 5;

-- Problem 2
SELECT t.town_id,
t.name,
a.address_text
FROM towns t
JOIN addresses a
ON a.town_id = t.town_id
WHERE t.name IN ('San Francisco', 'Sofia', 'Carnation')
ORDER BY t.town_id, a.address_id;

-- Problem 3
SELECT employee_id,
first_name,
last_name,
department_id,
salary
FROM employees
WHERE manager_id IS NULL;

-- Problem 4

SELECT COUNT(*) AS `count` FROM employees
WHERE salary > (SELECT AVG(salary)
FROM employees);