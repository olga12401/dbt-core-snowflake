{{
  config(
    materialized = 'table',
    )
}}
 
WITH 
p AS (
    SELECT 
        *    
    FROM {{ ref('stg_products') }}

),
t AS (
    SELECT *
    FROM {{ref('src_product_category')}}
)

SELECT 
    p.product_id ,
	p.category_name,
    t.category_name_eng 
FROM 
    p
LEFT JOIN t ON (p.category_name = t.category_name)

