--ex1: datalemur-duplicate-job-listings.
SELECT COUNT(*) AS duplicate_companies 
FROM
(SELECT company_id,
COUNT(description) FROM 
job_listings 
GROUP BY company_id
HAVING COUNT(description) > 1) AS dupes;

--ex2: datalemur-highest-grossing.
WITH RankedProducts AS (
    SELECT
        category,
        product,
        SUM(spend) AS total_spend,
        RANK() OVER (PARTITION BY category ORDER BY SUM(spend) DESC) AS "rank"
    FROM
        product_spend
    WHERE
        EXTRACT(YEAR FROM transaction_date) = 2022
    GROUP BY
        category, product
)
SELECT
    category,
    product,
    total_spend
FROM
    RankedProducts
WHERE
    "rank" <= 2
ORDER BY
    category, total_spend DESC;
--ex3: datalemur-frequent-callers.
with call_records as (SELECT
  policy_holder_id,
  COUNT(case_id) AS call_count
FROM callers
GROUP BY policy_holder_id
HAVING COUNT(case_id) >= 3)

select count(policy_holder_id) as policy_holder_count
from call_records;

--ex4: datalemur-page-with-no-likes.
SELECT p.page_id
FROM pages p
LEFT JOIN page_likes pl ON p.page_id = pl.page_id
WHERE pl.page_id IS NULL
ORDER BY p.page_id ASC;

--ex5: datalemur-user-retention.
with cte as (
SELECT DISTINCT user_id FROM user_actions
where extract(month from event_date)=7
and extract(year from event_date) = 2022
intersect
SELECT DISTINCT user_id FROM user_actions
where extract(month from event_date)=6
and extract(year from event_date) = 2022)
select '7' as month, count(user_id) as monthly_active_users
from cte;

--ex6: leetcode-monthly-transactions.
SELECT DATE_FORMAT(trans_date, "%Y-%m") as month, 
country, count(id) as trans_count, 
count(if(state = 'approved', 1, null)) as approved_count, 
sum(amount) as trans_total_amount, 
sum(if(state = 'approved', amount, 0)) as approved_total_amount
FROM Transactions
group by country, month
    
--ex7: leetcode-product-sales-analysis.
SELECT product_id, year AS first_year, quantity, price 
FROM sales
WHERE (product_id, year) IN (
    SELECT product_id, MIN(year) 
    FROM sales 
    GROUP BY product_id
);

--ex8: leetcode-customers-who-bought-all-products.
SELECT  customer_id FROM Customer GROUP BY customer_id
HAVING COUNT(distinct product_key) = (SELECT COUNT(product_key) FROM Product)

--ex9: leetcode-employees-whose-manager-left-the-company.
select employee_id from Employees
where salary < 30000
and manager_id not in (select employee_id from Employees) 
order by employee_id;
     
--ex10: leetcode-primary-department-for-each-employee.
SELECT count(*) as duplicate_companies
FROM (
    SELECT company_id, count(description) FROM job_listings
    GROUP BY company_id
    HAVING count(description) > 1) as dupes;

--ex11: leetcode-movie-rating.
(SELECT name AS results
FROM MovieRating JOIN Users USING(user_id)
GROUP BY name
ORDER BY COUNT(*) DESC, name
LIMIT 1)

UNION ALL

(SELECT title AS results
FROM MovieRating JOIN Movies USING(movie_id)
WHERE EXTRACT(YEAR_MONTH FROM created_at) = 202002
GROUP BY title
ORDER BY AVG(rating) DESC, title
LIMIT 1);

--ex12: leetcode-who-has-the-most-friends.
select id, count(*) as num from(
select accepter_id as id from requestaccepted 
union all select requester_id from requestaccepted
) as friends_count
group by id 
 order by num desc limit 1
--or
with cte as (
    select requester_id as id from RequestAccepted
    UNION ALL
    select accepter_id as id from RequestAccepted)
select id, count(*) as num from cte 
GROUP BY id
order by num desc
limit 1

