--
-- PostgreSQL database dump
--

\restrict tW49HtANdCsaxEHpf02YuXghCgKeg8C226TmVoMke8DGQSXHtWuPeSyI7YgsH9N

-- Dumped from database version 17.10 (98a80fa)
-- Dumped by pg_dump version 17.10

-- Started on 2026-06-12 22:43:08

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4108 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 236 (class 1259 OID 24609)
-- Name: archivos; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.archivos (
    id integer NOT NULL,
    ruta character varying(1000) NOT NULL,
    tipo character varying(100) NOT NULL,
    size integer NOT NULL,
    fecha timestamp with time zone,
    "tieneCopyright" boolean DEFAULT false NOT NULL,
    "rutaProtegida" character varying(1000),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "usuarioId" integer,
    "publicacionId" integer
);


ALTER TABLE public.archivos OWNER TO neondb_owner;

--
-- TOC entry 235 (class 1259 OID 24608)
-- Name: archivos_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.archivos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.archivos_id_seq OWNER TO neondb_owner;

--
-- TOC entry 4109 (class 0 OID 0)
-- Dependencies: 235
-- Name: archivos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.archivos_id_seq OWNED BY public.archivos.id;


--
-- TOC entry 259 (class 1259 OID 33059)
-- Name: coleccion_publicacion; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.coleccion_publicacion (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "coleccionId" integer,
    "publicacionId" integer
);


ALTER TABLE public.coleccion_publicacion OWNER TO neondb_owner;

--
-- TOC entry 245 (class 1259 OID 32889)
-- Name: colecciones; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.colecciones (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "usuarioId" integer
);


ALTER TABLE public.colecciones OWNER TO neondb_owner;

--
-- TOC entry 244 (class 1259 OID 32888)
-- Name: colecciones_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.colecciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.colecciones_id_seq OWNER TO neondb_owner;

--
-- TOC entry 4110 (class 0 OID 0)
-- Dependencies: 244
-- Name: colecciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.colecciones_id_seq OWNED BY public.colecciones.id;


--
-- TOC entry 247 (class 1259 OID 32920)
-- Name: comentarios; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.comentarios (
    id integer NOT NULL,
    contenido text NOT NULL,
    fecha timestamp with time zone,
    "estadoComentario" character varying(255) DEFAULT 'activo'::character varying NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "usuarioId" integer,
    "publicacionId" integer
);


ALTER TABLE public.comentarios OWNER TO neondb_owner;

--
-- TOC entry 246 (class 1259 OID 32919)
-- Name: comentarios_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.comentarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.comentarios_id_seq OWNER TO neondb_owner;

--
-- TOC entry 4111 (class 0 OID 0)
-- Dependencies: 246
-- Name: comentarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.comentarios_id_seq OWNED BY public.comentarios.id;


--
-- TOC entry 253 (class 1259 OID 32982)
-- Name: denuncias; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.denuncias (
    id integer NOT NULL,
    motivo character varying(255) NOT NULL,
    descripcion text NOT NULL,
    estado character varying(255) DEFAULT 'pendiente'::character varying NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "usuarioId" integer,
    "publicacionId" integer
);


ALTER TABLE public.denuncias OWNER TO neondb_owner;

--
-- TOC entry 249 (class 1259 OID 32948)
-- Name: denuncias_comentarios; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.denuncias_comentarios (
    id integer NOT NULL,
    motivo character varying(255) NOT NULL,
    descripcion text NOT NULL,
    estado character varying(255) DEFAULT 'pendiente'::character varying NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "usuarioId" integer,
    "comentarioId" integer
);


ALTER TABLE public.denuncias_comentarios OWNER TO neondb_owner;

--
-- TOC entry 248 (class 1259 OID 32947)
-- Name: denuncias_comentarios_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.denuncias_comentarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.denuncias_comentarios_id_seq OWNER TO neondb_owner;

--
-- TOC entry 4112 (class 0 OID 0)
-- Dependencies: 248
-- Name: denuncias_comentarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.denuncias_comentarios_id_seq OWNED BY public.denuncias_comentarios.id;


--
-- TOC entry 252 (class 1259 OID 32981)
-- Name: denuncias_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.denuncias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.denuncias_id_seq OWNER TO neondb_owner;

--
-- TOC entry 4113 (class 0 OID 0)
-- Dependencies: 252
-- Name: denuncias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.denuncias_id_seq OWNED BY public.denuncias.id;


