view: dim_customers {
  sql_table_name: "DEV"."DIM_CUSTOMERS" ;;

  dimension: customer_city {
    type: string
    sql: ${TABLE}."CUSTOMER_CITY" ;;
  }
  dimension: customer_id {
    type: string
    sql: ${TABLE}."CUSTOMER_ID" ;;
  }
  dimension: customer_state {
    type: string
    sql: ${TABLE}."CUSTOMER_STATE" ;;
  }
  dimension: customer_zip_code_prefix {
    type: zipcode
    sql: ${TABLE}."CUSTOMER_ZIP_CODE_PREFIX" ;;
  }
  dimension: geolocation_lat {
    type: number
    sql: ${TABLE}."GEOLOCATION_LAT" ;;
  }
  dimension: geolocation_lng {
    type: number
    sql: ${TABLE}."GEOLOCATION_LNG" ;;
  }
  measure: count {
    type: count
  }
}
