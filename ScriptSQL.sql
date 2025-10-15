--
-- PostgreSQL database dump
--

\restrict gLeu0Qzc3rYF0JoTVpAtTrdf3aGupga6mJgVV7txjXgbhWj9ojKe0b5ga2IdK1Y

-- Dumped from database version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.10 (Homebrew)

-- Started on 2025-10-15 09:34:47 WEST

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
-- TOC entry 220 (class 1259 OID 16585)
-- Name: cliente_plus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente_plus (
    id_cliente integer NOT NULL,
    fecha_alta date NOT NULL,
    volumen_compra_mensual numeric(10,2),
    mensualidad numeric(10,2)
);


ALTER TABLE public.cliente_plus OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16591)
-- Name: compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compra (
    id_compra integer NOT NULL,
    id_empleado integer NOT NULL,
    id_cliente integer NOT NULL,
    fecha date NOT NULL,
    precio_total numeric(10,2)
);


ALTER TABLE public.compra OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16590)
-- Name: compra_id_compra_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.compra_id_compra_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.compra_id_compra_seq OWNER TO postgres;

--
-- TOC entry 3471 (class 0 OID 0)
-- Dependencies: 221
-- Name: compra_id_compra_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compra_id_compra_seq OWNED BY public.compra.id_compra;


--
-- TOC entry 219 (class 1259 OID 16580)
-- Name: empleado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.empleado (
    id_empleado integer NOT NULL,
    nombre character varying(100) NOT NULL,
    fecha_contratacion date NOT NULL
);


ALTER TABLE public.empleado OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16651)
-- Name: historico_empleado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historico_empleado (
    id_historico integer NOT NULL,
    dni character varying(9) NOT NULL,
    id_empleado integer NOT NULL,
    id_zona integer NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date,
    productividad numeric(5,2)
);


ALTER TABLE public.historico_empleado OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16650)
-- Name: historico_empleado_id_historico_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.historico_empleado_id_historico_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.historico_empleado_id_historico_seq OWNER TO postgres;

--
-- TOC entry 3472 (class 0 OID 0)
-- Dependencies: 225
-- Name: historico_empleado_id_historico_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.historico_empleado_id_historico_seq OWNED BY public.historico_empleado.id_historico;


--
-- TOC entry 223 (class 1259 OID 16597)
-- Name: producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producto (
    id_producto integer NOT NULL,
    id_zona integer NOT NULL,
    nombre character varying(100) NOT NULL,
    tipo character varying(50),
    precio numeric(10,2) NOT NULL,
    cantidad integer DEFAULT 0
);


ALTER TABLE public.producto OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16628)
-- Name: producto_compra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producto_compra (
    id_compra integer NOT NULL,
    id_producto integer NOT NULL,
    id_zona integer NOT NULL,
    cantidad integer NOT NULL
);


ALTER TABLE public.producto_compra OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16562)
-- Name: vivero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vivero (
    id_vivero integer NOT NULL,
    nombre character varying(100) NOT NULL,
    longitud double precision,
    latitud double precision
);


ALTER TABLE public.vivero OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16561)
-- Name: vivero_id_vivero_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vivero_id_vivero_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vivero_id_vivero_seq OWNER TO postgres;

--
-- TOC entry 3473 (class 0 OID 0)
-- Dependencies: 215
-- Name: vivero_id_vivero_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vivero_id_vivero_seq OWNED BY public.vivero.id_vivero;


--
-- TOC entry 218 (class 1259 OID 16569)
-- Name: zona; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.zona (
    id_zona integer NOT NULL,
    id_vivero integer NOT NULL,
    nombre character varying(100),
    longitud double precision,
    latitud double precision
);


ALTER TABLE public.zona OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16568)
-- Name: zona_id_zona_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.zona_id_zona_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.zona_id_zona_seq OWNER TO postgres;

--
-- TOC entry 3474 (class 0 OID 0)
-- Dependencies: 217
-- Name: zona_id_zona_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.zona_id_zona_seq OWNED BY public.zona.id_zona;


--
-- TOC entry 3282 (class 2604 OID 16594)
-- Name: compra id_compra; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra ALTER COLUMN id_compra SET DEFAULT nextval('public.compra_id_compra_seq'::regclass);


--
-- TOC entry 3284 (class 2604 OID 16654)
-- Name: historico_empleado id_historico; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historico_empleado ALTER COLUMN id_historico SET DEFAULT nextval('public.historico_empleado_id_historico_seq'::regclass);


--
-- TOC entry 3280 (class 2604 OID 16565)
-- Name: vivero id_vivero; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vivero ALTER COLUMN id_vivero SET DEFAULT nextval('public.vivero_id_vivero_seq'::regclass);


--
-- TOC entry 3281 (class 2604 OID 16572)
-- Name: zona id_zona; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zona ALTER COLUMN id_zona SET DEFAULT nextval('public.zona_id_zona_seq'::regclass);


