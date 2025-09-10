DO $$
<<local>>
DECLARE
  curdate date := (SELECT min(scheduled_departure) FROM flights);
  utc_offset interval;
BEGIN
  WHILE (curdate <= bookings.now()::date) LOOP
    utc_offset := interval '12 hours';
    WHILE (utc_offset >= interval '2 hours') LOOP
      INSERT INTO flights_bi
        WITH flight (
          airport_code,
          airport_coord,
          flight_id,
          flight_no,
          scheduled_time,
          actual_time,
          aircraft_code,
          flight_type
        ) AS (
        -- departures
        SELECT a.airport_code,
               a.coordinates,
               f.flight_id,
               f.flight_no,
               f.scheduled_departure,
               f.actual_departure,
               f.aircraft_code,
               'departure'
        FROM   airports a,
               flights f,
               pg_timezone_names tzn
        WHERE  a.airport_code = f.departure_airport
        AND    f.actual_departure IS NOT NULL
        AND    tzn.name = a.timezone
        AND    tzn.utc_offset = local.utc_offset
        AND    timezone(a.timezone, f.actual_departure)::date = curdate
        UNION ALL
        -- arrivals
        SELECT a.airport_code,
               a.coordinates,
               f.flight_id,
               f.flight_no,
               f.scheduled_arrival,
               f.actual_arrival,
               f.aircraft_code,
               'arrival'
        FROM   airports a,
               flights f,
               pg_timezone_names tzn
        WHERE  a.airport_code = f.arrival_airport
        AND    f.actual_arrival IS NOT NULL
        AND    tzn.name = a.timezone
        AND    tzn.utc_offset = local.utc_offset
        AND    timezone(a.timezone, f.actual_arrival)::date = curdate
      )
      SELECT f.airport_code,
             f.airport_coord,
             local.utc_offset,
             f.flight_no,
             f.flight_type,
             f.scheduled_time,
             f.actual_time,
             f.aircraft_code,
             s.seat_no,
             s.fare_conditions,
             t.passenger_id,
             t.passenger_name
      FROM   flight f
             JOIN seats s
               ON s.aircraft_code = f.aircraft_code
             LEFT JOIN boarding_passes bp
               ON bp.flight_id = f.flight_id
              AND bp.seat_no = s.seat_no
             LEFT JOIN ticket_flights tf
               ON tf.ticket_no = bp.ticket_no
              AND tf.flight_id = bp.flight_id
             LEFT JOIN tickets t
               ON t.ticket_no = tf.ticket_no;
      RAISE NOTICE '%, %', curdate, utc_offset;
      utc_offset := utc_offset - interval '1 hour';
    END LOOP;
    curdate := curdate + 1;
  END LOOP;
END;
$$;
