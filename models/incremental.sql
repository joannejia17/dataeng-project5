{{ config(materialized='incremental') }}

select
    a.*, b.route_id 
    from {{ source('bigquery-public-data', 'stop_times') }} as a INNER JOIN {{ source('bigquery-public-data', 'trips') }} as b ON a.trip_id = b.trip_id
    {% if is_incremental() %}
    WHERE a.arrival_time > (SELECT MAX(arrival_time) from {{ this }} ) 
    AND a.departure_time > (SELECT MAX(departure_time) from {{ this }} )
    {% endif %}