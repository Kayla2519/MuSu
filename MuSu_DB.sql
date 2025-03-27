--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-03-26 13:57:15

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 230 (class 1259 OID 16646)
-- Name: __EFMigrationsHistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);


ALTER TABLE public."__EFMigrationsHistory" OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16584)
-- Name: artists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artists (
    artist_id integer NOT NULL,
    name character varying(255) NOT NULL,
    genre_id integer NOT NULL,
    moods character varying(255) NOT NULL
);


ALTER TABLE public.artists OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16583)
-- Name: artists_artist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.artists_artist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.artists_artist_id_seq OWNER TO postgres;

--
-- TOC entry 4971 (class 0 OID 0)
-- Dependencies: 221
-- Name: artists_artist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.artists_artist_id_seq OWNED BY public.artists.artist_id;


--
-- TOC entry 218 (class 1259 OID 16564)
-- Name: genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genres (
    genre_id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.genres OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16563)
-- Name: genres_genre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genres_genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.genres_genre_id_seq OWNER TO postgres;

--
-- TOC entry 4972 (class 0 OID 0)
-- Dependencies: 217
-- Name: genres_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genres_genre_id_seq OWNED BY public.genres.genre_id;


--
-- TOC entry 224 (class 1259 OID 16591)
-- Name: moods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moods (
    mood_id integer NOT NULL,
    name character varying(100) NOT NULL,
    songs character varying(255) NOT NULL
);


ALTER TABLE public.moods OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16590)
-- Name: moods_mood_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moods_mood_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.moods_mood_id_seq OWNER TO postgres;

--
-- TOC entry 4973 (class 0 OID 0)
-- Dependencies: 223
-- Name: moods_mood_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moods_mood_id_seq OWNED BY public.moods.mood_id;


--
-- TOC entry 229 (class 1259 OID 16610)
-- Name: recommendations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recommendations (
    recommendation_id integer NOT NULL,
    user_id integer NOT NULL,
    song_id integer NOT NULL
);


ALTER TABLE public.recommendations OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16609)
-- Name: recommendations_recommendation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recommendations_recommendation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.recommendations_recommendation_id_seq OWNER TO postgres;

--
-- TOC entry 4974 (class 0 OID 0)
-- Dependencies: 228
-- Name: recommendations_recommendation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recommendations_recommendation_id_seq OWNED BY public.recommendations.recommendation_id;


--
-- TOC entry 227 (class 1259 OID 16606)
-- Name: song_moods; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.song_moods (
    song_id integer NOT NULL,
    mood_id integer NOT NULL
);


ALTER TABLE public.song_moods OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16600)
-- Name: songs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.songs (
    song_id integer NOT NULL,
    title character varying(255) NOT NULL,
    duration interval NOT NULL,
    release_date date NOT NULL,
    genre_id integer NOT NULL,
    artist_id integer NOT NULL,
    mood_id integer NOT NULL,
    youtube_url character varying(255) NOT NULL,
    spotify_url character varying(255) NOT NULL,
    apple_music_url character varying(255) NOT NULL
);


ALTER TABLE public.songs OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16599)
-- Name: songs_song_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.songs_song_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.songs_song_id_seq OWNER TO postgres;

--
-- TOC entry 4975 (class 0 OID 0)
-- Dependencies: 225
-- Name: songs_song_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.songs_song_id_seq OWNED BY public.songs.song_id;


--
-- TOC entry 220 (class 1259 OID 16573)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    preferred_genre integer
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16572)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_id_seq OWNER TO postgres;

--
-- TOC entry 4976 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 4777 (class 2604 OID 16587)
-- Name: artists artist_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists ALTER COLUMN artist_id SET DEFAULT nextval('public.artists_artist_id_seq'::regclass);


--
-- TOC entry 4775 (class 2604 OID 16567)
-- Name: genres genre_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres ALTER COLUMN genre_id SET DEFAULT nextval('public.genres_genre_id_seq'::regclass);


--
-- TOC entry 4778 (class 2604 OID 16594)
-- Name: moods mood_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moods ALTER COLUMN mood_id SET DEFAULT nextval('public.moods_mood_id_seq'::regclass);


