--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4
-- Dumped by pg_dump version 10.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: attributes; Type: TABLE; Schema: public; Owner: sitanzewde
--

CREATE TABLE public.attributes (
    id integer NOT NULL,
    name text
);


ALTER TABLE public.attributes OWNER TO sitanzewde;

--
-- Name: attributes_id_seq; Type: SEQUENCE; Schema: public; Owner: sitanzewde
--

CREATE SEQUENCE public.attributes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attributes_id_seq OWNER TO sitanzewde;

--
-- Name: attributes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sitanzewde
--

ALTER SEQUENCE public.attributes_id_seq OWNED BY public.attributes.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: places; Type: TABLE; Schema: public; Owner: sitanzewde
--

CREATE TABLE public.places (
    id integer NOT NULL,
    query text,
    google_place_id text,
    name text,
    rating text,
    address text,
    lat double precision,
    lng double precision,
    types text[],
    website text,
    city text
);


ALTER TABLE public.places OWNER TO sitanzewde;

--
-- Name: places_attributes; Type: TABLE; Schema: public; Owner: sitanzewde
--

CREATE TABLE public.places_attributes (
    id integer NOT NULL,
    place integer,
    attribute integer
);


ALTER TABLE public.places_attributes OWNER TO sitanzewde;

--
-- Name: places_id_seq; Type: SEQUENCE; Schema: public; Owner: sitanzewde
--

CREATE SEQUENCE public.places_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.places_id_seq OWNER TO sitanzewde;

--
-- Name: places_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sitanzewde
--

ALTER SEQUENCE public.places_id_seq OWNED BY public.places.id;


--
-- Name: untitled_table_id_seq; Type: SEQUENCE; Schema: public; Owner: sitanzewde
--

CREATE SEQUENCE public.untitled_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.untitled_table_id_seq OWNER TO sitanzewde;

--
-- Name: untitled_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sitanzewde
--

ALTER SEQUENCE public.untitled_table_id_seq OWNED BY public.places_attributes.id;


--
-- Name: attributes id; Type: DEFAULT; Schema: public; Owner: sitanzewde
--

