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