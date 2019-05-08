--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.13
-- Dumped by pg_dump version 9.5.9

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE "France Metropolitaine";
--
-- Name: France Metropolitaine; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "France Metropolitaine" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_GB.UTF-8' LC_CTYPE = 'en_GB.UTF-8';


ALTER DATABASE "France Metropolitaine" OWNER TO postgres;

\connect -reuse-previous=on "dbname='France Metropolitaine'"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: France Metropolitaine; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE "France Metropolitaine" IS 'Base de données pédagogique sur le thème de la France (Donnée datant de Octobre 2017';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Departement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Departement" (
    "Code_Departement" character varying(3) NOT NULL,
    "Nom" character varying(128) NOT NULL,
    "President" smallint NOT NULL,
    "Chef_Lieu" character varying(5) NOT NULL,
    "Population" integer NOT NULL,
    "Superficie" double precision NOT NULL,
    "Region" smallint NOT NULL
);


ALTER TABLE "Departement" OWNER TO postgres;

--
-- Name: TABLE "Departement"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE "Departement" IS 'Données sur les départements français';


--
-- Name: COLUMN "Departement"."Code_Departement"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "Departement"."Code_Departement" IS 'Code INSEE du département';


--
-- Name: COLUMN "Departement"."Nom"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "Departement"."Nom" IS 'Nom du département';


--
-- Name: COLUMN "Departement"."President"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "Departement"."President" IS 'President du conseil départemental';


--
-- Name: COLUMN "Departement"."Chef_Lieu"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "Departement"."Chef_Lieu" IS 'Code INSEE du chef lieu';


--
-- Name: COLUMN "Departement"."Population"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "Departement"."Population" IS 'Population du département';


--
-- Name: COLUMN "Departement"."Superficie"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "Departement"."Superficie" IS 'Superficie du département';


--
-- Name: COLUMN "Departement"."Region"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "Departement"."Region" IS 'Code INSEE de la région du département';


--
-- Name: Personne_Id_Personne_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Personne_Id_Personne_seq"
    START WITH 87
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Personne_Id_Personne_seq" OWNER TO postgres;

--
-- Name: Personne; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Personne" (
    "Id_Personne" smallint DEFAULT nextval('"Personne_Id_Personne_seq"'::regclass) NOT NULL,
    "Prenom" character varying(128) NOT NULL,
    "Nom" character varying(128) NOT NULL
);


ALTER TABLE "Personne" OWNER TO postgres;

--
-- Name: TABLE "Personne"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE "Personne" IS 'Liste de personnes politiques';


--
-- Name: COLUMN "Personne"."Id_Personne"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "Personne"."Id_Personne" IS 'Identifiant de la personne';


--
-- Name: COLUMN "Personne"."Prenom"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "Personne"."Prenom" IS 'Nom de la personne';


--
-- Name: COLUMN "Personne"."Nom"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "Personne"."Nom" IS 'Prenom de la personne';


--
-- Name: Region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Region" (
    "Id_Region" smallint NOT NULL,
    "Nom" character varying(26) NOT NULL,
    "Code_Prefecture" character varying(5) NOT NULL,
    "President" smallint NOT NULL
);


ALTER TABLE "Region" OWNER TO postgres;

--
-- Name: TABLE "Region"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE "Region" IS 'Données sur les régions de France';


--
-- Name: COLUMN "Region"."Id_Region"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "Region"."Id_Region" IS 'Identifiant INSEE de la région';


--
-- Name: COLUMN "Region"."Code_Prefecture"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "Region"."Code_Prefecture" IS 'Code postale de la préfécture de la région';


--
-- Name: COLUMN "Region"."President"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "Region"."President" IS 'Président de la région';


--
-- Name: Sous-Prefecture; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Sous-Prefecture" (
    "Departement" character varying(5) NOT NULL,
    "Ville" character varying(5) NOT NULL
);


ALTER TABLE "Sous-Prefecture" OWNER TO postgres;

--
-- Name: Ville; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Ville" (
    "Code_Ville" character varying(5) NOT NULL,
    "Code_Postal" integer NOT NULL,
    "Nom" character varying(128) NOT NULL,
    "Maire" smallint NOT NULL,
    "Population" integer NOT NULL,
    "Superficie" double precision NOT NULL,
    "Departement" character varying NOT NULL
);


ALTER TABLE "Ville" OWNER TO postgres;

--
-- Name: TABLE "Ville"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE "Ville" IS 'Données sur les principales villes de France';


--
-- Name: COLUMN "Ville"."Code_Ville"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "Ville"."Code_Ville" IS 'Code INSEE de la ville';


--
-- Name: COLUMN "Ville"."Code_Postal"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "Ville"."Code_Postal" IS 'Un code postal de la ville';


--
-- Name: COLUMN "Ville"."Nom"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "Ville"."Nom" IS 'Nom de la ville';


--
-- Name: COLUMN "Ville"."Maire"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "Ville"."Maire" IS 'Identifiant du maire';


--
-- Name: COLUMN "Ville"."Population"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "Ville"."Population" IS 'Population de la ville';


--
-- Name: COLUMN "Ville"."Superficie"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "Ville"."Superficie" IS 'Superficie de la ville en km2';


--
-- Name: COLUMN "Ville"."Departement"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "Ville"."Departement" IS 'Code INSEE du département de la ville';


--
-- Data for Name: Departement; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "Departement" VALUES ('2A', 'Corse-du-Sud', 27, '2A004', 149234, 4014, 94);
INSERT INTO "Departement" VALUES ('2B', 'Haute-Corse', 28, '2B033', 170974, 4666, 94);
INSERT INTO "Departement" VALUES ('22', 'Côtes-d''Armor', 30, '22278', 597397, 6878, 53);
INSERT INTO "Departement" VALUES ('29', 'Finistère', 32, '29232', 905855, 6733, 53);
INSERT INTO "Departement" VALUES ('56', 'Morbihan', 34, '56260', 741051, 6823, 53);
INSERT INTO "Departement" VALUES ('35', 'Ille-et-Vilaine', 40, '35238', 1032240, 6775, 53);
INSERT INTO "Departement" VALUES ('59', 'Nord', 57, '59350', 2603472, 5743, 32);
INSERT INTO "Departement" VALUES ('02', 'Aisne', 64, '02408', 539783, 7361.52999999999975, 32);
INSERT INTO "Departement" VALUES ('62', 'Pas-de-Calais', 75, '62041', 1472589, 6671, 32);
INSERT INTO "Departement" VALUES ('14', 'Calvados', 89, '14118', 691670, 5548, 28);
INSERT INTO "Departement" VALUES ('50', 'Manche', 98, '50502', 499958, 5938, 28);
INSERT INTO "Departement" VALUES ('76', 'Seine-Maritime', 108, '76540', 1254609, 6278, 28);
INSERT INTO "Departement" VALUES ('44', 'Loire-Atlantique', 111, '44109', 1346592, 6815.39999999999964, 52);
INSERT INTO "Departement" VALUES ('85', 'Vendée', 119, '85191', 662122, 6719.59000000000015, 52);
INSERT INTO "Departement" VALUES ('31', 'Haute-Garonne', 131, '31555', 1317668, 6309, 76);
INSERT INTO "Departement" VALUES ('11', 'Aude', 138, '11069', 365478, 6139, 76);
INSERT INTO "Departement" VALUES ('12', 'Aveyron', 142, '12202', 278644, 8735, 76);
INSERT INTO "Departement" VALUES ('30', 'Gard', 146, '30189', 736029, 5853, 76);
INSERT INTO "Departement" VALUES ('32', 'Gers', 150, '32013', 190625, 6257, 76);
INSERT INTO "Departement" VALUES ('34', 'Hérault', 154, '34172', 1107398, 6224, 76);
INSERT INTO "Departement" VALUES ('46', 'Lot', 158, '46042', 173648, 5217, 76);
INSERT INTO "Departement" VALUES ('48', 'Lozère', 162, '48095', 76360, 5167, 76);
INSERT INTO "Departement" VALUES ('65', 'Hautes-Pyrénées', 165, '65440', 228950, 4464, 76);
INSERT INTO "Departement" VALUES ('66', 'Pyrénées-Orientales', 169, '66136', 466327, 4116, 76);
INSERT INTO "Departement" VALUES ('81', 'Tarn', 173, '81004', 384474, 5758, 76);
INSERT INTO "Departement" VALUES ('82', 'Tarn-et-Garonne', 176, '82121', 252578, 3717, 76);
INSERT INTO "Departement" VALUES ('69', 'Rhône', 179, '69123', 442851, 2715, 84);
INSERT INTO "Departement" VALUES ('01', 'Ain', 181, '01053', 626127, 5762, 84);
INSERT INTO "Departement" VALUES ('03', 'Allier', 186, '03190', 343062, 7340, 84);
INSERT INTO "Departement" VALUES ('07', 'Ardèche', 190, '07186', 322381, 5529, 84);
INSERT INTO "Departement" VALUES ('15', 'Cantal', 194, '15014', 146618, 5726, 84);
INSERT INTO "Departement" VALUES ('26', 'Drôme', 198, '26362', 499159, 6530, 84);
INSERT INTO "Departement" VALUES ('38', 'Isère', 202, '38185', 1243597, 7431, 84);
INSERT INTO "Departement" VALUES ('42', 'Loire', 206, '42218', 757305, 4781, 84);
INSERT INTO "Departement" VALUES ('43', 'Haute-Loire', 210, '43157', 226565, 4977, 84);
INSERT INTO "Departement" VALUES ('63', 'Puy-de-Dôme', 214, '63113', 644216, 7970, 84);
INSERT INTO "Departement" VALUES ('73', 'Savoie', 220, '73065', 426924, 6028, 84);
INSERT INTO "Departement" VALUES ('21', 'Côte-d''Or', 229, '21231', 531380, 8763, 27);
INSERT INTO "Departement" VALUES ('25', 'Doubs', 232, '25056', 534710, 5234, 27);
INSERT INTO "Departement" VALUES ('71', 'Saône-et-Loire', 238, '71270', 555788, 8575, 27);
INSERT INTO "Departement" VALUES ('58', 'Nièvre', 244, '58194', 213569, 6817, 27);
INSERT INTO "Departement" VALUES ('39', 'Jura', 249, '39300', 260681, 4999, 27);
INSERT INTO "Departement" VALUES ('89', 'Yonne', 253, '89024', 341814, 7427, 27);
INSERT INTO "Departement" VALUES ('13', 'Bouches-du-Rhône', 260, '13055', 2006069, 5087, 93);
INSERT INTO "Departement" VALUES ('27', 'Eure', 94, '27229', 598347, 6040, 28);
INSERT INTO "Departement" VALUES ('53', 'Mayenne', 123, '53130', 307350, 5175.19999999999982, 52);
INSERT INTO "Departement" VALUES ('49', 'Maine-et-Loire', 114, '49007', 801168, 7171.89999999999964, 52);
INSERT INTO "Departement" VALUES ('60', 'Oise', 70, '60057', 818680, 5860, 32);
INSERT INTO "Departement" VALUES ('61', 'Orne', 103, '61001', 287750, 6103, 28);
INSERT INTO "Departement" VALUES ('90', 'Territoire de Belfort', 236, '90010', 144334, 609, 27);
INSERT INTO "Departement" VALUES ('80', 'Somme', 83, '80021', 571632, 6170, 32);
INSERT INTO "Departement" VALUES ('72', 'Sarthe', 127, '72181', 568760, 6206, 52);
INSERT INTO "Departement" VALUES ('74', 'Haute-Savoie', 224, '74010', 783127, 4388, 84);
INSERT INTO "Departement" VALUES ('83', 'Var', 269, '83137', 1038212, 5973, 93);
INSERT INTO "Departement" VALUES ('84', 'Vaucluse', 273, '84007', 554374, 3567, 93);
INSERT INTO "Departement" VALUES ('04', 'Bouches-du-Rhône', 264, '04070', 161588, 6925, 93);
INSERT INTO "Departement" VALUES ('05', 'Hautes-Alpes', 280, '05061', 139883, 5549, 93);
INSERT INTO "Departement" VALUES ('06', 'Alpes-Maritimes', 277, '06088', 1083312, 4299, 93);
INSERT INTO "Departement" VALUES ('09', 'Ariège', 134, '09122', 152574, 4890, 76);
INSERT INTO "Departement" VALUES ('70', 'Haute-Saône', 257, '70550', 238347, 5360, 27);
INSERT INTO "Departement" VALUES ('45', 'Loiret', 284, '45234', 669737, 6775, 24);
INSERT INTO "Departement" VALUES ('41', 'Loir-et-Cher', 287, '45234', 333567, 6343, 24);
INSERT INTO "Departement" VALUES ('36', 'Indre', 292, '36044', 226175, 6784.52000000000044, 24);
INSERT INTO "Departement" VALUES ('28', 'Eure-et-Loir', 297, '28085', 433762, 5880, 24);
INSERT INTO "Departement" VALUES ('37', 'Indre-et-Loire', 301, '28085', 603924, 6127, 24);
INSERT INTO "Departement" VALUES ('18', 'Cher', 307, '18033', 310270, 7235, 24);
INSERT INTO "Departement" VALUES ('67', 'Bas-Rhin', 311, '67482', 1112815, 4755, 44);
INSERT INTO "Departement" VALUES ('57', 'Moselle', 316, '57463', 1045154, 6216, 44);
INSERT INTO "Departement" VALUES ('54', 'Meurthe-et-Moselle', 322, '54395', 732153, 5246, 44);
INSERT INTO "Departement" VALUES ('08', 'Meurthe-et-Moselle', 327, '08105', 279715, 5229, 44);
INSERT INTO "Departement" VALUES ('68', 'Meurthe-et-Moselle', 332, '68066', 760134, 3525.17000000000007, 44);
INSERT INTO "Departement" VALUES ('88', 'Vosges', 337, '68066', 373560, 5874, 44);
INSERT INTO "Departement" VALUES ('55', 'Meuse', 341, '55029', 191530, 6211, 44);
INSERT INTO "Departement" VALUES ('52', 'Haute-Marne', 345, '55029', 180673, 6211, 44);
INSERT INTO "Departement" VALUES ('10', 'Aube', 349, '10387', 308094, 6004, 44);
INSERT INTO "Departement" VALUES ('51', 'Marne', 353, '51108', 570817, 8169.47000000000025, 44);
INSERT INTO "Departement" VALUES ('75', 'Paris', 20, '75056', 2220445, 105.400000000000006, 11);
INSERT INTO "Departement" VALUES ('77', 'Seine-et-Marne', 359, '77288', 1377846, 5915, 11);
INSERT INTO "Departement" VALUES ('78', 'Yvelines', 365, '77288', 1421670, 2284.40000000000009, 11);
INSERT INTO "Departement" VALUES ('91', 'Essonne', 370, '91228', 1268228, 1804, 11);
INSERT INTO "Departement" VALUES ('92', 'Hauts-de-Seine', 375, '92050', 1597770, 176, 11);
INSERT INTO "Departement" VALUES ('93', 'Hauts-de-Seine', 380, '93008', 1571028, 236, 11);
INSERT INTO "Departement" VALUES ('94', 'Val-de-Marne', 384, '94028', 1365039, 245, 11);
INSERT INTO "Departement" VALUES ('95', 'Val-d''Oise', 388, '95500', 1205539, 1246, 11);
INSERT INTO "Departement" VALUES ('33', 'Gironde', 392, '33063', 1526016, 9975.60000000000036, 75);
INSERT INTO "Departement" VALUES ('17', 'Charente-Maritime', 399, '17300', 637089, 6864, 75);
INSERT INTO "Departement" VALUES ('24', 'Dordogne', 405, '24322', 416350, 9060, 75);
INSERT INTO "Departement" VALUES ('47', 'Lot-et-Garonne', 410, '47001', 333234, 5361, 75);
INSERT INTO "Departement" VALUES ('16', 'Charente', 416, '16015', 353853, 5956, 75);
INSERT INTO "Departement" VALUES ('64', 'Pyrénées-Atlantiques', 420, '64445', 667249, 7645, 75);
INSERT INTO "Departement" VALUES ('86', 'Vienne', 424, '86194', 433203, 6990, 75);
INSERT INTO "Departement" VALUES ('87', 'Haute-Vienne', 428, '87085', 376199, 5520, 75);
INSERT INTO "Departement" VALUES ('79', 'Deux-Sèvres', 432, '79191', 373553, 5999, 75);
INSERT INTO "Departement" VALUES ('19', 'Corrèze', 436, '19272', 241340, 5857, 75);
INSERT INTO "Departement" VALUES ('23', 'Creuse', 440, '19272', 120581, 5565, 75);
INSERT INTO "Departement" VALUES ('40', 'Landes', 443, '40192', 400477, 9243, 75);


