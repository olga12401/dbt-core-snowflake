{{
  config(
    materialized = 'table',
    )
}}


select
    date_day,
    YEAR(date_day) as year,
    QUARTER(date_day) as quarter,
    MONTH(date_day) as month,
    DAY(date_day) as day,
    DAYOFWEEK(date_day) as day_of_week,
    DAYOFYEAR(date_day) as day_of_year,
    DAYNAME(date_day) as day_name,
    MONTHNAME(date_day) as month_name
from
    {{ ref('calendar_table') }}