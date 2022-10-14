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
    name character varying(30),
    type character varying(30) NOT NULL,
    discovery_year integer,
    distance_millions numeric(3,2)
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
    description text,
    is_spherical boolean,
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
    name character varying(30),
    composition character varying(80),
    type character varying(30),
    star_id integer NOT NULL,
    has_life boolean,
    distance_million_km numeric
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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    launch_year integer
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satellite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satellite_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satellite_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    spectral_class character varying(1),
    description text,
    galaxy_id integer NOT NULL
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
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satellite_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sb/c', NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Canis Major dwarf', 'Irr', 2003, 0.03);
INSERT INTO public.galaxy VALUES (3, 'Phoenix dwarf', 'Irr', 1976, 1.30);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', 'Irr', NULL, 0.20);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'Irr', NULL, 0.16);
INSERT INTO public.galaxy VALUES (7, 'Sculptor dwarf', 'E3', 1937, 0.29);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'The Moon is the Earth''s only natural satellite. It''s about one-quarter of Earth in diameter.', true, 7);
INSERT INTO public.moon VALUES (2, 'Phobos', 'The innermost and larger of the two natural satellites of Mars', false, 1);
INSERT INTO public.moon VALUES (3, 'Deimos', 'The smaller and outermost of the two natural satellites of Mars', false, 1);
INSERT INTO public.moon VALUES (4, 'Titan', 'Second-largest natural satellite in the Solar System', false, 8);
INSERT INTO public.moon VALUES (5, 'Enceladus', 'The sixth-largest moon of Saturn, about 500 km in diameter', true, 8);
INSERT INTO public.moon VALUES (6, 'Titania', 'Also designated Uranus 3, is the largest of the moons of Uranus', true, 4);
INSERT INTO public.moon VALUES (7, 'Europa', 'Also designated Jupiter 2, is the smallest of the four Galilean moons orbiting Jupiter', true, 6);
INSERT INTO public.moon VALUES (8, 'Callisto', 'Also designated Jupiter 4, is the second-largest moon of Jupiter and third-largest moon in the Solar System', true, 6);
INSERT INTO public.moon VALUES (9, 'Ganymede', 'Jupiter 3, the largest and most massive of the Solar System''s moons', true, 6);
INSERT INTO public.moon VALUES (10, 'Io', 'Fourth-largest moon in the Solar System', true, 6);
INSERT INTO public.moon VALUES (11, 'Epimetheus', 'Inner satellite of Saturn, also known as Saturn 9', false, 8);
INSERT INTO public.moon VALUES (12, 'Janus', 'Inner satellite of Saturn, also known as Saturn 10', false, 8);
INSERT INTO public.moon VALUES (13, 'Triton', 'Lagrest natural satellite of the planet Neptune', true, 5);
INSERT INTO public.moon VALUES (14, 'Rhea', 'Second-lagrest natural satellite of Saturn and ninth-largest moon in the Solar System', true, 8);
INSERT INTO public.moon VALUES (15, 'Oberon', 'Second-largest and second most massive of the Uranian moons, also designated Uranus 4', true, 4);
INSERT INTO public.moon VALUES (16, 'Mimas', 'With a diameter of 396 km, it is the smallest satronomical body that is known to still be rounded in shape because of self-gravitation', true, 8);
INSERT INTO public.moon VALUES (17, 'Hyperion', 'Also known as Saturn 7, distinguished by its irregular shape, chaotic rotation and sponge-like appearance', false, 8);
INSERT INTO public.moon VALUES (18, 'Dione', 'Just like Earth''s moon, Dione is phase locked with its parent, one side always faces toward Saturn', true, 8);
INSERT INTO public.moon VALUES (20, 'Tethys', 'Mid-sized moon of Saturn, also known as Saturn 3', true, 8);
INSERT INTO public.moon VALUES (21, 'Miranda', 'The smallest and innermost of the Uranus''s five round satellites, also designated Uranus 5', true, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mars', 'iron, nickel, sulfur', 'rocky', 1, false, 108.75);
INSERT INTO public.planet VALUES (2, 'Venus', 'iron core and rocky mantle', 'rocky', 1, false, 256.66);
INSERT INTO public.planet VALUES (3, 'Mercury', '70% metal 30% silicate', 'rocky', 1, false, 158.51);
INSERT INTO public.planet VALUES (4, 'Uranus', 'water, methane, ammonia fluids above a smallrocky center', 'Ice Giant', 1, false, 2812.1);
INSERT INTO public.planet VALUES (5, 'Neptune', 'water, methane, ammonia fluids above a solid center size of Earth', 'Ice Giant', 1, false, 4338.8);
INSERT INTO public.planet VALUES (6, 'Jupiter', 'silicate rock, ice core, liqud metallic hydrogen, liquid hydrogen', 'Gas Giant', 1, false, 597.42);
INSERT INTO public.planet VALUES (7, 'Earth', 'nickel, iron, molten rock, silica and alumina rocks', 'Rocky', 1, true, NULL);
INSERT INTO public.planet VALUES (8, 'Saturn', 'iron and nickel center covered in rock, hydrogen and helium', 'Gas Giant', 1, false, 1392.4);
INSERT INTO public.planet VALUES (9, 'Kepler-62b', NULL, NULL, 39, false, NULL);
INSERT INTO public.planet VALUES (10, 'Kepler-62c', NULL, NULL, 39, false, NULL);
INSERT INTO public.planet VALUES (11, 'Kepler-62d', NULL, NULL, 39, false, NULL);
INSERT INTO public.planet VALUES (12, 'Kepler-62e', NULL, NULL, 39, false, NULL);
INSERT INTO public.planet VALUES (13, 'Kepler-62f', NULL, NULL, 39, false, NULL);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Curiosity', 1, 2011);
INSERT INTO public.satellite VALUES (2, 'Sputnik 1', 7, 1957);
INSERT INTO public.satellite VALUES (3, 'Voyager 1', NULL, 1977);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G', 'The Sun is the star at the center of the Solar System.It is a nearly perfect ball of hot plasma', 1);
INSERT INTO public.star VALUES (2, 'UY Scuti', 'M', 'The largest known star in our galaxy and one of the largest stars ever discovered in the universe', 1);
INSERT INTO public.star VALUES (3, 'VY Canis Majoris', 'M', 'One of the largest, most massive and brightest stars of our universe', 1);
INSERT INTO public.star VALUES (4, 'Alpha Sculptoris', 'B', 'A blue-white star in the southern constellation of Sculptor', 7);
INSERT INTO public.star VALUES (37, 'Beta Sculptoris', 'B', 'Second brightest star in the constellation. It has an apparent magnitude of 4.38 and is approximately 178 light years distant from Solar System', 7);
INSERT INTO public.star VALUES (38, 'PMMR 62', 'M', 'A red supergiant star located in the constellation Tucana', 4);
INSERT INTO public.star VALUES (39, 'Kepler-62', 'K', 'Main sequence star cooler and smaller than the Sun, located roughly 990 light years from Earth', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: satellite_satellite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satellite_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 39, true);


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
-- Name: satellite satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_key UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


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
-- Name: satellite satellite_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

