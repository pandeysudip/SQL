-- Create a new table
CREATE TABLE people (
  name VARCHAR(30) NOT NULL,
  has_pet BOOLEAN DEFAULT false,
  pet_type VARCHAR(10) NOT NULL,
  pet_name VARCHAR(30),
  pet_age INT
);

-- Query all fields from the table
SELECT *
FROM people;

-- Insert data into the table
INSERT INTO people (name, has_pet, pet_type, pet_name, pet_age)
VALUES ('Jacob', true, 'dog', 'Misty', 10),
  ('Ahmed', true, 'rock', 'Rockington', 100),
  ('Peter', true, 'cat', 'Franklin', 2),
  ('Dave', true, 'dog', 'Queso', 1);

-- Query only the `pet_name` field
SELECT pet_name
FROM people;






-- Create a new table
CREATE TABLE cities (
  city VARCHAR(30) NOT NULL,
  state VARCHAR(30) NOT NULL,
  population INT
);

-- Insert data into the table
INSERT INTO cities (city, state, population)
VALUES ('Alameda', 'California', 79177),
  ('Mesa', 'Arizona', 496401),
  ('Boerne', 'Texas', 16056),
  ('Anaheim', 'California', 352497),
  ('Tucson', 'Arizona', 535677),
  ('Garland', 'Texas', 238002);

-- View the table data
SELECT *
FROM cities;

-- Use a query to view only the cities
SELECT city
FROM cities;

-- Bonus 1:
-- Create a query to view cities in Arizona
SELECT city, state
FROM cities
WHERE state = 'Arizona';

-- Bonus 2:
-- Create a query to view cities and states
-- with a population less than 100,000
SELECT *
FROM cities
WHERE population < 100000;

-- Bonus 3:
-- Create a query to view the city in California
-- with a population of less than 100,000
SELECT *
FROM cities
WHERE population < 100000
AND state = 'California';


-- Filter the query to show only dogs under the age of 5
SELECT pet_type, pet_name
FROM people
WHERE pet_type = 'dog'
AND pet_age < 5;






-- Delete the table "people"
DROP TABLE people;

-- Re-create the table "people" within animals_db
CREATE TABLE people (
  id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  has_pet BOOLEAN DEFAULT false,
  pet_type VARCHAR(10) NOT NULL,
  pet_name VARCHAR(30),
  pet_age INT
);

-- Insert data into the table
INSERT INTO people (name, has_pet, pet_type, pet_name, pet_age)
VALUES ('Jacob', true, 'dog', 'Misty', 10),
  ('Ahmed', true, 'rock', 'Rockington', 100),
  ('Ahmed', true, 'rock', 'Rockington', 100),
  ('Peter', true, 'cat', 'Franklin', 2),
  ('Dave', true, 'dog', 'Queso', 1),
  ('Dave', true, 'dog', 'Pringles', 7);

-- Query all fields from the table
SELECT *
FROM people;

-- Query the data to return all the rows containing the name "Dave"
SELECT id, name, pet_name, pet_age
FROM people
WHERE name = 'Dave';

-- Update a single row to change the `pet_name` and `pet_age` column data
UPDATE people
SET has_pet = true, pet_name = 'Rocket', pet_age = 8
WHERE id = 6;

SELECT *
FROM people;

-- Delete the duplicate entry using a unique id
DELETE FROM people
WHERE id = 3;

SELECT *
FROM people;







-- Drop table if exists
DROP TABLE programming_languages;

-- Create new programming_languages table
CREATE TABLE programming_languages (
  id SERIAL PRIMARY KEY,
  language VARCHAR(20),
  rating INT
);

-- Insert new data
INSERT INTO programming_languages (language, rating)
VALUES ('HTML', 95),
	('JS', 99),
	('JQuery', 98),
	('MySQL', 70),
	('MySQL', 70);

SELECT * FROM programming_languages;

-- Query the rows with the language "MySQL"
SELECT *
FROM programming_languages
WHERE language = 'MySQL';

-- Drop a duplicate row
DELETE FROM programming_languages
WHERE id = 5;

SELECT *
FROM programming_languages;

-- Add additional data
INSERT INTO programming_languages (language, rating)
VALUES ('Python', 98),
	('C++', 73),
	('R', 95);

