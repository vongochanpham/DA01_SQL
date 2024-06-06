ex1: datalemur-duplicate-job-listings.
SELECT COUNT(*) AS duplicate_companies 
FROM
(SELECT company_id,
COUNT(description) FROM 
job_listings 
GROUP BY company_id
HAVING COUNT(description) > 1) AS dupes;
ex2: datalemur-highest-grossing.
ex3: datalemur-frequent-callers.
ex4: datalemur-page-with-no-likes.
ex5: datalemur-user-retention.
ex6: leetcode-monthly-transactions.
ex7: leetcode-product-sales-analysis.
ex8: leetcode-customers-who-bought-all-products.
ex9: leetcode-employees-whose-manager-left-the-company.
ex10: leetcode-primary-department-for-each-employee.
ex11: leetcode-movie-rating.
ex12: leetcode-who-has-the-most-friends.

