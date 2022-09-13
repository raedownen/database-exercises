/*
Join Example Database
2. Use join, left join, and right join to combine results from the users and roles tables 
as we did in the lesson. Before you run each query, guess the expected number of results.*/

USE join_example_db;

SELECT *
FROM roles;

SELECT *
FROM users;

SELECT users.name as user_name, roles.name as role_name
FROM users
JOIN roles
ON users.role_id = roles.id;

SELECT users.name AS user_name, roles.name AS role_name
FROM users
LEFT JOIN roles
ON users.role_id = roles.id;

SELECT users,name AS user_name, roles.name as role_name
FROM users
RIGHT JOIN roles
ON users.role_id = roles.id;

/*3. Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries. 
Use count and the appropriate join type to get a list of roles along with the number of users that has the role.
Hint: You will also need to use group by in the query.
USE join_example_db; */



/* .2 Using the example in the Associative Table Joins section as a guide, 
write a query that shows each department along with the name of the current manager for that department.*/

USE employees;

SELECT d.dept_name AS 'Department Name', CONCAT(first_name, ' ', last_name) AS 'Department Manager'
FROM employees AS e
JOIN dept_manager as dm
ON dm.emp_no = e.emp_no
JOIN departments as d
ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01'

/* 3. Find the name of all departments currently managed by women.
USE employees;*/
USE employees;

SELECT d.dept_name AS 'Department Name', CONCAT(first_name, ' ', last_name) AS 'Department Manager'
FROM employees AS e
JOIN dept_manager as dm
ON dm.emp_no = e.emp_no
JOIN departments as d
ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01' AND e.gender = 'F'

/* 4. Find the current titles of employees currently working in the Customer Service department.*/
USE employees;

SELECT titles.title, COUNT(dept_emp.emp_no)
FROM departments 
JOIN dept_emp
	ON dept_emp.dept_no = departments.dept_no
JOIN titles
	ON titles.emp_no = dept_emp.emp_no
WHERE dept_emp.to_date = '9999-01-01' 
AND dept_name = 'Customer Service' 
AND titles.to_date = '9999_01-01'
GROUP BY titles.title

/* 5. Find the current salary of all current managers.*/
USE employees;

SELECT CONCAT(e.first_name, ' ', e.last_name) AS 'Department Manager', 
	d.dept_name AS  'Department Name',
	s.salary AS 'Salary'
FROM departments AS d
JOIN dept_manager AS dm
	ON d.dept_no = dm.dept_no
JOIN employees AS e
	ON e.emp_no = dm.emp_no
JOIN salaries AS s
	ON s.emp_no = dm.emp_no
WHERE dm.to_date = '9999-01-01' AND s.to_date = '9999-01-01';

/* 6. Find the number of current employees in each department.*/
USE employees;

SELECT d.dept_no, dept_name, COUNT(e.emp_no) AS 'num_employees'

FROM departments as d
JOIN dept_emp as de
	ON d.dept_no = de.dept_no
JOIN employees as e
	ON e.emp_no = de.emp_no
WHERE de.to_date = '9999-01-01'
GROUP BY d.dept_no

/* 7. Which department has the highest average salary? Hint: Use current not historic information.*/
USE employees;

SELECT d.dept_name,
ROUND(AVG(salary), 2) as average_salary
FROM dept_emp de
JOIN salaries s ON de.emp_no = s.emp_no
	AND de.to_date > CURDATE()
    and s.to_date > CURDATE()
JOIN departments d on de.dept_no = d.dept_no
GROUP BY d.dept_name
ORDER BY average_salary DESC
LIMIT 1;

/*8. Who is the highest paid employee in the Marketing department?*/

USE employees;

SELECT e.first_name,
	e.last_name
FROM employees AS e
JOIN dept_emp AS de ON e.emp_no = de.emp_no
	AND de.to_date > CURDATE()
JOIN salaries AS s on e.emp_no = s.emp_no
	AND s.to_date > CURDATE()
JOIN departments AS d on de.dept_no = d.dept_no
	AND d.dept_name = 'Marketing'
ORDER BY s.salary DESC
LIMIT 1;

/* 9. Which current department manager has the highest salary?*/
USE employees;

SELECT e.first_name,
	e.last_name,
    s.salary,
    d.dept_name
FROM employees AS e
JOIN dept_manager AS dm on e.emp_no = dm.emp_no
	AND dm.to_date > CURDATE()
JOIN salaries AS s on e.emp_no = s.emp_no
	AND s.to_date > CURDATE()
JOIN departments AS d on dm.dept_no = d.dept_no
ORDER BY s.salary DESC
LIMIT 1;

/* 10. Determine the average salary for each department. Use all salary information and round your results. */
USE employees;

SELECT d.dept_name,
	ROUND(AVG(s.salary), 0) AS average_salary
FROM departments AS d
JOIN dept_emp as de on d.dept_no = de.dept_no
JOIN salaries AS s on de.emp_no = s.emp_no
GROUP BY d.dept_name 
ORDER BY average_salary DESC;

/* 11. Bonus Find the names of all current employees, their department name, and their current manager's name.


240,124 Rows

Employee Name | Department Name  |  Manager Name
--------------|------------------|-----------------
 Huan Lortz   | Customer Service | Yuchang Weedman

 ..... */

/* 12. Bonus Who is the highest paid employee within each department./*