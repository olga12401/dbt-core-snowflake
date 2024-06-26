include: "/snowflake_views/*"

explore: dim_customers{
  join: dim_geolocation{
    type: left_outer
    sql_on: ${dim_customers.customer_zip_code_prefix} = ${dim_geolocation.geolocation_zip_code_prefix} ;;
    relationship: many_to_one
  }

}
