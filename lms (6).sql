-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2019 at 04:37 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.1.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
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
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add association', 7, 'add_association'),
(26, 'Can change association', 7, 'change_association'),
(27, 'Can delete association', 7, 'delete_association'),
(28, 'Can view association', 7, 'view_association'),
(29, 'Can add code', 8, 'add_code'),
(30, 'Can change code', 8, 'change_code'),
(31, 'Can delete code', 8, 'delete_code'),
(32, 'Can view code', 8, 'view_code'),
(33, 'Can add nonce', 9, 'add_nonce'),
(34, 'Can change nonce', 9, 'change_nonce'),
(35, 'Can delete nonce', 9, 'delete_nonce'),
(36, 'Can view nonce', 9, 'view_nonce'),
(37, 'Can add user social auth', 10, 'add_usersocialauth'),
(38, 'Can change user social auth', 10, 'change_usersocialauth'),
(39, 'Can delete user social auth', 10, 'delete_usersocialauth'),
(40, 'Can view user social auth', 10, 'view_usersocialauth'),
(41, 'Can add partial', 11, 'add_partial'),
(42, 'Can change partial', 11, 'change_partial'),
(43, 'Can delete partial', 11, 'delete_partial'),
(44, 'Can view partial', 11, 'view_partial');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, '!8fM4GhfVUuji17sIg0plrAfXfi8fltf4UVMKGc3I', '2019-11-06 03:19:52.719873', 0, '2017.jay.bendre', 'JAY', 'BENDRE', '2017.jay.bendre@ves.ac.in', 0, 1, '2019-10-06 10:55:54.239094'),
(2, '!TWuRJOTVuh0eNHjuqhfVi2fnlektrWWW8dtCRYMx', '2019-10-31 03:25:49.186990', 0, 'jbendre8', 'Jay', 'Bendre', 'jbendre8@gmail.com', 0, 1, '2019-10-31 03:25:49.166049');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `bid` int(11) NOT NULL,
  `book_name` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `genre` varchar(50) NOT NULL,
  `cost` float NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`bid`, `book_name`, `author`, `genre`, `cost`, `quantity`) VALUES