--
-- Data for Name: Personne; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "Personne" VALUES (1, 'Laurent', 'Wauquiez');
INSERT INTO "Personne" VALUES (13, 'Renaud', 'Muselier');
INSERT INTO "Personne" VALUES (10, 'Alain', 'Rousset');
INSERT INTO "Personne" VALUES (12, 'Bruno', 'Retailleau');
INSERT INTO "Personne" VALUES (5, 'Jean-Guy', 'Talamoni');
INSERT INTO "Personne" VALUES (3, 'Loïg', 'Chesnais-Girard');
INSERT INTO "Personne" VALUES (2, 'Marie-Guite', 'Dufay');
INSERT INTO "Personne" VALUES (4, 'François', 'Bonneau');
INSERT INTO "Personne" VALUES (9, 'Hervé', 'Morin');
INSERT INTO "Personne" VALUES (7, 'Xavier', 'Bertrand');
INSERT INTO "Personne" VALUES (6, 'Jean-Luc', 'Bohl');
INSERT INTO "Personne" VALUES (8, 'Valérie', 'Pécresse');
INSERT INTO "Personne" VALUES (11, 'Carole', 'Delga');
INSERT INTO "Personne" VALUES (14, 'Georges', 'Képénékian');
INSERT INTO "Personne" VALUES (15, 'François', 'Rebsamen');
INSERT INTO "Personne" VALUES (16, 'Nathalie', 'Appéré');
INSERT INTO "Personne" VALUES (17, 'Olivier', 'Carré');
INSERT INTO "Personne" VALUES (18, 'Laurent', 'Marcangeli');
INSERT INTO "Personne" VALUES (19, 'Martine', 'Aubry');
INSERT INTO "Personne" VALUES (20, 'Anne', 'Hidalgo');
INSERT INTO "Personne" VALUES (21, 'Yvon', 'Robert');
INSERT INTO "Personne" VALUES (22, 'Alain', 'Juppé');
INSERT INTO "Personne" VALUES (23, 'Jean-Luc', 'Moudenc');
INSERT INTO "Personne" VALUES (24, 'Johanna', 'Rolland');
INSERT INTO "Personne" VALUES (25, 'Jean-Claude', 'Gaudin');
INSERT INTO "Personne" VALUES (26, 'Roland', 'Ries');
INSERT INTO "Personne" VALUES (27, 'Pierre-Jean', 'Luciani');
INSERT INTO "Personne" VALUES (28, 'François', 'Orlandi');
INSERT INTO "Personne" VALUES (29, 'Pierre', 'Savelli');
INSERT INTO "Personne" VALUES (30, 'Alain', 'Cadec');
INSERT INTO "Personne" VALUES (31, 'Marie-Claire', 'Diouron');
INSERT INTO "Personne" VALUES (32, 'Nathalie', 'Sarrabezolles');
INSERT INTO "Personne" VALUES (33, 'Ludovic', 'Jolivet');
INSERT INTO "Personne" VALUES (34, 'François', 'Goulard');
INSERT INTO "Personne" VALUES (35, 'David', 'Robo');
INSERT INTO "Personne" VALUES (40, 'Jean-Luc', 'Chenut');
INSERT INTO "Personne" VALUES (41, 'Paul', 'Quilichini');
INSERT INTO "Personne" VALUES (42, 'Ange', 'Santini');
INSERT INTO "Personne" VALUES (43, 'Antoine', 'Sindali');
INSERT INTO "Personne" VALUES (44, 'Didier', 'Lechien');
INSERT INTO "Personne" VALUES (46, 'Philippe', 'Le Goff');
INSERT INTO "Personne" VALUES (48, 'Paul', 'Le Bihan');
INSERT INTO "Personne" VALUES (49, 'François', 'Cuillandre');
INSERT INTO "Personne" VALUES (50, 'Gaëlle', 'Nicolas');
INSERT INTO "Personne" VALUES (51, 'Agnès', 'Le Brun');
INSERT INTO "Personne" VALUES (52, 'Louis', 'Feuvrier');
INSERT INTO "Personne" VALUES (53, 'Pascal', 'Duchêne');
INSERT INTO "Personne" VALUES (54, 'Claude', 'Renoult');
INSERT INTO "Personne" VALUES (55, 'Norbert', 'Métairie');
INSERT INTO "Personne" VALUES (56, 'Christine', 'Le Strat');
INSERT INTO "Personne" VALUES (57, 'Jean-René', 'Lecerf');
INSERT INTO "Personne" VALUES (58, 'Marie-Annick', 'Dezitter');
INSERT INTO "Personne" VALUES (59, 'François-Xavier', 'Villain');
INSERT INTO "Personne" VALUES (60, 'Frédéric', 'Chéreau');
INSERT INTO "Personne" VALUES (61, 'Patrice', 'Vergriete');
INSERT INTO "Personne" VALUES (62, 'Laurent', 'Degallaix');
INSERT INTO "Personne" VALUES (64, 'Nicolas', 'Fricoteaux');
INSERT INTO "Personne" VALUES (65, 'Éric', 'Delhaye');
INSERT INTO "Personne" VALUES (66, 'Sébastien', 'Eugène');
INSERT INTO "Personne" VALUES (67, 'Frédérique', 'Macarez');
INSERT INTO "Personne" VALUES (68, 'Alain', 'Crémont');
INSERT INTO "Personne" VALUES (69, 'Jean-Marc', 'Prince');
INSERT INTO "Personne" VALUES (70, 'Édouard', 'Courtial');
INSERT INTO "Personne" VALUES (71, 'Caroline', 'Cayeux');
INSERT INTO "Personne" VALUES (72, 'Lionel', 'Ollivier');
INSERT INTO "Personne" VALUES (73, 'Philippe', 'Marini');
INSERT INTO "Personne" VALUES (74, 'Pascale', 'Loiseleur');
INSERT INTO "Personne" VALUES (75, 'Michel', 'Dagbert');
INSERT INTO "Personne" VALUES (76, 'Frédéric', 'Leturque');
INSERT INTO "Personne" VALUES (77, 'Olivier', 'Gacquerre');
INSERT INTO "Personne" VALUES (78, 'Frédéric', 'Cuvillier');
INSERT INTO "Personne" VALUES (79, 'Natacha', 'Bouchart');
INSERT INTO "Personne" VALUES (80, 'Sylvain', 'Robert');
INSERT INTO "Personne" VALUES (81, 'Charles', 'Barège');
INSERT INTO "Personne" VALUES (82, 'François', 'Decoster');
INSERT INTO "Personne" VALUES (83, 'Laurent', 'Somon');
INSERT INTO "Personne" VALUES (84, 'Brigitte', 'Fouré');
INSERT INTO "Personne" VALUES (85, 'Nicolas', 'Dumont');
INSERT INTO "Personne" VALUES (86, 'Isabelle', 'Carpentier');
INSERT INTO "Personne" VALUES (87, 'Thérèse', 'Dheygers');
INSERT INTO "Personne" VALUES (89, 'Jean-Léonce', 'Dupont');
INSERT INTO "Personne" VALUES (90, 'Joël', 'Bruneau');
INSERT INTO "Personne" VALUES (91, 'Patrick', 'Gomont');
INSERT INTO "Personne" VALUES (92, 'Bernard', 'Aubril');
INSERT INTO "Personne" VALUES (93, 'Marc', 'Andreu-Sabater');
INSERT INTO "Personne" VALUES (94, 'Sébastien', 'Lecornu');
INSERT INTO "Personne" VALUES (95, 'Guy', 'Lefrand');
INSERT INTO "Personne" VALUES (96, 'Frédéric', 'Duché');
INSERT INTO "Personne" VALUES (97, 'Jean-Hugues', 'Bonamy');
INSERT INTO "Personne" VALUES (98, 'Jacques', 'Witkowski');
INSERT INTO "Personne" VALUES (99, 'François', 'Brière');
INSERT INTO "Personne" VALUES (100, 'David', 'Nicolas');
INSERT INTO "Personne" VALUES (101, 'Benoît', 'Arrivé');
INSERT INTO "Personne" VALUES (102, 'Yves', 'Lamy');
INSERT INTO "Personne" VALUES (103, 'Christophe', 'de Balorre');
INSERT INTO "Personne" VALUES (104, 'Emmanuel', 'Darcissac');
INSERT INTO "Personne" VALUES (106, 'Pierre', 'Pavis');
INSERT INTO "Personne" VALUES (107, 'Jacki', 'Desouche');
INSERT INTO "Personne" VALUES (108, 'Pascal', 'Martin');
INSERT INTO "Personne" VALUES (109, 'Nicolas', 'Langlois');
INSERT INTO "Personne" VALUES (110, 'Luc', 'Lemonnier');
INSERT INTO "Personne" VALUES (111, 'Philippe', 'Grosvalet');
INSERT INTO "Personne" VALUES (112, 'Alain', 'Hunault');
INSERT INTO "Personne" VALUES (113, 'David', 'Samzun');
INSERT INTO "Personne" VALUES (114, 'Christian', 'Gillet');
INSERT INTO "Personne" VALUES (115, 'Christophe', 'Béchu');
INSERT INTO "Personne" VALUES (116, 'Gilles', 'Bourdouleix');
INSERT INTO "Personne" VALUES (117, 'Jackie', 'Goulet');
INSERT INTO "Personne" VALUES (118, 'Gilles', 'Grimaud');
INSERT INTO "Personne" VALUES (119, 'Yves', 'Auvinet');
INSERT INTO "Personne" VALUES (120, 'Luc', 'Bouard');
INSERT INTO "Personne" VALUES (121, 'Didier', 'Gallot');
INSERT INTO "Personne" VALUES (122, 'Jean-Michel', 'Lalère');
INSERT INTO "Personne" VALUES (123, 'Olivier', 'Richefou');
INSERT INTO "Personne" VALUES (124, 'François', 'Zocchetto');
INSERT INTO "Personne" VALUES (125, 'Philippe', 'Henry');
INSERT INTO "Personne" VALUES (126, 'Michel', 'Angot');
INSERT INTO "Personne" VALUES (127, 'Dominique', 'Le Mène');
INSERT INTO "Personne" VALUES (128, 'Jean-Claude', 'Boulard');
INSERT INTO "Personne" VALUES (129, 'Guy-Michel', 'Chauveau');
INSERT INTO "Personne" VALUES (130, 'Frédéric', 'Beauchef');
INSERT INTO "Personne" VALUES (131, 'Georges', 'Méric');
INSERT INTO "Personne" VALUES (132, 'André', 'Mandement');
INSERT INTO "Personne" VALUES (133, 'Jean-Yves', 'Duclos');
INSERT INTO "Personne" VALUES (134, 'Henri', 'Nayrou');
INSERT INTO "Personne" VALUES (135, 'Norbert', 'Meler');
INSERT INTO "Personne" VALUES (136, 'André', 'Trigano');
INSERT INTO "Personne" VALUES (137, 'François', 'Murillo');
INSERT INTO "Personne" VALUES (138, 'André', 'Viola');
INSERT INTO "Personne" VALUES (139, 'Gérard', 'Larrat');
INSERT INTO "Personne" VALUES (140, 'Jean-Paul', 'Dupré');
INSERT INTO "Personne" VALUES (141, 'Didier', 'Mouly');
INSERT INTO "Personne" VALUES (142, 'Jean-François', 'Galliard');
INSERT INTO "Personne" VALUES (143, 'Christian', 'Teyssèdre');
INSERT INTO "Personne" VALUES (144, 'Christophe', 'Saint-Pierre');
INSERT INTO "Personne" VALUES (145, 'Serge', 'Roques');
INSERT INTO "Personne" VALUES (146, 'Denis', 'Bouad');
INSERT INTO "Personne" VALUES (147, 'Jean-Paul', 'Fournier');
INSERT INTO "Personne" VALUES (148, 'Max', 'Roustan');
INSERT INTO "Personne" VALUES (149, 'Éric', 'Doulcier');
INSERT INTO "Personne" VALUES (150, 'Philippe', 'Martin');
INSERT INTO "Personne" VALUES (151, 'Franck', 'Montaugé');
INSERT INTO "Personne" VALUES (152, 'Gérard', 'Dubrac');
INSERT INTO "Personne" VALUES (153, 'Pierre', 'Beaudran');
INSERT INTO "Personne" VALUES (154, 'Kléber', 'Mesquida');
INSERT INTO "Personne" VALUES (155, 'Philippe', 'Saurel');
INSERT INTO "Personne" VALUES (156, 'Robert', 'Ménard');
INSERT INTO "Personne" VALUES (157, 'Marie-Christine', 'Bousquet');
INSERT INTO "Personne" VALUES (158, 'Serge', 'Rigal');
INSERT INTO "Personne" VALUES (159, 'Jean-Marc', 'Vayssouze-Faure');
INSERT INTO "Personne" VALUES (160, 'André', 'Mellinger');
INSERT INTO "Personne" VALUES (161, 'Marie-Odile', 'Delcamp');
INSERT INTO "Personne" VALUES (162, 'Sophie', 'Pantel');
INSERT INTO "Personne" VALUES (163, 'Laurent', 'Suau');
INSERT INTO "Personne" VALUES (164, 'Christian', 'Huguet');
INSERT INTO "Personne" VALUES (165, 'Michel', 'Pélieu');
INSERT INTO "Personne" VALUES (166, 'Gérard', 'Trémège');
INSERT INTO "Personne" VALUES (167, 'Dominique', 'Roux');
INSERT INTO "Personne" VALUES (168, 'Claude', 'Cazabat');
INSERT INTO "Personne" VALUES (169, 'Hermeline', 'Malherbe-Laurent');
INSERT INTO "Personne" VALUES (170, 'Jean-Marc', 'Pujol');
INSERT INTO "Personne" VALUES (173, 'Christophe', 'Ramond');
INSERT INTO "Personne" VALUES (174, 'Stéphanie', 'Guiraud-Chaumeil');
INSERT INTO "Personne" VALUES (176, 'Christian', 'Astruc');
INSERT INTO "Personne" VALUES (177, 'Brigitte', 'Barèges');
INSERT INTO "Personne" VALUES (171, 'Alain', 'Torrent');
INSERT INTO "Personne" VALUES (172, 'Jean', 'Castex');
INSERT INTO "Personne" VALUES (175, 'Pascal', 'Bugis');
INSERT INTO "Personne" VALUES (178, 'Jean-Philippe', 'Bésiers');
INSERT INTO "Personne" VALUES (179, 'Christophe', 'Guilloteau');
INSERT INTO "Personne" VALUES (180, 'Thomas', 'Ravier');
INSERT INTO "Personne" VALUES (181, 'Jean', 'Deguerry');
INSERT INTO "Personne" VALUES (182, 'Jean-François', 'Debat');
INSERT INTO "Personne" VALUES (183, 'Pierre', 'Berthet');
INSERT INTO "Personne" VALUES (184, 'Patrice', 'Dunand');
INSERT INTO "Personne" VALUES (185, 'Jean-Pierre', 'Carminati');
INSERT INTO "Personne" VALUES (186, 'Claude', 'Riboulet');
INSERT INTO "Personne" VALUES (187, 'Pierre-André', 'Périssol');
INSERT INTO "Personne" VALUES (188, 'Daniel', 'Dugléry');
INSERT INTO "Personne" VALUES (189, 'Frédéric', 'Aguilera');
INSERT INTO "Personne" VALUES (190, 'Hervé', 'Saulignac');
INSERT INTO "Personne" VALUES (191, 'Michel', 'Valla');
INSERT INTO "Personne" VALUES (192, 'Jean-Roger', 'Durand');
INSERT INTO "Personne" VALUES (193, 'Frédéric', 'Sausset');
INSERT INTO "Personne" VALUES (194, 'Bruno', 'Faure');
INSERT INTO "Personne" VALUES (195, 'Pierre', 'Mathonier');
INSERT INTO "Personne" VALUES (196, 'Gérard', 'Leymonie');
INSERT INTO "Personne" VALUES (197, 'Pierre', 'Jarlier');
INSERT INTO "Personne" VALUES (198, 'Marie-Pierre', 'Mouton');
INSERT INTO "Personne" VALUES (199, 'Nicolas', 'Daragon');
INSERT INTO "Personne" VALUES (200, 'Gilbert', 'Trémolet');
INSERT INTO "Personne" VALUES (201, 'Pierre', 'Combes');
INSERT INTO "Personne" VALUES (202, 'Jean-Pierre', 'Barbier');
INSERT INTO "Personne" VALUES (203, 'Éric', 'Piolle');
INSERT INTO "Personne" VALUES (204, 'Fabien', 'Rajon');
INSERT INTO "Personne" VALUES (205, 'Thierry', 'Kovacs');
INSERT INTO "Personne" VALUES (206, 'Georges', 'Ziegler');
INSERT INTO "Personne" VALUES (207, 'Gaël', 'Perdriau');
INSERT INTO "Personne" VALUES (208, 'Christophe', 'Bazile');
INSERT INTO "Personne" VALUES (209, 'Yves', 'Nicolin');
INSERT INTO "Personne" VALUES (210, 'Jean-Pierre', 'Marcon');
INSERT INTO "Personne" VALUES (211, 'Michel', 'Chapuis');
INSERT INTO "Personne" VALUES (212, 'Jean-Jacques', 'Faucher');
INSERT INTO "Personne" VALUES (213, 'Bernard', 'Gallot');
INSERT INTO "Personne" VALUES (214, 'Jean-Yves', 'Gouttebel');
INSERT INTO "Personne" VALUES (215, 'Olivier', 'Bianchi');
INSERT INTO "Personne" VALUES (216, 'Myriam', 'Fougère');
INSERT INTO "Personne" VALUES (217, 'Bertrand', 'Barraud');
INSERT INTO "Personne" VALUES (218, 'Pierre', 'Pécoul');
INSERT INTO "Personne" VALUES (219, 'Claude', 'Nowotny');
INSERT INTO "Personne" VALUES (220, 'Hervé', 'Gaymard');
INSERT INTO "Personne" VALUES (221, 'Michel', 'Dantin');
INSERT INTO "Personne" VALUES (222, 'Martine', 'Berthet');
INSERT INTO "Personne" VALUES (223, 'Pierre-Marie', 'Charvoz');
INSERT INTO "Personne" VALUES (224, 'Christian', 'Monteil');
INSERT INTO "Personne" VALUES (225, 'Jean-Luc', 'Rigaut');
INSERT INTO "Personne" VALUES (226, 'Stéphane', 'Valli');
INSERT INTO "Personne" VALUES (227, 'Antoine', 'Vielliard');
INSERT INTO "Personne" VALUES (228, 'Jean', 'Denais');
INSERT INTO "Personne" VALUES (229, 'François', 'Sauvadet');
INSERT INTO "Personne" VALUES (230, 'Alain', 'Suguenot');
INSERT INTO "Personne" VALUES (231, 'Laurence', 'Porte');
INSERT INTO "Personne" VALUES (232, 'Christine', 'Bouquin');
INSERT INTO "Personne" VALUES (233, 'Jean-Louis', 'Fousseret');
INSERT INTO "Personne" VALUES (234, 'Marie-Noëlle', 'Biguinet');
INSERT INTO "Personne" VALUES (235, 'Patrick', 'Genre');
INSERT INTO "Personne" VALUES (236, 'Florian', 'Bouquet');
INSERT INTO "Personne" VALUES (237, 'Damien', 'Meslot');
INSERT INTO "Personne" VALUES (238, 'André', 'Accary');
INSERT INTO "Personne" VALUES (239, 'Jean-Patrick', 'Courtois');
INSERT INTO "Personne" VALUES (240, 'Vincent', 'Chauvet');
INSERT INTO "Personne" VALUES (241, 'Gilles', 'Platret');
INSERT INTO "Personne" VALUES (242, 'Pierre', 'Berthier');
INSERT INTO "Personne" VALUES (243, 'Frédéric', 'Bouchet');
INSERT INTO "Personne" VALUES (244, 'Patrice', 'Joly');
INSERT INTO "Personne" VALUES (245, 'Denis', 'Thuriot');
INSERT INTO "Personne" VALUES (246, 'Jean-Jacques', 'Pic');
INSERT INTO "Personne" VALUES (247, 'Claudine', 'Boisorieux');
INSERT INTO "Personne" VALUES (248, 'Michel', 'Veneau');
INSERT INTO "Personne" VALUES (249, 'Clément', 'Pernot');
INSERT INTO "Personne" VALUES (250, 'Jacques', 'Pélissard');
INSERT INTO "Personne" VALUES (251, 'Jean-Baptiste', 'Gagnoux');
INSERT INTO "Personne" VALUES (252, 'Jean-Louis', 'Millet');
INSERT INTO "Personne" VALUES (253, 'André', 'Villiers');
INSERT INTO "Personne" VALUES (254, 'Guy', 'Férez');
INSERT INTO "Personne" VALUES (255, 'Jean-Yves', 'Caullet');
INSERT INTO "Personne" VALUES (256, 'Marie-Louise', 'Fort');
INSERT INTO "Personne" VALUES (257, 'Yves', 'Krattinger');
INSERT INTO "Personne" VALUES (258, 'Alain', 'Chrétien');
INSERT INTO "Personne" VALUES (259, 'Éric', 'Houlley');
INSERT INTO "Personne" VALUES (260, 'Martine', 'Vassal');
INSERT INTO "Personne" VALUES (261, 'Maryse', 'Joissains-Masini');
INSERT INTO "Personne" VALUES (262, 'Hervé', 'Schiavetti');
INSERT INTO "Personne" VALUES (263, 'François', 'Bernardini');
INSERT INTO "Personne" VALUES (264, 'Nathalie', 'Ponce-Gassier');
INSERT INTO "Personne" VALUES (265, 'Patricia', 'Granet');
INSERT INTO "Personne" VALUES (266, 'Pierre', 'Martin-Charpenel');
INSERT INTO "Personne" VALUES (267, 'Jean-Pierre', 'Terrienl');
INSERT INTO "Personne" VALUES (268, 'Gérard', 'Avril');
INSERT INTO "Personne" VALUES (269, 'Marc', 'Giraud');
INSERT INTO "Personne" VALUES (270, 'Hubert', 'Falco');
INSERT INTO "Personne" VALUES (271, 'Didier', 'Brémond');
INSERT INTO "Personne" VALUES (272, 'Richard', 'Strambio');
INSERT INTO "Personne" VALUES (273, 'Maurice', 'Chabert');
INSERT INTO "Personne" VALUES (274, 'Cécile', 'Helle');
INSERT INTO "Personne" VALUES (275, 'Dominique', 'Santoni');
INSERT INTO "Personne" VALUES (276, 'Francis', 'Adolphe');
INSERT INTO "Personne" VALUES (277, 'Charles-Ange', 'Ginésy');
INSERT INTO "Personne" VALUES (278, 'Christian', 'Estrosi');
INSERT INTO "Personne" VALUES (279, 'Jérôme', 'Viaud');
INSERT INTO "Personne" VALUES (280, 'Jean-Marie', 'Bernard');
INSERT INTO "Personne" VALUES (281, 'Roger', 'Didier');
INSERT INTO "Personne" VALUES (283, 'Gérard', 'Fromm');
INSERT INTO "Personne" VALUES (284, 'Hugues', 'Saury');
INSERT INTO "Personne" VALUES (285, 'Jean-Pierre', 'Door');
INSERT INTO "Personne" VALUES (286, 'Philippe', 'Nolland');
INSERT INTO "Personne" VALUES (287, 'Nicolas', 'Perruchot');
INSERT INTO "Personne" VALUES (288, 'Marc', 'Gricourt');
INSERT INTO "Personne" VALUES (289, 'Jeanny', 'Lorgeoux');
INSERT INTO "Personne" VALUES (290, 'Pascal', 'Brindeau');
INSERT INTO "Personne" VALUES (292, 'Serge', 'Descout');
INSERT INTO "Personne" VALUES (293, 'Gil', 'Averous');
INSERT INTO "Personne" VALUES (294, 'Annick', 'Gombert');
INSERT INTO "Personne" VALUES (295, 'Patrick', 'Judalet');
INSERT INTO "Personne" VALUES (296, 'André', 'Laignel');
INSERT INTO "Personne" VALUES (297, 'Claude', 'Térouinard');
INSERT INTO "Personne" VALUES (298, 'Jean-Pierre', 'Gorges');
INSERT INTO "Personne" VALUES (299, 'Alain', 'Venot');
INSERT INTO "Personne" VALUES (300, 'Gérard', 'Hamel');
INSERT INTO "Personne" VALUES (301, 'Jean-Gérard', 'Paumier');
INSERT INTO "Personne" VALUES (302, 'Christophe', 'Bouchet');
INSERT INTO "Personne" VALUES (303, 'Jean-Luc', 'Dupont');
INSERT INTO "Personne" VALUES (304, 'Marc', 'Angenault');
INSERT INTO "Personne" VALUES (307, 'Michel', 'Autissier');
INSERT INTO "Personne" VALUES (308, 'Pascal', 'Blanc');
INSERT INTO "Personne" VALUES (309, 'Thierry', 'Vinçon');
INSERT INTO "Personne" VALUES (310, 'Nicolas', 'Sansu');
INSERT INTO "Personne" VALUES (311, 'Frédéric', 'Bierry');
INSERT INTO "Personne" VALUES (312, 'Claude', 'Sturni');
INSERT INTO "Personne" VALUES (313, 'Marcel', 'Bauer');
INSERT INTO "Personne" VALUES (314, 'Stéphane', 'Leyenberger');
INSERT INTO "Personne" VALUES (315, 'Laurent', 'Furst');
INSERT INTO "Personne" VALUES (316, 'Patrick', 'Weiten');
INSERT INTO "Personne" VALUES (317, 'Dominique', 'Gros');
INSERT INTO "Personne" VALUES (318, 'Pierre', 'Cuny');
INSERT INTO "Personne" VALUES (319, 'Céleste', 'Lett');
INSERT INTO "Personne" VALUES (320, 'Alain', 'Marty');
INSERT INTO "Personne" VALUES (321, 'Laurent', 'Kalinowski');
INSERT INTO "Personne" VALUES (322, 'Mathieu', 'Klein');
INSERT INTO "Personne" VALUES (323, 'Laurent', 'Hénart');
INSERT INTO "Personne" VALUES (324, 'Jacques', 'Lamblin');
INSERT INTO "Personne" VALUES (325, 'Alde', 'Harmand');
INSERT INTO "Personne" VALUES (326, 'François', 'Dietsch');
INSERT INTO "Personne" VALUES (327, 'Benoît', 'Huré');
INSERT INTO "Personne" VALUES (328, 'Boris', 'Ravignon');
INSERT INTO "Personne" VALUES (329, 'Guy', 'Deramaix');
INSERT INTO "Personne" VALUES (330, 'Didier', 'Herbillon');
INSERT INTO "Personne" VALUES (331, 'Yann', 'Dugard');
INSERT INTO "Personne" VALUES (332, 'Brigitte', 'Klinkert');
INSERT INTO "Personne" VALUES (333, 'Gilbert', 'Meyer');
INSERT INTO "Personne" VALUES (334, 'Nicolas', 'Jander');
INSERT INTO "Personne" VALUES (335, 'Michèle', 'Lutz');
INSERT INTO "Personne" VALUES (336, 'Romain', 'Luttringer');
INSERT INTO "Personne" VALUES (337, 'François', 'Vannson');
INSERT INTO "Personne" VALUES (338, 'Michel', 'Heinrich');
INSERT INTO "Personne" VALUES (341, 'Claude', 'Léonard');
INSERT INTO "Personne" VALUES (342, 'Martine', 'Joly');
INSERT INTO "Personne" VALUES (345, 'Bruno', 'Sido');
INSERT INTO "Personne" VALUES (346, 'Christine', 'Guillemy');
INSERT INTO "Personne" VALUES (349, 'Philippe', 'Pichery');
INSERT INTO "Personne" VALUES (350, 'François', 'Baroin');
INSERT INTO "Personne" VALUES (353, 'René-Paul', 'Savary');
INSERT INTO "Personne" VALUES (354, 'Benoist', 'Apparu');
INSERT INTO "Personne" VALUES (339, 'Simon', 'Leclerc');
INSERT INTO "Personne" VALUES (340, 'David', 'Valence');
INSERT INTO "Personne" VALUES (343, 'Jérôme', 'Lefèvre');
INSERT INTO "Personne" VALUES (344, 'Samuel', 'Hazard');
INSERT INTO "Personne" VALUES (347, 'Sophie', 'Delong');
INSERT INTO "Personne" VALUES (348, 'Elisabeth', 'Robert Dehault');
INSERT INTO "Personne" VALUES (351, 'Philippe', 'Borde');
INSERT INTO "Personne" VALUES (352, 'Hugues', 'Fadin');
INSERT INTO "Personne" VALUES (356, 'Franck', 'Leroy');
INSERT INTO "Personne" VALUES (357, 'Arnaud', 'Robinet');
INSERT INTO "Personne" VALUES (358, 'Jean-Pierre', 'Bouquet');
INSERT INTO "Personne" VALUES (359, 'Jean-Jacques', 'Barbaux');
INSERT INTO "Personne" VALUES (360, 'Louis', 'Vogel');
INSERT INTO "Personne" VALUES (361, 'Frédéric', 'Valletoux');
INSERT INTO "Personne" VALUES (362, 'Jean-François', 'Copé');
INSERT INTO "Personne" VALUES (363, 'Olivier', 'Lavenka');
INSERT INTO "Personne" VALUES (364, 'Guillaume', 'Le Lay-Felzine');
INSERT INTO "Personne" VALUES (365, 'Pierre', 'Bédier');
INSERT INTO "Personne" VALUES (366, 'François', 'de Mazières');
INSERT INTO "Personne" VALUES (367, 'Michel', 'Vialay');
INSERT INTO "Personne" VALUES (368, 'Marc', 'Robert');
INSERT INTO "Personne" VALUES (369, 'Arnaud', 'Péricard');
INSERT INTO "Personne" VALUES (370, 'François', 'Durovray');
INSERT INTO "Personne" VALUES (371, 'Francis', 'Chouat');
INSERT INTO "Personne" VALUES (372, 'Franck', 'Marlin');
INSERT INTO "Personne" VALUES (373, 'Grégoire', 'de Lasteyrie');
INSERT INTO "Personne" VALUES (375, 'Patrick', 'Devedjian');
INSERT INTO "Personne" VALUES (376, 'Patrick', 'Jarry');
INSERT INTO "Personne" VALUES (377, 'Jean-Yves', 'Sénant');
INSERT INTO "Personne" VALUES (378, 'Pierre-Christophe', 'Baguet');
INSERT INTO "Personne" VALUES (380, 'Stéphane', 'Troussel');
INSERT INTO "Personne" VALUES (381, 'Stéphane', 'de Paoli');
INSERT INTO "Personne" VALUES (382, 'Jean-Michel', 'Genestier');
INSERT INTO "Personne" VALUES (383, 'Laurent', 'Russier');
INSERT INTO "Personne" VALUES (384, 'Christian', 'Favier');
INSERT INTO "Personne" VALUES (385, 'Laurent', 'Cathala');
INSERT INTO "Personne" VALUES (386, 'Vincent', 'Jeanbrun');
INSERT INTO "Personne" VALUES (387, 'Jacques J. P.', 'Martin');
INSERT INTO "Personne" VALUES (388, 'Arnaud', 'Bazin');
INSERT INTO "Personne" VALUES (389, 'Philippe', 'Houillon');
INSERT INTO "Personne" VALUES (390, 'Georges', 'Mothron');
INSERT INTO "Personne" VALUES (391, 'Nicolas', 'Maccioni');
INSERT INTO "Personne" VALUES (392, 'Jean-Luc', 'Gleyze');
INSERT INTO "Personne" VALUES (393, 'Yves', 'Foulon');
INSERT INTO "Personne" VALUES (394, 'Denis', 'Baldès');
INSERT INTO "Personne" VALUES (395, 'Philippe', 'Plagnol');
INSERT INTO "Personne" VALUES (396, 'Bernard', 'Guiraud');
INSERT INTO "Personne" VALUES (398, 'Philippe', 'Buisson');
INSERT INTO "Personne" VALUES (399, 'Dominique', 'Bussereau');
INSERT INTO "Personne" VALUES (400, 'Jean-François', 'Fountaine');
INSERT INTO "Personne" VALUES (401, 'Claude', 'Belot');
INSERT INTO "Personne" VALUES (402, 'Hervé', 'Blanché');
INSERT INTO "Personne" VALUES (403, 'Jean-Philippe', 'Machon');
INSERT INTO "Personne" VALUES (404, 'Françoise', 'Mesnard');
INSERT INTO "Personne" VALUES (405, 'Germinal', 'Peiro');
INSERT INTO "Personne" VALUES (406, 'Antoine', 'Audi');
INSERT INTO "Personne" VALUES (407, 'Daniel', 'Garrigue');
INSERT INTO "Personne" VALUES (408, 'Pascal', 'Bourdeau');
INSERT INTO "Personne" VALUES (409, 'Jean-Jacques', 'de Peretti');
INSERT INTO "Personne" VALUES (410, 'Pierre', 'Camani');
INSERT INTO "Personne" VALUES (411, 'Jean Dionis', 'du Séjour');
INSERT INTO "Personne" VALUES (412, 'Daniel', 'Benquet');
INSERT INTO "Personne" VALUES (413, 'Nicolas', 'Lacombe');
INSERT INTO "Personne" VALUES (414, 'Patrick', 'Cassany');
INSERT INTO "Personne" VALUES (416, 'François', 'Bonneau');
INSERT INTO "Personne" VALUES (417, 'Xavier', 'Bonnefont');
INSERT INTO "Personne" VALUES (418, 'Michel', 'Gourinchas');
INSERT INTO "Personne" VALUES (419, 'Jean-Noël', 'Dupré');
INSERT INTO "Personne" VALUES (420, 'Jean-Jacques', 'Lasserre');
INSERT INTO "Personne" VALUES (421, 'François', 'Bayrou');
INSERT INTO "Personne" VALUES (422, 'Jean-René', 'Etchegaray');
INSERT INTO "Personne" VALUES (423, 'Hervé', 'Lucbereilh');
INSERT INTO "Personne" VALUES (424, 'Bruno', 'Belin');
INSERT INTO "Personne" VALUES (425, 'Alain', 'Claeys');
INSERT INTO "Personne" VALUES (426, 'Jean-Pierre', 'Abelin');
INSERT INTO "Personne" VALUES (427, 'Yves', 'Bouloux');
INSERT INTO "Personne" VALUES (429, 'Émile-Roger', 'Lombertie');
INSERT INTO "Personne" VALUES (428, 'Jean-Claude', 'Leblois');
INSERT INTO "Personne" VALUES (430, 'Corine', 'Hourcade-Hatte');
INSERT INTO "Personne" VALUES (431, 'Jean-Marie', 'Rougier');
INSERT INTO "Personne" VALUES (432, 'Gilbert', 'Favreau');
INSERT INTO "Personne" VALUES (433, 'Jérôme', 'Baloge');
INSERT INTO "Personne" VALUES (434, 'Jean-Michel', 'Bernier');
INSERT INTO "Personne" VALUES (435, 'Xavier', 'Argenton');
INSERT INTO "Personne" VALUES (436, 'Pascal', 'Coste');
INSERT INTO "Personne" VALUES (437, 'Bernard', 'Combes');
INSERT INTO "Personne" VALUES (438, 'Frédéric', 'Soulier');
INSERT INTO "Personne" VALUES (439, 'Christophe', 'Arfeuillère');
INSERT INTO "Personne" VALUES (440, 'Valérie', 'Simonet');
INSERT INTO "Personne" VALUES (441, 'Michel', 'Vergnier');
INSERT INTO "Personne" VALUES (442, 'Michel', 'Moine');
INSERT INTO "Personne" VALUES (443, 'Xavier', 'Fortinon');
INSERT INTO "Personne" VALUES (444, 'Charles', 'Dayot');
INSERT INTO "Personne" VALUES (445, 'Élisabeth', 'Bonjean');


