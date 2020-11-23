{{
config(materialized='table',
      alias='CUSTOMER_TOTAL_ORDERS_STG')
}}

select c.C_CUSTKEY,
        c.C_NAME,
        c.C_ACCTBAL,
        o.TOTALPRICE,
        {# CASE WHEN c.C_ACCTBAL >= o.TOTALPRICE THEN 'POSITIVE'  ELSE 'NEGATIVE'  END AS STATUS #}
       {{ cat_accts('c.c_acctbal','o.totalprice') }}  as status
from "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."CUSTOMER" c
LEFT JOIN ( SELECT O_CUSTKEY,
                   sum(O_TOTALPRICE) as TOTALPRICE
            FROM "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS"
            GROUP BY O_CUSTKEY ) o
ON c.C_CUSTKEY = o.O_CUSTKEY
