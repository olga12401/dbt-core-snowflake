{{
  config(
    materialized = 'table'
    )
}}

WITH c AS (
    SELECT * FROM {{ref('stg_customers')}}
),
g AS (
    SELECT * FROM {{ref('stg_geolocation')}}
)
, customers AS (
SELECT 
    c.customer_id,
	c.CUSTOMER_ZIP_CODE_PREFIX ,
	c.CUSTOMER_CITY ,
	c.CUSTOMER_STATE,
    g.GEOLOCATION_LAT ,
	g.GEOLOCATION_LNG 
FROM 
    c
LEFT JOIN g ON c.CUSTOMER_ZIP_CODE_PREFIX = g.GEOLOCATION_ZIP_CODE_PREFIX

)

select *
from customers