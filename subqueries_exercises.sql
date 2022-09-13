/*Create a file named subqueries_exercises.sql and craft queries to return the results 
for the following criteria:
1. Find all the current employees with the same hire date as employee 101010 using a sub-query.*/
USE employees;

SELECT hire_date
FROM employees
WHERE emp_no = '101010';

SELECT *
FROM employees AS e
JOIN dept_emp AS de on e.emp_no = de.emp_no
WHERE to_date > CURDATE()
AND hire_date = (
					SELECT hire_date
					FROM employees
					WHERE emp_no = '101010'
					);



/*2. Find all the titles ever held by all current employees with the first name Aamod.*/

USE employees;

SELECT first_name
FROM employees
WHERE first_name = 'Aamod';

SELECT DISTINCT title
FROM titles AS t
JOIN employees as e on e.emp_no = t.emp_no
WHERE to_date > CURDATE()
AND first_name IN (
					SELECT first_name
					FROM employees AS e
					WHERE first_name = 'Aamod'
				);

/*3. How many people in the employees table are no longer working for the company? 
Give the answer in a comment in your code.*/
USE employees;

SELECT COUNT(*)
FROM employees AS e
WHERE emp_no IN (
					SELECT emp_no
                    FROM dept_emp
                    WHERE to_date < CURDATE()
				)
/* 85108*/

/*4. Find all the current department managers that are female. 
List their names in a comment in your code.*/

USE employees;

SELECT *
FROM employees AS e
WHERE emp_no IN (
				SELECT emp_no
				FROM dept_manager
				WHERE to_date > CURDATE()
                )
AND gender = 'F'

/*5. Find all the employees who currently have a higher salary than the companies overall, 
historical average salary.*/
USE employees;

SELECT AVG(salary) AS 'Historical Average'
 FROM salaries;

SELECT CONCAT(e.first_name, ' ', e. last_name)
FROM employees AS e
JOIN salaries AS s ON e.emp_no = s.emp_no
WHERE s.to_date > CURDATE()
AND salary > (
				SELECT AVG(salary) AS 'Historical Average'
				FROM salaries
			)

/*6. How many current salaries are within 1 standard deviation of the current highest salary? 
(Hint: you can use a built in function to calculate the standard deviation.) 
What percentage of all salaries is this?
Hint You will likely use multiple subqueries in a variety of ways
Hint It's a good practice to write out all of the small queries that you can. 
Add a comment above the query showing the number of rows returned. 
You will use this number (or the query that produced it) in other, larger queries.*/


/*BONUS
1. Find all the department names that currently have female managers.*/
/*2. Find the first and last name of the employee with the highest salary.*/
/*3. Find the department name that the employee with the highest salary works in.*/