--
-- Name: Personne_Id_Personne_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Personne_Id_Personne_seq"', 445, true);


--
-- Data for Name: Region; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "Region" VALUES (84, 'Auvergne-Rhône-Alpes', '69123', 1);
INSERT INTO "Region" VALUES (27, 'Bourgogne-Franche-Comté', '21231', 2);
INSERT INTO "Region" VALUES (53, 'Bretagne', '35238', 3);
INSERT INTO "Region" VALUES (24, 'Centre-Val de Loire', '45234', 4);
INSERT INTO "Region" VALUES (94, 'Corse', '2A004', 5);
INSERT INTO "Region" VALUES (44, 'Grand Est', '67482', 6);
INSERT INTO "Region" VALUES (32, 'Hauts-de-France', '59350', 7);
INSERT INTO "Region" VALUES (11, 'Île-de-France', '75056', 8);
INSERT INTO "Region" VALUES (28, 'Normandie', '76540', 9);
INSERT INTO "Region" VALUES (75, 'Nouvelle-Aquitaine', '33063', 10);
INSERT INTO "Region" VALUES (76, 'Occitanie', '31555', 11);
INSERT INTO "Region" VALUES (52, 'Pays de la Loire', '44109', 12);
INSERT INTO "Region" VALUES (93, 'Provence-Alpes-Côte d''Azur', '13055', 13);