SELECT *
FROM programming_languages;

-- Update "JS" to "JavaScript"
UPDATE programming_languages
SET language = 'JavaScript'
WHERE id = 2;

SELECT *
FROM programming_languages;

-- Change HTML's rating to 90
UPDATE programming_languages
SET rating = 90
WHERE id = 1;

SELECT *
FROM programming_languages;

-- BONUS
-- Add a "mastered" column with the boolean default of true
ALTER TABLE programming_languages
ADD COLUMN mastered BOOLEAN default true;




-- Drop table if exists
DROP TABLE wordassociation;

-- Create table and view column datatypes
CREATE TABLE wordassociation (
	author INT,
	word1 VARCHAR,
	word2 VARCHAR,
	source VARCHAR
);

SELECT *
FROM wordassociation;

-- Collect all rows with the word "stone" in the "word1" column
SELECT *
FROM wordassociation
WHERE word1 = 'stone';

-- Collect all rows where the author is within the 0-10 range
SELECT *
FROM wordassociation
WHERE
	author >= 1
	AND author <= 10;

-- Search for the word "pie" in both "word1" and "word2" columns
SELECT *
FROM wordassociation
WHERE
	word1 = 'pie'
	OR word2 = 'pie';

-- BONUS
-- Select all rows with a source of "BC"
SELECT *
FROM wordassociation
WHERE source = 'BC';

-- Collect all rows where the author is within the 333-335 range and has a source of "BC"
SELECT *
FROM wordassociation
WHERE
	source = 'BC'
	AND author >= 333
	AND author <= 335;






-- Add primary key
ALTER TABLE firepower
ADD COLUMN id SERIAL PRIMARY KEY;

-- Delete and update data
DELETE FROM firepower
WHERE ReservePersonnel = 0;

-- Find countries with one FighterAircraft
SELECT * FROM firepower
WHERE FighterAirCraft = 1;

-- Make note of them
-- Sir Lanka

-- Give each country with no FighterAircraft one

UPDATE firepower
SET FighterAircraft = 1
WHERE FighterAircraft = 0;

-- Update TotalAircraftStrength by one to countries that we added FighterAircraft

UPDATE firepower
SET TotalAircraftStrength = TotalAircraftStrength + 1
WHERE FighterAircraft = 1 AND country != 'Sri Lanka';

-- Select averages and rename columns
SELECT AVG(TotalMilitaryPersonnel) AS AvgTotMilPersonnel,
	AVG(TotalAircraftStrength) AS AvgTotAircraftStrength,
	AVG(TotalHelicopterStrength) AS AvgTotHelicopterStrength,
	AVG(TotalPopulation) AS AvgTotalPopulation
FROM firepower;

-- Insert new data
INSERT INTO firepower(Country, TotalPopulation, TotalMilitaryPersonnel, TotalAircraftStrength, TotalHelicopterStrength)
VALUES ('GlobalLand', 60069024, 524358, 457, 183);

-- View table
SELECT * FROM firepower;




-- Drop table if exists
DROP TABLE players;

-- Create the players table
CREATE TABLE players (
	player_id INT,
	first_name VARCHAR,
	last_name VARCHAR,
	hand VARCHAR,
	country_code VARCHAR
);

-- Check data import
SELECT *
FROM players;

-- Create the matches table
CREATE TABLE matches (
	loser_age DEC,
	loser_id INT,
	loser_name VARCHAR,
	loser_rank INT,
	winner_age DEC,
	winner_id INT,
	winner_name VARCHAR,
	winner_rank INT
);

-- Check data import
SELECT *
FROM matches;

-- Perform an INNER JOIN on the two tables
SELECT players.first_name, players.last_name, players.hand, matches.loser_rank
FROM matches
INNER JOIN players ON
players.player_id=matches.loser_id;

-- Alternative solution:
-- Perform an INNER JOIN on the two tables
SELECT p.first_name, p.last_name, p.hand, m.loser_rank
FROM matches AS m
INNER JOIN players AS p ON
p.player_id=m.loser_id;




-- Join players with seasons_stats
SELECT players.id,
  players.player,
  players.height,
  players.weight,
  players.college,
  players.born,
  seasons_stats.position,
  seasons_stats.tm
