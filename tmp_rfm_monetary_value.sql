insert into analysis.tmp_rfm_monetary_value(user_id, monetary_value)
select a.id, ntile(5) over(order by a.sum)
from(
  select u.id, coalesce(o.sum,0) as sum
	from analysis.users u
	left join (select user_id, sum(payment) as sum
		from analysis.orders
		where status = 4 and order_ts > '2022-01-01'
		group by user_id) o on u.id = o.user_id) a