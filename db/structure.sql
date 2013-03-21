--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ambientes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ambientes (
    id integer NOT NULL,
    nome character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    altura double precision,
    largura double precision,
    comprimento double precision,
    empresa_id integer,
    imagem_chao character varying(255)
);


--
-- Name: ambientes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE ambientes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ambientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE ambientes_id_seq OWNED BY ambientes.id;


--
-- Name: empresas; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE empresas (
    id integer NOT NULL,
    nome character varying(255),
    razao_social character varying(255),
    cnpj character varying(255),
    telefone character varying(255),
    tipo character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: empresas_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE empresas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: empresas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE empresas_id_seq OWNED BY empresas.id;


--
-- Name: niveis; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE niveis (
    id integer NOT NULL,
    prateleira_id integer,
    numero integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    descricao character varying(255)
);


--
-- Name: niveis_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE niveis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: niveis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE niveis_id_seq OWNED BY niveis.id;


--
-- Name: niveis_produtos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE niveis_produtos (
    produto_id integer,
    nivel_id integer
);


--
-- Name: prateleiras; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE prateleiras (
    id integer NOT NULL,
    descricao character varying(255),
    x integer,
    y integer,
    posicao character varying(255),
    tamanho double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    style character varying(255),
    ambiente_id integer,
    largura integer,
    comprimento integer,
    imagem character varying(255)
);


--
-- Name: prateleiras_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE prateleiras_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: prateleiras_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE prateleiras_id_seq OWNED BY prateleiras.id;


--
-- Name: produtos; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE produtos (
    id integer NOT NULL,
    nome character varying(255),
    preco double precision,
    quantidade double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    codigo_de_barras character varying(255),
    descricao text
);


--
-- Name: produtos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE produtos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: produtos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE produtos_id_seq OWNED BY produtos.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY ambientes ALTER COLUMN id SET DEFAULT nextval('ambientes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY empresas ALTER COLUMN id SET DEFAULT nextval('empresas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY niveis ALTER COLUMN id SET DEFAULT nextval('niveis_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY prateleiras ALTER COLUMN id SET DEFAULT nextval('prateleiras_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY produtos ALTER COLUMN id SET DEFAULT nextval('produtos_id_seq'::regclass);


--
-- Name: ambientes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ambientes
    ADD CONSTRAINT ambientes_pkey PRIMARY KEY (id);


--
-- Name: empresas_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY empresas
    ADD CONSTRAINT empresas_pkey PRIMARY KEY (id);


--
-- Name: niveis_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY niveis
    ADD CONSTRAINT niveis_pkey PRIMARY KEY (id);


--
-- Name: prateleiras_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY prateleiras
    ADD CONSTRAINT prateleiras_pkey PRIMARY KEY (id);


--
-- Name: produtos_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (id);


--
-- Name: index_niveis_on_prateleira_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_niveis_on_prateleira_id ON niveis USING btree (prateleira_id);


--
-- Name: index_niveis_produtos_on_nivel_id_and_produto_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_niveis_produtos_on_nivel_id_and_produto_id ON niveis_produtos USING btree (nivel_id, produto_id);


--
-- Name: index_niveis_produtos_on_produto_id_and_nivel_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_niveis_produtos_on_produto_id_and_nivel_id ON niveis_produtos USING btree (produto_id, nivel_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

INSERT INTO schema_migrations (version) VALUES ('20130204233355');

INSERT INTO schema_migrations (version) VALUES ('20130206233219');

INSERT INTO schema_migrations (version) VALUES ('20130206233731');

INSERT INTO schema_migrations (version) VALUES ('20130207004349');

INSERT INTO schema_migrations (version) VALUES ('20130211172909');

INSERT INTO schema_migrations (version) VALUES ('20130211190617');

INSERT INTO schema_migrations (version) VALUES ('20130211191317');

INSERT INTO schema_migrations (version) VALUES ('20130214001714');

INSERT INTO schema_migrations (version) VALUES ('20130214001741');

INSERT INTO schema_migrations (version) VALUES ('20130224210553');

INSERT INTO schema_migrations (version) VALUES ('20130226015841');

INSERT INTO schema_migrations (version) VALUES ('20130226020222');

INSERT INTO schema_migrations (version) VALUES ('20130303014951');

INSERT INTO schema_migrations (version) VALUES ('20130304235643');

INSERT INTO schema_migrations (version) VALUES ('20130304235910');

INSERT INTO schema_migrations (version) VALUES ('20130309190202');

INSERT INTO schema_migrations (version) VALUES ('20130309193216');