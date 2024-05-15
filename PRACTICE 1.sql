--ex1: hackerank-revising-the-select-query.sql
SELECT NAME FROM city
WHERE population > 120000 AND countrycode='USA'  
--ex2: hackerank-japanese-cities-attributes.sql
SELECT * FROM CITY
WHERE COUNTRYCODE='JPN';
--ex3: hackerank-weather-observation-station-1.sql
SELECT CITY , STATE FROM STATION;
--ex4: hackerank-weather-observation-station-6.
SELECT DISTINCT CITY FROM STATION
WHERE city LIKE 'A%' OR city LIKE 'E%' OR city LIKE 'I%' OR city LIKE 'O%' OR CITY LIKE 'U%';
--ex5: hackerank-weather-observation-station-7.sql
SELECT DISTINCT CITY FROM STATION
WHERE CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u';
--ex6: hackerank-weather-observation-station-9.sql
SELECT DISTINCT CITY FROM STATION
WHERE city NOT LIKE 'A%' AND  city NOT LIKE 'E%' AND city NOT LIKE 'I%' AND city NOT LIKE 'O%' AND CITY NOT LIKE 'U%';
--ex7: hackerank-name-of-employees.sql
select name from employee
ORDER BY name ASC;
--ex8: hackerank-salary-of-employees.sql
select name from employee
WHERE salary > 2000 AND months < 10
ORDER BY employee_id ASC;
--ex9: leetcode-recyclable-and-low-fat-products.sql
select product_id from products
where low_fats='Y' AND recyclable='Y';
--ex10: leetcode-find-customer-referee.sql
select name from customer
where referee_id !=2 OR referee_id IS NULL;
--ex11: leetcode-big-countries.sql
select name, area, population from world
WHERE area >= 3000000 OR population >= 25000000;
--ex12: leetcode-article-views.sql
SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY id ASC;
--ex13: datalemur-tesla-unfinished-part.sql
SELECT PART, ASSEMBLY_STEP FROM parts_assembly
WHERE part='bumper' AND finish_date IS NULL;
--ex14: datalemur-lyft-driver-wages.sql
select * from lyft_drivers
WHERE yearly_salary<=30000 OR yearly_salary>=70000;
--ex15: datalemur-find-the-advertising-channel.sql
select advertising_channel from uber_advertising
WHERE money_spent> 100000 AND year='2019';
