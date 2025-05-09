PGDMP  1                     }            Lysyakov    17.4    17.4 &    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16388    Lysyakov    DATABASE     m   CREATE DATABASE "Lysyakov" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'ru';
    DROP DATABASE "Lysyakov";
                     postgres    false                        2615    16389    example    SCHEMA        CREATE SCHEMA example;
    DROP SCHEMA example;
                     postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                     postgres    false            �           0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                        postgres    false    6            X           1247    16391    pol    TYPE     5   CREATE TYPE public.pol AS ENUM (
    'm',
    'f'
);
    DROP TYPE public.pol;
       public               postgres    false    6            �            1259    16395    klient    TABLE     �   CREATE TABLE example.klient (
    id integer NOT NULL,
    name character varying(50),
    city character varying(50),
    inn integer,
    phone character varying(11)
);
    DROP TABLE example.klient;
       example         heap r       postgres    false    5            �            1259    16398    klient_id_seq    SEQUENCE     �   CREATE SEQUENCE example.klient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE example.klient_id_seq;
       example               postgres    false    5    218            �           0    0    klient_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE example.klient_id_seq OWNED BY example.klient.id;
          example               postgres    false    219            �            1259    16399    prod    TABLE     �   CREATE TABLE example.prod (
    nomer integer NOT NULL,
    data_p date,
    klient_id integer,
    tovar_artikul integer,
    kokl integer,
    summa integer
);
    DROP TABLE example.prod;
       example         heap r       postgres    false    5            �            1259    16402    prod_nomer_seq    SEQUENCE     �   CREATE SEQUENCE example.prod_nomer_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE example.prod_nomer_seq;
       example               postgres    false    220    5            �           0    0    prod_nomer_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE example.prod_nomer_seq OWNED BY example.prod.nomer;
          example               postgres    false    221            �            1259    16403    tovar    TABLE     �   CREATE TABLE example.tovar (
    artikul integer NOT NULL,
    name character varying(50),
    price integer,
    proizvoditel character varying(50),
    tip character varying(50)
);
    DROP TABLE example.tovar;
       example         heap r       postgres    false    5            �            1259    16406    tovar_artikul_seq    SEQUENCE     �   CREATE SEQUENCE example.tovar_artikul_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE example.tovar_artikul_seq;
       example               postgres    false    5    222            �           0    0    tovar_artikul_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE example.tovar_artikul_seq OWNED BY example.tovar.artikul;
          example               postgres    false    223            �            1259    16407    posehaemost    TABLE     �   CREATE TABLE public.posehaemost (
    data date,
    nom_zachetki character varying(8),
    kolich_chsov numeric(5,0),
    uv_prichuna numeric(5,0),
    neuv_prich numeric(5,0)
);
    DROP TABLE public.posehaemost;
       public         heap r       postgres    false    6            �            1259    16410    student    TABLE     �   CREATE TABLE public.student (
    nom_zachetki character varying(8),
    fio character varying(80),
    gruppa character varying(7),
    date_of_birthday date,
    pol public.pol
);
    DROP TABLE public.student;
       public         heap r       postgres    false    6    856            �            1259    16419    users    TABLE     �   CREATE TABLE public.users (
    "userID" integer NOT NULL,
    username character varying(50),
    dolznost character varying(50),
    pass character varying(20)
);
    DROP TABLE public.users;
       public         heap r       postgres    false    6            �            1259    16418    users_userID_seq    SEQUENCE     �   CREATE SEQUENCE public."users_userID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."users_userID_seq";
       public               postgres    false    227    6            �           0    0    users_userID_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."users_userID_seq" OWNED BY public.users."userID";
          public               postgres    false    226            <           2604    16413 	   klient id    DEFAULT     h   ALTER TABLE ONLY example.klient ALTER COLUMN id SET DEFAULT nextval('example.klient_id_seq'::regclass);
 9   ALTER TABLE example.klient ALTER COLUMN id DROP DEFAULT;
       example               postgres    false    219    218            =           2604    16414 
   prod nomer    DEFAULT     j   ALTER TABLE ONLY example.prod ALTER COLUMN nomer SET DEFAULT nextval('example.prod_nomer_seq'::regclass);
 :   ALTER TABLE example.prod ALTER COLUMN nomer DROP DEFAULT;
       example               postgres    false    221    220            >           2604    16415    tovar artikul    DEFAULT     p   ALTER TABLE ONLY example.tovar ALTER COLUMN artikul SET DEFAULT nextval('example.tovar_artikul_seq'::regclass);
 =   ALTER TABLE example.tovar ALTER COLUMN artikul DROP DEFAULT;
       example               postgres    false    223    222            ?           2604    16422    users userID    DEFAULT     p   ALTER TABLE ONLY public.users ALTER COLUMN "userID" SET DEFAULT nextval('public."users_userID_seq"'::regclass);
 =   ALTER TABLE public.users ALTER COLUMN "userID" DROP DEFAULT;
       public               postgres    false    227    226    227            �          0    16395    klient 
   TABLE DATA           =   COPY example.klient (id, name, city, inn, phone) FROM stdin;
    example               postgres    false    218   N'       �          0    16399    prod 
   TABLE DATA           U   COPY example.prod (nomer, data_p, klient_id, tovar_artikul, kokl, summa) FROM stdin;
    example               postgres    false    220   ;(       �          0    16403    tovar 
   TABLE DATA           I   COPY example.tovar (artikul, name, price, proizvoditel, tip) FROM stdin;
    example               postgres    false    222   �(       �          0    16407    posehaemost 
   TABLE DATA           `   COPY public.posehaemost (data, nom_zachetki, kolich_chsov, uv_prichuna, neuv_prich) FROM stdin;
    public               postgres    false    224   p)       �          0    16410    student 
   TABLE DATA           S   COPY public.student (nom_zachetki, fio, gruppa, date_of_birthday, pol) FROM stdin;
    public               postgres    false    225   �)       �          0    16419    users 
   TABLE DATA           C   COPY public.users ("userID", username, dolznost, pass) FROM stdin;
    public               postgres    false    227   k*       �           0    0    klient_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('example.klient_id_seq', 20, true);
          example               postgres    false    219            �           0    0    prod_nomer_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('example.prod_nomer_seq', 10, true);
          example               postgres    false    221            �           0    0    tovar_artikul_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('example.tovar_artikul_seq', 10, true);
          example               postgres    false    223            �           0    0    users_userID_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."users_userID_seq"', 2, true);
          public               postgres    false    226            A           2606    16417    klient klient_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY example.klient
    ADD CONSTRAINT klient_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY example.klient DROP CONSTRAINT klient_pkey;
       example                 postgres    false    218            C           2606    16424    users users_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY ("userID");
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public                 postgres    false    227            �   �   x�]�1NC1D��à؞]�ޅE)R@ECOE'@ !��	'�z}%��_���̬=���
m��O�P�"uS��k"����5~�����1I�,��¤�0������|�_R��AW�Krr�h]np¼`)k���5���f?>y�L?�u�iA���&�eK�ι�T��R�u������m�u���O��es|�ͩa��Y���"�%�V$N#������:�vm      �   c   x�Uϻ�0����,�������@�^b�H��|���R#1�<����2�H�vb��0"1`f�ԝ+ÊĀ+��w�;�~�;p){N3{�9(�      �   �   x�m�1
�0�����H��.�v(�-R:�\�z�.Jqp-�OOdk!B�-����BP����٧��<;U�6+�A���R��I�I�<�D��O�ߐF|~_m�?��ζ`<���h.ɿNN�-�4	I����W���>�_��޸�j�Ѹ�@�%:��.�Ay�	'�"~� ��      �   T   x�m���0���%8%iv��s^%R��m����l�@���Zz����v��]�md����_�=�����Y4W�U�KD>��      �   �   x�e�=
�0�Y���$��w��%��i(��}
����'=9������ݶ����hO�r
K�i3�B�sX����ș�JX�-�93kX=����ڼ��-a˱�jǾ�/=q�`�@��$ڠ	ێ���t����?3RF      �   (   x�3�,I-.)-N-�tL����442�2�!���qqq m�     