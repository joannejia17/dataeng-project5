select 
    borough_name, count(station_id) as ct 
from 
    {{ source('bigquery-public-data', 'stations') }} 
group by 
    borough_name