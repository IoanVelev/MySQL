SELECT department_id, SUM(salary) AS `total_salary`
FROM employees
GROUP BY department_id;

-- Problem 1
SELECT department_id, COUNT(id) AS `Number of employees`
FROM employees
GROUP BY department_id
ORDER BY department_id;

SELECT department_id, MAX(salary) AS `max_salary`
FROM employees
GROUP BY department_id; -- Display departments with their highest employee salary

SELECT department_id, MIN(salary) AS `min_salary`
FROM employees
GROUP BY department_id; -- Display departments with their lowest employee salary