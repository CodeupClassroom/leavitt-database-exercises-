-- Create a new file named group_by_exercises.sql
use employees;

-- In your script, use DISTINCT to find the unique titles in the titles table. 
-- How many unique titles have there ever been? Answer that in a comment in your SQL file.
select distinct title
from titles
;

-- Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.
select last_name
from employees
where last_name like 'e%e'
group by last_name
;

-- Write a query to to find all unique combinations of first and last names of all employees whose 
-- last names start and end with 'E'.
select distinct first_name, last_name
from employees
where last_name like 'e%e'
;

-- Write a query to find the unique last names with a 'q' but not 'qu'. 
-- Include those names in a comment in your sql code.
select distinct last_name
from employees
where last_name like '%q%'
	and last_name not like '%qu%'
;

-- Add a COUNT() to your results (the query above) to find the number of employees with the same last name.
select distinct last_name, count(*)
from employees
where last_name like '%q%'
	and last_name not like '%qu%'
group by last_name
;

-- Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. 
-- Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.
select first_name, count(*)
from employees
where first_name in ('Irena', 'Vidya', 'Maya')
group by first_name
;

-- Using your query that generates a username for all of the employees, 
-- generate a count employees for each unique username. Are there any duplicate usernames? 
select
	lower(concat(
		substr(first_name, 1, 1)
        , substr(last_name, 1, 4)
        , '_'
        , substr(birth_date, 6, 2)
        , substr(birth_date, 3, 2)
        )) as username
	, count(*) as count 
from employees
group by username
order by count desc
;

-- BONUS: How many duplicate usernames are there?
select count(*) 
from (
	select
		lower(concat(
			substr(first_name, 1, 1)
			, substr(last_name, 1, 4)
			, '_'
			, substr(birth_date, 6, 2)
			, substr(birth_date, 3, 2)
			)) as username
		, count(*) as count
	from employees
	group by username
	having count <> 1
    ) as a
;

-- Bonus: More practice with aggregate functions:
-- Determine the historic average salary for each employee. 
select emp_no, avg(salary) 
from salaries
group by emp_no
;

-- When you hear, read, or think "for each" with regard to SQL, you'll probably be grouping by that exact column.
-- Using the dept_emp table, count how many current employees work in each department. 
-- The query result should show 9 rows, one for each department and the employee count.
select dept_no, count(*)
from dept_emp
where to_date = '9999-01-01'
group by dept_no
;

-- Determine how many different salaries each employee has had. This includes both historic and current.
select emp_no, count(*)
from salaries
group by emp_no
;

-- Find the maximum salary for each employee.
-- Find the minimum salary for each employee.
-- Find the standard deviation of salaries for each employee.
select emp_no, min(salary), max(salary), round(stddev(salary),0)
from salaries
group by emp_no
;

-- Now find the max salary for each employee where that max salary is greater than $150,000.
select emp_no, max(salary) 
from salaries
group by emp_no
having max(salary) > 150000
order by max(salary) desc
;

-- Find the average salary for each employee where that average salary is between $80k and $90k.
select emp_no, round(avg(salary),0)
from salaries
group by emp_no
having avg(salary) between 80000 and 90000