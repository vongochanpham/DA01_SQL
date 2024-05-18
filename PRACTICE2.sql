--ex1: hackerrank-weather-observation-station-3.
SELECT DISTINCT CITY 
FROM STATION
WHERE ID % 2 = 0;
--ex2: hackerrank-weather-observation-station-4.
SELECT COUNT(CITY) - COUNT(DISTINCT CITY) FROM STATION
--ex3: hackerrank-the-blunder.
SELECT CEIL( AVG(Salary) - AVG(REPLACE(Salary, '0', '')) ) FROM EMPLOYEES;
--ex4: datalemur-alibaba-compressed-mean.
SELECT
ROUND(CAST(sum(item_count * order_occurrences) / sum(order_occurrences) AS DECIMAL), 1) AS mean
from items_per_order
--ex5: datalemur-matching-skills.
SELECT DISTINCT CANDIDATE_ID 
FROM candidates
WHERE skill IN ('Python','Tableau','PostgreSQL')
GROUP BY CANDIDATE_ID
HAVING COUNT(skill)=3
ORDER BY CANDIDATE_ID ASC ;
--ex6: datalemur-verage-post-hiatus-1.
SELECT user_id ,
DATE(MAX(post_date)) - DATE(MIN(post_date)) AS days_between 
FROM POSTS
WHERE post_date >= '2021-01-21' AND post_date < '2022_01-01'
group by user_id
HAVING COUNT(POST_ID) > 1
--ex7: datalemur-cards-issued-difference.
SELECT card_name,
MAX(issued_amount) - MIN(issued_amount) as different_amount
FROM monthly_cards_issued
GROUP BY card_name
ORDER BY different_amount DESC
--ex8: datalemur-non-profitable-drugs.
SELECT MANUFACTURER, 
COUNT(DRUG) AS DRUG_COUNT,
SUM(cogs) - SUM(total_sales) AS TOTAL_LOSS
FROM pharmacy_sales
WHERE total_sales - cogs <= 0
GROUP BY MANUFACTURER
ORDER BY total_loss DESC
--ex9: leetcode-not-boring-movies.
select * from cinema
WHERE ID%2 != 0 AND description <> 'boring'
ORDER BY rating DESC
--ex10: leetcode-number-of-unique-subject.
SELECT teacher_id,
COUNT(DISTINCT subject_id) AS cnt
from teacher
GROUP BY teacher_id;
--ex11: leetcode-find-followers-count.
Select user_id ,
count(user_id) as followers_count
from Followers
group by user_id
order by user_id
--ex12:leetcode-classes-more-than-5-students.
select class from courses
GROUP BY CLASS
HAVING COUNT(CLASS) >= 5;



