-- =========================================================
-- views.sql
-- Air Quality Data Stewardship Project
-- TU Wien - WP2 T2.4 View Definitions
-- =========================================================


-- =========================================================
-- Remove existing views if they already exist
-- =========================================================

DROP VIEW IF EXISTS vw_air_quality_features;

DROP VIEW IF EXISTS vw_daily_pollution_summary;

DROP VIEW IF EXISTS vw_station_pollution_summary;



-- =========================================================
-- View: vw_air_quality_features
-- Description:
-- Denormalized ML-ready feature table combining
-- measurements, temporal information, and station metadata.
-- =========================================================

CREATE VIEW vw_air_quality_features AS

SELECT
    m.measurement_id,

    s.station_id,
    s.station_name,
    s.latitude,
    s.longitude,

    t.time_id,
    t.date,
    t.hour,

    m.SO2,
    m.NO,
    m.NO2,
    m.CO,
    m.PM10,
    m.O3,
    m.PM25,

    m.wind_direction,
    m.wind_speed,

    m.temperature,
    m.humidity,
    m.pressure,
    m.solar_radiation,
    m.rain,

    m.BEN,
    m.TOL,
    m.MXIL

FROM t_measurement m

JOIN t_station s
    ON m.station_id = s.station_id

JOIN t_time t
    ON m.time_id = t.time_id;



-- =========================================================
-- View: vw_daily_pollution_summary
-- Description:
-- Daily aggregated pollution statistics for
-- temporal trend analysis and forecasting tasks.
-- =========================================================

CREATE VIEW vw_daily_pollution_summary AS

SELECT
    t.date,

    AVG(m.SO2) AS avg_so2,
    AVG(m.NO) AS avg_no,
    AVG(m.NO2) AS avg_no2,
    AVG(m.CO) AS avg_co,
    AVG(m.PM10) AS avg_pm10,
    AVG(m.O3) AS avg_o3,
    AVG(m.PM25) AS avg_pm25,

    AVG(m.temperature) AS avg_temperature,
    AVG(m.humidity) AS avg_humidity,
    AVG(m.pressure) AS avg_pressure

FROM t_measurement m

JOIN t_time t
    ON m.time_id = t.time_id

GROUP BY
    t.date;



-- =========================================================
-- View: vw_station_pollution_summary
-- Description:
-- Station-level pollution statistics supporting
-- spatial analysis and hotspot comparison.
-- =========================================================

CREATE VIEW vw_station_pollution_summary AS

SELECT
    s.station_id,
    s.station_name,
    s.latitude,
    s.longitude,

    AVG(m.SO2) AS avg_so2,
    AVG(m.NO) AS avg_no,
    AVG(m.NO2) AS avg_no2,
    AVG(m.CO) AS avg_co,
    AVG(m.PM10) AS avg_pm10,
    AVG(m.O3) AS avg_o3,
    AVG(m.PM25) AS avg_pm25,

    AVG(m.temperature) AS avg_temperature,
    AVG(m.humidity) AS avg_humidity,
    AVG(m.pressure) AS avg_pressure

FROM t_measurement m

JOIN t_station s
    ON m.station_id = s.station_id

GROUP BY
    s.station_id,
    s.station_name,
    s.latitude,
    s.longitude;
