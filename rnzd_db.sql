--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-05-14 10:42:00

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
-- TOC entry 2 (class 3079 OID 16508)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 5746 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 224 (class 1259 OID 17589)
-- Name: departamentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departamentos (
    id integer NOT NULL,
    nombre character varying NOT NULL
);


ALTER TABLE public.departamentos OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17588)
-- Name: departamentos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departamentos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.departamentos_id_seq OWNER TO postgres;

--
-- TOC entry 5747 (class 0 OID 0)
-- Dependencies: 223
-- Name: departamentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departamentos_id_seq OWNED BY public.departamentos.id;


--
-- TOC entry 226 (class 1259 OID 17601)
-- Name: tipos_proceso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipos_proceso (
    id integer NOT NULL,
    nombre character varying NOT NULL
);


ALTER TABLE public.tipos_proceso OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17600)
-- Name: tipos_proceso_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipos_proceso_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tipos_proceso_id_seq OWNER TO postgres;

--
-- TOC entry 5748 (class 0 OID 0)
-- Dependencies: 225
-- Name: tipos_proceso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipos_proceso_id_seq OWNED BY public.tipos_proceso.id;


--
-- TOC entry 228 (class 1259 OID 17613)
-- Name: zonas_deforestadas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.zonas_deforestadas (
    id integer NOT NULL,
    nombre_zona character varying NOT NULL,
    tipo_proceso_id integer NOT NULL,
    departamento_id integer NOT NULL,
    geometry public.geometry(Polygon,3116) NOT NULL
);


ALTER TABLE public.zonas_deforestadas OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 17612)
-- Name: zonas_deforestadas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.zonas_deforestadas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.zonas_deforestadas_id_seq OWNER TO postgres;

--
-- TOC entry 5749 (class 0 OID 0)
-- Dependencies: 227
-- Name: zonas_deforestadas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.zonas_deforestadas_id_seq OWNED BY public.zonas_deforestadas.id;


--
-- TOC entry 5563 (class 2604 OID 17592)
-- Name: departamentos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos ALTER COLUMN id SET DEFAULT nextval('public.departamentos_id_seq'::regclass);


--
-- TOC entry 5564 (class 2604 OID 17604)
-- Name: tipos_proceso id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_proceso ALTER COLUMN id SET DEFAULT nextval('public.tipos_proceso_id_seq'::regclass);


--
-- TOC entry 5565 (class 2604 OID 17616)
-- Name: zonas_deforestadas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zonas_deforestadas ALTER COLUMN id SET DEFAULT nextval('public.zonas_deforestadas_id_seq'::regclass);


--
-- TOC entry 5736 (class 0 OID 17589)
-- Dependencies: 224
-- Data for Name: departamentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.departamentos (id, nombre) VALUES (1, 'Amazonas');
INSERT INTO public.departamentos (id, nombre) VALUES (2, 'Antioquia');
INSERT INTO public.departamentos (id, nombre) VALUES (3, 'Arauca');
INSERT INTO public.departamentos (id, nombre) VALUES (4, 'Atlántico');
INSERT INTO public.departamentos (id, nombre) VALUES (5, 'Bolívar');
INSERT INTO public.departamentos (id, nombre) VALUES (6, 'Boyacá');
INSERT INTO public.departamentos (id, nombre) VALUES (7, 'Caldas');
INSERT INTO public.departamentos (id, nombre) VALUES (8, 'Caquetá');
INSERT INTO public.departamentos (id, nombre) VALUES (9, 'Casanare');
INSERT INTO public.departamentos (id, nombre) VALUES (10, 'Cauca');
INSERT INTO public.departamentos (id, nombre) VALUES (11, 'Cesar');
INSERT INTO public.departamentos (id, nombre) VALUES (12, 'Chocó');
INSERT INTO public.departamentos (id, nombre) VALUES (13, 'Córdoba');
INSERT INTO public.departamentos (id, nombre) VALUES (14, 'Cundinamarca');
INSERT INTO public.departamentos (id, nombre) VALUES (15, 'Guainía');
INSERT INTO public.departamentos (id, nombre) VALUES (16, 'Guaviare');
INSERT INTO public.departamentos (id, nombre) VALUES (17, 'Huila');
INSERT INTO public.departamentos (id, nombre) VALUES (18, 'La Guajira');
INSERT INTO public.departamentos (id, nombre) VALUES (19, 'Magdalena');
INSERT INTO public.departamentos (id, nombre) VALUES (20, 'Meta');
INSERT INTO public.departamentos (id, nombre) VALUES (21, 'Nariño');
INSERT INTO public.departamentos (id, nombre) VALUES (22, 'Norte de Santander');
INSERT INTO public.departamentos (id, nombre) VALUES (23, 'Putumayo');
INSERT INTO public.departamentos (id, nombre) VALUES (24, 'Quindío');
INSERT INTO public.departamentos (id, nombre) VALUES (25, 'Risaralda');
INSERT INTO public.departamentos (id, nombre) VALUES (26, 'San Andrés y Providencia');
INSERT INTO public.departamentos (id, nombre) VALUES (27, 'Santander');
INSERT INTO public.departamentos (id, nombre) VALUES (28, 'Sucre');
INSERT INTO public.departamentos (id, nombre) VALUES (29, 'Tolima');
INSERT INTO public.departamentos (id, nombre) VALUES (30, 'Valle del Cauca');
INSERT INTO public.departamentos (id, nombre) VALUES (31, 'Vaupés');
INSERT INTO public.departamentos (id, nombre) VALUES (32, 'Vichada');


