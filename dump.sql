--
-- PostgreSQL database dump
--

-- Dumped from database version 16.9 (Debian 16.9-1.pgdg120+1)
-- Dumped by pg_dump version 16.9 (Debian 16.9-1.pgdg120+1)

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
-- Name: actor_role; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE public.actor_role (
    id integer NOT NULL,
    person_id integer,
    film_id integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.actor_role OWNER TO symfony;

--
-- Name: actor_role_id_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE public.actor_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.actor_role_id_seq OWNER TO symfony;

--
-- Name: actor_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: symfony
--

ALTER SEQUENCE public.actor_role_id_seq OWNED BY public.actor_role.id;


--
-- Name: assessment; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE public.assessment (
    id integer NOT NULL,
    film_id integer,
    author_id integer,
    rating integer NOT NULL,
    comment character varying(255) DEFAULT NULL::character varying,
    created_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone NOT NULL
);


ALTER TABLE public.assessment OWNER TO symfony;

--
-- Name: assessment_id_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE public.assessment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.assessment_id_seq OWNER TO symfony;

--
-- Name: assessment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: symfony
--

ALTER SEQUENCE public.assessment_id_seq OWNED BY public.assessment.id;


--
-- Name: doctrine_migration_versions; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE public.doctrine_migration_versions (
    version character varying(191) NOT NULL,
    executed_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone,
    execution_time integer
);


ALTER TABLE public.doctrine_migration_versions OWNER TO symfony;

--
-- Name: film; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE public.film (
    id integer NOT NULL,
    directed_by_id integer,
    producer_id integer,
    writer_id integer,
    composer_id integer,
    publisher_id integer,
    name character varying(255) NOT NULL,
    genres json NOT NULL,
    release_year integer NOT NULL,
    description text NOT NULL,
    rating double precision NOT NULL,
    duration time(0) without time zone NOT NULL,
    age integer NOT NULL,
    slogan character varying(255) DEFAULT NULL::character varying,
    cover character varying(255) DEFAULT NULL::character varying,
    created_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone NOT NULL,
    poster character varying(255) DEFAULT NULL::character varying,
    trailer character varying(255) DEFAULT NULL::character varying,
    slug character varying(255) DEFAULT NULL::character varying,
    international_name character varying(255) DEFAULT NULL::character varying,
    country character varying(255) DEFAULT NULL::character varying,
    budget character varying(255),
    fees character varying(255)
);


ALTER TABLE public.film OWNER TO symfony;

--
-- Name: COLUMN film.duration; Type: COMMENT; Schema: public; Owner: symfony
--

COMMENT ON COLUMN public.film.duration IS '(DC2Type:time_immutable)';


--
-- Name: film_id_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE public.film_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.film_id_seq OWNER TO symfony;

--
-- Name: film_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: symfony
--

ALTER SEQUENCE public.film_id_seq OWNED BY public.film.id;


--
-- Name: film_person; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE public.film_person (
    film_id integer NOT NULL,
    person_id integer NOT NULL
);


ALTER TABLE public.film_person OWNER TO symfony;

--
-- Name: person; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE public.person (
    id integer NOT NULL,
    publisher_id integer,
    lastname character varying(255) NOT NULL,
    firstname character varying(255) NOT NULL,
    gender smallint NOT NULL,
    birthday timestamp(0) without time zone NOT NULL,
    age smallint,
    specialties json NOT NULL,
    bio text,
    cover character varying(255) DEFAULT NULL::character varying,
    avatar character varying(255) DEFAULT NULL::character varying,
    created_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT NULL::timestamp without time zone NOT NULL,
    slug character varying(255) DEFAULT NULL::character varying,
    international_name character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.person OWNER TO symfony;

--
-- Name: COLUMN person.birthday; Type: COMMENT; Schema: public; Owner: symfony
--

COMMENT ON COLUMN public.person.birthday IS '(DC2Type:datetime_immutable)';


--
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.person_id_seq OWNER TO symfony;

--
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: symfony
--

ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;


--
-- Name: refresh_tokens; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE public.refresh_tokens (
    id integer NOT NULL,
    refresh_token character varying(128) NOT NULL,
    username character varying(255) NOT NULL,
    valid timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.refresh_tokens OWNER TO symfony;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE public.refresh_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.refresh_tokens_id_seq OWNER TO symfony;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: symfony
--

ALTER SEQUENCE public.refresh_tokens_id_seq OWNED BY public.refresh_tokens.id;


--
-- Name: reset_password_request; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE public.reset_password_request (
    id integer NOT NULL,
    user_id integer NOT NULL,
    selector character varying(20) NOT NULL,
    hashed_token character varying(100) NOT NULL,
    requested_at timestamp(0) without time zone NOT NULL,
    expires_at timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.reset_password_request OWNER TO symfony;

--
-- Name: COLUMN reset_password_request.requested_at; Type: COMMENT; Schema: public; Owner: symfony
--

COMMENT ON COLUMN public.reset_password_request.requested_at IS '(DC2Type:datetime_immutable)';


--
-- Name: COLUMN reset_password_request.expires_at; Type: COMMENT; Schema: public; Owner: symfony
--

COMMENT ON COLUMN public.reset_password_request.expires_at IS '(DC2Type:datetime_immutable)';


--
-- Name: reset_password_request_id_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE public.reset_password_request_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reset_password_request_id_seq OWNER TO symfony;

--
-- Name: reset_password_request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: symfony
--

ALTER SEQUENCE public.reset_password_request_id_seq OWNED BY public.reset_password_request.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: symfony
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    username character varying(180) NOT NULL,
    roles json NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(255) DEFAULT NULL::character varying,
    age integer,
    about text,
    avatar character varying(255) DEFAULT NULL::character varying,
    display_name character varying(255) DEFAULT NULL::character varying,
    last_login timestamp(0) without time zone DEFAULT NULL::timestamp without time zone
);


ALTER TABLE public."user" OWNER TO symfony;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: symfony
--

CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO symfony;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: symfony
--

ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;


--
-- Name: actor_role id; Type: DEFAULT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY public.actor_role ALTER COLUMN id SET DEFAULT nextval('public.actor_role_id_seq'::regclass);


--
-- Name: assessment id; Type: DEFAULT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY public.assessment ALTER COLUMN id SET DEFAULT nextval('public.assessment_id_seq'::regclass);


--
-- Name: film id; Type: DEFAULT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY public.film ALTER COLUMN id SET DEFAULT nextval('public.film_id_seq'::regclass);


--
-- Name: person id; Type: DEFAULT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);


--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY public.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('public.refresh_tokens_id_seq'::regclass);


--
-- Name: reset_password_request id; Type: DEFAULT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY public.reset_password_request ALTER COLUMN id SET DEFAULT nextval('public.reset_password_request_id_seq'::regclass);


--
-- Name: user id; Type: DEFAULT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- Data for Name: actor_role; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY public.actor_role (id, person_id, film_id, name) FROM stdin;
\.


--
-- Data for Name: assessment; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY public.assessment (id, film_id, author_id, rating, comment, created_at, updated_at) FROM stdin;
1	1	1	4	Ничо так!	2025-02-18 08:26:16	2025-02-18 08:26:16
2	2	1	5	Что я могу сказать. Фильм просто отличный. Считаю его одним из лучших в истории мирового кино. Лет 8 назад смотрел на видео урывками - 'не дошло' - молодой, видимо, был еще слишком (17 лет - другие ценности, интересы).	2025-02-19 08:52:08	2025-02-19 08:52:08
3	4	2	2	Нудная картина о том, как смазливый самоуверенный парнишка стал наркоманом, а потом так же быстро и просто (учитывая возраст) бросил. Собственно даже самому моменту «бросания» уделено последние минут  7 фильма!	2025-02-26 07:59:26	2025-02-26 07:59:26
5	9	2	3	Вроде ничо. Но так себе, цепляет ненадолго. 	2025-02-26 09:43:37	2025-02-26 09:43:37
6	6	1	5	Классика!!!	2025-03-02 09:19:51	2025-03-02 09:19:51
7	13	2	4	1231232132131	2025-03-17 10:33:41	2025-03-17 10:33:41
9	1	2	4	!!!!	2025-03-19 10:26:22	2025-03-19 10:26:22
11	1	2	3	ЫЫ	2025-03-19 10:27:45	2025-03-19 10:27:45
13	2	2	2	Меня сейчас должны расстрелять из пушек, распилить бензопилой и скормить останки крысам...\nТут же речь идет о 3Д, правда? То есть, фильм тот же? Слюняво-слезливое подростковое порно на заднем седенье?	2025-03-27 12:34:16	2025-03-27 12:34:16
15	1	2	3	На троечку	2025-03-27 16:15:14	2025-03-27 16:15:14
16	1	2	1	Говно!	2025-03-27 16:15:44	2025-03-27 16:15:44
17	1	2	2	Ужс!!!	2025-03-27 16:15:59	2025-03-27 16:15:59
18	1	2	4	Норм!	2025-03-27 16:16:12	2025-03-27 16:16:12
\.


--
-- Data for Name: doctrine_migration_versions; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY public.doctrine_migration_versions (version, executed_at, execution_time) FROM stdin;
DoctrineMigrations\\Version20250209141716	2025-02-16 20:17:59	235
DoctrineMigrations\\Version20250215071454	2025-02-16 20:18:00	2
DoctrineMigrations\\Version20250310052109	2025-03-11 14:25:27	80
DoctrineMigrations\\Version20250310061237	2025-03-11 14:25:28	0
DoctrineMigrations\\Version20250311061222	2025-03-11 14:25:28	0
DoctrineMigrations\\Version20250311112555	2025-03-11 14:25:59	3
DoctrineMigrations\\Version20250317074416	2025-03-17 10:44:23	83
DoctrineMigrations\\Version20250317131408	2025-03-17 16:14:16	115
DoctrineMigrations\\Version20250318053104	2025-03-18 08:31:15	86
DoctrineMigrations\\Version20250318060545	2025-03-18 09:05:50	6
DoctrineMigrations\\Version20250408082132	2025-04-08 11:21:40	93
DoctrineMigrations\\Version20250626083514	2025-06-26 11:35:18	50
DoctrineMigrations\\Version20250626093907	2025-06-26 12:39:11	140
DoctrineMigrations\\Version20250626094720	2025-06-26 12:47:24	10
DoctrineMigrations\\Version20250714062842	2025-07-14 06:28:43	3
DoctrineMigrations\\Version20250714140648	2025-07-14 14:06:48	3
\.


--
-- Data for Name: film; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY public.film (id, directed_by_id, producer_id, writer_id, composer_id, publisher_id, name, genres, release_year, description, rating, duration, age, slogan, cover, created_at, updated_at, poster, trailer, slug, international_name, country, budget, fees) FROM stdin;
1	4	4	4	5	1	Темный Рыцарь	[2,4]	2008	«Тёмный ры́царь» (англ. The Dark Knight) — американский полнометражный художественный супергеройский фильм 2008 года с участием одноимённого персонажа комиксов издания DC Comics. Является продолжением фильма «Бэтмен: Начало» (2005) и вторым фильмом во франшизе «Тёмный рыцарь». Режиссёром фильма выступил Кристофер Нолан, сценаристами — сам Нолан, Дэвид С. Гойер и Джонатан Нолан. В фильме приняли участие актёры Кристиан Бейл, Майкл Кейн, Хит Леджер, Гэри Олдмен, Аарон Экхарт, Мэгги Джилленхол, Морган Фримен и другие. По сюжету Бэтмен с помощью лейтенанта Джима Гордона и окружного прокурора Харви Дента пытается контролировать преступность в Готэм-сити. Но когда преступник по прозвищу Джокер погружает город в хаос, Бэтмен начинает сомневаться в своих методах поддержания порядка[6]\n\n.\n\nПосле успешного возрождения серии фильмов о Бэтмене, начиная с картины «Бэтмен: Начало» (2005) компания Warner Bros. Pictures дала добро на разработку сиквела\n. Кристофер Нолан и соавтор сценария первого фильма Дэвид С. Гойер вместе разработали сюжетные линии, сделав Дента главным героем, оказавшимся втянутым в конфликт Бэтмена и Джокера. При написании сценария Кристофер и его брат Джонатан Нолан находились под впечатлением комиксов о Бэтмене 1980-х годов и криминальных драм, поэтому стремились продолжить ощущение реалистичности первого фильма. Основные съёмки фильма проходили в период с апреля по ноябрь 2007 года в Чикаго и Гонконге, а также на съёмочных площадках в Англии. «Тёмный рыцарь» стал первой крупной кинокартиной, снятой с помощью камер IMAX высокого разрешения. Нолан избегал использования компьютерной графики, настаивая на практических трюках\n\n.\n\nДля продвижения фильма использовалась инновационная интерактивная вирусная кампания, которая изначально была направлена на противодействие критике Леджера со стороны тех, кто считал его неподходящим на роль Джокера. В 2008 году Леджер погиб от случайной передозировки лекарствами, что привело к широкой заинтересованности прессы и общественности к игре Леджера\n. Фильм получил признание критиков за серьёзные для фильма по комиксам темы, визуальный стиль и игру актёров. Отдельно похвалу получила игра Хита Леджера, который, к тому же, был удостоен множества посмертных наград, включая премии «Оскар», BAFTA и «Золотой глобус» за лучшую мужскую роль второго плана. Тем самым, «Тёмный рыцарь» стал первым фильмом по комиксам, получившим главные награды киноиндустрии. Фильм побил несколько рекордов кассовых сборов и стал самым кассовым фильмом 2008 года, четвёртым самым кассовым фильмом на тот момент и самым кассовым фильмом о супергероях.	3	02:00:00	16	Хаос, всюду хаос!..	/uploads/films/1/gallery/picture-1.jpg	2025-02-18 08:12:15	2025-06-26 12:48:57	https://nebelschwimmer.site//uploads/films\\1\\gallery\\picture-1.jpg	https://www.youtube.com/embed/TsLEolNcXug	the-dark-knight	The Dark Knight	AT	123123$	123123123 $
6	12	12	4	10	1	Властелин колец: Братство кольца	[6,1]	2001	Сказания о Средиземье — это хроника Великой войны за Кольцо, длившейся не одну тысячу лет. Тот, кто владел Кольцом, получал неограниченную власть, но был обязан служить злу.\n\nТихая деревня, где живут хоббиты. Придя на 111-й день рождения к своему старому другу Бильбо Бэггинсу, волшебник Гэндальф начинает вести разговор о кольце, которое Бильбо нашел много лет назад. Это кольцо принадлежало когда-то темному властителю Средиземья Саурону, и оно дает большую власть своему обладателю. Теперь Саурон хочет вернуть себе власть над Средиземьем. Бильбо отдает Кольцо племяннику Фродо, чтобы тот отнёс его к Роковой Горе и уничтожил.	5	02:58:00	12	Power can be held in the smallest of things...	/uploads/films/6/gallery/picture-2.jpg	2025-02-24 05:16:03	2025-07-15 04:50:22	https://nebelschwimmer.site/uploads/films/6/gallery/picture-1.jpg	https://en.wikipedia.org/wiki/Cat	the-lord-of-the-rings	The Lord of the Rings	\N	\N	\N
4	4	4	7	5	1	Дневник баскетболиста 	[1]	1995	Героин умеет ждать…В его власти, когда-нибудь, будет и Джим. За очередную дозу он готов воровать, убивать, продаваться! Это будет… когда-нибудь… Дело времени…Опий умеет ждать. Повесть о погружении на самое дно улицы известного музыканта и поэта Джима Кэролла. Снятая в жестоком стиле, картина, которая шокирует своими откровенными сценами.	2	01:42:00	12	«Every punk on the block says it's not going to happen to them... but it does»	/uploads/films/4/gallery/picture-1.jpg	2025-02-20 08:22:45	2025-07-15 04:51:09	https://nebelschwimmer.site/uploads/films/4/gallery/picture-1.webp	https://www.youtube.com/results?search_query=starwars	the-basketball-diaries	The Basketball Diaries	US	\N	\N
15	12	4	7	10	2	Кин-Дза-Дза	[3,1]	1986	Прораб Владимир Николаевич Машков и не подозревал, что обычный путь до универсама за хлебом и макаронами обернется межгалактическим путешествием. А все эта встреча со странным босоногим человеком с каким-то маленьким устройством — «машинкой перемещения», как тот ее назвал. Владимир Николаевич нажал кнопку и оказался вместе со случайным попутчиком, студентом в кроличьей шапке, в какой-то пустыне — на планете Плюк в тентуре, галактика Кин-дза-дза в спирали.	0	03:23:00	12	\N		2025-03-18 10:33:44	2025-07-15 05:41:59	https://nebelschwimmer.site/uploads/films/15/gallery/picture-1.webp	http://sc35.incom-sr.ru/statistics/devices	kin-dza-dza	Kin-Dza-Dza	\N	\N	\N
2	4	4	4	5	1	Титаник	[5,1]	1997	«Тита́ник» (англ. RMS Titanic) — британский трансатлантический грузопассажирский и почтовый пароход, второй лайнер класса «Олимпик» компании «White Star Line». Лайнер был построен для совершения регулярных рейсов между Саутгемптоном и Нью-Йорком протяжённостью около 5800 км раз в неделю (в один конец). Крупнейшее судно начала XX века. При строительстве получил номер 401.\n\nВо время первого рейса, в ночь с 14 на 15 апреля 1912 года, столкнулся с айсбергом и затонул в Северной Атлантике.\n\nСтроился в Белфасте на верфи «Harland & Wolff» с 1909 по 1912 год. «Титаник» был оборудован двумя четырёхцилиндровыми паровыми машинами и паровой турбиной. Вся силовая установка обладала мощностью 55 000 л. с. Лайнер мог развивать скорость до 23 узлов (42 км/ч). Его водоизмещение, превышавшее пароход-близнец «Олимпик» на 243 т, составляло 52 310 т. Корпус судна был изготовлен из стали. Трюм и нижние палубы разделялись на 16 отсеков переборками с герметичными дверями. При повреждении днища попаданию воды в отсеки препятствовало двойное дно. Журнал «Shipbuilder» назвал «Титаник» практически непотопляемым, это высказывание получило широкое распространение в прессе и среди общественности[4]. В соответствии с устаревшими правилами «Титаник» был оснащён 20 спасательными шлюпками, суммарной вместимостью 1178 человек, что составляло лишь треть от максимальной загрузки парохода[5].\n\nКаюты и общественные помещения «Титаника» разделялись на три класса. К услугам пассажиров первого класса были представлены плавательный бассейн, корт для игры в сквош, ресторан «À La Carte», два кафе, гимнастический зал. Во всех классах имелись обеденные и курительные салоны, открытые и закрытые променады. Наиболее роскошными и изысканными были интерьеры первого класса, выполненные в различных художественных стилях с использованием дорогих материалов, таких как красное дерево, позолота, витражное стекло, шёлк и прочие. Каюты и салоны третьего класса оформлялись максимально просто: стальные стены окрашивались в белый цвет либо обшивались деревянными панелями.\n\n10 апреля 1912 года «Титаник» отправился из Саутгемптона в Нью-Йорк, в свой первый и единственный рейс. Совершив остановки во французском Шербуре и ирландском Квинстауне, лайнер вышел в Атлантический океан с 1317 пассажирами[6][7] и 908 членами экипажа[8] на борту. Планировалось прибыть в Нью-Йорк 17 апреля. Командовал судном капитан Эдвард Смит. 14 апреля радиостанция «Титаника» приняла семь ледовых предупреждений, однако лайнер продолжал двигаться почти на предельной скорости. Чтобы избежать встречи с плавучими льдами, капитан приказал идти чуть южнее привычного маршрута.\n14 апреля в 23:39 вперёдсмотрящий Фредерик Флит доложил на капитанский мостик об айсберге прямо по курсу. Меньше чем через минуту произошло столкновение. Получив несколько пробоин, пароход начал тонуть. В шлюпки сажали в первую очередь женщин и детей. В 2:18 15 апреля, разломившись на две части, «Титаник» затонул, унеся жизни 1496 человек]. 712 спасшихся человек подобрал пароход «Карпатия»\nОбломки «Титаника» покоятся на глубине 3750 м. Впервые их обнаружила экспедиция Роберта Балларда в 1985 году. Последующие экспедиции подняли со дна тысячи артефактов. Носовая и кормовая части глубоко ушли в донный ил и находятся в ветхом состоянии, подъём их на поверхность в целости не представляется возможным	3.5	03:15:00	12	My heart will go on!	/uploads/films/2/gallery/picture-1.jpg	2025-02-18 09:22:45	2025-07-15 09:55:32	https://nebelschwimmer.site/uploads/films/2/gallery/picture-1.webp	\N	titanic	Titanic	AL	\N	\N
3	7	7	7	5	1	Звездные войны	[7]	1977	Ещё в студенческие годы Джордж Лукас задумывал снять героическую космическую фантазию с космическими перестрелками в стиле фантастических комиксов и киносериалов, выходивших в США в 1940-е — 1950-е годы и «отмерших» к концу 1960-х. Основное влияние на «Звёздные войны» оказали космические оперы вроде сериала «Флэш Гордон» и франшизы о Баке Роджерсе, а также их прародитель — литературная серия Эдгара Берроуза «Джон Картер на Марсе». Сюжетно оригинальная трилогия «Звёздных войн» частично восходит к самурайским фильмам Акиры Куросавы (большей частью «Трём негодяям в скрытой крепости»). Также на сценарий фильма повлияли многие другие фантастические произведения, такие как роман «Космический жаворонок» основателя жанра космооперы Эдварда Элмера Смита и роман «Дюна» Фрэнка Герберта[4][5].\n\nВ мае 1971 года в Каннах Лукас подписал со студией United Artists контракт на съёмку фильма «Звёздные войны», а 1 августа того же года название «The Star Wars» зарегистрировано Американской ассоциацией кинокомпаний.\n\nНачалом истории «Звёздных войн» принято считать 1976 год. Именно тогда появилась одноимённая книга-новеллизация А. Д. Фостера (в издании указано авторство лишь Джорджа Лукаса), рассказывающая о событиях «Эпизода IV: Новая надежда». Продюсеры 20th Century Fox, опасаясь провала фильма в прокате, решили выпустить книгу раньше, чтобы оценить её успешность. В 1977 году на конгрессе Всемирного сообщества научной фантастики Джордж Лукас получил специальную премию «Хьюго»[6] за этот роман.\n\nПервый фильм вышел 25 мая 1977 года под названием «Звёздные войны». Фильм имел огромный кассовый успех, что фактически спасло компанию 20th Century Fox от угрожавшего ей тогда банкротства. Когда сомнения в окупаемости проекта отпали, первый фильм получил подзаголовок «Новая надежда», и вскоре за ним появились два продолжения — «Империя наносит ответный удар» (режиссёр Ирвин Кершнер, 1980) и «Возвращение джедая» (режиссёр Ричард Маркуанд, 1983).\n\nС самого начала отличительной чертой франшизы «Звёздные войны» стало массовое производство сопутствующих товаров, таких как пластмассовые фигурки персонажей, технических средств из фильмов и других игрушек, футболок с символикой фильма и т. д. Успешные маркетинговые ходы Джорджа Лукаса позволяли поддерживать у публики высокий уровень интереса к «Звёздным войнам» в перерывах между выходами фильмов. Доходы от продажи этих товаров превосходят доходы от проката самих фильмов[7]. Ту же цель преследовало создание фильмов-спин-оффов: помимо признанного провальным «Праздничного спецвыпуска» (1978), были сняты телефильмы «Караван смельчаков. Приключения эвоков» (1984) и «Эвоки. Битва за Эндор» (1985), а также мультсериалы «Эвоки» (1985—1986) и «Дроиды» (1985—1986). В 1980-х годах была выпущена серия компьютерных игр для различных платформ по мотивам фильмов трилогии. Компания «West End Games» выпускала настольные ролевые игры по «Звёздным войнам».\n\nВ течение всех лет существования, важной составляющей франшизы были комиксы. Основными издателями комиксов «Звёздных войн» были компании Marvel Comics (1977—1987 и с 2015) и Dark Horse Comics (1991—2014), а также газеты Los Angeles Times (1979—1984) и Watertown Daily Times (1979—1984).\n\nПосле спада интереса к франшизе в конце 1980-х годов последовал новый всплеск интереса, связанный с выходом в издательстве «Bantam Spectra» романов «Трилогии Трауна» Тимоти Зана. Успех романов породил выпуск в свет романов десятков различных авторов: в последующие годы ежегодно публиковалось более 10 книг по этой вселенной[8]. Второй составляющей роста интереса стал выпуск ряда успешных компьютерных игр, прежде всего серии симуляторов «X-wing» и шутеров серии Dark Forces/Jedi Knight.\n\nВ 1997 году, 20 лет спустя после выхода первого фильма, оригинальная трилогия была переработана с добавлением компьютерных спецэффектов и выпущена в повторный прокат. В повторном прокате фильмы собрали, соответственно, 256,5 млн, 124,2 млн и 88,7 млн долларов[9].\n\nВ 1999 году на экраны был выпущен фильм «Звёздные войны. Эпизод I: Скрытая угроза» (режиссёр Джордж Лукас), который положил начало новой трилогии — предыстории оригинальной. Затем вышли ещё два фильма: «Звёздные войны. Эпизод II: Атака клонов» и «Звёздные войны. Эпизод III: Месть ситхов» в 2002 и 2005 соответственно.\n\nВ 2000-е годы вышли мультфильм «Звёздные войны: Войны клонов» (режиссёр Дэйв Филони, 2008) и мультсериал «Войны клонов» (2008, каналы Cartoon Network и Netflix), продолжавший его. В 2014 году стартовал мультсериал «Звёздные войны: Повстанцы» (канал Disney XD), заменивший «Войны клонов». Всего в 2014—2018 годах вышло 4 сезона «Повстанцев», после этого стало известно, что «Войны клонов» спустя пять с лишним лет вернутся на седьмой и заключительный сезон на канале Disney+.\n\nВ январе 2012 года Джордж Лукас заявил о том, что больше не будет принимать непосредственное участия в создании фильмов саги «Звёздные войны». В октябре 2012 года было объявлено, что The Walt Disney Company покупает Lucasfilm и будет заниматься дальнейшей дистрибуцией фильмов (Lucasfilm Ltd. как подразделение The Walt Disney Company продолжил отвечать за производство фильмов). Шесть эпизодов и мультсериал «Войны клонов» (2008—2020) единственные стали частью нового канона.\n\nВ конце 2012 года был анонсирован седьмой фильм, являющийся продолжением VI эпизода. Фильм «Звёздные войны: Пробуждение силы» (режиссёр Джей Джей Абрамс) вышел в прокат в декабре 2015 года.\n\n10 декабря 2016 года состоялась премьера первого полнометражного кинофильма, не являющегося «Эпизодом» основной саги — «Изгой-один. Звёздные войны: Истории» (режиссёр Гарет Эдвардс). Действие в этом фильме происходило непосредственно перед событиями «Эпизода IV».\n\nВ марте 2015 года был анонсирован «Эпизод VIII: Последние джедаи» (режиссёр Райан Джонсон)[10], его мировая премьера состоялась 8 декабря 2017 года.\n\n10 мая 2018 года состоялась премьера второго спин-оффа «Звёздных войн» «Хан Соло. Звёздные войны: Истории». Фильм стал наименее успешным по кассовым сборам в истории саги.\n\nВ ноябре 2019 года на канале Disney+ состоялась премьера игрового сериала «Мандалорец» (создатель Джон Фавро). Действие сериала происходит между событиями VI и VII эпизодов саги[11][12][13][14][15][16][17].\n\nВ декабре 2019 года состоялась премьера фильма «Скайуокер. Восход» заключительного эпизода третьей трилогии саги (режиссёр Джей Джей Абрамс).\n\nВ ноябре 2017 было объявлено про новую трилогию фильмов под авторством Райана Джонсона. По состоянию на 2022 год, производство этих фильмов ещё не началось из-за занятости режиссёра на сторонних проектах.\n\nВ мае 2019 было объявлено о предстоящем выходе ещё трёх фильмов в 2022, 2024 и 2026 гг. Впоследствии эти годы неоднократно переносились и по состоянию на апрель 2023 было объявлено, что первые два фильма выйдут в 2026, а третий в 2027.\n\nВ октябре 2022 года был подтверждён выход ещё одного фильма, режиссёром которого выступит Шармин Обаид-Чиной, a в ноябре появились сообщения о фильме Шона Леви.\n\nВ апреле 2023 года на «Celebration 2023» было объявлено название фильма режиссёра Шармин Обаид-Чины «Звёздные войны. Эпизод X: Новый орден джедаев» (дата выхода назначена на 22 мая 2026 года).\n\n4 июня 2024 года на Disney+ состоялась премьера сериала «Звездных войн» — «Аколит». Действие «Аколита» разворачивается примерно за сто лет до событий, показанных в I эпизоде.[18]\n\nИерархия проекта\nПроект объединяет в себе киноэпопею из девяти полнометражных фильмов, нескольких телефильмов, игровых и анимационных сериалов, романы (в том числе и аудиороманы), повести и рассказы, комиксы и журналы, энциклопедии и художественные альбомы, литературу по ролевым играм, игрушки, компьютерные игры и тому подобное.\n\nИерархию проекта можно представить следующим образом:\n\n«Звёздные войны» (марка) — все вымышленные и документальные материалы, выпущенные по официальной лицензии Lucasfilm. Ныне принадлежит Disney.\nВселенная «Звёздных войн» (англ. Star Wars Universe, SWU) — совокупность всех вымышленных материалов по тематике «Звёздных войн», выпущенных по официальной лицензии.\nКиноэпопея «Звёздные войны» — события вселенной, изложенные в полнометражных фильмах.\nСага — девять фильмов-эпизодов (1977—2019), состоящих из трилогии приквелов (I, II, III; 1999—2005), оригинальной трилогии (IV, V, VI; 1977—1983), и трилогии сиквелов (VII, VIII, IX; 2015—2019).\nИстории — фильмы, рассказывающие о разных не связанных друг с другом событиях вселенной разных времён. Первым фильмом стал Изгой-один (2016), повествующий о группе повстанцев, выполняющих миссию по нахождению планов первой Звезды смерти у Империи, которые позже будут использованы Сопротивлением в битве при Явине. Второй фильм (2018) рассказывает предысторию Хана Соло — контрабандиста и героя Галактической гражданской войны, одного из главных персонажей классической трилогии.\nЛегенды — совокупность всех побочных полнометражных фильмов и телевизионных проектов, выпущенных на волне популярности классической трилогии и позже признанных неканоническими.\nРасширенная вселенная, РВ (англ. Expanded Universe, EU) — события вселенной «Звёздных войн», не рассказанные в фильмах; дополняет и расширяет вселенную на временной период в двадцать с лишним тысяч лет. События РВ описываются в литературных произведениях, комиксах, сериалах, видеоиграх и т. д.\nКанон — события РВ, признанные каноническими.\nЛегенды — события РВ, которые, в соответствии с названием, могут быть как полной или частичной правдой, так и ложью. Бо́льшая часть РВ.	4	03:23:00	12	Давным давно в далекой галактике	/uploads/films/3/gallery/picture-1.webp	2025-02-18 10:57:14	2025-07-15 17:30:49	https://nebelschwimmer.site/uploads/films/3/gallery/picture-1.jpg	https://www.youtube.com/results?search_query=starwars	star-wars	Star Wars	US	\N	\N
13	7	7	4	10	1	Крестный отец	[3]	1995	No movie changed Hollywood more than THE GODFATHER. From the bestselling novel by Mario Puzo to box-office blockbuster, its influential legacy endures to this day. Starring Marlon Brando in his Oscar®-winning performance as the patriarch of the Corleone family, this first installment in the three-movie saga paints a dramatic portrait of the Sicilian clan’s rise and near fall from power in America. Balanced between the Corleone’s commitment to family and the ugly crime business in which they are engaged, it features career-making performances by Al Pacino, James Caan, Talia Shire, Diane Keaton and Robert Duvall. This searing and brilliant masterpiece garnered ten Academy Award® nominations, and won three, including Best Picture. \n\nFeaturing: Marlon Brando, Al Pacino, James Caan, John Cazale, Robert Duvall, Diane Keaton, Sterling Hayden, Richard Conte, Talia Shire, Al Lettieri\n\nParamount Pictures Corporation (PPC), a major global producer and distributor of filmed entertainment, is a unit of Viacom (NASDAQ: VIAB, VIA), home to premier global media brands that create compelling television programs, motion pictures, short-form content, apps, games, consumer products, social media experiences, and other entertainment content for audiences in more than 180 countries.\n \nConnect with Paramount Pictures Online:	4	12:12:00	12			2025-03-14 09:18:04	2025-07-15 04:58:23	https://nebelschwimmer.site/uploads/films/13/gallery/picture-1.jpg	\N	the-godfather	The Godfather	\N	\N	\N
9	12	4	7	10	1	Поймай меня если сможешь	[3,1]	2002	Фрэнк Эбегнейл успел поработать врачом, адвокатом и пилотом на пассажирской авиалинии – и все это до достижения полного совершеннолетия в 21 год. Мастер в обмане и жульничестве, он также обладал искусством подделки документов, что в конечном счете принесло ему миллионы долларов, которые он получил по фальшивым чекам.\n\nАгент ФБР Карл Хэнрэтти отдал бы все, чтобы схватить Фрэнка и привлечь к ответственности за свои деяния, но Фрэнк всегда опережает его на шаг, заставляя продолжать погоню.	3.5	02:21:00	16	Правдивая история о реальном преступнике	/uploads/films/9/gallery/picture-1.webp	2025-02-24 13:31:22	2025-07-15 05:18:21	https://nebelschwimmer.site/uploads/films/9/gallery/picture-1.jpg	https://www.youtube.com/embed/4Ks0BcgbRJk	catch-me-if-you-can	Catch me if you can	AU	43234	324
\.


--
-- Data for Name: film_person; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY public.film_person (film_id, person_id) FROM stdin;
1	3
1	2
1	1
2	9
2	8
3	3
3	2
3	6
3	1
6	2
6	11
4	8
13	8
13	13
9	8
9	6
15	11
15	2
15	13
15	8
15	6
15	1
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY public.person (id, publisher_id, lastname, firstname, gender, birthday, age, specialties, bio, cover, avatar, created_at, updated_at, slug, international_name) FROM stdin;
7	1	Лукас	Джордж	1	1994-05-14 00:00:00	\N	[2,4,3]	Джордж Уо́лтон Лу́кас-младший (англ. George Walton Lucas, Jr.; род. 14 мая 1944, Модесто, Калифорния, США) — американский кинопродюсер, сценарист, режиссёр, монтажёр, оператор и предприниматель. Сооснователь кинокомпаний American Zoetrope (совместно с Фрэнсисом Фордом Копполой), Lucasfilm Ltd, ILM, THX, Pixar. Наиболее известен как создатель фантастической саги «Звёздные войны» и серии приключенческих фильмов об Индиане Джонсе. Лукас является одним из самых богатых режиссёров мира c собственным капиталом в 5 миллиардов долларов (2015 год)[1] и 4,6 млрд долларов (2016). Основную часть этой суммы режиссёр получил, продав свою компанию — Lucasfilm. 	https://nebelschwimmer.site	https://nebelschwimmer.site/uploads/person/7/photos/photo-1.jpg	2025-02-18 11:07:56	2025-07-15 05:04:35	george-lucas	George Lucas
9	1	Уинслет	Кейт 	2	1975-10-05 00:00:00	\N	[1]	Полное имя — Кейт Элизабет Уинслет (Kate Elizabeth Winslet).\nКейт Уинслет родилась в семье актеров Роджера Уинслета и Салли Бриджес.\nПопала в книгу рекордов Гинесса, т.к смогла заработать три номинации на Оскар до наступления тридцатилетия.	https://nebelschwimmer.site	https://nebelschwimmer.site/uploads/person/9/photos/photo-1.webp	2025-02-19 08:38:23	2025-07-15 05:04:56	kate-winslet	Kate Winslet
12	1	Джексон	Питер	1	1961-10-31 00:00:00	\N	[3,2,4,6]	Сэр Пи́тер Ро́берт Дже́ксон — новозеландский кинорежиссёр, сценарист, актёр и продюсер. Наиболее известен по эпической фэнтези-кинотрилогии «Властелин колец», снятой им по книгам Джона Р. Р. Толкина и завоевавшей 17 премий «Оскар»; 	https://nebelschwimmer.site	https://nebelschwimmer.site/uploads/person/12/photos/photo-1.jpg	2025-02-24 06:05:20	2025-07-15 05:05:50	peter-jackson	Peter Jackson
3	1	Уэллинг	Том	1	1997-04-26 00:00:00	\N	[1]	Уэллинг родился в Путнэм-Вэлли в штате Нью-Йорк в семье бывшего руководителя General Motors и домохозяйки. У него есть две старших сестры, Ребекка и Джейми, и младший брат, Марк[3]. Уэллинг имеет немецкие корни со стороны обоих родителей[4][5]. Работа его отца требовала частого переселения, и семье Уэллингов пришлось переехать из Нью-Йорка в Джейнсвилль в штат Висконсин, а затем в Хоккенсину, пока наконец они не осели в Окемосе в штате Мичиган[5]. В окемоской старшей школе Том посещал несколько спортивных секций, включая бейсбол и баскетбол. Он также был футбольным вратарём; он окончил школу в 1995 году[4].\n\nПосле окончания школы Уэллинг работал строителем; в 1998 году профессиональный фотограф, сфотографировав его на вечеринке на Нантакете, предложил попробовать себя в модельном бизнесе[4]. В 2000 году Том переехал в Лос-Анджелес, где снимался для Tommy Hilfiger, Abercrombie & Fitch, Calvin Klein[5], а затем начал актёрскую карьеру[4]. В 2001 году Уэллинг получил роль Кларка Кента в телесериале «Тайны Смолвиля», сделавшую его знаменитым[6]. За эту роль он был номинирован на премию «Сатурн» как лучший телеактёр пять лет подряд — с 2002 по 2006 год[7]. 	https://nebelschwimmer.site	https://nebelschwimmer.site/uploads/person/3/photos/photo-1.jpg	2025-02-18 06:35:39	2025-07-15 05:06:04	tom-welling	Tom Welling
2	1	Джолии 	АнджелинО	2	1975-06-04 00:00:00	\N	[1]	Онджели́на Джоли́ (англ. Angelina Jolie), до 2002 года Анджелина Джоли Войт (англ. Voight); род. 4 июня 1975, Лос-Анджелес) — американская актриса, кинорежиссёр, сценарист, продюсер и общественный деятель. Обладательница множества престижных наград, включая «Оскар», премию «Тони» и три «Золотых глобуса». Джоли неоднократно признавалась самой высокооплачиваемой актрисой Голливуда.\n\nС детства погружённая в мир кино благодаря семье, Анджелина дебютировала на экране в 1982 году, снявшись в фильме «В поисках выхода» вместе с отцом Джоном Войтом. Её профессиональная карьера стартовала десять лет спустя с роли в малобюджетном фильме «Киборг 2» (1993) и получила значительное развитие в конце 1990-х годов благодаря ролям в телефильмах «Джордж Уоллес» (1997) и «Джиа» (1998). Признание пришло к ней после работы в драме «Прерванная жизнь» (1999), которая принесла актрисе премию «Оскар» за лучшую женскую роль второго плана. Мировую популярность она обрела благодаря главной роли в фильме «Лара Крофт: Расхитительница гробниц» (2001) и успешным проектам, таким как боевики «Мистер и миссис Смит» (2005), «Особо опасен» (2008), «Солт» (2010) и «Турист» (2010). В числе её заметных работ также драмы «Её сердце» (2007) и «Подмена» (2008), последняя из которых принесла ей вторую номинацию на «Оскар», уже за лучшую женскую роль, а также фэнтезийный фильм «Малифисента» (2014) и его сиквел (2019).\n\nПомимо актёрской карьеры, Джоли добилась значительных успехов в режиссуре и сценарном мастерстве. Она сняла военные драмы «В краю крови и мёда» (2011), «Несломленный» (2014), «Сначала они убили моего отца» (2017) и «Без крови» (2024). В дополнение к этому, она продюсировала бродвейский мюзикл «Аутсайдеры» (2024), который был удостоен премии «Тони».\n\nДжоли известна своими гуманитарными усилиями. Она активно выступает за охрану окружающей среды, защиту прав детей, образование и права женщин и до 2022 года занимала пост специального посланника верховного комиссара ООН по делам беженцев. В этой роли она активно занималась гуманитарной помощью в лагерях беженцев и зонах военных конфликтов по всему миру. За свои достижения в этой сфере она была удостоена награды имени Джина Хершолта и звания дамы-командора британского ордена Святых Михаила и Георгия.\n\nАнджелина Джоли зарекомендовала себя как одна из самых влиятельных личностей в американской развлекательной индустрии и неоднократно признавалась одной из самых красивых женщин мира. Её личная жизнь, включая отношения и состояние здоровья, остаётся предметом постоянного внимания СМИ. Джоли трижды была замужем: за актёрами Джонни Ли Миллером, Билли Бобом Торнтоном и Брэдом Питтом, с последним из которых у неё шестеро общих детей!	https://nebelschwimmer.site/uploads/person/2/photos/cover_68762a735471a.jpg	https://nebelschwimmer.site/uploads/person/2/photos/photo-1.jpg	2025-02-17 13:01:45	2025-07-15 10:16:19	angelina-jolie	Angelina Jolie
8	1	Дикаприо	Леонарда 	1	1974-11-11 00:00:00	\N	[1]	Полное имя — Леонардо Вильгельм ДиКаприо (Leonardo Wilhelm DiCaprio).\nЕго отец происходит из семьи с итало-немецкими корнями. Мать, в девичестве Инденбиркен, родилась в западногерманском Ор-Эркеншвике. Её отцом был Вильхельм Инденбиркен, а матерью — русская Елена Смирнова, которая после переезда в Германию из России вышла замуж и приняла фамилию мужа — Инденбиркен.	https://nebelschwimmer.site/uploads/person/8/photos/cover_6876a03ea3bcc.jpg	https://nebelschwimmer.site/uploads/person/8/photos/photo-1.webp	2025-02-19 08:33:16	2025-07-15 18:38:54	leonardo-dicaprio	Leonardo Dicaprio
10	1	Шор	Говард	1	1946-06-18 00:00:00	\N	[5]	Говард Шор родился 18 октября 1946 года в Торонто, Канада, в еврейской семье. Окончил музыкальный колледж Беркли в Бостоне. В начале 70-х был саксофонистом группы Lighthouse[англ.], игравшей своеобразный прогрессивный хард-рок. После ухода из группы Шор написал музыку для шоу иллюзиониста Дуга Хеннинга «Spellbound»[6].\n\nС 1975 года Говард стал режиссёром и одним из основателей знаменитой комедийной передачи «Субботним вечером в прямом эфире» на NBC. Он редко появлялся в кадре, но иногда участвовал в комедийных музыкальных номерах[7].\n\nС 1980 года Говард Шор сосредоточился на карьере композитора. Основной сферой деятельности канадца стали саундтреки к кинофильмам. Его первым фильмом (ещё во время работы на телевидении) была драма «I Miss You, Hugs and Kisses» (1978). С тех пор Шор написал саундтреки порядка двух сотен фильмов, среди которых — «Муха», «Молчание ягнят», «Догма», «Эд Вуд», «Банды Нью-Йорка», «Игра», «Авиатор», «Сумерки. Сага. Затмение». 	https://nebelschwimmer.site	https://nebelschwimmer.site/uploads/person/10/photos/photo-1.jpg	2025-02-24 05:22:00	2025-07-15 05:03:20	hovard-shore	Hovard Shore
11	1	Вуд	Элайджа	1	1981-01-01 00:00:00	\N	[1]	лайджа Вуд начал свою актёрскую карьеру в младшей школе, участвуя в постановках «Звуки музыки» и «Удивительный волшебник из страны Оз». До того, как его семья переехала в Лос-Анджелес в 1988 году, Вуд был моделью. В 1989 году снялся в клипе Полы Абдул «Forever Your Girl», срежиссированном Дэвидом Финчером.\n\nДебют в кино — эпизодическая роль в фильме «Назад в будущее 2» (1989). Но только роль сына Эйдена Куинна в фильме «Авалон» (1990) впервые привлекла внимание к молодому актёру, потому что фильм получил хорошие отзывы критиков и был номинирован на кинопремию «Оскар». Роджер Эберт в своей рецензии сказал: «Появился Элайджа Вуд, и я верю, что это самый талантливый актёр его возраста за всю историю Голливуда».\n\nПосле небольшой роли в фильме Ричарда Гира «Внутреннее расследование» (1990) Вуд получил свою первую значительную роль. Это была роль в фильме «Рай» (1991), в котором он сыграл мальчика, воссоединившего семью (Мелани Гриффит и Дон Джонсон). Он получил хорошие рецензии за своё исполнение, некоторые критики говорили, что он был одним из лучших в кинофильме. Затем он получил роль в фильме «Вечно молодой» вместе с Мелом Гибсоном и Джейми Ли Кёртис, и в фильме «Стремящийся ввысь» с Ричардом Мазелло (оба фильма вышли в 1992 году). 	https://nebelschwimmer.site	https://nebelschwimmer.site/uploads/person/11/photos/photo-1.webp	2025-02-24 05:53:31	2025-07-15 05:07:16	ellijah-wood	Ellijah Wood
6	1	Форд	Харрисон	1	1942-07-13 00:00:00	\N	[1]	Ха́ррисон Форд (англ. Harrison Ford; род. 13 июля 1942[1][2][…], Чикаго, Иллинойс) — американский актёр кино и телевидения, продюсер. Номинант на премию «Оскар», BAFTA, четырёхкратный номинант и обладатель специальной премии «Золотой глобус», почётной «Золотой пальмовой ветви», а также почётного «Сезара». Наиболее известен по участию в серии фильмов «Звёздные войны» (ролью Хана Соло), «Индиана Джонс» (заглавной ролью), и дилогии «Бегущий по лезвию» (ролью Рика Декарда), а также по фильмам «Игры патриотов», «Беглец», «Самолёт президента», «К-19» и «Свидетель». \nЕго отец Кристофер Форд (1906—1999), происходил из ирландской семьи. Его бабушка, Анна (Нехама) Лифшиц родилась в Российской империи в еврейской семье в Минске. В 1907 году она эмигрировала в США и обосновалась в Бруклине (Нью-Йорк). В 1906 году в Америку из Российской Империи (тоже из Минска) приехал Гарри Нидельман, устроившийся водителем трамвая. После свадьбы в 1917 году, в Бруклине, у Гарри и Анны родилась дочь — Дора, ставшая позднее Дороти (1917—2004). Дора Нидельман вышла замуж за ирландца Кристофера Форда (1906—1999), и в их семье был рождён будущий актёр Харрисон Форд[3]. Своё имя актёр получил в честь деда Гарри.\n\nВ 1960 году он окончил школу и поступил в Рипон-колледж[англ.] (штат Висконсин). В 1964 году он переехал в Лос-Анджелес, где заключил контракт с Columbia Pictures. Сначала Харрисон Форд считался актёром-неудачником, особенно после того, как при монтаже были вырезаны все его сцены из фильма «Забриски-пойнт». После этого он забросил карьеру и стал плотником. Однажды Джордж Лукас случайно встретил его и пригласил на съёмки фильма «Американские граффити» (1973). 	https://nebelschwimmer.site	https://nebelschwimmer.site/uploads/person/6/photos/photo-1.jpg	2025-02-18 11:04:54	2025-07-15 05:06:57	harrison-ford	Harrison Ford
4	1	Кэмерон	Джеймс	1	1954-08-16 00:00:00	\N	[3,2,4]	Джеймс Фрэ́нсис Кэ́мерон (англ. James Francis Cameron; род. 16 августа 1954 года, Капускасинг[англ.], Онтарио, Канада) — канадский кинорежиссёр и кинопродюсер, чаще всего работавший в жанре фантастического боевика.\n\nКэмерон впервые добился признания как режиссёр фильма «Терминатор» (1984). Затем критический и коммерческий успех обрели такие его картины как «Чужие» (1986), «Бездна» (1989), «Терминатор 2: Судный день» (1991) и «Правдивая ложь» (1994). Начиная с фильма «Титаник» (1997), Кэмерон снимал исключительно высокобюджетные, масштабные и кассовые блокбастеры, создание каждого из которых занимало много лет. Фильмы Кэмерона в общей сложности собрали примерно 2 миллиарда долларов в США и 8 миллиардов долларов по всему миру, что сделало его вторым самым кассовым кинорежиссёром всех времён. Его «Аватар» (2009), «Аватар: Путь воды» (2022) и «Титаник» (1997) — соответственно, первый, третий и четвертый из самых кассовых фильмов всех времён, каждый из них заработал более 2 миллиардов долларов в прокате. «Титаник» также удостоился 11 премий «Оскар», в том числе «Лучший фильм», «Лучший режиссёр» и «Лучший монтаж». Также Кэмерон — один из основателей производственных компаний Lightstorm Entertainment, Digital Domain и Earthship Productions. В 2010 году журнал Time признал Кэмерона одним из 100 самых влиятельных людей в мире.\n\nЗа пределами кино Джеймс Кэмерон — исследователь подводного мира, член Национального географического общества, защитник окружающей среды. Снял серию документальных фильмов о подводном мире, таких как «Призраки бездны: Титаник» (2003) и «Чужие из бездны[англ.]» (2005), внёс вклад в развитие подводной съёмки и разработал цифровую 3D-камеру Fusion Camera System[англ.]. В 2012 году Кэмерон стал первым человеком, который в одиночку спустился на дно Марианской впадины в подводном аппарате Deepsea Challenger. 	https://nebelschwimmer.site/uploads/person/4/photos/cover_68768ef192e13.jpg	https://nebelschwimmer.site/uploads/person/4/photos/photo-1.jpg	2025-02-18 06:41:07	2025-07-15 17:25:05	james-cameron	James Cameron
1	1	Cruise	Tom	1	1962-07-03 00:00:00	\N	[1]	Родился 3 июля 1962 года в Сиракузах (штат Нью-Йорк)[4] в семье инженера-электрика Томаса Круза Мапотера III (1934―1984) и учителя-дефектолога, Мэри Ли (урожденная Пфайффер; 1936―2017)[5]. Его родители были родом из Луисвилла, штат Кентукки[6][7], и имели английское, немецкое и ирландское происхождение[8][9]. Том — третий ребёнок в семье, у него есть три сестры: Ли Энн, Мариан и Касс[10]. Ли Энн (англ. Lee Anne Devette)[11] сейчас скрывается от популярности брата в Океании. Один из его кузенов, актёр Уильям Мэйпотер, снялся вместе с ним в пяти фильмах[12]. В поисках работы семья часто переезжала, что стало одной из причин трудного детства актёра. Когда Тому было 12 лет, его родители развелись. Позже в интервью Круз называл своего отца хулиганом и трусом, который избивал своих детей[13]. В 1978 году Мэри Ли вышла замуж за Джека Саута. К 14 годам Том сменил 15 школ в США и Канаде. Окончательно его семья осела в Глен Ридж, штат Нью-Джерси. В детстве у него были кривые, неправильно растущие зубы[14]. Круз вырос в нищете и был воспитан католиком.\n\nВпервые Том занялся драматургией в четвёртом классе под руководством Джорджа Штейнбурга. Вместе с шестью другими ребятами он поставил импровизированную пьесу под музыку, названную «IT» на театральном фестивале начальной школы Карлтона. Том получал церковную стипендию и посещал францисканскую семинарию в Цинциннати, штат Огайо. Сперва он стремился стать священником, но потом заинтересовался актёрским мастерством[15]:24–26[16]. В выпускном классе средней школы он играл в футбол за университетскую команду в качестве полузащитника, но был исключен из команды после того, как его поймали за распитием пива перед игрой. Он продолжал играть в школьных постановках, включая мюзикл «Парни и куколки»[17]. В 1980 году Том окончил среднюю школу Глен-Риджа в Нью-Джерси .	https://nebelschwimmer.site/uploads/person/1/photos/cover_68768ff23f6a8.jpg	https://nebelschwimmer.site/uploads/person/1/photos/photo-1.jpg	2025-02-17 11:46:07	2025-07-15 17:29:22	tom-cruise	Tom Cruise
5	1	Уильямс	Джон 	1	1932-02-08 00:00:00	\N	[5]	Джон Та́унер Уи́льямс (англ. John Towner Williams; род. 8 февраля 1932 года) — американский композитор и дирижёр, один из самых успешных кинокомпозиторов в истории[4]. За свою карьеру Уильямс написал музыку к таким известным картинам, как «Как украсть миллион», «Звёздные войны» (в том числе, знаменитый «Имперский марш»), «Индиана Джонс: В поисках утраченного ковчега», «Один дома», «Челюсти», «Супермен», «Инопланетянин», «Список Шиндлера», «Парк юрского периода», «Гарри Поттер» и многим другим. Также Уильямс создал музыку к четырём Олимпийским играм, множеству телесериалов и концертных номеров.\n\nУильямс — пятикратный лауреат премии «Оскар» (за музыку к фильмам «Скрипач на крыше»[N 1], «Челюсти», «Звёздные войны. Эпизод IV: Новая надежда», «Инопланетянин», «Список Шиндлера») и 54-кратный номинант[5] (лучший результат среди киномузыкантов и второй по количеству номинаций на «Оскар» за всю историю (больше только у Уолта Диснея — 59)). Лауреат Национальной медали за вклад в искусство (США)[6]. 4 раза был удостоен премии «Золотой глобус» (27 номинаций), 7 раз — премии BAFTA (7 номинаций), три раза — премии «Эмми» (6 номинаций), а также 25 премий «Грэмми» (71 номинация)[7].\n\nУильямс известен своим многолетним сотрудничеством с такими ведущими американскими кинорежиссёрами, как Стивен Спилберг (29 совместных работ) и Джордж Лукас. 	https://nebelschwimmer.site	https://nebelschwimmer.site/uploads/person/5/photos/photo-1.jpg	2025-02-18 07:45:03	2025-07-15 05:03:57	john-williams	John Williams
13	1	ДюВал	Клеа	2	1977-07-25 00:00:00	\N	[1]	Клеа Дюваль дебютировала в фильме «Маленькие ведьмы» (Келси), но настоящим прорывом стала роль Стокли в фильме Роберта Родригеса «Факультет» в 1998 году, где девушка сыграла наряду с Джошем Хартнеттом, Элайджа Вудом, Робертом Патриком, Джорданой Брюстер, Лорой Харрис, Фамке Янссен, Сальмой Хайек и другими. Среди прочих фильмов с её участием можно выделить такие как «Прерванная жизнь» (Джорджина), «Жена астронавта» (Нэн), «Это всё она» (Мисти), «Неисправимые» (Грэм), «Призраки Марса» (Башира Кинкейд) и «13 разговоров об одном» (Беатрис).\n\nПосле появления в «Проект Ларами», «Идентификация» и «21 грамм», Дюваль снялась в роли Софи в сериале «Карнавал», получившем «Эмми», который транслировался по HBO с 2003 по 2005 годы. За это время она также снялась в телевизионном фильме «Helter Skelter» (за эту роль она была номинирована на ежегодную премию «Спутник») и сыграла совместно с Сарой Мишель Геллар в фильме «Проклятие». Она также появилась вместе с Геллар в эпизоде сериала «Баффи — истребительница вампиров» (эпизод «С глаз долой — из сердца вон»).\n\nПоследние проекты включали в себя «Лесбийский комитет», «Зодиак», а также актриса получила постоянную роль в сериале «Герои», премьера и трансляция которого состоялась на канале NBC. В 2008 году она появилась вместе с Энн Хэтэуэй в фильме «Пассажиры».\n\nТакже Клея Дюваль снялась в короткометражном фильме под названием «Нелегко быть зелёным», главные роли в котором помимо неё самой исполнили Лейша Хейли и Карла Галло. Приняла участие в фотосессии рекламных фотографий для группы Uh Huh Her. 	https://nebelschwimmer.site	https://nebelschwimmer.site/uploads/person/13/photos/photo-1.jpg	2025-02-24 06:15:48	2025-07-15 05:05:13	clea-duval	Clea DuVal
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY public.refresh_tokens (id, refresh_token, username, valid) FROM stdin;
1	0225b7caac87904d4cd2bb6fc411ba61d25e4e33c73b6ace60852ebbed860370b53f2bedcc06f41caad5ca3a0e9f2531c2020700a91a7d2289cae965b935149f	admin	2025-03-19 11:13:07
2	4cfb896e06ecd79c60ee3d12da28e8de049d7da53e9ccdb2a3bd73b62af3aac85ea1625ddf010150d41a9696438b933d8bc362ce28c7522c10ff897b7d305e37	admin	2025-03-19 11:41:20
3	35d9c559849d5ed1721d2885aa58bb1065ae0204c9f58b6e6f80ca73a836061d65a92099ed5bea664306d3f4b6630bc0f633c8b96ab5a67393ba2a9881903c1b	admin	2025-03-19 12:24:45
4	ba7ff6863242a25b8f4d0665db6579989fb947d7ba1ea879204bac7c29ff221bdc6467e0f9f0a4f75d5d932b629b40df753310e9f695f6bc71c27cd61cb3c98e	admin	2025-03-19 12:30:43
5	1033a8f189bfbb1e6e268e66bdad337ce78c09149ef7fe2ec67056f65126f73f8a5457905eb9a06828493a0c67c930f34ffb6cfb9e654d7611d07fe1bec94d1d	admin	2025-03-19 12:58:36
6	4fbf0e334106f49f0fe85c11558c70bc0c17d881b8d26fde4953d578fa54d0725123fc713453e774bd35b04bd867ad6e9ed96a2649ce7923addced9248f29929	admin	2025-03-19 13:05:24
7	201eded74f2b7aee0bfa908fda585589afbb353c67d1c4f8fd51e261baf99ea9cf1a45982c031507a920ca15d6bf47e02b1a7f1069bf46648d9af07cb9bcfe34	admin	2025-03-20 04:54:39
8	b37debcf685301234f080451e2162e1a8d4c76196ff9076f254f0789fb95c9231753cc354aaadf230f1cb0cedaa97bcc23c573c2a0864eb2611355dba99b8a3e	admin	2025-03-20 05:32:27
9	6010c9a4b79335a400f459d9d097f46d72ec64c0517da6efa7bcc27ff77b8d1e646c9fcd7ef768a32531eaa30ee220ce06fc9a07a9b6633afb398c2c120e5550	admin	2025-03-20 06:34:51
10	6bc6356ac72f21acbf7148b210fd6d6b8e94da449304ef19665475ecef6f614f356062229d58da830a7ec2bff9fa9cd3671cdbbb2829eb733560b9c7b8cf0aba	admin	2025-03-20 07:02:14
11	fbf2ea70a6cc06908707e5a53a4c7b572f44eab5f958a1a378a0676f7e7c1025103fa085bee6eaa3043d9365a695f9083032c984eb6cb5c6adc4e674a95ccd74	admin	2025-03-20 07:37:35
12	86355d491a8fd8a2329f8bb62be79323e3afe2f99c89fbfc6228093de89ac2c74b082c82c848e65734d869274c3d14a99ca61bd08970403b8aab5a984fd6c2a4	admin	2025-03-20 08:07:57
13	cb7ed999165e33d1951c16335b019fb0a5c7c2db34044aaaed924d1cc33a66500f6d7459c850b0798434633d8ac1fe33a0665aee7cb97048b6244713aea1e766	admin	2025-03-20 08:10:30
14	13d76fa3fb00ccd43f2350c6fab2fd981c8a89bb75f55bd010889072605fa965841dd22d830419a391faf76b7e84ad2296bdc50133aff591f096022e6dc402fa	admin	2025-03-20 08:16:34
15	8b591721aad9061582e568d872f2fee019809d9205e3127111f85240f5985d1cd4bf61a75c8ce1714f2d00d8ba59b304721d51ab61ec9edc81e12b9e7b857ddb	admin	2025-03-20 09:14:17
16	90dffb4b0c30e68887feb4f0be9413a93ea5198871701988f0acd47dd6c8e0b1634aac97c1ff3f8f2b7d07d5f224cabc5d66efa9b0e1ede6b76e6823faa0210b	admin	2025-03-20 09:54:28
17	7bcdbff0bf21512f25e7773b4f764968314c0d557c364102db917129aad780cc9a38eaee45dcf6cb10912c9521415be8c56987f1a52b82a4ec3658b75990fb21	admin	2025-03-20 10:55:30
18	c504a1672628de601d8192868818d75d69d2b5d5593c2ce7a6cd73119776c157c5c1f8c47e28cda021385d026bf7e32d2b3a9b4c37dc52e5836d4a09715d3199	admin	2025-03-20 11:01:06
19	912a16826e09dda65c91be440e0e68d852a3b68db5c83bcb9197afa606a5b11124a98cb967c8c28804055fa8e2895bb3f8ce39940abca2ca494f86895cf3d976	admin	2025-03-20 11:02:04
20	391a077fe1aa90f405cb43ab2b53acfdc8ccf88c873acab752fb08dabc97dafbe72c4d21c578a1197f38cf293a94d6a7191235694cd96abd2bf088dca4cce379	admin	2025-03-20 12:17:45
21	63bf9f6b833f6cef39ee0231b107385fe2dbc69cbb23bd2b925756bd4345ae54a9d13b9e4a45de66375845262b62467440ed47d6fdcbcfc6d9617df54fc6d061	admin	2025-03-21 08:27:22
22	e2cd5edf7b47f31cebf6759b62ad3dabf2bb97de9d33ecb722f5295a7bfab6d4bab12a0f7700660f9cbe7f89b28a6b948cd19222ff805fc37df72ccaa79f9687	admin	2025-03-21 08:41:17
23	a0c595480c9d773417575d9921ee4d1e850917fc38a5955e761e7b010e284003fd46a54159fef7dd73168f247d0b03ac4238dc4ecd99e086e311a7c044e8cedb	admin	2025-03-21 08:51:17
24	9594c13afeccea44784961a74cb7943875039ac4f1545d23dbefe12e76ed8fecf8dbf6514b313898556658aa16672e1739d2d13de6f40cb52623bd5f0d488695	admin	2025-03-21 09:35:24
25	ff49ccb532d3e18d9daaab3b23b52ea0b1111e5c1f49217eb15c8331bf25169a73b56fcedae521610fc4fe06149624f2cc567cba8b92d3b2b8ba87f664c975b3	admin	2025-03-21 13:11:21
26	baae53614a0f7f498fa5dcf508939f52bd0dff4e7b3c7b1f700aeffb21c10212cff5f02efc4485bcd40aa3011727611b9cb8bb6af9ad90a2ba49d3485c1b57d3	admin	2025-03-22 07:53:45
27	6acb78401f377e81034818aa6ae0e94f1c8b8f1b1b64f2eb75bbbdcfc7aac31610eed4a7d96f180a92ead3ba8b28827b2e92b01e505bea10d8b8b02f12182d1b	admin	2025-03-22 08:13:39
28	5923223c2ddd21a17a1aca485befd3c181ec0482e075f71d98f1d48c462b00e812f02f19effa2793082a8f0b541ba0d98b25ffe09326aea2da465badf77daa3c	admin	2025-03-22 08:32:34
29	04beea935f245fbf8a282b1f8514f78ed6620f15902155ecc9de024636bbe58f2d7c4ea5fcbfc89a747ea3d550157d58414018650dae2b609a282fd0adc9803e	admin	2025-03-22 13:08:50
30	7e4f18cd91202248f3ec81098f452208e526f2ca861d5d36824cd8c9f16e1d2645ef955681d33a50b992fb5a0f46c4b04a865ca5bbcec3e8f6ad732e881de2f0	admin	2025-03-23 08:38:52
31	ac66f08ae9bbafa5c5c5deaf80e85eb0822b9b62776d74319e879cacff7f22c4dfac69a720e9ee57cb99de589ecf7bc7f5d014bac9988694816f12867430080a	admin	2025-03-23 10:47:30
32	ac325701c14e1016e56bdc4e74ae420ac79a72cf5b49e13b107635230f6bfd1d45c143591867edc7fa9324aed70c8abd277cfd6051c0b82a760436acfe849f92	admin	2025-03-23 11:04:22
33	0ba9dd730779d07fa8244939e25d3dfa6b4f8d3919d3213aee4edee56a7af24361dbfd40080d4082ca2d756ef41b58630b8b4683a400b301f0cae05f924187df	admin	2025-03-24 08:50:00
34	5f82ab8ca9a353ce210151f3251202451eb3f0441e2b44ae959b93a0e6abcc50a769ae8f9876453904f42f1d778ef4c4ac8c3e01c4923ea3b4dee1d303f8e4d7	admin	2025-03-26 05:13:11
35	5a5ff792f55754da290104dff961c15ac0120769df65937902b0f0be07442c42ccbcf671efd309b3ef491707a0de108e9152e464aa4b696d9116ef08c21cf032	admin	2025-03-26 05:51:56
36	bab0edb4d2ff970fcd6026f86b7ca5dee86acbbbe0dbf2ec73462fa7c41507b98218eedb6f49bedc0c74095b2a31ed4af7cee1d2afe790f0791511ffbf8da65f	admin	2025-03-26 06:03:29
37	5d1d163319de3e623cf7f8b14c68eedaa186906818666bfba9b8b973edf9d83f91f95dc8900599db7f53eac531f805b50c44163f40308fffd0b003b3a31e6f23	admin	2025-03-26 06:06:30
38	644d9191aef4425495809a31a8d73fd9b93de4d41f2373c8191efddecd00e76bbc53fc55f2ea7f6d33462955141ce1807aeb5781580c85d5ed6d19e7505c2add	admin	2025-03-26 06:12:01
39	e5b515e4f2a7232b8bf3eae5c902d2a1ce09d9dc06566fd197a53fff6761f24721ee3e336b28be96028d2a911cdfac872ac160974afdea1f6752347968dc77f6	admin	2025-03-26 06:52:40
40	074816764900d8889cd7086615d186659b2005141c467e41c98848b79eac43e203ce96328a5e9b35a9a162aa1038406e9325ae85934e696fd62be167bb0c3ffc	admin	2025-03-26 08:57:06
41	423aed728befba596bd8f968f0fb1d549acc9752c895484d4eddfc42f73f825afdbbd95293c187bf69cbb13019e6ff8e55055529ce741f0ceba3467672f0fb4e	admin	2025-03-26 13:20:48
42	c61ef51374a84b26949873ba2ec611891dd367299597141f9490d3b30ee8ac4434f4dd0134831b1a0d97fce6e9bc51c87617e890e1ddc772fca96de4b7c32dc5	admin	2025-03-26 13:29:27
43	bc15e8614aaf9780be6d06ef367879ed56d5eb7923600a9ede0af0d36c0e2941604682ab97264b00d58dfe8c16a7914d4fe34ba593acb79de63e2cbb86cd4b87	admin	2025-03-26 13:34:11
44	412506e456adb7a03797016367477d123143455e31a309e9017ed1148b953fa725f6802b83de399b4bec06cd3e78de790adf162412475ec6e2ee541913741cd0	admin	2025-03-28 07:15:47
45	af3f52e6c5716d953903ac383110385e34832eb6412fd050b5c20821bbd786371b8d40de736d38896d04ee73f45b02b5a7183ad28a53f72c5825f737fd982584	admin	2025-03-28 07:20:35
46	49e49ebc01277120c1b0f217bcd6ccc43c79cb8ff439e86b36d9d86a4d4b7a68742ad2b05764868529a7df15b86c13c3093b3394e050a5eb86d8f43cc3a82a07	nebelscwhimmer	2025-03-28 07:23:32
47	ed5c586625118c97100952f2265f6f2449afdd4e50ec43678c4703505e88712e2f281d492c9fc43d13bd61691c7135bca769c5597bdedf1ded30b440b5ff2605	nebelscwhimmer	2025-03-28 07:34:55
48	6546142d4ea8bbba1a6e1c7233b8cc17edb67e44c8c1a7583a2000662c3d96fb648511f24509844de3168eb6612c30a67e7c7569b9e05f97b2f93381adc59150	nebelscwhimmer	2025-03-28 07:46:35
49	30d91e44255bef4f30488077e48f324482e5b4e8aad64cad8480e912341bc6b77aadf334c81000d97ca45169feff16265f91e733fbff955fd0b8c2461d92bdd1	nebelscwhimmer	2025-03-28 07:50:37
50	473dfb413946fc5d2b1de2de9d5a003612435ac0b9f0af5d82e3676a2809162f8a88d9898dcbd1b1429d4744a7c5427c7a9c6b4aa58ee78a6c1d01776b55931c	nebelscwhimmer	2025-03-28 07:54:04
51	916cfd951de9cc5c6c0c55ea7c4e2d2933d6b891bd8863250b5e5b713a9b4c161885b05f3f0adeb62342861abdcb7dc3e6b976e6e299d67d60ed8691b16877c5	nebelscwhimmer	2025-03-28 08:20:46
52	b99a4b5a967302fd2d5d6bedd9f8d349461a84f5cc0f8b816c281d75d06c44b3e4d92f5f6ac5ae1a1c550f33e94c9a6be39003ce6f01a3dd0475ff1c0010b4b8	nebelscwhimmer	2025-03-28 08:39:54
53	a15406f95f4d5814e5c4ac515361319bfe5fdee81b237de5e6c36e8f52afdeac37910aef4007009d15b5c8fadc18dbfc89cd908868285ff9cede9948f0c0f791	nebelscwhimmer	2025-03-28 09:04:45
54	f1214d16a8bb82751066b7d887e4706471a938db20458efeffc5e20d8e6ee9a23458e500f9bae047fd719463e54bc32375b737bfe67f4c00a9d2195ce6c5cac9	nebelscwhimmer	2025-03-28 09:13:43
55	0900a4f8865271c39f8d5e8e38c81bbc5af2c91541a78b9f17bcc29a2f4924e02793f1e6538e3d4c93bc0c2bc0ec22d951de75c640bef560db74200b6b2bcd6c	nebelscwhimmer	2025-03-28 09:19:09
56	dfb52e3c32d375e22c2e88752c00e0de9b276a1b00d4270e388e869d5dfa6a78aca72aecfb9e70b765ab3746b5560fb3031c308d48d97a465f20ed2b7acb5990	nebelscwhimmer	2025-03-28 09:27:10
57	eb136c26688203373ca599b3de75a1531b5f1a719b3de2802e46a81527dc593f987b193d9c161f1046bcb83709a315a2e1c7033cc5b1de96ffcf37e49a10c440	nebelscwhimmer	2025-03-28 09:42:00
58	331ec45c235bcb3539be921ef31bf2bbd94bd49b9c5236809225a12f130f221375b35e56f6e0a4171e7ccc3748912e5633b934c66bdca4a378f178bdf755d27c	nebelscwhimmer	2025-03-28 10:43:01
59	adbc1e077d8f76a9bbb265ce3be7f46a155be317a75278f90dcbcd98794bc0e514990a7edd47415b52cff69ad42928e0dadbf3bcf7257dad37231cfdb7bac2c4	nebelscwhimmer	2025-03-28 10:55:37
60	6890f2de7f49916dd68f286c8d63a3881d68ffed90322ad0837833a6be035f3022acabb741c62cdecf45155b1ebdfd0b414424dd65ea494a038c31ee79970951	admin	2025-03-31 05:46:25
61	bd103d07dfcdbda966ab95bf33a4156768f0252c700a670d4862fe4d28619701c4d45a8bf26f4f4c37941ddd8f2127f9e5e85f2bd61f679591e383fe020f43a4	admin	2025-03-31 18:27:34
62	d30a135caa8e43c33b0112daca4d384c3e5b5e8fedb53aa21c84be4c599f4ab83456b1acaf523f7f379e52b0cd37a452b7beefa7688d019f638b58c8c3766538	admin	2025-03-31 19:40:56
63	5cdf82c3d5bf658f88c9404a492260289ef8c361ccdbb6d50ffbc1a756d68ff7aaabad017efbc22760fee761a908870f4eb5968dddedffc128a828ab9fb3cfb5	admin	2025-03-31 19:46:16
64	b0280d7cdd2892d28ef10a91a9f2e991712741fa95af3bbd32082fd526c0317bfc3961ebda41c2ee870e0a7b19b8a91425ed33cf406448e7eb0070b27e46910a	admin	2025-03-31 20:29:14
65	7a1bd3ae2a7897d52f376b4e4b5e9557ecba70a0677d87d49c5c42070895fe813d33dca8af959b498ad0b6dcecb92b5df94478e4c3382973413e14976190036e	admin	2025-04-01 08:36:30
66	836b7b4e816dbd6b8fe589bdef2e5d8f81f2cfbbb7ae5a3aebf0df15a3c923bd1af5d68bec54d2f7dcc25162eb8780694206180062ce6969279c3ecf5f087ecd	admin	2025-04-01 09:02:21
67	d312523d341cbf3fd2c101fc5d69b77b120e1f315e5290f42e60576cdd98e9b4f659f300b50ce04f3f7cc78c68531ee43a9a7b8d369d54aaa5ed9c45e72571b6	admin	2025-04-01 09:04:16
68	b32dfe7bf96942301062b61c3ff7727dbe80dde768c89f8e62b6493ee68f2b5b7fef5c61ef142fe31ca0e6807edd774b6edc23315745821d58853ad84ff37519	admin	2025-04-10 14:36:44
69	5c7595627be6bc086079d2aa9456ed0692433b16ebc1ddd87c731a4dd406c3f0b0d5967b5aee63fc8a759cc5daf8d05f9dce8f9afb11d97d9ce572e3ad46e0ae	admin	2025-04-11 12:21:02
70	8f2ace83da1d59459bf8a4729f7f7909eadeebece159b9d51476b80c55588f8974785ac5de1ebc7b40c6562b9c1cb6f3bbe021237087389cba81ae41ac2e5a6c	admin	2025-04-11 12:41:24
71	79e9f26f1d562b60e5defc2e836ad38e7959565502dc4181bdd5cebdbd020109069564c9101191b7fb6d7ee5b2afc60368d9435f28f2cb968c8db6a5f23afd51	admin	2025-04-11 12:51:14
72	7489f832d274d43601d42cf5f30704cbb22e3ae56ec0c4a9a900c3caffa5b0817ecf7e414c6e770fa018f8c17012658f6ba53fb9b69a5b85418f3f04c8157870	admin	2025-04-11 12:56:27
73	fabd612ebe94b74b1a53dac3a20beaa4c394e03b621230e2f005f2fe3d1e9e9a9f4668ea3a6dcd794d011e241eba60474d579601c79e672d7bae0a9c6a381237	admin	2025-04-11 14:23:57
74	19591dfbb3409cafe9026f7b41be746e817dcadc7fbf3876da7aa7271b7d262b674ae7875f3bf678b765f99adc41c11835470418d82147e726a2c10258c684ad	admin	2025-04-11 15:17:00
75	b6106426e4f0ebda9db0b534e0b96febcd8a94ef9465e641e696cd14619c28ff27f13204d292c57acb076fb394b6d527080933e4adccbcd8c9c0ecb37415f37a	admin	2025-04-11 16:19:58
76	4e616b97be24149310c4f4cceb956676da55c56dc287f0a044d137bc9715eae8f45a5b0e273f02face3971c4eaf75e12e34402fa696fc4e568c1f0e67d301d22	admin	2025-04-13 09:06:57
77	1df33ccad155ac50476c6d294dc17482b692185cd3a6c8157b5da053d201660cc9ba74d4185d84958c5cd6da724c61c22f0ad5c0d9032f9236370fb2ea8074f5	admin	2025-04-13 11:32:45
78	7aaab0ec122693c9bff5b5400929005947b38ccc618ee6124a9e7a9d069b5f1917025932b281d6c3ec970662eb3d827584a3f80c65ce07f3a6bb9638c81ae8b4	admin	2025-04-13 12:02:26
79	42dbfcb30c12f527117e8bc66c0fd8b3f391b5e86d193d3c366c7ea6445b833261f06425c8fad57a4ef99f7a77a6d2556927a738ac16c373ced8a5002e835db3	admin	2025-04-16 08:13:07
80	9a576401f6a3ff903ad71926f7738d1140506241cf98c80f11221163d4a965f425b0f229348083cb009269f33accd819806c6378d9206c6225bf29d19e0db623	admin	2025-04-16 08:16:59
81	d51a8eadd1cffe44d3ff36f08c75afe9081fca082963f94370f13832d1665f4e1764064d96c6f12ad476a4bb05552ee71261ad1af5f3514855ab320e9e647c57	nebelscwhimmer	2025-04-16 08:50:38
82	85d98b8a4dbce6519d4b02b22c8f3e804e960b5cab363528e9b2791b033b7f3cd3738b78dd1e97488c9adb227b9c8244c24c08ec5e5e928420c4099b75bdcb87	nebelscwhimmer	2025-04-16 09:34:29
83	64d5a362497fa9824b2f25344c0fd064d65282eca105a2e5d49accdb93d2ae51ba33ed68591e09785c52ad2c47c5ad108d1e5d4a9f6f479a952b23dad78977e5	nebelscwhimmer	2025-04-16 10:06:13
84	a7307582c627d9f124fa50b46555deabfd3ab932c898d498fcf41a01006f3d6e8e0e5cb00bdd19816e35ab59b77d1209d42b872a720c8c0d3c09fa9a065bda12	admin	2025-04-16 10:41:12
85	435c293152dcad4c880e4451218e0dd49770430c693e232a824fc1dfd59132a714ad6d2407a78eca325ce92225f7ce79821ffcc18d60541880043c828c1e55be	nebelscwhimmer	2025-04-16 12:02:17
86	3cddee42471a900a66d9cbd4cb4bc3aefda1cff49c60e4e601a783180fa27a27182c954e37211b706999850b74059631636fc6f5b88e99bf4201a48a71603703	nebelscwhimmer	2025-04-17 08:41:25
87	fff69314d7e3a2fb72c7779a829d75772a24ff1aa2d6bf182264a7517acbbe055489ef712fd87ebb89538f1a629d29f03e0a292dbf1497e31c75085a641880a2	nebelscwhimmer	2025-04-17 10:21:09
88	3c20562cea36c7f147a3d239ed56560546aeb16af8d3cea963a0cd8dba30e34846a6edc487eceeb4493d0979a5d53f8298f0b3b1a8db6234c02b772bd43a1cc8	nebelscwhimmer	2025-04-17 11:35:19
89	772372604215b6263f4827d3b5d7e9ac5276a8d80a49b4569ebfe3aad4bf573dc719aab159c0c2bd610804772444b4391271214c865006862d13d98417890b02	nebelscwhimmer	2025-04-17 16:05:41
90	293d3dbc46a1bc0bacaf2e718d34697b87709e9c666c4062c8eba46aa74dc7a38e42b8731bf9c431341b20bb3ca35076c06bad672f4b7fc7034b507a88ae92b5	nebelscwhimmer	2025-04-18 08:44:17
91	bf7dd41b979f6deaad198aeef78ac35833522d6ad756546b008e5fc6ac8eab47f830372f93c9fdf0ca34ebb2112dc0607e38b707e886c27ed5eac9a9d4192424	nebelscwhimmer	2025-04-18 10:25:20
92	9f474e01632f765596337fa93941f48cf5912bfdfe9cb157a35cec09e885e6c76c88bafca72a29d161c807dc6e282b01ba00dd7e756b286aa5e33dd786458693	nebelscwhimmer	2025-04-19 08:02:39
93	759e63e466441841e0d2aeabc33586fd0da0c7d15a587891902d487572737027f6ac5422f2dfc192d4330375d41eb5a17621b6b2ce3d8b49d36ef3ad3634125c	nebelscwhimmer	2025-04-19 10:09:44
94	3945eac688525528ab71b5739d320967a258fd4efc7fa3ca8824b4ea379bb4ff858fafeb902bcd9d967e17c021ce03395d7b6bdeeb1f8c3a301d59e5ac9b87eb	nebelscwhimmer	2025-04-19 11:55:57
95	11627270eb5ae08539cd0872e499a379fc830148cbd03501e6493a508e3db1d0d93ee4bf101a2603a55a08c612833b76d61f11220c1edf92cbf3f47109954e05	nebelscwhimmer	2025-04-19 15:18:55
96	823c02b776593f68fdd654c511b09fbd86bd24fc0eaf783cf491038bd4b262a42ce8685d35dd385a22c77a3e67786c5a393f0f1373fdb2785c962c855770a466	nebelscwhimmer	2025-04-26 12:00:16
97	5c67fba654757e665ff146060d1c709b8c456e754c1f049889ba286d10342c21e39cdbd1577d42a9f83b9669fcd4bd0572d5fd293112e8855a8ada4e464fea00	nebelscwhimmer	2025-04-26 15:04:18
98	e105ac84bfe17ed51901880c7e928381f0fbe3f58f57510e9d03a5e1cabfa276a303fc001b1e5fe28e83ba5c46d723c6ea172d3f0f34f03720dbd435b48dcaed	nebelscwhimmer	2025-04-26 16:14:17
99	f06fc114f9f2396beeac14773729aaede5a44ad86fdb2a0be878d00ebadf68f7cf320f75f3b7a1ec04a6a56d627dc91a5aa441a682131757988809422a04b277	nebelscwhimmer	2025-04-30 14:31:48
100	1442ce1575ee11f272cb35582bd65baa6ee27d8c3c0e3e98c6b8a805583182525f42667ffae9fc8b7890dee45282f8536807973f414cd2979c1a2c8cd52a2ef0	nebelscwhimmer	2025-05-01 14:16:38
101	02d639c2169683f595696c76a575fdd8859ba379729780c1e6218b65f5f1b23a5e3e247f151432501977a2f9ce726f330b62efdeec03259aaa7b8aeaf5dce2d1	nebelscwhimmer	2025-05-08 09:58:25
102	2d6de4a24003abbc80962ee9f928537e06b74203d4107b08d321e0d03fa0b22b5eccfaa645ae6abea45886ca2db001089033c373bfd8a1725ac2277ace3d11cf	nebelscwhimmer	2025-05-08 10:59:04
103	00747f5bb95761a36e43a8aee6d285cfa8d6c89b4e84a2250b0fcb779c7361e576474cca4595a768d42f8555c37863d1f90af19ee629a415b09316d63b2a4d63	nebelscwhimmer	2025-05-08 11:20:33
104	91df2455a81bc5b6a7b1b5af692af0d03e57ff94cd51920c5e77bbcf16b68e1bd86644349e74d62bf8cd9980539e48ba91948af768e215614811477e45cb4edd	nebelscwhimmer	2025-05-08 11:20:46
105	659e31ed7bd228ec4835736f7bb956208e06d2f74d4e6c07b879d4fa4976159c5de36e29285acea3dc706562974d2432b401533ee40ce57053068a9abd5411e6	nebelscwhimmer	2025-05-08 12:23:24
106	183c66632b8dc1113b123ae9e9313cd063f18c5b76176eb39296b510ca42730b59824ffaed0d0b5d7c5e9161d524a6c068d177eaf25f99f1e134372c54e0adea	nebelscwhimmer	2025-05-08 13:24:32
107	64827ce95626d6dc0d9aa0c84c2decccdf2c78f5a63547599b894abe17f6f968a7bd7d3d4b109b8d9ee7e430d6015058ea7020e2137a7197398931735f859437	admin	2025-06-05 10:40:32
108	82f6af15ea075cbe3712e59400088d76b7b9344eb9e76238802cc653b8fab70943e980d4a705f0f8621f01c440ab8d39a649575785c6865852c3ebf6c230f3b0	nebelscwhimmer	2025-06-05 10:41:23
109	df25a4739166d9e1de9bc72cdcbfc4dbee302ac212087120acc2d6a67dc5148fc0f7a737543a956c6be0d1e3730736b92ed331021f4e127461b916ee63484671	nebelscwhimmer	2025-06-05 12:04:54
110	1f4e8b6283aff3354e06c8e1a501ea188df825f0c787a438f8d8a0c2c1c0123764bc23339c530b1e4a12501cf9f17a04bac6c96c825b297c2dbce0275f4c3cc3	nebelscwhimmer	2025-06-05 12:05:15
111	7fbe20e963d98dd8bc6c2c3d89c1df14032c74bb3aa638c6d48f7e5fd1dbc99f40fdc4938bed2c42a9c89dac6bb6aee108af71106e210e3c1f036c81fe646c53	nebelscwhimmer	2025-06-05 13:09:55
112	df23210a3ef27cfb5340122be1a515127d5b5a084ca7a0930d605dd738e98cef78c51cacfed65c9f27d4e92d9c3633a43194322eadba74519c7792e9d6f5b245	nebelscwhimmer	2025-06-05 13:11:24
113	564c1af7be4bb9ff94cde4c2bfe90f8b48437e6a40d8c143e63b48eb5d8843686a4c9d6121afd8c225a766016314c5513552bba87cc54fd869410279d9f0975d	nebelscwhimmer	2025-06-05 14:51:25
114	a3b255c74c3dd9978ac2bae521d00f1a83ce2c0a26c443619b3d0f036cb4a2b7d64c299fe9e51d37abf84d9ef9da5ac4c036d5a965c8e5112eef7aa514b8c8c3	nebelscwhimmer	2025-06-05 15:44:17
115	c1609b1467a797491666669d7447b7cf2ad256f34fe9a8c68dc1c8ce764124249af0a410b1dc857dce42a94cbe8ee9246a6510c7e3af47a4a2f27505e1133cb6	admin	2025-06-06 14:02:25
116	42280e008d22be825b8c3220940657e941142c31b67907b9f1293974a88957d7380b9ccfa704d10b3313423c248fcb4eef0f0a2e2dc6581468b50e257e82b19c	nebelscwhimmer	2025-06-15 15:07:46
117	7793f2357329083ce630e30a152262467e11f09fbdf0c3e35ca2ac34a3cecfe7fa4ab62ceda07be82f272ba57a992f1a99bacf64b1c60d1730d1d58de6973ee5	admin	2025-07-26 11:53:21
118	8b55b3e25be97ac337f8ccc417951b33dc943b0c1f2e294a7da8b3a434391e4f2879712022843962d12e114fad2b7849940b90b25cd17cccccffeeac2291d480	admin	2025-07-26 11:53:36
119	aaff7314d24c2f5bb08c9f14e8127163d236f7883228afa6076cfcae311b2122aa148137e16b15b893cd9b6887a23ecbb16a15fb2e92ca493c3f702dc2a0f7e4	nebelscwhimmer	2025-07-26 11:54:00
120	28ef0fa54c3e5cd3459acd00887dc78e162154edd9e0f99fc79d4064163ff17da95d61bbb9f952b7b2145e748bf4eac9a0fd330be1c05cac474a2b2be63276ad	admin234	2025-07-26 11:56:08
121	6d67b8b6d7b68cdd4d9ffcbbbfe96ec7cd9dfb27c9097e80fe277dc04ff009553f10bd6e779b9a37070b1edf3a875984d3a76e7a3d144ec9882076b88d22556f	fgswimmer	2025-08-14 04:46:33
122	6b42b7a7011ec42fa7d6975feeda1d8af353d42be6010b0e3d708d9250387ff04d750020c9299cd3c29034b55a1e9357375db5c41b0f1e74de31ddd60e200fe6	fgswimmer	2025-08-14 05:18:13
123	bc2fde1c5568c12bf0eb6790e1fd2339da9f0582a4ad3864a00d6778b05587d4d627f9b823c144212c48856970ce5714ecde3d7236becc70d421d9ad00c007d4	fgswimmer	2025-08-14 06:50:05
124	0c93207a07469f3808f2fedcdc09d5f15bfe0ea70ab8cf0bf671918b8d455d2dacb618c229226fca147e0b0414eb4fb3d7dc5ba7a14815a0b94b61a2a9ce1ac0	nebelscwhimmer	2025-08-14 08:01:02
125	bf91058a0ba6f12f8b2302e2e414b27cefc31a2f3814dae016464e831ed51ee5bd6c0f473ba155bfc7c22f8b2605e50124d064d2abe2060b300e670472a07841	fgswimmer	2025-08-14 09:14:47
126	10316edb24e891c13264fc1a16d55c196f200970892e444b5a289bc3afe4a714201e789023ee66cb33d3ba9117e68f0e33cc85df7b69fdcfaf72d471e9686ee7	fgswimmer	2025-08-14 17:14:09
127	f347c19b915c17e053cfcaff815b9b91dc584393fc5fd413973993871e95924faa465aaf4638321315c0dc5c8650308c762b32e01c11c27ff22da0b80e2e16e2	admin	2025-08-14 17:35:45
128	89605b5b285d0b663075069caa4fe3b00217f0cee81530cb69f80876a10059dae4d8d399007eeeb04aaac4e44fcc76f9fc443ea3653c74fa19bb5e736abd9855	fgswimmer	2025-08-14 18:28:30
129	90c0a1360f9438f61844457e4d7e7b6e3ef22589fb2698909f8b7db0dc541e19cbeab63b497e8978186b502b6a121c70dfe73274ec0449f7e35f4dfff6385ef8	fgswimmer	2025-08-14 18:38:31
\.


