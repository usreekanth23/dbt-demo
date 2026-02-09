with
    trips as (

        select
            ride_id,
            --rideable_type,
            date(to_timestamp(started_at)) as trip_date,
            start_statio_id as start_stattion_id,
            end_station_id,
            member_csual as member_casual,
            timestampdiff(
                second, (ended_at), to_timestamp(started_at)
            ) as trip_duration_seconds
        from {{ ref('stg_bike') }}
        where ride_id != 'ride_id'

    )

select *
from trips
