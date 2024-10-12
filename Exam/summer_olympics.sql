-- 1. TABLE DESIGN

CREATE TABLE countries(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE sports(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE disciplines(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(40) NOT NULL UNIQUE,
    sport_id INT NOT NULL,
    
    FOREIGN KEY (sport_id) REFERENCES sports(id)
);

CREATE TABLE athletes(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    age INT NOT NULL,
    country_id INT NOT NULL,
    
    FOREIGN KEY (country_id) REFERENCES countries(id)
);

CREATE TABLE medals(
    id INT AUTO_INCREMENT PRIMARY KEY,
    type VARCHAR(10) NOT NULL UNIQUE
);

CREATE TABLE disciplines_athletes_medals(
    discipline_id INT NOT NULL,
    athlete_id INT NOT NULL,
    medal_id INT NOT NULL,
    
    PRIMARY KEY (discipline_id, athlete_id),
    FOREIGN KEY(discipline_id) REFERENCES disciplines(id),
    FOREIGN KEY(athlete_id) REFERENCES athletes(id),
    FOREIGN KEY(medal_id) REFERENCES medals(id)
);

-- 2. DML Insert
INSERT INTO athletes(first_name, last_name, age, country_id)
SELECT UPPER(first_name), CONCAT_WS(' ', last_name, 'comes from', c.name),
age + country_id,
country_id
FROM athletes
JOIN countries c
ON c.id = country_id
WHERE LEFT(c.name, 1) = 'A';

SELECT * FROM athletes;

DROP DATABASE summer_olympics;
CREATE DATABASE summer_olympics;

-- 3. Update
SET SQL_SAFE_UPDATES = 0;
UPDATE disciplines
SET name = SUBSTRING(name, 1, LOCATE('weight', name) - 1)
WHERE name LIKE '%weight%';

-- 4 Delete
DELETE FROM athletes
WHERE age > 35;

-- Querying Problem 5
SELECT c.id, c.name FROM countries c
LEFT JOIN athletes a ON a.country_id = c.id
WHERE a.country_id IS NULL
ORDER BY c.name DESC
LIMIT 15;

-- Problem 6
SELECT CONCAT(first_name, ' ', last_name) AS `full_name`, age
FROM athletes a
JOIN disciplines_athletes_medals dam
ON dam.athlete_id = a.id
ORDER BY a.age, a.id
LIMIT 2;

-- Problem 7
SELECT a.id, a.first_name, a.last_name 
FROM athletes a
LEFT JOIN disciplines_athletes_medals dam
ON dam.athlete_id = a.id
WHERE dam.medal_id IS NULL
ORDER BY a.id;

SELECT * FROM disciplines_athletes_medals;

-- Problem 8

SELECT a.id, a.first_name, a.last_name, COUNT(*) AS `medals_count`, s.name AS `sport` FROM disciplines_athletes_medals dam
JOIN athletes a
ON dam.athlete_id = a.id
JOIN disciplines d
ON d.id = dam.discipline_id
JOIN medals m
ON m.id = dam.medal_id
JOIN sports s
ON s.id = d.sport_id
GROUP BY a.id, a.first_name, a.last_name, s.name
ORDER BY medals_count DESC, a.first_name
LIMIT 10;

-- Problem 9
SELECT CONCAT(first_name, ' ', last_name) AS `full_name`, 
CASE 
    WHEN age <= 18 THEN 'Teenager'
    WHEN age <= 25 THEN 'Young adult'
    WHEN age >= 26 THEN 'Adult'
END AS age_group
FROM athletes
ORDER BY age DESC, first_name;

-- Problem 10
DELIMITER $$

CREATE FUNCTION udf_total_medals_count_by_country (name VARCHAR(40))
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN (SELECT COUNT(*) FROM medals m
            JOIN disciplines_athletes_medals dam
            ON dam.medal_id = m.id
            JOIN athletes a
            ON a.id = dam.athlete_id
            JOIN countries c
            ON c.id = a.country_id
            WHERE c.name = `name`);
END $$

-- Problem 11

CREATE PROCEDURE udp_first_name_to_upper_case(letter CHAR(1))
BEGIN
UPDATE athletes
SET first_name = UPPER(first_name)
WHERE RIGHT(first_name, 1) = `letter`;
END $$
DELIMITER ;

SELECT udf_total_medals_count_by_country('Bahamas') AS `count_of_medals`;

CALL udp_first_name_to_upper_case('s');

SELECT * FROM athletes;