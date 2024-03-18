# dbt-core-snowflake
Deploy Analytics Engineering pipelines with DBT Core, Snowflake and Docker

## Objectives




## Requirements

1. dbt knowledge
2. Installed Docker
3. Downloaded Brazilian E-Commerce Public Dataset by Olist
4. Azure Blob Storage
5. Snowflake trial (or any data warehouse)
6. Looker
7. GitHub 
8. VS Code

## Implementation

1. Setup git repo
2. Initiate integration between azure storage & snowflake
3. Setup virtual environment
4. Install dbt 
5. Initiate integration between dbt & nowflake


## Integration between azure storage & snowflake

### Warehouse 

This SQL command creates a warehouse named az_warehouse, with an 'X-SMALL' size, and it's set to auto-suspend after 90 seconds of inactivity and auto-resume on the next query if it's suspended.

``` 
CREATE WAREHOUSE IF NOT EXISTS az_wh 
WITH WAREHOUSE_SIZE = 'X-SMALL'
AUTO_SUSPEND = 90
AUTO_RESUME = TRUE;

```

### Database 

This command creates a database named AZDB.

``` 
CREATE DATABASE IF NOT EXISTS AZDB;

```

### Create a Storage Integration in Snowflake

This object specifies the Azure Blob Storage and provides a secure mechanism for Snowflake to interact with Azure resources.

```
CREATE STORAGE INTEGRATION my_azure_int
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = AZURE
  ENABLED = TRUE
  STORAGE_ALLOWED_LOCATIONS = ('azure://<your_storage_account_name>.blob.core.windows.net/<your_container_name>/')
  AZURE_TENANT_ID = '<your_azure_tenant_id>';
```

CREATE STORAGE INTEGRATION azure_int
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = 'AZURE'
  ENABLED = TRUE
  AZURE_TENANT_ID = '40a6c74b-fac4-48db-b9dc-540ae32d96fe'
  STORAGE_ALLOWED_LOCATIONS = ('azure://stazsnowflake.blob.core.windows.net/azurefiles/') ;
```



* Replace <your_storage_account_name> with your Azure storage account name.
* Replace <your_container_name> with the name of your Azure Blob Storage container.
* Replace <your_azure_tenant_id> with your Azure tenant ID.


### Retrieve Storage Integration Properties 

```
DESC STORAGE INTEGRATION azure_int;

```

Take note of the AZURE_CONSENT_URL value from the output. Copy the URL from the AZURE_CONSENT_URL property and open it in a web browser. You must be logged into your Azure account with sufficient permissions to grant consent.

## Create schema

CREATE SCHEMA IF NOT EXISTS AZDB.file_formats;
CREATE SCHEMA IF NOT EXISTS AZDB.external_stages;


### Create file format

Before you can load data into Snowflake, you need a target table that matches the structure of your source data in Azure Blob Storage.

1. Create a File Format (if not defined within the stage).

```
CREATE OR REPLACE file format azdb.file_formats.csv_format
    type = csv
    field_delimiter = ','
    field_optionally_enclosed_by = '"'
    skip_header = 1;
```

### Create or Use an External Stage

With the storage integration configured, you can create an external stage in Snowflake that uses this integration to access data in Azure Blob Storage.

```
USE SCHEMA azdb.external_stages;
CREATE STAGE my_azure_stage
  STORAGE_INTEGRATION = azure_int
  URL = 'azure://stazsnowflake.blob.core.windows.net/azurefiles/'
  FILE_FORMAT = azdb.file_formats.csv_format;
```

### Preparere Snowflake environment    

1. Create a Target Table. Ensure you have a table in Snowflake that matches the schema of the data you're loading.

```
CREATE TABLE azdb.public.olist_order_reviews (
    review_id STRING,
    order_id STRING,
    review_score NUMBER(1,0),
    review_comment_title STRING,
    review_comment_message STRING,
    review_creation_date TIMESTAMP_NTZ,
    review_answer_timestamp TIMESTAMP_NTZ 
); 
```

```
COPY INTO azdb.public.olist_order_reviews
  FROM @azdb.external_stages.my_azure_stage
  PATTERN='.*olist_order_reviews_dataset.*.csv';
```