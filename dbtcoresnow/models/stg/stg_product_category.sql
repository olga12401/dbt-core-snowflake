{{
  config(
    materialized = 'ephemeral',
    )
}}

with product_category as (
    select *
    from {{ ref('src_product_category') }}

)

SELECT 
    category_name,
    category_name_eng
FROM 
    product_category

    