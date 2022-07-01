-- TABLES
-- SQL Table structures:
-- 1. Data types
-- 1a. Null types
-- 2. Primary Keys
-- 3. Table inspections 

SHOW DATABASES;

USE chipotle;

SHOW TABLES;

-- Structure of a MySql Database:
-- Inside the Database exists schema (databases)
-- These databases provide a structure for tables

-- Tables:
SELECT * FROM orders LIMIT 5;

-- So what's in a Table?
-- Each cell of data in a table is exactly that: data
-- each piece of datum has an inherent type
-- that type defines how it can interact, and if it can belong in that field
-- interchangable terms in sql: columns and fields

-- Tables in sql have some very specific rules about how they are created:
-- Firstly, they must contain a primary key
-- primary keys have to be unique, cant be null, and there can be one
 
 -- If we examine the creation of the table, it will give us the exact CREATE statement
 -- utilized that tells us precisely how that specific table was created
 -- it will tell us what data types exist for each field, and which field is the primary key
 SHOW CREATE TABLE orders;
 
 -- If we want to just look at the data archetecture of our table,
 -- it may be easier to look at DESCRIBE,
 -- DESCRIBE will tell us:
 -- Which fields exist in this table
 -- Which data types are associated with each field
 -- Which field represents the primary key
 
 DESCRIBE orders;