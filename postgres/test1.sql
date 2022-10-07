--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Homebrew)
-- Dumped by pg_dump version 14.5 (Homebrew)

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
-- Name: addresses; Type: TABLE; Schema: public; Owner: boula
--

CREATE TABLE public.addresses (
    id integer NOT NULL,
    user_id integer,
    street character varying(100),
    city character varying(30),
    zip integer,
    state character varying(30)
);


ALTER TABLE public.addresses OWNER TO boula;

--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: boula
--

CREATE SEQUENCE public.addresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.addresses_id_seq OWNER TO boula;

--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: boula
--

ALTER SEQUENCE public.addresses_id_seq OWNED BY public.addresses.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: boula
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    contents character varying(250),
    user_id integer,
    photo_id integer
);


ALTER TABLE public.comments OWNER TO boula;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: boula
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO boula;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: boula
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: boula
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    user_id integer,
    product_id integer,
    paid boolean,
    purchased_at timestamp without time zone,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.orders OWNER TO boula;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: boula
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO boula;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: boula
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: photos; Type: TABLE; Schema: public; Owner: boula
--

CREATE TABLE public.photos (
    id integer NOT NULL,
    url character varying(250),
    user_id integer
);


ALTER TABLE public.photos OWNER TO boula;

--
-- Name: photos_id_seq; Type: SEQUENCE; Schema: public; Owner: boula
--

CREATE SEQUENCE public.photos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photos_id_seq OWNER TO boula;

--
-- Name: photos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: boula
--

ALTER SEQUENCE public.photos_id_seq OWNED BY public.photos.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: boula
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying,
    department character varying,
    price integer,
    weight integer,
    avaliable boolean,
    quantity integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.products OWNER TO boula;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: boula
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO boula;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: boula
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: user_profiles; Type: TABLE; Schema: public; Owner: boula
--

CREATE TABLE public.user_profiles (
    id integer NOT NULL,
    first_name character varying(25) NOT NULL,
    last_name character varying(25) NOT NULL,
    age smallint,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    user_id integer,
    CONSTRAINT user_profiles_age_check CHECK (((age >= 18) AND (age <= 65)))
);


ALTER TABLE public.user_profiles OWNER TO boula;

--
-- Name: user_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: boula
--

CREATE SEQUENCE public.user_profiles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_profiles_id_seq OWNER TO boula;

--
-- Name: user_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: boula
--

ALTER SEQUENCE public.user_profiles_id_seq OWNED BY public.user_profiles.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: boula
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(64) NOT NULL,
    active boolean DEFAULT true,
    verified boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT users_password_check CHECK (((char_length((password)::text) >= 6) AND (char_length((password)::text) <= 64)))
);


ALTER TABLE public.users OWNER TO boula;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: boula
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO boula;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: boula
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: boula
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: boula
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: boula
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: photos id; Type: DEFAULT; Schema: public; Owner: boula
--

ALTER TABLE ONLY public.photos ALTER COLUMN id SET DEFAULT nextval('public.photos_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: boula
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: user_profiles id; Type: DEFAULT; Schema: public; Owner: boula
--

ALTER TABLE ONLY public.user_profiles ALTER COLUMN id SET DEFAULT nextval('public.user_profiles_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: boula
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: boula
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: boula
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: boula
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: photos photos_pkey; Type: CONSTRAINT; Schema: public; Owner: boula
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT photos_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: boula
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: user_profiles user_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: boula
--

ALTER TABLE ONLY public.user_profiles
    ADD CONSTRAINT user_profiles_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: boula
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: boula
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: boula
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: addresses addresses_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: boula
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: comments comments_photo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: boula
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_photo_id_fkey FOREIGN KEY (photo_id) REFERENCES public.photos(id) ON DELETE CASCADE;


--
-- Name: comments comments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: boula
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: orders orders_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: boula
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: boula
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: photos photos_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: boula
--

ALTER TABLE ONLY public.photos
    ADD CONSTRAINT photos_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_profiles user_profiles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: boula
--

ALTER TABLE ONLY public.user_profiles
    ADD CONSTRAINT user_profiles_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

