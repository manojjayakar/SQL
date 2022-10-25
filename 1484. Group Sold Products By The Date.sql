SQL Schema
Table Activities:

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| sell_date   | date    |
| product     | varchar |
+-------------+---------+
There is no primary key for this table, it may contain duplicates.
Each row of this table contains the product name and the date it was sold in a market.
 

Write an SQL query to find for each date the number of different products sold and their names.

The sold products names for each date should be sorted lexicographically.

Return the result table ordered by sell_date.

The query result format is in the following example.

 

Example 1:

Input: 
Activities table:
+------------+------------+
| sell_date  | product     |
+------------+------------+
| 2020-05-30 | Headphone  |
| 2020-06-01 | Pencil     |
| 2020-06-02 | Mask       |
| 2020-05-30 | Basketball |
| 2020-06-01 | Bible      |
| 2020-06-02 | Mask       |
| 2020-05-30 | T-Shirt    |
+------------+------------+
Output: 
+------------+----------+------------------------------+
| sell_date  | num_sold | products                     |
+------------+----------+------------------------------+
| 2020-05-30 | 3        | Basketball,Headphone,T-shirt |
| 2020-06-01 | 2        | Bible,Pencil                 |
| 2020-06-02 | 1        | Mask                         |
+------------+----------+------------------------------+
Explanation: 
For 2020-05-30, Sold items were (Headphone, Basketball, T-shirt), we sort them lexicographically and separate them by a comma.
For 2020-06-01, Sold items were (Pencil, Bible), we sort them lexicographically and separate them by a comma.
For 2020-06-02, the Sold item is (Mask), we just return it.

Syntax of STRING_AGG function in SQL
The syntax of the STRING_AGG function looks like below:

STRING_AGG ( expression, separator ) [ &lt;order_clause&gt; ]
The expression parameter specifies any expressions that will be concatenated. The separator parameter is used to separate expressions that will be concatenated. The order_clause parameter is an optional parameter and helps to order the concatenated expression and it must be used with WITHIN GROUP statement.

Sorting result of STRING_AGG function in SQL
STRING_AGG function allows sorting concatenated expressions in descending or ascending order. In this example, we will sort the concatenated expressions according to the FirstName column rows expression with the WITHIN GROUP statement:

SELECT FirstName FROM [PersonTestTable] ORDER BY FirstName ASC
GO
SELECT STRING_AGG(FirstName,'-')  WITHIN GROUP ( ORDER BY FirstName ASC)  AS Result FROM [PersonTestTable]
STRING_AGG function usage with WITHIN GROUP statement
As we can see clearly the STRING_AGG function sorted the concatenated expressions in the ascending order according to row values of the FirstName column. We need to underline one point about this type of usages. The GROUP BY clause will be necessary if the STRING_AGG result is not a sole column in the result set of the query. In the next section, we will learn this concept.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


select sell_date, count(product) as num_sold, string_agg(product,',') within group (order by product) as products
from (select distinct product,sell_date from Activities) temp
group by temp.sell_date
order by temp.sell_date;




2)
select sell_date, 
    COUNT(product) as num_sold,
    STRING_AGG(product,',') WITHIN GROUP (ORDER BY product) as products from
    (select distinct sell_date,product FROM Activities) Act
    GROUP BY sell_date