--
-- Data for Name: Sous-Prefecture; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "Sous-Prefecture" VALUES ('2A', '2A272');
INSERT INTO "Sous-Prefecture" VALUES ('2B', '2B050');
INSERT INTO "Sous-Prefecture" VALUES ('2B', '2B096');
INSERT INTO "Sous-Prefecture" VALUES ('22', '22050');
INSERT INTO "Sous-Prefecture" VALUES ('22', '22070');
INSERT INTO "Sous-Prefecture" VALUES ('22', '22113');
INSERT INTO "Sous-Prefecture" VALUES ('29', '29019');
INSERT INTO "Sous-Prefecture" VALUES ('29', '29026');
INSERT INTO "Sous-Prefecture" VALUES ('29', '29151');
INSERT INTO "Sous-Prefecture" VALUES ('35', '35115');
INSERT INTO "Sous-Prefecture" VALUES ('35', '35236');
INSERT INTO "Sous-Prefecture" VALUES ('35', '35288');
INSERT INTO "Sous-Prefecture" VALUES ('56', '56121');
INSERT INTO "Sous-Prefecture" VALUES ('56', '56178');
INSERT INTO "Sous-Prefecture" VALUES ('59', '59036');
INSERT INTO "Sous-Prefecture" VALUES ('59', '59122');
INSERT INTO "Sous-Prefecture" VALUES ('59', '59178');
INSERT INTO "Sous-Prefecture" VALUES ('59', '59183');
INSERT INTO "Sous-Prefecture" VALUES ('59', '59606');
INSERT INTO "Sous-Prefecture" VALUES ('02', '02168');
INSERT INTO "Sous-Prefecture" VALUES ('02', '02691');
INSERT INTO "Sous-Prefecture" VALUES ('02', '02722');
INSERT INTO "Sous-Prefecture" VALUES ('02', '02789');
INSERT INTO "Sous-Prefecture" VALUES ('60', '60157');
INSERT INTO "Sous-Prefecture" VALUES ('60', '60159');
INSERT INTO "Sous-Prefecture" VALUES ('60', '60612');
INSERT INTO "Sous-Prefecture" VALUES ('62', '62119');
INSERT INTO "Sous-Prefecture" VALUES ('62', '62160');
INSERT INTO "Sous-Prefecture" VALUES ('62', '62193');
INSERT INTO "Sous-Prefecture" VALUES ('62', '62498');
INSERT INTO "Sous-Prefecture" VALUES ('62', '62588');
INSERT INTO "Sous-Prefecture" VALUES ('62', '62765');
INSERT INTO "Sous-Prefecture" VALUES ('80', '80001');
INSERT INTO "Sous-Prefecture" VALUES ('80', '80561');
INSERT INTO "Sous-Prefecture" VALUES ('80', '80620');
INSERT INTO "Sous-Prefecture" VALUES ('14', '14047');
INSERT INTO "Sous-Prefecture" VALUES ('14', '14366');
INSERT INTO "Sous-Prefecture" VALUES ('14', '14762');
INSERT INTO "Sous-Prefecture" VALUES ('27', '27016');
INSERT INTO "Sous-Prefecture" VALUES ('27', '27056');
INSERT INTO "Sous-Prefecture" VALUES ('50', '50025');
INSERT INTO "Sous-Prefecture" VALUES ('50', '50129');
INSERT INTO "Sous-Prefecture" VALUES ('50', '50147');
INSERT INTO "Sous-Prefecture" VALUES ('61', '61006');
INSERT INTO "Sous-Prefecture" VALUES ('61', '61293');
INSERT INTO "Sous-Prefecture" VALUES ('76', '76217');
INSERT INTO "Sous-Prefecture" VALUES ('76', '76351');
INSERT INTO "Sous-Prefecture" VALUES ('44', '44036');
INSERT INTO "Sous-Prefecture" VALUES ('44', '44184');
INSERT INTO "Sous-Prefecture" VALUES ('49', '49099');
INSERT INTO "Sous-Prefecture" VALUES ('49', '49328');
INSERT INTO "Sous-Prefecture" VALUES ('49', '49331');
INSERT INTO "Sous-Prefecture" VALUES ('85', '85194');
INSERT INTO "Sous-Prefecture" VALUES ('85', '85092');
INSERT INTO "Sous-Prefecture" VALUES ('53', '53062');
INSERT INTO "Sous-Prefecture" VALUES ('53', '53147');
INSERT INTO "Sous-Prefecture" VALUES ('72', '72154');
INSERT INTO "Sous-Prefecture" VALUES ('72', '72180');
INSERT INTO "Sous-Prefecture" VALUES ('31', '31395');
INSERT INTO "Sous-Prefecture" VALUES ('31', '31483');
INSERT INTO "Sous-Prefecture" VALUES ('11', '11206');
INSERT INTO "Sous-Prefecture" VALUES ('11', '11262');
INSERT INTO "Sous-Prefecture" VALUES ('12', '12145');
INSERT INTO "Sous-Prefecture" VALUES ('12', '12300');
INSERT INTO "Sous-Prefecture" VALUES ('30', '30007');
INSERT INTO "Sous-Prefecture" VALUES ('30', '30350');
INSERT INTO "Sous-Prefecture" VALUES ('32', '32107');
INSERT INTO "Sous-Prefecture" VALUES ('32', '32256');
INSERT INTO "Sous-Prefecture" VALUES ('34', '34032');
INSERT INTO "Sous-Prefecture" VALUES ('34', '34142');
INSERT INTO "Sous-Prefecture" VALUES ('46', '46102');
INSERT INTO "Sous-Prefecture" VALUES ('46', '46127');
INSERT INTO "Sous-Prefecture" VALUES ('48', '48061');
INSERT INTO "Sous-Prefecture" VALUES ('65', '65025');
INSERT INTO "Sous-Prefecture" VALUES ('65', '65059');
INSERT INTO "Sous-Prefecture" VALUES ('66', '66049');
INSERT INTO "Sous-Prefecture" VALUES ('66', '66149');
INSERT INTO "Sous-Prefecture" VALUES ('81', '81065');
INSERT INTO "Sous-Prefecture" VALUES ('82', '82033');
INSERT INTO "Sous-Prefecture" VALUES ('69', '69264');
INSERT INTO "Sous-Prefecture" VALUES ('01', '01034');
INSERT INTO "Sous-Prefecture" VALUES ('01', '01173');
INSERT INTO "Sous-Prefecture" VALUES ('01', '01269');
INSERT INTO "Sous-Prefecture" VALUES ('03', '03185');
INSERT INTO "Sous-Prefecture" VALUES ('03', '03310');
INSERT INTO "Sous-Prefecture" VALUES ('07', '07132');
INSERT INTO "Sous-Prefecture" VALUES ('07', '07324');
INSERT INTO "Sous-Prefecture" VALUES ('15', '15200');
INSERT INTO "Sous-Prefecture" VALUES ('15', '15187');
INSERT INTO "Sous-Prefecture" VALUES ('26', '26113');
INSERT INTO "Sous-Prefecture" VALUES ('26', '26220');
INSERT INTO "Sous-Prefecture" VALUES ('38', '38509');
INSERT INTO "Sous-Prefecture" VALUES ('38', '38544');
INSERT INTO "Sous-Prefecture" VALUES ('42', '42147');
INSERT INTO "Sous-Prefecture" VALUES ('42', '42187');
INSERT INTO "Sous-Prefecture" VALUES ('43', '43040');
INSERT INTO "Sous-Prefecture" VALUES ('43', '43268');
INSERT INTO "Sous-Prefecture" VALUES ('63', '63003');
INSERT INTO "Sous-Prefecture" VALUES ('63', '63178');
INSERT INTO "Sous-Prefecture" VALUES ('63', '63300');
INSERT INTO "Sous-Prefecture" VALUES ('63', '63430');
INSERT INTO "Sous-Prefecture" VALUES ('73', '73011');
INSERT INTO "Sous-Prefecture" VALUES ('73', '73248');
INSERT INTO "Sous-Prefecture" VALUES ('74', '74042');
INSERT INTO "Sous-Prefecture" VALUES ('74', '74243');
INSERT INTO "Sous-Prefecture" VALUES ('74', '74281');
INSERT INTO "Sous-Prefecture" VALUES ('21', '21054');
INSERT INTO "Sous-Prefecture" VALUES ('21', '21425');
INSERT INTO "Sous-Prefecture" VALUES ('25', '25388');
INSERT INTO "Sous-Prefecture" VALUES ('25', '25462');
INSERT INTO "Sous-Prefecture" VALUES ('71', '71014');
INSERT INTO "Sous-Prefecture" VALUES ('71', '71076');
INSERT INTO "Sous-Prefecture" VALUES ('71', '71106');
INSERT INTO "Sous-Prefecture" VALUES ('71', '71263');
INSERT INTO "Sous-Prefecture" VALUES ('58', '58062');
INSERT INTO "Sous-Prefecture" VALUES ('58', '58079');
INSERT INTO "Sous-Prefecture" VALUES ('58', '58086');
INSERT INTO "Sous-Prefecture" VALUES ('39', '39198');
INSERT INTO "Sous-Prefecture" VALUES ('39', '39478');
INSERT INTO "Sous-Prefecture" VALUES ('89', '89025');
INSERT INTO "Sous-Prefecture" VALUES ('89', '89387');
INSERT INTO "Sous-Prefecture" VALUES ('70', '70310');
INSERT INTO "Sous-Prefecture" VALUES ('13', '13001');
INSERT INTO "Sous-Prefecture" VALUES ('13', '13004');
INSERT INTO "Sous-Prefecture" VALUES ('13', '13047');
INSERT INTO "Sous-Prefecture" VALUES ('83', '83023');
INSERT INTO "Sous-Prefecture" VALUES ('83', '83050');
INSERT INTO "Sous-Prefecture" VALUES ('84', '84003');
INSERT INTO "Sous-Prefecture" VALUES ('84', '84031');
INSERT INTO "Sous-Prefecture" VALUES ('04', '04039');
INSERT INTO "Sous-Prefecture" VALUES ('04', '04019');
INSERT INTO "Sous-Prefecture" VALUES ('06', '06069');
INSERT INTO "Sous-Prefecture" VALUES ('05', '05023');
INSERT INTO "Sous-Prefecture" VALUES ('09', '09225');
INSERT INTO "Sous-Prefecture" VALUES ('09', '09261');
INSERT INTO "Sous-Prefecture" VALUES ('04', '04088');
INSERT INTO "Sous-Prefecture" VALUES ('45', '45208');
INSERT INTO "Sous-Prefecture" VALUES ('45', '45252');
INSERT INTO "Sous-Prefecture" VALUES ('41', '41194');
INSERT INTO "Sous-Prefecture" VALUES ('41', '41269');
INSERT INTO "Sous-Prefecture" VALUES ('36', '36018');
INSERT INTO "Sous-Prefecture" VALUES ('36', '36046');
INSERT INTO "Sous-Prefecture" VALUES ('36', '36088');
INSERT INTO "Sous-Prefecture" VALUES ('28', '28088');
INSERT INTO "Sous-Prefecture" VALUES ('28', '28134');
INSERT INTO "Sous-Prefecture" VALUES ('37', '37072');
INSERT INTO "Sous-Prefecture" VALUES ('37', '37132');
INSERT INTO "Sous-Prefecture" VALUES ('18', '18197');
INSERT INTO "Sous-Prefecture" VALUES ('18', '18279');
INSERT INTO "Sous-Prefecture" VALUES ('67', '67180');
INSERT INTO "Sous-Prefecture" VALUES ('67', '67462');
INSERT INTO "Sous-Prefecture" VALUES ('67', '67437');
INSERT INTO "Sous-Prefecture" VALUES ('67', '67300');
INSERT INTO "Sous-Prefecture" VALUES ('57', '57672');
INSERT INTO "Sous-Prefecture" VALUES ('57', '57631');
INSERT INTO "Sous-Prefecture" VALUES ('57', '57630');
INSERT INTO "Sous-Prefecture" VALUES ('57', '57227');
INSERT INTO "Sous-Prefecture" VALUES ('54', '54329');
INSERT INTO "Sous-Prefecture" VALUES ('54', '54528');
INSERT INTO "Sous-Prefecture" VALUES ('54', '54099');
INSERT INTO "Sous-Prefecture" VALUES ('08', '08362');
INSERT INTO "Sous-Prefecture" VALUES ('08', '08409');
INSERT INTO "Sous-Prefecture" VALUES ('08', '08490');
INSERT INTO "Sous-Prefecture" VALUES ('68', '68004');
INSERT INTO "Sous-Prefecture" VALUES ('68', '68224');
INSERT INTO "Sous-Prefecture" VALUES ('68', '68334');
INSERT INTO "Sous-Prefecture" VALUES ('88', '88321');
INSERT INTO "Sous-Prefecture" VALUES ('88', '88413');
INSERT INTO "Sous-Prefecture" VALUES ('55', '55122');
INSERT INTO "Sous-Prefecture" VALUES ('55', '55545');
INSERT INTO "Sous-Prefecture" VALUES ('52', '52269');
INSERT INTO "Sous-Prefecture" VALUES ('52', '52448');
INSERT INTO "Sous-Prefecture" VALUES ('10', '10033');
INSERT INTO "Sous-Prefecture" VALUES ('10', '10268');
INSERT INTO "Sous-Prefecture" VALUES ('51', '51230');
INSERT INTO "Sous-Prefecture" VALUES ('51', '51454');
INSERT INTO "Sous-Prefecture" VALUES ('51', '51649');
INSERT INTO "Sous-Prefecture" VALUES ('77', '77186');
INSERT INTO "Sous-Prefecture" VALUES ('77', '77284');
INSERT INTO "Sous-Prefecture" VALUES ('77', '77379');
INSERT INTO "Sous-Prefecture" VALUES ('77', '77468');
INSERT INTO "Sous-Prefecture" VALUES ('78', '78361');
INSERT INTO "Sous-Prefecture" VALUES ('78', '78517');
INSERT INTO "Sous-Prefecture" VALUES ('78', '78551');
INSERT INTO "Sous-Prefecture" VALUES ('91', '91223');
INSERT INTO "Sous-Prefecture" VALUES ('91', '91477');
INSERT INTO "Sous-Prefecture" VALUES ('92', '92002');
INSERT INTO "Sous-Prefecture" VALUES ('92', '92012');
INSERT INTO "Sous-Prefecture" VALUES ('93', '93062');
INSERT INTO "Sous-Prefecture" VALUES ('93', '93066');
INSERT INTO "Sous-Prefecture" VALUES ('94', '94038');
INSERT INTO "Sous-Prefecture" VALUES ('94', '94052');
INSERT INTO "Sous-Prefecture" VALUES ('95', '95500');
INSERT INTO "Sous-Prefecture" VALUES ('95', '95018');
INSERT INTO "Sous-Prefecture" VALUES ('95', '95585');
INSERT INTO "Sous-Prefecture" VALUES ('33', '33009');
INSERT INTO "Sous-Prefecture" VALUES ('33', '33058');
INSERT INTO "Sous-Prefecture" VALUES ('33', '33227');
INSERT INTO "Sous-Prefecture" VALUES ('33', '33240');
INSERT INTO "Sous-Prefecture" VALUES ('33', '33243');
INSERT INTO "Sous-Prefecture" VALUES ('17', '17197');
INSERT INTO "Sous-Prefecture" VALUES ('17', '17299');
INSERT INTO "Sous-Prefecture" VALUES ('17', '17415');
INSERT INTO "Sous-Prefecture" VALUES ('17', '17347');
INSERT INTO "Sous-Prefecture" VALUES ('24', '24037');
INSERT INTO "Sous-Prefecture" VALUES ('24', '24311');
INSERT INTO "Sous-Prefecture" VALUES ('24', '24520');
INSERT INTO "Sous-Prefecture" VALUES ('47', '47157');
INSERT INTO "Sous-Prefecture" VALUES ('47', '47195');
INSERT INTO "Sous-Prefecture" VALUES ('47', '47323');
INSERT INTO "Sous-Prefecture" VALUES ('16', '16102');
INSERT INTO "Sous-Prefecture" VALUES ('16', '16106');
INSERT INTO "Sous-Prefecture" VALUES ('64', '64102');
INSERT INTO "Sous-Prefecture" VALUES ('64', '64422');
INSERT INTO "Sous-Prefecture" VALUES ('86', '86066');
INSERT INTO "Sous-Prefecture" VALUES ('86', '86165');
INSERT INTO "Sous-Prefecture" VALUES ('87', '87011');
INSERT INTO "Sous-Prefecture" VALUES ('87', '87126');
INSERT INTO "Sous-Prefecture" VALUES ('79', '79049');
INSERT INTO "Sous-Prefecture" VALUES ('79', '79202');
INSERT INTO "Sous-Prefecture" VALUES ('19', '19031');
INSERT INTO "Sous-Prefecture" VALUES ('19', '19275');
INSERT INTO "Sous-Prefecture" VALUES ('23', '23008');
INSERT INTO "Sous-Prefecture" VALUES ('40', '40088');


