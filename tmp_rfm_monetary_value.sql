with cte_sum as (
  	select user_id, sum(payment) as sum
	from analysis.orders
	where status = 4
	group by user_id)
insert into analysis.tmp_rfm_monetary_value(user_id, monetary_value)
select user_id, ntile(5) over(order by sum)
from cte_sum