-- Problem 1
DELIMITER $$
DROP FUNCTION ufn_count_employees_by_town;
CREATE FUNCTION ufn_count_employees_by_town(town_name VARCHAR(20))
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE e_count INT;
SET e_count := (SELECT COUNT(*) AS `count` FROM employees e
JOIN addresses a
ON a.address_id = e.address_id
JOIN towns t
ON t.town_id = a.town_id
WHERE t.name = town_name);

RETURN e_count;
END$$
DELIMITER ;

SELECT ufn_count_employees_by_town('Berlin');

-- Problem 2
DELIMITER $$
CREATE PROCEDURE usp_raise_salaries(department_name VARCHAR(30))
BEGIN
    UPDATE employees e
    SET e.salary = e.salary * 1.05
    WHERE e.department_id = (SELECT d.department_id FROM departments d 
                             WHERE d.name = department_name);
                             
END$$
DELIMITER ;

CALL usp_raise_salaries('Finance');

-- Problem 3
-- WITHOUT TRANSACTION
DELIMITER $$
CREATE PROCEDURE usp_raise_salary_by_id(id INT)
BEGIN
    UPDATE employees
    SET salary = salary * 1.05
    WHERE employee_id = id;
END$$
DELIMITER ;

CALL usp_raise_salary_by_id(17);

-- WITH TRANSACTION
DELIMITER $$
DROP PROCEDURE IF EXISTS usp_raise_salary_by_id;
CREATE PROCEDURE usp_raise_salary_by_id(emp_id INT)
BEGIN
    DECLARE e_count INT;
    SET e_count := (SELECT COUNT(*) FROM employees WHERE employee_id = emp_id);
    
    START TRANSACTION;
     -- Either we hit ROLLBACK or either COMMIT
    UPDATE employees
    SET salary = salary * 1.05
    WHERE employee_id = emp_id;
    
    IF (e_count = 0) THEN
        ROLLBACK;
	ELSE
        COMMIT;
	END IF;
END$$
DELIMITER ;


CALL usp_raise_salary_by_id(43);
SELECT * FROM employees WHERE employee_id = 43;