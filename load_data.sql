COPY dim_city FROM 'E:\GoodCabs Analytics\GoodCabs_data\dim_city.csv' DELIMITER ',' CSV HEADER;
COPY dim_date FROM 'E:\GoodCabs Analytics\datasets\csv_files\dim_date.csv' DELIMITER ',' CSV HEADER;
COPY city_target_passenger_rating FROM 'E:\GoodCabs Analytics\datasets\csv_files\city_target_passenger_rating.csv' DELIMITER ',' CSV HEADER;
COPY monthly_target_new_passengers FROM '/path/to/monthly_target_new_passengers.csv' DELIMITER ',' CSV HEADER;
COPY monthly_target_trips FROM '/path/to/monthly_target_trips.csv' DELIMITER ',' CSV HEADER;
COPY fact_passenger_summary FROM 
'E:\GoodCabs Analytics\GoodCabs_data\fact_passenger_summary.csv' DELIMITER ',' CSV HEADER;
COPY dim_repeat_trip_distribution FROM '/path/to/dim_repeat_trip_distribution.csv' DELIMITER ',' CSV HEADER;
COPY fact_trips FROM '/path/to/fact_trips.csv' DELIMITER ',' CSV HEADER;
SELECT * FROM dim_city WHERE city_id NOT 
IN (SELECT DISTINCT city_id FROM 
fact_passenger_summary);
