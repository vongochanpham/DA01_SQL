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

--ex3: datalemur-third-transaction.
--ex4: datalemur-histogram-users-purchases.
--ex5: datalemur-rolling-average-tweets.
--ex6: datalemur-repeated-payments.
--ex7: datalemur-highest-grossing.
--ex8: datalemur-top-fans-rank.

