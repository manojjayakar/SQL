--176. Second Highest Salary
--Medium

--2385

--779

--Add to List

--Share
--SQL Schema
--Table: Employee

--+-------------+------+
--| Column Name | Type |
--+-------------+------+
--| id          | int  |
--| salary      | int  |
--+-------------+------+
--id is the primary key column for this table.
--Each row of this table contains information about the salary of an employee.
 

--Write an SQL query to report the second highest salary from the Employee table. If there is no second highest salary, the query should report null.

--The query result format is in the following example.

 

--Example 1:

--Input: 
--Employee table:
--+----+--------+
--| id | salary |
--+----+--------+
--| 1  | 100    |
--| 2  | 200    |
--| 3  | 300    |
--+----+--------+
--Output: 
--+---------------------+
--| SecondHighestSalary |
--+---------------------+
--| 200                 |
--+---------------------+
--Example 2:

--Input: 
--Employee table:
--+----+--------+
--| id | salary |
--+----+--------+
--| 1  | 100    |
--+----+--------+
--Output: 
--+---------------------+
--| SecondHighestSalary |
--+---------------------+
--| null                |
--+---------------------+


--Definition and Usage
--The IFNULL() function returns a specified value if the expression is NULL.

--If the expression is NOT NULL, this function returns the expression.

--Syntax
--IFNULL(expression, alt_value)
--Parameter Values
--Parameter	Description
--expression	Required. The expression to test whether is NULL
--alt_value	Required. The value to return if expression is NULL

https://www.sqlservertutorial.net/sql-server-basics/sql-server-offset-fetch/

SELECT (SELECT DISTINCT Salary
    FROM Employee
    ORDER BY Salary DESC  OFFSET
1 rows fetch first 1 rows only) AS SecondHighestSalary;   

--fetch offset limit my sql and ms sql differs --- https://www.geeksforgeeks.org/offset-fetch-in-ms-sql-server/

--my sql
SELECT (SELECT DISTINCT Salary
    FROM Employee
    ORDER BY Salary DESC LIMIT 1 OFFSET
1) AS SecondHighestSalary;