select a.cnt from (
select count(*)  as cnt
--from customer_total_orders_stg
from {{ ref('first_xfm') }}
where TOTALPRICE =0) a
where a.cnt > 0
