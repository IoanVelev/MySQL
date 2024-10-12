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