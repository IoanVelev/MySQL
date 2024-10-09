-- Problem 1
SELECT COUNT(id) AS count FROM wizzard_deposits;

-- Problem 2
SELECT MAX(magic_wand_size) AS `longest_magic_wand` FROM wizzard_deposits;

-- Problem 3
SELECT deposit_group, MAX(magic_wand_size) AS `longest_magic_wand`
FROM wizzard_deposits
GROUP BY deposit_group
ORDER BY longest_magic_wand, deposit_group;

-- Problem 4
SELECT * FROM wizzard_deposits;
SELECT deposit_group
FROM wizzard_deposits
GROUP BY deposit_group
HAVING MIN(magic_wand_size)
LIMIT 1;

-- Problem 5
SELECT deposit_group, SUM(deposit_amount) AS `total_sum`
FROM wizzard_deposits
GROUP BY deposit_group
ORDER BY total_sum;

-- Problem 6
SELECT deposit_group, SUM(deposit_amount) AS `total_sum`
FROM wizzard_deposits
WHERE magic_wand_creator LIKE 'Ollivander family'
GROUP BY deposit_group
ORDER BY deposit_group;

-- Problem 7
SELECT deposit_group, SUM(deposit_amount) AS `total_sum`
FROM wizzard_deposits
WHERE magic_wand_creator LIKE 'Ollivander family'
GROUP BY deposit_group
HAVING total_sum < 150000
ORDER BY total_sum DESC;

-- Problem 8 
SELECT deposit_group, magic_wand_creator, MIN(deposit_charge) AS `min_deposit_charge`
FROM wizzard_deposits
GROUP BY deposit_group, magic_wand_creator
ORDER BY magic_wand_creator, deposit_group;

-- Problem 9
SELECT 
CASE
    WHEN age <= 10 THEN '[0-10]'
    WHEN age <= 20 THEN '[11-20]'
    WHEN age <= 30 THEN '[21-30]'
    WHEN age <= 40 THEN '[31-40]'
    WHEN age <= 50 THEN '[41-50]'
    WHEN age <= 60 THEN '[51-60]'
    ELSE '[61+]'
END AS `age_group`,
COUNT(id) AS `wizzard_count`
FROM wizzard_deposits
GROUP BY age_group
ORDER BY age_group;