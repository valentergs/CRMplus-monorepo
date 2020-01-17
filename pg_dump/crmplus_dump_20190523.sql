--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cliente; Type: TABLE; Schema: public; Owner: rodrigovalente
--

CREATE TABLE public.cliente (
    cliente_id integer NOT NULL,
    cliente character varying(255) NOT NULL,
    unidade character varying(255) NOT NULL,
    "endereço" character varying(255) NOT NULL,
    cidade character varying(255) NOT NULL,
    estado character varying(255) NOT NULL,
    pais character varying(255) NOT NULL,
    cep bigint,
    contato bigint
);


ALTER TABLE public.cliente OWNER TO rodrigovalente;

--
-- Name: cliente_cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: rodrigovalente
--

CREATE SEQUENCE public.cliente_cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cliente_cliente_id_seq OWNER TO rodrigovalente;

--
-- Name: cliente_cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rodrigovalente
--

ALTER SEQUENCE public.cliente_cliente_id_seq OWNED BY public.cliente.cliente_id;


--
-- Name: comentario_relatorio; Type: TABLE; Schema: public; Owner: rodrigovalente
--

CREATE TABLE public.comentario_relatorio (
    comentario_relatorio_id integer NOT NULL,
    relatorio bigint,
    autor bigint,
    "data_criação" timestamp with time zone DEFAULT CURRENT_DATE NOT NULL
);


ALTER TABLE public.comentario_relatorio OWNER TO rodrigovalente;

--
-- Name: comentario_relatorio_comentario_relatorio_id_seq; Type: SEQUENCE; Schema: public; Owner: rodrigovalente
--

CREATE SEQUENCE public.comentario_relatorio_comentario_relatorio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comentario_relatorio_comentario_relatorio_id_seq OWNER TO rodrigovalente;

--
-- Name: comentario_relatorio_comentario_relatorio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rodrigovalente
--

ALTER SEQUENCE public.comentario_relatorio_comentario_relatorio_id_seq OWNED BY public.comentario_relatorio.comentario_relatorio_id;


--
-- Name: contato; Type: TABLE; Schema: public; Owner: rodrigovalente
--

CREATE TABLE public.contato (
    contato_id integer NOT NULL,
    cliente bigint,
    nome character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    telefone bigint,
    celular bigint
);


ALTER TABLE public.contato OWNER TO rodrigovalente;

--
-- Name: contato_contato_id_seq; Type: SEQUENCE; Schema: public; Owner: rodrigovalente
--

CREATE SEQUENCE public.contato_contato_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contato_contato_id_seq OWNER TO rodrigovalente;

--
-- Name: contato_contato_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rodrigovalente
--

ALTER SEQUENCE public.contato_contato_id_seq OWNED BY public.contato.contato_id;


--
-- Name: forecast; Type: TABLE; Schema: public; Owner: rodrigovalente
--

CREATE TABLE public.forecast (
    forecast_id integer NOT NULL,
    autor bigint,
    cliente bigint,
    "data_criação" timestamp with time zone DEFAULT CURRENT_DATE NOT NULL
);


ALTER TABLE public.forecast OWNER TO rodrigovalente;

--
-- Name: forecast_forecast_id_seq; Type: SEQUENCE; Schema: public; Owner: rodrigovalente
--

CREATE SEQUENCE public.forecast_forecast_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forecast_forecast_id_seq OWNER TO rodrigovalente;

--
-- Name: forecast_forecast_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rodrigovalente
--

ALTER SEQUENCE public.forecast_forecast_id_seq OWNED BY public.forecast.forecast_id;


--
-- Name: forecast_item; Type: TABLE; Schema: public; Owner: rodrigovalente
--

CREATE TABLE public.forecast_item (
    forecast_item_id integer NOT NULL,
    produto bigint,
    "data_criação" timestamp with time zone DEFAULT CURRENT_DATE NOT NULL,
    mes date,
    quantidade bigint
);


ALTER TABLE public.forecast_item OWNER TO rodrigovalente;

--
-- Name: forecast_item_forecast_item_id_seq; Type: SEQUENCE; Schema: public; Owner: rodrigovalente
--

