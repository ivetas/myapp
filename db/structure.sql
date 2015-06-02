--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
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
-- Name: articles; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE articles (
    id integer NOT NULL,
    title character varying,
    description text,
    published boolean DEFAULT false,
    published_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    photo_file_name character varying,
    photo_content_type character varying,
    photo_file_size integer,
    photo_updated_at timestamp without time zone
);


--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE articles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE articles_id_seq OWNED BY articles.id;


--
-- Name: average_caches; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE average_caches (
    id integer NOT NULL,
    rater_id integer,
    rateable_id integer,
    rateable_type character varying,
    avg double precision NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: average_caches_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE average_caches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: average_caches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE average_caches_id_seq OWNED BY average_caches.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    receipt_id integer,
    user_id integer,
    message text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: overall_averages; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE overall_averages (
    id integer NOT NULL,
    rateable_id integer,
    rateable_type character varying,
    overall_avg double precision NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: overall_averages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE overall_averages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: overall_averages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE overall_averages_id_seq OWNED BY overall_averages.id;


--
-- Name: rates; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rates (
    id integer NOT NULL,
    rater_id integer,
    rateable_id integer,
    rateable_type character varying,
    stars double precision NOT NULL,
    dimension character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: rates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rates_id_seq OWNED BY rates.id;


--
-- Name: rating_caches; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE rating_caches (
    id integer NOT NULL,
    cacheable_id integer,
    cacheable_type character varying,
    avg double precision NOT NULL,
    qty integer NOT NULL,
    dimension character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: rating_caches_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE rating_caches_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rating_caches_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE rating_caches_id_seq OWNED BY rating_caches.id;


--
-- Name: receipt_categories; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE receipt_categories (
    id integer NOT NULL,
    receipt_id integer,
    category_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: receipt_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE receipt_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: receipt_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE receipt_categories_id_seq OWNED BY receipt_categories.id;


--
-- Name: receipts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE receipts (
    id integer NOT NULL,
    user_id integer,
    title character varying,
    components text,
    description text,
    published boolean DEFAULT false,
    published_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    photo_file_name character varying,
    photo_content_type character varying,
    photo_file_size integer,
    photo_updated_at timestamp without time zone
);


--
-- Name: receipts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE receipts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: receipts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE receipts_id_seq OWNED BY receipts.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    is_admin boolean DEFAULT false,
    is_banned boolean DEFAULT false,
    username character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY articles ALTER COLUMN id SET DEFAULT nextval('articles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY average_caches ALTER COLUMN id SET DEFAULT nextval('average_caches_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY overall_averages ALTER COLUMN id SET DEFAULT nextval('overall_averages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rates ALTER COLUMN id SET DEFAULT nextval('rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY rating_caches ALTER COLUMN id SET DEFAULT nextval('rating_caches_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY receipt_categories ALTER COLUMN id SET DEFAULT nextval('receipt_categories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY receipts ALTER COLUMN id SET DEFAULT nextval('receipts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: articles_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: average_caches_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY average_caches
    ADD CONSTRAINT average_caches_pkey PRIMARY KEY (id);


--
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: overall_averages_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY overall_averages
    ADD CONSTRAINT overall_averages_pkey PRIMARY KEY (id);


--
-- Name: rates_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rates
    ADD CONSTRAINT rates_pkey PRIMARY KEY (id);


--
-- Name: rating_caches_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY rating_caches
    ADD CONSTRAINT rating_caches_pkey PRIMARY KEY (id);


--
-- Name: receipt_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY receipt_categories
    ADD CONSTRAINT receipt_categories_pkey PRIMARY KEY (id);


--
-- Name: receipts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY receipts
    ADD CONSTRAINT receipts_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_rates_on_rateable_id_and_rateable_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_rates_on_rateable_id_and_rateable_type ON rates USING btree (rateable_id, rateable_type);


--
-- Name: index_rates_on_rater_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_rates_on_rater_id ON rates USING btree (rater_id);


--
-- Name: index_rating_caches_on_cacheable_id_and_cacheable_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_rating_caches_on_cacheable_id_and_cacheable_type ON rating_caches USING btree (cacheable_id, cacheable_type);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20150505070155');

INSERT INTO schema_migrations (version) VALUES ('20150506132749');

INSERT INTO schema_migrations (version) VALUES ('20150508073156');

INSERT INTO schema_migrations (version) VALUES ('20150508080659');

INSERT INTO schema_migrations (version) VALUES ('20150508081335');

INSERT INTO schema_migrations (version) VALUES ('20150508121943');

INSERT INTO schema_migrations (version) VALUES ('20150509193658');

INSERT INTO schema_migrations (version) VALUES ('20150512061946');

INSERT INTO schema_migrations (version) VALUES ('20150512061947');

INSERT INTO schema_migrations (version) VALUES ('20150512061948');

INSERT INTO schema_migrations (version) VALUES ('20150512061949');

INSERT INTO schema_migrations (version) VALUES ('20150512140559');