--
-- TOC entry 4780 (class 2604 OID 16613)
-- Name: recommendations recommendation_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recommendations ALTER COLUMN recommendation_id SET DEFAULT nextval('public.recommendations_recommendation_id_seq'::regclass);


--
-- TOC entry 4779 (class 2604 OID 16603)
-- Name: songs song_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs ALTER COLUMN song_id SET DEFAULT nextval('public.songs_song_id_seq'::regclass);


--
-- TOC entry 4776 (class 2604 OID 16576)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 4965 (class 0 OID 16646)
-- Dependencies: 230
-- Data for Name: __EFMigrationsHistory; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4957 (class 0 OID 16584)
-- Dependencies: 222
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.artists (artist_id, name, genre_id, moods) VALUES (2, 'Lady Gaga', 2, '4');
INSERT INTO public.artists (artist_id, name, genre_id, moods) VALUES (3, 'Sabrina Carpenter', 2, '4');
INSERT INTO public.artists (artist_id, name, genre_id, moods) VALUES (6, 'Asap Rocky', 1, '4');
INSERT INTO public.artists (artist_id, name, genre_id, moods) VALUES (7, 'Cardi B', 1, '4');
INSERT INTO public.artists (artist_id, name, genre_id, moods) VALUES (8, 'Drake', 3, '4');
INSERT INTO public.artists (artist_id, name, genre_id, moods) VALUES (9, 'Kendrick Lamar', 3, '2');
INSERT INTO public.artists (artist_id, name, genre_id, moods) VALUES (10, 'Nicki Minaj', 3, '4');
INSERT INTO public.artists (artist_id, name, genre_id, moods) VALUES (11, 'The Beatles', 4, '1');
INSERT INTO public.artists (artist_id, name, genre_id, moods) VALUES (4, 'Bruno Mars', 2, '3,4');
INSERT INTO public.artists (artist_id, name, genre_id, moods) VALUES (5, 'Eminem', 1, '2,3');
INSERT INTO public.artists (artist_id, name, genre_id, moods) VALUES (12, 'Rolling Stones', 4, '3,4');
INSERT INTO public.artists (artist_id, name, genre_id, moods) VALUES (13, 'AC/DC', 4, '2,4');


--
-- TOC entry 4953 (class 0 OID 16564)
-- Dependencies: 218
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.genres (genre_id, name) VALUES (1, 'Rap');
INSERT INTO public.genres (genre_id, name) VALUES (2, 'Pop');
INSERT INTO public.genres (genre_id, name) VALUES (3, 'Hip-Hop');
INSERT INTO public.genres (genre_id, name) VALUES (4, 'Rock');


--
-- TOC entry 4959 (class 0 OID 16591)
-- Dependencies: 224
-- Data for Name: moods; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.moods (mood_id, name, songs) VALUES (1, 'Calm', '19,20');
INSERT INTO public.moods (mood_id, name, songs) VALUES (2, 'Mad', '7,15,16,23');
INSERT INTO public.moods (mood_id, name, songs) VALUES (3, 'Sad', '5,8,21,');
INSERT INTO public.moods (mood_id, name, songs) VALUES (4, 'Happy', '1,2,3,4,6,9,10,11,12,13,14,17,18,22,24');