CREATE SEQUENCE public.forecast_item_forecast_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.forecast_item_forecast_item_id_seq OWNER TO rodrigovalente;

--
-- Name: forecast_item_forecast_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rodrigovalente
--

ALTER SEQUENCE public.forecast_item_forecast_item_id_seq OWNED BY public.forecast_item.forecast_item_id;


--
-- Name: oportunidade; Type: TABLE; Schema: public; Owner: rodrigovalente
--

CREATE TABLE public.oportunidade (
    oportunidade_id integer NOT NULL,
    dono bigint,
    cliente bigint,
    contato bigint,
    "data_criação" timestamp with time zone DEFAULT CURRENT_DATE NOT NULL,
    data_vencimento date NOT NULL,
    quantidade_potencial bigint,
    faturamento_potencial numeric(8,2)
);


ALTER TABLE public.oportunidade OWNER TO rodrigovalente;

--
-- Name: oportunidade_oportunidade_id_seq; Type: SEQUENCE; Schema: public; Owner: rodrigovalente
--

CREATE SEQUENCE public.oportunidade_oportunidade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oportunidade_oportunidade_id_seq OWNER TO rodrigovalente;

--
-- Name: oportunidade_oportunidade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rodrigovalente
--

ALTER SEQUENCE public.oportunidade_oportunidade_id_seq OWNED BY public.oportunidade.oportunidade_id;


--
-- Name: preco; Type: TABLE; Schema: public; Owner: rodrigovalente
--

CREATE TABLE public.preco (
    preco_id integer NOT NULL,
    cliente bigint,
    produto bigint,
    "preço" numeric(5,2) NOT NULL,
    unidade character varying(10),
    "data_criação" timestamp with time zone DEFAULT CURRENT_DATE NOT NULL,
    data_inicio date NOT NULL,
    data_final date NOT NULL
);


ALTER TABLE public.preco OWNER TO rodrigovalente;

--
-- Name: preco_preco_id_seq; Type: SEQUENCE; Schema: public; Owner: rodrigovalente
--

CREATE SEQUENCE public.preco_preco_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.preco_preco_id_seq OWNER TO rodrigovalente;

--
-- Name: preco_preco_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rodrigovalente
--

ALTER SEQUENCE public.preco_preco_id_seq OWNED BY public.preco.preco_id;


--
-- Name: produto; Type: TABLE; Schema: public; Owner: rodrigovalente
--

CREATE TABLE public.produto (
    produto_id integer NOT NULL,
    nome character varying(50),
    numero bigint,
    segmento bigint
);


ALTER TABLE public.produto OWNER TO rodrigovalente;

--
-- Name: produto_produto_id_seq; Type: SEQUENCE; Schema: public; Owner: rodrigovalente
--

CREATE SEQUENCE public.produto_produto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.produto_produto_id_seq OWNER TO rodrigovalente;

--
-- Name: produto_produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rodrigovalente
--

ALTER SEQUENCE public.produto_produto_id_seq OWNED BY public.produto.produto_id;


--
-- Name: recebiveis; Type: TABLE; Schema: public; Owner: rodrigovalente
--

CREATE TABLE public.recebiveis (
    recebiveis_id integer NOT NULL,
    cliente bigint,
    fatura character varying(50) NOT NULL,
    "data_emissão" date NOT NULL,
    data_vencimento date NOT NULL,
    valor numeric(8,2) NOT NULL
);


ALTER TABLE public.recebiveis OWNER TO rodrigovalente;

--
-- Name: recebiveis_recebiveis_id_seq; Type: SEQUENCE; Schema: public; Owner: rodrigovalente
--

CREATE SEQUENCE public.recebiveis_recebiveis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recebiveis_recebiveis_id_seq OWNER TO rodrigovalente;

--
-- Name: recebiveis_recebiveis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rodrigovalente
--

ALTER SEQUENCE public.recebiveis_recebiveis_id_seq OWNED BY public.recebiveis.recebiveis_id;


--
-- Name: relatorio; Type: TABLE; Schema: public; Owner: rodrigovalente
--

