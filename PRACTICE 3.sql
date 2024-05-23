-- ex1: hackerrank-more-than-75-marks.
select name from students 
where Marks > 75
ORDER BY RIGHT(NAME, 3) , ID ASC
-- ex2: leetcode-fix-names-in-a-table.
SELECT USER_ID, CONCAT(UPPER(LEFT(NAME, 1)), LOWER(SUBSTRING(NAME FROM 2))) AS name
FROM USERS
ORDER BY USER_ID;
--ex3: datalemur-total-drugs-sales.
SELECT MANUFACTURER, 
CONCAT('$', ROUND(SUM(TOTAL_SALES)/1000000), ' million') AS SALES
FROM pharmacy_sales
group by manufacturer
order by ROUND(SUM(TOTAL_SALES)) desc, MANUFACTURER asc;
--ex4: avg-review-ratings.
SELECT EXTRACT(MONTH FROM submit_date) AS MTH,
PRODUCT_ID,
ROUND(AVG(stars),2) AS AVG_STARS
FROM reviews
GROUP BY EXTRACT(MONTH FROM submit_date), product_id
ORDER BY EXTRACT(MONTH FROM submit_date), product_id
--ex5: teams-power-users.
SELECT sender_id,
COUNT(content) AS MESSAGE_COUNT
FROM messages
WHERE sent_date BETWEEN '2022-08-01' AND '2022-09-01'
GROUP BY sender_id 
ORDER BY MESSAGE_COUNT DESC
LIMIT 2
--ex6: invalid-tweets.
SELECT tweet_id
FROM Tweets
WHERE CHAR_LENGTH(content) > 15 
group by tweet_id
--ex7: user-activity-for-the-past-30-days.
SELECT activity_date AS day,
COUNT(distinct user_id) as active_users
FROM Activity
group by activity_date
having activity_date between "2019-06-28" and "2019-07-27";
--ex8: number-of-hires-during-specific-time-period.
select id as the_number_of_employees_hired
from employees
where joining_date between '2022-01-01' and '2022-07-31'
--ex9: positions-of-letter-a.
select position('a' IN first_name) AS position_a
from worker
where first_name = 'Amitah';
--ex10: macedonian-vintages.
select SUBSTRING(TITLE,LENGTH(WINERY)+2,4)
from winemag_p2
WHERE COUNTRY = 'Macedonia'
