SELECT r.route_id, t.trip_id
FROM {{ source('bigquery-public-data', 'routes') }} as r 
JOIN {{ source('bigquery-public-data', 'trips') }} as t ON r.route_id = t.route_id
