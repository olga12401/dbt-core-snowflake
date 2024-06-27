# Connecting dbt and snowflake

## Steps

Check python version 

```
python3.11 --version
```

First, choose or create a directory where you want to place your virtual environment. Then, create the virtual environment using the following command.

```
python3.11 -m venv myenv
```

Replace myenv with your desired name for the virtual environment.

Activate the Virtual Environment (MAC or WSL Ubuntu)

```
source myenv/bin/activate
```

### Install dbt-snowflake

```
pip install dbt-snowflake==1.8.0

dbt init dbtcoresnow 
```
### Configuration database 

[1] snowflake

Desired authentication type option (enter a number): 1    

password (dev password): 

role (dev role): dbt_role

warehouse (warehouse name): AZ_WH 

database (default database that dbt will build objects in): AZDB

schema (default schema that dbt will build objects in): DEV

threads (1 or more) [1]: 1 


### Check the connection and configurations

```
dbt debug
```

