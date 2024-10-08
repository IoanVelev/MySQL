SELECT department_id, SUM(salary) AS `total_salary`
FROM employees
GROUP BY department_id;

-- Problem 1
SELECT department_id, COUNT(id) AS `Number of employees`
FROM employees
GROUP BY department_id
ORDER BY department_id;