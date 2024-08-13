--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-08-12 21:57:06

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

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3475 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 869 (class 1247 OID 1220660)
-- Name: tipo_factura_enum; Type: TYPE; Schema: public; Owner: Comfe_owner
--

CREATE TYPE public.tipo_factura_enum AS ENUM (
    'A',
    'B',
    'C',
    'D'
);


ALTER TYPE public.tipo_factura_enum OWNER TO "Comfe_owner";

--
-- TOC entry 872 (class 1247 OID 1220670)
-- Name: tipo_pago_enum; Type: TYPE; Schema: public; Owner: Comfe_owner
--

CREATE TYPE public.tipo_pago_enum AS ENUM (
    'EFECTIVO',
    'CHEQUE',
    'TARJETA CREDITO',
    'TARJETA DEBITO'
);


ALTER TYPE public.tipo_pago_enum OWNER TO "Comfe_owner";

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 229 (class 1259 OID 1433624)
-- Name: categorias; Type: TABLE; Schema: public; Owner: Comfe_owner
--

CREATE TABLE public.categorias (
    id_categoria integer NOT NULL,
    nombre_categoria character varying(50) NOT NULL,
    descripcion text
);


ALTER TABLE public.categorias OWNER TO "Comfe_owner";

--
-- TOC entry 228 (class 1259 OID 1433623)
-- Name: categorias_id_categoria_seq; Type: SEQUENCE; Schema: public; Owner: Comfe_owner
--

CREATE SEQUENCE public.categorias_id_categoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categorias_id_categoria_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3476 (class 0 OID 0)
-- Dependencies: 228
-- Name: categorias_id_categoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Comfe_owner
--

ALTER SEQUENCE public.categorias_id_categoria_seq OWNED BY public.categorias.id_categoria;


--
-- TOC entry 225 (class 1259 OID 1433601)
-- Name: clientes; Type: TABLE; Schema: public; Owner: Comfe_owner
--

