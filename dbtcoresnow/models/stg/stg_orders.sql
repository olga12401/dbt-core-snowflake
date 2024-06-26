{{
  config(
    materialized = 'incremental',
    on_schema_change = 'fail'
  )
}}

WITH stg_orders AS (
  SELECT
    order_id, 
    customer_id, 
    order_status, 
    order_created, 
    order_approved_at, 
    order_delivered_carrier_date, 
    order_delivered_customer_date, 
    order_estimated_delivery_date
  FROM 
    {{ ref('src_orders') }}
  WHERE 
    1=1  -- This is often used to simplify the addition of further conditions
  {% if is_incremental() %}
    -- Ensures only new records are processed
    AND order_created > (SELECT MAX(order_created) FROM {{ this }})
  {% endif %}
)

SELECT
  order_id, 
  customer_id, 
  order_status, 
  CAST(order_created AS DATE) AS order_created, 
  CAST(order_approved_at AS DATE) AS order_approved_at, 
  CAST(order_delivered_carrier_date AS DATE) AS order_delivered_carrier_date, 
  CAST(order_delivered_customer_date AS DATE) AS order_delivered_customer_date, 
  CAST(order_estimated_delivery_date AS DATE) AS order_estimated_delivery_date
FROM
  stg_orders
