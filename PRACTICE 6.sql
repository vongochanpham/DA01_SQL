ex1: datalemur-duplicate-job-listings.
SELECT COUNT(*) AS duplicate_companies 
FROM
(SELECT company_id,
COUNT(description) FROM 
job_listings 
GROUP BY company_id
HAVING COUNT(description) > 1) AS dupes;
ex2: datalemur-highest-grossing.
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

