
select station_name, count(1) as ada_neg_count from {{ ref('ada_negative_stations')}} group by station_name