CREATE TABLE public.clientes (
    id_cliente integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellidos character varying(100),
    email character varying(100) NOT NULL,
    telefono character varying(20),
    direccion text,
    ciudad character varying(50),
    pais character varying(50),
    codigo_postal character varying(10),
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.clientes OWNER TO "Comfe_owner";

--
-- TOC entry 224 (class 1259 OID 1433600)
-- Name: clientes_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: Comfe_owner
--

CREATE SEQUENCE public.clientes_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clientes_id_cliente_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 224
-- Name: clientes_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Comfe_owner
--

ALTER SEQUENCE public.clientes_id_cliente_seq OWNED BY public.clientes.id_cliente;


--
-- TOC entry 238 (class 1259 OID 1433690)
-- Name: detalles_pedido; Type: TABLE; Schema: public; Owner: Comfe_owner
--

CREATE TABLE public.detalles_pedido (
    id_detalle integer NOT NULL,
    id_pedido integer,
    id_producto integer,
    cantidad integer NOT NULL,
    precio_unitario numeric(10,2) NOT NULL
);


ALTER TABLE public.detalles_pedido OWNER TO "Comfe_owner";

--
-- TOC entry 237 (class 1259 OID 1433689)
-- Name: detalles_pedido_id_detalle_seq; Type: SEQUENCE; Schema: public; Owner: Comfe_owner
--

CREATE SEQUENCE public.detalles_pedido_id_detalle_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.detalles_pedido_id_detalle_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3478 (class 0 OID 0)
-- Dependencies: 237
-- Name: detalles_pedido_id_detalle_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Comfe_owner
--

ALTER SEQUENCE public.detalles_pedido_id_detalle_seq OWNED BY public.detalles_pedido.id_detalle;


--
-- TOC entry 244 (class 1259 OID 1433733)
-- Name: devoluciones; Type: TABLE; Schema: public; Owner: Comfe_owner
--

CREATE TABLE public.devoluciones (
    id_devolucion integer NOT NULL,
    id_pedido integer,
    id_producto integer,
    cantidad integer NOT NULL,
    fecha_devolucion timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    motivo text
);


ALTER TABLE public.devoluciones OWNER TO "Comfe_owner";

--
-- TOC entry 243 (class 1259 OID 1433732)
-- Name: devoluciones_id_devolucion_seq; Type: SEQUENCE; Schema: public; Owner: Comfe_owner
--

CREATE SEQUENCE public.devoluciones_id_devolucion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.devoluciones_id_devolucion_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3479 (class 0 OID 0)
-- Dependencies: 243
-- Name: devoluciones_id_devolucion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Comfe_owner
--

ALTER SEQUENCE public.devoluciones_id_devolucion_seq OWNED BY public.devoluciones.id_devolucion;


--
-- TOC entry 227 (class 1259 OID 1433613)
-- Name: empleados; Type: TABLE; Schema: public; Owner: Comfe_owner
--

CREATE TABLE public.empleados (
    id_empleado integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellidos character varying(100),
    email character varying(100) NOT NULL,
    telefono character varying(20),
    direccion text,
    ciudad character varying(50),
    pais character varying(50),
    codigo_postal character varying(10),
    puesto character varying(50),
    salario numeric(10,2),
    fecha_contratacion date
);


ALTER TABLE public.empleados OWNER TO "Comfe_owner";

--
-- TOC entry 226 (class 1259 OID 1433612)
-- Name: empleados_id_empleado_seq; Type: SEQUENCE; Schema: public; Owner: Comfe_owner
--

CREATE SEQUENCE public.empleados_id_empleado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.empleados_id_empleado_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3480 (class 0 OID 0)
-- Dependencies: 226
-- Name: empleados_id_empleado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Comfe_owner
--

ALTER SEQUENCE public.empleados_id_empleado_seq OWNED BY public.empleados.id_empleado;


--
-- TOC entry 219 (class 1259 OID 1220774)
-- Name: id_sec_cli; Type: SEQUENCE; Schema: public; Owner: Comfe_owner
--

CREATE SEQUENCE public.id_sec_cli
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.id_sec_cli OWNER TO "Comfe_owner";

--
-- TOC entry 220 (class 1259 OID 1220775)
-- Name: id_sec_compr_cli; Type: SEQUENCE; Schema: public; Owner: Comfe_owner
--

CREATE SEQUENCE public.id_sec_compr_cli
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.id_sec_compr_cli OWNER TO "Comfe_owner";

--
-- TOC entry 217 (class 1259 OID 1220772)
-- Name: id_sec_empl; Type: SEQUENCE; Schema: public; Owner: Comfe_owner
--

CREATE SEQUENCE public.id_sec_empl
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.id_sec_empl OWNER TO "Comfe_owner";

--
-- TOC entry 222 (class 1259 OID 1220777)
-- Name: id_sec_fact; Type: SEQUENCE; Schema: public; Owner: Comfe_owner
--

CREATE SEQUENCE public.id_sec_fact
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.id_sec_fact OWNER TO "Comfe_owner";

--
-- TOC entry 223 (class 1259 OID 1220778)
-- Name: id_sec_fact_det; Type: SEQUENCE; Schema: public; Owner: Comfe_owner
--

CREATE SEQUENCE public.id_sec_fact_det
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.id_sec_fact_det OWNER TO "Comfe_owner";

--
-- TOC entry 216 (class 1259 OID 1220771)
-- Name: id_sec_produc; Type: SEQUENCE; Schema: public; Owner: Comfe_owner
--

CREATE SEQUENCE public.id_sec_produc
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.id_sec_produc OWNER TO "Comfe_owner";

--
-- TOC entry 215 (class 1259 OID 1220770)
-- Name: id_sec_provee; Type: SEQUENCE; Schema: public; Owner: Comfe_owner
--

CREATE SEQUENCE public.id_sec_provee
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.id_sec_provee OWNER TO "Comfe_owner";

--
-- TOC entry 218 (class 1259 OID 1220773)
-- Name: id_sec_vent; Type: SEQUENCE; Schema: public; Owner: Comfe_owner
--

CREATE SEQUENCE public.id_sec_vent
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.id_sec_vent OWNER TO "Comfe_owner";

--
-- TOC entry 221 (class 1259 OID 1220776)
-- Name: id_sec_vent_prod; Type: SEQUENCE; Schema: public; Owner: Comfe_owner
--

CREATE SEQUENCE public.id_sec_vent_prod
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.id_sec_vent_prod OWNER TO "Comfe_owner";

--
-- TOC entry 242 (class 1259 OID 1433720)
-- Name: inventario; Type: TABLE; Schema: public; Owner: Comfe_owner
--

CREATE TABLE public.inventario (
    id_inventario integer NOT NULL,
    id_producto integer,
    cantidad_disponible integer NOT NULL,
    cantidad_reservada integer DEFAULT 0,
    ubicacion character varying(100)
);


ALTER TABLE public.inventario OWNER TO "Comfe_owner";

--
-- TOC entry 241 (class 1259 OID 1433719)
-- Name: inventario_id_inventario_seq; Type: SEQUENCE; Schema: public; Owner: Comfe_owner
--

CREATE SEQUENCE public.inventario_id_inventario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inventario_id_inventario_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 241
-- Name: inventario_id_inventario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Comfe_owner
--

ALTER SEQUENCE public.inventario_id_inventario_seq OWNED BY public.inventario.id_inventario;


--
-- TOC entry 240 (class 1259 OID 1433707)
-- Name: pagos; Type: TABLE; Schema: public; Owner: Comfe_owner
--

CREATE TABLE public.pagos (
    id_pago integer NOT NULL,
    id_pedido integer,
    fecha_pago timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    monto numeric(10,2) NOT NULL,
    metodo_pago character varying(50) NOT NULL
);


ALTER TABLE public.pagos OWNER TO "Comfe_owner";

--
-- TOC entry 239 (class 1259 OID 1433706)
-- Name: pagos_id_pago_seq; Type: SEQUENCE; Schema: public; Owner: Comfe_owner
--

CREATE SEQUENCE public.pagos_id_pago_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pagos_id_pago_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 239
-- Name: pagos_id_pago_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Comfe_owner
--

ALTER SEQUENCE public.pagos_id_pago_seq OWNED BY public.pagos.id_pago;


--
-- TOC entry 236 (class 1259 OID 1433672)
-- Name: pedidos; Type: TABLE; Schema: public; Owner: Comfe_owner
--

CREATE TABLE public.pedidos (
    id_pedido integer NOT NULL,
    id_cliente integer,
    id_empleado integer,
    fecha_pedido timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    estado character varying(50) NOT NULL,
    total numeric(10,2) NOT NULL
);


ALTER TABLE public.pedidos OWNER TO "Comfe_owner";

--
-- TOC entry 235 (class 1259 OID 1433671)
-- Name: pedidos_id_pedido_seq; Type: SEQUENCE; Schema: public; Owner: Comfe_owner
--

CREATE SEQUENCE public.pedidos_id_pedido_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pedidos_id_pedido_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3483 (class 0 OID 0)
-- Dependencies: 235
-- Name: pedidos_id_pedido_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Comfe_owner
--

ALTER SEQUENCE public.pedidos_id_pedido_seq OWNED BY public.pedidos.id_pedido;


--
-- TOC entry 231 (class 1259 OID 1433633)
-- Name: productos; Type: TABLE; Schema: public; Owner: Comfe_owner
--

CREATE TABLE public.productos (
    id_producto integer NOT NULL,
    nombre_producto character varying(100) NOT NULL,
    descripcion text,
    precio numeric(10,2) NOT NULL,
    stock integer NOT NULL,
    id_categoria integer,
    fecha_agregado timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.productos OWNER TO "Comfe_owner";

--
-- TOC entry 230 (class 1259 OID 1433632)
-- Name: productos_id_producto_seq; Type: SEQUENCE; Schema: public; Owner: Comfe_owner
--

CREATE SEQUENCE public.productos_id_producto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.productos_id_producto_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3484 (class 0 OID 0)
-- Dependencies: 230
-- Name: productos_id_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Comfe_owner
--

ALTER SEQUENCE public.productos_id_producto_seq OWNED BY public.productos.id_producto;


--
-- TOC entry 234 (class 1259 OID 1433656)
-- Name: productos_proveedores; Type: TABLE; Schema: public; Owner: Comfe_owner
--

CREATE TABLE public.productos_proveedores (
    id_producto integer NOT NULL,
    id_proveedor integer NOT NULL
);


ALTER TABLE public.productos_proveedores OWNER TO "Comfe_owner";

--
-- TOC entry 233 (class 1259 OID 1433648)
-- Name: proveedores; Type: TABLE; Schema: public; Owner: Comfe_owner
--

CREATE TABLE public.proveedores (
    id_proveedor integer NOT NULL,
    nombre_proveedor character varying(100) NOT NULL,
    contacto character varying(100),
    telefono character varying(20),
    direccion text,
    ciudad character varying(50),
    pais character varying(50),
    codigo_postal character varying(10),
    email character varying(100)
);


ALTER TABLE public.proveedores OWNER TO "Comfe_owner";

--
-- TOC entry 232 (class 1259 OID 1433647)
-- Name: proveedores_id_proveedor_seq; Type: SEQUENCE; Schema: public; Owner: Comfe_owner
--

CREATE SEQUENCE public.proveedores_id_proveedor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.proveedores_id_proveedor_seq OWNER TO "Comfe_owner";

--
-- TOC entry 3485 (class 0 OID 0)
-- Dependencies: 232
-- Name: proveedores_id_proveedor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Comfe_owner
--

ALTER SEQUENCE public.proveedores_id_proveedor_seq OWNED BY public.proveedores.id_proveedor;


--
-- TOC entry 3247 (class 2604 OID 1433627)
-- Name: categorias id_categoria; Type: DEFAULT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.categorias ALTER COLUMN id_categoria SET DEFAULT nextval('public.categorias_id_categoria_seq'::regclass);


--
-- TOC entry 3244 (class 2604 OID 1433604)
-- Name: clientes id_cliente; Type: DEFAULT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id_cliente SET DEFAULT nextval('public.clientes_id_cliente_seq'::regclass);


--
-- TOC entry 3253 (class 2604 OID 1433693)
-- Name: detalles_pedido id_detalle; Type: DEFAULT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.detalles_pedido ALTER COLUMN id_detalle SET DEFAULT nextval('public.detalles_pedido_id_detalle_seq'::regclass);


--
-- TOC entry 3258 (class 2604 OID 1433736)
-- Name: devoluciones id_devolucion; Type: DEFAULT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.devoluciones ALTER COLUMN id_devolucion SET DEFAULT nextval('public.devoluciones_id_devolucion_seq'::regclass);


--
-- TOC entry 3246 (class 2604 OID 1433616)
-- Name: empleados id_empleado; Type: DEFAULT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.empleados ALTER COLUMN id_empleado SET DEFAULT nextval('public.empleados_id_empleado_seq'::regclass);


--
-- TOC entry 3256 (class 2604 OID 1433723)
-- Name: inventario id_inventario; Type: DEFAULT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.inventario ALTER COLUMN id_inventario SET DEFAULT nextval('public.inventario_id_inventario_seq'::regclass);


--
-- TOC entry 3254 (class 2604 OID 1433710)
-- Name: pagos id_pago; Type: DEFAULT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.pagos ALTER COLUMN id_pago SET DEFAULT nextval('public.pagos_id_pago_seq'::regclass);


--
-- TOC entry 3251 (class 2604 OID 1433675)
-- Name: pedidos id_pedido; Type: DEFAULT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.pedidos ALTER COLUMN id_pedido SET DEFAULT nextval('public.pedidos_id_pedido_seq'::regclass);


--
-- TOC entry 3248 (class 2604 OID 1433636)
-- Name: productos id_producto; Type: DEFAULT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.productos ALTER COLUMN id_producto SET DEFAULT nextval('public.productos_id_producto_seq'::regclass);


--
-- TOC entry 3250 (class 2604 OID 1433651)
-- Name: proveedores id_proveedor; Type: DEFAULT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.proveedores ALTER COLUMN id_proveedor SET DEFAULT nextval('public.proveedores_id_proveedor_seq'::regclass);


--
-- TOC entry 3454 (class 0 OID 1433624)
-- Dependencies: 229
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: Comfe_owner
--

COPY public.categorias (id_categoria, nombre_categoria, descripcion) FROM stdin;
\.


--
-- TOC entry 3450 (class 0 OID 1433601)
-- Dependencies: 225
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: Comfe_owner
--

COPY public.clientes (id_cliente, nombre, apellidos, email, telefono, direccion, ciudad, pais, codigo_postal, fecha_registro) FROM stdin;
\.


--
-- TOC entry 3463 (class 0 OID 1433690)
-- Dependencies: 238
-- Data for Name: detalles_pedido; Type: TABLE DATA; Schema: public; Owner: Comfe_owner
--

COPY public.detalles_pedido (id_detalle, id_pedido, id_producto, cantidad, precio_unitario) FROM stdin;
\.


--
-- TOC entry 3469 (class 0 OID 1433733)
-- Dependencies: 244
-- Data for Name: devoluciones; Type: TABLE DATA; Schema: public; Owner: Comfe_owner
--

COPY public.devoluciones (id_devolucion, id_pedido, id_producto, cantidad, fecha_devolucion, motivo) FROM stdin;
\.


--
-- TOC entry 3452 (class 0 OID 1433613)
-- Dependencies: 227
-- Data for Name: empleados; Type: TABLE DATA; Schema: public; Owner: Comfe_owner
--

COPY public.empleados (id_empleado, nombre, apellidos, email, telefono, direccion, ciudad, pais, codigo_postal, puesto, salario, fecha_contratacion) FROM stdin;
\.


--
-- TOC entry 3467 (class 0 OID 1433720)
-- Dependencies: 242
-- Data for Name: inventario; Type: TABLE DATA; Schema: public; Owner: Comfe_owner
--

COPY public.inventario (id_inventario, id_producto, cantidad_disponible, cantidad_reservada, ubicacion) FROM stdin;
\.


--
-- TOC entry 3465 (class 0 OID 1433707)
-- Dependencies: 240
-- Data for Name: pagos; Type: TABLE DATA; Schema: public; Owner: Comfe_owner
--

COPY public.pagos (id_pago, id_pedido, fecha_pago, monto, metodo_pago) FROM stdin;
\.


--
-- TOC entry 3461 (class 0 OID 1433672)
-- Dependencies: 236
-- Data for Name: pedidos; Type: TABLE DATA; Schema: public; Owner: Comfe_owner
--

COPY public.pedidos (id_pedido, id_cliente, id_empleado, fecha_pedido, estado, total) FROM stdin;
\.


--
-- TOC entry 3456 (class 0 OID 1433633)
-- Dependencies: 231
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: Comfe_owner
--

COPY public.productos (id_producto, nombre_producto, descripcion, precio, stock, id_categoria, fecha_agregado) FROM stdin;
\.


--
-- TOC entry 3459 (class 0 OID 1433656)
-- Dependencies: 234
-- Data for Name: productos_proveedores; Type: TABLE DATA; Schema: public; Owner: Comfe_owner
--

COPY public.productos_proveedores (id_producto, id_proveedor) FROM stdin;
\.


--
-- TOC entry 3458 (class 0 OID 1433648)
-- Dependencies: 233
-- Data for Name: proveedores; Type: TABLE DATA; Schema: public; Owner: Comfe_owner
--

COPY public.proveedores (id_proveedor, nombre_proveedor, contacto, telefono, direccion, ciudad, pais, codigo_postal, email) FROM stdin;
\.


--
-- TOC entry 3486 (class 0 OID 0)
-- Dependencies: 228
-- Name: categorias_id_categoria_seq; Type: SEQUENCE SET; Schema: public; Owner: Comfe_owner
--

SELECT pg_catalog.setval('public.categorias_id_categoria_seq', 1, false);


--
-- TOC entry 3487 (class 0 OID 0)
-- Dependencies: 224
-- Name: clientes_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: Comfe_owner
--

SELECT pg_catalog.setval('public.clientes_id_cliente_seq', 1, false);


--
-- TOC entry 3488 (class 0 OID 0)
-- Dependencies: 237
-- Name: detalles_pedido_id_detalle_seq; Type: SEQUENCE SET; Schema: public; Owner: Comfe_owner
--

SELECT pg_catalog.setval('public.detalles_pedido_id_detalle_seq', 1, false);


--
-- TOC entry 3489 (class 0 OID 0)
-- Dependencies: 243
-- Name: devoluciones_id_devolucion_seq; Type: SEQUENCE SET; Schema: public; Owner: Comfe_owner
--

SELECT pg_catalog.setval('public.devoluciones_id_devolucion_seq', 1, false);


--
-- TOC entry 3490 (class 0 OID 0)
-- Dependencies: 226
-- Name: empleados_id_empleado_seq; Type: SEQUENCE SET; Schema: public; Owner: Comfe_owner
--

SELECT pg_catalog.setval('public.empleados_id_empleado_seq', 1, false);


--
-- TOC entry 3491 (class 0 OID 0)
-- Dependencies: 219
-- Name: id_sec_cli; Type: SEQUENCE SET; Schema: public; Owner: Comfe_owner
--

SELECT pg_catalog.setval('public.id_sec_cli', 3, true);


--
-- TOC entry 3492 (class 0 OID 0)
-- Dependencies: 220
-- Name: id_sec_compr_cli; Type: SEQUENCE SET; Schema: public; Owner: Comfe_owner
--

SELECT pg_catalog.setval('public.id_sec_compr_cli', 2, true);


--
-- TOC entry 3493 (class 0 OID 0)
-- Dependencies: 217
-- Name: id_sec_empl; Type: SEQUENCE SET; Schema: public; Owner: Comfe_owner
--

SELECT pg_catalog.setval('public.id_sec_empl', 8, true);


--
-- TOC entry 3494 (class 0 OID 0)
-- Dependencies: 222
-- Name: id_sec_fact; Type: SEQUENCE SET; Schema: public; Owner: Comfe_owner
--

SELECT pg_catalog.setval('public.id_sec_fact', 3, true);


--
-- TOC entry 3495 (class 0 OID 0)
-- Dependencies: 223
-- Name: id_sec_fact_det; Type: SEQUENCE SET; Schema: public; Owner: Comfe_owner
--

SELECT pg_catalog.setval('public.id_sec_fact_det', 3, true);


--
-- TOC entry 3496 (class 0 OID 0)
-- Dependencies: 216
-- Name: id_sec_produc; Type: SEQUENCE SET; Schema: public; Owner: Comfe_owner
--

SELECT pg_catalog.setval('public.id_sec_produc', 21, true);


--
-- TOC entry 3497 (class 0 OID 0)
-- Dependencies: 215
-- Name: id_sec_provee; Type: SEQUENCE SET; Schema: public; Owner: Comfe_owner
--

SELECT pg_catalog.setval('public.id_sec_provee', 9, true);


--
-- TOC entry 3498 (class 0 OID 0)
-- Dependencies: 218
-- Name: id_sec_vent; Type: SEQUENCE SET; Schema: public; Owner: Comfe_owner
--

SELECT pg_catalog.setval('public.id_sec_vent', 3, true);


--
-- TOC entry 3499 (class 0 OID 0)
-- Dependencies: 221
-- Name: id_sec_vent_prod; Type: SEQUENCE SET; Schema: public; Owner: Comfe_owner
--

SELECT pg_catalog.setval('public.id_sec_vent_prod', 6, true);


--
-- TOC entry 3500 (class 0 OID 0)
-- Dependencies: 241
-- Name: inventario_id_inventario_seq; Type: SEQUENCE SET; Schema: public; Owner: Comfe_owner
--

SELECT pg_catalog.setval('public.inventario_id_inventario_seq', 1, false);


--
-- TOC entry 3501 (class 0 OID 0)
-- Dependencies: 239
-- Name: pagos_id_pago_seq; Type: SEQUENCE SET; Schema: public; Owner: Comfe_owner
--

SELECT pg_catalog.setval('public.pagos_id_pago_seq', 1, false);


--
-- TOC entry 3502 (class 0 OID 0)
-- Dependencies: 235
-- Name: pedidos_id_pedido_seq; Type: SEQUENCE SET; Schema: public; Owner: Comfe_owner
--

SELECT pg_catalog.setval('public.pedidos_id_pedido_seq', 1, false);


--
-- TOC entry 3503 (class 0 OID 0)
-- Dependencies: 230
-- Name: productos_id_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: Comfe_owner
--

SELECT pg_catalog.setval('public.productos_id_producto_seq', 1, false);


--
-- TOC entry 3504 (class 0 OID 0)
-- Dependencies: 232
-- Name: proveedores_id_proveedor_seq; Type: SEQUENCE SET; Schema: public; Owner: Comfe_owner
--

SELECT pg_catalog.setval('public.proveedores_id_proveedor_seq', 1, false);


--
-- TOC entry 3269 (class 2606 OID 1433631)
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id_categoria);


--
-- TOC entry 3261 (class 2606 OID 1433611)
-- Name: clientes clientes_email_key; Type: CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_email_key UNIQUE (email);


--
-- TOC entry 3263 (class 2606 OID 1433609)
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id_cliente);


