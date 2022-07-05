-- Clauses
-- Clauses are how we get specifically what we want (usually from 
-- a single field or a combination of fields)

-- WHERE: Give me results specifically under X conditions

-- ORDER BY: Sort my results specifically to my needs

-- LIMIT: Only give me some of the results back

-- SHOW me what databases/schemas I have available
SHOW DATABASES;

-- use the schema chipotle
USE chipotle;

-- SHOW TABLES (show me what tables I have available)

-- tell me what fields I have inside the orders table
DESCRIBE orders;

-- A good way to get a preview on our table:
-- LIMIT

SELECT * FROM orders LIMIT 5;


-- If I want to narrow down results, we can use WHERE

-- WHERE comes at the end of a select statement, and it can be chained

-- A few different ways to use this so far:
-- We need to specify what we want to narrow down
-- establish equivalency: =
-- LIKE, compare string values
-- BETWEEN, inclusive ranges
-- inequality operators: <,>,<=,>=

-- Give me everything in orders
-- specifically, everything that has tomato in the item name

SELECT * FROM orders WHERE item_name LIKE '%tomato%';

-- Give me the total unique item names with the word tomato in it
SELECT DISTINCT item_name FROM orders WHERE item_name LIKE '%tomato%';

-- STRUCTURE:
-- SELECT - Do the thing, pull the info
-- WHAT - everything: *, some specific fields, some way of looking
-- at a specific field, (DISTINCT)
-- FROM - WHERE this is coming from
-- STIPULATIONS? Do we want a *clause* to narrow this info?

-- Use a numerical comparison:
-- Give me every choice_description, \
-- but only if there were more than 3 ordered

SELECT 
choice_description AS choice 
FROM orders 
WHERE quantity > 3
AND choice_description <> 'nan';

SELECT * 
FROM orders
WHERE quantity > 2
AND (
item_name LIKE '%tomato%'
OR choice_description LIKE '%rice%');

-- ORDER BY: How we sort our results
SELECT * 
FROM orders
WHERE quantity > 2
AND (
item_name LIKE '%tomato%'
OR choice_description LIKE '%rice%')
ORDER BY quantity DESC
LIMIT 4;
-- SELECT everything (all fields)
SELECT * 
-- From where? orders table
FROM orders
-- Specifically those whre quantity is greater than 2
WHERE quantity > 2
-- and more specifically, where it also EITHER
-- has tomato in the item name field
AND (
item_name LIKE '%tomato%'
-- or it has rice in choice description
OR choice_description LIKE '%rice%')
-- sort my results from the biggest quantity to the smallest
ORDER BY quantity DESC
-- only give me the first 4 results after those specifics
LIMIT 4;

-- another quick note about data types:
-- let's look at item_price

-- this will not give me desired results because:
-- item_price is a string that looks kinda like a number
SELECT item_name, item_price FROM orders WHERE item_price < 10.00;

DESCRIBE orders;