--
-- Data for Name: Ville; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "Ville" VALUES ('69123', 69001, 'Lyon', 14, 506615, 47.8699999999999974, '69');
INSERT INTO "Ville" VALUES ('21231', 21000, 'Dijon', 15, 153668, 40.4099999999999966, '21');
INSERT INTO "Ville" VALUES ('35238', 35000, 'Rennes', 16, 213454, 50.3900000000000006, '35');
INSERT INTO "Ville" VALUES ('45234', 45000, 'Orléans', 17, 114977, 27.4800000000000004, '45');
INSERT INTO "Ville" VALUES ('2A004', 20000, 'Ajaccio', 18, 68587, 82.0300000000000011, '2A');
INSERT INTO "Ville" VALUES ('59350', 59000, 'Lille', 19, 233897, 34.509999999999998, '59');
INSERT INTO "Ville" VALUES ('75056', 75001, 'Paris', 20, 2220445, 105.400000000000006, '75');
INSERT INTO "Ville" VALUES ('76540', 76000, 'Rouen', 21, 110618, 21.379999999999999, '76');
INSERT INTO "Ville" VALUES ('33063', 33000, 'Bordeaux', 22, 246586, 49.3599999999999994, '33');
INSERT INTO "Ville" VALUES ('31555', 31000, 'Toulouse', 23, 466297, 118.299999999999997, '31');
INSERT INTO "Ville" VALUES ('13055', 13001, 'Marseille', 25, 858120, 240.620000000000005, '13');
INSERT INTO "Ville" VALUES ('67482', 67000, 'Strasbourg', 26, 276170, 78.2600000000000051, '67');
INSERT INTO "Ville" VALUES ('2B033', 20600, 'Bastia', 29, 43331, 19.379999999999999, '2B');
INSERT INTO "Ville" VALUES ('22278', 22000, 'Saint-Brieuc', 31, 45207, 21.879999999999999, '22');
INSERT INTO "Ville" VALUES ('29232', 29000, 'Quimper', 33, 63513, 84.4500000000000028, '29');
INSERT INTO "Ville" VALUES ('56260', 56000, 'Vannes', 35, 53036, 32.2999999999999972, '56');
INSERT INTO "Ville" VALUES ('2A272', 20100, 'Sartène', 41, 3363, 200.400000000000006, '2A');
INSERT INTO "Ville" VALUES ('2B050', 20260, 'Calvi', 42, 5330, 31.1999999999999993, '2B');
INSERT INTO "Ville" VALUES ('2B096', 20250, 'Corte', 43, 7355, 149.27000000000001, '2B');
INSERT INTO "Ville" VALUES ('22050', 22100, 'Dinan', 44, 10919, 3.97999999999999998, '22');
INSERT INTO "Ville" VALUES ('22070', 22200, 'Guingamp', 46, 7003, 3.41000000000000014, '22');
INSERT INTO "Ville" VALUES ('22113', 22300, 'Lannion', 48, 19869, 43.9099999999999966, '22');
INSERT INTO "Ville" VALUES ('29019', 29200, 'Brest', 49, 139384, 49.509999999999998, '29');
INSERT INTO "Ville" VALUES ('29026', 29150, 'Châteaulin', 50, 5173, 20.8099999999999987, '29');
INSERT INTO "Ville" VALUES ('29151', 29600, 'Morlaix', 51, 14837, 24.8200000000000003, '29');
INSERT INTO "Ville" VALUES ('35115', 35300, 'Fougères', 52, 20189, 10.4700000000000006, '35');
INSERT INTO "Ville" VALUES ('35236', 35600, 'Redon', 53, 8921, 15.0899999999999999, '35');
INSERT INTO "Ville" VALUES ('35288', 35400, 'Saint-Malo', 54, 45980, 36.5799999999999983, '35');
INSERT INTO "Ville" VALUES ('56121', 56100, 'Lorient', 55, 57662, 17.4800000000000004, '56');
INSERT INTO "Ville" VALUES ('56178', 56300, 'Pontivy', 56, 13965, 24.8500000000000014, '56');
INSERT INTO "Ville" VALUES ('59036', 59440, 'Avesnes-sur-Helpe', 58, 4662, 2.24000000000000021, '59');
INSERT INTO "Ville" VALUES ('59122', 59400, 'Cambrai', 59, 32897, 18.120000000000001, '59');
INSERT INTO "Ville" VALUES ('59178', 59500, 'Douai', 60, 40736, 16.8999999999999986, '59');
INSERT INTO "Ville" VALUES ('59183', 59140, 'Dunkerque', 61, 89160, 43.8900000000000006, '59');
INSERT INTO "Ville" VALUES ('59606', 59300, 'Valenciennes', 62, 43787, 13.8399999999999999, '59');
INSERT INTO "Ville" VALUES ('02408', 2000, 'Laon', 65, 25282, 42, '02');
INSERT INTO "Ville" VALUES ('02168', 2400, 'Château-Thierry', 66, 14546, 16.5500000000000007, '02');
INSERT INTO "Ville" VALUES ('02691', 2100, 'Saint-Quentin', 67, 55878, 22.5599999999999987, '02');
INSERT INTO "Ville" VALUES ('02722', 2200, 'Soissons', 68, 28290, 12.3200000000000003, '02');
INSERT INTO "Ville" VALUES ('02789', 2140, 'Vervins', 69, 2501, 10.3499999999999996, '02');
INSERT INTO "Ville" VALUES ('60057', 60000, 'Beauvais', 71, 54738, 33.3100000000000023, '60');
INSERT INTO "Ville" VALUES ('60157', 60600, 'Clermont', 72, 10502, 5.80999999999999961, '60');
INSERT INTO "Ville" VALUES ('60159', 60200, 'Compiègne', 73, 40732, 53.1000000000000014, '60');
INSERT INTO "Ville" VALUES ('60612', 60300, 'Senlis', 74, 15292, 24.0500000000000007, '60');
INSERT INTO "Ville" VALUES ('62041', 62000, 'Arras', 76, 40970, 11.6300000000000008, '62');
INSERT INTO "Ville" VALUES ('62160', 62200, 'Boulogne-sur-Mer', 78, 42476, 8.41999999999999993, '62');
INSERT INTO "Ville" VALUES ('62119', 62400, 'Béthune', 77, 25413, 9.42999999999999972, '62');
INSERT INTO "Ville" VALUES ('62193', 62100, 'Calais', 79, 76402, 33.5, '62');
INSERT INTO "Ville" VALUES ('62498', 62300, 'Lens', 80, 31398, 11.6999999999999993, '62');
INSERT INTO "Ville" VALUES ('62588', 62170, 'Montreuil', 81, 2132, 2.85000000000000009, '62');
INSERT INTO "Ville" VALUES ('62765', 62500, 'Saint-Omer', 82, 14164, 16.3999999999999986, '62');
INSERT INTO "Ville" VALUES ('80021', 80000, 'Amiens', 84, 132479, 49.4600000000000009, '80');
INSERT INTO "Ville" VALUES ('80001', 80100, 'Abbeville', 85, 23559, 26.4200000000000017, '80');
INSERT INTO "Ville" VALUES ('80561', 80500, 'Montdidier', 86, 6195, 12.5800000000000001, '80');
INSERT INTO "Ville" VALUES ('80620', 80200, 'Péronne', 87, 7676, 14.1600000000000001, '80');
INSERT INTO "Ville" VALUES ('14118', 14000, 'Caen', 90, 106538, 25.6999999999999993, '14');
INSERT INTO "Ville" VALUES ('14047', 14400, 'Bayeux', 91, 13917, 7.11000000000000032, '14');
INSERT INTO "Ville" VALUES ('14366', 14100, 'Lisieux', 92, 20881, 13.0700000000000003, '14');
INSERT INTO "Ville" VALUES ('14762', 14500, 'Vire Normandie', 93, 17839, 138.52000000000001, '14');
INSERT INTO "Ville" VALUES ('27229', 27000, 'Évreux', 95, 49461, 26.4499999999999993, '27');
INSERT INTO "Ville" VALUES ('27016', 27700, 'Les Andelys', 96, 8186, 40.6199999999999974, '27');
INSERT INTO "Ville" VALUES ('27056', 27300, 'Bernay', 97, 10435, 24.0300000000000011, '27');
INSERT INTO "Ville" VALUES ('50502', 50000, 'Saint-Lô', 99, 19426, 23.1900000000000013, '50');
INSERT INTO "Ville" VALUES ('50025', 50300, 'Avranches', 100, 7813, 4.5, '50');
INSERT INTO "Ville" VALUES ('50129', 50100, 'Cherbourg-en-Cotentin', 101, 80959, 68.5400000000000063, '50');
INSERT INTO "Ville" VALUES ('50147', 50200, 'Coutances', 102, 8789, 12.5099999999999998, '50');
INSERT INTO "Ville" VALUES ('61001', 61000, 'Alençon', 104, 26028, 10.6799999999999997, '61');
INSERT INTO "Ville" VALUES ('61006', 61200, 'Argentan', 106, 13968, 18.1799999999999997, '61');
INSERT INTO "Ville" VALUES ('61293', 61400, 'Mortagne-au-Perche', 107, 3994, 8.59999999999999964, '61');
INSERT INTO "Ville" VALUES ('76217', 76200, 'Dieppe', 109, 30086, 11.6699999999999999, '76');
INSERT INTO "Ville" VALUES ('76351', 76600, 'Le Havre', 110, 172807, 46.9500000000000028, '76');
INSERT INTO "Ville" VALUES ('44036', 44110, 'Châteaubriant', 112, 11895, 33.6199999999999974, '44');
INSERT INTO "Ville" VALUES ('44184', 44600, 'Saint-Nazaire', 113, 69350, 46.7899999999999991, '44');
INSERT INTO "Ville" VALUES ('49007', 49000, 'Angers', 115, 151056, 42.7000000000000028, '49');
INSERT INTO "Ville" VALUES ('49099', 49300, 'Cholet', 116, 53853, 87.4699999999999989, '49');
INSERT INTO "Ville" VALUES ('49328', 49400, 'Saumur', 117, 27301, 66.3499999999999943, '49');
INSERT INTO "Ville" VALUES ('49331', 49500, 'Segré-en-Anjou Bleu', 118, 17580, 241.530000000000001, '49');
INSERT INTO "Ville" VALUES ('85191', 85000, 'La Roche-sur-Yon', 120, 53162, 87.7900000000000063, '84');
INSERT INTO "Ville" VALUES ('85194', 85100, 'Les Sables-d’Olonne', 121, 14376, 8.69999999999999929, '85');
INSERT INTO "Ville" VALUES ('85092', 85200, 'Fontenay-le-Comte', 122, 13609, 34.1599999999999966, '85');
INSERT INTO "Ville" VALUES ('53130', 53000, 'Laval', 124, 50073, 34.2199999999999989, '53');
INSERT INTO "Ville" VALUES ('53062', 53200, 'Château-Gontier', 125, 11528, 28.0300000000000011, '53');
INSERT INTO "Ville" VALUES ('53147', 53100, 'Mayenne', 126, 13139, 19.879999999999999, '53');
INSERT INTO "Ville" VALUES ('72181', 72000, 'Le Mans', 128, 143813, 52.8100000000000023, '72');
INSERT INTO "Ville" VALUES ('72154', 72200, 'La Flèche', 129, 15025, 74.2099999999999937, '72');
INSERT INTO "Ville" VALUES ('72180', 72600, 'Mamers', 130, 5333, 5.04999999999999982, '72');
INSERT INTO "Ville" VALUES ('31395', 31600, 'Muret', 132, 24975, 57.8400000000000034, '31');
INSERT INTO "Ville" VALUES ('31483', 31800, 'Saint-Gaudens', 133, 11255, 33.1799999999999997, '31');
INSERT INTO "Ville" VALUES ('11069', 11000, 'Carcassonne', 139, 45941, 65.0799999999999983, '11');
INSERT INTO "Ville" VALUES ('11206', 11300, 'Limoux', 140, 10275, 32.4099999999999966, '11');
INSERT INTO "Ville" VALUES ('11262', 11100, 'Narbonne', 141, 52855, 172.960000000000008, '11');
INSERT INTO "Ville" VALUES ('12202', 12000, 'Rodez', 143, 24088, 11.1799999999999997, '12');
INSERT INTO "Ville" VALUES ('12145', 12100, 'Millau', 144, 22064, 168.22999999999999, '12');
INSERT INTO "Ville" VALUES ('12300', 12200, 'Villefranche-de-Rouergue', 145, 11822, 45.8500000000000014, '12');
INSERT INTO "Ville" VALUES ('30189', 30000, 'Nîmes', 147, 151075, 161.849999999999994, '30');
INSERT INTO "Ville" VALUES ('30007', 30100, 'Alès', 148, 39993, 23.1600000000000001, '30');
INSERT INTO "Ville" VALUES ('30350', 30120, 'Le Vigan', 149, 3933, 17.2399999999999984, '30');
INSERT INTO "Ville" VALUES ('32013', 32000, 'Auch', 151, 21807, 72.480000000000004, '32');
INSERT INTO "Ville" VALUES ('32107', 32100, 'Condom', 152, 6835, 97.3700000000000045, '32');
INSERT INTO "Ville" VALUES ('32256', 32300, 'Mirande', 153, 3527, 23.4200000000000017, '32');
INSERT INTO "Ville" VALUES ('34172', 34000, 'Montpellier', 155, 275318, 56.8800000000000026, '34');
INSERT INTO "Ville" VALUES ('34032', 34500, 'Béziers', 156, 75701, 95.480000000000004, '34');
INSERT INTO "Ville" VALUES ('34142', 34700, 'Lodève', 157, 7381, 23.1700000000000017, '34');
INSERT INTO "Ville" VALUES ('46042', 46000, 'Cahors', 159, 19630, 64.7199999999999989, '46');
INSERT INTO "Ville" VALUES ('09225', 9100, 'Pamiers', 136, 15518, 45.8500000000000014, '09');
INSERT INTO "Ville" VALUES ('46102', 46100, 'Figeac', 160, 9820, 35.1599999999999966, '46');
INSERT INTO "Ville" VALUES ('46127', 46300, 'Gourdon', 161, 4297, 46, '46');
INSERT INTO "Ville" VALUES ('48095', 48000, 'Mende', 163, 11542, 36.5600000000000023, '48');
INSERT INTO "Ville" VALUES ('48061', 48400, 'Florac Trois Rivières', 164, 2107, 48.3900000000000006, '46');
INSERT INTO "Ville" VALUES ('65440', 65000, 'Tarbes', 166, 40900, 15.3300000000000001, '65');
INSERT INTO "Ville" VALUES ('65025', 65400, 'Argelès-Gazost', 167, 3020, 3.04999999999999982, '65');
INSERT INTO "Ville" VALUES ('65059', 65200, 'Bagnères-de-Bigorre', 168, 7602, 125.859999999999999, '65');
INSERT INTO "Ville" VALUES ('66136', 66000, 'Perpignan', 170, 120605, 68.0699999999999932, '66');
INSERT INTO "Ville" VALUES ('66049', 66400, 'Céret', 171, 7663, 37.8599999999999994, '66');
INSERT INTO "Ville" VALUES ('66149', 66500, 'Prades', 172, 5927, 10.8699999999999992, '66');
INSERT INTO "Ville" VALUES ('81004', 81000, 'Albi', 174, 49531, 44.259999999999998, '81');
INSERT INTO "Ville" VALUES ('81065', 81100, 'Castres', 175, 41382, 98.1700000000000017, '81');
INSERT INTO "Ville" VALUES ('82121', 82000, 'Montauban', 177, 58826, 135.169999999999987, '82');
INSERT INTO "Ville" VALUES ('82033', 82100, 'Castelsarrasin', 178, 13765, 76.769999999999996, '82');
INSERT INTO "Ville" VALUES ('69264', 69400, 'Villefranche-sur-Saône', 180, 36559, 9.48000000000000043, '69');
INSERT INTO "Ville" VALUES ('01053', 1000, 'Bourg-en-Bresse', 182, 40967, 23.8599999999999994, '01');
INSERT INTO "Ville" VALUES ('01034', 1300, 'Belley', 183, 8983, 22.4200000000000017, '01');
INSERT INTO "Ville" VALUES ('01173', 1170, 'Gex', 184, 11141, 32.0200000000000031, '01');
INSERT INTO "Ville" VALUES ('01269', 1130, 'Nantua', 185, 3534, 12.7899999999999991, '01');
INSERT INTO "Ville" VALUES ('03190', 3000, 'Moulins', 187, 19762, 8.60999999999999943, '03');
INSERT INTO "Ville" VALUES ('03185', 3100, 'Montluçon', 188, 37289, 20.6700000000000017, '03');
INSERT INTO "Ville" VALUES ('03310', 3200, 'Vichy', 189, 25279, 5.84999999999999964, '03');
INSERT INTO "Ville" VALUES ('07186', 7000, 'Privas', 191, 8313, 12.1400000000000006, '07');
INSERT INTO "Ville" VALUES ('07132', 7110, 'Largentière', 192, 1734, 7.21999999999999975, '07');
INSERT INTO "Ville" VALUES ('07324', 7300, 'Tournon-sur-Rhône', 193, 10558, 21.0100000000000016, '07');
INSERT INTO "Ville" VALUES ('15014', 15000, 'Aurillac', 195, 26135, 28.7600000000000016, '15');
INSERT INTO "Ville" VALUES ('15200', 15200, 'Mauriac', 196, 3682, 27.6099999999999994, '15');
INSERT INTO "Ville" VALUES ('15187', 15100, 'Saint-Flour', 197, 6643, 27.1400000000000006, '15');
INSERT INTO "Ville" VALUES ('26362', 26000, 'Valence', 199, 62150, 36.6899999999999977, '26');
INSERT INTO "Ville" VALUES ('26113', 26150, 'Die', 200, 4516, 57.2800000000000011, '26');
INSERT INTO "Ville" VALUES ('26220', 26100, 'Nyons', 201, 6641, 23.4499999999999993, '26');
INSERT INTO "Ville" VALUES ('38185', 38000, 'Grenoble', 203, 160779, 18.129999999999999, '38');
INSERT INTO "Ville" VALUES ('38509', 38110, 'La Tour-du-Pin', 204, 7934, 4.76999999999999957, '38');
INSERT INTO "Ville" VALUES ('38544', 38200, 'Vienne', 205, 29096, 22.6499999999999986, '38');
INSERT INTO "Ville" VALUES ('42218', 42000, 'Saint-Étienne', 207, 170761, 79.9699999999999989, '42');
INSERT INTO "Ville" VALUES ('42147', 42600, 'Montbrison', 208, 15689, 16.3299999999999983, '42');
INSERT INTO "Ville" VALUES ('42187', 42300, 'Roanne', 209, 35200, 16.1000000000000014, '42');
INSERT INTO "Ville" VALUES ('43157', 43000, 'Saint-Étienne', 211, 18634, 16.7899999999999991, '43');
INSERT INTO "Ville" VALUES ('43040', 43100, 'Brioude', 212, 6700, 13.5199999999999996, '43');
INSERT INTO "Ville" VALUES ('43268', 43200, 'Yssingeaux', 213, 7105, 80.5699999999999932, '43');
INSERT INTO "Ville" VALUES ('63113', 63000, 'Clermont-Ferrand', 215, 141365, 42.6700000000000017, '63');
INSERT INTO "Ville" VALUES ('63003', 63600, 'Ambert', 216, 6794, 60.4799999999999969, '63');
INSERT INTO "Ville" VALUES ('63178', 63500, 'Issoire', 217, 14578, 19.6900000000000013, '63');
INSERT INTO "Ville" VALUES ('63300', 63200, 'Riom', 218, 18749, 31.9699999999999989, '63');
INSERT INTO "Ville" VALUES ('63430', 63300, 'Thiers', 219, 11588, 44.490000000000002, '63');
INSERT INTO "Ville" VALUES ('73065', 73000, 'Chambéry', 221, 59490, 20.9899999999999984, '73');
INSERT INTO "Ville" VALUES ('73011', 73200, 'Albertville', 222, 18950, 17.5399999999999991, '73');
INSERT INTO "Ville" VALUES ('73248', 73300, 'Saint-Jean-de-Maurienne', 223, 7889, 11.5099999999999998, '73');
INSERT INTO "Ville" VALUES ('74010', 74000, 'Annecy', 225, 124401, 66.9399999999999977, '74');
INSERT INTO "Ville" VALUES ('74042', 74130, 'Bonneville', 226, 12575, 27.1499999999999986, '74');
INSERT INTO "Ville" VALUES ('74243', 74160, 'Saint-Julien-en-Genevois', 227, 13253, 10.5899999999999999, '74');
INSERT INTO "Ville" VALUES ('74281', 74200, 'Thonon-les-Bains', 228, 34973, 16.2100000000000009, '74');
INSERT INTO "Ville" VALUES ('21054', 21200, 'Beaune', 230, 21579, 31.5, '21');
INSERT INTO "Ville" VALUES ('21425', 21500, 'Montbard', 231, 5350, 46.3699999999999974, '21');
INSERT INTO "Ville" VALUES ('25056', 25000, 'Montauban', 233, 116690, 65.0499999999999972, '25');
INSERT INTO "Ville" VALUES ('25388', 25200, 'Montbéliard', 234, 25521, 15.0099999999999998, '25');
INSERT INTO "Ville" VALUES ('25462', 25300, 'Pontarlier', 235, 17413, 41.3500000000000014, '25');
INSERT INTO "Ville" VALUES ('90010', 90000, 'Belfort', 237, 49764, 17.1000000000000014, '25');
INSERT INTO "Ville" VALUES ('71270', 71000, 'Mâcon', 239, 33456, 27, '71');
INSERT INTO "Ville" VALUES ('71014', 71400, 'Autun', 240, 13955, 61.5200000000000031, '71');
INSERT INTO "Ville" VALUES ('71076', 71100, 'Chalon-sur-Saône', 241, 44985, 15.2200000000000006, '71');
INSERT INTO "Ville" VALUES ('71106', 71120, 'Charolles', 242, 2757, 19.9800000000000004, '71');
INSERT INTO "Ville" VALUES ('71263', 71500, 'Louhans', 243, 6349, 22.5799999999999983, '71');
INSERT INTO "Ville" VALUES ('58194', 58000, 'Mâcon', 245, 34485, 17.3299999999999983, '58');
INSERT INTO "Ville" VALUES ('58062', 58120, 'Château-Chinon', 246, 2084, 4.28000000000000025, '58');
INSERT INTO "Ville" VALUES ('58079', 58500, 'Clamecy', 247, 3889, 30.2600000000000016, '58');
INSERT INTO "Ville" VALUES ('58086', 58200, 'Cosne-Cours-sur-Loire', 248, 10553, 53.2999999999999972, '58');
INSERT INTO "Ville" VALUES ('39300', 39000, 'Lons-le-Saunier', 250, 17311, 7.67999999999999972, '39');
INSERT INTO "Ville" VALUES ('39198', 39100, 'Dole', 251, 23312, 38.3800000000000026, '39');
INSERT INTO "Ville" VALUES ('39478', 39200, 'Saint-Claude', 252, 10096, 36.6700000000000017, '39');
INSERT INTO "Ville" VALUES ('89024', 89000, 'Auxerre', 254, 34843, 49.9500000000000028, '89');
INSERT INTO "Ville" VALUES ('89025', 89200, 'Avallon', 255, 7025, 26.75, '89');
INSERT INTO "Ville" VALUES ('89387', 89100, 'Sens', 256, 25507, 21.9100000000000001, '89');
INSERT INTO "Ville" VALUES ('70550', 70000, 'Vesoul', 258, 15212, 9.07000000000000028, '70');
INSERT INTO "Ville" VALUES ('70310', 70200, 'Lure', 259, 8324, 24.3099999999999987, '70');
INSERT INTO "Ville" VALUES ('13001', 13080, 'Aix-en-Provence', 261, 142149, 186.080000000000013, '13');
INSERT INTO "Ville" VALUES ('13004', 13104, 'Arles', 262, 52697, 758.92999999999995, '13');
INSERT INTO "Ville" VALUES ('13047', 13800, 'Istres', 263, 43463, 113.730000000000004, '13');
INSERT INTO "Ville" VALUES ('83137', 83000, 'Toulon', 270, 165584, 42.8400000000000034, '83');
INSERT INTO "Ville" VALUES ('83023', 83170, 'Brignoles', 271, 16690, 70.5300000000000011, '83');
INSERT INTO "Ville" VALUES ('83050', 83300, 'Draguignan', 272, 40054, 53.7000000000000028, '83');
INSERT INTO "Ville" VALUES ('84007', 84000, 'Toulon', 274, 92209, 64.7800000000000011, '84');
INSERT INTO "Ville" VALUES ('84003', 84400, 'Apt', 275, 11885, 44.5700000000000003, '84');
INSERT INTO "Ville" VALUES ('84031', 84200, 'Carpentras', 276, 28447, 37.9200000000000017, '84');
INSERT INTO "Ville" VALUES ('45208', 45200, 'Montargis', 285, 13997, 4.45999999999999996, '45');
INSERT INTO "Ville" VALUES ('45252', 45300, 'Pithiviers', 286, 9054, 6.94000000000000039, '45');
INSERT INTO "Ville" VALUES ('41018', 41000, 'Blois', 288, 46351, 37.4600000000000009, '41');
INSERT INTO "Ville" VALUES ('41194', 41200, 'Romorantin-Lanthenay', 289, 17459, 45.3100000000000023, '41');
INSERT INTO "Ville" VALUES ('41269', 41100, 'Vendôme', 290, 16879, 23.8900000000000006, '41');
INSERT INTO "Ville" VALUES ('36044', 36000, 'Châteauroux', 293, 44479, 19.0399999999999991, '36');
INSERT INTO "Ville" VALUES ('36018', 36300, 'Le Blanc', 294, 6602, 57.6099999999999994, '36');
INSERT INTO "Ville" VALUES ('36046', 36400, 'La Châtre', 295, 4278, 6.05999999999999961, '36');
INSERT INTO "Ville" VALUES ('36088', 36100, 'Issoudun', 296, 12270, 36.6000000000000014, '36');
INSERT INTO "Ville" VALUES ('28085', 28000, 'Chartres', 298, 38728, 16.8500000000000014, '28');
INSERT INTO "Ville" VALUES ('28088', 28200, 'Châteaudun', 299, 13264, 28.4800000000000004, '28');
INSERT INTO "Ville" VALUES ('28134', 28100, 'Dreux', 300, 31191, 24.2699999999999996, '28');
INSERT INTO "Ville" VALUES ('37261', 37000, 'Tours', 302, 136125, 34.6700000000000017, '37');
INSERT INTO "Ville" VALUES ('37072', 37500, 'Chinon', 303, 8073, 39.0200000000000031, '37');
INSERT INTO "Ville" VALUES ('37132', 37600, 'Loches', 304, 6321, 27.0599999999999987, '37');
INSERT INTO "Ville" VALUES ('18033', 18000, 'Bourges', 308, 66528, 68.7399999999999949, '18');
INSERT INTO "Ville" VALUES ('18197', 18200, 'Saint-Amand-Montrond', 309, 10161, 20.1700000000000017, '18');
INSERT INTO "Ville" VALUES ('18279', 18100, 'Vierzon', 310, 27050, 74.5, '18');
INSERT INTO "Ville" VALUES ('67180', 67500, 'Haguenau', 312, 35353, 182.590000000000003, '67');
INSERT INTO "Ville" VALUES ('67462', 67600, 'Sélestat', 313, 19546, 44.3999999999999986, '67');
INSERT INTO "Ville" VALUES ('67437', 67700, 'Saverne', 314, 11433, 26.0100000000000016, '67');
INSERT INTO "Ville" VALUES ('67300', 67120, 'Molsheim', 315, 9263, 10.8499999999999996, '67');
INSERT INTO "Ville" VALUES ('57463', 57000, 'Metz', 317, 117619, 41.9399999999999977, '57');
INSERT INTO "Ville" VALUES ('57672', 57100, 'Thionville', 318, 41083, 49.8599999999999994, '57');
INSERT INTO "Ville" VALUES ('57631', 57200, 'Sarreguemines', 319, 21457, 29.6700000000000017, '57');
INSERT INTO "Ville" VALUES ('57630', 57400, 'Sarrebourg', 320, 12363, 16.3999999999999986, '57');
INSERT INTO "Ville" VALUES ('57227', 57600, 'Forbach', 321, 21740, 16.3200000000000003, '57');
INSERT INTO "Ville" VALUES ('54395', 54000, 'Nancy', 323, 104321, 15.0099999999999998, '54');
INSERT INTO "Ville" VALUES ('54329', 54300, 'Lunéville', 324, 19325, 16.3399999999999999, '54');
INSERT INTO "Ville" VALUES ('54528', 54200, 'Toul', 325, 15966, 30.5899999999999999, '54');
INSERT INTO "Ville" VALUES ('54099', 54150, 'Val de Briey', 326, 8210, 38.9099999999999966, '54');
INSERT INTO "Ville" VALUES ('08105', 8000, 'Charleville-Mézières', 328, 48615, 31.4400000000000013, '08');
INSERT INTO "Ville" VALUES ('08362', 8300, 'Rethel', 329, 7778, 18.5799999999999983, '08');
INSERT INTO "Ville" VALUES ('08409', 8200, 'Sedan', 330, 17829, 16.2800000000000011, '08');
INSERT INTO "Ville" VALUES ('08490', 8400, 'Vouziers', 331, 4004, 27.8000000000000007, '08');
INSERT INTO "Ville" VALUES ('68066', 68000, 'Colmar', 333, 68784, 66.5699999999999932, '68');
INSERT INTO "Ville" VALUES ('68004', 68130, 'Altkirch', 334, 5738, 9.53999999999999915, '68');
INSERT INTO "Ville" VALUES ('68224', 68100, 'Mulhouse', 335, 5012, 22.1799999999999997, '68');
INSERT INTO "Ville" VALUES ('68334', 68800, 'Thann', 336, 7915, 12.5099999999999998, '68');
INSERT INTO "Ville" VALUES ('88160', 88000, 'Épinal', 338, 32006, 59.240000000000002, '88');
INSERT INTO "Ville" VALUES ('88321', 88300, 'Neufchâteau', 339, 6577, 23.8099999999999987, '88');
INSERT INTO "Ville" VALUES ('88413', 88100, 'Saint-Dié-des-Vosges', 340, 20315, 46.1499999999999986, '88');
INSERT INTO "Ville" VALUES ('55029', 55000, 'Bar-le-Duc', 342, 15668, 23.620000000000001, '55');
INSERT INTO "Ville" VALUES ('55122', 55200, 'Commercy', 343, 5914, 35.3699999999999974, '55');
INSERT INTO "Ville" VALUES ('55545', 55100, 'Verdun', 344, 18393, 31.0300000000000011, '55');
INSERT INTO "Ville" VALUES ('52121', 52000, 'Chaumont', 346, 22674, 55.259999999999998, '52');
INSERT INTO "Ville" VALUES ('52269', 52200, 'Langres', 347, 7850, 22.3299999999999983, '52');
INSERT INTO "Ville" VALUES ('52448', 52100, 'Saint-Dizier', 348, 25505, 43.2000000000000028, '52');
INSERT INTO "Ville" VALUES ('10387', 10000, 'Troyes', 350, 60750, 13.1999999999999993, '10');
INSERT INTO "Ville" VALUES ('10033', 10200, 'Bar-sur-Aube', 351, 5014, 16.2699999999999996, '10');
INSERT INTO "Ville" VALUES ('10268', 10400, 'Nogent-sur-Seine', 352, 5955, 20, '10');
INSERT INTO "Ville" VALUES ('51108', 51000, 'Troyes', 354, 45002, 26.0500000000000007, '51');
INSERT INTO "Ville" VALUES ('79202', 79200, 'Parthenay', 435, 10367, 11.3800000000000008, '79');
INSERT INTO "Ville" VALUES ('51230', 51100, 'Épernay', 356, 23176, 22.6900000000000013, '51');
INSERT INTO "Ville" VALUES ('51454', 51100, 'Reims', 357, 183042, 47.0200000000000031, '51');
INSERT INTO "Ville" VALUES ('51649', 51300, 'Vitry-le-François', 358, 13144, 6.45000000000000018, '51');
INSERT INTO "Ville" VALUES ('77288', 77000, 'Melun', 360, 40011, 8.03999999999999915, '77');
INSERT INTO "Ville" VALUES ('77186', 77300, 'Fontainebleau', 361, 14637, 172.050000000000011, '77');
INSERT INTO "Ville" VALUES ('77284', 77100, 'Meaux', 362, 53526, 15.1799999999999997, '77');
INSERT INTO "Ville" VALUES ('77379', 77160, 'Provins', 363, 11736, 14.7200000000000006, '77');
INSERT INTO "Ville" VALUES ('77468', 77200, 'Torcy', 364, 23609, 6, '77');
INSERT INTO "Ville" VALUES ('78646', 78000, 'Versailles', 366, 85461, 26.1799999999999997, '78');
INSERT INTO "Ville" VALUES ('78361', 78200, 'Mantes-la-Jolie', 367, 44985, 9.38000000000000078, '78');
INSERT INTO "Ville" VALUES ('78517', 78120, 'Rambouillet', 368, 25755, 35.1899999999999977, '78');
INSERT INTO "Ville" VALUES ('78551', 78100, 'Saint-Germain-en-Laye', 369, 39540, 48.2700000000000031, '78');
INSERT INTO "Ville" VALUES ('91228', 91000, 'Évry', 371, 52349, 8.33000000000000007, '91');
INSERT INTO "Ville" VALUES ('91223', 91150, 'Étampes', 372, 24503, 40.9200000000000017, '91');
INSERT INTO "Ville" VALUES ('91477', 91120, 'Palaiseau', 373, 32461, 11.5099999999999998, '91');
INSERT INTO "Ville" VALUES ('92050', 92000, 'Nanterre', 376, 93509, 12.1899999999999995, '92');
INSERT INTO "Ville" VALUES ('92002', 92160, 'Antony', 377, 61603, 9.5600000000000005, '92');
INSERT INTO "Ville" VALUES ('92012', 92100, 'Boulogne-Billancourt', 378, 116927, 6.17999999999999972, '92');
INSERT INTO "Ville" VALUES ('93008', 93000, 'Bobigny', 381, 50479, 6.76999999999999957, '93');
INSERT INTO "Ville" VALUES ('93062', 93340, 'Le Raincy', 382, 14400, 2.24000000000000021, '93');
INSERT INTO "Ville" VALUES ('93066', 93200, 'Saint-Denis', 383, 110733, 12.3599999999999994, '93');
INSERT INTO "Ville" VALUES ('94028', 94000, 'Créteil', 385, 91042, 11.4299999999999997, '94');
INSERT INTO "Ville" VALUES ('94038', 94240, 'L''Haÿ-les-Roses', 386, 30772, 3.89999999999999991, '94');
INSERT INTO "Ville" VALUES ('94052', 94130, 'Nogent-sur-Marne', 387, 31292, 2.79999999999999982, '94');
INSERT INTO "Ville" VALUES ('95500', 95000, 'Pontoise', 389, 29766, 7.15000000000000036, '95');
INSERT INTO "Ville" VALUES ('95018', 95100, 'Argenteuil', 390, 108865, 17.2199999999999989, '95');
INSERT INTO "Ville" VALUES ('95585', 95200, 'Sarcelles', 391, 56828, 8.44999999999999929, '95');
INSERT INTO "Ville" VALUES ('33009', 33120, 'Arcachon', 393, 10370, 7.55999999999999961, '33');
INSERT INTO "Ville" VALUES ('33058', 33390, 'Blaye', 394, 4769, 6.41999999999999993, '33');
INSERT INTO "Ville" VALUES ('33227', 33210, 'Langon', 395, 7396, 13.7100000000000009, '33');
INSERT INTO "Ville" VALUES ('33240', 33340, 'Lesparre-Médoc', 396, 5604, 36.9699999999999989, '33');
INSERT INTO "Ville" VALUES ('33243', 33500, 'Libourne', 398, 24595, 20.629999999999999, '33');
INSERT INTO "Ville" VALUES ('17300', 17000, 'La Rochelle', 400, 74998, 28.4299999999999997, '17');
INSERT INTO "Ville" VALUES ('17197', 17500, 'Jonzac', 401, 3447, 13.0899999999999999, '17');
INSERT INTO "Ville" VALUES ('17299', 17300, 'Rochefort', 402, 24300, 21.9499999999999993, '17');
INSERT INTO "Ville" VALUES ('17415', 17100, 'Saintes', 403, 25149, 45.5499999999999972, '17');
INSERT INTO "Ville" VALUES ('17347', 17400, 'Saint-Jean-d’Angély', 404, 7123, 18.7800000000000011, '17');
INSERT INTO "Ville" VALUES ('24322', 24000, 'Périgueux', 406, 30069, 9.82000000000000028, '24');
INSERT INTO "Ville" VALUES ('24037', 24100, 'Bergerac', 407, 27764, 56.1000000000000014, '24');
INSERT INTO "Ville" VALUES ('24311', 24300, 'Nontron', 408, 3151, 24.6700000000000017, '24');
INSERT INTO "Ville" VALUES ('24520', 24200, 'Sarlat-la-Canéda', 409, 9127, 47.1300000000000026, '24');
INSERT INTO "Ville" VALUES ('47001', 47000, 'Agen', 411, 34126, 11.4900000000000002, '47');
INSERT INTO "Ville" VALUES ('47157', 47200, 'Marmande', 412, 17748, 45.0600000000000023, '47');
INSERT INTO "Ville" VALUES ('47195', 47600, 'Nérac', 413, 7085, 62.6799999999999997, '47');
INSERT INTO "Ville" VALUES ('47323', 47300, 'Villeneuve-sur-Lot', 414, 23263, 81.3199999999999932, '47');
INSERT INTO "Ville" VALUES ('16015', 16000, 'Angoulême', 417, 41955, 21.8500000000000014, '16');
INSERT INTO "Ville" VALUES ('16102', 16100, 'Cognac', 418, 18717, 15.5, '16');
INSERT INTO "Ville" VALUES ('16106', 16500, 'Confolens', 419, 2728, 23.629999999999999, '16');
INSERT INTO "Ville" VALUES ('64445', 64000, 'Pau', 421, 77489, 31.5100000000000016, '64');
INSERT INTO "Ville" VALUES ('64102', 64100, 'Bayonne', 422, 48178, 21.6799999999999997, '64');
INSERT INTO "Ville" VALUES ('64422', 64400, 'Oloron-Sainte-Marie', 423, 10824, 68.3100000000000023, '64');
INSERT INTO "Ville" VALUES ('86194', 86000, 'Poitiers', 425, 87435, 42.1099999999999994, '86');
INSERT INTO "Ville" VALUES ('86066', 86100, 'Châtellerault', 426, 31722, 51.9299999999999997, '86');
INSERT INTO "Ville" VALUES ('86165', 86500, 'Montmorillon', 427, 6155, 57, '86');
INSERT INTO "Ville" VALUES ('87085', 87000, 'Limoges', 429, 134577, 77.4500000000000028, '87');
INSERT INTO "Ville" VALUES ('87011', 87300, 'Bellac', 430, 4117, 24.4200000000000017, '87');
INSERT INTO "Ville" VALUES ('87126', 87600, 'Rochechouart', 431, 3798, 53.8800000000000026, '87');
INSERT INTO "Ville" VALUES ('79191', 79000, 'Niort', 433, 58311, 68.2000000000000028, '79');
INSERT INTO "Ville" VALUES ('79049', 79300, 'Bressuire', 434, 19300, 180.590000000000003, '79');
INSERT INTO "Ville" VALUES ('19272', 19000, 'Tulle', 437, 14325, 24.4400000000000013, '19');
INSERT INTO "Ville" VALUES ('19031', 19100, 'Brive-la-Gaillarde', 438, 46961, 48.5900000000000034, '19');
INSERT INTO "Ville" VALUES ('19275', 19200, 'Ussel', 439, 9772, 50.3699999999999974, '19');
INSERT INTO "Ville" VALUES ('23096', 23000, 'Guéret', 441, 13342, 26.2100000000000009, '23');
INSERT INTO "Ville" VALUES ('23008', 23200, 'Aubusson', 442, 3591, 19.2100000000000009, '23');
INSERT INTO "Ville" VALUES ('40192', 40000, 'Mont-de-Marsan', 444, 31009, 36.8800000000000026, '40');
INSERT INTO "Ville" VALUES ('40088', 40100, 'Dax', 445, 20485, 19.6999999999999993, '40');
INSERT INTO "Ville" VALUES ('44109', 44000, 'Nantes', 24, 298029, 65.1899999999999977, '44');
INSERT INTO "Ville" VALUES ('04039', 4120, 'Castellane', 267, 1541, 117.790000000000006, '04');
INSERT INTO "Ville" VALUES ('04019', 4400, 'Barcelonnette', 266, 2698, 16.4200000000000017, '04');
INSERT INTO "Ville" VALUES ('04088', 4300, 'Forcalquier', 268, 4910, 42.759999999999998, '04');
INSERT INTO "Ville" VALUES ('04070', 4000, 'Digne-les-Bains', 265, 16304, 117.069999999999993, '04');
INSERT INTO "Ville" VALUES ('05061', 5000, 'Gap', 281, 40225, 110.430000000000007, '05');
INSERT INTO "Ville" VALUES ('05023', 5100, 'Briançon', 283, 12392, 28.0700000000000003, '05');
INSERT INTO "Ville" VALUES ('06088', 6000, 'Nice', 278, 343895, 71.9200000000000017, '06');
INSERT INTO "Ville" VALUES ('06069', 6130, 'Grasse', 279, 50409, 44.4399999999999977, '06');
INSERT INTO "Ville" VALUES ('09261', 9200, 'Saint-Girons', 137, 6284, 19.129999999999999, '09');
INSERT INTO "Ville" VALUES ('09122', 9000, 'Foix', 135, 9721, 19.3200000000000003, '09');


