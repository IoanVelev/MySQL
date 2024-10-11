-- Problem 1
CREATE TABLE mountains(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE peaks(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    mountain_id INT,
    
    CONSTRAINT fk_peaks_mountains
    FOREIGN KEY (mountain_id)
    REFERENCES mountains(id)
);

-- Problem 2
SELECT v.driver_id,
v.vehicle_type,
CONCAT(c.first_name, ' ', c.last_name) AS `driver_name`
FROM vehicles AS v
JOIN campers AS c ON v.driver_id = c.id;

-- Problem 3
SELECT r.starting_point AS `route_starting_point`,
r.end_point AS `route_end_point`,
r.leader_id,
CONCAT(c.first_name, ' ', c.last_name) AS `leader_name`
FROM routes AS r
JOIN campers AS c ON c.id = r.leader_id;

-- Problem 4
DROP TABLE peaks, mountains;

CREATE TABLE mountains(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE peaks(
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    mountain_id INT,
    
    FOREIGN KEY (mountain_id) REFERENCES mountains(id)
    ON DELETE CASCADE
);

INSERT INTO mountains(name) VALUES
('Vitosha'),
('Rila');

INSERT INTO peaks(name, mountain_id) VALUES
('Cherni vrah', 1),
('Musala', 2),
('Malyovica', 2);

DELETE FROM mountains WHERE id = 2;