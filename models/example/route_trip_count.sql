
SELECT route_id, count(DISTINCT trip_id) as ct 
FROM {{ ref('route_trip') }}
GROUP BY route_id
