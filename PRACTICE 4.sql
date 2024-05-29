--ex1: datalemur-laptop-mobile-viewership.
SELECT 
    (SELECT COUNT(*) FROM VIEWERSHIP WHERE device_type = 'laptop') AS laptop_views,
    (SELECT COUNT(*) FROM VIEWERSHIP WHERE device_type IN ('tablet', 'phone')) AS mobile_views;
--ex2: datalemur-triangle-judgement.
SELECT  x, y, z, 
CASE WHEN x + y > z AND x + z > y AND y + z > x THEN 'Yes'
ELSE 'No'
END AS triangle
FROM Triangle;
--ex3: datalemur-uncategorized-calls-percentage.
SELECT ROUND(100.0 * COUNT(*) FILTER(WHERE call_category IS NULL OR call_category = 'n/a')
/ COUNT(*),1) AS uncategorised_call_pct 
FROM callers;
--ex4: datalemur-find-customer-referee.
select name from customer
where referee_id !=2 or referee_id is null;
--ex5: stratascratch the-number-of-survivors.
select survived,
sum(case when pclass=1 then 1 else 0 end) as first_class,
sum(case when pclass=2 then 1 else 0 end) as second_class,
sum(case when pclass=3 then 1 else 0 end) as third_class
from titanic
group by survived
