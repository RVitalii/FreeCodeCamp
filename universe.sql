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
    description text,
    column4 integer,
    column5 integer
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
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    column4 integer,
    column5 integer
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
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planetary_mass integer,
    distance_from_earth integer,
    is_spherical boolean,
    column6 integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

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
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years numeric(5,2),
    column5 integer
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
-- Name: table_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.table_info (
    table_info_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_constrained boolean,
    column4 integer,
    column5 integer
);


ALTER TABLE public.table_info OWNER TO freecodecamp;

--
-- Name: table_info_table_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.table_info_table_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.table_info_table_info_id_seq OWNER TO freecodecamp;

--
-- Name: table_info_table_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.table_info_table_info_id_seq OWNED BY public.table_info.table_info_id;


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: table_info table_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.table_info ALTER COLUMN table_info_id SET DEFAULT nextval('public.table_info_table_info_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'name1', 'desc1', NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'name2', 'desc2', NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'name3', 'desc3', NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'name4', 'desc4', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'name5', 'desc5', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'name6', 'desc6', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'moon_name1', NULL, NULL);
INSERT INTO public.moon VALUES (2, 1, 'moon_name2', NULL, NULL);
INSERT INTO public.moon VALUES (3, 1, 'moon_name3', NULL, NULL);
INSERT INTO public.moon VALUES (4, 1, 'moon_name4', NULL, NULL);
INSERT INTO public.moon VALUES (5, 1, 'moon_name5', NULL, NULL);
INSERT INTO public.moon VALUES (6, 1, 'moon_name6', NULL, NULL);
INSERT INTO public.moon VALUES (7, 1, 'moon_name7', NULL, NULL);
INSERT INTO public.moon VALUES (8, 1, 'moon_name8', NULL, NULL);
INSERT INTO public.moon VALUES (9, 1, 'moon_name9', NULL, NULL);
INSERT INTO public.moon VALUES (10, 1, 'moon_name0', NULL, NULL);
INSERT INTO public.moon VALUES (11, 1, 'moon_name11', NULL, NULL);
INSERT INTO public.moon VALUES (12, 1, 'moon_name111', NULL, NULL);
INSERT INTO public.moon VALUES (13, 1, 'moon_name1111', NULL, NULL);
INSERT INTO public.moon VALUES (14, 1, 'moon_name2', NULL, NULL);
INSERT INTO public.moon VALUES (15, 1, 'moon_name22', NULL, NULL);
INSERT INTO public.moon VALUES (16, 1, 'moon_name222', NULL, NULL);
INSERT INTO public.moon VALUES (17, 1, 'moon_name3', NULL, NULL);
INSERT INTO public.moon VALUES (18, 1, 'moon_name33', NULL, NULL);
INSERT INTO public.moon VALUES (19, 1, 'moon_name333', NULL, NULL);
INSERT INTO public.moon VALUES (20, 1, 'moon_name3333', NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'name1', 0, 100, true, NULL);
INSERT INTO public.planet VALUES (2, 1, 'name11', 0, 100, true, NULL);
INSERT INTO public.planet VALUES (3, 1, 'name111', 0, 100, true, NULL);
INSERT INTO public.planet VALUES (4, 1, 'name1111', 0, 100, true, NULL);
INSERT INTO public.planet VALUES (5, 1, 'name11111', 0, 100, true, NULL);
INSERT INTO public.planet VALUES (6, 1, 'name111111', 0, 100, true, NULL);
INSERT INTO public.planet VALUES (7, 1, 'name1111111', 0, 100, true, NULL);
INSERT INTO public.planet VALUES (8, 1, 'name11111111', 0, 100, true, NULL);
INSERT INTO public.planet VALUES (9, 1, 'name111111111', 0, 100, true, NULL);
INSERT INTO public.planet VALUES (10, 1, 'name12', 0, 100, true, NULL);
INSERT INTO public.planet VALUES (11, 1, 'name122', 0, 100, true, NULL);
INSERT INTO public.planet VALUES (12, 1, 'name1222', 0, 100, true, NULL);
INSERT INTO public.planet VALUES (13, 1, 'name12222', 0, 100, true, NULL);
INSERT INTO public.planet VALUES (14, 1, 'name122222', 0, 100, true, NULL);
INSERT INTO public.planet VALUES (15, 1, 'name13', 0, 100, true, NULL);
INSERT INTO public.planet VALUES (16, 1, 'name133', 0, 100, true, NULL);
INSERT INTO public.planet VALUES (17, 1, 'name1333', 0, 100, true, NULL);
INSERT INTO public.planet VALUES (18, 1, 'name13333', 0, 100, true, NULL);
INSERT INTO public.planet VALUES (19, 1, 'name14', 0, 100, true, NULL);
INSERT INTO public.planet VALUES (20, 1, 'name144', 0, 100, true, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'name1', 0.00, NULL);
INSERT INTO public.star VALUES (2, 2, 'name2', 0.00, NULL);
INSERT INTO public.star VALUES (3, 3, 'name3', 0.00, NULL);
INSERT INTO public.star VALUES (4, 4, 'name4', 0.00, NULL);
INSERT INTO public.star VALUES (5, 5, 'name5', 0.00, NULL);
INSERT INTO public.star VALUES (6, 6, 'name6', 0.00, NULL);


--
-- Data for Name: table_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.table_info VALUES (1, 'name', true, NULL, NULL);
INSERT INTO public.table_info VALUES (2, 'name2', true, NULL, NULL);
INSERT INTO public.table_info VALUES (3, 'name3', true, NULL, NULL);
INSERT INTO public.table_info VALUES (4, 'name4', true, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: table_info_table_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.table_info_table_info_id_seq', 4, true);


--
-- Name: galaxy galaxy_column4_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_column4_key UNIQUE (column4);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_column4_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_column4_key UNIQUE (column4);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_column6_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_column6_key UNIQUE (column6);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_column5_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_column5_key UNIQUE (column5);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: table_info table_info_column4_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.table_info
    ADD CONSTRAINT table_info_column4_key UNIQUE (column4);


--
-- Name: table_info table_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.table_info
    ADD CONSTRAINT table_info_pkey PRIMARY KEY (table_info_id);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