FROM players
INNER JOIN seasons_stats ON
players.id = seasons_stats.player_id;


-- Join seasons_stats with players
SELECT seasons_stats.player_id,
  players.college,
  seasons_stats.year,
  seasons_stats.position,
  seasons_stats.Two_Point_Percentage,
  seasons_stats.FG_Percentage,
  seasons_stats.FT_Percentage,
  seasons_stats.TS_Percentage
FROM seasons_stats
INNER JOIN players ON
players.id = seasons_stats.player_id;



SELECT * FROM actor LIMIT 100;
SELECT * FROM address LIMIT 100;
SELECT * FROM city LIMIT 100;
SELECT * FROM country LIMIT 100;





-- Select everything from film table
SELECT * FROM film;

-- Count the amount of film_id's in film table
SELECT COUNT(film_id) FROM film;

-- Create an alias
SELECT COUNT(film_id) AS "Total films"
FROM film;

-- Group by rating and aggregate the film_id count
SELECT rating, COUNT(film_id) AS "Total films"
FROM film
GROUP BY rating;

-- Select the average rental duration
SELECT AVG(rental_duration)
FROM film;

-- Create an Alias
SELECT AVG(rental_duration) AS "Average rental period"
FROM film;

-- Group by the rental duration, average the rental rate and give alias
SELECT rental_duration, AVG(rental_rate) AS "Average rental rate"
FROM film
GROUP BY rental_duration;

-- Find the rows with the minimum rental rate
SELECT rental_duration, MIN(rental_rate) AS "Min rental rate"
FROM film
GROUP BY rental_duration;

-- Find the rows with the maximum rental rate
SELECT rental_duration, MAX(rental_rate) AS "Max rental rate"
FROM film
GROUP BY rental_duration;

-- 1. What is the average cost to rent a film in the pagila stores?
SELECT AVG(rental_rate) AS "Average rental rate"
FROM film;

-- 2. What is the average rental cost of films by rating? On average, what is the cheapest rating of films to rent? Most expensive?
SELECT rating, AVG(rental_rate) AS "Average rental rate"
FROM film
GROUP BY rating;

-- 3. How much would it cost to replace all the films in the database?
SELECT SUM(replacement_cost) AS "Total replacement cost"
FROM film;

-- 4. How much would it cost to replace all the films in each ratings category?
SELECT rating, SUM(replacement_cost) AS "Replacement cost"
FROM film
GROUP BY rating;

-- 5. How long is the longest movie in the database? The shortest?
SELECT MAX(length)
FROM film;

-- Select the average length of movies by rental rate
SELECT rental_rate, AVG(length) AS "avg length"
FROM film
GROUP BY rental_rate
ORDER BY "avg length";

-- Round the results to use only two decimal places
SELECT rental_rate, ROUND(AVG(length),2) AS "avg length"
FROM film
GROUP BY rental_rate
ORDER BY "avg length";

-- Order by descending values
SELECT rental_rate, ROUND(AVG(length),2) AS "avg length"
FROM film
GROUP BY rental_rate
ORDER BY "avg length" DESC;

-- Limit results to 5
SELECT rental_rate, ROUND(AVG(length),2) AS "avg length"
FROM film
GROUP BY rental_rate
ORDER BY "avg length" DESC
LIMIT 5;

-- Select count of actors first names in descending order
SELECT first_name, COUNT(first_name) AS "actor count"
FROM actor
GROUP BY first_name
ORDER BY "actor count" DESC;

-- Select the average duration of movies by rating
SELECT rating, ROUND(AVG(rental_duration),2) AS "avg duration"
FROM film
GROUP BY rating
ORDER BY "avg duration";

-- Select top ten replace costs for the length of the movie
SELECT length, ROUND(AVG(replacement_cost)) AS "avg cost"
FROM film
GROUP BY length
ORDER BY "avg cost" DESC
LIMIT 10;

-- Select the count of countries
SELECT country.country, COUNT(country.country) AS "country count"
FROM city
JOIN country ON city.country_id = country.country_id
GROUP BY country.country
ORDER BY "country count" DESC;


-- First select title and id for movie EARLY HOME
SELECT title, film_id
FROM film
WHERE title = 'EARLY HOME';

