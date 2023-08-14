PGDMP     0    8                {            animodels_v3    15.3    15.3                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16659    animodels_v3    DATABASE     �   CREATE DATABASE animodels_v3 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
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
       public          postgres    false    219                       0    0    animals_animalId_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."animals_animalId_seq" OWNED BY public.animals."animalId";
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
       public          postgres    false    217                       0    0    sessions_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;
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
       public          postgres    false    215                        0    0    users_userId_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."users_userId_seq" OWNED BY public.users."userId";
          public          postgres    false    214            r           2604    25025    animals animalId    DEFAULT     x   ALTER TABLE ONLY public.animals ALTER COLUMN "animalId" SET DEFAULT nextval('public."animals_animalId_seq"'::regclass);
 A   ALTER TABLE public.animals ALTER COLUMN "animalId" DROP DEFAULT;
       public          postgres    false    219    218    219            p           2604    24948    sessions id    DEFAULT     j   ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);
 :   ALTER TABLE public.sessions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            o           2604    24917    users userId    DEFAULT     p   ALTER TABLE ONLY public.users ALTER COLUMN "userId" SET DEFAULT nextval('public."users_userId_seq"'::regclass);
 =   ALTER TABLE public.users ALTER COLUMN "userId" DROP DEFAULT;
       public          postgres    false    214    215    215                      0    25022    animals 
   TABLE DATA           �   COPY public.animals ("animalId", "animalName", description, "hirePrice", "photoMain", contact, available, "authorId", "createdAt", hide) FROM stdin;
    public          postgres    false    219   �#                 0    24945    sessions 
   TABLE DATA           D   COPY public.sessions (id, token, "userId", "createdAt") FROM stdin;
    public          postgres    false    217   �)                 0    24914    users 
   TABLE DATA           Y   COPY public.users ("userId", "userName", cpf, email, tel, "userImage", hash) FROM stdin;
    public          postgres    false    215   I.       !           0    0    animals_animalId_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."animals_animalId_seq"', 10, true);
          public          postgres    false    218            "           0    0    sessions_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.sessions_id_seq', 34, true);
          public          postgres    false    216            #           0    0    users_userId_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."users_userId_seq"', 3, true);
          public          postgres    false    214            �           2606    25030    animals animals_pkey 
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
       public          postgres    false    3193    215    217               �  x��V�r�6�M?�#�xƼ)��L&#�R}�W�&�h@$a� �����ź e�ng���a��b�߱z�UC���`�2^�V`�J5rdۄ�b�(��*a�UH�M���vES�$�����G��ϲ�(�>�X�j�܋�r:9�9�n���Yt�ٍʫ�[��\��s|�d�'?lO��s5��q��nխ�m��ۃs'w'����`F���p��|ӉL�G�3�[ADnh�[�j�|�~ U�b���:���ri5���=ْ*"�中���
ޤZ�Rj���c�n���P�c����9�V� $���$I�*��H��_�
c���C�\4pF��g�ah\�KE	3&��W��Ē젚�Z��:	��&ŝB]��g%W\�~�{ah�V����g>̇C�1�)~T�7r=�wݰc;4�h������~�U���T����.+���)�e�������N���.�8�۟�|�'��`�/&��lɕ/�s]���^Z�o\��_��F�p�EVa�9�����8%D�mӬ,0�p����D���&���.��(UH��0�(�����ޡ3��@��芷�D�v�x�xg0�S��&�Lq�@+P���d���m�X�Y���ֵ�S��mQ���Ag,cH+��B����P_�
8EV�*-#z�S�sXL\U��X\��1S���ۦ�8��\��υ���t��,�(д��o:Gn8��u���u��QD׀{�5��g�J�ЇY�L�U`�Vn#
�0��y��lHJ{ʀ���(�^��}0�����!�th,)��J�T��V�� ���wr�w�.a���o�wt��`&9��
-a�&iF�N�d�������_��JھJ�D���`��?��,}�f}�AA���Ȟ�܇4��v���v����ߍx�^\kI�%�����7z�@�*�:�C;��^��F��{/�h����{�`��<�?��x����q�p�q��Xv�Q�X�U��Zℊ�' �OIEp����g\l��B�Kt�@j�yT:{�|��osZe�^2��7��okֵ��`��`�����������v�?s��������p���C3�(��zJ)\k�W�����`o|�I�!�\�o���IA�[�CO:�`+$���o�kI^t��:�08�xӕZ��
$ ��̱
����Z������nv?p����`��a=}a��wB�4�0(!!2h@h���t��r�7�}����a[S;���{Z��_t��hv�K%Z]��n����G}td��#Cm�%O�Yp����������˦�۽��{�̻fӤ�"_f��{�<�u�4�_ʫ/Ǉ���6���~��R��6����v�y�b$7��\eg�����o8|�߾c9� ��o�wkkk�/��e         v  x�m�K��:D��*�d�/�k�>�����;�_	�E�a1|��-g�.�?TFw-������B������~�ܒ��D�)GГ�c��b}��hz�<v�^�f?��4��r�]"�
�zH��"8�d����hT�|�&�Gh?�{�����%�>O;xr�٢p[Y��K�2B�Ǝ��>J7ťr��#y��2�B-˸4]^�{G߮B_�R�����Cw���A-�S��&>��3��Y_���/w���z̾����)G�����e�ٞ�"�}5��tI�Y��#=4TVً�hW.}i����Q��W#o׫9�Գ�`�]*M�5K>��-�g�._�vS�����LGT�p�n�0�[�k�-�7���[��ڈ�d>h38��,:�B�D]�OU��O~E�v�(�&����=�� �a�xvY�W����[��޼B����h_9KM6�(]-��=�h_V���8�����@�TRl�DO*��H���6�;�"�l��ǲ�s��)�vȎ^��3��=jڿ"rs��S�O��Y�:\�ȽJ�G�@\7 ��ظ��)���\�:�#wA�x��-d��@am�/"vS^*�Ν��1xU�~#�u��`v�K#*���Mz+,�����C��0���ޓ���^��2���N0D���4YOL��ɉ"�M��{I_Vd�|�"1�tUo�W�*A���z_DT4?#�*#��6�>4~�����|�$�%�	@�������LUܟGW��D^�0�&�ħ�a���xg�����$�Z��2�Ix|{N�]��v��Jg<ʘ'�f鱴�w���b�'b��ω����h����,�m���L�U�G�A�."3G9q$/�Kkn�np؃�n�<Q�/~� "y+_`-N�G�-��]��5J'�X�)��y�X���{9I�>�֑���b�l.��������ip�2`�ӎY�-�c������&�mL�>����bG6�ympG���"(b�-�Q�x���i�l����&�|�4`	cR��5�oa���g�u��`m՛0��p�T� "LH������3ѝ��I���B!ҰE/���*Ҿa|��,0{�J��m�<W��'���;�Nh��j�#�Yޠ��I± �7Q�L����/��g1zҲ�v��:��G�y         �  x�]�_��@ş�s���e ��n]��m��j�d3�3��°K�ӗ���I��ɽ��݋�G�L�ς0�b�R�Fa���ڦ{�����gq�M@��-o;�
�� d(�^[�Y��0\�̙�t����Њd�R���ɰy�vhee �f�|�vsHV��Z�����U�&]���e�\�����e�ђc�B�Ҁ"�PaʔG�\�)�B��q+��4B����+�u����򝰨y&;(r>�V��x�I!c�kon$��p<٫L�w��/G���N��������v�9�_�nW���t���|���.uօu�O9eag�o����;��6�F�[[	�S,�(I��{|�����G4�amzmy��̴EU�g��u�Lz���J�_y$��r��&�����s]`�J2}Y,��F�;���W:`���uݿ8i��     