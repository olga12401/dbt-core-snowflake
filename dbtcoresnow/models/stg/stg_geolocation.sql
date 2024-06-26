{{
  config(
    materialized = 'ephemeral'
    )
}}

WITH raw_geolocation_data AS (
    SELECT * FROM {{source('AZDB','geolocation')}}
)
SELECT 
    GEOLOCATION_ZIP_CODE_PREFIX ,
	GEOLOCATION_LAT ,
	GEOLOCATION_LNG ,
	GEOLOCATION_CITY ,
	GEOLOCATION_STATE 
FROM 
    raw_geolocation_data