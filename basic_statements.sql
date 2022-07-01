-- CRUD
-- create, read, update, delete
-- DDL: data definition language: create, update, delete
-- DML: data manipulation lange: read!

-- SELECT is the primary read statement that we will be using

-- SELECT (bring me information)
-- __subject___ (field names, computations, etc)
-- FROM (what table do you want this information from? is it from a table?)
-- __source__ (either with a dot notation or living inside of a schema)

 SHOW DATABASES;
 
/* SELECT (*: every field) FROM the schema named chipotle, and 
the table named orders inside chipotle */
 SELECT * FROM chipotle.orders;
 
 -- lets change over to the fruits database
 USE fruits_db;
 -- Show me what tables are here. (looks like its just fruits)
 SHOW TABLES;
 -- show me (SELECT) everything(*) FROM the table I want (fruits)
 SELECT * FROM fruits;
 -- more info on the table?
 DESCRIBE fruits;

-- select only specific fields?
SELECT name FROM fruits;
-- more than one?
SELECT id, name FROM fruits;
-- give me everything in the fruits table (all fields) where the name field
-- matches the string 'mango'

SELECT * FROM fruits WHERE name = 'mango';

-- basic clause:
-- coming after the select statement, after where we are pulling from
-- we specify what filter we want: WHERE clause, based on fruits_db.fruits.name
-- match it where the cell values inside of fruits.name match mango

-- syntax:
-- equivalence is denoted by a single = 
-- string values exist inside of single quotes

-- DISTINCT will give us unique values in a field
SELECT DISTINCT name, quantity FROM fruits;

-- We can utilize more numerical comparisons with WHERE
SELECT * FROM fruits WHERE quantity > 2;

/*
comparison operators:
= equals
!=, <> not equal
<, > less than, greater than
<=, >= less than or equal, greater than or equal
BETWEEN greater than or equal to first value, less 
than or equal to second value (chained with an AND) */

SELECT * FROM fruits_db.fruits WHERE quantity BETWEEN 2 AND 15;

-- we can utilize sql with operations that are not from a table:
SELECT 'this is some output!';

 -- you can use comparison operators:
 SELECT 2=3;
 
 -- you can do math:
 SELECT 2+3;
 
 -- you can do both!
 SELECT 2=2, 2+3, 2 BETWEEN 3 AND 5;
 
 -- aliasing:
 -- you can also call a field whatever you want in your output.
 -- this does not change the original field name, just how it populates in your query.
 SELECT 2=2 AS equivalency_demo;
 
 SELECT name AS fruit_type FROM fruits;