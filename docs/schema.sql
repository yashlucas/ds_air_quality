-- =====================================================
-- Air Quality Dataset Schema (3NF)
-- =====================================================

-- =========================
-- 1. STATION TABLE
-- =========================
CREATE TABLE IF NOT EXISTS t_station (
    station_id INT PRIMARY KEY,
    station_name VARCHAR(255),
    latitude DOUBLE,
    longitude DOUBLE
);

-- =========================
-- 2. TIME TABLE
-- =========================
CREATE TABLE IF NOT EXISTS t_time (
    time_id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE,
    hour INT,
    UNIQUE (date, hour)
);

-- =========================
-- 3. MEASUREMENT TABLE
-- =========================
CREATE TABLE IF NOT EXISTS t_measurement (
    measurement_id INT AUTO_INCREMENT PRIMARY KEY,
    station_id INT NOT NULL,
    time_id INT NOT NULL,

    -- Pollutants
    SO2 DOUBLE,
    NO DOUBLE,
    NO2 DOUBLE,
    CO DOUBLE,
    PM10 DOUBLE,
    O3 DOUBLE,
    PM25 DOUBLE,

    -- Wind
    wind_direction DOUBLE,
    wind_speed DOUBLE,

    -- Weather
    temperature DOUBLE,
    humidity DOUBLE,
    pressure DOUBLE,
    solar_radiation DOUBLE,
    rain DOUBLE,

    -- Additional chemicals
    BEN DOUBLE,
    TOL DOUBLE,
    MXIL DOUBLE,

    -- Foreign Keys
    CONSTRAINT fk_station FOREIGN KEY (station_id)
        REFERENCES t_station(station_id),

    CONSTRAINT fk_time FOREIGN KEY (time_id)
        REFERENCES t_time(time_id)
);
