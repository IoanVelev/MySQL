-- Problem 1
DELIMITER $$
CREATE PROCEDURE usp_get_employees_salary_above_35000()
BEGIN
SELECT first_name, last_name FROM employees
WHERE salary > 35000
ORDER BY first_name, last_name, employee_id;
END$$
DELIMITER ;

CALL usp_get_employees_salary_above_35000();

-- Problem 2
DELIMITER $$
CREATE PROCEDURE usp_get_employees_salary_above(given_salary DECIMAL(19, 4))
BEGIN
    SELECT first_name, last_name FROM employees
    WHERE salary >= given_salary
    ORDER BY first_name, last_name, salary;
END$$
DELIMITER ;

CALL usp_get_employees_salary_above(45000);

-- Problem 3
DELIMITER $$
CREATE PROCEDURE usp_get_towns_starting_with(str VARCHAR(20))
BEGIN
    SELECT name AS `town_name` 
    FROM towns
    WHERE LEFT(name, LENGTH(str)) LIKE str
    ORDER BY name;
END$$
DELIMITER ;

CALL usp_get_towns_starting_with('Be');