--
-- Data for Name: reset_password_request; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY public.reset_password_request (id, user_id, selector, hashed_token, requested_at, expires_at) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: symfony
--

COPY public."user" (id, username, roles, password, email, age, about, avatar, display_name, last_login) FROM stdin;
3	admin234	["ROLE_USER"]	$2y$13$2jSNYkrnqep0C9pVEyJ5eOkYBn2wiSfQre9wEcUUbcL087jbFoF06	admin@hmfd.com	18	sdff	\N	Admin	\N
2	nebelscwhimmer	["ROLE_USER", "ROLE_ADMIN"]	$2y$13$XJRzbuci3YesmRctYuaA1u6I8dOPqRL7GDNsjrlpOEByxpPO.Rz0K	nebelschwimmer@gmail.com	34	[Куплет 1]\nТы спросишь меня, почему иногда я молчу\nПочему не смеюсь и не улыбаюсь\nИли же наоборот, я мрачно шучу\nИ так же мрачно и ужасно кривляюсь\n\n[Припев]\nПросто я живу на улице Ленина\nИ меня зарубает время от времени\nПросто я живу на улице Ленина\nИ меня зарубает время от времени\n\n[Куплет 2]\nЧто же ты хочешь от больного сознания\nВ детстве в голову вбили гвоздей люди добрые\nВ школе мне в уши и в рот клизму поставили\nВот получил я полезные нужные знания\n\n[Рефрен]\nВедь родился и вырос на улице Ленина\nИ меня зарубает время от времени\nВедь родился и вырос на улице Ленина\nИ меня зарубает время от времени\n\n[Соло на балалайке]\nSee upcoming rock shows\nGet tickets for your favorite artists\nYou might also like\nWrite this Down\n2Pac\nПесня о Безответной Любви К Родине (Вкус Родины) (Song of Unrequited Love for the Motherland (Taste of Motherland))\nНоль (Nol)\nдень рождения наоборот (birthday on the contrary)\npyrokinesis\n[Припев]\nПросто я живу на улице Ленина\nИ меня зарубает время от времени\nПросто я живу на улице Ленина\nИ меня зарубает время от времени\n\n[Куплет 3]\nКак ненавижу, так и люблю свою Родину\nИ удивляться здесь, право, товарищи, нечему\nТакая она уж слепая, глухая уродина\nНу а любить-то мне больше и нечего\n\n[Рефрен]\nВот так и живу на улице Ленина\nИ меня зарубает время от времени\nВот так и живу на улице Ленина\nИ меня зарубает время от времени\n\n[Припев]\nПросто живу я на улице Ленина\nИ меня зарубает время от времени\nПросто я живу на улице Ленина\nИ меня зарубает время от времени	https://nebelschwimmer.site/uploads/user/2/avatar//avatar-68760ade94db5.jpg	Nebelschwimmer	\N
4	fgswimmer	["ROLE_USER"]	$2y$13$gzBjcMRZXQMhCpkC0yP31.6k.VtNJ9TsBi6bm/ltxLg8TNu5fkVuO	fgswimmer@gmail.com	33	The Creator	https://nebelschwimmer.site/uploads/user/4/avatar//avatar-687690d630251.jpg	Fogswimmer	\N
1	admin	["ROLE_USER"]	$2y$13$wp9BnWrybo9wMnG8nhjPH.Q/Z1B7bpqZ4Oziwmeb7UwB1xPTDNZPm	admin@nebelschwimmer.site	33	I am admin!	https://nebelschwimmer.site/uploads/user/1/avatar//avatar-687693e41091d.jpg	Admin	\N
\.


