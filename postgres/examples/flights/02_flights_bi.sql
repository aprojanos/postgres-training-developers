create table flights_bi(
  airport_code char(3),
  airport_coord point,         -- geo coordinates of airport
  airport_utc_offset interval, -- time zone
  flight_no char(6),           -- flight number
  flight_type text,            -- flight type: departure / arrival 
  scheduled_time timestamp,  -- scheduled departure/arrival time of flight
  actual_time timestamptz,     -- actual time of flight
  aircraft_code char(3),
  seat_no varchar(4),          -- seat number
  fare_conditions varchar(10), -- travel class
  passenger_id varchar(20),
  passenger_name text
);
