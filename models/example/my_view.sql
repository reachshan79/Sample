
-- Use the `ref` function to select from other models

{{ config(materialized='view' , alias ='MY_VIEW') }}

select *
from {{ ref('my_first_dbt_model') }}
where id = 1
