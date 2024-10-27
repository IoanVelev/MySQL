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

-- Problem 8
DELIMITER $$
CREATE PROCEDURE usp_get_holders_full_name()
BEGIN
    SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM account_holders
    ORDER BY full_name, id;
END$$

DELIMITER ;

CALL usp_get_holders_full_name();

-- Problem 9
DELIMITER $$
CREATE PROCEDURE usp_get_holders_with_balance_higher_than(num INT)
BEGIN
    SELECT ac.first_name, ac.last_name FROM account_holders ac
    JOIN accounts a
	ON a.account_holder_id = ac.id
    GROUP BY a.account_holder_id
    HAVING SUM(a.balance) > num
    ORDER BY a.account_holder_id;
END$$

DELIMITER ;

CALL usp_get_holders_with_balance_higher_than(7000);

-- Problem 10
DELIMITER $$
CREATE FUNCTION ufn_calculate_future_value(sum DECIMAL(19, 4), yearly_interest_rate DOUBLE(12, 4), num_years INT)
RETURNS DECIMAL(19, 4)
NO SQL
BEGIN
    DECLARE result DECIMAL(19, 4);
    SET result := sum * POW(1 + yearly_interest_rate, num_years);
    RETURN result;
END$$

-- Problem 11
CREATE PROCEDURE usp_calculate_future_value_for_account(acc_id INT, interest_rate DECIMAL(12, 4))
BEGIN
    SELECT a.id AS `account_id`,
    ac.first_name,
    ac.last_name,
    a.balance AS `current_balance`,
    ufn_calculate_future_value(a.balance, interest_rate, 5) AS `balance_in_5_years`
    FROM account_holders ac
    JOIN accounts a
    ON a.account_holder_id = ac.id
    WHERE a.id = acc_id;
END$$

DELIMITER ;

SELECT ufn_calculate_future_value(1000, 0.5, 5);
CALL usp_calculate_future_value_for_account(5, 0.01);


-- Problem 12
DELIMITER $$
CREATE PROCEDURE usp_deposit_money(acc_id INT, money_ammount DECIMAL(12, 4))
BEGIN
    START TRANSACTION;
        IF (money_ammount <= 0 OR (SELECT COUNT(*) FROM accounts WHERE id = acc_id) = 0) THEN
            ROLLBACK;
		ELSE
		    UPDATE accounts 
		    SET balance = balance + money_ammount
		    WHERE id = acc_id;
		    COMMIT;
        END IF;
END$$

DELIMITER ;

CALL usp_deposit_money(1, 0);
SELECT * FROM accounts WHERE id = 1;

-- Problem 13
DELIMITER $$
CREATE PROCEDURE usp_withdraw_money(acc_id INT, money_ammount DECIMAL(12, 4))
BEGIN
    START TRANSACTION;
	    IF ((SELECT balance FROM accounts WHERE id = acc_id) < money_ammount OR money_ammount < 0) THEN
            ROLLBACK;
		ELSE
            UPDATE accounts
            SET balance = balance - money_ammount
            WHERE id = acc_id;
            COMMIT;
		END IF;
END$$

DELIMITER ;

CALL usp_withdraw_money(1, 10);

-- Problem 14
DELIMITER $$
CREATE PROCEDURE usp_transfer_money(from_account_id INT, to_account_id INT, amount DECIMAL(12, 4))
BEGIN
    START TRANSACTION;
        IF((SELECT COUNT(*) FROM accounts WHERE id = from_account_id) < 1 OR 
        (SELECT COUNT(*) FROM accounts WHERE id = to_account_id) < 1 OR amount < 0) OR
        (SELECT balance FROM accounts WHERE id = from_account_id) < amount
        THEN
            ROLLBACK;
        ELSE
			UPDATE accounts
			SET balance = balance - amount
			WHERE id = from_account_id;
            
			UPDATE accounts
			SET balance = balance + amount
			WHERE id = to_account_id;
            COMMIT;
        END IF;
END$$

DELIMITER ;

CALL usp_transfer_money(1, 2, 10);

-- Problem 15
CREATE TABLE logs (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT,
    old_sum DECIMAL(19, 4),
    new_sum DECIMAL(19, 4)
);


DELIMITER $$
CREATE TRIGGER tr_accounts_update
AFTER UPDATE
ON accounts
FOR EACH ROW
BEGIN
    INSERT INTO logs(
    account_id,
    old_sum,
    new_sum
    ) 
    VALUES(
    OLD.id,
    OLD.balance,
    NEW.balance
    );
    
END$$

DELIMITER ;

UPDATE accounts
SET balance = balance + 10
WHERE id = 1;

SELECT * FROM logs;