--
-- TOC entry 3459 (class 0 OID 16585)
-- Dependencies: 220
-- Data for Name: cliente_plus; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cliente_plus VALUES (201, '2023-01-01', 500.00, 50.00);
INSERT INTO public.cliente_plus VALUES (202, '2023-02-15', 300.00, 30.00);
INSERT INTO public.cliente_plus VALUES (203, '2023-03-10', 700.00, 70.00);
INSERT INTO public.cliente_plus VALUES (204, '2023-04-20', 400.00, 40.00);
INSERT INTO public.cliente_plus VALUES (205, '2023-05-05', 600.00, 60.00);


--
-- TOC entry 3461 (class 0 OID 16591)
-- Dependencies: 222
-- Data for Name: compra; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.compra VALUES (1, 101, 201, '2023-08-01', 150.00);
INSERT INTO public.compra VALUES (2, 102, 202, '2023-08-05', 200.00);
INSERT INTO public.compra VALUES (3, 103, 203, '2023-08-10', 350.00);
INSERT INTO public.compra VALUES (4, 104, 204, '2023-08-15', 100.00);
INSERT INTO public.compra VALUES (5, 105, 205, '2023-08-20', 400.00);


--
-- TOC entry 3458 (class 0 OID 16580)
-- Dependencies: 219
-- Data for Name: empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.empleado VALUES (101, 'Juan Pérez', '2022-01-10');
INSERT INTO public.empleado VALUES (102, 'María López', '2021-03-15');
INSERT INTO public.empleado VALUES (103, 'Carlos García', '2020-07-01');
INSERT INTO public.empleado VALUES (104, 'Ana Torres', '2019-09-23');
INSERT INTO public.empleado VALUES (105, 'Luis Martínez', '2023-05-12');


--
-- TOC entry 3465 (class 0 OID 16651)
-- Dependencies: 226
-- Data for Name: historico_empleado; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.historico_empleado VALUES (1, '12345678A', 101, 1, '2022-01-10', '2022-12-31', 85.50);
INSERT INTO public.historico_empleado VALUES (2, '23456789B', 102, 1, '2021-03-15', '2022-03-14', 90.00);
INSERT INTO public.historico_empleado VALUES (3, '34567890C', 103, 2, '2020-07-01', '2021-06-30', 78.20);
INSERT INTO public.historico_empleado VALUES (4, '45678901D', 104, 3, '2019-09-23', '2020-09-22', 88.70);
INSERT INTO public.historico_empleado VALUES (5, '56789012E', 105, 4, '2023-05-12', NULL, 95.00);


--
-- TOC entry 3462 (class 0 OID 16597)
-- Dependencies: 223
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.producto VALUES (301, 1, 'Rosa Roja', 'Flor', 2.50, 100);
INSERT INTO public.producto VALUES (302, 1, 'Tulipán', 'Flor', 1.80, 80);
INSERT INTO public.producto VALUES (303, 2, 'Cactus', 'Planta', 5.00, 50);
INSERT INTO public.producto VALUES (304, 3, 'Orquídea', 'Flor', 7.00, 30);
INSERT INTO public.producto VALUES (305, 4, 'Helecho', 'Planta', 3.50, 60);


--
-- TOC entry 3463 (class 0 OID 16628)
-- Dependencies: 224
-- Data for Name: producto_compra; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.producto_compra VALUES (1, 301, 1, 10);
INSERT INTO public.producto_compra VALUES (1, 302, 1, 5);
INSERT INTO public.producto_compra VALUES (2, 303, 2, 7);
INSERT INTO public.producto_compra VALUES (3, 304, 3, 3);
INSERT INTO public.producto_compra VALUES (4, 305, 4, 8);


--
-- TOC entry 3455 (class 0 OID 16562)
-- Dependencies: 216
-- Data for Name: vivero; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.vivero VALUES (1, 'Vivero Central', 40.4168, -3.7038);
INSERT INTO public.vivero VALUES (2, 'Vivero Norte', 41.652, -0.8773);
INSERT INTO public.vivero VALUES (3, 'Vivero Sur', 36.7213, -4.4214);
INSERT INTO public.vivero VALUES (4, 'Vivero Este', 39.4699, -0.3763);
INSERT INTO public.vivero VALUES (5, 'Vivero Oeste', 43.3623, -8.4115);


--
-- TOC entry 3457 (class 0 OID 16569)
-- Dependencies: 218
-- Data for Name: zona; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.zona VALUES (1, 1, 'Zona A', 40.417, -3.704);
INSERT INTO public.zona VALUES (2, 1, 'Zona B', 40.4165, -3.7035);
INSERT INTO public.zona VALUES (3, 2, 'Zona C', 41.6522, -0.877);
INSERT INTO public.zona VALUES (4, 3, 'Zona D', 36.7215, -4.421);
INSERT INTO public.zona VALUES (5, 4, 'Zona E', 39.47, -0.376);


--
-- TOC entry 3475 (class 0 OID 0)
-- Dependencies: 221
-- Name: compra_id_compra_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.compra_id_compra_seq', 5, true);


--
-- TOC entry 3476 (class 0 OID 0)
-- Dependencies: 225
-- Name: historico_empleado_id_historico_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historico_empleado_id_historico_seq', 5, true);


