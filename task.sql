Lesson 1
a
SELECT title 
FROM movies;

b
SELECT director
FROM movies;

c
SELECT title, director
FROM movies;

d
SELECT title, year
FROM movies;

e
SELECT *
FROM movies;


Lesson 2

a
SELECT * 
FROM movies
WHERE id = 6;

b
SELECT *
FROM movies 
WHERE year BETWEEN 2000 and 2010;

c
SELECT *
FROM movies
WHERE year NOT BETWEEN 2000 and 2010;

d
SELECT *
FROM movies
WHERE id BETWEEN 1 AND 5;


Lesson 3: 

a
SELECT *
FROM movies
WHERE title LIKE "%Toy Story%";

b
SELECT *
FROM movies
WHERE director = "John Lasseter";

c
SELECT *
FROM movies
WHERE director != "John Lasseter";

d
SELECT *
FROM movies
WHERE title LIKE "WALL-%";
Lesson 4:

a
SELECT DISTINCT director 
FROM movies
ORDER BY director ASC;

b
SELECT *
FROM movies
ORDER BY year DESC
LIMIT 4;

c
SELECT *
FROM movies
ORDER BY title ASC
LIMIT 5;

d
SELECT *
FROM movies
ORDER BY title ASC
LIMIT 5
OFFSET 5;


LESSON 5: 

a
SELECT country, population 
FROM north_american_cities
WHERE country = "Canada";

b
SELECT city
FROM north_american_cities
WHERE country = "United States"
ORDER BY latitude DESC;

c
SELECT city
FROM north_american_cities
WHERE longitude < (
	SELECT longitude
	FROM north_american_cities
	WHERE city = "Chicago"
)
ORDER BY longitude ASC;

d
SELECT city
FROM north_american_cities
WHERE country = "Mexico" 
ORDER BY population DESC
LIMIT 2;

e
SELECT city, population
FROM north_american_cities
WHERE country = "United States"
ORDER BY population DESC
LIMIT 2
OFFSET 2;



LESSON 6: 

a
SELECT title, domestic_sales, international_sales
FROM movies
INNER JOIN boxoffice
	ON movies.id = boxoffice.movie_id;

b
SELECT *
FROM movies
INNER JOIN boxoffice
	ON movies.id = boxoffice.movie_id
WHERE international_sales > domestic_sales;

c
SELECT title, rating
FROM movies
INNER JOIN boxoffice
	ON movies.id = boxoffice.movie_id
ORDER BY rating DESC;


LESSON 7:

a
SELECT DISTINCT building_name
FROM buildings
LEFT JOIN employees
	ON buildings.building_name = employees.building
WHERE building IS NOT NULL;

b
SELECT *
FROM buildings;

c
SELECT DISTINCT building_name, role
FROM buildings
LEFT JOIN employees
	ON buildings.building_name = employees.building;


LESSON 8: A short note on NULLs

a
SELECT *
FROM employees
LEFT JOIN buildings
	ON employees.building = buildings.building_name
WHERE building_name IS NULL;

b
SELECT *
FROM buildings
LEFT JOIN employees
	ON buildings.building_name = employees.building
WHERE role IS NULL;

LESSON 9:

a
SELECT
	title,
	(domestic_sales + international_sales)/1000000 AS sales
FROM boxoffice AS b
INNER JOIN movies AS m
	ON m.id = b.movie_id;

b
SELECT
	title,
	rating*10 AS ratings_percent
FROM boxoffice AS b
INNER JOIN movies AS m
	ON m.id = b.movie_id;

c
SELECT title, year
FROM boxoffice AS b
INNER JOIN movies AS m
	ON m.id = b.movie_id
WHERE year % 2 = 0
ORDER BY year ASC;



LESSON 10: 
a
SELECT MAX(years_employed) as longest_years
FROM employees;

b
SELECT
    role,
    AVG(years_employed)AS average_years_employed
FROM employees
GROUP BY role;

c
SELECT
    building,
    SUM(years_employed)AS sum_of_years_employed
FROM employees
GROUP BY building;


LESSON 11:
a
SELECT COUNT(role)
FROM employees
WHERE role = 'Artist';


b
SELECT
    role,
    COUNT(name) AS number_of_employees
FROM employees
GROUP BY role;

c
SELECT
	role,
	SUM(years_employed)
FROM employees
GROUP BY role
HAVING role = "Engineer";


LESSON 12:



a
SELECT
	director,
	COUNT(*)
FROM movies
GROUP BY director;

b
SELECT
    director,
    SUM(domestic_sales + international_sales) AS total_sales 
FROM movies
INNER JOIN boxoffice
    ON movies.id = boxoffice.movie_id
GROUP BY director;



LESSON 13: 


a
INSERT INTO movies
    (title, director, year, length_minutes)
VALUES
    ('Toy Story 4', 'Lance Lafontaine', 2984, 15);

b
INSERT INTO boxoffice
    (movie_id, rating, domestic_sales, international_sales)
VALUES
    (15, 8.7, 340000000, 270000000);




LESSON 14: 


a
UPDATE movies
SET director = "John Lasseter"
WHERE title = "A Bug's Life";

b
UPDATE movies
SET
    title = 'Toy Story 3',
    director = 'Lee Unkrich'
WHERE id = (
    SELECT id
    FROM movies
    WHERE title = 'Toy Story 8'
); 
LESSON 15: 

a
DELETE FROM movies
WHERE year < 2005;

b
DELETE FROM movies
WHERE director = 'Andrew Stanton';


LESSON 16: 


CREATE TABLE IF NOT EXISTS Database (
    Name TEXT,
    Version FLOAT,
    Download_count INTEGER
);

LESSON 17: 

ALTER TABLE movies
ADD aspect_ratio FLOAT;


ALTER TABLE movies
ADD language TEXT
 DEFAULT 'English';

LESSON 18: 

DROP TABLE IF EXISTS Movies;


DROP TABLE IF EXISTS boxoffice;





















