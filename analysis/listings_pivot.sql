{%- set property_types = dbt_utils.get_column_values(table=ref('listings_staging'),column='property_type') -%}

with

listings as (
  select * from {{ref('listings_staging')}}
),

pivoted as (
  select
  neighbourhood,

  {%- for property_type in property_types %}

    sum(case when property_type = '{{property_type}}' then 1 else 0 end) as {{clean_this(property_type)}}_count{{ ',' if not loop.last }}

  {% endfor %}

  from listings
  group by 1
)

select
  *
from pivoted