-- Using the film_id located in the previous query find it in the inventory table
SELECT *
FROM inventory
WHERE film_id = 268;

-- Use Join to find the inventory, film and store id
SELECT i.inventory_id, i.film_id, i.store_id
FROM inventory i
JOIN film f
ON (i.film_id = f.film_id)
WHERE f.title = 'EARLY HOME';

-- Use Subquery to get the film_id from the query finding EARLY HOME
SELECT *
FROM inventory
WHERE film_id IN
(
  SELECT film_id
  FROM film
  WHERE title = 'EARLY HOME'
);

-- Check to more sure the subquery returned correct value
SELECT *
FROM inventory
WHERE film_id IN (268);





-- Question 1

SELECT city, city_id
FROM city
WHERE city IN ('Qalyub', 'Qinhuangdao', 'Qomsheh', 'Quilmes');


-- Question 2

SELECT district
FROM address
WHERE city_id IN
(
  SELECT city_id
  FROM city
  WHERE city IN ('Qalyub', 'Qinhuangdao', 'Qomsheh', 'Quilmes')
);


-- Bonus

SELECT first_name, last_name
FROM customer cus
WHERE address_id IN
(
  SELECT address_id
  FROM address a
  WHERE city_id IN
  (
    SELECT city_id
    FROM city
    WHERE city LIKE 'Q%'
  )
);



SELECT s.store_id, SUM(amount) AS Gross
FROM payment AS p
  JOIN rental AS r
  ON (p.rental_id = r.rental_id)
    JOIN inventory AS i
    ON (i.inventory_id = r.inventory_id)
      JOIN store AS s
      ON (s.store_id = i.store_id)
      GROUP BY s.store_id;

-- Create the subquery
SELECT title,
(SELECT COUNT(inventory.film_id)
	FROM inventory
	WHERE film.film_id = inventory.film_id ) AS "Number of Copies"
FROM film;

-- Create View
CREATE VIEW title_count AS
SELECT title,
(SELECT COUNT(inventory.film_id)
	FROM inventory
	WHERE film.film_id = inventory.film_id ) AS "Number of Copies"
FROM film;

-- Query the view to the titles with 7 copies
SELECT title, "Number of Copies"
FROM title_count
WHERE "Number of Copies" = 7;





-- Find how many people rented BLANKET BEVERLY

SELECT COUNT(*)
FROM customer
WHERE customer_id IN
  (
  SELECT customer_id
  FROM payment
  WHERE rental_id IN
  (
    SELECT rental_id
    FROM rental
    WHERE inventory_id IN
  (
    SELECT inventory_id
    FROM inventory
    WHERE film_id IN
      (
        SELECT film_id
        FROM film
        WHERE title = 'BLANKET BEVERLY'
      )
    )
  )
);





-- Using subqueries, identify all actors who appear in the film _Alter Victory_ in the `pagila` database.

SELECT first_name, last_name
FROM actor
WHERE actor_id IN
(
  SELECT actor_id
  FROM film_actor
  WHERE film_id IN
  (
    SELECT film_id
    FROM film
    WHERE title = 'ALTER VICTORY'
  )
);

-- Using subqueries, display the titles of films that were rented out by an employee named Jon Stephens.

SELECT title
FROM film
WHERE film_id
IN (
  SELECT film_id
    FROM inventory
    WHERE inventory_id
    IN (
        SELECT inventory_id
        FROM rental
        WHERE staff_id
        IN (
              SELECT staff_id
              FROM staff
              WHERE last_name = 'Stephens' AND first_name = 'Jon'
            )
        )
  );






-- Create owners table and insert values
CREATE TABLE owners (
  id INT PRIMARY KEY NOT NULL,
  owner_name VARCHAR(255)
);

INSERT INTO owners (ID, owner_name) VALUES
(1, 'Sally'),
(2, 'Charles'),
(3, 'Angela'),
(4, 'Kelly'),
(5, 'Sam'),
(6, 'Cassie');

SELECT * FROM owners;

-- Create pet name table and insert values
CREATE TABLE pet_names (
  id INT NOT NULL PRIMARY KEY,
  owner_id INT NOT NULL,
  pet_name VARCHAR(255),
  type VARCHAR (255)
);

