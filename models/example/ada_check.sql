SELECT division, count(DISTINCT station_name) AS ada_num
FROM  {{ source('bigquery-public-data', 'station_entrances') }} AS s_e
WHERE ada_compliant = true
GROUP BY division

UNION ALL

SELECT division, 0 
FROM {{ source('bigquery-public-data', 'station_entrances') }} AS s_e
WHERE ada_compliant = false
GROUP BY division