--
-- TOC entry 4964 (class 0 OID 16610)
-- Dependencies: 229
-- Data for Name: recommendations; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4962 (class 0 OID 16606)
-- Dependencies: 227
-- Data for Name: song_moods; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4961 (class 0 OID 16600)
-- Dependencies: 226
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.songs (song_id, title, duration, release_date, genre_id, artist_id, mood_id, youtube_url, spotify_url, apple_music_url) VALUES (1, 'Bloody Mary', '04:05:00', '2011-05-23', 2, 2, 4, 'https://youtu.be/VFwmKL5OL-Q?si=1rxgsXBJbALkYsOD', 'https://open.spotify.com/track/11BKm0j4eYoCPPpCONAVwA?si=4cdd7154fecf4522', 'https://music.apple.com/us/album/bloody-mary/1440857161?i=1440857734');
INSERT INTO public.songs (song_id, title, duration, release_date, genre_id, artist_id, mood_id, youtube_url, spotify_url, apple_music_url) VALUES (2, 'Bad Romance', '04:55:00', '2009-10-19', 2, 2, 4, 'https://youtu.be/qrO4YZeyl0I?si=efiuO5HxnRpmT8xS', 'https://open.spotify.com/track/0SiywuOBRcynK0uKGWdCnn?si=3ebd07e484024e51', 'https://music.apple.com/us/album/bad-romance/1476727669?i=1476727670');
INSERT INTO public.songs (song_id, title, duration, release_date, genre_id, artist_id, mood_id, youtube_url, spotify_url, apple_music_url) VALUES (3, 'Please Please Please', '03:06:00', '2024-06-07', 2, 3, 4, 'https://youtu.be/cF1Na4AIecM?si=BDGA3FUUNacng5RA', 'https://open.spotify.com/track/5N3hjp1WNayUPZrA8kJmJP?si=3d0e1c56f9b84c7f', 'https://music.apple.com/us/album/please-please-please/1750307020?i=1750307080');
INSERT INTO public.songs (song_id, title, duration, release_date, genre_id, artist_id, mood_id, youtube_url, spotify_url, apple_music_url) VALUES (4, 'Espresso', '02:56:00', '2024-04-11', 2, 3, 4, 'https://youtu.be/eVli-tstM5E?si=dvQMXSraymCCiM0x', 'https://open.spotify.com/track/2qSkIjg1o9h3YT9RAgYN75?si=edfe82ec7a334bae', 'https://music.apple.com/us/album/espresso-single/1740212432');
INSERT INTO public.songs (song_id, title, duration, release_date, genre_id, artist_id, mood_id, youtube_url, spotify_url, apple_music_url) VALUES (5, 'Talking to the Moon', '03:38:00', '2010-10-04', 2, 4, 3, 'https://youtu.be/fXw0jcYbqdo?si=8G1EIT4rjLCeiu41', 'https://open.spotify.com/track/161DnLWsx1i3u1JT05lzqU?si=f78f1144749843bf', 'https://music.apple.com/us/album/talking-to-the-moon/576654788?i=576655100');
INSERT INTO public.songs (song_id, title, duration, release_date, genre_id, artist_id, mood_id, youtube_url, spotify_url, apple_music_url) VALUES (6, 'That’s What I Like', '03:27:00', '2016-11-18', 2, 4, 4, 'https://youtu.be/PMivT7MJ41M?si=filY-ur7w-P7Rnz1', 'https://open.spotify.com/track/0KKkJNfGyhkQ5aFogxQAPU?si=0da28c2f7c0e4831', 'https://music.apple.com/us/album/thats-what-i-like/1161503945?i=1161504043');
INSERT INTO public.songs (song_id, title, duration, release_date, genre_id, artist_id, mood_id, youtube_url, spotify_url, apple_music_url) VALUES (7, 'Without Me', '04:50:00', '2002-05-14', 1, 5, 2, 'https://youtu.be/YVkUvmDQ3HY?si=Lu54m5cQ-sXzukvV', 'https://open.spotify.com/track/7lQ8MOhq6IN2w8EYcFNSUk?si=c9594d3579a54612', 'https://music.apple.com/us/album/without-me/1440903530?i=1440903693');
INSERT INTO public.songs (song_id, title, duration, release_date, genre_id, artist_id, mood_id, youtube_url, spotify_url, apple_music_url) VALUES (8, 'Mockingbird', '04:11:00', '2004-11-12', 1, 5, 3, 'https://youtu.be/S9bCLPwzSC0?si=G1G-egZGZBXeOeP1', 'https://open.spotify.com/track/561jH07mF1jHuk7KlaeF0s?si=c51355440655400e', 'https://music.apple.com/us/album/mockingbird/1452852431?i=1452852850');
INSERT INTO public.songs (song_id, title, duration, release_date, genre_id, artist_id, mood_id, youtube_url, spotify_url, apple_music_url) VALUES (9, 'Praise the Lord', '03:26:00', '2018-05-25', 1, 6, 4, 'https://youtu.be/Kbj2Zss-5GY?si=a9uBRsga0lNkFoAw', 'https://open.spotify.com/track/7ycWLEP1GsNjVvcjawXz3z?si=841c904b1d1e4980', 'https://music.apple.com/us/album/praise-the-lord-da-shine-feat-skepta/1387635013?i=1387635035');
INSERT INTO public.songs (song_id, title, duration, release_date, genre_id, artist_id, mood_id, youtube_url, spotify_url, apple_music_url) VALUES (10, 'Fashion Killa', '03:56:00', '2013-01-15', 1, 6, 4, 'https://youtu.be/F6VfsJ7LAlE?si=VLtmXnmbyC1CQDyg', 'https://open.spotify.com/track/0O3TAouZE4vL9dM5SyxgvH?si=2802fa1143ae411d', 'https://music.apple.com/us/album/fashion-killa/1450690198?i=1450690215');
INSERT INTO public.songs (song_id, title, duration, release_date, genre_id, artist_id, mood_id, youtube_url, spotify_url, apple_music_url) VALUES (11, 'Money', '03:04:00', '2018-10-23', 1, 7, 4, 'https://youtu.be/zUOh09GoQgk?si=g5hokfRqD7uyDCx5', 'https://open.spotify.com/track/2GGMabyHXnJmjY6CXhhB2e?si=81e48129fbea45a3', 'https://music.apple.com/us/album/money/1439777399?i=1439777400');
INSERT INTO public.songs (song_id, title, duration, release_date, genre_id, artist_id, mood_id, youtube_url, spotify_url, apple_music_url) VALUES (12, 'Please Me', '03:21:00', '2019-02-15', 1, 7, 4, 'https://youtu.be/3y-O-4IL-PU?si=UDF2RhurhMboWGye', 'https://open.spotify.com/track/0PG9fbaaHFHfre2gUVo7AN?si=5ca6b2343d2849a0', 'https://music.apple.com/us/album/please-me/1453056901?i=1453056904');
INSERT INTO public.songs (song_id, title, duration, release_date, genre_id, artist_id, mood_id, youtube_url, spotify_url, apple_music_url) VALUES (13, 'One Dance', '02:54:00', '2016-04-05', 3, 8, 4, 'https://youtu.be/qL7zrWcv6XY?si=xc6dBfeepvR_f3Gc', 'https://open.spotify.com/track/1zi7xx7UVEFkmKfv06H8x0?si=a1795020d68d4cae', 'https://music.apple.com/us/album/one-dance-feat-wizkid-kyla/1440841363?i=1440841384');
INSERT INTO public.songs (song_id, title, duration, release_date, genre_id, artist_id, mood_id, youtube_url, spotify_url, apple_music_url) VALUES (14, 'God’s Plan', '03:19:00', '2018-01-19', 3, 8, 4, 'https://youtu.be/xpVfcZ0ZcFM?si=oKG_4VYHoXbgiprP', 'https://open.spotify.com/track/6DCZcSspjsKoFjzjrWoCdn?si=9523b3be716d46f3', 'https://music.apple.com/us/album/gods-plan/1406109769?i=1406109863');
INSERT INTO public.songs (song_id, title, duration, release_date, genre_id, artist_id, mood_id, youtube_url, spotify_url, apple_music_url) VALUES (15, 'Not Like Us', '04:34:00', '2024-05-04', 3, 9, 2, 'https://youtu.be/H58vbez_m4E?si=-Sh5oBMfdXNr0D3e', 'https://open.spotify.com/track/6AI3ezQ4o3HUoP6Dhudph3?si=1ed0d09d649845d9', 'https://music.apple.com/us/album/not-like-us/1744776162?i=1744776167');
INSERT INTO public.songs (song_id, title, duration, release_date, genre_id, artist_id, mood_id, youtube_url, spotify_url, apple_music_url) VALUES (16, 'DNA.', '03:06:00', '2017-04-14', 3, 9, 2, 'https://youtu.be/NLZRYQMLDW4?si=Iuhql2V5WteO5MY0', 'https://open.spotify.com/track/6HZILIRieu8S0iqY8kIKhj?si=090a557dfa29470a', 'https://music.apple.com/us/album/dna/1440881047?i=1440881357');
INSERT INTO public.songs (song_id, title, duration, release_date, genre_id, artist_id, mood_id, youtube_url, spotify_url, apple_music_url) VALUES (17, 'Super Bass', '03:20:00', '2010-11-22', 3, 10, 4, 'https://youtu.be/4JipHEz53sU?si=o1atF2A6PKk26hfb', 'https://open.spotify.com/track/3hlksXnvbKogFdPbpO9vel?si=2cdd44041e054254', 'https://music.apple.com/us/album/super-bass/1440909639?i=1440910489');
INSERT INTO public.songs (song_id, title, duration, release_date, genre_id, artist_id, mood_id, youtube_url, spotify_url, apple_music_url) VALUES (18, 'Bang Bang', '03:20:00', '2014-07-28', 3, 10, 4, 'https://youtu.be/0HDdjwpPM3Y?si=ah5wrDUWep5E4boE', 'https://open.spotify.com/track/0puf9yIluy9W0vpMEUoAnN?si=c16f16a57c044ffd', 'https://music.apple.com/us/album/bang-bang/1444896437?i=1444896442');
INSERT INTO public.songs (song_id, title, duration, release_date, genre_id, artist_id, mood_id, youtube_url, spotify_url, apple_music_url) VALUES (19, 'Here Comes the Sun', '03:06:00', '1969-09-26', 4, 11, 1, 'https://youtu.be/KQetemT1sWc?si=99VoIvgPSmRGfgpL', 'https://open.spotify.com/track/6dGnYIeXmHdcikdzNNDMm2?si=da2a2205cc4a49ba', 'https://music.apple.com/us/album/here-comes-the-sun/1441164426?i=1441164589');
INSERT INTO public.songs (song_id, title, duration, release_date, genre_id, artist_id, mood_id, youtube_url, spotify_url, apple_music_url) VALUES (20, 'Blackbird', '02:18:00', '1968-11-22', 4, 11, 1, 'https://youtu.be/Man4Xw8Xypo?si=9Hsc99ctNUCk7UAG', 'https://open.spotify.com/track/5jgFfDIR6FR0gvlA56Nakr?si=cce680b3c4944b33', 'https://music.apple.com/us/album/blackbird/1441133180?i=1441133834');
INSERT INTO public.songs (song_id, title, duration, release_date, genre_id, artist_id, mood_id, youtube_url, spotify_url, apple_music_url) VALUES (21, 'Angie', '04:32:00', '1973-08-20', 4, 12, 3, 'https://youtu.be/RcZn2-bGXqQ?si=7WQBAV8WEJl1EMVD', 'https://open.spotify.com/track/1GcVa4jFySlun4jLSuMhiq?si=81874c10afde4201', 'https://music.apple.com/us/album/angie/1440852826?i=1440853240');
INSERT INTO public.songs (song_id, title, duration, release_date, genre_id, artist_id, mood_id, youtube_url, spotify_url, apple_music_url) VALUES (22, 'Tumbling Dice', '03:47:00', '1972-04-14', 4, 12, 4, 'https://youtu.be/EMoi_m2G6XU?si=B-FECQhfqMPerY14', 'https://open.spotify.com/track/4hq0S6wznq7SHDyMOFXL9i?si=699080f1fa4043fc', 'https://music.apple.com/us/album/tumbling-dice/1440872228?i=1440872599');
INSERT INTO public.songs (song_id, title, duration, release_date, genre_id, artist_id, mood_id, youtube_url, spotify_url, apple_music_url) VALUES (23, 'Highway to Hell', '03:28:00', '1979-07-27', 4, 13, 2, 'https://youtu.be/l482T0yNkeo?si=NuI0BUsTbhwC6lha', 'https://open.spotify.com/track/2zYzyRzz6pRmhPzyfMEC8s?si=82b8675941114061', 'https://music.apple.com/us/album/highway-to-hell/574043989?i=574044008');
INSERT INTO public.songs (song_id, title, duration, release_date, genre_id, artist_id, mood_id, youtube_url, spotify_url, apple_music_url) VALUES (24, 'Shoot to Thrill', '05:18:00', '1980-07-25', 4, 13, 4, 'https://youtu.be/xRQnJyP77tY?si=-285MC3A5RntB8X1', 'https://open.spotify.com/track/0C80GCp0mMuBzLf3EAXqxv?si=92df329497b845a0', 'https://music.apple.com/us/album/shoot-to-thrill/574050396?i=574050498');


