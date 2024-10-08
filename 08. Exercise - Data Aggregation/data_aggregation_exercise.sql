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