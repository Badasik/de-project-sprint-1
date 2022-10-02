insert into dm_rfm_segments(user_id, recency, frequency, monetary_value)
select trf.user_id, trr.recency, trf.frequency, trmv.monetary_value
from tmp_rfm_frequency trf
left join tmp_rfm_monetary_value trmv on trf.user_id = trmv.user_id
left join tmp_rfm_recency trr on trf.user_id = trr.user_id


|user_id|recency|frequency|monetary_value|
|-------|-------|---------|--------------|
|0      |1      |3        |4             |
|1      |4      |3        |3             |
|2      |2      |3        |5             |
|3      |2      |3        |3             |
|4      |4      |3        |3             |
|5      |5      |5        |5             |
|6      |1      |3        |5             |
|7      |4      |3        |2             |
|8      |1      |1        |3             |
|9      |1      |2        |2             |
|10     |3      |4        |2             |