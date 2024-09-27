CREATE DATABASE minions;

/*
USE minions;
*/
CREATE TABLE minions (
    id INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    age INT
);

CREATE TABLE towns (
    town_id INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100)
);

ALTER TABLE minions
ADD COLUMN town_id INT;

ALTER TABLE minions
ADD CONSTRAINT fk_town_id
FOREIGN KEY (town_id) REFERENCES towns(id);

INSERT INTO towns (id, name) VALUES 
(1, 'Sofia'),
(2, 'Plovdiv'),
(3, 'Varna');

INSERT INTO minions VALUES
(1, 'Kevin', 22, 1),
(2, 'Bob', 15, 3),
(3, 'Steward', NULL, 2);


SELECT * FROM minions;

TRUNCATE TABLE minions;

DROP TABLE minions, towns;

CREATE TABLE people (
    id INT NOT NULL AUTO_INCREMENT UNIQUE PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    picture TEXT,
    height DOUBLE(3, 2),
    weight DOUBLE(5, 2),
    gender CHAR(1) NOT NULL,
    birthdate DATE NOT NULL,
    biography TEXT
);


INSERT INTO people VALUES 
(1, 'Gosho', 'img.png', 1.92, 85, 'M', '1994-01-01', 'test123'),
(2, 'Peter', 'img.png', 1.82, 85, 'M', '1999-08-01', 'test123'),
(3, 'Yana', 'img.png', 1.61, 51, 'F', '2004-02-13', 'test123'),
(4, 'Iva', 'img.png', 1.62, 51, 'F', '2001-06-02', 'test123'),
(5, 'Kiro', 'img.png', 1.85, 71, 'M', '2002-03-03', 'test123');

SELECT * FROM people;

CREATE TABLE users (
    id INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(30) NOT NULL,
    password VARCHAR(26) NOT NULL,
    profile_picture TEXT,
    last_login_time DATETIME,
    is_deleted BOOLEAN
);

INSERT INTO users(username, password, profile_picture, last_login_time, is_deleted) VALUES
('Barnminator', 'asdasd', 'image.png', '2024-09-24 18:09:30', false),
('Peter123', '123123', 'image.png', '2022-02-22 21:02:30', false),
('Nicole', '12345', 'image.png', '2023-09-24 23:09:34', false),
('Lex', 'dsadsa', 'image.png', '2024-09-23 12:09:30', false),
('Brooke', 'asddsa', 'image.png', '2021-09-25 14:16:30', false);

SELECT * FROM users;

ALTER TABLE users
DROP PRIMARY KEY,
ADD CONSTRAINT pk_users
PRIMARY KEY(id, username);


ALTER TABLE users
MODIFY COLUMN last_login_time DATETIME DEFAULT NOW();

/*
Use modify column when you only want to modify the data
Use change column when you want to change the column name as well - e.g. CHANGE COLUMN column_name column_name DATETIME DEFAULT NOW();
*/

ALTER TABLE users
DROP PRIMARY KEY,
ADD PRIMARY KEY(id);

ALTER TABLE users
MODIFY username VARCHAR(30) NOT NULL UNIQUE;


CREATE DATABASE movies;

USE movies;

CREATE TABLE directors (
    id INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
	director_name VARCHAR(50) NOT NULL,
    notes TEXT
);

CREATE TABLE genres (
    id INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL,
    notes TEXT
);

CREATE TABLE categories (
    id INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL,
    notes TEXT
);

CREATE TABLE movies (
    id INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    director_id INT,
    copyright_year DATE,
    length INT,
    genre_id INT,
    category_id INT,
    rating DOUBLE(2,1),
    notes TEXT
);

INSERT INTO directors(director_name, notes) VALUES 
('Frank', 'abcd'),
('Amy', 'dcba'),
('Emily', 'test213'),
('Liam', 'qwerty'),
('Mike', 'test text');

INSERT INTO genres (genre_name, notes) VALUES
('Action', 'asdasd'),
('Romantic', 'dsadsa'),
('Documentary', 'great'),
('History', 'nice'),
('Sci-Fi', 'epic');

INSERT INTO categories(category_name, notes) VALUES
('16+', 'asdasd'),
('16+', 'dsadsa'),
('14+', 'great'),
('12+', 'nice'),
('14+', 'epic');

INSERT INTO movies VALUES
(1, 'Rush Hour', 1, '2003-12-13', 120, 1, 1, 9.7, 'Great movie'),
(2, 'Great Gatsby', 2, '1999-12-2', 120, 2, 2, 9.5, 'Great movie'),
(3, 'Before the flood', 3, '1982-5-14', 150, 3, 3, 9.6, 'Great movie'),
(4, 'Great Gatsby', 4, '2003-12-13', 120, 4, 4, 9.7, 'Great movie'),
(5, 'Inception', 1, '2010-10-10', 180, 5, 5, 9.9, 'Epic movie');


CREATE DATABASE car_rental;

USE car_rental;