--
-- Name: Departement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Departement"
    ADD CONSTRAINT "Departement_pkey" PRIMARY KEY ("Code_Departement");


--
-- Name: Personne_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Personne"
    ADD CONSTRAINT "Personne_pkey" PRIMARY KEY ("Id_Personne");


--
-- Name: Region_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Region"
    ADD CONSTRAINT "Region_pkey" PRIMARY KEY ("Id_Region");


--
-- Name: Sous-Prefecture_Ville_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sous-Prefecture"
    ADD CONSTRAINT "Sous-Prefecture_Ville_key" UNIQUE ("Ville");


--
-- Name: Sous-Prefecture_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sous-Prefecture"
    ADD CONSTRAINT "Sous-Prefecture_pkey" PRIMARY KEY ("Departement", "Ville");


--
-- Name: Ville_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Ville"
    ADD CONSTRAINT "Ville_pkey" PRIMARY KEY ("Code_Ville");


--
-- Name: FK_ChefLieu_Ville; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Departement"
    ADD CONSTRAINT "FK_ChefLieu_Ville" FOREIGN KEY ("Chef_Lieu") REFERENCES "Ville"("Code_Ville");


--
-- Name: FK_Departement_Departement; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sous-Prefecture"
    ADD CONSTRAINT "FK_Departement_Departement" FOREIGN KEY ("Departement") REFERENCES "Departement"("Code_Departement");