CREATE TABLE public.relatorio (
    relatorio_id integer NOT NULL,
    cliente bigint,
    tipo character varying(50),
    "data_criação" timestamp with time zone DEFAULT CURRENT_DATE NOT NULL,
    "data_revisão" timestamp with time zone DEFAULT now() NOT NULL,
    status character varying(10),
    autor bigint,
    texto text
);


ALTER TABLE public.relatorio OWNER TO rodrigovalente;

--
-- Name: relatorio_relatorio_id_seq; Type: SEQUENCE; Schema: public; Owner: rodrigovalente
--

CREATE SEQUENCE public.relatorio_relatorio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.relatorio_relatorio_id_seq OWNER TO rodrigovalente;

--
-- Name: relatorio_relatorio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rodrigovalente
--

ALTER SEQUENCE public.relatorio_relatorio_id_seq OWNED BY public.relatorio.relatorio_id;


--
-- Name: segmento; Type: TABLE; Schema: public; Owner: rodrigovalente
--

CREATE TABLE public.segmento (
    segmento_id integer NOT NULL,
    nome character varying(50)
);


ALTER TABLE public.segmento OWNER TO rodrigovalente;

--
-- Name: segmento_segmento_id_seq; Type: SEQUENCE; Schema: public; Owner: rodrigovalente
--

CREATE SEQUENCE public.segmento_segmento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.segmento_segmento_id_seq OWNER TO rodrigovalente;

--
-- Name: segmento_segmento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rodrigovalente
--

ALTER SEQUENCE public.segmento_segmento_id_seq OWNED BY public.segmento.segmento_id;


--
-- Name: tarefa; Type: TABLE; Schema: public; Owner: rodrigovalente
--

CREATE TABLE public.tarefa (
    tarefa_id integer NOT NULL,
    autor bigint,
    delegado bigint,
    cliente bigint,
    assunto character varying(100),
    texto text,
    "data_criação" timestamp with time zone DEFAULT CURRENT_DATE NOT NULL,
    data_vencimento date
);


ALTER TABLE public.tarefa OWNER TO rodrigovalente;

--
-- Name: tarefa_tarefa_id_seq; Type: SEQUENCE; Schema: public; Owner: rodrigovalente
--

CREATE SEQUENCE public.tarefa_tarefa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tarefa_tarefa_id_seq OWNER TO rodrigovalente;

--
-- Name: tarefa_tarefa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rodrigovalente
--

ALTER SEQUENCE public.tarefa_tarefa_id_seq OWNED BY public.tarefa.tarefa_id;


--
-- Name: usuario; Type: TABLE; Schema: public; Owner: rodrigovalente
--

CREATE TABLE public.usuario (
    usuario_id integer NOT NULL,
    nome character varying(50) NOT NULL,
    sobrenome character varying(50) NOT NULL,
    senha character varying(50) NOT NULL,
    email character varying(100) NOT NULL UNIQUE,
    celular bigint,
    superuser boolean,
    ativo boolean,
    departamento character varying(30)
);


ALTER TABLE public.usuario OWNER TO rodrigovalente;

--
-- Name: usuario_usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: rodrigovalente
--

CREATE SEQUENCE public.usuario_usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_usuario_id_seq OWNER TO rodrigovalente;

--
-- Name: usuario_usuario_id_seq1; Type: SEQUENCE; Schema: public; Owner: rodrigovalente
--

CREATE SEQUENCE public.usuario_usuario_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuario_usuario_id_seq1 OWNER TO rodrigovalente;

--
-- Name: usuario_usuario_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: rodrigovalente
--

ALTER SEQUENCE public.usuario_usuario_id_seq1 OWNED BY public.usuario.usuario_id;


--
-- Name: cliente cliente_id; Type: DEFAULT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.cliente ALTER COLUMN cliente_id SET DEFAULT nextval('public.cliente_cliente_id_seq'::regclass);


--
-- Name: comentario_relatorio comentario_relatorio_id; Type: DEFAULT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.comentario_relatorio ALTER COLUMN comentario_relatorio_id SET DEFAULT nextval('public.comentario_relatorio_comentario_relatorio_id_seq'::regclass);


--
-- Name: contato contato_id; Type: DEFAULT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.contato ALTER COLUMN contato_id SET DEFAULT nextval('public.contato_contato_id_seq'::regclass);


