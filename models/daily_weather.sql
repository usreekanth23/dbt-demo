WITH daily_weather as 
(
select 
date(time) as daily_weather,
weather,
temp,
pressure,
humidity,
clouds
from {{source('demo','weather')}}

),

daily_weather_agg as 
(
select
daily_weather,
weather,
ROUND(AVG(temp),2) As avg_temp,
ROUND(AVG(pressure),2) as avg_pressure,
ROUND(AVG(humidity),2) as avg_humidity,
ROUND(AVG(clouds),2) as avg_clouds
from daily_weather
group by daily_weather,weather
QUALIFY ROW_NUMBER() OVER(PARTITION BY daily_weather ORDER BY count(weather) Desc) = 1
)

select * from daily_weather_agg