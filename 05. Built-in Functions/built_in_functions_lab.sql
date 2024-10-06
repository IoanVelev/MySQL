SELECT title
FROM books
WHERE SUBSTRING(title, 1, 3) = 'The'
ORDER by id;

/*
Use substring function to extract part of the string and check the first 3 letters;
*/

SELECT REPLACE(title, 'The', '***') AS title
FROM books
WHERE SUBSTRING(title, 1, 3) = 'The'
ORDER BY id;
