create view orders1 as(with cte_order as(
select order_id, status_id
from(
	select *, row_number() over(partition by order_id order by dttm desc) row_num
	from orderstatuslog o) t
where row_num = 1 )
select o2.*, status_id
from orders o2
inner join cte_order a on o2.order_id = a.order_id)