--
-- Name: actor_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('public.actor_role_id_seq', 1, false);


--
-- Name: assessment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('public.assessment_id_seq', 18, true);


--
-- Name: film_id_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('public.film_id_seq', 23, true);


--
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('public.person_id_seq', 16, true);


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('public.refresh_tokens_id_seq', 129, true);


--
-- Name: reset_password_request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('public.reset_password_request_id_seq', 25, true);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: symfony
--

SELECT pg_catalog.setval('public.user_id_seq', 4, true);


--
-- Name: actor_role actor_role_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY public.actor_role
    ADD CONSTRAINT actor_role_pkey PRIMARY KEY (id);


--
-- Name: assessment assessment_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY public.assessment
    ADD CONSTRAINT assessment_pkey PRIMARY KEY (id);


--
-- Name: doctrine_migration_versions doctrine_migration_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY public.doctrine_migration_versions
    ADD CONSTRAINT doctrine_migration_versions_pkey PRIMARY KEY (version);


--
-- Name: film_person film_person_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY public.film_person
    ADD CONSTRAINT film_person_pkey PRIMARY KEY (film_id, person_id);


--
-- Name: film film_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_pkey PRIMARY KEY (id);


--
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY public.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: reset_password_request reset_password_request_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY public.reset_password_request
    ADD CONSTRAINT reset_password_request_pkey PRIMARY KEY (id);


