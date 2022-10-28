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
-- Name: constellations; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellations (
    constellations_id integer NOT NULL,
    name character varying(30) NOT NULL,
    number_of_stars character varying(30) NOT NULL
);


ALTER TABLE public.constellations OWNER TO freecodecamp;

--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellations_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellations_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellations_constellation_id_seq OWNED BY public.constellations.constellations_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(50) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    diameter_in_light_years numeric(10,2) NOT NULL
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
    composition text NOT NULL,
    has_atmosphere boolean NOT NULL,
    planet_id integer NOT NULL,
    mass_in_tons character varying(20) NOT NULL,
    diameter_in_km character varying(20)
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
    number_of_moons integer,
    description text NOT NULL,
    has_life boolean NOT NULL,
    star_id integer NOT NULL,
    mass_in_tons character varying(20) NOT NULL
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
    name character varying(30) NOT NULL,
    type character varying(30) NOT NULL,
    surface_temperature numeric(10,2) NOT NULL,
    galaxy_id integer NOT NULL,
    mass_in_tons character varying(20)
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
-- Name: constellations constellations_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellations ALTER COLUMN constellations_id SET DEFAULT nextval('public.constellations_constellation_id_seq'::regclass);


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
-- Data for Name: constellations; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellations VALUES (1, 'Canis Major', '147');
INSERT INTO public.constellations VALUES (2, 'Cassiopeia', '157');
INSERT INTO public.constellations VALUES (3, 'Cetus', '189');
INSERT INTO public.constellations VALUES (4, 'Lupus', '127');
INSERT INTO public.constellations VALUES (5, 'Orion', '204');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Spiral', 10000, 220000.00);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Spiral', 13000, 230000.00);
INSERT INTO public.galaxy VALUES (3, 'Sagittaruis Dwarf Elliptical', 'Elliptical', 11500, 10000.00);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Barred Spiral', 9000, 70000.00);
INSERT INTO public.galaxy VALUES (5, 'Leo Dwarf', 'Dwarf Spiral', 7000, 3000.00);
INSERT INTO public.galaxy VALUES (6, 'NGC 2337', 'Irregular', 8900, 65000.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Oxygen, Silicon, Magnesium, Iron', false, 1, '7.349e19', '3474.8');
INSERT INTO public.moon VALUES (2, 'Phobes', 'The biggest satelite for Mars, Oxygen, Silicon, Iron, Carbon', false, 3, '1.072e13', '26.8');
INSERT INTO public.moon VALUES (3, 'Ganymede', 'Iron, Sulfur, Ice, Silicon', false, 4, '1.482e20', '5268.2');
INSERT INTO public.moon VALUES (4, 'Callisto', 'Ammonia, Iron, Silicon, Ice, Sulfur, Magnesium', false, 4, '1.075e20', '4820');
INSERT INTO public.moon VALUES (5, 'Titan', 'Ammonia, Sulfur, Iron', false, 5, '1.345e20', '5150');
INSERT INTO public.moon VALUES (6, 'Deimos', 'Carbon and Ice', false, 3, '2.24e12', '12.4');
INSERT INTO public.moon VALUES (7, 'Metis', 'Composed by ice', false, 4, '3.6e13', '40');
INSERT INTO public.moon VALUES (8, 'Amalthea', 'Sulfur, Ice, Carbon and Silicon', false, 4, '2.08e15', '146');
INSERT INTO public.moon VALUES (9, 'Io', 'Iron,SDilicon and Carbon', false, 4, '8.94e19', '3643.2');
INSERT INTO public.moon VALUES (10, 'Europe', 'Sulfur, Magensium and Iron', false, 4, '4.8e19', '3121.6');
INSERT INTO public.moon VALUES (11, 'Himalia', 'Ice, Sulfuur and Silicon', false, 4, '6.7e15', '170');
INSERT INTO public.moon VALUES (12, 'Mimas', 'Ice and Iron', false, 5, '3.74e16', '397.2');
INSERT INTO public.moon VALUES (13, 'Hyperion', 'Ice and Iron', false, 5, '5.68e15', '280');
INSERT INTO public.moon VALUES (14, 'Pan', 'Ice', false, 5, '2.7e12', '14.1');
INSERT INTO public.moon VALUES (15, 'Prometheus', 'Ice and Carbon', false, 5, '3.3e14', '100.2');
INSERT INTO public.moon VALUES (16, 'Calypso', 'Ice and Carbon', false, 5, '2.5e12', '23');
INSERT INTO public.moon VALUES (17, 'Ariel', 'Water frozen, Sulfur and Methane', false, 7, '1.35e18', '1157.8');
INSERT INTO public.moon VALUES (18, 'Titania', 'Water frozen and Carbon', false, 7, '3.52e18', '1576.8');
INSERT INTO public.moon VALUES (19, 'Oberon', 'Water frozen, Carbon, Ammonia and Oxygen', false, 7, '3.014e18', '1522.8');
INSERT INTO public.moon VALUES (20, 'Miranda', 'Methane and Carbon', false, 7, '6.59e16', '472');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Rocky planet with an atmosphere, it is habitable', true, 1, '5.972e21');
INSERT INTO public.planet VALUES (2, 'Venus', 0, 'Solid planet without an atmosphere, it is unhabitable', false, 1, '4.867e21');
INSERT INTO public.planet VALUES (3, 'Mars', 2, 'Solid planet with a light atmosphere it could become habitable', false, 1, '6.39e20');
INSERT INTO public.planet VALUES (4, 'Jupiter', 79, 'Massive gas planet, with a toxic atmosphere', false, 1, '1.9e24');
INSERT INTO public.planet VALUES (5, 'Saturn', 82, 'A massive gas planet, toxic atmosphere ans rings around it', false, 1, '5.68e23');
INSERT INTO public.planet VALUES (6, 'Mercury', 0, 'Is a little solid planet, the closest to our Sun', false, 1, '3.302e20');
INSERT INTO public.planet VALUES (7, 'Uranus', 27, 'A solid planet tith a huge volume and mass', false, 1, '8.686e22');
INSERT INTO public.planet VALUES (8, 'Kepler-16b', 5, 'A planet that orbites around 2 stars', false, 2, '6.27e23');
INSERT INTO public.planet VALUES (9, 'Kepler-64b', 8, 'A planet that orbites around 4 stars, it is unhabitable', false, 4, '3.61e23');
INSERT INTO public.planet VALUES (10, 'HAT-P-7b', 23, 'It is a planet where it rains corundum, which is a mineral that forms sapphires', false, 5, '4.365e21');
INSERT INTO public.planet VALUES (11, 'PSR B1620-26', 45, 'It is a planet orbiting a pulsar', false, 3, '8.35e24');
INSERT INTO public.planet VALUES (12, 'Psr B1620-26 B', 24, 'It is a fairly olod planet, around 13 billions years old', false, 6, '7.23e23');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Yellow Dwarf', 5778.00, 2, '1.989e27');
INSERT INTO public.star VALUES (2, 'Sirius', 'White Dwarf', 25200.00, 2, '4.103e27');
INSERT INTO public.star VALUES (4, 'Alpha Centauri', 'Yellow Dwarf', 5790.00, 2, '2.167e27');
INSERT INTO public.star VALUES (5, 'Alnilam', 'Blue Supergiant', 25000.00, 3, '8.95e28');
INSERT INTO public.star VALUES (3, 'Canopus', 'White-Yellow Supergiant', 7280.00, 1, '1.591e28');
INSERT INTO public.star VALUES (6, 'Antares', 'Red supergiant', 3600.00, 4, '3.082e28');


--
-- Name: constellations_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellations_constellation_id_seq', 5, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellations constellations_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellations
    ADD CONSTRAINT constellations_name_key UNIQUE (name);


--
-- Name: constellations constellations_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellations
    ADD CONSTRAINT constellations_pkey PRIMARY KEY (constellations_id);


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
-- Name: moon moon_constraint_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_constraint_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet plante_cosntraint_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT plante_cosntraint_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_constraint_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constraint_fk FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

