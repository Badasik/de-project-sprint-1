with cte_count as (
  	select user_id, count(*) as count
	from orders
	where status = 4
	group by user_id)
insert into tmp_rfm_frequency(user_id, frequency)
select user_id, ntile(5) over(order by count)
from cte_count