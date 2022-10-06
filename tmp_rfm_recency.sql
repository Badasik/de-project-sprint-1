insert into analysis.tmp_rfm_recency(user_id, recency)  
select a.id, ntile(5) over(order by a.max)
  from (
	select u.id, coalesce(o.max,'1990-01-01') as max
	from analysis.users u
	left join (select user_id, max(order_ts) as max
		from analysis.orders
		where status = 4 and order_ts > '2022-01-01'
		group by user_id) o on u.id = o.user_id ) a