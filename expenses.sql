PGDMP  :                     }            expenses    17.2    17.2     3           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            4           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            5           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            6           1262    16418    expenses    DATABASE        CREATE DATABASE expenses WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE expenses;
                     postgres    false            �            1259    16419    despesa    TABLE     �   CREATE TABLE public.despesa (
    id integer NOT NULL,
    id_pessoa integer NOT NULL,
    nome_tag character varying(50) NOT NULL
);
    DROP TABLE public.despesa;
       public         heap r       postgres    false            �            1259    16422    despesa_id_seq    SEQUENCE     �   CREATE SEQUENCE public.despesa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.despesa_id_seq;
       public               postgres    false    217            7           0    0    despesa_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.despesa_id_seq OWNED BY public.despesa.id;
          public               postgres    false    218            �            1259    16423    flyway_schema_history    TABLE     �  CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);
 )   DROP TABLE public.flyway_schema_history;
       public         heap r       postgres    false            �            1259    16429    pessoa    TABLE     �   CREATE TABLE public.pessoa (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    historico text NOT NULL,
    preco numeric(10,2) DEFAULT 0 NOT NULL,
    datadespesa date
);
    DROP TABLE public.pessoa;
       public         heap r       postgres    false            �            1259    16435    pessoa_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pessoa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.pessoa_id_seq;
       public               postgres    false    220            8           0    0    pessoa_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.pessoa_id_seq OWNED BY public.pessoa.id;
          public               postgres    false    221            �           2604    16436 
   despesa id    DEFAULT     h   ALTER TABLE ONLY public.despesa ALTER COLUMN id SET DEFAULT nextval('public.despesa_id_seq'::regclass);
 9   ALTER TABLE public.despesa ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    218    217            �           2604    16437 	   pessoa id    DEFAULT     f   ALTER TABLE ONLY public.pessoa ALTER COLUMN id SET DEFAULT nextval('public.pessoa_id_seq'::regclass);
 8   ALTER TABLE public.pessoa ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    221    220            ,          0    16419    despesa 
   TABLE DATA           :   COPY public.despesa (id, id_pessoa, nome_tag) FROM stdin;
    public               postgres    false    217   7       .          0    16423    flyway_schema_history 
   TABLE DATA           �   COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
    public               postgres    false    219   T       /          0    16429    pessoa 
   TABLE DATA           I   COPY public.pessoa (id, nome, historico, preco, datadespesa) FROM stdin;
    public               postgres    false    220   �       9           0    0    despesa_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.despesa_id_seq', 2, true);
          public               postgres    false    218            :           0    0    pessoa_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.pessoa_id_seq', 32, true);
          public               postgres    false    221            �           2606    16439    despesa despesa_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.despesa
    ADD CONSTRAINT despesa_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.despesa DROP CONSTRAINT despesa_pkey;
       public                 postgres    false    217            �           2606    16441 .   flyway_schema_history flyway_schema_history_pk 
   CONSTRAINT     x   ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);
 X   ALTER TABLE ONLY public.flyway_schema_history DROP CONSTRAINT flyway_schema_history_pk;
       public                 postgres    false    219            �           2606    16443    pessoa pessoa_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.pessoa
    ADD CONSTRAINT pessoa_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.pessoa DROP CONSTRAINT pessoa_pkey;
       public                 postgres    false    220            �           1259    16444    flyway_schema_history_s_idx    INDEX     `   CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);
 /   DROP INDEX public.flyway_schema_history_s_idx;
       public                 postgres    false    219            �           2606    16445    despesa despesa_id_pessoa_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.despesa
    ADD CONSTRAINT despesa_id_pessoa_fkey FOREIGN KEY (id_pessoa) REFERENCES public.pessoa(id);
 H   ALTER TABLE ONLY public.despesa DROP CONSTRAINT despesa_id_pessoa_fkey;
       public               postgres    false    220    217    4761            ,      x������ � �      .   \   x�3�4䴱Qp˩,O�TpJ,N���KU���trv���s�!��Y�_\�^�Z�id`d�k`�k`�`hie`lel�gh`fbn�i�Y����� *�l      /   Z   x�]α�0��?L��I,�4Ha�d	@.�raW1�b[�	�ȯ�ɉ����g��wT콎X(we���o�hG�uΞf"rՖ&�     