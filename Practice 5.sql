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

--ex3: datalemur-time-spent-snaps.
--ex4: datalemur-supercloud-customer.
--ex5: leetcode-the-number-of-employees-which-report-to-each-employee.
--ex6: leetcode-list-the-products-ordered-in-a-period.
--ex7: leetcode-sql-page-with-no-likes.
