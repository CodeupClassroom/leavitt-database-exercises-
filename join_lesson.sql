-- Let's look at a join example toy schema
USE join_example_db;
-- Let's see what tables live here:
-- roles, and users
SHOW TABLES;

-- let's examine roles
DESCRIBE roles;
-- and users
DESCRIBE users;

SELECT * FROM users;


-- INNER joins:
-- Inner joins will be our default join structure.

SELECT *
-- from users as the left table
FROM users
-- join all fields (*)
JOIN roles
-- how do we want to make that connection?
ON users.role_id = roles.id;

-- How do we select specific fields?
SELECT users.name, roles.name, role_id
-- from users as the left table
FROM users
-- join all fields (*)
JOIN roles
-- how do we want to make that connection?
ON users.role_id = roles.id;

-- How do we select specific fields?
-- We can also alias what we want to do with specific tables
SELECT hamsandwich.name AS user_name, pizza.name, role_id
-- from users as the left table
FROM users AS hamsandwich
-- join all fields (*)
JOIN roles AS pizza
-- how do we want to make that connection?
ON hamsandwich.role_id = pizza.id;


-- I lied about using AS for aliases, you can just do it
SELECT hamsandwich.name user_name, pizza.name, role_id
-- from users as the left table
FROM users hamsandwich
-- join our selected fields from above
JOIN roles pizza
-- how do we want to make that connection?
ON hamsandwich.role_id = pizza.id;

-- LEFT/RIGHT joins?

-- Basic left join command
SELECT *
FROM users u
LEFT JOIN roles r
ON r.id = u.role_id;

-- Right join?
SELECT *
FROM users u
RIGHT JOIN roles r
ON r.id = u.role_id;

-- Big note: Left and Right joins are the same thing,
-- it just depends on what order you put your tables inside of your query
-- In this case, roles is our left table  denoted by the first table referenced after
-- our FROM command.
-- FOLLOWING JOIN, whatever second table there is our right table (second referenced)
SELECT *
FROM roles r
RIGHT JOIN users u
ON  u.role_id = r.id;

-- Let's explore a different schema:
-- select a new schema using USE
USE world
-- Let's see what tables are in here using SHOW TABLES
-- looks like city, country, and countrylanguage
SHOW TABLES;

DESCRIBE city;
-- CountryCode appears to link
-- ID is our primary key
-- other fields: Name, District, Population
SELECT * FROM city LIMIT 2;

DESCRIBE country;
SELECT * FROM country LIMIT 2;
-- key: Code

SELECT * FROM countrylanguage LIMIT 2;
-- key: CountryCode

-- We know after some exploration that we have a shared key of a country code between
-- the tables inside of this schema.

-- Let's associate these three tables with eachother to get all *shared* output:

-- SELECT all fields (from all tables)
SELECT *
-- first table: city
FROM city
-- join it on the country table
JOIN country
-- how do we want to link these two tables?
ON city.CountryCode = country.Code
-- make our second join : attach countrylanguage
JOIN countrylanguage
-- How do you want to associate countrylanguage to country?
ON country.Code = countrylanguage.CountryCode;


-- USING:
-- We need to use the keyword ON when establishing equivalence between tables
-- with different foreingn/primary key pair value names
-- but: If they have the same field name, we can elect to use USING()

SELECT * 
FROM city
JOIN countrylanguage
ON city.CountryCode = countrylanguage.CountryCode;

SELECT * 
FROM city
JOIN countrylanguage
USING(CountryCode);