--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: administrator; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.administrator (
    id integer NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    birth_date date NOT NULL,
    user_id bigint
);


ALTER TABLE public.administrator OWNER TO postgres;

--
-- Name: administrator_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.administrator_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.administrator_id_seq OWNER TO postgres;

--
-- Name: administrator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.administrator_id_seq OWNED BY public.administrator.id;


--
-- Name: affiliated_company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.affiliated_company (
    id bigint NOT NULL,
    employer_id bigint NOT NULL,
    name character varying NOT NULL,
    user_id bigint
);


ALTER TABLE public.affiliated_company OWNER TO postgres;

--
-- Name: affiliated_company_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.affiliated_company_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.affiliated_company_id_seq OWNER TO postgres;

--
-- Name: affiliated_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.affiliated_company_id_seq OWNED BY public.affiliated_company.id;


--
-- Name: affiliated_company_payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.affiliated_company_payment (
    id bigint NOT NULL,
    payment_number character varying(256) NOT NULL,
    from_account_id bigint,
    to_account_id bigint,
    amount double precision
);


ALTER TABLE public.affiliated_company_payment OWNER TO postgres;

--
-- Name: affiliated_company_payment_account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.affiliated_company_payment_account (
    id bigint NOT NULL,
    company_id bigint,
    payment_account_id bigint
);


ALTER TABLE public.affiliated_company_payment_account OWNER TO postgres;

--
-- Name: affiliated_company_payment_account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.affiliated_company_payment_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.affiliated_company_payment_account_id_seq OWNER TO postgres;

--
-- Name: affiliated_company_payment_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.affiliated_company_payment_account_id_seq OWNED BY public.affiliated_company_payment_account.id;


--
-- Name: affiliated_company_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.affiliated_company_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.affiliated_company_payment_id_seq OWNER TO postgres;

--
-- Name: affiliated_company_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.affiliated_company_payment_id_seq OWNED BY public.affiliated_company_payment.id;


