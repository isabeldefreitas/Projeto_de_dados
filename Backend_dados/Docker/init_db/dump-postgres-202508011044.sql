--
-- PostgreSQL database dump
--

-- Dumped from database version 14.11
-- Dumped by pg_dump version 14.11

-- Started on 2025-08-01 10:44:29

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
-- TOC entry 5 (class 2615 OID 16394)
-- Name: ProjetoDados25.1; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA "ProjetoDados25.1";


ALTER SCHEMA "ProjetoDados25.1" OWNER TO postgres;

--
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 211 (class 1259 OID 16395)
-- Name: colaborador; Type: TABLE; Schema: ProjetoDados25.1; Owner: postgres
--

CREATE TABLE "ProjetoDados25.1".colaborador (
    id_colaborador character varying(255) NOT NULL,
    nome_colaborador text,
    email_colaborador text,
    cpf character varying(20),
    data_nascimento text,
    telefone text
);


ALTER TABLE "ProjetoDados25.1".colaborador OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16444)
-- Name: colaborador_competencia; Type: TABLE; Schema: ProjetoDados25.1; Owner: postgres
--

CREATE TABLE "ProjetoDados25.1".colaborador_competencia (
    id bigint NOT NULL,
    id_colaborador character varying(255),
    id_competencia bigint
);


ALTER TABLE "ProjetoDados25.1".colaborador_competencia OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16443)
-- Name: colaborador_competencia_id_seq; Type: SEQUENCE; Schema: ProjetoDados25.1; Owner: postgres
--

CREATE SEQUENCE "ProjetoDados25.1".colaborador_competencia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "ProjetoDados25.1".colaborador_competencia_id_seq OWNER TO postgres;

--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 220
-- Name: colaborador_competencia_id_seq; Type: SEQUENCE OWNED BY; Schema: ProjetoDados25.1; Owner: postgres
--

ALTER SEQUENCE "ProjetoDados25.1".colaborador_competencia_id_seq OWNED BY "ProjetoDados25.1".colaborador_competencia.id;


--
-- TOC entry 223 (class 1259 OID 16461)
-- Name: colaborador_empresa; Type: TABLE; Schema: ProjetoDados25.1; Owner: postgres
--

CREATE TABLE "ProjetoDados25.1".colaborador_empresa (
    id bigint NOT NULL,
    id_colaborador character varying(255),
    id_empresa bigint
);


ALTER TABLE "ProjetoDados25.1".colaborador_empresa OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16460)
-- Name: colaborador_empresa_id_seq; Type: SEQUENCE; Schema: ProjetoDados25.1; Owner: postgres
--

CREATE SEQUENCE "ProjetoDados25.1".colaborador_empresa_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "ProjetoDados25.1".colaborador_empresa_id_seq OWNER TO postgres;

--
-- TOC entry 3393 (class 0 OID 0)
-- Dependencies: 222
-- Name: colaborador_empresa_id_seq; Type: SEQUENCE OWNED BY; Schema: ProjetoDados25.1; Owner: postgres
--

ALTER SEQUENCE "ProjetoDados25.1".colaborador_empresa_id_seq OWNED BY "ProjetoDados25.1".colaborador_empresa.id;


--
-- TOC entry 213 (class 1259 OID 16403)
-- Name: colaborador_photo; Type: TABLE; Schema: ProjetoDados25.1; Owner: postgres
--

CREATE TABLE "ProjetoDados25.1".colaborador_photo (
    id bigint NOT NULL,
    id_colaborador character varying(255),
    url_foto text
);


ALTER TABLE "ProjetoDados25.1".colaborador_photo OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16402)
-- Name: colaborador_photo_id_seq; Type: SEQUENCE; Schema: ProjetoDados25.1; Owner: postgres
--

CREATE SEQUENCE "ProjetoDados25.1".colaborador_photo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "ProjetoDados25.1".colaborador_photo_id_seq OWNER TO postgres;

--
-- TOC entry 3394 (class 0 OID 0)
-- Dependencies: 212
-- Name: colaborador_photo_id_seq; Type: SEQUENCE OWNED BY; Schema: ProjetoDados25.1; Owner: postgres
--

ALTER SEQUENCE "ProjetoDados25.1".colaborador_photo_id_seq OWNED BY "ProjetoDados25.1".colaborador_photo.id;


--
-- TOC entry 215 (class 1259 OID 16417)
-- Name: competencia; Type: TABLE; Schema: ProjetoDados25.1; Owner: postgres
--

CREATE TABLE "ProjetoDados25.1".competencia (
    id_competencia bigint NOT NULL,
    descricao text,
    nome_competencia text
);


ALTER TABLE "ProjetoDados25.1".competencia OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16416)
-- Name: competencia_id_competencia_seq; Type: SEQUENCE; Schema: ProjetoDados25.1; Owner: postgres
--

CREATE SEQUENCE "ProjetoDados25.1".competencia_id_competencia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "ProjetoDados25.1".competencia_id_competencia_seq OWNER TO postgres;

--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 214
-- Name: competencia_id_competencia_seq; Type: SEQUENCE OWNED BY; Schema: ProjetoDados25.1; Owner: postgres
--

ALTER SEQUENCE "ProjetoDados25.1".competencia_id_competencia_seq OWNED BY "ProjetoDados25.1".competencia.id_competencia;


--
-- TOC entry 219 (class 1259 OID 16435)
-- Name: empresa; Type: TABLE; Schema: ProjetoDados25.1; Owner: postgres
--

CREATE TABLE "ProjetoDados25.1".empresa (
    id_empresa bigint NOT NULL,
    cnpj_empresa character varying(20),
    contato_empresa text,
    endereco_empresa text,
    nome_empresa text,
    setor_empresa text
);


ALTER TABLE "ProjetoDados25.1".empresa OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16434)
-- Name: empresa_id_empresa_seq; Type: SEQUENCE; Schema: ProjetoDados25.1; Owner: postgres
--

CREATE SEQUENCE "ProjetoDados25.1".empresa_id_empresa_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "ProjetoDados25.1".empresa_id_empresa_seq OWNER TO postgres;

--
-- TOC entry 3396 (class 0 OID 0)
-- Dependencies: 218
-- Name: empresa_id_empresa_seq; Type: SEQUENCE OWNED BY; Schema: ProjetoDados25.1; Owner: postgres
--

ALTER SEQUENCE "ProjetoDados25.1".empresa_id_empresa_seq OWNED BY "ProjetoDados25.1".empresa.id_empresa;


--
-- TOC entry 224 (class 1259 OID 16477)
-- Name: empresa_servico; Type: TABLE; Schema: ProjetoDados25.1; Owner: postgres
--

CREATE TABLE "ProjetoDados25.1".empresa_servico (
    empresa_id bigint,
    servico_id bigint
);


ALTER TABLE "ProjetoDados25.1".empresa_servico OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16426)
-- Name: servico; Type: TABLE; Schema: ProjetoDados25.1; Owner: postgres
--

CREATE TABLE "ProjetoDados25.1".servico (
    id_servico bigint NOT NULL,
    data_servico text,
    descricao_servico text,
    nome_servico text
);