--
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 215
-- Name: vivero_id_vivero_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vivero_id_vivero_seq', 5, true);


--
-- TOC entry 3478 (class 0 OID 0)
-- Dependencies: 217
-- Name: zona_id_zona_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.zona_id_zona_seq', 5, true);


--
-- TOC entry 3292 (class 2606 OID 16589)
-- Name: cliente_plus cliente_plus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente_plus
    ADD CONSTRAINT cliente_plus_pkey PRIMARY KEY (id_cliente);


--
-- TOC entry 3294 (class 2606 OID 16596)
-- Name: compra compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT compra_pkey PRIMARY KEY (id_compra);


--
-- TOC entry 3290 (class 2606 OID 16584)
-- Name: empleado empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.empleado
    ADD CONSTRAINT empleado_pkey PRIMARY KEY (id_empleado);


--
-- TOC entry 3300 (class 2606 OID 16656)
-- Name: historico_empleado historico_empleado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historico_empleado
    ADD CONSTRAINT historico_empleado_pkey PRIMARY KEY (id_historico);


--
-- TOC entry 3298 (class 2606 OID 16632)
-- Name: producto_compra producto_compra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto_compra
    ADD CONSTRAINT producto_compra_pkey PRIMARY KEY (id_compra, id_producto, id_zona);


--
-- TOC entry 3296 (class 2606 OID 16602)
-- Name: producto producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id_producto, id_zona);


--
-- TOC entry 3286 (class 2606 OID 16567)
-- Name: vivero vivero_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vivero
    ADD CONSTRAINT vivero_pkey PRIMARY KEY (id_vivero);


--
-- TOC entry 3288 (class 2606 OID 16574)
-- Name: zona zona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zona
    ADD CONSTRAINT zona_pkey PRIMARY KEY (id_zona);


--
-- TOC entry 3302 (class 2606 OID 16667)
-- Name: compra fk_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT fk_cliente FOREIGN KEY (id_cliente) REFERENCES public.cliente_plus(id_cliente) ON DELETE CASCADE;


--
-- TOC entry 3303 (class 2606 OID 16672)
-- Name: compra fk_id_empleado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compra
    ADD CONSTRAINT fk_id_empleado FOREIGN KEY (id_empleado) REFERENCES public.empleado(id_empleado) ON DELETE CASCADE;


--
-- TOC entry 3307 (class 2606 OID 16677)
-- Name: historico_empleado fk_id_empleado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historico_empleado
    ADD CONSTRAINT fk_id_empleado FOREIGN KEY (id_empleado) REFERENCES public.empleado(id_empleado) ON DELETE CASCADE;


--
-- TOC entry 3308 (class 2606 OID 16682)
-- Name: historico_empleado fk_id_zona; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historico_empleado
    ADD CONSTRAINT fk_id_zona FOREIGN KEY (id_zona) REFERENCES public.zona(id_zona) ON DELETE CASCADE;


--
-- TOC entry 3309 (class 2606 OID 16657)
-- Name: historico_empleado historico_empleado_id_empleado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historico_empleado
    ADD CONSTRAINT historico_empleado_id_empleado_fkey FOREIGN KEY (id_empleado) REFERENCES public.empleado(id_empleado) ON DELETE CASCADE;


--
-- TOC entry 3310 (class 2606 OID 16662)
-- Name: historico_empleado historico_empleado_id_zona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historico_empleado
    ADD CONSTRAINT historico_empleado_id_zona_fkey FOREIGN KEY (id_zona) REFERENCES public.zona(id_zona) ON DELETE CASCADE;


--
-- TOC entry 3305 (class 2606 OID 16633)
-- Name: producto_compra producto_compra_id_compra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto_compra
    ADD CONSTRAINT producto_compra_id_compra_fkey FOREIGN KEY (id_compra) REFERENCES public.compra(id_compra) ON DELETE CASCADE;


--
-- TOC entry 3306 (class 2606 OID 16638)
-- Name: producto_compra producto_compra_id_producto_id_zona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto_compra
    ADD CONSTRAINT producto_compra_id_producto_id_zona_fkey FOREIGN KEY (id_producto, id_zona) REFERENCES public.producto(id_producto, id_zona) ON DELETE CASCADE;


--
-- TOC entry 3304 (class 2606 OID 16603)
-- Name: producto producto_id_zona_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_id_zona_fkey FOREIGN KEY (id_zona) REFERENCES public.zona(id_zona) ON DELETE CASCADE;


--
-- TOC entry 3301 (class 2606 OID 16575)
-- Name: zona zona_id_vivero_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.zona
    ADD CONSTRAINT zona_id_vivero_fkey FOREIGN KEY (id_vivero) REFERENCES public.vivero(id_vivero) ON DELETE CASCADE;


-- Completed on 2025-10-15 09:34:48 WEST

--
-- PostgreSQL database dump complete
--

\unrestrict gLeu0Qzc3rYF0JoTVpAtTrdf3aGupga6mJgVV7txjXgbhWj9ojKe0b5ga2IdK1Y

