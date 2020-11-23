{% set natural_key = dbt_utils.surrogate_key('C_CUSTKEY','AS_OF_DT') %}

{{
config(
materialized='incremental',
incremental_strategy='delete+insert',
alias='SCD_TESTING',
unique_key=natural_key
)
}}

SELECT *,
to_date('{{ var('odate') }}') as AS_OF_DT
FROM "DEMO_DB"."PUBLIC"."CUSTOMER_TOTAL_ORDERS"

