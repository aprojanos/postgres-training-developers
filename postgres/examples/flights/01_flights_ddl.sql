--
-- PostgreSQL database dump
--

\restrict WNSzKfwQLKf4teh511pqh3ITUWXKpGeq3Tw8ubj6P6rOboYoejF8ULxsCXFXG21

-- Dumped from database version 17.6 (Debian 17.6-1.pgdg13+1)
-- Dumped by pg_dump version 17.6 (Ubuntu 17.6-1.pgdg24.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: bookings; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA bookings;


ALTER SCHEMA bookings OWNER TO postgres;

--
-- Name: SCHEMA bookings; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA bookings IS 'Airlines demo database schema';


--
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA bookings;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA bookings;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA bookings;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- Name: pgstattuple; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgstattuple WITH SCHEMA bookings;


--
-- Name: EXTENSION pgstattuple; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgstattuple IS 'show tuple-level statistics';


--
-- Name: lang(); Type: FUNCTION; Schema: bookings; Owner: postgres
--

CREATE FUNCTION bookings.lang() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
  RETURN current_setting('bookings.lang');
EXCEPTION
  WHEN undefined_object THEN
    RETURN NULL;
END;
$$;


ALTER FUNCTION bookings.lang() OWNER TO postgres;

--
-- Name: now(); Type: FUNCTION; Schema: bookings; Owner: postgres
--

CREATE FUNCTION bookings.now() RETURNS timestamp with time zone
    LANGUAGE sql IMMUTABLE
    AS $$SELECT '2024-08-15 18:00:00'::TIMESTAMP AT TIME ZONE 'Europe/Moscow';$$;


ALTER FUNCTION bookings.now() OWNER TO postgres;

--
-- Name: FUNCTION now(); Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON FUNCTION bookings.now() IS 'Point in time according to which the data are generated';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: aircrafts_data; Type: TABLE; Schema: bookings; Owner: postgres
--

CREATE TABLE bookings.aircrafts_data (
    aircraft_code character(3) NOT NULL,
    model jsonb NOT NULL,
    range integer NOT NULL,
    CONSTRAINT aircrafts_range_check CHECK ((range > 0))
);


ALTER TABLE bookings.aircrafts_data OWNER TO postgres;

--
-- Name: TABLE aircrafts_data; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON TABLE bookings.aircrafts_data IS 'Aircrafts (internal data)';


--
-- Name: COLUMN aircrafts_data.aircraft_code; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.aircrafts_data.aircraft_code IS 'Aircraft code, IATA';


--
-- Name: COLUMN aircrafts_data.model; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.aircrafts_data.model IS 'Aircraft model';


--
-- Name: COLUMN aircrafts_data.range; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.aircrafts_data.range IS 'Maximal flying distance, km';


--
-- Name: aircrafts; Type: VIEW; Schema: bookings; Owner: postgres
--

CREATE VIEW bookings.aircrafts AS
 SELECT aircraft_code,
    (model ->> bookings.lang()) AS model,
    range
   FROM bookings.aircrafts_data ml;


ALTER VIEW bookings.aircrafts OWNER TO postgres;

--
-- Name: VIEW aircrafts; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON VIEW bookings.aircrafts IS 'Aircrafts';


--
-- Name: COLUMN aircrafts.aircraft_code; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.aircrafts.aircraft_code IS 'Aircraft code, IATA';


--
-- Name: COLUMN aircrafts.model; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.aircrafts.model IS 'Aircraft model';


--
-- Name: COLUMN aircrafts.range; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.aircrafts.range IS 'Maximal flying distance, km';


--
-- Name: airports_data; Type: TABLE; Schema: bookings; Owner: postgres
--

CREATE TABLE bookings.airports_data (
    airport_code character(3) NOT NULL,
    airport_name jsonb NOT NULL,
    city jsonb NOT NULL,
    coordinates point NOT NULL,
    timezone text NOT NULL
);


ALTER TABLE bookings.airports_data OWNER TO postgres;

--
-- Name: TABLE airports_data; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON TABLE bookings.airports_data IS 'Airports (internal data)';


--
-- Name: COLUMN airports_data.airport_code; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.airports_data.airport_code IS 'Airport code';


--
-- Name: COLUMN airports_data.airport_name; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.airports_data.airport_name IS 'Airport name';


--
-- Name: COLUMN airports_data.city; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.airports_data.city IS 'City';


--
-- Name: COLUMN airports_data.coordinates; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.airports_data.coordinates IS 'Airport coordinates (longitude and latitude)';


--
-- Name: COLUMN airports_data.timezone; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.airports_data.timezone IS 'Airport time zone';


--
-- Name: airports; Type: VIEW; Schema: bookings; Owner: postgres
--

CREATE VIEW bookings.airports AS
 SELECT airport_code,
    (airport_name ->> bookings.lang()) AS airport_name,
    (city ->> bookings.lang()) AS city,
    coordinates,
    timezone
   FROM bookings.airports_data ml;


ALTER VIEW bookings.airports OWNER TO postgres;

--
-- Name: VIEW airports; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON VIEW bookings.airports IS 'Airports';


--
-- Name: COLUMN airports.airport_code; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.airports.airport_code IS 'Airport code';


--
-- Name: COLUMN airports.airport_name; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.airports.airport_name IS 'Airport name';


--
-- Name: COLUMN airports.city; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.airports.city IS 'City';


--
-- Name: COLUMN airports.coordinates; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.airports.coordinates IS 'Airport coordinates (longitude and latitude)';


--
-- Name: COLUMN airports.timezone; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.airports.timezone IS 'Airport time zone';


--
-- Name: bank_accounts; Type: TABLE; Schema: bookings; Owner: postgres
--

CREATE TABLE bookings.bank_accounts (
    id integer NOT NULL,
    account_number character varying(20),
    balance integer
);


ALTER TABLE bookings.bank_accounts OWNER TO postgres;

--
-- Name: bank_accounts_id_seq; Type: SEQUENCE; Schema: bookings; Owner: postgres
--

CREATE SEQUENCE bookings.bank_accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bookings.bank_accounts_id_seq OWNER TO postgres;

--
-- Name: bank_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: bookings; Owner: postgres
--

ALTER SEQUENCE bookings.bank_accounts_id_seq OWNED BY bookings.bank_accounts.id;


--
-- Name: boarding_passes; Type: TABLE; Schema: bookings; Owner: postgres
--

CREATE TABLE bookings.boarding_passes (
    ticket_no character(13) NOT NULL,
    flight_id integer NOT NULL,
    boarding_no integer NOT NULL,
    seat_no text NOT NULL
);


ALTER TABLE bookings.boarding_passes OWNER TO postgres;

--
-- Name: TABLE boarding_passes; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON TABLE bookings.boarding_passes IS 'Boarding passes';


--
-- Name: COLUMN boarding_passes.ticket_no; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.boarding_passes.ticket_no IS 'Ticket number';


--
-- Name: COLUMN boarding_passes.flight_id; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.boarding_passes.flight_id IS 'Flight ID';


--
-- Name: COLUMN boarding_passes.boarding_no; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.boarding_passes.boarding_no IS 'Boarding pass number';


--
-- Name: COLUMN boarding_passes.seat_no; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.boarding_passes.seat_no IS 'Seat number';


--
-- Name: bookings; Type: TABLE; Schema: bookings; Owner: postgres
--

CREATE TABLE bookings.bookings (
    book_ref character(6) NOT NULL,
    book_date timestamp with time zone NOT NULL,
    total_amount numeric(10,2) NOT NULL
);


ALTER TABLE bookings.bookings OWNER TO postgres;

--
-- Name: TABLE bookings; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON TABLE bookings.bookings IS 'Bookings';


--
-- Name: COLUMN bookings.book_ref; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.bookings.book_ref IS 'Booking number';


--
-- Name: COLUMN bookings.book_date; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.bookings.book_date IS 'Booking date';


--
-- Name: COLUMN bookings.total_amount; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.bookings.total_amount IS 'Total booking cost';


--
-- Name: flights; Type: TABLE; Schema: bookings; Owner: postgres
--

CREATE TABLE bookings.flights (
    flight_id integer NOT NULL,
    flight_no character(6) NOT NULL,
    scheduled_departure timestamp with time zone NOT NULL,
    scheduled_arrival timestamp with time zone NOT NULL,
    departure_airport character(3) NOT NULL,
    arrival_airport character(3) NOT NULL,
    status character varying(20) NOT NULL,
    aircraft_code character(3) NOT NULL,
    actual_departure timestamp with time zone,
    actual_arrival timestamp with time zone,
    total_seats integer,
    seats_booked integer,
    CONSTRAINT flights_check CHECK ((scheduled_arrival > scheduled_departure)),
    CONSTRAINT flights_check1 CHECK (((actual_arrival IS NULL) OR ((actual_departure IS NOT NULL) AND (actual_arrival IS NOT NULL) AND (actual_arrival > actual_departure)))),
    CONSTRAINT flights_status_check CHECK (((status)::text = ANY (ARRAY[('On Time'::character varying)::text, ('Delayed'::character varying)::text, ('Departed'::character varying)::text, ('Arrived'::character varying)::text, ('Scheduled'::character varying)::text, ('Cancelled'::character varying)::text])))
);


ALTER TABLE bookings.flights OWNER TO postgres;

--
-- Name: TABLE flights; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON TABLE bookings.flights IS 'Flights';


--
-- Name: COLUMN flights.flight_id; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.flights.flight_id IS 'Flight ID';


--
-- Name: COLUMN flights.flight_no; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.flights.flight_no IS 'Flight number';


--
-- Name: COLUMN flights.scheduled_departure; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.flights.scheduled_departure IS 'Scheduled departure time';


--
-- Name: COLUMN flights.scheduled_arrival; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.flights.scheduled_arrival IS 'Scheduled arrival time';


--
-- Name: COLUMN flights.departure_airport; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.flights.departure_airport IS 'Airport of departure';


--
-- Name: COLUMN flights.arrival_airport; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.flights.arrival_airport IS 'Airport of arrival';


--
-- Name: COLUMN flights.status; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.flights.status IS 'Flight status';


--
-- Name: COLUMN flights.aircraft_code; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.flights.aircraft_code IS 'Aircraft code, IATA';


--
-- Name: COLUMN flights.actual_departure; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.flights.actual_departure IS 'Actual departure time';


--
-- Name: COLUMN flights.actual_arrival; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.flights.actual_arrival IS 'Actual arrival time';


--
-- Name: flights_flight_id_seq; Type: SEQUENCE; Schema: bookings; Owner: postgres
--

CREATE SEQUENCE bookings.flights_flight_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bookings.flights_flight_id_seq OWNER TO postgres;

--
-- Name: flights_flight_id_seq; Type: SEQUENCE OWNED BY; Schema: bookings; Owner: postgres
--

ALTER SEQUENCE bookings.flights_flight_id_seq OWNED BY bookings.flights.flight_id;


--
-- Name: flights_v; Type: VIEW; Schema: bookings; Owner: postgres
--

CREATE VIEW bookings.flights_v AS
 SELECT f.flight_id,
    f.flight_no,
    f.scheduled_departure,
    timezone(dep.timezone, f.scheduled_departure) AS scheduled_departure_local,
    f.scheduled_arrival,
    timezone(arr.timezone, f.scheduled_arrival) AS scheduled_arrival_local,
    (f.scheduled_arrival - f.scheduled_departure) AS scheduled_duration,
    f.departure_airport,
    dep.airport_name AS departure_airport_name,
    dep.city AS departure_city,
    f.arrival_airport,
    arr.airport_name AS arrival_airport_name,
    arr.city AS arrival_city,
    f.status,
    f.aircraft_code,
    f.actual_departure,
    timezone(dep.timezone, f.actual_departure) AS actual_departure_local,
    f.actual_arrival,
    timezone(arr.timezone, f.actual_arrival) AS actual_arrival_local,
    (f.actual_arrival - f.actual_departure) AS actual_duration
   FROM bookings.flights f,
    bookings.airports dep,
    bookings.airports arr
  WHERE ((f.departure_airport = dep.airport_code) AND (f.arrival_airport = arr.airport_code));


ALTER VIEW bookings.flights_v OWNER TO postgres;

--
-- Name: VIEW flights_v; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON VIEW bookings.flights_v IS 'Flights (extended)';


--
-- Name: COLUMN flights_v.flight_id; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.flights_v.flight_id IS 'Flight ID';


--
-- Name: COLUMN flights_v.flight_no; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.flights_v.flight_no IS 'Flight number';


--
-- Name: COLUMN flights_v.scheduled_departure; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.flights_v.scheduled_departure IS 'Scheduled departure time';


--
-- Name: COLUMN flights_v.scheduled_departure_local; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.flights_v.scheduled_departure_local IS 'Scheduled departure time, local time at the point of departure';


--
-- Name: COLUMN flights_v.scheduled_arrival; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.flights_v.scheduled_arrival IS 'Scheduled arrival time';


--
-- Name: COLUMN flights_v.scheduled_arrival_local; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.flights_v.scheduled_arrival_local IS 'Scheduled arrival time, local time at the point of destination';


--
-- Name: COLUMN flights_v.scheduled_duration; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.flights_v.scheduled_duration IS 'Scheduled flight duration';


--
-- Name: COLUMN flights_v.departure_airport; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.flights_v.departure_airport IS 'Deprature airport code';


--
-- Name: COLUMN flights_v.departure_airport_name; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.flights_v.departure_airport_name IS 'Departure airport name';


--
-- Name: COLUMN flights_v.departure_city; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.flights_v.departure_city IS 'City of departure';


--
-- Name: COLUMN flights_v.arrival_airport; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.flights_v.arrival_airport IS 'Arrival airport code';


--
-- Name: COLUMN flights_v.arrival_airport_name; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.flights_v.arrival_airport_name IS 'Arrival airport name';


--
-- Name: COLUMN flights_v.arrival_city; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.flights_v.arrival_city IS 'City of arrival';


--
-- Name: COLUMN flights_v.status; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.flights_v.status IS 'Flight status';


--
-- Name: COLUMN flights_v.aircraft_code; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.flights_v.aircraft_code IS 'Aircraft code, IATA';


--
-- Name: COLUMN flights_v.actual_departure; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.flights_v.actual_departure IS 'Actual departure time';


--
-- Name: COLUMN flights_v.actual_departure_local; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.flights_v.actual_departure_local IS 'Actual departure time, local time at the point of departure';


--
-- Name: COLUMN flights_v.actual_arrival; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.flights_v.actual_arrival IS 'Actual arrival time';


--
-- Name: COLUMN flights_v.actual_arrival_local; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.flights_v.actual_arrival_local IS 'Actual arrival time, local time at the point of destination';


--
-- Name: COLUMN flights_v.actual_duration; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.flights_v.actual_duration IS 'Actual flight duration';


--
-- Name: passengers; Type: TABLE; Schema: bookings; Owner: postgres
--

CREATE TABLE bookings.passengers (
    passenger_id integer NOT NULL,
    passenger_name text,
    contact_data jsonb,
    created_at timestamp with time zone
);


ALTER TABLE bookings.passengers OWNER TO postgres;

--
-- Name: passengers_passenger_id_seq; Type: SEQUENCE; Schema: bookings; Owner: postgres
--

CREATE SEQUENCE bookings.passengers_passenger_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE bookings.passengers_passenger_id_seq OWNER TO postgres;

--
-- Name: passengers_passenger_id_seq; Type: SEQUENCE OWNED BY; Schema: bookings; Owner: postgres
--

ALTER SEQUENCE bookings.passengers_passenger_id_seq OWNED BY bookings.passengers.passenger_id;


--
-- Name: routes; Type: VIEW; Schema: bookings; Owner: postgres
--

CREATE VIEW bookings.routes AS
 WITH f3 AS (
         SELECT f2.flight_no,
            f2.departure_airport,
            f2.arrival_airport,
            f2.aircraft_code,
            f2.duration,
            array_agg(f2.days_of_week) AS days_of_week
           FROM ( SELECT f1.flight_no,
                    f1.departure_airport,
                    f1.arrival_airport,
                    f1.aircraft_code,
                    f1.duration,
                    f1.days_of_week
                   FROM ( SELECT flights.flight_no,
                            flights.departure_airport,
                            flights.arrival_airport,
                            flights.aircraft_code,
                            (flights.scheduled_arrival - flights.scheduled_departure) AS duration,
                            (to_char(flights.scheduled_departure, 'ID'::text))::integer AS days_of_week
                           FROM bookings.flights) f1
                  GROUP BY f1.flight_no, f1.departure_airport, f1.arrival_airport, f1.aircraft_code, f1.duration, f1.days_of_week
                  ORDER BY f1.flight_no, f1.departure_airport, f1.arrival_airport, f1.aircraft_code, f1.duration, f1.days_of_week) f2
          GROUP BY f2.flight_no, f2.departure_airport, f2.arrival_airport, f2.aircraft_code, f2.duration
        )
 SELECT f3.flight_no,
    f3.departure_airport,
    dep.airport_name AS departure_airport_name,
    dep.city AS departure_city,
    f3.arrival_airport,
    arr.airport_name AS arrival_airport_name,
    arr.city AS arrival_city,
    f3.aircraft_code,
    f3.duration,
    f3.days_of_week
   FROM f3,
    bookings.airports dep,
    bookings.airports arr
  WHERE ((f3.departure_airport = dep.airport_code) AND (f3.arrival_airport = arr.airport_code));


ALTER VIEW bookings.routes OWNER TO postgres;

--
-- Name: VIEW routes; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON VIEW bookings.routes IS 'Routes';


--
-- Name: COLUMN routes.flight_no; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.routes.flight_no IS 'Flight number';


--
-- Name: COLUMN routes.departure_airport; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.routes.departure_airport IS 'Code of airport of departure';


--
-- Name: COLUMN routes.departure_airport_name; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.routes.departure_airport_name IS 'Name of airport of departure';


--
-- Name: COLUMN routes.departure_city; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.routes.departure_city IS 'City of departure';


--
-- Name: COLUMN routes.arrival_airport; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.routes.arrival_airport IS 'Code of airport of arrival';


--
-- Name: COLUMN routes.arrival_airport_name; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.routes.arrival_airport_name IS 'Name of airport of arrival';


--
-- Name: COLUMN routes.arrival_city; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.routes.arrival_city IS 'City of arrival';


--
-- Name: COLUMN routes.aircraft_code; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.routes.aircraft_code IS 'Aircraft code, IATA';


--
-- Name: COLUMN routes.duration; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.routes.duration IS 'Scheduled duration of flight';


--
-- Name: COLUMN routes.days_of_week; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.routes.days_of_week IS 'Days of week on which flights are scheduled';


--
-- Name: seats; Type: TABLE; Schema: bookings; Owner: postgres
--

CREATE TABLE bookings.seats (
    aircraft_code character(3) NOT NULL,
    seat_no text NOT NULL,
    fare_conditions character varying(10) NOT NULL,
    CONSTRAINT seats_fare_conditions_check CHECK (((fare_conditions)::text = ANY (ARRAY[('Economy'::character varying)::text, ('Comfort'::character varying)::text, ('Business'::character varying)::text])))
);


ALTER TABLE bookings.seats OWNER TO postgres;

--
-- Name: TABLE seats; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON TABLE bookings.seats IS 'Seats';


--
-- Name: COLUMN seats.aircraft_code; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.seats.aircraft_code IS 'Aircraft code, IATA';


--
-- Name: COLUMN seats.seat_no; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.seats.seat_no IS 'Seat number';


--
-- Name: COLUMN seats.fare_conditions; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.seats.fare_conditions IS 'Travel class';


--
-- Name: ticket_flights; Type: TABLE; Schema: bookings; Owner: postgres
--

CREATE TABLE bookings.ticket_flights (
    ticket_no character(13) NOT NULL,
    flight_id integer NOT NULL,
    fare_conditions character varying(10) NOT NULL,
    amount numeric(10,2) NOT NULL,
    CONSTRAINT ticket_flights_amount_check CHECK ((amount >= (0)::numeric)),
    CONSTRAINT ticket_flights_fare_conditions_check CHECK (((fare_conditions)::text = ANY (ARRAY[('Economy'::character varying)::text, ('Comfort'::character varying)::text, ('Business'::character varying)::text])))
);


ALTER TABLE bookings.ticket_flights OWNER TO postgres;

--
-- Name: TABLE ticket_flights; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON TABLE bookings.ticket_flights IS 'Flight segment';


--
-- Name: COLUMN ticket_flights.ticket_no; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.ticket_flights.ticket_no IS 'Ticket number';


--
-- Name: COLUMN ticket_flights.flight_id; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.ticket_flights.flight_id IS 'Flight ID';


--
-- Name: COLUMN ticket_flights.fare_conditions; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.ticket_flights.fare_conditions IS 'Travel class';


--
-- Name: COLUMN ticket_flights.amount; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.ticket_flights.amount IS 'Travel cost';


--
-- Name: tickets; Type: TABLE; Schema: bookings; Owner: postgres
--

CREATE TABLE bookings.tickets (
    ticket_no character(13) NOT NULL,
    book_ref character(6) NOT NULL,
    passenger_id integer NOT NULL,
    passenger_name text NOT NULL,
    contact_data jsonb,
    amount numeric(10,2)
);


ALTER TABLE bookings.tickets OWNER TO postgres;

--
-- Name: TABLE tickets; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON TABLE bookings.tickets IS 'Tickets';


--
-- Name: COLUMN tickets.ticket_no; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.tickets.ticket_no IS 'Ticket number';


--
-- Name: COLUMN tickets.book_ref; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.tickets.book_ref IS 'Booking number';


--
-- Name: COLUMN tickets.passenger_id; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.tickets.passenger_id IS 'Passenger ID';


--
-- Name: COLUMN tickets.passenger_name; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.tickets.passenger_name IS 'Passenger name';


--
-- Name: COLUMN tickets.contact_data; Type: COMMENT; Schema: bookings; Owner: postgres
--

COMMENT ON COLUMN bookings.tickets.contact_data IS 'Passenger contact information';


--
-- Name: bank_accounts id; Type: DEFAULT; Schema: bookings; Owner: postgres
--

ALTER TABLE ONLY bookings.bank_accounts ALTER COLUMN id SET DEFAULT nextval('bookings.bank_accounts_id_seq'::regclass);


--
-- Name: flights flight_id; Type: DEFAULT; Schema: bookings; Owner: postgres
--

ALTER TABLE ONLY bookings.flights ALTER COLUMN flight_id SET DEFAULT nextval('bookings.flights_flight_id_seq'::regclass);


--
-- Name: passengers passenger_id; Type: DEFAULT; Schema: bookings; Owner: postgres
--

ALTER TABLE ONLY bookings.passengers ALTER COLUMN passenger_id SET DEFAULT nextval('bookings.passengers_passenger_id_seq'::regclass);


--
-- Name: aircrafts_data aircrafts_pkey; Type: CONSTRAINT; Schema: bookings; Owner: postgres
--

ALTER TABLE ONLY bookings.aircrafts_data
    ADD CONSTRAINT aircrafts_pkey PRIMARY KEY (aircraft_code);


--
-- Name: airports_data airports_data_pkey; Type: CONSTRAINT; Schema: bookings; Owner: postgres
--

ALTER TABLE ONLY bookings.airports_data
    ADD CONSTRAINT airports_data_pkey PRIMARY KEY (airport_code);


--
-- Name: bank_accounts bank_accounts_account_number_key; Type: CONSTRAINT; Schema: bookings; Owner: postgres
--

ALTER TABLE ONLY bookings.bank_accounts
    ADD CONSTRAINT bank_accounts_account_number_key UNIQUE (account_number);


--
-- Name: bank_accounts bank_accounts_pkey; Type: CONSTRAINT; Schema: bookings; Owner: postgres
--

ALTER TABLE ONLY bookings.bank_accounts
    ADD CONSTRAINT bank_accounts_pkey PRIMARY KEY (id);


--
-- Name: boarding_passes boarding_passes_pkey; Type: CONSTRAINT; Schema: bookings; Owner: postgres
--

ALTER TABLE ONLY bookings.boarding_passes
    ADD CONSTRAINT boarding_passes_pkey PRIMARY KEY (ticket_no, flight_id);


--
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: bookings; Owner: postgres
--

ALTER TABLE ONLY bookings.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (book_ref);


--
-- Name: flights flights_pkey; Type: CONSTRAINT; Schema: bookings; Owner: postgres
--

ALTER TABLE ONLY bookings.flights
    ADD CONSTRAINT flights_pkey PRIMARY KEY (flight_id);

ALTER TABLE bookings.flights CLUSTER ON flights_pkey;


--
-- Name: passengers passengers_pkey; Type: CONSTRAINT; Schema: bookings; Owner: postgres
--

ALTER TABLE ONLY bookings.passengers
    ADD CONSTRAINT passengers_pkey PRIMARY KEY (passenger_id);


--
-- Name: seats seats_pkey; Type: CONSTRAINT; Schema: bookings; Owner: postgres
--

ALTER TABLE ONLY bookings.seats
    ADD CONSTRAINT seats_pkey PRIMARY KEY (aircraft_code, seat_no);


--
-- Name: ticket_flights ticket_flights_pkey; Type: CONSTRAINT; Schema: bookings; Owner: postgres
--

ALTER TABLE ONLY bookings.ticket_flights
    ADD CONSTRAINT ticket_flights_pkey PRIMARY KEY (ticket_no, flight_id);


--
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: bookings; Owner: postgres
--

ALTER TABLE ONLY bookings.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (ticket_no);


--
-- Name: boarding_passes_flight_idx; Type: INDEX; Schema: bookings; Owner: postgres
--

CREATE INDEX boarding_passes_flight_idx ON bookings.boarding_passes USING btree (flight_id);


--
-- Name: boarding_passes_seat_flight_idx; Type: INDEX; Schema: bookings; Owner: postgres
--

CREATE INDEX boarding_passes_seat_flight_idx ON bookings.boarding_passes USING btree (flight_id, seat_no);


--
-- Name: boarding_passes_seat_flight_ticket_idx; Type: INDEX; Schema: bookings; Owner: postgres
--

CREATE INDEX boarding_passes_seat_flight_ticket_idx ON bookings.boarding_passes USING btree (flight_id, seat_no, ticket_no);


--
-- Name: boarding_passes_seat_idx; Type: INDEX; Schema: bookings; Owner: postgres
--

CREATE INDEX boarding_passes_seat_idx ON bookings.boarding_passes USING btree (seat_no);


--
-- Name: boarding_passes_uidx; Type: INDEX; Schema: bookings; Owner: postgres
--

CREATE UNIQUE INDEX boarding_passes_uidx ON bookings.boarding_passes USING btree (flight_id, seat_no);


--
-- Name: bookings_book_date_brin_idx; Type: INDEX; Schema: bookings; Owner: postgres
--

CREATE INDEX bookings_book_date_brin_idx ON bookings.bookings USING brin (book_date);


--
-- Name: flights_actual_departure_idx; Type: INDEX; Schema: bookings; Owner: postgres
--

CREATE INDEX flights_actual_departure_idx ON bookings.flights USING btree (actual_departure);


--
-- Name: flights_aircraft_code_idx; Type: INDEX; Schema: bookings; Owner: postgres
--

CREATE INDEX flights_aircraft_code_idx ON bookings.flights USING btree (aircraft_code);


--
-- Name: flights_composite_idx; Type: INDEX; Schema: bookings; Owner: postgres
--

CREATE INDEX flights_composite_idx ON bookings.flights USING btree (arrival_airport, actual_arrival);


--
-- Name: flights_scheduled_departure_idx; Type: INDEX; Schema: bookings; Owner: postgres
--

CREATE INDEX flights_scheduled_departure_idx ON bookings.flights USING btree (scheduled_departure);


--
-- Name: flights_scheduled_departure_scheduled_idx; Type: INDEX; Schema: bookings; Owner: postgres
--

CREATE INDEX flights_scheduled_departure_scheduled_idx ON bookings.flights USING btree (scheduled_departure) WHERE ((status)::text = 'Scheduled'::text);


--
-- Name: idx_tickets_book_ref; Type: INDEX; Schema: bookings; Owner: postgres
--

CREATE INDEX idx_tickets_book_ref ON bookings.tickets USING btree (book_ref);


--
-- Name: idx_tickets_book_ref_passenger; Type: INDEX; Schema: bookings; Owner: postgres
--

CREATE INDEX idx_tickets_book_ref_passenger ON bookings.tickets USING btree (passenger_id, book_ref);


--
-- Name: passengers_created_at_idx; Type: INDEX; Schema: bookings; Owner: postgres
--

CREATE INDEX passengers_created_at_idx ON bookings.passengers USING btree (created_at);


--
-- Name: ticket_flights_fare_conditions_idx; Type: INDEX; Schema: bookings; Owner: postgres
--

CREATE INDEX ticket_flights_fare_conditions_idx ON bookings.ticket_flights USING btree (fare_conditions);


--
-- Name: tickets_passenger_idx; Type: INDEX; Schema: bookings; Owner: postgres
--

CREATE INDEX tickets_passenger_idx ON bookings.tickets USING btree (passenger_id) INCLUDE (amount);


--
-- Name: boarding_passes boarding_passes_ticket_no_fkey; Type: FK CONSTRAINT; Schema: bookings; Owner: postgres
--

ALTER TABLE ONLY bookings.boarding_passes
    ADD CONSTRAINT boarding_passes_ticket_no_fkey FOREIGN KEY (ticket_no, flight_id) REFERENCES bookings.ticket_flights(ticket_no, flight_id);


--
-- Name: flights flights_aircraft_code_fkey; Type: FK CONSTRAINT; Schema: bookings; Owner: postgres
--

ALTER TABLE ONLY bookings.flights
    ADD CONSTRAINT flights_aircraft_code_fkey FOREIGN KEY (aircraft_code) REFERENCES bookings.aircrafts_data(aircraft_code);


--
-- Name: flights flights_arrival_airport_fkey; Type: FK CONSTRAINT; Schema: bookings; Owner: postgres
--

ALTER TABLE ONLY bookings.flights
    ADD CONSTRAINT flights_arrival_airport_fkey FOREIGN KEY (arrival_airport) REFERENCES bookings.airports_data(airport_code);


--
-- Name: flights flights_departure_airport_fkey; Type: FK CONSTRAINT; Schema: bookings; Owner: postgres
--

ALTER TABLE ONLY bookings.flights
    ADD CONSTRAINT flights_departure_airport_fkey FOREIGN KEY (departure_airport) REFERENCES bookings.airports_data(airport_code);


--
-- Name: seats seats_aircraft_code_fkey; Type: FK CONSTRAINT; Schema: bookings; Owner: postgres
--

ALTER TABLE ONLY bookings.seats
    ADD CONSTRAINT seats_aircraft_code_fkey FOREIGN KEY (aircraft_code) REFERENCES bookings.aircrafts_data(aircraft_code) ON DELETE CASCADE;


--
-- Name: ticket_flights ticket_flights_flight_id_fkey; Type: FK CONSTRAINT; Schema: bookings; Owner: postgres
--

ALTER TABLE ONLY bookings.ticket_flights
    ADD CONSTRAINT ticket_flights_flight_id_fkey FOREIGN KEY (flight_id) REFERENCES bookings.flights(flight_id);


--
-- Name: ticket_flights ticket_flights_ticket_no_fkey; Type: FK CONSTRAINT; Schema: bookings; Owner: postgres
--

ALTER TABLE ONLY bookings.ticket_flights
    ADD CONSTRAINT ticket_flights_ticket_no_fkey FOREIGN KEY (ticket_no) REFERENCES bookings.tickets(ticket_no);


--
-- Name: tickets tickets_book_ref_fkey; Type: FK CONSTRAINT; Schema: bookings; Owner: postgres
--

ALTER TABLE ONLY bookings.tickets
    ADD CONSTRAINT tickets_book_ref_fkey FOREIGN KEY (book_ref) REFERENCES bookings.bookings(book_ref);


--
-- Name: FUNCTION pg_database_size(name); Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT ALL ON FUNCTION pg_catalog.pg_database_size(name) TO zabbix;


--
-- Name: TABLE pg_locks; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT SELECT ON TABLE pg_catalog.pg_locks TO zabbix;


--
-- Name: TABLE pg_stat_activity; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT SELECT ON TABLE pg_catalog.pg_stat_activity TO zabbix;


--
-- Name: TABLE pg_stat_all_indexes; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT SELECT ON TABLE pg_catalog.pg_stat_all_indexes TO zabbix;


--
-- Name: TABLE pg_stat_database; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT SELECT ON TABLE pg_catalog.pg_stat_database TO zabbix;
GRANT SELECT ON TABLE pg_catalog.pg_stat_database TO zbx_monitor;


--
-- Name: TABLE pg_stat_replication; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT SELECT ON TABLE pg_catalog.pg_stat_replication TO zabbix;


--
-- Name: TABLE pg_stat_user_tables; Type: ACL; Schema: pg_catalog; Owner: postgres
--

GRANT SELECT ON TABLE pg_catalog.pg_stat_user_tables TO zabbix;


--
-- PostgreSQL database dump complete
--

\unrestrict WNSzKfwQLKf4teh511pqh3ITUWXKpGeq3Tw8ubj6P6rOboYoejF8ULxsCXFXG21

ALTER DATABASE training SET search_path = hr,finance,bookings,public;