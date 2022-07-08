use employees;

-- Find all the current employees with the same hire date as employee 101010 using a sub-query.
select hire_date
from employees
where emp_no = 101010;

select *
from employees
	join dept_emp
		using(emp_no)
where hire_date = 
	(
	select hire_date
	from employees
	where emp_no = 101010
	)
and to_date > now()
;

-- Find all the titles ever held by all current employees with the first name Aamod.
select emp_no
from employees
	join dept_emp
		using (emp_no)
where first_name = 'Aamod'
and to_date > now();

select title, count(*)
from titles
where emp_no in (
		select emp_no
		from employees
			join dept_emp
			using (emp_no)
		where first_name = 'Aamod'
		and to_date > now()
)
group by title
;

-- How many people in the employees table are no longer working for the company? 
-- Give the answer in a comment in your code.
select count(*)
from employees
where emp_no not in 
	( 
	select emp_no
	from dept_emp
	where to_date > now()
    )
;

-- Find all the current department managers that are female. 
-- List their names in a comment in your code.
select emp_no
from dept_manager
where to_date > now()
;

select * 
from employees 
where emp_no in ( 
	select emp_no
	from dept_manager
	where to_date > now()
    )
and gender = 'F'
;


-- Find all the employees who currently have a higher salary than the companies overall, 
-- historical average salary.
select avg(salary)
from salaries
;

select count(*)
from employees
	join salaries
		using (emp_no)
where to_date > now()
and salary > 
	(select avg(salary)
	from salaries)
;

-- How many current salaries are within 1 standard deviation of the current highest salary? 
-- (Hint: you can use a built in function to calculate the standard deviation.) 
select max(salary)
from salaries
where to_date > now()
;

select stddev(salary)
from salaries
where to_date > now()
;

select count(*)
from salaries
where salary > 
	(
	(select max(salary)
	from salaries
	where to_date > now()
    )
    - 
    (select stddev(salary)
	from salaries
	where to_date > now()
    )
    )
and to_date >now()
    ;


-- What percentage of all salaries is this?
select 
(
	select count(*)
	from salaries
	where salary > 
		(
		(select max(salary)
		from salaries
		where to_date > now()
		)
		- 
		(select stddev(salary)
		from salaries
		where to_date > now()
		)
		)
	and to_date >now()
)
/ 
(
	select count(*) 
	from salaries
	where to_date > now()
) * 100
;

-- Hint You will likely use multiple subqueries in a variety of ways
-- Hint It's a good practice to write out all of the small queries that you can. 
-- Add a comment above the query showing the number of rows returned. 
-- You will use this number (or the query that produced it) in other, larger queries.
