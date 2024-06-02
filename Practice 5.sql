--ex1: hackerrank-average-population-of-each-continent.
SELECT 
    COUNTRY.Continent,
    FLOOR(AVG(CITY.Population)) AS AverageCityPopulation
FROM 
    CITY
JOIN 
    COUNTRY
ON 
    CITY.CountryCode = COUNTRY.Code
GROUP BY 
    COUNTRY.Continent;
--ex2: datalemur-signup-confirmation-rate.
SELECT 
    ROUND(
        (COUNT(DISTINCT CASE WHEN t.signup_action = 'Confirmed' THEN e.email_id END) * 1.0 / COUNT(DISTINCT e.email_id)), 
        2
    ) AS confirm_rate
FROM 
    emails e
LEFT JOIN 
    texts t
ON 
    e.email_id = t.email_id;
--ex3: datalemur-time-spent-snaps.
SELECT 
  age.age_bucket, 
    round((SUM(activities.time_spent) FILTER (WHERE activities.activity_type = 'send')/
      SUM(activities.time_spent))*100.0,2) AS send_perc, 
    round((SUM(activities.time_spent) FILTER (WHERE activities.activity_type = 'open')/
      SUM(activities.time_spent))*100.0,2) AS open_perc
FROM activities
INNER JOIN age_breakdown AS age 
  ON activities.user_id = age.user_id 
WHERE activities.activity_type IN ('send', 'open') 
GROUP BY age.age_bucket;
--ex4: datalemur-supercloud-customer.
SELECT cc.customer_id 
FROM customer_contracts cc
inner join products p
on cc.product_id=p.product_id
GROUP BY cc.customer_id 
having count(DISTINCT product_category )= 3
--ex5: leetcode-the-number-of-employees-which-report-to-each-employee.
select a.employee_id, a.name, COUNT(b.employee_id) AS reports_count, round(avg(b.age)) as average_age
from employees a inner join employees b
on a.employee_id = b.reports_to
group by a.employee_id, a.name
order by employee_id
--ex6: leetcode-list-the-products-ordered-in-a-period.
SELECT pn.product_name, SUM(p.unit) as unit
FROM Products pn
inner join Orders p
on pn.product_id=p.product_id
where order_date between '2020-02-01' and '2020-02-29'
GROUP BY pn.product_name 
having sum(p.unit)>= 100
--ex7: leetcode-sql-page-with-no-likes.
SELECT p.page_id 
FROM pages p
left join page_likes l
on p.page_id = l.page_id
GROUP BY p.page_id  
having count(liked_date)=0
order by page_id asc
