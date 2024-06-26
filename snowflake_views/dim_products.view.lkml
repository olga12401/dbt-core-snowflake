view: dim_products {
  sql_table_name: "DEV"."DIM_PRODUCTS" ;;

  dimension: category_name {
    type: string
    sql: ${TABLE}."CATEGORY_NAME" ;;
  }
  dimension: category_name_eng {
    type: string
    sql: ${TABLE}."CATEGORY_NAME_ENG" ;;
  }
  dimension: product_id {
    type: string
    sql: ${TABLE}."PRODUCT_ID" ;;
  }
  measure: count {
    type: count
    drill_fields: [category_name]
  }
}