(2, 'The Power of your Subconscious Mind', 'Joseph Murphy', 'Textbook', 99, 10),
(3, 'Indian Polity 5th Edition', 'M Laxmikanth', 'History', 591, 4),
(4, 'The Theory of Everything', 'Stephen Hawking', 'Science', 123, 4),
(5, 'The Monk Who Sold His Ferrari', 'Robin Sharma', 'Philosophy', 135, 5),
(6, 'The Alchemist', 'Paulo Coelho', 'Fiction', 190, 4),
(7, 'Metamorphosis', 'Franz Kafka', 'Philosophy', 41, 1),
(8, 'Assassination Classroom, Vol. 1', 'Yusei Matsui', 'Manga', 352, 3),
(9, 'Death Note Set (Volumes 1-13)', 'Tsugumi Ohba', 'Manga', 3895, 10),
(10, 'Permanent Record', 'Edward Snowden', 'Computer Securtiy', 408, 5),
(11, 'Elon Musk ,The Billionaire CEO', 'Ashlee Vance', 'Autobiography', 403, 5),
(12, 'book12', 'author12', 'Textbook', 1668, 4),
(13, 'book13', 'author13', 'Mystery', 2045, 5),
(14, 'book14', 'author14', 'Comic book', 1382, 0),
(15, 'book15', 'author15', 'Comedy', 2341, 0),
(16, 'book16', 'author16', 'Comic book', 215, 3),
(17, 'book17', 'author17', 'Mystery', 1433, 4),
(18, 'book18', 'author18', 'Science', 1425, 1),
(19, 'book19', 'author19', 'Comic book', 1639, 2),
(20, 'book20', 'author20', 'Mystery', 1912, 1),
(21, 'book21', 'author21', 'Textbook', 2299, 3),
(22, 'book22', 'author22', 'Science', 1894, 4),
(23, 'book23', 'author23', 'Comedy', 2243, 5),
(24, 'book24', 'author24', 'Textbook', 883, 2),
(25, 'book25', 'author25', 'Textbook', 1389, 0),
(26, 'book26', 'author26', 'Mystery', 2411, 2),
(27, 'book27', 'author27', 'Science', 1200, 5),
(28, 'book28', 'author28', 'Comedy', 1418, 3),
(29, 'book29', 'author29', 'Science', 935, 5),
(30, 'book30', 'author30', 'Science', 655, 3),
(31, 'book31', 'author31', 'Comedy', 467, 5),
(32, 'book32', 'author32', 'Comic book', 611, 0),
(33, 'book33', 'author33', 'Textbook', 415, 3),
(34, 'book34', 'author34', 'Textbook', 1094, 3),
(35, 'book35', 'author35', 'Comic book', 1308, 3),
(36, 'book36', 'author36', 'Comic book', 711, 1),
(37, 'book37', 'author37', 'Comedy', 2220, 3),
(38, 'book38', 'author38', 'Textbook', 1647, 4),
(39, 'book39', 'author39', 'Comedy', 241, 5),
(40, 'book40', 'author40', 'Comic book', 1191, 0),
(41, 'book41', 'author41', 'Science', 2436, 5),
(42, 'book42', 'author42', 'Comedy', 1016, 2),
(43, 'book43', 'author43', 'Comedy', 2387, 3),
(44, 'book44', 'author44', 'Comic book', 360, 3),
(45, 'book45', 'author45', 'Comedy', 881, 5),
(46, 'book46', 'author46', 'Comedy', 392, 4),
(47, 'book47', 'author47', 'Comedy', 1494, 5),
(48, 'book48', 'author48', 'Comic book', 948, 1),
(49, 'book49', 'author49', 'Comic book', 396, 0),
(50, 'book50', 'author50', 'Comedy', 266, 5),
(51, 'book51', 'author51', 'Mystery', 1327, 4),
(52, 'book52', 'author52', 'Comedy', 269, 4),
(53, 'book53', 'author53', 'Textbook', 1933, 2),
(54, 'book54', 'author54', 'Mystery', 857, 2),
(55, 'book55', 'author55', 'Comedy', 2464, 4),
(56, 'book56', 'author56', 'Science', 1405, 3),
(57, 'book57', 'author57', 'Science', 237, 0),
(58, 'book58', 'author58', 'Comic book', 898, 5),
(59, 'book59', 'author59', 'Comic book', 1597, 3),
(60, 'book60', 'author60', 'Textbook', 815, 2),
(61, 'book61', 'author61', 'Textbook', 2287, 0),
(62, 'book62', 'author62', 'Science', 2080, 2),
(63, 'book63', 'author63', 'Comedy', 602, 5),
(64, 'book64', 'author64', 'Mystery', 1999, 2),
(65, 'book65', 'author65', 'Textbook', 2454, 5),
(66, 'book66', 'author66', 'Comedy', 689, 2),
(67, 'book67', 'author67', 'Comedy', 1641, 4),
(68, 'book68', 'author68', 'Mystery', 2238, 2),
(69, 'book69', 'author69', 'Science', 170, 1),
(70, 'book70', 'author70', 'Science', 1360, 0),
(71, 'book71', 'author71', 'Mystery', 1176, 5),
(72, 'book72', 'author72', 'Comedy', 834, 2),
(73, 'book73', 'author73', 'Comic book', 2463, 5);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'social_django', 'association'),
(8, 'social_django', 'code'),
(9, 'social_django', 'nonce'),
(11, 'social_django', 'partial'),
(10, 'social_django', 'usersocialauth');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2019-10-06 09:55:35.761086'),
(2, 'auth', '0001_initial', '2019-10-06 09:55:35.920576'),
(3, 'admin', '0001_initial', '2019-10-06 09:55:36.436134'),
(4, 'admin', '0002_logentry_remove_auto_add', '2019-10-06 09:55:36.551316'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2019-10-06 09:55:36.566937'),
(6, 'contenttypes', '0002_remove_content_type_name', '2019-10-06 09:55:36.656492'),
(7, 'auth', '0002_alter_permission_name_max_length', '2019-10-06 09:55:36.672114'),
(8, 'auth', '0003_alter_user_email_max_length', '2019-10-06 09:55:36.713534'),
(9, 'auth', '0004_alter_user_username_opts', '2019-10-06 09:55:36.734475'),
(10, 'auth', '0005_alter_user_last_login_null', '2019-10-06 09:55:36.821243'),
(11, 'auth', '0006_require_contenttypes_0002', '2019-10-06 09:55:36.823414'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2019-10-06 09:55:36.840872'),
(13, 'auth', '0008_alter_user_username_max_length', '2019-10-06 09:55:36.882758'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2019-10-06 09:55:36.910683'),
(15, 'auth', '0010_alter_group_name_max_length', '2019-10-06 09:55:36.938609'),
(16, 'auth', '0011_update_proxy_permissions', '2019-10-06 09:55:36.950577'),
(17, 'sessions', '0001_initial', '2019-10-06 09:55:36.984486'),
(18, 'default', '0001_initial', '2019-10-06 09:55:37.202877'),
(19, 'social_auth', '0001_initial', '2019-10-06 09:55:37.202877'),
(20, 'default', '0002_add_related_name', '2019-10-06 09:55:37.356017'),
(21, 'social_auth', '0002_add_related_name', '2019-10-06 09:55:37.356017'),
(22, 'default', '0003_alter_email_max_length', '2019-10-06 09:55:37.380483'),
(23, 'social_auth', '0003_alter_email_max_length', '2019-10-06 09:55:37.385468'),
(24, 'default', '0004_auto_20160423_0400', '2019-10-06 09:55:37.398435'),
(25, 'social_auth', '0004_auto_20160423_0400', '2019-10-06 09:55:37.403420'),
(26, 'social_auth', '0005_auto_20160727_2333', '2019-10-06 09:55:37.444311'),
(27, 'social_django', '0006_partial', '2019-10-06 09:55:37.483206'),
(28, 'social_django', '0007_code_timestamp', '2019-10-06 09:55:37.544044'),
(29, 'social_django', '0008_partial_timestamp', '2019-10-06 09:56:13.950329'),
(30, 'social_django', '0001_initial', '2019-10-06 09:56:13.974264'),
(31, 'social_django', '0005_auto_20160727_2333', '2019-10-06 09:56:13.980248'),
(32, 'social_django', '0003_alter_email_max_length', '2019-10-06 09:56:13.987229'),
(33, 'social_django', '0002_add_related_name', '2019-10-06 09:56:13.994212'),
(34, 'social_django', '0004_auto_20160423_0400', '2019-10-06 09:56:13.999199');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0aiqu9wo7k2q6jhkkaydaq408bbjaguh', 'ZmYwMzc0MTk0YThiMmU4OTRiOTY3ZGY1ZjE4YTdmZGRhMjE0ODg0ODp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJhYzNCZFV1RncwT1VsM0dPNW8xeUdGTWxqTXFFTzZ2ZyJ9', '2019-10-20 10:55:54.252060'),
('28rqym41wlsueclw649ydppmpjjro7yp', 'MTVhNTE2YzY0OTQxMDM0MWI4MWFhNzc0YTBhYjBiN2RmY2FjOGI1MDp7ImxvZ2luX3N0YXR1cyI6dHJ1ZX0=', '2019-10-29 19:19:19.445155'),
('3a4mhxs5cjkufqk0tdmaayz3b38pmav8', 'YjJjNTQ2M2M1ZGIyYWRkMzQyM2RhNTM1MTBlZWEwYjViYmE2YmJlNjp7ImxvZ2luX3N0YXR1cyI6dHJ1ZSwiZ29vZ2xlLW9hdXRoMl9zdGF0ZSI6Im43OWpZNDIzN2RuWDhTYm5UTWNReUJTcUNRUlBNalFGIiwidWlkIjoxMDAsImVtYWlsIjoiMjAxNy5qYXkuYmVuZHJlQHZlcy5hYy5pbiIsInVzZXJuYW1lIjoiMjAxNy5qYXkuYmVuZHJlQHZlcy5hYy5pbiIsImNhcnRfY291bnQiOjAsImNhcnQiOnt9LCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InNvY2lhbF9jb3JlLmJhY2tlbmRzLmdvb2dsZS5Hb29nbGVPQXV0aDIiLCJfYXV0aF91c2VyX2hhc2giOiJjMzVjYTlhNGFjZmQzYzJiNmUxNmUzYTk3OWM3NzkxN2NkYTFkYTJlIiwic29jaWFsX2F1dGhfbGFzdF9sb2dpbl9iYWNrZW5kIjoiZ29vZ2xlLW9hdXRoMiJ9', '2019-10-24 15:17:24.283259'),
('8jzu0vmq4k3n452upsf0b8flw8p8aeot', 'MTVhNTE2YzY0OTQxMDM0MWI4MWFhNzc0YTBhYjBiN2RmY2FjOGI1MDp7ImxvZ2luX3N0YXR1cyI6dHJ1ZX0=', '2019-11-20 03:31:00.466171'),
('8x9kmb91thsnj4m2bb8ee73ar92fpggf', 'MDk5YmU2ZmMwMmQ3NjQyMDhiM2M3OGIzMWM4ZTM2MDJhYjMwYjVjZTp7ImxvZ2luX3N0YXR1cyI6dHJ1ZSwidWlkIjoxNTIsImVtYWlsIjoiamF5ZGJlbmRyZUB5YWhvby5jb20iLCJ1c2VybmFtZSI6ImpheWRiZW5kcmVAeWFob28uY29tIiwiY2FydCI6e30sImNhcnRfY291bnQiOjB9', '2019-10-26 07:48:50.612090'),
('em87tzaqin90137razxxhbnybue8r2oj', 'MThlNGQ3ZDA5NGQ4Njc5YzYyYzAzYmNkY2Y5NzExZWIyYmVkZDA0ZDp7Imdvb2dsZS1vYXV0aDJfc3RhdGUiOiJOQ0pzcVlLdnpLMnpvcUFHRG55cUY4UU1aUlBsT0VqeSIsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoic29jaWFsX2NvcmUuYmFja2VuZHMuZ29vZ2xlLkdvb2dsZU9BdXRoMiIsIl9hdXRoX3VzZXJfaGFzaCI6ImMzNWNhOWE0YWNmZDNjMmI2ZTE2ZTNhOTc5Yzc3OTE3Y2RhMWRhMmUiLCJzb2NpYWxfYXV0aF9sYXN0X2xvZ2luX2JhY2tlbmQiOiJnb29nbGUtb2F1dGgyIn0=', '2019-10-20 16:50:09.627818');

-- --------------------------------------------------------

--
-- Table structure for table `physical_book_mapping`
--

CREATE TABLE `physical_book_mapping` (
  `phy_id` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  `condition` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `physical_book_mapping`
--

INSERT INTO `physical_book_mapping` (`phy_id`, `bid`, `condition`) VALUES
(10000, 9, 'New'),
(10001, 51, 'New'),
(10002, 8, 'New'),
(10003, 24, 'New'),
(10004, 14, 'New'),
(10005, 27, 'New'),
(10006, 10, 'Fairly Used'),
(10007, 24, 'Fairly Used'),
(10008, 49, 'New'),
(10009, 25, 'New'),
(10010, 25, 'New'),
(10011, 6, 'Fairly Used'),
(10012, 56, 'New'),
(10013, 60, 'New'),
(10014, 72, 'New'),
(10015, 65, 'New'),
(10016, 35, 'Fairly Used'),
(10017, 27, 'Fairly Used'),
(10018, 30, 'Fairly Used'),
(10019, 42, 'Fairly Used'),
(10020, 50, 'Fairly Used'),
(10021, 35, 'Fairly Used'),
(10022, 34, 'Fairly Used'),
(10023, 17, 'Fairly Used'),
(10024, 69, 'New'),
(10025, 68, 'Fairly Used'),
(10026, 32, 'New'),
(10027, 50, 'Fairly Used'),
(10028, 44, 'Fairly Used'),
(10029, 48, 'Fairly Used'),
(10030, 20, 'Fairly Used'),
(10031, 45, 'Fairly Used'),
(10032, 63, 'Fairly Used'),
(10033, 68, 'New'),
(10034, 64, 'Fairly Used'),
(10035, 10, 'Fairly Used'),
(10036, 35, 'Fairly Used'),
(10037, 55, 'New'),
(10038, 36, 'Fairly Used'),
(10039, 25, 'New'),
(10040, 69, 'Fairly Used'),
(10041, 46, 'Fairly Used'),
(10042, 19, 'New'),
(10043, 29, 'Fairly Used'),
(10044, 47, 'New'),
(10045, 67, 'Fairly Used'),
(10046, 48, 'New'),
(10047, 10, 'Fairly Used'),
(10048, 33, 'Fairly Used'),
(10049, 26, 'New'),
(10050, 59, 'Fairly Used'),
(10051, 34, 'Fairly Used'),
(10052, 17, 'New'),
(10053, 34, 'New'),
(10054, 3, 'Fairly Used'),
(10055, 27, 'Fairly Used'),
(10056, 26, 'Fairly Used'),
(10057, 3, 'New'),
(10058, 34, 'Fairly Used'),
(10059, 42, 'New'),
(10060, 54, 'Fairly Used'),
(10061, 66, 'New'),
(10062, 29, 'New'),
(10063, 52, 'Fairly Used'),
(10064, 25, 'Fairly Used'),
(10065, 67, 'Fairly Used'),
(10066, 45, 'New'),
(10067, 60, 'New'),
(10068, 63, 'Fairly Used'),
(10069, 9, 'New'),
(10070, 73, 'New'),
(10071, 3, 'New'),
(10072, 36, 'New'),
(10073, 50, 'Fairly Used'),
(10074, 31, 'New'),
(10075, 38, 'Fairly Used'),
(10076, 56, 'New'),
(10077, 57, 'Fairly Used'),
(10078, 42, 'New'),
(10079, 47, 'New'),
(10080, 31, 'New'),
(10081, 37, 'New'),
(10082, 63, 'Fairly Used'),
(10083, 37, 'Fairly Used'),
(10084, 54, 'Fairly Used'),
(10085, 12, 'Fairly Used'),
(10086, 43, 'Fairly Used'),
(10087, 10, 'New'),
(10088, 37, 'New'),
(10089, 16, 'Fairly Used'),
(10090, 43, 'New'),
(10091, 62, 'Fairly Used'),
(10092, 50, 'Fairly Used'),
(10093, 8, 'Fairly Used'),
(10094, 16, 'New'),
(10095, 38, 'Fairly Used'),
(10096, 5, 'Fairly Used'),
(10097, 35, 'Fairly Used'),
(10098, 21, 'New'),
(10099, 46, 'Fairly Used'),
(10100, 61, 'New'),
(10101, 33, 'Fairly Used'),
(10102, 36, 'Fairly Used'),
(10103, 18, 'Fairly Used'),
(10104, 59, 'Fairly Used'),
(10105, 29, 'New'),
(10106, 21, 'Fairly Used'),
(10107, 49, 'New'),
(10108, 67, 'Fairly Used'),
(10109, 38, 'Fairly Used'),
(10110, 59, 'Fairly Used'),
(10111, 30, 'New'),
(10112, 17, 'New'),
(10113, 13, 'New'),
(10114, 26, 'Fairly Used'),
(10115, 51, 'New'),
(10116, 29, 'New'),
(10117, 21, 'Fairly Used'),
(10118, 55, 'New'),
(10119, 26, 'Fairly Used'),
(10120, 7, 'Fairly Used'),
(10121, 62, 'New'),
(10122, 12, 'New'),
(10123, 61, 'Fairly Used'),
(10124, 42, 'New'),
(10125, 20, 'Fairly Used'),
(10126, 49, 'New'),
(10127, 14, 'New'),
(10128, 50, 'New');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `req_id` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '0:pending;1:accepted;2:rejected'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`req_id`, `bid`, `quantity`, `timestamp`, `status`) VALUES
(1, 13, 12, '2019-10-25 03:38:51', 1),
(2, 11, 31, '2019-10-25 04:13:14', 2),
(3, 18, 18, '2019-10-25 04:19:58', 1),
(4, 3, 12, '2019-10-25 10:45:24', 1),
(5, 7, 12, '2019-10-25 11:13:21', 0),
(6, 5, 10, '2019-10-25 11:21:55', 1),
(7, 9, 3, '2019-11-06 09:00:42', 0);

-- --------------------------------------------------------

--
-- Table structure for table `social_auth_association`
--

CREATE TABLE `social_auth_association` (
  `id` int(11) NOT NULL,
  `server_url` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `issued` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  `assoc_type` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `social_auth_code`
--

CREATE TABLE `social_auth_code` (
  `id` int(11) NOT NULL,
  `email` varchar(254) NOT NULL,
  `code` varchar(32) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `timestamp` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `social_auth_nonce`
--

CREATE TABLE `social_auth_nonce` (
  `id` int(11) NOT NULL,
  `server_url` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `salt` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `social_auth_partial`
--

CREATE TABLE `social_auth_partial` (
  `id` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `next_step` smallint(5) UNSIGNED NOT NULL,
  `backend` varchar(32) NOT NULL,
  `data` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `social_auth_usersocialauth`
--

CREATE TABLE `social_auth_usersocialauth` (
  `id` int(11) NOT NULL,
  `provider` varchar(32) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `social_auth_usersocialauth`
--

INSERT INTO `social_auth_usersocialauth` (`id`, `provider`, `uid`, `extra_data`, `user_id`) VALUES
(1, 'google-oauth2', '2017.jay.bendre@ves.ac.in', '{\"auth_time\": 1573010392, \"expires\": 3599, \"token_type\": \"Bearer\", \"access_token\": \"ya29.ImCvB66rm0_fS_httUfYIkmhSy91Gr8UYBb5FoEt5YzUSq3XmNWq-XD1fURTFKJv683eiDlg-bctO5RmzahfanoctZvNJAENycUsMGG-g3KC_e0c_GfpY9QsBjvASmxcz6M\"}', 1),
(2, 'google-oauth2', 'jbendre8@gmail.com', '{\"auth_time\": 1572492349, \"expires\": 3600, \"token_type\": \"Bearer\", \"access_token\": \"ya29.Il-pBzzd0l1CBaWTGe4ZKYWxpA4Dg1iG0gwzWmNxdMK-X6jKXCfetgrwNGl8t9EDieBJ8bAwEa6A040xZ7-8ARTRsNYYL990IiRriogBRbsS-6q_H5NgjW9FvB_5xUgibQ\"}', 2);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `tid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `type` int(11) NOT NULL COMMENT '0-Issuing 1- Buying 2- Requests',
  `started_at` datetime NOT NULL DEFAULT current_timestamp(),
  `details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`tid`, `uid`, `type`, `started_at`, `details`) VALUES
(1, 117, 2, '0000-00-00 00:00:00', ''),
(2, 100, 1, '2019-07-14 10:36:00', '{\'bid\': [10, 6], \'quantity\': [2, 1], \'rdate\': [], \'total\': 4011.0, \'status\': 0, \'MOP\': \'\'}'),
(3, 136, 2, '0000-00-00 00:00:00', ''),
(4, 100, 0, '2019-09-04 17:06:00', '{\'bid\': [8, 3], \'quantity\': [2, 1], \'rdate\': \'2019-09-11\', \'total\': 4011.0, \'status\': 0, \'MOP\': \'\'}'),
(5, 146, 0, '2019-10-07 00:00:00', '{\'bid\': [5, 2], \'quantity\': [2, 1], \'rdate\': \'2019-08-19\', \'total\': 4011.0, \'status\': 0, \'MOP\': \'\'}'),
(6, 143, 1, '0000-00-00 00:00:00', ''),
(7, 100, 0, '2019-08-12 11:00:00', '{\'bid\': [6, 3], \'quantity\': [2, 1], \'rdate\': \'2019-08-19\', \'total\': 4011.0, \'status\': 0, \'MOP\': \'\'}'),
(8, 113, 2, '0000-00-00 00:00:00', ''),
(9, 100, 0, '2019-11-03 12:27:24', '{\'bid\': [7, 8], \'quantity\': [1, 1], \'rdate\': \'2019-11-10\', \'total\': 4011.0, \'status\': 0, \'MOP\': \'Credit Card\'}'),
(10, 100, 0, '2019-10-24 17:49:58', '{\'bid\': [2, 10], \'quantity\': [1, 1], \'rdate\': \'2019-11-31\', \'total\': 4011.0, \'status\': 0, \'MOP\': \'\'}'),
(11, 116, 2, '0000-00-00 00:00:00', ''),
(12, 100, 1, '2019-10-31 14:45:19', '{\'bid\': [10, 9], \'quantity\': [2, 1], \'rdate\': [], \'total\': 4011.0, \'status\': 0, \'MOP\': \'\'}'),
(13, 129, 1, '0000-00-00 00:00:00', ''),
(14, 131, 1, '0000-00-00 00:00:00', ''),
(15, 111, 0, '2019-10-07 00:00:00', '{\'bid\': [2,9], \'quantity\': [2, 1], \'rdate\': \'2019-08-19\', \'total\': 4011.0, \'status\': 0, \'MOP\': \'\'}'),
(16, 140, 1, '0000-00-00 00:00:00', ''),
(17, 130, 1, '0000-00-00 00:00:00', ''),
(18, 147, 0, '2019-10-07 00:00:00', '{\'bid\': [8, 10], \'quantity\': [2, 1], \'rdate\': \'2019-08-19\', \'total\': 4011.0, \'status\': 0, \'MOP\': \'\'}'),
(19, 121, 0, '0000-00-00 00:00:00', '{\'bid\': [9, 1], \'quantity\': [2, 1], \'rdate\': \'2019-08-19\', \'total\': 4011.0, \'status\': 0, \'MOP\': \'\'}'),
(20, 118, 0, '0000-00-00 00:00:00', '{\'bid\': [4, 3], \'quantity\': [2, 1], \'rdate\': \'2019-08-19\', \'total\': 4011.0, \'status\': 0, \'MOP\': \'\'}'),
(21, 133, 0, '0000-00-00 00:00:00', '{\'bid\': [8, 9], \'quantity\': [2, 1], \'rdate\': \'2019-08-19\', \'total\': 4011.0, \'status\': 0, \'MOP\': \'\'}'),
(22, 139, 2, '0000-00-00 00:00:00', ''),
(23, 130, 1, '0000-00-00 00:00:00', ''),
(24, 136, 0, '0000-00-00 00:00:00', '{\'bid\': [4, 7], \'quantity\': [2, 1], \'rdate\': \'2019-08-19\', \'total\': 4011.0, \'status\': 0, \'MOP\': \'\'}'),
(25, 146, 0, '0000-00-00 00:00:00', '{\'bid\': [2, 7], \'quantity\': [2, 1], \'rdate\': \'2019-08-19\', \'total\': 4011.0, \'status\': 0, \'MOP\': \'\'}'),
(26, 139, 0, '0000-00-00 00:00:00', '{\'bid\': [5, 2], \'quantity\': [2, 1], \'rdate\': \'2019-08-19\', \'total\': 4011.0, \'status\': 0, \'MOP\': \'\'}'),
(27, 148, 0, '0000-00-00 00:00:00', '{\'bid\': [8, 3], \'quantity\': [2, 1], \'rdate\': \'2019-08-19\', \'total\': 4011.0, \'status\': 0, \'MOP\': \'\'}'),
(28, 139, 2, '0000-00-00 00:00:00', ''),
(29, 100, 1, '2019-11-03 16:00:00', '{\'bid\': [7, 3], \'quantity\': [2, 1], \'rdate\': [], \'total\': 4011.0, \'status\': 0, \'MOP\': \'\'}'),
(30, 138, 1, '0000-00-00 00:00:00', ''),
(31, 140, 1, '0000-00-00 00:00:00', ''),
(32, 143, 1, '0000-00-00 00:00:00', ''),
(33, 130, 0, '0000-00-00 00:00:00', '{\'bid\': [6, 5], \'quantity\': [2, 1], \'rdate\': \'2019-08-19\', \'total\': 4011.0, \'status\': 0, \'MOP\': \'\'}'),
(34, 127, 1, '0000-00-00 00:00:00', ''),
(35, 132, 1, '0000-00-00 00:00:00', ''),
(36, 131, 2, '0000-00-00 00:00:00', ''),
(37, 124, 0, '0000-00-00 00:00:00', '{\'bid\': [6, 3], \'quantity\': [2, 1], \'rdate\': \'2019-08-19\', \'total\': 4011.0, \'status\': 0, \'MOP\': \'\'}'),
(38, 100, 1, '2019-11-01 13:27:30', '{\'bid\': [10, 8], \'quantity\': [2, 1], \'rdate\': [], \'total\': 4011.0, \'status\': 0, \'MOP\': \'\'}'),
(39, 142, 1, '0000-00-00 00:00:00', ''),
(40, 149, 0, '0000-00-00 00:00:00', '{\'bid\': [8 ,10], \'quantity\': [2, 1], \'rdate\': \'2019-08-19\', \'total\': 4011.0, \'status\': 0, \'MOP\': \'\'}'),
(41, 114, 0, '0000-00-00 00:00:00', '{\'bid\': [5, 2], \'quantity\': [2, 1], \'rdate\': \'2019-08-19\', \'total\': 4011.0, \'status\': 0, \'MOP\': \'\'}'),
(42, 142, 0, '0000-00-00 00:00:00', '{\'bid\': [5, 2], \'quantity\': [2, 1], \'rdate\': \'2019-08-19\', \'total\': 4011.0, \'status\': 0, \'MOP\': \'\'}'),
(43, 123, 0, '0000-00-00 00:00:00', '{\'bid\': [10, 2], \'quantity\': [2, 1], \'rdate\': \'2019-08-19\', \'total\': 4011.0, \'status\': 0, \'MOP\': \'\'}'),
(44, 147, 2, '0000-00-00 00:00:00', ''),
(45, 126, 0, '0000-00-00 00:00:00', '{\'bid\': [6, 3], \'quantity\': [2, 1], \'rdate\': \'2019-08-19\', \'total\': 4011.0, \'status\': 0, \'MOP\': \'\'}'),
(46, 132, 2, '0000-00-00 00:00:00', ''),
(47, 143, 2, '0000-00-00 00:00:00', ''),
(48, 149, 1, '0000-00-00 00:00:00', ''),
(49, 119, 2, '0000-00-00 00:00:00', ''),
(50, 121, 1, '0000-00-00 00:00:00', ''),
(52, 152, 1, '2019-10-25 01:11:08', '{\'bid\': [2, 20], \'quantity\': [1, 1], \'rdate:\': [], \'total\': 3384.0, \'status\': 0, \'MOP\': \'Credit Card\'}'),
(53, 152, 1, '2019-10-25 01:11:20', '{\'bid\': [2, 20], \'quantity\': [1, 1], \'rdate:\': [], \'total\': 3384.0, \'status\': 0, \'MOP\': \'Wallet\'}'),
(54, 152, 1, '2019-10-25 11:12:11', '{\'bid\': [8, 73], \'quantity\': [1, 1], \'rdate:\': [], \'total\': 4796.0, \'status\': 0, \'MOP\': \'Cash\'}'),
(55, 100, 1, '2019-10-25 11:18:30', '{\'bid\': [2, 3], \'quantity\': [1, 1], \'rdate\': [], \'total\': 4011.0, \'status\': 0, \'MOP\': \'Credit Card\'}'),
(59, 100, 0, '2019-11-05 23:12:55', '{\'bid\': [6], \'quantity\': [1], \'rdate\': \'11/19/2019, 23:12:55\', \'total\': 0.0, \'status\': 0, \'MOP\': \'\'}'),
(66, 100, 0, '2019-11-05 23:28:06', '{\'bid\': [4], \'quantity\': [1], \'rdate\': \'\', \'total\': 123.0, \'status\': 0, \'MOP\': \'\', \'mop\': \'Cash\'}'),
(70, 100, 1, '2019-11-05 23:29:48', '{\'bid\': [6, 7], \'quantity\': [1, 1], \'rdate\': \'\', \'total\': 231.0, \'status\': 0, \'MOP\': \'\', \'mop\': \'Cash\'}'),
(73, 100, 0, '2019-11-05 23:31:48', '{\'bid\': [6], \'quantity\': [1], \'rdate\': \'11/19/2019, 23:31:48\', \'total\': 0.0, \'status\': 0, \'MOP\': \'\'}'),
(74, 100, 1, '2019-11-05 23:31:48', '{\'bid\': [8, 7], \'quantity\': [1, 1], \'rdate\': \'\', \'total\': 393.0, \'status\': 0, \'MOP\': \'\', \'mop\': \'Cash\'}'),
(75, 100, 0, '2019-11-05 23:34:28', '{\'bid\': [8], \'quantity\': [1], \'rdate\': \'11/19/2019, 23:34:28\', \'total\': 0.0, \'status\': 0, \'MOP\': \'\'}'),
(76, 100, 1, '2019-11-05 23:34:46', '{\'bid\': [8], \'quantity\': [1], \'rdate\': \'\', \'total\': 352.0, \'status\': 0, \'MOP\': \'\', \'mop\': \'Cash\'}'),
(77, 100, 0, '2019-11-05 23:35:31', '{\'bid\': [7, 11], \'quantity\': [1, 1], \'rdate\': \'11/19/2019, 23:35:31\', \'total\': 0.0, \'status\': 0, \'MOP\': \'\'}'),
(78, 100, 1, '2019-11-05 23:35:31', '{\'bid\': [3], \'quantity\': [1], \'rdate\': \'\', \'total\': 591.0, \'status\': 0, \'MOP\': \'\', \'mop\': \'Cash\'}'),
(79, 100, 0, '2019-11-06 08:19:37', '{\'bid\': [6], \'quantity\': [1], \'rdate\': \'11/20/2019, 08:19:37\', \'total\': 0.0, \'status\': 0, \'MOP\': \'\'}'),
(80, 100, 1, '2019-11-06 08:19:37', '{\'bid\': [7, 2], \'quantity\': [1, 1], \'rdate\': \'\', \'total\': 140.0, \'status\': 0, \'MOP\': \'\', \'mop\': \'Cash\'}');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uid` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(24) DEFAULT NULL,
  `balance` float NOT NULL DEFAULT 0,
  `details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'details :  {     "address": []     "dept" :      "payment": {        "card_number":         "cvv":         "expiry":        "wallet":       }     "phone_number": [] }',
  `roles` int(1) NOT NULL COMMENT '0-admin,1-mid level admin , 2-user'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`uid`, `email`, `password`, `balance`, `details`, `roles`) VALUES
(100, '2017.jay.bendre@ves.ac.in', 'test', 1777, '{     \"name\" : \"user_name\" ,     \"address\": \"lorem ipsum1\",    \"phone_number\": 1234567 }', 2),
(101, '2017.ayesha.gulrajani@ves.ac.in', 'test', 888, '{     \"name\" : \"mid_admin_name\" ,     \"address\": \"lorem ipsum1\",     \"phone_number\": 12345678 }', 1),
(102, '2017.jatin.acharya@ves.ac.in', 'test', 985, '{\"name\": \"admin_name\", \"address\": \"lorem ipsum1\", \"phone_number\": 1234567}', 0),
(103, '123@test', 'test', 777, '', 2),
(104, 'user104@gmail.com', 'test', 1203, '', 0),
(105, 'user105@gmail.com', 'test', 1453, '', 0),
(106, 'user106@gmail.com', 'test', 1403, '', 0),
(107, 'user107@gmail.com', 'test', 159, '', 0),
(108, 'user108@gmail.com', 'test', 431, '', 0),
(109, 'user109@gmail.com', 'test', 1166, '', 0),
(110, 'user110@gmail.com', 'test', 757, '', 0),
(111, 'user111@gmail.com', 'test', 386, '', 0),
(112, 'user112@gmail.com', 'test', 601, '', 0),
(113, 'user113@gmail.com', 'test', 1225, '', 0),
(114, 'user114@gmail.com', 'test', 1206, '', 0),
(115, 'user115@gmail.com', 'test', 152, '', 0),
(116, 'user116@gmail.com', 'test', 1746, '', 0),
(117, 'user117@gmail.com', 'test', 561, '', 0),
(118, 'user118@gmail.com', 'test', 1162, '', 0),
(119, 'user119@gmail.com', 'test', 330, '', 0),
(120, 'user120@gmail.com', 'test', 1542, '', 0),
(121, 'user121@gmail.com', 'test', 24, '', 0),
(122, 'user122@gmail.com', 'test', 1080, '', 0),
(123, 'user123@gmail.com', 'test', 753, '', 0),
(124, 'user124@gmail.com', 'test', 371, '', 0),
(126, 'user126@gmail.com', 'test', 1217, '', 0),
(127, 'user127@gmail.com', 'test', 1518, '', 0),
(128, 'user128@gmail.com', 'test', 1294, '', 0),
(129, 'user129@gmail.com', 'test', 1563, '', 0),
(130, 'user130@gmail.com', 'test', 141, '', 0),
(131, 'user131@gmail.com', 'test', 959, '', 0),
(132, 'user132@gmail.com', 'test', 1819, '', 0),
(133, 'user133@gmail.com', 'test', 1387, '', 0),
(134, 'user134@gmail.com', 'test', 266, '', 0),
(135, 'user135@gmail.com', 'test', 1918, '', 0),
(136, 'user136@gmail.com', 'test', 1604, '', 0),
(137, 'user137@gmail.com', 'test', 56, '', 0),
(138, 'user138@gmail.com', 'test', 15, '', 0),
(139, 'user139@gmail.com', 'test', 1802, '', 0),
(140, 'user140@gmail.com', 'test', 122, '', 0),
(141, 'user141@gmail.com', 'test', 1182, '', 0),
(142, 'user142@gmail.com', 'test', 1360, '', 0),
(143, 'user143@gmail.com', 'test', 61, '', 0),
(144, 'user144@gmail.com', 'test', 1183, '', 0),
(145, 'user145@gmail.com', 'test', 762, '', 0),
(146, 'user146@gmail.com', 'test', 416, '', 0),
(147, 'user147@gmail.com', 'test', 1194, '', 0),
(148, 'user148@gmail.com', 'test', 743, '', 0),
(149, 'test@test.com', 'test', 1624, '', 0),
(152, 'jaydbendre@yahoo.com', 'test', 0, NULL, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`bid`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `physical_book_mapping`
--
ALTER TABLE `physical_book_mapping`
  ADD PRIMARY KEY (`phy_id`),
  ADD KEY `fk_bid` (`bid`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`req_id`);

--
-- Indexes for table `social_auth_association`
--
ALTER TABLE `social_auth_association`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `social_auth_association_server_url_handle_078befa2_uniq` (`server_url`,`handle`);

--
-- Indexes for table `social_auth_code`
--
ALTER TABLE `social_auth_code`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `social_auth_code_email_code_801b2d02_uniq` (`email`,`code`),
  ADD KEY `social_auth_code_code_a2393167` (`code`);

--
-- Indexes for table `social_auth_nonce`
--
ALTER TABLE `social_auth_nonce`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `social_auth_nonce_server_url_timestamp_salt_f6284463_uniq` (`server_url`,`timestamp`,`salt`);

--
-- Indexes for table `social_auth_partial`
--
ALTER TABLE `social_auth_partial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `social_auth_partial_token_3017fea3` (`token`),
  ADD KEY `social_auth_partial_timestamp_50f2119f` (`timestamp`);

--
-- Indexes for table `social_auth_usersocialauth`
--
ALTER TABLE `social_auth_usersocialauth`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `social_auth_usersocialauth_provider_uid_e6b5e668_uniq` (`provider`,`uid`),
  ADD KEY `social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`tid`),
  ADD KEY `fk_uid` (`uid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `unique_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `physical_book_mapping`
--
ALTER TABLE `physical_book_mapping`
  MODIFY `phy_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10129;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `req_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `social_auth_association`
--
ALTER TABLE `social_auth_association`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_auth_code`
--
ALTER TABLE `social_auth_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_auth_nonce`
--
ALTER TABLE `social_auth_nonce`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_auth_partial`
--
ALTER TABLE `social_auth_partial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `social_auth_usersocialauth`
--
ALTER TABLE `social_auth_usersocialauth`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `physical_book_mapping`
--
ALTER TABLE `physical_book_mapping`
  ADD CONSTRAINT `fk_bid` FOREIGN KEY (`bid`) REFERENCES `books` (`bid`);

--
-- Constraints for table `social_auth_usersocialauth`
--
ALTER TABLE `social_auth_usersocialauth`
  ADD CONSTRAINT `social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `fk_uid` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