ALTER TABLE ONLY public.attributes ALTER COLUMN id SET DEFAULT nextval('public.attributes_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: places id; Type: DEFAULT; Schema: public; Owner: sitanzewde
--

ALTER TABLE ONLY public.places ALTER COLUMN id SET DEFAULT nextval('public.places_id_seq'::regclass);


--
-- Name: places_attributes id; Type: DEFAULT; Schema: public; Owner: sitanzewde
--

ALTER TABLE ONLY public.places_attributes ALTER COLUMN id SET DEFAULT nextval('public.untitled_table_id_seq'::regclass);


--
-- Data for Name: attributes; Type: TABLE DATA; Schema: public; Owner: sitanzewde
--

COPY public.attributes (id, name) FROM stdin;
1	cozy
2	romantic
3	haute cuisine
4	healthy food
5	streetfood
6	underground
7	shopping
8	relax
9	familyfriendly
10	hip
11	non touristic
12	price
13	elegant
14	charming
15	posh
16	sophisticated
17	service
18	view
19	vegetarian
20	vegan
21	traditional
22	exclusiv
23	historic
24	local
25	vintage
26	unique
27	modern
28	classic
29	ancient
30	minimalistic
31	adventure
32	single
33	couple
34	groups
35	wanderlust
36	numinous
37	fancy
38	active
39	warm
40	calming
41	artistic
42	clean
43	diverse
44	unusual
45	electric
46	crazy
47	monumental
48	multiculti
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add attributes	7	add_attributes
20	Can change attributes	7	change_attributes
21	Can delete attributes	7	delete_attributes
22	Can add auth group	8	add_authgroup
23	Can change auth group	8	change_authgroup
24	Can delete auth group	8	delete_authgroup
25	Can add auth group permissions	9	add_authgrouppermissions
26	Can change auth group permissions	9	change_authgrouppermissions
27	Can delete auth group permissions	9	delete_authgrouppermissions
28	Can add auth permission	10	add_authpermission
29	Can change auth permission	10	change_authpermission
30	Can delete auth permission	10	delete_authpermission
31	Can add auth user	11	add_authuser
32	Can change auth user	11	change_authuser
33	Can delete auth user	11	delete_authuser
34	Can add auth user groups	12	add_authusergroups
35	Can change auth user groups	12	change_authusergroups
36	Can delete auth user groups	12	delete_authusergroups
37	Can add auth user user permissions	13	add_authuseruserpermissions
38	Can change auth user user permissions	13	change_authuseruserpermissions
39	Can delete auth user user permissions	13	delete_authuseruserpermissions
40	Can add django admin log	14	add_djangoadminlog
41	Can change django admin log	14	change_djangoadminlog
42	Can delete django admin log	14	delete_djangoadminlog
43	Can add django content type	15	add_djangocontenttype
44	Can change django content type	15	change_djangocontenttype
45	Can delete django content type	15	delete_djangocontenttype
46	Can add django migrations	16	add_djangomigrations
47	Can change django migrations	16	change_djangomigrations
48	Can delete django migrations	16	delete_djangomigrations
49	Can add django session	17	add_djangosession
50	Can change django session	17	change_djangosession
51	Can delete django session	17	delete_djangosession
52	Can add places	18	add_places
53	Can change places	18	change_places
54	Can delete places	18	delete_places
55	Can add places attributes	19	add_placesattributes
56	Can change places attributes	19	change_placesattributes
57	Can delete places attributes	19	delete_placesattributes
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	readme	attributes
8	readme	authgroup
9	readme	authgrouppermissions
10	readme	authpermission
11	readme	authuser
12	readme	authusergroups
13	readme	authuseruserpermissions
14	readme	djangoadminlog
15	readme	djangocontenttype
16	readme	djangomigrations
17	readme	djangosession
18	readme	places
19	readme	placesattributes
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-05-06 13:21:43.198276+02
2	auth	0001_initial	2018-05-06 13:21:43.282051+02
3	admin	0001_initial	2018-05-06 13:21:43.308289+02
4	admin	0002_logentry_remove_auto_add	2018-05-06 13:21:43.32235+02
5	contenttypes	0002_remove_content_type_name	2018-05-06 13:21:43.342504+02
6	auth	0002_alter_permission_name_max_length	2018-05-06 13:21:43.352828+02
7	auth	0003_alter_user_email_max_length	2018-05-06 13:21:43.367234+02
8	auth	0004_alter_user_username_opts	2018-05-06 13:21:43.377679+02
9	auth	0005_alter_user_last_login_null	2018-05-06 13:21:43.387814+02
10	auth	0006_require_contenttypes_0002	2018-05-06 13:21:43.39013+02
11	auth	0007_alter_validators_add_error_messages	2018-05-06 13:21:43.404279+02
12	auth	0008_alter_user_username_max_length	2018-05-06 13:21:43.439207+02
13	auth	0009_alter_user_last_name_max_length	2018-05-06 13:21:43.451656+02
14	sessions	0001_initial	2018-05-06 13:21:43.462455+02
15	readme	0001_initial	2018-05-06 13:35:39.439464+02
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: places; Type: TABLE DATA; Schema: public; Owner: sitanzewde
--

COPY public.places (id, query, google_place_id, name, rating, address, lat, lng, types, website, city) FROM stdin;
5	Restaurants Amsterdam	ChIJM3DqwMcJxkcRjL0zzedDEWo	Humphrey's	4.2	Nieuwezijds Kolk 23, 1012 PV Amsterdam, Netherlands	52.376143799999987	4.89424379999999992	{restaurant,food,point_of_interest,establishment}	https://humphreys.nl/onze-restaurants/humphreys-amsterdam-nieuwezijds-kolk/	Amsterdam
3	Restaurants Amsterdam	ChIJmXCDu-oJxkcRGHNsqGzPLeQ	Restaurant Senses by Lars Bertelsen	4.5	Vijzelstraat 45, 1017 HE Amsterdam, Netherlands	52.3658829000000026	4.8932076999999996	{restaurant,food,point_of_interest,establishment}	http://www.sensesrestaurant.nl/	Amsterdam
16	Restaurants Amsterdam	ChIJy59J-sUJxkcRUkFVpemmYEU	Restaurant Max	4.5	Herenstraat 14I, 1015 CA Amsterdam, Netherlands	52.3771697000000032	4.88907260000000043	{restaurant,food,point_of_interest,establishment}	http://www.maxrestaurant.nl/	Amsterdam
1	Restaurants Amsterdam	ChIJ2z9uuZAJxkcRZ98TMEudT9g	Restaurant La Rive	4.7	Professor Tulpplein 1, 1018 GX Amsterdam, Netherlands	52.360057900000001	4.90523380000000042	{restaurant,food,point_of_interest,establishment}	http://www.restaurantlarive.nl/	Amsterdam
12	Restaurants Amsterdam	ChIJ--aBe7kJxkcRj3waPQO288U	Restaurant Looks	4.1	Binnen Bantammerstraat 5, 1011 CH Amsterdam, Netherlands	52.3739253000000033	4.90206430000000015	{restaurant,food,point_of_interest,establishment}	http://www.restaurantlooks.nl/	Amsterdam
17	Restaurants Amsterdam	ChIJ7YMxGOkJxkcRGFOCwgt61ns	Sherpa Restaurant	4.5	Korte Leidsedwarsstraat 58, 1017 RD Amsterdam, Netherlands	52.3631839999999968	4.88470389999999988	{restaurant,food,point_of_interest,establishment}	http://www.sherparestaurant.nl/	Amsterdam
11	Restaurants Amsterdam	ChIJWWfWp5YJxkcRAmkQV4nyAcw	Restaurant De Utrechtsedwarstafel	4.8	Utrechtsedwarsstraat 107-109, 1017 WD Amsterdam, Netherlands	52.3617978999999991	4.90049400000000013	{restaurant,food,point_of_interest,establishment}	http://www.utrechtsedwarstafel.com/	Amsterdam
15	Restaurants Amsterdam	ChIJsfwjUMcJxkcRcRi3dxYbCKo	Restaurant The White Room	4.6	Dam 9, 1012 JS Amsterdam, Netherlands	52.3725878000000122	4.89478019999999958	{restaurant,food,point_of_interest,establishment}	https://www.restaurantthewhiteroom.com/	Amsterdam
13	Restaurants Amsterdam	ChIJ1abBeA_ixUcRtVmDBJS2S08	Restaurant Adam	4.5	Overtoom 515, 1054 LE Amsterdam, Netherlands	52.3579979999999878	4.85661599999999982	{restaurant,food,point_of_interest,establishment}	http://www.restaurantadam.nl/	Amsterdam
19	Restaurants Amsterdam	ChIJg8bf-sIJxkcR9mc7li6y48E	Vinkeles	4.6	Keizersgracht 384, 1016 GB Amsterdam, Netherlands	52.3692909999999969	4.88401499999999977	{restaurant,food,point_of_interest,establishment}	https://www.vinkeles.com/	Amsterdam
14	Restaurants Amsterdam	ChIJt6cZ7OYJxkcRcO3by6UcrUY	Restaurant Hap-Hmm	4.5	Eerste Helmersstraat 33, 1054 CZ Amsterdam, Netherlands	52.3636728999999974	4.87632499999999958	{restaurant,food,point_of_interest,establishment}	http://www.hap-hmm.nl/	Amsterdam
18	Restaurants Amsterdam	ChIJYTLRCMAJxkcR8ZjjNJFsANA	Bord'Eau Restaurant Gastronomique	4.6	Nieuwe Doelenstraat 2-14, 1012 CP Amsterdam, Netherlands	52.3674979999999977	4.89431899999999942	{restaurant,food,point_of_interest,establishment}	http://bordeau.nl/	Amsterdam
2	Restaurants Amsterdam	ChIJY_IxVu0JxkcRi3NPxcHUO4o	Restaurant Zaza's	4.6	Daniël Stalpertstraat 103, 1072 XD Amsterdam, Netherlands	52.3561921000000012	4.89209389999999988	{restaurant,food,point_of_interest,establishment}	http://www.zazas.nl/	Amsterdam
20	Restaurants Amsterdam	ChIJd75Sd8gJxkcR3jy2XQJJlBo	de Silveren Spiegel	4.5	Kattengat 4-6, 1012 SZ Amsterdam, Netherlands	52.3777205000000023	4.8939199999999996	{bar,restaurant,food,point_of_interest,establishment}	http://www.desilverenspiegel.com/	Amsterdam
4	Restaurants Amsterdam	ChIJu61sS84JxkcR9DvNepP2cfU	Restaurant Daalder	4.6	Lindengracht 90, 1015 KK Amsterdam, Netherlands	52.3805432999999994	4.8856484	{cafe,restaurant,food,point_of_interest,establishment}	http://www.daalderamsterdam.nl/	Amsterdam
10	Restaurants Amsterdam	ChIJMzqLEIsJxkcRS4pQQMkgQak	Sazanka	4.7	Ferdinand Bolstraat 333, 1072 LH Amsterdam, Netherlands	52.3487634999999969	4.89388280000000009	{restaurant,food,point_of_interest,establishment}	http://www.sazanka.nl/	Amsterdam
40	Restaurants Amsterdam	ChIJiUVfWL8JxkcRiRV6tbk0IAY	Bridges	4.4	Oudezijds Voorburgwal 197, 1012 EX Amsterdam, Netherlands	52.3708030000000022	4.895181	{restaurant,food,point_of_interest,establishment}	https://www.bridges-amsterdam.nl/	Amsterdam
9	Restaurants Amsterdam	ChIJHcHVN8YJxkcR2mYCsTHbQ1o	Ashoka Restaurant	4.4	Spuistraat 54D, 1012 TV Amsterdam, Netherlands	52.3761354999999966	4.89224669999999939	{restaurant,food,point_of_interest,establishment}	http://www.ashokarestaurant.nl/	Amsterdam
8	Restaurants Amsterdam	ChIJX3zgt8EJxkcRHapvzk_hRlg	Restaurant Lt. Cornelis in Amsterdam Centrum | Rokin | Uit eten | Hollandse Keuken | Dinner	4.2	Voetboogstraat 13, 1012 XK Amsterdam, Netherlands	52.368236600000003	4.89075099999999985	{restaurant,food,point_of_interest,establishment}	https://restaurantcornelis.amsterdam/	Amsterdam
7	Restaurants Amsterdam	ChIJ03tCzs8JxkcR1Oa0dlZOaxU	Restaurant Vlaming	4.5	Lindengracht 95, 1015 KD Amsterdam, Netherlands	52.380020100000003	4.88461120000000015	{restaurant,food,point_of_interest,establishment}	http://www.restaurantvlaming.com/	Amsterdam
6	Restaurants Amsterdam	ChIJa4Vy0cAJxkcRxmTug4Pxl84	FuLu Mandarijn	4.4	Rokin 26, 1012 KS Amsterdam, Netherlands	52.3716936999999874	4.89259489999999975	{restaurant,food,point_of_interest,establishment}	http://www.mandarijnrokin.nl/	Amsterdam
164	Restaurants Berlin	ChIJ-8fl7MpPqEcRsHvXVp8w3WU	Spindler Restaurant Berlin	4.1	Paul-Lincke-Ufer 42/43, 10999 Berlin, Germany	52.496262999999999	13.4212220000000002	{bar,restaurant,food,point_of_interest,establishment}	http://www.spindler-berlin.de/	Berlin
178	Restaurants Berlin	ChIJj-ZaClNQqEcR_ne-PtqMyY0	Lieu in Berlin - Vietnamese Restaurant	4.1	Kurfürstenstraße 112, 10787 Berlin, Germany	52.5036830000000023	13.3466577999999991	{restaurant,food,point_of_interest,establishment}	http://www.lieu-in-berlin.de/	Berlin
171	Restaurants Berlin	ChIJ5xaQvsRRqEcRN8-Wy6L3dEE	Nante-Eck | Restaurant Berlin Mitte	4.2	Unter den Linden 35, 10117 Berlin, Germany	52.5166722000000021	13.3883010000000002	{lodging,restaurant,food,point_of_interest,establishment}	https://www.nante-eck.de/	Berlin
168	Restaurants Berlin	ChIJKU-CmMxRqEcRi0lH4uBOo4E	Mabuhay Indonesian Restaurant	4.6	Köthener Str. 28, 10963 Berlin, Germany	52.5042363000000023	13.3761690000000009	{restaurant,food,point_of_interest,establishment}	http://mabuhay.juisyfood.com/	Berlin
176	Restaurants Berlin	ChIJy3mwIxZOqEcRbFYNqFP7VaM	Ristorante a Mano	4.7	Strausberger Pl. 2, 10243 Berlin, Germany	52.5194499999999991	13.4272399999999994	{restaurant,food,point_of_interest,establishment}	http://www.amano-ristorante.de/	Berlin
170	Restaurants Berlin	ChIJpdyYVNFRqEcRFTrYsDXDrY4	Restaurant Tim Raue	4.4	Rudi-Dutschke-Straße 26, 10969 Berlin, Germany	52.50685	13.3919580000000007	{restaurant,food,point_of_interest,establishment}	http://www.tim-raue.com/	Berlin
165	Restaurants Berlin	ChIJpakOFGRQqEcRXFBSJ6zv3uI	Restaurant Bieberbau	4.6	Durlacher Str. 15, 10715 Berlin, Germany	52.4795579999999973	13.3337749999999993	{restaurant,food,point_of_interest,establishment}	http://www.bieberbau-berlin.de/	Berlin
174	Restaurants Berlin	ChIJA-K5lEpQqEcRHGv7ScsVIXs	FACIL	4.7	Potsdamer Straße 3, 10785 Berlin, Germany	52.5089923000000027	13.3735698999999997	{restaurant,food,point_of_interest,establishment}	http://www.facil.de/	Berlin
175	Restaurants Berlin	ChIJo1XeYcNRqEcRQUhUnA5jei0	Vapiano	3.7	Mittelstraße 51-52, 10117 Berlin, Germany	52.5177181999999974	13.3877638000000001	{bar,restaurant,food,point_of_interest,establishment}	http://de.vapiano.com/	Berlin
173	Restaurants Berlin	ChIJ7zM0jORQqEcRm1bUReSc7jg	Marjellchen	4.5	Mommsenstraße 9, 10629 Berlin, Germany	52.5033270999999999	13.3174603000000005	{restaurant,food,point_of_interest,establishment}	http://www.marjellchen-berlin.de/	Berlin
179	Restaurants Berlin	ChIJzxxz9eVRqEcRX2oG338jQnY	Bandol sur mer	4.7	Torstraße 167, 10115 Berlin, Germany	52.5291384000000008	13.3954536999999991	{restaurant,food,point_of_interest,establishment}	http://www.bandolsurmer.de/	Berlin
180	Restaurants Berlin	ChIJ_TKDVR1RqEcRT9IwLcIi54M	Restaurant Belmondo	4.5	Knesebeckstraße 93, 10623 Berlin, Germany	52.5089690999999874	13.3231295000000003	{restaurant,food,point_of_interest,establishment}	http://www.belmondo-berlin.de/	Berlin
177	Restaurants Berlin	ChIJ-RAVYVVQqEcRIfxE6EjRZ38	NENI Berlin	4.1	Budapester Str. 40, 10787 Berlin, Germany	52.5056194999999875	13.3379601999999995	{restaurant,food,point_of_interest,establishment}	http://www.neniberlin.de/	Berlin
172	Restaurants Berlin	ChIJFzdp_yVRqEcRdNaNUQEKUo4	Restaurant Schlossgarten	4.5	Schloßstraße 64, 14059 Berlin, Germany	52.5175582000000034	13.2968340000000005	{bar,restaurant,food,point_of_interest,establishment}	http://www.restaurant-schlossgarten-berlin.de/	Berlin
166	Restaurants Berlin	ChIJl8laNkNOqEcR_cP9hIHMPlE	Restaurant Trattoria Portofino	4.6	Gubener Str. 48, 10243 Berlin, Germany	52.5123259999999874	13.4484210999999991	{restaurant,food,point_of_interest,establishment}	http://www.portofino-trattoria.de/	Berlin
182	Restaurants Berlin	ChIJp7DT1P5QqEcRlOEokgsLn2I	Restaurant Le Faubourg	4.6	Augsburger Str. 41, 10789 Berlin, Germany	52.5024884999999983	13.3318376999999995	{restaurant,food,point_of_interest,establishment}	http://lefaubourg.berlin/de/	Berlin
163	Restaurants Berlin	ChIJ_7T13OtRqEcRykkW1_-ATbc	Restaurant einsunternull - Berlin Mitte	3.8	Hannoversche Str. 1, 10115 Berlin, Germany	52.5272158000000005	13.3860039000000004	{restaurant,food,point_of_interest,establishment}	https://restaurant-einsunternull.de/	Berlin
169	Restaurants Berlin	ChIJrS9fEc1RqEcRB6-zG6cPQwg	Mövenpick Restaurant Berlin	4	Schöneberger Str. 3, 10963 Berlin, Germany	52.5037400000000005	13.3805029999999991	{restaurant,food,point_of_interest,establishment}	https://www.movenpick.com/en/europe/germany/berlin/hotel-berlin/restaurants/restaurants/movenpick-restaurant/?utm_source=google&utm_medium=local&utm_campaign=GLocal+movenpick-berlin-rest	Berlin
195	Restaurants Berlin	ChIJCUmw4MpPqEcRjuEofFrRt0M	Cocolo Ramen X-berg	4.5	Paul-Lincke-Ufer 39-40, 10999 Berlin, Germany	52.4960862999999875	13.4225004999999999	{restaurant,food,point_of_interest,establishment}	https://kuchi.de/restaurant/cocolo-x-berg/	Berlin
221	Restaurants Bratislava	ChIJbVIANl2JbEcRaMXvZmtVfiI	RE:FRESH music club & restaurant	4.3	Ventúrska 267/5, 811 01 Staré Mesto, Slovakia	48.1426876000000021	17.1064076000000007	{bar,restaurant,food,point_of_interest,establishment}	http://www.refreshclub.sk/	Bratislava
181	Restaurants Berlin	ChIJGR731G5OqEcREDS5JjkECzI	Restaurant Langosch	4.7	Petersburger Pl. 1, 10249 Berlin, Germany	52.5217883999999984	13.4494743000000003	{restaurant,food,point_of_interest,establishment}	http://www.langosch-berlin.de/	Berlin
167	Restaurants Berlin	ChIJUeRii4NZqEcRtLpxt5vRh44	Ristorante "La Gondola Due" ein Restaurant am Mexikoplatz in Zehlendorf	4.2	Beerenstraße 57, 14163 Berlin, Germany	52.4377739999999974	13.2335060000000002	{restaurant,food,point_of_interest,establishment}	http://www.lagondoladue.de/	Berlin
222	Restaurants Bratislava	ChIJfytFhmeJbEcRNhbhgoARMdw	Modrá Hviezda	4.5	Beblavého 292/14, 811 01 Bratislava - Staré Mesto-Bratislava, Slovakia	48.1416630000000012	17.1033389999999983	{restaurant,food,point_of_interest,establishment}	http://modrahviezda.sk/	Bratislava
218	Restaurants Bratislava	ChIJz3amHlCJbEcRE0q8uEcBzw8	Savage Garden Restaurant	4.4	Námestie slobody, 811 06 Staré Mesto, Slovakia	48.1517358999999985	17.1120911999999983	{restaurant,food,point_of_interest,establishment}	http://www.savagegarden.sk/	Bratislava
219	Restaurants Bratislava	ChIJIQQQpkSJbEcRwMZhetaQ-QA	Bratislava Flagship Restaurant	4.2	8, Námestie SNP, 811 02 Bratislava, Slovakia	48.1460324000000028	17.1102032000000008	{restaurant,food,point_of_interest,establishment}	http://www.bratislavskarestauracia.sk/	Bratislava
220	Restaurants Bratislava	ChIJU7C49UGJbEcRVNrVrq8jKSA	Houdini Restaurant	4.7	Tobrucká 6953/4, 811 02 Bratislava, Slovakia	48.1413603000000023	17.1134859000000006	{restaurant,food,point_of_interest,establishment}	http://www.restauranthoudini.sk/sk	Bratislava
223	Restaurants Bratislava	ChIJuUI2n1CJbEcRdCHmojIQxSk	FABRIKA the beer pub	4.5	Štefánikova 4, 811 05 Staré Mesto, Slovakia	48.1518038999999973	17.1071801000000008	{restaurant,food,point_of_interest,establishment}	http://www.fabrikapub.sk/	Bratislava
249	Restaurants London	ChIJHbMkxMsEdkgR_kMYC-OnZfE	STK London	3.7	ME London Hotel, 336-337 Strand, London WC2R 1HA, UK	51.5119231999999982	-0.118730699999999995	{night_club,bar,restaurant,food,point_of_interest,establishment}	http://togrp.com/restaurant/stk-london/	London
246	Restaurants London	ChIJOUVNPtUadkgR0ShMpQb11NQ	Leon Regent Street	4.2	275 Regent St, Marylebone, London W1B 2HB, UK	51.5160614999999993	-0.142513699999999993	{cafe,store,restaurant,food,point_of_interest,establishment}	https://leon.co/restaurants/regent-street/	London
247	Restaurants London	ChIJydjklNQEdkgRRkTHmCM_92o	Hakkasan Mayfair	4.4	17 Bruton St, Mayfair, London W1J 6QB, UK	51.5102647000000005	-0.145000500000000004	{restaurant,food,point_of_interest,establishment}	http://hakkasan.com/locations/hakkasan-mayfair	London
250	Restaurants London	ChIJP1Z1gkQFdkgRsyjCnpNoYsM	Ognisko Restaurant	4.6	55 Exhibition Rd, Knightsbridge, London SW7 2PN, UK	51.4990720999999994	-0.174051199999999989	{bar,restaurant,food,point_of_interest,establishment}	http://www.ogniskorestaurant.co.uk/	London
248	Restaurants London	ChIJFzGzzMwadkgRaJ41AFeypBo	Texture Restaurant	4.4	34 Portman St, Marylebone, London W1H 7BY, UK	51.5149049999999988	-0.156715999999999994	{restaurant,bar,food,point_of_interest,establishment}	http://www.texture-restaurant.co.uk/	London
257	Restaurants Paris	ChIJ64SRn-xv5kcRH7AlSsBFASQ	Restaurant Guy Savoy	4.5	Monnaie de Paris, 11 Quai de Conti, 75006 Paris, France	48.8566748999999874	2.33903820000000007	{restaurant,food,point_of_interest,establishment}	http://www.guysavoy.com/	Paris
258	Restaurants Paris	ChIJqTQzIehv5kcRaF3hD1SzX5A	Le Cinq	4.5	31 Avenue George V, 75008 Paris, France	48.8687942999999976	2.3002056999999998	{bar,restaurant,food,point_of_interest,establishment}	https://www.restaurant-lecinq.com/	Paris
259	Restaurants Paris	ChIJn82-Depv5kcRbitLK3lP0Bg	Pierre Gagnaire	4.4	6 Rue Balzac, 75008 Paris, France	48.8732784999999978	2.30041740000000017	{restaurant,food,point_of_interest,establishment}	http://www.pierre-gagnaire.com/	Paris
260	Restaurants Paris	ChIJqTnaAiNu5kcRQsRFgf8qeoA	Restaurant Kei	4.5	5 Rue Coq Héron, 75001 Paris, France	48.8643574000000029	2.34207810000000016	{bar,restaurant,food,point_of_interest,establishment}	http://www.restaurant-kei.fr/	Paris
261	Restaurants Paris	ChIJA1PHDM9v5kcRsdD0Snjw06k	Restaurant Le Gabriel	4.5	42 Avenue Gabriel, 75008 Paris, France	48.8697627999999966	2.3132849000000002	{restaurant,food,point_of_interest,establishment}	http://www.lareserve-paris.com/fr/hotel-5-etoile-paris-palace/presentation/restaurant-gastronomique/restaurant-le-gabriel/?utm_source=google&utm_medium=local&utm_campaign=gabriel	Paris
262	Restaurants Paris	ChIJUSQArsxx5kcRkXkXnCMYUlU	Le Ciel de Paris Restaurant	4	Tour Maine Montparnasse, 56ème étage Tour Maine Montparnasse, Avenue du Maine, 75015 Paris, France	48.8421469999999971	2.3221210000000001	{restaurant,food,point_of_interest,establishment}	http://www.cieldeparis.com/	Paris
263	Restaurants Paris	ChIJKxMjwtFv5kcReqXVhl1jp3o	Pavillon Ledoyen, Alléno Paris	4.1	8 Avenue Dutuit, 75008 Paris, France	48.8660909999999973	2.31646000000000019	{bar,restaurant,food,point_of_interest,establishment}	http://www.yannick-alleno.com/	Paris
280	Restaurants Barcelona	ChIJr05z0uyipBIR2P_c0PsSW2g	9 Reinas	4.5	Carrer de València, 267, 08007 Barcelona, Spain	41.3940210000000022	2.1648550000000002	{restaurant,food,point_of_interest,establishment}	http://www.nuevereinas.com/	Barcelona
281	Restaurants Barcelona	ChIJO9Q5t1-ipBIR6j1w_MTknys	Cera 23	4.5	Carrer de la Cera, 23, 08001 Barcelona, Spain	41.3789352000000079	2.16625049999999986	{bar,restaurant,food,point_of_interest,establishment}	http://www.cera23.com/	Barcelona
282	Restaurants Barcelona	ChIJA-c18FeipBIRw8n-UGwjVLk	Bodega Biarritz 1881	4.5	Carrer del Vidre, 8, 08002 Barcelona, Spain	41.3797694000000007	2.17619749999999978	{bar,restaurant,food,point_of_interest,establishment}	\N	Barcelona
283	Restaurants Barcelona	ChIJXfV1uGGipBIRSopphqMrZzI	Restaurante Rokelin Taberna Gourmet Barcelona	4.6	Carrer Comte d'Urgell, 7, 08011 Barcelona, Spain	41.3797146000000069	2.16151030000000022	{restaurant,bar,food,point_of_interest,establishment}	http://www.rokelingourmet.com/	Barcelona
284	Restaurants Barcelona	ChIJU_9ByfWipBIRsd7JEThKbVo	Restaurant en Ville	4.4	Carrer del Dr. Dou, 14, 08001 Barcelona, Spain	41.3829429999999974	2.16854499999999994	{restaurant,food,point_of_interest,establishment}	http://www.envillebarcelona.es/	Barcelona
285	Restaurants Barcelona	ChIJqxlH04SipBIRlCYTR11AFsw	Sindur Indian Restaurant	4.2	Carrer de Còrsega, nº 211, bajo, 08036 Barcelona, Spain	41.3912320000000022	2.15214799999999995	{meal_takeaway,restaurant,food,point_of_interest,establishment}	http://www.sindur-restaurant.com/	Barcelona
286	Restaurants Barcelona	ChIJfYU2UqCipBIR8nMtzXmXsPI	Blavis, racó gastronòmic	4.8	Carrer de Saragossa, 85, 08006 Barcelona, Spain	41.4033072000000004	2.14720760000000022	{restaurant,food,point_of_interest,establishment}	http://www.restaurantblavis.com/	Barcelona
304	Restaurants Budapest	ChIJRyXXtz_cQUcRCMKssHfG4Gw	Paris Budapest Restaurant	4.5	Budapest, Széchenyi István tér 2, 1051 Hungary	47.4982450999999983	19.0480173999999991	{restaurant,cafe,bar,food,point_of_interest,establishment}	http://www.parisbudapest.hu/	Budapest
305	Restaurants Budapest	ChIJ3RoY0UDcQUcRhPGqm4BY_GY	Comme Chez Soi	4.7	Budapest, Aranykéz u. 2, 1051 Hungary	47.4944389999999999	19.0513009999999987	{restaurant,food,point_of_interest,establishment}	http://www.commechezsoi.hu/	Budapest
306	Restaurants Budapest	ChIJEUU-GBTcQUcRxQJmcRunViM	Hungarikum Bistro	4.7	Budapest, Steindl Imre u. 13, 1051 Hungary	47.5035689999999988	19.0479209999999988	{restaurant,food,point_of_interest,establishment}	http://www.hungarikumbisztro.hu/	Budapest
307	Restaurants Budapest	ChIJHaogBundQUcRQsnwln41kgA	Don Pepe Menyecske	4.5	Budapest, Menyecske u. 15, 1112 Hungary	47.4618651999999983	19.0157005999999988	{restaurant,food,point_of_interest,establishment}	http://www.donpepe.hu/	Budapest
308	Restaurants Budapest	ChIJ0VFRh4fbQUcRBU84dpjZVug	Városliget Café	4.3	Budapest, Olof Palme stny. 6, 1146 Hungary	47.5146099999999976	19.0797811000000017	{restaurant,food,point_of_interest,establishment}	http://www.varosligetcafe.hu/	Budapest
309	Restaurants Budapest	ChIJ0yTvOB7cQUcRgUfaTSWWQew	Arany Kaviár Étterem	4.7	Budapest, Ostrom u. 19, 1015 Hungary	47.5063620000000029	19.0285629999999983	{restaurant,food,point_of_interest,establishment}	http://www.aranykaviar.hu/	Budapest
328	Restaurants Sofia	ChIJXce1bnGFqkARvZOMMf-74v8	"Architect's Club" Restaurant, "Klub na Arhitecta"	4.4	Ulitsa Krakra 11, улица Кракра 11, ul. "Krakra", 1000 Sofia, Bulgaria	42.6932443999999975	23.3371290999999985	{restaurant,food,point_of_interest,establishment}	\N	Sofia
329	Restaurants Sofia	ChIJtUGa7XWFqkARu6VWA0y7gLM	Ресторант Грозд / Grozd Restaurant	4.4	Sofia, bul. Tsar Osvoboditel 21, Bulgaria	42.6918827999999877	23.3363808000000006	{restaurant,food,point_of_interest,establishment}	http://grozd.bg/	Sofia
330	Restaurants Sofia	ChIJxzzfW22FqkAR5qXe5_oF1ho	Niko'las 0/360	4.5	pl. "Rayko Daskalov" 3, 1000 Sofia Center, Sofia, Bulgaria	42.6920283999999981	23.3226426999999994	{restaurant,food,point_of_interest,establishment}	http://nikolas.bg/	Sofia
331	Restaurants Sofia	ChIJp2LeeHiFqkARGm-_KVwH1PI	Rakia Raketa Bar	4.6	bul. "Yanko Sakazov" 17, 1527 Sofia Center, Sofia, Bulgaria	42.6982980000000012	23.3419542	{restaurant,food,point_of_interest,establishment}	https://www.facebook.com/RaketaRakiaBar/	Sofia
332	Restaurants Sofia	ChIJ9Z1Vr3OFqkARkrqAOi1Vy6I	Checkpoint Charly	4.4	Ulitsa Ivan Vazov 12, улица Иван Вазов 12, Sofia, Bulgaria	42.6927864000000028	23.3279217999999986	{restaurant,food,point_of_interest,establishment}	http://www.checkpointcharlybg.com/	Sofia
333	Restaurants Sofia	ChIJh--2gnSFqkARJG1eZeMKOjo	Skaptoburger	4.5	ul. "Tsar Shishman" 20, 1000 Sofia Center, Sofia, Bulgaria	42.6914773000000025	23.3297965000000005	{bar,restaurant,food,point_of_interest,establishment}	http://www.skaptoburger.com/	Sofia
377	Bars Berlin	ChIJI8NDzcNRqEcReDAkOOA6Big	Tausend	4.2	Schiffbauerdamm 11, 10117 Berlin, Germany	52.5208261000000007	13.3848722000000002	{bar,restaurant,food,point_of_interest,establishment}	http://www.tausendberlin.com/	Berlin
365	Bars Amsterdam	ChIJURBoMegJxkcRsoklFKxZZv8	Spijker Bar Amsterdam	4.6	Kerkstraat 4, 1017 GL Amsterdam, Netherlands	52.366222999999998	4.88395899999999994	{bar,point_of_interest,establishment}	http://www.spijkerbar.nl/	Amsterdam
372	Bars Amsterdam	ChIJI6To278JxkcRlwn8IMotzLA	Mulligans Irish Music Bar	4.5	Amstel 100, 1017 AC Amsterdam, Netherlands	52.3669632999999877	4.89675849999999979	{bar,restaurant,food,point_of_interest,establishment}	http://www.mulligans.nl/	Amsterdam
366	Bars Amsterdam	ChIJw0-tDsAJxkcR7duHFlAm7K8	Freddy's Bar	4.4	Nieuwe Doelenstraat 2-14, 1012 AC Amsterdam, Netherlands	52.367518699999998	4.89430560000000003	{bar,point_of_interest,establishment}	http://www.deleurope.com/nl/restaurant-bars/freddy-s-bar/57-3/	Amsterdam
369	Bars Amsterdam	ChIJFcPp27gJxkcR5PemrVeFrPQ	Café Remember	4.2	Oudezijds Achterburgwal 81, 1012 DC Amsterdam, Netherlands	52.3727773999999968	4.89844209999999958	{bar,cafe,food,point_of_interest,establishment}	\N	Amsterdam
367	Bars Amsterdam	ChIJswl2sOoJxkcR8VOtTz4vkB0	Door 74	4.4	Reguliersdwarsstraat 74, 1017 BN Amsterdam, Netherlands	52.365918299999997	4.89355829999999958	{bar,point_of_interest,establishment}	http://www.door-74.com/	Amsterdam
371	Bars Amsterdam	ChIJu6iZ7g4JxkcRK54QA7mfGQU	Amsterdam Roest	4.4	Jacob Bontiusplaats 1, 1018 LL Amsterdam, Netherlands	52.3719672999999872	4.92656209999999994	{bar,art_gallery,restaurant,food,point_of_interest,establishment}	https://www.amsterdamroest.nl/	Amsterdam
368	Bars Amsterdam	ChIJu57So50JxkcRMoFn_kdLWPI	Henry's Bar	4.6	Oosterpark 11, 1092 AE Amsterdam, Netherlands	52.3579954000000001	4.9177957000000001	{bar,point_of_interest,establishment}	http://www.henrysbar.nl/	Amsterdam
370	Bars Amsterdam	ChIJgaSvq-4JxkcRI70fbIA7jkU	Chupitos Amsterdam	3.9	Zieseniskade 25, 1017 RT Amsterdam, Netherlands	52.3616144000000006	4.88643800000000006	{bar,point_of_interest,establishment}	http://www.chupitos.nl/	Amsterdam
373	Bars Amsterdam	ChIJMzqLEIsJxkcR2ZTRVcFRHDU	Twenty Third Bar	4.4	Ferdinand Bolstraat 333, 1072 LH Amsterdam, Netherlands	52.3487036000000003	4.89393010000000039	{bar,point_of_interest,establishment}	https://www.okura.nl/en/culinary/twenty-third-bar/	Amsterdam
374	Bars Amsterdam	ChIJdVfGncQJxkcRiHJvkmH1SAg	Pulitzer's Bar	4.6	Pulitzers Bar, Keizersgracht 234, 1016 DZ Amsterdam, Netherlands	52.3726334999999992	4.88447370000000003	{bar,point_of_interest,establishment}	http://www.pulitzersbar.nl/	Amsterdam
375	Bars Amsterdam	ChIJq00aTRMJxkcRUEqhq0iFE6w	BAR JOOST	4.6	Molukkenstraat 33, 1095 AT Amsterdam, Netherlands	52.3649281000000002	4.9397354	{bar,point_of_interest,establishment}	http://joost-amsterdam.nl/	Amsterdam
387	Bars Berlin	ChIJ-RAVYVVQqEcRPZ3e-XXyPbg	Monkey Bar	4.1	Budapester Str. 40, 10787 Berlin, Germany	52.5057199999999966	13.3377599999999994	{bar,point_of_interest,establishment}	http://www.monkeybarberlin.de/	Berlin
388	Bars Berlin	ChIJt4cTU-RRqEcRw3f8ubaEYrM	BonBon Bar Berlin	4.1	Torstraße 133, 10119 Berlin, Germany	52.5297002000000006	13.3997896999999995	{bar,point_of_interest,establishment}	http://www.bonbonbar.de/	Berlin
389	Bars Berlin	ChIJtWjVRWBOqEcRI1KF-iJRoQM	minimal Bar	4.3	Rigaer Str. 31, 10247 Berlin, Germany	52.5164299999999997	13.4640234999999997	{bar,night_club,restaurant,food,point_of_interest,establishment}	http://www.minimal-berlin.de/	Berlin
385	Bars Berlin	ChIJpwXWitpRqEcRHpfpheSjeco	Newton Bar	3.8	Charlottenstraße 57, 10117 Berlin, Germany	52.5129659999999987	13.391095	{bar,point_of_interest,establishment}	http://www.newton-bar.de/	Berlin
386	Bars Berlin	ChIJE5WVYF5OqEcRuGjHsF0APUI	booze bar berlin	4.4	Boxhagener Str. 105, 10245 Berlin, Germany	52.5127655000000004	13.4588289999999997	{bar,point_of_interest,establishment}	http://www.booze-bar.de/	Berlin
390	Bars Berlin	ChIJl9nitgBSqEcRl9a6_SO8DZA	Badfish Bar	4.5	Stargarder Str. 14, 10437 Berlin, Germany	52.5465719999999976	13.4176365999999998	{bar,point_of_interest,establishment}	http://www.badfishbarberlin.com/	Berlin
391	Bars Berlin	ChIJ4ydW9ONRqEcRZwmVCvnWq4k	AMANO Bar	4.1	Auguststraße 43, 10119 Berlin, Germany	52.5282479999999978	13.4028749999999999	{bar,point_of_interest,establishment}	https://www.amanogroup.de/de/eat-and-drink/amano-bar/	Berlin
392	Bars Berlin	ChIJH5OuJlBQqEcRvRTFBGWF4Ss	Tom's Bar	2.9	Motzstraße 19, 10777 Berlin, Germany	52.4980311000000128	13.3493770000000005	{bar,point_of_interest,establishment}	http://www.tomsbar.de/	Berlin
217	Restaurants Bratislava	ChIJV9DyHWiJbEcRFpqJA42X3c4	Lemontree & Sky Bar Restaurant Bratislava	4.5	Hviezdoslavovo námestie 7, 811 02 Bratislava, Slovakia	48.1410429000000022	17.1073687999999997	{bar,restaurant,food,point_of_interest,establishment}	http://www.spicy.sk/	Bratislava
421	Bars London	ChIJLYvxD7ccdkgRdKK7Juzv_cU	London Cocktail Club	4.2	29 Sclater St, London E1 6HR, UK	51.5236852999999968	-0.0730163999999999952	{bar,point_of_interest,establishment}	http://www.londoncocktailclub.co.uk/shoreditch	London
412	Bars Bratislava	ChIJxfZ721yJbEcRGF4mSBHkLas	Michalska Cocktail Room	4.7	Michalská 370/5, 811 01 Bratislava, Slovakia	48.1444284999999965	17.106617700000001	{bar,point_of_interest,establishment}	http://www.cocktailroom.sk/	Bratislava
418	Bars London	ChIJ7wM2vM0adkgRvNFhM7Kgj-M	Purl London	4.2	50-54 Blandford St, Marylebone, London W1U 7HX, UK	51.5184670000000011	-0.154427000000000009	{night_club,bar,food,point_of_interest,establishment}	http://www.purl-london.com/	London
407	Bars Bratislava	ChIJ8aO0v1uJbEcRmOyT2YIxRm4	VRBA - The Virtual Reality and Gin&Tonic Bar	4.9	Panenská 675/23, 811 03 Bratislava, Slovakia	48.1481081000000017	17.1049894000000009	{bar,cafe,food,point_of_interest,establishment}	https://vrbratislava.sk/	Bratislava
413	Bars Bratislava	ChIJFfTNvUGJbEcRgDnp8SgZSRc	Nu spirit club	3.9	Štúrova 19/3, 811 02 Bratislava, Slovakia	48.1436788999999976	17.1133316999999998	{night_club,bar,point_of_interest,establishment}	\N	Bratislava
408	Bars Bratislava	ChIJpQn73kSJbEcR3yUA9D7nfR4	KGB	4	Obchodná 530/52, 811 06 Staré Mesto, Slovakia	48.1480585999999988	17.1117081000000013	{restaurant,bar,food,point_of_interest,establishment}	http://www.kgbpub.sk/	Bratislava
409	Bars Bratislava	ChIJ2TNrME-JbEcRq6EncrwLnwQ	Papichulo	4.2	Americké námestie 1, 811 07 Bratislava, Slovakia	48.1515646999999873	17.1184457999999999	{bar,point_of_interest,establishment}	https://m.facebook.com/pg/papichuloclub/about/?mt_nav=1	Bratislava
410	Bars Bratislava	ChIJdT4le12JbEcRgfMpzRNlUtU	At The Devil's	4.2	Beblavého 286/2, 811 01 Bratislava - Staré Mesto-Staré Mesto, Slovakia	48.1422369000000003	17.1038215999999998	{bar,point_of_interest,establishment}	\N	Bratislava
414	Bars Bratislava	ChIJreZcqEOJbEcRTcIefd_sq0w	Old Fashioned Bar	4.7	Laurinská 214/14, 811 01 Bratislava, Slovakia	48.1436369999999982	17.1111511000000007	{bar,point_of_interest,establishment}	http://www.oldfashioned.sk/	Bratislava
411	Bars Bratislava	ChIJc5ZUQUuJbEcRntrQI3rDO18	Bastion pub	3.8	Šancová 112, 831 04 Bratislava, Slovakia	48.1577095999999969	17.1266998000000008	{bar,point_of_interest,establishment}	http://www.bastion.sk/pub/	Bratislava
415	Bars Bratislava	ChIJ2fcOKV2JbEcRJwbRIgdaLBI	Lochness Scottish Pub	3.9	Sedlárska 361/4, 811 01 Bratislava, Slovakia	48.1436942999999999	17.1068916000000009	{bar,point_of_interest,establishment}	http://www.lochnesspub.sk/	Bratislava
419	Bars London	ChIJ0eXrm7gEdkgR8muMXU0OQnU	Primo Bar	4.1	200 Westminster Bridge Rd, Lambeth, London SE1 7UT, UK	51.5007963999999987	-0.116691699999999995	{bar,restaurant,food,point_of_interest,establishment}	http://www.primobar.co.uk	London
416	Bars Bratislava	ChIJM78z3EaJbEcR0UXvYJfwUSg	Black King Bar	4.5	14 7495, Dunajská, 811 08 Bratislava, Slovakia	48.144576200000003	17.1153981000000002	{bar,point_of_interest,establishment}	\N	Bratislava
417	Bars London	ChIJZf-9xMsEdkgR4XwD4KrrapI	Radio Rooftop Bar	3.5	336-337 Strand, London WC2R 1HA, UK	51.512029400000003	-0.118424799999999997	{bar,restaurant,food,point_of_interest,establishment}	http://radiorooftop.com/london/	London
420	Bars London	ChIJP-efSFIbdkgRnCF-jDmn864	Oriole Bar	4.7	E Poultry Ave, London EC1A 9LH, UK	51.5188654999999969	-0.1027917	{bar,point_of_interest,establishment}	http://www.oriolebar.com/	London
435	Bars London	ChIJUxr1LzUFdkgRfTjh55DdrMA	Salt Whisky Bar and Dining Room	3.9	82 Seymour St, London W2 2JB, UK	51.5142529999999965	-0.161920299999999989	{bar,restaurant,food,point_of_interest,establishment}	http://www.saltbar.com/	London
436	Bars London	ChIJSWvAzM4EdkgRaZcCMhRbk0Q	Gordon's Wine Bar	4.6	47 Villiers St, London WC2N 6NE, UK	51.5079439999999877	-0.123313999999999993	{bar,food,point_of_interest,establishment}	https://gordonswinebar.com/	London
431	Bars London	ChIJy0LEsekEdkgRQLe5NqSQlEc	London Sky Bar	4.1	Millbank Tower, 30 Millbank, Westminster, London SW1P 4QP, UK	51.4923167999999976	-0.125931500000000002	{bar,point_of_interest,establishment}	https://www.londonskybar.com/	London
441	Bars Paris	ChIJRS81ac1v5kcRRUqQBmTTJJU	Buddha-Bar	4	8-12 Rue Boissy d'Anglas, 75008 Paris, France	48.8679044000000005	2.32136209999999998	{night_club,bar,restaurant,food,point_of_interest,establishment}	http://www.buddhabar.com/	Paris
432	Bars London	ChIJO0XFnMocdkgRmDRtSGZl9Zc	Apples & Pears Bar	4.3	26 Osborn St, London E1 6TD, UK	51.5169501000000025	-0.0701142999999999905	{bar,point_of_interest,establishment}	http://www.applesandpearsbar.com/?utm_source=local&utm_medium=organic&utm_campaign=gmb	London
437	Bars Paris	ChIJM-ADfvht5kcRAJ2_lD4T3b8	The Bootleg Bar	4.2	55 Rue de la Roquette, 75011 Paris, France	48.8560315999999872	2.3754824000000001	{bar,point_of_interest,establishment}	http://thebootlegbar.com/	Paris
433	Bars London	ChIJ4Zux69cEdkgRnOI8imIzgD4	DUKES Bar	4.6	35 St James's Pl, St. James's, London SW1A 1NY, UK	51.5055633999999998	-0.139560999999999991	{bar,restaurant,food,point_of_interest,establishment}	https://www.dukeshotel.com/dukes-bar/	London
434	Bars London	ChIJRXCcCSsbdkgRgz_JS3hiJ20	The Purple Bar	4.2	50 Berners St, Fitzrovia, London W1T 3NG, UK	51.5174737999999977	-0.137210899999999997	{bar,point_of_interest,establishment}	https://www.morganshotelgroup.com/originals/originals-sanderson-london/eat-drink/purple-bar	London
438	Bars Paris	ChIJu0Sg-TBu5kcRUIDfQSE4_yw	Harry's New York Bar	4.3	5 Rue Daunou, 75002 Paris, France	48.869201799999999	2.33206880000000005	{bar,point_of_interest,establishment}	http://harrysbar.fr/fr/	Paris
442	Bars Paris	ChIJLx3vonpu5kcRlCJWb55M0vw	Ice Kube Bar	4	5 Passage Ruelle, 75018 Paris, France	48.8865206999999984	2.35881000000000007	{bar,point_of_interest,establishment}	http://www.kubehotel-paris.com/	Paris
439	Bars Paris	ChIJyYqShB5u5kcRVDMsEkL-AKw	O'Sullivans Rebel Bar	4	10 Rue des Lombards, 75004 Paris, France	48.8591880000000032	2.34984390000000021	{bar,restaurant,food,point_of_interest,establishment}	http://www.osullivans-pubs.com/	Paris
440	Bars Paris	ChIJeTyR_Btu5kcREaNm-C72THg	Bar Demory Paris	4.1	62 Rue Quincampoix, 75004 Paris, France	48.8616670999999982	2.35087510000000011	{bar,point_of_interest,establishment}	http://www.demoryparis.com/	Paris
443	Bars Paris	ChIJq-XFUR9u5kcRgSahYxl9IhE	Velvet Bar Paris	4.5	43 Rue Saint Honoré, 75001 Paris, France	48.8608033999999876	2.3454499000000002	{night_club,bar,point_of_interest,establishment}	http://www.velvet-bar.fr/	Paris
451	Bars Paris	ChIJpZXu3i1u5kcRidACoPLI1g4	Bar 228	4.7	228 Rue de Rivoli, 75011 Paris, France	48.8653276999999875	2.32812790000000014	{bar,point_of_interest,establishment}	http://www.lemeurice.com/	Paris
452	Bars Paris	ChIJV9nlWAxu5kcRM9aGsVh7bVo	Gravity Bar	4.3	44 Rue des Vinaigriers, 75010 Paris, France	48.8732518999999996	2.3607939	{bar,point_of_interest,establishment}	\N	Paris
454	Bars Paris	ChIJWZFcKs9v5kcRpPtQJY0Kn6k	Le Bar du Bristol	4.6	Hôtel Le Bristol Paris, 112 Rue du Faubourg Saint-Honoré, 75008 Paris, France	48.8717231999999981	2.31482060000000001	{bar,point_of_interest,establishment}	https://www.oetkercollection.com/fr/destinations/le-bristol-paris/restaurants-et-bar/bar/le-bar-du-bristol/	Paris
455	Bars Paris	ChIJuTLUNMJv5kcR8y5GJgHUgDA	Ladurée Paris Le Bar	4.2	13 Rue Lincoln, 75008 Paris, France	48.8705764999999985	2.30299779999999998	{bar,bakery,store,restaurant,food,point_of_interest,establishment}	https://www.laduree.fr/laduree-paris-le-bar.html	Paris
456	Bars Paris	ChIJY5aj1Rlu5kcRjAbdhqjInIg	Experimental Cocktail Club	4.3	37 Rue Saint-Sauveur, 75002 Paris, France	48.8660639999999873	2.34826099999999993	{bar,point_of_interest,establishment}	http://www.experimentalevents.com/paris/	Paris
471	Bars Barcelona	ChIJWdOcfO2ipBIRjRq8O0tzdOA	Banker's Bar	4	Passeig de Gràcia, 38-40, 08007 Barcelona, Spain	41.3913062000000025	2.16661329999999985	{bar,night_club,point_of_interest,establishment}	https://www.mandarinoriental.com/barcelona/passeig-de-gracia/fine-dining/bars/bankers-bar?kw=MOBCN_bankers&htl=MOBCN&eng=google&src=local	Barcelona
466	Bars Barcelona	ChIJvUwtvv6ipBIRe_3EL5x__cU	Rubí Bar	4.5	Carrer dels Banys Vells, 6, 08003 Barcelona, Spain	41.3845634999999987	2.18046430000000013	{bar,restaurant,food,point_of_interest,establishment}	https://www.facebook.com/RubiBarRestaurant/	Barcelona
469	Bars Barcelona	ChIJxfUkvfaipBIRLCAVdkTWxMw	Boadas Cocteleria	4.4	Carrer dels Tallers, 1, 08001 Barcelona, Spain	41.384664800000003	2.17027020000000004	{bar,night_club,point_of_interest,establishment}	http://www.boadascocktails.com/	Barcelona
467	Bars Barcelona	ChIJCdF8lfGipBIRKlSbQyUaBHI	Bonavida	4.1	Carrer de Casp, 22, 08010 Barcelona, Spain	41.3894372000000033	2.17080250000000019	{bar,restaurant,food,point_of_interest,establishment}	http://www.bonavidabcn.com/	Barcelona
468	Bars Barcelona	ChIJ424AZP-ipBIR-zbPEhbMRQs	Sor Rita Bar	4.3	Carrer de la Mercè, 27, 08002 Barcelona, Spain	41.3809340000000034	2.18085240000000002	{bar,point_of_interest,establishment}	http://www.sorritabar.es/	Barcelona
470	Bars Barcelona	ChIJ5_8SapSipBIRQkiXvYQHOmA	Bar Mut	3.7	Carrer de Pau Claris, 192, 08037 Barcelona, Spain	41.3973370000000003	2.16130500000000003	{bar,restaurant,food,point_of_interest,establishment}	http://www.barmut.com/	Barcelona
472	Bars Barcelona	ChIJcVteKmeipBIR7d2YPLurPek	Bitter Cocktail Bar	4.4	Carrer de Viladomat, 17, 08015 Barcelona, Spain	41.3757737999999975	2.16230019999999978	{bar,restaurant,food,point_of_interest,establishment}	http://bitter-bar.com/	Barcelona
490	Bars Budapest	ChIJkaD3aGncQUcRoEcntPpnrW8	Kadarka Wine Bar	4.5	Budapest, Király u. 42, 1061 Hungary	47.5010209999999873	19.0612490000000001	{bar,liquor_store,store,food,point_of_interest,establishment}	http://kadarkawinebar.com/	Budapest
486	Bars Budapest	ChIJN_GX2mncQUcRaCCZS_2vzg0	Doblo Wine Bar	4.5	Budapest, Dob u. 20, 1072 Hungary	47.4980988000000011	19.0609816000000016	{bar,point_of_interest,establishment}	http://www.budapestwine.com/	Budapest
494	Bars Budapest	ChIJOfkzKG_cQUcRdyOGX60YjA0	SZIMPLA CAFÉ / CRAFT BEER BAR	4.1	Budapest, Kertész u. 48, 1073 Hungary	47.5023347999999999	19.0648619000000004	{bar,point_of_interest,establishment}	http://www.szimpla.hu/szimpla-kert/terkep/rolunk	Budapest
487	Bars Budapest	ChIJsVhaZ2rcQUcRKwcAvDWu85s	Boutiq Bar	4.6	Budapest, Paulay Ede u. 5, 1061 Hungary	47.4995674999999977	19.056045000000001	{bar,point_of_interest,establishment}	http://boutiqbar.hu/	Budapest
491	Bars Budapest	ChIJQQpwOlDcQUcRuEtqGHLqga8	Jónás Craft Beer House	4.4	Budapest, Fővám tér 11, 1093 Hungary	47.4832204999999874	19.0614382000000013	{bar,restaurant,food,point_of_interest,establishment}	https://www.facebook.com/jonaskezmuvessorhaz/	Budapest
488	Bars Budapest	ChIJddsAImzcQUcRKC43EuBd4Ws	360 Bar	4.3	Budapest, Andrássy út 39, 1061 Hungary	47.503694000000003	19.0615230000000011	{bar,point_of_interest,establishment}	http://360bar.hu/	Budapest
489	Bars Budapest	ChIJ864eAWncQUcRaK1JbW1c_t4	Kisüzem	4.4	Budapest, Kis Diófa u. 2, 1077 Hungary	47.4997559999999979	19.0628163000000015	{bar,point_of_interest,establishment}	https://www.facebook.com/Kisuzem	Budapest
492	Bars Budapest	ChIJMQQUWUXcQUcRhIgfvMynVa8	Icebar Budapest	3.1	Budapest, Váci u. 40, 1056 Hungary	47.4912800999999973	19.0544200000000004	{bar,point_of_interest,establishment}	http://www.icebar.hu/	Budapest
496	Bars Budapest	ChIJwxtK9w7cQUcRxjobpvkpE_o	Morrison's 2.	3.5	Budapest, Szent István krt. 11, 1055 Hungary	47.5121843000000013	19.0503160999999999	{night_club,bar,restaurant,food,point_of_interest,establishment}	http://www.morrisons2.hu/	Budapest
493	Bars Budapest	ChIJqVAXL2_cQUcRqjBTWDd4Bcw	WarmUp Rustic	4.7	Budapest, Kertész u. 39, 1073 Hungary	47.5022751999999997	19.0653398000000003	{bar,point_of_interest,establishment}	http://warmupbudapest.hu/	Budapest
495	Bars Budapest	ChIJP3XyoWfcQUcRJZkIP6TioOQ	Place Bar	4	Budapest, Dohány u. 39, 1074 Hungary	47.4974771999999987	19.0684167000000002	{bar,point_of_interest,establishment}	http://www.placebudapest.wixsite.com/placebar	Budapest
515	Bars Sofia	ChIJZ0dx0AyFqkARBVCJa7_2DB8	Hambara	4.4	ul. "6-ti septemvri" 22, 1142 Sofia Center, Sofia, Bulgaria	42.6900941999999972	23.3255258999999988	{bar,point_of_interest,establishment}	\N	Sofia
510	Bars Sofia	ChIJHcAu_56FqkAR9ZVYoH6CN7I	Art Club	4.4	ul. "Tsar Ivan Asen II" 6Б, 1124 g.k. Yavorov, Sofia, Bulgaria	42.6902300000000068	23.3394399999999997	{bar,restaurant,food,point_of_interest,establishment}	http://art-club-sofia.business.site/	Sofia
511	Bars Sofia	ChIJFQ5zQmSFqkARn3paQAz1PRI	DELTA BLUES BAR	4.6	ulitsa "Sv. Sveti Kiril I Metodiy" 44, 1202 Sofia Center, Sofia, Bulgaria	42.7029331000000028	23.3277800000000006	{bar,point_of_interest,establishment}	https://www.facebook.com/bardeltablues?fref=nf	Sofia
505	Bars Sofia	ChIJm3KQSnCFqkAR-ZYiDhGhdhw	Dada Cultural Bar	4.5	ul. "Georgi Benkovski" 10, 1000 Sofia Center, Sofia, Bulgaria	42.6970096000000012	23.3292408000000009	{bar,food,point_of_interest,establishment}	http://www.dadaculturalbar.com/	Sofia
506	Bars Sofia	ChIJa7EEd3SFqkARZtSBfZ95PKc	One More Bar	4.4	ul. "Tsar Shishman" 12, 1000 Sofia Center, Sofia, Bulgaria	42.6925467000000083	23.330836399999999	{bar,point_of_interest,establishment}	http://facebook.com/onemorebar	Sofia
521	Bars Warschau	ChIJH5aEde7MHkcREKvRSYeYFRA	Kraken Rum Bar	4.6	Poznańska 12, 00-454 Warszawa, Poland	52.2246842999999998	21.0122752000000013	{bar,point_of_interest,establishment}	https://www.facebook.com/KrakenRumBar	Warschau
507	Bars Sofia	ChIJB1Sf7XWFqkARl3zeYSWsfAM	Esterhasi Bar	4.3	Sofia, bul. Tsar Osvoboditel 21, Bulgaria	42.6919800000000009	23.3362300000000005	{bar,store,restaurant,food,point_of_interest,establishment}	http://www.esterhasi.com/	Sofia
512	Bars Sofia	ChIJSwfBtwaFqkARCB4akdWGsJA	Caché Bar & Cafe	4.1	bul. "Arsenalski" 2, 1421 g.k. Lozenets, Sofia, Bulgaria	42.6789321999999984	23.3203737999999987	{bar,point_of_interest,establishment}	https://www.facebook.com/CacheBar/	Sofia
508	Bars Sofia	ChIJR9fzkAGZqkARdd4kZCil0mM	Skara Bar 2	4.4	ulitsa G. Benkovski 12, 1000 Sofia Center, Sofia, Bulgaria	42.6974197999999987	23.3291149000000004	{bar,restaurant,food,point_of_interest,establishment}	http://skarabar.com/	Sofia
509	Bars Sofia	ChIJ659PlpyFqkARWo9rFqNyDM4	FlipFlop	4.6	ul. "Oborishte" 61, 1504 Sofia Center, Sofia, Bulgaria	42.6944322000000014	23.3452790999999991	{bar,point_of_interest,establishment}	http://barflipflop.com/	Sofia
516	Bars Sofia	ChIJ9QQLV3GFqkARUbMvBtzPwmc	Hotel Sense Rooftop Bar	4.4	bul. "Tsar Osvoboditel" bulevard "Tsar Osvoboditel, 1000 Sofia Center, Sofia, Bulgaria	42.6941995000000034	23.3312957999999995	{bar,point_of_interest,establishment}	http://www.sensehotel.com/	Sofia
513	Bars Sofia	ChIJh7yfbg-FqkARG7v-E0QBedw	Switch bar	4.3	Bulevard "Bulgaria" 2, 1463 Ndk, Sofia, Bulgaria	42.6833099999999988	23.3198612999999995	{bar,point_of_interest,establishment}	http://barswitchsofia.com/	Sofia
514	Bars Sofia	ChIJb59beGWFqkARmvZWGg19hRg	The Muse Bar & Art Gallery	4.6	ul. "Bacho Kiro" 24, 1000 Sofia Center, Sofia, Bulgaria	42.7001510000000124	23.3267251000000009	{bar,point_of_interest,establishment}	http://themusebar.business.site/	Sofia
519	Bars Warschau	ChIJ3Qbb5WbMHkcRm3SbIrISPY4	Klar Cocktail Bar	4.5	Krakowskie Przedmieście 41, 00-070 Warszawa, Poland	52.2444180000000031	21.0138710000000017	{bar,point_of_interest,establishment}	http://klarcocktailbar.com/	Warschau
517	Bars Warschau	ChIJ2S65Zo3MHkcRr221sP2Uxag	Panorama Sky Bar	4.2	Aleje Jerozolimskie 65/79, 00-697 Warszawa, Poland	52.2278299999999973	21.0050039999999996	{bar,point_of_interest,establishment}	http://www.panoramaskybar.pl/?scid=bb1a189a-fec3-4d19-a255-54ba596febe2	Warschau
518	Bars Warschau	ChIJC1HYgW_MHkcRPIpVF44rlr0	Podwale Bar and Books	4.5	Wąski Dunaj 20, 00-001 Warszawa, Poland	52.2491859000000005	21.0098139999999987	{bar,point_of_interest,establishment}	http://www.barandbooks.pl/	Warschau
520	Bars Warschau	ChIJOxDEN_DMHkcRYkL_tjOGGdE	Coctail Bar Max & Dom Whisky	4.6	Krucza 16/22, 00-526 Warszawa, Poland	52.2263785999999968	21.0188400000000009	{bar,point_of_interest,establishment}	http://barmax.pl/	Warschau
523	Bars Warschau	ChIJ221e1G_MHkcRelpLqXoJBWc	Belgian Elephant Pub	4.3	Freta 19, 00-227 Warszawa, Poland	52.251856399999987	21.0079729999999998	{bar,point_of_interest,establishment}	http://www.elephantbelgianpub.pl/	Warschau
522	Bars Warschau	ChIJOWdCl_PMHkcRsNYFlClZlko	British Bulldog Pub	4.1	Aleje Jerozolimskie 42, 00-001 Warszawa, Poland	52.2309462999999994	21.0159814000000011	{bar,restaurant,food,point_of_interest,establishment}	http://www.bbpub.pl/	Warschau
524	Bars Warschau	ChIJqU2cQ_HMHkcR8a6EC5rux0U	Weles Bar	4.7	Nowogrodzka 11, 00-509 Warszawa, Poland	52.2291031000000032	21.0177422000000007	{night_club,bar,point_of_interest,establishment}	http://welesbar.pl/	Warschau
545	Hotels Amsterdam	ChIJQ4MWCYHixUcR6YJPws4-zUw	WestCord Art Hotel Amsterdam	4.3	Spaarndammerdijk 302, 1013 ZX Amsterdam, Netherlands	52.3926950000000033	4.86888809999999861	{cafe,parking,bar,store,lodging,restaurant,food,point_of_interest,establishment}	https://westcordhotels.nl/hotel/art-hotel-amsterdam-3-stars/	Amsterdam
546	Hotels Amsterdam	ChIJGVGV9InhxUcRhlbOT01ynbE	Corendon Vitality Hotel Amsterdam	4.3	Aletta Jacobslaan 7, 1066 BP Amsterdam, Netherlands	52.3465589999999992	4.8310259999999996	{lodging,point_of_interest,establishment}	http://corendonhotels.com/corendon-vitality-hotel-amsterdam/	Amsterdam
547	Hotels Amsterdam	ChIJv42bEB_ixUcRO8p-I1HMl-M	XO Hotels Couture	4.5	Delflandlaan 15, 1062 EA Amsterdam, Netherlands	52.3511547000000022	4.84142310000000009	{lodging,point_of_interest,establishment}	http://www.xohotelscouture.com/	Amsterdam
548	Hotels Amsterdam	ChIJxYYOH_bixUcRmvXuhmyjUx4	MEININGER Hotel Amsterdam City West	4.1	Orlyplein 1 - 67, 1043 DR Amsterdam, Netherlands	52.3905887000000021	4.83760190000000012	{lodging,point_of_interest,establishment}	http://www.meininger-hotels.com/en/hotels/amsterdam/	Amsterdam
549	Hotels Amsterdam	ChIJld6hH7gJxkcREBPTrkmeYe0	Park Plaza Victoria Amsterdam	4.2	Damrak 1-5, 1012 LG Amsterdam, Netherlands	52.377096899999998	4.8977788999999996	{spa,lodging,restaurant,food,point_of_interest,establishment}	http://www.parkplaza.com/victoriaamsterdam	Amsterdam
550	Hotels Amsterdam	ChIJ8ewYqugJxkcR7jzBgRb-hvc	Amsterdam Marriott Hotel	4.3	Stadhouderskade 12, 1054 ES Amsterdam, Netherlands	52.3625390999999993	4.88015889999999963	{bar,lodging,restaurant,food,point_of_interest,establishment}	https://www.marriott.com/hotels/travel/amsnt-amsterdam-marriott-hotel/?scid=bb1a189a-fec3-4d19-a255-54ba596febe2	Amsterdam
551	Hotels Amsterdam	ChIJt2YRyRnixUcR1DznptCpL_A	WestCord Fashion Hotel Amsterdam	4.4	Hendrikje Stoffelsstraat 1, 1058 GC Amsterdam, Netherlands	52.3576550000000012	4.84457600000000088	{lodging,point_of_interest,establishment}	https://westcordhotels.nl/fashion-hotel-amsterdam	Amsterdam
552	Hotels Amsterdam	ChIJg7ICg5cJxkcRCIT2umWTRe0	Zoku Amsterdam	4.7	Weesperstraat 105, 1018 VN Amsterdam, Netherlands	52.3639160000000032	4.90670599999999979	{lodging,restaurant,food,point_of_interest,establishment}	http://www.livezoku.com/	Amsterdam
568	Hotels Berlin	ChIJn_IW8cJRqEcRAO32KPkLb7U	Meliá Berlin	4.4	Friedrichstraße 103, 10117 Berlin, Germany	52.5214399999999983	13.3882999999999992	{lodging,point_of_interest,establishment}	http://www.melia.com/en/hotels/germany/berlin/melia-berlin/index.html	Berlin
588	Hotels Bratislava	ChIJ0RTfP2iJbEcR7Xs3j8YvZ7s	Hotel Devin	4.5	Riečna 162/4, 811 02 Bratislava, Slovakia	48.1400969000000032	17.1072793999999995	{lodging,point_of_interest,establishment}	http://www.hoteldevin.sk/	Bratislava
569	Hotels Berlin	ChIJO_j3FcJRqEcRwB1wWkSVfWE	Leonardo Hotel Berlin Mitte	4.3	Bertolt-Brecht-Platz 4, 10117 Berlin, Germany	52.5225790000000003	13.3866359999999993	{lodging,point_of_interest,establishment}	https://www.leonardo-hotels.com/leonardo-hotel-berlin-mitte	Berlin
570	Hotels Berlin	ChIJHVo50f5QqEcRRWv4pxd0Eoc	Swissôtel Berlin	4.5	Augsburger Str. 44, 10789 Berlin, Germany	52.5030605999999977	13.3319431000000002	{lodging,point_of_interest,establishment}	http://www.swissotel.com/berlin	Berlin
571	Hotels Berlin	ChIJa5-b9RpOqEcRvBBqx5S41Ck	Leonardo Royal Hotel Berlin Alexanderplatz	4.3	Otto-Braun-Straße 90, 10249 Berlin, Germany	52.5271842000000007	13.4236652999999997	{bar,lodging,point_of_interest,establishment}	https://www.leonardo-hotels.com/leonardo-royal-hotel-berlin-alexanderplatz	Berlin
572	Hotels Berlin	ChIJITKLYMtRqEcRue5yPfAvvf0	Scandic Berlin Potsdamer Platz	4.4	Gabriele-Tergit-Promenade 19, 10963 Berlin, Germany	52.5046167000000068	13.3753513000000002	{lodging,point_of_interest,establishment}	http://www.scandichotels.de/potsdamerplatz	Berlin
573	Hotels Berlin	ChIJ42MzYk1QqEcRhlX0r_-WtI8	Hotel Berlin	4.1	Lützowpl. 17, 10785 Berlin, Germany	52.503834700000013	13.3522350000000003	{lodging,restaurant,food,point_of_interest,establishment}	http://www.hotel-berlin.de/	Berlin
574	Hotels Berlin	ChIJR5kGoSdOqEcRCiB4N4CC5rw	Hotel Novotel Berlin Mitte	4.3	Fischerinsel 12, 10179 Berlin, Germany	52.5130037999999999	13.4050861000000001	{lodging,restaurant,food,point_of_interest,establishment}	http://www.accorhotels.com/lien_externe.svlt?goto=fiche_hotel&code_hotel=3278&merchantid=seo-maps-DE-3278&sourceid=aw-cen	Berlin
575	Hotels Berlin	ChIJyQnahlFQqEcRXpGLzXrTkvE	Hotel Riu Plaza Berlin	4.4	Martin-Luther-Straße 1, 10777 Berlin, Germany	52.5004139999999992	13.3467471	{lodging,point_of_interest,establishment}	http://www.riu.com/en/Paises/germany/berlin/hotel-riu-plaza-berlin/index.jsp	Berlin
576	Hotels Berlin	ChIJG6Jmd-BRqEcRoQljfhnH0K0	Hotel Alexander Plaza	4.3	Rosenstraße 1, 10178 Berlin, Germany	52.521647999999999	13.4042639999999995	{lodging,point_of_interest,establishment}	http://www.hotel-alexander-plaza.de/	Berlin
587	Hotels Bratislava	ChIJqWbI2VyJbEcRDgiRvT3gLGk	SKARITZ Hotel & Residence	4.5	Michalská 382/4, 811 01 Bratislava, Slovakia	48.1440958000000023	17.1067585000000015	{lodging,point_of_interest,establishment}	http://www.skaritz.com/	Bratislava
586	Hotels Bratislava	ChIJE67VVFGJbEcRvCVzMDdx-xg	Mercure Bratislava Centrum Hotel	4.4	Zabotova street 2, Bratislava 1, 811 04 Bratislava, Slovakia	48.1562350000000023	17.1080863000000001	{lodging,restaurant,food,point_of_interest,establishment}	http://www.accorhotels.com/lien_externe.svlt?goto=fiche_hotel&code_hotel=6840&merchantid=seo-maps-SK-6840&sourceid=aw-cen	Bratislava
589	Hotels Bratislava	ChIJ4XoQtV2JbEcRn17F-3tSvQc	Hotel ibis Bratislava Centrum	3.9	Zámocká 7013/38, 811 01 Bratislava, Slovakia	48.1445258999999979	17.1025548000000001	{lodging,restaurant,food,point_of_interest,establishment}	http://www.accorhotels.com/lien_externe.svlt?goto=fiche_hotel&code_hotel=3566&merchantid=seo-maps-SK-3566&sourceid=aw-cen	Bratislava
590	Hotels Bratislava	ChIJ28V7o8uObEcRf2RSz2pVWqA	DoubleTree by Hilton Hotel Bratislava	4.4	Trnavská cesta 27/A, 831 04 Bratislava, Slovakia	48.1607976000000022	17.1377801000000005	{lodging,point_of_interest,establishment}	http://doubletree3.hilton.com/en/hotels/slovakia/doubletree-by-hilton-hotel-bratislava-BTSDIDI/index.html?WT.mc_id=zELWAKN0EMEA1DT2DMH3LocalSearch4DGGenericx6BTSDIDI	Bratislava
591	Hotels Bratislava	ChIJIzgk68yObEcRngw6Th2OsNU	Hotel Nivy	3.9	Liščie nivy 442/3, 821 08 Bratislava, Slovakia	48.1579580000000007	17.1402619999999999	{lodging,point_of_interest,establishment}	http://www.hotelnivy.sk/	Bratislava
592	Hotels Bratislava	ChIJ89Iw1vqObEcRguQA36i6QNY	Hotel Color ***	4	Pri Starom mýte 3095/1, 831 04 Bratislava, Slovakia	48.1841839999999877	17.1653060000000011	{lodging,point_of_interest,establishment}	http://www.hotelcolor.sk/	Bratislava
611	Hotels London	ChIJ4ZLK3q4cdkgRpUiqfsc2Nlw	Travelodge London Central City Road	3.7	1-23 City Rd, London EC1Y 1AG, UK	51.5225203999999977	-0.086957599999999996	{lodging,point_of_interest,establishment}	https://www.travelodge.co.uk/hotels/340/London-Central-City-Road-hotel?utm_source=google&utm_medium=GHA_Organic&utm_campaign=GHA_London%20Central%20City%20Road	London
612	Hotels London	ChIJd5xlWTUDdkgRJAKVUmnn0sg	Premier Inn London City Aldgate	4.3	66 Alie St, Whitechapel, London E1 8PX, UK	51.5141559999999998	-0.0697129999999999972	{lodging,restaurant,food,point_of_interest,establishment}	https://www.premierinn.com/gb/en/hotels/england/greater-london/london/london-city-aldgate.html?cid=GLBC_LONALD	London
613	Hotels London	ChIJfZsneKsEdkgRRMXOh4K6TvY	Grange St.Paul's Hotel	4.2	10 Godliman St, London EC4V 5AJ, UK	51.5127426999999969	-0.0996661999999999965	{lodging,restaurant,food,point_of_interest,establishment}	https://www.grangehotels.com/hotels-london/grange-st-pauls/	London
614	Hotels London	ChIJoZQE7K8EdkgRjn5kWhQvmn0	Hotel ibis London Blackfriars	4.2	49 Blackfriars Rd, South Bank, London SE1 8NZ, UK	51.5049731000000008	-0.104818999999999996	{bar,lodging,restaurant,food,point_of_interest,establishment}	http://www.accorhotels.com/lien_externe.svlt?goto=fiche_hotel&code_hotel=7943&merchantid=seo-maps-GB-7943&sourceid=aw-cen	London
615	Hotels London	ChIJp-4PxL4EdkgRWW73bqnQAbw	Park Plaza London Waterloo	4.3	Hercules House, 6 Hercules Rd, Lambeth, London SE1 7DU, UK	51.4981679999999997	-0.113356999999999999	{lodging,point_of_interest,establishment}	http://www.parkplaza.com/waterloo	London
616	Hotels London	ChIJZyLeCLocdkgRupTLuGSQ6hg	Ace Hotel London Shoreditch	4.3	100 Shoreditch High St, London E1 6JQ, UK	51.5253781999999987	-0.0772880999999999985	{lodging,point_of_interest,establishment}	http://acehotel.com/london	London
627	Hotels Paris	ChIJGW2pNx9u5kcRI3oyL8NG5BQ	Hotel Novotel Paris les Halles	4.3	8 Place Marguerite de Navarre, 75001 Paris, France	48.8610129999999998	2.34649300000000016	{lodging,restaurant,food,point_of_interest,establishment}	http://www.novotelparisleshalles.com/	Paris
626	Hotels Paris	ChIJRZM8NDJu5kcRN2dlSHG_EyE	Hôtel Ritz Paris	4.6	15 Place Vendôme, 75001 Paris, France	48.8680986999999973	2.3288932	{lodging,point_of_interest,establishment}	http://www.ritzparis.com/	Paris
628	Hotels Paris	ChIJA6ux6xZy5kcRJXobZ6vyNXg	Hotel Novotel Paris Centre Bercy	4.2	85 Rue de Bercy, 75012 Paris, France	48.838745000000003	2.38049579999999983	{bar,lodging,restaurant,food,point_of_interest,establishment}	https://www.accorhotels.com/fr/hotel-0935-novotel-paris-centre-bercy/index.shtml	Paris
629	Hotels Paris	ChIJyXANnIxv5kcRJvgjYOrUKEs	Le Meridien Etoile	4.1	81 Boulevard Gouvion Saint-Cyr, 75848 Cedex 17, 75017 Paris, France	48.8794423000000009	2.28502209999999994	{lodging,point_of_interest,establishment}	http://www.lemeridienetoile.com/?SWAQ=958C	Paris
630	Hotels Paris	ChIJgewxoARy5kcRVtigfBnwMgc	Holiday Inn Paris - Gare de Lyon Bastille	4.2	11 Rue de Lyon, 75012 Paris, France	48.8468129999999974	2.37153100000000006	{lodging,point_of_interest,establishment}	https://www.ihg.com/holidayinn/hotels/us/en/paris/parba/hoteldetail?cm_mmc=GoogleMaps-_-HI-_-FR-_-PARBA	Paris
631	Hotels Paris	ChIJnbjYzBpy5kcRYrNmpOxWAwY	Novotel Paris Gare de Lyon	4.2	2 Rue Hector Malot, 75012 Paris, France	48.8453159999999968	2.37547160000000002	{lodging,restaurant,food,point_of_interest,establishment}	http://www.accorhotels.com/lien_externe.svlt?goto=fiche_hotel&code_hotel=1735&merchantid=seo-maps-FR-1735&sourceid=aw-cen	Paris
632	Hotels Paris	ChIJh_IcWz5u5kcRSp4wn0z40g4	Hotel 34B - Astotel	4.6	34 Rue Bergère, 75009 Paris, France	48.8726920000000007	2.34361979999999992	{lodging,point_of_interest,establishment}	https://www.astotel.com/hotel/34b/overview#utm_source=google&utm_medium=organic&utm_campaign=mybusiness_34b	Paris
633	Hotels Paris	ChIJqX1hy_ht5kcRW-mGZYCa55U	Hotel ibis Paris Bastille Opera 11ème	3.7	15 Rue Breguet, 75011 Paris, France	48.8573483999999993	2.37284300000000004	{bar,lodging,restaurant,food,point_of_interest,establishment}	http://www.accorhotels.com/lien_externe.svlt?goto=fiche_hotel&code_hotel=1399&merchantid=seo-maps-FR-1399&sourceid=aw-cen	Paris
634	Hotels Paris	ChIJDUdzQUJu5kcRF4VZgKHeyAk	The Regent Montmartre	4	37 Boulevard de Rochechouart, 75009 Paris, France	48.8827958999999979	2.34506149999999991	{lodging,point_of_interest,establishment}	http://www.leregent.com/	Paris
635	Hotels Paris	ChIJz4H9q9Ft5kcRUGqDv9ILCmI	Holiday Inn Express Paris - Canal de la Villette	4.1	68 Quai De La Seine, Zac Du Bassin De La Villette, 75019 Paris, France	48.8883999999999972	2.37850550000000016	{lodging,point_of_interest,establishment}	https://www.ihg.com/holidayinnexpress/hotels/us/en/paris/parlv/hoteldetail?cm_mmc=GoogleMaps-_-EX-_-FR-_-PARLV	Paris
636	Hotels Paris	ChIJic-0-hhy5kcRs0J-yQ9-aNo	Hotel Mercure Paris Bercy Bibliothèque	4.2	6 Boulevard Vincent Auriol, 75013 Paris, France	48.8373955000000066	2.37297909999999979	{lodging,point_of_interest,establishment}	http://www.accorhotels.com/lien_externe.svlt?goto=fiche_hotel&code_hotel=0934&merchantid=seo-maps-FR-0934&sourceid=aw-cen	Paris
648	Hotels Barcelona	ChIJFRLx6VuipBIRMYC09P7w05I	Tryp Barcelona Apolo Hotel	3.9	Av. del Paraŀlel, 57-59, 08004 Barcelona, Spain	41.3746642999999992	2.17072580000000004	{lodging,point_of_interest,establishment}	https://www.melia.com/es/hoteles/espana/barcelona/tryp-barcelona-apolo-hotel/index.html	Barcelona
649	Hotels Barcelona	ChIJP64LWHyYpBIREKQHyQvfZw4	Hotel NH Sants Barcelona	4.1	Carrer de Numància, 74, 08029 Barcelona, Spain	41.3845910000000003	2.13781070000000017	{lodging,point_of_interest,establishment}	https://www.nh-hoteles.es/hotel/nh-sants-barcelona?gmb	Barcelona
669	Hotels Budapest	ChIJJQxwykDcQUcReIDHX24CMys	Budapest Marriott Hotel	4.5	Budapest, Apáczai Csere János u. 4, 1052 Hungary	47.4948279999999983	19.0497495000000008	{lodging,point_of_interest,establishment}	https://www.marriott.com/hotels/travel/budhu-budapest-marriott-hotel/?scid=bb1a189a-fec3-4d19-a255-54ba596febe2	Budapest
650	Hotels Barcelona	ChIJ31LkMmWipBIRvU1d2GgkYec	Crowne Plaza Barcelona - Fira Center	4.3	Av. de Rius i Taulet, 1, 08004 Barcelona, Spain	41.372705400000001	2.1547067000000002	{lodging,point_of_interest,establishment}	https://www.ihg.com/crowneplaza/hotels/us/en/barcelona/bcncp/hoteldetail?cm_mmc=GoogleMaps-_-CP-_-ES-_-BCNCP	Barcelona
651	Hotels Barcelona	ChIJ2al7HuWipBIRXOlxAZON_Vk	Hotel NH Collection Barcelona Pódium	4.4	Carrer de Bailèn, 4-6, 08010 Barcelona, Spain	41.3916213999999982	2.17785640000000003	{lodging,point_of_interest,establishment}	https://www.nh-collection.com/hotel/nh-collection-barcelona-podium?gmb=new	Barcelona
652	Hotels Barcelona	ChIJ5yWyElqjpBIRb_6EZFj_3NM	Hilton Diagonal Mar Barcelona	4.3	Passeig del Taulat, 262-264, 08019 Barcelona, Spain	41.4088759999999994	2.21749000000000018	{lodging,point_of_interest,establishment}	http://www3.hilton.com/en/hotels/spain/hilton-diagonal-mar-barcelona-BCNDMHI/index.html?WT.mc_id=zELWAKN0EMEA1HI2DMH3LocalSearch4DGGenericx6BCNDMHI	Barcelona
653	Hotels Barcelona	ChIJAZ8iO3mipBIRVRz2VZ0CEkw	Hotel Catalonia Barcelona Plaza	4.1	Plaça Espanya, 6-8, 08014 Barcelona, Spain	41.3754852	2.14819400000000016	{lodging,point_of_interest,establishment}	https://www.cataloniabcnplaza.com/	Barcelona
654	Hotels Barcelona	ChIJq6qqap-ipBIRlXtknAE_Q9I	Pol & Grace Hotel	4.4	Guillermo Tell, 49, 08006 Barcelona, Spain	41.4017763000000016	2.14782340000000005	{lodging,point_of_interest,establishment}	http://www.polgracehotel.es/	Barcelona
668	Hotels Budapest	ChIJtXi5kmncQUcRnX5hg8qSUFM	Mango Hotel	4.2	Budapest, Holló utca 12-14. Flat: 208, 1075 Hungary	47.4990530000000035	19.0597180000000002	{real_estate_agency,travel_agency,lodging,point_of_interest,establishment}	http://mangohotelbudapest.com/	Budapest
667	Hotels Budapest	ChIJczsuWUXcQUcRJlNjNPF4EPc	Estilo Fashion Hotel	4.4	Budapest, Váci u. 83, 1056 Hungary	47.4879989000000009	19.0571537999999983	{lodging,point_of_interest,establishment}	http://estilohotelbudapest.com/	Budapest
670	Hotels Budapest	ChIJi2mOh2HcQUcRyhSeQU8r-po	Hotel Hungaria City Center	3.7	Budapest, Rákóczi út 90, 1074 Hungary	47.4994999999999976	19.0788499999999992	{lodging,point_of_interest,establishment}	https://www.danubiushotels.com/en/our-hotels-budapest/hotel-hungaria-city-center	Budapest
671	Hotels Budapest	ChIJ48uRoXLcQUcRY9cq9gdzH1s	Radisson Blu Béke Hotel, Budapest	4	Budapest, Teréz krt. 43, 1067 Hungary	47.5082820000000012	19.0595493000000005	{spa,lodging,restaurant,food,point_of_interest,establishment}	https://www.radissonblu.com/en/hotel-budapest?facilitatorId=CSOSEO&csref=org_gmb_sk_en_sn_ho_BUDZH	Budapest
690	Hotels Rom	ChIJT-b9RQphLxMRZw9P2_f2mJA	The Building Hotel	4.3	Via Montebello, 126, 00185 Roma RM, Italy	41.9077028999999968	12.5033425000000005	{spa,lodging,restaurant,food,point_of_interest,establishment}	\N	Rom
672	Hotels Budapest	ChIJp4z9ED3cQUcRvPR3cUD1_3I	Carlton Hotel Budapest	4.2	Budapest, Apor Péter u. 3, 1011 Hungary	47.4994905000000003	19.0392766000000009	{lodging,point_of_interest,establishment}	http://www.carltonhotel.hu/	Budapest
673	Hotels Budapest	ChIJMxPEAxpFQUcRzezYouvqWZc	Novotel Budapest Centrum	4.2	Budapest, Rákóczi út 43-45, 1088 Hungary	47.4974095999999975	19.0719689000000017	{lodging,point_of_interest,establishment}	http://www.accorhotels.com/lien_externe.svlt?goto=fiche_hotel&code_hotel=3560&merchantid=seo-maps-HU-3560&sourceid=aw-cen	Budapest
674	Hotels Budapest	ChIJQeySq-bCQUcRFG4dqTGAJzc	Atrium Fashion Hotel	4.1	Budapest, Csokonai u. 14, 1081 Hungary	47.4960351999999872	19.0725954000000009	{lodging,point_of_interest,establishment}	http://www.atriumhotelbudapest.com/	Budapest
689	Hotels Rom	ChIJx7KPvqJhLxMRniLCi8UXhso	Radisson Blu es. Hotel, Rome	3.7	Via Filippo Turati, 171, 00185 Roma RM, Italy	41.8967303000000015	12.5058421000000006	{spa,lodging,restaurant,food,point_of_interest,establishment}	\N	Rom
691	Hotels Rom	ChIJYxlGORthLxMRbSbnT_Qc2As	Parco dei Principi Grand Hotel & SPA	4.4	Via G. Frescobaldi, 5, 00198 Roma RM, Italy	41.9176410000000033	12.4916479999999996	{lodging,point_of_interest,establishment}	\N	Rom
692	Hotels Rom	ChIJQw_JrPdgLxMRBkyxFde9XHI	Hotel Giulio Cesare	4.3	Via degli Scipioni, 287, 00192 Roma RM, Italy	41.9114963999999972	12.4696660000000001	{lodging,point_of_interest,establishment}	\N	Rom
693	Hotels Rom	ChIJt-U0s72JJRMRQmORcOJOWuU	Hotel Capannelle	3.7	Via Siderno, 37, 00178 Roma RM, Italy	41.8352179999999976	12.5551300000000001	{lodging,point_of_interest,establishment}	\N	Rom
694	Hotels Rom	ChIJZakzTq5hLxMRbFUcp7rV_Jo	Virgilio, Roma	4.1	Via Palermo, 30, 00184 Roma RM, Italy	41.8990495999999979	12.4920165999999995	{lodging,point_of_interest,establishment}	\N	Rom
695	Hotels Rom	ChIJq7aqHfFgLxMR3GhqR0oXKyk	Hotel Donna Laura Palace	4.1	Lungotevere delle Armi, 21, 00195 Roma RM, Italy	41.916203000000003	12.4693179999999995	{lodging,point_of_interest,establishment}	\N	Rom
707	Hotels Sofia	ChIJmefhRQuZqkAR7CqJX1_7rfo	Sense	4.5	bul. "Tsar Osvoboditel" 16, 1000 Sofia Center, Sofia, Bulgaria	42.6942621000000031	23.3314294999999987	{lodging,point_of_interest,establishment}	http://www.sensehotel.com/	Sofia
711	Hotels Sofia	ChIJK_QUgEKFqkARggr-y0qzh9k	Best Western Plus Bristol Hotel	4	bul. "Hristo Botev" 69, 1303 Sofia Center, Sofia, Bulgaria	42.6997769999999974	23.3157689999999995	{lodging,point_of_interest,establishment}	http://www.bristolhotel.bg/	Sofia
708	Hotels Sofia	ChIJeXeFSnWEqkARXyVWBVYPuNw	Царско село	4.4	ul. "Okolovrasten pat" 72, 1415 Dragalevtsi, Sofia, Bulgaria	42.6382283000000015	23.3192982999999998	{lodging,point_of_interest,establishment}	http://www.tsarskoselo-bg.com/	Sofia
709	Hotels Sofia	ChIJKcU3HzqEqkAR_k47P-LyGOQ	Olives City Hotel	4.4	ulitsa "Professor Hristo Vakarelski" 1, 1700 Studentski Kompleks, Sofia, Bulgaria	42.6577199999999976	23.343439	{lodging,restaurant,food,point_of_interest,establishment}	http://www.oliveshotel.com/	Sofia
712	Hotels Sofia	ChIJjet60BKFqkARDjJdyF5Z2Bo	Хотел Феста София	4.2	Bulevard "Bulgaria" 83, 1404 Manastirski Livadi, Sofia, Bulgaria	42.6601434000000026	23.2865691000000012	{lodging,point_of_interest,establishment}	http://www.festahotels.com/	Sofia
710	Hotels Sofia	ChIJTbvsWGiFqkARU3Of4GRQ4kQ	хотел Света София	3.8	ul. "Pirotska" 18, 1000 Sofia Center, Sofia, Bulgaria	42.6998290000000011	23.3188929000000016	{lodging,point_of_interest,establishment}	http://www.hotelsvetasofia.com/	Sofia
727	Hotels Warschau	ChIJg9RcI5fMHkcR_Arnp6f8hMg	Radisson Blu Sobieski Hotel, Warsaw	4.3	plac Zawiszy 1, 02-025 Warszawa, Poland	52.2240599999999873	20.9888058999999991	{bar,gym,lodging,health,restaurant,food,point_of_interest,establishment}	https://www.radissonblu.com/en/sobieski-warsaw?facilitatorId=CSOSEO&csref=org_gmb_sk_en_sn_ho_WAWZS	Warschau
728	Hotels Warschau	ChIJOS1gee7MHkcRXeDn_KOvMIc	Hostel Chillout	4.7	Poznańska 7/5, 00-680 Warszawa, Poland	52.2240188999999972	21.0122549999999997	{lodging,point_of_interest,establishment}	http://www.chillouthostel.pl/	Warschau
732	Hotels Warschau	ChIJIUeuzt7SHkcRE1zprKH3CAQ	DoubleTree by Hilton Hotel & Conference Centre Warsaw	4.6	Skalnicowa 21, 04-797 Warszawa, Poland	52.1855898999999965	21.1418683999999999	{spa,lodging,point_of_interest,establishment}	http://doubletree3.hilton.com/en/hotels/poland/doubletree-by-hilton-hotel-and-conference-centre-warsaw-WAWCCDI/index.html?WT.mc_id=zELWAKN0EMEA1DT2DMH3LocalSearch4DGGenericx6WAWCCDI	Warschau
729	Hotels Warschau	ChIJtXy2bfrMHkcRizKzmQt9wMU	Sheraton Warsaw Hotel	4.4	Ul. B. Prusa 2, 00-493 Warszawa, Poland	52.2280098000000024	21.0249574999999993	{lodging,point_of_interest,establishment}	http://www.sheraton.pl/?SWAQ=958C	Warschau
726	Hotels Warschau	ChIJOedAWYTMHkcRkRXGBXWmU9k	Hilton Warsaw Hotel and Convention Centre	4.5	Grzybowska 63, 00-844 Warszawa, Poland	52.2335485999999989	20.9860590000000009	{spa,lodging,point_of_interest,establishment}	http://www3.hilton.com/en/hotels/poland/hilton-warsaw-hotel-and-convention-centre-WAWHIHI/index.html?WT.mc_id=zELWAKN0EMEA1HI2DMH3LocalSearch4DGGenericx6WAWHIHI	Warschau
730	Hotels Warschau	ChIJwWMuOz0zGUcRAL8TCWi9aak	Airport Hotel Okęcie	4.4	Komitetu Obrony Robotników 24, 02-148 Warszawa, Poland	52.1780449999999973	20.9824799999999989	{spa,lodging,restaurant,food,point_of_interest,establishment}	http://www.airporthotel.pl/	Warschau
731	Hotels Warschau	ChIJ4W6HTjYzGUcRjHt9I18UbbM	Hotel Novotel Warszawa Airport	4.2	1 Sierpnia 1, 02-134 Warszawa, Poland	52.1912619999999876	20.9800599000000005	{lodging,point_of_interest,establishment}	http://www.accorhotels.com/lien_externe.svlt?goto=fiche_hotel&code_hotel=0527&merchantid=seo-maps-PL-0527&sourceid=aw-cen	Warschau
376	Bars Amsterdam	ChIJXT9DBMcJxkcR2thaZfmZvdA	Cafe Belgique	4.5	Gravenstraat 2, 1012 NM Amsterdam, Netherlands	52.374329000000003	4.89309100000000008	{bar,cafe,food,point_of_interest,establishment}	http://cafe-belgique.nl/	Amsterdam
745	Cafes Amsterdam	ChIJweXO1ugJxkcR2nckxDGWbIc	Hard Rock Cafe	4.2	Max Euweplein 57-61, 1017 MA Amsterdam, Netherlands	52.3620469999999969	4.88299099999999964	{cafe,bar,restaurant,food,point_of_interest,establishment}	http://www.hardrock.com/cafes/amsterdam/	Amsterdam
746	Cafes Amsterdam	ChIJHzJL4rcJxkcR2lG19jD66D4	Café Karpershoek	4	Martelaarsgracht 2, 1012 TP Amsterdam, Netherlands	52.3781516000000025	4.89674779999999998	{cafe,food,point_of_interest,establishment}	http://www.cafekarpershoek.nl/	Amsterdam
747	Cafes Amsterdam	ChIJp8WKOdsJxkcRVL-xZ7kdT60	Café Chris	4.6	Bloemstraat 42, 1016 LC Amsterdam, Netherlands	52.3742778000000015	4.88158169999999991	{cafe,food,point_of_interest,establishment}	http://www.cafechris.nl/	Amsterdam
748	Cafes Amsterdam	ChIJNQGt-c4JxkcRqmwL9rEToYI	Café Thijssen	4.3	Brouwersgracht 107, 1015 GD Amsterdam, Netherlands	52.3807647000000003	4.88735669999999978	{cafe,food,point_of_interest,establishment}	http://www.cafethijssen.nl/	Amsterdam
774	Cafes Berlin	ChIJ6SJwy-ZRqEcR4uTa-jZsWkc	Barcomi's Deli	4.4	Sophienstraße 21, 10178 Berlin, Germany	52.5261980999999878	13.4008895999999993	{cafe,grocery_or_supermarket,store,food,point_of_interest,establishment}	http://www.barcomis.de/	Berlin
775	Cafes Berlin	ChIJ57FkPmNQqEcRsgpaCUbw8g0	Café Adèle Berlin Vintage & Art Café und Eiscafé	4.3	Bundesallee 142, 12161 Berlin, Germany	52.477020600000003	13.3288436000000008	{cafe,bakery,store,restaurant,food,point_of_interest,establishment}	http://cafeadeleberlin.tumblr.com/	Berlin
770	Cafes Berlin	ChIJpbHIyk1OqEcR7Z1BcbA3wxk	Café Mukkefukk	5	Wrangelstraße 95, 10997 Berlin, Germany	52.4998693000000003	13.4393346999999999	{cafe,store,food,point_of_interest,establishment}	\N	Berlin
771	Cafes Berlin	ChIJae75psRNqEcRUGZvc6gjIJ4	Café - Bistro happa-happa Berlin	4.5	17, Smetanastraße, 13088 Berlin, Germany	52.5485769999999874	13.4593609999999995	{cafe,store,restaurant,food,point_of_interest,establishment}	http://www.happa-happa-berlin.de/index.html	Berlin
772	Cafes Berlin	ChIJsWhkzl5OqEcRG60IDmyoIYU	Silo Coffee	4.3	Gabriel-Max-Straße 4, 10245 Berlin, Germany	52.5100440000000006	13.458342	{cafe,store,restaurant,food,point_of_interest,establishment}	http://www.silo-coffee.com/	Berlin
776	Cafes Berlin	ChIJIbrAM1BQqEcRbv8ly8HwIGA	Café Berlin Kalwil	4.5	Motzstraße 30, 10777 Berlin, Germany	52.4977876000000023	13.3476671000000007	{cafe,food,point_of_interest,establishment}	http://www.cafekalwilberlin.de/	Berlin
773	Cafes Berlin	ChIJH8WH-aJFqEcROOa3V4EngyY	Cafe Am Britzer Garten in Berlin	3.8	Buckower Damm 163, 12349 Berlin, Germany	52.4290056999999976	13.4353586000000007	{cafe,bar,store,restaurant,food,point_of_interest,establishment}	http://www.cafe-am-britzer-garten.de/	Berlin
787	Cafes Bratislava	ChIJZ84wBUOJbEcR8K6e5gjvrXE	MALEWILL Cafe	4.1	Uršulínska 436/9, 811 01 Staré Mesto, Slovakia	48.1440496000000024	17.1102542	{cafe,store,food,point_of_interest,establishment}	\N	Bratislava
788	Cafes Bratislava	ChIJIZ0QhUOJbEcREBJJUrO7Glw	Vienna Cafe	3.9	Námestie SNP 474/15, 811 06 Staré Mesto, Slovakia	48.1450154999999995	17.1127235999999989	{cafe,food,point_of_interest,establishment}	\N	Bratislava
789	Cafes Bratislava	ChIJNQYJL12JbEcRc-ftVuf1bGA	Greentree caffe	4.1	Ventúrska 20, 811 01 Staré Mesto, Slovakia	48.1434597000000011	17.1066006000000002	{cafe,store,food,point_of_interest,establishment}	\N	Bratislava
790	Cafes Bratislava	ChIJ3b8VnTiJbEcRa-waEaN3LLM	W cafe	4.5	Grösslingová 2503/62, 811 09 Bratislava, Slovakia	48.1457349999999877	17.1234749999999991	{cafe,store,food,point_of_interest,establishment}	http://www.wcafe.sk/	Bratislava
791	Cafes Bratislava	ChIJSQfZ3ESJbEcRklBNFZxm7G0	Schöndorf Bio Cafe	4.8	Obchodná 528/48, 811 06 Staré Mesto, Slovakia	48.1476946000000083	17.1115549999999992	{cafe,store,food,point_of_interest,establishment}	https://www.facebook.com/biocafeschondorf	Bratislava
792	Cafes Bratislava	ChIJpRZjzmmJbEcRHLCc2nbckOg	Berlinka, gallery café & bistro	4.5	Námestie Ľudovíta Štúra 4, 811 02 Staré Mesto, Slovakia	48.1402229999999989	17.1095000000000006	{restaurant,cafe,food,point_of_interest,establishment}	https://www.facebook.com/cafeberlinkaSNG	Bratislava
793	Cafes Bratislava	ChIJb5AC0ESJbEcRemISq1_I8tg	Caffe4U Ltd.	4.6	Obchodná 42, 811 06 Bratislava, Slovakia	48.1473931000000022	17.1112891000000005	{cafe,store,food,point_of_interest,establishment}	http://www.caffe4u.sk/plantazna-kava-prazena/	Bratislava
794	Cafes Bratislava	ChIJJ6xq5VyJbEcRuAf9q9Xgfro	Eleven Books & Coffee	4.9	Baštová 345/9, 811 03 Bratislava, Slovakia	48.144660199999997	17.1054810999999987	{cafe,book_store,store,food,point_of_interest,establishment}	http://elevenbooks.sk/	Bratislava
795	Cafes Bratislava	ChIJpyH2v06JbEcRXuoGqoDovkk	MAD DROP Espresso & Brew Bar	4.8	Radlinského 2799/24, 811 07 Staré Mesto, Slovakia	48.1535172999999972	17.1191290000000009	{cafe,food,point_of_interest,establishment}	http://maddrop.sk/	Bratislava
809	Cafes London	ChIJT572jI0cdkgRe6ZCGWDlysg	Cafe OTO	4.4	The Print House, 18-22 Ashwin St, London E8 3DL, UK	51.5468996000000033	-0.0747566999999999954	{cafe,food,point_of_interest,establishment}	http://www.cafeoto.co.uk/	London
796	Cafes Bratislava	ChIJO2ZtVUOJbEcRu2mS28IKpjI	Milenium Cafe	4.3	Námestie SNP 463/3, 811 06 Bratislava - Staré Mesto-Staré Mesto, Slovakia	48.1460196000000025	17.1091300000000004	{cafe,store,food,point_of_interest,establishment}	http://www.mileniumcafe.sk/	Bratislava
808	Cafes London	ChIJ565hgN0EdkgRMhOboIZ7uJ8	Regency Cafe	4.7	17-19 Regency St, Westminster, London SW1P 4BY, UK	51.4939938999999995	-0.132223499999999994	{cafe,food,point_of_interest,establishment}	\N	London
811	Cafes London	ChIJ5RMKE-QadkgRtiLW-2Z3ru0	Cereal Killer Cafe	4	Stables Market, Mezz 2, Chalk Farm Rd, Camden Town, London NW1 8AH, UK	51.5422790000000006	-0.147952	{cafe,food,point_of_interest,establishment}	http://cerealkillercafe.co.uk/	London
810	Cafes London	ChIJFVAACrYcdkgRoRdPsIHUDGQ	The Canvas: Cafe & Creative Venue	4.2	42 Hanbury St, London E1 5JL, UK	51.5202505999999971	-0.0715554999999999941	{cafe,food,point_of_interest,establishment}	http://www.thecanvascafe.org/	London
812	Cafes London	ChIJqwEh5JUcdkgR6eLPIgYhFM4	Draughts - Board Game Café	4.4	337 Acton Mews, Hackney, London E8 4EA, UK	51.5369849000000002	-0.0757454999999999934	{cafe,bar,store,food,point_of_interest,establishment}	http://www.draughtslondon.com/	London
813	Cafes London	ChIJbc-9tKgEdkgR2qNGtGhKWLc	The Table Cafe	4.1	83 Southwark St, London SE1 0HX, UK	51.5055418000000031	-0.0997127999999999903	{cafe,bar,restaurant,food,point_of_interest,establishment}	http://www.thetablecafe.com/	London
822	Cafes Paris	ChIJy2DMU_1x5kcR9SBKGXpGEas	Le Peloton Café	4.6	17 Rue du Pont Louis-Philippe, 75004 Paris, France	48.8555315999999991	2.35593340000000007	{cafe,food,point_of_interest,establishment}	http://facebook.com/lepelotoncafe	Paris
814	Cafes London	ChIJByFlIyEFdkgRLsXxsLPLA3k	The English Rose Cafe and Tea Shop	4.1	4 Lower Grosvenor Pl, Westminster, London SW1W 0EJ, UK	51.4980728999999968	-0.144475500000000007	{cafe,food,point_of_interest,establishment}	http://theenglishrosecafe.co.uk/	London
815	Cafes London	ChIJ2z4P9lIFdkgRWIvb_FtZZcI	Sheila's Cafe	4.6	24A Lancaster Mews, London W2 3QE, UK	51.5122434999999967	-0.178228400000000009	{cafe,meal_takeaway,restaurant,food,point_of_interest,establishment}	\N	London
831	Cafes Paris	ChIJ3eCHM_1x5kcRRfrf5-yoThc	The Caféothèque of Paris	4.3	52 Rue de l'Hôtel de ville, 75004 Paris, France	48.8544401999999991	2.3557431000000002	{cafe,store,food,point_of_interest,establishment}	http://www.lacafeotheque.com/	Paris
816	Cafes London	ChIJYyjyb8Wn2EcRn9oRTm2nXk4	Lantana Shoreditch	4.1	2, Oliver’s Yard, 55 City Rd, London EC1Y 1HQ, UK	51.5243180000000009	-0.0874080000000000135	{cafe,bar,meal_takeaway,store,restaurant,food,point_of_interest,establishment}	http://www.lantanacafe.co.uk/	London
823	Cafes Paris	ChIJ7RBaQ_tt5kcR2OmEcFAsGbA	Café Oberkampf	4.7	3 Rue Neuve Popincourt, 75011 Paris, France	48.8647254999999987	2.37403010000000014	{cafe,bar,store,food,point_of_interest,establishment}	http://cafeoberkampf.com/	Paris
817	Cafes Paris	ChIJqyageCxw5kcRTKbr3dU5HD4	Coutume Café	4.1	47 Rue de Babylone, 75007 Paris, France	48.8515990000000002	2.31840100000000016	{cafe,store,food,point_of_interest,establishment}	http://coutumecafe.com/	Paris
818	Cafes Paris	ChIJq537gddx5kcR_3PhRd2muxg	Café de Flore	3.9	172 Boulevard Saint-Germain, 75006 Paris, France	48.8541588000000004	2.33260459999999981	{cafe,food,point_of_interest,establishment}	http://cafedeflore.fr/	Paris
828	Cafes Paris	ChIJgx8d1SVu5kcRsQ4Dn3F4pXw	Le Café Richelieu	3.4	Musée du Louvre, 75001 Paris, France	48.8616407000000024	2.33619649999999979	{cafe,restaurant,food,point_of_interest,establishment}	http://www.louvre.fr/le-cafe-richelieu-angelina	Paris
819	Cafes Paris	ChIJd8iEINlx5kcRnYQlbwBqK_M	Coffee de Paris	3.7	10 Rue de Buci, 75006 Paris, France	48.853867000000001	2.33761699999999983	{cafe,bar,restaurant,food,point_of_interest,establishment}	https://www.facebook.com/Caf%C3%A9-de-Paris-St-Germain-281556718957923/?fref=ts	Paris
824	Cafes Paris	ChIJg59QvwRu5kcRj1r4MOvS6DU	Strada Café	4.2	94 Rue du Temple, 75003 Paris, France	48.8622423999999995	2.35735859999999997	{cafe,food,point_of_interest,establishment}	http://www.stradacafe.fr/	Paris
820	Cafes Paris	ChIJlW2G2zBu5kcRhim6uqUi8Fs	Café de la Paix	4	5 Place de l'Opéra, 75009 Paris, France	48.8708718999999974	2.33176229999999984	{cafe,restaurant,food,point_of_interest,establishment}	http://www.cafedelapaix.fr/	Paris
821	Cafes Paris	ChIJI2VmJOht5kcRD_bcnBiqmak	Belleville Brûlerie - Paris	4.6	10 Rue Pradier, 75019 Paris, France	48.8751346000000026	2.38170469999999979	{cafe,store,food,point_of_interest,establishment}	http://cafesbelleville.com/	Paris
825	Cafes Paris	ChIJQ8Y8tTtu5kcRC76VEpxyI9o	Café Verlet	4.2	256 Rue Saint Honoré, 75001 Paris, France	48.8641460999999993	2.33385670000000012	{cafe,food,point_of_interest,establishment}	http://www.verlet.fr/	Paris
829	Cafes Paris	ChIJVymU3CRu5kcR1DLGdUW9sEs	Cafe Kitsune	4.1	Jardin du Palais Royal, 51 Galerie de Montpensier, 75001 Paris, France	48.8657502999999878	2.33745629999999993	{cafe,food,point_of_interest,establishment}	http://kitsune.fr/	Paris
826	Cafes Paris	ChIJDSzfrABu5kcRisXSgfKkd1o	Used Book Café	4.2	111 Boulevard Beaumarchais, 75003 Paris, France	48.8606900999999993	2.36665850000000022	{cafe,food,point_of_interest,establishment}	http://www.merci-merci.com/en/store-restaurants-257.html	Paris
827	Cafes Paris	ChIJvbcHhAtu5kcR2bMha1bPBaA	Café Craft	4.2	24 Rue des Vinaigriers, 75010 Paris, France	48.8732034000000013	2.36302520000000005	{cafe,store,restaurant,food,point_of_interest,establishment}	http://www.cafe-craft.com/	Paris
830	Cafes Paris	ChIJ5wbb4tRx5kcROl0RZsSrzlY	Café Varenne	4.2	36 Rue de Varenne, 75007 Paris, France	48.8541087999999988	2.32373649999999987	{restaurant,cafe,food,point_of_interest,establishment}	http://menuonline.fr/cafevarenne	Paris
833	Cafes Paris	ChIJjasjZGRu5kcRMUkbbCkm6no	Lomi	4.2	3 ter Rue Marcadet, 75018 Paris, France	48.890307700000001	2.35531449999999998	{cafe,store,food,point_of_interest,establishment}	http://www.lomi.paris/	Paris
832	Cafes Paris	ChIJpz0XH-Fx5kcRyAOJ9DQcjic	Shakespeare and Company Café	4.1	37 Rue de la Bûcherie, 75005 Paris, France	48.8525716999999986	2.34717790000000015	{cafe,book_store,store,food,point_of_interest,establishment}	https://shakespeareandcompany.com/51/shakespeare-and-company/463/visit-our-cafe	Paris
835	Cafes Paris	ChIJjZtBkeVx5kcR5LXxdFgtyDo	Strada Café	4.2	24 Rue Monge, 75005 Paris, France	48.8469460999999967	2.35114970000000012	{cafe,food,point_of_interest,establishment}	http://www.stradacafe.fr/	Paris
834	Cafes Paris	ChIJqUrDP-Fx5kcRE9GlzfT8tE0	Café Panis	3.9	21 Quai de Montebello, 75005 Paris, France	48.8522271999999873	2.34835830000000012	{cafe,restaurant,food,point_of_interest,establishment}	http://www.cafepanis.com/	Paris
836	Cafes Paris	ChIJly1xVgFu5kcRoruGNAxdAyY	Breizh Café	4.1	109 Rue Vieille du Temple, 75003 Paris, France	48.8606334999999987	2.36180050000000019	{cafe,store,restaurant,food,point_of_interest,establishment}	https://breizhcafe.com/	Paris
837	Cafes Barcelona	ChIJ0c3t9laipBIRvEUHQJkXfJU	Federal Café	4.2	Passatge de la Pau, 11, 08002 Barcelona, Spain	41.3779838999999967	2.17774400000000012	{cafe,store,restaurant,food,point_of_interest,establishment}	http://federalcafe.es/barcelona-gotic/	Barcelona
851	Cafes Barcelona	ChIJixPXJlmipBIRtLFtHLoyMyY	Cafè de les Delicies	4.1	Rambla del Raval, 47, 08001 Barcelona, Spain	41.3781454000000011	2.1704785000000002	{cafe,bar,food,point_of_interest,establishment}	http://cafedelesdelicies1.berlindoener.info/	Barcelona
838	Cafes Barcelona	ChIJRaENMHuYpBIR7qtOrpH3MVs	Hidden Café Barcelona	4.7	C/ Constança esquina Déu i Mata, 08029 Barcelona, Spain	41.3882850000000033	2.13574399999999986	{cafe,store,food,point_of_interest,establishment}	http://www.hiddencafebcn.com/	Barcelona
846	Cafes Barcelona	ChIJy3JYwWCipBIRlv2wJSQeBsY	Federal Café	3.9	Carrer del Parlament, 39, 08015 Barcelona, Spain	41.3769074000000003	2.16278859999999984	{cafe,store,restaurant,food,point_of_interest,establishment}	http://federalcafe.es/barcelona/	Barcelona
839	Cafes Barcelona	ChIJ0UXT5f6ipBIRql01d7-yV9U	Cafés El Magnífico	4.7	Carrer de l'Argenteria, 64, 08003 Barcelona, Spain	41.3835400999999976	2.18100909999999981	{cafe,store,food,point_of_interest,establishment}	http://www.cafeselmagnifico.com/	Barcelona
840	Cafes Barcelona	ChIJdRZagpaipBIR2y-uB9Po_lM	Onna Café	4.5	Carrer de Santa Teresa, 1, 08012 Barcelona, Spain	41.398101699999998	2.1596595999999999	{cafe,store,food,point_of_interest,establishment}	http://www.onnacoffee.com	Barcelona
841	Cafes Barcelona	ChIJMbRGbmeipBIRK-5qUMMoUHo	SPICE CAFÉ	4.7	Carrer de Margarit, 13, 08004 Barcelona, Spain	41.3741174000000029	2.16388530000000001	{cafe,bakery,store,food,point_of_interest,establishment}	http://www.spicecafe.es/	Barcelona
847	Cafes Barcelona	ChIJ8-bZAvmipBIR34ERpRlLXc4	Mesón del Café	3.7	Carrer de la Llibreteria, 16, 08002 Barcelona, Spain	41.3832894999999965	2.17753169999999985	{cafe,bar,restaurant,food,point_of_interest,establishment}	\N	Barcelona
842	Cafes Barcelona	ChIJyThDt7yipBIRzG24U7Qo0hA	Cafè Camèlia	4.1	Carrer de Verdi, 79, 08012 Barcelona, Spain	41.4051193000000026	2.15542830000000007	{cafe,store,restaurant,food,point_of_interest,establishment}	https://www.facebook.com/Caf%C3%A8-Cam%C3%A8lia-198100180227662/	Barcelona
843	Cafes Barcelona	ChIJC1mTxOmipBIRVodYqFhQmM8	Bristol Café	4.6	Carrer de Roger de Flor 220, 08013, Carrer de Roger de Flor, 220, 08013 Barcelona, Spain	41.4000210000000024	2.17117799999999983	{cafe,bakery,bar,store,restaurant,food,point_of_interest,establishment}	https://www.bristolcafebcn.com/	Barcelona
858	Cafes Budapest	ChIJPWTeZUTcQUcRMXCSK_9QR0E	Centrál Kávéház és Étterem 1887	4.2	Budapest, Károlyi Mihály u. 9, 1053 Hungary	47.4919849999999997	19.0568840000000002	{restaurant,cafe,store,food,point_of_interest,establishment}	http://www.centralkavehaz.hu/	Budapest
844	Cafes Barcelona	ChIJ7RtGd-mipBIRp9R3HP-JqCo	Creyón Café	4.1	Carrer de València, 349, 08009 Barcelona, Spain	41.3981157999999994	2.17014210000000007	{cafe,food,point_of_interest,establishment}	http://www.creyoncafe.com/	Barcelona
848	Cafes Barcelona	ChIJgah3XvaipBIR2IU_2crEBdw	Granja M. Viader	4.3	Carrer d'en Xuclà, 4-6, 08001 Barcelona, Spain	41.3831176999999997	2.17094820000000022	{cafe,store,food,point_of_interest,establishment}	http://www.granjaviader.cat/	Barcelona
845	Cafes Barcelona	ChIJa5sR4_eipBIRaB7gutbKtYo	Cafè de l'Òpera	4	La Rambla, 74, 08002 Barcelona, Spain	41.380948900000007	2.17377799999999999	{cafe,food,point_of_interest,establishment}	http://www.cafeoperabcn.com/	Barcelona
852	Cafes Barcelona	ChIJGTrtltyipBIRtGgJda8twWo	Paisano Café	4.6	277, Carrer de Lepant, 08013 Barcelona, Spain	41.4048528000000005	2.17594609999999999	{cafe,bar,restaurant,food,point_of_interest,establishment}	\N	Barcelona
849	Cafes Barcelona	ChIJBZxhfJ2ipBIRbfXq2glpzis	Central Cafè Restaurant	4	Carrer de Calvet, 1, 08021 Barcelona, Spain	41.3932693	2.14517740000000012	{cafe,food,point_of_interest,establishment}	http://www.centralcafe.es/	Barcelona
850	Cafes Barcelona	ChIJC50jzr2ipBIRxzD70YSuDp8	Mama's Cafe	4.1	Carrer de Torrijos, 26, 08012 Barcelona, Spain	41.4032249999999991	2.15908500000000014	{cafe,store,restaurant,food,point_of_interest,establishment}	http://www.mamascafebcn.com/	Barcelona
855	Cafes Barcelona	ChIJC88znZOipBIR3WdZT71ymO8	El Cafè de la Pedrera	3.8	Passeig de Gràcia, 92, 08008 Barcelona, Spain	41.3951838000000123	2.16171459999999982	{cafe,store,restaurant,food,point_of_interest,establishment}	http://www.cafedelapedrera.com/	Barcelona
853	Cafes Barcelona	ChIJCxN2DmSipBIRsko9ZlKLnFE	Manso's Cafe	4.5	Carrer de Manso, 1, 08015 Barcelona, Spain	41.3754520999999968	2.15873839999999984	{cafe,food,point_of_interest,establishment}	http://mansos-cafe.eltenedor.rest/	Barcelona
857	Cafes Budapest	ChIJeQACh0DcQUcRVO6JctVQ5-g	Café Gerbeaud	4.2	Budapest, Vörösmarty tér 7-8, 1051 Hungary	47.4969332999999878	19.0502809000000006	{cafe,restaurant,food,point_of_interest,establishment}	http://www.gerbeaud.hu/	Budapest
854	Cafes Barcelona	ChIJRx5QNNyipBIRh1quitYROjU	Café Parc Belmont	4.8	Carrer de Lepant, 256, 08013 Barcelona, Spain	41.4033778000000012	2.17837689999999995	{cafe,bar,store,restaurant,food,point_of_interest,establishment}	\N	Barcelona
856	Cafes Barcelona	ChIJp4NVte2ipBIRHRCdhQc2N1U	Cafè Martí	4.4	Carrer de Roger de Llúria, 51, 08009 Barcelona, Spain	41.3933238999999986	2.1683043999999998	{cafe,food,point_of_interest,establishment}	\N	Barcelona
859	Cafes Budapest	ChIJF3WFNB_cQUcRJqKVqwLujsM	Walzer Café	4.8	Budapest, Táncsics Mihály u. 12, 1014 Hungary	47.5039056999999971	19.0323081000000016	{cafe,food,point_of_interest,establishment}	http://www.walzercafe.hu/	Budapest
860	Cafes Budapest	ChIJFbyKQEXcQUcRoZTF9dlHizQ	Vaci Street Cafe Frei	4.6	Budapest, 1056, Váci u. 74, 1056 Hungary	47.4887033999999986	19.0569060000000015	{cafe,store,food,point_of_interest,establishment}	https://www.facebook.com/cafefreivaciutca	Budapest
861	Cafes Budapest	ChIJwTMHCmzcQUcRpWMFAmdgNcM	artist Cafe	4.2	Budapest, Andrássy út 29, 1061 Hungary	47.5026379999999975	19.0600169999999984	{cafe,bakery,store,food,point_of_interest,establishment}	http://www.muveszkavehaz.hu/	Budapest
875	Cafes Budapest	ChIJ3ftYCUPcQUcRCarc0hJT6cs	Café Astoria Restaurant	4.3	Budapest, Kossuth Lajos u. 19, 1053 Hungary	47.4940694999999877	19.0593861999999987	{cafe,restaurant,food,point_of_interest,establishment}	http://www.cafeastoriabudapest.hu/	Budapest
862	Cafes Budapest	ChIJGyzE_xTcQUcRlvjbtChDLtU	Espresso Embassy	4.7	Budapest, Arany János u. 15, 1051 Hungary	47.5019410000000022	19.0498280000000015	{cafe,store,food,point_of_interest,establishment}	http://www.espressoembassy.hu/	Budapest
870	Cafes Budapest	ChIJdfm1GA_cQUcRSPWVVybYmJY	Madal Cafe	4.7	Budapest, Hollán Ernő u. 3, 1136 Hungary	47.5132850000000033	19.0496282000000008	{cafe,store,food,point_of_interest,establishment}	http://www.madalcafe.hu/	Budapest
863	Cafes Budapest	ChIJE443023cQUcR6eN_MRXg0ok	Piccolo Café Budapest	4.5	Budapest, Jókai tér 6, 1061 Hungary	47.5048719999999989	19.0622389000000005	{cafe,store,food,point_of_interest,establishment}	https://facebook.com/PiccoloCafeBudapest/	Budapest
864	Cafes Budapest	ChIJr2Dg_kHcQUcRtOnmeg175-Q	My Little Melbourne Coffee and Brew Bar	4.6	Budapest, Madách Imre út 3, 1075 Hungary	47.4976940000000027	19.0577560000000013	{cafe,restaurant,food,point_of_interest,establishment}	http://mylittlemelbourne.hu/	Budapest
865	Cafes Budapest	ChIJb-V2Q2jcQUcRLRX9PFUgj7w	MassolitBudapest Books and Café	4.7	Budapest, Nagy Diófa u. 30, 1072 Hungary	47.4985550000000032	19.0639995000000013	{book_store,art_gallery,cafe,park,store,food,point_of_interest,establishment}	http://www.facebook.com/MassolitBudapest	Budapest
871	Cafes Budapest	ChIJg49L72ncQUcR1PzAgtYRnto	Blue Bird Cafe	4.1	Budapest, Dob u. 16, 1072 Hungary	47.4981723000000002	19.0598801999999985	{cafe,store,restaurant,food,point_of_interest,establishment}	https://www.facebook.com/bluebirdcafehungary/	Budapest
866	Cafes Budapest	ChIJEaq690_cQUcRqiUa801x1cA	Amber's French Bakery & Cafe	4.2	Budapest, Fővám tér 5, 1056 Hungary	47.4877676999999991	19.0572787999999989	{cafe,food,point_of_interest,establishment}	https://ambers.hu/	Budapest
867	Cafes Budapest	ChIJL6hlYkLcQUcRqEt5X5Gm-Sc	Solinfo Cafe	4.4	Budapest, Wesselényi u. 6, 1077 Hungary	47.4967479000000026	19.0605997000000009	{cafe,food,point_of_interest,establishment}	http://www.solinfocafe.hu/	Budapest
883	Cafes Warschau	ChIJq8-HhvbMHkcRM8A5hdPlv7s	Petit Appetit	4.3	Nowy Świat 27, 00-029 Warszawa, Poland	52.2329431	21.0195734999999999	{cafe,food,point_of_interest,establishment}	http://www.petitappetit.com.pl/	Warschau
868	Cafes Budapest	ChIJDzN16UDcQUcR0H74tBjaFE4	Anna Café	3.9	Budapest, Váci u. 5, 1052 Hungary	47.4955159000000009	19.0513513000000003	{cafe,store,food,point_of_interest,establishment}	http://annacafe.hu/vaci-utca/	Budapest
872	Cafes Budapest	ChIJ3zmIUELcQUcRbyU_BXf86m0	Sock's Coffee	4.6	Budapest, Dohány u. 1, 1074 Hungary	47.4955062000000012	19.0600635999999994	{cafe,food,point_of_interest,establishment}	https://www.facebook.com/sockscoffee/	Budapest
869	Cafes Budapest	ChIJVXLHbWPcQUcRAc4eoD2-pDw	The Goat Herder - Espresso Bar	4.8	Budapest, István u. 5, 1078 Hungary	47.5028990000000135	19.0777959999999993	{cafe,store,restaurant,food,point_of_interest,establishment}	http://www.thegoatherder.hu/	Budapest
876	Cafes Budapest	ChIJmeeg4mbcQUcRIOHu3gDTJDs	New York Café	4.3	Budapest, Erzsébet krt. 9-11, 1073 Hungary	47.498665299999999	19.0703987999999995	{restaurant,bar,food,point_of_interest,establishment}	http://www.newyorkcafe.hu/	Budapest
873	Cafes Budapest	ChIJYY361HbcQUcR2ke7Ywo0_Fg	Ecocafe	4.5	Budapest, Andrássy út 68, 1062 Hungary	47.507634699999997	19.0665163	{cafe,restaurant,food,point_of_interest,establishment}	http://www.ecocafe.hu/	Budapest
874	Cafes Budapest	ChIJP_WmkUDcQUcRD8Pg2W6eR1c	Hard Rock Cafe	4.2	Budapest, Deák Ferenc u. 3, 1051 Hungary	47.495970800000002	19.0507938999999986	{restaurant,cafe,bar,food,point_of_interest,establishment}	http://www.hardrock.com/cafes/budapest	Budapest
880	Cafes Warschau	ChIJdbAfz2_MHkcRfJSk_1F5Sjs	TO LUBIĘ	4.6	Freta 8, 00-227 Warszawa, Poland	52.2510446999999871	21.0090782999999988	{cafe,food,point_of_interest,establishment}	http://www.tolubie.pl/	Warschau
877	Cafes Warschau	ChIJl_eTtGDMHkcR8r3wTH6QG-Y	Café Bristol	4.4	Krakowskie Przedmieście 42/44, 00-001 Warszawa, Poland	52.2421959999999999	21.0160641000000012	{cafe,food,point_of_interest,establishment}	http://www.cafebristol.pl/	Warschau
882	Cafes Warschau	ChIJPVuIx17MHkcRLTw4MxAEGqg	Kawiarnia Kafka	4.5	Oboźna 3, 00-001 Warszawa, Poland	52.2394782999999876	21.022769499999999	{cafe,food,point_of_interest,establishment}	http://www.kawiarnia-kafka.pl/	Warschau
878	Cafes Warschau	ChIJgxwpY1_MHkcRTr8AwQJYq28	Cafe and Bakery Café Vincent	3.9	Nowy Świat 64, 00-357 Warszawa, Poland	52.2364146999999974	21.0184016000000007	{cafe,food,point_of_interest,establishment}	http://www.vincentcafe.pl/	Warschau
881	Cafes Warschau	ChIJb41ZEfTMHkcRlRSlacIItbk	Miedzy Nami	4.3	Bracka 20, 00-028 Warszawa, Poland	52.2319729000000024	21.0164821000000011	{cafe,food,point_of_interest,establishment}	http://www.miedzynamicafe.com/	Warschau
884	Cafes Warschau	ChIJofDcl-_MHkcRU4t_n6WmUbY	Organic Coffee & more	4.3	Piękna 19, 00-549 Warszawa, Poland	52.2232800000000026	21.0177009999999989	{cafe,food,point_of_interest,establishment}	http://www.organiccoffee.pl/kawiarnia-warszawa-srodmiescie/	Warschau
885	Cafes Warschau	ChIJp5UvWW_MHkcRNOEFvDt8S4w	Shabby Chic Coffee & Wine Bar	4.3	Piwna 20/26, 00-001 Warszawa, Poland	52.2487238000000005	21.0123102999999993	{cafe,bakery,book_store,store,restaurant,food,point_of_interest,establishment}	https://pl-pl.facebook.com/ShabbyChicCoffeeAndWineBar	Warschau
886	Cafes Warschau	ChIJbUEwKYrMHkcRqi9IISjQuII	Cafe Próżna	4.2	Próżna 12, 00-107 Warszawa, Poland	52.2364440999999999	21.0047288999999999	{cafe,food,point_of_interest,establishment}	http://www.cafeprozna.pl/	Warschau
895	Cafes Warschau	ChIJrXO77VjMHkcRbqK4LfszRVU	STOR	4.6	Tamka 33, 00-355 Warszawa, Poland	52.2368520000000132	21.0246747999999997	{cafe,store,food,point_of_interest,establishment}	http://www.stor.cafe/	Warschau
887	Cafes Warschau	ChIJUfm8NMIqGUcR7TIkklj_bXQ	Ministerstwo Kawy	4.5	Marszałkowska St 27/35, 00-639 Warszawa, Poland	52.2188159999999968	21.0182688999999989	{cafe,food,point_of_interest,establishment}	http://www.ministerstwokawy.pl/	Warschau
888	Cafes Warschau	ChIJ_SzXQG_MHkcRtK-xPrRkg8g	Café Keks	4	rynek Starego Miasta 1/3, 00-001 Warszawa, Poland	52.2495858999999996	21.0129047	{cafe,food,point_of_interest,establishment}	https://m.facebook.com/Cafe-Keks-584807331668313/	Warschau
889	Cafes Warschau	ChIJfUvnYGbMHkcRWSK3Bs0tN9Q	Cafe Baguette	2.8	Krakowskie Przedmieście 69, 00-001 Warszawa, Poland	52.2457655999999986	21.0134262000000014	{cafe,food,point_of_interest,establishment}	\N	Warschau
896	Cafes Warschau	ChIJd7D2GYzMHkcRbS8uGsBZ4Xo	eMeSeN	4.6	Pańska 3, 00-124 Warszawa, Poland	52.2326633999999999	21.002082399999999	{cafe,store,food,point_of_interest,establishment}	\N	Warschau
890	Cafes Warschau	ChIJU8c8pfHMHkcR8uUxw383Pxs	cafe Krucza 23	4.4	Krucza 23/31, 00-525 Warszawa, Poland	52.2275504999999995	21.0175762000000006	{cafe,food,point_of_interest,establishment}	https://www.facebook.com/Krucza23	Warschau
891	Cafes Warschau	ChIJsUEZJfDMHkcRFHH-so7gBVc	Niezłe Ziółko	4.6	Krucza 17, 00-525 Warszawa, Poland	52.2255923999999965	21.0188148999999989	{cafe,food,point_of_interest,establishment}	http://facebook.com/niezleziolko.warszawa	Warschau
892	Cafes Warschau	ChIJ6YxdsPTMHkcRNOTuW6W8mLU	Relax Cafe Bar	4.7	00-019, Złota 8a, Warszawa, Poland	52.2331845999999871	21.0109555999999991	{cafe,bar,food,point_of_interest,establishment}	http://www.relaxcafe.pl/	Warschau
893	Cafes Warschau	ChIJn_SqFfHMHkcRvCS15FjHJkQ	612 Sp. z o.o.	3.8	Lipowa 7A, 00-316 Warszawa, Poland	52.2413580000000124	21.0233509000000005	{cafe,bakery,bar,store,restaurant,food,point_of_interest,establishment}	http://www.sam.info.pl/	Warschau
894	Cafes Warschau	ChIJefk9FPLMHkcR-sTx2A5mUAE	Etno Café Marszałkowska	4.4	Marszałkowska 87, 00-683 Warszawa, Poland	52.2271219000000073	21.0128722000000003	{cafe,food,point_of_interest,establishment}	https://www.etnocafe.pl/	Warschau
\.


--
-- Data for Name: places_attributes; Type: TABLE DATA; Schema: public; Owner: sitanzewde
--

COPY public.places_attributes (id, place, attribute) FROM stdin;
1	1	1
2	1	8
3	1	12
4	2	2
5	2	4
6	2	10
7	3	1
8	3	16
9	4	4
10	5	5
11	5	4
12	6	37
13	6	4
14	6	11
15	7	8
16	7	15
17	8	17
18	9	30
19	9	19
20	10	9
21	10	37
22	11	6
23	11	46
24	12	10
25	12	16
26	13	19
27	13	20
28	13	8
29	14	24
30	14	25
31	15	3
32	15	2
33	16	21
34	17	4
35	17	26
36	17	30
37	18	3
38	18	13
39	18	22
40	19	11
41	19	10
42	20	12
43	20	14
44	40	24
45	40	34
46	163	1
47	163	47
48	164	15
49	164	22
50	164	16
51	165	9
52	165	25
53	166	11
54	166	21
55	166	17
56	167	11
57	167	14
58	168	4
59	168	4
60	168	37
61	169	12
62	169	18
63	170	3
64	170	13
65	170	22
66	170	16
67	171	17
68	171	8
69	172	2
70	172	9
71	172	24
72	173	10
73	173	37
74	173	12
75	174	10
76	174	24
77	175	27
78	175	34
79	175	43
80	176	2
81	176	39
88	176	29
89	177	10
90	177	15
91	177	22
92	177	26
93	177	16
94	177	18
95	178	19
96	178	21
97	178	20
98	179	3
99	179	10
100	179	13
101	180	8
102	180	22
103	181	2
104	181	21
105	181	47
106	182	3
107	182	28
108	896	13
109	896	17
110	896	5
111	895	47
112	895	21
113	895	19
114	894	25
115	894	3
116	894	13
117	893	8
118	892	8
119	892	42
120	891	12
121	891	6
122	890	1
123	890	39
124	890	5
125	889	2
126	889	10
127	888	45
128	888	14
129	887	11
130	887	48
131	887	15
132	887	44
133	886	10
134	886	15
135	885	8
136	885	17
137	885	22
138	884	1
139	884	16
140	884	48
141	884	27
142	883	10
143	883	22
144	883	11
145	882	8
146	882	6
147	882	17
148	881	18
149	881	9
150	881	20
151	880	12
152	880	13
153	880	15
154	878	41
155	878	40
156	878	33
157	877	21
158	877	34
159	877	11
160	876	9
161	876	1
162	876	15
163	875	15
164	875	44
165	875	46
166	874	34
167	874	42
168	874	9
169	873	48
170	873	47
171	873	7
172	872	45
173	873	13
174	873	17
175	873	19
176	872	5
177	872	43
178	871	11
179	871	41
180	871	10
181	870	45
182	870	16
183	869	20
184	869	29
185	869	17
186	869	6
187	868	3
188	868	19
189	868	24
190	867	44
191	867	15
192	866	18
193	866	44
194	866	4
195	865	1
196	865	9
197	837	10
198	837	48
199	837	29
200	836	13
201	836	5
202	830	46
203	830	45
204	829	10
205	829	11
206	829	17
207	828	2
208	828	3
209	827	37
210	827	45
211	827	26
212	826	15
213	826	28
214	825	29
215	825	28
216	824	16
217	824	19
218	823	36
219	820	33
220	820	39
221	816	9
222	816	44
223	815	26
224	815	20
225	814	39
226	814	14
227	813	12
228	813	23
229	812	32
230	812	10
231	812	11
232	811	14
233	811	46
234	810	42
235	810	33
236	809	21
237	809	25
238	808	33
239	808	16
240	808	41
241	796	1
242	796	2
243	796	4
244	795	3
245	795	4
246	794	12
247	793	5
248	793	3
249	792	9
250	792	6
251	791	4
252	791	1
253	790	48
254	790	47
273	789	46
255	789	46
256	788	44
257	788	45
258	787	42
259	787	40
260	776	30
261	776	28
262	775	39
263	775	37
266	774	27
267	774	10
268	773	43
269	773	24
270	772	25
271	772	20
272	771	2
274	770	27
275	770	20
276	748	32
277	748	36
278	747	41
279	746	9
280	746	33
281	745	8
282	745	19
283	732	32
284	732	14
285	729	37
286	729	2
287	728	27
288	727	26
289	712	44
290	712	42
291	711	15
292	710	23
293	710	22
294	709	25
295	709	39
296	708	11
297	708	9
298	707	39
299	707	27
300	695	10
301	695	14
302	695	16
303	694	24
304	694	25
305	434	10
306	434	14
307	486	27
308	486	39
309	413	6
320	413	11
310	328	19
311	328	26
312	262	22
313	262	13
314	370	25
315	370	26
316	411	30
317	411	13
318	456	1
319	456	26
321	414	16
322	414	23
323	416	25
324	416	31
325	486	44
326	486	28
327	487	17
328	487	22
329	496	45
330	496	27
331	368	24
332	368	21
333	387	10
334	387	18
335	391	14
336	391	27
337	418	25
338	418	46
\.


--
-- Name: attributes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sitanzewde
--

SELECT pg_catalog.setval('public.attributes_id_seq', 48, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 57, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 19, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 15, true);


--
-- Name: places_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sitanzewde
--

SELECT pg_catalog.setval('public.places_id_seq', 896, true);


--
-- Name: untitled_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sitanzewde
--

SELECT pg_catalog.setval('public.untitled_table_id_seq', 6, true);


--
-- Name: attributes attributes_pkey; Type: CONSTRAINT; Schema: public; Owner: sitanzewde
--

ALTER TABLE ONLY public.attributes
    ADD CONSTRAINT attributes_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: places places_google_place_id_key; Type: CONSTRAINT; Schema: public; Owner: sitanzewde
--

ALTER TABLE ONLY public.places
    ADD CONSTRAINT places_google_place_id_key UNIQUE (google_place_id);


--
-- Name: places places_pkey; Type: CONSTRAINT; Schema: public; Owner: sitanzewde
--

ALTER TABLE ONLY public.places
    ADD CONSTRAINT places_pkey PRIMARY KEY (id);


--
-- Name: places_attributes untitled_table_pkey; Type: CONSTRAINT; Schema: public; Owner: sitanzewde
--

ALTER TABLE ONLY public.places_attributes
    ADD CONSTRAINT untitled_table_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: places_attributes attribute; Type: FK CONSTRAINT; Schema: public; Owner: sitanzewde
--

ALTER TABLE ONLY public.places_attributes
    ADD CONSTRAINT attribute FOREIGN KEY (attribute) REFERENCES public.attributes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: places_attributes place; Type: FK CONSTRAINT; Schema: public; Owner: sitanzewde
--

ALTER TABLE ONLY public.places_attributes
    ADD CONSTRAINT place FOREIGN KEY (place) REFERENCES public.places(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

