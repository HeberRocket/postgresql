PGDMP  6                    }            licencias_conducir    15.7    16.3 (    (           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            )           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            *           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            +           1262    32858    licencias_conducir    DATABASE     �   CREATE DATABASE licencias_conducir WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
 "   DROP DATABASE licencias_conducir;
                postgres    false            �            1259    32887    citas    TABLE       CREATE TABLE public.citas (
    id integer NOT NULL,
    ciudadano_id integer NOT NULL,
    fecha timestamp without time zone NOT NULL,
    tipo character varying(50) NOT NULL,
    estado character varying(20) DEFAULT 'Pendiente'::character varying NOT NULL
);
    DROP TABLE public.citas;
       public         heap    postgres    false            �            1259    32886    citas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.citas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.citas_id_seq;
       public          postgres    false    219            ,           0    0    citas_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.citas_id_seq OWNED BY public.citas.id;
          public          postgres    false    218            �            1259    32860 
   ciudadanos    TABLE       CREATE TABLE public.ciudadanos (
    id integer NOT NULL,
    nombre character varying(100) NOT NULL,
    apellido character varying(100) NOT NULL,
    fecha_nacimiento date NOT NULL,
    direccion text NOT NULL,
    telefono character varying(15),
    correo character varying(100)
);
    DROP TABLE public.ciudadanos;
       public         heap    postgres    false            �            1259    32859    ciudadanos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ciudadanos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.ciudadanos_id_seq;
       public          postgres    false    215            -           0    0    ciudadanos_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.ciudadanos_id_seq OWNED BY public.ciudadanos.id;
          public          postgres    false    214            �            1259    32873 	   licencias    TABLE     	  CREATE TABLE public.licencias (
    id integer NOT NULL,
    ciudadano_id integer NOT NULL,
    numero_licencia character varying(20) NOT NULL,
    categoria character varying(10) NOT NULL,
    fecha_expedicion date NOT NULL,
    fecha_vencimiento date NOT NULL
);
    DROP TABLE public.licencias;
       public         heap    postgres    false            �            1259    32872    licencias_id_seq    SEQUENCE     �   CREATE SEQUENCE public.licencias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.licencias_id_seq;
       public          postgres    false    217            .           0    0    licencias_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.licencias_id_seq OWNED BY public.licencias.id;
          public          postgres    false    216            �            1259    32902    pagos    TABLE     @  CREATE TABLE public.pagos (
    id integer NOT NULL,
    cita_id integer NOT NULL,
    monto numeric(10,2) NOT NULL,
    metodo_pago character varying(50) NOT NULL,
    fecha_pago timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    estado character varying(20) DEFAULT 'Completado'::character varying NOT NULL
);
    DROP TABLE public.pagos;
       public         heap    postgres    false            �            1259    32901    pagos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pagos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.pagos_id_seq;
       public          postgres    false    221            /           0    0    pagos_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.pagos_id_seq OWNED BY public.pagos.id;
          public          postgres    false    220            v           2604    32890    citas id    DEFAULT     d   ALTER TABLE ONLY public.citas ALTER COLUMN id SET DEFAULT nextval('public.citas_id_seq'::regclass);
 7   ALTER TABLE public.citas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            t           2604    32863    ciudadanos id    DEFAULT     n   ALTER TABLE ONLY public.ciudadanos ALTER COLUMN id SET DEFAULT nextval('public.ciudadanos_id_seq'::regclass);
 <   ALTER TABLE public.ciudadanos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            u           2604    32876    licencias id    DEFAULT     l   ALTER TABLE ONLY public.licencias ALTER COLUMN id SET DEFAULT nextval('public.licencias_id_seq'::regclass);
 ;   ALTER TABLE public.licencias ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            x           2604    32905    pagos id    DEFAULT     d   ALTER TABLE ONLY public.pagos ALTER COLUMN id SET DEFAULT nextval('public.pagos_id_seq'::regclass);
 7   ALTER TABLE public.pagos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            #          0    32887    citas 
   TABLE DATA           F   COPY public.citas (id, ciudadano_id, fecha, tipo, estado) FROM stdin;
    public          postgres    false    219   e.                 0    32860 
   ciudadanos 
   TABLE DATA           i   COPY public.ciudadanos (id, nombre, apellido, fecha_nacimiento, direccion, telefono, correo) FROM stdin;
    public          postgres    false    215   �.       !          0    32873 	   licencias 
   TABLE DATA           v   COPY public.licencias (id, ciudadano_id, numero_licencia, categoria, fecha_expedicion, fecha_vencimiento) FROM stdin;
    public          postgres    false    217   �/       %          0    32902    pagos 
   TABLE DATA           T   COPY public.pagos (id, cita_id, monto, metodo_pago, fecha_pago, estado) FROM stdin;
    public          postgres    false    221   �/       0           0    0    citas_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.citas_id_seq', 6, true);
          public          postgres    false    218            1           0    0    ciudadanos_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.ciudadanos_id_seq', 3, true);
          public          postgres    false    214            2           0    0    licencias_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.licencias_id_seq', 3, true);
          public          postgres    false    216            3           0    0    pagos_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.pagos_id_seq', 3, true);
          public          postgres    false    220            �           2606    32895    citas citas_fecha_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.citas
    ADD CONSTRAINT citas_fecha_key UNIQUE (fecha);
 ?   ALTER TABLE ONLY public.citas DROP CONSTRAINT citas_fecha_key;
       public            postgres    false    219            �           2606    32893    citas citas_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.citas
    ADD CONSTRAINT citas_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.citas DROP CONSTRAINT citas_pkey;
       public            postgres    false    219            |           2606    32871     ciudadanos ciudadanos_correo_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.ciudadanos
    ADD CONSTRAINT ciudadanos_correo_key UNIQUE (correo);
 J   ALTER TABLE ONLY public.ciudadanos DROP CONSTRAINT ciudadanos_correo_key;
       public            postgres    false    215            ~           2606    32867    ciudadanos ciudadanos_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.ciudadanos
    ADD CONSTRAINT ciudadanos_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.ciudadanos DROP CONSTRAINT ciudadanos_pkey;
       public            postgres    false    215            �           2606    32869 "   ciudadanos ciudadanos_telefono_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.ciudadanos
    ADD CONSTRAINT ciudadanos_telefono_key UNIQUE (telefono);
 L   ALTER TABLE ONLY public.ciudadanos DROP CONSTRAINT ciudadanos_telefono_key;
       public            postgres    false    215            �           2606    32880 '   licencias licencias_numero_licencia_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.licencias
    ADD CONSTRAINT licencias_numero_licencia_key UNIQUE (numero_licencia);
 Q   ALTER TABLE ONLY public.licencias DROP CONSTRAINT licencias_numero_licencia_key;
       public            postgres    false    217            �           2606    32878    licencias licencias_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.licencias
    ADD CONSTRAINT licencias_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.licencias DROP CONSTRAINT licencias_pkey;
       public            postgres    false    217            �           2606    32911    pagos pagos_cita_id_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT pagos_cita_id_key UNIQUE (cita_id);
 A   ALTER TABLE ONLY public.pagos DROP CONSTRAINT pagos_cita_id_key;
       public            postgres    false    221            �           2606    32909    pagos pagos_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT pagos_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.pagos DROP CONSTRAINT pagos_pkey;
       public            postgres    false    221            �           2606    32896    citas citas_ciudadano_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.citas
    ADD CONSTRAINT citas_ciudadano_id_fkey FOREIGN KEY (ciudadano_id) REFERENCES public.ciudadanos(id) ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.citas DROP CONSTRAINT citas_ciudadano_id_fkey;
       public          postgres    false    215    219    3198            �           2606    32881 %   licencias licencias_ciudadano_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.licencias
    ADD CONSTRAINT licencias_ciudadano_id_fkey FOREIGN KEY (ciudadano_id) REFERENCES public.ciudadanos(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.licencias DROP CONSTRAINT licencias_ciudadano_id_fkey;
       public          postgres    false    217    215    3198            �           2606    32912    pagos pagos_cita_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.pagos
    ADD CONSTRAINT pagos_cita_id_fkey FOREIGN KEY (cita_id) REFERENCES public.citas(id) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.pagos DROP CONSTRAINT pagos_cita_id_fkey;
       public          postgres    false    3208    219    221            #   Y   x�3�4�4202�50�54U04�2 !ΠԼ�����Û�8R�R2S�JR��8�������]+
RS2�Us#T�+X�5;F��� �'m         �   x�Uν� ����*zB�)6�����p!-15PL�����ϛ��:�.�0�%�
s
���U��C�so{�R�Y�F�;2rt_&�H�p�i�p��3S�����ơ�U�ۜѪ���P�E�z"�H>~��T3�)�s��[l�+��6��i�8t+$�w�'A���GL      !   S   x�%ʻ�@�x݋���o!Q�ׁ�eO�q8�{9�T���jMݒ}S�����+K���Ʀ"�Z����զZM�My� ��S      %   b   x�3�4�450�30�I,�J-I�4202�50�56P0��25�24ճ02�01�t��-��I��2�4�41�h,J�+NK-J�K�$V�1�1�	9���qqq ��,-     