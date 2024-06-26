WITH raw_order_payments AS (
    SELECT * FROM {{source('AZDB','order_payments')}}
)
SELECT 
   ORDER_ID ,
	PAYMENT_SEQUENTIAL ,
	PAYMENT_TYPE ,
	PAYMENT_INSTALLMENTS ,
	PAYMENT_VALUE  
FROM 
    raw_order_payments