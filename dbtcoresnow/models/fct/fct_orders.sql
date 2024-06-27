{{
  config(
    materialized = 'incremental'
  )
}}

-- incremental refresh 
with orders as (
    select * from {{ ref('stg_orders') }} 
    where
        1 = 1
        {% if is_incremental() %}
            and order_created > (select max(order_created) from {{ this }})
        {% endif %}
),

order_items as (
    select
        order_id,
        product_id, 
        sum(price_item) as  unit_price,
        sum(price_item)*sum(order_item_id) as total_order_item,  
        sum(order_item_id) as qty_items
    from {{ ref('stg_order_items') }}
    group by 
        order_id,
        product_id
),

fact_orders as (
    select
        orders.order_id, 
        orders.customer_id, 
        order_items.product_id,
        orders.order_status, 
        orders.order_created,
        orders.order_approved_at, 
        orders.order_delivered_carrier_date, 
        orders.order_delivered_customer_date, 
        orders.order_estimated_delivery_date,
        round(order_items.total_order_item, 2) as total_order_item,
        round(order_items.unit_price,2) as unit_price,
        order_items.qty_items,
        round(datediff(day, orders.order_created, orders.order_delivered_customer_date), 2) as lead_time_days
    from orders
    left join order_items on orders.order_id = order_items.order_id
)

select *
from fact_orders



