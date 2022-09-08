-- 2.  Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. 
-- In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
USE employees;

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name ASC
-- 1st row is Irena Reutenauer
-- Last row is Vidya Simmen

-- 3.  Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. 
-- In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
USE employees;

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name ASC, last_name ASC
--  1st row is Irena Acton 
-- Last row is Vidya Zweizig

-- 4.  Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. 
-- In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
USE employees;

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name ASC, first_name ASC
-- 1st row Irena Acton
-- Last row is Maya Zyda

-- 5. Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. 
-- Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.
USE employees;

SELECT *
FROM employees
WHERE last_name LIKE 'e%e'
ORDER BY emp_no ASC
-- number returned 899
-- 1st employee '10021','Ramzi','Erde'
-- Last employee '499648' 'Tadahiro', 'Erde',

-- 6. Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first.
--  Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest employee.
USE employees;

SELECT *
FROM employees
WHERE last_name LIKE 'e%e'
ORDER BY hire_date DESC
--  899 returned
-- '67892', '1958-08-15', 'Teiji', 'Eldridge', 'M', '1999-11-27'
-- '233488', '1961-12-16', 'Sergi', 'Erde', 'F', '1985-02-02'

-- 7. Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. 
-- Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest employee who was hired first.
USE employees;

SELECT *
FROM employees
WHERE birth_date like '19%%-12-25'
	AND hire_date like '199%-%%-%%'
ORDER BY hire_date DESC
-- 362 returned
-- '33936','1952-12-25','Khun','Bernini','M','1999-08-31'
-- '243297', '1962-12-25', 'Alselm', 'Cappello', 'F', '1990-01-01'