--
-- Name: user user_pkey; Type: CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: idx_34dcd17640c86fce; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_34dcd17640c86fce ON public.person USING btree (publisher_id);


--
-- Name: idx_5f2eec7c217bbb47; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_5f2eec7c217bbb47 ON public.film_person USING btree (person_id);


--
-- Name: idx_5f2eec7c567f5183; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_5f2eec7c567f5183 ON public.film_person USING btree (film_id);


--
-- Name: idx_6721b899567f5183; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_6721b899567f5183 ON public.actor_role USING btree (film_id);


--
-- Name: idx_7ce748aa76ed395; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_7ce748aa76ed395 ON public.reset_password_request USING btree (user_id);


--
-- Name: idx_8244be221bc7e6b6; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_8244be221bc7e6b6 ON public.film USING btree (writer_id);


--
-- Name: idx_8244be2240c86fce; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_8244be2240c86fce ON public.film USING btree (publisher_id);


--
-- Name: idx_8244be227a8d2620; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_8244be227a8d2620 ON public.film USING btree (composer_id);


--
-- Name: idx_8244be2289b658fe; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_8244be2289b658fe ON public.film USING btree (producer_id);


--
-- Name: idx_8244be22c52e0aea; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_8244be22c52e0aea ON public.film USING btree (directed_by_id);


