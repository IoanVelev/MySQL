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

-- Problem 4
DELIMITER $$
CREATE PROCEDURE usp_get_employees_from_town(town_name VARCHAR(45))
BEGIN
    SELECT e.first_name, e.last_name
    FROM employees e
    JOIN addresses a
    ON a.address_id = e.address_id
    JOIN towns t
    ON t.town_id = a.town_id
    WHERE t.name = town_name
    ORDER BY e.first_name, e.last_name, e.employee_id;
END$$
DELIMITER ;

CALL usp_get_employees_from_town('Sofia');
