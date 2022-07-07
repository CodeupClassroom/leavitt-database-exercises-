-- Use the employees database.
use employees;

-- Using the example in the Associative Table Joins section as a guide, write a query that 
-- shows each department along with the name of the current manager for that department.
select * from employees limit 10;
select * from dept_manager limit 10;
select * from departments limit 10;

select dept_name, concat(first_name, ' ', last_name) as full_name
from departments
	join dept_manager 
		using (dept_no)
	join employees
		using (emp_no)
where to_date > now()
;

--   Department Name    | Department Manager
--  --------------------+--------------------
--   Customer Service   | Yuchang Weedman
--   Development        | Leon DasSarma
--   Finance            | Isamu Legleitner
--   Human Resources    | Karsten Sigstam
--   Marketing          | Vishwani Minakawa
--   Production         | Oscar Ghazalie
--   Quality Management | Dung Pesch
--   Research           | Hilary Kambil
--   Sales              | Hauke Zhang

-- Find the name of all departments currently managed by women.

select dept_name, concat(first_name, ' ', last_name) as full_name
from departments
	join dept_manager 
		using (dept_no)
	join employees
		using (emp_no)
where to_date > now()
and gender = 'F'
;

-- Department Name | Manager Name
-- ----------------+-----------------
-- Development     | Leon DasSarma
-- Finance         | Isamu Legleitner
-- Human Resources | Karsetn Sigstam
-- Research        | Hilary Kambil

-- Find the current titles of employees currently working in the Customer Service department.
select * from dept_emp;
select * from departments;

select title, count(*)
from employees
	join titles 
		using (emp_no)
	join dept_emp
		using (emp_no)
	join departments
		using (dept_no)
where dept_name = 'Customer Service'
and titles.to_date > now()
and dept_emp.to_date > now()
group by title
;

-- Title              | Count
-- -------------------+------
-- Assistant Engineer |    68
-- Engineer           |   627
-- Manager            |     1
-- Senior Engineer    |  1790
-- Senior Staff       | 11268
-- Staff              |  3574
-- Technique Leader   |   241


-- Find the current salary of all current managers.
select first_name, last_name, salary
from dept_manager dm
	join salaries s
		using (emp_no)
	join employees
		using (emp_no)
where dm.to_date > now() 
and s.to_date > now()
;


-- Department Name    | Name              | Salary
-- -------------------+-------------------+-------
-- Customer Service   | Yuchang Weedman   |  58745
-- Development        | Leon DasSarma     |  74510
-- Finance            | Isamu Legleitner  |  83457
-- Human Resources    | Karsten Sigstam   |  65400
-- Marketing          | Vishwani Minakawa | 106491
-- Production         | Oscar Ghazalie    |  56654
-- Quality Management | Dung Pesch        |  72876
-- Research           | Hilary Kambil     |  79393
-- Sales              | Hauke Zhang       | 101987


-- Find the number of current employees in each department.
select dept_no, dept_name, count(*) as num_employees
from employees
	join dept_emp de 
		using (emp_no)
	join departments
		using (dept_no)
where de.to_date > now()
group by dept_name 
;


-- +---------+--------------------+---------------+
-- | dept_no | dept_name          | num_employees |
-- +---------+--------------------+---------------+
-- | d001    | Marketing          | 14842         |
-- | d002    | Finance            | 12437         |
-- | d003    | Human Resources    | 12898         |
-- | d004    | Production         | 53304         |
-- | d005    | Development        | 61386         |
-- | d006    | Quality Management | 14546         |
-- | d007    | Sales              | 37701         |
-- | d008    | Research           | 15441         |
-- | d009    | Customer Service   | 17569         |
-- +---------+--------------------+---------------+

-- Which department has the highest average salary? 
-- Hint: Use current not historic information.
select dept_name, avg(salary) as avg_sal
from salaries s 
	join dept_emp de 
		using (emp_no)
	join departments
		using (dept_no)
where de.to_date > now()
and s.to_date > now()
group by dept_name
order by avg_sal desc 
limit 1
;

-- +-----------+----------------+
-- | dept_name | average_salary |
-- +-----------+----------------+
-- | Sales     | 88852.9695     |
-- +-----------+----------------+

-- Who is the highest paid employee in the Marketing department?
select first_name, last_name, salary, dept_name
from employees e 
	join dept_emp de 
		using (emp_no)
	join departments d 
		using (dept_no)
	join salaries s 
		using (emp_no)
where dept_name = 'Marketing'
and de.to_date > now()
and s.to_date > now()
order by salary desc
limit 1 
;

-- +------------+-----------+
-- | first_name | last_name |
-- +------------+-----------+
-- | Akemi      | Warwick   |
-- +------------+-----------+

-- Which current department manager has the highest salary?
select first_name, last_name, salary, dept_name
from dept_manager dm
	join employees
		using (emp_no)
	join salaries s 
		using (emp_no)
	join departments
		using (dept_no)
where dm.to_date > now()
and s.to_date > now()
order by salary desc
limit 1
;

-- +------------+-----------+--------+-----------+
-- | first_name | last_name | salary | dept_name |
-- +------------+-----------+--------+-----------+
-- | Vishwani   | Minakawa  | 106491 | Marketing |
-- +------------+-----------+--------+-----------+

-- Determine the average salary for each department. 
-- Use all salary information and round your results.
select dept_name, round(avg(salary), 0) as avg_sal
from salaries
	join dept_emp
		using (emp_no)
	join departments
		using (dept_no)
group by dept_name
;

SELECT d.dept_name, round(avg(salary), 0)
FROM salaries s
JOIN dept_emp de
USING (emp_no)
JOIN departments d
USING (dept_no)
WHERE de.to_date >= NOW() AND s.to_date >= NOW()
GROUP BY d.dept_name, s.salary;


-- +--------------------+----------------+
-- | dept_name          | average_salary | 
-- +--------------------+----------------+
-- | Sales              | 80668          | 
-- +--------------------+----------------+
-- | Marketing          | 71913          |
-- +--------------------+----------------+
-- | Finance            | 70489          |
-- +--------------------+----------------+
-- | Research           | 59665          |
-- +--------------------+----------------+
-- | Production         | 59605          |
-- +--------------------+----------------+
-- | Development        | 59479          |
-- +--------------------+----------------+
-- | Customer Service   | 58770          |
-- +--------------------+----------------+
-- | Quality Management | 57251          |
-- +--------------------+----------------+
-- | Human Resources    | 55575          |
-- +--------------------+----------------+
