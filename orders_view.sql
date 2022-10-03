create or replace view analysis.orders as(
with cte_order as(
select order_id, t.status_id
from(
	select *, row_number() over(partition by order_id order by dttm desc) row_num
	from production.orderstatuslog o) t
where row_num = 1 )
select o2.*, a.status_id
from production.orders o2
inner join cte_order a on o2.order_id = a.order_id)