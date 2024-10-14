-- Problem 1
CREATE TABLE passports(
    passport_id INT AUTO_INCREMENT PRIMARY KEY,
    passport_number VARCHAR(8) UNIQUE
);

CREATE TABLE people(
    person_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    salary DECIMAL(16,2),
    passport_id INT UNIQUE,
    
    FOREIGN KEY (passport_id) REFERENCES passports(passport_id)
);

INSERT INTO passports VALUES
(101, 'N34FG21B'),
(102, 'K65LO4R7'),
(103, 'ZE657QP2');

INSERT INTO people VALUES
(1, 'Roberto', 43300.00, 102),
(2, 'Tom', 56100.00, 103),
(3, 'Yana', 60200.00, 101);


-- Problem 2
CREATE TABLE manufacturers(
    manufacturer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30),
    established_on DATE
);

CREATE TABLE models(
    model_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(10),
    manufacturer_id INT,
    
    FOREIGN KEY (manufacturer_id) REFERENCES manufacturers(manufacturer_id)
);

INSERT INTO manufacturers VALUES 
(1, 'BMW', '1916-03-01'),
(2, 'Tesla', '2003-01-01'),
(3, 'Lada', '1966-05-01');

INSERT INTO models VALUES 
(101, 'X1', 1),
(102, 'i6', 1),
(103, 'Model S', 2),
(104, 'Model X', 2),
(105, 'Model 3', 2),
(106, 'Nova', 3);