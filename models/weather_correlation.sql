WITH CTE AS 
(
select 
*
from {{ref('trip_fact')}} t
left join {{ref('daily_weather')}} w
ON t.trip_date = w.daily_weather
ORDER BY TRIP_DATE DESC
)

select * from cte