ALTER TABLE "ProjetoDados25.1".servico OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16490)
-- Name: servico_competencia; Type: TABLE; Schema: ProjetoDados25.1; Owner: postgres
--

CREATE TABLE "ProjetoDados25.1".servico_competencia (
    servico_id bigint,
    competencia_id bigint
);


ALTER TABLE "ProjetoDados25.1".servico_competencia OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16425)
-- Name: servico_id_servico_seq; Type: SEQUENCE; Schema: ProjetoDados25.1; Owner: postgres
--

CREATE SEQUENCE "ProjetoDados25.1".servico_id_servico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "ProjetoDados25.1".servico_id_servico_seq OWNER TO postgres;

--
-- TOC entry 3397 (class 0 OID 0)
-- Dependencies: 216
-- Name: servico_id_servico_seq; Type: SEQUENCE OWNED BY; Schema: ProjetoDados25.1; Owner: postgres
--

ALTER SEQUENCE "ProjetoDados25.1".servico_id_servico_seq OWNED BY "ProjetoDados25.1".servico.id_servico;


--
-- TOC entry 3207 (class 2604 OID 16447)
-- Name: colaborador_competencia id; Type: DEFAULT; Schema: ProjetoDados25.1; Owner: postgres
--

ALTER TABLE ONLY "ProjetoDados25.1".colaborador_competencia ALTER COLUMN id SET DEFAULT nextval('"ProjetoDados25.1".colaborador_competencia_id_seq'::regclass);


--
-- TOC entry 3208 (class 2604 OID 16464)
-- Name: colaborador_empresa id; Type: DEFAULT; Schema: ProjetoDados25.1; Owner: postgres
--

ALTER TABLE ONLY "ProjetoDados25.1".colaborador_empresa ALTER COLUMN id SET DEFAULT nextval('"ProjetoDados25.1".colaborador_empresa_id_seq'::regclass);


--
-- TOC entry 3203 (class 2604 OID 16406)
-- Name: colaborador_photo id; Type: DEFAULT; Schema: ProjetoDados25.1; Owner: postgres
--

ALTER TABLE ONLY "ProjetoDados25.1".colaborador_photo ALTER COLUMN id SET DEFAULT nextval('"ProjetoDados25.1".colaborador_photo_id_seq'::regclass);


--
-- TOC entry 3204 (class 2604 OID 16420)
-- Name: competencia id_competencia; Type: DEFAULT; Schema: ProjetoDados25.1; Owner: postgres
--

ALTER TABLE ONLY "ProjetoDados25.1".competencia ALTER COLUMN id_competencia SET DEFAULT nextval('"ProjetoDados25.1".competencia_id_competencia_seq'::regclass);


--
-- TOC entry 3206 (class 2604 OID 16438)
-- Name: empresa id_empresa; Type: DEFAULT; Schema: ProjetoDados25.1; Owner: postgres
--

ALTER TABLE ONLY "ProjetoDados25.1".empresa ALTER COLUMN id_empresa SET DEFAULT nextval('"ProjetoDados25.1".empresa_id_empresa_seq'::regclass);


--
-- TOC entry 3205 (class 2604 OID 16429)
-- Name: servico id_servico; Type: DEFAULT; Schema: ProjetoDados25.1; Owner: postgres
--

ALTER TABLE ONLY "ProjetoDados25.1".servico ALTER COLUMN id_servico SET DEFAULT nextval('"ProjetoDados25.1".servico_id_servico_seq'::regclass);


--
-- TOC entry 3371 (class 0 OID 16395)
-- Dependencies: 211
-- Data for Name: colaborador; Type: TABLE DATA; Schema: ProjetoDados25.1; Owner: postgres
--