--
-- Name: forecast forecast_id; Type: DEFAULT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.forecast ALTER COLUMN forecast_id SET DEFAULT nextval('public.forecast_forecast_id_seq'::regclass);


--
-- Name: forecast_item forecast_item_id; Type: DEFAULT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.forecast_item ALTER COLUMN forecast_item_id SET DEFAULT nextval('public.forecast_item_forecast_item_id_seq'::regclass);


--
-- Name: oportunidade oportunidade_id; Type: DEFAULT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.oportunidade ALTER COLUMN oportunidade_id SET DEFAULT nextval('public.oportunidade_oportunidade_id_seq'::regclass);


--
-- Name: preco preco_id; Type: DEFAULT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.preco ALTER COLUMN preco_id SET DEFAULT nextval('public.preco_preco_id_seq'::regclass);


--
-- Name: produto produto_id; Type: DEFAULT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.produto ALTER COLUMN produto_id SET DEFAULT nextval('public.produto_produto_id_seq'::regclass);


--
-- Name: recebiveis recebiveis_id; Type: DEFAULT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.recebiveis ALTER COLUMN recebiveis_id SET DEFAULT nextval('public.recebiveis_recebiveis_id_seq'::regclass);


--
-- Name: relatorio relatorio_id; Type: DEFAULT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.relatorio ALTER COLUMN relatorio_id SET DEFAULT nextval('public.relatorio_relatorio_id_seq'::regclass);


--
-- Name: segmento segmento_id; Type: DEFAULT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.segmento ALTER COLUMN segmento_id SET DEFAULT nextval('public.segmento_segmento_id_seq'::regclass);


--
-- Name: tarefa tarefa_id; Type: DEFAULT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.tarefa ALTER COLUMN tarefa_id SET DEFAULT nextval('public.tarefa_tarefa_id_seq'::regclass);


--
-- Name: usuario usuario_id; Type: DEFAULT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.usuario ALTER COLUMN usuario_id SET DEFAULT nextval('public.usuario_usuario_id_seq1'::regclass);


--
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: rodrigovalente
--

COPY public.cliente (cliente_id, cliente, unidade, "endereço", cidade, estado, pais, cep, contato) FROM stdin;
\.


--
-- Data for Name: comentario_relatorio; Type: TABLE DATA; Schema: public; Owner: rodrigovalente
--

COPY public.comentario_relatorio (comentario_relatorio_id, relatorio, autor, "data_criação") FROM stdin;
\.


--
-- Data for Name: contato; Type: TABLE DATA; Schema: public; Owner: rodrigovalente
--

COPY public.contato (contato_id, cliente, nome, email, telefone, celular) FROM stdin;
\.


--
-- Data for Name: forecast; Type: TABLE DATA; Schema: public; Owner: rodrigovalente
--

COPY public.forecast (forecast_id, autor, cliente, "data_criação") FROM stdin;
\.


--
-- Data for Name: forecast_item; Type: TABLE DATA; Schema: public; Owner: rodrigovalente
--

COPY public.forecast_item (forecast_item_id, produto, "data_criação", mes, quantidade) FROM stdin;
\.


--
-- Data for Name: oportunidade; Type: TABLE DATA; Schema: public; Owner: rodrigovalente
--

COPY public.oportunidade (oportunidade_id, dono, cliente, contato, "data_criação", data_vencimento, quantidade_potencial, faturamento_potencial) FROM stdin;
\.


--
-- Data for Name: preco; Type: TABLE DATA; Schema: public; Owner: rodrigovalente
--

COPY public.preco (preco_id, cliente, produto, "preço", unidade, "data_criação", data_inicio, data_final) FROM stdin;
\.


--
-- Data for Name: produto; Type: TABLE DATA; Schema: public; Owner: rodrigovalente
--

COPY public.produto (produto_id, nome, numero, segmento) FROM stdin;
\.


--
-- Data for Name: recebiveis; Type: TABLE DATA; Schema: public; Owner: rodrigovalente
--

COPY public.recebiveis (recebiveis_id, cliente, fatura, "data_emissão", data_vencimento, valor) FROM stdin;
\.


