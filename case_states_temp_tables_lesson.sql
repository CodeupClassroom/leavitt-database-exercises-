-- CASE STATEMENTS
-- Our means of categorizing information
-- based on truthful logic

-- We will:
-- Create conditions
-- Get a result of said conditions
-- These results will go toward an output

-- Let's dive in on chipotle
USE chipotle;

-- orders is the only table here (no joins! huzzah!)

SELECT * FROM orders LIMIT 5;


SELECT item_name FROM orders WHERE item_name LIKE '%chicken%';

-- 'picking out from this list:
-- we will grab Chicken Burrito, Chicken Crispy Tacos, and Chicken Soft Tacos
-- we will refer to this demographic as chicken tortilla

-- basic case statement:
SELECT item_name,
CASE item_name
	WHEN LIKE '%chicken%' THEN 'chickkybowl'
    WHEN 'Chicken Burrito' THEN 'chikkyburrito'
    ELSE 'something else'
END AS modified_item_name
FROM orders;

-- more verbose method of doing things here:
SELECT COUNT(*),
CASE 
-- rather than specifying the field next to CASE,
-- we can specify it on WHEN, so we can apply more flexible logic.
	WHEN item_name IN('Chicken Burrito',
						'Chicken Crispy Tacos',
                        'Chicken Soft Tacos') THEN 'chicken_type_beat'
	ELSE 'something else'
END AS chicken_item_field
-- still gotta say from where!
FROM orders
GROUP BY chicken_item_field;

-- IF statements:

SELECT 
item_name,
-- IF: (truth statement, option 1, option2) etc
IF(item_name = 'Chicken Burrito', True, False) AS is_chick_burr
FROM orders;

-- TEMP TABLES:

SHOW DATABASES;

-- You will only have access to this creation process when in your schema:
-- (the one associated with your username, not mine)
USE ada_674;

SHOW TABLES;
-- currently not populated

-- To create a new table:
-- CREATE TEMPORARY TABLE
-- followed by what you want to call it 
-- followed by whats in it (data types and field names)
CREATE TEMPORARY TABLE my_first_table (
	n INT UNSIGNED NOT NULL);

-- it will not show up as a regular table, but...
SHOW TABLES;

-- it does exist for us to use now.
SELECT * FROM my_first_table;

-- lets throw some values into there:
INSERT INTO my_first_table(n) VALUES (1), (2), (3), (10);

SELECT * FROM my_first_table;

-- Insert a new field into the table
-- to do this, we need to alter the table structure:
ALTER TABLE my_first_table ADD bonuscol VARCHAR(30);

SELECT * FROM my_first_table;

-- let's drop that column out (i've decided I dont like it)
ALTER TABLE my_first_table DROP COLUMN bonuscol;

SELECT * FROM my_first_table;

-- SIDE NOTE: creating a table with more than one field
CREATE TEMPORARY TABLE tbl2 (
	col1 INT UNSIGNED NOT NULL,
    col2 VARCHAR(30));
    
SELECT * FROM tbl2;
-- Inserting information continues with the syntax from before:
INSERT INTO tbl2(col1,col2) VALUES 
	(3, 'hamsandwich'), 
	(8, 'pizza'), 
    (84, 'happy_friday');

SELECT * FROM tbl2;

-- to delete an entire temp table:
DROP TABLE tbl2;
-- doesnt exist anymore.
SELECT * FROM tbl2;

-- 
CREATE TEMPORARY TABLE chipotle_copy(
SELECT * FROM chipotle.orders);

SELECT * FROM chipotle_copy;

-- let's create a new field here:
ALTER TABLE chipotle_copy ADD quant_plus INT;

-- sanity check: let's see that it exists
SELECT * FROM chipotle_copy LIMIT 3;
-- (yes, and its full of nulls)

UPDATE chipotle_copy SET quant_plus = quantity + 1;

SELECT quantity, quant_plus FROM chipotle_copy;

ALTER TABLE chipotle_copy DROP COLUMN quantity;

SELECT quant_plus FROM chipotle_copy;











