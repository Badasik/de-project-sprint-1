--1.1 Ищем дубликаты в таблице production.users
select count(id)
from production.users u

select count(distinct id)
from production.users u
		--Дубликатов в таблице production.users не обнаружено


--1.2 Ищем дубликаты в таблице production.orders
select count(order_id)
from production.orders o

select count(distinct order_id)
from production.orders o
		--Дубликатов в таблице production.orders не обнаружено
		
--2 Поскольку нам понадобятся стобцы  user_id, order_ts, payment, status, то проверим отсутствие нулей в данных столбцах

select * 
from production.orders
where user_id is null

select * 
from production.orders
where order_ts is null

select * 
from production.orders
where payment is null

select * 
from production.orders
where status is null


		--Значений Null в вышеуказанных столбцах не обнаружено


--Для анализа RFM используются три таблицы: production.users, production.orders, production.orderstatuslog.
	--Таблица production.users имеет следующие ограничения:
		--users_pkey PRIMARY KEY
	--Таблица production.orders имеет следующие ограничения:
		--orders_pkey PRIMARY KEY
		--orders_check CHECK cost = (payment + bonus_payment)
	--Таблица production.orderstatuslog имеет следующие ограничения:
		--ordersstatuslog_pkey PRIMARY KEY
		--orderstatuslog_order_id_status_id_key UNIQUE KEY
		--orderstatuslog_order_id_fkey FOREIGN KEY на orders_pkey
		--orderstatuslog_status_id_fkey FOREIGN KEY на orderstatuses_pkey

--Отсутствие внешних ключей в таблице production.orders может привести к появлению данных, где будут
--несуществующие пользователи, продукты и статусы. В дальнейшем это надо учесть при заполенине таблицы новыми данными
