PGDMP  0                    }            test    15.7    16.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    24734    test    DATABASE     w   CREATE DATABASE test WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE test;
                postgres    false            �            1259    24736    examples    TABLE     �   CREATE TABLE public.examples (
    example_id integer NOT NULL,
    first_name character varying(30),
    last_name character varying(50),
    email character varying(80),
    nationality character(3),
    age integer NOT NULL
);
    DROP TABLE public.examples;
       public         heap    postgres    false            �            1259    24735    examples_example_id_seq    SEQUENCE     �   CREATE SEQUENCE public.examples_example_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.examples_example_id_seq;
       public          postgres    false    215                        0    0    examples_example_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.examples_example_id_seq OWNED BY public.examples.example_id;
          public          postgres    false    214            e           2604    24739    examples example_id    DEFAULT     z   ALTER TABLE ONLY public.examples ALTER COLUMN example_id SET DEFAULT nextval('public.examples_example_id_seq'::regclass);
 B   ALTER TABLE public.examples ALTER COLUMN example_id DROP DEFAULT;
       public          postgres    false    215    214    215            �          0    24736    examples 
   TABLE DATA           ^   COPY public.examples (example_id, first_name, last_name, email, nationality, age) FROM stdin;
    public          postgres    false    215   �                  0    0    examples_example_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.examples_example_id_seq', 5, true);
          public          postgres    false    214            g           2606    24750    examples examples_email_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.examples
    ADD CONSTRAINT examples_email_key UNIQUE (email);
 E   ALTER TABLE ONLY public.examples DROP CONSTRAINT examples_email_key;
       public            postgres    false    215            i           2606    24741    examples examples_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.examples
    ADD CONSTRAINT examples_pkey PRIMARY KEY (example_id);
 @   ALTER TABLE ONLY public.examples DROP CONSTRAINT examples_pkey;
       public            postgres    false    215            �      x������ � �     