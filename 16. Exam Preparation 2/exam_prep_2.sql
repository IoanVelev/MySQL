-- SECTION 0
CREATE TABLE cities(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE cars(
    id INT PRIMARY KEY AUTO_INCREMENT,
    brand VARCHAR(20) NOT NULL,
    model VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE instructors(
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL UNIQUE,
    has_a_license_from DATE NOT NULL
);

CREATE TABLE driving_schools(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL UNIQUE,
    night_time_driving BOOLEAN NOT NULL,
    average_lesson_price DECIMAL(10, 2),
    car_id INT NOT NULL,
    city_id INT NOT NULL,
    
    FOREIGN KEY (car_id) REFERENCES cars(id),
    FOREIGN KEY (city_id) REFERENCES cities(id)
);

CREATE TABLE students(
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40) NOT NULL UNIQUE,
    age INT,
    phone_number VARCHAR(20) UNIQUE
);

CREATE TABLE instructors_driving_schools(
    instructor_id INT,
    driving_school_id INT NOT NULL,
    
    FOREIGN KEY (instructor_id) REFERENCES instructors(id),
    FOREIGN KEY (driving_school_id) REFERENCES driving_schools(id)
);

CREATE TABLE instructors_students(
    instructor_id INT NOT NULL,
    student_id INT NOT NULL,
    
    FOREIGN KEY (instructor_id) REFERENCES instructors(id),
    FOREIGN KEY (student_id) REFERENCES students(id)
);

-- SECTION 2 - DML
-- .02 Insert
INSERT INTO students(first_name, last_name, age, phone_number)
SELECT LOWER(REVERSE(first_name)), 
LOWER(REVERSE(last_name)),
age + LEFT(phone_number, 1),
CONCAT("1+", '', phone_number)
FROM students
WHERE age < 20;

-- 03. Update
UPDATE driving_schools ds
JOIN cities c
ON ds.city_id = c.id
SET ds.average_lesson_price = ds.average_lesson_price + 30
WHERE c.name = 'London' AND ds.night_time_driving = 1;

-- 04. Delete
DELETE FROM driving_schools
WHERE night_time_driving = 0;


-- SECTION 3 
-- 05.
SELECT CONCAT(first_name, ' ', last_name) AS `full_name`,
age
FROM students
WHERE first_name LIKE '%a%'
ORDER BY age, id
LIMIT 3;

-- 06.
SELECT ds.id, ds.name, c.brand
FROM driving_schools ds
JOIN cars c
ON ds.car_id = c.id
LEFT JOIN instructors_driving_schools ids
ON ds.id = ids.driving_school_id
WHERE ids.driving_school_id IS NULL
ORDER BY c.brand, ds.id
LIMIT 5;

-- 07.
SELECT i.first_name,
i.last_name,
COUNT(*) AS `students_count`,
c.name AS `city`
FROM instructors_students i_s
JOIN instructors i
ON i_s.instructor_id = i.id
JOIN instructors_driving_schools ids
ON i_s.instructor_id = ids.instructor_id
JOIN driving_schools ds
ON ids.driving_school_id = ds.id
JOIN cities c
ON ds.city_id = c.id
GROUP by i.id, c.name
HAVING students_count > 1
ORDER BY students_count DESC, i.first_name;

-- 08.
SELECT c.name AS name,
COUNT(*) AS `instructors_count`
FROM cities c
JOIN driving_schools ds
ON c.id = ds.city_id
JOIN instructors_driving_schools ids
ON ds.id = ids.driving_school_id
GROUP BY c.id
HAVING instructors_count > 0
ORDER BY instructors_count DESC, c.name;

-- 09.
SELECT CONCAT(first_name, ' ', last_name) AS `full_name`,
CASE
    WHEN YEAR(has_a_license_from) BETWEEN 1980 AND 1989
        THEN "Specialist"
	WHEN YEAR(has_a_license_from) BETWEEN 1990 AND 1999
        THEN "Advanced"
	WHEN YEAR(has_a_license_from) BETWEEN 2000 AND 2007
        THEN "Experienced"
	WHEN YEAR(has_a_license_from) BETWEEN 2008 AND 2014
        THEN "Qualified"
	WHEN YEAR(has_a_license_from) BETWEEN 2015 AND 2019
        THEN "Provisional"
	WHEN YEAR(has_a_license_from) >= 2020
        THEN "Trainee"
END AS `level`
FROM instructors
ORDER BY YEAR(has_a_license_from), first_name;

-- 10.
DELIMITER $$
CREATE FUNCTION udf_average_lesson_price_by_city(name VARCHAR(40))
RETURNS DECIMAL(10, 2)
DETERMINISTIC
READS SQL DATA
BEGIN
    RETURN (SELECT AVG(ds.average_lesson_price) FROM driving_schools ds
			    JOIN cities c
                ON ds.city_id = c.id
                WHERE c.name = name
                );
END $$
DELIMITER ;

SELECT udf_average_lesson_price_by_city('London');

-- 11.
DELIMITER $$
CREATE PROCEDURE udp_find_school_by_car(brand VARCHAR(20))
BEGIN
    SELECT ds.name, ROUND(ds.average_lesson_price, 2) AS `average_lesson_price`
    FROM driving_schools ds
    JOIN cars c
    ON ds.car_id = c.id
    WHERE c.brand = brand
    ORDER by average_lesson_price DESC;
END$$

DELIMITER ;

CALL udp_find_school_by_car('Mercedes-Benz');