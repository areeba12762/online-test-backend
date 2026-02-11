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


--
-- PostgreSQL database dump
--

\restrict HWg4mWrYV2qFfHZdyOL4YQDELbFkfK0JUDcaQpq3lu5SkrQG4KoMQOjM9ioSfHC

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
-- Name: tenants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tenants (
    tenant_id integer NOT NULL,
    tenant_name character varying(100) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.tenants OWNER TO postgres;

--
-- Name: tenants_tenant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tenants_tenant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tenants_tenant_id_seq OWNER TO postgres;

--
-- Name: tenants_tenant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tenants_tenant_id_seq OWNED BY public.tenants.tenant_id;


--
-- Name: tenants tenant_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants ALTER COLUMN tenant_id SET DEFAULT nextval('public.tenants_tenant_id_seq'::regclass);


--
-- Data for Name: tenants; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tenants (tenant_id, tenant_name, created_at) FROM stdin;
\.


--
-- Name: tenants_tenant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tenants_tenant_id_seq', 1, false);


--
-- Name: tenants tenants_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_pkey PRIMARY KEY (tenant_id);


--
-- Name: tenants tenants_tenant_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenants
    ADD CONSTRAINT tenants_tenant_name_key UNIQUE (tenant_name);


--
-- PostgreSQL database dump complete
--

\unrestrict HWg4mWrYV2qFfHZdyOL4YQDELbFkfK0JUDcaQpq3lu5SkrQG4KoMQOjM9ioSfHC


--
-- PostgreSQL database dump
--

\restrict 8dHsPrPOMfKHselqWhas05MDgfrDkkvug23eco6GNnrOudqA7nrxEXivCdCVo84

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-02-09 20:20:13

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
-- TOC entry 220 (class 1259 OID 16460)
-- Name: question_bank; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question_bank (
    question_id integer NOT NULL,
    question_text text NOT NULL,
    skill_tag character varying(50),
    difficulty_level character varying(20),
    correct_answer text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.question_bank OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16459)
-- Name: question_bank_question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.question_bank_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.question_bank_question_id_seq OWNER TO postgres;

--
-- TOC entry 4968 (class 0 OID 0)
-- Dependencies: 219
-- Name: question_bank_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.question_bank_question_id_seq OWNED BY public.question_bank.question_id;


--
-- TOC entry 4810 (class 2604 OID 16463)
-- Name: question_bank question_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_bank ALTER COLUMN question_id SET DEFAULT nextval('public.question_bank_question_id_seq'::regclass);


--
-- TOC entry 4962 (class 0 OID 16460)
-- Dependencies: 220
-- Data for Name: question_bank; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.question_bank (question_id, question_text, skill_tag, difficulty_level, correct_answer, created_at) FROM stdin;
1	What is JVM	Java	Medium	Java Virtual Machine-executes bytescode	2026-02-09 20:10:37.027967
\.


--
-- TOC entry 4969 (class 0 OID 0)
-- Dependencies: 219
-- Name: question_bank_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.question_bank_question_id_seq', 1, false);


--
-- TOC entry 4813 (class 2606 OID 16471)
-- Name: question_bank question_bank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_bank
    ADD CONSTRAINT question_bank_pkey PRIMARY KEY (question_id);


-- Completed on 2026-02-09 20:20:14

--
-- PostgreSQL database dump complete
--

\unrestrict 8dHsPrPOMfKHselqWhas05MDgfrDkkvug23eco6GNnrOudqA7nrxEXivCdCVo84




--
-- PostgreSQL database dump
--

\restrict RdhD1XpanrVrcI4b5Nh2FX5Z4KJuMyFhRvleOPDvcUVDrIgTpsWWgEzOb4cY7jE

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
-- Name: test_sections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.test_sections (
    section_id integer NOT NULL,
    test_id integer NOT NULL,
    section_name character varying(100) NOT NULL,
    target_skill character varying(50),
    target_difficulty character varying(20),
    question_count integer NOT NULL
);


ALTER TABLE public.test_sections OWNER TO postgres;

--
-- Name: test_sections_section_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.test_sections_section_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.test_sections_section_id_seq OWNER TO postgres;

--
-- Name: test_sections_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.test_sections_section_id_seq OWNED BY public.test_sections.section_id;


--
-- Name: test_sections section_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test_sections ALTER COLUMN section_id SET DEFAULT nextval('public.test_sections_section_id_seq'::regclass);


--
-- Data for Name: test_sections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.test_sections (section_id, test_id, section_name, target_skill, target_difficulty, question_count) FROM stdin;
\.


--
-- Name: test_sections_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.test_sections_section_id_seq', 1, false);


--
-- Name: test_sections test_sections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.test_sections
    ADD CONSTRAINT test_sections_pkey PRIMARY KEY (section_id);


--
-- PostgreSQL database dump complete
--

\unrestrict RdhD1XpanrVrcI4b5Nh2FX5Z4KJuMyFhRvleOPDvcUVDrIgTpsWWgEzOb4cY7jE



--
-- PostgreSQL database dump
--

\restrict zBocWbfqycJcOtKjC53rm2l3gYvzUOcocVvKpAhGlRPNc6ddawuO1M1NiyH8lz7

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
-- Name: question_bank; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question_bank (
    question_id integer NOT NULL,
    question_text text NOT NULL,
    skill_tag character varying(50),
    difficulty_level character varying(20),
    correct_answer text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.question_bank OWNER TO postgres;

--
-- Name: question_bank_question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.question_bank_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.question_bank_question_id_seq OWNER TO postgres;

--
-- Name: question_bank_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.question_bank_question_id_seq OWNED BY public.question_bank.question_id;


--
-- Name: question_bank question_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_bank ALTER COLUMN question_id SET DEFAULT nextval('public.question_bank_question_id_seq'::regclass);


--
-- Data for Name: question_bank; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.question_bank (question_id, question_text, skill_tag, difficulty_level, correct_answer, created_at) FROM stdin;
\.


--
-- Name: question_bank_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.question_bank_question_id_seq', 1, false);


--
-- Name: question_bank question_bank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.question_bank
    ADD CONSTRAINT question_bank_pkey PRIMARY KEY (question_id);


--
-- PostgreSQL database dump complete
--

\unrestrict zBocWbfqycJcOtKjC53rm2l3gYvzUOcocVvKpAhGlRPNc6ddawuO1M1NiyH8lz7


