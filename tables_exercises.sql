-- 4. List all the tables in the database. Write the SQL code necessary to accomplish this.
-- USE employees;
-- SHOW TABLES;
-- 5. Explore the employees table. What different data types are present on this table?
-- SHOW TABLES;
-- DESCRIBE employees;
-- 6. Which table(s) do you think contain a numeric type column? (Write this question and your answer in a comment)
--  salaries
-- 7. Which table(s) do you think contain a string type column? (Write this question and your answer in a comment)
-- titles
-- 8. Which table(s) do you think contain a date type column? (Write this question and your answer in a comment)
-- employees
-- 9. What is the relationship between the employees and the departments tables? (Write this question and your answer in a comment)
-- The employees table has the following info: emp_no, birth_date, first_name, last_name, gender, and hire date.  The departments table has the following info: dept_no and dept_name.  They have nothing in common, but the dept_emp table is how they are related because it uses both emp_no and dept_no.   
-- 10. Show the SQL that created the dept_manager table. Write the SQL it takes to show this as your exercise solution.
-- SHOW CREATE TABLE dept_manager;