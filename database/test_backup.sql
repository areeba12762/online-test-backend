--
-- PostgreSQL database dump
--

\restrict ft4CP9vawnt4IQPO9XtenAVwYvLItr22brwYyvQ4Vn8WNco5vZC6xQsmEdxSZwd

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: tests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tests (
    test_id integer NOT NULL,
    tenant_id integer NOT NULL,
    test_name character varying(100) NOT NULL,
    total_duration_minutes integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.tests OWNER TO postgres;

--
-- Name: tests_test_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tests_test_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tests_test_id_seq OWNER TO postgres;

--
-- Name: tests_test_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tests_test_id_seq OWNED BY public.tests.test_id;


--
-- Name: tests test_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tests ALTER COLUMN test_id SET DEFAULT nextval('public.tests_test_id_seq'::regclass);


--
-- Data for Name: tests; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tests (test_id, tenant_id, test_name, total_duration_minutes, created_at) FROM stdin;
\.


--
-- Name: tests_test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tests_test_id_seq', 1, false);


--
-- Name: tests tests_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tests
    ADD CONSTRAINT tests_pkey PRIMARY KEY (test_id);


--
-- PostgreSQL database dump complete
--

\unrestrict ft4CP9vawnt4IQPO9XtenAVwYvLItr22brwYyvQ4Vn8WNco5vZC6xQsmEdxSZwd

