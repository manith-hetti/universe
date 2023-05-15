--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mean_temperature integer,
    description text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    star_id integer,
    mass_in_earths numeric(7,3),
    orbit_in_au numeric(7,3)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_more_info (
    planet_type character varying(30),
    planet_more_info_id integer NOT NULL,
    surface_temperature integer,
    radius_in_earths numeric(5,3),
    name character varying(30) NOT NULL
);


ALTER TABLE public.planet_more_info OWNER TO freecodecamp;

--
-- Name: planet_more_info_planet_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_more_info_planet_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_more_info_planet_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: planet_more_info_planet_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_more_info_planet_more_info_id_seq OWNED BY public.planet_more_info.planet_more_info_id;


--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(100,3),
    description text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_more_info planet_more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_more_info ALTER COLUMN planet_more_info_id SET DEFAULT nextval('public.planet_more_info_planet_more_info_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milkey Way', 16310, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 11800, 28, NULL);
INSERT INTO public.galaxy VALUES (6, 'Andromeda Galaxy', 10000, 3, NULL);
INSERT INTO public.galaxy VALUES (7, 'GN-z11', 13400, 32, NULL);
INSERT INTO public.galaxy VALUES (9, 'Sombrero Galaxy', 12900, 31, NULL);
INSERT INTO public.galaxy VALUES (8, 'Triangulum Galaxy', 10000, 3, NULL);
INSERT INTO public.galaxy VALUES (10, 'Pinwheel Galaxy', 13000, 21, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', -18, NULL, 4);
INSERT INTO public.moon VALUES (2, 'Phobos', 25, NULL, 5);
INSERT INTO public.moon VALUES (3, 'Deimos', 25, NULL, 5);
INSERT INTO public.moon VALUES (4, 'Io', -143, NULL, 6);
INSERT INTO public.moon VALUES (5, 'Europa', -171, NULL, 6);
INSERT INTO public.moon VALUES (6, 'Ganymede', -163, NULL, 6);
INSERT INTO public.moon VALUES (7, 'Callisto', -139, NULL, 6);
INSERT INTO public.moon VALUES (8, 'Triton', -235, NULL, 7);
INSERT INTO public.moon VALUES (9, 'Titan', 94, NULL, 14);
INSERT INTO public.moon VALUES (10, 'Enceladus', 75, NULL, 14);
INSERT INTO public.moon VALUES (11, 'Rhea', 53, NULL, 14);
INSERT INTO public.moon VALUES (12, 'Dione', 87, NULL, 14);
INSERT INTO public.moon VALUES (13, 'Mimas', 64, NULL, 14);
INSERT INTO public.moon VALUES (14, 'Tethys', 86, NULL, 14);
INSERT INTO public.moon VALUES (15, 'Phoebe', 75, NULL, 14);
INSERT INTO public.moon VALUES (16, 'Miranda', 60, NULL, 15);
INSERT INTO public.moon VALUES (17, 'Ariel', 60, NULL, 15);
INSERT INTO public.moon VALUES (18, 'Umbriel', 75, NULL, 15);
INSERT INTO public.moon VALUES (19, 'Titania', 70, NULL, 15);
INSERT INTO public.moon VALUES (20, 'Oberon', 70, NULL, 15);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'M51-ULS-1b', NULL, NULL, true, 8, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'Kepler-90b', NULL, false, false, 3, 2.900, 0.070);
INSERT INTO public.planet VALUES (3, 'Kepler-90i', NULL, false, false, 3, 2.300, 0.420);
INSERT INTO public.planet VALUES (4, 'Earth', NULL, true, true, 1, 1.000, 1.000);
INSERT INTO public.planet VALUES (5, 'Mars', NULL, false, true, 1, 0.107, 1.524);
INSERT INTO public.planet VALUES (6, 'Jupiter', NULL, false, true, 1, 317.800, 5.203);
INSERT INTO public.planet VALUES (7, 'Neptune', NULL, false, true, 1, 17.200, 30.060);
INSERT INTO public.planet VALUES (8, 'Trappist-1b', NULL, false, false, 4, 1.374, 0.012);
INSERT INTO public.planet VALUES (9, 'Trappist-1c', NULL, false, false, 4, 1.308, 0.015);
INSERT INTO public.planet VALUES (10, 'Trappist-1d', NULL, false, false, 4, 0.388, 0.022);
INSERT INTO public.planet VALUES (11, 'Kepler-238b', NULL, false, true, 5, 3.640, 0.034);
INSERT INTO public.planet VALUES (12, 'Kepler-238f', NULL, false, true, 5, 13.500, 0.275);
INSERT INTO public.planet VALUES (13, 'Kepler-238e', NULL, false, false, 5, 0.534, 0.166);
INSERT INTO public.planet VALUES (14, 'Saturn', NULL, false, false, 1, 95.000, 9.500);
INSERT INTO public.planet VALUES (15, 'Uranus', NULL, false, false, 1, 14.500, 19.200);


--
-- Data for Name: planet_more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_more_info VALUES ('super-Earth', 2, 800, 1.300, 'Kepler-90b');
INSERT INTO public.planet_more_info VALUES ('super-Earth', 3, 400, 1.300, 'Kepler-90i');
INSERT INTO public.planet_more_info VALUES ('Terrestrial', 4, 15, 1.000, 'Earth');
INSERT INTO public.planet_more_info VALUES ('Terrestrial', 5, -65, 0.532, 'Mars');
INSERT INTO public.planet_more_info VALUES ('Gas Giant', 6, -110, 11.209, 'Jupiter');
INSERT INTO public.planet_more_info VALUES ('Ice Giant', 7, -200, 3.883, 'Neptune');
INSERT INTO public.planet_more_info VALUES ('super-Earth', 8, 4050, 1.730, 'Kepler-238b');
INSERT INTO public.planet_more_info VALUES ('super-Earth', 9, 276, 2.000, 'Kepler-238f');
INSERT INTO public.planet_more_info VALUES ('Neptune-like', 10, 3726, 0.500, 'Kepler-238e');
INSERT INTO public.planet_more_info VALUES ('Gas Giant', 11, 95, 9.100, 'Saturn');
INSERT INTO public.planet_more_info VALUES ('Gas Giant', 12, 76, 4.000, 'Uranus');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'Kepler-90', 2000, 2544.000, NULL, 1);
INSERT INTO public.star VALUES (1, 'Sun', 4603, NULL, NULL, 1);
INSERT INTO public.star VALUES (4, 'Trappist-1', 7600, 40.000, NULL, 1);
INSERT INTO public.star VALUES (5, 'Kepler-238', 500, 1300.000, NULL, 1);
INSERT INTO public.star VALUES (6, 'HD10180', 7300, 127.000, NULL, 1);
INSERT INTO public.star VALUES (8, 'M51-ULS-1', 10, 28.000, NULL, 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_more_info_planet_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_more_info_planet_more_info_id_seq', 12, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet_more_info planet_more_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_more_info
    ADD CONSTRAINT planet_more_info_name_key UNIQUE (name);


--
-- Name: planet_more_info planet_more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_more_info
    ADD CONSTRAINT planet_more_info_pkey PRIMARY KEY (planet_more_info_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

