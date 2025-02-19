--1️⃣ Retrieve Total Trips, New Passengers, and Repeat Passengers for Each City in the Latest Month
SELECT 
    fps.city_id,
    dc.city_name,
    fps.month,
    fps.total_passengers,
    fps.new_passengers,
    fps.repeat_passengers
FROM fact_passenger_summary fps
JOIN dim_city dc ON fps.city_id = dc.city_id
WHERE fps.month = (SELECT MAX(month) FROM fact_passenger_summary);
