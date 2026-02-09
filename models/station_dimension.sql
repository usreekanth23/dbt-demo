WITH BIKE AS 
(

Select 
start_statio_id as Station_id,
start_station_name as station_name,
start_lat as station_lat,
start_lng as station_lng
from {{source('demo','bike')}}
WHERE RIDE_ID != 'ride_id'


)

Select * from BIKE