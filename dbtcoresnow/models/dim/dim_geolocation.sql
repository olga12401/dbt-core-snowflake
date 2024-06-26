{{
  config(
    materialized = 'table'
    )
}}

WITH geolocation AS (
    SELECT * FROM {{ref('stg_geolocation')}}
)
SELECT 
    GEOLOCATION_ZIP_CODE_PREFIX ,
	GEOLOCATION_LAT ,
	GEOLOCATION_LNG ,
	GEOLOCATION_CITY ,
	GEOLOCATION_STATE 
FROM 
    geolocation