--
-- Name: idx_f7523d70567f5183; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_f7523d70567f5183 ON public.assessment USING btree (film_id);


--
-- Name: idx_f7523d70f675f31b; Type: INDEX; Schema: public; Owner: symfony
--

CREATE INDEX idx_f7523d70f675f31b ON public.assessment USING btree (author_id);


--
-- Name: uniq_6721b899217bbb47; Type: INDEX; Schema: public; Owner: symfony
--

CREATE UNIQUE INDEX uniq_6721b899217bbb47 ON public.actor_role USING btree (person_id);


--
-- Name: uniq_8244be22989d9b62; Type: INDEX; Schema: public; Owner: symfony
--

CREATE UNIQUE INDEX uniq_8244be22989d9b62 ON public.film USING btree (slug);


--
-- Name: uniq_9bace7e1c74f2195; Type: INDEX; Schema: public; Owner: symfony
--

CREATE UNIQUE INDEX uniq_9bace7e1c74f2195 ON public.refresh_tokens USING btree (refresh_token);


--
-- Name: uniq_identifier_username; Type: INDEX; Schema: public; Owner: symfony
--

CREATE UNIQUE INDEX uniq_identifier_username ON public."user" USING btree (username);


--
-- Name: person fk_34dcd17640c86fce; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT fk_34dcd17640c86fce FOREIGN KEY (publisher_id) REFERENCES public."user"(id);