CREATE TABLE categories(
    id INT PRIMARY KEY AUTO_INCREMENT,
    category VARCHAR(100),
    daily_rate DOUBLE(10,2),
    weekly_rate DOUBLE(10,2),
    monthly_rate DOUBLE(10,2),
    weekend_rate DOUBLE(10,2)
);

CREATE TABLE cars(
    id INT PRIMARY KEY AUTO_INCREMENT,
    plate_number VARCHAR(10),
    make VARCHAR(100),
    model VARCHAR(50),
    car_year DATE,
    category_id INT,
    doors INT,
    picture BLOB,
    car_condition VARCHAR(100),
    available BOOLEAN
);

CREATE TABLE employees(
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    title VARCHAR(100),
    notes TEXT
);

CREATE TABLE customers(
    id INT PRIMARY KEY AUTO_INCREMENT,
    driver_licence_number INT,
    full_name VARCHAR(100),
    address VARCHAR(100),
    city VARCHAR(100),
    zip_code INT,
    notes TEXT
);

CREATE TABLE rental_orders(
    id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    customer_id INT,
    car_id INT,
    car_condition VARCHAR(100),
    tank_level DOUBLE(5,2),
    kilometrage_start INT,
    kilometrage_end INT,
    total_kilometrage INT,
    start_date DATE,
    end_date DATE,
    total_days INT,
    rate_applied DOUBLE(5,2),
    tax_rate DOUBLE(5,2),
    order_status VARCHAR(100),
    notes TEXT
);

INSERT INTO categories(category, daily_rate, weekly_rate, monthly_rate, weekend_rate) VALUES
('SUV', 12, 20.5, 40.5, 40),
('Motorcycle', 12, 20.5, 40.5, 40),
('Yacht', 12, 20.5, 40.5, 40);

INSERT INTO cars(plate_number, make, model, car_year, category_id, doors, picture, car_condition, available) VALUES
('SV7262NE', 'Volvo', 'S60', '2005-12-30', 1, 4, NULL, 'very good', true),
('PK8451AP', 'Audi', 'A4', '2004-10-30', 2, 4, NULL, 'solid', true),
('SV1111SV', 'Toyota', 'Corolla', '2007-10-12', 3, 4, NULL, 'very good', true);

INSERT INTO employees(first_name, last_name, title, notes) VALUES
('Joro', 'Beckham', 'Sales', 'random'),
('Iva', 'Kirilova', 'Marketing', 'random'),
('Gaco', 'Bacov', 'Sales', 'random');

INSERT INTO customers(driver_licence_number, full_name, address, city, zip_code, notes) VALUES
(12345, 'Gaco Bacov', 'str. Burziq 1', 'Vratsa', 1212, 'random'),
(123321, 'Baco Gacov', 'str. Burziq 2', 'Vratsa', 1212, 'random'),
(321123, 'Jo Burziq', 'str. Burziq 10', 'Vratsa', 1212, 'random');

INSERT INTO rental_orders(employee_id, customer_id, car_id, car_condition, tank_level, kilometrage_start, kilometrage_end, total_kilometrage, start_date, end_date, total_days, rate_applied, tax_rate, order_status, notes) VALUES
(1, 1, 1, 'Solid', 100, 50000, 60000, 10000, '2024-09-10', '2024-09-11', 1, 5.5, 10, 'Finished', 'Test'),
(2, 1, 1, 'Good', 100, 40000, 50000, 10000, '2024-09-09', '2024-09-11', 1, 5.5, 10, 'Finished', 'Test'),
(3, 1, 1, 'Solid', 100, 60000, 70000, 10000, '2024-09-10', '2024-09-13', 1, 5.5, 10, 'Finished', 'Test');


CREATE DATABASE soft_uni;

USE soft_uni;

CREATE TABLE towns (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE adresses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    address_text VARCHAR(100),
    town_id INT,
    
    FOREIGN KEY (town_id) REFERENCES towns(id)
);

CREATE TABLE departments(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE employees(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    middle_name VARCHAR(50),
    last_name VARCHAR(50),
    job_title VARCHAR(30),
    department_id INT,
    hire_date DATE,
    salary DOUBLE(10, 2),
    address_id INT,
    
    FOREIGN KEY (department_id) REFERENCES departments(id),
    FOREIGN KEY (address_id) REFERENCES adresses(id)
);


INSERT INTO towns(name) VALUES
('Sofia'),
('Plovdiv'),
('Varna'),
('Burgas');


INSERT INTO departments(name) VALUES
('Engineering'),
('Sales'),
('Marketing'),
('Software Development'),
('Quality Assurance');

INSERT INTO employees(first_name, middle_name, last_name, job_title, department_id, hire_date, salary) VALUES
('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '2013-02-01', 3500),
('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '2004-03-02', 4000),
('Maria', 'Petrova', 'Ivanova', 'Intern', 5, '2016-08-28', 525.25),
('Georgi', 'Terziev', 'Ivanov', 'CEO', 2, '2007-12-09', 3000),
('Peter', 'Pan', 'Pan', 'Intern', 3, '2016-08-28', 599.88);


SELECT * FROM towns;

SELECT * FROM departments;

SELECT * FROM employees;




