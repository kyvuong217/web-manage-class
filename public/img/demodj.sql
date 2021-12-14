-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 03, 2021 lúc 01:26 PM
-- Phiên bản máy phục vụ: 10.4.16-MariaDB
-- Phiên bản PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `demodj`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_customuser'),
(22, 'Can change user', 6, 'change_customuser'),
(23, 'Can delete user', 6, 'delete_customuser'),
(24, 'Can view user', 6, 'view_customuser'),
(25, 'Can add hoc ky nien khoa', 7, 'add_hockynienkhoa'),
(26, 'Can change hoc ky nien khoa', 7, 'change_hockynienkhoa'),
(27, 'Can delete hoc ky nien khoa', 7, 'delete_hockynienkhoa'),
(28, 'Can view hoc ky nien khoa', 7, 'view_hockynienkhoa'),
(29, 'Can add hoc phan', 8, 'add_hocphan'),
(30, 'Can change hoc phan', 8, 'change_hocphan'),
(31, 'Can delete hoc phan', 8, 'delete_hocphan'),
(32, 'Can view hoc phan', 8, 'view_hocphan'),
(33, 'Can add nhom', 9, 'add_nhom'),
(34, 'Can change nhom', 9, 'change_nhom'),
(35, 'Can delete nhom', 9, 'delete_nhom'),
(36, 'Can view nhom', 9, 'view_nhom'),
(37, 'Can add phong hoc', 10, 'add_phonghoc'),
(38, 'Can change phong hoc', 10, 'change_phonghoc'),
(39, 'Can delete phong hoc', 10, 'delete_phonghoc'),
(40, 'Can view phong hoc', 10, 'view_phonghoc'),
(41, 'Can add sinh vien', 11, 'add_sinhvien'),
(42, 'Can change sinh vien', 11, 'change_sinhvien'),
(43, 'Can delete sinh vien', 11, 'delete_sinhvien'),
(44, 'Can view sinh vien', 11, 'view_sinhvien'),
(45, 'Can add thu', 12, 'add_thu'),
(46, 'Can change thu', 12, 'change_thu'),
(47, 'Can delete thu', 12, 'delete_thu'),
(48, 'Can view thu', 12, 'view_thu'),
(49, 'Can add tiet hoc', 13, 'add_tiethoc'),
(50, 'Can change tiet hoc', 13, 'change_tiethoc'),
(51, 'Can delete tiet hoc', 13, 'delete_tiethoc'),
(52, 'Can view tiet hoc', 13, 'view_tiethoc'),
(53, 'Can add thoi khoa bieu', 14, 'add_thoikhoabieu'),
(54, 'Can change thoi khoa bieu', 14, 'change_thoikhoabieu'),
(55, 'Can delete thoi khoa bieu', 14, 'delete_thoikhoabieu'),
(56, 'Can view thoi khoa bieu', 14, 'view_thoikhoabieu'),
(57, 'Can add quan ly', 15, 'add_quanly'),
(58, 'Can change quan ly', 15, 'change_quanly'),
(59, 'Can delete quan ly', 15, 'delete_quanly'),
(60, 'Can view quan ly', 15, 'view_quanly'),
(61, 'Can add lop hoc phan', 16, 'add_lophocphan'),
(62, 'Can change lop hoc phan', 16, 'change_lophocphan'),
(63, 'Can delete lop hoc phan', 16, 'delete_lophocphan'),
(64, 'Can view lop hoc phan', 16, 'view_lophocphan'),
(65, 'Can add hoc', 17, 'add_hoc'),
(66, 'Can change hoc', 17, 'change_hoc'),
(67, 'Can delete hoc', 17, 'delete_hoc'),
(68, 'Can view hoc', 17, 'view_hoc'),
(69, 'Can add giang vien', 18, 'add_giangvien'),
(70, 'Can change giang vien', 18, 'change_giangvien'),
(71, 'Can delete giang vien', 18, 'delete_giangvien'),
(72, 'Can view giang vien', 18, 'view_giangvien'),
(73, 'Can add diem danh', 19, 'add_diemdanh'),
(74, 'Can change diem danh', 19, 'change_diemdanh'),
(75, 'Can delete diem danh', 19, 'delete_diemdanh'),
(76, 'Can view diem danh', 19, 'view_diemdanh'),
(77, 'Can add day hoc', 20, 'add_dayhoc'),
(78, 'Can change day hoc', 20, 'change_dayhoc'),
(79, 'Can delete day hoc', 20, 'delete_dayhoc'),
(80, 'Can view day hoc', 20, 'view_dayhoc');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(6, 'home', 'customuser'),
(20, 'home', 'dayhoc'),
(19, 'home', 'diemdanh'),
(18, 'home', 'giangvien'),
(17, 'home', 'hoc'),
(7, 'home', 'hockynienkhoa'),
(8, 'home', 'hocphan'),
(16, 'home', 'lophocphan'),
(9, 'home', 'nhom'),
(10, 'home', 'phonghoc'),
(15, 'home', 'quanly'),
(11, 'home', 'sinhvien'),
(14, 'home', 'thoikhoabieu'),
(12, 'home', 'thu'),
(13, 'home', 'tiethoc'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-09-10 04:35:52.594577'),
(2, 'contenttypes', '0002_remove_content_type_name', '2021-09-10 04:35:52.673097'),
(3, 'auth', '0001_initial', '2021-09-10 04:35:52.919091'),
(4, 'auth', '0002_alter_permission_name_max_length', '2021-09-10 04:35:52.976942'),
(5, 'auth', '0003_alter_user_email_max_length', '2021-09-10 04:35:52.988052'),
(6, 'auth', '0004_alter_user_username_opts', '2021-09-10 04:35:53.063867'),
(7, 'auth', '0005_alter_user_last_login_null', '2021-09-10 04:35:53.079602'),
(8, 'auth', '0006_require_contenttypes_0002', '2021-09-10 04:35:53.107789'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2021-09-10 04:35:53.121756'),
(10, 'auth', '0008_alter_user_username_max_length', '2021-09-10 04:35:53.132547'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2021-09-10 04:35:53.141489'),
(12, 'auth', '0010_alter_group_name_max_length', '2021-09-10 04:35:53.168448'),
(13, 'auth', '0011_update_proxy_permissions', '2021-09-10 04:35:53.180330'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2021-09-10 04:35:53.189708'),
(15, 'home', '0001_initial', '2021-09-10 04:35:54.821245'),
(16, 'admin', '0001_initial', '2021-09-10 04:35:54.944975'),
(17, 'admin', '0002_logentry_remove_auto_add', '2021-09-10 04:35:54.961931'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2021-09-10 04:35:54.979881'),
(19, 'sessions', '0001_initial', '2021-09-10 04:35:55.012793');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('62n92rion9rfocy6xk36s04d8x13ym1f', '.eJxVi0EOwjAMBP_iM0K1UzcOR6S-I3KaWKmgRaL0hPg74UaPOzvzhqj7q8Z9K884Z7gAwumfJZ1uZf0d9bGU87jofL82Nq75MI5V1a22JCsGM2IcrIhhckiefY9e1JLvphCEmYoPKQs1j4mTOVV20vVKA3y--S0ykw:1mX428:8Fo4j3K35CCPUD3dMvNfSOJWHgtOEirMmNbb_IM64tw', '2021-10-17 16:08:12.609218'),
('9pbzba8m1obm9kengxslzr99to2zflam', '.eJxVi0EOwjAMBP_iM0K1UzcOR6S-I3KaWKmgRaL0hPg74UaPOzvzhqj7q8Z9K884Z7gAwumfJZ1uZf0d9bGU87jofL82Nq75MI5V1a22JCsGM2IcrIhhckiefY9e1JLvphCEmYoPKQs1j4mTOVV20vVKA3y--S0ykw:1mgpm4:p0PJ7noJbFIh5yMZIfrl5o79Q7Docj46RTdtZSs0E4g', '2021-11-13 14:56:00.896407'),
('lkhbqpu2a28p5gr35wbj4t2iqbuztv5a', '.eJxVi0EOwjAMBP_iM0K1UzcOR6S-I3KaWKmgRaL0hPg74UaPOzvzhqj7q8Z9K884Z7gAwumfJZ1uZf0d9bGU87jofL82Nq75MI5V1a22JCsGM2IcrIhhckiefY9e1JLvphCEmYoPKQs1j4mTOVV20vVKA3y--S0ykw:1mP1Yu:0mF3cGdc8lB66cWP87_BSpKpEHgWVKDFm0S_UntofHk', '2021-09-25 11:52:48.962028');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `home_customuser`
--

CREATE TABLE `home_customuser` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `user_type` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `home_customuser`
--

INSERT INTO `home_customuser` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `user_type`) VALUES
(1, 'pbkdf2_sha256$260000$2VWc5UubMfn6H4dRrqZjd6$8zvpL365YS1tdAqYgo7e706v6dJ1nK8R9mWp5bhtrWE=', '2021-10-30 14:56:00.881448', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2021-09-10 04:36:27.877674', '1'),
(10, 'pbkdf2_sha256$260000$W6JHl34QuWnTfxfnGkOgVG$/0MgN/Y7qAiuqTj2ku4o6ZQV0T2NvWC4K/KjOXA7RU4=', '2021-09-11 08:09:19.951074', 0, 'lecture', '', '', '17092000', 0, 1, '2021-09-11 07:56:45.380680', '2'),
(22, 'pbkdf2_sha256$260000$UrZtXfmriFkiwEYg9Ci7bZ$s059+YA2ofXtrCOHonwfKzFkLZY9SzrBGpa/cIsOYNw=', NULL, 0, '1111111', '', '', '1111111', 0, 1, '2021-09-11 11:59:02.670404', '2');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `home_customuser_groups`
--

CREATE TABLE `home_customuser_groups` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `home_customuser_user_permissions`
--

CREATE TABLE `home_customuser_user_permissions` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `home_dayhoc`
--

CREATE TABLE `home_dayhoc` (
  `id` bigint(20) NOT NULL,
  `gv_ma_id` varchar(8) NOT NULL,
  `hknk_stt_id` int(11) NOT NULL,
  `hp_ma_id` varchar(6) NOT NULL,
  `n_ma_id` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `home_diemdanh`
--

CREATE TABLE `home_diemdanh` (
  `id` bigint(20) NOT NULL,
  `dd_ngay` date NOT NULL,
  `dd_gio` time(6) NOT NULL,
  `dd_thanNhiet` double NOT NULL,
  `ph_ma_id` varchar(4) NOT NULL,
  `sv_ma_id` varchar(8) NOT NULL,
  `th_stt_id` int(11) NOT NULL,
  `thu_stt_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `home_giangvien`
--

CREATE TABLE `home_giangvien` (
  `gv_ma` varchar(8) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `admin_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `home_giangvien`
--

INSERT INTO `home_giangvien` (`gv_ma`, `created_at`, `admin_id`) VALUES
('', '2021-09-11 11:59:02.934145', 22);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `home_hoc`
--

CREATE TABLE `home_hoc` (
  `id` bigint(20) NOT NULL,
  `hknk_stt_id` int(11) NOT NULL,
  `hp_ma_id` varchar(6) NOT NULL,
  `n_ma_id` varchar(3) NOT NULL,
  `sv_ma_id` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `home_hockynienkhoa`
--

CREATE TABLE `home_hockynienkhoa` (
  `hknk_stt` int(11) NOT NULL,
  `hknk_hocky` int(11) NOT NULL,
  `hknk_nienkhoa` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `home_hocphan`
--

CREATE TABLE `home_hocphan` (
  `hp_ma` varchar(6) NOT NULL,
  `hp_ten` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `home_lophocphan`
--

CREATE TABLE `home_lophocphan` (
  `id` bigint(20) NOT NULL,
  `Siso` int(11) NOT NULL,
  `hknk_stt_id` int(11) NOT NULL,
  `hp_ma_id` varchar(6) NOT NULL,
  `n_ma_id` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `home_nhom`
--

CREATE TABLE `home_nhom` (
  `n_ma` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `home_phonghoc`
--

CREATE TABLE `home_phonghoc` (
  `ph_ma` varchar(4) NOT NULL,
  `ph_ten` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `home_quanly`
--

CREATE TABLE `home_quanly` (
  `id` int(11) NOT NULL,
  `ql_ma` varchar(8) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `admin_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `home_quanly`
--

INSERT INTO `home_quanly` (`id`, `ql_ma`, `created_at`, `admin_id`) VALUES
(1, '', '2021-09-10 04:36:28.124016', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `home_sinhvien`
--

CREATE TABLE `home_sinhvien` (
  `sv_ma` varchar(8) NOT NULL,
  `sv_hoTen` varchar(30) NOT NULL,
  `sv_lop` varchar(8) NOT NULL,
  `sv_khoaHoc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `home_sinhvien`
--

INSERT INTO `home_sinhvien` (`sv_ma`, `sv_hoTen`, `sv_lop`, `sv_khoaHoc`) VALUES
('B1809723', 'Nguyen Dang Hanh Nhan', 'DI18V7F1', 44);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `home_thoikhoabieu`
--

CREATE TABLE `home_thoikhoabieu` (
  `id` int(11) NOT NULL,
  `hknk_stt_id` int(11) NOT NULL,
  `hp_ma_id` varchar(6) NOT NULL,
  `n_ma_id` varchar(3) NOT NULL,
  `ph_ma_id` varchar(4) NOT NULL,
  `th_stt_id` int(11) NOT NULL,
  `thu_stt_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `home_thu`
--

CREATE TABLE `home_thu` (
  `thu_stt` int(11) NOT NULL,
  `thu_chiTiet` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `home_tiethoc`
--

CREATE TABLE `home_tiethoc` (
  `th_stt` int(11) NOT NULL,
  `th_thoiLuong` int(11) NOT NULL,
  `th_thoiGianBatDau` time(6) NOT NULL,
  `th_thoiGianKetThuc` time(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Chỉ mục cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Chỉ mục cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_home_customuser_id` (`user_id`);

--
-- Chỉ mục cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Chỉ mục cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Chỉ mục cho bảng `home_customuser`
--
ALTER TABLE `home_customuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Chỉ mục cho bảng `home_customuser_groups`
--
ALTER TABLE `home_customuser_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `home_customuser_groups_customuser_id_group_id_b342dd9a_uniq` (`customuser_id`,`group_id`),
  ADD KEY `home_customuser_groups_group_id_d4a55f72_fk_auth_group_id` (`group_id`);

--
-- Chỉ mục cho bảng `home_customuser_user_permissions`
--
ALTER TABLE `home_customuser_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `home_customuser_user_per_customuser_id_permission_a032181a_uniq` (`customuser_id`,`permission_id`),
  ADD KEY `home_customuser_user_permission_id_d445b84f_fk_auth_perm` (`permission_id`);

--
-- Chỉ mục cho bảng `home_dayhoc`
--
ALTER TABLE `home_dayhoc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `home_dayhoc_gv_ma_id_3719ee29_fk_home_giangvien_gv_ma` (`gv_ma_id`),
  ADD KEY `home_dayhoc_hknk_stt_id_0efbabb4_fk_home_hockynienkhoa_hknk_stt` (`hknk_stt_id`),
  ADD KEY `home_dayhoc_hp_ma_id_1bc0a493_fk_home_hocphan_hp_ma` (`hp_ma_id`),
  ADD KEY `home_dayhoc_n_ma_id_6cf90c1a_fk_home_nhom_n_ma` (`n_ma_id`);

--
-- Chỉ mục cho bảng `home_diemdanh`
--
ALTER TABLE `home_diemdanh`
  ADD PRIMARY KEY (`id`),
  ADD KEY `home_diemdanh_ph_ma_id_00511663_fk_home_phonghoc_ph_ma` (`ph_ma_id`),
  ADD KEY `home_diemdanh_sv_ma_id_eb1f4721_fk_home_sinhvien_sv_ma` (`sv_ma_id`),
  ADD KEY `home_diemdanh_th_stt_id_f9337ce3_fk_home_tiethoc_th_stt` (`th_stt_id`),
  ADD KEY `home_diemdanh_thu_stt_id_4bb51de5_fk_home_thu_thu_stt` (`thu_stt_id`);

--
-- Chỉ mục cho bảng `home_giangvien`
--
ALTER TABLE `home_giangvien`
  ADD PRIMARY KEY (`gv_ma`),
  ADD KEY `home_giangvien_admin_id_231fdd2f_fk_home_customuser_id` (`admin_id`);

--
-- Chỉ mục cho bảng `home_hoc`
--
ALTER TABLE `home_hoc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `home_hoc_hknk_stt_id_aab20c39_fk_home_hockynienkhoa_hknk_stt` (`hknk_stt_id`),
  ADD KEY `home_hoc_hp_ma_id_f0fd9334_fk_home_hocphan_hp_ma` (`hp_ma_id`),
  ADD KEY `home_hoc_n_ma_id_fca982e5_fk_home_nhom_n_ma` (`n_ma_id`),
  ADD KEY `home_hoc_sv_ma_id_70333b8b_fk_home_sinhvien_sv_ma` (`sv_ma_id`);

--
-- Chỉ mục cho bảng `home_hockynienkhoa`
--
ALTER TABLE `home_hockynienkhoa`
  ADD PRIMARY KEY (`hknk_stt`);

--
-- Chỉ mục cho bảng `home_hocphan`
--
ALTER TABLE `home_hocphan`
  ADD PRIMARY KEY (`hp_ma`);

--
-- Chỉ mục cho bảng `home_lophocphan`
--
ALTER TABLE `home_lophocphan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `home_lophocphan_hknk_stt_id_5df3c0ae_fk_home_hock` (`hknk_stt_id`),
  ADD KEY `home_lophocphan_hp_ma_id_7e1b3cf3_fk_home_hocphan_hp_ma` (`hp_ma_id`),
  ADD KEY `home_lophocphan_n_ma_id_5c295a44_fk_home_nhom_n_ma` (`n_ma_id`);

--
-- Chỉ mục cho bảng `home_nhom`
--
ALTER TABLE `home_nhom`
  ADD PRIMARY KEY (`n_ma`);

--
-- Chỉ mục cho bảng `home_phonghoc`
--
ALTER TABLE `home_phonghoc`
  ADD PRIMARY KEY (`ph_ma`);

--
-- Chỉ mục cho bảng `home_quanly`
--
ALTER TABLE `home_quanly`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ql_ma` (`ql_ma`),
  ADD UNIQUE KEY `admin_id` (`admin_id`);

--
-- Chỉ mục cho bảng `home_sinhvien`
--
ALTER TABLE `home_sinhvien`
  ADD PRIMARY KEY (`sv_ma`);

--
-- Chỉ mục cho bảng `home_thoikhoabieu`
--
ALTER TABLE `home_thoikhoabieu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `home_thoikhoabieu_hknk_stt_id_78ec1e0f_fk_home_hock` (`hknk_stt_id`),
  ADD KEY `home_thoikhoabieu_hp_ma_id_3c7326b7_fk_home_hocphan_hp_ma` (`hp_ma_id`),
  ADD KEY `home_thoikhoabieu_n_ma_id_1bb60a49_fk_home_nhom_n_ma` (`n_ma_id`),
  ADD KEY `home_thoikhoabieu_ph_ma_id_056a55af_fk_home_phonghoc_ph_ma` (`ph_ma_id`),
  ADD KEY `home_thoikhoabieu_th_stt_id_76541315_fk_home_tiethoc_th_stt` (`th_stt_id`),
  ADD KEY `home_thoikhoabieu_thu_stt_id_9cf97f07_fk_home_thu_thu_stt` (`thu_stt_id`);

--
-- Chỉ mục cho bảng `home_thu`
--
ALTER TABLE `home_thu`
  ADD PRIMARY KEY (`thu_stt`);

--
-- Chỉ mục cho bảng `home_tiethoc`
--
ALTER TABLE `home_tiethoc`
  ADD PRIMARY KEY (`th_stt`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `home_customuser`
--
ALTER TABLE `home_customuser`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `home_customuser_groups`
--
ALTER TABLE `home_customuser_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `home_customuser_user_permissions`
--
ALTER TABLE `home_customuser_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `home_dayhoc`
--
ALTER TABLE `home_dayhoc`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `home_diemdanh`
--
ALTER TABLE `home_diemdanh`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `home_hoc`
--
ALTER TABLE `home_hoc`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `home_lophocphan`
--
ALTER TABLE `home_lophocphan`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `home_quanly`
--
ALTER TABLE `home_quanly`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `home_thoikhoabieu`
--
ALTER TABLE `home_thoikhoabieu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Các ràng buộc cho bảng `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Các ràng buộc cho bảng `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_home_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `home_customuser` (`id`);

--
-- Các ràng buộc cho bảng `home_customuser_groups`
--
ALTER TABLE `home_customuser_groups`
  ADD CONSTRAINT `home_customuser_grou_customuser_id_34f18930_fk_home_cust` FOREIGN KEY (`customuser_id`) REFERENCES `home_customuser` (`id`),
  ADD CONSTRAINT `home_customuser_groups_group_id_d4a55f72_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Các ràng buộc cho bảng `home_customuser_user_permissions`
--
ALTER TABLE `home_customuser_user_permissions`
  ADD CONSTRAINT `home_customuser_user_customuser_id_8a95c1d3_fk_home_cust` FOREIGN KEY (`customuser_id`) REFERENCES `home_customuser` (`id`),
  ADD CONSTRAINT `home_customuser_user_permission_id_d445b84f_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Các ràng buộc cho bảng `home_dayhoc`
--
ALTER TABLE `home_dayhoc`
  ADD CONSTRAINT `home_dayhoc_gv_ma_id_3719ee29_fk_home_giangvien_gv_ma` FOREIGN KEY (`gv_ma_id`) REFERENCES `home_giangvien` (`gv_ma`),
  ADD CONSTRAINT `home_dayhoc_hknk_stt_id_0efbabb4_fk_home_hockynienkhoa_hknk_stt` FOREIGN KEY (`hknk_stt_id`) REFERENCES `home_hockynienkhoa` (`hknk_stt`),
  ADD CONSTRAINT `home_dayhoc_hp_ma_id_1bc0a493_fk_home_hocphan_hp_ma` FOREIGN KEY (`hp_ma_id`) REFERENCES `home_hocphan` (`hp_ma`),
  ADD CONSTRAINT `home_dayhoc_n_ma_id_6cf90c1a_fk_home_nhom_n_ma` FOREIGN KEY (`n_ma_id`) REFERENCES `home_nhom` (`n_ma`);

--
-- Các ràng buộc cho bảng `home_diemdanh`
--
ALTER TABLE `home_diemdanh`
  ADD CONSTRAINT `home_diemdanh_ph_ma_id_00511663_fk_home_phonghoc_ph_ma` FOREIGN KEY (`ph_ma_id`) REFERENCES `home_phonghoc` (`ph_ma`),
  ADD CONSTRAINT `home_diemdanh_sv_ma_id_eb1f4721_fk_home_sinhvien_sv_ma` FOREIGN KEY (`sv_ma_id`) REFERENCES `home_sinhvien` (`sv_ma`),
  ADD CONSTRAINT `home_diemdanh_th_stt_id_f9337ce3_fk_home_tiethoc_th_stt` FOREIGN KEY (`th_stt_id`) REFERENCES `home_tiethoc` (`th_stt`),
  ADD CONSTRAINT `home_diemdanh_thu_stt_id_4bb51de5_fk_home_thu_thu_stt` FOREIGN KEY (`thu_stt_id`) REFERENCES `home_thu` (`thu_stt`);

--
-- Các ràng buộc cho bảng `home_giangvien`
--
ALTER TABLE `home_giangvien`
  ADD CONSTRAINT `home_giangvien_admin_id_231fdd2f_fk_home_customuser_id` FOREIGN KEY (`admin_id`) REFERENCES `home_customuser` (`id`);

--
-- Các ràng buộc cho bảng `home_hoc`
--
ALTER TABLE `home_hoc`
  ADD CONSTRAINT `home_hoc_hknk_stt_id_aab20c39_fk_home_hockynienkhoa_hknk_stt` FOREIGN KEY (`hknk_stt_id`) REFERENCES `home_hockynienkhoa` (`hknk_stt`),
  ADD CONSTRAINT `home_hoc_hp_ma_id_f0fd9334_fk_home_hocphan_hp_ma` FOREIGN KEY (`hp_ma_id`) REFERENCES `home_hocphan` (`hp_ma`),
  ADD CONSTRAINT `home_hoc_n_ma_id_fca982e5_fk_home_nhom_n_ma` FOREIGN KEY (`n_ma_id`) REFERENCES `home_nhom` (`n_ma`),
  ADD CONSTRAINT `home_hoc_sv_ma_id_70333b8b_fk_home_sinhvien_sv_ma` FOREIGN KEY (`sv_ma_id`) REFERENCES `home_sinhvien` (`sv_ma`);

--
-- Các ràng buộc cho bảng `home_lophocphan`
--
ALTER TABLE `home_lophocphan`
  ADD CONSTRAINT `home_lophocphan_hknk_stt_id_5df3c0ae_fk_home_hock` FOREIGN KEY (`hknk_stt_id`) REFERENCES `home_hockynienkhoa` (`hknk_stt`),
  ADD CONSTRAINT `home_lophocphan_hp_ma_id_7e1b3cf3_fk_home_hocphan_hp_ma` FOREIGN KEY (`hp_ma_id`) REFERENCES `home_hocphan` (`hp_ma`),
  ADD CONSTRAINT `home_lophocphan_n_ma_id_5c295a44_fk_home_nhom_n_ma` FOREIGN KEY (`n_ma_id`) REFERENCES `home_nhom` (`n_ma`);

--
-- Các ràng buộc cho bảng `home_quanly`
--
ALTER TABLE `home_quanly`
  ADD CONSTRAINT `home_quanly_admin_id_aff2799b_fk_home_customuser_id` FOREIGN KEY (`admin_id`) REFERENCES `home_customuser` (`id`);

--
-- Các ràng buộc cho bảng `home_thoikhoabieu`
--
ALTER TABLE `home_thoikhoabieu`
  ADD CONSTRAINT `home_thoikhoabieu_hknk_stt_id_78ec1e0f_fk_home_hock` FOREIGN KEY (`hknk_stt_id`) REFERENCES `home_hockynienkhoa` (`hknk_stt`),
  ADD CONSTRAINT `home_thoikhoabieu_hp_ma_id_3c7326b7_fk_home_hocphan_hp_ma` FOREIGN KEY (`hp_ma_id`) REFERENCES `home_hocphan` (`hp_ma`),
  ADD CONSTRAINT `home_thoikhoabieu_n_ma_id_1bb60a49_fk_home_nhom_n_ma` FOREIGN KEY (`n_ma_id`) REFERENCES `home_nhom` (`n_ma`),
  ADD CONSTRAINT `home_thoikhoabieu_ph_ma_id_056a55af_fk_home_phonghoc_ph_ma` FOREIGN KEY (`ph_ma_id`) REFERENCES `home_phonghoc` (`ph_ma`),
  ADD CONSTRAINT `home_thoikhoabieu_th_stt_id_76541315_fk_home_tiethoc_th_stt` FOREIGN KEY (`th_stt_id`) REFERENCES `home_tiethoc` (`th_stt`),
  ADD CONSTRAINT `home_thoikhoabieu_thu_stt_id_9cf97f07_fk_home_thu_thu_stt` FOREIGN KEY (`thu_stt_id`) REFERENCES `home_thu` (`thu_stt`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
