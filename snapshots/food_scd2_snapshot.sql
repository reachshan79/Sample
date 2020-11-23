{% snapshot food_scd2_snapshot %}

{{
config(
      target_database='demo_db',
      target_schema='public',
      unique_key='id',

      strategy='timestamp',
      updated_at='updated_at',
      )
}}


select * from
{{ ref('scd2_testing') }}

{% endsnapshot %}