--
-- Name: airport; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.airport (
    id integer NOT NULL,
    district_id bigint NOT NULL,
    address character varying NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.airport OWNER TO postgres;

--
-- Name: airport_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.airport_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.airport_id_seq OWNER TO postgres;

--
-- Name: airport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.airport_id_seq OWNED BY public.airport.id;


--
-- Name: airport_transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.airport_transaction (
    id bigint NOT NULL,
    airport_id bigint NOT NULL,
    transaction_date timestamp without time zone NOT NULL,
    price double precision NOT NULL,
    payment_id bigint,
    vehicle_id bigint,
    driver_id bigint,
    hotel_id bigint
);


ALTER TABLE public.airport_transaction OWNER TO postgres;

--
-- Name: airport_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.airport_transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.airport_transaction_id_seq OWNER TO postgres;

--
-- Name: airport_transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.airport_transaction_id_seq OWNED BY public.airport_transaction.id;


--
-- Name: branch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.branch (
    id bigint NOT NULL,
    district_id bigint NOT NULL,
    address character varying NOT NULL,
    name character varying NOT NULL,
    phone character varying(256),
    email character varying(256)
);


ALTER TABLE public.branch OWNER TO postgres;

--
-- Name: branch_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.branch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.branch_id_seq OWNER TO postgres;

--
-- Name: branch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.branch_id_seq OWNED BY public.branch.id;


--
-- Name: capital; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.capital (
    id_country bigint,
    id_state bigint
);


ALTER TABLE public.capital OWNER TO postgres;

--
-- Name: city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city (
    id integer NOT NULL,
    state_id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.city OWNER TO postgres;

--
-- Name: city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.city_id_seq OWNER TO postgres;

--
-- Name: city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.city_id_seq OWNED BY public.city.id;


--
-- Name: company_payment_account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_payment_account (
    id bigint NOT NULL,
    payment_account_id bigint NOT NULL
);


ALTER TABLE public.company_payment_account OWNER TO postgres;

--
-- Name: company_payment_account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.company_payment_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.company_payment_account_id_seq OWNER TO postgres;

--
-- Name: company_payment_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.company_payment_account_id_seq OWNED BY public.company_payment_account.id;


--
-- Name: country; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.country (
    id smallint NOT NULL,
    name character varying NOT NULL,
    code character varying(256)
);


ALTER TABLE public.country OWNER TO postgres;

--
-- Name: country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.country_id_seq
    AS smallint
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.country_id_seq OWNER TO postgres;

--
-- Name: country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.country_id_seq OWNED BY public.country.id;


--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    id bigint NOT NULL,
    passport_id bigint NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    birth_date date NOT NULL,
    user_id bigint
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_id_seq OWNER TO postgres;

--
-- Name: customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_id_seq OWNED BY public.customer.id;


--
-- Name: district; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.district (
    id integer NOT NULL,
    city_id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.district OWNER TO postgres;

--
-- Name: district_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.district_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.district_id_seq OWNER TO postgres;

--
-- Name: district_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.district_id_seq OWNED BY public.district.id;


--
-- Name: driver; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.driver (
    id bigint NOT NULL,
    driver_license_id bigint NOT NULL,
    affiliated_company_id bigint,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    birth_date date NOT NULL,
    user_id bigint
);


ALTER TABLE public.driver OWNER TO postgres;

--
-- Name: driver_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.driver_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.driver_id_seq OWNER TO postgres;

--
-- Name: driver_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.driver_id_seq OWNED BY public.driver.id;


--
-- Name: driver_license; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.driver_license (
    id bigint NOT NULL,
    country_id smallint NOT NULL,
    verified_by integer,
    verified_at timestamp without time zone,
    license_number character varying NOT NULL,
    issued_at date NOT NULL,
    expires_at date NOT NULL
);


ALTER TABLE public.driver_license OWNER TO postgres;

--
-- Name: driver_license_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.driver_license_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.driver_license_id_seq OWNER TO postgres;

--
-- Name: driver_license_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.driver_license_id_seq OWNED BY public.driver_license.id;


--
-- Name: driver_payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.driver_payment (
    id bigint NOT NULL,
    from_acount_id integer NOT NULL,
    to_account_id integer NOT NULL,
    payment_number character varying,
    amount double precision NOT NULL
);


ALTER TABLE public.driver_payment OWNER TO postgres;

--
-- Name: driver_payment_account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.driver_payment_account (
    id bigint NOT NULL,
    driver_id bigint NOT NULL,
    payment_account_id bigint NOT NULL
);


ALTER TABLE public.driver_payment_account OWNER TO postgres;

--
-- Name: driver_payment_account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.driver_payment_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.driver_payment_account_id_seq OWNER TO postgres;

--
-- Name: driver_payment_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.driver_payment_account_id_seq OWNED BY public.driver_payment_account.id;


--
-- Name: driver_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.driver_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.driver_payment_id_seq OWNER TO postgres;

--
-- Name: driver_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.driver_payment_id_seq OWNED BY public.driver_payment.id;


--
-- Name: employer_identifier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employer_identifier (
    id bigint NOT NULL,
    country_id smallint NOT NULL,
    verified_at timestamp without time zone,
    employee_number character varying NOT NULL,
    issued_at date NOT NULL,
    expires_at date NOT NULL,
    verified_by bigint
);


ALTER TABLE public.employer_identifier OWNER TO postgres;

--
-- Name: employer_identifier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employer_identifier_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.employer_identifier_id_seq OWNER TO postgres;

--
-- Name: employer_identifier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employer_identifier_id_seq OWNED BY public.employer_identifier.id;


--
-- Name: hotel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hotel (
    id integer NOT NULL,
    district_id integer NOT NULL,
    address character varying NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.hotel OWNER TO postgres;

--
-- Name: hotel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hotel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hotel_id_seq OWNER TO postgres;

--
-- Name: hotel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hotel_id_seq OWNED BY public.hotel.id;


--
-- Name: passport; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.passport (
    id bigint NOT NULL,
    country_id smallint NOT NULL,
    verified_by integer,
    verified_at timestamp without time zone,
    passport_number character varying NOT NULL,
    issued_at date NOT NULL,
    expires_at date NOT NULL
);


ALTER TABLE public.passport OWNER TO postgres;

--
-- Name: passport_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.passport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.passport_id_seq OWNER TO postgres;

--
-- Name: passport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.passport_id_seq OWNED BY public.passport.id;


--
-- Name: payment_account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_account (
    id bigint NOT NULL,
    platform character varying NOT NULL,
    account_number character varying NOT NULL,
    picture character varying,
    owner character varying NOT NULL,
    email character varying NOT NULL
);


ALTER TABLE public.payment_account OWNER TO postgres;

--
-- Name: payment_account_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payment_account_id_seq OWNER TO postgres;

--
-- Name: payment_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_account_id_seq OWNED BY public.payment_account.id;


--
-- Name: sojourn; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sojourn (
    id bigint NOT NULL,
    district_id integer NOT NULL,
    customer_id bigint NOT NULL,
    check_in date NOT NULL,
    check_out date NOT NULL
);


ALTER TABLE public.sojourn OWNER TO postgres;

--
-- Name: sojourn_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sojourn_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sojourn_id_seq OWNER TO postgres;

--
-- Name: sojourn_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sojourn_id_seq OWNED BY public.sojourn.id;


--
-- Name: states; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.states (
    id integer NOT NULL,
    country_id smallint NOT NULL,
    name character varying NOT NULL,
    parent_division_id integer,
    levels integer,
    code character varying(256)
);


ALTER TABLE public.states OWNER TO postgres;

--
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.states_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.states_id_seq OWNER TO postgres;

--
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.states_id_seq OWNED BY public.states.id;


--
-- Name: user_payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_payment (
    id bigint NOT NULL,
    account_id bigint NOT NULL,
    verified_at timestamp without time zone,
    reference_number character varying NOT NULL,
    amount double precision NOT NULL
);


ALTER TABLE public.user_payment OWNER TO postgres;

--
-- Name: user_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_payment_id_seq OWNER TO postgres;

--
-- Name: user_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_payment_id_seq OWNED BY public.user_payment.id;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id bigint NOT NULL,
    username character varying NOT NULL,
    password character varying NOT NULL,
    email character varying NOT NULL,
    email_verified_at timestamp without time zone,
    phone character varying,
    joined_at date NOT NULL,
    suspended_at date
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_id_seq OWNER TO postgres;

--
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_seq OWNED BY public.usuario.id;


--
-- Name: vehicle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicle (
    id bigint NOT NULL,
    branch_id bigint NOT NULL,
    license_plate character varying NOT NULL,
    brand character varying NOT NULL,
    model character varying NOT NULL,
    year integer NOT NULL,
    transmission character varying NOT NULL,
    color character varying,
    price double precision NOT NULL,
    number_passengers smallint,
    available boolean NOT NULL
);


ALTER TABLE public.vehicle OWNER TO postgres;

--
-- Name: vehicle_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vehicle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vehicle_id_seq OWNER TO postgres;

--
-- Name: vehicle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vehicle_id_seq OWNED BY public.vehicle.id;


--
-- Name: vehicle_rental; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicle_rental (
    id bigint NOT NULL,
    vehicle_id bigint NOT NULL,
    driver_id bigint NOT NULL,
    start_date date NOT NULL,
    end_date date NOT NULL,
    total double precision NOT NULL,
    mileage_kilometers double precision,
    insurance_taken boolean,
    sojourn_id bigint
);


ALTER TABLE public.vehicle_rental OWNER TO postgres;

--
-- Name: vehicle_rental_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vehicle_rental_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vehicle_rental_id_seq OWNER TO postgres;

--
-- Name: vehicle_rental_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vehicle_rental_id_seq OWNED BY public.vehicle_rental.id;


--
-- Name: vehicle_rental_payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicle_rental_payment (
    id bigint NOT NULL,
    vehicle_rental_id bigint NOT NULL,
    payment_id bigint NOT NULL,
    total_after_taxes double precision NOT NULL
);


ALTER TABLE public.vehicle_rental_payment OWNER TO postgres;

--
-- Name: vehicle_rental_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vehicle_rental_payment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vehicle_rental_payment_id_seq OWNER TO postgres;

--
-- Name: vehicle_rental_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vehicle_rental_payment_id_seq OWNED BY public.vehicle_rental_payment.id;


--
-- Name: administrator id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrator ALTER COLUMN id SET DEFAULT nextval('public.administrator_id_seq'::regclass);


--
-- Name: affiliated_company id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.affiliated_company ALTER COLUMN id SET DEFAULT nextval('public.affiliated_company_id_seq'::regclass);


--
-- Name: affiliated_company_payment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.affiliated_company_payment ALTER COLUMN id SET DEFAULT nextval('public.affiliated_company_payment_id_seq'::regclass);


--
-- Name: affiliated_company_payment_account id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.affiliated_company_payment_account ALTER COLUMN id SET DEFAULT nextval('public.affiliated_company_payment_account_id_seq'::regclass);


--
-- Name: airport id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airport ALTER COLUMN id SET DEFAULT nextval('public.airport_id_seq'::regclass);


--
-- Name: airport_transaction id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airport_transaction ALTER COLUMN id SET DEFAULT nextval('public.airport_transaction_id_seq'::regclass);


--
-- Name: branch id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch ALTER COLUMN id SET DEFAULT nextval('public.branch_id_seq'::regclass);


--
-- Name: city id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city ALTER COLUMN id SET DEFAULT nextval('public.city_id_seq'::regclass);


--
-- Name: company_payment_account id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_payment_account ALTER COLUMN id SET DEFAULT nextval('public.company_payment_account_id_seq'::regclass);


--
-- Name: country id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country ALTER COLUMN id SET DEFAULT nextval('public.country_id_seq'::regclass);


--
-- Name: customer id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer ALTER COLUMN id SET DEFAULT nextval('public.customer_id_seq'::regclass);


--
-- Name: district id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.district ALTER COLUMN id SET DEFAULT nextval('public.district_id_seq'::regclass);


--
-- Name: driver id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver ALTER COLUMN id SET DEFAULT nextval('public.driver_id_seq'::regclass);


--
-- Name: driver_license id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_license ALTER COLUMN id SET DEFAULT nextval('public.driver_license_id_seq'::regclass);


--
-- Name: driver_payment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_payment ALTER COLUMN id SET DEFAULT nextval('public.driver_payment_id_seq'::regclass);


--
-- Name: driver_payment_account id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_payment_account ALTER COLUMN id SET DEFAULT nextval('public.driver_payment_account_id_seq'::regclass);


--
-- Name: employer_identifier id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employer_identifier ALTER COLUMN id SET DEFAULT nextval('public.employer_identifier_id_seq'::regclass);


--
-- Name: hotel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotel ALTER COLUMN id SET DEFAULT nextval('public.hotel_id_seq'::regclass);


--
-- Name: passport id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passport ALTER COLUMN id SET DEFAULT nextval('public.passport_id_seq'::regclass);


--
-- Name: payment_account id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_account ALTER COLUMN id SET DEFAULT nextval('public.payment_account_id_seq'::regclass);


--
-- Name: sojourn id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sojourn ALTER COLUMN id SET DEFAULT nextval('public.sojourn_id_seq'::regclass);


--
-- Name: states id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states ALTER COLUMN id SET DEFAULT nextval('public.states_id_seq'::regclass);


--
-- Name: user_payment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_payment ALTER COLUMN id SET DEFAULT nextval('public.user_payment_id_seq'::regclass);


--
-- Name: usuario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id SET DEFAULT nextval('public.usuario_id_seq'::regclass);


--
-- Name: vehicle id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle ALTER COLUMN id SET DEFAULT nextval('public.vehicle_id_seq'::regclass);


--
-- Name: vehicle_rental id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_rental ALTER COLUMN id SET DEFAULT nextval('public.vehicle_rental_id_seq'::regclass);


--
-- Name: vehicle_rental_payment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_rental_payment ALTER COLUMN id SET DEFAULT nextval('public.vehicle_rental_payment_id_seq'::regclass);


--
-- Data for Name: administrator; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.administrator (id, first_name, last_name, birth_date, user_id) FROM stdin;
1	Alice	Smith	1985-06-15	201
2	Bob	Johnson	1990-03-22	202
3	Carol	Williams	1978-11-05	203
4	David	Brown	1983-09-14	204
5	Eve	Davis	1992-02-28	205
\.


--
-- Data for Name: affiliated_company; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.affiliated_company (id, employer_id, name, user_id) FROM stdin;
1	601	Tech Solutions Ltd.	201
2	602	Global Ventures Inc.	202
3	603	Innovative Enterprises	203
4	604	Creative Minds Co.	204
5	605	Green Energy Corp.	205
\.


--
-- Data for Name: affiliated_company_payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.affiliated_company_payment (id, payment_number, from_account_id, to_account_id, amount) FROM stdin;
1	AC001	1	1	500
2	AC002	2	2	650
3	AC003	3	3	750
4	AC004	4	4	1200
5	AC005	5	5	950
\.


--
-- Data for Name: affiliated_company_payment_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.affiliated_company_payment_account (id, company_id, payment_account_id) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	4
5	5	5
\.


--
-- Data for Name: airport; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.airport (id, district_id, address, name) FROM stdin;
1	1	123 Main St, Downtown, Los Angeles, CA	Los Angeles International Airport
2	2	456 Sunset Blvd, Hollywood, Los Angeles, CA	Hollywood Burbank Airport
3	3	789 Ocean Ave, Santa Monica, CA	Santa Monica Airport
4	4	101 City Rd, Downtown, San Francisco, CA	San Francisco International Airport
5	5	202 Redwood Blvd, Bay Area, CA	Oakland International Airport
\.


--
-- Data for Name: airport_transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.airport_transaction (id, airport_id, transaction_date, price, payment_id, vehicle_id, driver_id, hotel_id) FROM stdin;
1	1	2024-11-01 00:00:00	150	1	1	501	1
2	2	2024-11-02 00:00:00	200	2	2	502	2
3	3	2024-11-03 00:00:00	180	3	3	503	3
4	4	2024-11-04 00:00:00	220	4	4	504	4
5	5	2024-11-05 00:00:00	250	5	5	505	5
\.


--
-- Data for Name: branch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.branch (id, district_id, address, name, phone, email) FROM stdin;
1	1	101 Ocean Blvd, Santa Monica, CA	Santa Monica Branch	310-555-1234	santamonica@company.com
2	2	202 Sunset Blvd, Hollywood, CA	Hollywood Branch	323-555-5678	hollywood@company.com
3	3	303 Main St, Downtown, Los Angeles, CA	Downtown Branch	213-555-9012	downtown@company.com
4	4	404 Pine St, San Francisco, CA	Bay Area Branch	415-555-3456	bayarea@company.com
5	5	505 Redwood Rd, Oakland, CA	Oakland Branch	510-555-7890	oakland@company.com
\.


--
-- Data for Name: capital; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.capital (id_country, id_state) FROM stdin;
\.


--
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.city (id, state_id, name) FROM stdin;
1	1	Los Angeles
2	1	San Francisco
3	2	Houston
4	2	Dallas
5	3	New York City
6	3	Buffalo
7	4	Toronto
8	4	Ottawa
9	5	Montreal
10	5	Quebec City
\.


--
-- Data for Name: company_payment_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.company_payment_account (id, payment_account_id) FROM stdin;
1	1
2	2
3	3
4	4
5	5
\.


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.country (id, name, code) FROM stdin;
101	United States	US
102	Canada	CA
103	Mexico	MX
104	United Kingdom	UK
105	Germany	DE
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (id, passport_id, first_name, last_name, birth_date, user_id) FROM stdin;
201	301	John	Doe	1990-05-15	201
202	302	Jane	Smith	1985-09-23	202
203	303	Carlos	González	1992-12-02	203
204	304	Emily	Johnson	1995-07-08	204
205	305	Liam	Brown	1988-03-17	205
\.


--
-- Data for Name: district; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.district (id, city_id, name) FROM stdin;
1	1	Downtown Los Angeles
2	1	Hollywood
3	2	Golden Gate
4	2	Mission District
5	3	Downtown Houston
6	3	Midtown Houston
7	4	Uptown Dallas
8	4	Deep Ellum
9	5	Manhattan
10	5	Brooklyn
11	6	Elmwood Village
12	6	Allentown
13	7	Scarborough
14	7	Yorkville
15	8	Bytown
16	8	Rockcliffe
17	9	Plateau Mont-Royal
18	9	Vieux-Montréal
19	10	Old Quebec
20	10	La Cité
\.


--
-- Data for Name: driver; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.driver (id, driver_license_id, affiliated_company_id, first_name, last_name, birth_date, user_id) FROM stdin;
501	401	1	John	Doe	1990-05-15	201
502	402	2	Jane	Smith	1985-10-25	202
503	403	3	Michael	Johnson	1992-08-30	203
504	404	4	Emily	Davis	1988-01-12	204
505	405	5	David	Miller	1995-12-05	205
\.


--
-- Data for Name: driver_license; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.driver_license (id, country_id, verified_by, verified_at, license_number, issued_at, expires_at) FROM stdin;
401	101	1	2023-01-15 00:00:00	D123456789	2020-05-10	2030-05-10
402	102	2	2023-03-22 00:00:00	D987654321	2021-08-05	2031-08-05
403	103	3	2023-04-10 00:00:00	D112233445	2022-01-15	2032-01-15
404	104	4	2023-06-30 00:00:00	D556677889	2021-11-30	2031-11-30
405	105	5	2023-09-01 00:00:00	D443322110	2023-03-20	2033-03-20
\.


--
-- Data for Name: driver_payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.driver_payment (id, from_acount_id, to_account_id, payment_number, amount) FROM stdin;
1	1	1	P001	150
2	2	2	P002	200
3	3	3	P003	175.5
4	4	4	P004	220.75
5	5	5	P005	250
\.


--
-- Data for Name: driver_payment_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.driver_payment_account (id, driver_id, payment_account_id) FROM stdin;
1	501	1
2	502	2
3	503	3
4	504	4
5	505	5
\.


--
-- Data for Name: employer_identifier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employer_identifier (id, country_id, verified_at, employee_number, issued_at, expires_at, verified_by) FROM stdin;
601	101	2024-01-10 00:00:00	E12345	2020-01-01	2025-01-01	1
602	102	2024-03-20 00:00:00	E67890	2019-05-10	2024-05-10	2
603	103	2024-04-15 00:00:00	E11223	2021-02-25	2026-02-25	3
604	104	2024-02-05 00:00:00	E33445	2022-08-15	2027-08-15	4
605	105	2024-06-30 00:00:00	E55678	2018-11-30	2023-11-30	5
\.


--
-- Data for Name: hotel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hotel (id, district_id, address, name) FROM stdin;
1	1	100 Ocean Ave, Santa Monica, CA	Oceanview Hotel
2	2	200 Sunset Blvd, Hollywood, CA	Hollywood Grand Hotel
3	3	300 Main St, Downtown, Los Angeles, CA	Downtown Luxury Inn
4	4	400 Pine St, San Francisco, CA	Bay Area Comfort Hotel
5	5	500 Redwood Rd, Oakland, CA	Oakland City Hotel
\.


--
-- Data for Name: passport; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.passport (id, country_id, verified_by, verified_at, passport_number, issued_at, expires_at) FROM stdin;
301	101	1	2024-01-15 10:30:00	A12345678	2020-06-01	2030-06-01
302	102	2	\N	B98765432	2021-09-10	2031-09-10
303	101	3	2023-12-05 14:45:00	C12398765	2019-03-22	2029-03-22
304	103	4	\N	D45678912	2018-07-18	2028-07-18
305	104	5	2024-02-20 09:00:00	E78965432	2022-01-01	2032-01-01
\.


--
-- Data for Name: payment_account; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_account (id, platform, account_number, picture, owner, email) FROM stdin;
1	PayPal	1234567890	image1.jpg	John Doe	john.doe@example.com
2	Stripe	0987654321	image2.jpg	Jane Smith	jane.smith@example.com
3	Square	1122334455	image3.jpg	Mark Lee	mark.lee@example.com
4	Venmo	5566778899	image4.jpg	Emily Clark	emily.clark@example.com
5	Apple Pay	2233445566	image5.jpg	Sophia Davis	sophia.davis@example.com
\.


--
-- Data for Name: sojourn; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sojourn (id, district_id, customer_id, check_in, check_out) FROM stdin;
1	1	201	2024-11-01	2024-11-05
2	2	202	2024-11-02	2024-11-06
3	3	203	2024-11-03	2024-11-07
4	4	204	2024-11-04	2024-11-08
5	5	205	2024-11-05	2024-11-09
\.


--
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.states (id, country_id, name, parent_division_id, levels, code) FROM stdin;
1	101	California	\N	1	CA
2	102	Texas	\N	1	TX
3	103	New York	\N	1	NY
4	104	Ontario	\N	1	ON
5	105	Quebec	\N	1	QC
\.


--
-- Data for Name: user_payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_payment (id, account_id, verified_at, reference_number, amount) FROM stdin;
1	1	2024-11-01 00:00:00	REF123456	100
2	2	2024-11-02 00:00:00	REF654321	200
3	3	2024-11-03 00:00:00	REF789123	150
4	4	2024-11-04 00:00:00	REF321654	180
5	5	2024-11-05 00:00:00	REF111222	220
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (id, username, password, email, email_verified_at, phone, joined_at, suspended_at) FROM stdin;
201	alice_smith	password123	alice@example.com	2024-01-10 00:00:00	123-456-7890	2020-06-15	\N
202	bob_johnson	securePass456	bob@example.com	\N	987-654-3210	2019-03-22	\N
203	carol_williams	mypassword789	carol@example.com	2024-02-15 00:00:00	555-123-4567	2021-11-05	2024-05-01
204	david_brown	pass1234	david@example.com	2023-12-20 00:00:00	444-987-6543	2022-09-14	\N
205	eve_davis	password567	eve@example.com	\N	111-222-3333	2020-02-28	\N
\.


--
-- Data for Name: vehicle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicle (id, branch_id, license_plate, brand, model, year, transmission, color, price, number_passengers, available) FROM stdin;
1	1	ABC1234	Toyota	Corolla	2022	Automatic	Blue	25.99	5	t
2	2	XYZ5678	Honda	Civic	2021	Manual	Red	22.49	5	t
3	3	LMN9876	Ford	Focus	2020	Automatic	Black	27.99	4	f
4	4	PQR4321	Chevrolet	Malibu	2023	Automatic	White	30.99	5	t
5	5	STU8765	Nissan	Altima	2021	Manual	Silver	26.49	5	t
\.


--
-- Data for Name: vehicle_rental; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicle_rental (id, vehicle_id, driver_id, start_date, end_date, total, mileage_kilometers, insurance_taken, sojourn_id) FROM stdin;
1	1	501	2024-11-01	2024-11-07	180	350	t	1
2	2	502	2024-11-03	2024-11-10	210	400	f	2
3	3	503	2024-11-05	2024-11-12	240	500	t	3
4	4	504	2024-11-10	2024-11-15	150	300	f	4
5	5	505	2024-11-15	2024-11-20	200	380	t	5
\.


--
-- Data for Name: vehicle_rental_payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicle_rental_payment (id, vehicle_rental_id, payment_id, total_after_taxes) FROM stdin;
1	1	1	250.5
2	2	2	300.75
3	3	3	150.3
4	4	4	400
5	5	5	350.2
\.


--
-- Name: administrator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.administrator_id_seq', 1, false);


--
-- Name: affiliated_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.affiliated_company_id_seq', 1, false);


--
-- Name: affiliated_company_payment_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.affiliated_company_payment_account_id_seq', 1, false);


--
-- Name: affiliated_company_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.affiliated_company_payment_id_seq', 1, false);


--
-- Name: airport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.airport_id_seq', 1, false);


--
-- Name: airport_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.airport_transaction_id_seq', 1, false);


--
-- Name: branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.branch_id_seq', 1, false);


--
-- Name: city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.city_id_seq', 1, false);


--
-- Name: company_payment_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.company_payment_account_id_seq', 1, false);


--
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_id_seq', 1, false);


--
-- Name: customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_id_seq', 1, false);


--
-- Name: district_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.district_id_seq', 1, false);


--
-- Name: driver_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.driver_id_seq', 1, false);


--
-- Name: driver_license_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.driver_license_id_seq', 1, false);


--
-- Name: driver_payment_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.driver_payment_account_id_seq', 1, false);


--
-- Name: driver_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.driver_payment_id_seq', 1, false);


--
-- Name: employer_identifier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employer_identifier_id_seq', 1, false);


--
-- Name: hotel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hotel_id_seq', 1, false);


--
-- Name: passport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.passport_id_seq', 1, false);


--
-- Name: payment_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_account_id_seq', 1, false);


--
-- Name: sojourn_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sojourn_id_seq', 1, false);


--
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.states_id_seq', 1, false);


--
-- Name: user_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_payment_id_seq', 1, false);


--
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_seq', 1, false);


--
-- Name: vehicle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicle_id_seq', 1, false);


--
-- Name: vehicle_rental_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicle_rental_id_seq', 1, false);


--
-- Name: vehicle_rental_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicle_rental_payment_id_seq', 1, false);


--
-- Name: administrator administrator_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrator
    ADD CONSTRAINT administrator_pkey PRIMARY KEY (id);


--
-- Name: affiliated_company_payment affiliated_company_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.affiliated_company_payment
    ADD CONSTRAINT affiliated_company_payment_pkey PRIMARY KEY (id);


--
-- Name: affiliated_company affiliated_company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.affiliated_company
    ADD CONSTRAINT affiliated_company_pkey PRIMARY KEY (id);


--
-- Name: airport airport_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airport
    ADD CONSTRAINT airport_pkey PRIMARY KEY (id);


--
-- Name: airport_transaction airport_transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airport_transaction
    ADD CONSTRAINT airport_transaction_pkey PRIMARY KEY (id);


--
-- Name: branch branch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch
    ADD CONSTRAINT branch_pkey PRIMARY KEY (id);


--
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);


--
-- Name: company_payment_account company_payment_account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_payment_account
    ADD CONSTRAINT company_payment_account_pkey PRIMARY KEY (id);


--
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- Name: district district_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.district
    ADD CONSTRAINT district_pkey PRIMARY KEY (id);


--
-- Name: driver_license driver_license_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_license
    ADD CONSTRAINT driver_license_pkey PRIMARY KEY (id);


--
-- Name: driver_payment_account driver_payment_account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_payment_account
    ADD CONSTRAINT driver_payment_account_pkey PRIMARY KEY (id);


--
-- Name: driver_payment driver_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_payment
    ADD CONSTRAINT driver_payment_pkey PRIMARY KEY (id);


--
-- Name: driver driver_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver
    ADD CONSTRAINT driver_pkey PRIMARY KEY (id);


--
-- Name: employer_identifier employer_identifier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employer_identifier
    ADD CONSTRAINT employer_identifier_pkey PRIMARY KEY (id);


--
-- Name: hotel hotel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotel
    ADD CONSTRAINT hotel_pkey PRIMARY KEY (id);


--
-- Name: passport passport_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passport
    ADD CONSTRAINT passport_pkey PRIMARY KEY (id);


--
-- Name: payment_account payment_account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_account
    ADD CONSTRAINT payment_account_pkey PRIMARY KEY (id);


--
-- Name: affiliated_company_payment_account pk_affiliated_company_payment_account; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.affiliated_company_payment_account
    ADD CONSTRAINT pk_affiliated_company_payment_account PRIMARY KEY (id);


--
-- Name: sojourn sojourn_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sojourn
    ADD CONSTRAINT sojourn_pkey PRIMARY KEY (id);


--
-- Name: states states_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- Name: administrator unq_administrator_user_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrator
    ADD CONSTRAINT unq_administrator_user_id UNIQUE (user_id);


--
-- Name: affiliated_company unq_affiliated_company_user_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.affiliated_company
    ADD CONSTRAINT unq_affiliated_company_user_id UNIQUE (user_id);


--
-- Name: capital unq_capital; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.capital
    ADD CONSTRAINT unq_capital UNIQUE (id_country, id_state);


--
-- Name: customer unq_customer_user_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT unq_customer_user_id UNIQUE (user_id);


--
-- Name: driver_license unq_driver_license_country_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_license
    ADD CONSTRAINT unq_driver_license_country_id UNIQUE (country_id);


--
-- Name: driver_license unq_driver_license_verified_by; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_license
    ADD CONSTRAINT unq_driver_license_verified_by UNIQUE (verified_by);


--
-- Name: driver unq_driver_user_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver
    ADD CONSTRAINT unq_driver_user_id UNIQUE (user_id);


--
-- Name: employer_identifier unq_employer_identifier_country_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employer_identifier
    ADD CONSTRAINT unq_employer_identifier_country_id UNIQUE (country_id);


--
-- Name: user_payment user_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_payment
    ADD CONSTRAINT user_payment_pkey PRIMARY KEY (id);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- Name: vehicle vehicle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT vehicle_pkey PRIMARY KEY (id);


--
-- Name: vehicle_rental_payment vehicle_rental_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_rental_payment
    ADD CONSTRAINT vehicle_rental_payment_pkey PRIMARY KEY (id);


--
-- Name: vehicle_rental vehicle_rental_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_rental
    ADD CONSTRAINT vehicle_rental_pkey PRIMARY KEY (id);


--
-- Name: administrator fk_administrator_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrator
    ADD CONSTRAINT fk_administrator_usuario FOREIGN KEY (user_id) REFERENCES public.usuario(id);


--
-- Name: affiliated_company_payment_account fk_affiliated_company_payment_account_affiliated_company; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.affiliated_company_payment_account
    ADD CONSTRAINT fk_affiliated_company_payment_account_affiliated_company FOREIGN KEY (company_id) REFERENCES public.affiliated_company(id);


--
-- Name: affiliated_company_payment_account fk_affiliated_company_payment_account_payment_account; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.affiliated_company_payment_account
    ADD CONSTRAINT fk_affiliated_company_payment_account_payment_account FOREIGN KEY (payment_account_id) REFERENCES public.payment_account(id);


--
-- Name: affiliated_company_payment fk_affiliated_company_payment_affiliated_company_payment_accoun; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.affiliated_company_payment
    ADD CONSTRAINT fk_affiliated_company_payment_affiliated_company_payment_accoun FOREIGN KEY (to_account_id) REFERENCES public.affiliated_company_payment_account(id);


--
-- Name: affiliated_company_payment fk_affiliated_company_payment_company_payment_account; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.affiliated_company_payment
    ADD CONSTRAINT fk_affiliated_company_payment_company_payment_account FOREIGN KEY (from_account_id) REFERENCES public.company_payment_account(id);


--
-- Name: affiliated_company fk_affiliated_company_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.affiliated_company
    ADD CONSTRAINT fk_affiliated_company_usuario FOREIGN KEY (user_id) REFERENCES public.usuario(id);


--
-- Name: airport fk_airport_district; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airport
    ADD CONSTRAINT fk_airport_district FOREIGN KEY (district_id) REFERENCES public.district(id);


--
-- Name: airport_transaction fk_airport_transaction_airport; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airport_transaction
    ADD CONSTRAINT fk_airport_transaction_airport FOREIGN KEY (airport_id) REFERENCES public.airport(id);


--
-- Name: airport_transaction fk_airport_transaction_driver; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airport_transaction
    ADD CONSTRAINT fk_airport_transaction_driver FOREIGN KEY (driver_id) REFERENCES public.driver(id);


--
-- Name: airport_transaction fk_airport_transaction_hotel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airport_transaction
    ADD CONSTRAINT fk_airport_transaction_hotel FOREIGN KEY (hotel_id) REFERENCES public.hotel(id);


--
-- Name: airport_transaction fk_airport_transaction_user_payment; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airport_transaction
    ADD CONSTRAINT fk_airport_transaction_user_payment FOREIGN KEY (payment_id) REFERENCES public.user_payment(id);


--
-- Name: airport_transaction fk_airport_transaction_vehicle; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.airport_transaction
    ADD CONSTRAINT fk_airport_transaction_vehicle FOREIGN KEY (vehicle_id) REFERENCES public.vehicle(id);


--
-- Name: branch fk_branch_district; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branch
    ADD CONSTRAINT fk_branch_district FOREIGN KEY (district_id) REFERENCES public.district(id);


--
-- Name: capital fk_capital_country; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.capital
    ADD CONSTRAINT fk_capital_country FOREIGN KEY (id_country) REFERENCES public.country(id);


--
-- Name: capital fk_capital_states; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.capital
    ADD CONSTRAINT fk_capital_states FOREIGN KEY (id_state) REFERENCES public.states(id);


--
-- Name: city fk_city_states; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT fk_city_states FOREIGN KEY (state_id) REFERENCES public.states(id);


--
-- Name: company_payment_account fk_company_payment_account_payment_account; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_payment_account
    ADD CONSTRAINT fk_company_payment_account_payment_account FOREIGN KEY (payment_account_id) REFERENCES public.payment_account(id);


--
-- Name: customer fk_customer_passport; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT fk_customer_passport FOREIGN KEY (passport_id) REFERENCES public.passport(id);


--
-- Name: customer fk_customer_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT fk_customer_usuario FOREIGN KEY (user_id) REFERENCES public.usuario(id);


--
-- Name: district fk_district_city; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.district
    ADD CONSTRAINT fk_district_city FOREIGN KEY (city_id) REFERENCES public.city(id);


--
-- Name: driver fk_driver_affiliated_company; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver
    ADD CONSTRAINT fk_driver_affiliated_company FOREIGN KEY (affiliated_company_id) REFERENCES public.affiliated_company(id);


--
-- Name: driver fk_driver_driver_license; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver
    ADD CONSTRAINT fk_driver_driver_license FOREIGN KEY (driver_license_id) REFERENCES public.driver_license(id);


--
-- Name: driver_license fk_driver_license_administrator; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_license
    ADD CONSTRAINT fk_driver_license_administrator FOREIGN KEY (verified_by) REFERENCES public.administrator(id);


--
-- Name: driver_license fk_driver_license_country; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_license
    ADD CONSTRAINT fk_driver_license_country FOREIGN KEY (country_id) REFERENCES public.country(id);


--
-- Name: driver_payment_account fk_driver_payment_account_driver; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_payment_account
    ADD CONSTRAINT fk_driver_payment_account_driver FOREIGN KEY (driver_id) REFERENCES public.driver(id);


--
-- Name: driver_payment_account fk_driver_payment_account_driver_payment; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_payment_account
    ADD CONSTRAINT fk_driver_payment_account_driver_payment FOREIGN KEY (payment_account_id) REFERENCES public.driver_payment(id);


--
-- Name: driver_payment fk_driver_payment_affiliated_company_payment_account; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_payment
    ADD CONSTRAINT fk_driver_payment_affiliated_company_payment_account FOREIGN KEY (to_account_id) REFERENCES public.affiliated_company_payment_account(id);


--
-- Name: driver_payment fk_driver_payment_company_payment_account; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver_payment
    ADD CONSTRAINT fk_driver_payment_company_payment_account FOREIGN KEY (from_acount_id) REFERENCES public.company_payment_account(id);


--
-- Name: driver fk_driver_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.driver
    ADD CONSTRAINT fk_driver_usuario FOREIGN KEY (user_id) REFERENCES public.usuario(id);


--
-- Name: employer_identifier fk_employer_identifier_administrator; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employer_identifier
    ADD CONSTRAINT fk_employer_identifier_administrator FOREIGN KEY (verified_by) REFERENCES public.administrator(id);


--
-- Name: employer_identifier fk_employer_identifier_country; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employer_identifier
    ADD CONSTRAINT fk_employer_identifier_country FOREIGN KEY (country_id) REFERENCES public.country(id);


--
-- Name: hotel fk_hotel_district; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hotel
    ADD CONSTRAINT fk_hotel_district FOREIGN KEY (district_id) REFERENCES public.district(id);


--
-- Name: passport fk_passport_administrator; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passport
    ADD CONSTRAINT fk_passport_administrator FOREIGN KEY (verified_by) REFERENCES public.administrator(id);


--
-- Name: passport fk_passport_country; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.passport
    ADD CONSTRAINT fk_passport_country FOREIGN KEY (country_id) REFERENCES public.country(id);


--
-- Name: sojourn fk_sojourn_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sojourn
    ADD CONSTRAINT fk_sojourn_customer FOREIGN KEY (customer_id) REFERENCES public.customer(id);


--
-- Name: sojourn fk_sojourn_district; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sojourn
    ADD CONSTRAINT fk_sojourn_district FOREIGN KEY (district_id) REFERENCES public.district(id);


--
-- Name: states fk_states_country; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT fk_states_country FOREIGN KEY (country_id) REFERENCES public.country(id);


--
-- Name: user_payment fk_user_payment_company_payment_account; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_payment
    ADD CONSTRAINT fk_user_payment_company_payment_account FOREIGN KEY (account_id) REFERENCES public.company_payment_account(id);


--
-- Name: vehicle fk_vehicle_branch; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle
    ADD CONSTRAINT fk_vehicle_branch FOREIGN KEY (branch_id) REFERENCES public.branch(id);


--
-- Name: vehicle_rental fk_vehicle_rental_driver; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_rental
    ADD CONSTRAINT fk_vehicle_rental_driver FOREIGN KEY (driver_id) REFERENCES public.driver(id);


--
-- Name: vehicle_rental_payment fk_vehicle_rental_payment_user_payment; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_rental_payment
    ADD CONSTRAINT fk_vehicle_rental_payment_user_payment FOREIGN KEY (payment_id) REFERENCES public.user_payment(id);


--
-- Name: vehicle_rental_payment fk_vehicle_rental_payment_vehicle_rental; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_rental_payment
    ADD CONSTRAINT fk_vehicle_rental_payment_vehicle_rental FOREIGN KEY (vehicle_rental_id) REFERENCES public.vehicle_rental(id);


--
-- Name: vehicle_rental fk_vehicle_rental_sojourn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_rental
    ADD CONSTRAINT fk_vehicle_rental_sojourn FOREIGN KEY (sojourn_id) REFERENCES public.sojourn(id);


--
-- Name: vehicle_rental fk_vehicle_rental_vehicle; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicle_rental
    ADD CONSTRAINT fk_vehicle_rental_vehicle FOREIGN KEY (vehicle_id) REFERENCES public.vehicle(id);


--
-- PostgreSQL database dump complete
--