--
-- TOC entry 4955 (class 0 OID 16573)
-- Dependencies: 220
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4977 (class 0 OID 0)
-- Dependencies: 221
-- Name: artists_artist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.artists_artist_id_seq', 13, true);


--
-- TOC entry 4978 (class 0 OID 0)
-- Dependencies: 217
-- Name: genres_genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genres_genre_id_seq', 4, true);


--
-- TOC entry 4979 (class 0 OID 0)
-- Dependencies: 223
-- Name: moods_mood_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moods_mood_id_seq', 4, true);


--
-- TOC entry 4980 (class 0 OID 0)
-- Dependencies: 228
-- Name: recommendations_recommendation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recommendations_recommendation_id_seq', 1, false);


--
-- TOC entry 4981 (class 0 OID 0)
-- Dependencies: 225
-- Name: songs_song_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.songs_song_id_seq', 24, true);


--
-- TOC entry 4982 (class 0 OID 0)
-- Dependencies: 219
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, false);


--
-- TOC entry 4800 (class 2606 OID 16650)
-- Name: __EFMigrationsHistory PK___EFMigrationsHistory; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");


--
-- TOC entry 4790 (class 2606 OID 16589)
-- Name: artists artists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (artist_id);


--
-- TOC entry 4782 (class 2606 OID 16571)
-- Name: genres genres_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_name_key UNIQUE (name);


