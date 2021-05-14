select 
    a.borough_name, (b.borough_area / a.ct) as area_per_station 
from 
    {{ ref('borough_stations') }} as a inner join {{ source('bigquery-public-data', 'geo_nyc_borough_boundaries') }} as b 
ON a.borough_name = b.borough_name