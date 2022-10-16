--excercise 1:

/*ROW_NUMBER function is a SQL ranking function that assigns a sequential rank number to each new record in a partition. When the SQL Server ROW NUMBER function detects two identical values in the same partition, 
it assigns different rank numbers to both.*/

select 
ProductName = A.Name,
A.listprice,
ProductSubCategory = B.Name,
ProductCategory = C.Name,
[Price Rank] = ROW_NUMBER() OVER(ORDER BY A.listprice DESC),
[Category Price Rank] = ROW_NUMBER() OVER(PARTITION BY c.name order by A.listprice  desc),
[top 5 category] = 
CASE 
WHEN 
ROW_NUMBER() OVER(PARTITION BY c.name order by A.listprice  desc)<=5 THEN 'YES'
else
'NO'
end


from Production.product A 
join Production.productsubcategory B 
on A.ProductSubcategoryID = B.ProductSubcategoryID
join Production.ProductCategory C
on B.ProductCategoryID = C.ProductCategoryID


--Syntax
--SUBSTRING(string, start, length)
--Parameter Values
--Parameter	Description
--string	Required. The string to extract from
--start	Required. The start position. The first position in string is 1
--length	Required. The number of characters to extract. Must be a positive number
--Definition and Usage
--The CONCAT() function adds two or more strings together.

--Note: See also Concat with the + operator and CONCAT_WS().

--Syntax
--CONCAT(string1, string2, ...., string_n)
--Parameter Values
--Parameter	Description
--string1, string2, string_n	Required. The strings to add together

select user_id , CONCAT(upper(SUBSTRING(name,1,1),lower(substring(name,2,9)) as name from users  order by user_id

--Group Sold Products By The Date

select sell_date , count(distinct (product)) as num_sold , group_concat(distinct product order by product asc separator ',') as products from activities group by sell_date order by sell_date asc


1965. Employees With Missing Information
Easy

356

24

Add to List

Share
SQL Schema
Table: Employees

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| employee_id | int     |
| name        | varchar |
+-------------+---------+
employee_id is the primary key for this table.
Each row of this table indicates the name of the employee whose ID is employee_id.
 

Table: Salaries

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| employee_id | int     |
| salary      | int     |
+-------------+---------+
employee_id is the primary key for this table.
Each row of this table indicates the salary of the employee whose ID is employee_id.
 

Write an SQL query to report the IDs of all the employees with missing information. The information of an employee is missing if:

The employee's name is missing, or
The employee's salary is missing.
Return the result table ordered by employee_id in ascending order.
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--The query result format is in the following example.

 

--Example 1:

--Input: 
--Employees table:
--+-------------+----------+
--| employee_id | name     |
--+-------------+----------+
--| 2           | Crew     |
--| 4           | Haven    |
--| 5           | Kristian |
--+-------------+----------+
--Salaries table:
--+-------------+--------+
--| employee_id | salary |
--+-------------+--------+
--| 5           | 76071  |
--| 1           | 22517  |
--| 4           | 63539  |
--+-------------+--------+
--Output: 
--+-------------+
--| employee_id |
--+-------------+
--| 1           |
--| 2           |
--+-------------+
--Explanation: 
--Employees 1, 2, 4, and 5 are working at this company.
--The name of employee 1 is missing.
--The salary of employee 2 is missing.



SELECT employee_id FROM Employees WHERE employee_id NOT IN (SELECT employee_id FROM Salaries)
UNION 
SELECT employee_id FROM Salaries WHERE employee_id NOT IN (SELECT employee_id FROM Employees)

ORDER BY employee_id ASC
------------------------------------------------------------------------------------------------
SELECT 
    Employees.employee_id 
FROM 
    Employees LEFT JOIN Salaries 
ON 
    Employees.employee_id = Salaries.employee_id 
WHERE 
    Salaries.employee_id IS NULL 
UNION 
SELECT 
    Salaries.employee_id 
FROM 
    Salaries LEFT JOIN Employees 
ON 
    Employees.employee_id = Salaries.employee_id 
WHERE 
    Employees.employee_id IS NULL) 
ORDER BY 
    employee_id;