
--
-- TOC entry 185 (class 1259 OID 25031)
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE client (
    id bigint NOT NULL,
    short_name character varying(60),
    full_name character varying(255),
    inn character varying(12),
    okpo character varying(10),
    creation_date timestamp without time zone,
    modification_date timestamp without time zone,
    client_type bigint
);


ALTER TABLE client OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 25029)
-- Name: client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE client_id_seq OWNER TO postgres;

--
-- TOC entry 2135 (class 0 OID 0)
-- Dependencies: 184
-- Name: client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE client_id_seq OWNED BY client.id;


--
-- TOC entry 187 (class 1259 OID 25055)
-- Name: client_order; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE client_order (
    id bigint NOT NULL,
    goods_name character varying(160),
    category character varying(255),
    client_id bigint
);


ALTER TABLE client_order OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 25053)
-- Name: client_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE client_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE client_order_id_seq OWNER TO postgres;

--
-- TOC entry 2136 (class 0 OID 0)
-- Dependencies: 186
-- Name: client_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE client_order_id_seq OWNED BY client_order.id;


--
-- TOC entry 183 (class 1259 OID 25007)
-- Name: client_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE client_type (
    id bigint NOT NULL,
    client_type_code character varying(10),
    full_name character varying(255),
    short_name character varying(60)
);


ALTER TABLE client_type OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 25005)
-- Name: client_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE client_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE client_type_id_seq OWNER TO postgres;

--
-- TOC entry 2137 (class 0 OID 0)
-- Dependencies: 182
-- Name: client_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE client_type_id_seq OWNED BY client_type.id;


--
-- TOC entry 181 (class 1259 OID 24936)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

--
-- TOC entry 1996 (class 2604 OID 25034)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY client ALTER COLUMN id SET DEFAULT nextval('client_id_seq'::regclass);


--
-- TOC entry 1997 (class 2604 OID 25058)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY client_order ALTER COLUMN id SET DEFAULT nextval('client_order_id_seq'::regclass);


--
-- TOC entry 1995 (class 2604 OID 25010)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY client_type ALTER COLUMN id SET DEFAULT nextval('client_type_id_seq'::regclass);


--
-- TOC entry 2124 (class 0 OID 25031)
-- Dependencies: 185
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO client (id, short_name, full_name, inn, okpo, creation_date, modification_date, client_type) VALUES (5, 'sem', 'semyon', '11232', NULL, '2019-09-29 14:22:22.764', NULL, 1);
INSERT INTO client (id, short_name, full_name, inn, okpo, creation_date, modification_date, client_type) VALUES (9, 'sem', 'semyon', '11232', NULL, '2019-10-06 19:26:37.009', NULL, 1);
INSERT INTO client (id, short_name, full_name, inn, okpo, creation_date, modification_date, client_type) VALUES (13, 'den', 'denis', '11232', NULL, '2019-10-06 20:03:21.292', NULL, 2);


--
-- TOC entry 2138 (class 0 OID 0)
-- Dependencies: 184
-- Name: client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('client_id_seq', 1, false);


--
-- TOC entry 2126 (class 0 OID 25055)
-- Dependencies: 187
-- Data for Name: client_order; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO client_order (id, goods_name, category, client_id) VALUES (6, 'car3', '0', 5);
INSERT INTO client_order (id, goods_name, category, client_id) VALUES (7, 'car4', '0', 5);
INSERT INTO client_order (id, goods_name, category, client_id) VALUES (8, 'car5', '0', 5);
INSERT INTO client_order (id, goods_name, category, client_id) VALUES (10, 'car5', '0', 9);


--
-- TOC entry 2139 (class 0 OID 0)
-- Dependencies: 186
-- Name: client_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('client_order_id_seq', 1, false);


--
-- TOC entry 2122 (class 0 OID 25007)
-- Dependencies: 183
-- Data for Name: client_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO client_type (id, client_type_code, full_name, short_name) VALUES (1, 'default', 'Default', 'Def');
INSERT INTO client_type (id, client_type_code, full_name, short_name) VALUES (2, 'vip', 'Vip', 'vip');


--
-- TOC entry 2140 (class 0 OID 0)
-- Dependencies: 182
-- Name: client_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('client_type_id_seq', 2, true);


--
-- TOC entry 2141 (class 0 OID 0)
-- Dependencies: 181
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 13, true);


--
-- TOC entry 2003 (class 2606 OID 25060)
-- Name: client_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY client_order
    ADD CONSTRAINT client_order_pkey PRIMARY KEY (id);


--
-- TOC entry 2001 (class 2606 OID 25036)
-- Name: client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);


--
-- TOC entry 1999 (class 2606 OID 25012)
-- Name: client_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY client_type
    ADD CONSTRAINT client_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2004 (class 2606 OID 25037)
-- Name: client_client_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY client
    ADD CONSTRAINT client_client_type_fkey FOREIGN KEY (client_type) REFERENCES client_type(id);


--
-- TOC entry 2005 (class 2606 OID 25061)
-- Name: client_order_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY client_order
    ADD CONSTRAINT client_order_client_id_fkey FOREIGN KEY (client_id) REFERENCES client(id);


--
-- TOC entry 2133 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-10-06 20:09:44

--
-- PostgreSQL database dump complete
--

