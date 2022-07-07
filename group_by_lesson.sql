-- GROUP BY: An Introduction to Aggregation

-- select our schema
USE chipotle;
-- look at whats in the table:
SHOW TABLES;
DESCRIBE orders;
-- string types in fields: item_price, choice_description, item_name
-- num types: id (pk), order_id, quantity

-- Previous use-case: DISTINCT
-- Let me get every unique item name in this table of orders
SELECT
DISTINCT item_name
FROM orders;

SELECT
DISTINCT item_name,
quantity
FROM orders;

-- some redundancy here:
-- GROUP BY on its own

SELECT item_name FROM orders GROUP BY item_name;

-- GROUP BY with two columns:
-- note that this is replicant of using DISTINCT with two fields
-- every unique combination of those two fields
SELECT item_name,
quantity
FROM orders 
GROUP BY item_name, quantity;

-- first use-case of aggregative functions 
-- in conjunction with GROUP BY

-- Flexability:
-- When using count inside of your aggregate call,
-- we can use different field names.  It will consistently
-- give you the number of instances the grouped field contains
-- it will be common to see COUNT(*), i.e. count all instances of all fields
SELECT item_name,
COUNT(item_name)
FROM orders 
GROUP BY item_name;

-- Adding complexity with a WHERE clause:
SELECT item_name,
COUNT(item_name)
FROM orders 
WHERE item_name LIKE '%burrito%'
GROUP BY item_name;

-- Adding more:
SELECT item_name,
COUNT(item_name) AS num_orders
FROM orders 
WHERE item_name LIKE '%burrito%'
GROUP BY item_name
HAVING num_orders > 6
ORDER BY num_orders DESC
LIMIT 1;

-- SELECT the thing (what fields we want)
SELECT item_name, item_price,
-- if we are not grouping by a secondary field, what do with it
MAX(quantity) AS max_num_ordered
-- from what table are we pulling from?
FROM orders
-- Do we need a WHERE to narrow scope with a clause?
WHERE item_name LIKE '%veggie%'
-- for all grouped fields, specify order
GROUP BY item_name, item_price
-- do we want to narrow down our aggregated function value with a HAVING?
HAVING max_num_ordered > 1
-- do we have an order to sort by?
ORDER BY max_num_ordered DESC
-- do we have a limit to the number of fields we want?
LIMIT 2;