--
-- TOC entry 4784 (class 2606 OID 16569)
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (genre_id);


--
-- TOC entry 4792 (class 2606 OID 16598)
-- Name: moods moods_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moods
    ADD CONSTRAINT moods_name_key UNIQUE (name);


--
-- TOC entry 4794 (class 2606 OID 16596)
-- Name: moods moods_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moods
    ADD CONSTRAINT moods_pkey PRIMARY KEY (mood_id);


--
-- TOC entry 4798 (class 2606 OID 16615)
-- Name: recommendations recommendations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recommendations
    ADD CONSTRAINT recommendations_pkey PRIMARY KEY (recommendation_id);


--
-- TOC entry 4796 (class 2606 OID 16605)
-- Name: songs songs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (song_id);


--
-- TOC entry 4786 (class 2606 OID 16582)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4788 (class 2606 OID 16580)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 4805 (class 2606 OID 16641)
-- Name: recommendations fk_recommendations_song_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recommendations
    ADD CONSTRAINT fk_recommendations_song_id FOREIGN KEY (song_id) REFERENCES public.songs(song_id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4806 (class 2606 OID 16616)
-- Name: recommendations fk_recommendations_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recommendations
    ADD CONSTRAINT fk_recommendations_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4803 (class 2606 OID 16636)
-- Name: song_moods fk_song_moods_mood_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.song_moods
    ADD CONSTRAINT fk_song_moods_mood_id FOREIGN KEY (mood_id) REFERENCES public.moods(mood_id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4804 (class 2606 OID 16631)
-- Name: song_moods fk_song_moods_song_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.song_moods
    ADD CONSTRAINT fk_song_moods_song_id FOREIGN KEY (song_id) REFERENCES public.songs(song_id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4801 (class 2606 OID 16626)
-- Name: songs fk_songs_artist_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT fk_songs_artist_id FOREIGN KEY (artist_id) REFERENCES public.artists(artist_id) ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4802 (class 2606 OID 16621)
-- Name: songs fk_songs_genre_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT fk_songs_genre_id FOREIGN KEY (genre_id) REFERENCES public.genres(genre_id) ON DELETE CASCADE NOT VALID;


-- Completed on 2025-03-26 13:57:16

--
-- PostgreSQL database dump complete
--

