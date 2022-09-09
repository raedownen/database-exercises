-- 2.  Write a query to to find all employees whose last name starts and ends with 'E'. 
-- Use concat() to combine their first and last name together as a single column named full_name.
USE employees;

SELECT CONCAT(first_name, ' ',last_name) AS full_name
FROM employees
WHERE last_name LIKE 'e%e'


-- 3. Convert the names produced in your last query to all uppercase.
USE employees;

SELECT CONCAT(UPPER(first_name), ' ',UPPER(last_name)) AS full_name
FROM employees
WHERE last_name LIKE 'e%e'


-- 4. Find all employees hired in the 90s and born on Christmas. Use datediff() function
-- to find how many days they have been working at the company (Hint: You will also need to use NOW() 
-- or CURDATE()),
USE employees;

SELECT DATEDIFF(CURDATE(), hire_date)
FROM employees
WHERE birth_date like '19%%-12-25'
	AND hire_date like '199%-%%-%%'


-- 5.  Find the smallest and largest current salary from the salaries table.
USE employees;

SELECT MIN(salary),
	MAX(salary)
FROM salaries
WHERE to_date > CURDATE();
-- min'38623',  max'158220'


-- 6. Use your knowledge of built in SQL functions to generate a username for all of the employees. 
-- A username should be all lowercase, and consist of the first character of the employees first name, 
-- the first 4 characters of the employees last name, an underscore, the month the employee was born, 
-- and the last two digits of the year that they were born.
USE employees;

SELECT first_name,
	last_name,
	birth_date,
	LOWER(
		CONCAT(
			SUBSTR(first_name, 1, 1),
			SUBSTR(last_name, 1, 4),
            '_',
            SUBSTR(birth_date, 6, 2),
            SUBSTR(birth_date, 3, 2)
		)
	) AS username
    FROM employees