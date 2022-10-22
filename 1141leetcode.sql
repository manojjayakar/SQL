--Definition and Usage
--The DATEDIFF() function returns the difference between two dates.

--Syntax
--DATEDIFF(interval, date1, date2)
--Parameter Values
--Parameter	Description
--interval	Required. The part to return. Can be one of the following values:
--year, yyyy, yy = Year
--quarter, qq, q = Quarter
--month, mm, m = month
--dayofyear = Day of the year
--day, dy, y = Day
--week, ww, wk = Week
--weekday, dw, w = Weekday
--hour, hh = hour
--minute, mi, n = Minute
--second, ss, s = Second
--millisecond, ms = Millisecond
--date1, date2	Required. The two dates to calculate the difference between
--Technical Details
--Works in:	SQL Server (starting with 2008), Azure SQL Database, Azure SQL Data Warehouse, Parallel Data Warehouse


--1141. User Activity for the Past 30 Days I
--Easy

--226

--351

--Add to List

--Share
--SQL Schema
--Table: Activity

--+---------------+---------+
--| Column Name   | Type    |
--+---------------+---------+
--| user_id       | int     |
--| session_id    | int     |
--| activity_date | date    |
--| activity_type | enum    |
--+---------------+---------+
--There is no primary key for this table, it may have duplicate rows.
--The activity_type column is an ENUM of type ('open_session', 'end_session', 'scroll_down', 'send_message').
--The table shows the user activities for a social media website. 
--Note that each session belongs to exactly one user.
 

--Write an SQL query to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. A user was active on someday if they made at least one activity on that day.

--Return the result table in any order.

--The query result format is in the following example.

 

--Example 1:

--Input: 
--Activity table:
--+---------+------------+---------------+---------------+
--| user_id | session_id | activity_date | activity_type |
--+---------+------------+---------------+---------------+
--| 1       | 1          | 2019-07-20    | open_session  |
--| 1       | 1          | 2019-07-20    | scroll_down   |
--| 1       | 1          | 2019-07-20    | end_session   |
--| 2       | 4          | 2019-07-20    | open_session  |
--| 2       | 4          | 2019-07-21    | send_message  |
--| 2       | 4          | 2019-07-21    | end_session   |
--| 3       | 2          | 2019-07-21    | open_session  |
--| 3       | 2          | 2019-07-21    | send_message  |
--| 3       | 2          | 2019-07-21    | end_session   |
--| 4       | 3          | 2019-06-25    | open_session  |
--| 4       | 3          | 2019-06-25    | end_session   |
--+---------+------------+---------------+---------------+
--Output: 
--+------------+--------------+ 
--| day        | active_users |
--+------------+--------------+ 
--| 2019-07-20 | 2            |
--| 2019-07-21 | 2            |
--+------------+--------------+ 
--Explanation: Note that we do not care about days with zero active users.




SELECT
    activity_date [day],
    COUNT(DISTINCT user_id) [active_users]
FROM
    Activity
WHERE
    DATEDIFF(day, activity_date, '2019-07-27') < 30
    AND DATEDIFF(day, activity_date, '2019-07-27') > 0
GROUP BY
    activity_date
ORDER BY
    activity_date