view: dim_geolocation {
  sql_table_name: "DEV"."DIM_GEOLOCATION" ;;

  dimension: geolocation_city {
    type: string
    sql: ${TABLE}."GEOLOCATION_CITY" ;;
  }
  dimension: geolocation_lat {
    type: number
    sql: ${TABLE}."GEOLOCATION_LAT" ;;
  }
  dimension: geolocation_lng {
    type: number
    sql: ${TABLE}."GEOLOCATION_LNG" ;;
  }
  dimension: geolocation_state {
    type: string
    sql: ${TABLE}."GEOLOCATION_STATE" ;;
  }
  dimension: geolocation_zip_code_prefix {
    type: string
    sql: ${TABLE}."GEOLOCATION_ZIP_CODE_PREFIX" ;;
  }
  measure: count {
    type: count
  }
}
