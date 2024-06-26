

WITH raw_product_category AS (
    SELECT * FROM {{source('AZDB','product_category')}}
)
SELECT 
    PRODUCT_CATEGORY_NAME AS category_name,
    PRODUCT_CATEGORY_NAME_ENGLISH  AS category_name_eng
FROM 
    raw_product_category