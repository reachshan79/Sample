{{
config(materialized='table',
      alias='CUSTOMER_TOTAL_ORDERS')
}}

select *
FROM {{ ref('first_xfm') }}
where TOTALPRICE > {{ var('default_null_variable') }}
