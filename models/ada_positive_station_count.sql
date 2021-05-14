
select station_name, count(1) as ada_pos_count from {{ ref('ada_positive_stations')}} group by station_name
