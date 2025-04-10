PGDMP                      }            owners_pets    15.7    16.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            	           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            
           1262    24777    owners_pets    DATABASE     ~   CREATE DATABASE owners_pets WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE owners_pets;
                postgres    false            �            1259    24786    owners    TABLE     �   CREATE TABLE public.owners (
    owner_id integer NOT NULL,
    first_name character varying(30),
    last_name character varying(50),
    city character varying(30),
    state character(2),
    email character varying(50)
);
    DROP TABLE public.owners;
       public         heap    postgres    false            �            1259    24785    owners_owner_id_seq    SEQUENCE     �   CREATE SEQUENCE public.owners_owner_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.owners_owner_id_seq;
       public          postgres    false    215                       0    0    owners_owner_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.owners_owner_id_seq OWNED BY public.owners.owner_id;
          public          postgres    false    214            �            1259    24793    pets    TABLE     �   CREATE TABLE public.pets (
    id_pet integer NOT NULL,
    species character varying(30),
    full_name character varying(30),
    age integer NOT NULL,
    owner_id integer
);
    DROP TABLE public.pets;
       public         heap    postgres    false            �            1259    24792    pets_id_pet_seq    SEQUENCE     �   CREATE SEQUENCE public.pets_id_pet_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.pets_id_pet_seq;
       public          postgres    false    217                       0    0    pets_id_pet_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.pets_id_pet_seq OWNED BY public.pets.id_pet;
          public          postgres    false    216            j           2604    24789    owners owner_id    DEFAULT     r   ALTER TABLE ONLY public.owners ALTER COLUMN owner_id SET DEFAULT nextval('public.owners_owner_id_seq'::regclass);
 >   ALTER TABLE public.owners ALTER COLUMN owner_id DROP DEFAULT;
       public          postgres    false    215    214    215            k           2604    24796    pets id_pet    DEFAULT     j   ALTER TABLE ONLY public.pets ALTER COLUMN id_pet SET DEFAULT nextval('public.pets_id_pet_seq'::regclass);
 :   ALTER TABLE public.pets ALTER COLUMN id_pet DROP DEFAULT;
       public          postgres    false    216    217    217                      0    24786    owners 
   TABLE DATA           U   COPY public.owners (owner_id, first_name, last_name, city, state, email) FROM stdin;
    public          postgres    false    215   4                 0    24793    pets 
   TABLE DATA           I   COPY public.pets (id_pet, species, full_name, age, owner_id) FROM stdin;
    public          postgres    false    217   �                  0    0    owners_owner_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.owners_owner_id_seq', 5, true);
          public          postgres    false    214                       0    0    pets_id_pet_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.pets_id_pet_seq', 6, true);
          public          postgres    false    216            m           2606    24805    owners owners_email_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.owners
    ADD CONSTRAINT owners_email_key UNIQUE (email);
 A   ALTER TABLE ONLY public.owners DROP CONSTRAINT owners_email_key;
       public            postgres    false    215            o           2606    24791    owners owners_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.owners
    ADD CONSTRAINT owners_pkey PRIMARY KEY (owner_id);
 <   ALTER TABLE ONLY public.owners DROP CONSTRAINT owners_pkey;
       public            postgres    false    215            q           2606    24798    pets pets_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.pets
    ADD CONSTRAINT pets_pkey PRIMARY KEY (id_pet);
 8   ALTER TABLE ONLY public.pets DROP CONSTRAINT pets_pkey;
       public            postgres    false    217            r           2606    24799    pets pets_owner_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.pets
    ADD CONSTRAINT pets_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.owners(owner_id);
 A   ALTER TABLE ONLY public.pets DROP CONSTRAINT pets_owner_id_fkey;
       public          postgres    false    215    3183    217               �   x�]���0E׷_����>$�&J�f$�;�����P7���g&gM�6�m� �Ћ�)C �>��Kka�ā�P4��(iC}���?8�W(��8;�1J3$�t/�ڑK�3}MK�;���cG����2H\�8��@[�Zb����������S����P         m   x�˱
�0@�������s��:����@$����{���܎K���@'��<�#�{����K90��=���q��.�cc�O����V�Q���m�^^'��~     