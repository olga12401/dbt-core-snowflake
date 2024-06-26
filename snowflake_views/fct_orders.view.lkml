view: fct_orders {
  sql_table_name: "DEV"."FCT_ORDERS" ;;

  dimension: customer_id {
    type: string
    sql: ${TABLE}."CUSTOMER_ID" ;;
  }
  dimension: lead_time_days {
    type: number
    sql: ${TABLE}."LEAD_TIME_DAYS" ;;
  }
  dimension_group: order_approved {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."ORDER_APPROVED_AT" ;;
  }
  dimension_group: order_created {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."ORDER_CREATED" ;;
  }
  dimension_group: order_delivered_carrier {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."ORDER_DELIVERED_CARRIER_DATE" ;;
  }
  dimension_group: order_delivered_customer {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."ORDER_DELIVERED_CUSTOMER_DATE" ;;
  }
  dimension_group: order_estimated_delivery {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."ORDER_ESTIMATED_DELIVERY_DATE" ;;
  }
  dimension: order_id {
    type: string
    sql: ${TABLE}."ORDER_ID" ;;
  }
  dimension: order_status {
    type: string
    sql: ${TABLE}."ORDER_STATUS" ;;
  }
  dimension: product_id {
    type: string
    sql: ${TABLE}."PRODUCT_ID" ;;
  }
  dimension: qty_items {
    type: number
    sql: ${TABLE}."QTY_ITEMS" ;;
  }
  dimension: total_order_item {
    type: number
    sql: ${TABLE}."TOTAL_ORDER_ITEM" ;;
  }
  dimension: unit_price {
    type: number
    sql: ${TABLE}."UNIT_PRICE" ;;
  }
  measure: count {
    type: count
  }
}
