{{
  config(
    materialized = 'table'
    )
}}

WITH customers AS (
    SELECT * FROM {{ref('stg_customers')}}
)
SELECT 
    customer_id,
	CUSTOMER_ZIP_CODE_PREFIX ,
	CUSTOMER_CITY ,
	CUSTOMER_STATE  
FROM 
    customers