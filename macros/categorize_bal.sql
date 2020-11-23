{% macro cat_accts(c_acctbal,totalprice) %}
  CASE
    WHEN {{ c_acctbal }} >= {{ totalprice }} THEN 'POSITIVE'
    ELSE 'NEGATIVE'
  END
{% endmacro %}

