with
    cte as (
        select

            to_timestamp(started_at) as started_at,
            date(to_timestamp(started_at)) as date_started_at,
            hour(to_timestamp(started_at)) as hour_started_at,
            {{ day_type("STARTED_AT") }} as day_type,
            {{ get_season("STARTED_AT") }} as season_of_year

        from {{ ref('stg_bike') }}
        where started_at != 'started_at'
    )

select *
from cte
