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
ORDER BY d.department_id DESC
LIMIT 5;


-- Problem 5
SELECT e.employee_id, e.first_name
FROM employees e
LEFT JOIN employees_projects ep
ON e.employee_id = ep.employee_id
WHERE ep.project_id IS NULL
ORDER BY e.employee_id DESC
LIMIT 3;


-- Problem 6
SELECT e.first_name, e.last_name, e.hire_date, d.name AS `dept_name`
FROM employees e
JOIN departments d
ON d.department_id = e.department_id
WHERE e.hire_date > '1999/1/1' AND d.name IN ('Sales','Finance')
ORDER BY hire_date;

-- Problem 7
SELECT e.employee_id, e.first_name, p.name AS `project_name`
FROM employees e
JOIN employees_projects ep
ON ep.employee_id = e.employee_id
JOIN projects p
ON p.project_id = ep.project_id 
WHERE DATE(p.start_date) > '2002/08/13' AND p.end_date IS NULL
ORDER BY e.first_name, p.name
LIMIT 5;

-- Problem 8
SELECT e.employee_id, e.first_name,
    IF(YEAR(p.start_date) >= 2005, NULL, p.name) AS `project_name`
FROM employees e
JOIN employees_projects ep
ON ep.employee_id = e.employee_id
JOIN projects p
ON p.project_id = ep.project_id
WHERE ep.employee_id = 24
ORDER BY p.name;

-- Problem 9
SELECT e.employee_id, e.first_name, e.manager_id, m.first_name AS `manager_name`
FROM employees e
JOIN employees m
ON m.employee_id = e.manager_id
WHERE e.manager_id IN (3, 7)
ORDER BY e.first_name;
