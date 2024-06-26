

WITH raw_order_items AS (
    SELECT * FROM {{source('AZDB','order_items')}}
)
SELECT 
    ORDER_ID ,
	ORDER_ITEM_ID , -- sequential number identifying number of items included in the same order.
	PRODUCT_ID ,
	SELLER_ID ,
	SHIPPING_LIMIT_DATE ,
	PRICE AS PRICE_ITEM,
	FREIGHT_VALUE  
FROM 
    raw_order_items