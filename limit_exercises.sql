-- 2. MySQL provides a way to return only unique results from our queries with the keyword DISTINCT. 
-- For example, to find all the unique titles within the company, we could run the following query:
-- SELECT DISTINCT title FROM titles;
-- List the first 10 distinct last name sorted in descending order.
USE employees;

SELECT DISTINCT last_name FROM employees
ORDER BY last_name DESC
-- 'Zykh','Zyda' 'Zwicker''Zweizig''Zumaque''Zultner''Zucker''Zuberek''Zschoche''Zongker'

-- 3. Find all previous or current employees hired in the 90s and born on Christmas. 
-- Find the first 5 employees hired in the 90's by sorting by hire date and limiting your results to the first 5 records. 
-- Write a comment in your code that lists the five names of the employees returned.
USE employees;

SELECT *
FROM employees
WHERE birth_date like '19%%-12-25'
	AND hire_date like '199%-%%-%%'
ORDER BY hire_date
LIMIT 5

/* '243297','1962-12-25','Alselm','Cappello','F','1990-01-01'
'34335','1960-12-25','Utz','Mandell','M','1990-01-03'
'400710','1963-12-25','Bouchung','Schreiter','M','1990-01-04'
'465730','1959-12-25','Baocai','Kushner','F','1990-01-05'
'490744','1959-12-25','Petter','Stroustrup','M','1990-01-10'*/

-- 4.  Try to think of your results as batches, sets, or pages. The first five results are your first page. 
-- The five after that would be your second page, etc. 
-- Update the query to find the tenth page of results.
-- LIMIT and OFFSET can be used to create multiple pages of data. What is the relationship between OFFSET 
-- (number of results to skip), LIMIT (number of results per page), and the page number?
SELECT *
FROM employees
WHERE birth_date like '19%%-12-25'
	AND hire_date like '199%-%%-%%'
ORDER BY hire_date
LIMIT 5 OFFSET 50
/*'231580','1957-12-25','Christophe','Baca','F','1990-08-11'
'275621','1961-12-25','Moie','Birsak','M','1990-08-11'
'494492','1957-12-25','Chikako','Ibel','F','1990-08-12'
'48396','1955-12-25','Shounak','Jansen','M','1990-08-13'
'17351','1961-12-25','Zhigen','Boissier','M','1990-08-18' */

-- The relationship is page 1 = 1-5 results, 2=6-10, 3=11-15, 4= 16-20, 5= 21-25, 6= 26-30, 7= 31-35, 8= 36-40, 9= 41-45, 10= 46-50