--
-- Data for Name: relatorio; Type: TABLE DATA; Schema: public; Owner: rodrigovalente
--

COPY public.relatorio (relatorio_id, cliente, tipo, "data_criação", "data_revisão", status, autor, texto) FROM stdin;
\.


--
-- Data for Name: segmento; Type: TABLE DATA; Schema: public; Owner: rodrigovalente
--

COPY public.segmento (segmento_id, nome) FROM stdin;
\.


--
-- Data for Name: tarefa; Type: TABLE DATA; Schema: public; Owner: rodrigovalente
--

COPY public.tarefa (tarefa_id, autor, delegado, cliente, assunto, texto, "data_criação", data_vencimento) FROM stdin;
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: rodrigovalente
--

COPY public.usuario (usuario_id, nome, sobrenome, senha, email, celular, superuser, ativo, departamento) FROM stdin;
\.


--
-- Name: cliente_cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rodrigovalente
--

SELECT pg_catalog.setval('public.cliente_cliente_id_seq', 1, false);


--
-- Name: comentario_relatorio_comentario_relatorio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rodrigovalente
--

SELECT pg_catalog.setval('public.comentario_relatorio_comentario_relatorio_id_seq', 1, false);


--
-- Name: contato_contato_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rodrigovalente
--

SELECT pg_catalog.setval('public.contato_contato_id_seq', 1, false);


--
-- Name: forecast_forecast_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rodrigovalente
--

SELECT pg_catalog.setval('public.forecast_forecast_id_seq', 1, false);


--
-- Name: forecast_item_forecast_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rodrigovalente
--

SELECT pg_catalog.setval('public.forecast_item_forecast_item_id_seq', 1, false);


--
-- Name: oportunidade_oportunidade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rodrigovalente
--

SELECT pg_catalog.setval('public.oportunidade_oportunidade_id_seq', 1, false);


--
-- Name: preco_preco_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rodrigovalente
--

SELECT pg_catalog.setval('public.preco_preco_id_seq', 1, false);


--
-- Name: produto_produto_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rodrigovalente
--

SELECT pg_catalog.setval('public.produto_produto_id_seq', 1, false);


--
-- Name: recebiveis_recebiveis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rodrigovalente
--

SELECT pg_catalog.setval('public.recebiveis_recebiveis_id_seq', 1, false);


--
-- Name: relatorio_relatorio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rodrigovalente
--

SELECT pg_catalog.setval('public.relatorio_relatorio_id_seq', 1, false);


--
-- Name: segmento_segmento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rodrigovalente
--

SELECT pg_catalog.setval('public.segmento_segmento_id_seq', 1, false);


--
-- Name: tarefa_tarefa_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rodrigovalente
--

SELECT pg_catalog.setval('public.tarefa_tarefa_id_seq', 1, false);


--
-- Name: usuario_usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rodrigovalente
--

SELECT pg_catalog.setval('public.usuario_usuario_id_seq', 1, false);


--
-- Name: usuario_usuario_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: rodrigovalente
--

SELECT pg_catalog.setval('public.usuario_usuario_id_seq1', 1, false);


--
-- Name: cliente cliente_cliente_key; Type: CONSTRAINT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_cliente_key UNIQUE (cliente);


--
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (cliente_id);


--
-- Name: comentario_relatorio comentario_relatorio_pkey; Type: CONSTRAINT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.comentario_relatorio
    ADD CONSTRAINT comentario_relatorio_pkey PRIMARY KEY (comentario_relatorio_id);


--
-- Name: contato contato_email_key; Type: CONSTRAINT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.contato
    ADD CONSTRAINT contato_email_key UNIQUE (email);


--
-- Name: contato contato_pkey; Type: CONSTRAINT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.contato
    ADD CONSTRAINT contato_pkey PRIMARY KEY (contato_id);


--
-- Name: forecast_item forecast_item_pkey; Type: CONSTRAINT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.forecast_item
    ADD CONSTRAINT forecast_item_pkey PRIMARY KEY (forecast_item_id);


--
-- Name: forecast forecast_pkey; Type: CONSTRAINT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.forecast
    ADD CONSTRAINT forecast_pkey PRIMARY KEY (forecast_id);


