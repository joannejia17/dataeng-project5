select distinct station_name, borough_name from {{ source('bigquery-public-data', 'stations') }}