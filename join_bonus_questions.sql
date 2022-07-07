-- 11. Find the names of all current employees, 
-- their department name, 
-- and their current manager's name.

select concat(managers.first_name, " ", managers.last_name) as "manager_name", 
dept_name, 
concat(employees.first_name, " ", employees.last_name) as "Employee Name"
-- I know I need the names of my department managers.
-- Where are names? they're in the employees table
from employees as managers #aliasing here allows us to "self join" the employees table.
-- join in department manager to get the managerial status of the employees
join dept_manager using(emp_no)
-- join in departments from there to get the department name
join departments using(dept_no)
-- join in dept_emp to get the link back to employees
join dept_emp using(dept_no)
-- join back into employees to get the names of the employees this time
join employees on dept_emp.emp_no = employees.emp_no
where dept_manager.to_date > curdate()
and dept_emp.to_date > curdate();


-- 12:

-- SELECT d.dept_name, d.dept_no, max(s.salary) AS sal
-- FROM salaries s
-- JOIN dept_emp de USING(emp_no)
-- JOIN departments d USING(dept_no)
-- WHERE de.to_date > NOW() AND s.to_date > NOW()
-- GROUP BY dept_name;


-- I'm going to make two queries here, that I call dmock and salmock.
-- dmock will give me my left table, with department names and max salaries.

-- salmock will be my current employees with departments and salaries.alter

-- I will then LEFT join dmock with salmock and establish that the salary and 
-- department match for each of those.
 
 -- The outer select will take from dmock and salmock.
SELECT dmock.dept_name, dmock.sal, salmock.namebo FROM

(
-- First query: dmock.
SELECT d.dept_name, d.dept_no, max(s.salary) AS sal
FROM salaries s
JOIN dept_emp de USING(emp_no)
JOIN departments d USING(dept_no)
WHERE de.to_date > NOW() AND s.to_date > NOW()
GROUP BY dept_name) dmock
-- join dmock to our second query.
LEFT JOIN 
(SELECT CONCAT(e.first_name, ' ', e.last_name) namebo, s.salary, d.dept_name
FROM employees e
JOIN salaries s USING (emp_no)
JOIN dept_emp de USING (emp_no)
JOIN departments d USING (dept_no)
WHERE de.to_date > NOW()
AND s.to_date > NOW()) salmock
-- how do we want to join dmock with salmock?
-- well, I want to get the names of the current employees that belong to those
-- specific salary and department names that I pulled from dmock
ON dmock.dept_name = salmock.dept_name AND dmock.sal = salmock.salary;
-- woo!


