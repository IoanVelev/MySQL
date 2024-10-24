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

-- Problem 5
DELIMITER $$
CREATE FUNCTION ufn_get_salary_level(emp_salary DECIMAL(19, 4))
RETURNS VARCHAR(10)
DETERMINISTIC 
BEGIN
    DECLARE salary_level VARCHAR(10);
    CASE
        WHEN emp_salary < 30000 THEN
            SET salary_level := 'Low';
        WHEN emp_salary BETWEEN 30000 AND 50000 THEN
            SET salary_level := 'Average';
		WHEN emp_salary > 50000 THEN
            SET salary_level := 'High';
    END CASE;
    RETURN salary_level;
END$$

-- Problem 6
CREATE PROCEDURE usp_get_employees_by_salary_level(salary_level VARCHAR(10))
BEGIN
    SELECT first_name, last_name
    FROM employees
    WHERE salary_level = (SELECT ufn_get_salary_level(salary))
    ORDER BY first_name DESC, last_name DESC;
END$$
DELIMITER ;

SELECT ufn_get_salary_level(125500.00) AS `salary_level`;
CALL usp_get_employees_by_salary_level('High');

-- Problem 7
DELIMITER $$
CREATE FUNCTION ufn_is_word_comprised(set_of_letters VARCHAR(50), word VARCHAR(50))
RETURNS TINYINT
NO SQL
BEGIN
    DECLARE result TINYINT;
    SET result := (SELECT word REGEXP CONCAT('^[', set_of_letters , ']+$'));
    RETURN result;
END$$

DELIMITER ;

SELECT ufn_is_word_comprised('bobr', 'Rob');