--
-- TOC entry 3279 (class 2606 OID 1433695)
-- Name: detalles_pedido detalles_pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.detalles_pedido
    ADD CONSTRAINT detalles_pedido_pkey PRIMARY KEY (id_detalle);


--
-- TOC entry 3285 (class 2606 OID 1433741)
-- Name: devoluciones devoluciones_pkey; Type: CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.devoluciones
    ADD CONSTRAINT devoluciones_pkey PRIMARY KEY (id_devolucion);


--
-- TOC entry 3265 (class 2606 OID 1433622)
-- Name: empleados empleados_email_key; Type: CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_email_key UNIQUE (email);


--
-- TOC entry 3267 (class 2606 OID 1433620)
-- Name: empleados empleados_pkey; Type: CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.empleados
    ADD CONSTRAINT empleados_pkey PRIMARY KEY (id_empleado);


--
-- TOC entry 3283 (class 2606 OID 1433726)
-- Name: inventario inventario_pkey; Type: CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT inventario_pkey PRIMARY KEY (id_inventario);


--
-- TOC entry 3281 (class 2606 OID 1433713)
-- Name: pagos pagos_pkey; Type: CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT pagos_pkey PRIMARY KEY (id_pago);


--
-- TOC entry 3277 (class 2606 OID 1433678)
-- Name: pedidos pedidos_pkey; Type: CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_pkey PRIMARY KEY (id_pedido);


