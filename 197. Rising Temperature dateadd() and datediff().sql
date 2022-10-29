SQL Schema
Table: Weather

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
id is the primary key for this table.
This table contains information about the temperature on a certain day.
 

Write an SQL query to find all dates' Id with higher temperatures compared to its previous dates (yesterday).

Return the result table in any order.

The query result format is in the following example.

 

Example 1:

Input: 
Weather table:
+----+------------+-------------+
| id | recordDate | temperature |
+----+------------+-------------+
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |
+----+------------+-------------+
Output: 
+----+
| id |
+----+
| 2  |
| 4  |
+----+
Explanation: 
In 2015-01-02, the temperature was higher than the previous day (10 -> 25).
In 2015-01-04, the temperature was higher than the previous day (20 -> 30).







solution:


with cte as(
select *, 
    lag(Temperature, 1, NULL) over (order by recordDate) as prev_temp, 
    lag(recordDate, 1, NULL) over (order by recordDate) as prev_date
from Weather 
)

SELECT id AS id
FROM cte
where Temperature > prev_temp
and datediff(day, prev_date, recordDate ) = 1

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

select a.id
from weather a
join weather b
on a.recordDate = DATEADD(day,1,b.recordDate)


where a.temperature > b.temperature

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

select w1.id
from weather as w1
inner join weather as w2
on datediff(day, w2.recordDate, w1.recordDate) = 1
and w1.temperature > w2.temperature 