INSERT INTO "ProjetoDados25.1".colaborador VALUES ('7', 'Sra. Vanessa Nogueira', 'vanessa.nogueira@exemplo', '34512367890', '1992/05/09', '21 9876-1234 - RJ');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('8', 'Eduardo Araújo', 'edu.araújo@empresa.com', '024.878.550-22', '1980-07-30', '+55 11 93220-4567 - SP');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('9', 'Mariana Silva', 'mariana@dominio.com.br', '123.456.789-00', '15-06-1999', '(19) 99765-3332 - SP');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('10', 'Dr. Rafael Costa', 'rafael.costa@email.com', '78965432100', '1987-03-22', '(71) 91234-5678 - BA');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('11', 'Thiago Moura', 'thiago@dominio.com', '12345678900', '1990-12-01', '(21) 99999-0001 - RJ');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('12', 'Camila Andrade', 'camila.andrade', '987.654.321-00', '01/03/1993', '(11)91234-5678 - SP');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('13', 'Bruno Oliveira', 'bruno@empresa', '00000000000', '1985/07/30', '3199998888 - MG');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('15', 'Fernando Reis', 'fernando.reis@empresa.com.br', '78965412300', '1987-05-09', '(85) 92345-6789 - CE');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('16', 'Isabela Monteiro', 'isabela.monteiro@gmail', '74185296300', '1982-10-31', '(98) 99876-5432 - MA');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('17', 'Lucas Silva', 'lucas@lucas.com', '111.222.333-44', '29/02/1992', '21987654321 - RJ');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('18', 'Tatiane Ramos', 'tatiane@ramos.com.br', '987654321-00', '12-05-1989', '47991234567 - SC');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('19', 'Pedro Henrique', 'pedro@henrique.com', '456.789.123-00', '1980-06-15', '51992345678 - RS');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('20', 'Juliana Duarte', 'juliana.duarte', '15935745600', '03.03.1996', '(41)912345678 - PR');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('21', 'Carlos Alberto', 'carlos.alberto@email.com', '45678912300', '15/08/1984', '65987654321 - MT');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('22', 'Daniela Braga', 'daniela@braga.com', '14725836900', '1991-11-25', '(61) 99123-4567 - DF');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('23', 'Renato Lima', 'renato@lima', '85296374100', '1993-04-01', '82991234567 - AL');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('24', 'Débora Costa', 'debora.costa@exemplo.com', '369.258.147-00', '10-10-1990', '21991111222 - RJ');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('25', 'Anderson Melo', 'anderson@melo.org', '123.456.789-99', '1989-01-01', '21998887766 - RJ');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('26', 'Beatriz Rocha', 'beatriz.rocha@webmail.com', '74185296310', '1995-06-06', '31991234567 - MG');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('27', 'Hugo Martins', 'hugo.martins@email.com', '36925814701', '1992-03-03', '2199996666 - RJ');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('28', 'Renata Fonseca', 'renata.fonseca.com', '11122233344', '2000/12/12', '21999999999 - RJ');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('29', 'Diego Souza', 'diego@empresa.org', '000.000.000-00', '15.01.1980', '6499887766 - GO');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('30', 'Viviane Neves', 'viviane@neves.com.br', '123456789-01', '1996-09-09', '(85)991234567 - CE');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('2', 'Srta. Elisa da Conceição', '', '478.021.963-96', '2001-10-27', '(081) 9206-9804 - RN');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('3', 'Ana Carolina Gomes', '', '510.293.847-97', '1985-12-10', '(084) 9812-3878 - MA');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('5', 'Dr. Luiz Henrique Dias', 'isabellada-', '457.918.620-67', '1973-11-15', '(041) 8262 9251 - TO');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('14', 'Ana Carolina', 'ana.carol@email.com', '32165498700', '14-fev-1994', '71988776655 - BA');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('4', 'Srta. Amanda Farias', '', '598.721.604-49', '28 outubro 1990', '+55 (041) 8432 5621 - RR');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('6', 'Guilherme Teixeira', '', '841.105.860-60', '1995-april-12', '(21)99999-1234 - RJ');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('31', 'Pedro Lima', 'pedro.lima@example.com', '01234567890', '1992-04-11', '21 994512345  (RJ)');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('1', 'Dra. Ana Laura Correia', '', '590.621.834-33', '2006-11-19', '+55 (011) 7033-5211 - BA');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('32', 'Carla Torres', 'carla_torres@dominio.com', '123456789-10', '1987-07-19', '21 987654321  (RJ)');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('33', 'Marcelo Alves', 'marceloalves@email.net', '987.654.321-00', '1980-03-22', '21 912348765  (RJ)');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('34', 'Fernanda Reis', 'fernandareis@dominio.br', '00987654321', '1995-11-30', '21 998877665  (RJ)');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('35', 'Rodrigo Melo', 'rodrigo.melo@empresa.org', '34567890123', '1988-09-12', '21 966554433  (RJ)');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('36', 'Aline Farias', 'aline.farias@webmail.com', '456.789.012-34', '1990-01-08', '21 912344566  (RJ)');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('37', 'Thiago Santos', 'thiago.santos@gmail.com', '23456789012', '1993-02-15', '21 999887766  (RJ)');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('38', 'Marina Dias', 'marina.dias@dominio.com', '12345678901', '1989-06-05', '22 998877445  (RJ)');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('39', 'Lucas Rocha', 'lucas.rocha@mail.com', '32165498700', '1991-12-22', '22 912345678  (RJ)');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('40', 'Bianca Pinto', 'bianca.pinto@email.com', '14785236900', '1994-09-11', '22 976543210  (RJ)');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('41', 'Carlos Eduardo', 'carlos.eduardo@empresa.com', '96385274100', '1987-05-09', '22 987654312  (RJ)');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('42', 'Patrícia Oliveira', 'patricia.oliveira@webmail.com', '85274196300', '1990-07-07', '22 987654123  (RJ)');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('43', 'Rafael Gomes', 'rafael.gomes@mail.com', '74185296300', '1992-08-18', '22 912344332  (RJ)');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('44', 'Juliana Matos', 'juliana.matos@dominio.com', '36925814700', '1995-01-29', '22 988776655  (RJ)');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('45', 'Eduardo Fernandes', 'eduardo.fernandes@email.com', '25896314700', '1988-04-02', '22 998877554  (RJ)');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('46', 'Tatiane Costa', 'tatiane.costa@mail.com', '14796325800', '1993-03-25', '51 912345567  -RS');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('47', 'Felipe Barbosa', 'felipe.barbosa@empresa.com', '96314725800', '1991-11-14', '51 976543211  -RS');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('48', 'Monica Ribeiro', 'monica.ribeiro@dominio.com', '32178965400', '1994-12-30', '51 987654321  -RS');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('49', 'André Moreira', 'andre.moreira@mail.com', '65498732100', '1989-10-05', '51 912345678  -RS');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('50', 'Sabrina Alves', 'sabrina.alves@email.com', '78945612300', '1992-06-17', '51 998877665  -RS');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('51', 'Diego Santos', 'diego.santos@webmail.com', '12378945600', '1987-08-20', '51 987654123  -RS');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('52', 'Marina Souza', 'marina.souza@mail.com', '45612378900', '1990-05-16', '51 912344555  -RS');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('53', 'Gustavo Lima', 'gustavo.lima@empresa.com', '98732165400', '1993-01-01', '51 998877443  -RS');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('54', 'Vanessa Pereira', 'vanessa.pereira@dominio.com', '32145698700', '1991-04-22', '51 987654333  -RS');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('55', 'Leonardo Rocha', 'leonardo.rocha@email.com', '65412378900', '1988-09-08', '24 912345789  (RJ)');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('56', 'Patricia Santos', 'patricia.santos@mail.com', '78912345600', '1994-07-12', '24 998877776  (RJ)');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('57', 'Roberto Alves', 'roberto.alves@webmail.com', '12345678911', '1992-03-27', '24 987654321  (RJ)');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('58', 'Carolina Silva', 'carolina.silva@mail.com', '45678912311', '1995-02-14', '24 912344333  (RJ)');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('59', 'Felipe Oliveira', 'felipe.oliveira@empresa.com', '78945612311', '1989-06-30', '24 998877553  (RJ)');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('60', 'Amanda Fernandes', 'amanda.fernandes@dominio.com', '32112345678', '1993-10-19', '11 987654555  - sp');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('61', 'Rafael Dias', 'rafael.dias@mail.com', '65498732111', '1991-01-08', '11 912345432  - SP');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('62', 'Luciana Moreira', 'luciana.moreira@email.com', '78932165411', '1994-11-23', '11 998877665  - SP');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('63', 'Bruno Almeida', 'bruno.almeida@mail.com', '12378965411', '1988-05-17', '11 987654123  - SP');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('64', 'Patricia Costa', 'patricia.costa@empresa.com', '45632178911', '1992-09-09', '11 912344456  - SP');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('65', 'Diego Martins', 'diego.martins@dominio.com', '78965412311', '1990-08-29', '11 998877777  - SP');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('66', 'Isabela Ferreira', 'isabela.ferreira@mail.com', '32198765411', '1993-12-05', '11 987654321  - SP');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('67', 'Carlos Sousa', 'carlos.sousa@email.com', '65412398711', '1991-02-21', '11 912345678  - SP');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('68', 'Aline Rocha', 'aline.rocha@mail.com', '78932112311', '1994-04-15', '11 998877554  - SP');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('69', 'Thiago Carvalho', 'thiago.carvalho@empresa.com', '12345698711', '1987-07-04', '11 987654432  - SP');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('70', 'Renata Mendes', 'renata.mendes@dominio.com', '45678912312', '1992-03-12', '85 912344333  CE');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('71', 'Paulo Gomes', 'paulo.gomes@mail.com', '78965432112', '1990-11-30', '85 998877666  CE');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('72', 'Juliana Souza', 'juliana.souza@email.com', '32112378912', '1993-08-21', '85 987654123  CE');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('73', 'Lucas Santos', 'lucas.santos@mail.com', '65498712312', '1988-12-09', '85 912344555  CE');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('74', 'Amanda Oliveira', 'amanda.oliveira@empresa.com', '78932145612', '1991-01-16', '85 998877443  CE');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('75', 'Felipe Ribeiro', 'felipe.ribeiro@dominio.com', '12378932112', '1994-06-30', '41 987654333  PR');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('76', 'Carla Martins', 'carla.martins@mail.com', '45612398712', '1992-05-05', '41 912345789  PR');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('77', 'Roberto Dias', 'roberto.dias@email.com', '78945678912', '1989-07-22', '41 998877776  PR');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('78', 'Larissa Costa', 'larissa.costa@mail.com', '32198712312', '1993-03-15', '41 987654321  PR');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('79', 'Ricardo Almeida', 'ricardo.almeida@empresa.com', '65412345612', '1990-09-09', '41 912344333  PR');
INSERT INTO "ProjetoDados25.1".colaborador VALUES ('80', 'Patrícia Souza', 'patricia.souza@dominio.com', '78932178912', '1991-10-11', '41 998877553  PR');


