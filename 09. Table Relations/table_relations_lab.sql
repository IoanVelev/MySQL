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