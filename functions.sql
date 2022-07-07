-- Functions: String Functions:
SELECT CONCAT('hi', ' ', 'leavitt') AS simplegreeting;

USE fruits_db;
SHOW TABLES;
SELECT * FROM fruits;

SHOW DATABASES;

USE employees;

SHOW TABLES;

SELECT * FROM employees LIMIT 5;
-- If I wanted a full name field, 
-- concatenate first_name with last_name, add a space between
SELECT CONCAT(first_name, ' ', last_name) 
AS fullname 
FROM employees LIMIT 5;

-- substrings:
SELECT SUBSTR('Howdy leavitt', 2, 6);

-- nesting:
-- let's get the first initial of all employees followed by the last name
SELECT 
CONCAT(
SUBSTR(first_name, 1, 1), ' ', last_name) 
FROM employees;

-- UPPER and LOWER:

SELECT UPPER(first_name) FROM employees;

-- REPLACE

SELECT REPLACE('Hey $$$$', '$$$', 'Leavitt');


-- Time functions:
-- useful for comparison
SELECT NOW();

SELECT UNIX_TIMESTAMP(NOW());

-- MATH functions:
-- We can use these within previous clauses for efficiency

SELECT * FROM employees LIMIT 5;
SELECT MIN(emp_no) FROM employees;

-- problems here: leave a bookmark here when we talk about aggregation
SELECT * FROM employees WHERE emp_no = MIN(emp_no);


-- CASTING: turn one data type into another

USE chipotle;
SELECT * FROM orders LIMIT 5;

-- WHEN utilizing cast, we separate the arguments with AS
-- think about it the same way as we do aliasing
SELECT CAST('5.99' AS FLOAT);

-- remove the dollar sign by replacing it with an empty string
SELECT REPLACE('$5.99', '$', '');

-- lets nest these to solve our earlier discussed problem:

-- get every item_price from orders
SELECT item_price FROM orders;

-- remove the dollar sign (replace it with nothing)
-- cast the truncated string decimal as a float value
SELECT CAST(REPLACE(item_price, '$', '') AS float) FROM orders;