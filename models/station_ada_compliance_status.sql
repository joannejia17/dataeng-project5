SELECT a.station_name, a.borough_name, 
        ifnull(c.ada_pos_count, 0) AS positive, ifnull( b.ada_neg_count, 0) AS negative, 
        (ifnull(c.ada_pos_count, 0)  + ifnull( b.ada_neg_count, 0)) AS total_count 
FROM {{ref('station_borough_mapping')}} AS a
LEFT OUTER JOIN {{ref('ada_negative_station_count')}} AS b ON a.station_name = b.station_name
LEFT OUTER JOIN {{ref('ada_positive_station_count')}} AS c ON a.station_name = c.station_name