--
-- TOC entry 3271 (class 2606 OID 1433641)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id_producto);


--
-- TOC entry 3275 (class 2606 OID 1433660)
-- Name: productos_proveedores productos_proveedores_pkey; Type: CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.productos_proveedores
    ADD CONSTRAINT productos_proveedores_pkey PRIMARY KEY (id_producto, id_proveedor);


--
-- TOC entry 3273 (class 2606 OID 1433655)
-- Name: proveedores proveedores_pkey; Type: CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (id_proveedor);


--
-- TOC entry 3291 (class 2606 OID 1433696)
-- Name: detalles_pedido detalles_pedido_id_pedido_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.detalles_pedido
    ADD CONSTRAINT detalles_pedido_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES public.pedidos(id_pedido) ON DELETE CASCADE;


--
-- TOC entry 3292 (class 2606 OID 1433701)
-- Name: detalles_pedido detalles_pedido_id_producto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.detalles_pedido
    ADD CONSTRAINT detalles_pedido_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto) ON DELETE SET NULL;


--
-- TOC entry 3295 (class 2606 OID 1433742)
-- Name: devoluciones devoluciones_id_pedido_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.devoluciones
    ADD CONSTRAINT devoluciones_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES public.pedidos(id_pedido) ON DELETE SET NULL;


