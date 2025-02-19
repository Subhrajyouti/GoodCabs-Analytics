CREATE TABLE IF NOT EXISTS dim_city (
    city_id VARCHAR(10) PRIMARY KEY,
    city_name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS dim_date (
    date DATE PRIMARY KEY,
    start_of_month DATE NOT NULL,
    month_name VARCHAR(20) NOT NULL,
    day_type VARCHAR(10) CHECK (day_type IN ('Weekday', 'Weekend'))
);

CREATE TABLE IF NOT EXISTS fact_passenger_summary (
    month DATE NOT NULL,
    city_id VARCHAR(10) REFERENCES dim_city(city_id),
    total_passengers INT NOT NULL,
    new_passengers INT NOT NULL,
    repeat_passengers INT NOT NULL,
    PRIMARY KEY (month, city_id)
);

CREATE TABLE IF NOT EXISTS dim_repeat_trip_distribution (
    month DATE NOT NULL,
    city_id VARCHAR(10) REFERENCES dim_city(city_id),
    trip_count VARCHAR(10) NOT NULL,  
    repeat_passenger_count INT NOT NULL,
    PRIMARY KEY (month, city_id, trip_count)
);

CREATE TABLE IF NOT EXISTS fact_trips (
    trip_id SERIAL PRIMARY KEY,
    date DATE REFERENCES dim_date(date),
    city_id VARCHAR(10) REFERENCES dim_city(city_id),
    passenger_type VARCHAR(10) CHECK (passenger_type IN ('New', 'Repeat')),
    distance_travelled DECIMAL(5,2),
    fare_amount DECIMAL(10,2),
    passenger_rating DECIMAL(3,2) CHECK (passenger_rating BETWEEN 1 AND 10),
    driver_rating DECIMAL(3,2) CHECK (driver_rating BETWEEN 1 AND 10)
);
CREATE TABLE IF NOT EXISTS city_target_passenger_rating (
    city_id VARCHAR(10) REFERENCES dim_city(city_id),
    target_avg_passenger_rating DECIMAL(3,2) CHECK (target_avg_passenger_rating BETWEEN 1 AND 10),
    PRIMARY KEY (city_id)
);

CREATE TABLE IF NOT EXISTS monthly_target_new_passengers (
    month DATE NOT NULL,
    city_id VARCHAR(10) REFERENCES dim_city(city_id),
    target_new_passengers INT NOT NULL,
    PRIMARY KEY (month, city_id)
);

CREATE TABLE IF NOT EXISTS monthly_target_trips (
    month DATE NOT NULL,
    city_id VARCHAR(10) REFERENCES dim_city(city_id),
    total_target_trips INT NOT NULL,
    PRIMARY KEY (month, city_id)
);
