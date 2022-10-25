SQL Schema
Table: ActorDirector

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| actor_id    | int     |
| director_id | int     |
| timestamp   | int     |
+-------------+---------+
timestamp is the primary key column for this table.
 

Write a SQL query for a report that provides the pairs (actor_id, director_id) where the actor has cooperated with the director at least three times.

Return the result table in any order.

The query result format is in the following example.

 

Example 1:

Input: 
ActorDirector table:
+-------------+-------------+-------------+
| actor_id    | director_id | timestamp   |
+-------------+-------------+-------------+
| 1           | 1           | 0           |
| 1           | 1           | 1           |
| 1           | 1           | 2           |
| 1           | 2           | 3           |
| 1           | 2           | 4           |
| 2           | 1           | 5           |
| 2           | 1           | 6           |
+-------------+-------------+-------------+
Output: 
+-------------+-------------+
| actor_id    | director_id |
+-------------+-------------+
| 1           | 1           |
+-------------+-------------+
Explanation: The only pair is (1, 1) where they cooperated exactly 3 times.















1)

WITH A AS (
SELECT actor_id,director_id
,ROW_NUMBER()OVER(PARTITION BY actor_id,director_id ORDER BY timestamp) AS RN
FROM ActorDirector
    )
    SELECT DISTINCT actor_id,director_id
    FROM A WHERE RN >=3
    
2)

with cte as (
select actor_id, director_id, rank () over (Partition by director_id, actor_id order by timestamp) as rank from actordirector)

SELECT actor_id, Director_id from cte where rank = 3


3)

select actor_id, director_id 
from ActorDirector
group by actor_id, director_id 
having count(*) >= 3
    
  
