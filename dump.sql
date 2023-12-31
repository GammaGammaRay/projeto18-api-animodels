PGDMP     '    9                {            animodels_v3    15.3    15.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16659    animodels_v3    DATABASE     �   CREATE DATABASE animodels_v3 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE animodels_v3;
                postgres    false            �            1259    25022    animals    TABLE     �  CREATE TABLE public.animals (
    "animalId" integer NOT NULL,
    "animalName" character varying(50) NOT NULL,
    description text,
    "hirePrice" double precision NOT NULL,
    "photoMain" character varying(256),
    contact character varying(11) NOT NULL,
    available boolean,
    "authorId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    hide boolean
);
    DROP TABLE public.animals;
       public         heap    postgres    false            �            1259    25021    animals_animalId_seq    SEQUENCE     �   CREATE SEQUENCE public."animals_animalId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."animals_animalId_seq";
       public          postgres    false    219                       0    0    animals_animalId_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."animals_animalId_seq" OWNED BY public.animals."animalId";
          public          postgres    false    218            �            1259    24945    sessions    TABLE     �   CREATE TABLE public.sessions (
    id integer NOT NULL,
    token character varying(256) NOT NULL,
    "userId" integer,
    "createdAt" timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.sessions;
       public         heap    postgres    false            �            1259    24944    sessions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.sessions_id_seq;
       public          postgres    false    217                       0    0    sessions_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;
          public          postgres    false    216            �            1259    24914    users    TABLE     3  CREATE TABLE public.users (
    "userId" integer NOT NULL,
    "userName" character varying(50) NOT NULL,
    cpf character varying(11) NOT NULL,
    email character varying(50) NOT NULL,
    tel character varying(11) NOT NULL,
    "userImage" character varying,
    hash character varying(256) NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    24913    users_userId_seq    SEQUENCE     �   CREATE SEQUENCE public."users_userId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public."users_userId_seq";
       public          postgres    false    215                       0    0    users_userId_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."users_userId_seq" OWNED BY public.users."userId";
          public          postgres    false    214            r           2604    25025    animals animalId    DEFAULT     x   ALTER TABLE ONLY public.animals ALTER COLUMN "animalId" SET DEFAULT nextval('public."animals_animalId_seq"'::regclass);
 A   ALTER TABLE public.animals ALTER COLUMN "animalId" DROP DEFAULT;
       public          postgres    false    219    218    219            p           2604    24948    sessions id    DEFAULT     j   ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);
 :   ALTER TABLE public.sessions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            o           2604    24917    users userId    DEFAULT     p   ALTER TABLE ONLY public.users ALTER COLUMN "userId" SET DEFAULT nextval('public."users_userId_seq"'::regclass);
 =   ALTER TABLE public.users ALTER COLUMN "userId" DROP DEFAULT;
       public          postgres    false    214    215    215            �           2606    25030    animals animals_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.animals
    ADD CONSTRAINT animals_pkey PRIMARY KEY ("animalId");
 >   ALTER TABLE ONLY public.animals DROP CONSTRAINT animals_pkey;
       public            postgres    false    219            }           2606    24951    sessions sessions_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_pkey;
       public            postgres    false    217                       2606    24953    sessions sessions_token_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_token_key UNIQUE (token);
 E   ALTER TABLE ONLY public.sessions DROP CONSTRAINT sessions_token_key;
       public            postgres    false    217            u           2606    24925    users users_cpf_key 
   CONSTRAINT     M   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_cpf_key UNIQUE (cpf);
 =   ALTER TABLE ONLY public.users DROP CONSTRAINT users_cpf_key;
       public            postgres    false    215            w           2606    24927    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    215            y           2606    24921    users users_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY ("userId");
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    215            {           2606    24923    users users_userName_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.users
    ADD CONSTRAINT "users_userName_key" UNIQUE ("userName");
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT "users_userName_key";
       public            postgres    false    215            �           2606    25031    animals animals_authorId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.animals
    ADD CONSTRAINT "animals_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES public.users("userId");
 I   ALTER TABLE ONLY public.animals DROP CONSTRAINT "animals_authorId_fkey";
       public          postgres    false    215    3193    219            �           2606    24954    sessions sessions_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users("userId");
 I   ALTER TABLE ONLY public.sessions DROP CONSTRAINT "sessions_userId_fkey";
       public          postgres    false    3193    215    217           