--
-- TOC entry 3381 (class 0 OID 16444)
-- Dependencies: 221
-- Data for Name: colaborador_competencia; Type: TABLE DATA; Schema: ProjetoDados25.1; Owner: postgres
--

INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (135, '1', 2);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (136, '1', 7);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (137, '1', 9);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (138, '2', 1);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (139, '2', 4);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (140, '3', 3);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (141, '3', 7);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (142, '3', 9);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (143, '3', 10);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (144, '4', 2);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (145, '4', 6);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (146, '5', 1);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (147, '5', 3);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (148, '6', 4);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (149, '6', 8);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (150, '7', 6);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (151, '8', 5);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (152, '8', 8);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (153, '9', 2);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (154, '10', 1);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (155, '10', 5);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (156, '10', 10);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (157, '11', 3);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (158, '12', 7);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (159, '12', 8);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (160, '13', 6);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (161, '13', 9);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (162, '14', 2);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (163, '14', 3);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (164, '15', 4);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (165, '16', 6);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (166, '17', 2);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (167, '17', 7);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (168, '18', 1);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (169, '18', 10);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (170, '19', 3);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (171, '20', 5);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (172, '20', 6);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (173, '21', 1);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (174, '21', 2);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (175, '22', 9);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (176, '23', 7);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (177, '23', 10);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (178, '24', 4);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (179, '25', 8);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (180, '25', 10);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (181, '26', 3);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (182, '27', 6);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (183, '27', 9);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (184, '28', 1);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (185, '29', 5);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (186, '30', 2);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (187, '30', 3);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (188, '30', 7);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (189, '31', 4);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (190, '32', 6);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (191, '32', 8);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (192, '33', 5);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (193, '33', 10);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (194, '34', 1);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (195, '34', 2);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (196, '35', 3);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (197, '35', 9);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (198, '36', 6);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (199, '37', 2);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (200, '38', 4);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (201, '39', 8);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (202, '40', 1);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (203, '40', 7);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (204, '41', 3);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (205, '41', 10);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (206, '42', 5);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (207, '42', 6);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (208, '43', 2);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (209, '43', 8);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (210, '44', 1);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (211, '44', 4);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (212, '45', 3);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (213, '45', 9);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (214, '46', 2);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (215, '46', 5);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (216, '47', 1);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (217, '47', 4);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (218, '47', 8);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (219, '48', 3);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (220, '49', 2);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (221, '49', 9);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (222, '49', 10);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (223, '50', 1);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (224, '50', 6);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (225, '50', 7);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (226, '51', 4);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (227, '52', 3);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (228, '52', 5);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (229, '53', 2);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (230, '53', 8);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (231, '53', 10);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (232, '54', 1);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (233, '54', 9);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (234, '55', 3);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (235, '55', 6);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (236, '56', 2);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (237, '57', 5);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (238, '58', 4);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (239, '58', 7);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (240, '59', 6);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (241, '59', 10);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (242, '60', 1);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (243, '60', 8);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (244, '61', 2);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (245, '61', 3);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (246, '61', 9);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (247, '62', 5);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (248, '63', 1);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (249, '63', 4);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (250, '63', 6);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (251, '64', 7);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (252, '65', 2);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (253, '66', 8);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (254, '66', 10);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (255, '67', 3);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (256, '67', 5);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (257, '68', 1);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (258, '68', 6);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (259, '69', 4);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (260, '70', 2);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (261, '70', 7);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (262, '71', 9);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (263, '72', 3);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (264, '72', 10);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (265, '73', 5);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (266, '73', 8);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (267, '74', 1);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (268, '75', 6);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (269, '75', 9);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (270, '76', 2);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (271, '76', 4);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (272, '77', 3);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (273, '77', 7);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (274, '78', 1);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (275, '78', 5);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (276, '78', 10);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (277, '79', 6);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (278, '80', 2);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (279, '80', 3);
INSERT INTO "ProjetoDados25.1".colaborador_competencia VALUES (280, '80', 9);


--
-- TOC entry 3383 (class 0 OID 16461)
-- Dependencies: 223
-- Data for Name: colaborador_empresa; Type: TABLE DATA; Schema: ProjetoDados25.1; Owner: postgres
--

INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (1, '2', 1);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (2, '3', 1);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (3, '5', 2);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (4, '7', 2);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (5, '9', 3);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (6, '10', 3);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (7, '12', 4);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (8, '14', 4);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (9, '15', 5);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (10, '17', 5);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (11, '18', 6);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (12, '20', 6);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (13, '21', 7);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (14, '23', 7);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (15, '24', 8);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (16, '26', 8);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (17, '27', 9);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (18, '29', 9);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (19, '30', 10);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (20, '32', 10);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (21, '33', 1);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (22, '34', 2);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (23, '35', 3);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (24, '36', 4);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (25, '37', 5);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (26, '38', 6);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (27, '39', 7);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (28, '40', 8);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (29, '41', 9);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (30, '42', 10);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (31, '44', 1);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (32, '46', 2);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (33, '48', 3);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (34, '50', 4);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (35, '52', 5);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (36, '54', 6);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (37, '56', 7);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (38, '58', 8);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (39, '60', 9);
INSERT INTO "ProjetoDados25.1".colaborador_empresa VALUES (40, '62', 10);


--
-- TOC entry 3373 (class 0 OID 16403)
-- Dependencies: 213
-- Data for Name: colaborador_photo; Type: TABLE DATA; Schema: ProjetoDados25.1; Owner: postgres
--

INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (1, '1', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176287-o-negocio-avatar-perfil-preto-icone-mulher-do-do-utilizador-plano-simbolo-dentro-na-moda-preenchidas-estilo-isolado-em-femea-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (2, '2', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176287-o-negocio-avatar-perfil-preto-icone-mulher-do-do-utilizador-plano-simbolo-dentro-na-moda-preenchidas-estilo-isolado-em-femea-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (3, '3', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176287-o-negocio-avatar-perfil-preto-icone-mulher-do-do-utilizador-plano-simbolo-dentro-na-moda-preenchidas-estilo-isolado-em-femea-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (4, '4', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176287-o-negocio-avatar-perfil-preto-icone-mulher-do-do-utilizador-plano-simbolo-dentro-na-moda-preenchidas-estilo-isolado-em-femea-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (5, '5', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176197-o-negocio-avatar-perfil-preto-icone-homem-do-do-utilizador-simbolo-dentro-na-moda-plano-estilo-isolado-em-masculino-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (6, '6', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176197-o-negocio-avatar-perfil-preto-icone-homem-do-do-utilizador-simbolo-dentro-na-moda-plano-estilo-isolado-em-masculino-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (7, '7', NULL);
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (8, '8', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176197-o-negocio-avatar-perfil-preto-icone-homem-do-do-utilizador-simbolo-dentro-na-moda-plano-estilo-isolado-em-masculino-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (9, '9', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176287-o-negocio-avatar-perfil-preto-icone-mulher-do-do-utilizador-plano-simbolo-dentro-na-moda-preenchidas-estilo-isolado-em-femea-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (10, '10', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176197-o-negocio-avatar-perfil-preto-icone-homem-do-do-utilizador-simbolo-dentro-na-moda-plano-estilo-isolado-em-masculino-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (11, '11', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176197-o-negocio-avatar-perfil-preto-icone-homem-do-do-utilizador-simbolo-dentro-na-moda-plano-estilo-isolado-em-masculino-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (12, '12', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176287-o-negocio-avatar-perfil-preto-icone-mulher-do-do-utilizador-plano-simbolo-dentro-na-moda-preenchidas-estilo-isolado-em-femea-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (13, '13', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176197-o-negocio-avatar-perfil-preto-icone-homem-do-do-utilizador-simbolo-dentro-na-moda-plano-estilo-isolado-em-masculino-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (14, '14', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176287-o-negocio-avatar-perfil-preto-icone-mulher-do-do-utilizador-plano-simbolo-dentro-na-moda-preenchidas-estilo-isolado-em-femea-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (15, '15', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176197-o-negocio-avatar-perfil-preto-icone-homem-do-do-utilizador-simbolo-dentro-na-moda-plano-estilo-isolado-em-masculino-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (16, '16', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176287-o-negocio-avatar-perfil-preto-icone-mulher-do-do-utilizador-plano-simbolo-dentro-na-moda-preenchidas-estilo-isolado-em-femea-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (17, '17', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176197-o-negocio-avatar-perfil-preto-icone-homem-do-do-utilizador-simbolo-dentro-na-moda-plano-estilo-isolado-em-masculino-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (18, '18', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176287-o-negocio-avatar-perfil-preto-icone-mulher-do-do-utilizador-plano-simbolo-dentro-na-moda-preenchidas-estilo-isolado-em-femea-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (19, '19', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176197-o-negocio-avatar-perfil-preto-icone-homem-do-do-utilizador-simbolo-dentro-na-moda-plano-estilo-isolado-em-masculino-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (20, '20', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176287-o-negocio-avatar-perfil-preto-icone-mulher-do-do-utilizador-plano-simbolo-dentro-na-moda-preenchidas-estilo-isolado-em-femea-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (21, '21', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176197-o-negocio-avatar-perfil-preto-icone-homem-do-do-utilizador-simbolo-dentro-na-moda-plano-estilo-isolado-em-masculino-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (22, '22', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176287-o-negocio-avatar-perfil-preto-icone-mulher-do-do-utilizador-plano-simbolo-dentro-na-moda-preenchidas-estilo-isolado-em-femea-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (23, '23', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176197-o-negocio-avatar-perfil-preto-icone-homem-do-do-utilizador-simbolo-dentro-na-moda-plano-estilo-isolado-em-masculino-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (24, '24', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176287-o-negocio-avatar-perfil-preto-icone-mulher-do-do-utilizador-plano-simbolo-dentro-na-moda-preenchidas-estilo-isolado-em-femea-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (25, '25', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176197-o-negocio-avatar-perfil-preto-icone-homem-do-do-utilizador-simbolo-dentro-na-moda-plano-estilo-isolado-em-masculino-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (26, '26', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176287-o-negocio-avatar-perfil-preto-icone-mulher-do-do-utilizador-plano-simbolo-dentro-na-moda-preenchidas-estilo-isolado-em-femea-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (27, '27', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176197-o-negocio-avatar-perfil-preto-icone-homem-do-do-utilizador-simbolo-dentro-na-moda-plano-estilo-isolado-em-masculino-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (28, '28', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176287-o-negocio-avatar-perfil-preto-icone-mulher-do-do-utilizador-plano-simbolo-dentro-na-moda-preenchidas-estilo-isolado-em-femea-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (29, '29', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176197-o-negocio-avatar-perfil-preto-icone-homem-do-do-utilizador-simbolo-dentro-na-moda-plano-estilo-isolado-em-masculino-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (30, '30', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176287-o-negocio-avatar-perfil-preto-icone-mulher-do-do-utilizador-plano-simbolo-dentro-na-moda-preenchidas-estilo-isolado-em-femea-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (31, '31', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176197-o-negocio-avatar-perfil-preto-icone-homem-do-do-utilizador-simbolo-dentro-na-moda-plano-estilo-isolado-em-masculino-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (32, '32', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176287-o-negocio-avatar-perfil-preto-icone-mulher-do-do-utilizador-plano-simbolo-dentro-na-moda-preenchidas-estilo-isolado-em-femea-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (33, '33', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176197-o-negocio-avatar-perfil-preto-icone-homem-do-do-utilizador-simbolo-dentro-na-moda-plano-estilo-isolado-em-masculino-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (34, '34', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176287-o-negocio-avatar-perfil-preto-icone-mulher-do-do-utilizador-plano-simbolo-dentro-na-moda-preenchidas-estilo-isolado-em-femea-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (35, '35', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176197-o-negocio-avatar-perfil-preto-icone-homem-do-do-utilizador-simbolo-dentro-na-moda-plano-estilo-isolado-em-masculino-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (36, '36', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176287-o-negocio-avatar-perfil-preto-icone-mulher-do-do-utilizador-plano-simbolo-dentro-na-moda-preenchidas-estilo-isolado-em-femea-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (37, '37', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176197-o-negocio-avatar-perfil-preto-icone-homem-do-do-utilizador-simbolo-dentro-na-moda-plano-estilo-isolado-em-masculino-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (38, '38', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176287-o-negocio-avatar-perfil-preto-icone-mulher-do-do-utilizador-plano-simbolo-dentro-na-moda-preenchidas-estilo-isolado-em-femea-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (39, '39', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176197-o-negocio-avatar-perfil-preto-icone-homem-do-do-utilizador-simbolo-dentro-na-moda-plano-estilo-isolado-em-masculino-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (40, '40', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176287-o-negocio-avatar-perfil-preto-icone-mulher-do-do-utilizador-plano-simbolo-dentro-na-moda-preenchidas-estilo-isolado-em-femea-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (41, '41', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176197-o-negocio-avatar-perfil-preto-icone-homem-do-do-utilizador-simbolo-dentro-na-moda-plano-estilo-isolado-em-masculino-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (42, '42', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176287-o-negocio-avatar-perfil-preto-icone-mulher-do-do-utilizador-plano-simbolo-dentro-na-moda-preenchidas-estilo-isolado-em-femea-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (43, '43', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176197-o-negocio-avatar-perfil-preto-icone-homem-do-do-utilizador-simbolo-dentro-na-moda-plano-estilo-isolado-em-masculino-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (44, '44', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176287-o-negocio-avatar-perfil-preto-icone-mulher-do-do-utilizador-plano-simbolo-dentro-na-moda-preenchidas-estilo-isolado-em-femea-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (45, '45', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176197-o-negocio-avatar-perfil-preto-icone-homem-do-do-utilizador-simbolo-dentro-na-moda-plano-estilo-isolado-em-masculino-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (46, '46', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176287-o-negocio-avatar-perfil-preto-icone-mulher-do-do-utilizador-plano-simbolo-dentro-na-moda-preenchidas-estilo-isolado-em-femea-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (47, '47', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176197-o-negocio-avatar-perfil-preto-icone-homem-do-do-utilizador-simbolo-dentro-na-moda-plano-estilo-isolado-em-masculino-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (48, '48', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176287-o-negocio-avatar-perfil-preto-icone-mulher-do-do-utilizador-plano-simbolo-dentro-na-moda-preenchidas-estilo-isolado-em-femea-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (49, '49', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176197-o-negocio-avatar-perfil-preto-icone-homem-do-do-utilizador-simbolo-dentro-na-moda-plano-estilo-isolado-em-masculino-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (50, '50', 'https://static.vecteezy.com/ti/vetor-gratis/p1/32176287-o-negocio-avatar-perfil-preto-icone-mulher-do-do-utilizador-plano-simbolo-dentro-na-moda-preenchidas-estilo-isolado-em-femea-perfil-pessoas-diverso-face-para-social-rede-ou-rede-vetor.jpg');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (51, '51', 'null');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (52, '52', 'null');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (53, '53', 'null');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (54, '54', 'null');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (55, '55', 'null');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (56, '56', 'null');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (57, '57', 'null');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (58, '58', 'null');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (59, '59', 'null');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (60, '60', 'null');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (61, '61', 'null');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (62, '62', 'null');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (63, '63', 'null');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (64, '64', 'null');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (65, '65', 'null');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (66, '66', 'null');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (67, '67', 'null');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (68, '68', 'null');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (69, '69', 'null');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (70, '70', 'null');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (71, '71', 'null');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (72, '72', 'null');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (73, '73', 'null');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (74, '74', 'null');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (75, '75', 'null');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (76, '76', 'null');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (77, '77', 'null');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (78, '78', 'null');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (79, '79', 'null');
INSERT INTO "ProjetoDados25.1".colaborador_photo VALUES (80, '80', 'null');


--
-- TOC entry 3375 (class 0 OID 16417)
-- Dependencies: 215
-- Data for Name: competencia; Type: TABLE DATA; Schema: ProjetoDados25.1; Owner: postgres
--

INSERT INTO "ProjetoDados25.1".competencia VALUES (1, 'Domínio básico de Python para scripts e automações', 'Python Básico');
INSERT INTO "ProjetoDados25.1".competencia VALUES (2, 'SQL avançado para consultas complexas e otimização', 'SQL Avançado');
INSERT INTO "ProjetoDados25.1".competencia VALUES (3, 'Conhecimento intermediário de C# para desenvolvimento backend', 'C# Intermediário');
INSERT INTO "ProjetoDados25.1".competencia VALUES (4, 'Noções de arquitetura de software e design patterns', 'Arquitetura de Software');
INSERT INTO "ProjetoDados25.1".competencia VALUES (5, 'Experiência com metodologias ágeis como Scrum e Kanban', 'Metodologias Ágeis');
INSERT INTO "ProjetoDados25.1".competencia VALUES (6, 'Conhecimento em React para desenvolvimento frontend', 'React');
INSERT INTO "ProjetoDados25.1".competencia VALUES (7, 'Análise de dados com ferramentas como Power BI e Excel', 'Análise de Dados');
INSERT INTO "ProjetoDados25.1".competencia VALUES (8, 'Gestão de projetos com ferramentas como MS Project', 'Gestão de Projetos');
INSERT INTO "ProjetoDados25.1".competencia VALUES (9, 'Segurança da informação e boas práticas de proteção de dados', 'Segurança da Informação');
INSERT INTO "ProjetoDados25.1".competencia VALUES (10, 'Comunicação eficaz e liderança de equipes técnicas', 'Comunicação e Liderança');


--
-- TOC entry 3379 (class 0 OID 16435)
-- Dependencies: 219
-- Data for Name: empresa; Type: TABLE DATA; Schema: ProjetoDados25.1; Owner: postgres
--

INSERT INTO "ProjetoDados25.1".empresa VALUES (1, '116.586.741/0985-70', '21987654321', 'Rua das Flores, 123, RJ', 'Empresa Alfa', 'TI');
INSERT INTO "ProjetoDados25.1".empresa VALUES (2, '21652281483133', '11987654321', 'Av. Brasil, 456, SP', 'Empresa Beta', 'ti');
INSERT INTO "ProjetoDados25.1".empresa VALUES (3, '68.653.207/8626-34', '31999988877', 'Praça Central, 789, MG', 'Empresa Gama', 'Tecnologia');
INSERT INTO "ProjetoDados25.1".empresa VALUES (4, '34.123.456/0001-99', '27987654321', 'Av. das Américas, 1000, RJ', 'Tech Soluções', 'Tecnologia');
INSERT INTO "ProjetoDados25.1".empresa VALUES (5, '10293847560123', '11333445566', 'Rua XV de Novembro, 456, SP', 'Inova Sistemas', 'TI');
INSERT INTO "ProjetoDados25.1".empresa VALUES (6, '45.678.901/0001-12', '31912345678', 'Rua da Bahia, 300, MG', 'Data Insights', 'Análise de Dados');
INSERT INTO "ProjetoDados25.1".empresa VALUES (7, '98765432100012', '21988776655', 'Rua São Paulo, 777, RJ', 'Global Soft', 'TI');
INSERT INTO "ProjetoDados25.1".empresa VALUES (8, '12.345.678/0001-90', '11332244556', 'Av. Paulista, 1500, SP', 'NextGen Tech', 'Tecnologia');
INSERT INTO "ProjetoDados25.1".empresa VALUES (9, '56789012345678', '51999887766', 'Rua das Flores, 99, RS', 'RS Sistemas', 'TI');
INSERT INTO "ProjetoDados25.1".empresa VALUES (10, '23.456.789/0001-11', '41322114455', 'Rua XV, 123, SC', 'SC Tecnologia', 'TI');


--
-- TOC entry 3384 (class 0 OID 16477)
-- Dependencies: 224
-- Data for Name: empresa_servico; Type: TABLE DATA; Schema: ProjetoDados25.1; Owner: postgres
--

INSERT INTO "ProjetoDados25.1".empresa_servico VALUES (1, 1);
INSERT INTO "ProjetoDados25.1".empresa_servico VALUES (1, 2);
INSERT INTO "ProjetoDados25.1".empresa_servico VALUES (2, 2);
INSERT INTO "ProjetoDados25.1".empresa_servico VALUES (2, 6);
INSERT INTO "ProjetoDados25.1".empresa_servico VALUES (3, 3);
INSERT INTO "ProjetoDados25.1".empresa_servico VALUES (3, 7);
INSERT INTO "ProjetoDados25.1".empresa_servico VALUES (4, 1);
INSERT INTO "ProjetoDados25.1".empresa_servico VALUES (4, 4);
INSERT INTO "ProjetoDados25.1".empresa_servico VALUES (4, 8);
INSERT INTO "ProjetoDados25.1".empresa_servico VALUES (5, 5);
INSERT INTO "ProjetoDados25.1".empresa_servico VALUES (5, 6);
INSERT INTO "ProjetoDados25.1".empresa_servico VALUES (6, 5);
INSERT INTO "ProjetoDados25.1".empresa_servico VALUES (6, 8);
INSERT INTO "ProjetoDados25.1".empresa_servico VALUES (7, 1);
INSERT INTO "ProjetoDados25.1".empresa_servico VALUES (7, 3);
INSERT INTO "ProjetoDados25.1".empresa_servico VALUES (8, 7);
INSERT INTO "ProjetoDados25.1".empresa_servico VALUES (8, 6);
INSERT INTO "ProjetoDados25.1".empresa_servico VALUES (8, 2);
INSERT INTO "ProjetoDados25.1".empresa_servico VALUES (9, 3);
INSERT INTO "ProjetoDados25.1".empresa_servico VALUES (9, 5);
INSERT INTO "ProjetoDados25.1".empresa_servico VALUES (10, 8);
INSERT INTO "ProjetoDados25.1".empresa_servico VALUES (10, 7);


--
-- TOC entry 3377 (class 0 OID 16426)
-- Dependencies: 217
-- Data for Name: servico; Type: TABLE DATA; Schema: ProjetoDados25.1; Owner: postgres
--

INSERT INTO "ProjetoDados25.1".servico VALUES (1, '2025-06-23', 'Manutenção de sistema', 'Manutenção');
INSERT INTO "ProjetoDados25.1".servico VALUES (2, '23/06/2025', 'Atualização de software', 'Atualização');
INSERT INTO "ProjetoDados25.1".servico VALUES (3, '2025/06/25', 'Implantação de sistema', 'Implantação');
INSERT INTO "ProjetoDados25.1".servico VALUES (4, '2025-02-30', 'Serviço inválido', 'Serviço Errado');
INSERT INTO "ProjetoDados25.1".servico VALUES (5, '2024-12-01', 'Auditoria de segurança', 'Auditoria');
INSERT INTO "ProjetoDados25.1".servico VALUES (6, '12-10-2024', 'Desenvolvimento de app mobile', 'Desenvolvimento Mobile');
INSERT INTO "ProjetoDados25.1".servico VALUES (7, '2023/11/15', 'Treinamento de equipe', 'Treinamento');
INSERT INTO "ProjetoDados25.1".servico VALUES (8, '2024-07-31', 'Consultoria TI', 'Consultoria');


--
-- TOC entry 3385 (class 0 OID 16490)
-- Dependencies: 225
-- Data for Name: servico_competencia; Type: TABLE DATA; Schema: ProjetoDados25.1; Owner: postgres
--

INSERT INTO "ProjetoDados25.1".servico_competencia VALUES (1, 2);
INSERT INTO "ProjetoDados25.1".servico_competencia VALUES (1, 4);
INSERT INTO "ProjetoDados25.1".servico_competencia VALUES (1, 9);
INSERT INTO "ProjetoDados25.1".servico_competencia VALUES (2, 1);
INSERT INTO "ProjetoDados25.1".servico_competencia VALUES (2, 2);
INSERT INTO "ProjetoDados25.1".servico_competencia VALUES (2, 5);
INSERT INTO "ProjetoDados25.1".servico_competencia VALUES (3, 3);
INSERT INTO "ProjetoDados25.1".servico_competencia VALUES (3, 4);
INSERT INTO "ProjetoDados25.1".servico_competencia VALUES (3, 6);
INSERT INTO "ProjetoDados25.1".servico_competencia VALUES (3, 10);
INSERT INTO "ProjetoDados25.1".servico_competencia VALUES (4, 8);
INSERT INTO "ProjetoDados25.1".servico_competencia VALUES (5, 2);
INSERT INTO "ProjetoDados25.1".servico_competencia VALUES (5, 7);
INSERT INTO "ProjetoDados25.1".servico_competencia VALUES (5, 9);
INSERT INTO "ProjetoDados25.1".servico_competencia VALUES (6, 1);
INSERT INTO "ProjetoDados25.1".servico_competencia VALUES (6, 3);
INSERT INTO "ProjetoDados25.1".servico_competencia VALUES (6, 6);
INSERT INTO "ProjetoDados25.1".servico_competencia VALUES (6, 5);
INSERT INTO "ProjetoDados25.1".servico_competencia VALUES (7, 8);
INSERT INTO "ProjetoDados25.1".servico_competencia VALUES (7, 10);
INSERT INTO "ProjetoDados25.1".servico_competencia VALUES (8, 4);
INSERT INTO "ProjetoDados25.1".servico_competencia VALUES (8, 5);
INSERT INTO "ProjetoDados25.1".servico_competencia VALUES (8, 7);
INSERT INTO "ProjetoDados25.1".servico_competencia VALUES (8, 10);


--
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 220
-- Name: colaborador_competencia_id_seq; Type: SEQUENCE SET; Schema: ProjetoDados25.1; Owner: postgres
--

SELECT pg_catalog.setval('"ProjetoDados25.1".colaborador_competencia_id_seq', 280, true);


--
-- TOC entry 3399 (class 0 OID 0)
-- Dependencies: 222
-- Name: colaborador_empresa_id_seq; Type: SEQUENCE SET; Schema: ProjetoDados25.1; Owner: postgres
--

SELECT pg_catalog.setval('"ProjetoDados25.1".colaborador_empresa_id_seq', 40, true);


--
-- TOC entry 3400 (class 0 OID 0)
-- Dependencies: 212
-- Name: colaborador_photo_id_seq; Type: SEQUENCE SET; Schema: ProjetoDados25.1; Owner: postgres
--

SELECT pg_catalog.setval('"ProjetoDados25.1".colaborador_photo_id_seq', 80, true);


--
-- TOC entry 3401 (class 0 OID 0)
-- Dependencies: 214
-- Name: competencia_id_competencia_seq; Type: SEQUENCE SET; Schema: ProjetoDados25.1; Owner: postgres
--

SELECT pg_catalog.setval('"ProjetoDados25.1".competencia_id_competencia_seq', 1, false);


--
-- TOC entry 3402 (class 0 OID 0)
-- Dependencies: 218
-- Name: empresa_id_empresa_seq; Type: SEQUENCE SET; Schema: ProjetoDados25.1; Owner: postgres
--

SELECT pg_catalog.setval('"ProjetoDados25.1".empresa_id_empresa_seq', 1, false);


--
-- TOC entry 3403 (class 0 OID 0)
-- Dependencies: 216
-- Name: servico_id_servico_seq; Type: SEQUENCE SET; Schema: ProjetoDados25.1; Owner: postgres
--

SELECT pg_catalog.setval('"ProjetoDados25.1".servico_id_servico_seq', 1, false);


--
-- TOC entry 3220 (class 2606 OID 16449)
-- Name: colaborador_competencia colaborador_competencia_pkey; Type: CONSTRAINT; Schema: ProjetoDados25.1; Owner: postgres
--

ALTER TABLE ONLY "ProjetoDados25.1".colaborador_competencia
    ADD CONSTRAINT colaborador_competencia_pkey PRIMARY KEY (id);


--
-- TOC entry 3222 (class 2606 OID 16466)
-- Name: colaborador_empresa colaborador_empresa_pkey; Type: CONSTRAINT; Schema: ProjetoDados25.1; Owner: postgres
--

ALTER TABLE ONLY "ProjetoDados25.1".colaborador_empresa
    ADD CONSTRAINT colaborador_empresa_pkey PRIMARY KEY (id);


--
-- TOC entry 3212 (class 2606 OID 16410)
-- Name: colaborador_photo colaborador_photo_pkey; Type: CONSTRAINT; Schema: ProjetoDados25.1; Owner: postgres
--

ALTER TABLE ONLY "ProjetoDados25.1".colaborador_photo
    ADD CONSTRAINT colaborador_photo_pkey PRIMARY KEY (id);


--
-- TOC entry 3210 (class 2606 OID 16401)
-- Name: colaborador colaborador_pkey; Type: CONSTRAINT; Schema: ProjetoDados25.1; Owner: postgres
--

ALTER TABLE ONLY "ProjetoDados25.1".colaborador
    ADD CONSTRAINT colaborador_pkey PRIMARY KEY (id_colaborador);


--
-- TOC entry 3214 (class 2606 OID 16424)
-- Name: competencia competencia_pkey; Type: CONSTRAINT; Schema: ProjetoDados25.1; Owner: postgres
--

ALTER TABLE ONLY "ProjetoDados25.1".competencia
    ADD CONSTRAINT competencia_pkey PRIMARY KEY (id_competencia);


--
-- TOC entry 3218 (class 2606 OID 16442)
-- Name: empresa empresa_pkey; Type: CONSTRAINT; Schema: ProjetoDados25.1; Owner: postgres
--

ALTER TABLE ONLY "ProjetoDados25.1".empresa
    ADD CONSTRAINT empresa_pkey PRIMARY KEY (id_empresa);


--
-- TOC entry 3216 (class 2606 OID 16433)
-- Name: servico servico_pkey; Type: CONSTRAINT; Schema: ProjetoDados25.1; Owner: postgres
--

ALTER TABLE ONLY "ProjetoDados25.1".servico
    ADD CONSTRAINT servico_pkey PRIMARY KEY (id_servico);


--
-- TOC entry 3224 (class 2606 OID 16450)
-- Name: colaborador_competencia colaborador_competencia_id_colaborador_fkey; Type: FK CONSTRAINT; Schema: ProjetoDados25.1; Owner: postgres
--

ALTER TABLE ONLY "ProjetoDados25.1".colaborador_competencia
    ADD CONSTRAINT colaborador_competencia_id_colaborador_fkey FOREIGN KEY (id_colaborador) REFERENCES "ProjetoDados25.1".colaborador(id_colaborador);


--
-- TOC entry 3225 (class 2606 OID 16455)
-- Name: colaborador_competencia colaborador_competencia_id_competencia_fkey; Type: FK CONSTRAINT; Schema: ProjetoDados25.1; Owner: postgres
--

ALTER TABLE ONLY "ProjetoDados25.1".colaborador_competencia
    ADD CONSTRAINT colaborador_competencia_id_competencia_fkey FOREIGN KEY (id_competencia) REFERENCES "ProjetoDados25.1".competencia(id_competencia);


--
-- TOC entry 3226 (class 2606 OID 16467)
-- Name: colaborador_empresa colaborador_empresa_id_colaborador_fkey; Type: FK CONSTRAINT; Schema: ProjetoDados25.1; Owner: postgres
--

ALTER TABLE ONLY "ProjetoDados25.1".colaborador_empresa
    ADD CONSTRAINT colaborador_empresa_id_colaborador_fkey FOREIGN KEY (id_colaborador) REFERENCES "ProjetoDados25.1".colaborador(id_colaborador);


--
-- TOC entry 3227 (class 2606 OID 16472)
-- Name: colaborador_empresa colaborador_empresa_id_empresa_fkey; Type: FK CONSTRAINT; Schema: ProjetoDados25.1; Owner: postgres
--

ALTER TABLE ONLY "ProjetoDados25.1".colaborador_empresa
    ADD CONSTRAINT colaborador_empresa_id_empresa_fkey FOREIGN KEY (id_empresa) REFERENCES "ProjetoDados25.1".empresa(id_empresa);


--
-- TOC entry 3223 (class 2606 OID 16411)
-- Name: colaborador_photo colaborador_photo_id_colaborador_fkey; Type: FK CONSTRAINT; Schema: ProjetoDados25.1; Owner: postgres
--

ALTER TABLE ONLY "ProjetoDados25.1".colaborador_photo
    ADD CONSTRAINT colaborador_photo_id_colaborador_fkey FOREIGN KEY (id_colaborador) REFERENCES "ProjetoDados25.1".colaborador(id_colaborador);


--
-- TOC entry 3228 (class 2606 OID 16480)
-- Name: empresa_servico empresa_servico_empresa_id_fkey; Type: FK CONSTRAINT; Schema: ProjetoDados25.1; Owner: postgres
--

ALTER TABLE ONLY "ProjetoDados25.1".empresa_servico
    ADD CONSTRAINT empresa_servico_empresa_id_fkey FOREIGN KEY (empresa_id) REFERENCES "ProjetoDados25.1".empresa(id_empresa);


--
-- TOC entry 3229 (class 2606 OID 16485)
-- Name: empresa_servico empresa_servico_servico_id_fkey; Type: FK CONSTRAINT; Schema: ProjetoDados25.1; Owner: postgres
--

ALTER TABLE ONLY "ProjetoDados25.1".empresa_servico
    ADD CONSTRAINT empresa_servico_servico_id_fkey FOREIGN KEY (servico_id) REFERENCES "ProjetoDados25.1".servico(id_servico);


--
-- TOC entry 3231 (class 2606 OID 16498)
-- Name: servico_competencia servico_competencia_competencia_id_fkey; Type: FK CONSTRAINT; Schema: ProjetoDados25.1; Owner: postgres
--

ALTER TABLE ONLY "ProjetoDados25.1".servico_competencia
    ADD CONSTRAINT servico_competencia_competencia_id_fkey FOREIGN KEY (competencia_id) REFERENCES "ProjetoDados25.1".competencia(id_competencia);


--
-- TOC entry 3230 (class 2606 OID 16493)
-- Name: servico_competencia servico_competencia_servico_id_fkey; Type: FK CONSTRAINT; Schema: ProjetoDados25.1; Owner: postgres
--

ALTER TABLE ONLY "ProjetoDados25.1".servico_competencia
    ADD CONSTRAINT servico_competencia_servico_id_fkey FOREIGN KEY (servico_id) REFERENCES "ProjetoDados25.1".servico(id_servico);


-- Completed on 2025-08-01 10:44:30

--
-- PostgreSQL database dump complete
--

