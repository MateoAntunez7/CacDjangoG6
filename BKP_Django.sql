PGDMP  2                 	    {            citas    16.0    16.0 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16838    citas    DATABASE     |   CREATE DATABASE citas WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Argentina.1252';
    DROP DATABASE citas;
                postgres    false            �            1259    16865 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    16864    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    222            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    221            �            1259    16874    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    16873    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    224            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    223            �            1259    16858    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    16857    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    220            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    219            �            1259    16881 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         heap    postgres    false            �            1259    16890    auth_user_groups    TABLE     ~   CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    postgres    false            �            1259    16889    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          postgres    false    228            �           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          postgres    false    227            �            1259    16880    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          postgres    false    226            �           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          postgres    false    225            �            1259    16897    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    postgres    false            �            1259    16896 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          postgres    false    230            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          postgres    false    229            �            1259    17037    diainactivos    TABLE     �   CREATE TABLE public.diainactivos (
    id bigint NOT NULL,
    diadesde date NOT NULL,
    descripcion character varying(50) NOT NULL,
    profesional_id bigint NOT NULL
);
     DROP TABLE public.diainactivos;
       public         heap    postgres    false            �            1259    17036    diainactivos_id_seq    SEQUENCE     |   CREATE SEQUENCE public.diainactivos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.diainactivos_id_seq;
       public          postgres    false    245            �           0    0    diainactivos_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.diainactivos_id_seq OWNED BY public.diainactivos.id;
          public          postgres    false    244            �            1259    16956    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            �            1259    16955    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    232            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    231            �            1259    16849    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    16848    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    218            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    217            �            1259    16840    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    16839    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    216            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    215            �            1259    16985    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            �            1259    16995    especialidades    TABLE     �   CREATE TABLE public.especialidades (
    id bigint NOT NULL,
    descripcion character varying(50) NOT NULL,
    estado character varying(8) NOT NULL
);
 "   DROP TABLE public.especialidades;
       public         heap    postgres    false            �            1259    16994    especialidades_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.especialidades_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.especialidades_id_seq;
       public          postgres    false    235            �           0    0    especialidades_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.especialidades_id_seq OWNED BY public.especialidades.id;
          public          postgres    false    234            �            1259    17002    feriados    TABLE     �   CREATE TABLE public.feriados (
    id bigint NOT NULL,
    dia date NOT NULL,
    descripcion character varying(50) NOT NULL
);
    DROP TABLE public.feriados;
       public         heap    postgres    false            �            1259    17001    feriados_id_seq    SEQUENCE     x   CREATE SEQUENCE public.feriados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.feriados_id_seq;
       public          postgres    false    237            �           0    0    feriados_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.feriados_id_seq OWNED BY public.feriados.id;
          public          postgres    false    236            �            1259    17108    historiaclinicas    TABLE     #  CREATE TABLE public.historiaclinicas (
    id bigint NOT NULL,
    dia date NOT NULL,
    diagnostico character varying(8) NOT NULL,
    observacion character varying(4000) NOT NULL,
    especialidad_id bigint NOT NULL,
    paciente_id bigint NOT NULL,
    profesional_id bigint NOT NULL
);
 $   DROP TABLE public.historiaclinicas;
       public         heap    postgres    false            �            1259    17107    historiaclinicas_id_seq    SEQUENCE     �   CREATE SEQUENCE public.historiaclinicas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.historiaclinicas_id_seq;
       public          postgres    false    253            �           0    0    historiaclinicas_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.historiaclinicas_id_seq OWNED BY public.historiaclinicas.id;
          public          postgres    false    252            �            1259    17009    obrasociales    TABLE     �   CREATE TABLE public.obrasociales (
    id bigint NOT NULL,
    descripcion character varying(50) NOT NULL,
    estado character varying(8) NOT NULL
);
     DROP TABLE public.obrasociales;
       public         heap    postgres    false            �            1259    17008    obrasociales_id_seq    SEQUENCE     |   CREATE SEQUENCE public.obrasociales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.obrasociales_id_seq;
       public          postgres    false    239            �           0    0    obrasociales_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.obrasociales_id_seq OWNED BY public.obrasociales.id;
          public          postgres    false    238            �            1259    17068 	   pacientes    TABLE     �  CREATE TABLE public.pacientes (
    id bigint NOT NULL,
    apellido character varying(50) NOT NULL,
    nombre character varying(50) NOT NULL,
    telefono1 character varying(50) NOT NULL,
    telefono2 character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    fnacimiento date NOT NULL,
    plan character varying(50) NOT NULL,
    nrosocial character varying(25) NOT NULL,
    domicilio character varying(150) NOT NULL,
    observa character varying(300) NOT NULL,
    obsclinica character varying(500) NOT NULL,
    dni integer NOT NULL,
    celular character varying(15) NOT NULL,
    osocial_id bigint NOT NULL
);
    DROP TABLE public.pacientes;
       public         heap    postgres    false            �            1259    17067    pacientes_id_seq    SEQUENCE     y   CREATE SEQUENCE public.pacientes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.pacientes_id_seq;
       public          postgres    false    249            �           0    0    pacientes_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.pacientes_id_seq OWNED BY public.pacientes.id;
          public          postgres    false    248            �            1259    17024    profesionales    TABLE     �  CREATE TABLE public.profesionales (
    id bigint NOT NULL,
    apellido character varying(50) NOT NULL,
    nombre character varying(50) NOT NULL,
    telefono1 character varying(50) NOT NULL,
    telefono2 character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    intervalos time without time zone NOT NULL,
    sobreturno integer NOT NULL,
    sobreturnoe integer NOT NULL,
    estado character varying(8) NOT NULL,
    especialidad_id bigint NOT NULL
);
 !   DROP TABLE public.profesionales;
       public         heap    postgres    false            �            1259    17023    profesionales_id_seq    SEQUENCE     }   CREATE SEQUENCE public.profesionales_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.profesionales_id_seq;
       public          postgres    false    243            �           0    0    profesionales_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.profesionales_id_seq OWNED BY public.profesionales.id;
          public          postgres    false    242            �            1259    17055 	   tdiahoras    TABLE     �   CREATE TABLE public.tdiahoras (
    id bigint NOT NULL,
    dia integer NOT NULL,
    horainicio time without time zone NOT NULL,
    horafin time without time zone NOT NULL,
    profesional_id bigint NOT NULL
);
    DROP TABLE public.tdiahoras;
       public         heap    postgres    false            �            1259    17054    tdiahoras_id_seq    SEQUENCE     y   CREATE SEQUENCE public.tdiahoras_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.tdiahoras_id_seq;
       public          postgres    false    247            �           0    0    tdiahoras_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.tdiahoras_id_seq OWNED BY public.tdiahoras.id;
          public          postgres    false    246            �            1259    17016    tratamientos    TABLE     �   CREATE TABLE public.tratamientos (
    id bigint NOT NULL,
    descripcion character varying(50) NOT NULL,
    estado character varying(8) NOT NULL
);
     DROP TABLE public.tratamientos;
       public         heap    postgres    false            �            1259    17015    tratamientos_id_seq    SEQUENCE     |   CREATE SEQUENCE public.tratamientos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.tratamientos_id_seq;
       public          postgres    false    241            �           0    0    tratamientos_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.tratamientos_id_seq OWNED BY public.tratamientos.id;
          public          postgres    false    240            �            1259    17083    turnos    TABLE     �  CREATE TABLE public.turnos (
    id bigint NOT NULL,
    anio integer NOT NULL,
    mes integer NOT NULL,
    dia date NOT NULL,
    estado character varying(8) NOT NULL,
    hora time without time zone NOT NULL,
    llegada time without time zone NOT NULL,
    atencion character varying(10) NOT NULL,
    tipo character varying(9) NOT NULL,
    paciente_id bigint NOT NULL,
    profesional_id bigint NOT NULL,
    tratamiento_id bigint NOT NULL
);
    DROP TABLE public.turnos;
       public         heap    postgres    false            �            1259    17082    turnos_id_seq    SEQUENCE     v   CREATE SEQUENCE public.turnos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.turnos_id_seq;
       public          postgres    false    251            �           0    0    turnos_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.turnos_id_seq OWNED BY public.turnos.id;
          public          postgres    false    250            {           2604    16868    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222            |           2604    16877    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            z           2604    16861    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            }           2604    16884    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    226    226            ~           2604    16893    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227    228                       2604    16900    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    230    230            �           2604    17040    diainactivos id    DEFAULT     r   ALTER TABLE ONLY public.diainactivos ALTER COLUMN id SET DEFAULT nextval('public.diainactivos_id_seq'::regclass);
 >   ALTER TABLE public.diainactivos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    245    245            �           2604    16959    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    231    232            y           2604    16852    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            x           2604    16843    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    16998    especialidades id    DEFAULT     v   ALTER TABLE ONLY public.especialidades ALTER COLUMN id SET DEFAULT nextval('public.especialidades_id_seq'::regclass);
 @   ALTER TABLE public.especialidades ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    235    235            �           2604    17005    feriados id    DEFAULT     j   ALTER TABLE ONLY public.feriados ALTER COLUMN id SET DEFAULT nextval('public.feriados_id_seq'::regclass);
 :   ALTER TABLE public.feriados ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    236    237            �           2604    17111    historiaclinicas id    DEFAULT     z   ALTER TABLE ONLY public.historiaclinicas ALTER COLUMN id SET DEFAULT nextval('public.historiaclinicas_id_seq'::regclass);
 B   ALTER TABLE public.historiaclinicas ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    252    253    253            �           2604    17012    obrasociales id    DEFAULT     r   ALTER TABLE ONLY public.obrasociales ALTER COLUMN id SET DEFAULT nextval('public.obrasociales_id_seq'::regclass);
 >   ALTER TABLE public.obrasociales ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    238    239            �           2604    17071    pacientes id    DEFAULT     l   ALTER TABLE ONLY public.pacientes ALTER COLUMN id SET DEFAULT nextval('public.pacientes_id_seq'::regclass);
 ;   ALTER TABLE public.pacientes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    249    248    249            �           2604    17027    profesionales id    DEFAULT     t   ALTER TABLE ONLY public.profesionales ALTER COLUMN id SET DEFAULT nextval('public.profesionales_id_seq'::regclass);
 ?   ALTER TABLE public.profesionales ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    243    242    243            �           2604    17058    tdiahoras id    DEFAULT     l   ALTER TABLE ONLY public.tdiahoras ALTER COLUMN id SET DEFAULT nextval('public.tdiahoras_id_seq'::regclass);
 ;   ALTER TABLE public.tdiahoras ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    247    246    247            �           2604    17019    tratamientos id    DEFAULT     r   ALTER TABLE ONLY public.tratamientos ALTER COLUMN id SET DEFAULT nextval('public.tratamientos_id_seq'::regclass);
 >   ALTER TABLE public.tratamientos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    241    240    241            �           2604    17086 	   turnos id    DEFAULT     f   ALTER TABLE ONLY public.turnos ALTER COLUMN id SET DEFAULT nextval('public.turnos_id_seq'::regclass);
 8   ALTER TABLE public.turnos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    250    251    251            �          0    16865 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    222   �       �          0    16874    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    224   ��       �          0    16858    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    220   ��       �          0    16881 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    226   Q�       �          0    16890    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    228   n�       �          0    16897    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    230   ��       �          0    17037    diainactivos 
   TABLE DATA           Q   COPY public.diainactivos (id, diadesde, descripcion, profesional_id) FROM stdin;
    public          postgres    false    245   ��       �          0    16956    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    232   ��       ~          0    16849    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    218   ��       |          0    16840    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    216   ��       �          0    16985    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    233   .�       �          0    16995    especialidades 
   TABLE DATA           A   COPY public.especialidades (id, descripcion, estado) FROM stdin;
    public          postgres    false    235   K�       �          0    17002    feriados 
   TABLE DATA           8   COPY public.feriados (id, dia, descripcion) FROM stdin;
    public          postgres    false    237   h�       �          0    17108    historiaclinicas 
   TABLE DATA           {   COPY public.historiaclinicas (id, dia, diagnostico, observacion, especialidad_id, paciente_id, profesional_id) FROM stdin;
    public          postgres    false    253   ��       �          0    17009    obrasociales 
   TABLE DATA           ?   COPY public.obrasociales (id, descripcion, estado) FROM stdin;
    public          postgres    false    239   ��       �          0    17068 	   pacientes 
   TABLE DATA           �   COPY public.pacientes (id, apellido, nombre, telefono1, telefono2, email, fnacimiento, plan, nrosocial, domicilio, observa, obsclinica, dni, celular, osocial_id) FROM stdin;
    public          postgres    false    249   ��       �          0    17024    profesionales 
   TABLE DATA           �   COPY public.profesionales (id, apellido, nombre, telefono1, telefono2, email, intervalos, sobreturno, sobreturnoe, estado, especialidad_id) FROM stdin;
    public          postgres    false    243   ��       �          0    17055 	   tdiahoras 
   TABLE DATA           Q   COPY public.tdiahoras (id, dia, horainicio, horafin, profesional_id) FROM stdin;
    public          postgres    false    247   ��       �          0    17016    tratamientos 
   TABLE DATA           ?   COPY public.tratamientos (id, descripcion, estado) FROM stdin;
    public          postgres    false    241   �       �          0    17083    turnos 
   TABLE DATA           �   COPY public.turnos (id, anio, mes, dia, estado, hora, llegada, atencion, tipo, paciente_id, profesional_id, tratamiento_id) FROM stdin;
    public          postgres    false    251   3�       �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    221            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    223            �           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 64, true);
          public          postgres    false    219            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
          public          postgres    false    227            �           0    0    auth_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);
          public          postgres    false    225            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    229            �           0    0    diainactivos_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.diainactivos_id_seq', 1, false);
          public          postgres    false    244            �           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);
          public          postgres    false    231            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 16, true);
          public          postgres    false    217            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 28, true);
          public          postgres    false    215            �           0    0    especialidades_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.especialidades_id_seq', 1, false);
          public          postgres    false    234            �           0    0    feriados_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.feriados_id_seq', 1, false);
          public          postgres    false    236            �           0    0    historiaclinicas_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.historiaclinicas_id_seq', 1, false);
          public          postgres    false    252            �           0    0    obrasociales_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.obrasociales_id_seq', 1, false);
          public          postgres    false    238            �           0    0    pacientes_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.pacientes_id_seq', 1, false);
          public          postgres    false    248            �           0    0    profesionales_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.profesionales_id_seq', 1, false);
          public          postgres    false    242            �           0    0    tdiahoras_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.tdiahoras_id_seq', 1, false);
          public          postgres    false    246            �           0    0    tratamientos_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.tratamientos_id_seq', 1, false);
          public          postgres    false    240            �           0    0    turnos_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.turnos_id_seq', 1, false);
          public          postgres    false    250            �           2606    16983    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    222            �           2606    16913 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    224    224            �           2606    16879 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    224            �           2606    16870    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    222            �           2606    16904 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    220    220            �           2606    16863 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    220            �           2606    16895 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            postgres    false    228            �           2606    16928 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            postgres    false    228    228            �           2606    16886    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            postgres    false    226            �           2606    16902 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            postgres    false    230            �           2606    16942 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            postgres    false    230    230            �           2606    16978     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    226            �           2606    17042    diainactivos diainactivos_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.diainactivos
    ADD CONSTRAINT diainactivos_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.diainactivos DROP CONSTRAINT diainactivos_pkey;
       public            postgres    false    245            �           2606    16964 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    232            �           2606    16856 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    218    218            �           2606    16854 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    218            �           2606    16847 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    216            �           2606    16991 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    233            �           2606    17000 "   especialidades especialidades_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.especialidades
    ADD CONSTRAINT especialidades_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.especialidades DROP CONSTRAINT especialidades_pkey;
       public            postgres    false    235            �           2606    17007    feriados feriados_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.feriados
    ADD CONSTRAINT feriados_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.feriados DROP CONSTRAINT feriados_pkey;
       public            postgres    false    237            �           2606    17115 &   historiaclinicas historiaclinicas_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.historiaclinicas
    ADD CONSTRAINT historiaclinicas_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.historiaclinicas DROP CONSTRAINT historiaclinicas_pkey;
       public            postgres    false    253            �           2606    17014    obrasociales obrasociales_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.obrasociales
    ADD CONSTRAINT obrasociales_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.obrasociales DROP CONSTRAINT obrasociales_pkey;
       public            postgres    false    239            �           2606    17075    pacientes pacientes_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pacientes_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.pacientes DROP CONSTRAINT pacientes_pkey;
       public            postgres    false    249            �           2606    17029     profesionales profesionales_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.profesionales
    ADD CONSTRAINT profesionales_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.profesionales DROP CONSTRAINT profesionales_pkey;
       public            postgres    false    243            �           2606    17060    tdiahoras tdiahoras_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.tdiahoras
    ADD CONSTRAINT tdiahoras_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.tdiahoras DROP CONSTRAINT tdiahoras_pkey;
       public            postgres    false    247            �           2606    17021    tratamientos tratamientos_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.tratamientos
    ADD CONSTRAINT tratamientos_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.tratamientos DROP CONSTRAINT tratamientos_pkey;
       public            postgres    false    241            �           2606    17088    turnos turnos_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.turnos
    ADD CONSTRAINT turnos_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.turnos DROP CONSTRAINT turnos_pkey;
       public            postgres    false    251            �           1259    16984    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    222            �           1259    16924 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    224            �           1259    16925 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    224            �           1259    16910 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    220            �           1259    16940 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            postgres    false    228            �           1259    16939 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            postgres    false    228            �           1259    16954 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            postgres    false    230            �           1259    16953 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            postgres    false    230            �           1259    16979     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            postgres    false    226            �           1259    17048 $   diainactivos_profesional_id_df2557b0    INDEX     g   CREATE INDEX diainactivos_profesional_id_df2557b0 ON public.diainactivos USING btree (profesional_id);
 8   DROP INDEX public.diainactivos_profesional_id_df2557b0;
       public            postgres    false    245            �           1259    16975 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    232            �           1259    16976 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    232            �           1259    16993 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    233            �           1259    16992 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    233            �           1259    17131 )   historiaclinicas_especialidad_id_58c03191    INDEX     q   CREATE INDEX historiaclinicas_especialidad_id_58c03191 ON public.historiaclinicas USING btree (especialidad_id);
 =   DROP INDEX public.historiaclinicas_especialidad_id_58c03191;
       public            postgres    false    253            �           1259    17132 %   historiaclinicas_paciente_id_a5c779bc    INDEX     i   CREATE INDEX historiaclinicas_paciente_id_a5c779bc ON public.historiaclinicas USING btree (paciente_id);
 9   DROP INDEX public.historiaclinicas_paciente_id_a5c779bc;
       public            postgres    false    253            �           1259    17133 (   historiaclinicas_profesional_id_7b16278d    INDEX     o   CREATE INDEX historiaclinicas_profesional_id_7b16278d ON public.historiaclinicas USING btree (profesional_id);
 <   DROP INDEX public.historiaclinicas_profesional_id_7b16278d;
       public            postgres    false    253            �           1259    17081    pacientes_osocial_id_5d76d25a    INDEX     Y   CREATE INDEX pacientes_osocial_id_5d76d25a ON public.pacientes USING btree (osocial_id);
 1   DROP INDEX public.pacientes_osocial_id_5d76d25a;
       public            postgres    false    249            �           1259    17035 &   profesionales_especialidad_id_d9372328    INDEX     k   CREATE INDEX profesionales_especialidad_id_d9372328 ON public.profesionales USING btree (especialidad_id);
 :   DROP INDEX public.profesionales_especialidad_id_d9372328;
       public            postgres    false    243            �           1259    17066 !   tdiahoras_profesional_id_fab4cc42    INDEX     a   CREATE INDEX tdiahoras_profesional_id_fab4cc42 ON public.tdiahoras USING btree (profesional_id);
 5   DROP INDEX public.tdiahoras_profesional_id_fab4cc42;
       public            postgres    false    247            �           1259    17104    turnos_paciente_id_9a712532    INDEX     U   CREATE INDEX turnos_paciente_id_9a712532 ON public.turnos USING btree (paciente_id);
 /   DROP INDEX public.turnos_paciente_id_9a712532;
       public            postgres    false    251            �           1259    17105    turnos_profesional_id_b4459314    INDEX     [   CREATE INDEX turnos_profesional_id_b4459314 ON public.turnos USING btree (profesional_id);
 2   DROP INDEX public.turnos_profesional_id_b4459314;
       public            postgres    false    251            �           1259    17106    turnos_tratamiento_id_eac99f5e    INDEX     [   CREATE INDEX turnos_tratamiento_id_eac99f5e ON public.turnos USING btree (tratamiento_id);
 2   DROP INDEX public.turnos_tratamiento_id_eac99f5e;
       public            postgres    false    251            �           2606    16919 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    220    4758    224            �           2606    16914 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    222    224    4763            �           2606    16905 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    220    218    4753            �           2606    16934 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    4763    222    228            �           2606    16929 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    228    226    4771            �           2606    16948 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    4758    230    220            �           2606    16943 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    230    4771    226            �           2606    17043 E   diainactivos diainactivos_profesional_id_df2557b0_fk_profesionales_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.diainactivos
    ADD CONSTRAINT diainactivos_profesional_id_df2557b0_fk_profesionales_id FOREIGN KEY (profesional_id) REFERENCES public.profesionales(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.diainactivos DROP CONSTRAINT diainactivos_profesional_id_df2557b0_fk_profesionales_id;
       public          postgres    false    245    243    4805            �           2606    16965 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    232    218    4753            �           2606    16970 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    4771    226    232            �           2606    17116 O   historiaclinicas historiaclinicas_especialidad_id_58c03191_fk_especialidades_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.historiaclinicas
    ADD CONSTRAINT historiaclinicas_especialidad_id_58c03191_fk_especialidades_id FOREIGN KEY (especialidad_id) REFERENCES public.especialidades(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.historiaclinicas DROP CONSTRAINT historiaclinicas_especialidad_id_58c03191_fk_especialidades_id;
       public          postgres    false    253    4796    235            �           2606    17121 F   historiaclinicas historiaclinicas_paciente_id_a5c779bc_fk_pacientes_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.historiaclinicas
    ADD CONSTRAINT historiaclinicas_paciente_id_a5c779bc_fk_pacientes_id FOREIGN KEY (paciente_id) REFERENCES public.pacientes(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.historiaclinicas DROP CONSTRAINT historiaclinicas_paciente_id_a5c779bc_fk_pacientes_id;
       public          postgres    false    253    4814    249            �           2606    17126 M   historiaclinicas historiaclinicas_profesional_id_7b16278d_fk_profesionales_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.historiaclinicas
    ADD CONSTRAINT historiaclinicas_profesional_id_7b16278d_fk_profesionales_id FOREIGN KEY (profesional_id) REFERENCES public.profesionales(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.historiaclinicas DROP CONSTRAINT historiaclinicas_profesional_id_7b16278d_fk_profesionales_id;
       public          postgres    false    243    4805    253            �           2606    17076 :   pacientes pacientes_osocial_id_5d76d25a_fk_obrasociales_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pacientes_osocial_id_5d76d25a_fk_obrasociales_id FOREIGN KEY (osocial_id) REFERENCES public.obrasociales(id) DEFERRABLE INITIALLY DEFERRED;
 d   ALTER TABLE ONLY public.pacientes DROP CONSTRAINT pacientes_osocial_id_5d76d25a_fk_obrasociales_id;
       public          postgres    false    239    4800    249            �           2606    17030 I   profesionales profesionales_especialidad_id_d9372328_fk_especialidades_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.profesionales
    ADD CONSTRAINT profesionales_especialidad_id_d9372328_fk_especialidades_id FOREIGN KEY (especialidad_id) REFERENCES public.especialidades(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.profesionales DROP CONSTRAINT profesionales_especialidad_id_d9372328_fk_especialidades_id;
       public          postgres    false    243    4796    235            �           2606    17061 ?   tdiahoras tdiahoras_profesional_id_fab4cc42_fk_profesionales_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.tdiahoras
    ADD CONSTRAINT tdiahoras_profesional_id_fab4cc42_fk_profesionales_id FOREIGN KEY (profesional_id) REFERENCES public.profesionales(id) DEFERRABLE INITIALLY DEFERRED;
 i   ALTER TABLE ONLY public.tdiahoras DROP CONSTRAINT tdiahoras_profesional_id_fab4cc42_fk_profesionales_id;
       public          postgres    false    4805    247    243            �           2606    17089 2   turnos turnos_paciente_id_9a712532_fk_pacientes_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.turnos
    ADD CONSTRAINT turnos_paciente_id_9a712532_fk_pacientes_id FOREIGN KEY (paciente_id) REFERENCES public.pacientes(id) DEFERRABLE INITIALLY DEFERRED;
 \   ALTER TABLE ONLY public.turnos DROP CONSTRAINT turnos_paciente_id_9a712532_fk_pacientes_id;
       public          postgres    false    4814    249    251            �           2606    17094 9   turnos turnos_profesional_id_b4459314_fk_profesionales_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.turnos
    ADD CONSTRAINT turnos_profesional_id_b4459314_fk_profesionales_id FOREIGN KEY (profesional_id) REFERENCES public.profesionales(id) DEFERRABLE INITIALLY DEFERRED;
 c   ALTER TABLE ONLY public.turnos DROP CONSTRAINT turnos_profesional_id_b4459314_fk_profesionales_id;
       public          postgres    false    251    4805    243            �           2606    17099 8   turnos turnos_tratamiento_id_eac99f5e_fk_tratamientos_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.turnos
    ADD CONSTRAINT turnos_tratamiento_id_eac99f5e_fk_tratamientos_id FOREIGN KEY (tratamiento_id) REFERENCES public.tratamientos(id) DEFERRABLE INITIALLY DEFERRED;
 b   ALTER TABLE ONLY public.turnos DROP CONSTRAINT turnos_tratamiento_id_eac99f5e_fk_tratamientos_id;
       public          postgres    false    251    4802    241            �      x������ � �      �      x������ � �      �   �  x�m�[��0E��*��Q�J�߳��Fp'�Ҁ���w?P.�����S�1�e��'����x;�a������5-MEHw���J����VCI���o���j����/�,~��Ԥ`�Z@�S�E�˂���"�䨸�dy���T�$H�M����>{1Rj���#��D�,x�N���EC�OS6�|��������p��y����tr7����֟�-pi���E2����^�~���D3�I�2Y/.��g敩`ޅaτ���z	S�.Y%D&�-��}���n).$�ES��:X3o��?4�tޤBph�+���O7{ۏKq�;ĥ�!�bo!
dWU>F~IJƿ�]��z��;�钩!5͖� )��T�2������]��&y���r��u�Ԑ�gw쀤�,��ZΓ=Ғ�i?�>�t�2|d�h�ޡ!�ѱrx�ov�Q�<t�7<���[?�n������H�L��q�v@6�� v�`�<�#-�\����MWQ�U*��	`a!��ƑV��0,�IB'�����k�
��p�CX�%�q*�U�2L�p*��y�y�܅�i1�	���)L]����Y'-1�1!��e��]�����'�jyݜ!c�����	I{����N��W}t�C��/c�ә�v      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      ~   �   x�M�Kn�0��a�*�&wɆ����-
$] ��CFW���K��E��ǀ�O��.l�R഑��Z����%$)�b��d���O�����Z�Y��8s�L�����Y�ȏ�Iw��vEǅ[W�c��<�Wm�q�����o�O���'i��
L}m�_v��@�0���S�̅S�? ��Js6      |   q  x���i��0��S���{�2�e'm���:��B'�	!$x��^-@Qu���q��n(!`|�Go�	� �� �EiI�R\|<`a���B0�%M
Z�S��7$Z-���%h��W\�};��=�v�P9P~g�;#ꌭFߵ�\ۋ�>;_EvY�
�K<م�h�&�1�m�>Jp�3J�������]h�0����4��Ԯ�įvQJ
	�V]P�o���~EQ��ˣW
�R�-����=
��� �2��Q�aL����T�]��3V���~M>��f�M2m+�@��)�P�m�Ov���B�i�0��
��dΌ�8���+���j��$���[(\�� ~CYP��M�[M�)b�����3}�~���ܷG#�\g��̀ۤ�>���f�3�Y��r��U�����	t1N��^�XIؼ_�lDh�`G���g�S�����eD�(i2��R̶~�%ʏKD�ˡ���f����w�����ި�W��f�и9y�۴ؾ�R��� $��!�(żN����գ^�*	�J�B!���m��{H��=W�H��b#��*6��?b��<B�9n�h�<�֤����!(f��]���qx[ձO*���Q�J���-��?(8�2      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     