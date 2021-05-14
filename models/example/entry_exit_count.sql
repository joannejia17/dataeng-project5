WITH entry AS (SELECT s_e.station_name, count(CASE WHEN entry THEN 1 END) as entry_num
FROM {{ source('bigquery-public-data', 'station_entrances') }} AS s_e
GROUP BY s_e.station_name
ORDER BY count(CASE WHEN entry THEN 1 END) DESC),

exit AS (SELECT s_e.station_name, count(CASE WHEN exit_only THEN 1 END) as exit_only_num
FROM {{ source('bigquery-public-data', 'station_entrances') }} AS s_e
GROUP BY s_e.station_name
ORDER BY count(CASE WHEN exit_only THEN 1 END) DESC)

SELECT entry.station_name, entry_num, exit_only_num FROM entry 
JOIN exit ON entry.station_name = exit.station_name