--
-- Name: FK_Personne_President; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Region"
    ADD CONSTRAINT "FK_Personne_President" FOREIGN KEY ("President") REFERENCES "Personne"("Id_Personne");


--
-- Name: FK_Prefecture_Ville; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Region"
    ADD CONSTRAINT "FK_Prefecture_Ville" FOREIGN KEY ("Code_Prefecture") REFERENCES "Ville"("Code_Ville");


--
-- Name: FK_President_Personne; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Departement"
    ADD CONSTRAINT "FK_President_Personne" FOREIGN KEY ("President") REFERENCES "Personne"("Id_Personne");


--
-- Name: FK_Region_Region; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Departement"
    ADD CONSTRAINT "FK_Region_Region" FOREIGN KEY ("Region") REFERENCES "Region"("Id_Region");


--
-- Name: FK_Ville_Ville; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Sous-Prefecture"
    ADD CONSTRAINT "FK_Ville_Ville" FOREIGN KEY ("Ville") REFERENCES "Ville"("Code_Ville");


--
-- Name: Ville_Departement_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Ville"
    ADD CONSTRAINT "Ville_Departement_fkey" FOREIGN KEY ("Departement") REFERENCES "Departement"("Code_Departement");


--
-- Name: Ville_Maire_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Ville"
    ADD CONSTRAINT "Ville_Maire_fkey" FOREIGN KEY ("Maire") REFERENCES "Personne"("Id_Personne");


--
-- PostgreSQL database dump complete
--

