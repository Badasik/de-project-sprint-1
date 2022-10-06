insert into analysis.tmp_rfm_frequency(user_id, frequency)
select a.id, ntile(5) over(order by a.count)
from(
  select u.id, coalesce(o.count,0) as count
	from analysis.users u
	left join (select user_id, count(*) as count
		from analysis.orders
		where status = 4 and order_ts > '2022-01-01'
		group by user_id) o on u.id = o.user_id) a