INSERT INTO pet_names (id, owner_id, pet_name, type) VALUES
(10, 1, 'Zeus', 'Dog'),
(11, 1, 'Fido', 'Dog'),
(12, 2, 'Kevin', 'Dog'),
(13, 3, 'Sprinkles', 'Cat'),
(14, 4, 'Jumper', 'Cat'),
(15, 5, 'Hoppy', 'Rabbit'),
(16, 6, 'Rex', 'Dog'),
(17, 6, 'Carrot', 'Rabbit');

SELECT * FROM pet_names;

-- Select owners and pets from joined table
SELECT owner_name, pet_name
FROM owners
INNER JOIN pet_names ON owners.id = pet_names.owner_id;

-- BONUS
-- Create service table and insert data
CREATE TABLE service (
  id INT NOT NULL PRIMARY KEY,
  service_type VARCHAR(255)
);

INSERT INTO service (id, service_type)
VALUES
(22, 'Walk'),
(33, 'Feed'),
(44, 'Hop');

-- Create new pet tables that takes a service id
CREATE TABLE pet_names_new (
  id INT NOT NULL PRIMARY KEY,
  owner_id INT NOT NULL,
  service_id INT NOT NULL,
  pet_name VARCHAR(255),
  type VARCHAR (255)
);

-- Insert data with service id
INSERT INTO pet_names_new (ID, owner_id, service_id, pet_name, type) VALUES
(10, 1, 22, 'Zeus', 'Dog'),
(11, 1, 22, 'Fido', 'Dog'),
(12, 2, 22, 'Kevin', 'Dog'),
(13, 3, 33, 'Sprinkles', 'Cat'),
(14, 4, 33, 'Jumper', 'Cat'),
(15, 5, 44, 'Hoppy', 'Rabbit'),
(16, 6, 22, 'Rex', 'Dog'),
(17, 6, 44, 'Carrot', 'Rabbit');

-- Join all three tables
SELECT owners.owner_name,
pet_names_new.pet_name, pet_names_new.type, service.service_type
FROM owners
INNER JOIN pet_names_new ON owners.ID = pet_names_new.owner_id
INNER JOIN service ON service.id = pet_names_new.service_id;





CREATE TABLE animals_all (
  id SERIAL PRIMARY KEY,
  animal_species VARCHAR(30) NOT NULL,
  owner_name VARCHAR(30) NOT NULL
);

INSERT INTO animals_all (animal_species, owner_name)
VALUES
  ('Dog', 'Bob'),
  ('Fish', 'Bob'),
  ('Cat', 'Kelly'),
  ('Dolphin', 'Aquaman');

SELECT * FROM animals_all;

CREATE TABLE animals_location (
  id SERIAL PRIMARY KEY,
  location VARCHAR(30) NOT NULL,
  animal_id INTEGER NOT NULL,
  FOREIGN KEY (animal_id) REFERENCES animals_all(id)
);

-- Insert data
INSERT INTO animals_location (location, animal_id)
VALUES
  ('Dog House', 1),
  ('Fish Tank', 2),
  ('Bed', 3),
  ('Ocean', 4);

SELECT * FROM animals_location;

-- Insert error
INSERT INTO animals_location (location, animal_id)
VALUES ('River', 5);

-- Correct insert
INSERT INTO animals_all (animal_species, owner_name)
VALUES
  ('Fish', 'Dave');

INSERT INTO animals_location (location, animal_id)
VALUES
  ('River', 5);

SELECT * FROM animals_location;





-- 1. Create a Customer table
CREATE TABLE customer (
    id SERIAL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (id)
);

-- Populate that table
INSERT INTO customer (first_name, last_name)
VALUES
  ('Bob', 'Smith'),
  ('Jane', 'Davidson'),
  ('Jimmy', 'Bell'),
  ('Stephanie', 'Duke');

-- View our table
SELECT * FROM customer;