--
-- TOC entry 5562 (class 0 OID 16830)
-- Dependencies: 219
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 5738 (class 0 OID 17601)
-- Dependencies: 226
-- Data for Name: tipos_proceso; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipos_proceso (id, nombre) VALUES (1, 'preventivo');
INSERT INTO public.tipos_proceso (id, nombre) VALUES (2, 'sancionatorio');


--
-- TOC entry 5740 (class 0 OID 17613)
-- Dependencies: 228
-- Data for Name: zonas_deforestadas; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.zonas_deforestadas (id, nombre_zona, tipo_proceso_id, departamento_id, geometry) VALUES (1, 'Nueva Zona Actualizada', 2, 8, '01030000202C0C0000010000000500000000000000008052C0666666666666124066666666668652C0666666666666124066666666668652C0CDCCCCCCCCCC124000000000008052C0CDCCCCCCCCCC124000000000008052C06666666666661240');


--
-- TOC entry 5750 (class 0 OID 0)
-- Dependencies: 223
-- Name: departamentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departamentos_id_seq', 32, true);


--
-- TOC entry 5751 (class 0 OID 0)
-- Dependencies: 225
-- Name: tipos_proceso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipos_proceso_id_seq', 2, true);


--
-- TOC entry 5752 (class 0 OID 0)
-- Dependencies: 227
-- Name: zonas_deforestadas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.zonas_deforestadas_id_seq', 2, true);


--
-- TOC entry 5570 (class 2606 OID 17598)
-- Name: departamentos departamentos_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos
    ADD CONSTRAINT departamentos_nombre_key UNIQUE (nombre);


--
-- TOC entry 5572 (class 2606 OID 17596)
-- Name: departamentos departamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos
    ADD CONSTRAINT departamentos_pkey PRIMARY KEY (id);


--
-- TOC entry 5576 (class 2606 OID 17610)
-- Name: tipos_proceso tipos_proceso_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_proceso
    ADD CONSTRAINT tipos_proceso_nombre_key UNIQUE (nombre);


--
-- TOC entry 5578 (class 2606 OID 17608)
-- Name: tipos_proceso tipos_proceso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_proceso
    ADD CONSTRAINT tipos_proceso_pkey PRIMARY KEY (id);


--
-- TOC entry 5582 (class 2606 OID 17620)
-- Name: zonas_deforestadas zonas_deforestadas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zonas_deforestadas
    ADD CONSTRAINT zonas_deforestadas_pkey PRIMARY KEY (id);


--
-- TOC entry 5579 (class 1259 OID 17631)
-- Name: idx_zonas_deforestadas_geometry; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_zonas_deforestadas_geometry ON public.zonas_deforestadas USING gist (geometry);


--
-- TOC entry 5573 (class 1259 OID 17599)
-- Name: ix_departamentos_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_departamentos_id ON public.departamentos USING btree (id);


--
-- TOC entry 5574 (class 1259 OID 17611)
-- Name: ix_tipos_proceso_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_tipos_proceso_id ON public.tipos_proceso USING btree (id);


--
-- TOC entry 5580 (class 1259 OID 17632)
-- Name: ix_zonas_deforestadas_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_zonas_deforestadas_id ON public.zonas_deforestadas USING btree (id);


--
-- TOC entry 5583 (class 2606 OID 17626)
-- Name: zonas_deforestadas zonas_deforestadas_departamento_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zonas_deforestadas
    ADD CONSTRAINT zonas_deforestadas_departamento_id_fkey FOREIGN KEY (departamento_id) REFERENCES public.departamentos(id);


--
-- TOC entry 5584 (class 2606 OID 17621)
-- Name: zonas_deforestadas zonas_deforestadas_tipo_proceso_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zonas_deforestadas
    ADD CONSTRAINT zonas_deforestadas_tipo_proceso_id_fkey FOREIGN KEY (tipo_proceso_id) REFERENCES public.tipos_proceso(id);


-- Completed on 2025-05-14 10:42:01

--
-- PostgreSQL database dump complete
--

