include: "/snowflake_views/*"

explore: fct_orders {
  join: dim_customers {
    type: left_outer
    sql_on: ${fct_orders.customer_id} = ${dim_customers.customer_id} ;;
    relationship: many_to_one
  }

  join: dim_products {
    type: left_outer
    sql_on: ${fct_orders.product_id} = ${dim_products.product_id} ;;
    relationship: many_to_one
  }
}
