with cte_max as (
  	select user_id, max(order_ts) as max
	from analysis.orders
	where status = 4
	group by user_id)
insert into analysis.tmp_rfm_recency(user_id, recency)
select user_id, ntile(5) over(order by max)
from cte_max