-- 2. Create Customer Email table
CREATE TABLE customer_email (
    id SERIAL,
    email VARCHAR(30) NOT NULL,
    customer_id INTEGER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

-- Populate that table
INSERT INTO customer_email (customer_id, email)
VALUES
  (1, 'bobsmith@email.com'),
  (2, 'jdavids@email.com'),
  (3, 'jimmyb@email.com'),
  (4, 'sd@email.com');

-- View our second table
SELECT * FROM customer_email;

-- Let's create a third table with a foreign key that references the first table
CREATE TABLE customer_phone (
    id SERIAL,
    phone VARCHAR(30) NOT NULL,
    customer_id INTEGER NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

-- Populate that table
INSERT INTO customer_phone (customer_id, phone)
VALUES
  (1, '435-344-2245'),
  (2, '332-776-4678'),
  (3, '221-634-7753'),
  (4, '445-663-5799');

-- View our third table
SELECT * FROM customer_phone;


-- Uncomment the following to demonstrate the error of inserting a value with no foreign key
-- INSERT INTO customer_phone(customer_id, phone)
-- VALUES
  -- (10, '555-444-3333');

-- Join Tables
SELECT customer.first_name, customer.last_name, email.email, phone.phone
FROM customer
JOIN customer_email AS email
  ON customer.id = email.customer_id
JOIN customer_phone AS phone
  ON customer.id = phone.customer_id;





-- One to one
-- Simpson table
CREATE TABLE simpsons(
  id SERIAL,
  name VARCHAR,
  "Social Security" INTEGER
);

INSERT INTO simpsons (name, "Social Security")
VALUES
  ('Homer', 111111111),
  ('Marge', 222222222),
  ('Lisa', 333333333),
  ('Bart', 444444444),
  ('Maggie', 555555555);

-- One to Many
-- Address Table
CREATE TABLE address (
  id INTEGER PRIMARY KEY,
  address VARCHAR
);

-- Insertion query for address table
INSERT INTO address (id, address)
VALUES
  (11, '742 Evergreen Terrace'),
  (12, '221b Baker Streer');

-- People Table
CREATE TABLE people (
  id INTEGER PRIMARY KEY,
  name VARCHAR,
  social_security INTEGER,
  address_id INTEGER
);

-- Insertion query for people table
INSERT INTO people (id, name, social_security)
VALUES
  (1, 'Homer', 111111111),
  (2, 'Marge', 222222222),
  (3, 'Lisa', 333333333),
  (4, 'Bart', 444444444),
  (5, 'Maggie', 555555555),
  (6, 'Sherlock', 666666666),
  (7, 'Watson', 777777777);

-- Many to Many
-- Table schema for the Simpsons children
CREATE TABLE children(
  child_id SERIAL,
  child_name VARCHAR(255) NOT NULL,
  PRIMARY KEY (child_id)
);

-- Insertion queries for the Simpsons children
INSERT INTO children (child_name)
VALUES
  ('Bart'),
  ('Lisa'),
  ('Maggie');

-- Table schema for the Simpsons parents
CREATE TABLE parents(
  parent_id INTEGER NOT NULL,
  parent_name VARCHAR(255) NOT NULL,
  PRIMARY KEY (parent_id)
);

-- Insertion queries for the Simpsons parents
INSERT INTO parents (parent_id, parent_name)
VALUES
  (11, 'Homer'),
  (12, 'Marge');

-- Table schema for the junction table
CREATE TABLE child_parent (
  child_id INTEGER NOT NULL,
  FOREIGN KEY (child_id) REFERENCES children(child_id),
  parent_id INTEGER NOT NULL,
  FOREIGN KEY (parent_id) REFERENCES parents(parent_id),
  PRIMARY KEY (child_id, parent_id)
);

-- Insertion queries for the junction table
INSERT INTO child_parent (child_id, parent_id)
VALUES
  (1, 11),
  (1, 12),
  (2, 11),
  (2, 12),
  (3, 11),
  (3, 12);







-- Create a table of students
CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  last_name VARCHAR NOT NULL,
  first_name VARCHAR NOT NULL
);

-- Create a table of courses
CREATE TABLE courses (
  id INTEGER NOT NULL PRIMARY KEY,
  course_name VARCHAR NOT NULL
);

-- Create a junction table.
CREATE TABLE student_courses_junction (
  student_id INTEGER NOT NULL,
  FOREIGN KEY (student_id) REFERENCES students(id),
  course_id INTEGER NOT NULL,
  FOREIGN KEY (course_id) REFERENCES courses(id),
  course_term VARCHAR NOT NULL,
  PRIMARY KEY (student_id, course_id)
);

-- Insert Data into table
INSERT INTO students (id, last_name, first_name)
VALUES
  (1, 'Skywalker', 'Luke'),
  (2, 'Skywalker', 'Leia'),
  (3, 'Solo', 'Han');

INSERT INTO courses (id, course_name)
VALUES
  (3201, 'Data modeling'),
  (3202, 'Data visualization'),
  (12101, 'Force utilization');

INSERT INTO student_courses_junction (student_id, course_id, course_term)
VALUES
  (1,12101, 'Spring'),
  (1,3201, 'Fall'),
  (1,3202, 'Fall'),
  (2,12101, 'Fall'),
  (2,3202, 'Spring'),
  (3,3201, 'Spring'),
  (3,3202, 'Fall');





DROP TABLE IF EXISTS toys;
DROP TABLE IF EXISTS games;

CREATE TABLE toys (
    toy_id SERIAL,
    type VARCHAR,
    name VARCHAR
);

CREATE TABLE games (
    game_id SERIAL,
    type VARCHAR,
    name VARCHAR
);

INSERT INTO toys (type, name)
VALUES
('sports', 'baseball'),
('adventure', 'staff'),
('sports', 'tennis ball'),
('fun', 'doll');

INSERT INTO games (type, name)
VALUES
('sports', 'tag'),
('adventure', 'Kings Quest'),
('sports', 'tennis'),
('fun', 'Make believe');




-- Two queries for for actors and customer
-- Union of customers
SELECT actor_id AS id, first_name
FROM actor
WHERE actor_id between 1 and 5;

SELECT customer_id AS id, first_name
FROM customer
WHERE customer_id between 6 and 10;

-- Union of customers
SELECT actor_id AS id, first_name
FROM actor
WHERE actor_id between 1 and 5

UNION

SELECT customer_id AS id, first_name
FROM customer
WHERE customer_id between 6 and 10;

-- Two separte queries for toys and games
SELECT toy_id AS id, type
FROM toys;

SELECT game_id AS id, type
FROM games;

-- Union of toys and game types
SELECT toy_id AS id, type
FROM toys

UNION

SELECT game_id AS id, type
FROM games;

-- Include duplicate rows
SELECT toy_id AS id, type
FROM toys

UNION ALL

SELECT game_id AS id, type
FROM games;




-- Question 1

SELECT COUNT(*)
FROM city
UNION
SELECT COUNT(*)
FROM country;


-- Question 2

SELECT customer_id
FROM customer
WHERE address_id IN
(
  SELECT address_id
  FROM address
  WHERE city_id IN
  (
    SELECT city_id
    FROM city
    WHERE city = 'London'
  )
)
UNION ALL
SELECT id
FROM customer_list
WHERE city = 'London';











-- 1.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
JOIN salaries AS s
ON e.emp_no=s.emp_no;

-- 2.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';


--3.
SELECT  d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name 
FROM departments AS d
JOIN dept_manager AS dm
ON d.dept_no=dm.dept_no
JOIN employees AS e
ON dm.emp_no=e.emp_no;


--4.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no=de.emp_no
JOIN departments AS d
on de.dept_no=d.dept_no;


--5.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name='Hercules' AND last_name LIKE'B%';


--6.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no=de.emp_no
JOIN departments AS d
ON de.dept_no=d.dept_no
WHERE d.dept_name='Sales';


--7.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
ON e.emp_no=de.emp_no
JOIN departments AS d
ON de.dept_no=d.dept_no
WHERE d.dept_name='Sales' OR d.dept_name='Development';

--8.
SELECT last_name, COUNT(last_name) AS count
FROM employees
GROUP BY last_name
ORDER BY count DESC;

-- from online
-- This is the final version of all queries
-- Retirement eligibility & creating new table to hold info
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Joining departments and dept_manager tables
SELECT d.dept_name,
	dm.emp_no,
	dm.from_date,
	dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no
WHERE dm.to_date = ('9999-01-01');

-- Selecting current employees
SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
	de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

-- Employee list with gender and salary
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	e.gender,
	s.salary,
	de.to_date
-- Save into a new table
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
	ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
	ON (e.emp_no = de.emp_no)
-- Add filters
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01');

-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);

