CREATE DATABASE wildlife;
USE wildlife;

CREATE TABLE continents(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE countries(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(40) NOT NULL UNIQUE,
    country_code VARCHAR(10) NOT NULL UNIQUE,
    continent_id INT NOT NULL,
    
    FOREIGN KEY (continent_id) REFERENCES continents(id)
);

CREATE TABLE preserves(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE,
    latitude DECIMAL(9, 6),
    longitude DECIMAL(9, 6),
    area INT,
    type VARCHAR(20),
    established_on DATE
);

CREATE TABLE positions(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(40) NOT NULL UNIQUE,
    description TEXT,
    is_dangerous BOOLEAN NOT NULL
);

CREATE TABLE workers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL,
    age INT,
    personal_number VARCHAR(20) NOT NULL UNIQUE,
    salary DECIMAL(19, 2),
    is_armed BOOLEAN NOT NULL,
    start_date DATE,
    preserve_id INT,
    position_id INT NOT NULL,
    
    FOREIGN KEY (preserve_id) REFERENCES preserves(id),
    FOREIGN KEY (position_id) REFERENCES positions(id)
);

CREATE TABLE countries_preserves(
    country_id INT NOT NULL,
    preserve_id INT NOT NULL,
    
    -- UNIQUE INDEX(country_id)
	KEY(country_id, preserve_id), -- Alternative for UNIQUE INDEX
    FOREIGN KEY (country_id) REFERENCES countries(id),
    FOREIGN KEY (preserve_id) REFERENCES preserves(id)
);

-- SECTION 2 DATA MANIPULATION LANGUAGE - DML
-- 02. Insert
INSERT INTO preserves(name, latitude, longitude, area, type, established_on)
SELECT CONCAT_WS(' ', name, 'is in South Hemisphere') AS name,
latitude,
longitude,
area * id AS area,
LOWER(type) AS type,
established_on
FROM preserves
WHERE latitude < 0;

SELECT * FROM preserves;

-- 03. Update
UPDATE workers
SET salary = salary + 500
WHERE position_id IN (5, 8, 11, 13);


-- 04. Delete
DELETE FROM preserves
WHERE established_on IS NULL;

-- SECTION 3
-- Problem 5
SELECT CONCAT(first_name, ' ', last_name) AS `full_name`,
DATEDIFF("2024-01-01", start_date) AS days_of_experience
FROM workers
WHERE 2024 - YEAR(start_date) > 5
ORDER BY days_of_experience DESC
LIMIT 10;

SELECT * FROM workers;