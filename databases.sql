-- This is how we make a comment in mysql

-- i want to see the sections in the library
-- the sections are what we may describe as schema, or databases.alter

SHOW DATABASES;

-- select everything (*)
-- FROM the database/schema of mysql
-- FROM the table of user

SELECT * FROM mysql.user;

-- How do I get into that section? how do I get into a schema?

-- In CLI, we would change directories into our location (cd), we would list contents (ls)
-- We will replicate this process by saying USE a specific schema, and SHOW the contents

-- put me inside of the mysql schema
USE mysql;

-- show me all the tables in the database mysql now that i am here
SHOW TABLES;

-- show me all the fields in the table called user
SELECT * FROM user;

-- use the fruits_db schema
USE fruits_db;

-- i got lost in the library.  where am i? 

SELECT database();

-- I want to know details about the creation of fruits_db
-- SHOW command
-- The details of the CREATE command
-- for the DATABASE (schema) fruits_db
SHOW CREATE DATABASE fruits_db;