--
-- Name: oportunidade oportunidade_pkey; Type: CONSTRAINT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.oportunidade
    ADD CONSTRAINT oportunidade_pkey PRIMARY KEY (oportunidade_id);


--
-- Name: preco preco_pkey; Type: CONSTRAINT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.preco
    ADD CONSTRAINT preco_pkey PRIMARY KEY (preco_id);


--
-- Name: produto produto_pkey; Type: CONSTRAINT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (produto_id);


--
-- Name: recebiveis recebiveis_pkey; Type: CONSTRAINT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.recebiveis
    ADD CONSTRAINT recebiveis_pkey PRIMARY KEY (recebiveis_id);


--
-- Name: relatorio relatorio_pkey; Type: CONSTRAINT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.relatorio
    ADD CONSTRAINT relatorio_pkey PRIMARY KEY (relatorio_id);


--
-- Name: segmento segmento_pkey; Type: CONSTRAINT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.segmento
    ADD CONSTRAINT segmento_pkey PRIMARY KEY (segmento_id);


--
-- Name: tarefa tarefa_pkey; Type: CONSTRAINT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.tarefa
    ADD CONSTRAINT tarefa_pkey PRIMARY KEY (tarefa_id);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (usuario_id);


--
-- Name: cliente cliente_contato_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_contato_fkey FOREIGN KEY (contato) REFERENCES public.contato(contato_id) ON DELETE CASCADE;


--
-- Name: comentario_relatorio comentario_relatorio_relatorio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.comentario_relatorio
    ADD CONSTRAINT comentario_relatorio_relatorio_fkey FOREIGN KEY (relatorio) REFERENCES public.relatorio(relatorio_id) ON DELETE CASCADE;


--
-- Name: contato contato_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.contato
    ADD CONSTRAINT contato_cliente_fkey FOREIGN KEY (cliente) REFERENCES public.cliente(cliente_id) ON DELETE CASCADE;


--
-- Name: forecast forecast_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.forecast
    ADD CONSTRAINT forecast_cliente_fkey FOREIGN KEY (cliente) REFERENCES public.cliente(cliente_id) ON DELETE CASCADE;


--
-- Name: forecast_item forecast_item_produto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.forecast_item
    ADD CONSTRAINT forecast_item_produto_fkey FOREIGN KEY (produto) REFERENCES public.produto(produto_id) ON DELETE CASCADE;


--
-- Name: oportunidade oportunidade_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.oportunidade
    ADD CONSTRAINT oportunidade_cliente_fkey FOREIGN KEY (cliente) REFERENCES public.cliente(cliente_id) ON DELETE CASCADE;


--
-- Name: oportunidade oportunidade_contato_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.oportunidade
    ADD CONSTRAINT oportunidade_contato_fkey FOREIGN KEY (contato) REFERENCES public.contato(contato_id) ON DELETE CASCADE;


--
-- Name: preco preco_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.preco
    ADD CONSTRAINT preco_cliente_fkey FOREIGN KEY (cliente) REFERENCES public.cliente(cliente_id) ON DELETE CASCADE;


--
-- Name: preco preco_produto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.preco
    ADD CONSTRAINT preco_produto_fkey FOREIGN KEY (produto) REFERENCES public.produto(produto_id) ON DELETE CASCADE;


--
-- Name: produto produto_segmento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_segmento_fkey FOREIGN KEY (segmento) REFERENCES public.segmento(segmento_id) ON DELETE CASCADE;


--
-- Name: recebiveis recebiveis_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.recebiveis
    ADD CONSTRAINT recebiveis_cliente_fkey FOREIGN KEY (cliente) REFERENCES public.cliente(cliente_id) ON DELETE CASCADE;


--
-- Name: relatorio relatorio_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.relatorio
    ADD CONSTRAINT relatorio_cliente_fkey FOREIGN KEY (cliente) REFERENCES public.cliente(cliente_id) ON DELETE CASCADE;


--
-- Name: tarefa tarefa_cliente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rodrigovalente
--

ALTER TABLE ONLY public.tarefa
    ADD CONSTRAINT tarefa_cliente_fkey FOREIGN KEY (cliente) REFERENCES public.cliente(cliente_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

