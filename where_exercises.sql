Create a file named where_exercises.sql. Make sure to use the employees database.

-- 2. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned.
USE employees;

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
-- 709 rows returned

-- 3. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. 
-- Enter a comment with the number of records returned. Does it match number of rows from Q2?
USE employees;

SELECT *
FROM employees
WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya'
-- Returned 709. Yes

-- 4. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned.
USE employees;

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
	AND gender = "M"
-- 441 rows returned

-- 5. Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E.
USE employees;

SELECT *
FROM employees
WHERE last_name LIKE 'E%';
-- 7330 rows returned

-- 6. Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. 
-- How many employees have a last name that ends with E, but does not start with E?
USE employees;

SELECT *
FROM employees
WHERE last_name LIKE 'E%' OR last_name LIKE '%e';
-- 30723 begine or end with e.

USE employees;

SELECT *
FROM employees
WHERE last_name LIKE '%e'
    AND last_name NOT LIKE 'e%';
--  23393  ending in e, but not starting with e

-- 7. Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. 
-- How many employees' last names end with E, regardless of whether they start with E?
USE employees;

SELECT *
FROM employees
WHERE last_name LIKE 'e%e'
-- return 899 rows

USE employees;

SELECT *
FROM employees
WHERE last_name LIKE '%e'
-- returned 24292 rows

-- 8. Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.
USE employees;

SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';
-- returned 135214 rows

-- 9. Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.
USE employees;

SELECT *
FROM employees
WHERE birth_date like '19%%-12-25';
-- returned 842 rows

-- 10. Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.
USE employees;

SELECT *
FROM employees
WHERE birth_date like '19%%-12-25'
	AND hire_date like '199%'
-- 362 rows returned

-- 11. Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.
USE employees;

SELECT *
FROM employees
WHERE last_name LIKE '%q%'
-- returned 1873 rows

-- 12. Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?
USE employees;

SELECT *
FROM employees
WHERE last_name LIKE '%q%' 
	AND last_name NOT LIKE '%qu%';
-- returned 547