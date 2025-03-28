PGDMP  5                    }         
   movie_data    15.7    16.3 '    #           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            $           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            %           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            &           1262    24666 
   movie_data    DATABASE     }   CREATE DATABASE movie_data WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE movie_data;
                postgres    false            �            1259    24675    actors    TABLE     �   CREATE TABLE public.actors (
    actor_id integer NOT NULL,
    first_name character varying(30),
    last_name character varying(30),
    gender character(1),
    date_of_birth date
);
    DROP TABLE public.actors;
       public         heap    postgres    false            �            1259    24674    actors_actor_id_seq    SEQUENCE     �   CREATE SEQUENCE public.actors_actor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.actors_actor_id_seq;
       public          postgres    false    217            '           0    0    actors_actor_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.actors_actor_id_seq OWNED BY public.actors.actor_id;
          public          postgres    false    216            �            1259    24668 	   directors    TABLE     �   CREATE TABLE public.directors (
    director_id integer NOT NULL,
    first_name character varying(30),
    last_name character varying(30) NOT NULL,
    date_of_birth date,
    nationality character varying(20)
);
    DROP TABLE public.directors;
       public         heap    postgres    false            �            1259    24667    directors_director_id_seq    SEQUENCE     �   CREATE SEQUENCE public.directors_director_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.directors_director_id_seq;
       public          postgres    false    215            (           0    0    directors_director_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.directors_director_id_seq OWNED BY public.directors.director_id;
          public          postgres    false    214            �            1259    24708    movie_revenues    TABLE     �   CREATE TABLE public.movie_revenues (
    revenue_id integer NOT NULL,
    movie_id integer,
    domestic_takings numeric(6,2),
    international_takings numeric(6,2)
);
 "   DROP TABLE public.movie_revenues;
       public         heap    postgres    false            �            1259    24707    movie_revenues_revenue_id_seq    SEQUENCE     �   CREATE SEQUENCE public.movie_revenues_revenue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.movie_revenues_revenue_id_seq;
       public          postgres    false    221            )           0    0    movie_revenues_revenue_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.movie_revenues_revenue_id_seq OWNED BY public.movie_revenues.revenue_id;
          public          postgres    false    220            �            1259    24682    movies    TABLE     	  CREATE TABLE public.movies (
    movie_id integer NOT NULL,
    movie_name character varying(50) NOT NULL,
    movie_lenght integer,
    movie_lang character varying(20),
    release_date date,
    age_certification character varying(5),
    director_id integer
);
    DROP TABLE public.movies;
       public         heap    postgres    false            �            1259    24719    movies_actors    TABLE     d   CREATE TABLE public.movies_actors (
    movie_id integer NOT NULL,
    actor_id integer NOT NULL
);
 !   DROP TABLE public.movies_actors;
       public         heap    postgres    false            �            1259    24681    movies_movie_id_seq    SEQUENCE     �   CREATE SEQUENCE public.movies_movie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.movies_movie_id_seq;
       public          postgres    false    219            *           0    0    movies_movie_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.movies_movie_id_seq OWNED BY public.movies.movie_id;
          public          postgres    false    218            y           2604    24678    actors actor_id    DEFAULT     r   ALTER TABLE ONLY public.actors ALTER COLUMN actor_id SET DEFAULT nextval('public.actors_actor_id_seq'::regclass);
 >   ALTER TABLE public.actors ALTER COLUMN actor_id DROP DEFAULT;
       public          postgres    false    216    217    217            x           2604    24671    directors director_id    DEFAULT     ~   ALTER TABLE ONLY public.directors ALTER COLUMN director_id SET DEFAULT nextval('public.directors_director_id_seq'::regclass);
 D   ALTER TABLE public.directors ALTER COLUMN director_id DROP DEFAULT;
       public          postgres    false    214    215    215            {           2604    24711    movie_revenues revenue_id    DEFAULT     �   ALTER TABLE ONLY public.movie_revenues ALTER COLUMN revenue_id SET DEFAULT nextval('public.movie_revenues_revenue_id_seq'::regclass);
 H   ALTER TABLE public.movie_revenues ALTER COLUMN revenue_id DROP DEFAULT;
       public          postgres    false    221    220    221            z           2604    24685    movies movie_id    DEFAULT     r   ALTER TABLE ONLY public.movies ALTER COLUMN movie_id SET DEFAULT nextval('public.movies_movie_id_seq'::regclass);
 >   ALTER TABLE public.movies ALTER COLUMN movie_id DROP DEFAULT;
       public          postgres    false    219    218    219                      0    24675    actors 
   TABLE DATA           X   COPY public.actors (actor_id, first_name, last_name, gender, date_of_birth) FROM stdin;
    public          postgres    false    217   �-                 0    24668 	   directors 
   TABLE DATA           c   COPY public.directors (director_id, first_name, last_name, date_of_birth, nationality) FROM stdin;
    public          postgres    false    215   �6                 0    24708    movie_revenues 
   TABLE DATA           g   COPY public.movie_revenues (revenue_id, movie_id, domestic_takings, international_takings) FROM stdin;
    public          postgres    false    221   �9                 0    24682    movies 
   TABLE DATA           ~   COPY public.movies (movie_id, movie_name, movie_lenght, movie_lang, release_date, age_certification, director_id) FROM stdin;
    public          postgres    false    219   �;                  0    24719    movies_actors 
   TABLE DATA           ;   COPY public.movies_actors (movie_id, actor_id) FROM stdin;
    public          postgres    false    222   s@       +           0    0    actors_actor_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.actors_actor_id_seq', 147, true);
          public          postgres    false    216            ,           0    0    directors_director_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.directors_director_id_seq', 37, true);
          public          postgres    false    214            -           0    0    movie_revenues_revenue_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.movie_revenues_revenue_id_seq', 1, false);
          public          postgres    false    220            .           0    0    movies_movie_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.movies_movie_id_seq', 53, true);
          public          postgres    false    218                       2606    24680    actors actors_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_pkey PRIMARY KEY (actor_id);
 <   ALTER TABLE ONLY public.actors DROP CONSTRAINT actors_pkey;
       public            postgres    false    217            }           2606    24673    directors directors_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_pkey PRIMARY KEY (director_id);
 B   ALTER TABLE ONLY public.directors DROP CONSTRAINT directors_pkey;
       public            postgres    false    215            �           2606    24713 "   movie_revenues movie_revenues_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.movie_revenues
    ADD CONSTRAINT movie_revenues_pkey PRIMARY KEY (revenue_id);
 L   ALTER TABLE ONLY public.movie_revenues DROP CONSTRAINT movie_revenues_pkey;
       public            postgres    false    221            �           2606    24723     movies_actors movies_actors_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.movies_actors
    ADD CONSTRAINT movies_actors_pkey PRIMARY KEY (movie_id, actor_id);
 J   ALTER TABLE ONLY public.movies_actors DROP CONSTRAINT movies_actors_pkey;
       public            postgres    false    222    222            �           2606    24687    movies movies_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (movie_id);
 <   ALTER TABLE ONLY public.movies DROP CONSTRAINT movies_pkey;
       public            postgres    false    219            �           2606    24714 +   movie_revenues movie_revenues_movie_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.movie_revenues
    ADD CONSTRAINT movie_revenues_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(movie_id);
 U   ALTER TABLE ONLY public.movie_revenues DROP CONSTRAINT movie_revenues_movie_id_fkey;
       public          postgres    false    219    3201    221            �           2606    24729 )   movies_actors movies_actors_actor_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.movies_actors
    ADD CONSTRAINT movies_actors_actor_id_fkey FOREIGN KEY (actor_id) REFERENCES public.actors(actor_id);
 S   ALTER TABLE ONLY public.movies_actors DROP CONSTRAINT movies_actors_actor_id_fkey;
       public          postgres    false    3199    217    222            �           2606    24724 )   movies_actors movies_actors_movie_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.movies_actors
    ADD CONSTRAINT movies_actors_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(movie_id);
 S   ALTER TABLE ONLY public.movies_actors DROP CONSTRAINT movies_actors_movie_id_fkey;
       public          postgres    false    3201    222    219            �           2606    24688    movies movies_director_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_director_id_fkey FOREIGN KEY (director_id) REFERENCES public.directors(director_id);
 H   ALTER TABLE ONLY public.movies DROP CONSTRAINT movies_director_id_fkey;
       public          postgres    false    3197    215    219               �  x�MX�r۸|�"?�-���ѱ�7�ޔ�MNRy�EXĊ"� iE���g �yr�� 3�=Kq�{;����{=�K!��^��JfI&��^����=�Z��J�D�۹�F��7��W),IW�Lrq�->�g���Wʤw�{m#>{�لp���,)q��pl�9T�LD��B��wņ�qBYN�T%�8k�5t�cUX�'��b&��9���WIq�UZ'2Wf��⼋ׯ3$�ʚDJ��=)VU%�=e&������oT8
���Mδ�7cy�-|$��vk�'��1\�"�*KY�{;�F�C�Y޹̨%
�R|��ի�(xw)�_8���C½1��j(�Jd-���9w�h[j�R��و���������R�`��,Ee-�y�~����Pt;��i�'*��wSg��P?�U��,��8�����24+��PE?ۘ1]���f��@�h�y�4k�f��IV�o���WgNu@�-q׹Gh8���$��Gk(v\ݙ��僞g�xt@�$.̧���\Q$�m����v�A���Rqgܠ=�ya����am�� }%#/���6^���P���y;+.bӛ�OM����q�0N���	����5GD�5��hk��U�
��74�̸XD�T���'��{FP�*�������22�\�k�����m(7�T�[Z��).-�\�D��[�G:�����Ԝ�E�����b1�#	Jr(���������#<�&�\�C����`gwn�"����:�砉�;q�_��
�n�
j�ӕ�/��о�8��#&\iJ��C�WQ��Bj����PK���r����`C�6Y��i�f�$��ЙU2������K?��2.��EK�-u��[�MRd�R�A\#)��
�7;@�Zp��J���\�=��䄲")
��v�9%��D�cO�A�(j�<����H�	.���~	���<m��k=�n�y�Vш'��vv�RL���2k퍸F�^��)@�` �I)��ނ[3��T,k2)3q�V^�>TV��c)"9t�����*]82z�7m郢�����Y���I�Xa�,q����/ȹB�RY�g���YHJDb<�5v���[����&���� CfK�\����zgg�Z�T)��3D���o6�?4�T��[�FkG�I�ĪP'��J��8�ʊCUR)�`7�X�vq-	�U.���~�XP}W
'9�iQ���,�J�6h�Xv�MRN��J�IU�'�ǉ��v��os���3갞��A/��W5�٣���	���N���0[� �MRKqG,e�Đcɋ@+3�����DP��#Q�}'wrgp^&1w���	��%�#�Fĺi
�F>)���D�����؞2MIvkT�v��ݲ��)$�(&̽6�>ճ" ��x!) ����4i�i��GV1YQ�A�Hr�f�8����ңWo��멒���K�IS�����>�O��e�X���{Oȿ�;�ƚ�T�2���nǦ�oJ�el��<��vC�k�TZ�@�dġ`A#���J���I�Tp
7d��%��D�ѽ�47����x�`1dJ�r����,)q�L��b����V�쪢Ar��b;���	�`.��S���`0@%�	�3%q�t�M�ҟ�`Z�G�b6�p����2%ki``ƍ=��H�e�:9x}:�sf��N�'�ȴ�[z0|����91����Qo�NN�\������� ��1l�-���"��'Kx�h�]L�D�9������n/4�a�N���X#�ٝ�\֑�R�3��"�d�^�9jv M[������'C�s�FJ2�Gx���v0�Q��N�@��P�Я:�v�x���	j�ܟ!���LFcA�0�UY���)�p��#���0�,e���"�'�<O��������Oo:V�Vxa˟mmy:�a�XL��1�2���n��"�.Í*`��YѲ�~4����[>w��C�D��	/�g����LY-%��yGT{�b��Q¨���&��U�.�� /Y����y��7�����|2�oN����#V�=)����=�Ǧ�dO_DR�v��Ig1�ʢ�8H�����JF�0���߂�|oz�M�.��b�h�ZO��0�f:ي���~����0�*D�[t���i:�(����I�w����bT��֮&��s˻�h��`�o��k�ӿ �hI|��W3�	ɯ�<��Q���mK	e�|��?�ъ�bm�&���?�$�?�>�         �  x�]T]o�@|^~���Ο�$�B�ڀ���bo�j������w�����n����E��5��E��c�:"O� ��P��K�f�龆�-я�4�$�	,���v�`��-$Ƀ0f�+$�S�/aqr�D�I�GH��c����Ib"Q��`���YO�!�{��#��f��q��Co�}��z�uޱ�(�:�5�p�0E�<,kl�݃�2���TYN������������D��!�t��V��1��+��g)҈�l��gB���F�9<�L9|wv��YK�5����$<�L.a�ޟ��"�V)�KrB��Ӷ���7��42c��=��(�u�b��#$���0�b���Ǆ)8
��`��<�Ga D ��6���w��OCғBk�;ca]��z8�J���L�y��b�f߳\���@����뚒���譶�����~֍c�F;���ӌP������?ue؟��xZ�;Ot���$C�[2E��ù��#O�^6������lt/�4f����5s ��9Z���Ϲ�&���)�o��X�Q��V�bJ.���k�2F��`eFwo' /��yj����B{*����ߞ3�m����ᾸBl�����ߑ G���=K%g�D$ijz�������*P�%��{����j:J���y+���]�vf�HDC��$����6�s|�y<\��Z���+6XTf(����*���q=�R�p�c�W�__f��?%���         �  x�5S�u�0:�a�?Kt��?GAIO�m	8�,�?>aO�ᰀ���O��8��?6��3��:�����w�Q�U��a�&Q�6�;�E\���Q�%�����8!rAP�Q̳z{~_���a�!�z>Ds�S���R�z�Ȳ����j����9�lo9@�j\�Q�6R�;���P\^(��ov�U��m��<�����ժ}ζ���nQ���!I��h�D��)�t���Q��h�Jy]>�8���Vo�����l��Z�*D0�l}i-��-�,��E]_����c]�����,�W�aw����ة4�9��C��9S9�S���O.��PU�%qZ�D�:�a6���|������_�)2��[��֛ۢ�#7�gᙓ��n �:$`{�˕)��$�C�Ra&	�r��L��g��&Q��         �  x�eV�n�6|&��P"�������I�y�c3�Y4(i�ޯ��I%0 �s�3g(�.�e�W���}���1)�n6u�n�4��%�c�dRs�.�~e��u�?0��c��%�Lf?�5�ۮ��x�G�?H-�W���kSI"g�Kcl^�5�}Ӹ ����%��g*�V���o6�U��?���-�k���٥19��h
���e���f2�؃]��O�h�EԋJx�s���$V���(^�K_��M�4)�3�d������v|��R���c�V�k�U��J�|��2.06���˄]]+^*����;��E�\�]���L'�nz���r?,��9*,�~e;���9t��wb$/|�ġ궢�:�ӀP�G�5�L:@��~����bK�X1f�g`mdl�ż_�=�~�;W��bԑzױw��o}=b[7�����p�Z:Ӊ0w��� ���	�Нx�A,�HGM���(������#�gQ�II�q���9!�KH��Q3��u��c��v��~���=���=�)��!�)��XVoq�y�,���__��+��~��3fPQ/��,�yg�Q<���jZV��yJi��Ț�o��K��9\��r��rA����W�b����1XF��sƽ�W�C۴bi_��j�-3�Wt�!'=��[pU��#
'��O��S4�@V��z��\uU<��l	a�P߰G�!���r�c,����S�(�x�������L��V��� �fw�*Y�oJś�
V)G����rr�)�eO`=�a\���8%p�:��-@xg���E�tƞ:ċ��B|s�ޝ)��5T<oYp;��ޡ���;�jnW� 9��I��#��?����N�+!��(ZO�C'���B5�7g^ 0aس�Y�i+�w"ZL��+/N6�F�+�q�&Y,�q81сlsҥ橌Q7���v;���Ӊ��1����*,�PK�cdr-���p(E�,��<�1�	�����D�>= i:`}C���o�3�W5�gw�m���s4�_6Ĉ�_Q/c'/Ȁ/y�<P@]�����ۚ�S��t��,O�(B^=ʴ��ZzѮ__1�o�j[߇JLL�,�u%�	T/�s��!V�XO9&{�c�X���l�?(r"K��U�
}�G�և#3�8_��8�)�$�ߊ�Y�����`4o�"�نg���n���g��c"�C} 5�����3��)�'P"c���;��_Ep~          �  x�%Sɕ�0;C1��j��ￎ��E8��\L눫��zK������\���< ?�4F��3usC튥z����^�c8�9�f��������#^�d*/[�� f���%7�G���#q�)���0� "wl�`u�8�d/^"n�/��Y߬o��c�<K"x�)�*�^��,7ًD/R�j�$b��#�:Z.eLT���s2)�ͤ��b*���8�[; fӇ�7"&1MC��s��H�x����i�=jM�/�������"��b��,�^�{g�lEs�b���q�aa'��YUMq��ˠ�2�~�c?�AD�T�?�_0�K��l��b"�\�}C]�텝Cv�w�dy�%Ӭ�sUzj�{��\��A,;�C{lCC��a��0�}1�T�Q`�5Xb�5���2Ѡ��� �o���2�g�jP����w����rb�h>I��r7~�ބ��f�g/ȝL` >��y�J0���!kT]s���5�X{;{/�%��S��g�`     