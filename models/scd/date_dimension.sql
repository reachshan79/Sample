{{ 
config(
      materialized='incremental',incremental_strategy='delete+insert', unique_key='d_date'
    ) 
}}

select *
--from "SNOWFLAKE_SAMPLE_DATA"."TPCDS_SF10TCL"."DATE_DIM"
from {{ source('sf_sample_data','date_dim') }}
where d_date <= current_date()

{% if is_incremental() %}
  and d_date >= (select max(d_date) from {{ this }}) -- target table in this case date_dimension
  --and current_date() > d_date
{% endif %}
