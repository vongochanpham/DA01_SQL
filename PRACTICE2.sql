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