-- List of employees with departments
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
INTO dept_info
FROM current_emp as ce
	INNER JOIN dept_emp AS de
		ON (ce.emp_no = de.emp_no)
	INNER JOIN departments AS d
		ON (de.dept_no = d.dept_no);

-- List of Sales employees
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
-- INTO sales_info
FROM current_emp as ce
	INNER JOIN dept_emp AS de
		ON (ce.emp_no = de.emp_no)
	INNER JOIN departments AS d
		ON (de.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales';

-- List of employees in Sales and Development
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name
INTO sales_dev
FROM current_emp as ce
	INNER JOIN dept_emp AS de
		ON (ce.emp_no = de.emp_no)
	INNER JOIN departments AS d
		ON (de.dept_no = d.dept_no)
WHERE d.dept_name IN ('Sales', 'Development')
ORDER BY ce.emp_no;

-- Number of [titles] retiring
SELECT ce.emp_no,
  ce.first_name,
  ce.last_name,
  ti.title,
  ti.from_date,
  ti.to_date
INTO ret_titles
FROM employees AS ce
  INNER JOIN titles AS ti
    ON (ce.emp_no = ti.emp_no)
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY ce.emp_no;

SELECT * FROM ret_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM ret_titles
WHERE to_date = ('9999-01-01')
ORDER BY emp_no ASC;

SELECT * FROM unique_titles

-- Counting the number of each employee per title
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

SELECT * FROM retiring_titles

-- Creating a list of employees eligible for potential mentorship program
SELECT DISTINCT ON (e.emp_no) e.emp_no,
  e.first_name,
  e.last_name,
  e.birth_date,
  de.from_date,
  de.to_date,
  ti.title
INTO mentorship
FROM employees as e
INNER JOIN dept_emp as de
  ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
  ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

SELECT * FROM mentorship
/*Given the following data definition, write a query that returns the number of students whose first name is John. String comparisons should be case sensitive.
TABLE students
   id INTEGER PRIMARY KEY,
   firstName VARCHAR(30) NOT NULL,
   lastName VARCHAR(30) NOT NULL*/
   
select count(*)
from students
where firstName = 'John'


/*A table containing the students enrolled in a yearly course has incorrect data in records with ids between 20 and 100 (inclusive).
TABLE enrollments
  id INTEGER NOT NULL PRIMARY KEY
  year INTEGER NOT NULL
  studentId INTEGER NOT NULL
Write a query that updates the field 'year' of every faulty record to 2015.*/

update enrollments
set year = 2015
where id between 20 and 100


/*The following data definition defines an organization's employee hierarchy.
An employee is a manager if any other employee has their managerId set to this employee's id. That means John is a manager if at least one other employee has their managerId set to John's id.
TABLE employees
  id INTEGER NOT NULL PRIMARY KEY
  managerId INTEGER REFERENCES employees(id)
  name VARCHAR(30) NOT NULL
Write a query that selects only the names of employees who are not managers.*/

select name
from employees
where id not in (select managerid from employees where managerid is Not NULL)


/*Information about pets is kept in two separate tables:
TABLE dogs
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL
TABLE cats
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL
Write a query that select all distinct pet names.*/

select name from dogs
union
select name from cats


/*Each item in a web shop belongs to a seller. To ensure service quality, each seller has a rating.
The data are kept in the following two tables:
TABLE sellers
  id INTEGER PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  rating INTEGER NOT NULL
TABLE items
  id INTEGER PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  sellerId INTEGER REFERENCES sellers(id)
Write a query that selects the item name and the name of its seller for each item that belongs to a seller with a rating greater than 4. The query should return the name of the item as the first column and name of the seller as the second column.*/

select i.name, s.name
from sellers s
join items i
on s.id = i.sellerId
where rating >4


/*A new social network site has the following data tables:
USERS
ID	NAME	SEX
1	  Ann	  null
2	  Steve	  m
3	  Mary	  f
4	  Brenda	f
FRIENDS
USER1	USER2
1	    2
1	    3
2	    3
Select data that will be returned by the following SQL query:*/

SELECT users.name, COUNT(*) as count FROM users
LEFT JOIN friends
ON users.id = friends.user1 OR users.id = friends.user2
WHERE users.sex = 'f'
GROUP BY users.id, users.name;