--
-- TOC entry 251 (class 1259 OID 32970)
-- Name: etiquetas; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.etiquetas (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.etiquetas OWNER TO neondb_owner;

--
-- TOC entry 250 (class 1259 OID 32969)
-- Name: etiquetas_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.etiquetas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.etiquetas_id_seq OWNER TO neondb_owner;

--
-- TOC entry 4114 (class 0 OID 0)
-- Dependencies: 250
-- Name: etiquetas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.etiquetas_id_seq OWNED BY public.etiquetas.id;


--
-- TOC entry 241 (class 1259 OID 32817)
-- Name: intereses; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.intereses (
    id integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "publicacionId" integer,
    estado character varying(255) DEFAULT 'pendiente'::character varying NOT NULL,
    "usuarioInteresadoId" integer
);


ALTER TABLE public.intereses OWNER TO neondb_owner;

--
-- TOC entry 240 (class 1259 OID 32816)
-- Name: intereses_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.intereses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.intereses_id_seq OWNER TO neondb_owner;

--
-- TOC entry 4115 (class 0 OID 0)
-- Dependencies: 240
-- Name: intereses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.intereses_id_seq OWNED BY public.intereses.id;


--
-- TOC entry 255 (class 1259 OID 33004)
-- Name: likes; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.likes (
    id integer NOT NULL,
    "usuarioId" integer NOT NULL,
    "publicacionId" integer NOT NULL,
    fecha timestamp with time zone,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.likes OWNER TO neondb_owner;

--
-- TOC entry 254 (class 1259 OID 33003)
-- Name: likes_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.likes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.likes_id_seq OWNER TO neondb_owner;

--
-- TOC entry 4116 (class 0 OID 0)
-- Dependencies: 254
-- Name: likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.likes_id_seq OWNED BY public.likes.id;


--
-- TOC entry 243 (class 1259 OID 32836)
-- Name: mensajes; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.mensajes (
    id integer NOT NULL,
    contenido text NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "emisorId" integer,
    "receptorId" integer
);


ALTER TABLE public.mensajes OWNER TO neondb_owner;

--
-- TOC entry 242 (class 1259 OID 32835)
-- Name: mensajes_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.mensajes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mensajes_id_seq OWNER TO neondb_owner;

--
-- TOC entry 4117 (class 0 OID 0)
-- Dependencies: 242
-- Name: mensajes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.mensajes_id_seq OWNED BY public.mensajes.id;


--
-- TOC entry 239 (class 1259 OID 32788)
-- Name: notificaciones; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.notificaciones (
    id integer NOT NULL,
    mensaje character varying(255) NOT NULL,
    leida boolean DEFAULT false,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "usuarioId" integer
);


ALTER TABLE public.notificaciones OWNER TO neondb_owner;

--
-- TOC entry 238 (class 1259 OID 32787)
-- Name: notificaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.notificaciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notificaciones_id_seq OWNER TO neondb_owner;

--
-- TOC entry 4118 (class 0 OID 0)
-- Dependencies: 238
-- Name: notificaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.notificaciones_id_seq OWNED BY public.notificaciones.id;


--
-- TOC entry 234 (class 1259 OID 24592)
-- Name: publicaciones; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.publicaciones (
    id integer NOT NULL,
    descripcion text NOT NULL,
    ubicacion character varying(255) DEFAULT ''::character varying,
    fecha timestamp with time zone,
    comentarios_habilitados boolean DEFAULT true NOT NULL,
    "estadoPublicacion" character varying(255) DEFAULT 'activa'::character varying NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "usuarioId" integer
);


ALTER TABLE public.publicaciones OWNER TO neondb_owner;

--
-- TOC entry 233 (class 1259 OID 24591)
-- Name: publicaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.publicaciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.publicaciones_id_seq OWNER TO neondb_owner;

--
-- TOC entry 4119 (class 0 OID 0)
-- Dependencies: 233
-- Name: publicaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.publicaciones_id_seq OWNED BY public.publicaciones.id;


--
-- TOC entry 258 (class 1259 OID 33038)
-- Name: publicacionetiqueta; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.publicacionetiqueta (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "publicacionId" integer,
    "etiquetaId" integer
);


ALTER TABLE public.publicacionetiqueta OWNER TO neondb_owner;

--
-- TOC entry 237 (class 1259 OID 32769)
-- Name: seguidores; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.seguidores (
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "seguidorId" integer,
    "seguidoId" integer
);


ALTER TABLE public.seguidores OWNER TO neondb_owner;

--
-- TOC entry 232 (class 1259 OID 24577)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.usuarios (
    id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    dni integer NOT NULL,
    password character varying(255) NOT NULL,
    rol character varying(255) DEFAULT 'usuario'::character varying NOT NULL,
    estado character varying(255) DEFAULT 'activo'::character varying NOT NULL,
    fecha_registro timestamp with time zone,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.usuarios OWNER TO neondb_owner;

--
-- TOC entry 231 (class 1259 OID 24576)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_seq OWNER TO neondb_owner;

--
-- TOC entry 4120 (class 0 OID 0)
-- Dependencies: 231
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- TOC entry 257 (class 1259 OID 33016)
-- Name: valoraciones; Type: TABLE; Schema: public; Owner: neondb_owner
--

CREATE TABLE public.valoraciones (
    id integer NOT NULL,
    valor integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "usuarioId" integer,
    "archivoId" integer,
    CONSTRAINT valoraciones_valor_check CHECK (((valor >= 1) AND (valor <= 5)))
);


ALTER TABLE public.valoraciones OWNER TO neondb_owner;

--
-- TOC entry 256 (class 1259 OID 33015)
-- Name: valoraciones_id_seq; Type: SEQUENCE; Schema: public; Owner: neondb_owner
--

CREATE SEQUENCE public.valoraciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.valoraciones_id_seq OWNER TO neondb_owner;

--
-- TOC entry 4121 (class 0 OID 0)
-- Dependencies: 256
-- Name: valoraciones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: neondb_owner
--

ALTER SEQUENCE public.valoraciones_id_seq OWNED BY public.valoraciones.id;


--
-- TOC entry 3321 (class 2604 OID 24612)
-- Name: archivos id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.archivos ALTER COLUMN id SET DEFAULT nextval('public.archivos_id_seq'::regclass);


--
-- TOC entry 3328 (class 2604 OID 32892)
-- Name: colecciones id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.colecciones ALTER COLUMN id SET DEFAULT nextval('public.colecciones_id_seq'::regclass);


--
-- TOC entry 3329 (class 2604 OID 32923)
-- Name: comentarios id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.comentarios ALTER COLUMN id SET DEFAULT nextval('public.comentarios_id_seq'::regclass);


--
-- TOC entry 3334 (class 2604 OID 32985)
-- Name: denuncias id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.denuncias ALTER COLUMN id SET DEFAULT nextval('public.denuncias_id_seq'::regclass);


--
-- TOC entry 3331 (class 2604 OID 32951)
-- Name: denuncias_comentarios id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.denuncias_comentarios ALTER COLUMN id SET DEFAULT nextval('public.denuncias_comentarios_id_seq'::regclass);


--
-- TOC entry 3333 (class 2604 OID 32973)
-- Name: etiquetas id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas ALTER COLUMN id SET DEFAULT nextval('public.etiquetas_id_seq'::regclass);


--
-- TOC entry 3325 (class 2604 OID 32820)
-- Name: intereses id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.intereses ALTER COLUMN id SET DEFAULT nextval('public.intereses_id_seq'::regclass);


--
-- TOC entry 3336 (class 2604 OID 33007)
-- Name: likes id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.likes ALTER COLUMN id SET DEFAULT nextval('public.likes_id_seq'::regclass);


--
-- TOC entry 3327 (class 2604 OID 32839)
-- Name: mensajes id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.mensajes ALTER COLUMN id SET DEFAULT nextval('public.mensajes_id_seq'::regclass);


--
-- TOC entry 3323 (class 2604 OID 32791)
-- Name: notificaciones id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.notificaciones ALTER COLUMN id SET DEFAULT nextval('public.notificaciones_id_seq'::regclass);


--
-- TOC entry 3317 (class 2604 OID 24595)
-- Name: publicaciones id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.publicaciones ALTER COLUMN id SET DEFAULT nextval('public.publicaciones_id_seq'::regclass);


--
-- TOC entry 3314 (class 2604 OID 24580)
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- TOC entry 3337 (class 2604 OID 33019)
-- Name: valoraciones id; Type: DEFAULT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.valoraciones ALTER COLUMN id SET DEFAULT nextval('public.valoraciones_id_seq'::regclass);


--
-- TOC entry 4079 (class 0 OID 24609)
-- Dependencies: 236
-- Data for Name: archivos; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.archivos VALUES (1, 'https://res.cloudinary.com/danrxz5qk/image/upload/v1781293353/fotaza/qmanizbxansrpgvdyqwv.jpg', 'image/jpeg', 4427, '2026-06-12 19:42:33.424+00', false, NULL, '2026-06-12 19:42:33.425+00', '2026-06-12 19:42:33.425+00', 1, 2);


--
-- TOC entry 4102 (class 0 OID 33059)
-- Dependencies: 259
-- Data for Name: coleccion_publicacion; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--



--
-- TOC entry 4088 (class 0 OID 32889)
-- Dependencies: 245
-- Data for Name: colecciones; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--



--
-- TOC entry 4090 (class 0 OID 32920)
-- Dependencies: 247
-- Data for Name: comentarios; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--



--
-- TOC entry 4096 (class 0 OID 32982)
-- Dependencies: 253
-- Data for Name: denuncias; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.denuncias VALUES (1, 'otro', 'son muchos gatitos', 'pendiente', '2026-06-12 20:30:24.48+00', '2026-06-12 20:30:24.48+00', 1, 2);


--
-- TOC entry 4092 (class 0 OID 32948)
-- Dependencies: 249
-- Data for Name: denuncias_comentarios; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--



--
-- TOC entry 4094 (class 0 OID 32970)
-- Dependencies: 251
-- Data for Name: etiquetas; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.etiquetas VALUES (1, 'gatitos', '2026-06-12 19:42:34.051+00', '2026-06-12 19:42:34.051+00');
INSERT INTO public.etiquetas VALUES (2, 'flor', '2026-06-12 19:55:39.356+00', '2026-06-12 19:55:39.356+00');


--
-- TOC entry 4084 (class 0 OID 32817)
-- Dependencies: 241
-- Data for Name: intereses; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.intereses VALUES (1, '2026-06-12 20:27:01.872+00', '2026-06-12 20:27:01.872+00', 2, 'pendiente', 5);


--
-- TOC entry 4098 (class 0 OID 33004)
-- Dependencies: 255
-- Data for Name: likes; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.likes VALUES (1, 1, 2, '2026-06-12 20:00:12.09+00', '2026-06-12 20:00:12.093+00', '2026-06-12 20:00:12.093+00');
INSERT INTO public.likes VALUES (2, 5, 2, '2026-06-12 20:26:53.354+00', '2026-06-12 20:26:53.354+00', '2026-06-12 20:26:53.354+00');


--
-- TOC entry 4086 (class 0 OID 32836)
-- Dependencies: 243
-- Data for Name: mensajes; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.mensajes VALUES (1, 'que te intereso de la foto?', '2026-06-12 20:27:36.752+00', '2026-06-12 20:27:36.752+00', 1, 5);
INSERT INTO public.mensajes VALUES (2, 'los gatitos', '2026-06-12 20:28:14.319+00', '2026-06-12 20:28:14.319+00', 5, 1);


--
-- TOC entry 4082 (class 0 OID 32788)
-- Dependencies: 239
-- Data for Name: notificaciones; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--



--
-- TOC entry 4077 (class 0 OID 24592)
-- Dependencies: 234
-- Data for Name: publicaciones; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.publicaciones VALUES (1, 'perro en el jardin', '', '2026-06-12 19:31:12.992+00', true, 'activa', '2026-06-12 19:31:12.996+00', '2026-06-12 19:31:12.996+00', 1);
INSERT INTO public.publicaciones VALUES (2, 'animales', '', '2026-06-12 19:42:31.767+00', true, 'activa', '2026-06-12 19:42:31.771+00', '2026-06-12 19:43:15.761+00', 1);


--
-- TOC entry 4101 (class 0 OID 33038)
-- Dependencies: 258
-- Data for Name: publicacionetiqueta; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.publicacionetiqueta VALUES ('2026-06-12 19:42:34.794+00', '2026-06-12 19:42:34.794+00', 2, 1);


--
-- TOC entry 4080 (class 0 OID 32769)
-- Dependencies: 237
-- Data for Name: seguidores; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--



--
-- TOC entry 4075 (class 0 OID 24577)
-- Dependencies: 232
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.usuarios VALUES (3, 'sofia', 'sofia@gmail.com', 33897641, '$2b$10$7f30e955uNWRYoy44.3DNOgidIkVSr5EL0qdAg3PexMxO6bgYgczS', 'usuario', 'activo', '2026-06-12 13:52:02.488+00', '2026-06-12 13:52:02.491+00', '2026-06-12 13:52:02.491+00');
INSERT INTO public.usuarios VALUES (4, 'carla', 'carla@gmail.com', 4444, '$2b$10$9U/UCUjVRPxtI3tnG6AU0Oy23pdWrWJZdWID1GYPs8Zl6olhyg5/a', 'usuario', 'activo', '2026-06-12 20:10:37.761+00', '2026-06-12 20:10:37.762+00', '2026-06-12 20:10:37.762+00');
INSERT INTO public.usuarios VALUES (5, 'celeste', 'celeste@gmail.com', 12345678, '$2b$10$/ZkMdpsIlWdohziWCHxp3ukyghSuL8mJhIP7jUUlp7v5rzF8PZuP6', 'usuario', 'activo', '2026-06-12 20:25:46.818+00', '2026-06-12 20:25:46.818+00', '2026-06-12 20:25:46.818+00');
INSERT INTO public.usuarios VALUES (1, 'natalia', 'na@gmail.com', 333, '$2b$10$STP1lEbGlBcuwQ2WwW6ge.hP9..VmOkOLhcAnToeNE9fAeZmVWfKK', 'usuario', 'activo', '2026-06-12 12:55:12.826+00', '2026-06-12 12:55:12.827+00', '2026-06-12 22:52:48.765+00');


--
-- TOC entry 4100 (class 0 OID 33016)
-- Dependencies: 257
-- Data for Name: valoraciones; Type: TABLE DATA; Schema: public; Owner: neondb_owner
--

INSERT INTO public.valoraciones VALUES (1, 3, '2026-06-12 20:26:36.296+00', '2026-06-12 20:26:36.296+00', 5, 1);


--
-- TOC entry 4122 (class 0 OID 0)
-- Dependencies: 235
-- Name: archivos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.archivos_id_seq', 2, true);


--
-- TOC entry 4123 (class 0 OID 0)
-- Dependencies: 244
-- Name: colecciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.colecciones_id_seq', 1, false);


--
-- TOC entry 4124 (class 0 OID 0)
-- Dependencies: 246
-- Name: comentarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.comentarios_id_seq', 1, false);


--
-- TOC entry 4125 (class 0 OID 0)
-- Dependencies: 248
-- Name: denuncias_comentarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.denuncias_comentarios_id_seq', 1, false);


--
-- TOC entry 4126 (class 0 OID 0)
-- Dependencies: 252
-- Name: denuncias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.denuncias_id_seq', 1, true);


--
-- TOC entry 4127 (class 0 OID 0)
-- Dependencies: 250
-- Name: etiquetas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.etiquetas_id_seq', 2, true);


--
-- TOC entry 4128 (class 0 OID 0)
-- Dependencies: 240
-- Name: intereses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.intereses_id_seq', 1, true);


--
-- TOC entry 4129 (class 0 OID 0)
-- Dependencies: 254
-- Name: likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.likes_id_seq', 2, true);


--
-- TOC entry 4130 (class 0 OID 0)
-- Dependencies: 242
-- Name: mensajes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.mensajes_id_seq', 2, true);


--
-- TOC entry 4131 (class 0 OID 0)
-- Dependencies: 238
-- Name: notificaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.notificaciones_id_seq', 1, false);


--
-- TOC entry 4132 (class 0 OID 0)
-- Dependencies: 233
-- Name: publicaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.publicaciones_id_seq', 3, true);


--
-- TOC entry 4133 (class 0 OID 0)
-- Dependencies: 231
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 5, true);


--
-- TOC entry 4134 (class 0 OID 0)
-- Dependencies: 256
-- Name: valoraciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: neondb_owner
--

SELECT pg_catalog.setval('public.valoraciones_id_seq', 1, true);


--
-- TOC entry 3732 (class 2606 OID 24617)
-- Name: archivos archivos_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.archivos
    ADD CONSTRAINT archivos_pkey PRIMARY KEY (id);


--
-- TOC entry 3740 (class 2606 OID 32896)
-- Name: colecciones colecciones_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.colecciones
    ADD CONSTRAINT colecciones_pkey PRIMARY KEY (id);


--
-- TOC entry 3742 (class 2606 OID 32931)
-- Name: comentarios comentarios_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT comentarios_pkey PRIMARY KEY (id);


--
-- TOC entry 3744 (class 2606 OID 32958)
-- Name: denuncias_comentarios denuncias_comentarios_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.denuncias_comentarios
    ADD CONSTRAINT denuncias_comentarios_pkey PRIMARY KEY (id);


--
-- TOC entry 3894 (class 2606 OID 32992)
-- Name: denuncias denuncias_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.denuncias
    ADD CONSTRAINT denuncias_pkey PRIMARY KEY (id);


--
-- TOC entry 3746 (class 2606 OID 297412)
-- Name: etiquetas etiquetas_nombre_key; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key UNIQUE (nombre);


--
-- TOC entry 3748 (class 2606 OID 297414)
-- Name: etiquetas etiquetas_nombre_key1; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key1 UNIQUE (nombre);


--
-- TOC entry 3750 (class 2606 OID 297360)
-- Name: etiquetas etiquetas_nombre_key10; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key10 UNIQUE (nombre);


--
-- TOC entry 3752 (class 2606 OID 297358)
-- Name: etiquetas etiquetas_nombre_key11; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key11 UNIQUE (nombre);


--
-- TOC entry 3754 (class 2606 OID 297356)
-- Name: etiquetas etiquetas_nombre_key12; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key12 UNIQUE (nombre);


--
-- TOC entry 3756 (class 2606 OID 297376)
-- Name: etiquetas etiquetas_nombre_key13; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key13 UNIQUE (nombre);


--
-- TOC entry 3758 (class 2606 OID 297354)
-- Name: etiquetas etiquetas_nombre_key14; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key14 UNIQUE (nombre);


--
-- TOC entry 3760 (class 2606 OID 297410)
-- Name: etiquetas etiquetas_nombre_key15; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key15 UNIQUE (nombre);


--
-- TOC entry 3762 (class 2606 OID 297398)
-- Name: etiquetas etiquetas_nombre_key16; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key16 UNIQUE (nombre);


--
-- TOC entry 3764 (class 2606 OID 297382)
-- Name: etiquetas etiquetas_nombre_key17; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key17 UNIQUE (nombre);


--
-- TOC entry 3766 (class 2606 OID 297332)
-- Name: etiquetas etiquetas_nombre_key18; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key18 UNIQUE (nombre);


--
-- TOC entry 3768 (class 2606 OID 297396)
-- Name: etiquetas etiquetas_nombre_key19; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key19 UNIQUE (nombre);


--
-- TOC entry 3770 (class 2606 OID 297408)
-- Name: etiquetas etiquetas_nombre_key2; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key2 UNIQUE (nombre);


--
-- TOC entry 3772 (class 2606 OID 297394)
-- Name: etiquetas etiquetas_nombre_key20; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key20 UNIQUE (nombre);


--
-- TOC entry 3774 (class 2606 OID 297384)
-- Name: etiquetas etiquetas_nombre_key21; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key21 UNIQUE (nombre);


--
-- TOC entry 3776 (class 2606 OID 297392)
-- Name: etiquetas etiquetas_nombre_key22; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key22 UNIQUE (nombre);


--
-- TOC entry 3778 (class 2606 OID 297386)
-- Name: etiquetas etiquetas_nombre_key23; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key23 UNIQUE (nombre);


--
-- TOC entry 3780 (class 2606 OID 297390)
-- Name: etiquetas etiquetas_nombre_key24; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key24 UNIQUE (nombre);


--
-- TOC entry 3782 (class 2606 OID 297388)
-- Name: etiquetas etiquetas_nombre_key25; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key25 UNIQUE (nombre);


--
-- TOC entry 3784 (class 2606 OID 297380)
-- Name: etiquetas etiquetas_nombre_key26; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key26 UNIQUE (nombre);


--
-- TOC entry 3786 (class 2606 OID 297378)
-- Name: etiquetas etiquetas_nombre_key27; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key27 UNIQUE (nombre);


--
-- TOC entry 3788 (class 2606 OID 297406)
-- Name: etiquetas etiquetas_nombre_key28; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key28 UNIQUE (nombre);


--
-- TOC entry 3790 (class 2606 OID 297368)
-- Name: etiquetas etiquetas_nombre_key29; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key29 UNIQUE (nombre);


--
-- TOC entry 3792 (class 2606 OID 297416)
-- Name: etiquetas etiquetas_nombre_key3; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key3 UNIQUE (nombre);


--
-- TOC entry 3794 (class 2606 OID 297404)
-- Name: etiquetas etiquetas_nombre_key30; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key30 UNIQUE (nombre);


--
-- TOC entry 3796 (class 2606 OID 297418)
-- Name: etiquetas etiquetas_nombre_key31; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key31 UNIQUE (nombre);


--
-- TOC entry 3798 (class 2606 OID 297400)
-- Name: etiquetas etiquetas_nombre_key32; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key32 UNIQUE (nombre);


--
-- TOC entry 3800 (class 2606 OID 297352)
-- Name: etiquetas etiquetas_nombre_key33; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key33 UNIQUE (nombre);


--
-- TOC entry 3802 (class 2606 OID 297420)
-- Name: etiquetas etiquetas_nombre_key34; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key34 UNIQUE (nombre);


--
-- TOC entry 3804 (class 2606 OID 297350)
-- Name: etiquetas etiquetas_nombre_key35; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key35 UNIQUE (nombre);


--
-- TOC entry 3806 (class 2606 OID 297422)
-- Name: etiquetas etiquetas_nombre_key36; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key36 UNIQUE (nombre);


--
-- TOC entry 3808 (class 2606 OID 297348)
-- Name: etiquetas etiquetas_nombre_key37; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key37 UNIQUE (nombre);


--
-- TOC entry 3810 (class 2606 OID 297346)
-- Name: etiquetas etiquetas_nombre_key38; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key38 UNIQUE (nombre);


--
-- TOC entry 3812 (class 2606 OID 297424)
-- Name: etiquetas etiquetas_nombre_key39; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key39 UNIQUE (nombre);


--
-- TOC entry 3814 (class 2606 OID 297366)
-- Name: etiquetas etiquetas_nombre_key4; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key4 UNIQUE (nombre);


--
-- TOC entry 3816 (class 2606 OID 297344)
-- Name: etiquetas etiquetas_nombre_key40; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key40 UNIQUE (nombre);


--
-- TOC entry 3818 (class 2606 OID 297342)
-- Name: etiquetas etiquetas_nombre_key41; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key41 UNIQUE (nombre);


--
-- TOC entry 3820 (class 2606 OID 297426)
-- Name: etiquetas etiquetas_nombre_key42; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key42 UNIQUE (nombre);


--
-- TOC entry 3822 (class 2606 OID 297340)
-- Name: etiquetas etiquetas_nombre_key43; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key43 UNIQUE (nombre);


--
-- TOC entry 3824 (class 2606 OID 297428)
-- Name: etiquetas etiquetas_nombre_key44; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key44 UNIQUE (nombre);


--
-- TOC entry 3826 (class 2606 OID 297430)
-- Name: etiquetas etiquetas_nombre_key45; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key45 UNIQUE (nombre);


--
-- TOC entry 3828 (class 2606 OID 297338)
-- Name: etiquetas etiquetas_nombre_key46; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key46 UNIQUE (nombre);


--
-- TOC entry 3830 (class 2606 OID 297336)
-- Name: etiquetas etiquetas_nombre_key47; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key47 UNIQUE (nombre);


--
-- TOC entry 3832 (class 2606 OID 297432)
-- Name: etiquetas etiquetas_nombre_key48; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key48 UNIQUE (nombre);


--
-- TOC entry 3834 (class 2606 OID 297334)
-- Name: etiquetas etiquetas_nombre_key49; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key49 UNIQUE (nombre);


--
-- TOC entry 3836 (class 2606 OID 297370)
-- Name: etiquetas etiquetas_nombre_key5; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key5 UNIQUE (nombre);


--
-- TOC entry 3838 (class 2606 OID 297330)
-- Name: etiquetas etiquetas_nombre_key50; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key50 UNIQUE (nombre);


--
-- TOC entry 3840 (class 2606 OID 297328)
-- Name: etiquetas etiquetas_nombre_key51; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key51 UNIQUE (nombre);


--
-- TOC entry 3842 (class 2606 OID 297434)
-- Name: etiquetas etiquetas_nombre_key52; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key52 UNIQUE (nombre);


--
-- TOC entry 3844 (class 2606 OID 297326)
-- Name: etiquetas etiquetas_nombre_key53; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key53 UNIQUE (nombre);


--
-- TOC entry 3846 (class 2606 OID 297436)
-- Name: etiquetas etiquetas_nombre_key54; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key54 UNIQUE (nombre);


--
-- TOC entry 3848 (class 2606 OID 297438)
-- Name: etiquetas etiquetas_nombre_key55; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key55 UNIQUE (nombre);


--
-- TOC entry 3850 (class 2606 OID 297324)
-- Name: etiquetas etiquetas_nombre_key56; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key56 UNIQUE (nombre);


--
-- TOC entry 3852 (class 2606 OID 297440)
-- Name: etiquetas etiquetas_nombre_key57; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key57 UNIQUE (nombre);


--
-- TOC entry 3854 (class 2606 OID 297322)
-- Name: etiquetas etiquetas_nombre_key58; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key58 UNIQUE (nombre);


--
-- TOC entry 3856 (class 2606 OID 297442)
-- Name: etiquetas etiquetas_nombre_key59; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key59 UNIQUE (nombre);


--
-- TOC entry 3858 (class 2606 OID 297372)
-- Name: etiquetas etiquetas_nombre_key6; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key6 UNIQUE (nombre);


--
-- TOC entry 3860 (class 2606 OID 297320)
-- Name: etiquetas etiquetas_nombre_key60; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key60 UNIQUE (nombre);


--
-- TOC entry 3862 (class 2606 OID 297402)
-- Name: etiquetas etiquetas_nombre_key61; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key61 UNIQUE (nombre);


--
-- TOC entry 3864 (class 2606 OID 297318)
-- Name: etiquetas etiquetas_nombre_key62; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key62 UNIQUE (nombre);


--
-- TOC entry 3866 (class 2606 OID 297444)
-- Name: etiquetas etiquetas_nombre_key63; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key63 UNIQUE (nombre);


--
-- TOC entry 3868 (class 2606 OID 297316)
-- Name: etiquetas etiquetas_nombre_key64; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key64 UNIQUE (nombre);


--
-- TOC entry 3870 (class 2606 OID 297446)
-- Name: etiquetas etiquetas_nombre_key65; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key65 UNIQUE (nombre);


--
-- TOC entry 3872 (class 2606 OID 297314)
-- Name: etiquetas etiquetas_nombre_key66; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key66 UNIQUE (nombre);


--
-- TOC entry 3874 (class 2606 OID 297448)
-- Name: etiquetas etiquetas_nombre_key67; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key67 UNIQUE (nombre);


--
-- TOC entry 3876 (class 2606 OID 297312)
-- Name: etiquetas etiquetas_nombre_key68; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key68 UNIQUE (nombre);


--
-- TOC entry 3878 (class 2606 OID 297450)
-- Name: etiquetas etiquetas_nombre_key69; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key69 UNIQUE (nombre);


--
-- TOC entry 3880 (class 2606 OID 297364)
-- Name: etiquetas etiquetas_nombre_key7; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key7 UNIQUE (nombre);


--
-- TOC entry 3882 (class 2606 OID 297310)
-- Name: etiquetas etiquetas_nombre_key70; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key70 UNIQUE (nombre);


--
-- TOC entry 3884 (class 2606 OID 297452)
-- Name: etiquetas etiquetas_nombre_key71; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key71 UNIQUE (nombre);


--
-- TOC entry 3886 (class 2606 OID 297308)
-- Name: etiquetas etiquetas_nombre_key72; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key72 UNIQUE (nombre);


--
-- TOC entry 3888 (class 2606 OID 297362)
-- Name: etiquetas etiquetas_nombre_key8; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key8 UNIQUE (nombre);


--
-- TOC entry 3890 (class 2606 OID 297374)
-- Name: etiquetas etiquetas_nombre_key9; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_nombre_key9 UNIQUE (nombre);


--
-- TOC entry 3892 (class 2606 OID 32977)
-- Name: etiquetas etiquetas_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.etiquetas
    ADD CONSTRAINT etiquetas_pkey PRIMARY KEY (id);


--
-- TOC entry 3736 (class 2606 OID 32824)
-- Name: intereses intereses_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.intereses
    ADD CONSTRAINT intereses_pkey PRIMARY KEY (id);


--
-- TOC entry 3896 (class 2606 OID 33012)
-- Name: likes likes_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT likes_pkey PRIMARY KEY (id);


--
-- TOC entry 3898 (class 2606 OID 33014)
-- Name: likes likes_usuarioId_publicacionId_key; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "likes_usuarioId_publicacionId_key" UNIQUE ("usuarioId", "publicacionId");


--
-- TOC entry 3738 (class 2606 OID 32846)
-- Name: mensajes mensajes_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.mensajes
    ADD CONSTRAINT mensajes_pkey PRIMARY KEY (id);


--
-- TOC entry 3734 (class 2606 OID 32796)
-- Name: notificaciones notificaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.notificaciones
    ADD CONSTRAINT notificaciones_pkey PRIMARY KEY (id);


--
-- TOC entry 3730 (class 2606 OID 24602)
-- Name: publicaciones publicaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.publicaciones
    ADD CONSTRAINT publicaciones_pkey PRIMARY KEY (id);


--
-- TOC entry 3340 (class 2606 OID 297114)
-- Name: usuarios usuarios_dni_key; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key UNIQUE (dni);


--
-- TOC entry 3342 (class 2606 OID 297126)
-- Name: usuarios usuarios_dni_key1; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key1 UNIQUE (dni);


--
-- TOC entry 3344 (class 2606 OID 297174)
-- Name: usuarios usuarios_dni_key10; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key10 UNIQUE (dni);


--
-- TOC entry 3346 (class 2606 OID 297110)
-- Name: usuarios usuarios_dni_key11; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key11 UNIQUE (dni);


--
-- TOC entry 3348 (class 2606 OID 297108)
-- Name: usuarios usuarios_dni_key12; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key12 UNIQUE (dni);


--
-- TOC entry 3350 (class 2606 OID 297222)
-- Name: usuarios usuarios_dni_key13; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key13 UNIQUE (dni);


--
-- TOC entry 3352 (class 2606 OID 297224)
-- Name: usuarios usuarios_dni_key14; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key14 UNIQUE (dni);


--
-- TOC entry 3354 (class 2606 OID 297226)
-- Name: usuarios usuarios_dni_key15; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key15 UNIQUE (dni);


--
-- TOC entry 3356 (class 2606 OID 297106)
-- Name: usuarios usuarios_dni_key16; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key16 UNIQUE (dni);


--
-- TOC entry 3358 (class 2606 OID 297100)
-- Name: usuarios usuarios_dni_key17; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key17 UNIQUE (dni);


--
-- TOC entry 3360 (class 2606 OID 297102)
-- Name: usuarios usuarios_dni_key18; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key18 UNIQUE (dni);


--
-- TOC entry 3362 (class 2606 OID 297104)
-- Name: usuarios usuarios_dni_key19; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key19 UNIQUE (dni);


--
-- TOC entry 3364 (class 2606 OID 297128)
-- Name: usuarios usuarios_dni_key2; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key2 UNIQUE (dni);


--
-- TOC entry 3366 (class 2606 OID 297138)
-- Name: usuarios usuarios_dni_key20; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key20 UNIQUE (dni);


--
-- TOC entry 3368 (class 2606 OID 297132)
-- Name: usuarios usuarios_dni_key21; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key21 UNIQUE (dni);


--
-- TOC entry 3370 (class 2606 OID 297076)
-- Name: usuarios usuarios_dni_key22; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key22 UNIQUE (dni);


--
-- TOC entry 3372 (class 2606 OID 297134)
-- Name: usuarios usuarios_dni_key23; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key23 UNIQUE (dni);


--
-- TOC entry 3374 (class 2606 OID 297136)
-- Name: usuarios usuarios_dni_key24; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key24 UNIQUE (dni);


--
-- TOC entry 3376 (class 2606 OID 297124)
-- Name: usuarios usuarios_dni_key25; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key25 UNIQUE (dni);


--
-- TOC entry 3378 (class 2606 OID 297116)
-- Name: usuarios usuarios_dni_key26; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key26 UNIQUE (dni);


--
-- TOC entry 3380 (class 2606 OID 297122)
-- Name: usuarios usuarios_dni_key27; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key27 UNIQUE (dni);


--
-- TOC entry 3382 (class 2606 OID 297118)
-- Name: usuarios usuarios_dni_key28; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key28 UNIQUE (dni);


--
-- TOC entry 3384 (class 2606 OID 297120)
-- Name: usuarios usuarios_dni_key29; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key29 UNIQUE (dni);


--
-- TOC entry 3386 (class 2606 OID 297130)
-- Name: usuarios usuarios_dni_key3; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key3 UNIQUE (dni);


--
-- TOC entry 3388 (class 2606 OID 297220)
-- Name: usuarios usuarios_dni_key30; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key30 UNIQUE (dni);


--
-- TOC entry 3390 (class 2606 OID 297176)
-- Name: usuarios usuarios_dni_key31; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key31 UNIQUE (dni);


--
-- TOC entry 3392 (class 2606 OID 297218)
-- Name: usuarios usuarios_dni_key32; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key32 UNIQUE (dni);


--
-- TOC entry 3394 (class 2606 OID 297178)
-- Name: usuarios usuarios_dni_key33; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key33 UNIQUE (dni);


--
-- TOC entry 3396 (class 2606 OID 297216)
-- Name: usuarios usuarios_dni_key34; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key34 UNIQUE (dni);


--
-- TOC entry 3398 (class 2606 OID 297180)
-- Name: usuarios usuarios_dni_key35; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key35 UNIQUE (dni);


--
-- TOC entry 3400 (class 2606 OID 297214)
-- Name: usuarios usuarios_dni_key36; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key36 UNIQUE (dni);


--
-- TOC entry 3402 (class 2606 OID 297182)
-- Name: usuarios usuarios_dni_key37; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key37 UNIQUE (dni);


--
-- TOC entry 3404 (class 2606 OID 297212)
-- Name: usuarios usuarios_dni_key38; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key38 UNIQUE (dni);


--
-- TOC entry 3406 (class 2606 OID 297184)
-- Name: usuarios usuarios_dni_key39; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key39 UNIQUE (dni);


--
-- TOC entry 3408 (class 2606 OID 297140)
-- Name: usuarios usuarios_dni_key4; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key4 UNIQUE (dni);


--
-- TOC entry 3410 (class 2606 OID 297210)
-- Name: usuarios usuarios_dni_key40; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key40 UNIQUE (dni);


--
-- TOC entry 3412 (class 2606 OID 297186)
-- Name: usuarios usuarios_dni_key41; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key41 UNIQUE (dni);


--
-- TOC entry 3414 (class 2606 OID 297208)
-- Name: usuarios usuarios_dni_key42; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key42 UNIQUE (dni);


--
-- TOC entry 3416 (class 2606 OID 297188)
-- Name: usuarios usuarios_dni_key43; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key43 UNIQUE (dni);


--
-- TOC entry 3418 (class 2606 OID 297206)
-- Name: usuarios usuarios_dni_key44; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key44 UNIQUE (dni);


--
-- TOC entry 3420 (class 2606 OID 297190)
-- Name: usuarios usuarios_dni_key45; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key45 UNIQUE (dni);


--
-- TOC entry 3422 (class 2606 OID 297204)
-- Name: usuarios usuarios_dni_key46; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key46 UNIQUE (dni);


--
-- TOC entry 3424 (class 2606 OID 297192)
-- Name: usuarios usuarios_dni_key47; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key47 UNIQUE (dni);


--
-- TOC entry 3426 (class 2606 OID 297202)
-- Name: usuarios usuarios_dni_key48; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key48 UNIQUE (dni);


--
-- TOC entry 3428 (class 2606 OID 297194)
-- Name: usuarios usuarios_dni_key49; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key49 UNIQUE (dni);


--
-- TOC entry 3430 (class 2606 OID 297164)
-- Name: usuarios usuarios_dni_key5; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key5 UNIQUE (dni);


--
-- TOC entry 3432 (class 2606 OID 297200)
-- Name: usuarios usuarios_dni_key50; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key50 UNIQUE (dni);


--
-- TOC entry 3434 (class 2606 OID 297196)
-- Name: usuarios usuarios_dni_key51; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key51 UNIQUE (dni);


--
-- TOC entry 3436 (class 2606 OID 297198)
-- Name: usuarios usuarios_dni_key52; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key52 UNIQUE (dni);


--
-- TOC entry 3438 (class 2606 OID 297162)
-- Name: usuarios usuarios_dni_key53; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key53 UNIQUE (dni);


--
-- TOC entry 3440 (class 2606 OID 297144)
-- Name: usuarios usuarios_dni_key54; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key54 UNIQUE (dni);


--
-- TOC entry 3442 (class 2606 OID 297160)
-- Name: usuarios usuarios_dni_key55; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key55 UNIQUE (dni);


--
-- TOC entry 3444 (class 2606 OID 297142)
-- Name: usuarios usuarios_dni_key56; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key56 UNIQUE (dni);


--
-- TOC entry 3446 (class 2606 OID 297146)
-- Name: usuarios usuarios_dni_key57; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key57 UNIQUE (dni);


--
-- TOC entry 3448 (class 2606 OID 297158)
-- Name: usuarios usuarios_dni_key58; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key58 UNIQUE (dni);


--
-- TOC entry 3450 (class 2606 OID 297148)
-- Name: usuarios usuarios_dni_key59; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key59 UNIQUE (dni);


--
-- TOC entry 3452 (class 2606 OID 297166)
-- Name: usuarios usuarios_dni_key6; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key6 UNIQUE (dni);


--
-- TOC entry 3454 (class 2606 OID 297156)
-- Name: usuarios usuarios_dni_key60; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key60 UNIQUE (dni);


--
-- TOC entry 3456 (class 2606 OID 297150)
-- Name: usuarios usuarios_dni_key61; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key61 UNIQUE (dni);


--
-- TOC entry 3458 (class 2606 OID 297154)
-- Name: usuarios usuarios_dni_key62; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key62 UNIQUE (dni);


--
-- TOC entry 3460 (class 2606 OID 297152)
-- Name: usuarios usuarios_dni_key63; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key63 UNIQUE (dni);


--
-- TOC entry 3462 (class 2606 OID 297098)
-- Name: usuarios usuarios_dni_key64; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key64 UNIQUE (dni);


--
-- TOC entry 3464 (class 2606 OID 297084)
-- Name: usuarios usuarios_dni_key65; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key65 UNIQUE (dni);


--
-- TOC entry 3466 (class 2606 OID 297086)
-- Name: usuarios usuarios_dni_key66; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key66 UNIQUE (dni);


--
-- TOC entry 3468 (class 2606 OID 297096)
-- Name: usuarios usuarios_dni_key67; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key67 UNIQUE (dni);


--
-- TOC entry 3470 (class 2606 OID 297088)
-- Name: usuarios usuarios_dni_key68; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key68 UNIQUE (dni);


--
-- TOC entry 3472 (class 2606 OID 297094)
-- Name: usuarios usuarios_dni_key69; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key69 UNIQUE (dni);


--
-- TOC entry 3474 (class 2606 OID 297168)
-- Name: usuarios usuarios_dni_key7; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key7 UNIQUE (dni);


--
-- TOC entry 3476 (class 2606 OID 297092)
-- Name: usuarios usuarios_dni_key70; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key70 UNIQUE (dni);


--
-- TOC entry 3478 (class 2606 OID 297090)
-- Name: usuarios usuarios_dni_key71; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key71 UNIQUE (dni);


--
-- TOC entry 3480 (class 2606 OID 297082)
-- Name: usuarios usuarios_dni_key72; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key72 UNIQUE (dni);


--
-- TOC entry 3482 (class 2606 OID 297170)
-- Name: usuarios usuarios_dni_key73; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key73 UNIQUE (dni);


--
-- TOC entry 3484 (class 2606 OID 297080)
-- Name: usuarios usuarios_dni_key74; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key74 UNIQUE (dni);


--
-- TOC entry 3486 (class 2606 OID 297078)
-- Name: usuarios usuarios_dni_key75; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key75 UNIQUE (dni);


--
-- TOC entry 3488 (class 2606 OID 297228)
-- Name: usuarios usuarios_dni_key76; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key76 UNIQUE (dni);


--
-- TOC entry 3490 (class 2606 OID 297074)
-- Name: usuarios usuarios_dni_key77; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key77 UNIQUE (dni);


--
-- TOC entry 3492 (class 2606 OID 297230)
-- Name: usuarios usuarios_dni_key78; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key78 UNIQUE (dni);


--
-- TOC entry 3494 (class 2606 OID 297072)
-- Name: usuarios usuarios_dni_key79; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key79 UNIQUE (dni);


--
-- TOC entry 3496 (class 2606 OID 297112)
-- Name: usuarios usuarios_dni_key8; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key8 UNIQUE (dni);


--
-- TOC entry 3498 (class 2606 OID 297232)
-- Name: usuarios usuarios_dni_key80; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key80 UNIQUE (dni);


--
-- TOC entry 3500 (class 2606 OID 297070)
-- Name: usuarios usuarios_dni_key81; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key81 UNIQUE (dni);


--
-- TOC entry 3502 (class 2606 OID 297234)
-- Name: usuarios usuarios_dni_key82; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key82 UNIQUE (dni);


--
-- TOC entry 3504 (class 2606 OID 297068)
-- Name: usuarios usuarios_dni_key83; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key83 UNIQUE (dni);


--
-- TOC entry 3506 (class 2606 OID 297236)
-- Name: usuarios usuarios_dni_key84; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key84 UNIQUE (dni);


--
-- TOC entry 3508 (class 2606 OID 297066)
-- Name: usuarios usuarios_dni_key85; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key85 UNIQUE (dni);


--
-- TOC entry 3510 (class 2606 OID 297238)
-- Name: usuarios usuarios_dni_key86; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key86 UNIQUE (dni);


--
-- TOC entry 3512 (class 2606 OID 297064)
-- Name: usuarios usuarios_dni_key87; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key87 UNIQUE (dni);


--
-- TOC entry 3514 (class 2606 OID 297240)
-- Name: usuarios usuarios_dni_key88; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key88 UNIQUE (dni);


--
-- TOC entry 3516 (class 2606 OID 297062)
-- Name: usuarios usuarios_dni_key89; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key89 UNIQUE (dni);


--
-- TOC entry 3518 (class 2606 OID 297172)
-- Name: usuarios usuarios_dni_key9; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key9 UNIQUE (dni);


--
-- TOC entry 3520 (class 2606 OID 297242)
-- Name: usuarios usuarios_dni_key90; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key90 UNIQUE (dni);


--
-- TOC entry 3522 (class 2606 OID 297060)
-- Name: usuarios usuarios_dni_key91; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key91 UNIQUE (dni);


--
-- TOC entry 3524 (class 2606 OID 297244)
-- Name: usuarios usuarios_dni_key92; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key92 UNIQUE (dni);


--
-- TOC entry 3526 (class 2606 OID 297058)
-- Name: usuarios usuarios_dni_key93; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_dni_key93 UNIQUE (dni);


--
-- TOC entry 3528 (class 2606 OID 296912)
-- Name: usuarios usuarios_email_key; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);


--
-- TOC entry 3530 (class 2606 OID 296914)
-- Name: usuarios usuarios_email_key1; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key1 UNIQUE (email);


--
-- TOC entry 3532 (class 2606 OID 296930)
-- Name: usuarios usuarios_email_key10; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key10 UNIQUE (email);


--
-- TOC entry 3534 (class 2606 OID 296932)
-- Name: usuarios usuarios_email_key11; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key11 UNIQUE (email);


--
-- TOC entry 3536 (class 2606 OID 296908)
-- Name: usuarios usuarios_email_key12; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key12 UNIQUE (email);


--
-- TOC entry 3538 (class 2606 OID 296906)
-- Name: usuarios usuarios_email_key13; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key13 UNIQUE (email);


--
-- TOC entry 3540 (class 2606 OID 296934)
-- Name: usuarios usuarios_email_key14; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key14 UNIQUE (email);


--
-- TOC entry 3542 (class 2606 OID 296936)
-- Name: usuarios usuarios_email_key15; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key15 UNIQUE (email);


--
-- TOC entry 3544 (class 2606 OID 297020)
-- Name: usuarios usuarios_email_key16; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key16 UNIQUE (email);


--
-- TOC entry 3546 (class 2606 OID 296904)
-- Name: usuarios usuarios_email_key17; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key17 UNIQUE (email);


--
-- TOC entry 3548 (class 2606 OID 297022)
-- Name: usuarios usuarios_email_key18; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key18 UNIQUE (email);


--
-- TOC entry 3550 (class 2606 OID 297024)
-- Name: usuarios usuarios_email_key19; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key19 UNIQUE (email);


--
-- TOC entry 3552 (class 2606 OID 296916)
-- Name: usuarios usuarios_email_key2; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key2 UNIQUE (email);


--
-- TOC entry 3554 (class 2606 OID 296902)
-- Name: usuarios usuarios_email_key20; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key20 UNIQUE (email);


--
-- TOC entry 3556 (class 2606 OID 296900)
-- Name: usuarios usuarios_email_key21; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key21 UNIQUE (email);


--
-- TOC entry 3558 (class 2606 OID 297026)
-- Name: usuarios usuarios_email_key22; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key22 UNIQUE (email);


--
-- TOC entry 3560 (class 2606 OID 297028)
-- Name: usuarios usuarios_email_key23; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key23 UNIQUE (email);


--
-- TOC entry 3562 (class 2606 OID 297030)
-- Name: usuarios usuarios_email_key24; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key24 UNIQUE (email);


--
-- TOC entry 3564 (class 2606 OID 296898)
-- Name: usuarios usuarios_email_key25; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key25 UNIQUE (email);


--
-- TOC entry 3566 (class 2606 OID 297032)
-- Name: usuarios usuarios_email_key26; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key26 UNIQUE (email);


--
-- TOC entry 3568 (class 2606 OID 296896)
-- Name: usuarios usuarios_email_key27; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key27 UNIQUE (email);


--
-- TOC entry 3570 (class 2606 OID 297034)
-- Name: usuarios usuarios_email_key28; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key28 UNIQUE (email);


--
-- TOC entry 3572 (class 2606 OID 296894)
-- Name: usuarios usuarios_email_key29; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key29 UNIQUE (email);


--
-- TOC entry 3574 (class 2606 OID 296918)
-- Name: usuarios usuarios_email_key3; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key3 UNIQUE (email);


--
-- TOC entry 3576 (class 2606 OID 297036)
-- Name: usuarios usuarios_email_key30; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key30 UNIQUE (email);


--
-- TOC entry 3578 (class 2606 OID 296892)
-- Name: usuarios usuarios_email_key31; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key31 UNIQUE (email);


--
-- TOC entry 3580 (class 2606 OID 296890)
-- Name: usuarios usuarios_email_key32; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key32 UNIQUE (email);


--
-- TOC entry 3582 (class 2606 OID 297038)
-- Name: usuarios usuarios_email_key33; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key33 UNIQUE (email);


--
-- TOC entry 3584 (class 2606 OID 297040)
-- Name: usuarios usuarios_email_key34; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key34 UNIQUE (email);


--
-- TOC entry 3586 (class 2606 OID 297052)
-- Name: usuarios usuarios_email_key35; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key35 UNIQUE (email);


--
-- TOC entry 3588 (class 2606 OID 297042)
-- Name: usuarios usuarios_email_key36; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key36 UNIQUE (email);


--
-- TOC entry 3590 (class 2606 OID 297050)
-- Name: usuarios usuarios_email_key37; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key37 UNIQUE (email);


--
-- TOC entry 3592 (class 2606 OID 297044)
-- Name: usuarios usuarios_email_key38; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key38 UNIQUE (email);


--
-- TOC entry 3594 (class 2606 OID 297048)
-- Name: usuarios usuarios_email_key39; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key39 UNIQUE (email);


--
-- TOC entry 3596 (class 2606 OID 296920)
-- Name: usuarios usuarios_email_key4; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key4 UNIQUE (email);


--
-- TOC entry 3598 (class 2606 OID 297046)
-- Name: usuarios usuarios_email_key40; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key40 UNIQUE (email);


--
-- TOC entry 3600 (class 2606 OID 297016)
-- Name: usuarios usuarios_email_key41; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key41 UNIQUE (email);


--
-- TOC entry 3602 (class 2606 OID 296938)
-- Name: usuarios usuarios_email_key42; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key42 UNIQUE (email);


--
-- TOC entry 3604 (class 2606 OID 297014)
-- Name: usuarios usuarios_email_key43; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key43 UNIQUE (email);


--
-- TOC entry 3606 (class 2606 OID 296940)
-- Name: usuarios usuarios_email_key44; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key44 UNIQUE (email);


--
-- TOC entry 3608 (class 2606 OID 297012)
-- Name: usuarios usuarios_email_key45; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key45 UNIQUE (email);


--
-- TOC entry 3610 (class 2606 OID 296942)
-- Name: usuarios usuarios_email_key46; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key46 UNIQUE (email);


--
-- TOC entry 3612 (class 2606 OID 297010)
-- Name: usuarios usuarios_email_key47; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key47 UNIQUE (email);


--
-- TOC entry 3614 (class 2606 OID 296944)
-- Name: usuarios usuarios_email_key48; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key48 UNIQUE (email);


--
-- TOC entry 3616 (class 2606 OID 297008)
-- Name: usuarios usuarios_email_key49; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key49 UNIQUE (email);


--
-- TOC entry 3618 (class 2606 OID 296922)
-- Name: usuarios usuarios_email_key5; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key5 UNIQUE (email);


--
-- TOC entry 3620 (class 2606 OID 296946)
-- Name: usuarios usuarios_email_key50; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key50 UNIQUE (email);


--
-- TOC entry 3622 (class 2606 OID 297006)
-- Name: usuarios usuarios_email_key51; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key51 UNIQUE (email);


--
-- TOC entry 3624 (class 2606 OID 296948)
-- Name: usuarios usuarios_email_key52; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key52 UNIQUE (email);


--
-- TOC entry 3626 (class 2606 OID 297004)
-- Name: usuarios usuarios_email_key53; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key53 UNIQUE (email);


--
-- TOC entry 3628 (class 2606 OID 296950)
-- Name: usuarios usuarios_email_key54; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key54 UNIQUE (email);


--
-- TOC entry 3630 (class 2606 OID 297002)
-- Name: usuarios usuarios_email_key55; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key55 UNIQUE (email);


--
-- TOC entry 3632 (class 2606 OID 297000)
-- Name: usuarios usuarios_email_key56; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key56 UNIQUE (email);


--
-- TOC entry 3634 (class 2606 OID 296954)
-- Name: usuarios usuarios_email_key57; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key57 UNIQUE (email);


--
-- TOC entry 3636 (class 2606 OID 296998)
-- Name: usuarios usuarios_email_key58; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key58 UNIQUE (email);


--
-- TOC entry 3638 (class 2606 OID 296956)
-- Name: usuarios usuarios_email_key59; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key59 UNIQUE (email);


--
-- TOC entry 3640 (class 2606 OID 296924)
-- Name: usuarios usuarios_email_key6; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key6 UNIQUE (email);


--
-- TOC entry 3642 (class 2606 OID 296996)
-- Name: usuarios usuarios_email_key60; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key60 UNIQUE (email);


--
-- TOC entry 3644 (class 2606 OID 296958)
-- Name: usuarios usuarios_email_key61; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key61 UNIQUE (email);


--
-- TOC entry 3646 (class 2606 OID 296994)
-- Name: usuarios usuarios_email_key62; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key62 UNIQUE (email);


--
-- TOC entry 3648 (class 2606 OID 296960)
-- Name: usuarios usuarios_email_key63; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key63 UNIQUE (email);


--
-- TOC entry 3650 (class 2606 OID 296962)
-- Name: usuarios usuarios_email_key64; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key64 UNIQUE (email);


--
-- TOC entry 3652 (class 2606 OID 296992)
-- Name: usuarios usuarios_email_key65; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key65 UNIQUE (email);


--
-- TOC entry 3654 (class 2606 OID 296964)
-- Name: usuarios usuarios_email_key66; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key66 UNIQUE (email);


--
-- TOC entry 3656 (class 2606 OID 296990)
-- Name: usuarios usuarios_email_key67; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key67 UNIQUE (email);


--
-- TOC entry 3658 (class 2606 OID 296966)
-- Name: usuarios usuarios_email_key68; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key68 UNIQUE (email);


--
-- TOC entry 3660 (class 2606 OID 296988)
-- Name: usuarios usuarios_email_key69; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key69 UNIQUE (email);


--
-- TOC entry 3662 (class 2606 OID 296926)
-- Name: usuarios usuarios_email_key7; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key7 UNIQUE (email);


--
-- TOC entry 3664 (class 2606 OID 296968)
-- Name: usuarios usuarios_email_key70; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key70 UNIQUE (email);


--
-- TOC entry 3666 (class 2606 OID 296986)
-- Name: usuarios usuarios_email_key71; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key71 UNIQUE (email);


--
-- TOC entry 3668 (class 2606 OID 296970)
-- Name: usuarios usuarios_email_key72; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key72 UNIQUE (email);


--
-- TOC entry 3670 (class 2606 OID 296984)
-- Name: usuarios usuarios_email_key73; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key73 UNIQUE (email);


--
-- TOC entry 3672 (class 2606 OID 296972)
-- Name: usuarios usuarios_email_key74; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key74 UNIQUE (email);


--
-- TOC entry 3674 (class 2606 OID 296982)
-- Name: usuarios usuarios_email_key75; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key75 UNIQUE (email);


--
-- TOC entry 3676 (class 2606 OID 296980)
-- Name: usuarios usuarios_email_key76; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key76 UNIQUE (email);


--
-- TOC entry 3678 (class 2606 OID 296974)
-- Name: usuarios usuarios_email_key77; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key77 UNIQUE (email);


--
-- TOC entry 3680 (class 2606 OID 296978)
-- Name: usuarios usuarios_email_key78; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key78 UNIQUE (email);


--
-- TOC entry 3682 (class 2606 OID 296976)
-- Name: usuarios usuarios_email_key79; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key79 UNIQUE (email);


--
-- TOC entry 3684 (class 2606 OID 296910)
-- Name: usuarios usuarios_email_key8; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key8 UNIQUE (email);


--
-- TOC entry 3686 (class 2606 OID 296888)
-- Name: usuarios usuarios_email_key80; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key80 UNIQUE (email);


--
-- TOC entry 3688 (class 2606 OID 296952)
-- Name: usuarios usuarios_email_key81; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key81 UNIQUE (email);


--
-- TOC entry 3690 (class 2606 OID 297054)
-- Name: usuarios usuarios_email_key82; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key82 UNIQUE (email);


--
-- TOC entry 3692 (class 2606 OID 296886)
-- Name: usuarios usuarios_email_key83; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key83 UNIQUE (email);


--
-- TOC entry 3694 (class 2606 OID 296884)
-- Name: usuarios usuarios_email_key84; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key84 UNIQUE (email);


--
-- TOC entry 3696 (class 2606 OID 296882)
-- Name: usuarios usuarios_email_key85; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key85 UNIQUE (email);


--
-- TOC entry 3698 (class 2606 OID 296880)
-- Name: usuarios usuarios_email_key86; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key86 UNIQUE (email);


--
-- TOC entry 3700 (class 2606 OID 296878)
-- Name: usuarios usuarios_email_key87; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key87 UNIQUE (email);


--
-- TOC entry 3702 (class 2606 OID 296876)
-- Name: usuarios usuarios_email_key88; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key88 UNIQUE (email);


--
-- TOC entry 3704 (class 2606 OID 296874)
-- Name: usuarios usuarios_email_key89; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key89 UNIQUE (email);


--
-- TOC entry 3706 (class 2606 OID 296928)
-- Name: usuarios usuarios_email_key9; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key9 UNIQUE (email);


--
-- TOC entry 3708 (class 2606 OID 297018)
-- Name: usuarios usuarios_email_key90; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key90 UNIQUE (email);


--
-- TOC entry 3710 (class 2606 OID 296872)
-- Name: usuarios usuarios_email_key91; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key91 UNIQUE (email);


--
-- TOC entry 3712 (class 2606 OID 296870)
-- Name: usuarios usuarios_email_key92; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key92 UNIQUE (email);


--
-- TOC entry 3714 (class 2606 OID 296868)
-- Name: usuarios usuarios_email_key93; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key93 UNIQUE (email);


--
-- TOC entry 3716 (class 2606 OID 296864)
-- Name: usuarios usuarios_email_key94; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key94 UNIQUE (email);


--
-- TOC entry 3718 (class 2606 OID 296862)
-- Name: usuarios usuarios_email_key95; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key95 UNIQUE (email);


--
-- TOC entry 3720 (class 2606 OID 296860)
-- Name: usuarios usuarios_email_key96; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key96 UNIQUE (email);


--
-- TOC entry 3722 (class 2606 OID 296858)
-- Name: usuarios usuarios_email_key97; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key97 UNIQUE (email);


--
-- TOC entry 3724 (class 2606 OID 296856)
-- Name: usuarios usuarios_email_key98; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key98 UNIQUE (email);


--
-- TOC entry 3726 (class 2606 OID 296866)
-- Name: usuarios usuarios_email_key99; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key99 UNIQUE (email);


--
-- TOC entry 3728 (class 2606 OID 24586)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 3900 (class 2606 OID 33024)
-- Name: valoraciones valoraciones_pkey; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.valoraciones
    ADD CONSTRAINT valoraciones_pkey PRIMARY KEY (id);


--
-- TOC entry 3902 (class 2606 OID 33026)
-- Name: valoraciones valoraciones_usuarioId_archivoId_key; Type: CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.valoraciones
    ADD CONSTRAINT "valoraciones_usuarioId_archivoId_key" UNIQUE ("usuarioId", "archivoId");


--
-- TOC entry 3903 (class 1259 OID 73824)
-- Name: valoraciones_usuario_id_archivo_id; Type: INDEX; Schema: public; Owner: neondb_owner
--

CREATE UNIQUE INDEX valoraciones_usuario_id_archivo_id ON public.valoraciones USING btree ("usuarioId", "archivoId");


--
-- TOC entry 3905 (class 2606 OID 297267)
-- Name: archivos archivos_publicacionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.archivos
    ADD CONSTRAINT "archivos_publicacionId_fkey" FOREIGN KEY ("publicacionId") REFERENCES public.publicaciones(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3906 (class 2606 OID 297262)
-- Name: archivos archivos_usuarioId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.archivos
    ADD CONSTRAINT "archivos_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3927 (class 2606 OID 73891)
-- Name: coleccion_publicacion coleccion_publicacion_coleccionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.coleccion_publicacion
    ADD CONSTRAINT "coleccion_publicacion_coleccionId_fkey" FOREIGN KEY ("coleccionId") REFERENCES public.colecciones(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3928 (class 2606 OID 73896)
-- Name: coleccion_publicacion coleccion_publicacion_publicacionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.coleccion_publicacion
    ADD CONSTRAINT "coleccion_publicacion_publicacionId_fkey" FOREIGN KEY ("publicacionId") REFERENCES public.publicaciones(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3914 (class 2606 OID 297453)
-- Name: colecciones colecciones_usuarioId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.colecciones
    ADD CONSTRAINT "colecciones_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3915 (class 2606 OID 297289)
-- Name: comentarios comentarios_publicacionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT "comentarios_publicacionId_fkey" FOREIGN KEY ("publicacionId") REFERENCES public.publicaciones(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3916 (class 2606 OID 297284)
-- Name: comentarios comentarios_usuarioId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.comentarios
    ADD CONSTRAINT "comentarios_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3917 (class 2606 OID 297484)
-- Name: denuncias_comentarios denuncias_comentarios_comentarioId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.denuncias_comentarios
    ADD CONSTRAINT "denuncias_comentarios_comentarioId_fkey" FOREIGN KEY ("comentarioId") REFERENCES public.comentarios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3918 (class 2606 OID 297479)
-- Name: denuncias_comentarios denuncias_comentarios_usuarioId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.denuncias_comentarios
    ADD CONSTRAINT "denuncias_comentarios_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3919 (class 2606 OID 297472)
-- Name: denuncias denuncias_publicacionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.denuncias
    ADD CONSTRAINT "denuncias_publicacionId_fkey" FOREIGN KEY ("publicacionId") REFERENCES public.publicaciones(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3920 (class 2606 OID 297467)
-- Name: denuncias denuncias_usuarioId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.denuncias
    ADD CONSTRAINT "denuncias_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3910 (class 2606 OID 297489)
-- Name: intereses intereses_publicacionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.intereses
    ADD CONSTRAINT "intereses_publicacionId_fkey" FOREIGN KEY ("publicacionId") REFERENCES public.publicaciones(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3911 (class 2606 OID 297496)
-- Name: intereses intereses_usuarioInteresadoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.intereses
    ADD CONSTRAINT "intereses_usuarioInteresadoId_fkey" FOREIGN KEY ("usuarioInteresadoId") REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3921 (class 2606 OID 297277)
-- Name: likes likes_publicacionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "likes_publicacionId_fkey" FOREIGN KEY ("publicacionId") REFERENCES public.publicaciones(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3922 (class 2606 OID 297272)
-- Name: likes likes_usuarioId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.likes
    ADD CONSTRAINT "likes_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3912 (class 2606 OID 297501)
-- Name: mensajes mensajes_emisorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.mensajes
    ADD CONSTRAINT "mensajes_emisorId_fkey" FOREIGN KEY ("emisorId") REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3913 (class 2606 OID 297506)
-- Name: mensajes mensajes_receptorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.mensajes
    ADD CONSTRAINT "mensajes_receptorId_fkey" FOREIGN KEY ("receptorId") REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3909 (class 2606 OID 297460)
-- Name: notificaciones notificaciones_usuarioId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.notificaciones
    ADD CONSTRAINT "notificaciones_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3904 (class 2606 OID 297255)
-- Name: publicaciones publicaciones_usuarioId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.publicaciones
    ADD CONSTRAINT "publicaciones_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3925 (class 2606 OID 73843)
-- Name: publicacionetiqueta publicacionetiqueta_etiquetaId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.publicacionetiqueta
    ADD CONSTRAINT "publicacionetiqueta_etiquetaId_fkey" FOREIGN KEY ("etiquetaId") REFERENCES public.etiquetas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3926 (class 2606 OID 73838)
-- Name: publicacionetiqueta publicacionetiqueta_publicacionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.publicacionetiqueta
    ADD CONSTRAINT "publicacionetiqueta_publicacionId_fkey" FOREIGN KEY ("publicacionId") REFERENCES public.publicaciones(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3907 (class 2606 OID 32782)
-- Name: seguidores seguidores_seguidoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.seguidores
    ADD CONSTRAINT "seguidores_seguidoId_fkey" FOREIGN KEY ("seguidoId") REFERENCES public.usuarios(id);


--
-- TOC entry 3908 (class 2606 OID 32777)
-- Name: seguidores seguidores_seguidorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.seguidores
    ADD CONSTRAINT "seguidores_seguidorId_fkey" FOREIGN KEY ("seguidorId") REFERENCES public.usuarios(id);


--
-- TOC entry 3923 (class 2606 OID 297300)
-- Name: valoraciones valoraciones_archivoId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.valoraciones
    ADD CONSTRAINT "valoraciones_archivoId_fkey" FOREIGN KEY ("archivoId") REFERENCES public.archivos(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 3924 (class 2606 OID 297295)
-- Name: valoraciones valoraciones_usuarioId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: neondb_owner
--

ALTER TABLE ONLY public.valoraciones
    ADD CONSTRAINT "valoraciones_usuarioId_fkey" FOREIGN KEY ("usuarioId") REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2149 (class 826 OID 16397)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO neon_superuser WITH GRANT OPTION;


--
-- TOC entry 2148 (class 826 OID 16396)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: cloud_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE cloud_admin IN SCHEMA public GRANT ALL ON TABLES TO neon_superuser WITH GRANT OPTION;


-- Completed on 2026-06-12 22:45:04

--
-- PostgreSQL database dump complete
--

\unrestrict tW49HtANdCsaxEHpf02YuXghCgKeg8C226TmVoMke8DGQSXHtWuPeSyI7YgsH9N