--
-- Name: film_person fk_5f2eec7c217bbb47; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY public.film_person
    ADD CONSTRAINT fk_5f2eec7c217bbb47 FOREIGN KEY (person_id) REFERENCES public.person(id) ON DELETE CASCADE;


--
-- Name: film_person fk_5f2eec7c567f5183; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY public.film_person
    ADD CONSTRAINT fk_5f2eec7c567f5183 FOREIGN KEY (film_id) REFERENCES public.film(id) ON DELETE CASCADE;


--
-- Name: actor_role fk_6721b899217bbb47; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY public.actor_role
    ADD CONSTRAINT fk_6721b899217bbb47 FOREIGN KEY (person_id) REFERENCES public.person(id);


--
-- Name: actor_role fk_6721b899567f5183; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY public.actor_role
    ADD CONSTRAINT fk_6721b899567f5183 FOREIGN KEY (film_id) REFERENCES public.film(id);


--
-- Name: reset_password_request fk_7ce748aa76ed395; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY public.reset_password_request
    ADD CONSTRAINT fk_7ce748aa76ed395 FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- Name: film fk_8244be221bc7e6b6; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT fk_8244be221bc7e6b6 FOREIGN KEY (writer_id) REFERENCES public.person(id);


--
-- Name: film fk_8244be2240c86fce; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT fk_8244be2240c86fce FOREIGN KEY (publisher_id) REFERENCES public."user"(id);


--
-- Name: film fk_8244be227a8d2620; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT fk_8244be227a8d2620 FOREIGN KEY (composer_id) REFERENCES public.person(id);


--
-- Name: film fk_8244be2289b658fe; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT fk_8244be2289b658fe FOREIGN KEY (producer_id) REFERENCES public.person(id);


--
-- Name: film fk_8244be22c52e0aea; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT fk_8244be22c52e0aea FOREIGN KEY (directed_by_id) REFERENCES public.person(id);


--
-- Name: assessment fk_f7523d70567f5183; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY public.assessment
    ADD CONSTRAINT fk_f7523d70567f5183 FOREIGN KEY (film_id) REFERENCES public.film(id);


--
-- Name: assessment fk_f7523d70f675f31b; Type: FK CONSTRAINT; Schema: public; Owner: symfony
--

ALTER TABLE ONLY public.assessment
    ADD CONSTRAINT fk_f7523d70f675f31b FOREIGN KEY (author_id) REFERENCES public."user"(id);


--
-- PostgreSQL database dump complete
--

