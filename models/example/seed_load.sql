{{
config(materialized='table', alias='sam1')
}}

select * from {{ ref('sam') }}
