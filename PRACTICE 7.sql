--ex1: datalemur-yoy-growth-rate.
with cte as (SELECT product_id,
EXTRACT(year from transaction_date), sum(spend),
lag(sum(spend)) over(PARTITION BY product_id ORDER BY
EXTRACT(year from transaction_date))
FROM user_transactions
group by
product_id,
EXTRACT(year from transaction_date)
order by product_id)

select extract, product_id, sum, lag,
case when lag is not null then
round((sum-lag)*100.00/lag, 2) else null end
FROM cte
--ex2: datalemur-card-launch-success.
SELECT 
  card_name, issued_amount
FROM monthly_cards_issued
WHERE issued_amount IN (SELECT FIRST_VALUE(issued_amount) OVER(PARTITION BY card_name ORDER BY issue_year,issue_month) as issued_amount
FROM monthly_cards_issued)
ORDER BY 2 DESC
--ex3: datalemur-third-transaction.
with cte as (SELECT user_id, spend, transaction_date,
RANK() OVER(PARTITION BY user_id ORDER BY transaction_date) ranking
FROM transactions
)
select user_id, spend, transaction_date
FROM cte
WHERE ranking = 3;
--ex4: datalemur-histogram-users-purchases.
count(user_id) as purchase_count
FROM user_transactions
WHERE transaction_date IN ( SELECT MAX(transaction_date)
FROM user_transactions
GROUP BY user_id )
group by user_id, transaction_date
order by transaction_date
--ex5: datalemur-rolling-average-tweets.
SELECT 
  user_id, 
  tweet_date, 
  round ( avg(tweet_count) over (partition by user_id order by tweet_date rows between 2 preceding and current row), 2) as rolling_avg_3d
FROM tweets
--ex6: datalemur-repeated-payments.
WITH ordered_transactions AS (
    SELECT 
        transaction_id,
        merchant_id,
        credit_card_id,
        amount,
        transaction_timestamp,
        LAG(transaction_timestamp) OVER (PARTITION BY merchant_id, credit_card_id, amount ORDER BY transaction_timestamp) AS prev_timestamp
    FROM transactions
)
SELECT 
    COUNT(*) AS repeated_payments
FROM ordered_transactions
WHERE 
    transaction_timestamp <= prev_timestamp + INTERVAL '10' MINUTE;

--ex7: datalemur-highest-grossing.
WITH CTE AS
(
SELECT CATEGORY,PRODUCT,SUM(SPEND) AS TOTAL_SPEND,RANK() OVER(PARTITION BY CATEGORY ORDER BY SUM(SPEND) DESC) AS RNK
FROM product_spend
WHERE EXTRACT(YEAR FROM TRANSACTION_DATE)=2022
GROUP BY  CATEGORY,PRODUCT
)
SELECT  CATEGORY,PRODUCT,TOTAL_SPEND
FROM CTE WHERE RNK<=2
--ex8: datalemur-top-fans-rank.
WITH cte AS (
SELECT 
  a.artist_name,
  DENSE_RANK() OVER (ORDER BY COUNT(b.song_id) DESC) as artist_rank
FROM global_song_rank c
 JOIN songs b ON c.song_id = b.song_id
 JOIN artists a ON a.artist_id = b.artist_id
WHERE c.rank <= 10
GROUP BY 1)
SELECT artist_name, artist_rank
FROM cte WHERE artist_rank <= 5

