{{
  config(
    materialized = 'ephemeral'
    )
}}

WITH raw_customers AS (
    SELECT * FROM {{source('AZDB','customers')}}
)
SELECT 
    CUSTOMER_ID ,
	CUSTOMER_UNIQUE_ID ,
	CUSTOMER_ZIP_CODE_PREFIX ,
	CUSTOMER_CITY ,
	CUSTOMER_STATE  
FROM 
    raw_customers