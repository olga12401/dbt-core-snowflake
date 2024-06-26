{{
  config(
    materialized = 'view'
    )
}}

WITH stg_order_items AS (
    SELECT * FROM {{ref('src_orders_items')}}   
)
select
    ORDER_ID ,
	ORDER_ITEM_ID , -- sequential number identifying number of items included in the same order.
	PRODUCT_ID ,
	PRICE_ITEM,
FROM stg_order_items
 