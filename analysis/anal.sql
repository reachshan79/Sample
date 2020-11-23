 select 
o_orderstatus,
o_orderkey,
O_totalprice, 
sum(o_totalprice) over (partition by o_orderstatus order by o_orderkey) as O_totalprice_by_status
 from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS
