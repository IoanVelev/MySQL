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
