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
