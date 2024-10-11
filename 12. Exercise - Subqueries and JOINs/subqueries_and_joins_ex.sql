-- Problem 1
SELECT e.employee_id,
e.job_title,
e.address_id,
a.address_text
FROM employees AS e
JOIN addresses AS a ON a.address_id = e.address_id
ORDER BY e.address_id
LIMIT 5;

-- Problem 2
SELECT e.first_name, e.last_name, t.name, a.address_text
FROM employees e
JOIN addresses a 
ON a.address_id = e.address_id
JOIN towns t 
ON t.town_id = a.town_id 
ORDER BY first_name, last_name
LIMIT 5;

-- Problem 3
SELECT e.employee_id, e.first_name, e.last_name, d.name
FROM employees e
JOIN departments d ON d.department_id = e.department_id
WHERE d.name = 'Sales'
ORDER BY e.employee_id DESC;

-- Problem 4
SELECT e.employee_id,
e.first_name,
e.salary,
d.name
FROM employees e
JOIN departments d ON d.department_id = e.department_id
HAVING e.salary > 15000
ORDER BY e.department_id DESC
LIMIT 5;