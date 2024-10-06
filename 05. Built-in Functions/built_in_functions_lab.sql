/* String functions */

SELECT title
FROM books
WHERE SUBSTRING(title, 1, 3) = 'The'
ORDER by id;

/*
Use substring function to extract part of the string and check the first 3 letters;
*/

SELECT REPLACE(title, 'The', '***') AS 'title'
FROM books
WHERE SUBSTRING(title, 1, 3) = 'The'
ORDER BY id;

/*
Replace function performs case SENSITIVE match
*/

SELECT '  text', LTRIM('  text');
SELECT 'TEXT   ', RTRIM('TEXT   ');
/*
Removes spaces
*/
SELECT LTRIM(RTRIM('   example   ')); 
SELECT TRIM(' bar ');
/* Both functions remove spaces from left and right */

SELECT CHAR_LENGTH('Hello there'), CHAR_LENGTH('Hellothere');

SELECT LEFT('The begining', 3);
SELECT RIGHT('The end', 3);
/* Another way to extract part of string. Both are alternative to SUBSTRING and SUBSTR */

SELECT LOWER('The');
SELECT LOWER('The') = 'the';

SELECT UPPER('The');

SELECT REVERSE('Hello');

SELECT REPEAT('Tu', 3);

SELECT LOCATE('de', 'the dead zone');
SELECT LOCATE('de', 'the dead zone', 6); /* 2nd param is starting index */

SELECT INSERT('Basic example', 1, 5, 'Complex');
SELECT INSERT('Basic example', 1, 0, 'Complex'); /* In case you dont want to remove any part of the string */

SELECT INSERT(
    'Simple example',
    LOCATE('Simple', 'Simple example'),
    6,
    'Complex'
);


/* Math functions */

SELECT 5 DIV 2, 5 / 2, 5 % 2, 5 MOD 2;
SELECT 13 % 5;

SELECT PI();
SELECT ABS(-5), ABS(5);

SELECT SQRT(16);
SELECT POW(3, 2);

SELECT ROUND(PI(), 3);
SELECT FLOOR(PI());
SELECT CEILING(PI());

SELECT RAND() * 100;

/*  Date functions */
SELECT EXTRACT(MONTH FROM NOW());
SELECT EXTRACT(HOUR_MINUTE FROM NOW());

SELECT ABS(TIMESTAMPDIFF(DAY, NOW(), '2022-09-12 20:43:32'));
SELECT TIMESTAMPDIFF(DAY, '2022-09-12 20:43:32', NOW());


-- PROBLEM 4
SELECT CONCAT_WS(' ', first_name, last_name) AS `Full Name`,
TIMESTAMPDIFF(DAY, born, died) AS `Days lived`
FROM authors;
--
SELECT DATE_FORMAT(NOW(), '%Y %b %D');
SELECT DATE_FORMAT('2017-02-10', '%Y %b %D');
SELECT DATE_FORMAT('2017/02/10', '%Y %b %D');
SELECT DATE_FORMAT(NOW(), '%d-%c-%Y');

SELECT NOW();

/* Wildcards */
SELECT title FROM books
WHERE title LIKE 'Harry Potter%'
ORDER BY id;

