PGDMP  %                     }            assessment_system    17.2    17.2 9    R           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            S           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            T           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            U           1262    16388    assessment_system    DATABASE     �   CREATE DATABASE assessment_system WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';
 !   DROP DATABASE assessment_system;
                     postgres    false            �            1259    16390    asesi    TABLE       CREATE TABLE public.asesi (
    id integer NOT NULL,
    asesmen_kode character varying(50),
    user_id integer NOT NULL,
    asesmen_periode integer,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    form_status boolean DEFAULT false NOT NULL
);
    DROP TABLE public.asesi;
       public         heap r       postgres    false            �            1259    16389    asesi_id_seq    SEQUENCE     �   CREATE SEQUENCE public.asesi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.asesi_id_seq;
       public               postgres    false    218            V           0    0    asesi_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.asesi_id_seq OWNED BY public.asesi.id;
          public               postgres    false    217            �            1259    16402    asesmen_hasil    TABLE     �  CREATE TABLE public.asesmen_hasil (
    id integer NOT NULL,
    asesmen_kode character varying(50),
    score_session_id integer NOT NULL,
    aspek character varying(255),
    skor_rata_rata double precision,
    verification_code character varying(50),
    verified_at timestamp without time zone,
    rekomendasi text,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);
 !   DROP TABLE public.asesmen_hasil;
       public         heap r       postgres    false            �            1259    16401    asesmen_hasil_id_seq    SEQUENCE     �   CREATE SEQUENCE public.asesmen_hasil_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.asesmen_hasil_id_seq;
       public               postgres    false    220            W           0    0    asesmen_hasil_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.asesmen_hasil_id_seq OWNED BY public.asesmen_hasil.id;
          public               postgres    false    219            �            1259    16412    asesmen_jawaban    TABLE     �  CREATE TABLE public.asesmen_jawaban (
    id integer NOT NULL,
    user_id integer NOT NULL,
    question_id integer NOT NULL,
    asesmen_kode character varying(50),
    jawaban text,
    skor integer,
    status character varying DEFAULT 'draft'::character varying,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    source character varying(50),
    periode_audit smallint NOT NULL,
    score_session_id integer
);
 #   DROP TABLE public.asesmen_jawaban;
       public         heap r       postgres    false            �            1259    16411    asesmen_jawaban_id_seq    SEQUENCE     �   CREATE SEQUENCE public.asesmen_jawaban_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.asesmen_jawaban_id_seq;
       public               postgres    false    222            X           0    0    asesmen_jawaban_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.asesmen_jawaban_id_seq OWNED BY public.asesmen_jawaban.id;
          public               postgres    false    221            �            1259    16424    asesmen_pertanyaan    TABLE       CREATE TABLE public.asesmen_pertanyaan (
    id integer NOT NULL,
    kode_mapping character varying(255) NOT NULL,
    asesmen_periode integer,
    pertanyaan text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    source character varying(255)
);
 &   DROP TABLE public.asesmen_pertanyaan;
       public         heap r       postgres    false            �            1259    16433    cobit    TABLE     �   CREATE TABLE public.cobit (
    id integer NOT NULL,
    versi character varying(255),
    domain character varying(255),
    process_id character varying(10),
    process_name character varying(255)
);
    DROP TABLE public.cobit;
       public         heap r       postgres    false            �            1259    16440    iso    TABLE     �   CREATE TABLE public.iso (
    id integer NOT NULL,
    versi character varying(255),
    annex character varying(50) NOT NULL,
    control text NOT NULL
);
    DROP TABLE public.iso;
       public         heap r       postgres    false            �            1259    16447    itil    TABLE     �   CREATE TABLE public.itil (
    id integer NOT NULL,
    versi character varying(255),
    service_lifecycle character varying(255) NOT NULL
);
    DROP TABLE public.itil;
       public         heap r       postgres    false            �            1259    16454    log_aktivitas    TABLE     �   CREATE TABLE public.log_aktivitas (
    id integer NOT NULL,
    user_id integer NOT NULL,
    aktivitas character varying(255),
    "timestamp" timestamp without time zone DEFAULT now() NOT NULL
);
 !   DROP TABLE public.log_aktivitas;
       public         heap r       postgres    false            �            1259    16461    mapping_criteria    TABLE     �   CREATE TABLE public.mapping_criteria (
    id integer NOT NULL,
    kode_mapping character varying(255) NOT NULL,
    jenis_kriteria character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);
 $   DROP TABLE public.mapping_criteria;
       public         heap r       postgres    false            �            1259    16470    mapping_standard    TABLE     i  CREATE TABLE public.mapping_standard (
    id integer NOT NULL,
    mapping_version character varying(50) NOT NULL,
    itil_version character varying(50) NOT NULL,
    itil_service_lifecycle character varying(255),
    cobit_process_id character varying(50),
    cobit_process_name character varying(255),
    nomor_audit integer NOT NULL,
    kode_mapping character varying(255) NOT NULL,
    cobit_version character varying(50) NOT NULL,
    iso_annex character varying(50),
    iso_control text,
    iso_version character varying(50) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);
 $   DROP TABLE public.mapping_standard;
       public         heap r       postgres    false            �            1259    16476    maturity    TABLE     �   CREATE TABLE public.maturity (
    id integer NOT NULL,
    jenis character varying(255) NOT NULL,
    kondisi character varying(255) NOT NULL,
    skor integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.maturity;
       public         heap r       postgres    false            �            1259    16484    users    TABLE        CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    role character varying NOT NULL,
    institusi character varying(255),
    created_at timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.users;
       public         heap r       postgres    false            �           2604    16393    asesi id    DEFAULT     d   ALTER TABLE ONLY public.asesi ALTER COLUMN id SET DEFAULT nextval('public.asesi_id_seq'::regclass);
 7   ALTER TABLE public.asesi ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    217    218    218            �           2604    16405    asesmen_hasil id    DEFAULT     t   ALTER TABLE ONLY public.asesmen_hasil ALTER COLUMN id SET DEFAULT nextval('public.asesmen_hasil_id_seq'::regclass);
 ?   ALTER TABLE public.asesmen_hasil ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    220    219    220            �           2604    16415    asesmen_jawaban id    DEFAULT     x   ALTER TABLE ONLY public.asesmen_jawaban ALTER COLUMN id SET DEFAULT nextval('public.asesmen_jawaban_id_seq'::regclass);
 A   ALTER TABLE public.asesmen_jawaban ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    222    221    222            B          0    16390    asesi 
   TABLE DATA           d   COPY public.asesi (id, asesmen_kode, user_id, asesmen_periode, created_at, form_status) FROM stdin;
    public               postgres    false    218   �F       D          0    16402    asesmen_hasil 
   TABLE DATA           �   COPY public.asesmen_hasil (id, asesmen_kode, score_session_id, aspek, skor_rata_rata, verification_code, verified_at, rekomendasi, created_at) FROM stdin;
    public               postgres    false    220   lG       F          0    16412    asesmen_jawaban 
   TABLE DATA           �   COPY public.asesmen_jawaban (id, user_id, question_id, asesmen_kode, jawaban, skor, status, created_at, source, periode_audit, score_session_id) FROM stdin;
    public               postgres    false    222   aI       G          0    16424    asesmen_pertanyaan 
   TABLE DATA           o   COPY public.asesmen_pertanyaan (id, kode_mapping, asesmen_periode, pertanyaan, created_at, source) FROM stdin;
    public               postgres    false    223   Zm       H          0    16433    cobit 
   TABLE DATA           L   COPY public.cobit (id, versi, domain, process_id, process_name) FROM stdin;
    public               postgres    false    224   r       I          0    16440    iso 
   TABLE DATA           8   COPY public.iso (id, versi, annex, control) FROM stdin;
    public               postgres    false    225   V�       J          0    16447    itil 
   TABLE DATA           <   COPY public.itil (id, versi, service_lifecycle) FROM stdin;
    public               postgres    false    226   b�       K          0    16454    log_aktivitas 
   TABLE DATA           L   COPY public.log_aktivitas (id, user_id, aktivitas, "timestamp") FROM stdin;
    public               postgres    false    227   נ       L          0    16461    mapping_criteria 
   TABLE DATA           X   COPY public.mapping_criteria (id, kode_mapping, jenis_kriteria, created_at) FROM stdin;
    public               postgres    false    228   ��       M          0    16470    mapping_standard 
   TABLE DATA           �   COPY public.mapping_standard (id, mapping_version, itil_version, itil_service_lifecycle, cobit_process_id, cobit_process_name, nomor_audit, kode_mapping, cobit_version, iso_annex, iso_control, iso_version, created_at) FROM stdin;
    public               postgres    false    229   ѥ       N          0    16476    maturity 
   TABLE DATA           H   COPY public.maturity (id, jenis, kondisi, skor, created_at) FROM stdin;
    public               postgres    false    230   s�       O          0    16484    users 
   TABLE DATA           T   COPY public.users (id, username, password, role, institusi, created_at) FROM stdin;
    public               postgres    false    231   @�       Y           0    0    asesi_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.asesi_id_seq', 35, true);
          public               postgres    false    217            Z           0    0    asesmen_hasil_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.asesmen_hasil_id_seq', 40, true);
          public               postgres    false    219            [           0    0    asesmen_jawaban_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.asesmen_jawaban_id_seq', 836, true);
          public               postgres    false    221            �           2606    16399    asesi asesi_asesmen_kode_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.asesi
    ADD CONSTRAINT asesi_asesmen_kode_key UNIQUE (asesmen_kode);
 F   ALTER TABLE ONLY public.asesi DROP CONSTRAINT asesi_asesmen_kode_key;
       public                 postgres    false    218            �           2606    16397    asesi asesi_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.asesi
    ADD CONSTRAINT asesi_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.asesi DROP CONSTRAINT asesi_pkey;
       public                 postgres    false    218            �           2606    16410     asesmen_hasil asesmen_hasil_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.asesmen_hasil
    ADD CONSTRAINT asesmen_hasil_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.asesmen_hasil DROP CONSTRAINT asesmen_hasil_pkey;
       public                 postgres    false    220            �           2606    16421 $   asesmen_jawaban asesmen_jawaban_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.asesmen_jawaban
    ADD CONSTRAINT asesmen_jawaban_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.asesmen_jawaban DROP CONSTRAINT asesmen_jawaban_pkey;
       public                 postgres    false    222            �           2606    16431 *   asesmen_pertanyaan asesmen_pertanyaan_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.asesmen_pertanyaan
    ADD CONSTRAINT asesmen_pertanyaan_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.asesmen_pertanyaan DROP CONSTRAINT asesmen_pertanyaan_pkey;
       public                 postgres    false    223            �           2606    16439    cobit cobit_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.cobit
    ADD CONSTRAINT cobit_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.cobit DROP CONSTRAINT cobit_pkey;
       public                 postgres    false    224            �           2606    16446    iso iso_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.iso
    ADD CONSTRAINT iso_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.iso DROP CONSTRAINT iso_pkey;
       public                 postgres    false    225            �           2606    16453    itil itil_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.itil
    ADD CONSTRAINT itil_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.itil DROP CONSTRAINT itil_pkey;
       public                 postgres    false    226            �           2606    16459     log_aktivitas log_aktivitas_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.log_aktivitas
    ADD CONSTRAINT log_aktivitas_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.log_aktivitas DROP CONSTRAINT log_aktivitas_pkey;
       public                 postgres    false    227            �           2606    16468 &   mapping_criteria mapping_criteria_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.mapping_criteria
    ADD CONSTRAINT mapping_criteria_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.mapping_criteria DROP CONSTRAINT mapping_criteria_pkey;
       public                 postgres    false    228            �           2606    16483    maturity maturity_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.maturity
    ADD CONSTRAINT maturity_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.maturity DROP CONSTRAINT maturity_pkey;
       public                 postgres    false    230            �           1259    16400    asesi_user_id    INDEX     B   CREATE INDEX asesi_user_id ON public.asesi USING btree (user_id);
 !   DROP INDEX public.asesi_user_id;
       public                 postgres    false    218            �           1259    16423    asesmen_jawaban_question_id    INDEX     ^   CREATE INDEX asesmen_jawaban_question_id ON public.asesmen_jawaban USING btree (question_id);
 /   DROP INDEX public.asesmen_jawaban_question_id;
       public                 postgres    false    222            �           1259    16422    asesmen_jawaban_user_id    INDEX     V   CREATE INDEX asesmen_jawaban_user_id ON public.asesmen_jawaban USING btree (user_id);
 +   DROP INDEX public.asesmen_jawaban_user_id;
       public                 postgres    false    222            �           1259    16432    asesmen_pertanyaan_kode_mapping    INDEX     f   CREATE INDEX asesmen_pertanyaan_kode_mapping ON public.asesmen_pertanyaan USING btree (kode_mapping);
 3   DROP INDEX public.asesmen_pertanyaan_kode_mapping;
       public                 postgres    false    223            �           1259    16460    log_aktivitas_user_id    INDEX     R   CREATE INDEX log_aktivitas_user_id ON public.log_aktivitas USING btree (user_id);
 )   DROP INDEX public.log_aktivitas_user_id;
       public                 postgres    false    227            �           1259    16469    mapping_criteria_kode_mapping    INDEX     b   CREATE INDEX mapping_criteria_kode_mapping ON public.mapping_criteria USING btree (kode_mapping);
 1   DROP INDEX public.mapping_criteria_kode_mapping;
       public                 postgres    false    228            B   �   x�u�;�0���>����vgǎDM����_8���t_3*���:� �e� R^���g04P8$�	���5�Ii��X��:`Jd�aZi0��l������k35p�m�[�L$�3�öa$��X��6���b!�s�Q�lX��Q#U��lr����/\�I�      D   �  x�ŗ�j�0��ۧ�99M��Κ��`���E
��v��~5�hMfk�������{o�F�~�E�"EJ<�ȉ@�7����3������?�ޓ�Q���H�I�Y$�У��>�>�	��M�k�A"J�>�e�l�ϋ�hK��g�&/�e�����ʪ/�(3A�ˢ̋��W�-V��6[dE�� a� �I�~�Q�Tq��j�d��țd��s*����-��R�!�-�ɩ۰�-�A�ۨ@L�hu�ప�D!��஫4�mYi�Ӷ�ԇՕ��q_a$��ia����u]Y{,}deFh��;�HZ]Q�;�s�4������6��=����ں�[z��ފ���d��#��݂]�_�D��V��6���)O��8aʌl3��m�Db���KS<\��@�K{:�C �J�A-�KR���gv���GjKջl�D[fm����-�ԉ�Xf�i?���EH��3��v�LǷ�溽]���q��q������_C�      F      x��]ۮ�q}��
~@��r�dK$�o~!@%&lц-���k�{�k�k�MX�-�<�N_�V�m�b����?~��?|�r����9k��鯿��������������>||����~l������������3.~k�6�3���7�}���㋃oԯ�߾��������������>��/���ӧ_�7N�� �_�>�v���ӻ_~���X&��H����oq���͟����/���O����e�^��[_��+/\�����������-*��������n~�o�kV�}����W������o���{�/�>\��_��}n|�o��Vn|�/�˾>���E�Ƽ��������Η��{��e>�_�|���;_�#�k:_�{��Η�F~��e>R^�|�ԗ;��#�|M��|Ͼ��2p�v��7���/��r��|$���2I�v��7�/��j��|���������μ��2߰/u���K�/��r��|$|M��|/���2�H/w��G�K�/��r��|�~M�~ϛ�:_���Η���7�o��?���?�e>�Φ�������l{�؇K�|��ζ˹�⇓�E��bi?����=�OX\�O[,a�r[����c�P�mP\�`�L>�e�O�g[�&��j�tޢ��[$i0W� ��_I��6BӐ�r�R;��Ң�f?�J�
�ʑ�k�S�h�D�R����ݡ�w�x�Ʈh�9���`$�I{�.��^�2	���F��L0��D/]�T��(��w������la�Ap��v�E�!?��9+�쑸��l�6��j��������|��I{,~�`�EāY��mk�v��Dp1W��
�X=׀������GpJg$�(�o���Ƿ����Q�nW���Q���{�X�`i6JGǶ�fSR�܎��zr������l�)n��r�*}Y����`�L���C�MjN�ݤ�9nW�qOL�������́ߐ�_�~5��~�LVHqϣD�f���~��o�j�Ǒs�oI��A9]����=����<7���tE�S����5����3�
���t��.�9�tg�h"8�h�g���-�08��_��?�͞`���!�T�v8��;E�����#S2P�H�Ua80Œ�l7@Bc��7U�2���DLq�[���{�l/����M��4�ſ������)����3�ۯX{>���vHꠝN�O�ٴ?P4�������Y�I2�< �:V�B�0<��ls�3{v��*�9���]i��f�!�%졸A:7/�� �߲���'\~v��S<����ogב%�~�%�dB���0��~Ճ�&ټ��u��¾s�j�I��?_���GiPNg���f�1��9+{(	�h]�G?��#���g9?.�WA�Y%�T�׌llB�y������A7۩��O�ww��G���l�d3��-���G�"q�]�ٜ��b�|�� 7���M���ߟ����Y�npM/���0���a�K��rg�dS<�m����X�8��l�pf�a;�:퉱��8IԪ�=��L3�LӃ#�2M=Mv�x�*��A4��m���6*c��$��.�.��sf7��4]_y�T���
��Ix�.wiS�lʮɚ�.��짛��[�R�kq�J����p�rr�I1�,b� >��p:�����x��;Z��A8���n�Y���͈���V�G���7�i��sDS[��o�#�J�_~0N�%�ݸ���\��a�&-��L@�)�z���8g?ƙ��b�V$�E43m���tzp������b(�f�ˤl�M�?
�+NF�Y���ث�‏n;O{C�b^�5V��%*Z�\���"�m��j�Ԑx�f�I�8�7����	�_M8'I딽��	��z3�U�5�� �<\ڟ�޶ ��K{��:G��<B��PՊ��iŔ:�s�
De�R���[���m���_#�c�$h�E�Lb����yK8�g��@��͞������x�o$,�H���Ǒ�j�~�=b�7�jmcg�$�e3=(��LSt�5?q"�F���݀Q�l�ZژTU_1Ԝ>��	�݂���#l���notqM�H��Q'�ಃhV�B=�|[��R��(�6�v���qk�pA4��N���LS4��1Nu�JO�'b����n�Dȳe���d(}����ߪ8�X�T�tvh��%���k@q)I�)� K�mn�U����Z1��������馜۟^w�;��h�}p���t�W=�ڇd��7��ba��8E��d7���!i�y	D�`z;0�$W�g�Q�$�����`�Q�)�P�{j3<����P��@q�r�������i��H��┼?0��'O���k:u6ݍl:���[��&1N��;PoQ�W-kZ(���x��q��=���4�/H�/�0X��:�,J�G�C`*�l��K�7�A��r=i�j.m�8{���N&�d��p�œ����ȩ��I�3ʩ(��B0[��|]x��M�Ҋ��EA�N�ї!��(�V�Ac�wf�_���+�	=�u~�+���)�$��.I[:�1��(pxd�Vd��>i��9B�>�@�fUR��u�S��3�Û֝�;`pEo:1H?ɫ
���&�p��R���q�C�wɩ,�qL>��wC�����k(�+K��(rq���#hq`�d�S���������cɝ�R��(�[��5�Md>.F{bʈ�����&�^��i���F�R�ޭc)��==o��|\�Nɮ���#�yS��G��Ĕm{�?Mо~s��P(���-��o�z�f�\�<�i�N����*-��8X�{v�/�:�߳�y��b��A;�Xc;�F�@z?Y����A�����Ԕ3u�B�s����R0�.�! �񋢝Е� ��8���2+�S��.�I�dʊe���ɽ^�%g��U�/-͵K��Ac�t��@�kQ%jm5=tFj����ä���+�U _8I��|ɃR�I��b'��s,x_A�J�
�3:���m��X]E(��l2����1�)��y���""$u��;;0	9��e�T]�5:,A+JF�)Z53j���Tz��r2h
rN���N�p
�G㜊#S1�.6�C����Agp��	���=��&�b{�IE���Ug1h���b��N�M�P���C�f�����u���MQz]���e1�eJo�L�{��N1c )������賽�gZ���8���T|�"Im�������[�9�%��V1濽N�T�qU��@IG�S:�=��oF�I(�RTʠɃs����pm�R��خ��S>���SGB�#��{��ZKE�ńv�����Г��|�c�@}o�!���z�Cܫ��%I�%>� �Gn]B���+g=�����/$f�0�)v��3�*J����$���D\3�o2�ߓw���ۏX�����-4d�	g��v�HbeI2X"2N��#iC3=|F�� ��E�0�.�[a����f��&K[�.�w�Ab]�ݱNQKŤ�^�O;S�z[M�����`�u�3�P�l�Y��+�:g�� �^Ԅ�F&˯��٨�� ���#�H4D�2����f��J�3�؊��`�<A�bNN�@nD�D�3�V�ы�`AQ/A2h�N������g<]tw�}�D 0���*� ���[�%N� A��֠���mm{�3.���1pPMa������:l�C48)�bp�u���w^[��-t�M��7J��t�)ӯ�?o@���8�AW;���
x�RzF��
���sHr��9�E��\��~I�=8��A�+����]���)mjG8�E��9~����<JL�AN��\���K.� T��F,��u
l��%�kZj�(�hX�bDu�sR���5IykҀ��)oR�҅
4�gSh:[q�PÉ�Ԯ@T�ű��e��3HP(CL����^��Xe�T,	�i��.(���/_�n[�x+���ϴ��0����0��Nϯ�,`Ho��6o��&�me�(��ҁ�Cц9��\���JP���'/�9�(M��~�ɳ<�@�~���M� 6�    �*�m_r_"���A6�*���Y��L(3b�Q�f�wz3�aq��ơBQ�%���C��h+t:lj)� ���\{?�(�9C���/��*�Xq� PM�:�+�93���B����dx�h��%Ro��_BJ�T�GN��`'�n�k����u��PE.7��L]�*$�xʵ���Ѭ��zc�&>��A2(�"�'w����u��2�P��h��rw�A18=IK�M���1v1�l���2=����qQmF���ϲ�mr�����2�@ ��4r>�����=ݾ�l�8�O�TG�IN���kH(~�Ī�\��a�{�9��:1�)$�(��M�(�#j�T����[S��P[Ǌ}*PUTn���k�p_�A)+���6���@��3�ƃ�=���3S!���=[�N$����O��;� ��'jiN�,�l�k��U��4W���23S@��Jԝsa��W���"AN�[��רPu�99�o��]E�5v� 
��A���puw恻����7�f=jT��>�;�=��-�!���]�s���I2F~��"Ť�,�����I�(�Qǡ��	i�Y��D����B�cTW5��R�pc�Pli���%�y6����A�a����|w��1�����^UW�P~���pG���k[�Z-)�B%&�;8Zu�x�_CL:�����L��2�m1���٦���L�؅CP�`FGHؕ�����J4e������R�&&�r�ɣR�8�d�۩DJ��䑾�xP�IMC�ѱ�D�\U��Cs�K������2���=3�#�k ���f\q���K�Z�2��-k@�r�r�;�ڨ�T]%!؇�$�tr����T跲�.C�X's�
՝��9���`+�0lڊ��j<ɺ"y��(F&�xiL��#����*�kA}��G�i��8�@}�/d/>Su�*�I0Ez���!�$��;?WW
�
u�ͯ1٣�A�F��Q���QH����-U@)�$����e��:�3����>KB��V���)�.9T��,��_X�Q��%����XYJD�}y�7�HU��gꐊ������a3ȳV�\�B�('��A?ʹ�>�h�.�&�9�@
�AB�(Y��L9���2#�sMb_C��W�8��&��v>Kk��P<��d;���\��<H�2oJ ��R�[?���`��Z�2]���Rr����/���~">Ć%|0�T�0����kH(6%�v=�˙i��$KjN�m��n�ۘ��$e�h�5"T�K#�*G��`��-kA�5�C�JN��������t|,��F�zT.�&�<�}����(�#,��*Sq�`�6>���ɧn��8�kP�F�������,�^<{�����Um�u�r�+���u&�qU��y�@��0�	�,3�T�^��@U�z�����"�"@
GtX��.7d����F=�A����X���	0}���C3P(k%+u��M2�3�������_>�����Q9R{�X[�f�[{q��k�P�J4�z���f�2L[�����}qs��9�	�<�����RF�*WV������JP�"/ϨǓ�+1�o!�Ʃ�2'�A�T��= {���5Զ��j�3�D����@gT��I�3��>��i����?�Ů�<��N5*"��ρ�l���jW�ц�����97��xP���Op�ԯ<��gZ@(~%O�o2A���8f[��^��]|P�>��>����W�W�T��y�����;�e8� �⨹�U����vu�X%��XY�\&_N�%�0toA�mz8�
����kpaOo�d�G���
�c~���=7:�
��V�:{ѡ�%��ş\6�Y$>�n8��������ډ�
���d�~�ձd���u�(�sD*N��lc���f��gC�"Y��u�ь2��5*��P.K��.KW�
�-�2�����Yrs[/�P����˿�>�~��G���$N�c���Vz@5�D�K�޳W"�ԕ�~�Ȟ= �r��\�9C��A�*Jhm�j%=8�yQ#���;X����Q�+�{����u�A��Z�%�(�%���=�΃�{�xc�E-�Xãޫ�5��%�<�������6N��%
���w�PRK��A\�J���a,���7��j���7���eC6z<����T�&V��x��Vgs�k�I���*4�YIn���%ǵoV�I,�z�hPc�Y�t�Y�NK���Zz�o :���r3�Y�c䑸���dն�p�ob���{���{�z`�H�8R�Η,�y�P�!��o�Pu�ї�0�`砮D��#V��P�Z#�&0�U�2�_ E����t�p��z�T�A����
����uHr-�{��g	�}v=0���1�8��0���-~;��2�!YT������tUo �66��t�s��(�ޙ�"m�U=3DF8���i�	��֨�l
�Q�4�O�)���[��	�R�Bꪍϰ;S�����]k-�	H�:�>�:�\�G�
ܝi��^٩H&�Q�]k]���m��3��I�	�(��=��S��:m�{-j�jy�5�?�J�n���%���kwhz�ܙ��i��v�J�h�O�ӡ��:mk^��u�N�*Nwc��!�ڞ@��|�����w���!;��_��
�]4�؂St{�	5��Φ�<Ňz��p��B�N�-���Ԩ\n�P��ʘש�}���.����0�<��Sw�:H�ҽ0��:�{�����ގõ����	�P�	Q�{ׅ!����rZ��ol
�y	�L��tBG��z<�!�F�gLa�����<ўB�_&�"a��Ќ�=�\���9"]�uw$T
[��D����~��~�<J���	\�PW �V(���ak���R�3��s����"�f�Ɲ,u�Ⱦ+Ǭs���Zz�[˦g˔f���d�.�@;*e&�[������L�Ɠ����I*�$T�/��JY{�N�K;L���ڑz���)Ʃ;PT��%��P������SQ�}��1��	(1&����-��cs�ܠ(eƘdӌ	�Ꭓ1�a{ԛ̀�c�BT��g�����x�<�y��n�S��4L(<��Ѯ��C��u��V���P�̉��4.d��~�hג�cBE2+Fyl�FW�)�PU%!h�A�6��2[��P����?���U���e��)����^n��9#T��@�>��{�:�b��as""T)[E��aL�~���!�NA�#���i�����sa��B�cB�2����Bw^���:�SD�2�7�U��̶���eDݲU���� ���u�BD�hP\�fr�A:@o03��U��|�(3s"��!���]˗��F=&�5�N�{�m�k*�v�5�aBm31H uj�[7��Ksc�P�����?��t��� pQLR�$�B��*F������Z�7lfB�3+
�V�z�I��4{�Gt��� N|&$�M�b�gwWߢs�h΄bRu���)ͺ��u�d�i���
�М*�j�7�V4�X'E[uDf�b'U�}�"��'_�u4��wc�O6��Y���:��%(���.���4%=&G��]�|�t9�)BB�4F�nN��z>��.@]HzH�R��}�<�oOz�K���U5���ib� ̒zЦ�_s>K��!�x�s�y^�#K�є�d���.e�M)J75�1"=�A�#��)����4���R�&Z�˄ZjLu��{v9�����u���;��Q��y��mxFq5�Β==5��\,�_=&TX�8���2z67�	��	/�:PO��.�/]��H������2��9'Gg��8!W���9*��2OE�Ot[@xS�+�`P�4P����EaF�G1�yd���C{��̩>��:ФZ������kri

W}p�ϫ�O��
lN,+�dU��A�*�2�q���{E'�l�g�Ȱ�-�B��kV�׹>9C�Y�Ȏ��P(�f׉g(�,�Օb��/�;�

�����#n���I��u��kҭ��ܣ��[Ճ �  �R.����k�s���m�edh��$U�Z�y�@u	m�F�e���ޚx�l�[�1Z�����R=��$[�s���v�Mҷv�����T�
�ϕ�u��[���k"(�-��چ��Jkn����� N)J�J�� ���s����D�;��"��th�E��C)uQ�4cff�ѢT]�?���������o�����%��Lϵ��f�P���T����k�*4T�������4@���kD��np"�8g�6C"� �����8]C:׌��|�y�P6r=rm�%ג�k0��9ӝ��2���""T\�A^���9b#�ܧ������tȬ�Ɓ�<��5��Q:TD�(TZ{J`_��0���<f��#��P�kH(����<"�%�p8F �qkL�ʬ=3<&��+A:b�9:�R��|_#B���Y��ω��uSI����ۢ���O^@�fT��!�=�v�2�kL(�6���WL��TBu]�9�[R=א�Qհ��Atn�o\%.��9TV��%�"��ȉea���YTU{&*�6�<tg)W��E=���f��(A��P�4�v��kt���й��V�ko,���g��ޜv�<���5C��hB�P������7�}�3oּyJ�c�aB)5�����bU�4�zNω�*��sO��|�m9[Ю�_'�rjnU�"�-��2x^�	��B�v���ڃ'T��b/CBA59�Z܍<�ȬV�)�8O�5���\�f�)�L�;�'ʨ��7�֫3t#�Jy�zL���X���+5F��p�⡎ڳ�r��jI]�l��zL(�f�YR$�����ZR�]ol�!��J�����j������_%(��Pɩ��A�j3��x�NsbݥM�I�v<r�Eo3���&W�z�̆Q��	�=$�M���_Z���GƗ����M�*�1�N�x�6AE=�C6ML�Y� Q�oYr���G�t��e1Y��,�X'��f*��o������&@      G   �  x��VMo�H='���3����1����a��jG;�[�����6Р��*�~_7`>�390t�W��UE7��JY��Я� �CY��U�B���f-77��X��E�]|��]�l�$�ɫR���DV��������|�)�#�ŉ�$��He�t*˥bx1�� sa�^%���G\J�����H�退Ց�8m�S5�ۓ:I�`�(kZ0^����G;���&]-'�w�Ŀ��i5Y���Hp����7{�9�������y�Z�WL*ɜ�.�����x���,�<���i�TP�~wF*ak1J�D���%���<����#z�s��veh���u�#���{���5j!4���g�֏K��4>�y�(�6��	��;�#3��= q>�T��CH4##��
�Y� Ȏn��"�i�(���K�j.��4�N�-/�-�
/pZ��\PI�M�H���*�̝ڹx�R��+�ަh�1��%��|�$K9C�	^��t�m�}]�kU8k(�Y �D����HHq�x}�x��9�W�^��*=�x�9��`�sH�o �y���'�X=ڿk��T���^�����U���o�a�<a%�=��jp(��7�=�;W/��;����rj�{m��E!��B�л��v��S�lf��EmD����4�Ш�� <�.GR�S���+�`��Be�yN�*��Z�'����Ƣ&ǥEA0�<(���.�B�=�Z=�A�
���G�g�LF
b�%�>�s�$ͽQM�`�|�k����w��U�����������/�h<�Y������^���&r7�ލ�knʫ�A�sR~8wO��x�*$ڝZ�GVC��mx��K`ә@9u�.j�ĺ�!�F�]�K�I;&���d?D���ҋ�0����D��#�ֽo?>\�O�.�^1��^1P3vB>�}����[���F�}��j�{	���
��d2'�96W��\9�(!��ލ��^OFo2��p�å	�-C���p%�P�G{�d0-o�K ˥zÀ�Icu��Tһ�허AC4�Ƙr%Θ�:�(]O�̳�y�;t�}孯�3� 4y������셃��Tq���/%M3L�b�˹z�Y2���f��X�;r� 0����m��u�u�FS@�y@c�rT���=�^W��h
��+��ˮא<�-|ު(d�?$?}�XO�P4�lG����ލq?�v{{�?ڬ�D      H      x��\�v�8�]�_�e�9�:�^ʶ<��r[-�f6��3��R���TY��s$�`�:ӻ��� �q#�(�>|}��[�"������
�f|~|:V�Us
~������>V�uS��Q��R�ͩj�fW�}����M����s��/�G��o�w��m��c{?ʶ���m��\�/}��AOmw�|�#"�SU����X�^���y��������Rm
��:����?���C{���WV�b�����d�|�vu?i���k�ˣ�[H|�����c�\�>4~,��^�<Oe}����r��#�>�X��>�ͩk��:��S9lӏ�폌g���v�4������g���g&��gnv�7<s���_�������>��f,~x�2B�����G�U~������m�0�K�})��v�oO����QOmp���Ous�^�S����<*�G���'�gZ�m��|l���w�7�,�ǹT���rDa?y�����YlFdoʃ��'op6z���D�'�-�T�h��A���}W���;��+��~�G7ǲ��!�]<�����n��T����/��~Z�f���/$��ٓ"D���U�)�n��m���}�����C_�Smț���_��!�����Y٭�n��'��	�P��1�}�Q��ȅ�}�ٕ��������n��7>w�OŰG�s�������im��MO��+����a�<-��31|��4m�|�;?�x-�������������7�؟���
6]�5�yĳ~�٫xI?�X��y�;qG�6;��Q��(���G�U�!���f�I�y|oJ]=O�~��cR|��C���p4;��Á�ҫ=����f�������i�}a��6~J(���(�����U���� �������-?��\?Vݡjv/��r�p�ݧ0��ӹ'���NI��?T����o���*���m���+	?ϼX�����կ?��	&��?�	Dz2-�/zY>~��k8d��y��H���K�"$JJ�OK��铂DlQ?/<Y$����B�?�2�RD��Z,���b��D�I?^<-ꢰ���/��Y�%�=��W�Ig�7%|KH���[��0!<!��EP��{Oh{j����SI1�9��)����K�R%�H����Yv����H�FX��n�b,<)�(�^���B8~�T�������b�c��'�|)1L�8�b��Kc-PēpĿ�V�
�6��?��H�ʘLYx������WL�i�����No������"���s��|Z���X��g�⧏wP+�b���t���]�=��毊�39;�ԕ��m�;�^�S��n"C�=vJ�4̙
mB����K�E�l���	D0JXk�"&������U#�@�S��0^ȌBOd�K���	�RǪ��S�R�R�3�REF5t,�\��e����f�`/������C�Ò�Ċ 9O+B\:+��5Ԑ$Z��h�K�F��	>B9Y��DV�K��8U#�f&F2������~�}�~4켭z�����(�2��lyF�<�ˈ෉NB�b�@�"� �-�$ܰ�D�t���Y�1©Q��ƩO��lI�p�d"�Lg ���7Uw�v�*�33��@4���	��;�Aш���4L�򔍕 ���h�fѹ�D���i�F��Rh՝��t�� Ib/^:�?���-73̦M��Y�k�rEQ�B�=��#sz��EؗƤ���y��hBH�-�X�*Q^���G���4<m��qN
�A�k�3	$j��*1���H,�&)J�͙6f�d�@h�E�,Ŀ�Ax2E�$�Et�,����*�>*cZ��VB' *�w͏���^FbB��PakZ�ZC��C,7������A.�3/��?�/�vMvA�F�fA�|�ؐ�(��$��St5��@e2�a8�tʌ��2ڵ�~��SW?O�oeׂ��(��$�b�9}G�V�`5v��h�w[�Z��e�����t���0��R�ёK�*�L��������>U�{������`�$
{�Ylڰ
5��g��3[aTy�*q�3�ZCZ��N��9NX�{���H�(Dn�d��N/��N�jW�C�(��52f�˨1C$���9�Z�N�v����Ge�_F����7&|aP��[D�S�ٞNh)0�҅%*$���;$���[(Q�I�Z�clz��u�U}<�4�Rjj�$�⥞��4�}m�0i�X��s��I��Քw枥D�!qHN;�"�X��ɇ�U��516U#|*x���΄YѺ�0a6�k��^�N��+��]�jf`2A��2��7^��Ĭ�&.})���nϽi=�t��R�;��w]?� ��?�X���H���ƱA�cf�^��ѺO��ό,�z�h��3zE�����2U'�C�\�U���a#�Tw% hk�&V̮�ΗR��G�vq� ���	C�c�PuFA�L,u���� �Q�ԁ���¾:' ����*��>��6��y�"�Dl�~��9��2�
���҃��{�kB�e�~�?�LGA���Wվr�h3����fn%��2EN|��Z�I�6�A��!l��%~	M�'c�~.�g� -H����0����B��{߱d k��l�m>V��Ԑ���/i�n�	2�&�u~[��M~8���O�ǹ�j���`O$�p����O����{TA�q8N*���X�3�81h�TZ��7��(�D����EEN�e����xp���pӀ�Li�	�ˌl����Q夦X��l��v ����㚊j$�Oy�vMeg�N���+��^D���U�|��i
/@�a!�8��G��j@�:2��7΅a�g��@�"r��y��YDy�Fб- O����X��,��}?��CXH��z��T0Wx�&��b�Q�eߵG������dʼ�����)�h 1���&�P*Zz9�46@YA�RGO���ɚƏ��A�c�]-�N����a��dKF�`��q���$��)���V"�b�
��|E-���k�
���O������ �[�V��6y�K45�4�l��/վ.�_��]�����<� Q,����-V'�K��L[��z���Za�oӟ{�"�H�H�Ǒ�=�t<���$c][�ch^�c�%T�aQ":�IRS)�u�<l(wƒX�@Ƃ�Q9zLH����=�BO �[�Tz�!a	E�Xo�1�!�
�R�M� ���{7���+�.L=���Jpx0u�R
r��%l"a]�8�̔��Eȩ�: OΧ��O��E�Kj*m��DQ�N���s��r�E��|����Eu��C3^W3ut��0l8�L?�fZV�'CTqi̘��
x�{�W5�������n� Ѫ��f *�,<,�w��NI�%�{���f���5q���/��0�L�V������٨A�_ϧ�3QLC9��@/���l��vc��&r�y6y�b�_�n�A�e�U8��F���P�U�O_���>�%�z����r���~8�������|�8"�M�����o��Ѱkl1*^j�e^ː���e񑩩
������������(Q�FNQ��X��e�@�B�l�I)#�z����l6�5=�}���	A�)�bXlVZ�L3�].|IƕN�E4�9�W���SE��w6^;��͜�/;Bj)4���Qߢc�B�(�g{��ɴ��w<��D\�����i,���Yʒ{����+�D���Eaz��ޮ��٠au��D��HV;�"�I��L����\2åF
��%����u���:H�y�w����ק�fnqP�;�I�Ӯ�؅��|{��D7e���y�f���,��v��<L�x�51앸���M+h]V�H]�X������L�@�x'.d|:+�<>ku:3p���o��Us����ʌ���V�8Mhc��#���j��8�}�ZLd��$2��B_;%��c<��iNr2m�w}zXY�$�@�0�%qSG5v� 
Y�>޴#l�y[��	�B�OF�c��-y�:f�B<B�G[�DS�А^��?b�3�^�u\��������q�P�? '	  �O?�%�S	XSd�BE	��Ry�M��8b�C����a��ĉ��#{L2%̺@jx0RBc�����}��TN@��߄��c~����u�+�g	���L��k�7����r�O�z�uK�nH�aj�;���b>�7������ܻ�Z���)�@"7`O���f_=U��ьc�$_�&�͂]jNAUݡl�A��׿�-�� ����#;Qϴ�
��+���xsj�%Q����dNg�0��AlȆuV��,�ə&:ʪ�2-Ұ�8��XJv���]���)��8�-�&�����:m9c�i�y�
��tkb�	ߐj�0��Q����bP�$�s�!�TX7t��}��Qw1��ΰ�T�]����ba�����I�=��Ȯ�jbu�B�:�t�ڳ6�MaM>e}�_ݓb�UM��ޫ2B�����T�n�G���§�DXI͟i��f�^��@]*�`��bU� U�T���y�8k*�YwT��i��!BH��lc^��r��A'lJ��.��XO�!z�9%�ƞ�yS�P����j{���>M���ǃ��
��UF��%��Uײi���2��W�/l�JSα�P�l��".���.GJ���b&Ա�"緸�n�P��:0��>M[gA�����cSq��'"9�H�QX(�:f��U�1kb���/��ө����Kԉ�Q0����/dB=�x�@UªJqF�#�Ҷ2��~�EC��2}��Ooy��wz�r��^.��5Ʋ(P�c��%c$���2�g� -Q�y9�S���9���E�p���1U�8�QC��9-����iv��}��L�ƙ�E�⩋w���`�jv�!����V�I�t]:a�w�W!�Q�9��� �#sbe��Ue:E�m̯4U�.~B`��+yP,6Dń�rdM���S���N4�f�yŉ���$sXc�;�����geHDQKB����c�+�Z�,������}dpR@�y59��Քu��!͓R��ѴMC�u��ysKcG�λr��l��Oi�4R�6 J3���~`x,@Z�$w@J�!�
���&�D���~S�:�� ۀe[�	��ĳ^W�hc��c���<g-;g���4������3���?T� A2�)/�d2]��])?NL:��D��H�)���K@5������iN>�_���ם�)�U�N��s��US���az�g$@Kǀ¶p��n`� C���Jt>����6���	���!e�J�0�¾�+�
�B��mX��-W٩ℍ>�v~�8�s"a+
���B_��S�JLc��՗�28�D� �CT�(9�r51l���:�� �F�$��O�����gJ$:sR������emjP�T*	�<�����u���8�w�1�>���W�X�M��i33�ڈ&�A�vC��x6���p��ja.=l�BgK��r�\�K�K����H�mE���Ag�j>ݨ^"��݆\�C�XÛ�rG"8��'5�����=�d? �(�,�p�M��j�NgF۱�r ��o�D��64�����®6\��/��hԄ�z������[�̢�AR#���_��>���M9j���fg>�qS_����l����!��~��#�6����yL�Z��Sv��]t %���n:�:�o��ݕ0DY�EQ��̐����;�g���fUT�ű}�;g���P���e/i�Y�O��<�$�Z�*���~l^G��*ݜ��H�"3�$q)#'�����9N��H���m�t6��	�!̫���4�1 7��N��]��5A	�+Z�y�l�vF��y�3�^"bBڲ̧%����� �ۘ�Ig\�fo�ѓN�4�\4�i&@�����I.w�F�2<:���\�1aK�ģ�/�Aj��膺b��-w�e�/ͮ���+�7!��6��|h�����ꮐL"�緔��/�
	�1 �,�Z��H�1�3�0P2�
Kؼ>���KE
����d�h�4�n��|f�x)S���;��샪�~�+�-Ȯ��x�{����u�Dq���Ұwnq�p�D�f��_l�n�>o��-ትkFM3-�J��g�ry�7�je!{�Q �-VNK��M�s����7j�BKWm��H���O�N��31ג���wl���L��ދ���[!�uN��N�.g"�v���qⅻ�$P{�jأ�U�id.si��($�ː��!'Y#�܍E6Z�b	�1p�F=��K}��4�1��y�ni/�m�жt��+�ťp��Ż`~ÏOt���Y}�*\��(��D��rA�m*��������^p{�      I      x��[�r��r]�_��1R�
o�di����g�7P7Hb��@7u��>�
��@ɋ;q�2�y��B��o�cY&����4��>/ދ�~�C����8�݀���K7���Swy���,�/�K�~��������Uފ*�:~<Ocq�p��v>���}���U�E��}��'-
K;^���i�q.���.�qs�<�ӢD&�w2������Ǧ/-Vz����z��"�~�o7��i����S34O��.�"CR$N���G��a� ��L����϶o��ӷnx�c��c�����Զ�~(`9�:�?��/�0ǎ;�y���܏����Sꕛ��V̤T[�ڡ��_��x=���.S�-�X%�ѧn>t��镧�<0��}��s�xX[�������Q0�j1��2B9d4��^�x�n*uꟿ�4?wg��Tʴ?���|��\��{'`$�2�/��:޳K��5~��L����9���S�������8���w6S���w����YZ�T*uQ�����=�/�N��k�b�"���E����և�������u��{�$-n���Nd��Ս�N�9&� ���f�;�՝//\�xh/t_�v�������vP�{����+4�ql߹�A@�(ju_J@�/y�f��\+G��˿��Խ ����*gꞞy�Y�J(!�H��O�E!4~Ym΍4xf>Qf��(3w���ٓYK���^��hA=��9�}�/벶�U+��K{��{��g�8�*Fę��~3�]��"಍����8h�;��8Z^F놛�ƎN8����Ҟ�V��2�ڲO���{"5�>M͉:����~k?,��_ފ��:!��c���4��Aђ����B9���J�BƧ���?�W/��B�\a��s;u��B(�6�ޓ�=(@p��"�N�/R��#���q	ŏ��Ĝ<`DJD�O�,�B�'�HP��X뀕PL;�t�8p����<�M����G��Y)̬1��;�R�ѧ��^Zl�*��9��,����~��kw֦��-���#�@�-�.��z>��zKۤ:�"dKBa�G�>m9l2��ʮ�Ԑ�p��E��w~������WcQ�Q�-����c�$�,��g<kԋA���fY��JX�,�/����|��a�S2�l�����͠�2ˡ��D��0�B���X�"���\�DW��9�
d&���dVv 덦*�I����G$��l�Ν(q���d$7�����I��fB���i���_^"y\�Je;; ).-� ����4�\1�0Ge���$R)#����'���ǔ��V4uu�]�i��c��S\L�M�]	c��3@��Bg,�`X_�c>�-s^��,��V�О��&u�Kۏ�Z�/�+,�5
S��q^b9Ne��d�#s� y-`eR���P�ـ��{Ģ� ����׉+| ]��qa'�m߮g�@�e�%;K��"s�fj���l]ȯ�.��xB"�mV�bn�����)c��U޽�Y^�z�2 ���{���q.��sUfG�W���i�+���ρ}U!�l�����bu=�1�~<�9��gXH7���5VǗ��#lē���%�/�Y�.��7�:��e#��1NM� �)uJb�g�ܜYA�Q���O�q?σ"/��b���pC\���{N �H2_�����M82ts��;w璶[�S`Uz8X�0�H��b=��z�.�)�^��^*�2i[R���1x���.���J�X`�cd5mL�B%��d �nS5�}((#i�	��c���4����ֹ@�Ln(��+�oN$�=$�X�k�I8�5��%��r��T��+���f����
�*�l0�i5Vo�:��{'p�0�EI���a�4kck�� 0z�I�<7
�w�+��	%lڗ��3&���cwdRרt�5�66�qV��>�-��2�L�d+"	9�)���L��B��B_�*R�JM^C=\`�XWX��%/`��T�=��U�1q&�W�烵LX$�Z��Q�0�R�LY��S��*ݼ%�SYJ�`����:����h�� N ��j���� m�]�A�S��,ҥ�e����5�u����.wM�..K_��(�\u�ib�d����2���,�M�Z�Eצ�U��n��I�YF�Õ�R�!c����D��o�Rd�1�QA[��r���M��#h <�m'M����^��ŝd���o�El�q����p8g�B�p���*�i,J�a�Z�^t��詑ZP�� �a�1>$I��P���p�$�*!��U�[d`����7����3R`#\TwL���v�åjO6y�%3�P
��ͥ�k����^g�|��\� 	敆8�-�h�gSk��uT%U��45����"d�¥����r�?���>?���\bAeU�F\kر D���U�L�,���D��9���
��D�`ܯZ�+�k���pe��`4���լ��I��@��_�6�Mf�ҫ�NyD�򑓊���I�Vַ?�2xn4IU����A��J�.$�u}�˦��eJ������q��p
�W�|i�"V���/�D$H,���a�����v��4}o�ol�qc P`Bжwz�B���2�=�֟)k6�uգ8�^Önw[�wH�v!��|�9�#��ҿ���T��q\�	H� {���u�CCo����qO?�W�j��r/��L7�c���z�Ǿ��	��l�sΓ��;��8(3���9=l}�7ðk&�6�p��-(��e�lȴ���8�JJ��'p���(K�FҮ=���e���22��;<���*��4����?T���$�Ž�H�;i�Үв�L����z�ÿn��k�ZY���#D�FA�D�sȬ(��X�e6�<���.��=Ԟ]�ލ ���WE4�A
V���d)��� 0�t���K��±aPU�9�ۦl� R�E���L_���������ݒY�e/H���:��gf�Tֽ4��M{Bu��ifQ�[�Y�{��[�o$Yf3�e���3�v�������#DV�|U�WTD�H6�3+�j�a�A������
|Z�����WmG��h����rg�cûD���ꍢηB&R*����&R��,��(b��_Ⲭk�O�x���?�_~�v�V�&|�6u�N�kѠ�af,a]�H.��������C�c]�ʙ��o
%Λ���ٓ���`��X�5�Қ�S�Z~��%��"�GQE�C�k��A��:��_�{*�p1�S�!%_��v�)yߏ���Z�a�py(ͣlGg�dpZ+��,��k� nF����
��v\�HrO;(�H�b<�I�n޹��&�DJM��#_ɻ��@"�]Zxg��������qzj�Z��&*tT{v(�r����ya�?�k�ݞ����*��Kc([�&2��[\�Y�C���H�ȷL}��,�$������F�����ݶf���5��
,2�
S�"�%�����l���n\J*A���*;d�W��>�a$:��-�����:d)�E��ύ��� ��r��z�����+"x��^+�I�w[�Ւu	��s{3Gt}^���Qs���I�5i���a ����Up�_o��I{8�sO�tE���m���ͨ��l%o�t��^m�+^�S�q�Wnw�#��U;�� ��ǔ�ғ���x�U�&2�zg��ӛ����'N��@�֘�	�4@��_
�}B�6���L�e�<M���򕒮9�M0ҝڀ(Rȗ"�gնס�%���j����RQ��FyХU�۱T�މ�����1>�5Pä���!�'��&Sn_Ό�R9��a'��f�u<ѕCA��\{�jG���
�{�T ��PDah";�]�Պe���nF��|A�8f��ќ4���
K.����?肜�_*ВAk$���M%/U�aZ��Ж	9,א�� l�4l�B��L������ÎvJ ^߀ ����\WNč�ycP��+�� �0&K��
]2��zw3{U � qRa#��3.5��lh�٨Oo�F�Q�`� �  L9R'��버t2>�F}�F�aQ<݁��iqk�(���Έ�2 �jÊ!:w���{����#�^�V���(S-��L<U'���X'�%��ܬn�|����(�B��(S]c�z��ag�	��x�-��
�ˁ�<�(ue�uT��$6Ü:�f����\`�9�0W�~���T���ް���a�E�H*�K��v�������uv*����V�IGG��4V댉"�%P	�-×ϸ���FI��}��
ŕm]�MB���P�N�M�ƂV�SJ;��N�,=յ,��� lfN"�i� ܝ �T᳨�P��E��7�6x�{ҙ�'N]ՙ��8�N-��O��s8��O��%)%�A �D`��pI��1�cY:��M�"'6ֺ4T;��[�e�](��,��V¶u�Z��Z�o9���p�M�.e6Y��5r%S��);ܯ���c� �w��za�TÕ����j��#G2�l�6����+�c�]d��l�2
�n��l�;դZ�_��ۙ���c���f>5"�.U�p2�2}p�9��o��X} _W:�M�3ԧt,}|#��=�)�����V�M:�AY�Oe9���i�/����h�S�%�B�����)[�iko�_JQC�^UL$4�y�W6�QM�
�����'N(@��\�p��J�zi�_�O:5��C��
!j�Z��Hx����>uW��Y��T�d�XQ�Sfq��?;l&؜��!�V3�� �
�8�kK�NCz����
-���Z��/U���+����b�Ne���R���e��)�,Ҹp[����v�YpV�v�t:�J�B/~a0�vz;����6|B,�ٱ{���6K���:(�j�@�p��<i�xV��r�L��S��񃢇�	x�x<��ƒĝ��l�h9� s��|�JU8��w�	ު�H7O��Z>�N�	֙8���Ϗ{,]՟�1۰U������v���&��=�]�${ ��E�ߖ�PؐPEO�Ng~�n��p�&nN��b�;&�|��jl��n�4C�K57��U�֏Xrwj����?�v��q�JR���ώm?>��OO�p�	B��;N�Cwtuw�i���B��S�>�p�@���Jo���Ɩ�'5۲�ᩛg���p+M�(\��Z���u��6�mL�&���>X�p���=д�i�[�\l#��;.�-{��E���ɦ�����=�H���9a�lU������뜣�A�Lio�^�VQ����\ߤ��T��까JIU��������G�u      J   e   x�3����Q(3�N-*�LNU.)J,IM��2rI-�L��2Ɛ)J�+�,����2���/H��3��9��d�&�(�Ty�嗥��p��qqq �Y0�      K   �  x����n7���S��/��,�n�.�1P#8(�q oߟr/��Dkm~�D��9���>~�ty��|�^/�_��$H�|�qci���$.�-X��DIN�45ͤB������_.���8Q<?�6	��ydd��kF<���<>�<�<<oO//��O۷�/����[�Τ%�1�Ĥ�B\���b!�+�&�$,1�/1�����#�%�KTl���B!Y���<K:��c!K:��B Yҁ
�M��0I�t {�F����,�@�z�K:��Yҁ�֕tI�-�nK: #�tIf��rbj�Eqaj=uJ���,�MD�~|zMN}��ށ�O���@����Dބ��ۮ�����'�t�!�!D�yvtؚU�vr��n@�{�$�MϞ�}�*���CS�����-����3��[)��tvh�C��Z���Y�z�*��F�-��biP�6�ƾ&�7����_����x��)A�dJx����u��C�SxS�J�#[�c�:�
��2����W V:f:�;�!�(_�=f޿��I:�;N�Z��s�A:�G
��*�zPy§�C�+Bj��[�0I��!y�^~͉5�"G�S��u��6S��v ���j�dJ��%��@t\"e����ȼ��J�vj��z���Ѩ�R,���ܩ0�<���K�7 ��x�p|X�l�((�La����F#��Pa��X��ҕt��yGF_�T�_UFrQ=R�T�Z�,���c��}Z�糡�o��V����I>I��ӷ�
��~p�X������╳�n���W}����I�{����}eVM��[wx�].2�g.{�3U���!�=�߸x^w�FՔ#��.�2�uiGZ�\],6J'�|�<�a�ᦴۚ��<|��W�M��!Qx'���a]X���8���0�Y8����>R�^\-u6D�����<�]b�3�`~M�f)6�h�kR�=�$����'��#�l��DD���      L   
  x���Aj�0е��@ʌdٖ����E�,SD$rPCn�1�`���}��HT�p�i?�>�4f~T}���B~��~��J�2��5�3֡��8��c���o�[�f�1f/�r���+��r����[�;CЖ�,�OЕ�n�?�A_�J�Ԃ-]���:���D�ZQ����H���ͳ]�
�e˻%]��Ȧj�V��A�\�����r���z��p�-P��BS�ķ�o�\��D��rGՀB��vr�EbN+�h�/ �ӲTQ      M   �  x���ko�0�?�_��E�@H�֋&!mj����#�&�!S���	�"�Mݤ�)�?ﹼ�%�(}N?�Gi*�xSQ����7t�н�)�jUi\�p�O��/�'^(�{�M�q������'yP�'z��A�p�����z�0Bb�E	�H��D	�	���52z��Yd��-rYJ]�OF��ge�#6E�ޅ~x@�5�}� }�Q:���2�����I��^��4Xħ��t��q�J����a/�ڱv���^8��B�ً�(��L����YcT}�p�)�p)IXP6�{/��5���ܻJm���=p٩��>�<g��X�����V��9*��@�稢G��:�>����;����p�+Š�:.>�b�yW �ک��dި�,���tnd�W1:�k���/ �~�xX��B�A�u��R���dQ���~��Y�3"��@~6B[o���v9��N�i�r3n�/�;�VX��A+�!F�Hɢu�n@���(ӎ���*��ڽ��u�S�����龍M+a�AI5��#%��s��sF�5Ԛֲ��2�ϕ�����)��d#��t�5�c�����M#�.�pZK8�¼۸'�����^�$!$`S��'^��7,~4U&���-q�mm��7���#��X�̟d�-���z���Ul�'G����#ZF���m>������e�|Q�;��\zG3U1�X6e�P�B*�Ǎ�4d���8�[!�˅�'���S�LH�)')�SS;Z8���`Q4I����{����b�!��:`��٭ �}:/-����5��V�/���3�/;�|��)�^�#��5���'���n�Z����EV%ȪϞ3+�'�i�G�z�~-Z^��w"�*`�?��UY�@��{�M�9M��ǪP�qVC��0������
X      N   �   x��ν�0�ṽ�^���@�n:ktt��V�-��^И(�p��9�C��;�ٛ���V�c'.Xb(�N$�Y�E�WL*ͥ�)]�>n,��f����10bʤ�
>v�����D�0S���>��cDi��B� <�6|(C��BC����Bޮ�=�:���tjf�O\���&���dc$�<��%��8>}�      O   �   x����N�0���S���?'�UBBP!��#Z7N�-qP���c��qig�т��� �0�|���u3@���n#���3���&���7΅���:�x�EM����.8��F��|Y�Ns*|��c�:b�t�F���H��iLY�aw������O�����`}0V��x��ǿy��ڧ�/�b[R�f���+���Ӎ����b�     