--
-- TOC entry 3296 (class 2606 OID 1433747)
-- Name: devoluciones devoluciones_id_producto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.devoluciones
    ADD CONSTRAINT devoluciones_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto) ON DELETE SET NULL;


--
-- TOC entry 3294 (class 2606 OID 1433727)
-- Name: inventario inventario_id_producto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT inventario_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto) ON DELETE CASCADE;


--
-- TOC entry 3293 (class 2606 OID 1433714)
-- Name: pagos pagos_id_pedido_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT pagos_id_pedido_fkey FOREIGN KEY (id_pedido) REFERENCES public.pedidos(id_pedido) ON DELETE CASCADE;


--
-- TOC entry 3289 (class 2606 OID 1433679)
-- Name: pedidos pedidos_id_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.clientes(id_cliente) ON DELETE SET NULL;


--
-- TOC entry 3290 (class 2606 OID 1433684)
-- Name: pedidos pedidos_id_empleado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.pedidos
    ADD CONSTRAINT pedidos_id_empleado_fkey FOREIGN KEY (id_empleado) REFERENCES public.empleados(id_empleado) ON DELETE SET NULL;


--
-- TOC entry 3286 (class 2606 OID 1433642)
-- Name: productos productos_id_categoria_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_id_categoria_fkey FOREIGN KEY (id_categoria) REFERENCES public.categorias(id_categoria) ON DELETE SET NULL;


--
-- TOC entry 3287 (class 2606 OID 1433661)
-- Name: productos_proveedores productos_proveedores_id_producto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.productos_proveedores
    ADD CONSTRAINT productos_proveedores_id_producto_fkey FOREIGN KEY (id_producto) REFERENCES public.productos(id_producto) ON DELETE CASCADE;


--
-- TOC entry 3288 (class 2606 OID 1433666)
-- Name: productos_proveedores productos_proveedores_id_proveedor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: Comfe_owner
--

ALTER TABLE ONLY public.productos_proveedores
    ADD CONSTRAINT productos_proveedores_id_proveedor_fkey FOREIGN KEY (id_proveedor) REFERENCES public.proveedores(id_proveedor) ON DELETE CASCADE;


--
-- TOC entry 2103 (class 826 OID 966657)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO neon_superuser WITH GRANT OPTION;


--
-- TOC entry 2102 (class 826 OID 966656)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON TABLES TO neon_superuser WITH GRANT OPTION;


-- Completed on 2024-08-12 21:57:28

--
-- PostgreSQL database dump complete
--

