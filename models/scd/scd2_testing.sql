{{
config(materialized='table',
      unique_key='id',
      transient='false')
}}

select ID,
NAME,
'2020-06-19' AS UPDATED_AT
from DEMO_DB.PUBLIC.FOOD_COMPONENT_V1
