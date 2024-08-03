-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 02, 2024 at 08:58 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u893299518_sms`
--

-- --------------------------------------------------------

--
-- Table structure for table `absences`
--

CREATE TABLE `absences` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `limit` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `age_groups`
--

CREATE TABLE `age_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `min_age` int(11) NOT NULL,
  `max_age` int(11) NOT NULL,
  `classs_id` bigint(20) UNSIGNED NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `age_groups`
--

INSERT INTO `age_groups` (`id`, `name`, `min_age`, `max_age`, `classs_id`, `note`, `created_at`, `updated_at`) VALUES
(1, 'مستجد', 5, 7, 1, NULL, '2024-07-31 00:38:44', '2024-07-31 00:38:44'),
(2, 'معيد', 6, 8, 1, NULL, '2024-07-31 00:39:05', '2024-07-31 00:39:05'),
(3, 'مستجد', 6, 8, 2, NULL, '2024-07-31 00:40:11', '2024-07-31 00:40:11'),
(4, 'معيد', 7, 9, 2, NULL, '2024-07-31 00:40:23', '2024-07-31 00:40:23'),
(5, 'مستجد', 7, 9, 3, NULL, '2024-07-31 00:40:42', '2024-07-31 00:40:42'),
(6, 'معيد', 8, 10, 3, NULL, '2024-07-31 00:40:56', '2024-07-31 00:40:56'),
(7, 'مستجد', 8, 10, 4, NULL, '2024-07-31 00:41:29', '2024-07-31 00:41:29'),
(8, 'معيد', 9, 11, 4, NULL, '2024-07-31 00:41:49', '2024-07-31 00:41:49'),
(9, 'مستجد', 9, 11, 5, NULL, '2024-07-31 14:16:06', '2024-07-31 14:16:06'),
(10, 'معيد', 10, 12, 5, NULL, '2024-07-31 14:16:15', '2024-07-31 14:16:28'),
(11, 'مستجد', 10, 12, 6, NULL, '2024-07-31 14:16:38', '2024-07-31 14:16:38'),
(12, 'معيد', 11, 13, 6, NULL, '2024-07-31 14:16:46', '2024-07-31 14:16:46'),
(13, 'مستجد', 11, 13, 7, NULL, '2024-07-31 14:17:08', '2024-07-31 14:17:08'),
(14, 'معيد', 12, 14, 7, NULL, '2024-07-31 14:17:17', '2024-07-31 14:17:17'),
(15, 'مستجد', 12, 14, 8, NULL, '2024-07-31 14:17:32', '2024-07-31 14:17:32'),
(16, 'معيد', 13, 15, 8, NULL, '2024-07-31 14:17:44', '2024-07-31 14:17:44'),
(17, 'مستجد', 13, 15, 9, NULL, '2024-07-31 14:18:02', '2024-07-31 14:18:02'),
(18, 'معيد', 14, 16, 9, NULL, '2024-07-31 14:18:26', '2024-07-31 14:18:26'),
(19, 'مستجد', 14, 16, 10, NULL, '2024-07-31 14:18:44', '2024-07-31 14:18:44'),
(20, 'معيد', 15, 17, 10, NULL, '2024-07-31 14:18:53', '2024-07-31 14:18:53'),
(21, 'مستجد', 15, 17, 11, NULL, '2024-07-31 14:19:11', '2024-07-31 14:19:11'),
(22, 'معيد', 16, 18, 11, NULL, '2024-07-31 14:19:19', '2024-07-31 14:19:19'),
(23, 'مستجد', 16, 18, 12, NULL, '2024-07-31 14:19:34', '2024-07-31 14:19:34'),
(24, 'معيد', 17, 19, 12, NULL, '2024-07-31 14:19:42', '2024-07-31 14:19:42'),
(25, 'مستجد', 14, 16, 13, NULL, '2024-07-31 14:20:05', '2024-07-31 14:20:05'),
(26, 'معيد', 15, 17, 13, NULL, '2024-07-31 14:20:15', '2024-07-31 14:20:15'),
(27, 'مستجد', 15, 17, 14, NULL, '2024-07-31 14:20:34', '2024-07-31 14:20:34'),
(28, 'معيد', 16, 18, 14, NULL, '2024-07-31 14:20:42', '2024-07-31 14:20:42'),
(29, 'مستجد', 16, 18, 15, NULL, '2024-07-31 14:20:57', '2024-07-31 14:20:57'),
(30, 'معيد', 17, 19, 15, NULL, '2024-07-31 14:21:03', '2024-07-31 14:21:03'),
(31, 'مسجل', 8, 12, 16, NULL, '2024-07-31 14:21:43', '2024-07-31 14:21:43'),
(32, 'مسجل', 9, 13, 17, NULL, '2024-07-31 14:22:47', '2024-07-31 14:22:47'),
(33, 'مسجل', 10, 14, 18, NULL, '2024-07-31 14:23:00', '2024-07-31 14:23:00'),
(34, 'مسجل', 11, 15, 19, NULL, '2024-07-31 14:23:11', '2024-07-31 14:23:11'),
(35, 'مسجل', 3, 6, 20, NULL, '2024-07-31 14:23:54', '2024-07-31 14:23:54'),
(36, 'مسجل', 4, 7, 21, NULL, '2024-07-31 14:24:05', '2024-07-31 14:24:05'),
(37, 'مسجل', 5, 8, 22, NULL, '2024-07-31 14:24:18', '2024-07-31 14:24:18'),
(38, 'مستجد', 14, 17, 23, NULL, '2024-07-31 14:39:43', '2024-07-31 14:39:43'),
(39, 'معيد', 15, 18, 23, NULL, '2024-07-31 15:05:47', '2024-07-31 15:05:47'),
(40, 'مستجد', 15, 18, 24, NULL, '2024-07-31 15:07:28', '2024-07-31 15:07:28'),
(41, 'معيد', 16, 19, 24, NULL, '2024-07-31 15:07:46', '2024-07-31 15:07:46'),
(42, 'مستجد', 16, 19, 25, NULL, '2024-07-31 15:08:54', '2024-07-31 15:08:54'),
(43, 'معيد', 17, 20, 25, NULL, '2024-07-31 15:09:09', '2024-07-31 15:09:09'),
(44, 'مستجد', 14, 17, 26, NULL, '2024-07-31 15:10:25', '2024-07-31 15:10:25'),
(45, 'معيد', 15, 18, 26, NULL, '2024-07-31 15:10:40', '2024-07-31 15:10:40'),
(46, 'مستجد', 15, 18, 27, NULL, '2024-07-31 15:12:45', '2024-07-31 15:12:45'),
(47, 'معيد', 16, 19, 27, NULL, '2024-07-31 15:12:55', '2024-07-31 15:12:55'),
(48, 'مستجد', 16, 19, 28, NULL, '2024-07-31 15:13:55', '2024-07-31 15:13:55'),
(49, 'معيد', 17, 20, 28, NULL, '2024-07-31 15:14:09', '2024-07-31 15:14:09'),
(50, 'مستجد', 14, 17, 29, NULL, '2024-07-31 15:15:39', '2024-07-31 15:15:39'),
(51, 'معيد', 15, 18, 29, NULL, '2024-07-31 15:15:49', '2024-07-31 15:15:49'),
(52, 'مستجد', 15, 18, 30, NULL, '2024-07-31 15:16:47', '2024-07-31 15:16:47'),
(53, 'معيد', 16, 19, 30, NULL, '2024-07-31 15:17:02', '2024-07-31 15:17:02'),
(54, 'مستجد', 16, 19, 31, NULL, '2024-07-31 15:18:08', '2024-07-31 15:18:08'),
(55, 'معيد', 17, 20, 31, NULL, '2024-07-31 15:18:23', '2024-07-31 15:18:23'),
(56, 'مسجل', 17, 21, 32, 'null', '2024-07-31 15:34:47', '2024-07-31 15:36:41'),
(58, 'مسجل', 18, 22, 33, NULL, '2024-07-31 15:36:11', '2024-07-31 15:36:11'),
(59, 'مسجل', 17, 21, 34, NULL, '2024-07-31 15:38:00', '2024-07-31 15:38:00'),
(60, 'مسجل', 18, 22, 35, NULL, '2024-07-31 15:38:42', '2024-07-31 15:38:42'),
(61, 'مسجل', 17, 21, 36, NULL, '2024-07-31 15:40:15', '2024-07-31 15:40:15'),
(62, 'مسجل', 18, 22, 37, NULL, '2024-07-31 15:41:06', '2024-07-31 15:41:06'),
(63, 'مسجل', 17, 21, 38, NULL, '2024-07-31 16:04:06', '2024-07-31 16:04:06'),
(64, 'مسجل', 18, 22, 39, NULL, '2024-07-31 16:04:28', '2024-07-31 16:04:28'),
(65, 'مسجل', 17, 21, 40, NULL, '2024-07-31 16:39:33', '2024-07-31 16:39:33'),
(66, 'مسجل', 18, 22, 41, NULL, '2024-07-31 16:41:45', '2024-07-31 16:41:45');

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `verified_student_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `is_present` tinyint(1) NOT NULL,
  `absence_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blood_types`
--

CREATE TABLE `blood_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(5) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blood_types`
--

INSERT INTO `blood_types` (`id`, `type`, `created_at`, `updated_at`) VALUES
(1, 'O-', NULL, NULL),
(2, 'O+', NULL, NULL),
(3, 'A+', NULL, NULL),
(4, 'A-', NULL, NULL),
(5, 'B+', NULL, NULL),
(6, 'B-', NULL, NULL),
(7, 'AB+', NULL, NULL),
(8, 'AB-', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `url1` varchar(255) DEFAULT NULL,
  `url2` varchar(255) DEFAULT NULL,
  `url3` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `book_verified_student`
--

CREATE TABLE `book_verified_student` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `verified_student_id` bigint(20) UNSIGNED NOT NULL,
  `book_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `building_statuses`
--

CREATE TABLE `building_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `building_statuses`
--

INSERT INTO `building_statuses` (`id`, `status`, `note`, `created_at`, `updated_at`) VALUES
(1, 'ممتازة', NULL, '2024-07-31 01:13:33', '2024-07-31 01:13:33'),
(2, 'متضرر جراء الزلزال', NULL, '2024-07-31 01:13:54', '2024-07-31 01:13:54'),
(3, 'بحاجة صانة دورية', NULL, '2024-07-31 01:14:06', '2024-07-31 01:14:06'),
(4, 'غير متضرر', NULL, '2024-07-31 01:14:18', '2024-07-31 01:14:18');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('04cdeac73be722f4f49c4f8bd84e358d', 'i:1;', 1721817620),
('04cdeac73be722f4f49c4f8bd84e358d:timer', 'i:1721817620;', 1721817620),
('1047b84022ca07757deddf582c8b04b9', 'i:1;', 1721764378),
('1047b84022ca07757deddf582c8b04b9:timer', 'i:1721764378;', 1721764378),
('3053418fac068e347b23a0db81b9766a', 'i:1;', 1722418897),
('3053418fac068e347b23a0db81b9766a:timer', 'i:1722418897;', 1722418897),
('314412d6dbfe2511b13c8a74c5cf4fa5', 'i:1;', 1722333116),
('314412d6dbfe2511b13c8a74c5cf4fa5:timer', 'i:1722333116;', 1722333116),
('382fb07cb9888de5ce52216b442f146d', 'i:1;', 1721730555),
('382fb07cb9888de5ce52216b442f146d:timer', 'i:1721730555;', 1721730555),
('40ce890d9c4dc0a76530566d78887860', 'i:1;', 1722061211),
('40ce890d9c4dc0a76530566d78887860:timer', 'i:1722061211;', 1722061211),
('429195f7a8f214355b2ffa57201f29c6', 'i:1;', 1721660691),
('429195f7a8f214355b2ffa57201f29c6:timer', 'i:1721660691;', 1721660691),
('459117413c3049e6dd16509eb0b36134', 'i:1;', 1721895611),
('459117413c3049e6dd16509eb0b36134:timer', 'i:1721895611;', 1721895611),
('5eb4040558dfc3651a0a2b051290ec5c', 'i:1;', 1721650799),
('5eb4040558dfc3651a0a2b051290ec5c:timer', 'i:1721650799;', 1721650799),
('6776e58f1ff4c2370f07002ba8152700', 'i:2;', 1721815294),
('6776e58f1ff4c2370f07002ba8152700:timer', 'i:1721815294;', 1721815294),
('7d8a17818448b3751362c87107c69d63', 'i:1;', 1721649477),
('7d8a17818448b3751362c87107c69d63:timer', 'i:1721649477;', 1721649477),
('92691e6e0c1637f1f59a9164fdf7a5a5', 'i:1;', 1721815219),
('92691e6e0c1637f1f59a9164fdf7a5a5:timer', 'i:1721815219;', 1721815219),
('9c5d120059c8fd9f2fb6dd16daf55085', 'i:1;', 1722238993),
('9c5d120059c8fd9f2fb6dd16daf55085:timer', 'i:1722238993;', 1722238993),
('a8d821c2757f25fb86f7f911af0a7304', 'i:1;', 1722418912),
('a8d821c2757f25fb86f7f911af0a7304:timer', 'i:1722418912;', 1722418912),
('admin@demo.com|192.168.1.118', 'i:1;', 1722418883),
('admin@demo.com|192.168.1.118:timer', 'i:1722418883;', 1722418883),
('admin@exambe.com|51.158.237.153', 'i:1;', 1721815219),
('admin@exambe.com|51.158.237.153:timer', 'i:1721815219;', 1721815219),
('admin@examble.com|51.158.237.153', 'i:1;', 1721815258),
('admin@examble.com|51.158.237.153:timer', 'i:1721815258;', 1721815258),
('admin@exasdsample.com55616|::1', 'i:1;', 1721649477),
('admin@exasdsample.com55616|::1:timer', 'i:1721649477;', 1721649477),
('admin@exmple.com|192.168.1.118', 'i:1;', 1722418897),
('admin@exmple.com|192.168.1.118:timer', 'i:1722418897;', 1722418897),
('b22c23850a742d9f088a7eb4e5ee1a3b', 'i:1;', 1721732506),
('b22c23850a742d9f088a7eb4e5ee1a3b:timer', 'i:1721732506;', 1721732506),
('bcf6efba2532febe974c36570d454c89', 'i:2;', 1721815233),
('bcf6efba2532febe974c36570d454c89:timer', 'i:1721815233;', 1721815233),
('daniel.elkadi@gmail.com|::1', 'i:1;', 1722333117),
('daniel.elkadi@gmail.com|::1:timer', 'i:1722333117;', 1722333117),
('dd9cabf89e0cababda789800d048a30d', 'i:1;', 1722152546),
('dd9cabf89e0cababda789800d048a30d:timer', 'i:1722152546;', 1722152546),
('e1f75b576b43f5390a87f153a31580a0', 'i:1;', 1722418883),
('e1f75b576b43f5390a87f153a31580a0:timer', 'i:1722418883;', 1722418883),
('e7a2e3fac875f0b29a11ea2c53c77c95', 'i:1;', 1722508887),
('e7a2e3fac875f0b29a11ea2c53c77c95:timer', 'i:1722508887;', 1722508887),
('ef5702bad2dda787ec25e4e74ea7a85b', 'i:1;', 1722603967),
('ef5702bad2dda787ec25e4e74ea7a85b:timer', 'i:1722603967;', 1722603967),
('fca17bae74635d8f2daba86991d399bb', 'i:1;', 1721732733),
('fca17bae74635d8f2daba86991d399bb:timer', 'i:1721732733;', 1721732733),
('settings.custom_css_js', 'O:18:\"App\\Models\\Setting\":32:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:5:{s:2:\"id\";i:12;s:4:\"page\";s:13:\"customization\";s:4:\"name\";s:13:\"custom_css_js\";s:10:\"created_at\";N;s:10:\"updated_at\";N;}s:11:\"\0*\0original\";a:5:{s:2:\"id\";i:12;s:4:\"page\";s:13:\"customization\";s:4:\"name\";s:13:\"custom_css_js\";s:10:\"created_at\";N;s:10:\"updated_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}s:20:\"translatedAttributes\";a:1:{i:0;s:5:\"value\";}s:16:\"\0*\0defaultLocale\";N;}', 1722674017),
('settings.general', 'O:18:\"App\\Models\\Setting\":32:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:5:{s:2:\"id\";i:5;s:4:\"page\";s:7:\"general\";s:4:\"name\";s:7:\"general\";s:10:\"created_at\";N;s:10:\"updated_at\";N;}s:11:\"\0*\0original\";a:5:{s:2:\"id\";i:5;s:4:\"page\";s:7:\"general\";s:4:\"name\";s:7:\"general\";s:10:\"created_at\";N;s:10:\"updated_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}s:20:\"translatedAttributes\";a:1:{i:0;s:5:\"value\";}s:16:\"\0*\0defaultLocale\";N;}', 1722690306),
('settings.others_personalization', 'O:18:\"App\\Models\\Setting\":32:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:5:{s:2:\"id\";i:52;s:4:\"page\";s:15:\"personalization\";s:4:\"name\";s:22:\"others_personalization\";s:10:\"created_at\";N;s:10:\"updated_at\";N;}s:11:\"\0*\0original\";a:5:{s:2:\"id\";i:52;s:4:\"page\";s:15:\"personalization\";s:4:\"name\";s:22:\"others_personalization\";s:10:\"created_at\";N;s:10:\"updated_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}s:20:\"translatedAttributes\";a:1:{i:0;s:5:\"value\";}s:16:\"\0*\0defaultLocale\";N;}', 1722674017),
('settings.page_background', 'O:18:\"App\\Models\\Setting\":32:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:5:{s:2:\"id\";i:14;s:4:\"page\";s:15:\"personalization\";s:4:\"name\";s:15:\"page_background\";s:10:\"created_at\";N;s:10:\"updated_at\";N;}s:11:\"\0*\0original\";a:5:{s:2:\"id\";i:14;s:4:\"page\";s:15:\"personalization\";s:4:\"name\";s:15:\"page_background\";s:10:\"created_at\";N;s:10:\"updated_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}s:20:\"translatedAttributes\";a:1:{i:0;s:5:\"value\";}s:16:\"\0*\0defaultLocale\";N;}', 1722690306),
('settings.security', 'O:18:\"App\\Models\\Setting\":32:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:5:{s:2:\"id\";i:53;s:4:\"page\";s:7:\"general\";s:4:\"name\";s:8:\"security\";s:10:\"created_at\";N;s:10:\"updated_at\";N;}s:11:\"\0*\0original\";a:5:{s:2:\"id\";i:53;s:4:\"page\";s:7:\"general\";s:4:\"name\";s:8:\"security\";s:10:\"created_at\";N;s:10:\"updated_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}s:20:\"translatedAttributes\";a:1:{i:0;s:5:\"value\";}s:16:\"\0*\0defaultLocale\";N;}', 1722671131),
('settings.theme_colors', 'O:18:\"App\\Models\\Setting\":32:{s:13:\"\0*\0connection\";s:5:\"mysql\";s:8:\"\0*\0table\";s:8:\"settings\";s:13:\"\0*\0primaryKey\";s:2:\"id\";s:10:\"\0*\0keyType\";s:3:\"int\";s:12:\"incrementing\";b:1;s:7:\"\0*\0with\";a:0:{}s:12:\"\0*\0withCount\";a:0:{}s:19:\"preventsLazyLoading\";b:0;s:10:\"\0*\0perPage\";i:15;s:6:\"exists\";b:1;s:18:\"wasRecentlyCreated\";b:0;s:28:\"\0*\0escapeWhenCastingToString\";b:0;s:13:\"\0*\0attributes\";a:5:{s:2:\"id\";i:42;s:4:\"page\";s:15:\"personalization\";s:4:\"name\";s:12:\"theme_colors\";s:10:\"created_at\";N;s:10:\"updated_at\";N;}s:11:\"\0*\0original\";a:5:{s:2:\"id\";i:42;s:4:\"page\";s:15:\"personalization\";s:4:\"name\";s:12:\"theme_colors\";s:10:\"created_at\";N;s:10:\"updated_at\";N;}s:10:\"\0*\0changes\";a:0:{}s:8:\"\0*\0casts\";a:0:{}s:17:\"\0*\0classCastCache\";a:0:{}s:21:\"\0*\0attributeCastCache\";a:0:{}s:13:\"\0*\0dateFormat\";N;s:10:\"\0*\0appends\";a:0:{}s:19:\"\0*\0dispatchesEvents\";a:0:{}s:14:\"\0*\0observables\";a:0:{}s:12:\"\0*\0relations\";a:0:{}s:10:\"\0*\0touches\";a:0:{}s:10:\"timestamps\";b:0;s:13:\"usesUniqueIds\";b:0;s:9:\"\0*\0hidden\";a:0:{}s:10:\"\0*\0visible\";a:0:{}s:11:\"\0*\0fillable\";a:0:{}s:10:\"\0*\0guarded\";a:1:{i:0;s:2:\"id\";}s:20:\"translatedAttributes\";a:1:{i:0;s:5:\"value\";}s:16:\"\0*\0defaultLocale\";N;}', 1722674017),
('spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:35:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:14:\"view-dashboard\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:13:\"manage-school\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:11:\"view-grades\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:15:\"view-grade-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:12:\"view-classes\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:15:\"view-class-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:13:\"view-sections\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:17:\"view-section-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:12:\"view-parents\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:16:\"view-parent-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:13:\"view-students\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:17:\"view-student-info\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:11:\"add-student\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:17:\"view-student-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:25:\"manage-student-promotions\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:13:\"add-promotion\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:16;a:4:{s:1:\"a\";i:17;s:1:\"b\";s:19:\"view-promotion-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:17;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:13:\"view-teachers\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:18;a:4:{s:1:\"a\";i:19;s:1:\"b\";s:17:\"view-teacher-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:19;a:4:{s:1:\"a\";i:20;s:1:\"b\";s:13:\"view-subjects\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:20;a:4:{s:1:\"a\";i:21;s:1:\"b\";s:17:\"view-subject-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:21;a:4:{s:1:\"a\";i:22;s:1:\"b\";s:15:\"manage-accounts\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:22;a:4:{s:1:\"a\";i:23;s:1:\"b\";s:13:\"view-invoices\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:23;a:4:{s:1:\"a\";i:24;s:1:\"b\";s:13:\"view-receipts\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:24;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:21:\"manage-processing-fee\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:25;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:15:\"manage-payments\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:26;a:4:{s:1:\"a\";i:27;s:1:\"b\";s:17:\"manage-attendance\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:27;a:4:{s:1:\"a\";i:28;s:1:\"b\";s:15:\"view-attendance\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:28;a:4:{s:1:\"a\";i:29;s:1:\"b\";s:22:\"view-attendance-ratios\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:29;a:4:{s:1:\"a\";i:30;s:1:\"b\";s:12:\"manage-exams\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:30;a:4:{s:1:\"a\";i:31;s:1:\"b\";s:10:\"view-exams\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:31;a:4:{s:1:\"a\";i:32;s:1:\"b\";s:15:\"manage-settings\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:32;a:4:{s:1:\"a\";i:33;s:1:\"b\";s:10:\"view-users\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:33;a:4:{s:1:\"a\";i:34;s:1:\"b\";s:21:\"manage-previous-years\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:34;a:4:{s:1:\"a\";i:35;s:1:\"b\";s:15:\"update-settings\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}}s:5:\"roles\";a:4:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:5:\"admin\";s:1:\"c\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:2;s:1:\"b\";s:7:\"teacher\";s:1:\"c\";s:3:\"web\";}i:2;a:3:{s:1:\"a\";i:3;s:1:\"b\";s:7:\"student\";s:1:\"c\";s:3:\"web\";}i:3;a:3:{s:1:\"a\";i:4;s:1:\"b\";s:14:\"student parent\";s:1:\"c\";s:3:\"web\";}}}', 1722674016);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `camps`
--

CREATE TABLE `camps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `rate` varchar(255) NOT NULL,
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `type_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `camp_locations`
--

CREATE TABLE `camp_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `location` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `camp_types`
--

CREATE TABLE `camp_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `classses`
--

CREATE TABLE `classses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `grade_id` bigint(20) UNSIGNED NOT NULL,
  `class_name_ar` varchar(255) NOT NULL,
  `class_name_en` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `classses`
--

INSERT INTO `classses` (`id`, `grade_id`, `class_name_ar`, `class_name_en`, `created_at`, `updated_at`) VALUES
(1, 1, 'الأول', 'First', '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(2, 1, 'الثاني', 'Second grade', '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(3, 1, 'الثالث', 'Third grade', '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(4, 1, 'الرابع', 'Fourth grade', '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(5, 1, 'الخامس', 'Fifth grade', '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(6, 1, 'السادس', 'Sixth grade', '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(7, 2, 'السابع', 'Seventh grade', '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(8, 2, 'الثامن', 'Eighth grade', '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(9, 2, 'التاسع', 'Ninth grade', '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(10, 69, 'الأول الثانوي العام - الفرع العلمي', 'sc1', '2024-07-22 18:26:35', '2024-08-01 19:59:12'),
(11, 69, 'الثاني الثانوي العام - الفرع العلمي', 'sc2', '2024-07-22 18:26:35', '2024-08-01 19:59:48'),
(12, 69, 'الثالث الثانوي العام - الفرع العلمي', 'sc3', '2024-07-22 18:26:35', '2024-08-01 19:59:58'),
(13, 70, 'الأول الثانوي العام - الفرع الادبي', 'li1', '2024-07-22 18:26:35', '2024-08-01 20:00:06'),
(14, 70, 'الثاني الثانوي العام - الفرع الادبي', 'li2', '2024-07-22 18:26:35', '2024-08-01 20:00:22'),
(15, 70, 'الثالث الثانوي العام - الفرع الادبي', 'li3', '2024-07-22 18:26:35', '2024-08-01 20:00:30'),
(16, 4, 'فئة ب مستوى 1', 'B1', '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(17, 4, 'فئة ب مستوى 2', 'B2', '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(18, 4, 'فئة ب مستوى 3', 'B3', '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(19, 4, 'فئة ب مستوى 4', 'B4', '2024-07-30 23:57:24', '2024-07-30 23:57:24'),
(20, 5, 'فئة أولى', 'KG1', '2024-07-30 23:58:36', '2024-07-30 23:58:36'),
(21, 1, 'فئة ثانية', 'KG2', '2024-07-30 23:59:46', '2024-07-30 23:59:46'),
(22, 1, 'فئة ثالثة', 'KG3', '2024-07-31 00:00:07', '2024-07-31 00:00:07'),
(23, 50, 'الأول الثانوي الصناعي', 'is1', '2024-07-31 14:34:10', '2024-08-01 20:04:42'),
(24, 50, 'الثاني الثانوي الصناعي', 'is2', '2024-07-31 15:06:57', '2024-08-01 20:04:52'),
(25, 50, 'الثالث الثانوي الصناعي', 'is3', '2024-07-31 15:08:36', '2024-08-01 20:05:03'),
(26, 7, 'الأول الثانوي التجاري', 'cs1', '2024-07-31 15:10:08', '2024-07-31 15:10:08'),
(27, 7, 'الثاني الثانوي التجاري', 'cs2', '2024-07-31 15:12:26', '2024-07-31 15:12:26'),
(28, 7, 'الثالث الثانوي التجاري', 'cs3', '2024-07-31 15:13:30', '2024-07-31 15:13:30'),
(29, 48, 'الأول الثانوي النسوي', 'fs1', '2024-07-31 15:15:24', '2024-08-01 20:03:00'),
(30, 48, 'الثاني الثانوي النسوي', 'fs2', '2024-07-31 15:16:29', '2024-08-01 20:03:11'),
(31, 48, 'الثالث الثانوي النسوي', 'fs3', '2024-07-31 15:17:37', '2024-08-01 20:03:26'),
(32, 15, 'سنة أولى معهد صناعي', 'iis1', '2024-07-31 15:34:28', '2024-08-01 20:03:49'),
(33, 15, 'سنة ثانية معهد صناعي', 'iis2', '2024-07-31 15:35:36', '2024-08-01 20:03:58'),
(34, 47, 'سنة أولى معهد تجاري', 'ics1', '2024-07-31 15:37:44', '2024-08-01 20:05:37'),
(35, 47, 'سنة ثانية معهد تجاري', 'ics2', '2024-07-31 15:38:28', '2024-08-01 20:05:44'),
(36, 11, 'سنة أولى معهد نسوي', 'ifs1', '2024-07-31 15:39:26', '2024-07-31 16:43:15'),
(37, 11, 'سنة ثانية معهد نسوي', 'ifs2', '2024-07-31 15:40:49', '2024-07-31 16:43:30'),
(38, 12, 'سنة أولى معهد رياضي', 'iss1', '2024-07-31 16:03:20', '2024-07-31 16:43:46'),
(39, 12, 'سنة ثانية معهد رياضي', 'iss2', '2024-07-31 16:03:47', '2024-07-31 16:44:00'),
(40, 38, 'سنة أولى معهد إعداد مدرسين', 'its1', '2024-07-31 16:39:10', '2024-08-01 20:06:05'),
(41, 38, 'سنة ثانية معهد إعداد مدرسين', 'its2', '2024-07-31 16:40:45', '2024-08-01 20:06:15');

-- --------------------------------------------------------

--
-- Table structure for table `classs_school_years`
--

CREATE TABLE `classs_school_years` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `classs_id` bigint(20) UNSIGNED NOT NULL,
  `school_year_id` bigint(20) UNSIGNED NOT NULL,
  `fall_subject_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `classs_school_years`
--

INSERT INTO `classs_school_years` (`id`, `classs_id`, `school_year_id`, `fall_subject_count`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, '2024-07-22 18:26:35', '2024-07-23 10:31:15'),
(2, 2, 1, 0, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(3, 3, 1, 0, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(4, 4, 1, 0, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(5, 5, 1, 2, '2024-07-22 18:26:35', '2024-07-23 11:49:52'),
(6, 6, 1, 0, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(7, 7, 1, 0, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(8, 8, 1, 0, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(9, 9, 1, 0, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(10, 10, 1, 0, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(11, 11, 1, 0, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(12, 12, 1, 0, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(13, 13, 1, 0, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(14, 14, 1, 0, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(15, 15, 1, 0, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(16, 16, 1, 0, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(17, 17, 1, 0, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(18, 18, 1, 0, '2024-07-22 18:26:35', '2024-07-22 18:26:35');

-- --------------------------------------------------------

--
-- Table structure for table `classs_school_year_details`
--

CREATE TABLE `classs_school_year_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `classs_school_year_id` bigint(20) UNSIGNED NOT NULL,
  `first_term_days` int(11) DEFAULT NULL,
  `second_term_days` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `max_students` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `collaboration_and_activities`
--

CREATE TABLE `collaboration_and_activities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `verified_student_id` bigint(20) UNSIGNED NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `columns`
--

CREATE TABLE `columns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `text_direction` enum('vertical','horizontal') NOT NULL,
  `min_width` int(11) NOT NULL,
  `max_text_width` int(11) NOT NULL,
  `font_size` int(11) NOT NULL,
  `is_active_for_finals` tinyint(1) NOT NULL DEFAULT 0,
  `tableheader_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `term_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_final` tinyint(1) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `columns`
--

INSERT INTO `columns` (`id`, `name`, `text_direction`, `min_width`, `max_text_width`, `font_size`, `is_active_for_finals`, `tableheader_id`, `parent_id`, `term_id`, `is_final`, `order`, `created_at`, `updated_at`) VALUES
(1, 'sdsadsa', 'horizontal', 2321, 21321, 321, 0, 2, NULL, NULL, 0, 0, '2024-08-02 23:08:35', '2024-08-02 23:08:35'),
(2, '321321', 'vertical', 231321, 3213, 321321, 0, 2, 1, NULL, 0, 0, '2024-08-02 23:08:52', '2024-08-02 23:08:52');

-- --------------------------------------------------------

--
-- Table structure for table `common_fields`
--

CREATE TABLE `common_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `common_fields`
--

INSERT INTO `common_fields` (`id`, `name`, `created_at`, `updated_at`) VALUES
(3, 'sadsa', '2024-08-01 23:39:34', '2024-08-01 23:39:34');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'سوريا', '2024-07-30 16:57:03', '2024-07-30 16:57:03');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `year` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `c_s_y_s_detail`
--

CREATE TABLE `c_s_y_s_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `c_s_y_id` bigint(20) UNSIGNED NOT NULL,
  `subject_detail_id` bigint(20) UNSIGNED NOT NULL,
  `is_falling` tinyint(1) NOT NULL DEFAULT 0,
  `order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `c_s_y_s_detail`
--

INSERT INTO `c_s_y_s_detail` (`id`, `c_s_y_id`, `subject_detail_id`, `is_falling`, `order`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, 1, '2024-07-23 10:29:58', '2024-07-23 11:41:58'),
(2, 1, 2, 1, 2, '2024-07-23 10:30:15', '2024-07-23 11:41:58'),
(3, 1, 3, 1, 3, '2024-07-23 10:31:39', '2024-07-23 11:41:58'),
(4, 1, 5, 0, 4, '2024-07-23 11:05:45', '2024-07-23 11:41:58'),
(5, 1, 8, 0, 6, '2024-07-23 11:06:22', '2024-07-23 11:41:58'),
(6, 1, 7, 0, 7, '2024-07-23 11:06:43', '2024-07-23 11:41:58'),
(7, 1, 24, 0, 8, '2024-07-23 11:07:45', '2024-07-23 11:41:58'),
(8, 1, 9, 0, 9, '2024-07-23 11:07:59', '2024-07-23 11:41:58'),
(9, 1, 10, 0, 10, '2024-07-23 11:08:07', '2024-07-23 11:41:58'),
(10, 1, 11, 0, 11, '2024-07-23 11:08:15', '2024-07-23 11:41:58'),
(11, 1, 12, 0, 12, '2024-07-23 11:08:21', '2024-07-23 11:41:58'),
(12, 1, 13, 0, 13, '2024-07-23 11:08:29', '2024-07-23 11:41:58'),
(13, 1, 14, 0, 14, '2024-07-23 11:08:36', '2024-07-23 11:41:58'),
(15, 5, 78, 0, 1, '2024-07-23 11:38:10', '2024-07-28 07:55:46'),
(17, 5, 79, 0, 3, '2024-07-23 11:38:23', '2024-07-28 07:55:53'),
(18, 5, 80, 0, 4, '2024-07-23 11:38:35', '2024-07-28 07:55:46'),
(19, 5, 81, 0, 5, '2024-07-23 11:38:44', '2024-07-28 07:55:46'),
(20, 5, 82, 0, 6, '2024-07-23 11:38:52', '2024-07-28 07:55:46'),
(21, 5, 83, 0, 7, '2024-07-23 11:39:04', '2024-07-28 07:55:46'),
(22, 5, 84, 0, 8, '2024-07-23 11:39:16', '2024-07-28 07:55:46'),
(23, 5, 85, 0, 9, '2024-07-23 11:39:24', '2024-07-28 07:55:46'),
(24, 5, 86, 0, 10, '2024-07-23 11:39:33', '2024-07-28 07:55:46'),
(32, 1, 6, 0, 5, '2024-07-23 11:41:34', '2024-07-23 11:41:58'),
(33, 5, 87, 0, 11, '2024-07-23 11:43:16', '2024-07-28 07:55:46'),
(34, 5, 88, 0, 12, '2024-07-23 11:43:36', '2024-07-28 07:55:46'),
(35, 5, 89, 0, 13, '2024-07-23 11:43:44', '2024-07-28 07:55:46'),
(36, 5, 90, 0, 14, '2024-07-23 11:43:52', '2024-07-28 07:55:46'),
(40, 5, 91, 0, 15, '2024-07-23 11:44:56', '2024-07-28 07:55:46'),
(41, 5, 92, 0, 16, '2024-07-23 11:45:04', '2024-07-28 07:55:46'),
(43, 2, 2, 0, 2, '2024-07-24 06:43:20', '2024-07-24 07:24:18'),
(44, 2, 3, 0, 3, '2024-07-24 06:43:28', '2024-07-24 07:24:18'),
(45, 2, 5, 0, 4, '2024-07-24 06:43:33', '2024-07-24 07:24:18'),
(46, 2, 6, 0, 5, '2024-07-24 06:43:39', '2024-07-24 07:24:18'),
(47, 2, 7, 0, 7, '2024-07-24 06:43:54', '2024-07-24 07:24:18'),
(48, 2, 8, 0, 6, '2024-07-24 06:44:01', '2024-07-24 07:24:18'),
(49, 2, 24, 0, 8, '2024-07-24 06:44:44', '2024-07-24 07:24:18'),
(50, 2, 9, 0, 9, '2024-07-24 06:44:52', '2024-07-24 07:24:18'),
(51, 2, 10, 0, 10, '2024-07-24 06:44:58', '2024-07-24 07:24:18'),
(52, 2, 11, 0, 11, '2024-07-24 06:45:17', '2024-07-24 07:24:18'),
(53, 2, 12, 0, 12, '2024-07-24 06:45:28', '2024-07-24 07:24:18'),
(55, 2, 13, 0, 13, '2024-07-24 06:45:34', '2024-07-24 07:24:18'),
(56, 2, 14, 0, 14, '2024-07-24 06:45:42', '2024-07-24 07:24:18'),
(57, 3, 1, 0, 1, '2024-07-24 06:47:19', '2024-07-25 08:33:28'),
(58, 3, 2, 0, 3, '2024-07-24 06:49:12', '2024-07-25 08:33:28'),
(59, 3, 3, 0, 4, '2024-07-24 06:49:32', '2024-07-25 08:33:28'),
(60, 3, 5, 0, 5, '2024-07-24 07:28:27', '2024-07-25 08:33:28'),
(61, 3, 6, 0, 6, '2024-07-24 07:29:23', '2024-07-25 08:33:28'),
(62, 3, 8, 0, 7, '2024-07-24 07:29:35', '2024-07-25 08:33:28'),
(63, 3, 7, 0, 8, '2024-07-24 07:29:41', '2024-07-25 08:33:28'),
(64, 3, 24, 0, 9, '2024-07-24 07:30:59', '2024-07-25 08:33:28'),
(65, 3, 9, 0, 10, '2024-07-24 07:31:07', '2024-07-25 08:33:28'),
(66, 3, 10, 0, 11, '2024-07-24 07:31:27', '2024-07-25 08:33:28'),
(67, 3, 11, 0, 12, '2024-07-24 07:31:55', '2024-07-25 08:33:28'),
(68, 3, 12, 0, 13, '2024-07-24 07:32:07', '2024-07-25 08:33:28'),
(69, 3, 13, 0, 14, '2024-07-24 07:32:24', '2024-07-25 08:33:28'),
(70, 3, 14, 0, 15, '2024-07-24 07:32:42', '2024-07-25 08:33:28'),
(71, 3, 93, 1, 2, '2024-07-24 08:33:24', '2024-07-25 08:33:28'),
(72, 1, 93, 1, NULL, '2024-07-24 08:33:58', '2024-07-24 08:33:58'),
(77, 4, 93, 0, 15, '2024-07-24 10:00:10', '2024-07-24 10:05:06'),
(78, 4, 1, 0, 1, '2024-07-24 10:00:20', '2024-07-24 10:05:06'),
(79, 4, 2, 0, 2, '2024-07-24 10:00:27', '2024-07-24 10:05:06'),
(80, 4, 3, 0, 3, '2024-07-24 10:00:34', '2024-07-24 10:05:06'),
(81, 4, 5, 0, 4, '2024-07-24 10:00:45', '2024-07-24 10:05:06'),
(82, 4, 6, 0, 5, '2024-07-24 10:00:51', '2024-07-24 10:05:06'),
(83, 4, 8, 0, 6, '2024-07-24 10:00:56', '2024-07-24 10:05:06'),
(84, 4, 7, 0, 7, '2024-07-24 10:01:01', '2024-07-24 10:05:06'),
(85, 4, 24, 0, 8, '2024-07-24 10:02:04', '2024-07-24 10:05:06'),
(86, 4, 9, 0, 9, '2024-07-24 10:02:30', '2024-07-24 10:05:06'),
(87, 4, 10, 0, 10, '2024-07-24 10:02:38', '2024-07-24 10:05:06'),
(88, 4, 11, 0, 11, '2024-07-24 10:03:38', '2024-07-24 10:05:06'),
(89, 4, 12, 0, 12, '2024-07-24 10:04:03', '2024-07-24 10:05:06'),
(90, 4, 13, 0, 13, '2024-07-24 10:04:33', '2024-07-24 10:05:06'),
(91, 4, 14, 0, 14, '2024-07-24 10:04:49', '2024-07-24 10:05:06'),
(93, 6, 78, 0, 1, '2024-07-24 11:24:25', '2024-07-28 08:20:07'),
(94, 6, 79, 0, 3, '2024-07-24 11:24:38', '2024-07-28 08:20:07'),
(95, 6, 80, 0, 4, '2024-07-24 11:24:59', '2024-07-28 08:20:07'),
(98, 6, 81, 0, 5, '2024-07-24 11:25:10', '2024-07-28 08:20:07'),
(99, 6, 82, 0, 6, '2024-07-24 11:25:17', '2024-07-28 08:20:07'),
(100, 6, 83, 0, 7, '2024-07-24 11:25:22', '2024-07-28 08:20:07'),
(101, 6, 84, 0, 8, '2024-07-24 11:25:29', '2024-07-28 08:20:07'),
(102, 6, 85, 0, 9, '2024-07-24 11:25:37', '2024-07-28 08:20:07'),
(103, 6, 86, 0, 10, '2024-07-24 11:25:44', '2024-07-28 08:20:07'),
(104, 6, 87, 0, 11, '2024-07-24 11:25:51', '2024-07-28 08:20:07'),
(105, 6, 88, 0, 12, '2024-07-24 11:25:57', '2024-07-28 08:20:07'),
(106, 6, 89, 0, 13, '2024-07-24 11:26:02', '2024-07-28 08:20:07'),
(107, 6, 91, 0, 14, '2024-07-24 11:26:09', '2024-07-28 08:20:07'),
(108, 6, 14, 0, 15, '2024-07-24 11:26:26', '2024-07-28 08:20:07'),
(109, 7, 16, 1, 1, '2024-07-24 12:22:28', '2024-07-24 12:35:31'),
(111, 7, 17, 1, 2, '2024-07-24 12:22:43', '2024-07-24 12:35:31'),
(112, 7, 18, 1, 3, '2024-07-24 12:22:55', '2024-07-24 12:35:31'),
(114, 7, 19, 1, 4, '2024-07-24 12:23:08', '2024-07-24 12:35:31'),
(116, 7, 20, 1, 5, '2024-07-24 12:23:18', '2024-07-24 12:35:31'),
(118, 7, 21, 1, 6, '2024-07-24 12:23:53', '2024-07-24 12:35:31'),
(119, 7, 22, 1, 8, '2024-07-24 12:24:16', '2024-07-24 12:35:31'),
(121, 7, 23, 1, 9, '2024-07-24 12:24:43', '2024-07-24 12:35:31'),
(122, 7, 25, 1, 10, '2024-07-24 12:25:01', '2024-07-24 12:35:31'),
(123, 7, 26, 1, 11, '2024-07-24 12:25:27', '2024-07-24 12:35:31'),
(126, 7, 27, 1, 12, '2024-07-24 12:26:40', '2024-07-24 12:35:31'),
(127, 7, 28, 1, 13, '2024-07-24 12:27:03', '2024-07-24 12:35:31'),
(128, 7, 29, 1, 14, '2024-07-24 12:27:16', '2024-07-24 12:35:31'),
(129, 7, 75, 1, 7, '2024-07-24 12:29:27', '2024-07-24 12:35:31'),
(131, 8, 16, 1, 1, '2024-07-24 17:02:23', '2024-07-28 10:20:41'),
(132, 8, 17, 1, 2, '2024-07-24 17:02:43', '2024-07-28 10:20:41'),
(133, 8, 18, 1, 3, '2024-07-24 17:03:08', '2024-07-28 10:20:41'),
(134, 8, 19, 1, 4, '2024-07-24 17:03:27', '2024-07-28 10:20:41'),
(135, 8, 20, 1, 5, '2024-07-24 17:03:45', '2024-07-28 10:20:41'),
(136, 8, 21, 1, 6, '2024-07-24 17:04:16', '2024-07-28 10:20:41'),
(137, 8, 22, 1, 8, '2024-07-24 17:05:01', '2024-07-28 10:20:41'),
(138, 8, 23, 1, 9, '2024-07-24 17:05:25', '2024-07-28 10:20:41'),
(139, 8, 25, 1, 10, '2024-07-24 17:05:45', '2024-07-28 10:20:41'),
(140, 8, 26, 1, 11, '2024-07-24 17:06:12', '2024-07-28 10:20:41'),
(141, 8, 27, 1, 12, '2024-07-24 17:06:38', '2024-07-28 10:20:41'),
(142, 8, 28, 1, 13, '2024-07-24 17:06:59', '2024-07-28 10:20:41'),
(143, 8, 29, 1, 14, '2024-07-24 17:07:29', '2024-07-28 10:20:41'),
(144, 8, 75, 1, 7, '2024-07-24 17:07:50', '2024-07-28 10:20:41'),
(146, 2, 1, 0, NULL, '2024-07-25 08:22:37', '2024-07-25 08:22:37'),
(147, 12, 30, 0, 1, '2024-07-25 08:29:37', '2024-07-25 13:13:07'),
(149, 10, 30, 1, 1, '2024-07-25 08:52:49', '2024-07-25 09:46:40'),
(150, 10, 47, 1, 2, '2024-07-25 08:58:50', '2024-07-28 08:30:25'),
(151, 10, 32, 1, 3, '2024-07-25 08:58:59', '2024-07-25 09:46:40'),
(152, 10, 33, 1, 4, '2024-07-25 08:59:24', '2024-07-25 09:46:40'),
(153, 10, 35, 1, 6, '2024-07-25 09:18:48', '2024-07-28 08:32:49'),
(154, 10, 36, 1, 7, '2024-07-25 09:19:06', '2024-07-28 08:33:00'),
(155, 10, 34, 1, 5, '2024-07-25 09:19:26', '2024-07-28 08:32:24'),
(157, 10, 38, 1, 9, '2024-07-25 09:27:32', '2024-07-28 08:36:24'),
(158, 10, 39, 1, 10, '2024-07-25 09:39:02', '2024-07-28 08:33:47'),
(159, 10, 40, 1, 11, '2024-07-25 09:39:38', '2024-07-28 08:33:56'),
(160, 10, 41, 1, 12, '2024-07-25 09:39:46', '2024-07-28 08:34:09'),
(161, 10, 42, 1, 13, '2024-07-25 09:39:57', '2024-07-28 08:34:22'),
(162, 10, 43, 1, 14, '2024-07-25 09:40:07', '2024-07-28 08:34:33'),
(163, 10, 44, 1, 15, '2024-07-25 09:40:19', '2024-07-28 08:34:43'),
(166, 10, 45, 1, 16, '2024-07-25 09:43:10', '2024-07-28 08:34:56'),
(167, 10, 46, 1, 17, '2024-07-25 09:43:22', '2024-07-28 08:35:07'),
(168, 10, 37, 1, 8, '2024-07-25 09:44:22', '2024-07-28 08:33:22'),
(169, 11, 30, 1, 1, '2024-07-25 11:40:11', '2024-07-28 08:38:58'),
(171, 11, 53, 1, 2, '2024-07-25 11:43:10', '2024-07-28 08:39:18'),
(172, 11, 54, 1, 3, '2024-07-25 11:43:25', '2024-07-28 08:39:39'),
(173, 11, 55, 1, 4, '2024-07-25 11:48:56', '2024-07-28 08:39:51'),
(175, 11, 34, 1, 5, '2024-07-25 11:49:11', '2024-07-28 08:40:02'),
(176, 11, 37, 1, 6, '2024-07-25 11:49:32', '2024-07-28 08:40:19'),
(177, 11, 56, 1, 7, '2024-07-25 11:50:29', '2024-07-28 08:40:30'),
(178, 11, 39, 1, 8, '2024-07-25 11:50:44', '2024-07-28 08:40:43'),
(179, 11, 57, 1, 9, '2024-07-25 11:51:10', '2024-07-28 08:41:02'),
(180, 11, 41, 1, 10, '2024-07-25 11:51:27', '2024-07-28 08:41:17'),
(181, 11, 58, 1, 11, '2024-07-25 11:53:27', '2024-07-28 08:41:33'),
(182, 11, 43, 1, 12, '2024-07-25 11:53:48', '2024-07-28 08:41:45'),
(183, 11, 44, 1, 13, '2024-07-25 11:54:09', '2024-07-28 08:42:04'),
(184, 11, 45, 1, 14, '2024-07-25 11:54:48', '2024-07-28 08:42:14'),
(185, 11, 46, 1, 15, '2024-07-25 11:55:36', '2024-07-28 08:42:29'),
(186, 14, 30, 1, 1, '2024-07-25 13:00:10', '2024-07-28 08:47:28'),
(187, 14, 48, 1, 2, '2024-07-25 13:00:25', '2024-07-28 08:47:36'),
(188, 13, 30, 1, 1, '2024-07-25 13:01:13', '2024-07-28 08:43:38'),
(189, 13, 31, 1, 2, '2024-07-25 13:01:27', '2024-07-28 08:43:52'),
(190, 13, 32, 1, 3, '2024-07-25 13:01:37', '2024-07-28 08:44:03'),
(191, 13, 33, 1, 4, '2024-07-25 13:01:57', '2024-07-28 08:44:16'),
(192, 14, 76, 1, 3, '2024-07-25 13:02:07', '2024-07-28 08:47:43'),
(193, 13, 34, 1, 5, '2024-07-25 13:02:12', '2024-07-28 08:44:26'),
(194, 13, 35, 1, 6, '2024-07-25 13:02:20', '2024-07-28 08:44:40'),
(195, 13, 36, 1, 7, '2024-07-25 13:02:30', '2024-07-28 08:44:55'),
(196, 13, 37, 1, 8, '2024-07-25 13:02:40', '2024-07-28 08:45:09'),
(197, 14, 33, 1, 4, '2024-07-25 13:02:48', '2024-07-28 08:48:37'),
(199, 13, 38, 1, 9, '2024-07-25 13:02:50', '2024-07-28 08:45:27'),
(200, 13, 39, 1, 10, '2024-07-25 13:02:59', '2024-07-28 08:45:45'),
(201, 13, 40, 1, 11, '2024-07-25 13:03:11', '2024-07-28 08:46:03'),
(202, 13, 41, 1, 12, '2024-07-25 13:03:17', '2024-07-28 08:46:12'),
(203, 14, 34, 1, 5, '2024-07-25 13:03:24', '2024-07-28 08:48:52'),
(204, 13, 42, 1, 13, '2024-07-25 13:03:27', '2024-07-28 08:46:20'),
(206, 13, 43, 1, 14, '2024-07-25 13:03:56', '2024-07-28 08:46:30'),
(207, 14, 49, 1, 6, '2024-07-25 13:03:58', '2024-07-28 08:49:08'),
(208, 13, 44, 1, 15, '2024-07-25 13:04:09', '2024-07-28 08:46:39'),
(209, 14, 50, 1, 7, '2024-07-25 13:04:10', '2024-07-28 08:49:16'),
(214, 13, 45, 1, 16, '2024-07-25 13:04:32', '2024-07-28 08:46:51'),
(215, 14, 51, 1, 8, '2024-07-25 13:04:32', '2024-07-28 08:49:30'),
(216, 13, 46, 1, 17, '2024-07-25 13:04:40', '2024-07-28 08:47:02'),
(217, 14, 52, 1, 9, '2024-07-25 13:04:55', '2024-07-28 08:49:47'),
(218, 14, 39, 1, 10, '2024-07-25 13:06:09', '2024-07-28 08:49:59'),
(219, 14, 43, 1, 11, '2024-07-25 13:06:38', '2024-07-28 08:50:10'),
(220, 14, 44, 1, 12, '2024-07-25 13:07:28', '2024-07-28 08:50:17'),
(221, 14, 45, 1, 13, '2024-07-25 13:08:36', '2024-07-28 08:50:26'),
(222, 14, 46, 1, 14, '2024-07-25 13:08:50', '2024-07-28 08:50:33'),
(223, 12, 53, 0, 2, '2024-07-25 13:09:26', '2024-07-25 13:13:07'),
(224, 15, 30, 0, 1, '2024-07-25 13:09:30', '2024-07-25 13:12:54'),
(225, 12, 46, 0, 11, '2024-07-25 13:09:52', '2024-07-25 13:13:07'),
(226, 12, 44, 0, 10, '2024-07-25 13:10:01', '2024-07-25 13:13:07'),
(227, 15, 48, 0, 2, '2024-07-25 13:10:09', '2024-07-25 13:12:54'),
(228, 12, 58, 0, 9, '2024-07-25 13:10:20', '2024-07-25 13:13:07'),
(229, 15, 76, 0, 3, '2024-07-25 13:10:24', '2024-07-25 13:12:54'),
(230, 15, 59, 0, 4, '2024-07-25 13:10:36', '2024-07-25 13:12:54'),
(231, 12, 41, 0, 8, '2024-07-25 13:10:36', '2024-07-25 13:13:07'),
(232, 15, 34, 0, 5, '2024-07-25 13:10:54', '2024-07-25 13:12:54'),
(233, 12, 57, 0, 7, '2024-07-25 13:10:56', '2024-07-25 13:13:07'),
(234, 12, 56, 0, 6, '2024-07-25 13:11:04', '2024-07-25 13:13:07'),
(235, 15, 49, 0, 6, '2024-07-25 13:11:06', '2024-07-25 13:12:54'),
(236, 12, 34, 0, 5, '2024-07-25 13:11:15', '2024-07-25 13:13:07'),
(237, 15, 50, 0, 7, '2024-07-25 13:11:15', '2024-07-25 13:12:54'),
(238, 15, 60, 0, 8, '2024-07-25 13:11:27', '2024-07-25 13:12:54'),
(239, 15, 44, 0, 9, '2024-07-25 13:11:43', '2024-07-25 13:12:54'),
(240, 12, 33, 0, 4, '2024-07-25 13:11:44', '2024-07-25 13:13:07'),
(241, 15, 46, 0, 10, '2024-07-25 13:12:00', '2024-07-25 13:12:54'),
(242, 12, 54, 0, 3, '2024-07-25 13:12:00', '2024-07-25 13:13:07'),
(243, 16, 61, 0, 1, '2024-07-26 17:49:51', '2024-07-26 18:27:36'),
(245, 16, 62, 1, 2, '2024-07-26 17:50:12', '2024-07-26 19:46:24'),
(246, 16, 63, 1, 3, '2024-07-26 17:50:29', '2024-07-26 19:46:34'),
(247, 16, 64, 0, 4, '2024-07-26 17:50:52', '2024-07-26 18:02:57'),
(248, 16, 65, 0, 5, '2024-07-26 17:51:11', '2024-07-26 18:02:57'),
(249, 16, 66, 0, 6, '2024-07-26 17:51:34', '2024-07-26 18:02:57'),
(250, 16, 67, 0, 7, '2024-07-26 17:51:47', '2024-07-26 18:02:57'),
(251, 16, 68, 0, 8, '2024-07-26 17:52:27', '2024-07-26 18:02:57'),
(252, 16, 69, 0, 9, '2024-07-26 17:53:01', '2024-07-26 18:02:57'),
(253, 16, 70, 0, 10, '2024-07-26 17:53:27', '2024-07-26 18:02:57'),
(254, 16, 71, 0, 11, '2024-07-26 17:54:07', '2024-07-26 18:02:57'),
(255, 16, 72, 0, 12, '2024-07-26 17:54:27', '2024-07-26 18:02:57'),
(256, 16, 73, 0, 13, '2024-07-26 17:54:34', '2024-07-26 18:02:57'),
(257, 16, 74, 0, 14, '2024-07-26 17:54:48', '2024-07-26 18:02:57'),
(258, 17, 61, 0, 1, '2024-07-26 18:03:40', '2024-07-27 08:46:00'),
(259, 17, 62, 1, 2, '2024-07-26 18:03:50', '2024-07-27 08:46:00'),
(260, 17, 63, 1, 3, '2024-07-26 18:03:59', '2024-07-27 08:46:00'),
(261, 17, 64, 0, 4, '2024-07-26 18:04:15', '2024-07-27 08:46:00'),
(262, 17, 65, 0, 5, '2024-07-26 18:04:27', '2024-07-27 08:46:00'),
(263, 17, 66, 0, 6, '2024-07-26 18:04:36', '2024-07-27 08:46:00'),
(264, 17, 67, 0, 7, '2024-07-26 18:04:46', '2024-07-27 08:46:00'),
(265, 17, 68, 0, 8, '2024-07-26 18:04:55', '2024-07-27 08:46:00'),
(266, 17, 69, 0, 9, '2024-07-26 18:05:08', '2024-07-27 08:46:00'),
(267, 17, 70, 0, 10, '2024-07-26 18:05:41', '2024-07-27 08:46:00'),
(268, 17, 71, 0, 11, '2024-07-26 18:06:35', '2024-07-27 08:46:00'),
(269, 17, 72, 0, 12, '2024-07-26 18:07:03', '2024-07-27 08:46:00'),
(270, 17, 73, 0, 13, '2024-07-26 18:07:13', '2024-07-27 08:46:00'),
(271, 17, 74, 0, 14, '2024-07-26 18:07:22', '2024-07-27 08:46:00'),
(272, 18, 61, 0, 1, '2024-07-26 18:13:55', '2024-07-28 08:55:33'),
(273, 18, 62, 0, 2, '2024-07-26 18:14:07', '2024-07-28 08:55:33'),
(274, 18, 63, 0, 3, '2024-07-26 18:14:16', '2024-07-28 08:55:33'),
(275, 18, 64, 0, 4, '2024-07-26 18:14:29', '2024-07-28 08:55:33'),
(276, 18, 65, 0, 5, '2024-07-26 18:14:37', '2024-07-28 08:55:33'),
(277, 18, 66, 0, 6, '2024-07-26 18:14:48', '2024-07-28 08:55:33'),
(278, 18, 67, 0, 7, '2024-07-26 18:16:06', '2024-07-28 08:55:33'),
(279, 18, 68, 0, 8, '2024-07-26 18:16:18', '2024-07-28 08:55:33'),
(280, 18, 69, 0, 9, '2024-07-26 18:16:35', '2024-07-28 08:55:33'),
(281, 18, 70, 0, 10, '2024-07-26 18:16:57', '2024-07-28 08:55:33'),
(282, 18, 71, 0, 11, '2024-07-26 18:17:05', '2024-07-28 08:55:33'),
(283, 18, 72, 0, 12, '2024-07-26 18:17:13', '2024-07-28 08:55:33'),
(284, 18, 73, 0, 14, '2024-07-26 18:17:22', '2024-07-28 08:55:33'),
(285, 18, 74, 0, 15, '2024-07-26 18:17:41', '2024-07-28 08:55:33'),
(286, 18, 77, 0, 13, '2024-07-26 18:17:58', '2024-07-28 08:55:33'),
(287, 9, 17, 1, 2, '2024-07-27 06:21:04', '2024-07-29 09:23:21'),
(297, 9, 16, 1, 1, '2024-07-27 06:22:24', '2024-07-29 09:23:21'),
(298, 9, 18, 1, 3, '2024-07-27 06:22:49', '2024-07-29 09:23:21'),
(299, 9, 19, 1, 4, '2024-07-27 06:22:59', '2024-07-29 09:23:21'),
(300, 9, 20, 1, 5, '2024-07-27 06:23:08', '2024-07-29 09:23:21'),
(301, 9, 21, 1, 6, '2024-07-27 06:23:18', '2024-07-29 09:23:21'),
(303, 9, 23, 1, 8, '2024-07-27 06:25:22', '2024-07-29 09:23:21'),
(304, 9, 25, 1, 9, '2024-07-27 06:25:32', '2024-07-29 09:23:21'),
(305, 9, 26, 1, 10, '2024-07-27 06:28:30', '2024-07-29 09:23:21'),
(306, 9, 28, 1, 11, '2024-07-27 06:28:55', '2024-07-29 09:23:21'),
(307, 9, 29, 1, 12, '2024-07-27 06:29:07', '2024-07-29 09:23:21'),
(308, 9, 75, 1, 7, '2024-07-27 06:29:23', '2024-07-29 09:23:21'),
(309, 5, 93, 1, 2, '2024-07-28 07:51:16', '2024-07-28 07:55:46'),
(310, 6, 93, 1, 2, '2024-07-28 08:04:20', '2024-07-28 08:20:07');

-- --------------------------------------------------------

--
-- Table structure for table `diseases`
--

CREATE TABLE `diseases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `diseases`
--

INSERT INTO `diseases` (`id`, `type_id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 2, 'مرض 1', NULL, '2024-07-30 19:25:38', '2024-07-30 20:52:43'),
(2, 2, 'مرض 2', '', '2024-07-30 19:25:44', '2024-07-30 19:25:44'),
(3, 2, 'مرض 3', '', '2024-07-30 19:26:58', '2024-07-30 19:26:58'),
(4, 3, 'مرض 1', '', '2024-07-30 19:27:05', '2024-07-30 19:27:05');

-- --------------------------------------------------------

--
-- Table structure for table `disease_types`
--

CREATE TABLE `disease_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `disease_types`
--

INSERT INTO `disease_types` (`id`, `type`, `created_at`, `updated_at`) VALUES
(2, 'صحية', '2024-07-30 19:25:14', '2024-07-30 20:46:38'),
(3, 'وراثية', '2024-07-30 19:26:36', '2024-07-30 20:46:45');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `documentable_type` varchar(255) NOT NULL,
  `documentable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `education_levels`
--

CREATE TABLE `education_levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `level` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `education_levels`
--

INSERT INTO `education_levels` (`id`, `level`, `note`, `created_at`, `updated_at`) VALUES
(2, 'دكتوراه', NULL, '2024-07-31 17:26:36', '2024-07-31 17:26:36'),
(3, 'ماجستير', NULL, '2024-07-31 17:26:57', '2024-07-31 17:26:57'),
(4, 'دبلوم', NULL, '2024-07-31 17:27:13', '2024-07-31 17:27:13'),
(5, 'إجازة جامعية', NULL, '2024-07-31 17:27:57', '2024-07-31 17:28:26'),
(6, 'معهد إعداد مدرسين', NULL, '2024-08-01 14:45:06', '2024-08-01 14:45:06'),
(7, 'معهد متوسط', NULL, '2024-08-01 14:48:00', '2024-08-01 14:48:00'),
(8, 'معاهد أخرى', NULL, '2024-08-01 14:49:44', '2024-08-01 14:49:44'),
(9, 'ثانوية', NULL, '2024-08-01 14:50:33', '2024-08-01 14:50:33');

-- --------------------------------------------------------

--
-- Table structure for table `education_specializations`
--

CREATE TABLE `education_specializations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `education_level_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `education_specializations`
--

INSERT INTO `education_specializations` (`id`, `name`, `education_level_id`, `created_at`, `updated_at`) VALUES
(6, 'عربي', 5, '2024-08-01 14:11:19', '2024-08-01 14:11:19'),
(7, 'ديانة', 5, '2024-08-01 14:13:47', '2024-08-01 14:13:47'),
(8, 'إنكليزي', 5, '2024-08-01 14:14:10', '2024-08-01 14:14:10'),
(9, 'فرنسي', 5, '2024-08-01 14:14:47', '2024-08-01 14:14:47'),
(10, 'رياضيات', 5, '2024-08-01 14:15:20', '2024-08-01 14:15:20'),
(11, 'فيزياء', 5, '2024-08-01 14:15:38', '2024-08-01 14:15:38'),
(12, 'كيمياء', 5, '2024-08-01 14:16:17', '2024-08-01 14:16:17'),
(13, 'ر + ف + ك', 5, '2024-08-01 14:17:03', '2024-08-01 14:17:03'),
(14, 'علوم', 5, '2024-08-01 14:17:44', '2024-08-01 14:17:44'),
(15, 'تاريخ', 5, '2024-08-01 14:18:18', '2024-08-01 14:18:18'),
(16, 'جفرافيا', 5, '2024-08-01 14:19:09', '2024-08-01 14:19:09'),
(17, 'فنون', 5, '2024-08-01 14:20:33', '2024-08-01 14:20:33'),
(18, 'إحصاء رياضي', 5, '2024-08-01 14:21:22', '2024-08-01 14:21:22'),
(19, 'علم اجتماع', 5, '2024-08-01 14:22:13', '2024-08-01 14:22:13'),
(20, 'فلسفة', 5, '2024-08-01 14:22:59', '2024-08-01 14:22:59'),
(21, 'علوم سياسية', 5, '2024-08-01 14:23:47', '2024-08-01 14:23:47'),
(22, 'تربية', 5, '2024-08-01 14:25:40', '2024-08-01 14:25:40'),
(23, 'تربية إرشاد', 5, '2024-08-01 14:26:34', '2024-08-01 14:26:34'),
(24, 'تربية معلم صف', 5, '2024-08-01 14:27:10', '2024-08-01 14:27:10'),
(25, 'لغة روسية', 5, '2024-08-01 14:27:57', '2024-08-01 14:27:57'),
(26, 'موسيقا', 5, '2024-08-01 14:28:29', '2024-08-01 14:28:29'),
(27, 'رياضة', 5, '2024-08-01 14:29:23', '2024-08-01 14:29:23'),
(28, 'هندسة', 5, '2024-08-01 14:30:17', '2024-08-01 14:30:17'),
(29, 'تجارة', 5, '2024-08-01 14:30:30', '2024-08-01 14:30:30'),
(30, 'مكتبات', 5, '2024-08-01 14:32:36', '2024-08-01 14:32:36'),
(31, 'عربي', 6, '2024-08-01 14:45:26', '2024-08-01 14:45:26'),
(32, 'إنكليزي', 6, '2024-08-01 14:45:42', '2024-08-01 14:45:42'),
(33, 'فرنسي', 6, '2024-08-01 14:45:56', '2024-08-01 14:45:56'),
(34, 'علوم عامة', 6, '2024-08-01 14:46:06', '2024-08-01 14:46:06'),
(35, 'رياضيات', 6, '2024-08-01 14:46:21', '2024-08-01 14:46:21'),
(36, 'موسيقا', 6, '2024-08-01 14:46:32', '2024-08-01 14:46:32'),
(37, 'رسم', 6, '2024-08-01 14:46:38', '2024-08-01 14:46:38'),
(38, 'عسكرية', 6, '2024-08-01 14:46:58', '2024-08-01 14:46:58'),
(39, 'عمل يدوي', 6, '2024-08-01 14:47:19', '2024-08-01 14:47:19'),
(40, 'صناعي', 7, '2024-08-01 14:48:40', '2024-08-01 14:48:40'),
(41, 'تجاري', 7, '2024-08-01 14:48:49', '2024-08-01 14:48:49'),
(42, 'نسوي', 7, '2024-08-01 14:48:57', '2024-08-01 14:48:57'),
(43, 'معلوماتية و حاسوب', 7, '2024-08-01 14:49:23', '2024-08-01 14:49:23'),
(44, 'معهد رياضي', 8, '2024-08-01 14:49:58', '2024-08-01 14:49:58'),
(45, 'صف خاص', 8, '2024-08-01 14:50:09', '2024-08-01 14:50:09'),
(46, 'أهلية تعليم', 8, '2024-08-01 14:50:19', '2024-08-01 14:50:19'),
(47, 'عام', 9, '2024-08-01 14:50:43', '2024-08-01 14:50:43'),
(48, 'صناعي', 9, '2024-08-01 14:51:19', '2024-08-01 14:51:19'),
(49, 'تجاري', 9, '2024-08-01 14:51:33', '2024-08-01 14:51:33'),
(50, 'نسوي', 9, '2024-08-01 14:51:40', '2024-08-01 14:51:40');

-- --------------------------------------------------------

--
-- Table structure for table `education_types`
--

CREATE TABLE `education_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `education_types`
--

INSERT INTO `education_types` (`id`, `type`, `note`, `created_at`, `updated_at`) VALUES
(1, 'رسمي', NULL, '2024-07-30 23:52:45', '2024-07-30 23:52:45'),
(2, 'خاص', NULL, '2024-07-30 23:52:51', '2024-07-30 23:53:05'),
(3, 'وكالة', NULL, '2024-07-30 23:53:14', '2024-07-30 23:53:14'),
(4, 'نقابة', NULL, '2024-07-30 23:53:20', '2024-07-30 23:53:20'),
(5, 'افتراضي', NULL, '2024-07-30 23:53:29', '2024-07-30 23:53:29');

-- --------------------------------------------------------

--
-- Table structure for table `employee_types`
--

CREATE TABLE `employee_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `equipment_statuses`
--

CREATE TABLE `equipment_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `equipment_statuses`
--

INSERT INTO `equipment_statuses` (`id`, `status`, `note`, `created_at`, `updated_at`) VALUES
(3, 'صالحة', NULL, '2024-07-31 18:03:36', '2024-07-31 18:03:36'),
(4, 'غير صالحة', NULL, '2024-07-31 18:03:45', '2024-07-31 18:03:45');

-- --------------------------------------------------------

--
-- Table structure for table `equipment_types`
--

CREATE TABLE `equipment_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `classs_school_year_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  `max_degree` int(11) NOT NULL,
  `min_mark` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `part_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_results`
--

CREATE TABLE `exam_results` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `exam_id` bigint(20) UNSIGNED NOT NULL,
  `short_name` varchar(255) DEFAULT NULL,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `verified_student_id` bigint(20) UNSIGNED NOT NULL,
  `subject_detail_id` bigint(20) UNSIGNED NOT NULL,
  `max_grade` decimal(5,2) NOT NULL,
  `failing_grade` decimal(5,2) NOT NULL,
  `value` decimal(5,2) NOT NULL,
  `subject_is_failing` tinyint(1) NOT NULL,
  `islocked` tinyint(1) NOT NULL,
  `isverfied` tinyint(1) NOT NULL,
  `atemptes` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `family_members_changes`
--

CREATE TABLE `family_members_changes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fathers`
--

CREATE TABLE `fathers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `job` varchar(255) NOT NULL,
  `job_en` varchar(255) NOT NULL,
  `national_id` varchar(255) NOT NULL,
  `passport_id` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `nationality_id` bigint(20) UNSIGNED NOT NULL,
  `blood_type_id` bigint(20) UNSIGNED NOT NULL,
  `religion_id` bigint(20) UNSIGNED NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fathers`
--

INSERT INTO `fathers` (`id`, `email`, `password`, `name`, `name_en`, `last_name`, `job`, `job_en`, `national_id`, `passport_id`, `phone`, `nationality_id`, `blood_type_id`, `religion_id`, `address`, `created_at`, `updated_at`) VALUES
(3, 'ferzat@chamivs.com', 'F123456@', 'فرزات', 'Ferzat', 'الحسين', 'مغترب', 'traveler', '..', '013982801', '00971', 1, 7, 1, 'الإمارات', '2024-07-24 16:49:30', '2024-07-24 16:49:30'),
(4, 'raghdan@chamivs.com', 'R123456@', 'رغدان', 'Raghdan', 'عنبرجي', 'مغترب', 'traveler', '.', '012016483', '00971', 1, 7, 1, 'الإمارات', '2024-07-24 16:57:14', '2024-07-24 16:57:14'),
(5, 'ahmed.1@chamivs.com', 'A123456@', 'احمد', 'Ahmad', 'قاق', 'مغترب', 'traveler', '..', '014298728', '00966', 1, 5, 1, 'السعودية', '2024-07-24 17:18:47', '2024-07-24 17:18:47'),
(6, 'safwan@chamivs.com', 'S123456@', 'صفوان', 'safwan', 'السليم', 'مغترب', 'traveler', '..', '225396', '00971', 1, 2, 1, 'الإمارات', '2024-07-24 17:21:23', '2024-07-24 17:21:23'),
(7, 'idres@chamivs.com', 'I123456@', 'ادريس', 'Idres', 'علاء الدين', 'مغترب', 'traveler', '0', '011747131', '00966', 1, 1, 1, 'السعودية', '2024-07-24 17:24:15', '2024-07-24 17:24:15'),
(8, 'abdulhakem@chamivs.com', 'A123456@', 'عبد الحكيم', 'Abdulhakem', 'الأحمد', 'مغترب', 'traveler', '..', '009656850', '00971', 1, 1, 1, 'الإمارات', '2024-07-25 15:14:18', '2024-07-25 15:14:18'),
(9, 'zaher@chamivs.com', 'Z123456@', 'زاهر', 'Zaher', 'الوتار', 'مغترب', 'traveler', '....', '013081493', '00971', 1, 2, 1, 'الإمارات', '2024-07-25 15:47:05', '2024-07-25 15:47:05'),
(10, 'ali@chamivs.com', 'A123456@', 'علي', 'Ali', 'دياب', 'مغترب', 'traveler', '..', '016157620', '00971', 1, 8, 1, 'الإمارات', '2024-07-25 15:48:48', '2024-07-25 15:48:48'),
(11, 'mahmoud@chamivs.com', 'M123456@', 'محمود', 'Mahmoud', 'الشعار', 'مغترب', 'traveler', '....', '014117935', '00971', 1, 5, 1, 'الإمارات', '2024-07-25 15:54:49', '2024-07-25 15:54:49'),
(12, 'samer@chamivs.com', 'S123456@', 'سامر', 'Samer', 'اعكاشه', 'مغترب', 'traveler', '...', '013462919', '00971', 1, 2, 1, 'الإمارات', '2024-07-25 16:00:46', '2024-07-25 16:00:46'),
(13, 'mohammed@chamivs.com', 'M123456@', 'محمد', 'mohammed', 'فياض', 'مغترب', 'traveler', '...', '0166695229', '00971', 1, 2, 1, 'الإمارات', '2024-07-25 16:08:19', '2024-07-25 16:08:19'),
(14, 'youssef@chamivs.com', 'Y123456@', 'يوسف', 'Youssef', 'محمد', 'مغترب', 'traveler', '....', '012210979', '00966', 1, 5, 1, 'السعودية', '2024-07-25 16:15:22', '2024-07-25 16:15:22'),
(15, 'abdulaziz@chamivs.com', 'A123456@', 'عبد العزيز', 'Abdulaziz', 'الدرويش', 'مغترب', 'traveler', '.........', '015314950', '00966', 1, 7, 1, 'السعودية', '2024-07-25 16:17:56', '2024-07-25 16:17:56'),
(16, 'hazem@chamivs.com', 'H123456@', 'حازم', 'Hazem', 'مرهج', 'مغترب', 'traveler', '....', '...', '00971', 1, 1, 1, 'الإمارات', '2024-07-25 16:23:05', '2024-07-25 16:23:05'),
(17, 'khaled@chamivs.com', 'K123456@', 'خالد', 'Khaled', 'قدم خير', 'مغترب', 'traveler', '..', '012756370', '00971', 1, 7, 1, 'الإمارات', '2024-07-25 16:26:48', '2024-07-25 16:26:48'),
(18, 'sakar@chamivs.com', 'S123456@', 'صقر', 'Sakar', 'الجباعي', 'مغترب', 'traveler', '.....', '0244779', '00971', 1, 5, 1, 'الإمارات', '2024-07-25 16:38:10', '2024-07-25 16:38:10'),
(19, 'asaad@chamivs.com', 'A123456@', 'اسعد', 'Asaad', 'بشير', 'مغترب', 'traveler', '..', '013654630', '00971', 1, 7, 1, 'الإمارات', '2024-07-25 16:51:52', '2024-07-25 16:51:52'),
(20, 'muhanad@chamivs.com', 'M123456@', 'مهند', 'Muhanad', 'سيد خضر', 'مغترب', 'traveler', '..', '0139202020', '00971', 1, 6, 1, 'الإمارات', '2024-07-25 16:56:26', '2024-07-25 16:56:26'),
(21, 'omar@chamivs.com', 'O123456@', 'عمر', 'Omar', 'عزام', 'مغترب', 'traveler', '.....', '014641302', '00974', 1, 4, 1, 'قطر', '2024-07-25 17:00:27', '2024-07-25 17:00:27'),
(22, 'mohammadmoain@chamivs.com', 'M123456@', 'محمد معين', 'mohammadmoain', 'قصار بني المرجه', 'مغترب', 'traveler', '.....', '....', '00971', 1, 8, 1, 'الإمارات', '2024-07-25 17:05:41', '2024-07-25 17:05:41'),
(23, 'mazzah@chamivs.com', 'M123456@', 'مزاح', 'Mazzah', 'المغامس', 'مغترب', 'traveler', '000000000', '007172132', '00966', 1, 1, 1, 'السعودية', '2024-07-27 13:59:06', '2024-07-27 13:59:06'),
(24, 'ahmad@chamivs.com', 'A123456@', 'أحمد', 'Ahmad', 'الخضر', 'مغترب', 'traveler', '0000', '013328926', '00966', 1, 1, 1, 'السعودية', '2024-07-27 14:03:51', '2024-07-27 14:03:51'),
(25, 'akrma@chamivs.com', 'A123456@', 'عكرمة', 'Akrma', 'الفجير', 'مغترب', 'traveler', '000000000', '016726219', '00966', 1, 2, 1, 'السعودية', '2024-07-27 14:07:30', '2024-07-27 14:07:30'),
(26, 'ahmadf@chamivs.com', 'A123456@', 'أحمد', 'Ahmad', 'الخضر', 'مغترب', 'traveler', '000000000', '013328926', '00966', 1, 6, 1, 'السعودية', '2024-07-27 14:14:05', '2024-07-27 14:14:05'),
(27, 'abdullah@chamivs.com', 'A123456@', 'عبد الله', 'Abdullah', 'الكردي', 'مغترب', 'traveler', '00', '012198221', '00966', 1, 6, 1, 'السعودية', '2024-07-27 14:30:47', '2024-07-27 14:30:47'),
(28, 'radwan@chamivs.com', 'R123456@', 'رضوان', 'Radwan', 'الأحمد', 'مغترب', 'traveler', '000000000', '013285813', '00966', 1, 2, 1, 'السعودية', '2024-07-27 14:37:15', '2024-07-27 14:37:15'),
(29, 'ahmady@chamivs.com', 'A123456@', 'أحمد', 'ِAhmad', 'اليونس', 'مغترب', 'traveler', '000000000', '00', '00966', 1, 2, 1, 'السعودية', '2024-07-27 14:56:08', '2024-07-27 14:56:08'),
(31, 'nourin@chamivs.com', 'N123456@', 'نوري', 'Nouri', 'العويد', 'مغترب', 'traveler', '000000000', '00', '00966', 1, 2, 1, 'السعودية', '2024-07-27 15:01:52', '2024-07-27 15:01:52'),
(32, 'zyad@chamivs.com', 'Z123456@', 'زياد', 'Zyad', 'بشير', 'مغترب', 'traveler', '.......', '012463621', '00971', 1, 8, 1, 'الإمارات', '2024-07-27 15:02:48', '2024-07-27 15:03:37'),
(33, 'hmeidi@chamivs.com', 'H123456@', 'حميدي', 'Hmeidi', 'غراف', 'مغترب', 'traveler', '000000000', '00', '00966', 1, 2, 1, 'السعودية', '2024-07-27 15:07:50', '2024-07-27 15:07:50'),
(34, 'Ayman@chamivs.com', 'A123456@', 'ايمن', 'Ayman', 'الغدير', 'مغترب', 'traveler', '000000000', '014030458', '00966', 1, 4, 1, 'السعودية', '2024-07-27 15:14:19', '2024-07-27 15:14:19'),
(35, 'mohammad@chamivs.com', 'M123456@', 'محمد وائل', 'Mohammad wael', 'الجندي', 'مغترب', 'traveler', '000000000', '014288076', '00971', 1, 5, 1, 'الامارات', '2024-07-27 15:18:44', '2024-07-29 16:17:01'),
(36, 'Hosam@chamivs.com', 'H123456@', 'حسام', 'hosam', 'النوير', 'مغترب', 'traveler', '000000000', '014068098', '00964', 1, 4, 1, 'العراق', '2024-07-27 15:29:28', '2024-07-27 15:29:28'),
(37, 'khaledm@chamivs.com', 'K123456@', 'خالد', 'Khaled', 'موسى', 'مغترب', 'traveler', '000000000', '013614958', '00971', 1, 7, 1, 'الامارات', '2024-07-27 15:34:34', '2024-07-27 15:34:34'),
(38, 'yahya@chamivs.com', 'Y123456@', 'يحيى', 'Yahya', 'الأمين', 'مغترب', 'traveler', '000000000', '014530577', '00971', 1, 1, 1, 'الامارات', '2024-07-27 15:39:35', '2024-07-27 15:39:35'),
(39, 'ahmadz@chamivs.com', 'A123456@', 'أحمد', 'Ahmad', 'الزعبي', 'مغترب', 'traveler', '000000000', '012220765', '00971', 1, 4, 1, 'الامارات', '2024-07-27 15:42:21', '2024-07-27 15:42:21'),
(40, 'thani@chamivs.com', 'T123456@`', 'ثاني', 'Thani', 'المشوح', 'مغترب', 'traveler', '....', '016042412', '00966', 1, 7, 1, 'السعودية', '2024-07-27 15:47:40', '2024-07-27 15:47:40'),
(41, 'Nawras@chamivs.com', 'N123456@', 'نورس', 'Naouras', 'أبوشاهين', 'مغترب', 'traveler', '000000000', '012754114', '00971', 1, 2, 1, 'الامارات', '2024-07-27 15:48:56', '2024-07-27 15:48:56'),
(42, 'maher@chamivs.com', 'M123456@', 'ماهر', 'Maher', 'حرب', 'مغترب', 'traveler', '000000000', '014483405', '00974', 1, 1, 1, 'قطر', '2024-07-27 15:52:39', '2024-07-27 15:52:39'),
(43, 'Amar.a@chamivs.com', 'A123456@', 'عمار', 'Amar', 'الناصر الموسى', 'مغترب', 'traveler', '.....22', '016245107', '00966', 1, 7, 1, 'السعودية', '2024-07-27 15:54:44', '2024-07-27 15:54:44'),
(44, 'hossam@chamivs.com', 'H123456@', 'حسام', 'Hossam', 'قناطرة', 'مغترب', 'traveler', '000000000', '003155893', '00966', 1, 1, 1, 'السعودية', '2024-07-27 15:55:30', '2024-07-27 15:55:30'),
(45, 'aesr@chamivs.com', 'A123456@', 'أيسر', 'Aesr', 'المحيمد', 'مغترب', 'traveler', '000000000', '013985758', '00964', 1, 1, 1, 'الامارات', '2024-07-27 15:59:54', '2024-07-27 15:59:54'),
(46, 'Hussam@chamivs.com', 'H123456@', 'حسام الدين', 'HussamEddin', 'حاج محمد', 'مغترب', 'traveler', '000000000', '00084539', '00966', 1, 1, 1, 'السعودية', '2024-07-27 16:05:05', '2024-07-27 16:05:05'),
(47, 'khaledmm@chamivs.com', 'K123456@', 'خالد', 'Khaled', 'المقداد', 'مغترب', 'traveler', '000000000', '016124428', '00971', 1, 1, 1, 'الامارات', '2024-07-27 16:08:13', '2024-07-27 16:08:13'),
(48, 'wesam@chamivs.com', 'W123456@', 'وسام', 'Wesam', 'المعاز', 'مغترب', 'traveler', '000000000', '00', '00971', 1, 2, 1, 'الامارات', '2024-07-27 16:11:44', '2024-07-27 16:11:44'),
(49, 'salah@chamivs.com', 'S123456@', 'صلاح', 'Salah', 'المشوح', 'مغترب', 'traveler', '000000000', '014984418', '00966', 1, 2, 1, 'السعودية', '2024-07-27 16:22:28', '2024-07-27 16:22:28'),
(50, 'Mohamad@chamivs.com', 'M123456@', 'محمد', 'Mohamad', 'الباشا', 'مغترب', 'traveler', '12120000000', '012032699', '00966', 1, 7, 1, 'السعودية', '2024-07-28 14:42:25', '2024-07-28 14:42:25'),
(51, 'hassan@chamivs.com', 'H123456@', 'حسان', 'Hassan', 'الكردي', 'مغترب', 'traveler', '000000000', '011357091', '00966', 1, 1, 1, 'السعودية', '2024-07-28 14:43:04', '2024-07-28 14:43:04'),
(53, 'samer.a@chamivs.com', 'S123456@', 'سامر', 'Samer', 'عطار', 'مغترب', 'traveler', '1111.......', '.0...6', '00971', 1, 6, 1, 'الإمارات', '2024-07-28 14:51:09', '2024-07-28 14:51:09'),
(54, 'mahran@chamivs.com', 'M123456@', 'مهران', 'Mahran', 'بشير ابو فخر', 'مغترب', 'traveler', '12100000000', '016383069', '00971', 1, 7, 1, 'الإمارات', '2024-07-28 14:57:27', '2024-07-28 14:57:27'),
(55, 'imad@chamivs.com', 'I123456@', 'عماد', 'Imad', 'الغياض', 'مغترب', 'traveler', '000000000', '014940239', '00966', 1, 6, 1, 'السعودية', '2024-07-28 15:04:14', '2024-07-28 15:04:14'),
(56, 'hisham@chamivs.com', 'H123456@', 'هشام', 'Hicham', 'فخار', 'مغترب', 'traveler', '000000000', '3432047', '00971', 1, 1, 1, 'الامارات', '2024-07-28 15:07:31', '2024-07-28 15:07:31'),
(57, 'Mohamad.m@chamivs.com', 'M123456@', 'محمد', 'Mohamad', 'مشلح', 'مغترب', 'traveler', '0000.......', '005414391', '00971', 1, 6, 1, 'الإمارات', '2024-07-28 15:12:25', '2024-07-28 15:18:15'),
(58, 'aghyad@chamivs.com', 'A123456@', 'أغيد', 'Aghyad', 'ورده', 'مغترب', 'traveler', '......00...', '013497347', '00971', 1, 7, 1, 'الإمارات', '2024-07-28 15:25:23', '2024-07-28 15:25:23'),
(59, 'Abdulmueen@chamivs.com', 'A123456@', 'عبد المعين', 'Abdulmueen', 'خروب', 'مغترب', 'traveler', '0000.0....', '00000', '00971', 1, 7, 1, 'الإمارات', '2024-07-28 15:31:29', '2024-07-28 15:31:29'),
(60, 'mahmoud.f@chamivs.com', 'M123456@', 'محمود', 'Mahmoud', 'فارس', 'مغترب', 'traveler', '......666..', '.2..2.', '00966', 1, 7, 1, 'السعودية', '2024-07-28 15:36:23', '2024-07-28 15:36:23'),
(61, 'mohanad@chamivs.com', 'M123456@', 'مهند', 'Mohanad', 'كعكه', 'مغترب', 'traveler', '........544', '005345006', '00966', 1, 4, 1, 'السعودية', '2024-07-28 15:43:23', '2024-07-28 15:43:23'),
(62, 'Emad@chamivs.com', 'E123456@', 'عماد', 'Emad', 'قاق', 'مغترب', 'traveler', '...2.......', '5054964', '00966', 1, 6, 1, 'السعودية', '2024-07-28 15:45:41', '2024-07-28 15:45:41'),
(63, 'mohammad2@chamivs.com', 'M123456@', 'محمد', 'Mohammad', 'المحمد', 'مغترب', 'traveler', '000000000', '00', '00966', 1, 1, 1, 'سوريا', '2024-07-28 15:50:33', '2024-07-28 15:50:33'),
(64, 'Rahim@chamivs.com', 'R123456@', 'رحيم', 'Rahim', 'غلام', 'مغترب', 'traveler', '000000000', '4116253', '00971', 1, 1, 1, 'الامارات', '2024-07-28 15:52:58', '2024-07-28 15:52:58'),
(65, 'motasem@chamivs.com', 'M123456@', 'معتصم', 'Motasem', 'الباشا', 'مغترب', 'traveler', '....3333...', '0000', '00966', 1, 3, 1, 'السعودية', '2024-07-28 15:55:09', '2024-07-28 15:55:09'),
(66, 'jamil@chamivs.com', 'G123456@', 'جميل', 'Jamil', 'السكيف', 'مغترب', 'traveler', '000000000', '00295058', '00971', 1, 2, 1, 'الامارات', '2024-07-28 15:55:50', '2024-07-28 15:55:50'),
(67, 'ahmadaa@chamivs.com', 'A123456@', 'احمد', 'Ahmed', 'العبود', 'مغترب', 'traveler', '000000000', '11455041', '00971', 1, 1, 1, 'الامارات', '2024-07-28 16:00:04', '2024-07-28 16:00:04'),
(68, 'mahmoudh@chamivs.com', 'M123456@', 'محمود', 'Mahmoud', 'الحسين', 'مغترب', 'traveler', '000000000', '016668120', '00966', 1, 1, 1, 'السعودية', '2024-07-28 16:04:07', '2024-07-28 16:04:07'),
(69, 'taiser@chamivs.com', 'T123456@', 'تيسير', 'Taiser', 'مطاوع', 'مغترب', 'traveler', '000000000', '014492757', '00971', 1, 2, 1, 'السعودية', '2024-07-28 16:06:20', '2024-07-28 16:06:20'),
(70, 'zaher1@chamivs.com', 'Z123456@', 'زاهر', 'Zaher', 'الطحان', 'مغترب', 'traveler', '000000000', '004599699', '00966', 1, 2, 1, 'السعودية', '2024-07-28 16:09:06', '2024-07-28 16:09:06'),
(71, 'mufed@chamivs.com', 'M123456@', 'مفيد', 'Mufed', 'شنو', 'مغترب', 'traveler', '000000000', '001925516', '00966', 1, 1, 1, 'السعودية', '2024-07-28 16:12:17', '2024-07-28 16:12:17'),
(72, 'mahmoudk@chamivs.com', '’123456@', 'محمود', 'Mahmoud', 'كردي', 'مغترب', 'traveler', '000000000', '015059375', '00966', 1, 3, 1, 'السعودية', '2024-07-28 16:20:44', '2024-07-28 16:20:44'),
(73, 'abdulwahab@chamivs.com', 'A123456@', 'عبد الوهاب', 'Abdu Wahab', 'فراوي', 'مغترب', 'traveler', '000000000', '004166424', '00966', 1, 2, 1, 'السعودية', '2024-07-28 16:27:01', '2024-07-28 16:27:01'),
(74, 'tarek@chamis.com', 'T123456@', 'طارق', 'Tarek', 'مقلد', 'مغترب', 'traveler', '000000000', '013451230', '00964', 1, 1, 1, 'العراق', '2024-07-28 16:30:34', '2024-07-28 16:30:34'),
(75, 'Moeen@chamivs.com', 'M123456@', 'معين', 'Moeen', 'الأحمدية', 'مغترب', 'traveler', '000000000', '1713436', '00968', 22, 1, 1, 'عمان', '2024-07-28 16:34:27', '2024-07-28 16:34:27'),
(76, 'mohammadmar@chamivs.com', 'M123456@', 'محمد مرزوق', 'Mohammad', 'جبارة', 'مغترب', 'traveler', '000000000', '187473', '00971', 19, 1, 1, 'الامارات', '2024-07-28 16:38:26', '2024-07-28 16:38:26'),
(77, 'hassany@chamivs.com', 'H123456@', 'حسان', 'Hassan', 'يونس', 'مغترب', 'traveler', '000000000', '4884511', '00971', 30, 3, 1, 'الامارات', '2024-07-28 16:41:25', '2024-07-28 16:41:25'),
(78, 'mostafa@chamivs.com', 'M123456@', 'مصطفى', 'Mustafa', 'فياض', 'مغترب', 'traveler', '000000000', '00', '00971', 1, 2, 1, 'الامارات', '2024-07-28 16:44:11', '2024-07-28 16:44:11'),
(79, 'mohammadhh@chamivs.com', 'M123456@', 'محمد', 'Mohamad', 'الحاجي', 'مغترب', 'traveler', '000000000', '00', '00966', 1, 7, 1, 'السعودية', '2024-07-28 16:46:29', '2024-07-28 16:46:29'),
(80, 'esmail@chamivs.com', 'E123456@', 'اسماعيل', 'Esmail', 'مصطفى', 'مغترب', 'traveler', '000000000', '00', '00971', 1, 1, 1, 'الامارات', '2024-07-28 16:49:48', '2024-07-28 16:49:48'),
(81, 'mohammadzz@chamivs.com', 'M123456@', 'محمد', 'Mohammad', 'الزعبي', 'مغترب', 'traveler', '00000', '110000', '00971', 1, 5, 1, 'الإمارات', '2024-07-28 16:54:23', '2024-07-28 16:54:23'),
(82, 'AbdulQadir@chamivs.com', 'A123456@', 'عبد القادر', 'Abdul Qadir', 'السيد', 'مغترب', 'traveler', '000000000', '014255459', '00971', 1, 3, 1, 'الامارات', '2024-07-28 16:58:04', '2024-07-28 16:58:04'),
(83, 'pieer@chamivs.com', 'P123456@', 'بيير', 'Pieere', 'حنا', 'مغترب', 'housewife', '000000000', '007614285', '00971', 1, 2, 1, 'الامارات', '2024-07-28 17:00:51', '2024-07-28 17:00:51'),
(84, 'AbdulQudos@chamivs.com', 'A123456@', 'عبد القدوس', 'Abdul Qudos', 'بابرزاي', 'مغترب', 'traveler', '000000000', '03415641', '00966', 51, 1, 1, 'الامارات', '2024-07-28 17:10:27', '2024-07-28 17:10:27'),
(85, 'ibrahim@chamivs.com', 'I123456@', 'ابراهيم', 'Ibrahim', 'عجاج', 'مغترب', 'traveler', '000000000', '015283629', '00971', 1, 1, 1, 'الامارات', '2024-07-28 17:20:18', '2024-07-28 17:20:18'),
(86, 'bashar@chamivs.com', 'B123456@', 'بشار', 'Bashar', 'السبع', 'مغترب', 'traveler', '000000000', '013296847', '00966', 1, 1, 1, 'الامارات', '2024-07-28 17:23:00', '2024-07-28 17:23:00'),
(87, 'homam@chamivs.com', 'H123456@', 'همام', 'Homam', 'الجندي', 'مغترب', 'traveler', '000000000', '00', '00966', 1, 2, 1, 'الامارات', '2024-07-28 17:25:27', '2024-07-28 17:25:27'),
(88, 'muaeid@chamivs.com', 'M123456@', 'مؤيد', 'Muaeid', 'القدور', 'مغترب', 'traveler', '000000000', '00', '00971', 1, 2, 1, 'السعودية', '2024-07-28 17:32:03', '2024-07-28 17:32:03'),
(89, 'samer.b@chamivs.com', 'S123456@', 'سامر', 'Samer', 'بشبش', 'مغترب', 'traveler', '....', '013967230', '00971', 1, 7, 1, 'الإمارات', '2024-07-29 14:00:45', '2024-07-29 14:00:45'),
(90, 'hasan@chamivs.com', 'H123456@', 'حسن', 'Hasan', 'جبور', 'مغترب', 'traveler', '......', '015176747', '00971', 1, 3, 1, 'الإمارات', '2024-07-29 14:10:35', '2024-07-29 14:10:35'),
(92, 'ali1@gmail.com', 'A123456@', 'علي', 'Ali', 'السلامة', 'مغترب', 'traveler', '000000000', '00', '00971', 1, 3, 1, 'الإمارات', '2024-07-29 14:19:59', '2024-07-29 14:19:59'),
(93, 'nader@gmail.com', 'N123456@', 'نادر', 'Nader', 'مكارم', 'مغترب', 'traveler', '000000000', '00', '00961', 1, 4, 1, 'لبنان', '2024-07-29 14:24:29', '2024-07-29 14:24:29'),
(94, 'belal@gmail.com', 'B123456@', 'بلال', 'Belal', 'الأخرس', 'مغترب', 'traveler', '000000000', '015428458', '00966', 1, 4, 1, 'السعودية', '2024-07-29 14:27:47', '2024-07-29 14:27:47'),
(95, 'mhamadzaher@gmail.com', 'M123456@', 'محمد  زاهر', 'Mhamad Zaher', 'الأخرس', 'مغترب', 'traveler', '000000000', '015427722', '00966', 1, 6, 1, 'السعودية', '2024-07-29 14:31:52', '2024-07-29 14:31:52'),
(96, 'azzam@gmail.com', 'A123456@', 'عزام', 'Azzam', 'حاج ابراهيم', 'مغترب', 'traveler', '00000', '012237987', '00966', 1, 7, 1, 'السعودية', '2024-07-29 14:34:36', '2024-07-29 14:34:36'),
(97, 'ali2@gmail.com', 'A123456@', 'علي', 'Ali', 'رجا', 'مغترب', 'traveler', '00000', '009289505', '00966', 1, 6, 1, 'السعودية', '2024-07-29 14:37:11', '2024-07-29 14:37:11'),
(98, 'adham.h@chamivs.com', 'A123456@', 'ادهم', 'Adham', 'الحسين', 'ربة منزل', 'Housewaife', '...', '00211', '00971', 1, 6, 1, 'الإمارات', '2024-07-29 14:39:44', '2024-07-29 14:39:44'),
(99, 'hamed@gmail.com', 'H123456@', 'حامد', 'Hamed', 'البركات', 'مغترب', 'traveler', '0000', '012226218', '00966', 1, 6, 1, 'السعودية', '2024-07-29 14:40:25', '2024-07-29 14:40:25'),
(100, 'yanees@chamivs.com', 'Y123456@', 'يانيس', 'Yanees', 'جنان', 'مغترب', 'traveler', '......', '000000', '00971', 1, 1, 1, 'الإمارات', '2024-07-29 14:42:56', '2024-07-29 14:42:56'),
(101, 'mohamad3@gmail.com', 'M123456@', 'محمد', 'Mohamad', 'الجهماني', 'مغترب', 'traveler', '00000', '006640384', '00966', 1, 3, 1, 'السعودية', '2024-07-29 14:45:29', '2024-07-29 14:45:29'),
(102, 'ramiz@gmail.com', 'R123456@', 'رامز', 'Ramiz', 'حمود', 'مغترب', 'traveler', '000000', '015124538', '00966', 1, 4, 1, 'السعودية', '2024-07-29 14:48:06', '2024-07-29 14:48:06'),
(103, 'mohamad@gmail.com', 'M123456@', 'محمد', 'Mohamad', 'الصلهام', 'مغترب', 'traveler', '000000', '015939366', '00966', 1, 7, 1, 'السعودية', '2024-07-29 14:50:29', '2024-07-29 14:50:29'),
(104, 'ahmad@gmail.com', 'A123456@', 'احمد', 'Ahmad', 'أسود', 'مغترب', 'traveler', '0000', '008981127', '00966', 1, 6, 1, 'السعودية', '2024-07-29 14:52:22', '2024-07-29 14:52:22'),
(105, 'sahermohammad@chamivs.com', 'S123456@', 'ساهر محمد', 'SaherMohammad', 'السيد', 'مغترب', 'traveler', '.......', '....', '00971', 1, 7, 1, 'الإمارات', '2024-07-29 14:54:08', '2024-07-29 14:54:08'),
(106, 'hmadi@gmail.com', 'H123456@', 'حميدي', 'Hmadi', 'الحسين', 'مغترب', 'traveler', '00', '015180396', '00966', 1, 5, 1, 'السعودية', '2024-07-29 14:54:28', '2024-07-29 14:54:28'),
(107, 'zakwan@gmail.com', 'Z123456@', 'زكوان', 'Zakwan', 'زين الدين', 'مغترب', 'traveler', '000000', '015542105', '00966', 1, 5, 1, 'السعودية', '2024-07-29 14:56:43', '2024-07-29 14:56:43'),
(108, 'mostafa@gmail.com', 'M123456@', 'مصطفى', 'Mostafa', 'سبقجي', 'مغترب', 'traveler', '0000', '004635815', '00966', 1, 5, 1, 'السعودية', '2024-07-29 14:59:02', '2024-07-29 14:59:02'),
(109, 'ahmad4@gmail.com', 'A123456@', 'احمد', 'Ahmad', 'احمد', 'مغترب', 'traveler', '000000', '007376425', '00966', 1, 4, 1, 'السعودية', '2024-07-29 15:01:24', '2024-07-29 15:01:24'),
(110, 'zakaria@chamivs.com', 'Z123456@', 'زكريا', 'Zakaria', 'زكرت', 'مغترب', 'traveler', '....', '...', '00971', 1, 1, 1, 'الإمارات', '2024-07-29 15:02:06', '2024-07-29 15:02:06'),
(111, 'momtaz@gmail.com', 'M123456@', 'ممتاز', 'Momtaz', 'مكارم', 'مغترب', 'traveler', '00000', '00', '00964', 1, 3, 1, 'العراق', '2024-07-29 15:04:07', '2024-07-29 15:04:07'),
(112, 'nader1@gmail.com', 'N123456@', 'نادر', 'Nader', 'سلوم', 'مغترب', 'traveler', '0000', '015844537', '00961', 1, 6, 1, 'لبنان', '2024-07-29 15:07:25', '2024-07-29 15:07:54'),
(113, 'ibrahim.a@chamivs.com', 'A123456@', 'ابراهيم', 'Ibrahim', 'عجاج', 'مغترب', 'traveler', '....2', '015283629', '00971', 1, 8, 1, 'الإمارات', '2024-07-29 15:16:21', '2024-07-29 15:16:21'),
(114, 'ahmad6@gmail.com', 'A123456@', 'احمد', 'Ahmad', 'الجبان', 'مغترب', 'traveler', '000000000', '015832564', '00966', 1, 1, 1, 'السعودية', '2024-07-29 15:18:35', '2024-07-29 15:18:35'),
(116, 'bashar.s@chamivs.com', 'B123456@', 'بشار', 'Bashar', 'السبع', 'مغترب', 'traveler', '....', '013296847', '00971', 1, 7, 1, 'الإمارات', '2024-07-29 15:22:28', '2024-07-29 15:22:28'),
(117, 'abdulrahim@gmail.com', 'A123456@', 'عبد الرحيم', 'Abdulrahim', 'بحلاق', 'مغترب', 'traveler', '000000000', '014116926', '00971', 1, 3, 1, 'الإمارات', '2024-07-29 15:26:37', '2024-07-29 15:26:37'),
(118, 'taher@gmail.com', 'T123456@', 'طاهر', 'Taher', 'الجبان', 'مغترب', 'traveler', '00', '013799412', '00966', 1, 4, 1, 'السعودية', '2024-07-29 15:28:59', '2024-07-29 15:28:59'),
(119, 'nodirjon@gmail.com', 'N123456@', 'نوديرجون', 'Nodirjon', 'عبد الرخانوف', 'مغترب', 'traveler', '00', '1666923', '00971', 52, 3, 1, 'الإمارات', '2024-07-29 15:42:36', '2024-07-29 15:42:36'),
(120, 'nodirjon1@gmail.com', 'آ123456@', 'نوديرجون', 'Nodirjon', 'عبد الرخمونوف', 'مغترب', 'traveler', '00', '1666923', '00971', 52, 3, 1, 'الإمارات', '2024-07-29 15:48:13', '2024-07-29 15:48:13'),
(121, 'feras@gmail.com', 'F123456@', 'فراس', 'Feras', 'مصطفى', 'مغترب', 'traveler', '00', '016587767', '00971', 1, 3, 1, 'الإمارات', '2024-07-29 15:51:07', '2024-07-29 15:51:07'),
(122, 'ahmadkak@gmail.com', 'A123456@', 'احمد', 'Ahmad', 'قاق', 'مغترب', 'traveler', '000000000', '014298728', '00966', 1, 1, 1, 'السعودية', '2024-07-29 15:54:32', '2024-07-29 15:54:32'),
(123, 'mohammadalmo@chamivs.com', 'M123456@', 'محمد', 'Mohammad', 'المحمد', 'مغترب', 'traveler', '000000000', '014531263', '00971', 1, 5, 1, 'الإمارات', '2024-07-29 15:56:28', '2024-07-29 15:56:28'),
(124, 'Abdulhakem@gmail.com', 'A123456@', 'عبد الحكيم', 'Abdulhakem', 'الأحمد', 'مغترب', 'traveler', '000000000', '009656850', '00971', 1, 1, 1, 'الإمارات', '2024-07-29 15:59:31', '2024-07-29 15:59:31'),
(125, 'fares@chamivs.com', 'F123456@', 'فارس', 'Fares', 'هلال', 'مغترب', 'traveler', '0000', '36730168', '00971', 1, 1, 1, 'الإمارات', '2024-07-29 16:01:34', '2024-07-29 16:01:34'),
(126, 'eyyad@chamivs.com', 'E123456@', 'اياد', 'Eyyad', 'البيضه', 'مغترب', 'traveler', '000000000', '014683108', '00971', 1, 2, 1, 'الإمارات', '2024-07-29 16:04:13', '2024-07-29 16:04:13'),
(127, 'adham@chamivs.com', 'A123456@', 'أدهم', 'Adham', 'الحسين', 'مغترب', 'traveler', '000000000', '00', '00971', 1, 2, 1, 'الامارات', '2024-07-29 16:06:14', '2024-07-29 16:06:14'),
(128, 'faoaz@chamivs.com', 'F123456@', 'فواز', 'Faoaz', 'الخلف', 'مغترب', 'traveler', '000000', '005812870', '00966', 1, 3, 1, 'السعودية', '2024-07-29 16:08:09', '2024-07-29 16:08:09'),
(129, 'Assad@gmail.com', 'A123456@', 'أسعد', 'Assad', 'بشير', 'مغترب', 'traveler', '000000', '013654630', '00966', 1, 2, 1, 'الامارات', '2024-07-29 16:10:25', '2024-07-29 16:10:25'),
(130, 'ahmadwaked@chamivs.com', 'A123456@', 'احمد', 'Ahmad', 'الواكد', 'مغترب', 'traveler', '000000000', '012617420', '00966', 1, 1, 1, 'السعودية', '2024-07-29 16:12:31', '2024-07-29 16:12:31'),
(131, 'hisham@gmail.com', 'H123456@', 'هشام', 'Hisham', 'البري', 'مغترب', 'traveler', '000000000', '016019535', '00971', 1, 3, 1, 'الامارات', '2024-07-29 16:14:18', '2024-07-29 16:14:18'),
(132, 'hicham@gmail.com', 'H123456@', 'هشام', 'Hicham', 'فخار', 'مغترب', 'traveler', '00', '3432047', '00971', 49, 3, 1, 'الإمارات', '2024-07-29 16:22:28', '2024-07-29 16:22:28'),
(133, 'hago@gmail.com', 'H123456@', 'هجو', 'Hago', 'ابو عاقله', 'مغترب', 'traveler', '00', '00', '00971', 38, 3, 1, 'الإمارات', '2024-07-29 16:26:42', '2024-07-29 16:26:42'),
(134, 'ebrahim@chamivs.com', 'E123456@', 'ابراهيم', 'Ebrahim', 'غواصى', 'مغترب', 'traveler', '000000000', '00', '00971', 14, 7, 1, 'الامارات', '2024-07-29 16:31:01', '2024-07-29 16:31:27'),
(135, 'seyedmajed@chamivs.com', 'ٍ123456@', 'سيد ماجد', 'seyedmajed', 'محمدي', 'مغترب', 'traveler', '0000', '097417717', '00971', 14, 6, 1, 'الامارات', '2024-07-29 16:34:53', '2024-07-29 16:34:53'),
(136, 'maherkam@gmail.com', 'M123456@', 'ماهر', 'Maher', 'قمحية', 'مغترب', 'traveler', '0000', '001521023', '00966', 1, 2, 1, 'السعودية', '2024-07-29 16:36:57', '2024-07-29 16:36:57'),
(137, 'abdalkahar@chamivs.com', 'A123456@', 'عبد القهار', 'Abdalkahar', 'الفريح', 'مغترب', 'traveler', '000000', '001572435', '00966', 1, 1, 1, 'السعودية', '2024-07-29 16:39:13', '2024-07-29 16:39:13'),
(138, 'Mahmowd@chamivs.com', 'M123456@', 'محمود', 'Mahmowd', 'المصطفى', 'مغترب', 'traveler', '000000000', '016575369', '00966', 1, 1, 1, 'السعودية', '2024-07-29 16:43:09', '2024-07-29 16:43:09'),
(139, 'khaldoun@chamivs.com', 'K123456@', 'خلدون', 'Khaldoun', 'الكردي', 'مغترب', 'traveler', '000000', '005698779', '00966', 1, 1, 1, 'السعودية', '2024-07-29 16:45:22', '2024-07-29 16:45:22'),
(140, 'Mulair@chamivs.com', 'M123456@', 'مولير', 'Mulair', 'الشحف', 'مغترب', 'traveler', '111', '0000', '00971', 1, 6, 1, 'الإمارات', '2024-07-29 16:53:58', '2024-07-29 16:53:58'),
(141, 'mahmoud.z@chamivs.com', 'M123456@', 'محمود', 'Mahmoud', 'الزعبي', 'مغترب', 'traveler', '000', '016453405', '00971', 1, 6, 1, 'الإمارات', '2024-07-29 16:57:37', '2024-07-29 16:57:37'),
(142, 'mohamed@chamivs.com', 'M123456@', 'محمد', 'Mohamed', 'حوسو', 'مغترب', 'traveler', '000000000', '012274912', '00971', 1, 7, 1, 'الامارات', '2024-07-29 16:57:59', '2024-07-29 16:57:59'),
(143, 'Walid@gmail.com', 'W123456@', 'وليد', 'Walid', 'المقداد', 'مغترب', 'traveler', '000000000', '015537259', '00971', 1, 2, 1, 'الامارات', '2024-07-29 16:59:54', '2024-07-29 16:59:54'),
(144, 'abdullah.hasan@chamivs.com', 'A123456@', 'عبدالله', 'Abdullah', 'حسن', 'مغترب', 'traveler', '......2', '004050303', '00971', 1, 2, 1, 'الشارقة', '2024-07-29 17:02:00', '2024-07-29 17:02:00'),
(145, 'najd@chamivs.com', 'N123456@', 'نجد', 'Najd', 'غبره', 'مغترب', 'traveler', '00....', '00000', '00971', 1, 6, 1, 'الإمارات', '2024-07-29 17:04:19', '2024-07-29 17:04:19'),
(146, 'husameddin@chamivs.com', 'H123456@', 'حسام الدين', 'Husameddin', 'حاج محمد', 'مغترب', 'traveler', '000000000', '008759601', '00966', 1, 2, 1, 'السعودية', '2024-07-29 17:05:01', '2024-07-29 17:05:01'),
(147, 'samera@chamivs.com', 'S123456@', 'سامر', 'Samer', 'أيوب', 'مغترب', 'traveler', '00', '014368738', '00971', 1, 3, 1, 'الإمارات', '2024-07-29 17:11:15', '2024-07-29 17:11:15'),
(148, 'hassan3@gmail.com', 'H123456@', 'حسان', 'Hassan', 'الكردي', 'مغترب', 'traveler', '000000000', '011357091', '00966', 1, 3, 1, 'السعودية', '2024-07-29 17:13:42', '2024-07-29 17:13:42'),
(149, 'mhdmazen@gmail.com', 'M123456@', 'محمد مازن', 'Mhdmazen', 'تيناوي', 'مغترب', 'traveler', '0000', '006806998', '00966', 1, 2, 1, 'السعودية', '2024-07-29 17:16:35', '2024-07-29 17:16:35'),
(151, 'mohammadmarzouq@chamivs.com', 'M123456@', 'محمد مرزوق', 'Mohammad Marzouq', 'جبارة', 'مغترب', 'traveler', '...', '0187473', '00971', 53, 7, 1, 'الإمارات', '2024-07-30 16:51:57', '2024-07-30 16:51:57'),
(152, 'samir@example.com', 'S123456@', 'سمير', 'Samir', 'ضياء الدين', 'مغترب', 'traveler', '000', '0', '00971', 10, 4, 1, 'الإمارات', '2024-07-30 17:06:53', '2024-07-30 17:06:53'),
(153, 'mohammadk@chamivs.com', 'M123456@', 'محمد', 'Mohammad', 'القزاز', 'مغترب', 'traveler', '....', '17430479', '00971', 15, 3, 1, 'الإمارات', '2024-07-30 17:15:38', '2024-07-30 17:15:38'),
(154, 'mohamadhayel@chamivs.com', 'M123456@', 'محمد هايل', 'MohamadHayel', 'البلخي', 'مغترب', 'traveler', '...', '016561786', '00971', 1, 8, 1, 'الإمارات', '2024-07-30 17:17:55', '2024-07-30 17:17:55'),
(155, 'ahmedh@chamivs.com', 'A123456@', 'احمد', 'Ahmad', 'حايك', 'مغترب', 'traveler', '...', '014922345', '00966', 1, 2, 1, 'السعودية', '2024-07-30 17:21:37', '2024-07-30 17:21:37'),
(156, 'Wisam@chamivs.com', 'W123456@', 'وسام', 'Wisam', 'العبود', 'مغترب', 'traveler', '100', '13940617', '00971', 15, 7, 1, 'الإمارات', '2024-07-31 13:38:48', '2024-07-31 13:38:48'),
(157, 'mahmoud1@chamivs.com', 'M123456@', 'محمود', 'Mahmoud', 'العنفوص', 'مغترب', 'traveling', '000', '013149724', '00971', 1, 7, 1, 'الإمارات', '2024-07-31 13:54:09', '2024-07-31 13:54:09'),
(158, 'jomaah@chamivs.com', 'J123456@', 'جمعه', 'Jomaah', 'الحسن', 'مغترب', 'traveling', '000', '012761341', '00971', 1, 7, 1, 'الإمارات', '2024-07-31 14:01:29', '2024-07-31 14:01:29'),
(159, 'zakaria1@chamivs.com', 'Z123456@', 'زكريا', 'Zakaria', 'خروب', 'مغترب', 'traveling', '000', '000', '00971', 1, 1, 1, 'الإمارات', '2024-07-31 14:07:17', '2024-07-31 14:07:17'),
(160, 'mutaz@chamivs.com', 'M123456@', 'معتز', 'Mutaz', 'خروب', 'مغترب', 'traveling', '000', '000', '00971', 1, 6, 1, 'الإمارات', '2024-07-31 14:10:40', '2024-07-31 14:17:15'),
(161, 'Ahmadw@chamivs.com', 'A123456@', 'احمد', 'Ahmad', 'الوحادي', 'مغترب', 'traveling', '000', '00281609', '00971', 1, 1, 1, 'الامارات', '2024-07-31 14:26:07', '2024-07-31 14:26:07'),
(162, 'Ibrahimaa@chamivs.com', 'E123456@', 'ابراهيم', 'Ibrahim', 'العرنوس', 'مغترب', 'traveling', '000', '012041884', '00966', 1, 6, 1, 'السعودية', '2024-07-31 14:30:31', '2024-07-31 14:30:31'),
(163, 'anwar@chamivs.com', 'A123456@', 'أنور', 'Anwar', 'عبد الله', 'مغترب', 'traveling', '000', '000', '00966', 38, 5, 1, 'السعودية', '2024-07-31 14:39:30', '2024-07-31 14:39:30'),
(164, 'Khalid@chamivs.com', 'K123456@', 'خالد', 'Khalid', 'عزي', 'مغترب', 'traveling', '000', '015094072', '00964', 1, 2, 1, 'العراق', '2024-07-31 14:55:15', '2024-07-31 14:55:15'),
(165, 'jasem@chamivs.com', 'ـ123456@', 'جاسم', 'Jasem', 'السيد', 'مغترب', 'traveling', '000', '008091446', '00966', 1, 2, 1, 'السعودية', '2024-07-31 14:58:14', '2024-07-31 14:58:14'),
(166, 'Amjad@chamivs.com', 'ِ123456@', 'أمجد', 'Amjad', 'الكريم', 'مغترب', 'traveling', '000', '0146883784', '00971', 1, 6, 1, 'الامارات', '2024-07-31 15:01:30', '2024-07-31 15:01:30'),
(167, 'Hasanss@chamivs.com', 'H123456@', 'حسن', 'Hasan', 'السعيد', 'مغترب', 'traveling', '000', '12477955', '00971', 1, 3, 1, 'الامارات', '2024-07-31 15:04:48', '2024-07-31 15:04:48'),
(168, 'Jamil@example.com', 'J123456@', 'جميل', 'Jamil', 'عبد الرحمن', 'مغترب', 'traveling', '000', '000', '0090', 1, 2, 1, 'تركيا', '2024-07-31 15:11:13', '2024-07-31 15:11:13'),
(169, 'yousifameen@chamivs.com', 'Y123456@', 'يوسف أمين', 'YousifAmeen', 'أبازيد', 'مغترب', 'traveling', '000', '012531401', '00966', 1, 2, 1, 'السعودية', '2024-07-31 15:17:02', '2024-07-31 15:22:47'),
(170, 'Mohamad.aff@chamivs.com', 'M123456@', 'محمد', 'Mohamad', 'عفان', 'مغترب', 'traveling', '000', '10316368', '00966', 1, 5, 1, 'السعودية', '2024-07-31 15:27:37', '2024-07-31 15:27:37'),
(171, 'ahmad.a@chamivs.com', 'A123456@', 'احمد', 'Ahmad', 'العدس', 'مغترب', 'traveling', '000', '000', '0062', 1, 6, 1, 'اندونيسيا', '2024-07-31 15:33:26', '2024-07-31 15:33:26'),
(172, 'mohamaddiaeddin@chamivs.com', 'M123456@', 'محمد ضياء الدين', 'Mohamad Diaeddin', 'قطان', 'مغترب', 'traveler', '....', '013073989', '00966', 1, 7, 1, 'السعودية', '2024-07-31 15:45:47', '2024-07-31 15:45:47'),
(173, 'wasim@chamivs.com', 'W123456@', 'وسيم', 'Wasim', 'غانم', 'مغترب', 'traveling', '000', '012566055', '00966', 1, 4, 1, 'السعودية', '2024-07-31 15:52:54', '2024-07-31 15:58:16'),
(174, 'assaf@chamivs.com', 'A123456@', 'عساف', 'Assaf', 'الحسين الشيخ', 'مغترب', 'traveling', '000', '011450935', '00966', 1, 3, 1, 'السعودية', '2024-07-31 15:55:45', '2024-07-31 15:55:45'),
(175, 'ahmad3@chamivs.com', 'A123456@', 'احمد', 'Ahmad', 'الكحطان', 'مغترب', 'traveling', '000', '000', '00966', 1, 2, 1, 'السعودية', '2024-07-31 16:00:49', '2024-07-31 16:00:49'),
(176, 'salah2@chamivs.com', 'S123456@', 'صلاح', 'Salah', 'المشوح', 'مغترب', 'traveling', '000', '014984418', '00966', 1, 2, 1, 'السعودية', '2024-07-31 16:03:54', '2024-07-31 16:03:54'),
(177, 'hmoud@chamivs.com', 'H123456@', 'حمود', 'Hmoud', 'قناص', 'مغترب', 'traveling', '000', '01225303', '00966', 1, 6, 1, 'السعودية', '2024-07-31 16:06:28', '2024-07-31 16:06:28'),
(178, 'anas@chamivs.com', 'A123456@', 'أنس', 'Anas', 'نضر', 'مغترب', 'traveling', '000', '03338281', '00966', 1, 6, 1, 'السعودية', '2024-07-31 16:09:00', '2024-07-31 16:09:00'),
(179, 'ali4@chamivs.com', 'A123456@', 'علي', 'Ali', 'الظاهر', 'مغترب', 'traveling', '000', '012997662', '00966', 1, 7, 1, 'السعودية', '2024-07-31 16:11:57', '2024-07-31 16:11:57'),
(180, 'moayad@chamivs.com', 'M123456@', 'مؤيد', 'Moayad', 'بيرقدار', 'مغترب', 'traveling', '0000', '012121386', '00966', 1, 7, 1, 'السعودية', '2024-07-31 16:15:37', '2024-07-31 16:15:37'),
(181, 'abdulrazzak@chamivs.com', 'A123456@', 'عبد الرزاق', 'abdulrazzak', 'السعدي', 'مغترب', 'traveling', '0000', '015617652', '00966', 1, 5, 1, 'السعودية', '2024-07-31 16:19:51', '2024-07-31 16:19:51'),
(182, 'ahmad6@chamivs.com', 'A123456@', 'احمد', 'Ahmad', 'بكاري', 'مغترب', 'traveling', '0000', '00', '00966', 1, 2, 1, 'السعودية', '2024-07-31 16:23:07', '2024-07-31 16:23:07'),
(183, 'Ahmadhh@chamivs.com', 'A123456@', 'أحمد', 'Ahmad', 'الحمد', 'مغترب', 'traveler', '00', '005196811', '00966', 1, 2, 1, 'السعودية', '2024-07-31 16:32:16', '2024-07-31 16:32:16'),
(184, 'mohammadab@chamivs.com', 'M123456@', 'محمد', 'Mohammad', 'العبد الله', 'مغترب', 'traveler', '00', '013207306', '00966', 1, 6, 1, 'السعودية', '2024-07-31 16:34:43', '2024-07-31 16:34:43'),
(185, 'salem@chamivs.com', 'S123456@', 'سالم', 'Salem', 'الطلب', 'مغترب', 'traveler', '00', '012724307', '00966', 1, 6, 1, 'السعودية', '2024-07-31 16:36:30', '2024-07-31 16:36:30'),
(186, 'Zuheir@chamivs.com', 'Z123456@', 'زهير', 'Zuheir', 'المقداد', 'مغترب', 'traveler', '00', '013176740', '00966', 1, 6, 1, 'السعودية', '2024-07-31 16:39:57', '2024-07-31 16:39:57'),
(187, 'Abdullah12@chamivs.com', 'A123456@', 'عبد الله', 'Abdullah', 'الكردي', 'مغترب', 'traveler', '00', '012198221', '00966', 1, 1, 1, 'السعودية', '2024-07-31 16:42:07', '2024-07-31 16:42:07'),
(188, 'Aday@chamivs.com', 'A123456@', 'عداي', 'Aday', 'الحسن', 'مغترب', 'traveler', '00', '008972482', '00966', 1, 5, 1, 'السعودية', '2024-07-31 16:44:33', '2024-07-31 16:44:33'),
(189, 'Yousef@chamivs.com', 'Y123456@', 'يوسف', 'Yousef', 'الحفاشي', 'مغترب', 'traveler', '00', '10695916', '00966', 48, 1, 1, 'السعودية', '2024-07-31 16:46:35', '2024-07-31 16:46:35'),
(190, 'zahed@chamivs.com', 'Z123456@', 'زاهد', 'Zahad', 'السباح', 'مغترب', 'traveling', '000', '010340440', '00966', 1, 7, 1, 'السعودية', '2024-07-31 16:51:13', '2024-07-31 16:51:13'),
(191, 'samer1@chamivs.com', 'S123456@', 'سامر', 'Samer', 'زوارعه', 'مغترب', 'traveling', '000', '016193721', '00966', 1, 2, 1, 'السعودية', '2024-07-31 17:01:08', '2024-07-31 17:01:08'),
(192, 'alis@chamivs.com', 'A123456@', 'علي', 'Ali', 'السعدي', 'مغترب', 'traveling', '000', '05272280', '00966', 48, 2, 1, 'السعودية', '2024-07-31 17:07:00', '2024-07-31 17:07:00'),
(194, 'wasim7@chamivs.com', 'W123456@', 'وسيم', 'Wasim', 'كبور', 'مغترب', 'traveling', '000', '012153149', '00966', 1, 2, 1, 'السعودية', '2024-07-31 17:13:52', '2024-07-31 17:13:52'),
(195, 'amin@chamivs.com', 'A123456@', 'أمين', 'Amin', 'علي عثمان', 'مغترب', 'traveling', '000', '011971157', '00966', 1, 5, 1, 'السعودية', '2024-07-31 17:16:32', '2024-07-31 17:16:32'),
(197, 'ayman4@chamivs.com', 'A123456@', 'أيمن', 'Ayman', 'الباقر', 'مغترب', 'traveling', '000', '009567679', '00966', 1, 4, 1, 'السعودية', '2024-07-31 17:24:55', '2024-07-31 17:24:55'),
(198, 'abdalaziz@chamivs.com', 'A123456@', 'عبد العزيز', 'Abdalaziz', 'العبود', 'مغترب', 'traveling', '000', '004776497', '00966', 1, 3, 1, 'السعودية', '2024-07-31 17:30:29', '2024-07-31 17:30:29'),
(199, 'mohammad.m@chamivs.com', 'M123456@', 'محمد', 'Mohammad', 'المصري', 'مغترب', 'traveler', '00', '005370997', '00966', 1, 5, 1, 'السعودية', '2024-08-01 15:04:23', '2024-08-01 15:04:23'),
(200, 'ayman.f@chamivs.com', 'A123456@', 'أيمن', 'Ayman', 'الفحيمان', 'مغترب', 'traveler', '..', '001942486', '00966', 1, 6, 1, 'السعودية', '2024-08-01 15:09:46', '2024-08-01 15:09:46'),
(201, 'kasem@chamivs.com', 'K123456@', 'قاسم', 'Kasem', 'الشحمه', 'مغترب', 'traveler', '00', '006118416', '00966', 1, 8, 1, 'السعودية', '2024-08-01 15:11:24', '2024-08-01 15:11:24'),
(202, 'salah.kosa@chamivs.com', 'S123456@', 'صلاح', 'Salah', 'كوسا', 'مغترب', 'traveler', '....', '011328899', '00966', 1, 8, 1, 'السعودية', '2024-08-01 15:36:32', '2024-08-01 15:36:32'),
(203, 'Tarek@chamivs.com', 'T123456@', 'طارق', 'Tarek', 'الفواز', 'مغترب', 'traveler', '0', '016107196', '00966', 1, 7, 1, 'السعودية', '2024-08-01 15:50:26', '2024-08-01 15:50:26');

-- --------------------------------------------------------

--
-- Table structure for table `governates`
--

CREATE TABLE `governates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `governates`
--

INSERT INTO `governates` (`id`, `name`, `country_id`, `created_at`, `updated_at`) VALUES
(2, 'السويداء', 1, '2024-07-30 16:57:35', '2024-07-30 16:57:35');

-- --------------------------------------------------------

--
-- Table structure for table `grades`
--

CREATE TABLE `grades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stage_id` bigint(20) UNSIGNED NOT NULL,
  `grade_name_ar` varchar(255) NOT NULL,
  `grade_name_en` varchar(255) NOT NULL,
  `grade_notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `grades`
--

INSERT INTO `grades` (`id`, `stage_id`, `grade_name_ar`, `grade_name_en`, `grade_notes`, `created_at`, `updated_at`, `parent_id`) VALUES
(1, 6, 'مرحلة التعليم الاساسي الحلقة الاولى', 'Primary stage', NULL, '2024-07-22 18:26:35', '2024-08-01 18:10:42', NULL),
(2, 6, 'مرحلة التعليم الاساسي الحلقة الثانية', 'Mid school', NULL, '2024-07-22 18:26:35', '2024-08-01 18:10:51', NULL),
(3, 7, 'مرحلة التعليم الثانوي العام', 'hs', NULL, '2024-07-22 18:26:35', '2024-08-01 18:11:12', NULL),
(4, 5, 'الفئة ب', 'B', NULL, '2024-07-22 18:26:35', '2024-08-01 18:11:19', NULL),
(5, 4, 'رياض أطفال', 'Kindergarten', NULL, '2024-07-30 23:52:16', '2024-07-30 23:52:16', NULL),
(6, 7, 'مرحلة التعليم الثانوي الصناعي', 'Industrial secondary', NULL, '2024-07-31 14:26:28', '2024-08-01 18:16:26', NULL),
(7, 7, 'مرحلة التعليم الثانوي التجاري', 'Commercial secondary', NULL, '2024-07-31 14:26:52', '2024-08-01 18:16:34', NULL),
(8, 7, 'مرحلة التعليم الثانوي النسوي', 'Women\'s secondary', NULL, '2024-07-31 14:27:16', '2024-08-01 18:58:47', NULL),
(9, 8, 'معهد صناعي', 'Industrial institute', NULL, '2024-07-31 14:27:48', '2024-08-01 18:11:00', NULL),
(10, 8, 'معهد تجاري', 'Commercial Institute', NULL, '2024-07-31 14:28:49', '2024-08-01 18:11:45', NULL),
(11, 8, 'معهد نسوي', 'Feminist Institute', NULL, '2024-07-31 14:29:09', '2024-08-01 18:17:31', NULL),
(12, 8, 'معهد رياضي', 'Sports Institute', NULL, '2024-07-31 14:29:48', '2024-08-01 18:17:40', NULL),
(13, 8, 'معهد اعداد مدرسين', 'Teacher training institute', NULL, '2024-07-31 16:37:30', '2024-08-01 18:17:45', NULL),
(15, 8, 'شبكات حاسوبية', 'Computer networks', NULL, '2024-08-01 19:18:53', '2024-08-01 19:18:53', 9),
(16, 8, 'هندسة البرمجيات', 'Software Engineering', NULL, '2024-08-01 19:19:32', '2024-08-01 19:19:32', 9),
(17, 8, 'هندسة الحواسيب', 'Computer engineering', NULL, '2024-08-01 19:20:17', '2024-08-01 19:20:17', 9),
(18, 8, 'التحكم الالي / تعليم مزدوج', 'Automatic control/double learning', NULL, '2024-08-01 19:21:36', '2024-08-01 19:21:36', 9),
(19, 8, 'التحكم الالي', 'Automatic control', NULL, '2024-08-01 19:22:14', '2024-08-01 19:22:14', 9),
(20, 8, 'التقنيات الالكترونية', 'Electronic technologies', NULL, '2024-08-01 19:22:59', '2024-08-01 19:22:59', 9),
(21, 8, 'التقنيات الكهربائية', 'Electrical technologies', NULL, '2024-08-01 19:23:45', '2024-08-01 19:23:45', 9),
(22, 8, 'انشاءات معدنية', 'Metal constructions', NULL, '2024-08-01 19:24:36', '2024-08-01 19:24:36', 9),
(23, 8, 'النماذج و السباكة', 'Models and plumbing', NULL, '2024-08-01 19:25:36', '2024-08-01 19:25:36', 9),
(24, 8, 'الجرارات و الآلات الرزراعية', 'Tractors and agricultural machinery', NULL, '2024-08-01 19:26:23', '2024-08-01 19:26:23', 9),
(25, 8, 'تعبئة و نقل و تخزين', 'Packing, transportation and storage', NULL, '2024-08-01 19:27:28', '2024-08-01 19:27:28', 9),
(26, 8, 'ميكانيك المركبات', 'Vehicle mechanics', NULL, '2024-08-01 19:27:51', '2024-08-01 19:27:51', 9),
(27, 8, 'الكيمياء الصناعية', 'Industrial chemistry', NULL, '2024-08-01 19:28:32', '2024-08-01 19:28:32', 9),
(28, 8, 'محركات بحرية', 'Marine engines', NULL, '2024-08-01 19:29:16', '2024-08-01 19:29:16', 9),
(29, 8, 'تدفئة و تهوية', 'Heating and ventilation', NULL, '2024-08-01 19:29:45', '2024-08-01 19:29:45', 9),
(30, 8, 'تبريد و تكييف', 'Refrigeration & Air Conditioning', NULL, '2024-08-01 19:30:09', '2024-08-01 19:30:09', 9),
(31, 8, 'قوالب معدنية', 'Metal molds', NULL, '2024-08-01 19:30:31', '2024-08-01 19:30:31', 9),
(32, 8, 'أجهزة دقيقة', 'Precision devices', NULL, '2024-08-01 19:30:57', '2024-08-01 19:30:57', 9),
(33, 8, 'تصنيع ميكانيكي', 'Mechanical manufacturing', NULL, '2024-08-01 19:31:27', '2024-08-01 19:31:27', 9),
(34, 8, 'قوالب البلاستيك', 'Plastic molds', NULL, '2024-08-01 19:31:48', '2024-08-01 19:31:48', 9),
(35, 8, 'تصميم داخلي', 'interior design', NULL, '2024-08-01 19:32:13', '2024-08-01 19:32:13', 9),
(36, 8, 'صيانة التجهيزات الطبية', 'Maintenance of medical equipment', NULL, '2024-08-01 19:32:42', '2024-08-01 19:32:42', 9),
(37, 8, 'قوالب / تعليم مزدوج', 'Templates/dual education', NULL, '2024-08-01 19:33:05', '2024-08-01 19:33:05', 9),
(38, 8, 'فنية', 'Artistic', NULL, '2024-08-01 19:35:21', '2024-08-01 19:35:21', 13),
(39, 8, 'موسيقا', 'Music', NULL, '2024-08-01 19:35:42', '2024-08-01 19:35:42', 13),
(40, 8, 'عمل يدوي', 'handwork', NULL, '2024-08-01 19:36:04', '2024-08-01 19:36:04', 13),
(41, 8, 'عربي', 'Arabic', NULL, '2024-08-01 19:37:06', '2024-08-01 19:37:06', 13),
(42, 8, 'علوم', 'Sciences', NULL, '2024-08-01 19:37:32', '2024-08-01 19:37:32', 13),
(43, 8, 'انكليزي', 'English', NULL, '2024-08-01 19:37:57', '2024-08-01 19:37:57', 13),
(44, 8, 'رياضيات', 'mathematics', NULL, '2024-08-01 19:38:26', '2024-08-01 19:38:26', 13),
(45, 8, 'فرنسي', 'French', NULL, '2024-08-01 19:39:06', '2024-08-01 19:39:06', 13),
(46, 8, 'محاسبة', 'accounting', NULL, '2024-08-01 19:40:30', '2024-08-01 19:40:30', 10),
(47, 8, 'تامين و مصارف', 'Insurance and banking', NULL, '2024-08-01 19:40:56', '2024-08-01 19:40:56', 10),
(48, 7, 'خياطة الملابس', 'Sewing clothes', NULL, '2024-08-01 19:45:18', '2024-08-01 19:45:18', 8),
(49, 7, 'حلاقة و تجميل', 'Shaving and beauty', NULL, '2024-08-01 19:45:37', '2024-08-01 19:45:37', 8),
(50, 7, 'تقنيات الحاسوب', 'computer technologies', NULL, '2024-08-01 19:46:20', '2024-08-01 19:46:20', 6),
(51, 7, 'التقنيات الالكترونية', 'Electronic technologies', NULL, '2024-08-01 19:46:40', '2024-08-01 19:46:40', 6),
(52, 7, 'الاتصالات', 'Telecommunications', NULL, '2024-08-01 19:46:59', '2024-08-01 19:46:59', 6),
(53, 7, 'الميكاترونيكس', 'Mechatronics', NULL, '2024-08-01 19:47:19', '2024-08-01 19:47:19', 6),
(54, 7, 'التقنيات الكهربائية', 'Electrical technologies', NULL, '2024-08-01 19:47:37', '2024-08-01 19:47:37', 6),
(55, 7, 'التكييف و التبريد', 'Air conditioning and refrigeration', NULL, '2024-08-01 19:48:08', '2024-08-01 19:48:08', 6),
(56, 7, 'التدفئة و التمديدات', 'Heating and installations', NULL, '2024-08-01 19:48:32', '2024-08-01 19:48:32', 6),
(57, 7, 'النماذج و السباكة', 'Models and plumbing', NULL, '2024-08-01 19:48:53', '2024-08-01 19:48:53', 6),
(58, 7, 'ميكانيك و كهرباء المركبات', 'Vehicle mechanics and electricity', NULL, '2024-08-01 19:49:11', '2024-08-01 19:49:11', 6),
(59, 7, 'الآليات والمعدات الزراعية', 'Agricultural machinery and equipment', NULL, '2024-08-01 19:49:44', '2024-08-01 19:49:44', 6),
(60, 7, 'النسيج', 'Fabric', NULL, '2024-08-01 19:50:08', '2024-08-01 19:50:08', 6),
(61, 7, 'الغزل', 'spinning', NULL, '2024-08-01 19:50:33', '2024-08-01 19:50:33', 6),
(62, 7, 'اللحام و تشكيل المعادن', 'Welding and metal forming', NULL, '2024-08-01 19:50:56', '2024-08-01 19:50:56', 6),
(63, 7, 'اللحام وتشكيل المعادن / تعليم مزدوج', 'Welding and metal forming / dual education', NULL, '2024-08-01 19:51:18', '2024-08-01 19:51:18', 6),
(64, 7, 'التصنيع الميكانيكي', 'Mechanical manufacturing', NULL, '2024-08-01 19:51:42', '2024-08-01 19:51:42', 6),
(65, 7, 'التصنيع الميكانيكي / تعليم مزدوج', 'Mechanical Manufacturing/Dual Education', NULL, '2024-08-01 19:52:02', '2024-08-01 19:52:02', 6),
(66, 7, 'تجارة الأثاث و الزخرفة', 'Furniture and decoration trade', NULL, '2024-08-01 19:52:39', '2024-08-01 19:52:39', 6),
(67, 7, 'صيانة الاجهزة الطبية', 'Maintenance of medical devices', NULL, '2024-08-01 19:53:07', '2024-08-01 19:53:07', 6),
(68, 7, 'صناعة الالبسة / تعليم مزدوج', 'Garment industry / dual education', NULL, '2024-08-01 19:53:33', '2024-08-01 19:53:33', 6),
(69, 7, 'علمي', 'scientific', NULL, '2024-08-01 19:56:02', '2024-08-01 19:56:02', 3),
(70, 7, 'أدبي', 'literary', NULL, '2024-08-01 19:56:22', '2024-08-01 19:56:22', 3);

-- --------------------------------------------------------

--
-- Table structure for table `ground_types`
--

CREATE TABLE `ground_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ground_types`
--

INSERT INTO `ground_types` (`id`, `type`, `note`, `created_at`, `updated_at`) VALUES
(1, 'بلاط', NULL, '2024-07-31 01:27:17', '2024-07-31 01:27:17'),
(2, 'ترابي', NULL, '2024-07-31 01:27:23', '2024-07-31 01:27:23'),
(3, 'اسفلت', NULL, '2024-07-31 01:27:38', '2024-07-31 01:27:38'),
(4, 'اسمنت', NULL, '2024-07-31 01:27:50', '2024-07-31 01:27:50');

-- --------------------------------------------------------

--
-- Table structure for table `health_conditions`
--

CREATE TABLE `health_conditions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `health_conditions`
--

INSERT INTO `health_conditions` (`id`, `name`, `note`, `created_at`, `updated_at`) VALUES
(1, 'حالة صحية 1', NULL, '2024-07-30 21:41:38', '2024-07-30 21:41:38'),
(3, 'حالة صحية 2', NULL, '2024-07-30 21:41:57', '2024-07-30 21:42:04');

-- --------------------------------------------------------

--
-- Table structure for table `institutions`
--

CREATE TABLE `institutions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `governate_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `institutions`
--

INSERT INTO `institutions` (`id`, `name`, `address`, `mobile`, `telephone`, `note`, `governate_id`, `created_at`, `updated_at`) VALUES
(2, 'Jon Stewart Doe', '1600 Amphitheatre Parkway', '6019521325', '6019521325', 'ملاحظة 1', 2, '2024-07-30 17:00:04', '2024-07-30 17:00:04');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_sequences`
--

CREATE TABLE `job_sequences` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `school_name` varchar(255) NOT NULL,
  `job_title` varchar(255) NOT NULL,
  `year` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_titles`
--

CREATE TABLE `job_titles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `kind_of_employment_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_titles`
--

INSERT INTO `job_titles` (`id`, `name`, `kind_of_employment_id`, `created_at`, `updated_at`) VALUES
(2, 'dsadsasqw21', 1, '2024-08-02 03:10:07', '2024-08-02 03:10:13'),
(3, 'تدريس', 1, '2024-08-02 20:44:43', '2024-08-02 20:44:43'),
(4, 'حارس', 3, '2024-08-02 20:45:46', '2024-08-02 20:45:46'),
(5, 'مستخدم', 3, '2024-08-02 20:45:58', '2024-08-02 20:45:58'),
(6, 'سائق', 3, '2024-08-02 20:46:08', '2024-08-02 20:46:08'),
(7, 'مدير مدرسة', 2, '2024-08-02 20:46:25', '2024-08-02 20:46:25'),
(8, 'معاون مدير مدرسة', 2, '2024-08-02 20:46:39', '2024-08-02 20:46:39'),
(9, 'أمين سر', 2, '2024-08-02 20:46:50', '2024-08-02 20:46:50'),
(10, 'معاون أمين سر', 2, '2024-08-02 20:47:02', '2024-08-02 20:47:02'),
(11, 'معاون أمين سر حاسوب', 2, '2024-08-02 20:47:23', '2024-08-02 20:47:23'),
(12, 'أمين مكتبة', 2, '2024-08-02 20:47:38', '2024-08-02 20:47:38'),
(13, 'معاون أمين مكتبة', 2, '2024-08-02 20:48:18', '2024-08-02 20:48:18'),
(14, 'أمين مخبر', 2, '2024-08-02 20:48:32', '2024-08-02 20:48:32'),
(15, 'معاون أمين مخبر', 2, '2024-08-02 20:48:58', '2024-08-02 20:48:58'),
(16, 'مرشد اجتماعي', 2, '2024-08-02 20:49:17', '2024-08-02 20:49:17'),
(17, 'مرشد نفسي', 2, '2024-08-02 20:49:38', '2024-08-02 20:49:38'),
(18, 'أمين مستودع', 2, '2024-08-02 20:49:55', '2024-08-02 20:49:55'),
(19, 'رئيس قسم', 2, '2024-08-02 20:50:14', '2024-08-02 20:50:14'),
(20, 'رئيس الدروس الفنية', 2, '2024-08-02 20:50:36', '2024-08-02 20:50:36'),
(21, 'أنشطة لاصفية', 2, '2024-08-02 20:50:50', '2024-08-02 20:50:50'),
(22, 'معلم صيانة', 2, '2024-08-02 20:51:39', '2024-08-02 20:51:39'),
(23, 'صيانة آلات', 2, '2024-08-02 20:51:52', '2024-08-02 20:51:52'),
(24, 'صاحب المدرسة', 2, '2024-08-02 20:52:04', '2024-08-02 20:52:04'),
(25, 'مدير التربية', 2, '2024-08-02 20:52:18', '2024-08-02 20:52:18'),
(26, 'معاون مدير تربية', 2, '2024-08-02 20:52:42', '2024-08-02 20:52:42'),
(27, 'رئيس دائرة', 2, '2024-08-02 20:53:00', '2024-08-02 20:53:00'),
(28, 'رئيس شعبة', 2, '2024-08-02 20:53:12', '2024-08-02 20:53:12'),
(29, 'معاون رئيس شعبة', 2, '2024-08-02 20:53:28', '2024-08-02 20:53:28'),
(30, 'كاتب', 2, '2024-08-02 20:53:41', '2024-08-02 20:53:41'),
(31, 'محاسب', 2, '2024-08-02 20:53:50', '2024-08-02 20:53:50'),
(32, 'ممرض', 2, '2024-08-02 20:53:59', '2024-08-02 20:53:59'),
(33, 'طبيب', 2, '2024-08-02 20:54:09', '2024-08-02 20:54:09'),
(34, 'أمين صندوق', 2, '2024-08-02 20:54:25', '2024-08-02 20:54:25'),
(35, 'معتمد', 2, '2024-08-02 20:54:35', '2024-08-02 20:54:35');

-- --------------------------------------------------------

--
-- Table structure for table `kind_of_employments`
--

CREATE TABLE `kind_of_employments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kind_of_employments`
--

INSERT INTO `kind_of_employments` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'تدرسي', '2024-07-31 02:47:07', '2024-07-31 02:47:07'),
(2, 'إداري', '2024-07-31 02:47:13', '2024-07-31 02:47:13'),
(3, 'خدمات', '2024-07-31 17:09:52', '2024-07-31 17:09:52');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `short_name`, `created_at`, `updated_at`) VALUES
(1, 'اللغة الإنجليزية', 'ك', '2024-07-17 13:33:59', '2024-07-17 13:35:10'),
(2, 'اللغة العربية', 'ف', '2024-07-17 13:35:29', '2024-07-17 13:35:29'),
(3, 'الروسية', 'الروسية', '2024-07-17 13:35:40', '2024-07-17 13:35:40');

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

CREATE TABLE `leave_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `local_sections`
--

CREATE TABLE `local_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `local_sections`
--

INSERT INTO `local_sections` (`id`, `name`, `note`, `created_at`, `updated_at`) VALUES
(1, 'مركز', NULL, '2024-07-31 01:32:35', '2024-07-31 01:32:35'),
(2, 'مدن', NULL, '2024-07-31 01:32:40', '2024-07-31 01:32:40'),
(3, 'ريف', NULL, '2024-07-31 01:32:47', '2024-07-31 01:32:47');

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

CREATE TABLE `marks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `info` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mark_reviews`
--

CREATE TABLE `mark_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `min_mark` decimal(5,2) NOT NULL,
  `max_mark` decimal(5,2) NOT NULL,
  `result` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medals`
--

CREATE TABLE `medals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `medals`
--

INSERT INTO `medals` (`id`, `type`, `note`, `created_at`, `updated_at`) VALUES
(1, 'وسام 1', NULL, '2024-07-30 22:34:06', '2024-07-30 22:34:06'),
(2, 'وسام 2', NULL, '2024-07-30 22:34:11', '2024-07-30 22:34:11');

-- --------------------------------------------------------

--
-- Table structure for table `medical_conditions`
--

CREATE TABLE `medical_conditions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `medical_conditions`
--

INSERT INTO `medical_conditions` (`id`, `name`, `note`, `created_at`, `updated_at`) VALUES
(1, 'حالة طبية1', NULL, '2024-07-30 21:42:20', '2024-07-30 21:42:20'),
(3, 'حالة طبية', NULL, '2024-07-30 21:42:34', '2024-07-30 21:42:43');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_07_08_175924_add_two_factor_columns_to_users_table', 1),
(5, '2024_07_08_184854_create_permission_tables', 1),
(6, '2024_07_15_002116_create_settings_table', 1),
(7, '2024_07_15_133735_create_schools_table', 1),
(8, '2024_07_15_144516_create_grades_table', 1),
(9, '2024_07_15_155635_create_classes_table', 1),
(10, '2024_07_15_170612_create_school_years_table', 1),
(11, '2024_07_16_024049_create_teachers_table', 1),
(12, '2024_07_16_034618_create_job_sequences_table', 1),
(13, '2024_07_16_035411_create_rewards_punishments_table', 1),
(14, '2024_07_16_045337_create_courses_table', 1),
(15, '2024_07_16_082604_create_subjects_table', 1),
(16, '2024_07_16_100219_create_subject_details_table', 1),
(17, '2024_07_16_183112_create_blood_types_table', 1),
(18, '2024_07_16_190143_create_religions_table', 1),
(19, '2024_07_16_191603_create_nationalities_table', 1),
(20, '2024_07_16_202818__create_fathers_table', 1),
(21, '2024_07_16_202852_create_wives_table', 1),
(22, '2024_07_16_202855_create_students_table', 1),
(23, '2024_07_16_215555_create_classses_school_year_table', 1),
(24, '2024_07_16_232025_create_classses_school_year_subject_detail_table', 1),
(25, '2024_07_17_011506_add_order_to_year_class_subjects_table', 1),
(26, '2024_07_17_014532_create_mark_reviews_table', 1),
(27, '2024_07_17_022645_create_parts_tables', 1),
(28, '2024_07_17_035232_add_is_falling_to_c_s_y_s_detail_table', 1),
(29, '2024_07_17_035652_add_fall_subject_count_to_classses_school_years_table', 1),
(30, '2024_07_17_060615_create_languages_table', 1),
(31, '2024_07_17_063934_create_sections_table', 1),
(32, '2024_07_17_063955_create_section_language_table', 1),
(33, '2024_07_20_133102_create_verified_students_table', 1),
(34, '2024_07_20_163247_create_marks_table', 1),
(35, '2024_07_20_170710_create_registration_types_table', 1),
(36, '2024_07_20_171348_create_student_additional_details_table', 1),
(37, '2024_07_20_172039_create_documents_table', 1),
(38, '2024_07_20_174943_create_classs_school_year_details_table', 1),
(39, '2024_07_20_180727_create_leave_types_table', 1),
(40, '2024_07_20_192850_create_terms_table', 1),
(41, '2024_07_20_194639_create_exams_table', 1),
(42, '2024_07_20_200011_create_verified_student_admin_notes_table', 1),
(43, '2024_07_20_200809_create_verified_student_teacher_notes_table', 1),
(44, '2024_07_20_202729_create_absences_table', 1),
(45, '2024_07_20_203627_create_attendances_table', 1),
(46, '2024_07_20_220355_create_exam_results_table', 1),
(47, '2024_07_21_004127_create_svg_ids_table', 1),
(48, '2024_07_21_025341_add_short_name_to_exams_table', 1),
(49, '2024_07_21_025520_add_short_name_to_exam_results_table', 1),
(50, '2024_07_21_033224_add_manager_name_and_contact_to_schools_table', 1),
(51, '2024_07_21_040538_add_general_record_and_foreign_language_id_to_verified_students_table', 1),
(52, '2024_07_22_052030_add_min_grade_to_subject_details_table', 1),
(53, '2024_07_22_060113_add_register_status_to_verified_students_table', 1),
(54, '2024_07_22_060620_add_confirm_register_date_to_verified_students_table', 1),
(55, '2024_07_22_092559_add_term_id_to_parts_table', 1),
(56, '2024_07_22_160359_create_books_table', 2),
(57, '2024_07_22_161937_create_book_verified_student_table', 2),
(58, '2024_07_22_231745_create_collaboration_and_activities_table', 2),
(59, '2024_07_22_234423_create_countries_table', 2),
(60, '2024_07_22_234514_create_governates_table', 2),
(61, '2024_07_22_235146_create_institutions_table', 2),
(62, '2024_07_30_120855_create_disease_types_table', 3),
(63, '2024_07_30_120912_create_diseases_table', 3),
(64, '2024_07_30_135943_create_social_traits_table', 4),
(65, '2024_07_30_141140_create_health_conditions_table', 5),
(66, '2024_07_30_142125_create_activities_table', 5),
(67, '2024_07_30_142522_create_medical_conditions_table', 5),
(68, '2024_07_30_142916_create_youth_activity_types_table', 5),
(69, '2024_07_30_142929_create_youth_activities_table', 5),
(70, '2024_07_30_144659_create_youth_standards_table', 6),
(71, '2024_07_30_144952_create_youth_standard_ratings_table', 6),
(72, '2024_07_30_145639_create_camp_types_table', 6),
(73, '2024_07_30_145704_create_camp_locations_table', 6),
(74, '2024_07_30_145714_create_camps_table', 6),
(75, '2024_07_30_150926_create_student_course_types_table', 6),
(76, '2024_07_30_150937_create_student_course_locations_table', 6),
(77, '2024_07_30_150947_create_student_courses_table', 6),
(78, '2024_07_30_152208_create_rewards_table', 6),
(79, '2024_07_30_152404_create_penalties_table', 6),
(80, '2024_07_30_152416_create_medals_table', 6),
(81, '2024_07_30_155931_create_employee_types_table', 7),
(82, '2024_07_30_160316_create_social_situations_table', 7),
(83, '2024_07_30_160734_create_family_members_changes_table', 7),
(84, '2024_07_30_162050_create_education_types_table', 8),
(85, '2024_07_30_163548_create_types_of_employment_table', 8),
(86, '2024_07_30_163852_create_types_of_appointments_table', 8),
(87, '2024_07_30_170211_create_special_needs_types_table', 9),
(88, '2024_07_30_171758_create_age_groups_table', 10),
(89, '2024_07_30_175028_create_school_types_table', 11),
(90, '2024_07_30_180502_create_school_building_types_table', 12),
(91, '2024_07_30_180959_create_building_statuses_table', 13),
(92, '2024_07_30_181630_create_school_genders_table', 14),
(93, '2024_07_30_182009_create_ground_types_table', 15),
(94, '2024_07_30_182916_create_local_sections_table', 16),
(95, '2024_07_30_184355_create_types_of_permanence_table', 17),
(96, '2024_07_30_190510_create_equipment_types_table', 18),
(97, '2024_07_30_190813_create_equipment_statuses_table', 19),
(98, '2024_07_30_191410_create_education_levels_table', 20),
(99, '2024_07_30_192146_create_education_specializations_table', 21),
(100, '2024_07_30_194301_create_kinds_of_employment_table', 22),
(101, '2024_08_01_102950_create_stages_table', 23),
(102, '2024_08_01_104229_add_stage_and_parent_id_to_grades_table', 24),
(103, '2024_08_01_131207_create_school_questions_table', 25),
(104, '2024_08_01_132058_create_question_options_table', 26),
(105, '2024_08_01_155944_add_order_to_school_questions_table', 27),
(106, '2024_08_01_160806_create_ownership_types_table', 28),
(107, '2024_08_01_161512_create_school_room_types_table', 29),
(108, '2024_08_01_162027_create_public_utilities_table', 30),
(109, '2024_08_01_162717_create_common_fields_table', 31),
(110, '2024_08_01_164229_add_dependent_option_id_to_school_questions', 32),
(111, '2024_08_01_172237_create_option_question_table', 33),
(112, '2024_08_01_175346_create_question_option_relations_table', 34),
(113, '2024_08_01_192811_create_sort_of_employments_table', 35),
(114, '2024_08_01_200609_create_job_titles_table', 36),
(115, '2024_08_02_153527_create_tableheaders_table', 37),
(116, '2024_08_02_153839_create_columns_table', 37),
(117, '2024_08_02_165909_add_term_id_and_is_final_to_columns_table', 38),
(118, '2024_08_02_173558_create_student_living_places_table', 39),
(119, '2024_08_02_174904_create_oldyears_table', 40);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3),
(4, 'App\\Models\\User', 4);

-- --------------------------------------------------------

--
-- Table structure for table `nationalities`
--

CREATE TABLE `nationalities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `nationalities`
--

INSERT INTO `nationalities` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'سوري', NULL, NULL),
(2, 'أرجنتيني', NULL, NULL),
(3, 'أرميني', NULL, NULL),
(4, 'أسترالي', NULL, NULL),
(5, 'نمساوي', NULL, NULL),
(6, 'بحريني', NULL, NULL),
(7, 'روسي', NULL, NULL),
(8, 'كندي', NULL, NULL),
(9, 'صيني', NULL, NULL),
(10, 'مصري', NULL, NULL),
(11, 'فرنسي', NULL, NULL),
(12, 'يوناني', NULL, NULL),
(13, 'هندي', NULL, NULL),
(14, 'إيراني', NULL, NULL),
(15, 'عراقي', NULL, NULL),
(16, 'إيرلندي', NULL, NULL),
(17, 'إيطالي', NULL, NULL),
(18, 'ياباني', NULL, NULL),
(19, 'أردني', NULL, NULL),
(20, 'كوري', NULL, NULL),
(21, 'كويتي', NULL, NULL),
(22, 'لبناني', NULL, NULL),
(23, 'ليبي', NULL, NULL),
(24, 'ماليزي', NULL, NULL),
(25, 'مالديفي', NULL, NULL),
(26, 'موريتانيي', NULL, NULL),
(27, 'مكسيكي', NULL, NULL),
(28, 'هولندي', NULL, NULL),
(29, 'عماني', NULL, NULL),
(30, 'فلسطيني', NULL, NULL),
(31, 'برتغالي', NULL, NULL),
(32, 'قطري', NULL, NULL),
(33, 'روماني', NULL, NULL),
(34, 'روسي', NULL, NULL),
(35, 'سعودي', NULL, NULL),
(36, 'سوادني جنوبي', NULL, NULL),
(37, 'إسباني', NULL, NULL),
(38, 'سوداني', NULL, NULL),
(39, 'سويدي', NULL, NULL),
(40, 'سويسري', NULL, NULL),
(41, 'تونسي', NULL, NULL),
(42, 'تركي', NULL, NULL),
(43, 'أوكراني', NULL, NULL),
(44, 'إماراتي', NULL, NULL),
(45, 'بريطاني', NULL, NULL),
(46, 'أمريكي', NULL, NULL),
(47, 'فنزويلي', NULL, NULL),
(48, 'يمني', NULL, NULL),
(49, 'مغربي', '2024-07-28 09:15:05', '2024-07-28 09:15:05'),
(50, 'باكستاني', '2024-07-28 09:15:16', '2024-07-28 09:15:16'),
(51, 'افغانستانية', '2024-07-28 10:05:33', '2024-07-28 10:05:33'),
(52, 'اوزباكستانية', '2024-07-29 08:33:16', '2024-07-29 08:33:16'),
(53, 'أردنية', '2024-07-30 16:49:30', '2024-07-30 16:49:30');

-- --------------------------------------------------------

--
-- Table structure for table `oldyears`
--

CREATE TABLE `oldyears` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `start_year` int(11) NOT NULL,
  `end_year` int(11) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `option_question`
--

CREATE TABLE `option_question` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ownership_types`
--

CREATE TABLE `ownership_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ownership_types`
--

INSERT INTO `ownership_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'ملك', '2024-08-01 23:14:16', '2024-08-01 23:14:55'),
(2, 'مستأجر', '2024-08-01 23:14:23', '2024-08-01 23:14:23');

-- --------------------------------------------------------

--
-- Table structure for table `parts`
--

CREATE TABLE `parts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `year_class_subject_id` bigint(20) UNSIGNED NOT NULL,
  `mark_review_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `value` decimal(10,2) DEFAULT NULL,
  `operation` varchar(255) DEFAULT NULL,
  `is_final_result` tinyint(1) DEFAULT NULL,
  `max_per_cent` tinyint(1) DEFAULT NULL,
  `has_mark_review` tinyint(1) DEFAULT NULL,
  `is_semi_final_result` tinyint(1) DEFAULT NULL,
  `is_result_part` tinyint(1) NOT NULL DEFAULT 0,
  `is_sealed` tinyint(1) NOT NULL DEFAULT 0,
  `is_visible` tinyint(1) NOT NULL DEFAULT 1,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `must_be_calculated` tinyint(1) NOT NULL DEFAULT 0,
  `must_be_ceiled` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `term_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_in_results` tinyint(1) NOT NULL DEFAULT 1,
  `is_in_final` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parts`
--

INSERT INTO `parts` (`id`, `year_class_subject_id`, `mark_review_id`, `name`, `value`, `operation`, `is_final_result`, `max_per_cent`, `has_mark_review`, `is_semi_final_result`, `is_result_part`, `is_sealed`, `is_visible`, `is_active`, `must_be_calculated`, `must_be_ceiled`, `created_at`, `updated_at`, `term_id`, `is_in_results`, `is_in_final`) VALUES
(440, 78, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:02:00', '2024-07-24 10:02:00', NULL, 1, 1),
(441, 78, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:02:16', '2024-07-24 10:02:16', NULL, 1, 1),
(442, 78, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:02:40', '2024-07-24 10:02:40', NULL, 1, 1),
(443, 78, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:02:53', '2024-07-24 10:02:53', NULL, 1, 1),
(444, 78, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:04:00', '2024-07-24 10:04:00', NULL, 1, 1),
(445, 78, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:05:17', '2024-07-24 10:05:17', NULL, 1, 1),
(446, 79, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:05:30', '2024-07-24 10:05:30', NULL, 1, 1),
(447, 79, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:06:15', '2024-07-24 10:06:15', NULL, 1, 1),
(448, 78, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:06:18', '2024-07-24 10:06:18', NULL, 1, 1),
(449, 79, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:06:28', '2024-07-24 10:06:28', NULL, 1, 1),
(450, 79, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:06:43', '2024-07-24 10:06:43', NULL, 1, 1),
(451, 78, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:07:05', '2024-07-24 10:07:05', NULL, 1, 1),
(452, 79, NULL, 'مجموع درجات اعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:07:55', '2024-07-27 09:19:53', NULL, 1, 1),
(453, 78, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:08:12', '2024-07-24 10:08:12', NULL, 1, 1),
(454, 79, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:08:34', '2024-07-24 10:08:34', NULL, 1, 1),
(455, 78, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 10:09:02', '2024-07-24 10:09:02', NULL, 1, 1),
(456, 79, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:09:13', '2024-07-27 09:20:45', NULL, 1, 1),
(457, 79, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 10:09:52', '2024-07-24 10:09:52', NULL, 1, 1),
(458, 78, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 10:10:37', '2024-07-24 10:10:37', NULL, 1, 1),
(459, 79, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:10:59', '2024-07-24 10:10:59', NULL, 1, 1),
(460, 80, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:11:05', '2024-07-24 10:11:05', NULL, 1, 1),
(461, 80, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:11:20', '2024-07-24 10:11:20', NULL, 1, 1),
(462, 79, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:11:21', '2024-07-27 09:21:58', NULL, 1, 1),
(463, 80, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:11:38', '2024-07-24 10:11:38', NULL, 1, 1),
(464, 79, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 10:11:47', '2024-07-24 10:11:47', NULL, 1, 1),
(465, 80, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:11:49', '2024-07-24 10:11:49', NULL, 1, 1),
(466, 80, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:13:08', '2024-07-24 10:13:08', NULL, 1, 1),
(467, 80, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:14:07', '2024-07-24 10:14:07', NULL, 1, 1),
(468, 81, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:14:10', '2024-07-24 10:14:10', NULL, 1, 1),
(469, 81, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:14:40', '2024-07-24 10:14:40', NULL, 1, 1),
(470, 81, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:15:14', '2024-07-24 10:15:14', NULL, 1, 1),
(471, 81, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:15:24', '2024-07-24 10:15:24', NULL, 1, 1),
(472, 80, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:15:46', '2024-07-24 10:15:46', NULL, 1, 1),
(473, 81, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:16:19', '2024-07-24 10:16:19', NULL, 1, 1),
(474, 80, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:16:59', '2024-07-24 10:16:59', NULL, 1, 1),
(475, 81, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:17:18', '2024-07-24 10:17:18', NULL, 1, 1),
(476, 81, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:17:56', '2024-07-27 09:24:19', NULL, 1, 1),
(477, 80, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:17:58', '2024-07-24 10:17:58', NULL, 1, 1),
(478, 80, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 10:18:18', '2024-07-24 10:18:18', NULL, 1, 1),
(479, 81, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 10:18:34', '2024-07-24 10:18:34', NULL, 1, 1),
(480, 81, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:19:30', '2024-07-24 10:19:30', NULL, 1, 1),
(481, 80, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 10:19:35', '2024-07-24 10:19:35', NULL, 1, 1),
(482, 82, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:19:56', '2024-07-24 10:19:56', NULL, 1, 1),
(483, 82, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:20:11', '2024-07-24 10:20:11', NULL, 1, 1),
(484, 81, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:20:11', '2024-07-27 09:24:47', NULL, 1, 1),
(485, 82, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:20:23', '2024-07-24 10:20:23', NULL, 1, 1),
(486, 82, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:20:40', '2024-07-24 10:20:40', NULL, 1, 1),
(487, 82, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:21:21', '2024-07-24 10:21:21', NULL, 1, 1),
(488, 81, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 10:21:35', '2024-07-24 10:21:35', NULL, 1, 1),
(489, 82, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:21:46', '2024-07-24 10:21:46', NULL, 1, 1),
(490, 83, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:22:03', '2024-07-24 10:22:03', NULL, 1, 1),
(491, 83, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:22:28', '2024-07-24 10:22:28', NULL, 1, 1),
(492, 83, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:22:42', '2024-07-24 10:22:42', NULL, 1, 1),
(493, 82, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:22:49', '2024-07-24 10:22:49', NULL, 1, 1),
(494, 83, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:23:04', '2024-07-24 10:23:04', NULL, 1, 1),
(495, 82, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:23:28', '2024-07-24 10:23:28', NULL, 1, 1),
(496, 83, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:23:47', '2024-07-27 09:29:26', NULL, 1, 1),
(497, 82, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:24:07', '2024-07-24 10:24:07', NULL, 1, 1),
(498, 83, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:24:08', '2024-07-24 10:24:08', NULL, 1, 1),
(499, 83, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:24:31', '2024-07-27 09:30:40', NULL, 1, 1),
(500, 82, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 10:24:32', '2024-07-24 10:24:32', NULL, 1, 1),
(501, 82, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 10:25:02', '2024-07-24 10:25:02', NULL, 1, 1),
(502, 83, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 10:25:10', '2024-07-27 09:30:47', NULL, 1, 1),
(503, 83, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:25:53', '2024-07-24 10:25:53', NULL, 1, 1),
(504, 83, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:26:14', '2024-07-27 09:31:15', NULL, 1, 1),
(505, 83, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 10:26:28', '2024-07-24 10:26:28', NULL, 1, 1),
(506, 84, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:26:48', '2024-07-24 10:26:48', NULL, 1, 1),
(507, 84, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:27:21', '2024-07-24 10:27:21', NULL, 1, 1),
(508, 84, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:27:34', '2024-07-24 10:27:34', NULL, 1, 1),
(509, 84, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:28:06', '2024-07-24 10:28:06', NULL, 1, 1),
(510, 84, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:29:06', '2024-07-24 10:29:06', NULL, 1, 1),
(511, 84, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:29:25', '2024-07-24 10:29:25', NULL, 1, 1),
(512, 84, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:30:07', '2024-07-24 10:30:07', NULL, 1, 1),
(513, 84, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:30:38', '2024-07-24 10:30:38', NULL, 1, 1),
(514, 84, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:31:17', '2024-07-24 10:31:17', NULL, 1, 1),
(515, 84, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 10:31:35', '2024-07-24 10:31:35', NULL, 1, 1),
(516, 84, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 10:31:49', '2024-07-24 10:31:49', NULL, 1, 1),
(517, 86, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:32:33', '2024-07-24 10:32:33', NULL, 1, 1),
(518, 86, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:32:46', '2024-07-24 10:32:46', NULL, 1, 1),
(519, 86, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:33:01', '2024-07-24 10:33:01', NULL, 1, 1),
(520, 86, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:33:16', '2024-07-24 10:33:16', NULL, 1, 1),
(521, 86, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:33:57', '2024-07-24 10:33:57', NULL, 1, 1),
(522, 86, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:34:32', '2024-07-24 10:34:32', NULL, 1, 1),
(523, 86, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:35:21', '2024-07-24 10:35:21', NULL, 1, 1),
(524, 86, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:35:37', '2024-07-24 10:35:37', NULL, 1, 1),
(525, 86, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:38:42', '2024-07-24 10:38:42', NULL, 1, 1),
(526, 86, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 10:39:05', '2024-07-24 10:39:05', NULL, 1, 1),
(527, 86, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 10:39:22', '2024-07-24 10:39:22', NULL, 1, 1),
(528, 87, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:40:24', '2024-07-24 10:40:24', NULL, 1, 1),
(529, 87, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:40:37', '2024-07-24 10:40:37', NULL, 1, 1),
(530, 85, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:41:02', '2024-07-24 10:41:02', NULL, 1, 1),
(531, 87, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:41:26', '2024-07-24 10:41:26', NULL, 1, 1),
(532, 87, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:42:04', '2024-07-24 10:42:04', NULL, 1, 1),
(533, 85, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:42:24', '2024-07-24 10:42:24', NULL, 1, 1),
(534, 87, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:42:38', '2024-07-24 10:42:38', NULL, 1, 1),
(535, 85, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:42:51', '2024-07-27 09:34:40', NULL, 1, 1),
(536, 87, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:43:01', '2024-07-24 10:43:01', NULL, 1, 1),
(537, 85, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:43:14', '2024-07-24 10:43:14', NULL, 1, 1),
(538, 87, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:43:52', '2024-07-24 10:43:52', NULL, 1, 1),
(539, 85, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 10:43:57', '2024-07-24 10:48:00', NULL, 1, 1),
(540, 87, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:44:16', '2024-07-24 10:44:16', NULL, 1, 1),
(541, 87, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:44:54', '2024-07-24 10:44:54', NULL, 1, 1),
(543, 87, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 10:45:10', '2024-07-24 10:45:10', NULL, 1, 1),
(544, 87, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 10:45:36', '2024-07-24 10:45:36', NULL, 1, 1),
(545, 85, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:46:18', '2024-07-27 09:35:14', NULL, 1, 1),
(546, 85, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:54:59', '2024-07-24 10:54:59', NULL, 1, 1),
(547, 85, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 10:55:36', '2024-07-24 10:55:36', NULL, 1, 1),
(548, 85, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:57:50', '2024-07-24 10:57:50', NULL, 1, 1),
(549, 85, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 10:58:39', '2024-07-24 10:58:39', NULL, 1, 1),
(550, 89, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:00:58', '2024-07-27 09:42:30', NULL, 1, 1),
(551, 89, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 1, 0, 0, 1, 1, 0, 0, '2024-07-24 11:01:22', '2024-07-27 09:49:51', NULL, 1, 1),
(552, 89, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 11:01:46', '2024-07-24 11:01:46', NULL, 1, 1),
(553, 89, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 11:02:31', '2024-07-27 09:43:02', NULL, 1, 1),
(554, 89, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 11:02:55', '2024-07-27 09:43:08', NULL, 1, 1),
(555, 90, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:04:27', '2024-07-27 09:49:07', NULL, 1, 1),
(556, 90, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 1, 0, 0, 1, 1, 0, 0, '2024-07-24 11:05:07', '2024-07-27 09:52:47', NULL, 1, 1),
(557, 90, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 11:05:32', '2024-07-24 11:05:32', NULL, 1, 1),
(558, 90, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 11:06:14', '2024-07-24 11:06:14', NULL, 1, 1),
(559, 90, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 11:06:55', '2024-07-27 09:48:11', NULL, 1, 1),
(560, 91, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:07:53', '2024-07-27 09:50:29', NULL, 1, 1),
(561, 91, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 1, 0, 0, 1, 1, 0, 0, '2024-07-24 11:09:09', '2024-07-27 09:50:38', NULL, 1, 1),
(562, 91, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 11:09:39', '2024-07-24 11:09:39', NULL, 1, 1),
(563, 91, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-24 11:10:12', '2024-07-24 11:10:12', NULL, 1, 1),
(564, 91, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 11:11:30', '2024-07-27 09:51:19', NULL, 1, 1),
(565, 93, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:32:46', '2024-07-24 11:32:46', NULL, 1, 1),
(566, 93, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:33:00', '2024-07-24 11:33:00', NULL, 1, 1),
(567, 93, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:33:13', '2024-07-24 11:33:13', NULL, 1, 1),
(568, 93, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:34:07', '2024-07-24 11:34:07', NULL, 1, 1),
(569, 93, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 11:35:12', '2024-07-24 11:35:12', NULL, 1, 1),
(570, 94, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:36:20', '2024-07-24 11:36:20', NULL, 1, 1),
(571, 94, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:36:41', '2024-07-24 11:36:41', NULL, 1, 1),
(572, 93, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 11:36:43', '2024-07-24 12:07:21', NULL, 1, 1),
(573, 94, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:37:13', '2024-07-24 11:37:13', NULL, 1, 1),
(574, 93, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 11:37:23', '2024-07-24 11:37:23', NULL, 1, 1),
(575, 94, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:37:35', '2024-07-24 11:37:35', NULL, 1, 1),
(576, 93, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 11:37:58', '2024-07-24 11:37:58', NULL, 1, 1),
(577, 94, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 11:39:06', '2024-07-24 11:39:06', NULL, 1, 1),
(578, 93, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 11:39:23', '2024-07-24 11:39:23', NULL, 1, 1),
(579, 94, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 11:39:54', '2024-07-24 11:39:54', NULL, 1, 1),
(580, 95, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:40:16', '2024-07-24 11:40:16', NULL, 1, 1),
(581, 95, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:40:40', '2024-07-24 11:40:40', NULL, 1, 1),
(582, 95, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:40:59', '2024-07-24 11:40:59', NULL, 1, 1),
(583, 94, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 11:41:04', '2024-07-24 11:41:04', NULL, 1, 1),
(584, 95, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:41:10', '2024-07-24 11:41:10', NULL, 1, 1),
(585, 94, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 11:43:34', '2024-07-24 11:43:34', NULL, 1, 1),
(586, 95, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 11:44:28', '2024-07-24 11:44:28', NULL, 1, 1),
(587, 94, NULL, 'الدرجة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 11:44:55', '2024-07-24 11:44:55', NULL, 1, 1),
(588, 95, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 11:45:30', '2024-07-24 11:45:30', NULL, 1, 1),
(589, 95, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 11:46:30', '2024-07-24 11:46:30', NULL, 1, 1),
(590, 98, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:46:41', '2024-07-24 11:46:41', NULL, 1, 1),
(591, 95, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 11:46:50', '2024-07-24 11:46:50', NULL, 1, 1),
(592, 98, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:46:56', '2024-07-24 11:46:56', NULL, 1, 1),
(593, 98, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:47:13', '2024-07-24 11:47:13', NULL, 1, 1),
(594, 98, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:47:26', '2024-07-24 11:47:26', NULL, 1, 1),
(595, 95, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 11:47:29', '2024-07-24 11:47:29', NULL, 1, 1),
(596, 99, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:48:14', '2024-07-24 11:48:14', NULL, 1, 1),
(597, 98, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 11:48:15', '2024-07-28 09:44:39', NULL, 1, 1),
(598, 99, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:48:26', '2024-07-24 11:48:26', NULL, 1, 1),
(599, 99, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:48:41', '2024-07-24 11:48:41', NULL, 1, 1),
(600, 98, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 11:48:42', '2024-07-28 09:45:11', NULL, 1, 1),
(601, 99, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:48:55', '2024-07-24 11:48:55', NULL, 1, 1),
(602, 98, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 11:49:21', '2024-07-28 09:46:17', NULL, 1, 1),
(603, 99, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 11:49:37', '2024-07-24 11:49:37', NULL, 1, 1),
(604, 99, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 11:50:25', '2024-07-24 11:50:25', NULL, 1, 1),
(605, 98, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 11:51:12', '2024-07-24 11:51:12', NULL, 1, 1),
(606, 99, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 11:51:28', '2024-07-24 11:51:28', NULL, 1, 1),
(607, 98, NULL, 'الدرجة النهائية', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 11:51:34', '2024-07-28 09:47:48', NULL, 1, 1),
(608, 99, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 11:51:57', '2024-07-24 11:51:57', NULL, 1, 1),
(609, 99, NULL, 'الدرجة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 11:53:14', '2024-07-28 09:50:53', NULL, 1, 1),
(610, 101, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:54:24', '2024-07-24 11:54:24', NULL, 1, 1),
(611, 100, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:54:37', '2024-07-24 11:54:37', NULL, 1, 1),
(612, 101, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:54:44', '2024-07-24 11:54:44', NULL, 1, 1),
(613, 101, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:55:04', '2024-07-24 11:55:04', NULL, 1, 1),
(614, 100, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:55:09', '2024-07-24 11:55:09', NULL, 1, 1),
(615, 101, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:55:18', '2024-07-24 11:55:18', NULL, 1, 1),
(616, 100, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:55:47', '2024-07-24 11:55:47', NULL, 1, 1),
(617, 101, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 11:55:51', '2024-07-24 11:55:51', NULL, 1, 1),
(619, 101, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:56:10', '2024-07-24 11:56:10', NULL, 1, 1),
(620, 100, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:56:40', '2024-07-24 11:56:40', NULL, 1, 1),
(621, 101, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 11:56:41', '2024-07-24 11:56:41', NULL, 1, 1),
(622, 100, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 11:56:56', '2024-07-28 09:53:29', NULL, 1, 1),
(623, 101, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 11:57:05', '2024-07-24 11:57:05', NULL, 1, 1),
(624, 100, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 11:57:16', '2024-07-24 11:57:16', NULL, 1, 1),
(625, 101, NULL, 'الدرجة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 11:57:49', '2024-07-28 10:03:22', NULL, 1, 1),
(626, 100, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 11:57:51', '2024-07-28 09:59:00', NULL, 1, 1),
(627, 102, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:58:11', '2024-07-24 11:58:11', NULL, 1, 1),
(628, 102, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:58:23', '2024-07-24 11:58:23', NULL, 1, 1),
(629, 102, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:58:42', '2024-07-24 11:58:42', NULL, 1, 1),
(630, 100, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 11:58:42', '2024-07-24 11:58:42', NULL, 1, 1),
(631, 102, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 11:59:07', '2024-07-24 11:59:07', NULL, 1, 1),
(632, 100, NULL, 'الدرجة النهائية', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 11:59:39', '2024-07-28 10:00:35', NULL, 1, 1),
(633, 102, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 11:59:42', '2024-07-24 11:59:42', NULL, 1, 1),
(634, 102, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 12:00:35', '2024-07-24 12:00:35', NULL, 1, 1),
(635, 102, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:01:10', '2024-07-24 12:01:10', NULL, 1, 1),
(636, 102, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:01:53', '2024-07-24 12:01:53', NULL, 1, 1),
(637, 102, NULL, 'الدرجة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:02:37', '2024-07-28 10:05:25', NULL, 1, 1),
(638, 104, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:03:44', '2024-07-24 12:03:44', NULL, 1, 1),
(639, 104, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:04:02', '2024-07-24 12:04:02', NULL, 1, 1),
(640, 104, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:04:15', '2024-07-24 12:04:15', NULL, 1, 1),
(641, 104, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:04:32', '2024-07-24 12:04:32', NULL, 1, 1),
(642, 104, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:05:09', '2024-07-24 12:05:09', NULL, 1, 1),
(643, 103, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:05:14', '2024-07-28 10:06:48', NULL, 1, 1),
(644, 104, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 12:05:25', '2024-07-24 12:05:25', NULL, 1, 1),
(645, 103, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:05:37', '2024-07-24 12:05:37', NULL, 1, 1),
(646, 104, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:05:51', '2024-07-24 12:05:51', NULL, 1, 1),
(647, 103, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:05:57', '2024-07-24 12:05:57', NULL, 1, 1),
(648, 103, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:06:14', '2024-07-24 12:06:14', NULL, 1, 1),
(649, 104, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:06:14', '2024-07-24 12:06:14', NULL, 1, 1),
(650, 104, NULL, 'الدرجة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:06:43', '2024-07-28 10:13:30', NULL, 1, 1),
(651, 103, NULL, 'مجموع درجات اعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:07:20', '2024-07-24 12:07:20', NULL, 1, 1),
(652, 106, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-24 12:12:41', '2024-07-28 10:15:17', NULL, 1, 1),
(653, 106, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 1, 0, '2024-07-24 12:16:25', '2024-07-24 12:16:25', NULL, 1, 1),
(654, 103, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 12:16:41', '2024-07-24 12:16:41', NULL, 1, 1),
(655, 106, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:17:40', '2024-07-24 12:17:40', NULL, 1, 1),
(656, 103, NULL, 'مجموع الدرجات', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:17:55', '2024-07-24 12:17:55', NULL, 1, 1),
(657, 107, NULL, 'مجموع درجات الفصل', NULL, NULL, 1, 100, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 12:20:00', '2024-07-24 12:20:00', NULL, 1, 1),
(658, 107, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 1, 0, '2024-07-24 12:20:29', '2024-07-24 12:21:08', NULL, 1, 1),
(659, 103, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:20:31', '2024-07-24 12:20:31', NULL, 1, 1),
(660, 107, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:20:59', '2024-07-24 12:20:59', NULL, 1, 1),
(661, 103, NULL, 'الدرجة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:21:21', '2024-07-24 12:21:21', NULL, 1, 1),
(662, 108, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-24 12:22:05', '2024-07-24 12:22:05', NULL, 1, 1),
(663, 108, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 1, 0, '2024-07-24 12:22:27', '2024-07-24 12:22:27', NULL, 1, 1),
(664, 108, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:22:58', '2024-07-24 12:22:58', NULL, 1, 1),
(665, 109, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:32:33', '2024-07-24 12:32:33', NULL, 1, 1),
(666, 109, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:33:32', '2024-07-24 12:33:32', NULL, 1, 1),
(667, 109, NULL, 'مبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:34:59', '2024-07-24 12:34:59', NULL, 1, 1),
(668, 109, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:35:53', '2024-07-28 10:21:27', NULL, 1, 1),
(669, 111, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:37:02', '2024-07-24 12:37:02', NULL, 1, 1),
(670, 109, NULL, 'درجة الأعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:37:11', '2024-07-24 12:37:11', NULL, 1, 1),
(671, 111, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:37:23', '2024-07-24 12:37:23', NULL, 1, 1),
(672, 111, NULL, 'مبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:37:41', '2024-07-24 12:37:41', NULL, 1, 1),
(673, 109, NULL, 'درجة الامتحان', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 12:37:50', '2024-07-24 12:37:50', NULL, 1, 1),
(674, 111, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:38:03', '2024-07-24 12:38:03', NULL, 1, 1),
(675, 111, NULL, 'درجة الأعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:38:44', '2024-07-24 12:38:44', NULL, 1, 1),
(676, 109, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:38:55', '2024-07-24 12:40:13', NULL, 1, 1),
(677, 111, NULL, 'درجة الامتحان', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 12:39:34', '2024-07-28 10:24:44', NULL, 1, 1),
(678, 111, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:40:07', '2024-07-24 12:40:07', NULL, 1, 1),
(679, 109, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:40:46', '2024-07-24 12:40:46', NULL, 1, 1),
(680, 111, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:40:59', '2024-07-24 12:40:59', NULL, 1, 1),
(681, 109, NULL, 'المحصلة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:41:44', '2024-07-24 12:41:44', NULL, 1, 1),
(682, 111, NULL, 'المحصلة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:43:43', '2024-07-28 10:27:14', NULL, 1, 1),
(683, 114, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:44:07', '2024-07-24 12:44:07', NULL, 1, 1),
(684, 114, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:44:22', '2024-07-24 12:44:22', NULL, 1, 1),
(685, 114, NULL, 'مبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:44:36', '2024-07-24 12:44:36', NULL, 1, 1),
(686, 114, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:44:51', '2024-07-24 12:44:51', NULL, 1, 1),
(687, 112, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:44:52', '2024-07-24 12:44:52', NULL, 1, 1),
(688, 112, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:45:15', '2024-07-24 12:45:15', NULL, 1, 1),
(689, 112, NULL, 'مبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:45:28', '2024-07-24 12:45:38', NULL, 1, 1),
(690, 114, NULL, 'درجة الأعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:45:41', '2024-07-24 12:45:41', NULL, 1, 1),
(691, 114, NULL, 'درجة الامتحان', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 12:46:04', '2024-07-24 12:51:15', NULL, 1, 1),
(692, 112, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:46:13', '2024-07-24 12:46:13', NULL, 1, 1),
(693, 114, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:46:34', '2024-07-24 12:46:34', NULL, 1, 1),
(694, 114, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:46:53', '2024-07-24 12:46:53', NULL, 1, 1),
(695, 112, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:47:08', '2024-07-24 12:47:08', NULL, 1, 1),
(696, 114, NULL, 'المحصلة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:47:14', '2024-07-28 10:31:02', NULL, 1, 1),
(697, 116, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:47:35', '2024-07-24 12:47:35', NULL, 1, 1),
(698, 112, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 12:47:39', '2024-07-24 12:47:39', NULL, 1, 1),
(699, 116, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:47:50', '2024-07-24 12:47:50', NULL, 1, 1),
(700, 116, NULL, 'مبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:48:05', '2024-07-24 12:48:05', NULL, 1, 1),
(701, 116, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:48:22', '2024-07-24 12:48:22', NULL, 1, 1),
(702, 112, NULL, 'مجموع الدرجات', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:48:34', '2024-07-24 12:48:34', NULL, 1, 1),
(703, 116, NULL, 'درجة الأعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:48:54', '2024-07-24 12:48:54', NULL, 1, 1),
(704, 112, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:48:59', '2024-07-24 12:48:59', NULL, 1, 1),
(705, 116, NULL, 'درجة الامتحان', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 12:49:15', '2024-07-24 12:49:15', NULL, 1, 1),
(706, 112, NULL, 'المحصلة النهائية', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:49:24', '2024-07-28 10:29:24', NULL, 1, 1),
(707, 116, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:49:55', '2024-07-24 12:49:55', NULL, 1, 1),
(708, 118, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:50:06', '2024-07-24 12:50:06', NULL, 1, 1),
(709, 116, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:50:21', '2024-07-24 12:50:21', NULL, 1, 1),
(710, 118, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:50:21', '2024-07-24 12:50:21', NULL, 1, 1),
(711, 116, NULL, 'المحصلة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:50:42', '2024-07-28 10:32:40', NULL, 1, 1),
(712, 118, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:50:43', '2024-07-24 12:50:43', NULL, 1, 1),
(713, 118, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:51:01', '2024-07-24 12:51:01', NULL, 1, 1),
(714, 129, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:51:41', '2024-07-24 12:51:41', NULL, 1, 1),
(715, 129, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:51:55', '2024-07-24 12:51:55', NULL, 1, 1),
(716, 118, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:52:00', '2024-07-28 10:35:02', NULL, 1, 1),
(717, 129, NULL, 'مبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:52:08', '2024-07-24 12:52:08', NULL, 1, 1),
(718, 129, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:52:23', '2024-07-24 12:52:23', NULL, 1, 1),
(719, 118, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 12:52:36', '2024-07-24 12:52:36', NULL, 1, 1),
(720, 129, NULL, 'درجة الأعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:52:51', '2024-07-24 12:52:51', NULL, 1, 1),
(721, 129, NULL, 'درجة الامتحان', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 12:53:30', '2024-07-24 12:53:30', NULL, 1, 1),
(722, 118, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:53:32', '2024-07-28 10:36:18', NULL, 1, 1),
(723, 118, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:53:50', '2024-07-24 12:53:50', NULL, 1, 1),
(724, 129, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:54:05', '2024-07-24 12:54:05', NULL, 1, 1),
(725, 118, NULL, 'المحصلة النهائية', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:54:13', '2024-07-28 10:36:47', NULL, 1, 1),
(726, 129, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:54:58', '2024-07-24 12:54:58', NULL, 1, 1),
(727, 129, NULL, 'المحصلة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:55:06', '2024-07-24 12:55:06', NULL, 1, 1),
(728, 121, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:55:12', '2024-07-24 12:55:12', NULL, 1, 1),
(729, 119, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:55:19', '2024-07-24 12:55:19', NULL, 1, 1),
(730, 121, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:55:23', '2024-07-24 12:55:23', NULL, 1, 1),
(731, 121, NULL, 'مبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:55:38', '2024-07-24 12:55:38', NULL, 1, 1),
(732, 119, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:55:42', '2024-07-24 12:55:42', NULL, 1, 1),
(733, 121, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:55:55', '2024-07-24 12:55:55', NULL, 1, 1),
(734, 119, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:56:12', '2024-07-24 12:56:12', NULL, 1, 1),
(735, 121, NULL, 'درجة الأعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:56:29', '2024-07-24 12:56:29', NULL, 1, 1),
(736, 119, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:56:39', '2024-07-24 12:56:39', NULL, 1, 1),
(737, 121, NULL, 'درجة الامتحان', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 12:56:52', '2024-07-24 12:56:52', NULL, 1, 1),
(738, 119, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:57:18', '2024-07-28 10:40:26', NULL, 1, 1),
(739, 121, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:57:19', '2024-07-24 12:57:19', NULL, 1, 1),
(740, 121, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:57:43', '2024-07-24 12:57:43', NULL, 1, 1),
(741, 121, NULL, 'المحصلة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:58:19', '2024-07-28 10:47:15', NULL, 1, 1),
(742, 119, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 12:58:29', '2024-07-24 12:58:40', NULL, 1, 1),
(743, 122, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:58:45', '2024-07-24 12:58:45', NULL, 1, 1),
(744, 122, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:58:56', '2024-07-24 12:58:56', NULL, 1, 1),
(745, 119, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:59:09', '2024-07-28 10:45:43', NULL, 1, 1),
(746, 122, NULL, 'مبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:59:10', '2024-07-24 12:59:10', NULL, 1, 1),
(747, 119, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:59:24', '2024-07-24 12:59:34', NULL, 1, 1),
(748, 122, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 12:59:31', '2024-07-24 12:59:31', NULL, 1, 1),
(749, 119, NULL, 'الدرجة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 12:59:59', '2024-07-28 10:42:42', NULL, 1, 1),
(750, 122, NULL, 'درجة الأعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 13:00:01', '2024-07-24 13:00:01', NULL, 1, 1),
(751, 123, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 13:00:45', '2024-07-24 13:00:45', NULL, 1, 1),
(752, 122, NULL, 'درجة الامتحان', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 13:00:57', '2024-07-24 13:00:57', NULL, 1, 1),
(753, 123, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 13:01:01', '2024-07-24 13:01:01', NULL, 1, 1),
(754, 122, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 13:01:26', '2024-07-24 13:01:26', NULL, 1, 1),
(755, 123, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 13:01:36', '2024-07-24 13:01:36', NULL, 1, 1),
(756, 123, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-24 13:01:53', '2024-07-24 13:01:53', NULL, 1, 1),
(757, 122, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 13:02:01', '2024-07-24 13:02:01', NULL, 1, 1),
(758, 122, NULL, 'المحصلة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 13:02:24', '2024-07-24 13:02:24', NULL, 1, 1),
(759, 123, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 13:03:05', '2024-07-24 13:03:05', NULL, 1, 1),
(760, 123, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-24 13:03:38', '2024-07-24 13:03:38', NULL, 1, 1),
(761, 126, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-24 13:03:40', '2024-07-24 13:03:40', NULL, 1, 1),
(762, 126, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 1, 0, '2024-07-24 13:04:06', '2024-07-24 13:04:06', NULL, 1, 1),
(763, 126, NULL, 'المحصلة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 13:04:56', '2024-07-24 13:04:56', NULL, 1, 1),
(764, 123, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 13:05:08', '2024-07-24 13:05:32', NULL, 1, 1),
(765, 127, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-24 13:05:37', '2024-07-24 13:05:37', NULL, 1, 1),
(766, 123, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 13:05:53', '2024-07-24 13:05:53', NULL, 1, 1),
(767, 123, NULL, 'الدرجة النهائية', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 13:06:33', '2024-07-28 10:48:55', NULL, 1, 1),
(768, 127, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 1, 0, '2024-07-24 13:07:18', '2024-07-24 13:07:18', NULL, 1, 1),
(769, 128, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-24 13:07:19', '2024-07-24 13:07:19', NULL, 1, 1),
(770, 127, NULL, 'المحصلة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 13:07:42', '2024-07-24 13:07:42', NULL, 1, 1),
(771, 128, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 13:07:44', '2024-07-24 13:07:44', NULL, 1, 1),
(772, 128, NULL, 'الدرجة النهائية', NULL, 'divide', 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-24 13:08:19', '2024-07-24 13:08:19', NULL, 1, 1),
(773, 1, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 08:49:02', '2024-07-27 08:37:19', NULL, 1, 1),
(774, 1, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 08:49:43', '2024-07-27 08:37:29', NULL, 1, 1),
(775, 1, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 08:50:17', '2024-07-27 08:37:36', NULL, 1, 1),
(776, 1, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 08:50:49', '2024-07-27 08:37:41', NULL, 1, 1),
(777, 1, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 08:51:39', '2024-07-25 08:51:39', NULL, 1, 1),
(778, 146, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 08:52:55', '2024-07-25 08:52:55', NULL, 1, 1),
(779, 1, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 08:53:07', '2024-07-27 08:38:13', NULL, 1, 1),
(780, 146, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 08:53:43', '2024-07-25 08:53:43', NULL, 1, 1),
(781, 146, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 08:54:20', '2024-07-25 08:55:05', NULL, 1, 1),
(782, 146, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 08:54:51', '2024-07-25 08:54:51', NULL, 1, 1),
(783, 1, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 08:54:56', '2024-07-25 08:54:56', NULL, 1, 1),
(784, 146, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 08:55:54', '2024-07-25 08:55:54', NULL, 1, 1),
(785, 146, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 08:56:24', '2024-07-25 08:56:24', NULL, 1, 1),
(787, 146, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 08:57:15', '2024-07-25 08:57:15', NULL, 1, 1),
(788, 146, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 08:58:03', '2024-07-27 08:55:05', NULL, 1, 1),
(789, 1, NULL, 'تقدير الفصل', NULL, NULL, 0, 100, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 08:58:31', '2024-07-27 08:39:03', NULL, 1, 1),
(790, 1, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 08:58:53', '2024-07-25 08:58:53', NULL, 1, 1),
(791, 146, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 08:59:04', '2024-07-25 08:59:04', NULL, 1, 1),
(792, 1, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 08:59:18', '2024-07-25 08:59:18', NULL, 1, 1),
(793, 146, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 08:59:50', '2024-07-25 08:59:50', NULL, 1, 1),
(794, 1, NULL, 'التقدير النهائي', NULL, NULL, 1, 100, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:00:19', '2024-07-28 08:13:46', NULL, 1, 1),
(795, 146, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:00:29', '2024-07-27 08:55:30', NULL, 1, 1),
(796, 2, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:00:42', '2024-07-27 08:27:27', NULL, 1, 1),
(797, 43, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:00:52', '2024-07-25 09:01:21', NULL, 1, 1),
(798, 2, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:00:55', '2024-07-27 08:27:33', NULL, 1, 1),
(799, 43, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:01:11', '2024-07-25 09:01:11', NULL, 1, 1),
(800, 2, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:01:24', '2024-07-27 08:27:40', NULL, 1, 1),
(801, 2, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:01:35', '2024-07-27 08:27:50', NULL, 1, 1),
(802, 43, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:01:42', '2024-07-25 09:01:42', NULL, 1, 1),
(803, 43, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:02:02', '2024-07-25 09:02:02', NULL, 1, 1),
(804, 43, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:02:37', '2024-07-25 09:03:24', NULL, 1, 1),
(805, 2, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:03:02', '2024-07-25 09:03:02', NULL, 1, 1),
(806, 2, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:03:14', '2024-07-27 08:28:24', NULL, 1, 1),
(807, 2, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:03:44', '2024-07-25 09:03:44', NULL, 1, 1);
INSERT INTO `parts` (`id`, `year_class_subject_id`, `mark_review_id`, `name`, `value`, `operation`, `is_final_result`, `max_per_cent`, `has_mark_review`, `is_semi_final_result`, `is_result_part`, `is_sealed`, `is_visible`, `is_active`, `must_be_calculated`, `must_be_ceiled`, `created_at`, `updated_at`, `term_id`, `is_in_results`, `is_in_final`) VALUES
(808, 43, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:03:44', '2024-07-25 09:03:44', NULL, 1, 1),
(809, 2, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:04:01', '2024-07-25 09:04:01', NULL, 1, 1),
(810, 43, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:04:19', '2024-07-25 09:04:19', NULL, 1, 1),
(811, 2, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:04:23', '2024-07-25 09:04:23', NULL, 1, 1),
(812, 2, NULL, 'تقدير الفصل', NULL, NULL, 0, 100, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:04:51', '2024-07-27 08:30:28', NULL, 1, 1),
(813, 2, NULL, 'التقدير النهائي', NULL, NULL, 1, 100, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:05:09', '2024-07-27 08:30:48', NULL, 1, 1),
(814, 43, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:05:14', '2024-07-27 08:57:25', NULL, 1, 1),
(817, 43, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:05:58', '2024-07-25 09:05:58', NULL, 1, 1),
(820, 43, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:06:48', '2024-07-25 09:06:48', NULL, 1, 1),
(823, 43, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:07:24', '2024-07-25 09:07:24', NULL, 1, 1),
(826, 44, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:08:15', '2024-07-25 09:08:15', NULL, 1, 1),
(828, 44, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:08:35', '2024-07-27 08:58:03', NULL, 1, 1),
(831, 44, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:09:04', '2024-07-25 09:09:04', NULL, 1, 1),
(832, 44, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:09:26', '2024-07-25 09:09:26', NULL, 1, 1),
(833, 4, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:09:54', '2024-07-27 08:40:36', NULL, 1, 1),
(834, 4, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:10:21', '2024-07-27 08:40:43', NULL, 1, 1),
(835, 44, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:10:23', '2024-07-25 09:10:23', NULL, 1, 1),
(836, 4, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:10:35', '2024-07-27 08:40:50', NULL, 1, 1),
(837, 44, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:10:44', '2024-07-25 09:10:44', NULL, 1, 1),
(838, 4, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:10:51', '2024-07-27 08:40:55', NULL, 1, 1),
(839, 44, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:11:27', '2024-07-25 09:11:27', NULL, 1, 1),
(840, 4, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:11:40', '2024-07-25 09:11:40', NULL, 1, 1),
(841, 4, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:11:51', '2024-07-27 08:41:14', NULL, 1, 1),
(842, 44, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:11:55', '2024-07-27 08:58:33', NULL, 1, 1),
(843, 4, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:12:08', '2024-07-25 09:12:08', NULL, 1, 1),
(844, 4, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:12:22', '2024-07-25 09:12:22', NULL, 1, 1),
(845, 44, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:12:29', '2024-07-25 09:12:29', NULL, 1, 1),
(846, 4, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:12:40', '2024-07-25 09:12:40', NULL, 1, 1),
(847, 4, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:12:55', '2024-07-27 08:42:18', NULL, 1, 1),
(848, 44, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:13:02', '2024-07-25 09:13:02', NULL, 1, 1),
(849, 44, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:13:20', '2024-07-25 09:13:20', NULL, 1, 1),
(850, 4, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:13:23', '2024-07-27 08:42:12', NULL, 1, 1),
(851, 45, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:13:52', '2024-07-25 09:13:52', NULL, 1, 1),
(852, 32, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:14:05', '2024-07-27 08:42:30', NULL, 1, 1),
(853, 45, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:14:16', '2024-07-25 09:14:16', NULL, 1, 1),
(854, 32, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:14:31', '2024-07-27 08:42:37', NULL, 1, 1),
(855, 45, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:14:37', '2024-07-25 09:14:37', NULL, 1, 1),
(856, 32, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:14:40', '2024-07-27 08:42:43', NULL, 1, 1),
(857, 32, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:14:52', '2024-07-27 08:42:50', NULL, 1, 1),
(858, 45, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:15:05', '2024-07-25 09:15:06', NULL, 1, 1),
(859, 32, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:15:40', '2024-07-25 09:15:40', NULL, 1, 1),
(860, 45, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:15:42', '2024-07-25 09:15:42', NULL, 1, 1),
(861, 32, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:15:54', '2024-07-27 08:43:07', NULL, 1, 1),
(862, 45, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:16:01', '2024-07-25 09:16:01', NULL, 1, 1),
(863, 32, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:16:26', '2024-07-25 09:16:26', NULL, 1, 1),
(864, 32, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:16:44', '2024-07-25 09:16:44', NULL, 1, 1),
(865, 45, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:16:58', '2024-07-25 09:16:58', NULL, 1, 1),
(866, 32, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:17:00', '2024-07-25 09:17:00', NULL, 1, 1),
(867, 45, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:17:44', '2024-07-27 08:59:55', NULL, 1, 1),
(868, 32, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:18:05', '2024-07-27 08:43:44', NULL, 1, 1),
(869, 32, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:18:16', '2024-07-27 08:43:49', NULL, 1, 1),
(870, 45, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:18:22', '2024-07-27 09:02:04', NULL, 1, 1),
(871, 5, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:18:38', '2024-07-27 08:44:04', NULL, 1, 1),
(872, 5, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:18:48', '2024-07-27 08:44:09', NULL, 1, 1),
(873, 5, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:18:59', '2024-07-27 08:44:13', NULL, 1, 1),
(874, 45, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:19:05', '2024-07-25 09:19:05', NULL, 1, 1),
(875, 5, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:19:10', '2024-07-25 09:19:10', NULL, 1, 1),
(876, 45, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:19:28', '2024-07-27 09:02:25', NULL, 1, 1),
(877, 5, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:19:33', '2024-07-25 09:19:33', NULL, 1, 1),
(878, 46, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:20:00', '2024-07-25 09:20:00', NULL, 1, 1),
(879, 46, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:20:14', '2024-07-25 09:20:14', NULL, 1, 1),
(880, 46, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:20:39', '2024-07-25 09:20:39', NULL, 1, 1),
(881, 46, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:20:56', '2024-07-25 09:20:56', NULL, 1, 1),
(882, 5, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:21:09', '2024-07-27 08:44:33', NULL, 1, 1),
(883, 5, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:21:27', '2024-07-25 09:21:27', NULL, 1, 1),
(884, 46, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:21:48', '2024-07-25 09:21:48', NULL, 1, 1),
(885, 5, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:21:50', '2024-07-25 09:21:50', NULL, 1, 1),
(886, 46, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:22:12', '2024-07-25 09:22:12', NULL, 1, 1),
(887, 5, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:22:21', '2024-07-25 09:22:21', NULL, 1, 1),
(888, 5, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:22:32', '2024-07-27 08:45:00', NULL, 1, 1),
(889, 5, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:22:42', '2024-07-27 08:45:04', NULL, 1, 1),
(890, 46, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:22:51', '2024-07-27 09:03:42', NULL, 1, 1),
(891, 6, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:23:13', '2024-07-27 08:46:20', NULL, 1, 1),
(892, 46, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:23:14', '2024-07-27 09:03:55', NULL, 1, 1),
(893, 6, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:23:25', '2024-07-27 08:46:24', NULL, 1, 1),
(894, 6, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:23:34', '2024-07-27 08:46:27', NULL, 1, 1),
(895, 46, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:23:38', '2024-07-25 09:23:38', NULL, 1, 1),
(896, 6, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:23:46', '2024-07-27 08:46:30', NULL, 1, 1),
(897, 6, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:24:11', '2024-07-25 09:24:11', NULL, 1, 1),
(898, 6, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:24:23', '2024-07-27 08:46:09', NULL, 1, 1),
(899, 46, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:24:24', '2024-07-25 09:24:24', NULL, 1, 1),
(900, 46, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:24:44', '2024-07-27 09:04:25', NULL, 1, 1),
(901, 6, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:24:44', '2024-07-25 09:24:44', NULL, 1, 1),
(902, 6, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:25:00', '2024-07-25 09:25:00', NULL, 1, 1),
(903, 48, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:25:15', '2024-07-25 09:25:15', NULL, 1, 1),
(904, 6, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:25:19', '2024-07-25 09:25:19', NULL, 1, 1),
(905, 6, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:25:29', '2024-07-27 08:45:27', NULL, 1, 1),
(906, 48, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:25:34', '2024-07-25 09:25:34', NULL, 1, 1),
(907, 6, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:25:38', '2024-07-27 08:45:22', NULL, 1, 1),
(908, 48, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:25:51', '2024-07-25 09:25:51', NULL, 1, 1),
(909, 7, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:25:55', '2024-07-25 09:25:55', NULL, 1, 1),
(910, 7, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:26:05', '2024-07-25 09:26:05', NULL, 1, 1),
(911, 48, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:26:11', '2024-07-25 09:26:11', NULL, 1, 1),
(912, 7, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:26:18', '2024-07-25 09:26:18', NULL, 1, 1),
(913, 48, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:26:25', '2024-07-25 09:28:07', NULL, 1, 1),
(914, 7, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:26:29', '2024-07-25 09:26:29', NULL, 1, 1),
(915, 7, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:26:48', '2024-07-25 09:26:48', NULL, 1, 1),
(916, 7, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:27:02', '2024-07-25 09:27:02', NULL, 1, 1),
(917, 48, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:27:55', '2024-07-25 09:27:55', NULL, 1, 1),
(918, 7, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:28:15', '2024-07-25 09:28:15', NULL, 1, 1),
(919, 7, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:28:28', '2024-07-25 09:28:28', NULL, 1, 1),
(920, 7, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:28:56', '2024-07-25 09:28:56', NULL, 1, 1),
(921, 7, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:29:11', '2024-07-27 08:46:54', NULL, 1, 1),
(922, 7, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:29:22', '2024-07-27 08:46:48', NULL, 1, 1),
(923, 8, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:29:39', '2024-07-25 09:29:39', NULL, 1, 1),
(924, 8, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:29:52', '2024-07-25 09:29:52', NULL, 1, 1),
(925, 8, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:30:14', '2024-07-25 09:30:14', NULL, 1, 1),
(926, 8, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:30:26', '2024-07-25 09:30:26', NULL, 1, 1),
(927, 48, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:30:31', '2024-07-25 09:30:31', NULL, 1, 1),
(928, 8, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:30:48', '2024-07-25 09:30:48', NULL, 1, 1),
(929, 48, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:31:00', '2024-07-27 09:06:04', NULL, 1, 1),
(930, 8, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:31:27', '2024-07-25 09:31:27', NULL, 1, 1),
(931, 48, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:31:28', '2024-07-25 09:31:28', NULL, 1, 1),
(932, 48, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:32:12', '2024-07-25 09:32:12', NULL, 1, 1),
(933, 48, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:32:57', '2024-07-25 09:32:57', NULL, 1, 1),
(934, 47, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:34:10', '2024-07-25 09:34:10', NULL, 1, 1),
(935, 47, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:34:32', '2024-07-25 09:34:32', NULL, 1, 1),
(936, 47, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:34:58', '2024-07-25 09:34:58', NULL, 1, 1),
(937, 47, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:35:31', '2024-07-25 09:35:31', NULL, 1, 1),
(938, 47, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:36:10', '2024-07-25 09:36:10', NULL, 1, 1),
(939, 8, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:36:25', '2024-07-25 09:36:25', NULL, 1, 1),
(940, 47, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:36:37', '2024-07-25 09:36:37', NULL, 1, 1),
(941, 8, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:36:40', '2024-07-25 09:36:40', NULL, 1, 1),
(942, 8, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:36:59', '2024-07-25 09:36:59', NULL, 1, 1),
(943, 47, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:37:04', '2024-07-27 09:07:02', NULL, 1, 1),
(944, 8, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:37:09', '2024-07-25 09:37:09', NULL, 1, 1),
(945, 8, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:37:23', '2024-07-25 09:37:23', NULL, 1, 1),
(946, 47, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:37:32', '2024-07-27 09:07:13', NULL, 1, 1),
(947, 9, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:37:47', '2024-07-25 09:37:47', NULL, 1, 1),
(948, 9, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:37:59', '2024-07-25 09:37:59', NULL, 1, 1),
(949, 9, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:38:12', '2024-07-25 09:38:12', NULL, 1, 1),
(950, 47, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:38:13', '2024-07-25 09:38:13', NULL, 1, 1),
(951, 9, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:38:33', '2024-07-25 09:38:33', NULL, 1, 1),
(952, 47, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:38:49', '2024-07-25 09:38:49', NULL, 1, 1),
(953, 9, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:39:01', '2024-07-25 09:39:01', NULL, 1, 1),
(954, 9, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:39:23', '2024-07-25 09:39:23', NULL, 1, 1),
(955, 47, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:39:27', '2024-07-25 09:39:27', NULL, 1, 1),
(956, 9, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:39:42', '2024-07-25 09:39:42', NULL, 1, 1),
(957, 49, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:39:56', '2024-07-25 09:39:56', NULL, 1, 1),
(958, 9, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:39:59', '2024-07-25 09:39:59', NULL, 1, 1),
(959, 49, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:40:17', '2024-07-25 09:40:17', NULL, 1, 1),
(960, 9, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:40:20', '2024-07-25 09:40:20', NULL, 1, 1),
(961, 9, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:40:32', '2024-07-25 09:40:32', NULL, 1, 1),
(962, 49, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:40:36', '2024-07-25 09:40:36', NULL, 1, 1),
(963, 9, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:40:44', '2024-07-25 09:40:44', NULL, 1, 1),
(964, 49, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:40:58', '2024-07-25 09:40:58', NULL, 1, 1),
(965, 49, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:41:40', '2024-07-27 09:08:23', NULL, 1, 1),
(966, 49, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:41:57', '2024-07-25 09:41:57', NULL, 1, 1),
(967, 49, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:42:24', '2024-07-27 09:08:37', NULL, 1, 1),
(968, 49, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:42:58', '2024-07-27 09:08:45', NULL, 1, 1),
(969, 11, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 1, 0, 0, 0, 1, 0, 0, '2024-07-25 09:43:12', '2024-07-25 09:43:12', NULL, 1, 1),
(970, 49, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:43:24', '2024-07-25 09:43:24', NULL, 1, 1),
(971, 11, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:43:43', '2024-07-25 09:43:43', NULL, 1, 1),
(972, 49, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:43:55', '2024-07-25 09:43:55', NULL, 1, 1),
(973, 11, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:44:13', '2024-07-25 09:44:13', NULL, 1, 1),
(974, 49, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:44:19', '2024-07-25 09:44:19', NULL, 1, 1),
(975, 11, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:44:37', '2024-07-25 09:44:37', NULL, 1, 1),
(976, 50, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:44:49', '2024-07-25 09:44:49', NULL, 1, 1),
(977, 50, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:45:09', '2024-07-25 09:45:09', NULL, 1, 1),
(978, 50, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:45:32', '2024-07-25 09:45:32', NULL, 1, 1),
(979, 11, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:45:37', '2024-07-25 09:45:37', NULL, 1, 1),
(980, 50, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:45:54', '2024-07-25 09:45:54', NULL, 1, 1),
(981, 12, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 1, 0, 0, 0, 1, 0, 0, '2024-07-25 09:46:21', '2024-07-25 09:50:42', NULL, 1, 1),
(982, 149, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:47:04', '2024-07-25 09:47:04', NULL, 1, 1),
(983, 149, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:47:21', '2024-07-25 09:47:21', NULL, 1, 1),
(984, 12, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:47:25', '2024-07-25 09:47:25', NULL, 1, 1),
(985, 50, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:47:39', '2024-07-25 09:47:39', NULL, 1, 1),
(986, 12, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:47:45', '2024-07-25 09:47:45', NULL, 1, 1),
(987, 149, NULL, 'مبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:47:50', '2024-07-25 09:47:50', NULL, 1, 1),
(988, 50, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:48:00', '2024-07-25 09:48:00', NULL, 1, 1),
(989, 149, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:48:09', '2024-07-28 10:43:11', NULL, 1, 1),
(990, 12, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:48:10', '2024-07-25 09:48:10', NULL, 1, 1),
(991, 12, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:48:35', '2024-07-25 09:48:35', NULL, 1, 1),
(992, 149, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 09:48:48', '2024-07-28 10:43:34', NULL, 1, 1),
(993, 149, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:49:11', '2024-07-28 10:43:43', NULL, 1, 1),
(994, 13, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 1, 0, 0, 0, 1, 0, 0, '2024-07-25 09:49:12', '2024-07-25 09:50:33', NULL, 1, 1),
(995, 13, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:49:31', '2024-07-25 09:49:31', NULL, 1, 1),
(996, 149, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 09:49:42', '2024-07-28 10:44:20', NULL, 1, 1),
(997, 13, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:49:45', '2024-07-25 09:49:45', NULL, 1, 1),
(998, 50, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:49:49', '2024-07-25 09:49:49', NULL, 1, 1),
(999, 13, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:49:58', '2024-07-27 08:51:20', NULL, 1, 1),
(1000, 50, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:50:09', '2024-07-27 09:09:49', NULL, 1, 1),
(1001, 13, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:50:17', '2024-07-25 09:50:17', NULL, 1, 1),
(1002, 149, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 09:50:18', '2024-07-25 09:50:18', NULL, 1, 1),
(1003, 50, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:50:31', '2024-07-27 09:10:10', NULL, 1, 1),
(1004, 149, NULL, 'المحصلة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 09:50:37', '2024-07-28 10:51:20', NULL, 1, 1),
(1005, 150, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:51:37', '2024-07-25 09:51:37', NULL, 1, 1),
(1006, 57, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:51:45', '2024-07-25 09:51:45', NULL, 1, 1),
(1007, 57, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:51:55', '2024-07-25 09:51:55', NULL, 1, 1),
(1008, 150, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:52:00', '2024-07-25 09:52:00', NULL, 1, 1),
(1009, 57, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:52:07', '2024-07-25 09:52:07', NULL, 1, 1),
(1010, 50, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:52:11', '2024-07-25 09:52:11', NULL, 1, 1),
(1011, 150, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:52:16', '2024-07-25 09:52:16', NULL, 1, 1),
(1012, 57, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:52:17', '2024-07-25 09:52:17', NULL, 1, 1),
(1013, 50, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:52:33', '2024-07-25 09:52:33', NULL, 1, 1),
(1014, 150, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:52:33', '2024-07-25 09:52:33', NULL, 1, 1),
(1015, 57, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:52:46', '2024-07-25 09:52:46', NULL, 1, 1),
(1016, 57, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:52:59', '2024-07-25 09:52:59', NULL, 1, 1),
(1017, 51, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:53:04', '2024-07-25 09:53:04', NULL, 1, 1),
(1018, 150, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 09:53:10', '2024-07-28 10:45:38', NULL, 1, 1),
(1019, 51, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:53:21', '2024-07-25 09:53:21', NULL, 1, 1),
(1020, 51, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:53:49', '2024-07-25 09:53:49', NULL, 1, 1),
(1021, 51, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:54:07', '2024-07-27 09:10:56', NULL, 1, 1),
(1022, 57, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:54:37', '2024-07-25 09:54:37', NULL, 1, 1),
(1023, 51, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:54:44', '2024-07-25 09:54:44', NULL, 1, 1),
(1024, 150, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:54:56', '2024-07-25 09:54:56', NULL, 1, 1),
(1025, 51, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:55:11', '2024-07-25 09:55:11', NULL, 1, 1),
(1026, 57, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:55:18', '2024-07-25 09:55:18', NULL, 1, 1),
(1027, 51, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:55:55', '2024-07-25 09:55:55', NULL, 1, 1),
(1028, 57, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:56:31', '2024-07-25 09:56:31', NULL, 1, 1),
(1029, 51, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:56:39', '2024-07-27 09:11:38', NULL, 1, 1),
(1030, 57, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:56:43', '2024-07-25 09:56:43', NULL, 1, 1),
(1031, 57, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:57:10', '2024-07-25 09:57:10', NULL, 1, 1),
(1032, 51, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:57:26', '2024-07-25 09:57:26', NULL, 1, 1),
(1033, 58, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:57:43', '2024-07-25 09:57:43', NULL, 1, 1),
(1034, 150, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 09:57:44', '2024-07-28 10:45:55', NULL, 1, 1),
(1035, 51, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 09:57:53', '2024-07-25 09:57:53', NULL, 1, 1),
(1036, 58, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:58:11', '2024-07-25 09:58:11', NULL, 1, 1),
(1037, 150, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 09:58:15', '2024-07-25 09:58:15', NULL, 1, 1),
(1038, 51, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 09:58:20', '2024-07-25 09:58:20', NULL, 1, 1),
(1039, 58, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:58:23', '2024-07-25 09:58:23', NULL, 1, 1),
(1040, 58, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:59:38', '2024-07-25 09:59:38', NULL, 1, 1),
(1041, 53, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 09:59:48', '2024-07-25 09:59:48', NULL, 1, 1),
(1042, 53, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 10:00:10', '2024-07-27 09:12:11', NULL, 1, 1),
(1043, 58, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:00:18', '2024-07-25 10:00:18', NULL, 1, 1),
(1044, 58, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:00:34', '2024-07-25 10:00:34', NULL, 1, 1),
(1045, 53, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:00:41', '2024-07-27 09:12:29', NULL, 1, 1),
(1046, 58, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:00:59', '2024-07-25 10:00:59', NULL, 1, 1),
(1047, 58, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:01:12', '2024-07-25 10:01:12', NULL, 1, 1),
(1048, 53, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:01:33', '2024-07-25 10:01:33', NULL, 1, 1),
(1049, 58, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:01:38', '2024-07-25 10:01:38', NULL, 1, 1),
(1050, 58, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 10:01:49', '2024-07-25 10:01:49', NULL, 1, 1),
(1051, 53, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 10:01:52', '2024-07-27 09:12:45', NULL, 1, 1),
(1052, 58, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 10:03:02', '2024-07-25 10:03:02', NULL, 1, 1),
(1053, 55, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:03:32', '2024-07-25 10:03:32', NULL, 1, 1),
(1054, 55, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 10:03:49', '2024-07-27 09:13:06', NULL, 1, 1),
(1055, 59, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:04:23', '2024-07-25 10:04:23', NULL, 1, 1),
(1056, 55, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:04:29', '2024-07-25 10:04:29', NULL, 1, 1),
(1057, 59, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:04:35', '2024-07-25 10:04:35', NULL, 1, 1),
(1058, 59, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:04:57', '2024-07-25 10:04:57', NULL, 1, 1),
(1059, 59, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:05:11', '2024-07-25 10:05:11', NULL, 1, 1),
(1060, 150, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 10:05:14', '2024-07-28 10:46:12', NULL, 1, 1),
(1061, 55, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:05:23', '2024-07-25 10:05:23', NULL, 1, 1),
(1062, 59, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:05:54', '2024-07-25 10:05:54', NULL, 1, 1),
(1063, 59, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:06:21', '2024-07-25 10:06:21', NULL, 1, 1),
(1064, 55, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 10:06:27', '2024-07-25 10:06:27', NULL, 1, 1),
(1065, 59, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:06:57', '2024-07-25 10:06:57', NULL, 1, 1),
(1066, 59, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:07:11', '2024-07-25 10:07:11', NULL, 1, 1),
(1067, 56, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:07:16', '2024-07-25 10:07:16', NULL, 1, 1),
(1068, 56, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 10:07:37', '2024-07-27 09:13:47', NULL, 1, 1),
(1069, 59, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:08:01', '2024-07-25 10:08:01', NULL, 1, 1),
(1070, 56, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:08:01', '2024-07-27 09:14:06', NULL, 1, 1),
(1071, 151, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:08:11', '2024-07-28 10:47:57', NULL, 1, 1),
(1072, 151, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:08:25', '2024-07-25 10:08:25', NULL, 1, 1),
(1073, 59, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 10:08:32', '2024-07-25 10:08:32', NULL, 1, 1),
(1074, 56, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:08:38', '2024-07-25 10:08:38', NULL, 1, 1),
(1075, 151, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:08:47', '2024-07-25 10:08:47', NULL, 1, 1),
(1076, 59, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 10:08:54', '2024-07-25 10:08:54', NULL, 1, 1),
(1077, 56, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 10:08:57', '2024-07-25 10:08:57', NULL, 1, 1),
(1078, 151, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:09:03', '2024-07-25 10:09:03', NULL, 1, 1),
(1079, 60, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:09:11', '2024-07-25 10:09:11', NULL, 1, 1),
(1080, 60, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:09:22', '2024-07-25 10:09:22', NULL, 1, 1),
(1081, 60, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:09:33', '2024-07-25 10:09:33', NULL, 1, 1),
(1082, 151, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 10:09:46', '2024-07-28 10:48:24', NULL, 1, 1),
(1083, 60, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:09:47', '2024-07-25 10:09:47', NULL, 1, 1),
(1084, 151, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 10:10:00', '2024-07-28 10:49:08', NULL, 1, 1),
(1085, 60, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:10:07', '2024-07-25 10:10:07', NULL, 1, 1),
(1086, 15, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:10:08', '2024-07-25 10:10:08', NULL, 1, 1),
(1087, 151, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 10:10:24', '2024-07-28 10:49:18', NULL, 1, 1),
(1088, 60, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:10:24', '2024-07-25 10:10:24', NULL, 1, 1),
(1089, 15, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:10:25', '2024-07-25 10:10:25', NULL, 1, 1),
(1090, 60, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:10:42', '2024-07-25 10:10:42', NULL, 1, 1),
(1091, 151, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 10:10:47', '2024-07-25 10:10:47', NULL, 1, 1),
(1092, 15, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:10:53', '2024-07-25 10:10:53', NULL, 1, 1),
(1093, 60, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:10:56', '2024-07-25 10:10:56', NULL, 1, 1),
(1094, 15, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:11:16', '2024-07-25 10:11:16', NULL, 1, 1),
(1095, 60, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:11:18', '2024-07-25 10:11:18', NULL, 1, 1),
(1096, 151, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 10:11:21', '2024-07-28 10:49:35', NULL, 1, 1),
(1097, 60, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 10:11:36', '2024-07-25 10:11:36', NULL, 1, 1),
(1098, 152, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:11:48', '2024-07-25 10:11:48', NULL, 1, 1),
(1099, 60, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 10:11:54', '2024-07-25 10:11:54', NULL, 1, 1),
(1100, 15, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 10:12:06', '2024-07-28 09:07:49', NULL, 1, 1),
(1101, 15, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 10:12:32', '2024-07-28 09:10:28', NULL, 1, 1),
(1102, 152, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:12:57', '2024-07-25 10:12:57', NULL, 1, 1),
(1103, 15, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 10:13:23', '2024-07-28 09:10:50', NULL, 1, 1),
(1104, 152, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:13:33', '2024-07-25 10:13:33', NULL, 1, 1),
(1105, 61, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:13:34', '2024-07-25 10:13:34', NULL, 1, 1),
(1107, 152, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:13:58', '2024-07-28 10:49:59', NULL, 1, 1),
(1108, 61, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:14:09', '2024-07-25 10:14:09', NULL, 1, 1),
(1109, 61, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:14:33', '2024-07-25 10:14:33', NULL, 1, 1),
(1110, 152, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 10:14:52', '2024-07-28 10:50:10', NULL, 1, 1),
(1111, 15, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:15:04', '2024-07-25 10:15:04', NULL, 1, 1),
(1112, 61, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:15:07', '2024-07-25 10:15:07', NULL, 1, 1),
(1113, 152, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 10:15:32', '2024-07-28 10:50:53', NULL, 1, 1),
(1114, 61, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:15:32', '2024-07-25 10:15:32', NULL, 1, 1),
(1116, 152, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 10:16:00', '2024-07-28 10:50:48', NULL, 1, 1),
(1118, 61, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:16:15', '2024-07-25 10:16:15', NULL, 1, 1),
(1119, 152, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 10:16:26', '2024-07-25 10:16:26', NULL, 1, 1),
(1120, 61, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:16:45', '2024-07-25 10:16:45', NULL, 1, 1),
(1121, 152, NULL, 'الدرجة النهائية', NULL, 'divide', 1, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 10:16:47', '2024-07-28 10:51:05', NULL, 1, 1),
(1122, 17, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:17:00', '2024-07-25 10:17:00', NULL, 1, 1),
(1123, 17, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:17:17', '2024-07-28 09:17:05', NULL, 1, 1),
(1124, 155, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:17:30', '2024-07-25 10:17:30', NULL, 1, 1),
(1125, 17, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:17:39', '2024-07-25 10:17:39', NULL, 1, 1),
(1126, 155, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:17:47', '2024-07-25 10:17:47', NULL, 1, 1),
(1127, 61, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:17:47', '2024-07-25 10:17:47', NULL, 1, 1),
(1128, 17, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:17:59', '2024-07-25 10:17:59', NULL, 1, 1),
(1129, 155, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:18:05', '2024-07-25 10:18:05', NULL, 1, 1),
(1130, 61, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:18:15', '2024-07-25 10:18:15', NULL, 1, 1),
(1131, 61, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 10:18:28', '2024-07-25 10:18:28', NULL, 1, 1),
(1133, 17, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 10:18:41', '2024-07-28 09:17:55', NULL, 1, 1),
(1134, 61, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 10:18:41', '2024-07-25 10:18:41', NULL, 1, 1),
(1135, 17, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 10:19:01', '2024-07-28 09:26:15', NULL, 1, 1),
(1136, 155, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:19:45', '2024-07-25 10:19:45', NULL, 1, 1),
(1137, 155, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 10:20:21', '2024-07-28 10:52:05', NULL, 1, 1),
(1138, 62, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:20:25', '2024-07-25 10:20:25', NULL, 1, 1),
(1139, 62, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:20:50', '2024-07-25 10:20:50', NULL, 1, 1),
(1140, 62, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:21:08', '2024-07-25 10:21:08', NULL, 1, 1),
(1141, 62, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:21:21', '2024-07-25 10:21:21', NULL, 1, 1),
(1142, 17, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 10:21:42', '2024-07-28 09:26:24', NULL, 1, 1),
(1143, 62, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:21:46', '2024-07-25 10:21:46', NULL, 1, 1),
(1145, 17, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 10:22:43', '2024-07-28 09:26:32', NULL, 1, 1),
(1148, 18, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:24:56', '2024-07-25 10:26:12', NULL, 1, 1),
(1149, 62, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:25:35', '2024-07-25 10:25:35', NULL, 1, 1),
(1150, 18, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:25:56', '2024-07-25 10:25:56', NULL, 1, 1),
(1151, 62, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:26:05', '2024-07-25 10:26:05', NULL, 1, 1),
(1152, 18, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:26:34', '2024-07-25 10:26:34', NULL, 1, 1),
(1153, 62, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:26:46', '2024-07-25 10:26:46', NULL, 1, 1),
(1154, 18, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:27:04', '2024-07-25 10:27:04', NULL, 1, 1),
(1155, 62, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:27:08', '2024-07-25 10:27:08', NULL, 1, 1),
(1156, 62, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 10:27:20', '2024-07-25 10:27:20', NULL, 1, 1),
(1157, 155, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 10:27:26', '2024-07-25 10:27:26', NULL, 1, 1),
(1158, 18, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 10:27:37', '2024-07-28 09:28:37', NULL, 1, 1),
(1159, 62, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 10:27:39', '2024-07-25 10:27:39', NULL, 1, 1),
(1160, 155, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 10:27:50', '2024-07-28 10:52:25', NULL, 1, 1),
(1161, 63, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:27:59', '2024-07-25 10:27:59', NULL, 1, 1),
(1162, 18, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 10:28:00', '2024-07-28 09:30:39', NULL, 1, 1),
(1163, 63, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:28:13', '2024-07-25 10:28:13', NULL, 1, 1),
(1164, 63, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:28:35', '2024-07-25 10:28:35', NULL, 1, 1),
(1165, 63, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:28:58', '2024-07-25 10:28:58', NULL, 1, 1),
(1166, 18, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 10:29:08', '2024-07-28 09:29:45', NULL, 1, 1),
(1167, 63, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:30:07', '2024-07-25 10:30:07', NULL, 1, 1),
(1169, 63, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:30:21', '2024-07-25 10:30:21', NULL, 1, 1),
(1171, 63, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:31:20', '2024-07-25 10:31:20', NULL, 1, 1),
(1172, 155, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 10:31:44', '2024-07-25 10:31:44', NULL, 1, 1),
(1173, 63, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:31:47', '2024-07-25 10:31:47', NULL, 1, 1),
(1174, 63, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:32:25', '2024-07-25 10:32:25', NULL, 1, 1),
(1175, 63, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 10:32:56', '2024-07-25 10:32:56', NULL, 1, 1),
(1176, 155, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 10:33:03', '2024-07-28 10:52:42', NULL, 1, 1),
(1177, 63, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 10:33:08', '2024-07-25 10:33:08', NULL, 1, 1),
(1178, 18, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 10:33:09', '2024-07-28 09:31:02', NULL, 1, 1),
(1179, 64, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:33:39', '2024-07-25 10:33:39', NULL, 1, 1),
(1181, 64, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:33:53', '2024-07-25 10:33:53', NULL, 1, 1),
(1183, 64, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:34:18', '2024-07-25 10:34:18', NULL, 1, 1),
(1184, 64, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:34:30', '2024-07-25 10:34:30', NULL, 1, 1),
(1185, 64, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:35:07', '2024-07-25 10:35:07', NULL, 1, 1),
(1186, 64, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:35:24', '2024-07-25 10:35:24', NULL, 1, 1),
(1187, 153, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:35:39', '2024-07-25 10:35:39', NULL, 1, 1),
(1188, 19, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:35:43', '2024-07-25 10:37:38', NULL, 1, 1),
(1189, 153, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:36:08', '2024-07-25 10:36:08', NULL, 1, 1),
(1190, 64, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:36:10', '2024-07-25 10:36:10', NULL, 1, 1),
(1191, 153, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:36:22', '2024-07-25 10:36:22', NULL, 1, 1),
(1192, 64, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:36:32', '2024-07-25 10:36:32', NULL, 1, 1);
INSERT INTO `parts` (`id`, `year_class_subject_id`, `mark_review_id`, `name`, `value`, `operation`, `is_final_result`, `max_per_cent`, `has_mark_review`, `is_semi_final_result`, `is_result_part`, `is_sealed`, `is_visible`, `is_active`, `must_be_calculated`, `must_be_ceiled`, `created_at`, `updated_at`, `term_id`, `is_in_results`, `is_in_final`) VALUES
(1193, 153, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:36:41', '2024-07-25 10:36:41', NULL, 1, 1),
(1194, 64, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:36:53', '2024-07-25 10:36:53', NULL, 1, 1),
(1195, 64, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 10:37:08', '2024-07-25 10:37:08', NULL, 1, 1),
(1196, 19, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:37:24', '2024-07-25 10:37:24', NULL, 1, 1),
(1197, 64, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 10:37:25', '2024-07-25 10:37:25', NULL, 1, 1),
(1198, 65, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:37:55', '2024-07-25 10:37:56', NULL, 1, 1),
(1199, 19, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:38:01', '2024-07-25 10:38:01', NULL, 1, 1),
(1200, 65, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:38:08', '2024-07-25 10:38:08', NULL, 1, 1),
(1201, 153, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 10:38:24', '2024-07-28 10:53:11', NULL, 1, 1),
(1202, 65, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:38:38', '2024-07-25 10:38:38', NULL, 1, 1),
(1203, 65, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:39:00', '2024-07-25 10:39:00', NULL, 1, 1),
(1204, 153, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 10:39:11', '2024-07-25 10:39:11', NULL, 1, 1),
(1205, 65, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:39:31', '2024-07-28 08:46:30', NULL, 1, 1),
(1206, 153, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 10:39:44', '2024-07-28 10:53:35', NULL, 1, 1),
(1207, 65, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:39:57', '2024-07-25 10:39:57', NULL, 1, 1),
(1208, 65, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:40:32', '2024-07-25 10:40:32', NULL, 1, 1),
(1209, 153, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 10:40:45', '2024-07-25 10:40:45', NULL, 1, 1),
(1210, 65, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:41:02', '2024-07-25 10:41:02', NULL, 1, 1),
(1211, 153, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 10:41:08', '2024-07-28 10:53:50', NULL, 1, 1),
(1212, 19, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:41:39', '2024-07-25 10:41:39', NULL, 1, 1),
(1213, 65, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:42:23', '2024-07-25 10:42:23', NULL, 1, 1),
(1214, 19, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 10:42:36', '2024-07-28 09:35:02', NULL, 1, 1),
(1215, 65, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 10:42:57', '2024-07-25 10:42:57', NULL, 1, 1),
(1216, 65, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 10:43:07', '2024-07-25 10:43:07', NULL, 1, 1),
(1217, 19, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 10:43:09', '2024-07-28 09:35:09', NULL, 1, 1),
(1218, 66, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:44:20', '2024-07-25 10:44:20', NULL, 1, 1),
(1219, 19, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 10:44:39', '2024-07-28 09:35:29', NULL, 1, 1),
(1220, 66, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:45:02', '2024-07-25 10:45:02', NULL, 1, 1),
(1221, 66, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:45:38', '2024-07-25 10:45:38', NULL, 1, 1),
(1222, 66, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:47:23', '2024-07-25 10:47:23', NULL, 1, 1),
(1223, 66, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:48:35', '2024-07-25 10:48:35', NULL, 1, 1),
(1224, 66, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:49:30', '2024-07-25 10:49:30', NULL, 1, 1),
(1226, 66, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:50:11', '2024-07-25 10:50:11', NULL, 1, 1),
(1227, 154, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:50:31', '2024-07-28 10:54:06', NULL, 1, 1),
(1228, 66, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:50:56', '2024-07-25 10:50:56', NULL, 1, 1),
(1229, 19, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 10:51:11', '2024-07-28 09:35:35', NULL, 1, 1),
(1230, 66, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:51:25', '2024-07-25 10:51:25', NULL, 1, 1),
(1231, 154, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:51:40', '2024-07-25 10:51:40', NULL, 1, 1),
(1232, 66, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 10:51:54', '2024-07-25 10:51:54', NULL, 1, 1),
(1234, 66, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 10:52:19', '2024-07-25 10:52:19', NULL, 1, 1),
(1235, 154, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:52:24', '2024-07-25 10:52:24', NULL, 1, 1),
(1237, 68, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:53:31', '2024-07-28 08:56:07', NULL, 1, 1),
(1238, 20, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:53:46', '2024-07-25 10:53:46', NULL, 1, 1),
(1239, 154, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:54:09', '2024-07-25 10:54:09', NULL, 1, 1),
(1240, 68, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 1, 0, 0, 1, 1, 0, 0, '2024-07-25 10:54:12', '2024-07-28 08:58:05', NULL, 1, 1),
(1241, 68, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:54:34', '2024-07-25 10:54:34', NULL, 1, 1),
(1242, 20, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:54:55', '2024-07-25 10:54:55', NULL, 1, 1),
(1243, 68, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:54:59', '2024-07-25 10:54:59', NULL, 1, 1),
(1244, 20, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:55:11', '2024-07-25 10:55:11', NULL, 1, 1),
(1245, 68, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 10:55:17', '2024-07-25 10:55:17', NULL, 1, 1),
(1246, 20, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:55:27', '2024-07-25 10:55:27', NULL, 1, 1),
(1247, 20, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 10:56:09', '2024-07-28 09:37:35', NULL, 1, 1),
(1248, 69, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:56:15', '2024-07-28 08:57:31', NULL, 1, 1),
(1249, 20, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 10:56:34', '2024-07-28 09:37:51', NULL, 1, 1),
(1250, 69, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 1, 0, 0, 1, 1, 0, 0, '2024-07-25 10:56:58', '2024-07-28 08:57:42', NULL, 1, 1),
(1251, 154, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 10:57:05', '2024-07-28 10:54:56', NULL, 1, 1),
(1252, 69, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:57:17', '2024-07-25 10:57:17', NULL, 1, 1),
(1253, 20, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 10:58:11', '2024-07-28 09:38:04', NULL, 1, 1),
(1254, 69, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 10:58:23', '2024-07-25 10:58:23', NULL, 1, 1),
(1255, 154, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 10:58:27', '2024-07-28 10:55:33', NULL, 1, 1),
(1257, 69, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 10:58:45', '2024-07-25 10:58:45', NULL, 1, 1),
(1258, 20, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 10:59:29', '2024-07-28 09:38:09', NULL, 1, 1),
(1259, 70, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 10:59:47', '2024-07-28 08:58:34', NULL, 1, 1),
(1261, 70, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 1, 0, 0, 1, 1, 0, 0, '2024-07-25 11:00:15', '2024-07-28 08:58:43', NULL, 1, 1),
(1262, 154, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:00:23', '2024-07-25 11:00:23', NULL, 1, 1),
(1264, 70, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 11:00:44', '2024-07-25 11:00:44', NULL, 1, 1),
(1265, 70, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 11:01:52', '2024-07-25 11:01:52', NULL, 1, 1),
(1266, 21, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:02:01', '2024-07-25 11:02:12', NULL, 1, 1),
(1267, 21, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:02:51', '2024-07-25 11:02:51', NULL, 1, 1),
(1268, 21, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:03:11', '2024-07-25 11:03:11', NULL, 1, 1),
(1269, 21, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:03:36', '2024-07-25 11:03:36', NULL, 1, 1),
(1270, 154, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:03:45', '2024-07-25 11:03:45', NULL, 1, 1),
(1271, 70, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 11:03:54', '2024-07-25 11:03:54', NULL, 1, 1),
(1272, 154, NULL, 'الدرجة النهائية', NULL, 'divide', 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:04:18', '2024-07-28 10:56:16', NULL, 1, 1),
(1273, 21, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:05:00', '2024-07-28 09:40:10', NULL, 1, 1),
(1274, 21, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 11:05:27', '2024-07-28 09:40:49', NULL, 1, 1),
(1275, 21, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:06:06', '2024-07-28 09:40:57', NULL, 1, 1),
(1277, 168, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:06:55', '2024-07-25 11:06:55', NULL, 1, 1),
(1278, 168, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:07:08', '2024-07-25 11:07:08', NULL, 1, 1),
(1279, 21, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:07:11', '2024-07-28 09:41:04', NULL, 1, 1),
(1280, 168, NULL, 'مبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:07:32', '2024-07-25 11:07:32', NULL, 1, 1),
(1281, 157, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:07:34', '2024-07-25 11:07:34', NULL, 1, 1),
(1283, 168, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:08:01', '2024-07-25 11:08:01', NULL, 1, 1),
(1285, 157, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:08:33', '2024-07-25 11:08:33', NULL, 1, 1),
(1286, 168, NULL, 'درجة الأعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:08:40', '2024-07-25 11:10:07', NULL, 1, 1),
(1287, 168, NULL, 'درجة الامتحان', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 11:09:02', '2024-07-25 11:10:24', NULL, 1, 1),
(1288, 157, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:09:04', '2024-07-25 11:09:04', NULL, 1, 1),
(1289, 22, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:09:25', '2024-07-25 11:09:52', NULL, 1, 1),
(1290, 157, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:09:26', '2024-07-25 11:09:26', NULL, 1, 1),
(1291, 168, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:09:33', '2024-07-25 11:10:30', NULL, 1, 1),
(1292, 22, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:09:41', '2024-07-25 11:09:41', NULL, 1, 1),
(1293, 168, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:09:59', '2024-07-25 11:09:59', NULL, 1, 1),
(1294, 22, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:10:15', '2024-07-25 11:10:15', NULL, 1, 1),
(1295, 22, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:10:35', '2024-07-25 11:10:35', NULL, 1, 1),
(1296, 157, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:10:39', '2024-07-28 10:58:34', NULL, 1, 1),
(1297, 22, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:11:07', '2024-07-28 09:42:55', NULL, 1, 1),
(1298, 168, NULL, 'المحصلة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:11:40', '2024-07-25 11:11:40', NULL, 1, 1),
(1299, 22, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 11:11:44', '2024-07-28 09:43:01', NULL, 1, 1),
(1300, 157, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 11:12:14', '2024-07-25 11:12:14', NULL, 1, 1),
(1301, 158, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:12:14', '2024-07-25 11:12:14', NULL, 1, 1),
(1302, 22, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:12:15', '2024-07-28 09:43:07', NULL, 1, 1),
(1303, 158, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:12:31', '2024-07-25 11:12:31', NULL, 1, 1),
(1304, 158, NULL, 'مبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:12:43', '2024-07-25 11:12:43', NULL, 1, 1),
(1306, 157, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:12:49', '2024-07-28 10:58:52', NULL, 1, 1),
(1307, 158, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:13:03', '2024-07-25 11:13:03', NULL, 1, 1),
(1308, 157, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:13:19', '2024-07-25 11:13:19', NULL, 1, 1),
(1309, 158, NULL, 'درجة الأعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:13:31', '2024-07-25 11:13:31', NULL, 1, 1),
(1310, 157, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:13:33', '2024-07-28 10:59:09', NULL, 1, 1),
(1311, 158, NULL, 'درجة الامتحان', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 11:13:44', '2024-07-25 11:13:44', NULL, 1, 1),
(1312, 22, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-25 11:13:54', '2024-07-25 11:13:54', NULL, 1, 1),
(1314, 158, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:14:32', '2024-07-25 11:14:32', NULL, 1, 1),
(1317, 158, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:15:24', '2024-07-25 11:15:24', NULL, 1, 1),
(1318, 159, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:15:34', '2024-07-25 11:15:34', NULL, 1, 1),
(1319, 23, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:15:45', '2024-07-28 09:45:17', NULL, 1, 1),
(1320, 159, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:16:03', '2024-07-28 11:00:27', NULL, 1, 1),
(1321, 159, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:16:15', '2024-07-28 11:00:37', NULL, 1, 1),
(1322, 158, NULL, 'المحصلة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:16:46', '2024-07-25 11:16:46', NULL, 1, 1),
(1323, 159, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:16:50', '2024-07-28 11:00:44', NULL, 1, 1),
(1324, 160, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:17:05', '2024-07-25 11:17:05', NULL, 1, 1),
(1325, 160, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:17:17', '2024-07-25 11:17:17', NULL, 1, 1),
(1326, 159, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:17:21', '2024-07-28 11:00:54', NULL, 1, 1),
(1327, 160, NULL, 'مبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:17:31', '2024-07-25 11:17:31', NULL, 1, 1),
(1328, 23, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:17:43', '2024-07-25 11:17:43', NULL, 1, 1),
(1329, 160, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:17:46', '2024-07-25 11:17:46', NULL, 1, 1),
(1330, 23, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:18:05', '2024-07-25 11:18:05', NULL, 1, 1),
(1331, 160, NULL, 'درجة الأعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:18:09', '2024-07-25 11:18:09', NULL, 1, 1),
(1332, 160, NULL, 'درجة الامتحان', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 11:18:34', '2024-07-25 11:18:34', NULL, 1, 1),
(1333, 23, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:19:10', '2024-07-25 11:19:10', NULL, 1, 1),
(1334, 160, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:19:51', '2024-07-25 11:19:51', NULL, 1, 1),
(1335, 160, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:20:09', '2024-07-25 11:20:09', NULL, 1, 1),
(1336, 23, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:20:13', '2024-07-28 09:45:40', NULL, 1, 1),
(1337, 160, NULL, 'المحصلة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:20:34', '2024-07-25 11:20:34', NULL, 1, 1),
(1338, 159, NULL, 'اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 11:21:19', '2024-07-28 11:01:01', NULL, 1, 1),
(1339, 23, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 11:21:25', '2024-07-28 09:45:54', NULL, 1, 1),
(1340, 161, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:21:30', '2024-07-25 11:21:30', NULL, 1, 1),
(1341, 161, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:21:52', '2024-07-25 11:21:52', NULL, 1, 1),
(1342, 161, NULL, 'مبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:22:05', '2024-07-25 11:22:05', NULL, 1, 1),
(1343, 23, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:22:10', '2024-07-28 09:46:00', NULL, 1, 1),
(1344, 161, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:22:17', '2024-07-25 11:22:17', NULL, 1, 1),
(1345, 159, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:22:19', '2024-07-28 11:01:11', NULL, 1, 1),
(1347, 159, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:22:46', '2024-07-28 11:01:23', NULL, 1, 1),
(1348, 161, NULL, 'درجة الأعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:22:48', '2024-07-25 11:22:48', NULL, 1, 1),
(1349, 161, NULL, 'درجة الامتحان', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 11:23:03', '2024-07-25 11:23:03', NULL, 1, 1),
(1350, 23, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:23:07', '2024-07-28 09:46:08', NULL, 1, 1),
(1351, 159, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:23:27', '2024-07-28 11:01:35', NULL, 1, 1),
(1352, 161, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:23:32', '2024-07-25 11:23:32', NULL, 1, 1),
(1354, 161, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:23:49', '2024-07-25 11:23:49', NULL, 1, 1),
(1356, 161, NULL, 'المحصلة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:24:20', '2024-07-25 11:24:20', NULL, 1, 1),
(1357, 162, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:24:37', '2024-07-25 11:24:37', NULL, 1, 1),
(1359, 163, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:24:51', '2024-07-28 11:06:35', NULL, 1, 1),
(1360, 24, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:25:00', '2024-07-25 11:25:44', NULL, 1, 1),
(1361, 163, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:25:09', '2024-07-25 11:25:09', NULL, 1, 1),
(1362, 163, NULL, 'مبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:25:23', '2024-07-25 11:25:23', NULL, 1, 1),
(1363, 24, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:25:34', '2024-07-25 11:25:34', NULL, 1, 1),
(1364, 163, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:25:36', '2024-07-25 11:25:36', NULL, 1, 1),
(1365, 162, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:25:49', '2024-07-25 11:25:49', NULL, 1, 1),
(1366, 24, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:26:00', '2024-07-25 11:26:00', NULL, 1, 1),
(1367, 162, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:26:04', '2024-07-25 11:26:04', NULL, 1, 1),
(1368, 163, NULL, 'درجة الأعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:26:14', '2024-07-25 11:26:14', NULL, 1, 1),
(1369, 24, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:26:22', '2024-07-25 11:26:22', NULL, 1, 1),
(1370, 163, NULL, 'درجة الامتحان', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 11:26:27', '2024-07-25 11:26:27', NULL, 1, 1),
(1371, 162, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:26:38', '2024-07-25 11:26:38', NULL, 1, 1),
(1372, 24, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:26:46', '2024-07-28 09:48:30', NULL, 1, 1),
(1373, 163, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:26:53', '2024-07-25 11:26:53', NULL, 1, 1),
(1374, 162, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:27:00', '2024-07-28 11:04:31', NULL, 1, 1),
(1375, 24, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 11:27:03', '2024-07-28 09:48:37', NULL, 1, 1),
(1376, 163, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:27:11', '2024-07-25 11:27:11', NULL, 1, 1),
(1377, 162, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 11:27:17', '2024-07-25 11:27:17', NULL, 1, 1),
(1378, 24, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:27:28', '2024-07-28 09:48:43', NULL, 1, 1),
(1379, 163, NULL, 'المحصلة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:27:35', '2024-07-25 11:27:35', NULL, 1, 1),
(1380, 162, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:27:39', '2024-07-28 11:04:45', NULL, 1, 1),
(1382, 162, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:28:04', '2024-07-25 11:28:04', NULL, 1, 1),
(1383, 24, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:28:21', '2024-07-28 09:48:53', NULL, 1, 1),
(1384, 162, NULL, 'الدرجة النهائية', NULL, 'divide', 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:28:31', '2024-07-28 11:05:42', NULL, 1, 1),
(1386, 166, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-25 11:28:51', '2024-07-25 11:28:51', NULL, 1, 1),
(1388, 167, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-25 11:29:21', '2024-07-28 11:11:25', NULL, 1, 1),
(1389, 166, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 1, 0, '2024-07-25 11:29:22', '2024-07-25 11:29:22', NULL, 1, 1),
(1390, 33, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:29:39', '2024-07-25 11:29:39', NULL, 1, 1),
(1391, 167, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-25 11:29:48', '2024-07-28 11:11:35', NULL, 1, 1),
(1392, 166, NULL, 'المحصلة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:29:50', '2024-07-25 11:29:50', NULL, 1, 1),
(1393, 33, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:29:54', '2024-07-25 11:29:54', NULL, 1, 1),
(1394, 33, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:30:08', '2024-07-25 11:30:08', NULL, 1, 1),
(1395, 167, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:30:11', '2024-07-28 11:11:44', NULL, 1, 1),
(1396, 33, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:30:27', '2024-07-25 11:30:27', NULL, 1, 1),
(1397, 33, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:31:19', '2024-07-28 09:50:43', NULL, 1, 1),
(1398, 33, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 11:31:35', '2024-07-28 09:50:49', NULL, 1, 1),
(1399, 33, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:32:04', '2024-07-28 09:51:01', NULL, 1, 1),
(1401, 33, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:32:52', '2024-07-28 09:51:08', NULL, 1, 1),
(1404, 35, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-25 11:34:24', '2024-07-28 09:55:56', NULL, 1, 1),
(1406, 35, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 1, 0, '2024-07-25 11:35:10', '2024-07-28 09:56:06', NULL, 1, 1),
(1409, 36, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-25 11:36:54', '2024-07-28 09:59:27', NULL, 1, 1),
(1411, 36, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 1, 0, '2024-07-25 11:38:00', '2024-07-28 10:00:29', NULL, 1, 1),
(1414, 40, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-25 11:39:57', '2024-07-28 10:01:44', NULL, 1, 1),
(1416, 40, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 1, 0, '2024-07-25 11:40:56', '2024-07-28 10:01:51', NULL, 1, 1),
(1419, 41, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-25 11:42:23', '2024-07-28 10:07:09', NULL, 1, 1),
(1421, 41, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 1, 0, '2024-07-25 11:43:07', '2024-07-28 10:07:04', NULL, 1, 1),
(1424, 171, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:56:40', '2024-07-25 11:56:40', NULL, 1, 1),
(1425, 171, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:57:06', '2024-07-25 11:57:06', NULL, 1, 1),
(1426, 171, NULL, 'مبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:57:20', '2024-07-25 11:57:20', NULL, 1, 1),
(1427, 169, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:57:23', '2024-07-25 11:57:33', NULL, 1, 1),
(1428, 171, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:57:33', '2024-07-25 11:57:33', NULL, 1, 1),
(1429, 169, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:57:45', '2024-07-29 09:33:26', NULL, 1, 1),
(1430, 169, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:58:03', '2024-07-25 11:58:03', NULL, 1, 1),
(1431, 171, NULL, 'درجة الأعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:58:06', '2024-07-25 11:58:06', NULL, 1, 1),
(1432, 169, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 11:58:18', '2024-07-25 11:58:18', NULL, 1, 1),
(1433, 171, NULL, 'درجة الامتحان', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 11:58:21', '2024-07-28 10:55:43', NULL, 1, 1),
(1434, 169, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:58:47', '2024-07-28 10:52:31', NULL, 1, 1),
(1435, 169, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 11:59:07', '2024-07-25 11:59:07', NULL, 1, 1),
(1436, 171, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:59:17', '2024-07-25 11:59:17', NULL, 1, 1),
(1437, 171, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:59:40', '2024-07-25 11:59:40', NULL, 1, 1),
(1438, 169, NULL, 'مجموع درجات  الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 11:59:47', '2024-07-28 10:53:05', NULL, 1, 1),
(1439, 171, NULL, 'المحصلة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:00:16', '2024-07-25 12:00:16', NULL, 1, 1),
(1440, 169, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:00:40', '2024-07-25 12:00:40', NULL, 1, 1),
(1441, 172, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:00:47', '2024-07-25 12:00:47', NULL, 1, 1),
(1442, 172, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:00:56', '2024-07-25 12:00:56', NULL, 1, 1),
(1443, 172, NULL, 'مبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:01:08', '2024-07-25 12:01:08', NULL, 1, 1),
(1444, 172, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:01:20', '2024-07-25 12:01:20', NULL, 1, 1),
(1445, 169, NULL, 'الدرجة النهائية', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:01:24', '2024-07-28 10:53:36', NULL, 1, 1),
(1446, 172, NULL, 'درجة الأعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:02:05', '2024-07-25 12:02:05', NULL, 1, 1),
(1447, 173, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:02:15', '2024-07-25 12:02:15', NULL, 1, 1),
(1448, 172, NULL, 'درجة الامتحان', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 12:02:16', '2024-07-25 12:02:16', NULL, 1, 1),
(1449, 173, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:02:33', '2024-07-25 12:02:33', NULL, 1, 1),
(1450, 172, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:02:52', '2024-07-25 12:02:52', NULL, 1, 1),
(1451, 173, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:02:55', '2024-07-25 12:02:55', NULL, 1, 1),
(1452, 173, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:03:09', '2024-07-25 12:03:09', NULL, 1, 1),
(1453, 172, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:03:13', '2024-07-25 12:03:13', NULL, 1, 1),
(1454, 173, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:03:34', '2024-07-29 09:50:37', NULL, 1, 1),
(1455, 172, NULL, 'المحصلة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:03:41', '2024-07-25 12:03:41', NULL, 1, 1),
(1456, 173, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 12:03:55', '2024-07-25 12:03:55', NULL, 1, 1),
(1457, 175, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:03:57', '2024-07-25 12:03:57', NULL, 1, 1),
(1458, 175, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:04:07', '2024-07-25 12:04:07', NULL, 1, 1),
(1459, 175, NULL, 'مبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:04:23', '2024-07-25 12:04:23', NULL, 1, 1),
(1460, 173, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:04:28', '2024-07-29 09:50:57', NULL, 1, 1),
(1461, 175, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:04:33', '2024-07-25 12:04:33', NULL, 1, 1),
(1462, 173, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:04:41', '2024-07-25 12:04:41', NULL, 1, 1),
(1463, 175, NULL, 'درجة الأعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:04:54', '2024-07-25 12:04:54', NULL, 1, 1),
(1464, 173, NULL, 'الدرجة النهائية', NULL, 'divide', 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:04:57', '2024-07-25 12:04:57', NULL, 1, 1),
(1465, 175, NULL, 'درجة الامتحان', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 12:05:10', '2024-07-25 12:05:16', NULL, 1, 1),
(1466, 176, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:05:28', '2024-07-29 09:53:16', NULL, 1, 1),
(1467, 175, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:05:42', '2024-07-25 12:05:42', NULL, 1, 1),
(1468, 175, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:07:47', '2024-07-25 12:07:47', NULL, 1, 1),
(1469, 176, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:08:11', '2024-07-25 12:08:11', NULL, 1, 1),
(1470, 175, NULL, 'المحصلة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:08:15', '2024-07-25 12:08:15', NULL, 1, 1),
(1471, 176, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:08:26', '2024-07-25 12:08:26', NULL, 1, 1),
(1472, 177, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:08:38', '2024-07-25 12:08:38', NULL, 1, 1),
(1473, 176, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:08:42', '2024-07-25 12:08:42', NULL, 1, 1),
(1474, 177, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:08:49', '2024-07-25 12:08:49', NULL, 1, 1),
(1475, 177, NULL, 'مبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:09:04', '2024-07-25 12:09:04', NULL, 1, 1),
(1476, 176, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:09:07', '2024-07-29 09:53:35', NULL, 1, 1),
(1477, 177, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:10:20', '2024-07-25 12:10:20', NULL, 1, 1),
(1478, 176, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:10:43', '2024-07-29 09:54:21', NULL, 1, 1),
(1479, 177, NULL, 'درجة الأعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:10:45', '2024-07-25 12:10:45', NULL, 1, 1),
(1480, 177, NULL, 'درجة الامتحان', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 12:10:58', '2024-07-25 12:10:58', NULL, 1, 1),
(1481, 177, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:11:26', '2024-07-25 12:11:26', NULL, 1, 1),
(1482, 176, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 12:11:33', '2024-07-25 12:11:33', NULL, 1, 1),
(1483, 177, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:11:41', '2024-07-25 12:11:41', NULL, 1, 1),
(1484, 177, NULL, 'المحصلة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:12:02', '2024-07-25 12:12:02', NULL, 1, 1),
(1485, 178, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:12:39', '2024-07-29 09:57:01', NULL, 1, 1),
(1486, 178, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:12:50', '2024-07-25 12:12:50', NULL, 1, 1),
(1487, 176, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:12:57', '2024-07-25 12:12:57', NULL, 1, 1),
(1488, 178, NULL, 'مبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:13:06', '2024-07-25 12:13:06', NULL, 1, 1),
(1489, 178, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:13:18', '2024-07-25 12:13:18', NULL, 1, 1),
(1490, 176, NULL, 'الدرجة النهائية', NULL, 'divide', 1, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:13:32', '2024-07-29 09:54:38', NULL, 1, 1),
(1491, 178, NULL, 'درجة الأعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:13:47', '2024-07-25 12:13:47', NULL, 1, 1),
(1492, 178, NULL, 'درجة الامتحان', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 12:14:05', '2024-07-25 12:14:05', NULL, 1, 1),
(1493, 179, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:14:40', '2024-07-25 12:14:40', NULL, 1, 1),
(1494, 179, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:15:27', '2024-07-25 12:15:27', NULL, 1, 1),
(1495, 179, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:15:43', '2024-07-25 12:16:23', NULL, 1, 1),
(1496, 179, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:16:00', '2024-07-25 12:16:00', NULL, 1, 1),
(1497, 178, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:16:32', '2024-07-25 12:16:32', NULL, 1, 1),
(1498, 178, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:16:43', '2024-07-25 12:16:43', NULL, 1, 1),
(1499, 178, NULL, 'المحصلة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:17:02', '2024-07-25 12:17:02', NULL, 1, 1),
(1500, 179, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:17:13', '2024-07-29 09:58:33', NULL, 1, 1),
(1501, 180, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:17:27', '2024-07-29 10:01:21', NULL, 1, 1),
(1502, 179, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 12:17:30', '2024-07-29 09:58:43', NULL, 1, 1),
(1503, 180, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:17:37', '2024-07-25 12:17:37', NULL, 1, 1),
(1504, 180, NULL, 'مبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:17:49', '2024-07-25 12:17:49', NULL, 1, 1),
(1505, 179, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:18:00', '2024-07-29 09:58:59', NULL, 1, 1),
(1506, 180, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:18:04', '2024-07-25 12:18:04', NULL, 1, 1),
(1507, 179, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:18:19', '2024-07-25 12:18:19', NULL, 1, 1),
(1508, 180, NULL, 'درجة الأعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:18:33', '2024-07-25 12:18:33', NULL, 1, 1),
(1509, 179, NULL, 'الدرجة النهائية', NULL, 'divide', 1, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:18:37', '2024-07-29 09:59:12', NULL, 1, 1),
(1510, 180, NULL, 'درجة الامتحان', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 12:18:47', '2024-07-25 12:18:47', NULL, 1, 1),
(1511, 180, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:19:17', '2024-07-25 12:19:17', NULL, 1, 1),
(1512, 181, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:19:19', '2024-07-25 12:19:19', NULL, 1, 1),
(1513, 180, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:19:31', '2024-07-25 12:19:31', NULL, 1, 1),
(1514, 181, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:19:38', '2024-07-25 12:19:38', NULL, 1, 1),
(1515, 181, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:19:55', '2024-07-25 12:19:55', NULL, 1, 1),
(1516, 180, NULL, 'المحصلة النهائية', NULL, 'divide', 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:19:59', '2024-07-25 12:19:59', NULL, 1, 1),
(1517, 181, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:20:11', '2024-07-29 10:04:28', NULL, 1, 1),
(1518, 182, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:20:21', '2024-07-25 12:20:21', NULL, 1, 1),
(1519, 181, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:20:31', '2024-07-29 10:04:43', NULL, 1, 1),
(1520, 182, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:20:34', '2024-07-25 12:20:34', NULL, 1, 1),
(1521, 182, NULL, 'مبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:20:51', '2024-07-25 12:20:51', NULL, 1, 1),
(1522, 182, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:21:05', '2024-07-25 12:21:05', NULL, 1, 1),
(1523, 181, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 12:21:27', '2024-07-29 10:04:56', NULL, 1, 1),
(1524, 182, NULL, 'درجة الأعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:21:30', '2024-07-25 12:21:30', NULL, 1, 1),
(1525, 182, NULL, 'درجة الامتحان', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 12:21:44', '2024-07-25 12:21:44', NULL, 1, 1),
(1526, 181, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:21:50', '2024-07-25 12:21:50', NULL, 1, 1),
(1527, 181, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:22:08', '2024-07-25 12:22:08', NULL, 1, 1),
(1528, 182, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:22:13', '2024-07-25 12:22:13', NULL, 1, 1),
(1529, 181, NULL, 'الدرجة النهائية', NULL, 'divide', 1, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:22:28', '2024-07-29 10:05:49', NULL, 1, 1),
(1530, 182, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:22:29', '2024-07-25 12:22:29', NULL, 1, 1),
(1531, 182, NULL, 'المحصلة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:23:38', '2024-07-29 10:07:14', NULL, 1, 1),
(1532, 183, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:23:44', '2024-07-25 12:23:44', NULL, 1, 1),
(1533, 183, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:24:04', '2024-07-25 12:24:04', NULL, 1, 1),
(1534, 184, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-25 12:24:12', '2024-07-29 10:13:33', NULL, 1, 1),
(1535, 183, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:24:25', '2024-07-25 12:24:25', NULL, 1, 1),
(1536, 184, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 1, 0, '2024-07-25 12:24:33', '2024-07-25 12:24:33', NULL, 1, 1),
(1537, 183, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:24:36', '2024-07-25 12:24:36', NULL, 1, 1),
(1538, 184, NULL, 'المحصلة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:24:54', '2024-07-25 12:24:54', NULL, 1, 1),
(1539, 183, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:25:01', '2024-07-29 10:08:01', NULL, 1, 1),
(1540, 185, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-25 12:25:19', '2024-07-29 10:14:28', NULL, 1, 1),
(1541, 185, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 1, 0, '2024-07-25 12:25:37', '2024-07-25 12:25:37', NULL, 1, 1),
(1542, 185, NULL, 'المحصلة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:25:56', '2024-07-25 12:25:56', NULL, 1, 1),
(1543, 183, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 12:26:00', '2024-07-25 12:26:00', NULL, 1, 1),
(1544, 183, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:26:25', '2024-07-29 10:08:24', NULL, 1, 1),
(1545, 183, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:26:44', '2024-07-25 12:26:44', NULL, 1, 1),
(1546, 183, NULL, 'الدرجة النهائية', NULL, 'divide', 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:27:20', '2024-07-25 12:27:20', NULL, 1, 1),
(1547, 131, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:30:03', '2024-07-25 12:30:03', NULL, 1, 1),
(1548, 131, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:30:20', '2024-07-25 12:30:20', NULL, 1, 1),
(1549, 131, NULL, 'مبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:32:51', '2024-07-25 12:32:51', NULL, 1, 1),
(1550, 131, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:33:04', '2024-07-25 12:33:04', NULL, 1, 1),
(1551, 131, NULL, 'درجة الأعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:33:38', '2024-07-25 12:33:38', NULL, 1, 1),
(1552, 131, NULL, 'درجة الامتحان', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 12:33:50', '2024-07-25 12:33:50', NULL, 1, 1),
(1553, 131, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:34:19', '2024-07-25 12:34:19', NULL, 1, 1),
(1554, 131, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:34:34', '2024-07-25 12:34:34', NULL, 1, 1),
(1555, 131, NULL, 'المحصلة النهائية', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:34:52', '2024-07-27 06:49:42', NULL, 1, 1),
(1556, 133, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:35:15', '2024-07-25 12:35:15', NULL, 1, 1),
(1557, 133, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:35:26', '2024-07-25 12:35:26', NULL, 1, 1),
(1558, 132, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:35:28', '2024-07-25 12:35:28', NULL, 1, 1),
(1559, 133, NULL, 'مبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:35:37', '2024-07-25 12:35:37', NULL, 1, 1),
(1560, 132, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:35:45', '2024-07-25 12:35:45', NULL, 1, 1),
(1561, 133, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:35:47', '2024-07-25 12:35:47', NULL, 1, 1),
(1562, 133, NULL, 'درجة الأعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:36:20', '2024-07-25 12:36:20', NULL, 1, 1),
(1563, 132, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:36:21', '2024-07-25 12:36:21', NULL, 1, 1),
(1564, 133, NULL, 'درجة الامتحان', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 12:36:33', '2024-07-25 12:36:33', NULL, 1, 1),
(1565, 132, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:36:41', '2024-07-25 12:36:41', NULL, 1, 1),
(1566, 132, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:37:06', '2024-07-28 10:14:06', NULL, 1, 1),
(1567, 133, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:37:35', '2024-07-25 12:37:35', NULL, 1, 1),
(1568, 132, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 12:37:57', '2024-07-28 10:14:16', NULL, 1, 1),
(1569, 133, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:38:20', '2024-07-28 10:17:05', NULL, 1, 1),
(1570, 132, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:38:28', '2024-07-28 10:14:28', NULL, 1, 1),
(1571, 133, NULL, 'المحصلة النهائية', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:38:49', '2024-07-27 06:51:00', NULL, 1, 1),
(1572, 132, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:38:55', '2024-07-25 12:38:55', NULL, 1, 1),
(1573, 132, NULL, 'الدرجة النهائية', 2.00, 'divide', 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:39:23', '2024-07-27 06:50:31', NULL, 1, 1),
(1574, 134, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:39:40', '2024-07-25 12:39:40', NULL, 1, 1),
(1575, 134, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:39:50', '2024-07-25 12:39:50', NULL, 1, 1),
(1576, 136, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:40:16', '2024-07-25 12:40:16', NULL, 1, 1),
(1577, 134, NULL, 'مبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:40:18', '2024-07-25 12:40:18', NULL, 1, 1),
(1578, 134, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:40:30', '2024-07-25 12:40:30', NULL, 1, 1),
(1579, 136, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:40:32', '2024-07-25 12:40:32', NULL, 1, 1),
(1580, 134, NULL, 'درجة الأعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:40:50', '2024-07-25 12:40:50', NULL, 1, 1),
(1581, 136, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:40:51', '2024-07-25 12:40:51', NULL, 1, 1),
(1582, 134, NULL, 'درجة الامتحان', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 12:41:01', '2024-07-25 12:41:01', NULL, 1, 1),
(1583, 136, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:41:06', '2024-07-25 12:41:06', NULL, 1, 1),
(1584, 134, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:41:22', '2024-07-25 12:41:22', NULL, 1, 1),
(1585, 136, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:41:35', '2024-07-28 10:23:39', NULL, 1, 1),
(1586, 134, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:41:40', '2024-07-25 12:41:40', NULL, 1, 1),
(1587, 136, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 12:41:55', '2024-07-25 12:41:55', NULL, 1, 1),
(1588, 134, NULL, 'المحصلة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:41:58', '2024-07-27 06:52:01', NULL, 1, 1),
(1589, 135, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:42:17', '2024-07-25 12:42:17', NULL, 1, 1),
(1590, 135, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:42:31', '2024-07-25 12:42:31', NULL, 1, 1),
(1591, 135, NULL, 'مبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:42:44', '2024-07-25 12:42:44', NULL, 1, 1);
INSERT INTO `parts` (`id`, `year_class_subject_id`, `mark_review_id`, `name`, `value`, `operation`, `is_final_result`, `max_per_cent`, `has_mark_review`, `is_semi_final_result`, `is_result_part`, `is_sealed`, `is_visible`, `is_active`, `must_be_calculated`, `must_be_ceiled`, `created_at`, `updated_at`, `term_id`, `is_in_results`, `is_in_final`) VALUES
(1592, 135, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:43:11', '2024-07-25 12:43:11', NULL, 1, 1),
(1593, 136, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:43:22', '2024-07-28 10:24:00', NULL, 1, 1),
(1594, 135, NULL, 'درجة الأعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:43:31', '2024-07-25 12:43:31', NULL, 1, 1),
(1595, 136, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:43:39', '2024-07-25 12:43:39', NULL, 1, 1),
(1596, 135, NULL, 'درجة الامتحان', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 12:43:52', '2024-07-25 12:43:52', NULL, 1, 1),
(1597, 136, NULL, 'الدرجة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:44:06', '2024-07-28 10:25:52', NULL, 1, 1),
(1598, 135, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:44:11', '2024-07-25 12:44:11', NULL, 1, 1),
(1599, 135, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:44:49', '2024-07-25 12:44:49', NULL, 1, 1),
(1600, 135, NULL, 'المحصلة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:45:08', '2024-07-27 06:52:55', NULL, 1, 1),
(1601, 144, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:45:31', '2024-07-25 12:45:31', NULL, 1, 1),
(1602, 144, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:45:54', '2024-07-25 12:45:54', NULL, 1, 1),
(1603, 137, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:45:57', '2024-07-25 12:45:57', NULL, 1, 1),
(1604, 137, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:46:18', '2024-07-25 12:46:18', NULL, 1, 1),
(1605, 137, NULL, 'مبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:46:52', '2024-07-25 12:46:52', NULL, 1, 1),
(1606, 137, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:47:05', '2024-07-25 12:47:05', NULL, 1, 1),
(1607, 137, NULL, 'درجة الأعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:47:28', '2024-07-25 12:47:28', NULL, 1, 1),
(1608, 137, NULL, 'درجة الامتحان', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 12:47:45', '2024-07-25 12:47:45', NULL, 1, 1),
(1609, 137, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:48:30', '2024-07-25 12:48:30', NULL, 1, 1),
(1610, 144, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:48:33', '2024-07-25 12:48:33', NULL, 1, 1),
(1611, 137, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:48:45', '2024-07-25 12:48:45', NULL, 1, 1),
(1612, 144, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:48:55', '2024-07-25 12:48:55', NULL, 1, 1),
(1613, 137, NULL, 'المحصلة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:49:02', '2024-07-27 06:55:04', NULL, 1, 1),
(1614, 144, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:49:27', '2024-07-28 10:29:13', NULL, 1, 1),
(1615, 138, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:49:41', '2024-07-25 12:49:41', NULL, 1, 1),
(1616, 144, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 12:49:55', '2024-07-28 10:29:28', NULL, 1, 1),
(1617, 138, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:50:33', '2024-07-25 12:50:33', NULL, 1, 1),
(1618, 144, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:50:45', '2024-07-28 10:29:47', NULL, 1, 1),
(1619, 144, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:51:03', '2024-07-25 12:51:03', NULL, 1, 1),
(1620, 144, NULL, 'الدرجة النهائية', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:51:20', '2024-07-27 06:53:51', NULL, 1, 1),
(1621, 138, NULL, 'مبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:51:31', '2024-07-25 12:51:31', NULL, 1, 1),
(1622, 139, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:51:42', '2024-07-25 12:51:42', NULL, 1, 1),
(1623, 139, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:51:55', '2024-07-25 12:51:55', NULL, 1, 1),
(1624, 139, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:52:11', '2024-07-25 12:52:11', NULL, 1, 1),
(1625, 138, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:52:20', '2024-07-25 12:52:20', NULL, 1, 1),
(1626, 139, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:52:28', '2024-07-25 12:52:28', NULL, 1, 1),
(1627, 138, NULL, 'درجة الأعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:52:39', '2024-07-25 12:52:39', NULL, 1, 1),
(1628, 138, NULL, 'درجة الامتحان', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 12:52:51', '2024-07-25 12:52:51', NULL, 1, 1),
(1629, 138, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:53:10', '2024-07-25 12:53:10', NULL, 1, 1),
(1630, 138, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:53:22', '2024-07-25 12:53:22', NULL, 1, 1),
(1631, 138, NULL, 'المحصلة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:53:40', '2024-07-27 06:56:02', NULL, 1, 1),
(1632, 139, NULL, 'مجموع درجات أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:53:44', '2024-07-28 10:33:40', NULL, 1, 1),
(1633, 140, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:53:58', '2024-07-25 12:53:58', NULL, 1, 1),
(1634, 139, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 12:54:06', '2024-07-25 12:54:06', NULL, 1, 1),
(1635, 140, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:54:08', '2024-07-25 12:54:08', NULL, 1, 1),
(1636, 140, NULL, 'مبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:54:20', '2024-07-25 12:54:39', NULL, 1, 1),
(1637, 139, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:54:26', '2024-07-28 10:33:58', NULL, 1, 1),
(1638, 140, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-25 12:54:35', '2024-07-25 12:54:35', NULL, 1, 1),
(1639, 139, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:54:49', '2024-07-25 12:54:49', NULL, 1, 1),
(1640, 139, NULL, 'الدرجة النهائية', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:55:03', '2024-07-27 06:56:43', NULL, 1, 1),
(1641, 140, NULL, 'درجة الأعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:55:07', '2024-07-25 12:55:07', NULL, 1, 1),
(1642, 140, NULL, 'درجة الامتحان', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-25 12:55:27', '2024-07-25 12:55:27', NULL, 1, 1),
(1643, 141, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-25 12:55:43', '2024-07-28 10:37:36', NULL, 1, 1),
(1644, 140, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:55:48', '2024-07-25 12:55:48', NULL, 1, 1),
(1645, 141, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 1, 0, '2024-07-25 12:55:59', '2024-07-28 10:37:56', NULL, 1, 1),
(1646, 140, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:56:02', '2024-07-25 12:56:02', NULL, 1, 1),
(1647, 141, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:56:16', '2024-07-28 10:38:40', NULL, 1, 1),
(1648, 140, NULL, 'المحصلة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:56:16', '2024-07-27 06:57:37', NULL, 1, 1),
(1649, 143, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-25 12:57:45', '2024-07-25 12:57:45', NULL, 1, 1),
(1650, 142, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-25 12:57:46', '2024-07-28 10:39:25', NULL, 1, 1),
(1651, 142, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 1, 0, '2024-07-25 12:57:59', '2024-07-28 10:39:36', NULL, 1, 1),
(1652, 143, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 1, 0, '2024-07-25 12:57:59', '2024-07-25 12:57:59', NULL, 1, 1),
(1653, 142, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:58:16', '2024-07-28 10:39:51', NULL, 1, 1),
(1654, 143, NULL, 'المحصلة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-25 12:58:19', '2024-07-25 12:58:19', NULL, 1, 1),
(1655, 188, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 03:51:34', '2024-07-26 03:56:26', NULL, 1, 1),
(1656, 188, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 03:57:31', '2024-07-26 03:57:31', NULL, 1, 1),
(1657, 188, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 03:58:37', '2024-07-26 03:58:37', NULL, 1, 1),
(1658, 188, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 03:59:50', '2024-07-26 03:59:50', NULL, 1, 1),
(1659, 188, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 04:01:36', '2024-07-26 04:01:36', NULL, 1, 1),
(1660, 188, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 04:02:31', '2024-07-26 04:02:32', NULL, 1, 1),
(1661, 188, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 04:49:39', '2024-07-26 04:49:39', NULL, 1, 1),
(1662, 188, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 04:50:50', '2024-07-26 04:50:50', NULL, 1, 1),
(1663, 188, NULL, 'المحصلة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 04:56:30', '2024-07-28 11:13:12', NULL, 1, 1),
(1664, 189, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 04:58:21', '2024-07-26 04:58:21', NULL, 1, 1),
(1665, 189, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 04:58:47', '2024-07-26 04:58:47', NULL, 1, 1),
(1666, 189, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 04:59:12', '2024-07-26 04:59:12', NULL, 1, 1),
(1667, 189, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 04:59:35', '2024-07-26 04:59:35', NULL, 1, 1),
(1668, 189, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 05:01:03', '2024-07-26 05:01:03', NULL, 1, 1),
(1669, 189, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 05:01:40', '2024-07-26 05:01:40', NULL, 1, 1),
(1670, 189, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 05:02:32', '2024-07-26 05:02:32', NULL, 1, 1),
(1671, 189, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 05:03:07', '2024-07-26 05:03:07', NULL, 1, 1),
(1672, 189, NULL, 'المحصلة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 05:04:02', '2024-07-28 11:14:10', NULL, 1, 1),
(1673, 190, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 05:04:46', '2024-07-26 05:04:46', NULL, 1, 1),
(1674, 190, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 05:05:10', '2024-07-26 05:05:10', NULL, 1, 1),
(1675, 190, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 05:05:40', '2024-07-26 05:05:40', NULL, 1, 1),
(1676, 190, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 05:06:09', '2024-07-26 05:06:09', NULL, 1, 1),
(1677, 190, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 05:07:08', '2024-07-26 05:07:08', NULL, 1, 1),
(1678, 190, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 05:08:33', '2024-07-26 05:08:33', NULL, 1, 1),
(1679, 190, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 05:09:13', '2024-07-26 05:09:13', NULL, 1, 1),
(1680, 190, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 05:09:43', '2024-07-26 05:09:43', NULL, 1, 1),
(1681, 190, NULL, 'المحصلة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 05:10:52', '2024-07-28 11:15:06', NULL, 1, 1),
(1682, 191, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 05:11:30', '2024-07-26 05:11:30', NULL, 1, 1),
(1683, 191, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 05:12:02', '2024-07-26 05:12:02', NULL, 1, 1),
(1684, 191, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 05:12:29', '2024-07-26 05:12:29', NULL, 1, 1),
(1685, 191, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 05:12:54', '2024-07-26 05:12:54', NULL, 1, 1),
(1686, 191, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 05:14:07', '2024-07-26 05:14:07', NULL, 1, 1),
(1687, 191, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 05:14:36', '2024-07-26 05:14:36', NULL, 1, 1),
(1688, 191, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 05:15:21', '2024-07-26 05:15:21', NULL, 1, 1),
(1689, 191, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 05:16:04', '2024-07-26 05:16:04', NULL, 1, 1),
(1690, 191, NULL, 'المحصلة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 05:17:00', '2024-07-28 11:16:03', NULL, 1, 1),
(1691, 193, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 05:17:44', '2024-07-28 11:16:31', NULL, 1, 1),
(1692, 193, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 05:18:10', '2024-07-28 11:16:38', NULL, 1, 1),
(1693, 193, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 05:18:36', '2024-07-26 05:18:36', NULL, 1, 1),
(1694, 193, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 05:19:02', '2024-07-26 05:19:02', NULL, 1, 1),
(1695, 193, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 05:21:14', '2024-07-28 11:16:54', NULL, 1, 1),
(1696, 193, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 05:22:02', '2024-07-26 05:22:02', NULL, 1, 1),
(1697, 193, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 05:23:13', '2024-07-26 05:23:13', NULL, 1, 1),
(1698, 193, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 05:23:53', '2024-07-26 05:23:53', NULL, 1, 1),
(1699, 193, NULL, 'المحصلة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 05:25:22', '2024-07-28 11:17:16', NULL, 1, 1),
(1700, 194, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 05:26:46', '2024-07-26 05:26:46', NULL, 1, 1),
(1701, 194, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 05:27:08', '2024-07-26 05:27:08', NULL, 1, 1),
(1702, 194, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 05:27:33', '2024-07-26 05:27:33', NULL, 1, 1),
(1703, 194, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 05:28:01', '2024-07-26 05:28:01', NULL, 1, 1),
(1704, 194, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 05:29:47', '2024-07-26 05:29:47', NULL, 1, 1),
(1705, 194, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 05:30:11', '2024-07-26 05:30:11', NULL, 1, 1),
(1706, 194, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 05:30:51', '2024-07-28 11:18:27', NULL, 1, 1),
(1707, 194, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 05:31:27', '2024-07-26 05:31:27', NULL, 1, 1),
(1709, 194, NULL, 'المحصلة النهائية', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 05:33:19', '2024-07-26 05:33:19', NULL, 1, 1),
(1710, 195, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 05:35:02', '2024-07-26 05:35:02', NULL, 1, 1),
(1711, 195, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 05:35:25', '2024-07-26 05:35:25', NULL, 1, 1),
(1712, 195, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 05:35:49', '2024-07-26 05:35:49', NULL, 1, 1),
(1713, 195, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 05:36:15', '2024-07-26 05:36:15', NULL, 1, 1),
(1714, 195, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 05:37:14', '2024-07-26 05:37:14', NULL, 1, 1),
(1715, 195, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 05:37:44', '2024-07-26 05:37:44', NULL, 1, 1),
(1716, 195, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 05:38:25', '2024-07-26 05:38:25', NULL, 1, 1),
(1717, 195, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 05:39:11', '2024-07-26 05:39:11', NULL, 1, 1),
(1718, 195, NULL, 'المحصلة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 05:40:01', '2024-07-28 11:20:07', NULL, 1, 1),
(1719, 196, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 05:40:53', '2024-07-26 05:40:53', NULL, 1, 1),
(1720, 196, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 05:41:39', '2024-07-26 05:41:39', NULL, 1, 1),
(1721, 196, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 05:42:09', '2024-07-26 05:42:09', NULL, 1, 1),
(1722, 196, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 05:42:34', '2024-07-26 05:42:34', NULL, 1, 1),
(1723, 196, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 05:43:27', '2024-07-26 05:43:27', NULL, 1, 1),
(1724, 196, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 05:43:58', '2024-07-26 05:43:58', NULL, 1, 1),
(1725, 196, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 05:44:50', '2024-07-26 05:44:50', NULL, 1, 1),
(1726, 196, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 05:45:42', '2024-07-26 05:45:42', NULL, 1, 1),
(1727, 196, NULL, 'المحصلة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 05:47:14', '2024-07-28 11:21:20', NULL, 1, 1),
(1728, 199, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 05:47:48', '2024-07-26 05:47:48', NULL, 1, 1),
(1729, 199, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 05:50:22', '2024-07-26 05:50:22', NULL, 1, 1),
(1730, 199, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 05:50:54', '2024-07-26 05:50:54', NULL, 1, 1),
(1731, 199, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 05:51:34', '2024-07-26 05:51:34', NULL, 1, 1),
(1732, 199, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 05:52:37', '2024-07-26 05:52:37', NULL, 1, 1),
(1733, 199, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 05:53:14', '2024-07-26 05:53:14', NULL, 1, 1),
(1734, 199, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 05:54:07', '2024-07-26 05:54:07', NULL, 1, 1),
(1735, 199, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 05:54:51', '2024-07-26 05:54:51', NULL, 1, 1),
(1736, 199, NULL, 'المحصلة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 05:55:35', '2024-07-28 11:22:42', NULL, 1, 1),
(1737, 200, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 05:56:23', '2024-07-26 05:56:23', NULL, 1, 1),
(1738, 200, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 05:56:54', '2024-07-26 05:56:54', NULL, 1, 1),
(1739, 200, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 05:57:28', '2024-07-26 05:57:28', NULL, 1, 1),
(1740, 200, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 05:57:57', '2024-07-26 05:57:57', NULL, 1, 1),
(1741, 200, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 05:58:53', '2024-07-26 05:58:53', NULL, 1, 1),
(1742, 200, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 05:59:20', '2024-07-26 05:59:20', NULL, 1, 1),
(1743, 200, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 06:00:02', '2024-07-26 06:00:02', NULL, 1, 1),
(1744, 200, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 06:00:47', '2024-07-26 06:00:47', NULL, 1, 1),
(1745, 200, NULL, 'المحصلة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 06:01:52', '2024-07-28 11:23:38', NULL, 1, 1),
(1746, 201, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 06:03:10', '2024-07-26 06:03:10', NULL, 1, 1),
(1747, 201, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 06:03:37', '2024-07-26 06:03:37', NULL, 1, 1),
(1748, 201, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 06:04:06', '2024-07-26 06:04:06', NULL, 1, 1),
(1749, 201, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 06:04:51', '2024-07-26 06:04:51', NULL, 1, 1),
(1750, 201, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 06:06:08', '2024-07-26 06:06:08', NULL, 1, 1),
(1751, 201, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 06:07:05', '2024-07-28 11:24:44', NULL, 1, 1),
(1752, 201, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 06:07:51', '2024-07-26 06:07:51', NULL, 1, 1),
(1753, 201, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 06:08:29', '2024-07-26 06:08:29', NULL, 1, 1),
(1754, 201, NULL, 'المحصلة النهائية', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 06:09:09', '2024-07-26 06:09:09', NULL, 1, 1),
(1755, 202, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 06:09:55', '2024-07-26 06:09:55', NULL, 1, 1),
(1756, 202, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 06:10:18', '2024-07-26 06:10:18', NULL, 1, 1),
(1757, 202, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 06:10:40', '2024-07-26 06:10:40', NULL, 1, 1),
(1758, 202, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 06:11:04', '2024-07-26 06:11:04', NULL, 1, 1),
(1759, 202, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 06:12:05', '2024-07-26 06:12:05', NULL, 1, 1),
(1760, 202, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 06:12:38', '2024-07-26 06:12:38', NULL, 1, 1),
(1761, 202, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 06:13:24', '2024-07-26 06:13:24', NULL, 1, 1),
(1762, 202, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 06:13:55', '2024-07-26 06:13:55', NULL, 1, 1),
(1763, 202, NULL, 'المحصلة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 06:14:32', '2024-07-28 11:26:24', NULL, 1, 1),
(1764, 204, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 06:15:26', '2024-07-26 06:16:09', NULL, 1, 1),
(1765, 204, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 06:15:55', '2024-07-26 06:15:55', NULL, 1, 1),
(1766, 204, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 06:16:37', '2024-07-26 06:16:37', NULL, 1, 1),
(1767, 204, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 06:17:04', '2024-07-26 06:17:04', NULL, 1, 1),
(1768, 204, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 06:18:12', '2024-07-26 06:18:12', NULL, 1, 1),
(1769, 204, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 06:18:37', '2024-07-28 11:27:17', NULL, 1, 1),
(1770, 204, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 06:19:26', '2024-07-26 06:19:26', NULL, 1, 1),
(1771, 204, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 06:20:04', '2024-07-26 06:20:04', NULL, 1, 1),
(1772, 204, NULL, 'المحصلة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 06:20:53', '2024-07-28 11:27:35', NULL, 1, 1),
(1773, 206, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 06:21:38', '2024-07-26 06:21:38', NULL, 1, 1),
(1774, 206, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 06:21:57', '2024-07-28 11:28:05', NULL, 1, 1),
(1775, 206, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 06:22:24', '2024-07-26 06:22:24', NULL, 1, 1),
(1776, 206, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 06:22:51', '2024-07-26 06:22:51', NULL, 1, 1),
(1777, 206, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 06:23:45', '2024-07-26 06:23:45', NULL, 1, 1),
(1778, 206, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 06:25:16', '2024-07-28 11:28:27', NULL, 1, 1),
(1779, 206, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 06:25:56', '2024-07-26 06:25:56', NULL, 1, 1),
(1780, 206, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 06:26:28', '2024-07-26 06:26:28', NULL, 1, 1),
(1781, 206, NULL, 'المحصلة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 06:27:03', '2024-07-28 11:28:42', NULL, 1, 1),
(1782, 208, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 06:27:49', '2024-07-26 06:27:49', NULL, 1, 1),
(1783, 208, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 06:28:10', '2024-07-26 06:28:10', NULL, 1, 1),
(1784, 208, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 06:28:40', '2024-07-26 06:28:40', NULL, 1, 1),
(1785, 208, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 06:29:12', '2024-07-26 06:29:12', NULL, 1, 1),
(1786, 208, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 06:30:12', '2024-07-26 06:30:12', NULL, 1, 1),
(1787, 208, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 06:30:38', '2024-07-26 06:30:38', NULL, 1, 1),
(1788, 208, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 06:31:19', '2024-07-26 06:31:19', NULL, 1, 1),
(1789, 208, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 06:31:47', '2024-07-26 06:31:47', NULL, 1, 1),
(1790, 208, NULL, 'المحصلة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 06:32:49', '2024-07-28 11:29:33', NULL, 1, 1),
(1791, 214, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-26 06:33:53', '2024-07-28 11:29:51', NULL, 1, 1),
(1792, 214, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 1, 0, '2024-07-26 06:34:32', '2024-07-26 10:10:03', NULL, 1, 1),
(1793, 214, NULL, 'المحصلة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 06:35:17', '2024-07-26 10:10:25', NULL, 1, 1),
(1794, 216, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-26 10:17:46', '2024-07-28 11:31:16', NULL, 1, 1),
(1795, 216, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 0, 1, 0, '2024-07-26 10:18:14', '2024-07-26 10:18:14', NULL, 1, 1),
(1796, 216, NULL, 'المحصلة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 10:19:12', '2024-07-26 10:19:12', NULL, 1, 1),
(1797, 186, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 10:23:36', '2024-07-26 10:23:36', NULL, 1, 1),
(1798, 186, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 10:25:31', '2024-07-26 10:25:31', NULL, 1, 1),
(1799, 186, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 10:25:56', '2024-07-26 10:25:56', NULL, 1, 1),
(1800, 186, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 10:26:22', '2024-07-26 10:26:22', NULL, 1, 1),
(1801, 186, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 10:27:02', '2024-07-26 10:27:02', NULL, 1, 1),
(1802, 186, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 10:27:31', '2024-07-26 10:27:31', NULL, 1, 1),
(1803, 186, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 10:28:03', '2024-07-26 10:28:03', NULL, 1, 1),
(1804, 186, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 10:28:41', '2024-07-26 10:28:41', NULL, 1, 1),
(1805, 186, NULL, 'المحصلة النهائية', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 10:29:27', '2024-07-26 10:29:27', NULL, 1, 1),
(1806, 187, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 10:29:56', '2024-07-26 10:29:56', NULL, 1, 1),
(1807, 187, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 10:30:16', '2024-07-26 10:30:16', NULL, 1, 1),
(1808, 187, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 10:30:35', '2024-07-26 10:30:35', NULL, 1, 1),
(1809, 187, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 10:30:56', '2024-07-26 10:30:56', NULL, 1, 1),
(1810, 187, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 10:31:34', '2024-07-26 10:31:34', NULL, 1, 1),
(1811, 187, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 10:32:36', '2024-07-26 10:32:36', NULL, 1, 1),
(1812, 187, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 10:33:01', '2024-07-26 10:33:01', NULL, 1, 1),
(1813, 187, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 10:33:22', '2024-07-26 10:33:22', NULL, 1, 1),
(1814, 187, NULL, 'المحصلة النهائية', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 10:34:02', '2024-07-26 10:34:02', NULL, 1, 1),
(1815, 192, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 10:34:26', '2024-07-26 10:34:53', NULL, 1, 1),
(1816, 192, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 10:34:45', '2024-07-26 10:34:45', NULL, 1, 1),
(1817, 192, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 10:35:17', '2024-07-26 10:35:17', NULL, 1, 1),
(1818, 192, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 10:35:33', '2024-07-26 10:35:33', NULL, 1, 1),
(1819, 192, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 10:36:07', '2024-07-26 10:36:07', NULL, 1, 1),
(1820, 192, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 10:36:28', '2024-07-26 10:36:28', NULL, 1, 1),
(1821, 192, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 10:37:10', '2024-07-26 10:37:10', NULL, 1, 1),
(1822, 192, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 10:37:43', '2024-07-26 10:37:43', NULL, 1, 1),
(1823, 192, NULL, 'المحصلة النهائية', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 10:38:30', '2024-07-26 10:38:30', NULL, 1, 1),
(1824, 197, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 10:39:02', '2024-07-26 10:39:02', NULL, 1, 1),
(1825, 197, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 10:39:19', '2024-07-26 10:39:19', NULL, 1, 1),
(1826, 197, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 10:39:42', '2024-07-26 10:39:42', NULL, 1, 1),
(1827, 197, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 10:40:00', '2024-07-26 10:40:00', NULL, 1, 1),
(1828, 197, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 10:40:31', '2024-07-26 10:40:31', NULL, 1, 1),
(1829, 197, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 10:40:54', '2024-07-26 10:40:54', NULL, 1, 1),
(1830, 197, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 10:41:26', '2024-07-26 10:41:26', NULL, 1, 1),
(1831, 197, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 10:41:53', '2024-07-26 10:41:53', NULL, 1, 1),
(1832, 197, NULL, 'المحصلة النهائية', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 10:42:20', '2024-07-26 10:42:20', NULL, 1, 1),
(1833, 203, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 10:42:51', '2024-07-26 10:42:51', NULL, 1, 1),
(1834, 203, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 10:43:11', '2024-07-26 10:43:11', NULL, 1, 1),
(1835, 203, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 10:43:36', '2024-07-26 10:43:36', NULL, 1, 1),
(1836, 203, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 10:43:54', '2024-07-26 10:43:54', NULL, 1, 1),
(1837, 203, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 10:44:25', '2024-07-26 10:44:25', NULL, 1, 1),
(1838, 203, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 10:44:51', '2024-07-26 10:44:51', NULL, 1, 1),
(1839, 203, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 10:45:18', '2024-07-26 10:45:18', NULL, 1, 1),
(1840, 203, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 10:46:07', '2024-07-26 10:46:07', NULL, 1, 1),
(1841, 203, NULL, 'المحصلة النهائية', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 10:46:59', '2024-07-26 10:46:59', NULL, 1, 1),
(1842, 207, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 10:47:34', '2024-07-26 10:47:34', NULL, 1, 1),
(1843, 207, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 10:47:51', '2024-07-26 10:47:51', NULL, 1, 1),
(1844, 207, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 10:48:10', '2024-07-26 10:48:10', NULL, 1, 1),
(1845, 207, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 10:48:36', '2024-07-26 10:48:36', NULL, 1, 1),
(1846, 207, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 10:49:27', '2024-07-26 10:49:27', NULL, 1, 1),
(1847, 207, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 10:49:49', '2024-07-26 10:49:49', NULL, 1, 1),
(1848, 207, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 10:50:18', '2024-07-26 10:50:18', NULL, 1, 1),
(1849, 207, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 10:50:40', '2024-07-26 10:50:40', NULL, 1, 1),
(1850, 207, NULL, 'المحصلة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 10:51:09', '2024-07-29 10:26:47', NULL, 1, 1),
(1851, 209, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 10:51:45', '2024-07-26 10:51:45', NULL, 1, 1),
(1852, 209, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 10:52:17', '2024-07-26 10:52:17', NULL, 1, 1),
(1853, 209, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 10:52:36', '2024-07-26 10:52:36', NULL, 1, 1),
(1854, 209, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 10:52:54', '2024-07-26 10:52:54', NULL, 1, 1),
(1855, 209, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 10:54:02', '2024-07-26 10:54:02', NULL, 1, 1),
(1856, 209, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 10:54:50', '2024-07-26 10:54:50', NULL, 1, 1),
(1857, 209, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 10:55:19', '2024-07-26 10:55:19', NULL, 1, 1),
(1858, 209, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 10:55:40', '2024-07-26 10:55:40', NULL, 1, 1),
(1859, 209, NULL, 'المحصلة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 10:56:10', '2024-07-29 10:28:21', NULL, 1, 1),
(1860, 215, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 10:56:44', '2024-07-26 10:56:44', NULL, 1, 1),
(1861, 215, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 10:57:03', '2024-07-26 10:57:03', NULL, 1, 1),
(1862, 215, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 10:57:25', '2024-07-26 10:57:25', NULL, 1, 1),
(1863, 215, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 10:57:43', '2024-07-26 10:57:43', NULL, 1, 1),
(1864, 215, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 10:58:12', '2024-07-26 10:58:12', NULL, 1, 1),
(1865, 215, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 10:58:36', '2024-07-29 10:29:42', NULL, 1, 1),
(1866, 215, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 10:59:04', '2024-07-29 10:29:53', NULL, 1, 1),
(1867, 215, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 10:59:37', '2024-07-26 10:59:37', NULL, 1, 1),
(1868, 215, NULL, 'المحصلة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 11:00:19', '2024-07-29 10:30:07', NULL, 1, 1),
(1869, 217, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 11:01:03', '2024-07-26 11:01:03', NULL, 1, 1),
(1870, 217, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 11:01:18', '2024-07-26 11:01:18', NULL, 1, 1),
(1871, 217, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 11:01:38', '2024-07-26 11:01:38', NULL, 1, 1),
(1872, 217, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 11:01:57', '2024-07-26 11:01:57', NULL, 1, 1),
(1873, 217, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 11:02:36', '2024-07-26 11:02:36', NULL, 1, 1),
(1874, 217, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 11:03:08', '2024-07-26 11:03:08', NULL, 1, 1),
(1875, 217, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 11:03:31', '2024-07-26 11:03:31', NULL, 1, 1),
(1876, 217, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 11:04:16', '2024-07-26 11:04:16', NULL, 1, 1),
(1877, 217, NULL, 'المحصلة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 11:04:41', '2024-07-29 10:32:03', NULL, 1, 1),
(1878, 218, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 11:05:14', '2024-07-26 11:05:14', NULL, 1, 1),
(1879, 218, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 11:05:34', '2024-07-26 11:05:34', NULL, 1, 1),
(1880, 218, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 11:05:48', '2024-07-26 11:05:48', NULL, 1, 1),
(1881, 218, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 11:06:06', '2024-07-26 11:06:06', NULL, 1, 1),
(1882, 218, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 11:06:46', '2024-07-26 11:06:46', NULL, 1, 1),
(1883, 218, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 11:07:04', '2024-07-26 11:07:04', NULL, 1, 1),
(1884, 218, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 11:07:42', '2024-07-26 11:07:42', NULL, 1, 1),
(1885, 218, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 11:08:00', '2024-07-26 11:08:00', NULL, 1, 1),
(1886, 218, NULL, 'المحصلة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 11:08:50', '2024-07-29 10:35:25', NULL, 1, 1),
(1887, 219, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 11:09:18', '2024-07-26 11:09:18', NULL, 1, 1),
(1888, 219, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 11:09:34', '2024-07-26 11:09:34', NULL, 1, 1),
(1889, 219, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 11:09:55', '2024-07-26 11:09:55', NULL, 1, 1),
(1890, 219, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 11:10:13', '2024-07-26 11:10:13', NULL, 1, 1),
(1891, 219, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 11:10:45', '2024-07-26 11:10:45', NULL, 1, 1),
(1892, 219, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 11:11:04', '2024-07-26 11:11:04', NULL, 1, 1),
(1893, 219, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 11:12:28', '2024-07-26 11:12:28', NULL, 1, 1),
(1894, 219, NULL, 'مجموع درجات الفصلين', NULL, 'divide', 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 11:13:19', '2024-07-26 11:13:19', NULL, 1, 1),
(1895, 219, NULL, 'المحصلة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 11:13:48', '2024-07-29 10:36:49', NULL, 1, 1),
(1896, 220, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 11:14:26', '2024-07-26 11:14:26', NULL, 1, 1),
(1897, 220, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 11:14:40', '2024-07-26 11:14:40', NULL, 1, 1),
(1898, 220, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 11:14:57', '2024-07-26 11:14:57', NULL, 1, 1),
(1899, 220, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 11:15:32', '2024-07-26 11:15:32', NULL, 1, 1),
(1900, 220, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 11:16:09', '2024-07-26 11:16:09', NULL, 1, 1),
(1901, 220, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 11:16:31', '2024-07-26 11:16:31', NULL, 1, 1),
(1902, 220, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 11:17:00', '2024-07-26 11:17:00', NULL, 1, 1),
(1903, 220, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 11:17:16', '2024-07-26 11:17:16', NULL, 1, 1),
(1904, 220, NULL, 'المحصلة النهائية', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 11:17:43', '2024-07-26 11:17:43', NULL, 1, 1),
(1905, 221, NULL, 'مجموع درجات الفصل', NULL, NULL, 1, 100, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 11:18:21', '2024-07-26 11:20:22', NULL, 1, 1),
(1906, 221, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 1, 0, '2024-07-26 11:18:39', '2024-07-26 11:21:06', NULL, 1, 1),
(1907, 221, NULL, 'المحصلة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 11:19:07', '2024-07-26 11:22:02', NULL, 1, 1),
(1909, 222, NULL, 'مجموع درجات الفصل', NULL, NULL, 1, 100, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 11:22:37', '2024-07-26 11:22:37', NULL, 1, 1),
(1910, 222, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 1, 0, '2024-07-26 11:22:58', '2024-07-26 11:22:58', NULL, 1, 1),
(1911, 222, NULL, 'المحصلة النهائية', 2.00, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-26 11:23:37', '2024-07-26 11:23:37', NULL, 1, 1),
(1912, 243, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 18:25:28', '2024-07-27 06:13:27', NULL, 1, 1),
(1913, 243, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 18:30:05', '2024-07-26 18:30:05', NULL, 1, 1),
(1914, 243, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 18:30:29', '2024-07-26 18:31:09', NULL, 1, 1),
(1915, 243, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 18:30:59', '2024-07-26 18:30:59', NULL, 1, 1),
(1916, 243, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 18:32:05', '2024-07-26 18:32:41', NULL, 1, 1),
(1917, 243, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 18:33:16', '2024-07-26 18:33:16', NULL, 1, 1),
(1918, 243, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 18:33:56', '2024-07-26 18:33:56', NULL, 1, 1),
(1919, 243, NULL, 'تقدير الفصل الاول', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-26 18:36:09', '2024-07-26 18:36:09', NULL, 1, 1),
(1920, 243, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 18:42:49', '2024-07-26 18:42:49', NULL, 1, 1),
(1921, 243, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 18:44:21', '2024-07-26 18:44:21', NULL, 1, 1),
(1922, 243, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 18:45:10', '2024-07-26 18:45:10', NULL, 1, 1),
(1923, 245, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 18:45:52', '2024-07-26 18:45:52', NULL, 1, 1),
(1924, 245, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 18:46:18', '2024-07-26 18:46:18', NULL, 1, 1),
(1925, 245, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 18:46:57', '2024-07-26 18:46:57', NULL, 1, 1),
(1926, 245, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 18:47:14', '2024-07-26 18:47:14', NULL, 1, 1),
(1927, 245, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 18:47:52', '2024-07-26 18:47:52', NULL, 1, 1),
(1928, 245, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 18:48:09', '2024-07-26 18:48:09', NULL, 1, 1),
(1929, 245, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 18:48:53', '2024-07-26 18:48:53', NULL, 1, 1),
(1930, 245, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-26 18:49:58', '2024-07-26 18:49:58', NULL, 1, 1),
(1931, 245, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 18:50:36', '2024-07-26 18:50:36', NULL, 1, 1),
(1932, 245, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 18:51:19', '2024-07-26 18:51:19', NULL, 1, 1),
(1933, 245, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 18:51:49', '2024-07-26 18:51:49', NULL, 1, 1),
(1934, 246, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 18:52:14', '2024-07-26 18:52:14', NULL, 1, 1),
(1935, 246, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 18:52:39', '2024-07-26 18:52:39', NULL, 1, 1),
(1936, 246, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 18:53:02', '2024-07-26 18:53:02', NULL, 1, 1),
(1937, 246, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 18:53:17', '2024-07-26 18:53:17', NULL, 1, 1),
(1938, 246, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 18:53:51', '2024-07-26 18:53:51', NULL, 1, 1),
(1939, 246, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 18:54:11', '2024-07-26 18:54:11', NULL, 1, 1),
(1940, 246, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 18:54:55', '2024-07-26 18:54:55', NULL, 1, 1),
(1941, 246, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-26 18:55:32', '2024-07-26 18:55:32', NULL, 1, 1),
(1942, 246, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 18:55:57', '2024-07-26 18:55:57', NULL, 1, 1),
(1943, 246, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 18:56:30', '2024-07-26 18:56:30', NULL, 1, 1),
(1944, 246, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 18:56:48', '2024-07-26 18:56:48', NULL, 1, 1),
(1945, 247, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 18:57:24', '2024-07-26 18:57:24', NULL, 1, 1),
(1946, 247, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 18:57:39', '2024-07-26 18:57:39', NULL, 1, 1),
(1947, 247, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 18:58:01', '2024-07-26 18:58:01', NULL, 1, 1),
(1948, 247, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 18:58:23', '2024-07-26 18:58:23', NULL, 1, 1),
(1949, 247, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 18:59:02', '2024-07-26 18:59:02', NULL, 1, 1),
(1950, 247, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 18:59:21', '2024-07-26 18:59:21', NULL, 1, 1),
(1951, 247, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 18:59:53', '2024-07-26 18:59:53', NULL, 1, 1),
(1952, 247, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-26 19:00:21', '2024-07-26 19:00:21', NULL, 1, 1),
(1953, 247, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 19:00:40', '2024-07-26 19:00:40', NULL, 1, 1),
(1954, 247, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 19:01:11', '2024-07-26 19:01:11', NULL, 1, 1),
(1955, 247, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 19:01:32', '2024-07-26 19:01:32', NULL, 1, 1),
(1956, 248, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 19:02:15', '2024-07-26 19:02:15', NULL, 1, 1),
(1957, 248, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 19:02:35', '2024-07-26 19:02:35', NULL, 1, 1),
(1958, 248, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 19:02:55', '2024-07-26 19:02:55', NULL, 1, 1),
(1959, 248, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 19:03:09', '2024-07-26 19:03:09', NULL, 1, 0),
(1960, 248, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 19:03:59', '2024-07-26 19:03:59', NULL, 1, 1),
(1961, 248, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 19:04:17', '2024-07-26 19:04:17', NULL, 1, 0);
INSERT INTO `parts` (`id`, `year_class_subject_id`, `mark_review_id`, `name`, `value`, `operation`, `is_final_result`, `max_per_cent`, `has_mark_review`, `is_semi_final_result`, `is_result_part`, `is_sealed`, `is_visible`, `is_active`, `must_be_calculated`, `must_be_ceiled`, `created_at`, `updated_at`, `term_id`, `is_in_results`, `is_in_final`) VALUES
(1962, 248, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 19:05:10', '2024-07-26 19:05:10', NULL, 1, 1),
(1963, 248, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-26 19:06:21', '2024-07-26 19:06:21', NULL, 1, 1),
(1964, 248, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 19:06:58', '2024-07-26 19:07:31', NULL, 1, 1),
(1965, 248, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 19:08:08', '2024-07-26 19:08:08', NULL, 1, 1),
(1966, 248, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 19:08:30', '2024-07-26 19:08:30', NULL, 1, 1),
(1967, 249, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 19:09:45', '2024-07-26 19:09:45', NULL, 1, 1),
(1968, 249, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 19:10:04', '2024-07-26 19:10:04', NULL, 1, 1),
(1969, 249, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 19:10:20', '2024-07-26 19:10:20', NULL, 1, 1),
(1970, 249, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 19:10:42', '2024-07-26 19:10:42', NULL, 1, 1),
(1971, 249, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 19:11:29', '2024-07-26 19:11:29', NULL, 1, 1),
(1972, 249, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 19:11:59', '2024-07-26 19:11:59', NULL, 1, 1),
(1973, 249, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 19:12:35', '2024-07-26 19:12:35', NULL, 1, 1),
(1974, 249, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-26 19:13:03', '2024-07-26 19:13:03', NULL, 1, 1),
(1975, 249, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 19:13:25', '2024-07-26 19:13:25', NULL, 1, 1),
(1976, 249, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 19:13:57', '2024-07-26 19:13:57', NULL, 1, 1),
(1977, 249, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 19:14:18', '2024-07-26 19:14:18', NULL, 1, 1),
(1978, 250, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 19:15:19', '2024-07-26 19:15:19', NULL, 1, 1),
(1979, 250, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 19:15:32', '2024-07-26 19:15:32', NULL, 1, 1),
(1980, 250, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 19:15:51', '2024-07-26 19:15:51', NULL, 1, 1),
(1981, 250, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 19:16:26', '2024-07-26 19:16:26', NULL, 1, 1),
(1982, 250, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 19:17:02', '2024-07-26 19:17:02', NULL, 1, 1),
(1983, 250, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 19:17:26', '2024-07-26 19:17:26', NULL, 1, 1),
(1984, 250, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 19:17:59', '2024-07-26 19:17:59', NULL, 1, 1),
(1985, 250, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-26 19:18:23', '2024-07-26 19:18:23', NULL, 1, 1),
(1986, 250, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 19:19:13', '2024-07-26 19:19:13', NULL, 1, 1),
(1987, 250, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 19:19:56', '2024-07-26 19:19:56', NULL, 1, 1),
(1988, 250, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 19:20:17', '2024-07-26 19:20:17', NULL, 1, 1),
(1989, 251, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 19:21:12', '2024-07-26 19:21:12', NULL, 1, 1),
(1990, 251, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 19:21:41', '2024-07-26 19:21:41', NULL, 1, 1),
(1991, 251, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 19:22:13', '2024-07-26 19:22:13', NULL, 1, 1),
(1992, 251, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 19:22:32', '2024-07-26 19:22:32', NULL, 1, 1),
(1993, 251, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 19:23:08', '2024-07-26 19:23:08', NULL, 1, 1),
(1994, 251, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 19:23:38', '2024-07-26 19:23:38', NULL, 1, 1),
(1995, 251, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 19:24:24', '2024-07-26 19:24:24', NULL, 1, 1),
(1996, 251, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-26 19:24:47', '2024-07-26 19:24:47', NULL, 1, 1),
(1997, 251, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 19:25:14', '2024-07-26 19:25:14', NULL, 1, 1),
(1998, 251, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 19:26:13', '2024-07-26 19:26:13', NULL, 1, 1),
(1999, 251, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 19:26:34', '2024-07-26 19:26:34', NULL, 1, 1),
(2000, 252, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 19:27:00', '2024-07-26 19:27:00', NULL, 1, 1),
(2001, 252, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 19:27:17', '2024-07-26 19:27:17', NULL, 1, 1),
(2002, 252, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 19:27:36', '2024-07-26 19:27:36', NULL, 1, 1),
(2003, 252, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 19:27:51', '2024-07-26 19:27:51', NULL, 1, 1),
(2004, 252, NULL, 'درجة الاعمال', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 19:28:37', '2024-07-26 19:28:37', NULL, 1, 1),
(2005, 252, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 19:29:02', '2024-07-26 19:29:02', NULL, 1, 1),
(2006, 252, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 19:29:28', '2024-07-26 19:29:28', NULL, 1, 1),
(2007, 252, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-26 19:29:47', '2024-07-26 19:29:47', NULL, 1, 1),
(2008, 252, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 19:30:08', '2024-07-26 19:30:08', NULL, 1, 1),
(2009, 252, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 19:31:09', '2024-07-26 19:31:09', NULL, 1, 1),
(2010, 252, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 19:31:29', '2024-07-26 19:31:29', NULL, 1, 1),
(2011, 253, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 19:32:15', '2024-07-26 19:32:15', NULL, 1, 1),
(2012, 253, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 19:32:32', '2024-07-26 19:32:32', NULL, 1, 1),
(2013, 253, NULL, 'مبادرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 19:33:06', '2024-07-26 19:33:06', NULL, 1, 1),
(2014, 253, NULL, 'مذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 19:33:45', '2024-07-26 19:33:45', NULL, 1, 1),
(2015, 253, NULL, 'درجة الاعمال', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 19:34:25', '2024-07-26 19:34:25', NULL, 1, 1),
(2016, 253, NULL, 'درجة الاختبار', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 19:34:50', '2024-07-26 19:34:50', NULL, 1, 1),
(2017, 253, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 19:35:25', '2024-07-26 19:35:25', NULL, 1, 1),
(2018, 253, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 19:35:53', '2024-07-26 19:35:53', NULL, 1, 1),
(2019, 253, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 19:36:29', '2024-07-26 19:36:29', NULL, 1, 1),
(2020, 253, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 19:36:53', '2024-07-26 19:36:53', NULL, 1, 1),
(2021, 255, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 1, 0, 0, 0, 1, 0, 0, '2024-07-26 19:38:58', '2024-07-26 19:47:05', NULL, 1, 1),
(2022, 255, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-26 19:40:55', '2024-07-26 19:40:55', NULL, 1, 1),
(2023, 255, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 19:47:49', '2024-07-26 19:47:49', NULL, 1, 1),
(2024, 255, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 19:48:29', '2024-07-26 19:48:29', NULL, 1, 1),
(2025, 255, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 19:49:13', '2024-07-26 19:49:13', NULL, 1, 1),
(2026, 256, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, NULL, 0, 1, 0, 0, 0, 1, 0, 0, '2024-07-26 19:49:58', '2024-07-26 19:49:58', NULL, 1, 1),
(2027, 256, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-26 19:50:25', '2024-07-26 19:50:25', NULL, 1, 1),
(2028, 256, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 19:50:46', '2024-07-26 19:50:46', NULL, 1, 1),
(2029, 256, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 19:51:24', '2024-07-26 19:51:24', NULL, 1, 1),
(2030, 256, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 19:51:40', '2024-07-26 19:51:40', NULL, 1, 1),
(2031, 257, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-26 19:52:08', '2024-07-26 19:52:48', NULL, 1, 1),
(2032, 257, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-26 19:52:36', '2024-07-26 19:52:36', NULL, 1, 1),
(2033, 257, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 19:53:09', '2024-07-26 19:53:09', NULL, 1, 1),
(2034, 257, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-26 19:53:39', '2024-07-26 19:53:39', NULL, 1, 1),
(2035, 257, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-26 19:54:02', '2024-07-26 19:54:02', NULL, 1, 1),
(2036, 224, NULL, 'الشفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 06:22:01', '2024-07-27 06:22:01', NULL, 1, 1),
(2037, 224, NULL, 'وظائف و أوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 06:23:14', '2024-07-27 06:25:04', NULL, 1, 1),
(2038, 297, NULL, 'شفهي', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 06:24:00', '2024-07-29 07:50:29', NULL, 1, 1),
(2039, 224, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 06:24:01', '2024-07-27 06:24:01', NULL, 1, 1),
(2040, 147, NULL, 'شفهي', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 06:24:13', '2024-07-27 06:24:13', NULL, 1, 1),
(2041, 147, NULL, 'وظائف', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 06:24:30', '2024-07-27 06:24:30', NULL, 1, 1),
(2042, 147, NULL, 'مبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 06:28:59', '2024-07-27 06:28:59', NULL, 1, 1),
(2043, 297, NULL, 'وظائف', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 06:34:24', '2024-07-29 07:50:38', NULL, 1, 1),
(2044, 297, NULL, 'مبادرة', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 06:34:48', '2024-07-29 07:50:46', NULL, 1, 1),
(2045, 297, NULL, 'مذاكرة', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 06:35:24', '2024-07-29 07:50:59', NULL, 1, 1),
(2046, 297, NULL, 'درجة الاعمال', 2.00, 'divide', 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:36:11', '2024-07-29 07:51:34', NULL, 1, 1),
(2047, 287, NULL, 'شفهي', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 06:38:31', '2024-07-29 07:58:36', NULL, 1, 1),
(2048, 287, NULL, 'وظائف', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 06:38:40', '2024-07-29 07:58:52', NULL, 1, 1),
(2049, 287, NULL, 'مبادرات', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 06:39:03', '2024-07-29 07:59:01', NULL, 1, 1),
(2050, 287, NULL, 'مذاكرة', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 06:39:13', '2024-07-29 07:59:10', NULL, 1, 1),
(2051, 287, NULL, 'درجة الأعمال', 2.00, 'divide', 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:39:44', '2024-07-29 07:59:26', NULL, 1, 1),
(2053, 109, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:48:42', '2024-07-27 06:48:42', NULL, 1, 1),
(2054, 111, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:48:58', '2024-07-27 06:48:58', NULL, 1, 1),
(2055, 112, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:49:42', '2024-07-27 06:49:42', NULL, 1, 1),
(2056, 131, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:50:09', '2024-07-27 06:50:09', NULL, 1, 1),
(2057, 114, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:50:17', '2024-07-27 06:50:17', NULL, 1, 1),
(2058, 132, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:50:45', '2024-07-27 06:50:45', NULL, 1, 1),
(2059, 116, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:50:46', '2024-07-27 06:50:46', NULL, 1, 1),
(2060, 118, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:51:10', '2024-07-27 06:51:10', NULL, 1, 1),
(2061, 133, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:51:22', '2024-07-27 06:51:22', NULL, 1, 1),
(2062, 129, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:51:37', '2024-07-27 06:51:37', NULL, 1, 1),
(2063, 134, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:51:54', '2024-07-27 06:51:54', NULL, 1, 1),
(2064, 119, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:51:59', '2024-07-27 06:51:59', NULL, 1, 1),
(2065, 121, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:52:25', '2024-07-27 06:52:25', NULL, 1, 1),
(2066, 136, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:52:35', '2024-07-27 06:52:35', NULL, 1, 1),
(2067, 122, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:52:48', '2024-07-27 06:52:48', NULL, 1, 1),
(2068, 135, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:53:13', '2024-07-27 06:53:13', NULL, 1, 1),
(2069, 123, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 0, 1, 0, '2024-07-27 06:53:24', '2024-07-27 06:53:24', NULL, 1, 1),
(2070, 126, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:53:50', '2024-07-27 06:53:50', NULL, 1, 1),
(2071, 144, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:54:10', '2024-07-27 06:54:10', NULL, 1, 1),
(2072, 127, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:54:13', '2024-07-27 06:54:13', NULL, 1, 1),
(2073, 128, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:54:36', '2024-07-27 06:54:36', NULL, 1, 1),
(2074, 149, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:55:23', '2024-07-27 06:55:23', NULL, 1, 1),
(2075, 137, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:55:25', '2024-07-27 06:55:25', NULL, 1, 1),
(2076, 150, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:55:46', '2024-07-27 06:55:46', NULL, 1, 1),
(2077, 151, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:56:17', '2024-07-27 06:56:17', NULL, 1, 1),
(2078, 138, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:56:18', '2024-07-27 06:56:18', NULL, 1, 1),
(2079, 152, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:56:39', '2024-07-27 06:56:39', NULL, 1, 1),
(2080, 155, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:57:15', '2024-07-27 06:57:15', NULL, 1, 1),
(2081, 139, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:57:18', '2024-07-27 06:57:18', NULL, 1, 1),
(2082, 153, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:57:43', '2024-07-27 06:57:43', NULL, 1, 1),
(2083, 140, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:57:52', '2024-07-27 06:57:52', NULL, 1, 1),
(2084, 154, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:58:08', '2024-07-27 06:58:08', NULL, 1, 1),
(2085, 141, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:58:20', '2024-07-27 06:58:20', NULL, 1, 1),
(2086, 168, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:58:34', '2024-07-28 10:58:03', NULL, 1, 1),
(2087, 142, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:58:39', '2024-07-27 06:58:39', NULL, 1, 1),
(2088, 157, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:58:59', '2024-07-27 06:58:59', NULL, 1, 1),
(2089, 143, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:59:01', '2024-07-27 06:59:01', NULL, 1, 1),
(2090, 188, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:59:44', '2024-07-27 06:59:44', NULL, 1, 1),
(2091, 158, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 06:59:45', '2024-07-27 06:59:45', NULL, 1, 1),
(2092, 189, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:00:04', '2024-07-27 07:00:04', NULL, 1, 1),
(2093, 159, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:00:09', '2024-07-27 07:00:09', NULL, 1, 1),
(2094, 190, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:00:24', '2024-07-27 07:00:24', NULL, 1, 1),
(2095, 160, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:00:30', '2024-07-27 07:00:30', NULL, 1, 1),
(2096, 191, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:00:50', '2024-07-27 07:00:50', NULL, 1, 1),
(2097, 193, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-27 07:01:05', '2024-07-27 07:01:05', NULL, 1, 1),
(2098, 194, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:01:32', '2024-07-27 07:01:32', NULL, 1, 1),
(2099, 161, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:01:43', '2024-07-27 07:01:43', NULL, 1, 1),
(2100, 195, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:01:47', '2024-07-27 07:02:02', NULL, 1, 1),
(2101, 162, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:02:26', '2024-07-27 07:02:26', NULL, 1, 1),
(2102, 196, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:02:30', '2024-07-27 07:02:30', NULL, 1, 1),
(2103, 199, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-27 07:02:46', '2024-07-27 07:02:46', NULL, 1, 1),
(2104, 200, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:03:05', '2024-07-27 07:03:05', NULL, 1, 1),
(2105, 201, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:03:34', '2024-07-27 07:03:34', NULL, 1, 1),
(2106, 166, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:03:36', '2024-07-27 07:03:36', NULL, 1, 1),
(2107, 202, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:03:51', '2024-07-27 07:07:37', NULL, 1, 1),
(2108, 167, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:03:56', '2024-07-27 07:03:56', NULL, 1, 1),
(2109, 169, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:06:31', '2024-07-27 07:06:31', NULL, 1, 1),
(2110, 204, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:07:55', '2024-07-27 07:07:55', NULL, 1, 1),
(2111, 171, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:07:56', '2024-07-27 07:07:56', NULL, 1, 1),
(2112, 206, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:08:16', '2024-07-27 07:08:16', NULL, 1, 1),
(2113, 208, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:10:13', '2024-07-27 07:10:13', NULL, 1, 1),
(2114, 214, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:10:57', '2024-07-27 07:11:06', NULL, 1, 1),
(2115, 172, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:11:37', '2024-07-27 07:11:37', NULL, 1, 1),
(2116, 216, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:11:58', '2024-07-27 07:11:58', NULL, 1, 1),
(2117, 173, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:12:14', '2024-07-27 07:12:14', NULL, 1, 1),
(2118, 186, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:13:02', '2024-07-27 07:13:02', NULL, 1, 1),
(2119, 175, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:13:11', '2024-07-27 07:13:11', NULL, 1, 1),
(2120, 187, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:13:28', '2024-07-27 07:13:28', NULL, 1, 1),
(2121, 176, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:13:36', '2024-07-29 09:54:52', NULL, 1, 1),
(2122, 192, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:13:55', '2024-07-27 07:13:55', NULL, 1, 1),
(2123, 177, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:13:58', '2024-07-27 07:13:58', NULL, 1, 1),
(2124, 197, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:14:18', '2024-07-27 07:14:18', NULL, 1, 1),
(2125, 178, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:14:19', '2024-07-27 07:14:19', NULL, 1, 1),
(2126, 203, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:14:41', '2024-07-27 07:14:41', NULL, 1, 1),
(2127, 179, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:15:07', '2024-07-27 07:15:07', NULL, 1, 1),
(2128, 207, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:15:07', '2024-07-27 07:15:07', NULL, 1, 1),
(2129, 209, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:15:33', '2024-07-27 07:15:33', NULL, 1, 1),
(2130, 180, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:15:39', '2024-07-27 07:15:39', NULL, 1, 1),
(2131, 181, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:16:57', '2024-07-27 07:16:57', NULL, 1, 1),
(2132, 215, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:17:40', '2024-07-27 07:17:40', NULL, 1, 1),
(2133, 182, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:17:58', '2024-07-27 07:17:58', NULL, 1, 1),
(2134, 217, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:18:10', '2024-07-27 07:18:10', NULL, 1, 1),
(2135, 183, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:18:22', '2024-07-27 07:18:22', NULL, 1, 1),
(2136, 218, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:19:29', '2024-07-27 07:19:29', NULL, 1, 1),
(2137, 184, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:19:39', '2024-07-27 07:19:39', NULL, 1, 1),
(2138, 185, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:20:03', '2024-07-27 07:20:03', NULL, 1, 1),
(2139, 219, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:20:23', '2024-07-27 07:20:23', NULL, 1, 1),
(2140, 220, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:21:03', '2024-07-27 07:21:03', NULL, 1, 1),
(2141, 221, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:21:44', '2024-07-27 07:21:44', NULL, 1, 1),
(2142, 222, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:22:05', '2024-07-27 07:22:05', NULL, 1, 1),
(2143, 272, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:32:10', '2024-07-27 07:32:10', NULL, 1, 1),
(2144, 272, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:32:20', '2024-07-27 07:32:20', NULL, 1, 1),
(2145, 258, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:32:32', '2024-07-27 07:32:32', NULL, 1, 1),
(2146, 272, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, '2024-07-27 07:32:42', '2024-07-27 07:32:42', NULL, 1, 1),
(2147, 258, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:32:49', '2024-07-27 07:32:49', NULL, 1, 1),
(2148, 272, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:32:54', '2024-07-27 07:32:54', NULL, 1, 1),
(2149, 258, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:33:13', '2024-07-27 07:33:13', NULL, 1, 1),
(2150, 258, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:33:30', '2024-07-27 07:33:30', NULL, 1, 1),
(2151, 258, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 07:35:05', '2024-07-27 07:35:05', NULL, 1, 1),
(2152, 272, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:36:00', '2024-07-27 07:36:00', NULL, 1, 1),
(2153, 258, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:36:17', '2024-07-27 07:36:17', NULL, 1, 1),
(2154, 272, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-27 07:36:31', '2024-07-27 07:36:31', NULL, 1, 1),
(2155, 258, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 07:36:57', '2024-07-27 07:36:57', NULL, 1, 1),
(2156, 272, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:37:01', '2024-07-27 07:37:01', NULL, 1, 1),
(2157, 272, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:37:20', '2024-07-27 07:37:20', NULL, 1, 1),
(2158, 258, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 1, 0, 0, 1, 1, 0, 0, '2024-07-27 07:37:30', '2024-07-27 07:37:40', NULL, 1, 1),
(2159, 272, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:38:25', '2024-07-27 07:38:25', NULL, 1, 1),
(2160, 258, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 07:38:26', '2024-07-27 07:38:26', NULL, 1, 1),
(2161, 273, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:38:53', '2024-07-27 07:38:53', NULL, 1, 1),
(2162, 273, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:39:05', '2024-07-27 07:39:05', NULL, 1, 1),
(2163, 258, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 07:39:21', '2024-07-27 07:39:21', NULL, 1, 1),
(2164, 273, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:39:21', '2024-07-27 07:39:21', NULL, 1, 1),
(2165, 273, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:39:33', '2024-07-27 07:39:33', NULL, 1, 1),
(2166, 258, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-27 07:39:45', '2024-07-27 07:39:45', NULL, 1, 1),
(2167, 259, NULL, 'شفوية', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:40:30', '2024-07-27 07:40:30', NULL, 1, 1),
(2168, 273, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:40:37', '2024-07-27 07:40:37', NULL, 1, 1),
(2169, 259, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:40:43', '2024-07-27 07:40:43', NULL, 1, 1),
(2170, 273, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-27 07:40:58', '2024-07-27 07:40:58', NULL, 1, 1),
(2171, 259, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:41:22', '2024-07-27 07:41:22', NULL, 1, 1),
(2172, 273, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:41:42', '2024-07-27 07:41:42', NULL, 1, 1),
(2173, 259, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:41:50', '2024-07-27 07:41:50', NULL, 1, 1),
(2174, 273, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:42:01', '2024-07-27 07:42:01', NULL, 1, 1),
(2175, 259, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 07:42:22', '2024-07-27 07:42:22', NULL, 1, 1),
(2176, 273, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:42:30', '2024-07-27 07:42:30', NULL, 1, 1),
(2177, 259, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:42:44', '2024-07-27 07:42:44', NULL, 1, 1),
(2178, 275, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:42:56', '2024-07-27 07:42:56', NULL, 1, 1),
(2179, 275, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:43:23', '2024-07-27 07:43:23', NULL, 1, 1),
(2180, 275, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:43:50', '2024-07-27 07:43:50', NULL, 1, 1),
(2181, 259, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 07:43:57', '2024-07-27 07:43:57', NULL, 1, 1),
(2182, 275, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:44:14', '2024-07-27 07:44:14', NULL, 1, 1),
(2183, 259, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 1, 0, 0, 1, 1, 0, 0, '2024-07-27 07:44:22', '2024-07-27 07:44:22', NULL, 1, 1),
(2184, 259, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 07:44:45', '2024-07-27 07:45:23', NULL, 1, 1),
(2185, 275, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:44:59', '2024-07-27 07:44:59', NULL, 1, 1),
(2186, 275, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-27 07:46:53', '2024-07-27 07:46:53', NULL, 1, 1),
(2187, 259, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 07:46:57', '2024-07-27 07:46:57', NULL, 1, 1),
(2188, 259, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-27 07:47:29', '2024-07-27 07:47:43', NULL, 1, 1),
(2189, 275, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:48:01', '2024-07-27 07:48:01', NULL, 1, 1),
(2190, 260, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:48:47', '2024-07-27 07:48:47', NULL, 1, 1),
(2191, 260, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:49:33', '2024-07-27 07:49:33', NULL, 1, 1),
(2192, 275, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:49:50', '2024-07-27 07:49:50', NULL, 1, 1),
(2193, 260, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:49:54', '2024-07-27 07:49:54', NULL, 1, 1),
(2194, 275, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:51:10', '2024-07-27 07:51:10', NULL, 1, 1),
(2195, 260, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:51:13', '2024-07-27 07:51:13', NULL, 1, 1),
(2196, 276, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:51:34', '2024-07-27 07:51:34', NULL, 1, 1),
(2197, 276, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:51:49', '2024-07-27 07:51:49', NULL, 1, 1),
(2198, 260, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 07:51:49', '2024-07-27 07:51:49', NULL, 1, 1),
(2199, 276, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:52:10', '2024-07-27 07:52:10', NULL, 1, 1),
(2200, 276, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:52:21', '2024-07-27 07:52:21', NULL, 1, 1),
(2201, 260, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:52:50', '2024-07-27 07:52:50', NULL, 1, 1),
(2202, 276, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:53:09', '2024-07-27 07:55:23', NULL, 1, 1),
(2203, 260, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 07:53:16', '2024-07-27 07:53:16', NULL, 1, 1),
(2204, 276, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-27 07:53:24', '2024-07-27 07:53:24', NULL, 1, 1),
(2205, 260, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 1, 0, 0, 1, 1, 0, 0, '2024-07-27 07:53:50', '2024-07-27 07:53:50', NULL, 1, 1),
(2206, 260, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 07:54:19', '2024-07-27 07:54:19', NULL, 1, 1),
(2207, 276, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:54:56', '2024-07-27 07:54:56', NULL, 1, 1),
(2208, 260, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 07:55:02', '2024-07-27 07:55:02', NULL, 1, 1),
(2209, 260, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-27 07:55:21', '2024-07-27 07:55:21', NULL, 1, 1),
(2210, 276, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:56:07', '2024-07-27 07:56:07', NULL, 1, 1),
(2211, 261, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:56:16', '2024-07-27 07:56:16', NULL, 1, 1),
(2212, 261, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:56:41', '2024-07-27 07:56:41', NULL, 1, 1),
(2213, 276, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:56:50', '2024-07-27 07:56:50', NULL, 1, 1),
(2214, 261, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:57:00', '2024-07-27 07:57:00', NULL, 1, 1),
(2215, 261, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:57:19', '2024-07-27 07:57:19', NULL, 1, 1),
(2216, 277, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:57:21', '2024-07-27 07:57:21', NULL, 1, 1),
(2217, 277, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:57:35', '2024-07-27 07:57:35', NULL, 1, 1),
(2218, 277, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:57:50', '2024-07-27 07:57:50', NULL, 1, 1),
(2219, 277, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:58:04', '2024-07-27 07:58:04', NULL, 1, 1),
(2220, 261, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 07:58:22', '2024-07-27 07:58:22', NULL, 1, 1),
(2221, 277, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:58:34', '2024-07-27 07:58:34', NULL, 1, 1),
(2222, 261, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 07:58:45', '2024-07-27 07:58:45', NULL, 1, 1),
(2223, 277, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-27 07:59:01', '2024-07-27 07:59:01', NULL, 1, 1),
(2224, 261, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 07:59:18', '2024-07-27 07:59:18', NULL, 1, 1),
(2225, 261, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 1, 0, 0, 1, 1, 0, 0, '2024-07-27 07:59:41', '2024-07-27 07:59:41', NULL, 1, 1),
(2226, 277, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 07:59:55', '2024-07-27 07:59:55', NULL, 1, 1),
(2227, 261, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 08:00:19', '2024-07-27 08:00:19', NULL, 1, 1),
(2228, 277, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 08:00:29', '2024-07-27 08:00:29', NULL, 1, 1),
(2229, 261, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 08:00:46', '2024-07-27 08:00:46', NULL, 1, 1),
(2230, 277, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 08:00:48', '2024-07-27 08:00:48', NULL, 1, 1),
(2231, 261, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-27 08:01:07', '2024-07-27 08:01:07', NULL, 1, 1),
(2232, 278, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:01:12', '2024-07-27 08:01:12', NULL, 1, 1),
(2233, 278, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:01:26', '2024-07-27 08:01:26', NULL, 1, 1),
(2234, 278, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:01:37', '2024-07-27 08:01:37', NULL, 1, 1),
(2235, 262, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:01:38', '2024-07-27 08:02:07', NULL, 1, 1),
(2236, 262, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:01:58', '2024-07-27 08:01:58', NULL, 1, 1),
(2237, 278, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:02:01', '2024-07-27 08:02:01', NULL, 1, 1),
(2238, 262, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:02:36', '2024-07-27 08:02:36', NULL, 1, 1),
(2239, 278, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 08:02:37', '2024-07-27 08:02:37', NULL, 1, 1),
(2240, 278, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-27 08:02:48', '2024-07-27 08:02:48', NULL, 1, 1),
(2241, 262, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:02:52', '2024-07-27 08:02:52', NULL, 1, 1),
(2242, 278, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 08:03:04', '2024-07-27 08:03:04', NULL, 1, 1),
(2243, 262, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:03:09', '2024-07-27 08:03:09', NULL, 1, 1),
(2244, 278, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 08:03:19', '2024-07-27 08:03:19', NULL, 1, 1),
(2245, 278, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 08:03:38', '2024-07-27 08:03:38', NULL, 1, 1),
(2246, 279, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:03:58', '2024-07-27 08:03:58', NULL, 1, 1),
(2247, 279, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:04:12', '2024-07-27 08:04:12', NULL, 1, 1),
(2248, 279, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:04:26', '2024-07-27 08:04:26', NULL, 1, 1),
(2249, 279, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:04:41', '2024-07-27 08:04:41', NULL, 1, 1),
(2250, 279, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 08:05:11', '2024-07-27 08:05:11', NULL, 1, 1),
(2251, 262, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 08:05:14', '2024-07-27 08:05:14', NULL, 1, 1),
(2252, 279, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-27 08:05:32', '2024-07-27 08:05:32', NULL, 1, 1),
(2253, 262, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 08:05:41', '2024-07-27 08:05:41', NULL, 1, 1),
(2254, 262, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 1, 0, 0, 1, 1, 0, 0, '2024-07-27 08:06:00', '2024-07-27 08:06:00', NULL, 1, 1),
(2255, 279, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 08:06:09', '2024-07-27 08:06:09', NULL, 1, 1),
(2256, 262, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 08:06:19', '2024-07-27 08:06:19', NULL, 1, 1),
(2257, 279, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 08:06:26', '2024-07-27 08:06:26', NULL, 1, 1),
(2258, 262, NULL, 'متوسط درجات الفصلين', 2.00, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 08:06:48', '2024-07-27 08:06:48', NULL, 1, 1),
(2259, 262, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-27 08:07:09', '2024-07-27 08:07:09', NULL, 1, 1),
(2260, 263, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:07:30', '2024-07-27 08:08:02', NULL, 1, 1),
(2261, 279, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 08:07:40', '2024-07-27 08:07:40', NULL, 1, 1),
(2262, 263, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:07:44', '2024-07-27 08:07:53', NULL, 1, 1),
(2263, 263, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:08:18', '2024-07-27 08:08:18', NULL, 1, 1),
(2264, 280, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:08:20', '2024-07-27 08:08:20', NULL, 1, 1),
(2265, 280, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:08:31', '2024-07-27 08:08:31', NULL, 1, 1),
(2266, 263, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:08:32', '2024-07-27 08:08:32', NULL, 1, 1),
(2267, 280, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:08:45', '2024-07-27 08:08:45', NULL, 1, 1),
(2268, 280, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:09:15', '2024-07-27 08:09:15', NULL, 1, 1),
(2269, 263, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 08:09:17', '2024-07-27 08:09:17', NULL, 1, 1),
(2270, 263, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:09:33', '2024-07-27 08:09:43', NULL, 1, 1),
(2271, 280, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 08:09:50', '2024-07-27 08:09:50', NULL, 1, 1),
(2272, 280, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-27 08:10:04', '2024-07-27 08:10:04', NULL, 1, 1),
(2273, 263, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 08:10:07', '2024-07-27 08:10:07', NULL, 1, 1),
(2274, 263, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 1, 0, 0, 1, 1, 0, 0, '2024-07-27 08:10:26', '2024-07-27 08:10:26', NULL, 1, 1),
(2275, 280, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 08:10:30', '2024-07-27 08:10:30', NULL, 1, 1),
(2276, 263, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 08:10:51', '2024-07-27 08:10:51', NULL, 1, 1),
(2277, 280, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 0, 1, 0, '2024-07-27 08:11:06', '2024-07-27 08:11:06', NULL, 1, 1),
(2278, 263, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 08:11:19', '2024-07-27 08:11:19', NULL, 1, 1),
(2279, 280, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 08:11:25', '2024-07-27 08:11:25', NULL, 1, 1),
(2280, 263, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-27 08:11:35', '2024-07-27 08:11:35', NULL, 1, 1),
(2281, 281, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:12:29', '2024-07-27 08:12:29', NULL, 1, 1),
(2282, 264, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:12:42', '2024-07-27 08:12:42', NULL, 1, 1),
(2283, 281, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:12:44', '2024-07-27 08:12:44', NULL, 1, 1),
(2284, 281, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:12:59', '2024-07-27 08:12:59', NULL, 1, 1),
(2285, 281, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:13:14', '2024-07-27 08:13:14', NULL, 1, 1),
(2286, 264, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:13:15', '2024-07-27 08:13:15', NULL, 1, 1),
(2287, 264, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:14:09', '2024-07-27 08:14:09', NULL, 1, 1),
(2288, 281, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 08:14:21', '2024-07-27 08:14:21', NULL, 1, 1),
(2289, 264, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:14:35', '2024-07-27 08:14:35', NULL, 1, 1),
(2290, 281, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-27 08:14:43', '2024-07-27 08:14:43', NULL, 1, 1),
(2291, 264, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 08:15:20', '2024-07-27 08:16:16', NULL, 1, 1),
(2292, 281, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 08:15:21', '2024-07-27 08:15:21', NULL, 1, 1),
(2293, 264, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:16:06', '2024-07-27 08:16:06', NULL, 1, 1),
(2294, 281, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 08:16:06', '2024-07-27 08:16:06', NULL, 1, 1),
(2295, 281, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 08:16:28', '2024-07-27 08:16:28', NULL, 1, 1),
(2296, 264, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 08:16:44', '2024-07-27 08:16:44', NULL, 1, 1),
(2297, 264, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 1, 0, 0, 1, 1, 0, 0, '2024-07-27 08:17:30', '2024-07-27 08:17:30', NULL, 1, 1),
(2298, 264, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 08:18:04', '2024-07-27 08:18:04', NULL, 1, 1),
(2299, 264, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 08:18:46', '2024-07-27 08:18:46', NULL, 1, 1),
(2300, 283, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-27 08:18:56', '2024-07-27 08:18:56', NULL, 1, 1),
(2301, 264, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-27 08:19:06', '2024-07-27 08:19:06', NULL, 1, 1),
(2302, 283, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 1, 0, '2024-07-27 08:19:39', '2024-07-27 08:19:39', NULL, 1, 1),
(2303, 283, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 08:20:19', '2024-07-27 08:20:19', NULL, 1, 1),
(2304, 265, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:20:40', '2024-07-27 08:20:40', NULL, 1, 1),
(2305, 286, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-27 08:20:45', '2024-07-27 08:20:45', NULL, 1, 1),
(2306, 265, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:21:16', '2024-07-27 08:21:16', NULL, 1, 1),
(2307, 286, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 1, 0, '2024-07-27 08:21:30', '2024-07-27 08:21:30', NULL, 1, 1),
(2308, 265, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:21:41', '2024-07-27 08:21:41', NULL, 1, 1),
(2309, 286, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 08:21:45', '2024-07-27 08:21:45', NULL, 1, 1),
(2310, 284, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-27 08:22:10', '2024-07-27 08:22:10', NULL, 1, 1),
(2311, 265, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:22:15', '2024-07-27 08:22:15', NULL, 1, 1),
(2312, 284, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 1, 0, '2024-07-27 08:22:23', '2024-07-27 08:22:23', NULL, 1, 1),
(2313, 284, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 0, 1, 0, '2024-07-27 08:22:43', '2024-07-27 08:22:43', NULL, 1, 1),
(2314, 265, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 08:22:52', '2024-07-27 08:22:52', NULL, 1, 1),
(2315, 285, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-27 08:23:04', '2024-07-27 08:23:04', NULL, 1, 1),
(2316, 265, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:23:10', '2024-07-27 08:23:10', NULL, 1, 1),
(2317, 285, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 1, 0, '2024-07-27 08:23:20', '2024-07-27 08:23:20', NULL, 1, 1),
(2318, 265, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 08:23:45', '2024-07-27 08:23:45', NULL, 1, 1),
(2319, 285, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-27 08:24:05', '2024-07-27 08:24:05', NULL, 1, 1),
(2320, 265, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 1, 0, 0, 1, 1, 0, 0, '2024-07-27 08:24:42', '2024-07-27 08:24:42', NULL, 1, 1),
(2321, 265, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 08:25:32', '2024-07-27 08:25:32', NULL, 1, 1),
(2322, 265, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 08:26:26', '2024-07-27 08:26:26', NULL, 1, 1),
(2323, 265, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-27 08:26:52', '2024-07-27 08:26:52', NULL, 1, 1),
(2324, 266, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:28:22', '2024-07-27 08:28:22', NULL, 1, 1),
(2325, 266, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:28:42', '2024-07-27 08:29:13', NULL, 1, 1),
(2326, 266, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:29:04', '2024-07-27 08:29:04', NULL, 1, 1),
(2327, 266, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:29:29', '2024-07-27 08:29:29', NULL, 1, 1),
(2328, 266, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 08:30:59', '2024-07-27 08:30:59', NULL, 1, 1),
(2329, 266, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:32:44', '2024-07-27 08:32:44', NULL, 1, 1);
INSERT INTO `parts` (`id`, `year_class_subject_id`, `mark_review_id`, `name`, `value`, `operation`, `is_final_result`, `max_per_cent`, `has_mark_review`, `is_semi_final_result`, `is_result_part`, `is_sealed`, `is_visible`, `is_active`, `must_be_calculated`, `must_be_ceiled`, `created_at`, `updated_at`, `term_id`, `is_in_results`, `is_in_final`) VALUES
(2330, 266, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 08:33:17', '2024-07-27 08:33:17', NULL, 1, 1),
(2331, 266, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-27 08:33:35', '2024-07-27 08:33:35', NULL, 1, 1),
(2332, 3, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:33:48', '2024-07-27 08:33:48', NULL, 1, 1),
(2333, 266, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 1, '2024-07-27 08:33:55', '2024-07-27 08:33:55', NULL, 0, 1),
(2334, 3, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:33:57', '2024-07-27 08:33:57', NULL, 1, 1),
(2335, 3, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:34:06', '2024-07-27 08:34:06', NULL, 1, 1),
(2336, 3, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:34:17', '2024-07-27 08:34:17', NULL, 1, 1),
(2337, 266, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 08:34:28', '2024-07-27 08:34:28', NULL, 1, 1),
(2338, 3, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 08:34:41', '2024-07-27 08:34:41', NULL, 1, 1),
(2339, 266, NULL, 'التقدير النهائي', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-27 08:34:47', '2024-07-27 08:34:47', NULL, 1, 1),
(2340, 3, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:35:01', '2024-07-27 08:35:01', NULL, 1, 1),
(2341, 267, NULL, 'شفوية', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:35:14', '2024-07-27 08:35:14', NULL, 1, 1),
(2342, 267, NULL, 'وظائف وأوراق عمل', NULL, NULL, 0, 10, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:35:33', '2024-07-27 08:35:33', NULL, 1, 1),
(2343, 3, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 08:35:35', '2024-07-27 08:35:35', NULL, 1, 1),
(2344, 267, NULL, 'نشاطات ومبادرات', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:35:49', '2024-07-27 08:35:49', NULL, 1, 1),
(2345, 3, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:35:53', '2024-07-27 08:35:53', NULL, 1, 1),
(2346, 267, NULL, 'المذاكرة', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:36:03', '2024-07-27 08:36:03', NULL, 1, 1),
(2347, 3, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 08:36:28', '2024-07-27 08:36:28', NULL, 1, 1),
(2348, 3, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-27 08:36:44', '2024-07-27 08:40:20', NULL, 1, 1),
(2349, 3, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-27 08:36:57', '2024-07-27 08:40:12', NULL, 1, 1),
(2350, 267, NULL, 'درجة أعمال الفصل', NULL, NULL, 0, 60, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 08:37:15', '2024-07-27 08:37:15', NULL, 1, 1),
(2351, 267, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:37:34', '2024-07-27 08:37:34', NULL, 1, 1),
(2352, 267, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 08:38:44', '2024-07-27 08:38:44', NULL, 1, 1),
(2353, 267, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-27 08:39:04', '2024-07-27 08:39:04', NULL, 1, 1),
(2354, 267, NULL, 'متوسط درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 08:39:32', '2024-07-27 08:39:32', NULL, 1, 1),
(2355, 267, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 08:39:54', '2024-07-27 08:39:54', NULL, 1, 1),
(2356, 267, NULL, 'التقدير النهائي', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-27 08:40:17', '2024-07-27 08:40:28', NULL, 1, 1),
(2357, 269, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:41:00', '2024-07-27 08:41:00', NULL, 1, 1),
(2358, 269, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-27 08:41:16', '2024-07-27 08:41:16', NULL, 1, 1),
(2359, 269, NULL, 'متوسط درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 08:41:43', '2024-07-27 08:41:43', NULL, 1, 1),
(2360, 269, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 08:42:07', '2024-07-27 08:42:07', NULL, 1, 1),
(2361, 269, NULL, 'التقدير النهائي', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-27 08:42:21', '2024-07-27 08:42:21', NULL, 1, 1),
(2362, 270, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:42:46', '2024-07-27 08:42:54', NULL, 1, 1),
(2363, 270, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-27 08:43:24', '2024-07-27 08:43:24', NULL, 1, 1),
(2364, 270, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 08:43:41', '2024-07-27 08:45:02', NULL, 1, 1),
(2365, 270, NULL, 'متوسط درجات الفصلين', NULL, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 08:44:18', '2024-07-27 08:45:28', NULL, 1, 1),
(2366, 270, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-27 08:45:50', '2024-07-27 08:45:50', NULL, 1, 1),
(2367, 271, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-27 08:46:16', '2024-07-27 08:46:16', NULL, 1, 1),
(2368, 271, NULL, 'تقدير الفصل', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-27 08:46:34', '2024-07-27 08:46:34', NULL, 1, 1),
(2369, 271, NULL, 'مجموع درجات الفصلين', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 08:46:59', '2024-07-27 08:46:59', NULL, 1, 1),
(2370, 271, NULL, 'متوسط درجات الفصلين', 2.00, 'divide', 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, '2024-07-27 08:47:25', '2024-07-27 08:47:25', NULL, 1, 1),
(2371, 271, NULL, 'التقدير النهائي', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-27 08:47:41', '2024-07-27 08:47:41', NULL, 1, 1),
(2372, 85, NULL, 'التقدير النهائي', NULL, NULL, 1, NULL, 1, 0, 0, 0, 1, 1, 0, 0, '2024-07-27 09:36:10', '2024-07-27 09:36:10', NULL, 1, 1),
(2373, 15, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:15:08', '2024-07-28 09:15:08', NULL, 1, 1),
(2374, 93, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:19:33', '2024-07-28 09:32:29', NULL, 1, 1),
(2375, 15, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:23:08', '2024-07-28 09:28:07', NULL, 1, 1),
(2376, 17, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:27:04', '2024-07-28 09:27:36', NULL, 1, 1),
(2377, 17, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:27:53', '2024-07-28 09:27:53', NULL, 1, 1),
(2378, 18, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:31:23', '2024-07-28 09:33:25', NULL, 1, 1),
(2379, 93, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:31:30', '2024-07-28 09:32:08', NULL, 1, 1),
(2380, 18, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:32:18', '2024-07-28 09:32:18', NULL, 1, 1),
(2381, 18, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:32:38', '2024-07-28 09:32:38', NULL, 1, 1),
(2382, 15, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:33:47', '2024-07-28 09:33:47', NULL, 1, 1),
(2383, 17, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:34:08', '2024-07-28 09:34:08', NULL, 1, 1),
(2384, 19, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:35:49', '2024-07-28 09:35:49', NULL, 1, 1),
(2385, 19, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:36:32', '2024-07-28 09:36:32', NULL, 1, 1),
(2386, 19, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:36:50', '2024-07-28 09:36:50', NULL, 1, 1),
(2387, 20, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:38:22', '2024-07-28 09:38:22', NULL, 1, 1),
(2388, 20, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:38:53', '2024-07-28 09:38:53', NULL, 1, 1),
(2389, 20, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:39:30', '2024-07-28 09:39:30', NULL, 1, 1),
(2390, 310, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:40:13', '2024-07-28 09:40:13', NULL, 1, 1),
(2391, 310, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:40:38', '2024-07-28 09:40:38', NULL, 1, 1),
(2392, 21, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:41:40', '2024-07-28 09:41:40', NULL, 1, 1),
(2393, 94, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:41:41', '2024-07-28 09:41:41', NULL, 1, 1),
(2394, 21, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:41:58', '2024-07-28 09:41:58', NULL, 1, 1),
(2395, 94, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:42:01', '2024-07-28 09:42:01', NULL, 1, 1),
(2396, 21, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:42:19', '2024-07-28 09:42:19', NULL, 1, 1),
(2397, 95, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:42:43', '2024-07-28 09:42:43', NULL, 1, 1),
(2398, 95, NULL, 'كتابة', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:42:57', '2024-07-28 09:42:57', NULL, 1, 1),
(2399, 22, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:43:21', '2024-07-28 09:43:21', NULL, 1, 1),
(2400, 22, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:43:53', '2024-07-28 09:43:53', NULL, 1, 1),
(2401, 22, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:44:49', '2024-07-28 09:44:49', NULL, 1, 1),
(2402, 23, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:46:26', '2024-07-28 09:46:26', NULL, 1, 1),
(2403, 23, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:46:46', '2024-07-28 09:46:46', NULL, 1, 1),
(2404, 23, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:46:59', '2024-07-28 09:46:59', NULL, 1, 1),
(2405, 98, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:48:07', '2024-07-28 09:48:07', NULL, 1, 1),
(2406, 98, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:48:32', '2024-07-28 09:48:32', NULL, 1, 1),
(2407, 24, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:49:22', '2024-07-28 09:49:22', NULL, 1, 1),
(2408, 24, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:49:45', '2024-07-28 09:49:45', NULL, 1, 1),
(2409, 24, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:49:58', '2024-07-28 09:49:58', NULL, 1, 1),
(2410, 99, NULL, 'كتابة', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:51:11', '2024-07-28 09:51:11', NULL, 1, 1),
(2411, 33, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:51:22', '2024-07-28 09:51:22', NULL, 1, 1),
(2412, 99, NULL, 'كتابة', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:51:27', '2024-07-28 09:51:27', NULL, 1, 1),
(2413, 33, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:51:42', '2024-07-28 09:51:42', NULL, 1, 1),
(2414, 33, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:51:55', '2024-07-28 09:51:55', NULL, 1, 1),
(2415, 35, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:56:30', '2024-07-28 09:56:30', NULL, 1, 1),
(2416, 35, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:58:30', '2024-07-28 09:58:30', NULL, 1, 1),
(2417, 35, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 09:58:54', '2024-07-28 09:58:54', NULL, 1, 1),
(2418, 36, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 0, 1, 0, '2024-07-28 10:00:43', '2024-07-28 10:00:43', NULL, 0, 1),
(2419, 100, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:00:54', '2024-07-28 10:01:02', NULL, 1, 1),
(2420, 36, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:01:04', '2024-07-28 10:01:04', NULL, 1, 1),
(2421, 100, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:01:18', '2024-07-28 10:01:18', NULL, 1, 1),
(2422, 36, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:01:19', '2024-07-28 10:01:19', NULL, 1, 1),
(2423, 40, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:02:02', '2024-07-28 10:02:02', NULL, 1, 1),
(2424, 40, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:02:26', '2024-07-28 10:02:26', NULL, 1, 1),
(2425, 40, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:02:41', '2024-07-28 10:02:41', NULL, 1, 1),
(2426, 101, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:03:38', '2024-07-28 10:04:04', NULL, 1, 1),
(2427, 101, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:03:57', '2024-07-28 10:03:57', NULL, 1, 1),
(2428, 102, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:05:44', '2024-07-28 10:05:44', NULL, 1, 1),
(2429, 102, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:06:05', '2024-07-28 10:06:05', NULL, 1, 1),
(2430, 41, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:07:25', '2024-07-28 10:07:25', NULL, 1, 1),
(2431, 41, NULL, 'الدرجة النهائية', NULL, 'divide', 1, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:07:46', '2024-07-28 10:07:46', NULL, 1, 1),
(2432, 41, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:08:04', '2024-07-28 10:08:04', NULL, 1, 1),
(2433, 103, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:09:19', '2024-07-28 10:09:19', NULL, 1, 1),
(2434, 103, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:09:38', '2024-07-28 10:09:38', NULL, 1, 1),
(2435, 131, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:13:18', '2024-07-28 10:13:18', NULL, 1, 1),
(2436, 104, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:13:56', '2024-07-28 10:14:06', NULL, 1, 1),
(2437, 104, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:14:46', '2024-07-28 10:14:46', NULL, 1, 1),
(2438, 132, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:15:15', '2024-07-28 10:15:15', NULL, 1, 1),
(2439, 106, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:15:57', '2024-07-28 10:15:57', NULL, 1, 1),
(2440, 106, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:17:25', '2024-07-28 10:17:25', NULL, 1, 1),
(2441, 133, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:17:53', '2024-07-28 10:17:53', NULL, 1, 1),
(2442, 107, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:19:05', '2024-07-28 10:19:05', NULL, 1, 1),
(2443, 107, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:19:24', '2024-07-28 10:19:24', NULL, 1, 1),
(2444, 108, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:20:03', '2024-07-28 10:20:03', NULL, 1, 1),
(2445, 108, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:20:17', '2024-07-28 10:20:17', NULL, 1, 1),
(2446, 134, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:20:27', '2024-07-28 10:20:27', NULL, 1, 1),
(2447, 135, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:22:48', '2024-07-28 10:22:48', NULL, 1, 1),
(2448, 109, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:23:43', '2024-07-28 10:23:43', NULL, 1, 1),
(2449, 136, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:26:21', '2024-07-28 10:26:21', NULL, 1, 1),
(2450, 111, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:27:46', '2024-07-28 10:27:46', NULL, 1, 1),
(2451, 112, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:29:55', '2024-07-28 10:29:55', NULL, 1, 1),
(2452, 144, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:30:33', '2024-07-28 10:30:33', NULL, 1, 1),
(2453, 114, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:31:30', '2024-07-28 10:31:30', NULL, 1, 1),
(2454, 137, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:31:42', '2024-07-28 10:31:42', NULL, 1, 1),
(2455, 138, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:32:51', '2024-07-28 10:32:51', NULL, 1, 1),
(2456, 116, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:33:07', '2024-07-28 10:33:07', NULL, 1, 1),
(2457, 139, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:35:02', '2024-07-28 10:35:02', NULL, 1, 1),
(2458, 140, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:36:39', '2024-07-28 10:36:39', NULL, 1, 1),
(2459, 118, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:37:12', '2024-07-28 10:37:12', NULL, 1, 1),
(2460, 141, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:38:57', '2024-07-28 10:38:57', NULL, 1, 1),
(2461, 142, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:39:14', '2024-07-28 10:39:14', NULL, 1, 1),
(2462, 129, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:39:47', '2024-07-28 10:39:47', NULL, 1, 1),
(2463, 143, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:41:10', '2024-07-28 10:41:10', NULL, 1, 1),
(2464, 119, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:42:26', '2024-07-28 10:42:26', NULL, 1, 1),
(2465, 121, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:46:30', '2024-07-28 10:46:30', NULL, 1, 1),
(2466, 123, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:49:24', '2024-07-28 10:49:24', NULL, 1, 1),
(2467, 126, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:50:00', '2024-07-28 10:51:00', NULL, 1, 1),
(2468, 127, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:50:34', '2024-07-28 10:50:34', NULL, 1, 1),
(2469, 128, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:51:25', '2024-07-28 10:51:25', NULL, 1, 1),
(2470, 169, NULL, 'كتابة', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 10:54:00', '2024-07-28 10:54:00', NULL, 1, 1),
(2471, 163, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-28 11:10:34', '2024-07-28 11:10:34', NULL, 1, 1),
(2472, 297, NULL, 'درجة اختبار الفصل', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-29 07:52:34', '2024-07-29 07:52:34', NULL, 1, 1),
(2473, 297, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 07:53:19', '2024-07-29 07:53:19', NULL, 1, 1),
(2474, 297, NULL, 'مجموع درجات اعمال الفصل', NULL, 'divide', 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 07:56:45', '2024-07-29 07:56:45', NULL, 1, 1),
(2475, 297, NULL, 'المحصلة النهائية', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 07:57:29', '2024-07-29 07:57:29', NULL, 1, 1),
(2476, 287, NULL, 'درجة الامتحان', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-29 07:59:48', '2024-07-29 07:59:48', NULL, 1, 1),
(2477, 287, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, 100, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 08:00:41', '2024-07-29 08:00:41', NULL, 1, 1),
(2478, 287, NULL, 'مجموع درجات أعمال الفصل', NULL, 'divide', 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 08:01:45', '2024-07-29 08:20:59', NULL, 1, 1),
(2479, 287, NULL, 'المحصلة النهائية', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 08:03:31', '2024-07-29 08:03:31', NULL, 1, 1),
(2480, 298, NULL, 'شفهي', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-29 08:05:08', '2024-07-29 08:05:08', NULL, 1, 1),
(2481, 298, NULL, 'وظائف', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-29 08:05:24', '2024-07-29 08:05:24', NULL, 1, 1),
(2482, 298, NULL, 'مبادرات', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-29 08:06:18', '2024-07-29 08:06:18', NULL, 1, 1),
(2483, 298, NULL, 'مذاكرة', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-29 08:06:55', '2024-07-29 08:06:55', NULL, 1, 1),
(2484, 298, NULL, 'درجة الأعمال', 2.00, 'divide', 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 08:08:08', '2024-07-29 08:08:08', NULL, 1, 1),
(2485, 298, NULL, 'درجة الامتحان', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-29 08:08:55', '2024-07-29 08:08:55', NULL, 1, 1),
(2486, 298, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 08:09:50', '2024-07-29 08:09:50', NULL, 1, 1),
(2487, 298, NULL, 'مجموع درجات أعمال الفصل', NULL, 'divide', 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 08:10:33', '2024-07-29 08:21:50', NULL, 1, 1),
(2488, 298, NULL, 'المحصلة النهائية', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 08:16:09', '2024-07-29 08:16:09', NULL, 1, 1),
(2489, 299, NULL, 'شفهي', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-29 08:24:04', '2024-07-29 08:24:04', NULL, 1, 1),
(2490, 299, NULL, 'وظائف', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-29 08:24:15', '2024-07-29 08:24:15', NULL, 1, 1),
(2491, 299, NULL, 'مبادرات', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-29 08:24:36', '2024-07-29 08:24:36', NULL, 1, 1),
(2492, 299, NULL, 'مذاكرة', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-29 08:25:01', '2024-07-29 08:25:01', NULL, 1, 1),
(2493, 299, NULL, 'درجة الأعمال', 2.00, 'divide', 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 08:25:41', '2024-07-29 08:25:41', NULL, 1, 1),
(2494, 299, NULL, 'درجة الامتحان', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-29 08:27:33', '2024-07-29 08:27:33', NULL, 1, 1),
(2495, 299, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 08:29:20', '2024-07-29 08:29:20', NULL, 1, 1),
(2496, 299, NULL, 'مجموع درجات أعمال الفصل', NULL, 'divide', 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 08:32:59', '2024-07-29 08:32:59', NULL, 1, 1),
(2497, 299, NULL, 'المحصلة النهائية', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 08:33:23', '2024-07-29 08:33:23', NULL, 1, 1),
(2498, 300, NULL, 'شفهي', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-29 08:34:21', '2024-07-29 08:34:21', NULL, 1, 1),
(2499, 300, NULL, 'وظائف', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-29 08:34:33', '2024-07-29 08:34:33', NULL, 1, 1),
(2500, 300, NULL, 'مبادرات', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-29 08:35:45', '2024-07-29 08:35:45', NULL, 1, 1),
(2501, 300, NULL, 'مذاكرة', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-29 08:36:05', '2024-07-29 08:36:05', NULL, 1, 1),
(2502, 300, NULL, 'درجة الأعمال', 2.00, 'divide', 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 08:36:45', '2024-07-29 08:36:45', NULL, 1, 1),
(2503, 300, NULL, 'درجة الامتحان', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-29 08:36:59', '2024-07-29 08:36:59', NULL, 1, 1),
(2504, 300, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 08:39:01', '2024-07-29 08:39:14', NULL, 1, 1),
(2505, 300, NULL, 'مجموع درجات أعمال الفصل', NULL, 'divide', 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 08:39:36', '2024-07-29 08:39:36', NULL, 1, 1),
(2506, 300, NULL, 'المحصلة النهائية', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 08:40:16', '2024-07-29 08:40:16', NULL, 1, 1),
(2507, 301, NULL, 'شفهي', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-29 08:42:37', '2024-07-29 08:42:37', NULL, 1, 1),
(2508, 301, NULL, 'وظائف', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-29 08:42:53', '2024-07-29 08:42:53', NULL, 1, 1),
(2509, 301, NULL, 'مبادرات', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-29 08:43:11', '2024-07-29 08:43:11', NULL, 1, 1),
(2510, 301, NULL, 'المذاكرة', NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-29 08:43:27', '2024-07-29 08:43:27', NULL, 1, 1),
(2511, 301, NULL, 'درجة الأعمال', 2.00, 'divide', 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 08:44:05', '2024-07-29 08:47:54', NULL, 1, 1),
(2512, 301, NULL, 'درجة الامتحان', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 0, 0, 0, '2024-07-29 08:46:35', '2024-07-29 08:46:35', NULL, 1, 1),
(2513, 301, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 08:48:25', '2024-07-29 08:48:25', NULL, 1, 1),
(2514, 301, NULL, 'مجموع درجات أعمال الفصل', NULL, 'divide', 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 08:49:26', '2024-07-29 08:49:26', NULL, 1, 1),
(2515, 301, NULL, 'المحصلة النهائية', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 08:50:13', '2024-07-29 08:50:13', NULL, 1, 1),
(2516, 308, NULL, 'شفهي', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-29 08:51:54', '2024-07-29 08:51:54', NULL, 1, 1),
(2517, 308, NULL, 'وظائف', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-29 08:52:15', '2024-07-29 08:52:15', NULL, 1, 1),
(2518, 308, NULL, 'مبادرات', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-29 08:52:32', '2024-07-29 08:52:32', NULL, 1, 1),
(2519, 308, NULL, 'المذاكرة', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-29 08:52:51', '2024-07-29 08:52:51', NULL, 1, 1),
(2520, 308, NULL, 'درجة الأعمال', 2.00, 'divide', 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 08:53:10', '2024-07-29 08:53:10', NULL, 1, 1),
(2521, 308, NULL, 'درجة الامتحان', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-29 08:58:02', '2024-07-29 08:58:02', NULL, 1, 1),
(2522, 308, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 08:59:06', '2024-07-29 08:59:06', NULL, 1, 1),
(2523, 308, NULL, 'مجموع درجات أعمال الفصل', NULL, 'divide', 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 08:59:33', '2024-07-29 08:59:33', NULL, 1, 1),
(2524, 308, NULL, 'المحصلة النهائية', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 09:00:43', '2024-07-29 09:00:43', NULL, 1, 1),
(2525, 303, NULL, 'شفهي', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-29 09:01:07', '2024-07-29 09:01:07', NULL, 1, 1),
(2526, 303, NULL, 'وظائف', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-29 09:01:24', '2024-07-29 09:01:24', NULL, 1, 1),
(2527, 303, NULL, 'مبادرات', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-29 09:01:40', '2024-07-29 09:01:40', NULL, 1, 1),
(2528, 303, NULL, 'مذاكرة', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-29 09:01:58', '2024-07-29 09:01:58', NULL, 1, 1),
(2529, 303, NULL, 'درجة الأعمال', 2.00, 'divide', 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 09:02:32', '2024-07-29 09:02:32', NULL, 1, 1),
(2530, 303, NULL, 'درجة الامتحان', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-29 09:02:57', '2024-07-29 09:02:57', NULL, 1, 1),
(2531, 303, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 09:03:36', '2024-07-29 09:03:36', NULL, 1, 1),
(2532, 303, NULL, 'مجموع درجات أعمال الفصل', NULL, 'divide', 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 09:03:59', '2024-07-29 09:03:59', NULL, 1, 1),
(2533, 303, NULL, 'المحصلة النهائية', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 09:06:58', '2024-07-29 09:06:58', NULL, 1, 1),
(2534, 304, NULL, 'شفهي', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-29 09:07:52', '2024-07-29 09:07:52', NULL, 1, 1),
(2535, 304, NULL, 'وظائف', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-29 09:08:17', '2024-07-29 09:08:17', NULL, 1, 1),
(2536, 304, NULL, 'مبادرات', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-29 09:08:31', '2024-07-29 09:08:31', NULL, 1, 1),
(2537, 304, NULL, 'المذاكرة', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-29 09:08:50', '2024-07-29 09:08:50', NULL, 1, 1),
(2538, 304, NULL, 'درجة الأعمال', 2.00, 'divide', 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 09:09:28', '2024-07-29 09:09:28', NULL, 1, 1),
(2539, 304, NULL, 'درجة الامتحان', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-29 09:09:45', '2024-07-29 09:09:45', NULL, 1, 1),
(2540, 304, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 09:10:09', '2024-07-29 09:10:09', NULL, 1, 1),
(2541, 304, NULL, 'مجموع درجات أعمال الفصل', NULL, 'divide', 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 09:13:44', '2024-07-29 09:13:44', NULL, 1, 1),
(2542, 304, NULL, 'المحصلة النهائية', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 09:14:18', '2024-07-29 09:14:18', NULL, 1, 1),
(2543, 305, NULL, 'شفهي', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-29 09:14:43', '2024-07-29 09:14:43', NULL, 1, 1),
(2544, 305, NULL, 'وظائف', NULL, NULL, 0, 20, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-29 09:14:59', '2024-07-29 09:14:59', NULL, 1, 1),
(2545, 305, NULL, 'مبادرات', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-29 09:15:11', '2024-07-29 09:15:11', NULL, 1, 1),
(2546, 305, NULL, 'المذاكرة', NULL, NULL, 0, 40, 0, 0, 0, 0, 0, 1, 0, 0, '2024-07-29 09:15:24', '2024-07-29 09:15:24', NULL, 1, 1),
(2547, 305, NULL, 'درجة الأعمال', 2.00, 'divide', 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 09:16:45', '2024-07-29 09:16:45', NULL, 1, 1),
(2548, 305, NULL, 'درجة الامتحان', NULL, NULL, 0, 40, 0, 0, 0, 0, 1, 1, 0, 0, '2024-07-29 09:17:27', '2024-07-29 09:17:27', NULL, 1, 1),
(2549, 305, NULL, 'مجموع درجات الفصل', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 09:18:08', '2024-07-29 09:18:08', NULL, 1, 1),
(2550, 305, NULL, 'مجموع درجات أعمال الفصل', NULL, 'divide', 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 09:19:07', '2024-07-29 09:19:07', NULL, 1, 1),
(2551, 305, NULL, 'المحصلة النهائية', NULL, NULL, 0, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 09:21:02', '2024-07-29 09:21:02', NULL, 1, 1),
(2552, 307, NULL, 'المحصلة', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-29 09:26:46', '2024-07-29 09:26:46', NULL, 1, 1),
(2553, 307, NULL, 'المحصلة النهائية', 2.00, 'divide', 1, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 09:29:06', '2024-07-29 09:30:27', NULL, 1, 1),
(2554, 306, NULL, 'المحصلة', NULL, NULL, 0, NULL, 0, 1, 0, 0, 1, 1, 0, 0, '2024-07-29 09:30:48', '2024-07-29 09:30:48', NULL, 1, 1),
(2555, 306, NULL, 'المحصلة النهائية', 2.00, 'divide', 1, NULL, 0, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 09:31:07', '2024-07-29 09:31:07', NULL, 1, 1),
(2556, 171, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 09:46:18', '2024-07-29 09:46:18', NULL, 1, 1),
(2557, 172, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 09:48:56', '2024-07-29 09:48:56', NULL, 1, 1),
(2558, 173, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 09:51:36', '2024-07-29 09:51:36', NULL, 1, 1),
(2559, 175, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 09:52:54', '2024-07-29 09:52:54', NULL, 1, 1),
(2560, 176, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 09:55:12', '2024-07-29 09:55:12', NULL, 1, 1),
(2561, 177, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 09:56:45', '2024-07-29 09:56:45', NULL, 1, 1),
(2562, 178, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 09:58:02', '2024-07-29 09:58:02', NULL, 1, 1),
(2563, 179, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 09:59:37', '2024-07-29 09:59:37', NULL, 1, 1),
(2564, 180, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 10:04:04', '2024-07-29 10:04:04', NULL, 1, 1),
(2565, 181, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 10:06:09', '2024-07-29 10:06:09', NULL, 1, 1),
(2566, 183, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 10:10:26', '2024-07-29 10:10:26', NULL, 1, 1),
(2567, 184, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 10:14:11', '2024-07-29 10:14:11', NULL, 1, 1),
(2568, 185, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 10:15:09', '2024-07-29 10:15:09', NULL, 1, 1),
(2569, 186, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 10:17:51', '2024-07-29 10:17:51', NULL, 1, 1),
(2570, 187, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 10:20:41', '2024-07-29 10:20:41', NULL, 1, 1),
(2571, 192, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 10:22:46', '2024-07-29 10:22:46', NULL, 1, 1),
(2572, 197, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 10:24:07', '2024-07-29 10:24:07', NULL, 1, 1),
(2573, 203, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 10:25:18', '2024-07-29 10:25:18', NULL, 1, 1),
(2574, 207, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 10:27:09', '2024-07-29 10:27:09', NULL, 1, 1),
(2575, 209, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 10:29:09', '2024-07-29 10:29:09', NULL, 1, 1),
(2576, 215, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 10:30:26', '2024-07-29 10:30:26', NULL, 1, 1),
(2577, 218, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 10:35:48', '2024-07-29 10:35:48', NULL, 1, 1),
(2578, 219, NULL, 'كتابةً', NULL, NULL, 0, NULL, 1, 0, 0, 0, 1, 1, 1, 0, '2024-07-29 10:37:26', '2024-07-29 10:37:26', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `part_operations`
--

CREATE TABLE `part_operations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `part_id` bigint(20) UNSIGNED NOT NULL,
  `operand_part_id` bigint(20) UNSIGNED NOT NULL,
  `operation` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `part_operations`
--

INSERT INTO `part_operations` (`id`, `part_id`, `operand_part_id`, `operation`, `created_at`, `updated_at`) VALUES
(508, 444, 440, 'add', '2024-07-24 10:04:34', '2024-07-24 10:04:34'),
(509, 444, 441, 'add', '2024-07-24 10:04:34', '2024-07-24 10:04:34'),
(510, 444, 442, 'add', '2024-07-24 10:04:34', '2024-07-24 10:04:34'),
(511, 444, 443, 'add', '2024-07-24 10:04:34', '2024-07-24 10:04:34'),
(512, 448, 444, 'add', '2024-07-24 10:06:18', '2024-07-24 10:06:18'),
(513, 448, 445, 'add', '2024-07-24 10:06:18', '2024-07-24 10:06:18'),
(514, 451, 448, 'add', '2024-07-24 10:07:05', '2024-07-24 10:07:05'),
(519, 453, 451, 'add', '2024-07-24 10:08:12', '2024-07-24 10:08:12'),
(522, 459, 456, 'add', '2024-07-24 10:10:59', '2024-07-24 10:10:59'),
(524, 466, 460, 'add', '2024-07-24 10:13:08', '2024-07-24 10:13:08'),
(525, 466, 461, 'add', '2024-07-24 10:13:08', '2024-07-24 10:13:08'),
(526, 466, 463, 'add', '2024-07-24 10:13:08', '2024-07-24 10:13:08'),
(527, 466, 465, 'add', '2024-07-24 10:13:08', '2024-07-24 10:13:08'),
(528, 472, 466, 'add', '2024-07-24 10:15:46', '2024-07-24 10:15:46'),
(529, 472, 467, 'add', '2024-07-24 10:15:46', '2024-07-24 10:15:46'),
(530, 473, 468, 'add', '2024-07-24 10:16:19', '2024-07-24 10:16:19'),
(531, 473, 469, 'add', '2024-07-24 10:16:19', '2024-07-24 10:16:19'),
(532, 473, 470, 'add', '2024-07-24 10:16:19', '2024-07-24 10:16:19'),
(533, 473, 471, 'add', '2024-07-24 10:16:19', '2024-07-24 10:16:19'),
(534, 474, 472, 'add', '2024-07-24 10:16:59', '2024-07-24 10:16:59'),
(537, 477, 474, 'add', '2024-07-24 10:17:58', '2024-07-24 10:17:58'),
(538, 480, 476, 'add', '2024-07-24 10:19:30', '2024-07-24 10:19:30'),
(540, 487, 482, 'add', '2024-07-24 10:21:21', '2024-07-24 10:21:21'),
(541, 487, 483, 'add', '2024-07-24 10:21:21', '2024-07-24 10:21:21'),
(542, 487, 485, 'add', '2024-07-24 10:21:21', '2024-07-24 10:21:21'),
(543, 487, 486, 'add', '2024-07-24 10:21:21', '2024-07-24 10:21:21'),
(544, 493, 487, 'add', '2024-07-24 10:22:49', '2024-07-24 10:22:49'),
(545, 493, 489, 'add', '2024-07-24 10:22:49', '2024-07-24 10:22:49'),
(546, 495, 493, 'add', '2024-07-24 10:23:28', '2024-07-24 10:23:28'),
(551, 497, 495, 'add', '2024-07-24 10:24:08', '2024-07-24 10:24:08'),
(554, 503, 499, 'add', '2024-07-24 10:25:53', '2024-07-24 10:25:53'),
(556, 510, 506, 'add', '2024-07-24 10:29:06', '2024-07-24 10:29:06'),
(557, 510, 507, 'add', '2024-07-24 10:29:06', '2024-07-24 10:29:06'),
(558, 510, 508, 'add', '2024-07-24 10:29:06', '2024-07-24 10:29:06'),
(559, 510, 509, 'add', '2024-07-24 10:29:06', '2024-07-24 10:29:06'),
(560, 512, 510, 'add', '2024-07-24 10:30:07', '2024-07-24 10:30:07'),
(561, 512, 511, 'add', '2024-07-24 10:30:07', '2024-07-24 10:30:07'),
(562, 513, 512, 'add', '2024-07-24 10:30:38', '2024-07-24 10:30:38'),
(563, 514, 513, 'add', '2024-07-24 10:31:17', '2024-07-24 10:31:17'),
(564, 521, 517, 'add', '2024-07-24 10:33:57', '2024-07-24 10:33:57'),
(565, 521, 518, 'add', '2024-07-24 10:33:57', '2024-07-24 10:33:57'),
(566, 521, 519, 'add', '2024-07-24 10:33:57', '2024-07-24 10:33:57'),
(567, 521, 520, 'add', '2024-07-24 10:33:57', '2024-07-24 10:33:57'),
(568, 523, 521, 'add', '2024-07-24 10:35:21', '2024-07-24 10:35:21'),
(569, 523, 522, 'add', '2024-07-24 10:35:21', '2024-07-24 10:35:21'),
(570, 524, 523, 'add', '2024-07-24 10:35:37', '2024-07-24 10:35:37'),
(571, 525, 524, 'add', '2024-07-24 10:38:42', '2024-07-24 10:38:42'),
(572, 534, 528, 'add', '2024-07-24 10:42:38', '2024-07-24 10:42:38'),
(573, 534, 529, 'add', '2024-07-24 10:42:38', '2024-07-24 10:42:38'),
(574, 534, 531, 'add', '2024-07-24 10:42:38', '2024-07-24 10:42:38'),
(575, 534, 532, 'add', '2024-07-24 10:42:38', '2024-07-24 10:42:38'),
(576, 538, 534, 'add', '2024-07-24 10:43:52', '2024-07-24 10:43:52'),
(577, 538, 536, 'add', '2024-07-24 10:43:52', '2024-07-24 10:43:52'),
(578, 540, 538, 'add', '2024-07-24 10:44:16', '2024-07-24 10:44:16'),
(579, 541, 540, 'add', '2024-07-24 10:44:54', '2024-07-24 10:44:54'),
(588, 546, 545, 'add', '2024-07-24 10:54:59', '2024-07-24 10:54:59'),
(589, 546, 539, 'add', '2024-07-24 10:54:59', '2024-07-24 10:54:59'),
(590, 548, 546, 'add', '2024-07-24 10:57:50', '2024-07-24 10:57:50'),
(591, 549, 548, 'add', '2024-07-24 10:58:39', '2024-07-24 10:58:39'),
(592, 552, 550, 'add', '2024-07-24 11:01:46', '2024-07-24 11:01:46'),
(595, 558, 557, 'add', '2024-07-24 11:06:14', '2024-07-24 11:06:14'),
(596, 562, 560, 'add', '2024-07-24 11:09:39', '2024-07-24 11:09:39'),
(604, 576, 574, 'add', '2024-07-24 11:37:58', '2024-07-24 11:37:58'),
(605, 577, 570, 'add', '2024-07-24 11:39:06', '2024-07-24 11:39:06'),
(606, 577, 571, 'add', '2024-07-24 11:39:06', '2024-07-24 11:39:06'),
(607, 577, 573, 'add', '2024-07-24 11:39:06', '2024-07-24 11:39:06'),
(608, 577, 575, 'add', '2024-07-24 11:39:06', '2024-07-24 11:39:06'),
(609, 578, 576, 'add', '2024-07-24 11:39:23', '2024-07-24 11:39:23'),
(610, 583, 577, 'add', '2024-07-24 11:41:04', '2024-07-24 11:41:04'),
(611, 583, 579, 'add', '2024-07-24 11:41:04', '2024-07-24 11:41:04'),
(612, 585, 583, 'add', '2024-07-24 11:43:34', '2024-07-24 11:43:34'),
(618, 589, 586, 'add', '2024-07-24 11:46:30', '2024-07-24 11:46:30'),
(619, 589, 588, 'add', '2024-07-24 11:46:30', '2024-07-24 11:46:30'),
(620, 591, 589, 'add', '2024-07-24 11:46:50', '2024-07-24 11:46:50'),
(621, 595, 591, 'add', '2024-07-24 11:47:29', '2024-07-24 11:47:29'),
(633, 606, 603, 'add', '2024-07-24 11:51:28', '2024-07-24 11:51:28'),
(634, 606, 604, 'add', '2024-07-24 11:51:28', '2024-07-24 11:51:28'),
(636, 608, 606, 'add', '2024-07-24 11:51:57', '2024-07-24 11:51:57'),
(638, 617, 610, 'add', '2024-07-24 11:55:51', '2024-07-24 11:55:51'),
(639, 617, 612, 'add', '2024-07-24 11:55:51', '2024-07-24 11:55:51'),
(640, 617, 613, 'add', '2024-07-24 11:55:51', '2024-07-24 11:55:51'),
(641, 617, 615, 'add', '2024-07-24 11:55:51', '2024-07-24 11:55:51'),
(642, 621, 617, 'add', '2024-07-24 11:56:41', '2024-07-24 11:56:41'),
(643, 621, 619, 'add', '2024-07-24 11:56:41', '2024-07-24 11:56:41'),
(644, 623, 621, 'add', '2024-07-24 11:57:05', '2024-07-24 11:57:05'),
(650, 633, 627, 'add', '2024-07-24 11:59:42', '2024-07-24 11:59:42'),
(651, 633, 628, 'add', '2024-07-24 11:59:42', '2024-07-24 11:59:42'),
(652, 633, 629, 'add', '2024-07-24 11:59:42', '2024-07-24 11:59:42'),
(653, 633, 631, 'add', '2024-07-24 11:59:42', '2024-07-24 11:59:42'),
(654, 635, 633, 'add', '2024-07-24 12:01:10', '2024-07-24 12:01:10'),
(655, 635, 634, 'add', '2024-07-24 12:01:10', '2024-07-24 12:01:10'),
(656, 636, 635, 'add', '2024-07-24 12:01:53', '2024-07-24 12:01:53'),
(662, 646, 642, 'add', '2024-07-24 12:05:51', '2024-07-24 12:05:51'),
(663, 646, 644, 'add', '2024-07-24 12:05:51', '2024-07-24 12:05:51'),
(664, 649, 646, 'add', '2024-07-24 12:06:14', '2024-07-24 12:06:14'),
(670, 653, 652, 'add', '2024-07-24 12:16:25', '2024-07-24 12:16:25'),
(671, 655, 653, 'add', '2024-07-24 12:17:40', '2024-07-24 12:17:40'),
(677, 658, 657, 'add', '2024-07-24 12:21:08', '2024-07-24 12:21:08'),
(679, 663, 662, 'add', '2024-07-24 12:22:27', '2024-07-24 12:22:27'),
(685, 675, 669, 'add', '2024-07-24 12:38:44', '2024-07-24 12:38:44'),
(686, 675, 671, 'add', '2024-07-24 12:38:44', '2024-07-24 12:38:44'),
(687, 675, 672, 'add', '2024-07-24 12:38:44', '2024-07-24 12:38:44'),
(688, 675, 674, 'add', '2024-07-24 12:38:44', '2024-07-24 12:38:44'),
(705, 694, 693, 'add', '2024-07-24 12:46:53', '2024-07-24 12:46:53'),
(706, 695, 687, 'add', '2024-07-24 12:47:08', '2024-07-24 12:47:08'),
(707, 695, 688, 'add', '2024-07-24 12:47:08', '2024-07-24 12:47:08'),
(708, 695, 689, 'add', '2024-07-24 12:47:08', '2024-07-24 12:47:08'),
(709, 695, 692, 'add', '2024-07-24 12:47:08', '2024-07-24 12:47:08'),
(711, 702, 695, 'add', '2024-07-24 12:48:34', '2024-07-24 12:48:34'),
(712, 702, 698, 'add', '2024-07-24 12:48:34', '2024-07-24 12:48:34'),
(713, 703, 697, 'add', '2024-07-24 12:48:54', '2024-07-24 12:48:54'),
(714, 703, 699, 'add', '2024-07-24 12:48:54', '2024-07-24 12:48:54'),
(715, 703, 700, 'add', '2024-07-24 12:48:54', '2024-07-24 12:48:54'),
(716, 703, 701, 'add', '2024-07-24 12:48:54', '2024-07-24 12:48:54'),
(717, 704, 702, 'add', '2024-07-24 12:48:59', '2024-07-24 12:48:59'),
(723, 693, 690, 'add', '2024-07-24 12:51:20', '2024-07-24 12:51:20'),
(724, 693, 691, 'add', '2024-07-24 12:51:20', '2024-07-24 12:51:20'),
(737, 724, 720, 'add', '2024-07-24 12:54:05', '2024-07-24 12:54:05'),
(738, 724, 721, 'add', '2024-07-24 12:54:05', '2024-07-24 12:54:05'),
(740, 726, 724, 'add', '2024-07-24 12:54:58', '2024-07-24 12:54:58'),
(742, 735, 728, 'add', '2024-07-24 12:56:29', '2024-07-24 12:56:29'),
(743, 735, 730, 'add', '2024-07-24 12:56:29', '2024-07-24 12:56:29'),
(744, 735, 731, 'add', '2024-07-24 12:56:29', '2024-07-24 12:56:29'),
(745, 735, 733, 'add', '2024-07-24 12:56:29', '2024-07-24 12:56:29'),
(750, 739, 735, 'add', '2024-07-24 12:57:19', '2024-07-24 12:57:19'),
(751, 739, 737, 'add', '2024-07-24 12:57:19', '2024-07-24 12:57:19'),
(752, 740, 739, 'add', '2024-07-24 12:57:43', '2024-07-24 12:57:43'),
(756, 747, 745, 'add', '2024-07-24 12:59:34', '2024-07-24 12:59:34'),
(758, 750, 743, 'add', '2024-07-24 13:00:01', '2024-07-24 13:00:01'),
(759, 750, 744, 'add', '2024-07-24 13:00:01', '2024-07-24 13:00:01'),
(760, 750, 746, 'add', '2024-07-24 13:00:01', '2024-07-24 13:00:01'),
(761, 750, 748, 'add', '2024-07-24 13:00:01', '2024-07-24 13:00:01'),
(762, 754, 750, 'add', '2024-07-24 13:01:26', '2024-07-24 13:01:26'),
(763, 754, 752, 'add', '2024-07-24 13:01:26', '2024-07-24 13:01:26'),
(764, 757, 754, 'add', '2024-07-24 13:02:01', '2024-07-24 13:02:01'),
(765, 758, 757, 'add', '2024-07-24 13:02:24', '2024-07-24 13:02:24'),
(770, 762, 761, 'add', '2024-07-24 13:04:06', '2024-07-24 13:04:06'),
(771, 763, 762, 'add', '2024-07-24 13:04:56', '2024-07-24 13:04:56'),
(774, 764, 759, 'add', '2024-07-24 13:05:32', '2024-07-24 13:05:32'),
(775, 764, 760, 'add', '2024-07-24 13:05:32', '2024-07-24 13:05:32'),
(776, 766, 764, 'add', '2024-07-24 13:05:53', '2024-07-24 13:05:53'),
(778, 768, 765, 'add', '2024-07-24 13:07:18', '2024-07-24 13:07:18'),
(779, 770, 768, 'add', '2024-07-24 13:07:42', '2024-07-24 13:07:42'),
(780, 771, 769, 'add', '2024-07-24 13:07:44', '2024-07-24 13:07:44'),
(781, 772, 771, 'add', '2024-07-24 13:08:19', '2024-07-24 13:08:19'),
(795, 787, 785, 'add', '2024-07-25 08:57:15', '2024-07-25 08:57:15'),
(796, 787, 784, 'add', '2024-07-25 08:57:15', '2024-07-25 08:57:15'),
(805, 804, 797, 'add', '2024-07-25 09:03:24', '2024-07-25 09:03:24'),
(806, 804, 799, 'add', '2024-07-25 09:03:24', '2024-07-25 09:03:24'),
(807, 804, 802, 'add', '2024-07-25 09:03:24', '2024-07-25 09:03:24'),
(808, 804, 803, 'add', '2024-07-25 09:03:24', '2024-07-25 09:03:24'),
(809, 807, 805, 'add', '2024-07-25 09:03:44', '2024-07-25 09:03:44'),
(810, 807, 806, 'add', '2024-07-25 09:03:44', '2024-07-25 09:03:44'),
(812, 810, 804, 'add', '2024-07-25 09:04:19', '2024-07-25 09:04:19'),
(813, 810, 808, 'add', '2024-07-25 09:04:19', '2024-07-25 09:04:19'),
(815, 817, 810, 'add', '2024-07-25 09:05:58', '2024-07-25 09:05:58'),
(816, 820, 817, 'add', '2024-07-25 09:06:48', '2024-07-25 09:06:48'),
(825, 835, 826, 'add', '2024-07-25 09:10:23', '2024-07-25 09:10:23'),
(826, 835, 828, 'add', '2024-07-25 09:10:23', '2024-07-25 09:10:23'),
(827, 835, 831, 'add', '2024-07-25 09:10:23', '2024-07-25 09:10:23'),
(828, 835, 832, 'add', '2024-07-25 09:10:23', '2024-07-25 09:10:23'),
(829, 839, 835, 'add', '2024-07-25 09:11:27', '2024-07-25 09:11:27'),
(830, 839, 837, 'add', '2024-07-25 09:11:27', '2024-07-25 09:11:27'),
(838, 845, 839, 'add', '2024-07-25 09:12:29', '2024-07-25 09:12:29'),
(840, 848, 845, 'add', '2024-07-25 09:13:02', '2024-07-25 09:13:02'),
(845, 860, 851, 'add', '2024-07-25 09:15:42', '2024-07-25 09:15:42'),
(846, 860, 853, 'add', '2024-07-25 09:15:42', '2024-07-25 09:15:42'),
(847, 860, 855, 'add', '2024-07-25 09:15:42', '2024-07-25 09:15:42'),
(848, 860, 858, 'add', '2024-07-25 09:15:42', '2024-07-25 09:15:42'),
(852, 865, 860, 'add', '2024-07-25 09:16:58', '2024-07-25 09:16:58'),
(853, 865, 862, 'add', '2024-07-25 09:16:58', '2024-07-25 09:16:58'),
(863, 884, 878, 'add', '2024-07-25 09:21:48', '2024-07-25 09:21:48'),
(864, 884, 879, 'add', '2024-07-25 09:21:48', '2024-07-25 09:21:48'),
(865, 884, 880, 'add', '2024-07-25 09:21:48', '2024-07-25 09:21:48'),
(866, 884, 881, 'add', '2024-07-25 09:21:48', '2024-07-25 09:21:48'),
(867, 885, 883, 'add', '2024-07-25 09:21:50', '2024-07-25 09:21:50'),
(871, 895, 890, 'add', '2024-07-25 09:23:38', '2024-07-25 09:23:38'),
(876, 899, 895, 'add', '2024-07-25 09:24:24', '2024-07-25 09:24:24'),
(881, 915, 909, 'add', '2024-07-25 09:26:48', '2024-07-25 09:26:48'),
(882, 915, 910, 'add', '2024-07-25 09:26:48', '2024-07-25 09:26:48'),
(883, 915, 912, 'add', '2024-07-25 09:26:48', '2024-07-25 09:26:48'),
(884, 915, 914, 'add', '2024-07-25 09:26:48', '2024-07-25 09:26:48'),
(889, 913, 903, 'add', '2024-07-25 09:28:07', '2024-07-25 09:28:07'),
(890, 913, 906, 'add', '2024-07-25 09:28:07', '2024-07-25 09:28:07'),
(891, 913, 908, 'add', '2024-07-25 09:28:07', '2024-07-25 09:28:07'),
(892, 913, 911, 'add', '2024-07-25 09:28:07', '2024-07-25 09:28:07'),
(893, 918, 915, 'add', '2024-07-25 09:28:15', '2024-07-25 09:28:15'),
(894, 918, 916, 'add', '2024-07-25 09:28:15', '2024-07-25 09:28:15'),
(897, 927, 913, 'add', '2024-07-25 09:30:31', '2024-07-25 09:30:31'),
(898, 927, 917, 'add', '2024-07-25 09:30:31', '2024-07-25 09:30:31'),
(899, 928, 923, 'add', '2024-07-25 09:30:48', '2024-07-25 09:30:48'),
(900, 928, 924, 'add', '2024-07-25 09:30:48', '2024-07-25 09:30:48'),
(901, 928, 925, 'add', '2024-07-25 09:30:48', '2024-07-25 09:30:48'),
(902, 928, 926, 'add', '2024-07-25 09:30:48', '2024-07-25 09:30:48'),
(903, 931, 927, 'add', '2024-07-25 09:31:28', '2024-07-25 09:31:28'),
(904, 932, 931, 'add', '2024-07-25 09:32:12', '2024-07-25 09:32:12'),
(905, 938, 934, 'add', '2024-07-25 09:36:10', '2024-07-25 09:36:10'),
(906, 938, 935, 'add', '2024-07-25 09:36:10', '2024-07-25 09:36:10'),
(907, 938, 936, 'add', '2024-07-25 09:36:10', '2024-07-25 09:36:10'),
(908, 938, 937, 'add', '2024-07-25 09:36:10', '2024-07-25 09:36:10'),
(909, 939, 928, 'add', '2024-07-25 09:36:25', '2024-07-25 09:36:25'),
(910, 939, 930, 'add', '2024-07-25 09:36:25', '2024-07-25 09:36:25'),
(911, 941, 939, 'add', '2024-07-25 09:36:40', '2024-07-25 09:36:40'),
(912, 942, 941, 'add', '2024-07-25 09:36:59', '2024-07-25 09:36:59'),
(916, 952, 950, 'add', '2024-07-25 09:38:49', '2024-07-25 09:38:49'),
(917, 953, 947, 'add', '2024-07-25 09:39:01', '2024-07-25 09:39:01'),
(918, 953, 948, 'add', '2024-07-25 09:39:01', '2024-07-25 09:39:01'),
(919, 953, 949, 'add', '2024-07-25 09:39:01', '2024-07-25 09:39:01'),
(920, 953, 951, 'add', '2024-07-25 09:39:01', '2024-07-25 09:39:01'),
(921, 956, 953, 'add', '2024-07-25 09:39:42', '2024-07-25 09:39:42'),
(922, 956, 954, 'add', '2024-07-25 09:39:42', '2024-07-25 09:39:42'),
(923, 958, 956, 'add', '2024-07-25 09:39:59', '2024-07-25 09:39:59'),
(924, 960, 958, 'add', '2024-07-25 09:40:20', '2024-07-25 09:40:20'),
(931, 970, 967, 'add', '2024-07-25 09:43:24', '2024-07-25 09:43:24'),
(932, 972, 970, 'add', '2024-07-25 09:43:55', '2024-07-25 09:43:55'),
(933, 973, 969, 'add', '2024-07-25 09:44:13', '2024-07-25 09:44:13'),
(934, 975, 973, 'add', '2024-07-25 09:44:37', '2024-07-25 09:44:37'),
(935, 985, 976, 'add', '2024-07-25 09:47:39', '2024-07-25 09:47:39'),
(936, 985, 977, 'add', '2024-07-25 09:47:39', '2024-07-25 09:47:39'),
(937, 985, 978, 'add', '2024-07-25 09:47:39', '2024-07-25 09:47:39'),
(938, 985, 980, 'add', '2024-07-25 09:47:39', '2024-07-25 09:47:39'),
(939, 986, 981, 'add', '2024-07-25 09:47:45', '2024-07-25 09:47:45'),
(940, 990, 986, 'add', '2024-07-25 09:48:10', '2024-07-25 09:48:10'),
(947, 997, 994, 'add', '2024-07-25 09:49:45', '2024-07-25 09:49:45'),
(948, 998, 985, 'add', '2024-07-25 09:49:49', '2024-07-25 09:49:49'),
(949, 998, 988, 'add', '2024-07-25 09:49:49', '2024-07-25 09:49:49'),
(951, 1002, 996, 'add', '2024-07-25 09:50:18', '2024-07-25 09:50:18'),
(963, 1022, 1015, 'add', '2024-07-25 09:54:37', '2024-07-25 09:54:37'),
(964, 1022, 1016, 'add', '2024-07-25 09:54:37', '2024-07-25 09:54:37'),
(965, 1023, 1017, 'add', '2024-07-25 09:54:44', '2024-07-25 09:54:44'),
(966, 1023, 1019, 'add', '2024-07-25 09:54:44', '2024-07-25 09:54:44'),
(967, 1023, 1020, 'add', '2024-07-25 09:54:44', '2024-07-25 09:54:44'),
(968, 1023, 1021, 'add', '2024-07-25 09:54:44', '2024-07-25 09:54:44'),
(971, 1027, 1023, 'add', '2024-07-25 09:55:55', '2024-07-25 09:55:55'),
(972, 1027, 1025, 'add', '2024-07-25 09:55:55', '2024-07-25 09:55:55'),
(974, 1032, 1027, 'add', '2024-07-25 09:57:26', '2024-07-25 09:57:26'),
(977, 1035, 1032, 'add', '2024-07-25 09:57:53', '2024-07-25 09:57:53'),
(978, 1037, 1034, 'add', '2024-07-25 09:58:15', '2024-07-25 09:58:15'),
(984, 1046, 1043, 'add', '2024-07-25 10:00:59', '2024-07-25 10:00:59'),
(985, 1046, 1044, 'add', '2024-07-25 10:00:59', '2024-07-25 10:00:59'),
(986, 1047, 1046, 'add', '2024-07-25 10:01:12', '2024-07-25 10:01:12'),
(989, 1049, 1047, 'add', '2024-07-25 10:01:38', '2024-07-25 10:01:38'),
(990, 1043, 1033, 'add', '2024-07-25 10:03:09', '2024-07-25 10:03:09'),
(991, 1043, 1036, 'add', '2024-07-25 10:03:09', '2024-07-25 10:03:09'),
(992, 1043, 1039, 'add', '2024-07-25 10:03:09', '2024-07-25 10:03:09'),
(993, 1043, 1040, 'add', '2024-07-25 10:03:09', '2024-07-25 10:03:09'),
(995, 1061, 1056, 'add', '2024-07-25 10:05:23', '2024-07-25 10:05:23'),
(996, 1062, 1055, 'add', '2024-07-25 10:05:54', '2024-07-25 10:05:54'),
(997, 1062, 1057, 'add', '2024-07-25 10:05:54', '2024-07-25 10:05:54'),
(998, 1062, 1058, 'add', '2024-07-25 10:05:54', '2024-07-25 10:05:54'),
(999, 1062, 1059, 'add', '2024-07-25 10:05:54', '2024-07-25 10:05:54'),
(1000, 1065, 1062, 'add', '2024-07-25 10:06:57', '2024-07-25 10:06:57'),
(1001, 1065, 1063, 'add', '2024-07-25 10:06:57', '2024-07-25 10:06:57'),
(1002, 1066, 1065, 'add', '2024-07-25 10:07:11', '2024-07-25 10:07:11'),
(1003, 1069, 1066, 'add', '2024-07-25 10:08:01', '2024-07-25 10:08:01'),
(1010, 1085, 1079, 'add', '2024-07-25 10:10:07', '2024-07-25 10:10:07'),
(1011, 1085, 1080, 'add', '2024-07-25 10:10:07', '2024-07-25 10:10:07'),
(1012, 1085, 1081, 'add', '2024-07-25 10:10:07', '2024-07-25 10:10:07'),
(1013, 1085, 1083, 'add', '2024-07-25 10:10:07', '2024-07-25 10:10:07'),
(1016, 1090, 1085, 'add', '2024-07-25 10:10:42', '2024-07-25 10:10:42'),
(1017, 1090, 1088, 'add', '2024-07-25 10:10:42', '2024-07-25 10:10:42'),
(1018, 1091, 1087, 'add', '2024-07-25 10:10:47', '2024-07-25 10:10:47'),
(1019, 1093, 1090, 'add', '2024-07-25 10:10:56', '2024-07-25 10:10:56'),
(1020, 1095, 1093, 'add', '2024-07-25 10:11:18', '2024-07-25 10:11:18'),
(1033, 1114, 1105, 'add', '2024-07-25 10:15:32', '2024-07-25 10:15:32'),
(1034, 1114, 1108, 'add', '2024-07-25 10:15:32', '2024-07-25 10:15:32'),
(1035, 1114, 1109, 'add', '2024-07-25 10:15:32', '2024-07-25 10:15:32'),
(1036, 1114, 1112, 'add', '2024-07-25 10:15:32', '2024-07-25 10:15:32'),
(1040, 1119, 1116, 'add', '2024-07-25 10:16:26', '2024-07-25 10:16:26'),
(1041, 1120, 1114, 'add', '2024-07-25 10:16:45', '2024-07-25 10:16:45'),
(1042, 1120, 1118, 'add', '2024-07-25 10:16:45', '2024-07-25 10:16:45'),
(1044, 1127, 1120, 'add', '2024-07-25 10:17:47', '2024-07-25 10:17:47'),
(1045, 1130, 1127, 'add', '2024-07-25 10:18:15', '2024-07-25 10:18:15'),
(1060, 1143, 1138, 'add', '2024-07-25 10:22:03', '2024-07-25 10:22:03'),
(1061, 1143, 1139, 'add', '2024-07-25 10:22:03', '2024-07-25 10:22:03'),
(1062, 1143, 1140, 'add', '2024-07-25 10:22:03', '2024-07-25 10:22:03'),
(1063, 1143, 1141, 'add', '2024-07-25 10:22:03', '2024-07-25 10:22:03'),
(1066, 1151, 1143, 'add', '2024-07-25 10:26:05', '2024-07-25 10:26:05'),
(1067, 1151, 1149, 'add', '2024-07-25 10:26:05', '2024-07-25 10:26:05'),
(1068, 1153, 1151, 'add', '2024-07-25 10:26:46', '2024-07-25 10:26:46'),
(1069, 1155, 1153, 'add', '2024-07-25 10:27:08', '2024-07-25 10:27:08'),
(1078, 1167, 1161, 'add', '2024-07-25 10:30:07', '2024-07-25 10:30:07'),
(1079, 1167, 1163, 'add', '2024-07-25 10:30:07', '2024-07-25 10:30:07'),
(1080, 1167, 1164, 'add', '2024-07-25 10:30:07', '2024-07-25 10:30:07'),
(1081, 1167, 1165, 'add', '2024-07-25 10:30:07', '2024-07-25 10:30:07'),
(1083, 1171, 1167, 'add', '2024-07-25 10:31:20', '2024-07-25 10:31:20'),
(1084, 1171, 1169, 'add', '2024-07-25 10:31:20', '2024-07-25 10:31:20'),
(1086, 1172, 1160, 'add', '2024-07-25 10:31:44', '2024-07-25 10:31:44'),
(1087, 1173, 1171, 'add', '2024-07-25 10:31:47', '2024-07-25 10:31:47'),
(1088, 1174, 1173, 'add', '2024-07-25 10:32:25', '2024-07-25 10:32:25'),
(1092, 1185, 1179, 'add', '2024-07-25 10:35:07', '2024-07-25 10:35:07'),
(1093, 1185, 1181, 'add', '2024-07-25 10:35:07', '2024-07-25 10:35:07'),
(1094, 1185, 1183, 'add', '2024-07-25 10:35:07', '2024-07-25 10:35:07'),
(1095, 1185, 1184, 'add', '2024-07-25 10:35:07', '2024-07-25 10:35:07'),
(1096, 1190, 1185, 'add', '2024-07-25 10:36:10', '2024-07-25 10:36:10'),
(1097, 1190, 1186, 'add', '2024-07-25 10:36:10', '2024-07-25 10:36:10'),
(1098, 1192, 1190, 'add', '2024-07-25 10:36:32', '2024-07-25 10:36:32'),
(1099, 1194, 1192, 'add', '2024-07-25 10:36:53', '2024-07-25 10:36:53'),
(1106, 1208, 1205, 'add', '2024-07-25 10:40:32', '2024-07-25 10:40:32'),
(1107, 1208, 1207, 'add', '2024-07-25 10:40:32', '2024-07-25 10:40:32'),
(1108, 1209, 1206, 'add', '2024-07-25 10:40:45', '2024-07-25 10:40:45'),
(1109, 1210, 1208, 'add', '2024-07-25 10:41:02', '2024-07-25 10:41:02'),
(1111, 1213, 1210, 'add', '2024-07-25 10:42:23', '2024-07-25 10:42:23'),
(1118, 1223, 1218, 'add', '2024-07-25 10:48:35', '2024-07-25 10:48:35'),
(1119, 1223, 1220, 'add', '2024-07-25 10:48:35', '2024-07-25 10:48:35'),
(1120, 1223, 1221, 'add', '2024-07-25 10:48:35', '2024-07-25 10:48:35'),
(1121, 1223, 1222, 'add', '2024-07-25 10:48:35', '2024-07-25 10:48:35'),
(1122, 1226, 1223, 'add', '2024-07-25 10:50:11', '2024-07-25 10:50:11'),
(1123, 1226, 1224, 'add', '2024-07-25 10:50:11', '2024-07-25 10:50:11'),
(1124, 1228, 1226, 'add', '2024-07-25 10:50:56', '2024-07-25 10:50:56'),
(1126, 1230, 1228, 'add', '2024-07-25 10:51:25', '2024-07-25 10:51:25'),
(1128, 1241, 1237, 'add', '2024-07-25 10:54:34', '2024-07-25 10:54:34'),
(1129, 1243, 1241, 'add', '2024-07-25 10:54:59', '2024-07-25 10:54:59'),
(1138, 1252, 1248, 'add', '2024-07-25 10:57:17', '2024-07-25 10:57:17'),
(1142, 1254, 1252, 'add', '2024-07-25 10:58:30', '2024-07-25 10:58:30'),
(1145, 1264, 1259, 'add', '2024-07-25 11:00:44', '2024-07-25 11:00:44'),
(1146, 1265, 1264, 'add', '2024-07-25 11:01:52', '2024-07-25 11:01:52'),
(1149, 1270, 1255, 'add', '2024-07-25 11:03:45', '2024-07-25 11:03:45'),
(1166, 1286, 1277, 'add', '2024-07-25 11:10:07', '2024-07-25 11:10:07'),
(1167, 1286, 1278, 'add', '2024-07-25 11:10:07', '2024-07-25 11:10:07'),
(1168, 1286, 1280, 'add', '2024-07-25 11:10:07', '2024-07-25 11:10:07'),
(1169, 1286, 1283, 'add', '2024-07-25 11:10:07', '2024-07-25 11:10:07'),
(1170, 1291, 1286, 'add', '2024-07-25 11:10:30', '2024-07-25 11:10:30'),
(1171, 1291, 1287, 'add', '2024-07-25 11:10:30', '2024-07-25 11:10:30'),
(1172, 1293, 1291, 'add', '2024-07-25 11:10:35', '2024-07-25 11:10:35'),
(1181, 1298, 1293, 'add', '2024-07-25 11:11:40', '2024-07-25 11:11:40'),
(1186, 1308, 1306, 'add', '2024-07-25 11:13:19', '2024-07-25 11:13:19'),
(1187, 1309, 1301, 'add', '2024-07-25 11:13:31', '2024-07-25 11:13:31'),
(1188, 1309, 1303, 'add', '2024-07-25 11:13:31', '2024-07-25 11:13:31'),
(1189, 1309, 1304, 'add', '2024-07-25 11:13:31', '2024-07-25 11:13:31'),
(1190, 1309, 1307, 'add', '2024-07-25 11:13:31', '2024-07-25 11:13:31'),
(1192, 1312, 1302, 'add', '2024-07-25 11:13:54', '2024-07-25 11:13:54'),
(1196, 1314, 1309, 'add', '2024-07-25 11:14:49', '2024-07-25 11:14:49'),
(1197, 1314, 1311, 'add', '2024-07-25 11:14:49', '2024-07-25 11:14:49'),
(1199, 1317, 1314, 'add', '2024-07-25 11:15:24', '2024-07-25 11:15:24'),
(1200, 1322, 1317, 'add', '2024-07-25 11:16:46', '2024-07-25 11:16:46'),
(1205, 1331, 1324, 'add', '2024-07-25 11:18:09', '2024-07-25 11:18:09'),
(1206, 1331, 1325, 'add', '2024-07-25 11:18:09', '2024-07-25 11:18:09'),
(1207, 1331, 1327, 'add', '2024-07-25 11:18:09', '2024-07-25 11:18:09'),
(1208, 1331, 1329, 'add', '2024-07-25 11:18:09', '2024-07-25 11:18:09'),
(1209, 1334, 1331, 'add', '2024-07-25 11:19:51', '2024-07-25 11:19:51'),
(1210, 1334, 1332, 'add', '2024-07-25 11:19:51', '2024-07-25 11:19:51'),
(1211, 1335, 1334, 'add', '2024-07-25 11:20:09', '2024-07-25 11:20:09'),
(1216, 1337, 1335, 'add', '2024-07-25 11:20:34', '2024-07-25 11:20:34'),
(1222, 1348, 1340, 'add', '2024-07-25 11:22:48', '2024-07-25 11:22:48'),
(1223, 1348, 1341, 'add', '2024-07-25 11:22:48', '2024-07-25 11:22:48'),
(1224, 1348, 1342, 'add', '2024-07-25 11:22:48', '2024-07-25 11:22:48'),
(1225, 1348, 1344, 'add', '2024-07-25 11:22:48', '2024-07-25 11:22:48'),
(1228, 1352, 1348, 'add', '2024-07-25 11:23:32', '2024-07-25 11:23:32'),
(1229, 1352, 1349, 'add', '2024-07-25 11:23:32', '2024-07-25 11:23:32'),
(1231, 1354, 1352, 'add', '2024-07-25 11:23:49', '2024-07-25 11:23:49'),
(1232, 1356, 1354, 'add', '2024-07-25 11:24:20', '2024-07-25 11:24:20'),
(1233, 1368, 1359, 'add', '2024-07-25 11:26:14', '2024-07-25 11:26:14'),
(1234, 1368, 1361, 'add', '2024-07-25 11:26:14', '2024-07-25 11:26:14'),
(1235, 1368, 1362, 'add', '2024-07-25 11:26:14', '2024-07-25 11:26:14'),
(1236, 1368, 1364, 'add', '2024-07-25 11:26:14', '2024-07-25 11:26:14'),
(1241, 1373, 1368, 'add', '2024-07-25 11:26:53', '2024-07-25 11:26:53'),
(1242, 1373, 1370, 'add', '2024-07-25 11:26:53', '2024-07-25 11:26:53'),
(1247, 1376, 1373, 'add', '2024-07-25 11:27:11', '2024-07-25 11:27:11'),
(1250, 1379, 1376, 'add', '2024-07-25 11:27:35', '2024-07-25 11:27:35'),
(1253, 1382, 1380, 'add', '2024-07-25 11:28:04', '2024-07-25 11:28:04'),
(1257, 1389, 1386, 'add', '2024-07-25 11:29:22', '2024-07-25 11:29:22'),
(1258, 1392, 1389, 'add', '2024-07-25 11:29:50', '2024-07-25 11:29:50'),
(1285, 1436, 1431, 'add', '2024-07-25 11:59:17', '2024-07-25 11:59:17'),
(1286, 1436, 1433, 'add', '2024-07-25 11:59:17', '2024-07-25 11:59:17'),
(1287, 1437, 1436, 'add', '2024-07-25 11:59:40', '2024-07-25 11:59:40'),
(1290, 1439, 1437, 'add', '2024-07-25 12:00:16', '2024-07-25 12:00:16'),
(1293, 1446, 1441, 'add', '2024-07-25 12:02:05', '2024-07-25 12:02:05'),
(1294, 1446, 1442, 'add', '2024-07-25 12:02:05', '2024-07-25 12:02:05'),
(1295, 1446, 1443, 'add', '2024-07-25 12:02:05', '2024-07-25 12:02:05'),
(1296, 1446, 1444, 'add', '2024-07-25 12:02:05', '2024-07-25 12:02:05'),
(1297, 1450, 1446, 'add', '2024-07-25 12:02:52', '2024-07-25 12:02:52'),
(1298, 1450, 1448, 'add', '2024-07-25 12:02:52', '2024-07-25 12:02:52'),
(1299, 1453, 1450, 'add', '2024-07-25 12:03:13', '2024-07-25 12:03:13'),
(1304, 1455, 1453, 'add', '2024-07-25 12:03:41', '2024-07-25 12:03:41'),
(1307, 1462, 1460, 'add', '2024-07-25 12:04:41', '2024-07-25 12:04:41'),
(1308, 1463, 1457, 'add', '2024-07-25 12:04:54', '2024-07-25 12:04:54'),
(1309, 1463, 1458, 'add', '2024-07-25 12:04:54', '2024-07-25 12:04:54'),
(1310, 1463, 1459, 'add', '2024-07-25 12:04:54', '2024-07-25 12:04:54'),
(1311, 1463, 1461, 'add', '2024-07-25 12:04:54', '2024-07-25 12:04:54'),
(1312, 1464, 1462, 'add', '2024-07-25 12:04:57', '2024-07-25 12:04:57'),
(1313, 1467, 1463, 'add', '2024-07-25 12:05:42', '2024-07-25 12:05:42'),
(1314, 1467, 1465, 'add', '2024-07-25 12:05:42', '2024-07-25 12:05:42'),
(1315, 1468, 1467, 'add', '2024-07-25 12:07:47', '2024-07-25 12:07:47'),
(1316, 1470, 1468, 'add', '2024-07-25 12:08:15', '2024-07-25 12:08:15'),
(1321, 1479, 1472, 'add', '2024-07-25 12:10:45', '2024-07-25 12:10:45'),
(1322, 1479, 1474, 'add', '2024-07-25 12:10:45', '2024-07-25 12:10:45'),
(1323, 1479, 1475, 'add', '2024-07-25 12:10:45', '2024-07-25 12:10:45'),
(1324, 1479, 1477, 'add', '2024-07-25 12:10:45', '2024-07-25 12:10:45'),
(1325, 1481, 1479, 'add', '2024-07-25 12:11:26', '2024-07-25 12:11:26'),
(1326, 1481, 1480, 'add', '2024-07-25 12:11:26', '2024-07-25 12:11:26'),
(1327, 1483, 1481, 'add', '2024-07-25 12:11:41', '2024-07-25 12:11:41'),
(1330, 1484, 1483, 'add', '2024-07-25 12:12:02', '2024-07-25 12:12:02'),
(1331, 1487, 1478, 'add', '2024-07-25 12:12:57', '2024-07-25 12:12:57'),
(1333, 1491, 1485, 'add', '2024-07-25 12:13:47', '2024-07-25 12:13:47'),
(1334, 1491, 1486, 'add', '2024-07-25 12:13:47', '2024-07-25 12:13:47'),
(1335, 1491, 1488, 'add', '2024-07-25 12:13:47', '2024-07-25 12:13:47'),
(1336, 1491, 1489, 'add', '2024-07-25 12:13:47', '2024-07-25 12:13:47'),
(1337, 1497, 1491, 'add', '2024-07-25 12:16:32', '2024-07-25 12:16:32'),
(1338, 1497, 1492, 'add', '2024-07-25 12:16:32', '2024-07-25 12:16:32'),
(1339, 1498, 1497, 'add', '2024-07-25 12:16:43', '2024-07-25 12:16:43'),
(1340, 1499, 1498, 'add', '2024-07-25 12:17:02', '2024-07-25 12:17:02'),
(1347, 1507, 1505, 'add', '2024-07-25 12:18:19', '2024-07-25 12:18:19'),
(1348, 1508, 1501, 'add', '2024-07-25 12:18:33', '2024-07-25 12:18:33'),
(1349, 1508, 1503, 'add', '2024-07-25 12:18:33', '2024-07-25 12:18:33'),
(1350, 1508, 1504, 'add', '2024-07-25 12:18:33', '2024-07-25 12:18:33'),
(1351, 1508, 1506, 'add', '2024-07-25 12:18:33', '2024-07-25 12:18:33'),
(1353, 1511, 1508, 'add', '2024-07-25 12:19:17', '2024-07-25 12:19:17'),
(1354, 1511, 1510, 'add', '2024-07-25 12:19:17', '2024-07-25 12:19:17'),
(1355, 1513, 1511, 'add', '2024-07-25 12:19:31', '2024-07-25 12:19:31'),
(1362, 1524, 1518, 'add', '2024-07-25 12:21:30', '2024-07-25 12:21:30'),
(1363, 1524, 1520, 'add', '2024-07-25 12:21:30', '2024-07-25 12:21:30'),
(1364, 1524, 1521, 'add', '2024-07-25 12:21:30', '2024-07-25 12:21:30'),
(1365, 1524, 1522, 'add', '2024-07-25 12:21:30', '2024-07-25 12:21:30'),
(1366, 1526, 1519, 'add', '2024-07-25 12:21:50', '2024-07-25 12:21:50'),
(1367, 1526, 1523, 'add', '2024-07-25 12:21:50', '2024-07-25 12:21:50'),
(1368, 1527, 1526, 'add', '2024-07-25 12:22:08', '2024-07-25 12:22:08'),
(1369, 1528, 1524, 'add', '2024-07-25 12:22:13', '2024-07-25 12:22:13'),
(1370, 1528, 1525, 'add', '2024-07-25 12:22:13', '2024-07-25 12:22:13'),
(1372, 1530, 1528, 'add', '2024-07-25 12:22:29', '2024-07-25 12:22:29'),
(1375, 1538, 1536, 'add', '2024-07-25 12:24:54', '2024-07-25 12:24:54'),
(1380, 1541, 1540, 'add', '2024-07-25 12:25:37', '2024-07-25 12:25:37'),
(1381, 1542, 1541, 'add', '2024-07-25 12:25:56', '2024-07-25 12:25:56'),
(1384, 1545, 1544, 'add', '2024-07-25 12:26:44', '2024-07-25 12:26:44'),
(1385, 1546, 1545, 'add', '2024-07-25 12:27:20', '2024-07-25 12:27:20'),
(1390, 1553, 1551, 'add', '2024-07-25 12:34:19', '2024-07-25 12:34:19'),
(1391, 1553, 1552, 'add', '2024-07-25 12:34:19', '2024-07-25 12:34:19'),
(1392, 1554, 1553, 'add', '2024-07-25 12:34:34', '2024-07-25 12:34:34'),
(1394, 1562, 1556, 'add', '2024-07-25 12:36:20', '2024-07-25 12:36:20'),
(1395, 1562, 1557, 'add', '2024-07-25 12:36:20', '2024-07-25 12:36:20'),
(1396, 1562, 1559, 'add', '2024-07-25 12:36:20', '2024-07-25 12:36:20'),
(1397, 1562, 1561, 'add', '2024-07-25 12:36:20', '2024-07-25 12:36:20'),
(1402, 1567, 1562, 'add', '2024-07-25 12:37:35', '2024-07-25 12:37:35'),
(1403, 1567, 1564, 'add', '2024-07-25 12:37:35', '2024-07-25 12:37:35'),
(1408, 1572, 1570, 'add', '2024-07-25 12:38:55', '2024-07-25 12:38:55'),
(1410, 1580, 1574, 'add', '2024-07-25 12:40:50', '2024-07-25 12:40:50'),
(1411, 1580, 1575, 'add', '2024-07-25 12:40:50', '2024-07-25 12:40:50'),
(1412, 1580, 1577, 'add', '2024-07-25 12:40:50', '2024-07-25 12:40:50'),
(1413, 1580, 1578, 'add', '2024-07-25 12:40:50', '2024-07-25 12:40:50'),
(1420, 1586, 1584, 'add', '2024-07-25 12:41:40', '2024-07-25 12:41:40'),
(1424, 1594, 1589, 'add', '2024-07-25 12:43:31', '2024-07-25 12:43:31'),
(1425, 1594, 1590, 'add', '2024-07-25 12:43:31', '2024-07-25 12:43:31'),
(1426, 1594, 1591, 'add', '2024-07-25 12:43:31', '2024-07-25 12:43:31'),
(1427, 1594, 1592, 'add', '2024-07-25 12:43:31', '2024-07-25 12:43:31'),
(1428, 1595, 1593, 'add', '2024-07-25 12:43:39', '2024-07-25 12:43:39'),
(1430, 1598, 1594, 'add', '2024-07-25 12:44:11', '2024-07-25 12:44:11'),
(1431, 1598, 1596, 'add', '2024-07-25 12:44:11', '2024-07-25 12:44:11'),
(1432, 1599, 1598, 'add', '2024-07-25 12:44:49', '2024-07-25 12:44:49'),
(1434, 1607, 1603, 'add', '2024-07-25 12:47:28', '2024-07-25 12:47:28'),
(1435, 1607, 1604, 'add', '2024-07-25 12:47:28', '2024-07-25 12:47:28'),
(1436, 1607, 1605, 'add', '2024-07-25 12:47:28', '2024-07-25 12:47:28'),
(1437, 1607, 1606, 'add', '2024-07-25 12:47:28', '2024-07-25 12:47:28'),
(1438, 1609, 1607, 'add', '2024-07-25 12:48:30', '2024-07-25 12:48:30'),
(1439, 1609, 1608, 'add', '2024-07-25 12:48:30', '2024-07-25 12:48:30'),
(1440, 1611, 1609, 'add', '2024-07-25 12:48:45', '2024-07-25 12:48:45'),
(1449, 1619, 1618, 'add', '2024-07-25 12:51:03', '2024-07-25 12:51:03'),
(1451, 1627, 1615, 'add', '2024-07-25 12:52:39', '2024-07-25 12:52:39'),
(1452, 1627, 1617, 'add', '2024-07-25 12:52:39', '2024-07-25 12:52:39'),
(1453, 1627, 1621, 'add', '2024-07-25 12:52:39', '2024-07-25 12:52:39'),
(1454, 1627, 1625, 'add', '2024-07-25 12:52:39', '2024-07-25 12:52:39'),
(1455, 1629, 1627, 'add', '2024-07-25 12:53:10', '2024-07-25 12:53:10'),
(1456, 1629, 1628, 'add', '2024-07-25 12:53:10', '2024-07-25 12:53:10'),
(1457, 1630, 1629, 'add', '2024-07-25 12:53:22', '2024-07-25 12:53:22'),
(1465, 1639, 1637, 'add', '2024-07-25 12:54:49', '2024-07-25 12:54:49'),
(1467, 1641, 1633, 'add', '2024-07-25 12:55:07', '2024-07-25 12:55:07'),
(1468, 1641, 1635, 'add', '2024-07-25 12:55:07', '2024-07-25 12:55:07'),
(1469, 1641, 1636, 'add', '2024-07-25 12:55:07', '2024-07-25 12:55:07'),
(1470, 1641, 1638, 'add', '2024-07-25 12:55:07', '2024-07-25 12:55:07'),
(1471, 1644, 1641, 'add', '2024-07-25 12:55:48', '2024-07-25 12:55:48'),
(1472, 1644, 1642, 'add', '2024-07-25 12:55:48', '2024-07-25 12:55:48'),
(1474, 1646, 1644, 'add', '2024-07-25 12:56:02', '2024-07-25 12:56:02'),
(1478, 1652, 1649, 'add', '2024-07-25 12:57:59', '2024-07-25 12:57:59'),
(1480, 1654, 1652, 'add', '2024-07-25 12:58:19', '2024-07-25 12:58:19'),
(1481, 1659, 1655, 'add', '2024-07-26 04:01:36', '2024-07-26 04:01:36'),
(1482, 1659, 1656, 'add', '2024-07-26 04:01:36', '2024-07-26 04:01:36'),
(1483, 1659, 1657, 'add', '2024-07-26 04:01:36', '2024-07-26 04:01:36'),
(1484, 1659, 1658, 'add', '2024-07-26 04:01:36', '2024-07-26 04:01:36'),
(1485, 1661, 1659, 'add', '2024-07-26 04:49:39', '2024-07-26 04:49:39'),
(1486, 1661, 1660, 'add', '2024-07-26 04:49:39', '2024-07-26 04:49:39'),
(1489, 1668, 1664, 'add', '2024-07-26 05:01:03', '2024-07-26 05:01:03'),
(1490, 1668, 1665, 'add', '2024-07-26 05:01:03', '2024-07-26 05:01:03'),
(1491, 1668, 1666, 'add', '2024-07-26 05:01:03', '2024-07-26 05:01:03'),
(1492, 1668, 1667, 'add', '2024-07-26 05:01:03', '2024-07-26 05:01:03'),
(1493, 1670, 1668, 'add', '2024-07-26 05:02:32', '2024-07-26 05:02:32'),
(1494, 1670, 1669, 'add', '2024-07-26 05:02:32', '2024-07-26 05:02:32'),
(1495, 1671, 1670, 'add', '2024-07-26 05:03:07', '2024-07-26 05:03:07'),
(1497, 1677, 1673, 'add', '2024-07-26 05:07:08', '2024-07-26 05:07:08'),
(1498, 1677, 1674, 'add', '2024-07-26 05:07:08', '2024-07-26 05:07:08'),
(1499, 1677, 1675, 'add', '2024-07-26 05:07:08', '2024-07-26 05:07:08'),
(1500, 1677, 1676, 'add', '2024-07-26 05:07:08', '2024-07-26 05:07:08'),
(1501, 1679, 1677, 'add', '2024-07-26 05:09:13', '2024-07-26 05:09:13'),
(1502, 1679, 1678, 'add', '2024-07-26 05:09:13', '2024-07-26 05:09:13'),
(1503, 1680, 1679, 'add', '2024-07-26 05:09:43', '2024-07-26 05:09:43'),
(1505, 1686, 1682, 'add', '2024-07-26 05:14:07', '2024-07-26 05:14:07'),
(1506, 1686, 1683, 'add', '2024-07-26 05:14:07', '2024-07-26 05:14:07'),
(1507, 1686, 1684, 'add', '2024-07-26 05:14:07', '2024-07-26 05:14:07'),
(1508, 1686, 1685, 'add', '2024-07-26 05:14:07', '2024-07-26 05:14:07'),
(1509, 1688, 1686, 'add', '2024-07-26 05:15:21', '2024-07-26 05:15:21'),
(1510, 1688, 1687, 'add', '2024-07-26 05:15:21', '2024-07-26 05:15:21'),
(1511, 1689, 1688, 'add', '2024-07-26 05:16:04', '2024-07-26 05:16:04'),
(1517, 1697, 1695, 'add', '2024-07-26 05:23:13', '2024-07-26 05:23:13'),
(1518, 1697, 1696, 'add', '2024-07-26 05:23:13', '2024-07-26 05:23:13'),
(1519, 1698, 1697, 'add', '2024-07-26 05:23:53', '2024-07-26 05:23:53'),
(1521, 1704, 1700, 'add', '2024-07-26 05:29:47', '2024-07-26 05:29:47'),
(1522, 1704, 1701, 'add', '2024-07-26 05:29:47', '2024-07-26 05:29:47'),
(1523, 1704, 1702, 'add', '2024-07-26 05:29:47', '2024-07-26 05:29:47'),
(1524, 1704, 1703, 'add', '2024-07-26 05:29:47', '2024-07-26 05:29:47'),
(1527, 1707, 1706, 'add', '2024-07-26 05:31:27', '2024-07-26 05:31:27'),
(1529, 1714, 1710, 'add', '2024-07-26 05:37:14', '2024-07-26 05:37:14'),
(1530, 1714, 1711, 'add', '2024-07-26 05:37:14', '2024-07-26 05:37:14'),
(1531, 1714, 1712, 'add', '2024-07-26 05:37:14', '2024-07-26 05:37:14'),
(1532, 1714, 1713, 'add', '2024-07-26 05:37:14', '2024-07-26 05:37:14'),
(1533, 1716, 1714, 'add', '2024-07-26 05:38:25', '2024-07-26 05:38:25'),
(1534, 1716, 1715, 'add', '2024-07-26 05:38:25', '2024-07-26 05:38:25'),
(1535, 1717, 1716, 'add', '2024-07-26 05:39:11', '2024-07-26 05:39:11'),
(1537, 1723, 1719, 'add', '2024-07-26 05:43:27', '2024-07-26 05:43:27'),
(1538, 1723, 1720, 'add', '2024-07-26 05:43:27', '2024-07-26 05:43:27'),
(1539, 1723, 1721, 'add', '2024-07-26 05:43:27', '2024-07-26 05:43:27'),
(1540, 1723, 1722, 'add', '2024-07-26 05:43:27', '2024-07-26 05:43:27'),
(1541, 1725, 1723, 'add', '2024-07-26 05:44:50', '2024-07-26 05:44:50'),
(1542, 1725, 1724, 'add', '2024-07-26 05:44:50', '2024-07-26 05:44:50'),
(1543, 1726, 1725, 'add', '2024-07-26 05:45:42', '2024-07-26 05:45:42'),
(1545, 1732, 1728, 'add', '2024-07-26 05:52:37', '2024-07-26 05:52:37'),
(1546, 1732, 1729, 'add', '2024-07-26 05:52:37', '2024-07-26 05:52:37'),
(1547, 1732, 1730, 'add', '2024-07-26 05:52:37', '2024-07-26 05:52:37'),
(1548, 1732, 1731, 'add', '2024-07-26 05:52:37', '2024-07-26 05:52:37'),
(1551, 1735, 1734, 'add', '2024-07-26 05:54:51', '2024-07-26 05:54:51'),
(1553, 1741, 1737, 'add', '2024-07-26 05:58:53', '2024-07-26 05:58:53'),
(1554, 1741, 1738, 'add', '2024-07-26 05:58:53', '2024-07-26 05:58:53'),
(1555, 1741, 1739, 'add', '2024-07-26 05:58:53', '2024-07-26 05:58:53'),
(1556, 1741, 1740, 'add', '2024-07-26 05:58:53', '2024-07-26 05:58:53'),
(1557, 1743, 1741, 'add', '2024-07-26 06:00:02', '2024-07-26 06:00:02'),
(1558, 1743, 1742, 'add', '2024-07-26 06:00:02', '2024-07-26 06:00:02'),
(1559, 1744, 1743, 'add', '2024-07-26 06:00:47', '2024-07-26 06:00:47'),
(1561, 1750, 1746, 'add', '2024-07-26 06:06:08', '2024-07-26 06:06:08'),
(1562, 1750, 1747, 'add', '2024-07-26 06:06:08', '2024-07-26 06:06:08'),
(1563, 1750, 1748, 'add', '2024-07-26 06:06:08', '2024-07-26 06:06:08'),
(1564, 1750, 1749, 'add', '2024-07-26 06:06:08', '2024-07-26 06:06:08'),
(1567, 1753, 1752, 'add', '2024-07-26 06:08:29', '2024-07-26 06:08:29'),
(1568, 1754, 1753, 'add', '2024-07-26 06:09:09', '2024-07-26 06:09:09'),
(1569, 1759, 1755, 'add', '2024-07-26 06:12:05', '2024-07-26 06:12:05'),
(1570, 1759, 1756, 'add', '2024-07-26 06:12:05', '2024-07-26 06:12:05'),
(1571, 1759, 1757, 'add', '2024-07-26 06:12:05', '2024-07-26 06:12:05'),
(1572, 1759, 1758, 'add', '2024-07-26 06:12:05', '2024-07-26 06:12:05'),
(1573, 1761, 1759, 'add', '2024-07-26 06:13:24', '2024-07-26 06:13:24'),
(1574, 1761, 1760, 'add', '2024-07-26 06:13:24', '2024-07-26 06:13:24'),
(1575, 1762, 1761, 'add', '2024-07-26 06:13:55', '2024-07-26 06:13:55'),
(1577, 1768, 1764, 'add', '2024-07-26 06:18:12', '2024-07-26 06:18:12'),
(1578, 1768, 1765, 'add', '2024-07-26 06:18:12', '2024-07-26 06:18:12'),
(1579, 1768, 1766, 'add', '2024-07-26 06:18:12', '2024-07-26 06:18:12'),
(1580, 1768, 1767, 'add', '2024-07-26 06:18:12', '2024-07-26 06:18:12'),
(1581, 1770, 1768, 'add', '2024-07-26 06:19:26', '2024-07-26 06:19:26'),
(1582, 1770, 1769, 'add', '2024-07-26 06:19:26', '2024-07-26 06:19:26'),
(1583, 1771, 1770, 'add', '2024-07-26 06:20:04', '2024-07-26 06:20:04'),
(1585, 1777, 1773, 'add', '2024-07-26 06:23:45', '2024-07-26 06:23:45'),
(1586, 1777, 1774, 'add', '2024-07-26 06:23:45', '2024-07-26 06:23:45'),
(1587, 1777, 1775, 'add', '2024-07-26 06:23:45', '2024-07-26 06:23:45'),
(1588, 1777, 1776, 'add', '2024-07-26 06:23:45', '2024-07-26 06:23:45'),
(1590, 1779, 1777, 'add', '2024-07-26 06:25:56', '2024-07-26 06:25:56'),
(1591, 1779, 1778, 'add', '2024-07-26 06:25:56', '2024-07-26 06:25:56'),
(1592, 1780, 1779, 'add', '2024-07-26 06:26:28', '2024-07-26 06:26:28'),
(1594, 1786, 1782, 'add', '2024-07-26 06:30:12', '2024-07-26 06:30:12'),
(1595, 1786, 1783, 'add', '2024-07-26 06:30:12', '2024-07-26 06:30:12'),
(1596, 1786, 1784, 'add', '2024-07-26 06:30:12', '2024-07-26 06:30:12'),
(1597, 1786, 1785, 'add', '2024-07-26 06:30:12', '2024-07-26 06:30:12'),
(1598, 1788, 1786, 'add', '2024-07-26 06:31:19', '2024-07-26 06:31:19'),
(1599, 1788, 1787, 'add', '2024-07-26 06:31:19', '2024-07-26 06:31:19'),
(1600, 1789, 1788, 'add', '2024-07-26 06:31:47', '2024-07-26 06:31:47'),
(1607, 1796, 1795, 'add', '2024-07-26 10:19:12', '2024-07-26 10:19:12'),
(1608, 1801, 1797, 'add', '2024-07-26 10:27:02', '2024-07-26 10:27:02'),
(1609, 1801, 1798, 'add', '2024-07-26 10:27:02', '2024-07-26 10:27:02'),
(1610, 1801, 1799, 'add', '2024-07-26 10:27:02', '2024-07-26 10:27:02'),
(1611, 1801, 1800, 'add', '2024-07-26 10:27:02', '2024-07-26 10:27:02'),
(1612, 1803, 1801, 'add', '2024-07-26 10:28:03', '2024-07-26 10:28:03'),
(1613, 1803, 1802, 'add', '2024-07-26 10:28:03', '2024-07-26 10:28:03'),
(1614, 1804, 1803, 'add', '2024-07-26 10:28:41', '2024-07-26 10:28:41'),
(1615, 1805, 1804, 'add', '2024-07-26 10:29:27', '2024-07-26 10:29:27'),
(1620, 1812, 1810, 'add', '2024-07-26 10:33:01', '2024-07-26 10:33:01'),
(1621, 1812, 1811, 'add', '2024-07-26 10:33:01', '2024-07-26 10:33:01'),
(1622, 1813, 1812, 'add', '2024-07-26 10:33:22', '2024-07-26 10:33:22'),
(1623, 1814, 1813, 'add', '2024-07-26 10:34:02', '2024-07-26 10:34:02'),
(1624, 1819, 1815, 'add', '2024-07-26 10:36:07', '2024-07-26 10:36:07'),
(1625, 1819, 1816, 'add', '2024-07-26 10:36:07', '2024-07-26 10:36:07'),
(1626, 1819, 1817, 'add', '2024-07-26 10:36:07', '2024-07-26 10:36:07'),
(1627, 1819, 1818, 'add', '2024-07-26 10:36:07', '2024-07-26 10:36:07'),
(1628, 1821, 1819, 'add', '2024-07-26 10:37:10', '2024-07-26 10:37:10'),
(1629, 1821, 1820, 'add', '2024-07-26 10:37:10', '2024-07-26 10:37:10'),
(1630, 1822, 1821, 'add', '2024-07-26 10:37:43', '2024-07-26 10:37:43'),
(1631, 1823, 1822, 'add', '2024-07-26 10:38:30', '2024-07-26 10:38:30'),
(1632, 1828, 1824, 'add', '2024-07-26 10:40:31', '2024-07-26 10:40:31'),
(1633, 1828, 1825, 'add', '2024-07-26 10:40:31', '2024-07-26 10:40:31'),
(1634, 1828, 1826, 'add', '2024-07-26 10:40:31', '2024-07-26 10:40:31'),
(1635, 1828, 1827, 'add', '2024-07-26 10:40:31', '2024-07-26 10:40:31'),
(1636, 1830, 1828, 'add', '2024-07-26 10:41:26', '2024-07-26 10:41:26'),
(1637, 1830, 1829, 'add', '2024-07-26 10:41:26', '2024-07-26 10:41:26'),
(1638, 1831, 1830, 'add', '2024-07-26 10:41:53', '2024-07-26 10:41:53'),
(1639, 1832, 1831, 'add', '2024-07-26 10:42:20', '2024-07-26 10:42:20'),
(1640, 1837, 1833, 'add', '2024-07-26 10:44:25', '2024-07-26 10:44:25'),
(1641, 1837, 1834, 'add', '2024-07-26 10:44:25', '2024-07-26 10:44:25'),
(1642, 1837, 1835, 'add', '2024-07-26 10:44:25', '2024-07-26 10:44:25'),
(1643, 1837, 1836, 'add', '2024-07-26 10:44:25', '2024-07-26 10:44:25'),
(1644, 1839, 1837, 'add', '2024-07-26 10:45:18', '2024-07-26 10:45:18'),
(1645, 1839, 1838, 'add', '2024-07-26 10:45:18', '2024-07-26 10:45:18'),
(1646, 1840, 1839, 'add', '2024-07-26 10:46:07', '2024-07-26 10:46:07'),
(1647, 1841, 1840, 'add', '2024-07-26 10:46:59', '2024-07-26 10:46:59'),
(1648, 1846, 1842, 'add', '2024-07-26 10:49:27', '2024-07-26 10:49:27'),
(1649, 1846, 1843, 'add', '2024-07-26 10:49:27', '2024-07-26 10:49:27'),
(1650, 1846, 1844, 'add', '2024-07-26 10:49:27', '2024-07-26 10:49:27'),
(1651, 1846, 1845, 'add', '2024-07-26 10:49:27', '2024-07-26 10:49:27'),
(1652, 1848, 1846, 'add', '2024-07-26 10:50:18', '2024-07-26 10:50:18'),
(1653, 1848, 1847, 'add', '2024-07-26 10:50:18', '2024-07-26 10:50:18'),
(1654, 1849, 1848, 'add', '2024-07-26 10:50:40', '2024-07-26 10:50:40'),
(1656, 1855, 1851, 'add', '2024-07-26 10:54:02', '2024-07-26 10:54:02'),
(1657, 1855, 1852, 'add', '2024-07-26 10:54:02', '2024-07-26 10:54:02'),
(1658, 1855, 1853, 'add', '2024-07-26 10:54:02', '2024-07-26 10:54:02'),
(1659, 1855, 1854, 'add', '2024-07-26 10:54:02', '2024-07-26 10:54:02'),
(1660, 1857, 1855, 'add', '2024-07-26 10:55:19', '2024-07-26 10:55:19'),
(1661, 1857, 1856, 'add', '2024-07-26 10:55:19', '2024-07-26 10:55:19'),
(1662, 1858, 1857, 'add', '2024-07-26 10:55:40', '2024-07-26 10:55:40'),
(1664, 1864, 1860, 'add', '2024-07-26 10:58:12', '2024-07-26 10:58:12'),
(1665, 1864, 1861, 'add', '2024-07-26 10:58:12', '2024-07-26 10:58:12'),
(1666, 1864, 1862, 'add', '2024-07-26 10:58:12', '2024-07-26 10:58:12'),
(1667, 1864, 1863, 'add', '2024-07-26 10:58:12', '2024-07-26 10:58:12'),
(1670, 1867, 1866, 'add', '2024-07-26 10:59:37', '2024-07-26 10:59:37'),
(1672, 1873, 1869, 'add', '2024-07-26 11:02:36', '2024-07-26 11:02:36'),
(1673, 1873, 1870, 'add', '2024-07-26 11:02:36', '2024-07-26 11:02:36'),
(1674, 1873, 1871, 'add', '2024-07-26 11:02:36', '2024-07-26 11:02:36'),
(1675, 1873, 1872, 'add', '2024-07-26 11:02:36', '2024-07-26 11:02:36'),
(1676, 1875, 1873, 'add', '2024-07-26 11:03:31', '2024-07-26 11:03:31'),
(1677, 1875, 1874, 'add', '2024-07-26 11:03:31', '2024-07-26 11:03:31'),
(1678, 1876, 1875, 'add', '2024-07-26 11:04:16', '2024-07-26 11:04:16'),
(1680, 1882, 1878, 'add', '2024-07-26 11:06:46', '2024-07-26 11:06:46'),
(1681, 1882, 1879, 'add', '2024-07-26 11:06:46', '2024-07-26 11:06:46'),
(1682, 1882, 1880, 'add', '2024-07-26 11:06:46', '2024-07-26 11:06:46'),
(1683, 1882, 1881, 'add', '2024-07-26 11:06:46', '2024-07-26 11:06:46'),
(1684, 1884, 1882, 'add', '2024-07-26 11:07:42', '2024-07-26 11:07:42'),
(1685, 1884, 1883, 'add', '2024-07-26 11:07:42', '2024-07-26 11:07:42'),
(1686, 1885, 1884, 'add', '2024-07-26 11:08:00', '2024-07-26 11:08:00'),
(1688, 1891, 1887, 'add', '2024-07-26 11:10:45', '2024-07-26 11:10:45'),
(1689, 1891, 1888, 'add', '2024-07-26 11:10:45', '2024-07-26 11:10:45'),
(1690, 1891, 1889, 'add', '2024-07-26 11:10:45', '2024-07-26 11:10:45'),
(1691, 1891, 1890, 'add', '2024-07-26 11:10:45', '2024-07-26 11:10:45'),
(1692, 1893, 1891, 'add', '2024-07-26 11:12:28', '2024-07-26 11:12:28'),
(1693, 1893, 1892, 'add', '2024-07-26 11:12:28', '2024-07-26 11:12:28'),
(1694, 1894, 1893, 'add', '2024-07-26 11:13:19', '2024-07-26 11:13:19'),
(1696, 1900, 1896, 'add', '2024-07-26 11:16:09', '2024-07-26 11:16:09'),
(1697, 1900, 1897, 'add', '2024-07-26 11:16:09', '2024-07-26 11:16:09'),
(1698, 1900, 1898, 'add', '2024-07-26 11:16:09', '2024-07-26 11:16:09'),
(1699, 1900, 1899, 'add', '2024-07-26 11:16:09', '2024-07-26 11:16:09'),
(1700, 1902, 1900, 'add', '2024-07-26 11:17:00', '2024-07-26 11:17:00'),
(1701, 1902, 1901, 'add', '2024-07-26 11:17:00', '2024-07-26 11:17:00'),
(1702, 1903, 1902, 'add', '2024-07-26 11:17:16', '2024-07-26 11:17:16'),
(1703, 1904, 1903, 'add', '2024-07-26 11:17:43', '2024-07-26 11:17:43'),
(1704, 1906, 1905, 'add', '2024-07-26 11:21:06', '2024-07-26 11:21:06'),
(1705, 1907, 1906, 'add', '2024-07-26 11:22:02', '2024-07-26 11:22:02'),
(1706, 1910, 1909, 'add', '2024-07-26 11:22:58', '2024-07-26 11:22:58'),
(1707, 1911, 1910, 'add', '2024-07-26 11:23:37', '2024-07-26 11:23:37'),
(1708, 1916, 1912, 'add', '2024-07-26 18:32:41', '2024-07-26 18:32:41'),
(1709, 1916, 1913, 'add', '2024-07-26 18:32:41', '2024-07-26 18:32:41'),
(1710, 1916, 1914, 'add', '2024-07-26 18:32:41', '2024-07-26 18:32:41'),
(1711, 1916, 1915, 'add', '2024-07-26 18:32:41', '2024-07-26 18:32:41'),
(1712, 1918, 1916, 'add', '2024-07-26 18:33:56', '2024-07-26 18:33:56'),
(1713, 1918, 1917, 'add', '2024-07-26 18:33:56', '2024-07-26 18:33:56'),
(1714, 1920, 1918, 'add', '2024-07-26 18:42:49', '2024-07-26 18:42:49'),
(1715, 1921, 1920, 'add', '2024-07-26 18:44:21', '2024-07-26 18:44:21'),
(1716, 1927, 1923, 'add', '2024-07-26 18:47:52', '2024-07-26 18:47:52'),
(1717, 1927, 1924, 'add', '2024-07-26 18:47:52', '2024-07-26 18:47:52'),
(1718, 1927, 1925, 'add', '2024-07-26 18:47:52', '2024-07-26 18:47:52'),
(1719, 1927, 1926, 'add', '2024-07-26 18:47:52', '2024-07-26 18:47:52'),
(1720, 1929, 1927, 'add', '2024-07-26 18:48:53', '2024-07-26 18:48:53'),
(1721, 1929, 1928, 'add', '2024-07-26 18:48:53', '2024-07-26 18:48:53'),
(1722, 1931, 1929, 'add', '2024-07-26 18:50:36', '2024-07-26 18:50:36'),
(1723, 1932, 1931, 'add', '2024-07-26 18:51:19', '2024-07-26 18:51:19'),
(1724, 1938, 1934, 'add', '2024-07-26 18:53:51', '2024-07-26 18:53:51'),
(1725, 1938, 1935, 'add', '2024-07-26 18:53:51', '2024-07-26 18:53:51'),
(1726, 1938, 1936, 'add', '2024-07-26 18:53:51', '2024-07-26 18:53:51'),
(1727, 1938, 1937, 'add', '2024-07-26 18:53:51', '2024-07-26 18:53:51'),
(1728, 1940, 1938, 'add', '2024-07-26 18:54:55', '2024-07-26 18:54:55'),
(1729, 1940, 1939, 'add', '2024-07-26 18:54:55', '2024-07-26 18:54:55'),
(1730, 1942, 1940, 'add', '2024-07-26 18:55:57', '2024-07-26 18:55:57'),
(1731, 1943, 1942, 'add', '2024-07-26 18:56:30', '2024-07-26 18:56:30'),
(1732, 1949, 1945, 'add', '2024-07-26 18:59:02', '2024-07-26 18:59:02'),
(1733, 1949, 1946, 'add', '2024-07-26 18:59:02', '2024-07-26 18:59:02'),
(1734, 1949, 1947, 'add', '2024-07-26 18:59:02', '2024-07-26 18:59:02'),
(1735, 1949, 1948, 'add', '2024-07-26 18:59:02', '2024-07-26 18:59:02'),
(1736, 1951, 1949, 'add', '2024-07-26 18:59:53', '2024-07-26 18:59:53'),
(1737, 1951, 1950, 'add', '2024-07-26 18:59:53', '2024-07-26 18:59:53'),
(1738, 1953, 1951, 'add', '2024-07-26 19:00:40', '2024-07-26 19:00:40'),
(1739, 1954, 1953, 'add', '2024-07-26 19:01:11', '2024-07-26 19:01:11'),
(1740, 1960, 1956, 'add', '2024-07-26 19:03:59', '2024-07-26 19:03:59'),
(1741, 1960, 1957, 'add', '2024-07-26 19:03:59', '2024-07-26 19:03:59'),
(1742, 1960, 1958, 'add', '2024-07-26 19:03:59', '2024-07-26 19:03:59'),
(1743, 1960, 1959, 'add', '2024-07-26 19:03:59', '2024-07-26 19:03:59'),
(1744, 1962, 1960, 'add', '2024-07-26 19:05:10', '2024-07-26 19:05:10'),
(1745, 1962, 1961, 'add', '2024-07-26 19:05:10', '2024-07-26 19:05:10'),
(1747, 1964, 1962, 'add', '2024-07-26 19:07:31', '2024-07-26 19:07:31'),
(1748, 1965, 1964, 'add', '2024-07-26 19:08:08', '2024-07-26 19:08:08'),
(1749, 1971, 1967, 'add', '2024-07-26 19:11:29', '2024-07-26 19:11:29'),
(1750, 1971, 1968, 'add', '2024-07-26 19:11:29', '2024-07-26 19:11:29'),
(1751, 1971, 1969, 'add', '2024-07-26 19:11:29', '2024-07-26 19:11:29'),
(1752, 1971, 1970, 'add', '2024-07-26 19:11:29', '2024-07-26 19:11:29'),
(1753, 1973, 1971, 'add', '2024-07-26 19:12:35', '2024-07-26 19:12:35'),
(1754, 1973, 1972, 'add', '2024-07-26 19:12:35', '2024-07-26 19:12:35'),
(1755, 1975, 1973, 'add', '2024-07-26 19:13:25', '2024-07-26 19:13:25'),
(1756, 1976, 1975, 'add', '2024-07-26 19:13:57', '2024-07-26 19:13:57'),
(1757, 1982, 1978, 'add', '2024-07-26 19:17:02', '2024-07-26 19:17:02'),
(1758, 1982, 1979, 'add', '2024-07-26 19:17:02', '2024-07-26 19:17:02'),
(1759, 1982, 1980, 'add', '2024-07-26 19:17:02', '2024-07-26 19:17:02'),
(1760, 1982, 1981, 'add', '2024-07-26 19:17:02', '2024-07-26 19:17:02'),
(1761, 1984, 1982, 'add', '2024-07-26 19:17:59', '2024-07-26 19:17:59'),
(1762, 1984, 1983, 'add', '2024-07-26 19:17:59', '2024-07-26 19:17:59'),
(1763, 1986, 1984, 'add', '2024-07-26 19:19:13', '2024-07-26 19:19:13');
INSERT INTO `part_operations` (`id`, `part_id`, `operand_part_id`, `operation`, `created_at`, `updated_at`) VALUES
(1764, 1987, 1986, 'add', '2024-07-26 19:19:56', '2024-07-26 19:19:56'),
(1765, 1993, 1989, 'add', '2024-07-26 19:23:08', '2024-07-26 19:23:08'),
(1766, 1993, 1990, 'add', '2024-07-26 19:23:08', '2024-07-26 19:23:08'),
(1767, 1993, 1991, 'add', '2024-07-26 19:23:08', '2024-07-26 19:23:08'),
(1768, 1993, 1992, 'add', '2024-07-26 19:23:08', '2024-07-26 19:23:08'),
(1769, 1995, 1993, 'add', '2024-07-26 19:24:24', '2024-07-26 19:24:24'),
(1770, 1995, 1994, 'add', '2024-07-26 19:24:24', '2024-07-26 19:24:24'),
(1771, 1997, 1995, 'add', '2024-07-26 19:25:14', '2024-07-26 19:25:14'),
(1772, 1998, 1997, 'add', '2024-07-26 19:26:13', '2024-07-26 19:26:13'),
(1773, 2004, 2000, 'add', '2024-07-26 19:28:37', '2024-07-26 19:28:37'),
(1774, 2004, 2001, 'add', '2024-07-26 19:28:37', '2024-07-26 19:28:37'),
(1775, 2004, 2002, 'add', '2024-07-26 19:28:37', '2024-07-26 19:28:37'),
(1776, 2004, 2003, 'add', '2024-07-26 19:28:37', '2024-07-26 19:28:37'),
(1777, 2006, 2004, 'add', '2024-07-26 19:29:28', '2024-07-26 19:29:28'),
(1778, 2006, 2005, 'add', '2024-07-26 19:29:28', '2024-07-26 19:29:28'),
(1779, 2008, 2006, 'add', '2024-07-26 19:30:08', '2024-07-26 19:30:08'),
(1780, 2009, 2008, 'add', '2024-07-26 19:31:09', '2024-07-26 19:31:09'),
(1781, 2015, 2011, 'add', '2024-07-26 19:34:25', '2024-07-26 19:34:25'),
(1782, 2015, 2012, 'add', '2024-07-26 19:34:25', '2024-07-26 19:34:25'),
(1783, 2015, 2013, 'add', '2024-07-26 19:34:25', '2024-07-26 19:34:25'),
(1784, 2015, 2014, 'add', '2024-07-26 19:34:25', '2024-07-26 19:34:25'),
(1785, 2017, 2015, 'add', '2024-07-26 19:35:25', '2024-07-26 19:35:25'),
(1786, 2017, 2016, 'add', '2024-07-26 19:35:25', '2024-07-26 19:35:25'),
(1787, 2018, 2017, 'add', '2024-07-26 19:35:53', '2024-07-26 19:35:53'),
(1788, 2019, 2018, 'add', '2024-07-26 19:36:29', '2024-07-26 19:36:29'),
(1789, 2023, 2021, 'add', '2024-07-26 19:47:49', '2024-07-26 19:47:49'),
(1790, 2024, 2023, 'add', '2024-07-26 19:48:29', '2024-07-26 19:48:29'),
(1791, 2028, 2026, 'add', '2024-07-26 19:50:46', '2024-07-26 19:50:46'),
(1792, 2029, 2028, 'add', '2024-07-26 19:51:24', '2024-07-26 19:51:24'),
(1793, 2033, 2031, 'add', '2024-07-26 19:53:09', '2024-07-26 19:53:09'),
(1794, 2034, 2033, 'add', '2024-07-26 19:53:39', '2024-07-26 19:53:39'),
(1795, 1662, 1661, 'add', '2024-07-27 06:13:10', '2024-07-27 06:13:10'),
(1805, 2054, 682, 'add', '2024-07-27 06:48:58', '2024-07-27 06:48:58'),
(1807, 1555, 1554, 'add', '2024-07-27 06:49:42', '2024-07-27 06:49:42'),
(1809, 2056, 1555, 'add', '2024-07-27 06:50:09', '2024-07-27 06:50:09'),
(1811, 1573, 1572, 'add', '2024-07-27 06:50:31', '2024-07-27 06:50:31'),
(1812, 2058, 1573, 'add', '2024-07-27 06:50:45', '2024-07-27 06:50:45'),
(1814, 1571, 1569, 'add', '2024-07-27 06:51:00', '2024-07-27 06:51:00'),
(1815, 2060, 725, 'add', '2024-07-27 06:51:10', '2024-07-27 06:51:10'),
(1816, 2061, 1571, 'add', '2024-07-27 06:51:22', '2024-07-27 06:51:22'),
(1817, 2062, 727, 'add', '2024-07-27 06:51:37', '2024-07-27 06:51:37'),
(1818, 2063, 1588, 'add', '2024-07-27 06:51:54', '2024-07-27 06:51:54'),
(1819, 2064, 749, 'add', '2024-07-27 06:51:59', '2024-07-27 06:51:59'),
(1820, 1588, 1586, 'add', '2024-07-27 06:52:01', '2024-07-27 06:52:01'),
(1822, 2065, 741, 'add', '2024-07-27 06:52:25', '2024-07-27 06:52:25'),
(1823, 2066, 1597, 'add', '2024-07-27 06:52:35', '2024-07-27 06:52:35'),
(1824, 2067, 758, 'add', '2024-07-27 06:52:48', '2024-07-27 06:52:48'),
(1825, 1600, 1599, 'add', '2024-07-27 06:52:55', '2024-07-27 06:52:55'),
(1826, 2068, 1600, 'add', '2024-07-27 06:53:13', '2024-07-27 06:53:13'),
(1827, 2069, 767, 'add', '2024-07-27 06:53:24', '2024-07-27 06:53:24'),
(1828, 2070, 763, 'add', '2024-07-27 06:53:50', '2024-07-27 06:53:50'),
(1829, 1620, 1619, 'add', '2024-07-27 06:53:51', '2024-07-27 06:53:51'),
(1830, 2071, 1620, 'add', '2024-07-27 06:54:10', '2024-07-27 06:54:10'),
(1832, 2073, 772, 'add', '2024-07-27 06:54:36', '2024-07-27 06:54:36'),
(1833, 1613, 1611, 'add', '2024-07-27 06:55:04', '2024-07-27 06:55:04'),
(1834, 2074, 1004, 'add', '2024-07-27 06:55:23', '2024-07-27 06:55:23'),
(1835, 2075, 1613, 'add', '2024-07-27 06:55:25', '2024-07-27 06:55:25'),
(1836, 2076, 1060, 'add', '2024-07-27 06:55:46', '2024-07-27 06:55:46'),
(1837, 1631, 1630, 'add', '2024-07-27 06:56:02', '2024-07-27 06:56:02'),
(1838, 2077, 1096, 'add', '2024-07-27 06:56:17', '2024-07-27 06:56:17'),
(1839, 2078, 1631, 'add', '2024-07-27 06:56:18', '2024-07-27 06:56:18'),
(1840, 2079, 1121, 'add', '2024-07-27 06:56:39', '2024-07-27 06:56:39'),
(1841, 1640, 1639, 'add', '2024-07-27 06:56:43', '2024-07-27 06:56:43'),
(1842, 2080, 1176, 'add', '2024-07-27 06:57:15', '2024-07-27 06:57:15'),
(1843, 2081, 1640, 'add', '2024-07-27 06:57:18', '2024-07-27 06:57:18'),
(1844, 1648, 1646, 'add', '2024-07-27 06:57:37', '2024-07-27 06:57:37'),
(1845, 2082, 1211, 'add', '2024-07-27 06:57:43', '2024-07-27 06:57:43'),
(1846, 2083, 1648, 'add', '2024-07-27 06:57:52', '2024-07-27 06:57:52'),
(1847, 2084, 1272, 'add', '2024-07-27 06:58:08', '2024-07-27 06:58:08'),
(1848, 2085, 1647, 'add', '2024-07-27 06:58:20', '2024-07-27 06:58:20'),
(1849, 2087, 1653, 'add', '2024-07-27 06:58:39', '2024-07-27 06:58:39'),
(1850, 2088, 1310, 'add', '2024-07-27 06:58:59', '2024-07-27 06:58:59'),
(1851, 2089, 1654, 'add', '2024-07-27 06:59:01', '2024-07-27 06:59:01'),
(1853, 2090, 1663, 'add', '2024-07-27 06:59:44', '2024-07-27 06:59:44'),
(1854, 2091, 1322, 'add', '2024-07-27 06:59:45', '2024-07-27 06:59:45'),
(1855, 2092, 1672, 'add', '2024-07-27 07:00:04', '2024-07-27 07:00:04'),
(1856, 2093, 1351, 'add', '2024-07-27 07:00:09', '2024-07-27 07:00:09'),
(1857, 2094, 1681, 'add', '2024-07-27 07:00:24', '2024-07-27 07:00:24'),
(1858, 2095, 1337, 'add', '2024-07-27 07:00:30', '2024-07-27 07:00:30'),
(1859, 2096, 1690, 'add', '2024-07-27 07:00:50', '2024-07-27 07:00:50'),
(1860, 2098, 1709, 'add', '2024-07-27 07:01:32', '2024-07-27 07:01:32'),
(1861, 2099, 1356, 'add', '2024-07-27 07:01:43', '2024-07-27 07:01:43'),
(1862, 2100, 1718, 'add', '2024-07-27 07:02:02', '2024-07-27 07:02:02'),
(1863, 2101, 1384, 'add', '2024-07-27 07:02:26', '2024-07-27 07:02:26'),
(1864, 2102, 1727, 'add', '2024-07-27 07:02:30', '2024-07-27 07:02:30'),
(1865, 2104, 1745, 'add', '2024-07-27 07:03:05', '2024-07-27 07:03:05'),
(1866, 2105, 1754, 'add', '2024-07-27 07:03:34', '2024-07-27 07:03:34'),
(1867, 2106, 1392, 'add', '2024-07-27 07:03:36', '2024-07-27 07:03:36'),
(1868, 2108, 1395, 'add', '2024-07-27 07:03:56', '2024-07-27 07:03:56'),
(1872, 2107, 2107, 'add', '2024-07-27 07:07:37', '2024-07-27 07:07:37'),
(1873, 2110, 1772, 'add', '2024-07-27 07:07:55', '2024-07-27 07:07:55'),
(1874, 2111, 1439, 'add', '2024-07-27 07:07:56', '2024-07-27 07:07:56'),
(1875, 2112, 1781, 'add', '2024-07-27 07:08:16', '2024-07-27 07:08:16'),
(1876, 2113, 1790, 'add', '2024-07-27 07:10:13', '2024-07-27 07:10:13'),
(1877, 2114, 1793, 'add', '2024-07-27 07:11:06', '2024-07-27 07:11:06'),
(1878, 2115, 1455, 'add', '2024-07-27 07:11:37', '2024-07-27 07:11:37'),
(1879, 2116, 1796, 'add', '2024-07-27 07:11:58', '2024-07-27 07:11:58'),
(1880, 2117, 1464, 'add', '2024-07-27 07:12:14', '2024-07-27 07:12:14'),
(1881, 2118, 1805, 'add', '2024-07-27 07:13:02', '2024-07-27 07:13:02'),
(1882, 2119, 1470, 'add', '2024-07-27 07:13:11', '2024-07-27 07:13:11'),
(1883, 2120, 1814, 'add', '2024-07-27 07:13:28', '2024-07-27 07:13:28'),
(1885, 2122, 1823, 'add', '2024-07-27 07:13:55', '2024-07-27 07:13:55'),
(1886, 2123, 1484, 'add', '2024-07-27 07:13:58', '2024-07-27 07:13:58'),
(1887, 2124, 1832, 'add', '2024-07-27 07:14:18', '2024-07-27 07:14:18'),
(1888, 2125, 1499, 'add', '2024-07-27 07:14:20', '2024-07-27 07:14:20'),
(1889, 2126, 1841, 'add', '2024-07-27 07:14:41', '2024-07-27 07:14:41'),
(1890, 2127, 1509, 'add', '2024-07-27 07:15:07', '2024-07-27 07:15:07'),
(1891, 2128, 1850, 'add', '2024-07-27 07:15:07', '2024-07-27 07:15:07'),
(1892, 2129, 1859, 'add', '2024-07-27 07:15:33', '2024-07-27 07:15:33'),
(1893, 2130, 1516, 'add', '2024-07-27 07:15:39', '2024-07-27 07:15:39'),
(1894, 2131, 1529, 'add', '2024-07-27 07:16:57', '2024-07-27 07:16:57'),
(1895, 2132, 1868, 'add', '2024-07-27 07:17:40', '2024-07-27 07:17:40'),
(1896, 2133, 1531, 'add', '2024-07-27 07:17:58', '2024-07-27 07:17:58'),
(1897, 2134, 1877, 'add', '2024-07-27 07:18:10', '2024-07-27 07:18:10'),
(1898, 2135, 1546, 'add', '2024-07-27 07:18:22', '2024-07-27 07:18:22'),
(1899, 2136, 1886, 'add', '2024-07-27 07:19:29', '2024-07-27 07:19:29'),
(1900, 2137, 1538, 'add', '2024-07-27 07:19:39', '2024-07-27 07:19:39'),
(1901, 2138, 1542, 'add', '2024-07-27 07:20:03', '2024-07-27 07:20:03'),
(1902, 2139, 1895, 'add', '2024-07-27 07:20:23', '2024-07-27 07:20:23'),
(1903, 2140, 1904, 'add', '2024-07-27 07:21:03', '2024-07-27 07:21:03'),
(1904, 2141, 1907, 'add', '2024-07-27 07:21:44', '2024-07-27 07:21:44'),
(1905, 2142, 1911, 'add', '2024-07-27 07:22:05', '2024-07-27 07:22:05'),
(1906, 2151, 2145, 'add', '2024-07-27 07:35:05', '2024-07-27 07:35:05'),
(1907, 2151, 2147, 'add', '2024-07-27 07:35:05', '2024-07-27 07:35:05'),
(1908, 2151, 2149, 'add', '2024-07-27 07:35:05', '2024-07-27 07:35:05'),
(1909, 2151, 2150, 'add', '2024-07-27 07:35:05', '2024-07-27 07:35:05'),
(1910, 2152, 2143, 'add', '2024-07-27 07:36:00', '2024-07-27 07:36:00'),
(1911, 2152, 2144, 'add', '2024-07-27 07:36:00', '2024-07-27 07:36:00'),
(1912, 2152, 2146, 'add', '2024-07-27 07:36:00', '2024-07-27 07:36:00'),
(1913, 2152, 2148, 'add', '2024-07-27 07:36:00', '2024-07-27 07:36:00'),
(1914, 2155, 2151, 'add', '2024-07-27 07:36:57', '2024-07-27 07:36:57'),
(1915, 2155, 2153, 'add', '2024-07-27 07:36:57', '2024-07-27 07:36:57'),
(1916, 2156, 2152, 'add', '2024-07-27 07:37:01', '2024-07-27 07:37:01'),
(1917, 2156, 2154, 'add', '2024-07-27 07:37:01', '2024-07-27 07:37:01'),
(1918, 2157, 2156, 'add', '2024-07-27 07:37:20', '2024-07-27 07:37:20'),
(1919, 2159, 2157, 'add', '2024-07-27 07:38:25', '2024-07-27 07:38:25'),
(1920, 2160, 2155, 'add', '2024-07-27 07:38:26', '2024-07-27 07:38:26'),
(1921, 2163, 2160, 'add', '2024-07-27 07:39:21', '2024-07-27 07:39:21'),
(1922, 2168, 2161, 'add', '2024-07-27 07:40:37', '2024-07-27 07:40:37'),
(1923, 2168, 2162, 'add', '2024-07-27 07:40:37', '2024-07-27 07:40:37'),
(1924, 2168, 2164, 'add', '2024-07-27 07:40:37', '2024-07-27 07:40:37'),
(1925, 2168, 2165, 'add', '2024-07-27 07:40:37', '2024-07-27 07:40:37'),
(1926, 2172, 2168, 'add', '2024-07-27 07:41:42', '2024-07-27 07:41:42'),
(1927, 2172, 2170, 'add', '2024-07-27 07:41:42', '2024-07-27 07:41:42'),
(1928, 2174, 2172, 'add', '2024-07-27 07:42:01', '2024-07-27 07:42:01'),
(1929, 2175, 2167, 'add', '2024-07-27 07:42:22', '2024-07-27 07:42:22'),
(1930, 2175, 2169, 'add', '2024-07-27 07:42:22', '2024-07-27 07:42:22'),
(1931, 2175, 2171, 'add', '2024-07-27 07:42:22', '2024-07-27 07:42:22'),
(1932, 2175, 2173, 'add', '2024-07-27 07:42:22', '2024-07-27 07:42:22'),
(1933, 2176, 2174, 'add', '2024-07-27 07:42:30', '2024-07-27 07:42:30'),
(1934, 2181, 2175, 'add', '2024-07-27 07:43:57', '2024-07-27 07:43:57'),
(1935, 2181, 2177, 'add', '2024-07-27 07:43:57', '2024-07-27 07:43:57'),
(1937, 2185, 2178, 'add', '2024-07-27 07:44:59', '2024-07-27 07:44:59'),
(1938, 2185, 2179, 'add', '2024-07-27 07:44:59', '2024-07-27 07:44:59'),
(1939, 2185, 2180, 'add', '2024-07-27 07:44:59', '2024-07-27 07:44:59'),
(1940, 2185, 2182, 'add', '2024-07-27 07:44:59', '2024-07-27 07:44:59'),
(1941, 2184, 2181, 'add', '2024-07-27 07:45:23', '2024-07-27 07:45:23'),
(1942, 2187, 2184, 'add', '2024-07-27 07:46:57', '2024-07-27 07:46:57'),
(1943, 2189, 2185, 'add', '2024-07-27 07:48:01', '2024-07-27 07:48:01'),
(1944, 2189, 2186, 'add', '2024-07-27 07:48:01', '2024-07-27 07:48:01'),
(1945, 2192, 2189, 'add', '2024-07-27 07:49:50', '2024-07-27 07:49:50'),
(1946, 2194, 2192, 'add', '2024-07-27 07:51:10', '2024-07-27 07:51:10'),
(1947, 2198, 2190, 'add', '2024-07-27 07:51:49', '2024-07-27 07:51:49'),
(1948, 2198, 2191, 'add', '2024-07-27 07:51:49', '2024-07-27 07:51:49'),
(1949, 2198, 2193, 'add', '2024-07-27 07:51:49', '2024-07-27 07:51:49'),
(1950, 2198, 2195, 'add', '2024-07-27 07:51:49', '2024-07-27 07:51:49'),
(1951, 2203, 2198, 'add', '2024-07-27 07:53:16', '2024-07-27 07:53:16'),
(1952, 2203, 2201, 'add', '2024-07-27 07:53:16', '2024-07-27 07:53:16'),
(1953, 2206, 2203, 'add', '2024-07-27 07:54:19', '2024-07-27 07:54:19'),
(1956, 2208, 2206, 'add', '2024-07-27 07:55:02', '2024-07-27 07:55:02'),
(1957, 2202, 2196, 'add', '2024-07-27 07:55:23', '2024-07-27 07:55:23'),
(1958, 2202, 2197, 'add', '2024-07-27 07:55:23', '2024-07-27 07:55:23'),
(1959, 2202, 2199, 'add', '2024-07-27 07:55:23', '2024-07-27 07:55:23'),
(1960, 2202, 2200, 'add', '2024-07-27 07:55:23', '2024-07-27 07:55:23'),
(1961, 2207, 2202, 'add', '2024-07-27 07:55:31', '2024-07-27 07:55:31'),
(1962, 2207, 2204, 'add', '2024-07-27 07:55:31', '2024-07-27 07:55:31'),
(1963, 2210, 2207, 'add', '2024-07-27 07:56:07', '2024-07-27 07:56:07'),
(1964, 2213, 2210, 'add', '2024-07-27 07:56:50', '2024-07-27 07:56:50'),
(1965, 2220, 2211, 'add', '2024-07-27 07:58:22', '2024-07-27 07:58:22'),
(1966, 2220, 2212, 'add', '2024-07-27 07:58:22', '2024-07-27 07:58:22'),
(1967, 2220, 2214, 'add', '2024-07-27 07:58:22', '2024-07-27 07:58:22'),
(1968, 2220, 2215, 'add', '2024-07-27 07:58:22', '2024-07-27 07:58:22'),
(1973, 2224, 2220, 'add', '2024-07-27 07:59:18', '2024-07-27 07:59:18'),
(1974, 2224, 2222, 'add', '2024-07-27 07:59:18', '2024-07-27 07:59:18'),
(1975, 2226, 2221, 'add', '2024-07-27 07:59:55', '2024-07-27 07:59:55'),
(1976, 2226, 2223, 'add', '2024-07-27 07:59:55', '2024-07-27 07:59:55'),
(1977, 2221, 2216, 'add', '2024-07-27 08:00:02', '2024-07-27 08:00:02'),
(1978, 2221, 2217, 'add', '2024-07-27 08:00:02', '2024-07-27 08:00:02'),
(1979, 2221, 2218, 'add', '2024-07-27 08:00:02', '2024-07-27 08:00:02'),
(1980, 2221, 2219, 'add', '2024-07-27 08:00:02', '2024-07-27 08:00:02'),
(1981, 2227, 2224, 'add', '2024-07-27 08:00:19', '2024-07-27 08:00:19'),
(1982, 2228, 2226, 'add', '2024-07-27 08:00:29', '2024-07-27 08:00:29'),
(1983, 2229, 2227, 'add', '2024-07-27 08:00:46', '2024-07-27 08:00:46'),
(1984, 2230, 2228, 'add', '2024-07-27 08:00:48', '2024-07-27 08:00:48'),
(1985, 2239, 2232, 'add', '2024-07-27 08:02:37', '2024-07-27 08:02:37'),
(1986, 2239, 2233, 'add', '2024-07-27 08:02:37', '2024-07-27 08:02:37'),
(1987, 2239, 2234, 'add', '2024-07-27 08:02:37', '2024-07-27 08:02:37'),
(1988, 2239, 2237, 'add', '2024-07-27 08:02:37', '2024-07-27 08:02:37'),
(1989, 2242, 2239, 'add', '2024-07-27 08:03:04', '2024-07-27 08:03:04'),
(1990, 2242, 2240, 'add', '2024-07-27 08:03:04', '2024-07-27 08:03:04'),
(1991, 2244, 2242, 'add', '2024-07-27 08:03:19', '2024-07-27 08:03:19'),
(1992, 2245, 2244, 'add', '2024-07-27 08:03:38', '2024-07-27 08:03:38'),
(1993, 2250, 2246, 'add', '2024-07-27 08:05:11', '2024-07-27 08:05:11'),
(1994, 2250, 2247, 'add', '2024-07-27 08:05:11', '2024-07-27 08:05:11'),
(1995, 2250, 2248, 'add', '2024-07-27 08:05:11', '2024-07-27 08:05:11'),
(1996, 2250, 2249, 'add', '2024-07-27 08:05:11', '2024-07-27 08:05:11'),
(1997, 2251, 2235, 'add', '2024-07-27 08:05:14', '2024-07-27 08:05:14'),
(1998, 2251, 2236, 'add', '2024-07-27 08:05:14', '2024-07-27 08:05:14'),
(1999, 2251, 2238, 'add', '2024-07-27 08:05:14', '2024-07-27 08:05:14'),
(2000, 2251, 2241, 'add', '2024-07-27 08:05:14', '2024-07-27 08:05:14'),
(2001, 2253, 2243, 'add', '2024-07-27 08:05:41', '2024-07-27 08:05:41'),
(2002, 2253, 2251, 'add', '2024-07-27 08:05:41', '2024-07-27 08:05:41'),
(2003, 2255, 2250, 'add', '2024-07-27 08:06:09', '2024-07-27 08:06:09'),
(2004, 2255, 2252, 'add', '2024-07-27 08:06:09', '2024-07-27 08:06:09'),
(2005, 2256, 2253, 'add', '2024-07-27 08:06:19', '2024-07-27 08:06:19'),
(2006, 2257, 2255, 'add', '2024-07-27 08:06:26', '2024-07-27 08:06:26'),
(2007, 2258, 2256, 'add', '2024-07-27 08:06:48', '2024-07-27 08:06:48'),
(2008, 2261, 2257, 'add', '2024-07-27 08:07:40', '2024-07-27 08:07:40'),
(2009, 2269, 2260, 'add', '2024-07-27 08:09:17', '2024-07-27 08:09:17'),
(2010, 2269, 2262, 'add', '2024-07-27 08:09:17', '2024-07-27 08:09:17'),
(2011, 2269, 2263, 'add', '2024-07-27 08:09:17', '2024-07-27 08:09:17'),
(2012, 2269, 2266, 'add', '2024-07-27 08:09:17', '2024-07-27 08:09:17'),
(2013, 2271, 2264, 'add', '2024-07-27 08:09:50', '2024-07-27 08:09:50'),
(2014, 2271, 2265, 'add', '2024-07-27 08:09:50', '2024-07-27 08:09:50'),
(2015, 2271, 2267, 'add', '2024-07-27 08:09:50', '2024-07-27 08:09:50'),
(2016, 2271, 2268, 'add', '2024-07-27 08:09:50', '2024-07-27 08:09:50'),
(2017, 2273, 2269, 'add', '2024-07-27 08:10:07', '2024-07-27 08:10:07'),
(2018, 2273, 2270, 'add', '2024-07-27 08:10:07', '2024-07-27 08:10:07'),
(2019, 2275, 2271, 'add', '2024-07-27 08:10:30', '2024-07-27 08:10:30'),
(2020, 2275, 2272, 'add', '2024-07-27 08:10:30', '2024-07-27 08:10:30'),
(2021, 2276, 2273, 'add', '2024-07-27 08:10:51', '2024-07-27 08:10:51'),
(2022, 2277, 2275, 'add', '2024-07-27 08:11:06', '2024-07-27 08:11:06'),
(2023, 2279, 2277, 'add', '2024-07-27 08:11:25', '2024-07-27 08:11:25'),
(2024, 2288, 2281, 'add', '2024-07-27 08:14:21', '2024-07-27 08:14:21'),
(2025, 2288, 2283, 'add', '2024-07-27 08:14:21', '2024-07-27 08:14:21'),
(2026, 2288, 2284, 'add', '2024-07-27 08:14:21', '2024-07-27 08:14:21'),
(2027, 2288, 2285, 'add', '2024-07-27 08:14:21', '2024-07-27 08:14:21'),
(2032, 2292, 2288, 'add', '2024-07-27 08:15:21', '2024-07-27 08:15:21'),
(2033, 2292, 2290, 'add', '2024-07-27 08:15:21', '2024-07-27 08:15:21'),
(2034, 2294, 2292, 'add', '2024-07-27 08:16:06', '2024-07-27 08:16:06'),
(2035, 2291, 2282, 'add', '2024-07-27 08:16:16', '2024-07-27 08:16:16'),
(2036, 2291, 2286, 'add', '2024-07-27 08:16:16', '2024-07-27 08:16:16'),
(2037, 2291, 2287, 'add', '2024-07-27 08:16:16', '2024-07-27 08:16:16'),
(2038, 2291, 2289, 'add', '2024-07-27 08:16:16', '2024-07-27 08:16:16'),
(2039, 2295, 2294, 'add', '2024-07-27 08:16:28', '2024-07-27 08:16:28'),
(2040, 2296, 2291, 'add', '2024-07-27 08:16:44', '2024-07-27 08:16:44'),
(2041, 2296, 2293, 'add', '2024-07-27 08:16:44', '2024-07-27 08:16:44'),
(2042, 2298, 2296, 'add', '2024-07-27 08:18:04', '2024-07-27 08:18:04'),
(2043, 2299, 2298, 'add', '2024-07-27 08:18:46', '2024-07-27 08:18:46'),
(2044, 2302, 2300, 'add', '2024-07-27 08:19:39', '2024-07-27 08:19:39'),
(2045, 2303, 2302, 'add', '2024-07-27 08:20:19', '2024-07-27 08:20:19'),
(2046, 2307, 2305, 'add', '2024-07-27 08:21:30', '2024-07-27 08:21:30'),
(2047, 2309, 2307, 'add', '2024-07-27 08:21:45', '2024-07-27 08:21:45'),
(2048, 2312, 2310, 'add', '2024-07-27 08:22:23', '2024-07-27 08:22:23'),
(2049, 2313, 2312, 'add', '2024-07-27 08:22:43', '2024-07-27 08:22:43'),
(2050, 2314, 2304, 'add', '2024-07-27 08:22:52', '2024-07-27 08:22:52'),
(2051, 2314, 2306, 'add', '2024-07-27 08:22:52', '2024-07-27 08:22:52'),
(2052, 2314, 2308, 'add', '2024-07-27 08:22:52', '2024-07-27 08:22:52'),
(2053, 2314, 2311, 'add', '2024-07-27 08:22:52', '2024-07-27 08:22:52'),
(2054, 2317, 2315, 'add', '2024-07-27 08:23:20', '2024-07-27 08:23:20'),
(2055, 2318, 2314, 'add', '2024-07-27 08:23:45', '2024-07-27 08:23:45'),
(2056, 2318, 2316, 'add', '2024-07-27 08:23:45', '2024-07-27 08:23:45'),
(2057, 2319, 2317, 'add', '2024-07-27 08:24:05', '2024-07-27 08:24:05'),
(2058, 2321, 2318, 'add', '2024-07-27 08:25:32', '2024-07-27 08:25:32'),
(2059, 2322, 2321, 'add', '2024-07-27 08:26:26', '2024-07-27 08:26:26'),
(2060, 805, 796, 'add', '2024-07-27 08:28:12', '2024-07-27 08:28:12'),
(2061, 805, 798, 'add', '2024-07-27 08:28:12', '2024-07-27 08:28:12'),
(2062, 805, 800, 'add', '2024-07-27 08:28:12', '2024-07-27 08:28:12'),
(2063, 805, 801, 'add', '2024-07-27 08:28:12', '2024-07-27 08:28:12'),
(2064, 809, 807, 'add', '2024-07-27 08:28:42', '2024-07-27 08:28:42'),
(2065, 811, 809, 'add', '2024-07-27 08:29:05', '2024-07-27 08:29:05'),
(2066, 2328, 2324, 'add', '2024-07-27 08:30:59', '2024-07-27 08:30:59'),
(2067, 2328, 2325, 'add', '2024-07-27 08:30:59', '2024-07-27 08:30:59'),
(2068, 2328, 2326, 'add', '2024-07-27 08:30:59', '2024-07-27 08:30:59'),
(2069, 2328, 2327, 'add', '2024-07-27 08:30:59', '2024-07-27 08:30:59'),
(2070, 2330, 2328, 'add', '2024-07-27 08:33:17', '2024-07-27 08:33:17'),
(2071, 2330, 2329, 'add', '2024-07-27 08:33:17', '2024-07-27 08:33:17'),
(2072, 2333, 2330, 'add', '2024-07-27 08:33:55', '2024-07-27 08:33:55'),
(2073, 2337, 2333, 'add', '2024-07-27 08:34:28', '2024-07-27 08:34:28'),
(2074, 2338, 2332, 'add', '2024-07-27 08:34:41', '2024-07-27 08:34:41'),
(2075, 2338, 2334, 'add', '2024-07-27 08:34:41', '2024-07-27 08:34:41'),
(2076, 2338, 2335, 'add', '2024-07-27 08:34:41', '2024-07-27 08:34:41'),
(2077, 2338, 2336, 'add', '2024-07-27 08:34:41', '2024-07-27 08:34:41'),
(2078, 2343, 2338, 'add', '2024-07-27 08:35:35', '2024-07-27 08:35:35'),
(2079, 2343, 2340, 'add', '2024-07-27 08:35:35', '2024-07-27 08:35:35'),
(2080, 2347, 2345, 'add', '2024-07-27 08:36:28', '2024-07-27 08:36:28'),
(2081, 2350, 2341, 'add', '2024-07-27 08:37:15', '2024-07-27 08:37:15'),
(2082, 2350, 2342, 'add', '2024-07-27 08:37:15', '2024-07-27 08:37:15'),
(2083, 2350, 2344, 'add', '2024-07-27 08:37:15', '2024-07-27 08:37:15'),
(2084, 2350, 2346, 'add', '2024-07-27 08:37:15', '2024-07-27 08:37:15'),
(2085, 777, 773, 'add', '2024-07-27 08:38:08', '2024-07-27 08:38:08'),
(2086, 777, 774, 'add', '2024-07-27 08:38:08', '2024-07-27 08:38:08'),
(2087, 777, 775, 'add', '2024-07-27 08:38:08', '2024-07-27 08:38:08'),
(2088, 777, 776, 'add', '2024-07-27 08:38:08', '2024-07-27 08:38:08'),
(2089, 2352, 2350, 'add', '2024-07-27 08:38:44', '2024-07-27 08:38:44'),
(2090, 2352, 2351, 'add', '2024-07-27 08:38:44', '2024-07-27 08:38:44'),
(2091, 783, 777, 'add', '2024-07-27 08:38:45', '2024-07-27 08:38:45'),
(2092, 783, 779, 'add', '2024-07-27 08:38:45', '2024-07-27 08:38:45'),
(2093, 790, 783, 'add', '2024-07-27 08:39:11', '2024-07-27 08:39:11'),
(2094, 792, 790, 'add', '2024-07-27 08:39:27', '2024-07-27 08:39:27'),
(2095, 2354, 2352, 'add', '2024-07-27 08:39:32', '2024-07-27 08:39:32'),
(2096, 2355, 2354, 'add', '2024-07-27 08:39:54', '2024-07-27 08:39:54'),
(2097, 840, 833, 'add', '2024-07-27 08:41:08', '2024-07-27 08:41:08'),
(2098, 840, 834, 'add', '2024-07-27 08:41:08', '2024-07-27 08:41:08'),
(2099, 840, 836, 'add', '2024-07-27 08:41:08', '2024-07-27 08:41:08'),
(2100, 840, 838, 'add', '2024-07-27 08:41:08', '2024-07-27 08:41:08'),
(2101, 843, 840, 'add', '2024-07-27 08:41:25', '2024-07-27 08:41:25'),
(2102, 843, 841, 'add', '2024-07-27 08:41:25', '2024-07-27 08:41:25'),
(2103, 844, 843, 'add', '2024-07-27 08:41:34', '2024-07-27 08:41:34'),
(2104, 2359, 2357, 'add', '2024-07-27 08:41:43', '2024-07-27 08:41:43'),
(2105, 846, 844, 'add', '2024-07-27 08:41:56', '2024-07-27 08:41:56'),
(2106, 2360, 2359, 'add', '2024-07-27 08:42:07', '2024-07-27 08:42:07'),
(2107, 859, 852, 'add', '2024-07-27 08:42:59', '2024-07-27 08:42:59'),
(2108, 859, 854, 'add', '2024-07-27 08:42:59', '2024-07-27 08:42:59'),
(2109, 859, 856, 'add', '2024-07-27 08:42:59', '2024-07-27 08:42:59'),
(2110, 859, 857, 'add', '2024-07-27 08:42:59', '2024-07-27 08:42:59'),
(2111, 863, 859, 'add', '2024-07-27 08:43:20', '2024-07-27 08:43:20'),
(2112, 863, 861, 'add', '2024-07-27 08:43:20', '2024-07-27 08:43:20'),
(2113, 864, 863, 'add', '2024-07-27 08:43:27', '2024-07-27 08:43:27'),
(2114, 866, 864, 'add', '2024-07-27 08:43:37', '2024-07-27 08:43:37'),
(2117, 877, 871, 'add', '2024-07-27 08:44:27', '2024-07-27 08:44:27'),
(2118, 877, 872, 'add', '2024-07-27 08:44:27', '2024-07-27 08:44:27'),
(2119, 877, 873, 'add', '2024-07-27 08:44:27', '2024-07-27 08:44:27'),
(2120, 877, 875, 'add', '2024-07-27 08:44:27', '2024-07-27 08:44:27'),
(2121, 883, 877, 'add', '2024-07-27 08:44:40', '2024-07-27 08:44:40'),
(2122, 883, 882, 'add', '2024-07-27 08:44:40', '2024-07-27 08:44:40'),
(2123, 887, 885, 'add', '2024-07-27 08:44:52', '2024-07-27 08:44:52'),
(2124, 2364, 2362, 'add', '2024-07-27 08:45:02', '2024-07-27 08:45:02'),
(2125, 2365, 2365, 'add', '2024-07-27 08:45:28', '2024-07-27 08:45:28'),
(2126, 904, 902, 'add', '2024-07-27 08:45:37', '2024-07-27 08:45:37'),
(2127, 902, 901, 'add', '2024-07-27 08:45:44', '2024-07-27 08:45:44'),
(2128, 901, 897, 'add', '2024-07-27 08:45:55', '2024-07-27 08:45:55'),
(2129, 901, 898, 'add', '2024-07-27 08:45:55', '2024-07-27 08:45:55'),
(2130, 897, 891, 'add', '2024-07-27 08:46:16', '2024-07-27 08:46:16'),
(2131, 897, 893, 'add', '2024-07-27 08:46:16', '2024-07-27 08:46:16'),
(2132, 897, 894, 'add', '2024-07-27 08:46:16', '2024-07-27 08:46:16'),
(2133, 897, 896, 'add', '2024-07-27 08:46:16', '2024-07-27 08:46:16'),
(2134, 2369, 2367, 'add', '2024-07-27 08:46:59', '2024-07-27 08:46:59'),
(2135, 920, 919, 'add', '2024-07-27 08:47:02', '2024-07-27 08:47:02'),
(2136, 919, 918, 'add', '2024-07-27 08:47:20', '2024-07-27 08:47:20'),
(2137, 2370, 2369, 'add', '2024-07-27 08:47:25', '2024-07-27 08:47:25'),
(2139, 999, 997, 'add', '2024-07-27 08:51:39', '2024-07-27 08:51:39'),
(2140, 784, 778, 'add', '2024-07-27 08:53:44', '2024-07-27 08:53:44'),
(2141, 784, 780, 'add', '2024-07-27 08:53:44', '2024-07-27 08:53:44'),
(2142, 784, 781, 'add', '2024-07-27 08:53:44', '2024-07-27 08:53:44'),
(2143, 784, 782, 'add', '2024-07-27 08:53:44', '2024-07-27 08:53:44'),
(2144, 791, 787, 'add', '2024-07-27 08:55:13', '2024-07-27 08:55:13'),
(2145, 793, 791, 'add', '2024-07-27 08:55:24', '2024-07-27 08:55:24'),
(2148, 870, 865, 'add', '2024-07-27 09:02:04', '2024-07-27 09:02:04'),
(2149, 874, 870, 'add', '2024-07-27 09:02:15', '2024-07-27 09:02:15'),
(2150, 890, 884, 'add', '2024-07-27 09:03:42', '2024-07-27 09:03:42'),
(2151, 890, 886, 'add', '2024-07-27 09:03:42', '2024-07-27 09:03:42'),
(2152, 943, 938, 'add', '2024-07-27 09:07:02', '2024-07-27 09:07:02'),
(2153, 943, 940, 'add', '2024-07-27 09:07:02', '2024-07-27 09:07:02'),
(2154, 950, 943, 'add', '2024-07-27 09:07:24', '2024-07-27 09:07:24'),
(2155, 965, 957, 'add', '2024-07-27 09:08:23', '2024-07-27 09:08:23'),
(2156, 965, 959, 'add', '2024-07-27 09:08:23', '2024-07-27 09:08:23'),
(2157, 965, 962, 'add', '2024-07-27 09:08:23', '2024-07-27 09:08:23'),
(2158, 965, 964, 'add', '2024-07-27 09:08:23', '2024-07-27 09:08:23'),
(2159, 967, 965, 'add', '2024-07-27 09:08:37', '2024-07-27 09:08:37'),
(2160, 967, 966, 'add', '2024-07-27 09:08:37', '2024-07-27 09:08:37'),
(2161, 1003, 998, 'add', '2024-07-27 09:10:10', '2024-07-27 09:10:10'),
(2162, 1010, 998, 'add', '2024-07-27 09:10:22', '2024-07-27 09:10:22'),
(2163, 1045, 1041, 'add', '2024-07-27 09:12:29', '2024-07-27 09:12:29'),
(2164, 1048, 1045, 'add', '2024-07-27 09:12:39', '2024-07-27 09:12:39'),
(2165, 1056, 1053, 'add', '2024-07-27 09:13:18', '2024-07-27 09:13:18'),
(2166, 1070, 1067, 'add', '2024-07-27 09:14:06', '2024-07-27 09:14:06'),
(2167, 1074, 1070, 'add', '2024-07-27 09:14:14', '2024-07-27 09:14:14'),
(2168, 452, 446, 'add', '2024-07-27 09:19:53', '2024-07-27 09:19:53'),
(2169, 452, 447, 'add', '2024-07-27 09:19:53', '2024-07-27 09:19:53'),
(2170, 452, 449, 'add', '2024-07-27 09:19:53', '2024-07-27 09:19:53'),
(2171, 452, 450, 'add', '2024-07-27 09:19:53', '2024-07-27 09:19:53'),
(2172, 456, 452, 'add', '2024-07-27 09:20:45', '2024-07-27 09:20:45'),
(2173, 456, 454, 'add', '2024-07-27 09:20:45', '2024-07-27 09:20:45'),
(2174, 462, 459, 'add', '2024-07-27 09:21:58', '2024-07-27 09:21:58'),
(2175, 476, 473, 'add', '2024-07-27 09:24:19', '2024-07-27 09:24:19'),
(2176, 476, 475, 'add', '2024-07-27 09:24:19', '2024-07-27 09:24:19'),
(2177, 484, 480, 'add', '2024-07-27 09:24:47', '2024-07-27 09:24:47'),
(2178, 496, 490, 'add', '2024-07-27 09:29:26', '2024-07-27 09:29:26'),
(2179, 496, 491, 'add', '2024-07-27 09:29:26', '2024-07-27 09:29:26'),
(2180, 496, 492, 'add', '2024-07-27 09:29:26', '2024-07-27 09:29:26'),
(2181, 496, 494, 'add', '2024-07-27 09:29:26', '2024-07-27 09:29:26'),
(2182, 499, 496, 'add', '2024-07-27 09:30:40', '2024-07-27 09:30:40'),
(2183, 499, 498, 'add', '2024-07-27 09:30:40', '2024-07-27 09:30:40'),
(2184, 504, 503, 'add', '2024-07-27 09:31:15', '2024-07-27 09:31:15'),
(2185, 545, 530, 'add', '2024-07-27 09:35:14', '2024-07-27 09:35:14'),
(2186, 545, 533, 'add', '2024-07-27 09:35:14', '2024-07-27 09:35:14'),
(2187, 545, 535, 'add', '2024-07-27 09:35:14', '2024-07-27 09:35:14'),
(2188, 545, 537, 'add', '2024-07-27 09:35:14', '2024-07-27 09:35:14'),
(2189, 553, 552, 'add', '2024-07-27 09:43:02', '2024-07-27 09:43:02'),
(2190, 557, 555, 'add', '2024-07-27 09:46:32', '2024-07-27 09:46:32'),
(2191, 563, 562, 'add', '2024-07-27 09:51:10', '2024-07-27 09:51:10'),
(2195, 1111, 1103, 'add', '2024-07-27 10:02:25', '2024-07-27 10:02:25'),
(2211, 1015, 1006, 'add', '2024-07-28 08:18:37', '2024-07-28 08:18:37'),
(2212, 1015, 1007, 'add', '2024-07-28 08:18:37', '2024-07-28 08:18:37'),
(2213, 1015, 1009, 'add', '2024-07-28 08:18:37', '2024-07-28 08:18:37'),
(2214, 1015, 1012, 'add', '2024-07-28 08:18:37', '2024-07-28 08:18:37'),
(2215, 1026, 1022, 'add', '2024-07-28 08:20:26', '2024-07-28 08:20:26'),
(2216, 1028, 1026, 'add', '2024-07-28 08:20:38', '2024-07-28 08:20:38'),
(2217, 1205, 1198, 'add', '2024-07-28 08:46:30', '2024-07-28 08:46:30'),
(2218, 1205, 1200, 'add', '2024-07-28 08:46:30', '2024-07-28 08:46:30'),
(2219, 1205, 1202, 'add', '2024-07-28 08:46:30', '2024-07-28 08:46:30'),
(2220, 1205, 1203, 'add', '2024-07-28 08:46:30', '2024-07-28 08:46:30'),
(2225, 1100, 1086, 'add', '2024-07-28 09:08:44', '2024-07-28 09:08:44'),
(2226, 1100, 1089, 'add', '2024-07-28 09:08:44', '2024-07-28 09:08:44'),
(2227, 1100, 1092, 'add', '2024-07-28 09:08:44', '2024-07-28 09:08:44'),
(2228, 1100, 1094, 'add', '2024-07-28 09:08:44', '2024-07-28 09:08:44'),
(2229, 1103, 1100, 'add', '2024-07-28 09:10:50', '2024-07-28 09:10:50'),
(2230, 1103, 1101, 'add', '2024-07-28 09:10:50', '2024-07-28 09:10:50'),
(2231, 2373, 1111, 'add', '2024-07-28 09:15:08', '2024-07-28 09:15:08'),
(2238, 2053, 681, 'add', '2024-07-28 09:24:13', '2024-07-28 09:24:13'),
(2239, 1133, 1122, 'add', '2024-07-28 09:26:08', '2024-07-28 09:26:08'),
(2240, 1133, 1123, 'add', '2024-07-28 09:26:08', '2024-07-28 09:26:08'),
(2241, 1133, 1125, 'add', '2024-07-28 09:26:08', '2024-07-28 09:26:08'),
(2242, 1133, 1128, 'add', '2024-07-28 09:26:08', '2024-07-28 09:26:08'),
(2243, 1142, 1133, 'add', '2024-07-28 09:26:24', '2024-07-28 09:26:24'),
(2244, 1142, 1135, 'add', '2024-07-28 09:26:24', '2024-07-28 09:26:24'),
(2245, 1145, 1142, 'add', '2024-07-28 09:26:32', '2024-07-28 09:26:32'),
(2247, 2376, 1145, 'add', '2024-07-28 09:27:36', '2024-07-28 09:27:36'),
(2248, 2377, 2376, 'add', '2024-07-28 09:27:53', '2024-07-28 09:27:53'),
(2249, 2375, 2373, 'add', '2024-07-28 09:28:07', '2024-07-28 09:28:07'),
(2250, 1158, 1148, 'add', '2024-07-28 09:28:37', '2024-07-28 09:28:37'),
(2251, 1158, 1150, 'add', '2024-07-28 09:28:37', '2024-07-28 09:28:37'),
(2252, 1158, 1152, 'add', '2024-07-28 09:28:37', '2024-07-28 09:28:37'),
(2253, 1158, 1154, 'add', '2024-07-28 09:28:37', '2024-07-28 09:28:37'),
(2254, 1166, 1158, 'add', '2024-07-28 09:29:45', '2024-07-28 09:29:45'),
(2255, 1166, 1162, 'add', '2024-07-28 09:29:45', '2024-07-28 09:29:45'),
(2257, 1178, 1166, 'add', '2024-07-28 09:31:02', '2024-07-28 09:31:02'),
(2260, 2379, 578, 'add', '2024-07-28 09:32:08', '2024-07-28 09:32:08'),
(2261, 2380, 1178, 'add', '2024-07-28 09:32:18', '2024-07-28 09:32:18'),
(2262, 2374, 574, 'add', '2024-07-28 09:32:29', '2024-07-28 09:32:29'),
(2263, 2381, 2380, 'add', '2024-07-28 09:32:38', '2024-07-28 09:32:38'),
(2264, 2378, 1166, 'add', '2024-07-28 09:33:25', '2024-07-28 09:33:25'),
(2265, 2382, 1103, 'add', '2024-07-28 09:33:47', '2024-07-28 09:33:47'),
(2266, 574, 569, 'add', '2024-07-28 09:33:53', '2024-07-28 09:33:53'),
(2267, 574, 572, 'add', '2024-07-28 09:33:53', '2024-07-28 09:33:53'),
(2268, 2383, 1142, 'add', '2024-07-28 09:34:08', '2024-07-28 09:34:08'),
(2269, 569, 565, 'add', '2024-07-28 09:34:29', '2024-07-28 09:34:29'),
(2270, 569, 566, 'add', '2024-07-28 09:34:29', '2024-07-28 09:34:29'),
(2271, 569, 567, 'add', '2024-07-28 09:34:29', '2024-07-28 09:34:29'),
(2272, 569, 568, 'add', '2024-07-28 09:34:29', '2024-07-28 09:34:29'),
(2273, 1214, 1188, 'add', '2024-07-28 09:35:02', '2024-07-28 09:35:02'),
(2274, 1214, 1196, 'add', '2024-07-28 09:35:02', '2024-07-28 09:35:02'),
(2275, 1214, 1199, 'add', '2024-07-28 09:35:02', '2024-07-28 09:35:02'),
(2276, 1214, 1212, 'add', '2024-07-28 09:35:02', '2024-07-28 09:35:02'),
(2277, 1219, 1214, 'add', '2024-07-28 09:35:29', '2024-07-28 09:35:29'),
(2278, 1219, 1217, 'add', '2024-07-28 09:35:29', '2024-07-28 09:35:29'),
(2279, 1229, 1219, 'add', '2024-07-28 09:35:35', '2024-07-28 09:35:35'),
(2280, 2384, 1219, 'add', '2024-07-28 09:35:49', '2024-07-28 09:35:49'),
(2281, 2385, 1229, 'add', '2024-07-28 09:36:32', '2024-07-28 09:36:32'),
(2282, 587, 585, 'add', '2024-07-28 09:36:42', '2024-07-28 09:36:42'),
(2283, 2386, 2385, 'add', '2024-07-28 09:36:50', '2024-07-28 09:36:50'),
(2284, 1247, 1238, 'add', '2024-07-28 09:37:35', '2024-07-28 09:37:35'),
(2285, 1247, 1242, 'add', '2024-07-28 09:37:35', '2024-07-28 09:37:35'),
(2286, 1247, 1244, 'add', '2024-07-28 09:37:35', '2024-07-28 09:37:35'),
(2287, 1247, 1246, 'add', '2024-07-28 09:37:35', '2024-07-28 09:37:35'),
(2288, 586, 580, 'add', '2024-07-28 09:37:55', '2024-07-28 09:37:55'),
(2289, 586, 581, 'add', '2024-07-28 09:37:55', '2024-07-28 09:37:55'),
(2290, 586, 582, 'add', '2024-07-28 09:37:55', '2024-07-28 09:37:55'),
(2291, 586, 584, 'add', '2024-07-28 09:37:55', '2024-07-28 09:37:55'),
(2292, 1253, 1247, 'add', '2024-07-28 09:38:04', '2024-07-28 09:38:04'),
(2293, 1253, 1249, 'add', '2024-07-28 09:38:04', '2024-07-28 09:38:04'),
(2294, 1258, 1253, 'add', '2024-07-28 09:38:09', '2024-07-28 09:38:09'),
(2295, 2387, 1253, 'add', '2024-07-28 09:38:22', '2024-07-28 09:38:22'),
(2296, 2388, 1258, 'add', '2024-07-28 09:38:53', '2024-07-28 09:38:53'),
(2297, 2389, 2388, 'add', '2024-07-28 09:39:30', '2024-07-28 09:39:30'),
(2298, 1273, 1266, 'add', '2024-07-28 09:40:10', '2024-07-28 09:40:10'),
(2299, 1273, 1267, 'add', '2024-07-28 09:40:10', '2024-07-28 09:40:10'),
(2300, 1273, 1268, 'add', '2024-07-28 09:40:10', '2024-07-28 09:40:10'),
(2301, 1273, 1269, 'add', '2024-07-28 09:40:10', '2024-07-28 09:40:10'),
(2302, 2390, 589, 'add', '2024-07-28 09:40:13', '2024-07-28 09:40:13'),
(2303, 2391, 595, 'add', '2024-07-28 09:40:38', '2024-07-28 09:40:38'),
(2304, 1275, 1273, 'add', '2024-07-28 09:40:57', '2024-07-28 09:40:57'),
(2305, 1275, 1274, 'add', '2024-07-28 09:40:57', '2024-07-28 09:40:57'),
(2306, 1279, 1275, 'add', '2024-07-28 09:41:04', '2024-07-28 09:41:04'),
(2307, 2392, 1275, 'add', '2024-07-28 09:41:40', '2024-07-28 09:41:40'),
(2308, 2393, 583, 'add', '2024-07-28 09:41:41', '2024-07-28 09:41:41'),
(2309, 2394, 1279, 'add', '2024-07-28 09:41:58', '2024-07-28 09:41:58'),
(2310, 2395, 587, 'add', '2024-07-28 09:42:01', '2024-07-28 09:42:01'),
(2311, 2396, 2394, 'add', '2024-07-28 09:42:19', '2024-07-28 09:42:19'),
(2312, 2397, 589, 'add', '2024-07-28 09:42:43', '2024-07-28 09:42:43'),
(2313, 1297, 1289, 'add', '2024-07-28 09:42:55', '2024-07-28 09:42:55'),
(2314, 1297, 1292, 'add', '2024-07-28 09:42:55', '2024-07-28 09:42:55'),
(2315, 1297, 1294, 'add', '2024-07-28 09:42:55', '2024-07-28 09:42:55'),
(2316, 1297, 1295, 'add', '2024-07-28 09:42:55', '2024-07-28 09:42:55'),
(2317, 2398, 595, 'add', '2024-07-28 09:42:57', '2024-07-28 09:42:57'),
(2318, 1302, 1297, 'add', '2024-07-28 09:43:07', '2024-07-28 09:43:07'),
(2319, 1302, 1299, 'add', '2024-07-28 09:43:07', '2024-07-28 09:43:07'),
(2320, 2399, 1302, 'add', '2024-07-28 09:43:21', '2024-07-28 09:43:21'),
(2321, 2400, 1312, 'add', '2024-07-28 09:43:53', '2024-07-28 09:43:53'),
(2322, 597, 590, 'add', '2024-07-28 09:44:39', '2024-07-28 09:44:39'),
(2323, 597, 592, 'add', '2024-07-28 09:44:39', '2024-07-28 09:44:39'),
(2324, 597, 593, 'add', '2024-07-28 09:44:39', '2024-07-28 09:44:39'),
(2325, 597, 594, 'add', '2024-07-28 09:44:39', '2024-07-28 09:44:39'),
(2326, 2401, 2400, 'add', '2024-07-28 09:44:49', '2024-07-28 09:44:49'),
(2327, 1336, 1319, 'add', '2024-07-28 09:45:40', '2024-07-28 09:45:40'),
(2328, 1336, 1328, 'add', '2024-07-28 09:45:40', '2024-07-28 09:45:40'),
(2329, 1336, 1330, 'add', '2024-07-28 09:45:40', '2024-07-28 09:45:40'),
(2330, 1336, 1333, 'add', '2024-07-28 09:45:40', '2024-07-28 09:45:40'),
(2331, 1343, 1336, 'add', '2024-07-28 09:46:00', '2024-07-28 09:46:00'),
(2332, 1343, 1339, 'add', '2024-07-28 09:46:00', '2024-07-28 09:46:00'),
(2333, 1350, 1343, 'add', '2024-07-28 09:46:08', '2024-07-28 09:46:08'),
(2334, 602, 597, 'add', '2024-07-28 09:46:17', '2024-07-28 09:46:17'),
(2335, 602, 600, 'add', '2024-07-28 09:46:17', '2024-07-28 09:46:17'),
(2336, 2402, 1343, 'add', '2024-07-28 09:46:26', '2024-07-28 09:46:26'),
(2337, 2403, 1350, 'add', '2024-07-28 09:46:46', '2024-07-28 09:46:46'),
(2338, 2404, 2403, 'add', '2024-07-28 09:46:59', '2024-07-28 09:46:59'),
(2339, 605, 602, 'add', '2024-07-28 09:47:26', '2024-07-28 09:47:26'),
(2340, 607, 605, 'add', '2024-07-28 09:47:48', '2024-07-28 09:47:48'),
(2341, 2405, 602, 'add', '2024-07-28 09:48:07', '2024-07-28 09:48:07'),
(2342, 1372, 1360, 'add', '2024-07-28 09:48:30', '2024-07-28 09:48:30'),
(2343, 1372, 1363, 'add', '2024-07-28 09:48:30', '2024-07-28 09:48:30'),
(2344, 1372, 1366, 'add', '2024-07-28 09:48:30', '2024-07-28 09:48:30'),
(2345, 1372, 1369, 'add', '2024-07-28 09:48:30', '2024-07-28 09:48:30'),
(2346, 2406, 607, 'add', '2024-07-28 09:48:32', '2024-07-28 09:48:32'),
(2347, 1378, 1372, 'add', '2024-07-28 09:48:43', '2024-07-28 09:48:43'),
(2348, 1378, 1375, 'add', '2024-07-28 09:48:43', '2024-07-28 09:48:43'),
(2349, 1383, 1378, 'add', '2024-07-28 09:48:53', '2024-07-28 09:48:53'),
(2350, 2407, 1378, 'add', '2024-07-28 09:49:22', '2024-07-28 09:49:22'),
(2351, 603, 596, 'add', '2024-07-28 09:49:33', '2024-07-28 09:49:33'),
(2352, 603, 598, 'add', '2024-07-28 09:49:33', '2024-07-28 09:49:33'),
(2353, 603, 599, 'add', '2024-07-28 09:49:33', '2024-07-28 09:49:33'),
(2354, 603, 601, 'add', '2024-07-28 09:49:33', '2024-07-28 09:49:33'),
(2355, 2408, 1383, 'add', '2024-07-28 09:49:45', '2024-07-28 09:49:45'),
(2356, 2409, 2408, 'add', '2024-07-28 09:49:58', '2024-07-28 09:49:58'),
(2357, 1397, 1390, 'add', '2024-07-28 09:50:43', '2024-07-28 09:50:43'),
(2358, 1397, 1393, 'add', '2024-07-28 09:50:43', '2024-07-28 09:50:43'),
(2359, 1397, 1394, 'add', '2024-07-28 09:50:43', '2024-07-28 09:50:43'),
(2360, 1397, 1396, 'add', '2024-07-28 09:50:43', '2024-07-28 09:50:43'),
(2361, 609, 608, 'add', '2024-07-28 09:50:53', '2024-07-28 09:50:53'),
(2362, 1399, 1397, 'add', '2024-07-28 09:51:01', '2024-07-28 09:51:01'),
(2363, 1399, 1398, 'add', '2024-07-28 09:51:01', '2024-07-28 09:51:01'),
(2364, 1401, 1399, 'add', '2024-07-28 09:51:08', '2024-07-28 09:51:08'),
(2365, 2410, 606, 'add', '2024-07-28 09:51:11', '2024-07-28 09:51:11'),
(2366, 2411, 1399, 'add', '2024-07-28 09:51:22', '2024-07-28 09:51:22'),
(2367, 2412, 609, 'add', '2024-07-28 09:51:27', '2024-07-28 09:51:27'),
(2368, 2413, 1401, 'add', '2024-07-28 09:51:42', '2024-07-28 09:51:42'),
(2369, 2414, 2413, 'add', '2024-07-28 09:51:55', '2024-07-28 09:51:55'),
(2370, 622, 611, 'add', '2024-07-28 09:53:29', '2024-07-28 09:53:29'),
(2371, 622, 614, 'add', '2024-07-28 09:53:29', '2024-07-28 09:53:29'),
(2372, 622, 616, 'add', '2024-07-28 09:53:29', '2024-07-28 09:53:29'),
(2373, 622, 620, 'add', '2024-07-28 09:53:29', '2024-07-28 09:53:29'),
(2374, 1406, 1404, 'add', '2024-07-28 09:56:06', '2024-07-28 09:56:06'),
(2375, 2415, 1404, 'add', '2024-07-28 09:56:30', '2024-07-28 09:56:30'),
(2376, 2416, 1406, 'add', '2024-07-28 09:58:30', '2024-07-28 09:58:30'),
(2377, 2417, 2416, 'add', '2024-07-28 09:58:54', '2024-07-28 09:58:54'),
(2378, 626, 622, 'add', '2024-07-28 09:59:00', '2024-07-28 09:59:00'),
(2379, 626, 624, 'add', '2024-07-28 09:59:00', '2024-07-28 09:59:00'),
(2380, 630, 626, 'add', '2024-07-28 10:00:12', '2024-07-28 10:00:12'),
(2381, 1411, 1409, 'add', '2024-07-28 10:00:29', '2024-07-28 10:00:29'),
(2382, 632, 630, 'add', '2024-07-28 10:00:35', '2024-07-28 10:00:35'),
(2383, 2418, 1409, 'add', '2024-07-28 10:00:43', '2024-07-28 10:00:43'),
(2385, 2419, 626, 'add', '2024-07-28 10:01:02', '2024-07-28 10:01:02'),
(2386, 2420, 1411, 'add', '2024-07-28 10:01:04', '2024-07-28 10:01:04'),
(2387, 2421, 632, 'add', '2024-07-28 10:01:18', '2024-07-28 10:01:18'),
(2388, 2422, 2420, 'add', '2024-07-28 10:01:19', '2024-07-28 10:01:19'),
(2389, 1416, 1414, 'add', '2024-07-28 10:01:51', '2024-07-28 10:01:51'),
(2390, 2423, 1414, 'add', '2024-07-28 10:02:02', '2024-07-28 10:02:02'),
(2391, 2424, 1416, 'add', '2024-07-28 10:02:26', '2024-07-28 10:02:26'),
(2392, 2425, 2424, 'add', '2024-07-28 10:02:41', '2024-07-28 10:02:41'),
(2393, 625, 623, 'add', '2024-07-28 10:03:22', '2024-07-28 10:03:22'),
(2395, 2427, 625, 'add', '2024-07-28 10:03:57', '2024-07-28 10:03:57'),
(2396, 2426, 621, 'add', '2024-07-28 10:04:04', '2024-07-28 10:04:04'),
(2397, 637, 636, 'add', '2024-07-28 10:05:25', '2024-07-28 10:05:25'),
(2398, 2428, 635, 'add', '2024-07-28 10:05:44', '2024-07-28 10:05:44'),
(2399, 2429, 637, 'add', '2024-07-28 10:06:05', '2024-07-28 10:06:05'),
(2400, 1421, 1419, 'add', '2024-07-28 10:07:04', '2024-07-28 10:07:04'),
(2401, 651, 643, 'add', '2024-07-28 10:07:11', '2024-07-28 10:07:11'),
(2402, 651, 645, 'add', '2024-07-28 10:07:11', '2024-07-28 10:07:11'),
(2403, 651, 647, 'add', '2024-07-28 10:07:11', '2024-07-28 10:07:11'),
(2404, 651, 648, 'add', '2024-07-28 10:07:11', '2024-07-28 10:07:11'),
(2405, 2430, 1419, 'add', '2024-07-28 10:07:25', '2024-07-28 10:07:25'),
(2408, 2431, 1421, 'add', '2024-07-28 10:07:46', '2024-07-28 10:07:46'),
(2409, 656, 654, 'add', '2024-07-28 10:07:59', '2024-07-28 10:07:59'),
(2410, 656, 651, 'add', '2024-07-28 10:07:59', '2024-07-28 10:07:59'),
(2411, 2432, 2431, 'add', '2024-07-28 10:08:04', '2024-07-28 10:08:04'),
(2413, 659, 656, 'add', '2024-07-28 10:08:43', '2024-07-28 10:08:43'),
(2414, 661, 659, 'add', '2024-07-28 10:08:58', '2024-07-28 10:08:58'),
(2415, 2433, 656, 'add', '2024-07-28 10:09:19', '2024-07-28 10:09:19'),
(2416, 2434, 661, 'add', '2024-07-28 10:09:38', '2024-07-28 10:09:38'),
(2417, 642, 638, 'add', '2024-07-28 10:10:48', '2024-07-28 10:10:48'),
(2418, 642, 639, 'add', '2024-07-28 10:10:48', '2024-07-28 10:10:48'),
(2419, 642, 640, 'add', '2024-07-28 10:10:48', '2024-07-28 10:10:48'),
(2420, 642, 641, 'add', '2024-07-28 10:10:48', '2024-07-28 10:10:48'),
(2421, 1551, 1547, 'add', '2024-07-28 10:11:19', '2024-07-28 10:11:19'),
(2422, 1551, 1548, 'add', '2024-07-28 10:11:19', '2024-07-28 10:11:19'),
(2423, 1551, 1549, 'add', '2024-07-28 10:11:19', '2024-07-28 10:11:19'),
(2424, 1551, 1550, 'add', '2024-07-28 10:11:19', '2024-07-28 10:11:19'),
(2425, 2435, 1553, 'add', '2024-07-28 10:13:18', '2024-07-28 10:13:18'),
(2426, 650, 649, 'add', '2024-07-28 10:13:30', '2024-07-28 10:13:30'),
(2428, 2436, 646, 'add', '2024-07-28 10:14:06', '2024-07-28 10:14:06'),
(2429, 1566, 1558, 'add', '2024-07-28 10:14:06', '2024-07-28 10:14:06'),
(2430, 1566, 1560, 'add', '2024-07-28 10:14:06', '2024-07-28 10:14:06'),
(2431, 1566, 1563, 'add', '2024-07-28 10:14:06', '2024-07-28 10:14:06'),
(2432, 1566, 1565, 'add', '2024-07-28 10:14:06', '2024-07-28 10:14:06'),
(2433, 1570, 1566, 'add', '2024-07-28 10:14:28', '2024-07-28 10:14:28'),
(2434, 1570, 1568, 'add', '2024-07-28 10:14:28', '2024-07-28 10:14:28'),
(2435, 2437, 650, 'add', '2024-07-28 10:14:46', '2024-07-28 10:14:46'),
(2436, 2438, 1570, 'add', '2024-07-28 10:15:15', '2024-07-28 10:15:15'),
(2437, 2439, 652, 'add', '2024-07-28 10:15:57', '2024-07-28 10:15:57'),
(2438, 1569, 1567, 'add', '2024-07-28 10:17:05', '2024-07-28 10:17:05'),
(2439, 2440, 655, 'add', '2024-07-28 10:17:25', '2024-07-28 10:17:25'),
(2440, 2441, 1567, 'add', '2024-07-28 10:17:53', '2024-07-28 10:17:53'),
(2441, 660, 658, 'add', '2024-07-28 10:18:24', '2024-07-28 10:18:24'),
(2442, 2442, 657, 'add', '2024-07-28 10:19:05', '2024-07-28 10:19:05'),
(2443, 2443, 660, 'add', '2024-07-28 10:19:24', '2024-07-28 10:19:24'),
(2444, 1584, 1580, 'add', '2024-07-28 10:19:56', '2024-07-28 10:19:56'),
(2445, 1584, 1582, 'add', '2024-07-28 10:19:56', '2024-07-28 10:19:56'),
(2446, 2444, 662, 'add', '2024-07-28 10:20:03', '2024-07-28 10:20:03'),
(2447, 2445, 664, 'add', '2024-07-28 10:20:17', '2024-07-28 10:20:17'),
(2448, 664, 663, 'add', '2024-07-28 10:20:26', '2024-07-28 10:20:26'),
(2449, 2446, 1584, 'add', '2024-07-28 10:20:27', '2024-07-28 10:20:27'),
(2450, 670, 665, 'add', '2024-07-28 10:21:14', '2024-07-28 10:21:14'),
(2451, 670, 666, 'add', '2024-07-28 10:21:14', '2024-07-28 10:21:14'),
(2452, 670, 667, 'add', '2024-07-28 10:21:14', '2024-07-28 10:21:14'),
(2453, 670, 668, 'add', '2024-07-28 10:21:14', '2024-07-28 10:21:14'),
(2454, 676, 670, 'add', '2024-07-28 10:22:05', '2024-07-28 10:22:05'),
(2455, 676, 673, 'add', '2024-07-28 10:22:05', '2024-07-28 10:22:05'),
(2456, 679, 676, 'add', '2024-07-28 10:22:39', '2024-07-28 10:22:39'),
(2457, 2447, 1598, 'add', '2024-07-28 10:22:48', '2024-07-28 10:22:48'),
(2458, 681, 679, 'add', '2024-07-28 10:23:05', '2024-07-28 10:23:05'),
(2463, 2448, 676, 'add', '2024-07-28 10:23:43', '2024-07-28 10:23:43'),
(2464, 1593, 1585, 'add', '2024-07-28 10:24:00', '2024-07-28 10:24:00'),
(2465, 1593, 1587, 'add', '2024-07-28 10:24:00', '2024-07-28 10:24:00'),
(2467, 1597, 1595, 'add', '2024-07-28 10:25:52', '2024-07-28 10:25:52'),
(2468, 2449, 1593, 'add', '2024-07-28 10:26:21', '2024-07-28 10:26:21'),
(2469, 678, 675, 'add', '2024-07-28 10:26:29', '2024-07-28 10:26:29'),
(2470, 678, 677, 'add', '2024-07-28 10:26:29', '2024-07-28 10:26:29'),
(2471, 680, 678, 'add', '2024-07-28 10:26:56', '2024-07-28 10:26:56'),
(2472, 682, 680, 'add', '2024-07-28 10:27:14', '2024-07-28 10:27:14'),
(2473, 2450, 678, 'add', '2024-07-28 10:27:46', '2024-07-28 10:27:46'),
(2474, 1585, 1576, 'add', '2024-07-28 10:27:48', '2024-07-28 10:27:48'),
(2475, 1585, 1579, 'add', '2024-07-28 10:27:48', '2024-07-28 10:27:48'),
(2476, 1585, 1581, 'add', '2024-07-28 10:27:48', '2024-07-28 10:27:48'),
(2477, 1585, 1583, 'add', '2024-07-28 10:27:48', '2024-07-28 10:27:48'),
(2478, 1614, 1601, 'add', '2024-07-28 10:29:13', '2024-07-28 10:29:13'),
(2479, 1614, 1602, 'add', '2024-07-28 10:29:13', '2024-07-28 10:29:13'),
(2480, 1614, 1610, 'add', '2024-07-28 10:29:13', '2024-07-28 10:29:13'),
(2481, 1614, 1612, 'add', '2024-07-28 10:29:13', '2024-07-28 10:29:13'),
(2482, 706, 704, 'add', '2024-07-28 10:29:24', '2024-07-28 10:29:24'),
(2483, 2055, 706, 'add', '2024-07-28 10:29:33', '2024-07-28 10:29:33'),
(2484, 1618, 1614, 'add', '2024-07-28 10:29:47', '2024-07-28 10:29:47'),
(2485, 1618, 1616, 'add', '2024-07-28 10:29:47', '2024-07-28 10:29:47'),
(2486, 2451, 702, 'add', '2024-07-28 10:29:55', '2024-07-28 10:29:55'),
(2487, 690, 683, 'add', '2024-07-28 10:30:25', '2024-07-28 10:30:25'),
(2488, 690, 684, 'add', '2024-07-28 10:30:25', '2024-07-28 10:30:25'),
(2489, 690, 685, 'add', '2024-07-28 10:30:25', '2024-07-28 10:30:25'),
(2490, 690, 686, 'add', '2024-07-28 10:30:25', '2024-07-28 10:30:25'),
(2491, 2452, 1618, 'add', '2024-07-28 10:30:33', '2024-07-28 10:30:33'),
(2492, 696, 694, 'add', '2024-07-28 10:31:02', '2024-07-28 10:31:02'),
(2493, 2057, 696, 'add', '2024-07-28 10:31:12', '2024-07-28 10:31:12'),
(2494, 2453, 693, 'add', '2024-07-28 10:31:30', '2024-07-28 10:31:30'),
(2495, 2454, 1609, 'add', '2024-07-28 10:31:42', '2024-07-28 10:31:42'),
(2496, 707, 703, 'add', '2024-07-28 10:32:22', '2024-07-28 10:32:22'),
(2497, 707, 705, 'add', '2024-07-28 10:32:22', '2024-07-28 10:32:22'),
(2498, 709, 707, 'add', '2024-07-28 10:32:29', '2024-07-28 10:32:29'),
(2499, 711, 709, 'add', '2024-07-28 10:32:40', '2024-07-28 10:32:40'),
(2500, 2059, 711, 'add', '2024-07-28 10:32:48', '2024-07-28 10:32:48'),
(2501, 2455, 1629, 'add', '2024-07-28 10:32:51', '2024-07-28 10:32:51'),
(2502, 2456, 707, 'add', '2024-07-28 10:33:07', '2024-07-28 10:33:07'),
(2503, 1632, 1622, 'add', '2024-07-28 10:33:40', '2024-07-28 10:33:40'),
(2504, 1632, 1623, 'add', '2024-07-28 10:33:40', '2024-07-28 10:33:40'),
(2505, 1632, 1624, 'add', '2024-07-28 10:33:40', '2024-07-28 10:33:40'),
(2506, 1632, 1626, 'add', '2024-07-28 10:33:40', '2024-07-28 10:33:40'),
(2507, 1637, 1632, 'add', '2024-07-28 10:33:58', '2024-07-28 10:33:58'),
(2508, 1637, 1634, 'add', '2024-07-28 10:33:58', '2024-07-28 10:33:58'),
(2509, 2457, 1637, 'add', '2024-07-28 10:35:02', '2024-07-28 10:35:02'),
(2510, 716, 708, 'add', '2024-07-28 10:35:02', '2024-07-28 10:35:02'),
(2511, 716, 710, 'add', '2024-07-28 10:35:02', '2024-07-28 10:35:02'),
(2512, 716, 712, 'add', '2024-07-28 10:35:02', '2024-07-28 10:35:02'),
(2513, 716, 713, 'add', '2024-07-28 10:35:02', '2024-07-28 10:35:02'),
(2514, 722, 716, 'add', '2024-07-28 10:36:18', '2024-07-28 10:36:18'),
(2515, 722, 719, 'add', '2024-07-28 10:36:18', '2024-07-28 10:36:18'),
(2516, 723, 722, 'add', '2024-07-28 10:36:28', '2024-07-28 10:36:28'),
(2517, 2458, 1644, 'add', '2024-07-28 10:36:39', '2024-07-28 10:36:39'),
(2518, 725, 723, 'add', '2024-07-28 10:36:47', '2024-07-28 10:36:47'),
(2519, 2459, 722, 'add', '2024-07-28 10:37:12', '2024-07-28 10:37:12'),
(2520, 1645, 1643, 'add', '2024-07-28 10:37:56', '2024-07-28 10:37:56'),
(2521, 720, 714, 'add', '2024-07-28 10:37:59', '2024-07-28 10:37:59'),
(2522, 720, 715, 'add', '2024-07-28 10:37:59', '2024-07-28 10:37:59'),
(2523, 720, 717, 'add', '2024-07-28 10:37:59', '2024-07-28 10:37:59'),
(2524, 720, 718, 'add', '2024-07-28 10:37:59', '2024-07-28 10:37:59'),
(2525, 1647, 1645, 'add', '2024-07-28 10:38:40', '2024-07-28 10:38:40'),
(2526, 2460, 1643, 'add', '2024-07-28 10:38:57', '2024-07-28 10:38:57'),
(2527, 2461, 1650, 'add', '2024-07-28 10:39:14', '2024-07-28 10:39:14'),
(2528, 727, 724, 'add', '2024-07-28 10:39:29', '2024-07-28 10:39:29'),
(2529, 1651, 1650, 'add', '2024-07-28 10:39:36', '2024-07-28 10:39:36'),
(2530, 2462, 724, 'add', '2024-07-28 10:39:47', '2024-07-28 10:39:47'),
(2531, 1653, 1651, 'add', '2024-07-28 10:39:51', '2024-07-28 10:39:51'),
(2536, 2463, 1649, 'add', '2024-07-28 10:41:10', '2024-07-28 10:41:10'),
(2539, 2464, 745, 'add', '2024-07-28 10:42:26', '2024-07-28 10:42:26'),
(2541, 992, 982, 'add', '2024-07-28 10:43:34', '2024-07-28 10:43:34'),
(2542, 992, 983, 'add', '2024-07-28 10:43:34', '2024-07-28 10:43:34'),
(2543, 992, 987, 'add', '2024-07-28 10:43:34', '2024-07-28 10:43:34'),
(2544, 992, 989, 'add', '2024-07-28 10:43:34', '2024-07-28 10:43:34'),
(2545, 996, 992, 'add', '2024-07-28 10:44:20', '2024-07-28 10:44:20'),
(2546, 996, 993, 'add', '2024-07-28 10:44:20', '2024-07-28 10:44:20'),
(2548, 738, 729, 'add', '2024-07-28 10:45:07', '2024-07-28 10:45:07'),
(2549, 738, 732, 'add', '2024-07-28 10:45:07', '2024-07-28 10:45:07'),
(2550, 738, 734, 'add', '2024-07-28 10:45:07', '2024-07-28 10:45:07'),
(2551, 738, 736, 'add', '2024-07-28 10:45:07', '2024-07-28 10:45:07'),
(2552, 1018, 1005, 'add', '2024-07-28 10:45:38', '2024-07-28 10:45:38'),
(2553, 1018, 1008, 'add', '2024-07-28 10:45:38', '2024-07-28 10:45:38'),
(2554, 1018, 1011, 'add', '2024-07-28 10:45:38', '2024-07-28 10:45:38'),
(2555, 1018, 1014, 'add', '2024-07-28 10:45:38', '2024-07-28 10:45:38'),
(2556, 745, 738, 'add', '2024-07-28 10:45:43', '2024-07-28 10:45:43'),
(2557, 745, 742, 'add', '2024-07-28 10:45:43', '2024-07-28 10:45:43'),
(2558, 1034, 1018, 'add', '2024-07-28 10:45:55', '2024-07-28 10:45:55');
INSERT INTO `part_operations` (`id`, `part_id`, `operand_part_id`, `operation`, `created_at`, `updated_at`) VALUES
(2559, 1034, 1024, 'add', '2024-07-28 10:45:55', '2024-07-28 10:45:55'),
(2560, 749, 747, 'add', '2024-07-28 10:45:55', '2024-07-28 10:45:55'),
(2561, 2465, 739, 'add', '2024-07-28 10:46:30', '2024-07-28 10:46:30'),
(2562, 741, 740, 'add', '2024-07-28 10:47:15', '2024-07-28 10:47:15'),
(2567, 759, 751, 'add', '2024-07-28 10:48:16', '2024-07-28 10:48:16'),
(2568, 759, 753, 'add', '2024-07-28 10:48:16', '2024-07-28 10:48:16'),
(2569, 759, 755, 'add', '2024-07-28 10:48:16', '2024-07-28 10:48:16'),
(2570, 759, 756, 'add', '2024-07-28 10:48:16', '2024-07-28 10:48:16'),
(2571, 1082, 1071, 'add', '2024-07-28 10:48:24', '2024-07-28 10:48:24'),
(2572, 1082, 1072, 'add', '2024-07-28 10:48:24', '2024-07-28 10:48:24'),
(2573, 1082, 1075, 'add', '2024-07-28 10:48:24', '2024-07-28 10:48:24'),
(2574, 1082, 1078, 'add', '2024-07-28 10:48:24', '2024-07-28 10:48:24'),
(2575, 767, 766, 'add', '2024-07-28 10:48:55', '2024-07-28 10:48:55'),
(2576, 1087, 1082, 'add', '2024-07-28 10:49:18', '2024-07-28 10:49:18'),
(2577, 1087, 1084, 'add', '2024-07-28 10:49:18', '2024-07-28 10:49:18'),
(2578, 2466, 764, 'add', '2024-07-28 10:49:24', '2024-07-28 10:49:24'),
(2579, 1096, 1091, 'add', '2024-07-28 10:49:35', '2024-07-28 10:49:35'),
(2581, 1110, 1098, 'add', '2024-07-28 10:50:10', '2024-07-28 10:50:10'),
(2582, 1110, 1102, 'add', '2024-07-28 10:50:10', '2024-07-28 10:50:10'),
(2583, 1110, 1104, 'add', '2024-07-28 10:50:10', '2024-07-28 10:50:10'),
(2584, 1110, 1107, 'add', '2024-07-28 10:50:10', '2024-07-28 10:50:10'),
(2586, 2468, 765, 'add', '2024-07-28 10:50:34', '2024-07-28 10:50:34'),
(2587, 2072, 770, 'add', '2024-07-28 10:50:46', '2024-07-28 10:50:46'),
(2588, 1116, 1110, 'add', '2024-07-28 10:50:48', '2024-07-28 10:50:48'),
(2589, 1116, 1113, 'add', '2024-07-28 10:50:48', '2024-07-28 10:50:48'),
(2590, 2467, 761, 'add', '2024-07-28 10:51:00', '2024-07-28 10:51:00'),
(2591, 1121, 1119, 'add', '2024-07-28 10:51:05', '2024-07-28 10:51:05'),
(2592, 1004, 1002, 'add', '2024-07-28 10:51:20', '2024-07-28 10:51:20'),
(2593, 2469, 769, 'add', '2024-07-28 10:51:25', '2024-07-28 10:51:25'),
(2594, 1137, 1124, 'add', '2024-07-28 10:52:05', '2024-07-28 10:52:05'),
(2595, 1137, 1126, 'add', '2024-07-28 10:52:05', '2024-07-28 10:52:05'),
(2596, 1137, 1129, 'add', '2024-07-28 10:52:05', '2024-07-28 10:52:05'),
(2597, 1137, 1136, 'add', '2024-07-28 10:52:05', '2024-07-28 10:52:05'),
(2598, 1160, 1137, 'add', '2024-07-28 10:52:25', '2024-07-28 10:52:25'),
(2599, 1160, 1157, 'add', '2024-07-28 10:52:25', '2024-07-28 10:52:25'),
(2604, 1176, 1172, 'add', '2024-07-28 10:52:42', '2024-07-28 10:52:42'),
(2605, 1438, 1434, 'add', '2024-07-28 10:53:05', '2024-07-28 10:53:05'),
(2606, 1438, 1435, 'add', '2024-07-28 10:53:05', '2024-07-28 10:53:05'),
(2607, 1201, 1187, 'add', '2024-07-28 10:53:11', '2024-07-28 10:53:11'),
(2608, 1201, 1189, 'add', '2024-07-28 10:53:11', '2024-07-28 10:53:11'),
(2609, 1201, 1191, 'add', '2024-07-28 10:53:11', '2024-07-28 10:53:11'),
(2610, 1201, 1193, 'add', '2024-07-28 10:53:11', '2024-07-28 10:53:11'),
(2611, 1440, 1438, 'add', '2024-07-28 10:53:15', '2024-07-28 10:53:15'),
(2612, 1206, 1201, 'add', '2024-07-28 10:53:35', '2024-07-28 10:53:35'),
(2613, 1206, 1204, 'add', '2024-07-28 10:53:35', '2024-07-28 10:53:35'),
(2615, 1211, 1209, 'add', '2024-07-28 10:53:50', '2024-07-28 10:53:50'),
(2616, 2470, 1438, 'add', '2024-07-28 10:54:00', '2024-07-28 10:54:00'),
(2617, 1251, 1227, 'add', '2024-07-28 10:54:56', '2024-07-28 10:54:56'),
(2618, 1251, 1231, 'add', '2024-07-28 10:54:56', '2024-07-28 10:54:56'),
(2619, 1251, 1235, 'add', '2024-07-28 10:54:56', '2024-07-28 10:54:56'),
(2620, 1251, 1239, 'add', '2024-07-28 10:54:56', '2024-07-28 10:54:56'),
(2621, 1431, 1424, 'add', '2024-07-28 10:55:23', '2024-07-28 10:55:23'),
(2622, 1431, 1425, 'add', '2024-07-28 10:55:23', '2024-07-28 10:55:23'),
(2623, 1431, 1426, 'add', '2024-07-28 10:55:23', '2024-07-28 10:55:23'),
(2624, 1431, 1428, 'add', '2024-07-28 10:55:23', '2024-07-28 10:55:23'),
(2625, 1255, 1251, 'add', '2024-07-28 10:55:33', '2024-07-28 10:55:33'),
(2626, 1255, 1262, 'add', '2024-07-28 10:55:33', '2024-07-28 10:55:33'),
(2627, 1272, 1270, 'add', '2024-07-28 10:56:16', '2024-07-28 10:56:16'),
(2628, 2086, 1298, 'add', '2024-07-28 10:58:03', '2024-07-28 10:58:03'),
(2629, 1296, 1281, 'add', '2024-07-28 10:58:34', '2024-07-28 10:58:34'),
(2630, 1296, 1285, 'add', '2024-07-28 10:58:34', '2024-07-28 10:58:34'),
(2631, 1296, 1288, 'add', '2024-07-28 10:58:34', '2024-07-28 10:58:34'),
(2632, 1296, 1290, 'add', '2024-07-28 10:58:34', '2024-07-28 10:58:34'),
(2633, 1306, 1296, 'add', '2024-07-28 10:58:52', '2024-07-28 10:58:52'),
(2634, 1306, 1300, 'add', '2024-07-28 10:58:52', '2024-07-28 10:58:52'),
(2635, 1310, 1308, 'add', '2024-07-28 10:59:09', '2024-07-28 10:59:09'),
(2636, 1326, 1318, 'add', '2024-07-28 11:00:54', '2024-07-28 11:00:54'),
(2637, 1326, 1320, 'add', '2024-07-28 11:00:54', '2024-07-28 11:00:54'),
(2638, 1326, 1321, 'add', '2024-07-28 11:00:54', '2024-07-28 11:00:54'),
(2639, 1326, 1323, 'add', '2024-07-28 11:00:54', '2024-07-28 11:00:54'),
(2640, 1345, 1326, 'add', '2024-07-28 11:01:11', '2024-07-28 11:01:11'),
(2641, 1345, 1338, 'add', '2024-07-28 11:01:11', '2024-07-28 11:01:11'),
(2642, 1347, 1345, 'add', '2024-07-28 11:01:23', '2024-07-28 11:01:23'),
(2643, 1351, 1347, 'add', '2024-07-28 11:01:35', '2024-07-28 11:01:35'),
(2644, 1374, 1357, 'add', '2024-07-28 11:04:31', '2024-07-28 11:04:31'),
(2645, 1374, 1365, 'add', '2024-07-28 11:04:31', '2024-07-28 11:04:31'),
(2646, 1374, 1367, 'add', '2024-07-28 11:04:31', '2024-07-28 11:04:31'),
(2647, 1374, 1371, 'add', '2024-07-28 11:04:31', '2024-07-28 11:04:31'),
(2648, 1380, 1374, 'add', '2024-07-28 11:04:45', '2024-07-28 11:04:45'),
(2649, 1380, 1377, 'add', '2024-07-28 11:04:45', '2024-07-28 11:04:45'),
(2650, 1384, 1382, 'add', '2024-07-28 11:05:42', '2024-07-28 11:05:42'),
(2651, 2471, 1379, 'add', '2024-07-28 11:10:34', '2024-07-28 11:10:34'),
(2652, 1395, 1391, 'add', '2024-07-28 11:11:44', '2024-07-28 11:11:44'),
(2653, 1663, 1662, 'add', '2024-07-28 11:13:12', '2024-07-28 11:13:12'),
(2654, 1672, 1671, 'add', '2024-07-28 11:14:10', '2024-07-28 11:14:10'),
(2655, 1681, 1680, 'add', '2024-07-28 11:15:06', '2024-07-28 11:15:06'),
(2656, 1690, 1689, 'add', '2024-07-28 11:16:03', '2024-07-28 11:16:03'),
(2657, 1695, 1691, 'add', '2024-07-28 11:16:54', '2024-07-28 11:16:54'),
(2658, 1695, 1692, 'add', '2024-07-28 11:16:54', '2024-07-28 11:16:54'),
(2659, 1695, 1693, 'add', '2024-07-28 11:16:54', '2024-07-28 11:16:54'),
(2660, 1695, 1694, 'add', '2024-07-28 11:16:54', '2024-07-28 11:16:54'),
(2661, 1699, 1698, 'add', '2024-07-28 11:17:16', '2024-07-28 11:17:16'),
(2662, 1706, 1704, 'add', '2024-07-28 11:18:27', '2024-07-28 11:18:27'),
(2663, 1706, 1705, 'add', '2024-07-28 11:18:27', '2024-07-28 11:18:27'),
(2664, 1718, 1717, 'add', '2024-07-28 11:20:07', '2024-07-28 11:20:07'),
(2665, 1727, 1726, 'add', '2024-07-28 11:21:20', '2024-07-28 11:21:20'),
(2666, 1734, 1732, 'add', '2024-07-28 11:22:28', '2024-07-28 11:22:28'),
(2667, 1734, 1733, 'add', '2024-07-28 11:22:28', '2024-07-28 11:22:28'),
(2668, 1736, 1735, 'add', '2024-07-28 11:22:42', '2024-07-28 11:22:42'),
(2669, 1745, 1744, 'add', '2024-07-28 11:23:38', '2024-07-28 11:23:38'),
(2670, 1752, 1750, 'add', '2024-07-28 11:24:53', '2024-07-28 11:24:53'),
(2671, 1752, 1751, 'add', '2024-07-28 11:24:53', '2024-07-28 11:24:53'),
(2672, 1763, 1762, 'add', '2024-07-28 11:26:24', '2024-07-28 11:26:24'),
(2673, 1772, 1771, 'add', '2024-07-28 11:27:35', '2024-07-28 11:27:35'),
(2674, 1781, 1780, 'add', '2024-07-28 11:28:42', '2024-07-28 11:28:42'),
(2675, 1790, 1789, 'add', '2024-07-28 11:29:33', '2024-07-28 11:29:33'),
(2676, 1792, 1791, 'add', '2024-07-28 11:29:58', '2024-07-28 11:29:58'),
(2678, 1793, 1792, 'add', '2024-07-28 11:30:49', '2024-07-28 11:30:49'),
(2679, 1795, 1794, 'add', '2024-07-28 11:31:22', '2024-07-28 11:31:22'),
(2684, 2046, 2038, 'add', '2024-07-29 07:51:45', '2024-07-29 07:51:45'),
(2685, 2046, 2043, 'add', '2024-07-29 07:51:45', '2024-07-29 07:51:45'),
(2686, 2046, 2044, 'add', '2024-07-29 07:51:45', '2024-07-29 07:51:45'),
(2687, 2046, 2045, 'add', '2024-07-29 07:51:45', '2024-07-29 07:51:45'),
(2688, 2473, 2046, 'add', '2024-07-29 07:53:19', '2024-07-29 07:53:19'),
(2689, 2473, 2472, 'add', '2024-07-29 07:53:19', '2024-07-29 07:53:19'),
(2690, 2474, 2046, 'add', '2024-07-29 07:56:45', '2024-07-29 07:56:45'),
(2691, 2475, 2474, 'add', '2024-07-29 07:57:29', '2024-07-29 07:57:29'),
(2692, 2475, 2472, 'add', '2024-07-29 07:57:29', '2024-07-29 07:57:29'),
(2693, 2051, 2047, 'add', '2024-07-29 07:59:26', '2024-07-29 07:59:26'),
(2694, 2051, 2048, 'add', '2024-07-29 07:59:26', '2024-07-29 07:59:26'),
(2695, 2051, 2049, 'add', '2024-07-29 07:59:26', '2024-07-29 07:59:26'),
(2696, 2051, 2050, 'add', '2024-07-29 07:59:26', '2024-07-29 07:59:26'),
(2697, 2477, 2051, 'add', '2024-07-29 08:00:41', '2024-07-29 08:00:41'),
(2698, 2477, 2476, 'add', '2024-07-29 08:00:41', '2024-07-29 08:00:41'),
(2702, 2484, 2480, 'add', '2024-07-29 08:08:08', '2024-07-29 08:08:08'),
(2703, 2484, 2481, 'add', '2024-07-29 08:08:08', '2024-07-29 08:08:08'),
(2704, 2484, 2482, 'add', '2024-07-29 08:08:08', '2024-07-29 08:08:08'),
(2705, 2484, 2483, 'add', '2024-07-29 08:08:08', '2024-07-29 08:08:08'),
(2706, 2486, 2484, 'add', '2024-07-29 08:09:50', '2024-07-29 08:09:50'),
(2707, 2486, 2485, 'add', '2024-07-29 08:09:50', '2024-07-29 08:09:50'),
(2709, 2488, 2487, 'add', '2024-07-29 08:16:09', '2024-07-29 08:16:09'),
(2710, 2488, 2485, 'add', '2024-07-29 08:16:09', '2024-07-29 08:16:09'),
(2711, 2478, 2051, 'add', '2024-07-29 08:20:59', '2024-07-29 08:20:59'),
(2712, 2479, 2478, 'add', '2024-07-29 08:21:31', '2024-07-29 08:21:31'),
(2713, 2479, 2476, 'add', '2024-07-29 08:21:31', '2024-07-29 08:21:31'),
(2714, 2487, 2484, 'add', '2024-07-29 08:21:50', '2024-07-29 08:21:50'),
(2715, 2493, 2489, 'add', '2024-07-29 08:25:41', '2024-07-29 08:25:41'),
(2716, 2493, 2490, 'add', '2024-07-29 08:25:41', '2024-07-29 08:25:41'),
(2717, 2493, 2491, 'add', '2024-07-29 08:25:41', '2024-07-29 08:25:41'),
(2718, 2493, 2492, 'add', '2024-07-29 08:25:41', '2024-07-29 08:25:41'),
(2719, 2495, 2493, 'add', '2024-07-29 08:29:20', '2024-07-29 08:29:20'),
(2720, 2495, 2494, 'add', '2024-07-29 08:29:20', '2024-07-29 08:29:20'),
(2721, 2496, 2493, 'add', '2024-07-29 08:32:59', '2024-07-29 08:32:59'),
(2722, 2497, 2496, 'add', '2024-07-29 08:33:23', '2024-07-29 08:33:23'),
(2723, 2497, 2494, 'add', '2024-07-29 08:33:23', '2024-07-29 08:33:23'),
(2724, 2502, 2498, 'add', '2024-07-29 08:36:45', '2024-07-29 08:36:45'),
(2725, 2502, 2499, 'add', '2024-07-29 08:36:45', '2024-07-29 08:36:45'),
(2726, 2502, 2500, 'add', '2024-07-29 08:36:45', '2024-07-29 08:36:45'),
(2727, 2502, 2501, 'add', '2024-07-29 08:36:45', '2024-07-29 08:36:45'),
(2730, 2504, 2502, 'add', '2024-07-29 08:39:14', '2024-07-29 08:39:14'),
(2731, 2504, 2503, 'add', '2024-07-29 08:39:14', '2024-07-29 08:39:14'),
(2732, 2505, 2502, 'add', '2024-07-29 08:39:36', '2024-07-29 08:39:36'),
(2733, 2506, 2505, 'add', '2024-07-29 08:40:16', '2024-07-29 08:40:16'),
(2734, 2506, 2503, 'add', '2024-07-29 08:40:16', '2024-07-29 08:40:16'),
(2739, 2511, 2507, 'add', '2024-07-29 08:47:54', '2024-07-29 08:47:54'),
(2740, 2511, 2508, 'add', '2024-07-29 08:47:54', '2024-07-29 08:47:54'),
(2741, 2511, 2509, 'add', '2024-07-29 08:47:54', '2024-07-29 08:47:54'),
(2742, 2511, 2510, 'add', '2024-07-29 08:47:54', '2024-07-29 08:47:54'),
(2743, 2513, 2511, 'add', '2024-07-29 08:48:25', '2024-07-29 08:48:25'),
(2744, 2513, 2512, 'add', '2024-07-29 08:48:25', '2024-07-29 08:48:25'),
(2745, 2514, 2511, 'add', '2024-07-29 08:49:26', '2024-07-29 08:49:26'),
(2746, 2515, 2514, 'add', '2024-07-29 08:50:13', '2024-07-29 08:50:13'),
(2747, 2515, 2512, 'add', '2024-07-29 08:50:13', '2024-07-29 08:50:13'),
(2748, 2520, 2516, 'add', '2024-07-29 08:53:10', '2024-07-29 08:53:10'),
(2749, 2520, 2517, 'add', '2024-07-29 08:53:10', '2024-07-29 08:53:10'),
(2750, 2520, 2518, 'add', '2024-07-29 08:53:10', '2024-07-29 08:53:10'),
(2751, 2520, 2519, 'add', '2024-07-29 08:53:10', '2024-07-29 08:53:10'),
(2752, 2522, 2520, 'add', '2024-07-29 08:59:06', '2024-07-29 08:59:06'),
(2753, 2522, 2521, 'add', '2024-07-29 08:59:06', '2024-07-29 08:59:06'),
(2754, 2523, 2520, 'add', '2024-07-29 08:59:33', '2024-07-29 08:59:33'),
(2755, 2524, 2523, 'add', '2024-07-29 09:00:43', '2024-07-29 09:00:43'),
(2756, 2524, 2521, 'add', '2024-07-29 09:00:43', '2024-07-29 09:00:43'),
(2757, 2529, 2525, 'add', '2024-07-29 09:02:32', '2024-07-29 09:02:32'),
(2758, 2529, 2526, 'add', '2024-07-29 09:02:32', '2024-07-29 09:02:32'),
(2759, 2529, 2527, 'add', '2024-07-29 09:02:32', '2024-07-29 09:02:32'),
(2760, 2529, 2528, 'add', '2024-07-29 09:02:32', '2024-07-29 09:02:32'),
(2761, 2531, 2529, 'add', '2024-07-29 09:03:36', '2024-07-29 09:03:36'),
(2762, 2531, 2530, 'add', '2024-07-29 09:03:36', '2024-07-29 09:03:36'),
(2763, 2532, 2529, 'add', '2024-07-29 09:03:59', '2024-07-29 09:03:59'),
(2764, 2533, 2532, 'add', '2024-07-29 09:06:58', '2024-07-29 09:06:58'),
(2765, 2533, 2530, 'add', '2024-07-29 09:06:58', '2024-07-29 09:06:58'),
(2766, 2538, 2534, 'add', '2024-07-29 09:09:28', '2024-07-29 09:09:28'),
(2767, 2538, 2535, 'add', '2024-07-29 09:09:28', '2024-07-29 09:09:28'),
(2768, 2538, 2536, 'add', '2024-07-29 09:09:28', '2024-07-29 09:09:28'),
(2769, 2538, 2537, 'add', '2024-07-29 09:09:28', '2024-07-29 09:09:28'),
(2770, 2540, 2538, 'add', '2024-07-29 09:10:09', '2024-07-29 09:10:09'),
(2771, 2540, 2539, 'add', '2024-07-29 09:10:09', '2024-07-29 09:10:09'),
(2772, 2541, 2538, 'add', '2024-07-29 09:13:44', '2024-07-29 09:13:44'),
(2773, 2542, 2541, 'add', '2024-07-29 09:14:18', '2024-07-29 09:14:18'),
(2774, 2542, 2539, 'add', '2024-07-29 09:14:18', '2024-07-29 09:14:18'),
(2775, 2547, 2543, 'add', '2024-07-29 09:16:45', '2024-07-29 09:16:45'),
(2776, 2547, 2544, 'add', '2024-07-29 09:16:45', '2024-07-29 09:16:45'),
(2777, 2547, 2545, 'add', '2024-07-29 09:16:45', '2024-07-29 09:16:45'),
(2778, 2547, 2546, 'add', '2024-07-29 09:16:45', '2024-07-29 09:16:45'),
(2779, 2549, 2547, 'add', '2024-07-29 09:18:08', '2024-07-29 09:18:08'),
(2780, 2549, 2548, 'add', '2024-07-29 09:18:08', '2024-07-29 09:18:08'),
(2781, 2550, 2547, 'add', '2024-07-29 09:19:07', '2024-07-29 09:19:07'),
(2782, 2551, 2550, 'add', '2024-07-29 09:21:02', '2024-07-29 09:21:02'),
(2783, 2551, 2548, 'add', '2024-07-29 09:21:02', '2024-07-29 09:21:02'),
(2785, 2553, 2552, 'add', '2024-07-29 09:30:27', '2024-07-29 09:30:27'),
(2786, 2555, 2554, 'add', '2024-07-29 09:31:07', '2024-07-29 09:31:07'),
(2787, 1434, 1427, 'add', '2024-07-29 09:36:35', '2024-07-29 09:36:35'),
(2788, 1434, 1429, 'add', '2024-07-29 09:36:35', '2024-07-29 09:36:35'),
(2789, 1434, 1430, 'add', '2024-07-29 09:36:35', '2024-07-29 09:36:35'),
(2790, 1434, 1432, 'add', '2024-07-29 09:36:35', '2024-07-29 09:36:35'),
(2791, 1445, 1440, 'add', '2024-07-29 09:42:52', '2024-07-29 09:42:52'),
(2792, 2109, 1445, 'add', '2024-07-29 09:43:37', '2024-07-29 09:43:37'),
(2793, 2556, 1436, 'add', '2024-07-29 09:46:18', '2024-07-29 09:46:18'),
(2794, 2557, 1450, 'add', '2024-07-29 09:48:56', '2024-07-29 09:48:56'),
(2795, 1454, 1447, 'add', '2024-07-29 09:50:37', '2024-07-29 09:50:37'),
(2796, 1454, 1449, 'add', '2024-07-29 09:50:37', '2024-07-29 09:50:37'),
(2797, 1454, 1451, 'add', '2024-07-29 09:50:37', '2024-07-29 09:50:37'),
(2798, 1454, 1452, 'add', '2024-07-29 09:50:37', '2024-07-29 09:50:37'),
(2799, 1460, 1454, 'add', '2024-07-29 09:50:57', '2024-07-29 09:50:57'),
(2800, 1460, 1456, 'add', '2024-07-29 09:50:57', '2024-07-29 09:50:57'),
(2801, 2558, 1460, 'add', '2024-07-29 09:51:36', '2024-07-29 09:51:36'),
(2802, 2559, 1467, 'add', '2024-07-29 09:52:54', '2024-07-29 09:52:54'),
(2803, 1476, 1466, 'add', '2024-07-29 09:53:35', '2024-07-29 09:53:35'),
(2804, 1476, 1469, 'add', '2024-07-29 09:53:35', '2024-07-29 09:53:35'),
(2805, 1476, 1471, 'add', '2024-07-29 09:53:35', '2024-07-29 09:53:35'),
(2806, 1476, 1473, 'add', '2024-07-29 09:53:35', '2024-07-29 09:53:35'),
(2807, 1478, 1476, 'add', '2024-07-29 09:54:21', '2024-07-29 09:54:21'),
(2808, 1478, 1482, 'add', '2024-07-29 09:54:21', '2024-07-29 09:54:21'),
(2809, 1490, 1487, 'add', '2024-07-29 09:54:38', '2024-07-29 09:54:38'),
(2810, 2121, 1490, 'add', '2024-07-29 09:54:52', '2024-07-29 09:54:52'),
(2811, 2560, 1478, 'add', '2024-07-29 09:55:12', '2024-07-29 09:55:12'),
(2812, 2561, 1481, 'add', '2024-07-29 09:56:45', '2024-07-29 09:56:45'),
(2813, 2562, 1497, 'add', '2024-07-29 09:58:02', '2024-07-29 09:58:02'),
(2814, 1500, 1493, 'add', '2024-07-29 09:58:33', '2024-07-29 09:58:33'),
(2815, 1500, 1494, 'add', '2024-07-29 09:58:33', '2024-07-29 09:58:33'),
(2816, 1500, 1495, 'add', '2024-07-29 09:58:33', '2024-07-29 09:58:33'),
(2817, 1500, 1496, 'add', '2024-07-29 09:58:33', '2024-07-29 09:58:33'),
(2818, 1505, 1500, 'add', '2024-07-29 09:58:59', '2024-07-29 09:58:59'),
(2819, 1505, 1502, 'add', '2024-07-29 09:58:59', '2024-07-29 09:58:59'),
(2820, 1509, 1507, 'add', '2024-07-29 09:59:12', '2024-07-29 09:59:12'),
(2821, 2563, 1505, 'add', '2024-07-29 09:59:37', '2024-07-29 09:59:37'),
(2822, 1516, 1513, 'add', '2024-07-29 10:03:40', '2024-07-29 10:03:40'),
(2823, 2564, 1511, 'add', '2024-07-29 10:04:04', '2024-07-29 10:04:04'),
(2824, 1519, 1512, 'add', '2024-07-29 10:04:43', '2024-07-29 10:04:43'),
(2825, 1519, 1514, 'add', '2024-07-29 10:04:43', '2024-07-29 10:04:43'),
(2826, 1519, 1515, 'add', '2024-07-29 10:04:43', '2024-07-29 10:04:43'),
(2827, 1519, 1517, 'add', '2024-07-29 10:04:43', '2024-07-29 10:04:43'),
(2829, 1529, 1527, 'add', '2024-07-29 10:05:49', '2024-07-29 10:05:49'),
(2830, 2565, 1526, 'add', '2024-07-29 10:06:09', '2024-07-29 10:06:09'),
(2831, 1531, 1530, 'add', '2024-07-29 10:07:14', '2024-07-29 10:07:14'),
(2832, 1539, 1532, 'add', '2024-07-29 10:08:01', '2024-07-29 10:08:01'),
(2833, 1539, 1533, 'add', '2024-07-29 10:08:01', '2024-07-29 10:08:01'),
(2834, 1539, 1535, 'add', '2024-07-29 10:08:01', '2024-07-29 10:08:01'),
(2835, 1539, 1537, 'add', '2024-07-29 10:08:01', '2024-07-29 10:08:01'),
(2836, 1544, 1539, 'add', '2024-07-29 10:08:24', '2024-07-29 10:08:24'),
(2837, 1544, 1543, 'add', '2024-07-29 10:08:24', '2024-07-29 10:08:24'),
(2838, 2566, 1544, 'add', '2024-07-29 10:10:26', '2024-07-29 10:10:26'),
(2839, 1536, 1534, 'add', '2024-07-29 10:13:41', '2024-07-29 10:13:41'),
(2840, 2567, 1534, 'add', '2024-07-29 10:14:11', '2024-07-29 10:14:11'),
(2841, 2568, 1540, 'add', '2024-07-29 10:15:09', '2024-07-29 10:15:09'),
(2842, 2569, 1803, 'add', '2024-07-29 10:17:51', '2024-07-29 10:17:51'),
(2843, 1810, 1806, 'add', '2024-07-29 10:19:54', '2024-07-29 10:19:54'),
(2844, 1810, 1807, 'add', '2024-07-29 10:19:54', '2024-07-29 10:19:54'),
(2845, 1810, 1808, 'add', '2024-07-29 10:19:54', '2024-07-29 10:19:54'),
(2846, 1810, 1809, 'add', '2024-07-29 10:19:54', '2024-07-29 10:19:54'),
(2847, 2570, 1812, 'add', '2024-07-29 10:20:41', '2024-07-29 10:20:41'),
(2848, 2571, 1821, 'add', '2024-07-29 10:22:46', '2024-07-29 10:22:46'),
(2849, 2572, 1830, 'add', '2024-07-29 10:24:07', '2024-07-29 10:24:07'),
(2850, 2573, 1839, 'add', '2024-07-29 10:25:18', '2024-07-29 10:25:18'),
(2851, 1850, 1849, 'add', '2024-07-29 10:26:47', '2024-07-29 10:26:47'),
(2852, 2574, 1848, 'add', '2024-07-29 10:27:09', '2024-07-29 10:27:09'),
(2853, 1859, 1858, 'add', '2024-07-29 10:28:21', '2024-07-29 10:28:21'),
(2854, 2575, 1857, 'add', '2024-07-29 10:29:09', '2024-07-29 10:29:09'),
(2855, 1866, 1864, 'add', '2024-07-29 10:29:53', '2024-07-29 10:29:53'),
(2856, 1866, 1865, 'add', '2024-07-29 10:29:53', '2024-07-29 10:29:53'),
(2857, 1868, 1867, 'add', '2024-07-29 10:30:07', '2024-07-29 10:30:07'),
(2858, 2576, 1866, 'add', '2024-07-29 10:30:26', '2024-07-29 10:30:26'),
(2859, 1877, 1876, 'add', '2024-07-29 10:32:03', '2024-07-29 10:32:03'),
(2860, 1886, 1885, 'add', '2024-07-29 10:35:25', '2024-07-29 10:35:25'),
(2861, 2577, 1884, 'add', '2024-07-29 10:35:48', '2024-07-29 10:35:48'),
(2862, 1895, 1894, 'add', '2024-07-29 10:36:49', '2024-07-29 10:36:49'),
(2863, 2578, 1893, 'add', '2024-07-29 10:37:26', '2024-07-29 10:37:26');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penalties`
--

CREATE TABLE `penalties` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'view-dashboard', 'web', '2024-07-22 18:26:32', '2024-07-22 18:26:32'),
(2, 'manage-school', 'web', '2024-07-22 18:26:32', '2024-07-22 18:26:32'),
(3, 'view-grades', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33'),
(4, 'view-grade-list', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33'),
(5, 'view-classes', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33'),
(6, 'view-class-list', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33'),
(7, 'view-sections', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33'),
(8, 'view-section-list', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33'),
(9, 'view-parents', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33'),
(10, 'view-parent-list', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33'),
(11, 'view-students', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33'),
(12, 'view-student-info', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33'),
(13, 'add-student', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33'),
(14, 'view-student-list', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33'),
(15, 'manage-student-promotions', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33'),
(16, 'add-promotion', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33'),
(17, 'view-promotion-list', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33'),
(18, 'view-teachers', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33'),
(19, 'view-teacher-list', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33'),
(20, 'view-subjects', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33'),
(21, 'view-subject-list', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33'),
(22, 'manage-accounts', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33'),
(23, 'view-invoices', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33'),
(24, 'view-receipts', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33'),
(25, 'manage-processing-fee', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33'),
(26, 'manage-payments', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33'),
(27, 'manage-attendance', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33'),
(28, 'view-attendance', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33'),
(29, 'view-attendance-ratios', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33'),
(30, 'manage-exams', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33'),
(31, 'view-exams', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33'),
(32, 'manage-settings', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33'),
(33, 'view-users', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33'),
(34, 'manage-previous-years', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33'),
(35, 'update-settings', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33');

-- --------------------------------------------------------

--
-- Table structure for table `public_utilities`
--

CREATE TABLE `public_utilities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `public_utilities`
--

INSERT INTO `public_utilities` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'dsadsa', '2024-08-01 23:24:14', '2024-08-01 23:24:14');

-- --------------------------------------------------------

--
-- Table structure for table `question_options`
--

CREATE TABLE `question_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `school_question_id` bigint(20) UNSIGNED NOT NULL,
  `option_text` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `question_options`
--

INSERT INTO `question_options` (`id`, `school_question_id`, `option_text`, `created_at`, `updated_at`) VALUES
(10, 1, 'نعم', '2024-08-02 00:05:17', '2024-08-02 00:05:17'),
(11, 1, 'لا', '2024-08-02 00:05:17', '2024-08-02 00:05:17');

-- --------------------------------------------------------

--
-- Table structure for table `question_option_relations`
--

CREATE TABLE `question_option_relations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `question_option_relations`
--

INSERT INTO `question_option_relations` (`id`, `question_id`, `option_id`, `created_at`, `updated_at`) VALUES
(3, 8, 11, '2024-08-02 02:12:59', '2024-08-02 02:12:59'),
(4, 8, 10, '2024-08-02 02:13:10', '2024-08-02 02:13:10');

-- --------------------------------------------------------

--
-- Table structure for table `registration_types`
--

CREATE TABLE `registration_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `religions`
--

CREATE TABLE `religions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `religions`
--

INSERT INTO `religions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'مسلم', NULL, NULL),
(2, 'مسيحي', NULL, NULL),
(3, 'غيرذلك', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rewards`
--

CREATE TABLE `rewards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reward_punishments`
--

CREATE TABLE `reward_punishments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `reward_punishment_name` varchar(255) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `is_punishment` tinyint(1) NOT NULL,
  `year` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33'),
(2, 'teacher', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33'),
(3, 'student', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33'),
(4, 'student parent', 'web', '2024-07-22 18:26:33', '2024-07-22 18:26:33');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(4, 1),
(4, 2),
(5, 1),
(5, 2),
(5, 3),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(7, 3),
(8, 1),
(8, 2),
(9, 1),
(10, 1),
(11, 1),
(11, 2),
(11, 3),
(12, 1),
(12, 2),
(12, 4),
(13, 1),
(14, 1),
(14, 2),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(18, 2),
(19, 1),
(19, 2),
(20, 1),
(20, 2),
(21, 1),
(21, 2),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(27, 2),
(28, 1),
(28, 2),
(28, 4),
(29, 1),
(29, 2),
(30, 1),
(30, 2),
(31, 1),
(31, 2),
(32, 1),
(33, 1),
(34, 1),
(35, 1);

-- --------------------------------------------------------

--
-- Table structure for table `schools`
--

CREATE TABLE `schools` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `statistical_number` int(10) UNSIGNED NOT NULL,
  `school_name` varchar(255) NOT NULL,
  `type_of_education` tinyint(3) UNSIGNED NOT NULL,
  `typeB` tinyint(1) NOT NULL DEFAULT 0,
  `kindergarten` tinyint(1) NOT NULL DEFAULT 0,
  `education_p` tinyint(1) NOT NULL DEFAULT 0,
  `education_p1` tinyint(1) NOT NULL DEFAULT 0,
  `education_s` tinyint(1) NOT NULL DEFAULT 0,
  `school_state` varchar(255) NOT NULL,
  `school_city` varchar(255) NOT NULL,
  `school_region` varchar(255) NOT NULL,
  `school_village` varchar(255) DEFAULT NULL,
  `school_Neigh` varchar(255) DEFAULT NULL,
  `Admin_division` tinyint(3) UNSIGNED NOT NULL,
  `School_gender` tinyint(3) UNSIGNED NOT NULL,
  `School_build` tinyint(1) NOT NULL DEFAULT 0,
  `School_access` tinyint(3) UNSIGNED NOT NULL,
  `Shared_construction` tinyint(1) NOT NULL DEFAULT 0,
  `School_type` tinyint(3) UNSIGNED NOT NULL,
  `type_of_attend` tinyint(3) UNSIGNED NOT NULL,
  `build_m` tinyint(3) UNSIGNED NOT NULL,
  `build_t` tinyint(3) UNSIGNED NOT NULL,
  `build_class` int(10) UNSIGNED DEFAULT NULL,
  `build_area` int(10) UNSIGNED DEFAULT NULL,
  `count_floor` int(10) UNSIGNED DEFAULT NULL,
  `count_build` int(10) UNSIGNED DEFAULT NULL,
  `petrol_count` int(10) UNSIGNED DEFAULT NULL,
  `petrol_cap` int(10) UNSIGNED DEFAULT NULL,
  `internet_coount` int(10) UNSIGNED DEFAULT NULL,
  `internet_type` varchar(255) DEFAULT NULL,
  `electric_type` tinyint(3) UNSIGNED NOT NULL,
  `manager_name` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `school_building_types`
--

CREATE TABLE `school_building_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `school_building_types`
--

INSERT INTO `school_building_types` (`id`, `type`, `note`, `created_at`, `updated_at`) VALUES
(1, 'اسمنت', NULL, '2024-07-31 01:08:27', '2024-07-31 01:08:27'),
(2, 'مسبق الصنع', NULL, '2024-07-31 01:08:34', '2024-07-31 01:08:34'),
(3, 'حجر', NULL, '2024-07-31 01:08:43', '2024-07-31 01:08:43'),
(4, 'كرفان', NULL, '2024-07-31 01:08:50', '2024-07-31 01:08:50'),
(5, 'طين', NULL, '2024-07-31 01:08:55', '2024-07-31 01:08:55'),
(6, 'خيم', NULL, '2024-07-31 01:09:05', '2024-07-31 01:09:05');

-- --------------------------------------------------------

--
-- Table structure for table `school_genders`
--

CREATE TABLE `school_genders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `gender` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `school_genders`
--

INSERT INTO `school_genders` (`id`, `gender`, `note`, `created_at`, `updated_at`) VALUES
(1, 'ذكور', NULL, '2024-07-31 01:19:19', '2024-07-31 01:19:19'),
(2, 'اناث', NULL, '2024-07-31 01:19:24', '2024-07-31 01:19:24'),
(3, 'مختلطة', NULL, '2024-07-31 01:19:32', '2024-07-31 01:19:32');

-- --------------------------------------------------------

--
-- Table structure for table `school_questions`
--

CREATE TABLE `school_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `type` enum('true_or_false','select_many','select_one') NOT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `dependent_option_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `school_questions`
--

INSERT INTO `school_questions` (`id`, `title`, `description`, `type`, `order`, `dependent_option_id`, `created_at`, `updated_at`) VALUES
(1, 'المدرسة فئة ب', NULL, 'select_one', 1, 11, '2024-08-01 20:17:53', '2024-08-02 00:44:46'),
(2, 'المدرسة دامجة', 'ذوي الإعاقة', 'true_or_false', 3, NULL, '2024-08-01 20:19:05', '2024-08-02 00:03:19'),
(3, 'رياض الأطفال', NULL, 'select_many', 4, NULL, '2024-08-01 20:19:45', '2024-08-01 23:57:37'),
(4, 'هل غرفة الرياض مجهزة بأثاث', NULL, 'true_or_false', 5, NULL, '2024-08-01 20:20:21', '2024-08-01 20:20:21'),
(5, 'تلاميذ الفئة ب', NULL, 'select_many', 2, 10, '2024-08-01 20:21:00', '2024-08-02 00:05:31'),
(6, 'المدرسة ريفية', 'فيها حقل ريفي', 'true_or_false', 6, NULL, '2024-08-01 20:24:07', '2024-08-01 20:24:07'),
(7, 'المدرسة بادية', 'داخلية', 'true_or_false', 7, NULL, '2024-08-01 20:25:24', '2024-08-01 20:25:24'),
(8, 'هل يوجد كهرباء', 'لا يعتبر التقنين العام للشبكة', 'true_or_false', 8, NULL, '2024-08-01 20:26:31', '2024-08-01 20:26:31'),
(9, 'شبكة عامة', NULL, 'true_or_false', 9, NULL, '2024-08-01 20:26:52', '2024-08-01 20:26:52'),
(10, 'هل يوجد انترنت', NULL, 'true_or_false', 10, NULL, '2024-08-01 20:27:18', '2024-08-01 20:27:18');

-- --------------------------------------------------------

--
-- Table structure for table `school_room_types`
--

CREATE TABLE `school_room_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `school_room_types`
--

INSERT INTO `school_room_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'sdasss2', '2024-08-01 23:18:30', '2024-08-01 23:18:40');

-- --------------------------------------------------------

--
-- Table structure for table `school_types`
--

CREATE TABLE `school_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `school_types`
--

INSERT INTO `school_types` (`id`, `type`, `note`, `created_at`, `updated_at`) VALUES
(1, 'نمطية', 'الصفوف في شعب مستقلة', '2024-07-31 00:57:28', '2024-07-31 01:50:21'),
(2, 'مجمعة', 'عدة صفوف مجمعة في شعبة واحدة', '2024-07-31 00:57:35', '2024-07-31 01:50:07');

-- --------------------------------------------------------

--
-- Table structure for table `school_years`
--

CREATE TABLE `school_years` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `start_year` varchar(255) NOT NULL,
  `end_year` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `school_years`
--

INSERT INTO `school_years` (`id`, `name`, `start_year`, `end_year`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'العام الدراسي 24/25', '08/2023', '07/2024', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `classs_school_year_id` bigint(20) UNSIGNED NOT NULL,
  `section_type_id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `classs_school_year_id`, `section_type_id`, `teacher_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'الأولى', '2024-07-29 10:35:48', '2024-07-29 10:35:48');

-- --------------------------------------------------------

--
-- Table structure for table `section_language`
--

CREATE TABLE `section_language` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `section_types`
--

CREATE TABLE `section_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `section_types`
--

INSERT INTO `section_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'مختلط', NULL, NULL),
(2, 'ذكور', NULL, NULL),
(3, 'اناث', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0fzeGpLZe0OkJ5Wqm7X3KeZQNMq0tiNlmvr79Cib', 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiNVlRSjFOWkJnWUhRSnVSWk55VVpzbnY5anlIcEJPV1FlU2s1Y1NUNCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMzOiJodHRwOi8vbG9jYWxob3N0L3N2Zy1pZHMvMS0wMS5zdmciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1722624663);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page` enum('general','financial','personalization','notifications','seo','customization','other') NOT NULL DEFAULT 'other',
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `page`, `name`, `created_at`, `updated_at`) VALUES
(1, 'seo', 'seo_metas', NULL, NULL),
(2, 'general', 'socials', NULL, NULL),
(4, 'other', 'footer', NULL, NULL),
(5, 'general', 'general', NULL, NULL),
(6, 'financial', 'financial', NULL, NULL),
(8, 'personalization', 'home_hero', NULL, NULL),
(12, 'customization', 'custom_css_js', NULL, NULL),
(14, 'personalization', 'page_background', NULL, NULL),
(15, 'personalization', 'home_hero2', NULL, NULL),
(20, 'other', 'report_reasons', NULL, NULL),
(22, 'notifications', 'notifications', NULL, NULL),
(23, 'financial', 'site_bank_accounts', NULL, NULL),
(24, 'other', 'contact_us', NULL, NULL),
(25, 'personalization', 'home_sections', NULL, NULL),
(26, 'other', 'navbar_links', NULL, NULL),
(27, 'personalization', 'home_video_or_image_box', NULL, NULL),
(28, 'other', '404', NULL, NULL),
(29, 'personalization', 'panel_sidebar', NULL, NULL),
(30, 'financial', 'referral', NULL, NULL),
(31, 'general', 'features', NULL, NULL),
(32, 'personalization', 'find_instructors', NULL, NULL),
(33, 'personalization', 'reward_program', NULL, NULL),
(34, 'general', 'rewards_settings', NULL, NULL),
(37, 'financial', 'registration_packages_general', NULL, NULL),
(38, 'financial', 'registration_packages_instructors', NULL, NULL),
(39, 'financial', 'registration_packages_organizations', NULL, NULL),
(40, 'personalization', 'become_instructor_section', NULL, NULL),
(41, 'general', 'store_settings', NULL, NULL),
(42, 'personalization', 'theme_colors', NULL, NULL),
(43, 'personalization', 'forums_section', NULL, NULL),
(44, 'personalization', 'cookie_settings', NULL, NULL),
(45, 'personalization', 'mobile_app', NULL, NULL),
(46, 'personalization', 'theme_fonts', NULL, NULL),
(47, 'general', 'reminders', NULL, NULL),
(48, 'other', 'advertising_modal', NULL, NULL),
(52, 'personalization', 'others_personalization', NULL, NULL),
(53, 'general', 'security', NULL, NULL),
(54, 'general', 'installments_settings', NULL, NULL),
(55, 'general', 'installments_terms_settings', NULL, NULL),
(56, 'financial', 'currency_settings', NULL, NULL),
(57, 'personalization', 'statistics', NULL, NULL),
(58, 'personalization', 'maintenance_settings', NULL, NULL),
(59, 'general', 'general_options', NULL, NULL),
(60, 'financial', 'offline_banks_credits', NULL, NULL),
(61, 'financial', 'offline_banks', NULL, NULL),
(62, 'general', 'gifts_general_settings', NULL, NULL),
(63, 'general', 'registration_bonus_settings', NULL, NULL),
(64, 'general', 'registration_bonus_terms_settings', NULL, NULL),
(65, 'general', 'ai_contents_settings', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `setting_translations`
--

CREATE TABLE `setting_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `setting_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(255) NOT NULL,
  `value` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `setting_translations`
--

INSERT INTO `setting_translations` (`id`, `setting_id`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', '{\\\"home\\\":{\\\"title\\\":\\\"\\u0627\\u0644\\u0635\\u0641\\u062d\\u0629 \\u0627\\u0644\\u0631\\u0626\\u064a\\u0633\\u064a\\u0629\\\",\\\"description\\\":\\\"home page Description\\\",\\\"robot\\\":\\\"index\\\"},\\\"search\\\":{\\\"title\\\":\\\"Search\\\",\\\"description\\\":\\\"search page Description\\\",\\\"robot\\\":\\\"index\\\"},\\\"categories\\\":{\\\"title\\\":\\\"Category\\\",\\\"description\\\":\\\"categories page Description\\\",\\\"robot\\\":\\\"index\\\"},\\\"login\\\":{\\\"title\\\":\\\"\\u062a\\u0633\\u062c\\u064a\\u0644 \\u0627\\u0644\\u062f\\u062e\\u0648\\u0644\\\",\\\"description\\\":\\\"login page description\\\",\\\"robot\\\":\\\"index\\\"},\\\"register\\\":{\\\"title\\\":\\\"Register\\\",\\\"description\\\":\\\"register page Description\\\",\\\"robot\\\":\\\"index\\\"},\\\"about\\\":{\\\"title\\\":\\\"about page title\\\",\\\"description\\\":\\\"about page Description\\\"},\\\"contact\\\":{\\\"title\\\":\\\"Contact\\\",\\\"description\\\":\\\"contact page Description\\\",\\\"robot\\\":\\\"index\\\"},\\\"certificate_validation\\\":{\\\"title\\\":\\\"Certificate validation\\\",\\\"description\\\":\\\"Certificate validation description\\\",\\\"robot\\\":\\\"index\\\"},\\\"classes\\\":{\\\"title\\\":\\\"Courses\\\",\\\"description\\\":\\\"Courses page Description\\\",\\\"robot\\\":\\\"index\\\"},\\\"blog\\\":{\\\"title\\\":\\\"Blog\\\",\\\"description\\\":\\\"Blog page description\\\",\\\"robot\\\":\\\"index\\\"},\\\"instructors\\\":{\\\"title\\\":\\\"Instructors\\\",\\\"description\\\":\\\"instructors page Description\\\",\\\"robot\\\":\\\"index\\\"},\\\"organizations\\\":{\\\"title\\\":\\\"Organizations\\\",\\\"description\\\":\\\"Organizations page description\\\",\\\"robot\\\":\\\"index\\\"},\\\"instructor_finder_wizard\\\":{\\\"title\\\":\\\"Instructor finder wizard\\\",\\\"description\\\":\\\"Instructor finder wizard description\\\",\\\"robot\\\":\\\"noindex\\\"},\\\"instructor_finder\\\":{\\\"title\\\":\\\"Instructor finder\\\",\\\"description\\\":\\\"Instructor finder description\\\",\\\"robot\\\":\\\"index\\\"},\\\"reward_courses\\\":{\\\"title\\\":\\\"Reward courses\\\",\\\"description\\\":\\\"Reward courses description\\\",\\\"robot\\\":\\\"index\\\"},\\\"products_lists\\\":{\\\"title\\\":\\\"Store Products\\\",\\\"description\\\":\\\"Store Products Description\\\",\\\"robot\\\":\\\"noindex\\\"},\\\"reward_products\\\":{\\\"title\\\":\\\"Reward Products\\\",\\\"description\\\":\\\"Reward Products Description\\\",\\\"robot\\\":\\\"noindex\\\"},\\\"forum\\\":{\\\"title\\\":\\\"Forums\\\",\\\"description\\\":\\\"Forums Description\\\",\\\"robot\\\":\\\"noindex\\\"},\\\"upcoming_courses_lists\\\":{\\\"title\\\":\\\"Upcoming Course\\\",\\\"description\\\":\\\"Upcoming courses description\\\",\\\"robot\\\":\\\"noindex\\\"}}', NULL, NULL),
(2, 2, 'en', '{\\\"Instagram\\\":{\\\"title\\\":\\\"Instagram\\\",\\\"image\\\":\\\"\\/store\\/1\\/default_images\\/social\\/instagram.svg\\\",\\\"link\\\":\\\"https:\\/\\/www.instagram.com\\/\\\",\\\"order\\\":\\\"1\\\"},\\\"Whatsapp\\\":{\\\"title\\\":\\\"Whatsapp\\\",\\\"image\\\":\\\"\\/store\\/1\\/default_images\\/social\\/whatsapp.svg\\\",\\\"link\\\":\\\"https:\\/\\/web.whatsapp.com\\/\\\",\\\"order\\\":\\\"2\\\"},\\\"Twitter\\\":{\\\"title\\\":\\\"Twitter\\\",\\\"image\\\":\\\"\\/store\\/1\\/default_images\\/social\\/twitter.svg\\\",\\\"link\\\":\\\"https:\\/\\/twitter.com\\/\\\",\\\"order\\\":\\\"3\\\"},\\\"Facebook\\\":{\\\"title\\\":\\\"Facebook\\\",\\\"image\\\":\\\"\\/store\\/1\\/default_images\\/social\\/facebook.svg\\\",\\\"link\\\":\\\"https:\\/\\/www.facebook.com\\/\\\",\\\"order\\\":\\\"4\\\"}}', NULL, NULL),
(4, 5, 'en', '{\\\"site_name\\\":\\\"\\u0623\\u0643\\u0627\\u062f\\u064a\\u0645\\u064a\\u0629 \\u0645\\u062d\\u0645\\u062f \\u0627\\u0644\\u062e\\u0627\\u0644\\u062f\\u064a\\\",\\\"site_email\\\":\\\"lms@lilacdev.com\\\",\\\"site_phone\\\":\\\"+09 000 000 000\\\",\\\"work_hours\\\":\\\"\\u0627\\u0644\\u0627\\u062b\\u0646\\u064a\\u0646 - \\u0627\\u0644\\u062e\\u0645\\u064a\\u0633\\\",\\\"active_hours\\\":\\\"09:00 am 09:00 - pm\\\",\\\"whatsapp_number\\\":\\\"963983486899\\\",\\\"site_language\\\":\\\"AR\\\",\\\"register_method\\\":\\\"email\\\",\\\"default_time_zone\\\":\\\"America\\/New_York\\\",\\\"date_format\\\":\\\"textual\\\",\\\"time_format\\\":\\\"24_hours\\\",\\\"user_languages\\\":[\\\"AR\\\",\\\"EN\\\"],\\\"rtl_languages\\\":[\\\"AR\\\"],\\\"fav_icon\\\":\\\"\\/store\\/1\\/default_images\\/Logo-Icon.svg\\\",\\\"logo\\\":\\\"\\/store\\/1\\/default_images\\/Logo.svg\\\",\\\"footer_logo\\\":\\\"\\/store\\/1\\/default_images\\/Logo-White.svg\\\",\\\"rtl_layout\\\":\\\"0\\\",\\\"preloading\\\":\\\"0\\\",\\\"content_translate\\\":\\\"1\\\"}', NULL, NULL),
(5, 6, 'en', '{\\\"commission\\\":\\\"20\\\",\\\"tax\\\":\\\"10\\\",\\\"minimum_payout\\\":\\\"50\\\",\\\"currency\\\":\\\"USD\\\",\\\"currency_position\\\":\\\"left\\\",\\\"price_display\\\":\\\"only_price\\\"}', NULL, NULL),
(6, 8, 'en', '{\\\"title\\\":\\\"Joy of learning & teaching...\\\",\\\"description\\\":\\\"Chamivs SMS is a fully-featured educational platform that helps instructors to create and publish video courses, live classes, and text courses and earn money, and helps students to learn in the easiest way.\\\",\\\"hero_background\\\":\\\"\\/store\\/1\\/default_images\\/hero_1.jpg\\\"}', NULL, NULL),
(7, 12, 'en', '{\\\"css\\\":null,\\\"js\\\":null}', NULL, NULL),
(8, 14, 'en', '{\\\"admin_login\\\":\\\"\\/store\\/1\\/default_images\\/admin_login.jpg\\\",\\\"admin_dashboard\\\":\\\"\\/store\\/1\\/default_images\\/admin_dashboard.jpg\\\",\\\"login\\\":\\\"\\/store\\/1\\/default_images\\/front_login.jpg\\\",\\\"register\\\":\\\"\\/store\\/1\\/default_images\\/front_register.jpg\\\",\\\"remember_pass\\\":\\\"\\/store\\/1\\/default_images\\/password_recovery.jpg\\\",\\\"verification\\\":\\\"\\/store\\/1\\/default_images\\/verification.jpg\\\",\\\"search\\\":\\\"\\/store\\/1\\/default_images\\/search_cover.png\\\",\\\"categories\\\":\\\"\\/store\\/1\\/default_images\\/category_cover.png\\\",\\\"become_instructor\\\":\\\"\\/store\\/1\\/default_images\\/become_instructor.jpg\\\",\\\"certificate_validation\\\":\\\"\\/store\\/1\\/default_images\\/certificate_validation.jpg\\\",\\\"blog\\\":\\\"\\/store\\/1\\/default_images\\/blogs_cover.png\\\",\\\"instructors\\\":\\\"\\/store\\/1\\/default_images\\/instructors_cover.png\\\",\\\"organizations\\\":\\\"\\/store\\/1\\/default_images\\/organizations_cover.png\\\",\\\"dashboard\\\":\\\"\\/store\\/1\\/dashboard.png\\\",\\\"user_cover\\\":\\\"\\/store\\/1\\/default_images\\/default_cover.jpg\\\",\\\"instructor_finder_wizard\\\":\\\"\\/store\\/1\\/default_images\\/instructor_finder_wizard.jpg\\\",\\\"products_lists\\\":\\\"\\/store\\/1\\/default_images\\/category_cover.png\\\",\\\"upcoming_courses_lists\\\":\\\"\\/store\\/1\\/default_images\\/category_cover.png\\\"}', NULL, NULL),
(9, 15, 'en', '{\\\"title\\\":\\\"Joy of learning & teaching...\\\",\\\"description\\\":\\\"Chamivs SMS is a fully-featured educational platform that helps instructors to create and publish video courses, live classes, and text courses and earn money, and helps students to learn in the easiest way.\\\",\\\"hero_background\\\":\\\"\\/assets\\/default\\/img\\/home\\/world.png\\\",\\\"hero_vector\\\":\\\"\\/store\\/1\\/animated-header.json\\\",\\\"has_lottie\\\":\\\"1\\\"}', NULL, NULL),
(10, 20, 'en', '[\\\"Inappropriate Course Content\\\",\\\"Inappropriate Behavior\\\",\\\"Policy Violation\\\",\\\"Spammy Content\\\",\\\"Other\\\"]', NULL, NULL),
(11, 22, 'en', '{\\\"new_comment_admin\\\":\\\"7\\\",\\\"support_message_admin\\\":\\\"10\\\",\\\"support_message_replied_admin\\\":\\\"11\\\",\\\"promotion_plan_admin\\\":\\\"29\\\",\\\"new_contact_message\\\":\\\"26\\\",\\\"new_badge\\\":\\\"2\\\",\\\"change_user_group\\\":\\\"3\\\",\\\"course_created\\\":\\\"4\\\",\\\"course_approve\\\":\\\"5\\\",\\\"course_reject\\\":\\\"6\\\",\\\"new_comment\\\":\\\"7\\\",\\\"support_message\\\":\\\"8\\\",\\\"support_message_replied\\\":\\\"9\\\",\\\"new_rating\\\":\\\"17\\\",\\\"webinar_reminder\\\":\\\"27\\\",\\\"new_financial_document\\\":\\\"12\\\",\\\"payout_request\\\":\\\"13\\\",\\\"payout_proceed\\\":\\\"14\\\",\\\"offline_payment_request\\\":\\\"18\\\",\\\"offline_payment_approved\\\":\\\"19\\\",\\\"offline_payment_rejected\\\":\\\"20\\\",\\\"new_sales\\\":\\\"15\\\",\\\"new_purchase\\\":\\\"16\\\",\\\"new_subscribe_plan\\\":\\\"21\\\",\\\"promotion_plan\\\":\\\"28\\\",\\\"new_appointment\\\":\\\"22\\\",\\\"new_appointment_link\\\":\\\"23\\\",\\\"appointment_reminder\\\":\\\"24\\\",\\\"meeting_finished\\\":\\\"25\\\",\\\"new_certificate\\\":\\\"30\\\",\\\"waiting_quiz\\\":\\\"31\\\",\\\"waiting_quiz_result\\\":\\\"32\\\",\\\"payout_request_admin\\\":\\\"13\\\",\\\"product_new_sale\\\":\\\"33\\\",\\\"product_new_purchase\\\":\\\"34\\\",\\\"product_new_comment\\\":\\\"35\\\",\\\"product_tracking_code\\\":\\\"36\\\",\\\"product_new_rating\\\":\\\"37\\\",\\\"product_receive_shipment\\\":\\\"38\\\",\\\"product_out_of_stock\\\":\\\"39\\\",\\\"student_send_message\\\":\\\"40\\\",\\\"instructor_send_message\\\":\\\"41\\\",\\\"instructor_set_grade\\\":\\\"42\\\",\\\"send_post_in_topic\\\":\\\"44\\\",\\\"publish_instructor_blog_post\\\":\\\"45\\\",\\\"new_comment_for_instructor_blog_post\\\":\\\"46\\\",\\\"meeting_reserve_reminder\\\":\\\"47\\\",\\\"subscribe_reminder\\\":\\\"48\\\",\\\"reminder_gift_to_receipt\\\":\\\"52\\\",\\\"gift_sender_confirmation\\\":\\\"53\\\",\\\"gift_sender_notification\\\":\\\"54\\\",\\\"admin_gift_submission\\\":\\\"55\\\",\\\"admin_gift_sending_confirmation\\\":\\\"56\\\",\\\"reminder_installments_before_overdue\\\":\\\"57\\\",\\\"installment_due_reminder\\\":\\\"58\\\",\\\"reminder_installments_after_overdue\\\":\\\"59\\\",\\\"approve_installment_verification_request\\\":\\\"60\\\",\\\"reject_installment_verification_request\\\":\\\"61\\\",\\\"paid_installment_step\\\":\\\"62\\\",\\\"paid_installment_step_for_admin\\\":\\\"63\\\",\\\"paid_installment_upfront\\\":\\\"64\\\",\\\"installment_verification_request_sent\\\":\\\"65\\\",\\\"admin_installment_verification_request_sent\\\":\\\"66\\\",\\\"instalment_request_submitted\\\":\\\"67\\\",\\\"instalment_request_submitted_for_admin\\\":\\\"68\\\",\\\"upcoming_course_submission\\\":\\\"69\\\",\\\"upcoming_course_submission_for_admin\\\":\\\"70\\\",\\\"upcoming_course_approved\\\":\\\"71\\\",\\\"upcoming_course_rejected\\\":\\\"72\\\",\\\"upcoming_course_published\\\":\\\"73\\\",\\\"upcoming_course_followed\\\":\\\"74\\\",\\\"upcoming_course_published_for_followers\\\":\\\"75\\\",\\\"user_get_cashback\\\":\\\"76\\\",\\\"user_get_cashback_notification_for_admin\\\":\\\"77\\\",\\\"bundle_submission\\\":\\\"78\\\",\\\"bundle_submission_for_admin\\\":\\\"79\\\",\\\"bundle_approved\\\":\\\"80\\\",\\\"bundle_rejected\\\":\\\"81\\\",\\\"new_review_for_bundle\\\":\\\"82\\\",\\\"registration_bonus_achieved\\\":\\\"83\\\",\\\"registration_bonus_unlocked\\\":\\\"84\\\",\\\"registration_bonus_unlocked_for_admin\\\":\\\"85\\\",\\\"registration_package_activated\\\":\\\"86\\\",\\\"registration_package_activated_for_admin\\\":\\\"87\\\",\\\"registration_package_expired\\\":\\\"87\\\",\\\"contact_message_submission\\\":\\\"88\\\",\\\"contact_message_submission_for_admin\\\":\\\"89\\\",\\\"waitlist_submission\\\":\\\"90\\\",\\\"waitlist_submission_for_admin\\\":\\\"91\\\",\\\"new_referral_user\\\":\\\"92\\\",\\\"user_role_change\\\":\\\"97\\\",\\\"add_to_user_group\\\":\\\"98\\\",\\\"become_instructor_request_approved\\\":\\\"99\\\",\\\"become_instructor_request_rejected\\\":\\\"100\\\",\\\"new_question_in_forum\\\":\\\"101\\\",\\\"new_answer_in_forum\\\":\\\"102\\\",\\\"new_appointment_session\\\":\\\"103\\\",\\\"new_quiz\\\":\\\"93\\\",\\\"user_get_new_point\\\":\\\"94\\\",\\\"new_course_notice\\\":\\\"96\\\",\\\"new_registration\\\":\\\"104\\\",\\\"new_become_instructor_request\\\":\\\"105\\\",\\\"new_course_enrollment\\\":\\\"106\\\",\\\"new_forum_topic\\\":\\\"107\\\",\\\"new_report_item_for_admin\\\":\\\"108\\\",\\\"new_item_created\\\":\\\"109\\\",\\\"new_store_order\\\":\\\"110\\\",\\\"subscription_plan_activated\\\":\\\"111\\\",\\\"content_review_request\\\":\\\"112\\\",\\\"new_user_blog_post\\\":\\\"113\\\",\\\"new_user_item_rating\\\":\\\"114\\\",\\\"new_organization_user\\\":\\\"115\\\",\\\"user_wallet_charge\\\":\\\"116\\\",\\\"new_user_payout_request\\\":\\\"117\\\",\\\"new_offline_payment_request\\\":\\\"118\\\",\\\"user_access_to_content\\\":\\\"119\\\",\\\"submit_form_by_users\\\":\\\"120\\\"}', NULL, NULL),
(12, 23, 'en', '{\\\"540\\\":{\\\"title\\\":\\\"Qatar National Bank\\\",\\\"image\\\":\\\"\\/store\\/1\\/default_images\\/offline_payments\\/Qatar National Bank.png\\\",\\\"card_id\\\":\\\"2578-4910-3682-6288\\\",\\\"account_id\\\":\\\"38152294372\\\",\\\"iban\\\":\\\"QA66QUWW934528129454345775226\\\"},\\\"334\\\":{\\\"title\\\":\\\"State Bank of India\\\",\\\"image\\\":\\\"\\/store\\/1\\/default_images\\/offline_payments\\/State Bank of India.png\\\",\\\"card_id\\\":\\\"6282-4518-1237-7641\\\",\\\"account_id\\\":\\\"56238341127\\\",\\\"iban\\\":\\\"IN37ABNA2422193788\\\"},\\\"jhgDW\\\":{\\\"title\\\":\\\"JPMorgan\\\",\\\"image\\\":\\\"\\/store\\/1\\/default_images\\/offline_payments\\/jpmorgan.png\\\",\\\"card_id\\\":\\\"5012-4518-1772-8911\\\",\\\"account_id\\\":\\\"46237751125\\\",\\\"iban\\\":\\\"NL37ABNA2423554788\\\"}}', NULL, NULL),
(13, 24, 'en', '{\\\"background\\\":\\\"\\/store\\/1\\/default_images\\/category_cover.png\\\",\\\"latitude\\\":\\\"43.45905\\\",\\\"longitude\\\":\\\"11.87300\\\",\\\"map_zoom\\\":\\\"16\\\",\\\"phones\\\":\\\"415-716-1166 , 415-716-1167\\\",\\\"emails\\\":\\\"mail@lms.rocket-soft.org , info@lms.rocket-soft.org\\\",\\\"address\\\":\\\"4193 Roosevelt Street\\r\\nSan Francisco, CA 94103\\\"}', NULL, NULL),
(14, 25, 'en', '{\\\"latest_classes\\\":\\\"1\\\",\\\"best_sellers\\\":\\\"1\\\",\\\"free_classes\\\":\\\"1\\\",\\\"discount_classes\\\":\\\"1\\\",\\\"best_rates\\\":\\\"1\\\",\\\"trend_categories\\\":\\\"1\\\",\\\"testimonials\\\":\\\"1\\\",\\\"subscribes\\\":\\\"1\\\",\\\"blog\\\":\\\"1\\\",\\\"organizations\\\":\\\"1\\\",\\\"instructors\\\":\\\"1\\\",\\\"video_or_image_section\\\":\\\"1\\\",\\\"find_instructors\\\":\\\"1\\\",\\\"reward_program\\\":\\\"1\\\"}', NULL, NULL),
(15, 26, 'en', '{\\\"02nh9a\\\":{\\\"title\\\":\\\"Home\\\",\\\"link\\\":\\\"\\/\\\",\\\"order\\\":\\\"1\\\"},\\\"KdQzaR\\\":{\\\"title\\\":\\\"About MK\\\",\\\"link\\\":\\\"\\/aboutus\\\",\\\"order\\\":\\\"2\\\"},\\\"5cgPiY\\\":{\\\"title\\\":\\\"Services\\\",\\\"link\\\":\\\"\\/services\\\",\\\"order\\\":\\\"3\\\"},\\\"ED4GaF\\\":{\\\"title\\\":\\\"Courses\\\",\\\"link\\\":\\\"\\/courses\\\",\\\"order\\\":\\\"5\\\"},\\\"dRjckU\\\":{\\\"title\\\":\\\"Products\\\",\\\"link\\\":\\\"\\/publications\\\",\\\"order\\\":\\\"6\\\"},\\\"tD4Lkk\\\":{\\\"title\\\":\\\"Collaborate\\\",\\\"link\\\":\\\"\\/collaborate\\\",\\\"order\\\":\\\"8\\\"},\\\"URaNN9\\\":{\\\"title\\\":\\\"Webinars & In Person\\\",\\\"link\\\":\\\"\\/in-person-courses-and-live\\\",\\\"order\\\":\\\"4\\\"},\\\"8mcA7z\\\":{\\\"title\\\":\\\"Contact Us\\\",\\\"link\\\":\\\"\\/contactus\\\",\\\"order\\\":\\\"7\\\"}}', NULL, NULL),
(16, 27, 'en', '{\\\"link\\\":\\\"\\/classes\\\",\\\"title\\\":\\\"Start learning anywhere, anytime...\\\",\\\"description\\\":\\\"Use Chamivs SMS to access high-quality education materials without any limitations in the easiest way.\\\",\\\"background\\\":\\\"\\/store\\/1\\/default_images\\/home_video_section.png\\\"}', NULL, NULL),
(17, 28, 'en', '{\\\"error_image\\\":\\\"\\/store\\/1\\/default_images\\/404.svg\\\",\\\"error_title\\\":\\\"Page not found!\\\",\\\"error_description\\\":\\\"Sorry, this page is not available...\\\"}', NULL, NULL),
(18, 29, 'en', '{\\\"link\\\":\\\"\\/classes?sort=newest\\\",\\\"background\\\":\\\"\\/store\\/1\\/sidebar-user.png\\\"}', NULL, NULL),
(19, 30, 'en', '{\\\"status\\\":\\\"0\\\",\\\"users_affiliate_status\\\":\\\"0\\\",\\\"affiliate_user_commission\\\":\\\"5\\\",\\\"store_affiliate_user_commission\\\":\\\"5\\\",\\\"affiliate_user_amount\\\":\\\"20\\\",\\\"referred_user_amount\\\":\\\"10\\\",\\\"referral_description\\\":\\\"You can share your affiliate URL you will get the above rewards when a user uses the platform.\\\"}', NULL, NULL),
(20, 4, 'en', '{\\\"first_column\\\":{\\\"title\\\":\\\"\\\",\\\"value\\\":\\\"\\\"},\\\"second_column\\\":{\\\"title\\\":\\\"\\\",\\\"value\\\":\\\"\\\"},\\\"third_column\\\":{\\\"title\\\":\\\"\\\",\\\"value\\\":\\\"\\\"},\\\"forth_column\\\":{\\\"title\\\":null,\\\"value\\\"\\\"}}', NULL, NULL),
(31, 4, 'ar', '{\\\"first_column\\\":{\\\"title\\\":\\\"\\\",\\\"value\\\":\\\"\\\"},\\\"second_column\\\":{\\\"title\\\":\\\"\\\",\\\"value\\\":\\\"\\\"},\\\"third_column\\\":{\\\"\\\",\\\"value\\\":\\\"\\\"},\\\"forth_column\\\":{\\\"title\\\":null,\\\"value\\\":\\\"\\\"}}', NULL, NULL),
(32, 31, 'en', '{\\\"agora_resolution\\\":null,\\\"agora_max_bitrate\\\":\\\"2260\\\",\\\"agora_min_bitrate\\\":\\\"1130\\\",\\\"agora_frame_rate\\\":\\\"15\\\",\\\"agora_live_streaming\\\":\\\"1\\\",\\\"agora_chat\\\":\\\"1\\\",\\\"agora_in_free_courses\\\":\\\"1\\\",\\\"agora_for_meeting\\\":\\\"0\\\",\\\"meeting_live_stream_type\\\":\\\"single\\\",\\\"course_live_stream_type\\\":\\\"single\\\",\\\"new_interactive_file\\\":\\\"0\\\",\\\"timezone_in_register\\\":\\\"0\\\",\\\"timezone_in_create_webinar\\\":\\\"0\\\",\\\"sequence_content_status\\\":\\\"1\\\",\\\"webinar_assignment_status\\\":\\\"1\\\",\\\"webinar_private_content_status\\\":\\\"0\\\",\\\"disable_view_content_after_user_register\\\":\\\"0\\\",\\\"course_forum_status\\\":\\\"0\\\",\\\"forums_status\\\":\\\"0\\\",\\\"direct_classes_payment_button_status\\\":\\\"1\\\",\\\"direct_bundles_payment_button_status\\\":\\\"1\\\",\\\"direct_products_payment_button_status\\\":\\\"0\\\",\\\"cookie_settings_status\\\":\\\"0\\\",\\\"mobile_app_status\\\":\\\"0\\\",\\\"maintenance_status\\\":\\\"0\\\",\\\"maintenance_access_key\\\":\\\"key\\\",\\\"extra_time_to_join_status\\\":\\\"1\\\",\\\"extra_time_to_join_default_value\\\":\\\"20\\\",\\\"show_other_register_method\\\":\\\"1\\\",\\\"show_certificate_additional_in_register\\\":\\\"0\\\",\\\"show_google_login_button\\\":\\\"0\\\",\\\"show_facebook_login_button\\\":\\\"0\\\",\\\"show_live_chat_widget\\\":\\\"0\\\",\\\"cashback_active\\\":\\\"0\\\",\\\"display_cashback_notice_in_the_product_page\\\":\\\"0\\\",\\\"display_minimum_amount_cashback_notices\\\":\\\"0\\\",\\\"available_session_apis\\\":[\\\"local\\\",\\\"big_blue_button\\\",\\\"zoom\\\",\\\"agora\\\",\\\"jitsi\\\"],\\\"available_sources\\\":[\\\"upload\\\",\\\"youtube\\\",\\\"vimeo\\\",\\\"external_link\\\",\\\"google_drive\\\",\\\"iframe\\\"],\\\"bunny_configs\\\":[],\\\"select_the_role_during_registration\\\":[\\\"teacher\\\",\\\"organization\\\"],\\\"waitlist_status\\\":\\\"0\\\",\\\"upcoming_courses_status\\\":\\\"0\\\",\\\"user_register_form\\\":null,\\\"instructor_register_form\\\":null,\\\"organization_register_form\\\":null,\\\"become_instructor_form\\\":null,\\\"become_organization_form\\\":null}', NULL, NULL),
(33, 32, 'en', '{\\\"image\\\":\\\"\\/store\\/1\\/default_images\\/home_sections_banners\\/instructor_finder_banner.jpg\\\",\\\"title\\\":\\\"Find the best instructor\\\",\\\"description\\\":\\\"Looking for an instructor? Find the best instructors according to different parameters like gender, skill level, price, meeting type, rating, etc.\\r\\nFind instructors on the map.\\\",\\\"button1\\\":{\\\"title\\\":\\\"Tutor Finder\\\",\\\"link\\\":\\\"\\/instructor-finder\\/wizard\\\"},\\\"button2\\\":{\\\"title\\\":\\\"Tutors on Map\\\",\\\"link\\\":\\\"\\/instructor-finder\\\"}}', NULL, NULL),
(34, 33, 'en', '{\\\"image\\\":\\\"\\/store\\/1\\/default_images\\/home_sections_banners\\/club_points_banner.png\\\",\\\"title\\\":\\\"Win Club Points\\\",\\\"description\\\":\\\"Use Chamivs SMS and win club points according to different activities.\\r\\nYou will be able to use your club points to get free prizes and courses. Start using the system now and collect points!\\\",\\\"button1\\\":{\\\"title\\\":\\\"Rewards\\\",\\\"link\\\":\\\"\\/reward-courses\\\"},\\\"button2\\\":{\\\"title\\\":\\\"Points Club\\\",\\\"link\\\":\\\"\\/panel\\/rewards\\\"}}', NULL, NULL),
(35, 34, 'en', '{\\\"status\\\":\\\"0\\\",\\\"exchangeable\\\":\\\"0\\\",\\\"exchangeable_unit\\\":null,\\\"want_more_points_link\\\":\\\"\\/pages\\/reward_points_system\\\"}', NULL, NULL),
(38, 37, 'en', '{\\\"status\\\":\\\"1\\\",\\\"show_packages_during_registration\\\":\\\"1\\\",\\\"force_user_to_select_a_package\\\":\\\"0\\\",\\\"enable_home_section\\\":\\\"1\\\"}', NULL, NULL),
(39, 38, 'en', '{\\\"status\\\":\\\"1\\\",\\\"courses_capacity\\\":\\\"20\\\",\\\"courses_count\\\":\\\"5\\\",\\\"meeting_count\\\":\\\"20\\\",\\\"product_count\\\":\\\"5\\\"}', NULL, NULL),
(40, 39, 'en', '{\\\"status\\\":\\\"0\\\",\\\"instructors_count\\\":\\\"5\\\",\\\"students_count\\\":\\\"30\\\",\\\"courses_capacity\\\":\\\"30\\\",\\\"courses_count\\\":\\\"10\\\",\\\"meeting_count\\\":\\\"40\\\",\\\"product_count\\\":\\\"10\\\"}', NULL, NULL),
(41, 40, 'en', '{\\\"image\\\":\\\"\\/store\\/1\\/default_images\\/home_sections_banners\\/become_instructor_banner.jpg\\\",\\\"title\\\":\\\"Become an instructor\\\",\\\"description\\\":\\\"Are you interested to be a part of our community?\\r\\nYou can be a part of our community by signing up as an instructor or organization.\\\",\\\"button1\\\":{\\\"title\\\":\\\"Become an Instructor\\\",\\\"link\\\":\\\"\\/become-instructor\\\"},\\\"button2\\\":{\\\"title\\\":\\\"Registration Packages\\\",\\\"link\\\":\\\"become-instructor\\/packages\\/\\\"}}', NULL, NULL),
(42, 8, 'ar', '{\\\"title\\\":\\\"\\u0645\\u062a\\u0639\\u0629 \\u0627\\u0644\\u062a\\u0639\\u0644\\u0645 \\u0648\\u0627\\u0644\\u062a\\u0639\\u0644\\u064a\\u0645 ...\\\",\\\"description\\\":\\\"Chamivs SMS \\u0639\\u0628\\u0627\\u0631\\u0629 \\u0639\\u0646 \\u0646\\u0638\\u0627\\u0645 \\u0623\\u0633\\u0627\\u0633\\u064a \\u062a\\u0639\\u0644\\u064a\\u0645\\u064a \\u0643\\u0627\\u0645\\u0644 \\u0627\\u0644\\u0645\\u064a\\u0632\\u0627\\u062a \\u064a\\u0633\\u0627\\u0639\\u062f \\u0627\\u0644\\u0645\\u062f\\u0631\\u0628\\u064a\\u0646 \\u0639\\u0644\\u0649 \\u0625\\u0646\\u0634\\u0627\\u0621 \\u0648\\u0646\\u0634\\u0631 \\u062f\\u0648\\u0631\\u0627\\u062a \\u0641\\u064a\\u062f\\u064a\\u0648 \\u0648\\u0641\\u0635\\u0648\\u0644 \\u0645\\u0628\\u0627\\u0634\\u0631\\u0629 \\u0648\\u062f\\u0648\\u0631\\u0627\\u062a \\u0646\\u0635\\u064a\\u0629 \\u0648\\u0643\\u0633\\u0628 \\u0627\\u0644\\u0645\\u0627\\u0644 \\u060c \\u0648\\u064a\\u0633\\u0627\\u0639\\u062f \\u0627\\u0644\\u0637\\u0644\\u0627\\u0628 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u062a\\u0639\\u0644\\u0645 \\u0628\\u0623\\u0633\\u0647\\u0644 \\u0637\\u0631\\u064a\\u0642\\u0629.\\\",\\\"hero_background\\\":\\\"\\/store\\/1\\/default_images\\/hero_1.jpg\\\"}', NULL, NULL),
(43, 8, 'es', '{\\\"title\\\":\\\"Alegr\\u00eda de aprender y ense\\u00f1ar ...\\\",\\\"description\\\":\\\"Chamivs SMS es una plataforma educativa con todas las funciones que ayuda a los instructores a crear y publicar cursos de video, clases en vivo y cursos de texto y ganar dinero, y ayuda a los estudiantes a aprender de la manera m\\u00e1s f\\u00e1cil.\\\",\\\"hero_background\\\":\\\"\\/store\\/1\\/default_images\\/hero_1.jpg\\\"}', NULL, NULL),
(44, 15, 'ar', '{\\\"title\\\":\\\"\\u0645\\u062a\\u0639\\u0629 \\u0627\\u0644\\u062a\\u0639\\u0644\\u0645 \\u0648\\u0627\\u0644\\u062a\\u0639\\u0644\\u064a\\u0645 ...\\\",\\\"description\\\":\\\"Chamivs SMS \\u0639\\u0628\\u0627\\u0631\\u0629 \\u0639\\u0646 \\u0646\\u0638\\u0627\\u0645 \\u0623\\u0633\\u0627\\u0633\\u064a \\u062a\\u0639\\u0644\\u064a\\u0645\\u064a \\u0643\\u0627\\u0645\\u0644 \\u0627\\u0644\\u0645\\u064a\\u0632\\u0627\\u062a \\u064a\\u0633\\u0627\\u0639\\u062f \\u0627\\u0644\\u0645\\u062f\\u0631\\u0628\\u064a\\u0646 \\u0639\\u0644\\u0649 \\u0625\\u0646\\u0634\\u0627\\u0621 \\u0648\\u0646\\u0634\\u0631 \\u062f\\u0648\\u0631\\u0627\\u062a \\u0641\\u064a\\u062f\\u064a\\u0648 \\u0648\\u0641\\u0635\\u0648\\u0644 \\u0645\\u0628\\u0627\\u0634\\u0631\\u0629 \\u0648\\u062f\\u0648\\u0631\\u0627\\u062a \\u0646\\u0635\\u064a\\u0629 \\u0648\\u0643\\u0633\\u0628 \\u0627\\u0644\\u0645\\u0627\\u0644 \\u060c \\u0648\\u064a\\u0633\\u0627\\u0639\\u062f \\u0627\\u0644\\u0637\\u0644\\u0627\\u0628 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u062a\\u0639\\u0644\\u0645 \\u0628\\u0623\\u0633\\u0647\\u0644 \\u0637\\u0631\\u064a\\u0642\\u0629.\\\",\\\"hero_background\\\":\\\"\\/assets\\/default\\/img\\/home\\/world.png\\\",\\\"hero_vector\\\":\\\"\\/store\\/1\\/animated-header.json\\\",\\\"has_lottie\\\":\\\"1\\\"}', NULL, NULL),
(45, 15, 'es', '{\\\"title\\\":\\\"Alegr\\u00eda de aprender y ense\\u00f1ar ...\\\",\\\"description\\\":\\\"Chamivs SMS es una plataforma educativa con todas las funciones que ayuda a los instructores a crear y publicar cursos de video, clases en vivo y cursos de texto y ganar dinero, y ayuda a los estudiantes a aprender de la manera m\\u00e1s f\\u00e1cil.\\\",\\\"hero_background\\\":\\\"\\/assets\\/default\\/img\\/home\\/world.png\\\",\\\"hero_vector\\\":\\\"\\/store\\/1\\/animated-header.json\\\",\\\"has_lottie\\\":\\\"1\\\"}', NULL, NULL),
(46, 27, 'ar', '{\\\"link\\\":\\\"\\/classes\\\",\\\"title\\\":\\\"\\u0627\\u0628\\u062f\\u0623 \\u0627\\u0644\\u062a\\u0639\\u0644\\u0645 \\u0641\\u064a \\u0623\\u064a \\u0645\\u0643\\u0627\\u0646 \\u0648\\u0641\\u064a \\u0623\\u064a \\u0648\\u0642\\u062a ...\\\",\\\"description\\\":\\\"\\u0627\\u0633\\u062a\\u062e\\u062f\\u0645 Chamivs SMS \\u0644\\u0644\\u0648\\u0635\\u0648\\u0644 \\u0625\\u0644\\u0649 \\u0645\\u0648\\u0627\\u062f \\u062a\\u0639\\u0644\\u064a\\u0645\\u064a\\u0629 \\u0639\\u0627\\u0644\\u064a\\u0629 \\u0627\\u0644\\u062c\\u0648\\u062f\\u0629 \\u062f\\u0648\\u0646 \\u0623\\u064a \\u0642\\u064a\\u0648\\u062f \\u0648\\u0628\\u0623\\u0633\\u0647\\u0644 \\u0637\\u0631\\u064a\\u0642\\u0629.\\\",\\\"background\\\":\\\"\\/store\\/1\\/default_images\\/home_video_section.png\\\"}', NULL, NULL),
(47, 27, 'es', '{\\\"link\\\":\\\"\\/classes\\\",\\\"title\\\":\\\"Empiece a aprender en cualquier lugar, en cualquier momento ...\\\",\\\"description\\\":\\\"Utilice Chamivs SMS para acceder a materiales educativos de alta calidad sin limitaciones de la forma m\\u00e1s sencilla.\\\",\\\"background\\\":\\\"\\/store\\/1\\/default_images\\/home_video_section.png\\\"}', NULL, NULL),
(48, 29, 'ar', '{\\\"link\\\":\\\"\\/classes?sort=newest\\\",\\\"background\\\":\\\"\\/store\\/1\\/sidebar-user-ar.png\\\"}', NULL, NULL),
(49, 29, 'es', '{\\\"link\\\":\\\"\\/classes?sort=newest\\\",\\\"background\\\":\\\"\\/store\\/1\\/sidebar-user-sp.png\\\"}', NULL, NULL),
(50, 4, 'es', '{\\\"first_column\\\":{\\\"title\\\":\\\"Sobre Nosotras\\\",\\\"value\\\":\\\"<p><font color=\\\\\"#ffffff\\\\\">Chamivs SMS es un sistema de gesti\\u00f3n de aprendizaje con todas las funciones que le ayuda a gestionar su negocio educativo en varias horas. Esta plataforma ayuda a los instructores a crear materiales educativos profesionales y ayuda a los estudiantes a aprender de los mejores instructores.<\\/font><\\/p>\\\"},\\\"second_column\\\":{\\\"title\\\":\\\"Enlaces Adicionales\\\",\\\"value\\\":\\\"<p><a href=\\\\\"\\/login\\\\\"><span style=\\\\\"color: #ffffff;\\\\\">- Acceso<\\/span><\\/a><\\/p>\\r\\n<p><span style=\\\\\"color: #ffffff;\\\\\"><a href=\\\\\"\\/register\\\\\"><span style=\\\\\"color: #ffffff;\\\\\">- Registrarse<\\/span><\\/a><br><\\/span><\\/p>\\r\\n<p><a href=\\\\\"\\/blog\\\\\"><span style=\\\\\"color: #ffffff;\\\\\">- Blog<\\/span><\\/a><\\/p>\\r\\n<p><a href=\\\\\"\\/contact\\\\\"><span style=\\\\\"color: #ffffff;\\\\\">- Contacta con nosotras<\\/span><\\/a><\\/p>\\r\\n<p><span style=\\\\\"color: #ffffff;\\\\\"><a href=\\\\\"\\/certificate_validation\\\\\"><span style=\\\\\"color: #ffffff;\\\\\">- Validaci\\u00f3n de certificado<\\/span><\\/a><br><\\/span><\\/p>\\r\\n<p><span style=\\\\\"color: #ffffff;\\\\\"><a href=\\\\\"\\/become-instructor\\\\\"><span style=\\\\\"color: #ffffff;\\\\\">- Convi\\u00e9rtete en instructor<\\/span><\\/a><br><\\/span><\\/p>\\r\\n<p><a href=\\\\\"\\/pages\\/terms\\\\\"><span style=\\\\\"color: #ffffff;\\\\\">- T\\u00e9rminos y reglas<\\/span><\\/a><\\/p>\\r\\n<p><a href=\\\\\"\\/pages\\/about\\\\\"><span style=\\\\\"color: #ffffff;\\\\\">- Sobre nosotras<\\/span><\\/a><\\/p>\\\"},\\\"third_column\\\":{\\\"title\\\":\\\"Negocios Similares\\\",\\\"value\\\":\\\"<p><a href=\\\\\"https:\\/\\/www.udemy.com\\/\\\\\" target=\\\\\"_blank\\\\\"><font color=\\\\\"#ffffff\\\\\">- Udemy<\\/font><\\/a><\\/p><p><a href=\\\\\"https:\\/\\/www.skillshare.com\\/\\\\\" target=\\\\\"_blank\\\\\"><font color=\\\\\"#ffffff\\\\\">- Skillshare<\\/font><\\/a><\\/p><p><a href=\\\\\"https:\\/\\/www.coursera.org\\/\\\\\" target=\\\\\"_blank\\\\\"><font color=\\\\\"#ffffff\\\\\">- Coursera<\\/font><\\/a><\\/p><p><a href=\\\\\"https:\\/\\/www.linkedin.com\\/learning\\/\\\\\" target=\\\\\"_blank\\\\\"><font color=\\\\\"#ffffff\\\\\">- Lynda<\\/font><\\/a><\\/p><p><a href=\\\\\"https:\\/\\/www.skillsoft.com\\/\\\\\" target=\\\\\"_blank\\\\\"><font color=\\\\\"#ffffff\\\\\">- Skillsoft<\\/font><\\/a><\\/p><p><a href=\\\\\"https:\\/\\/www.udacity.com\\/\\\\\" target=\\\\\"_blank\\\\\"><font color=\\\\\"#ffffff\\\\\">- Udacity<\\/font><\\/a><\\/p><p><a href=\\\\\"https:\\/\\/www.edx.org\\/\\\\\" target=\\\\\"_blank\\\\\"><font color=\\\\\"#ffffff\\\\\">- edX<\\/font><\\/a><\\/p><p><a href=\\\\\"https:\\/\\/www.masterclass.com\\/\\\\\" target=\\\\\"_blank\\\\\"><font color=\\\\\"#ffffff\\\\\">- Masterclass<\\/font><\\/a><br><\\/p>\\\"},\\\"forth_column\\\":{\\\"title\\\":\\\"Compra Chamivs SMS\\\",\\\"value\\\":\\\"<p><a title=\\\\\"Notnt\\\\\" href=\\\\\"https:\\/\\/codecanyon.net\\\\\"><img style=\\\\\"width: 200px;\\\\\" src=\\\\\"\\/store\\/1\\/default_images\\/envato.png\\\\\"><\\/a><\\/p>\\\"}}', NULL, NULL),
(53, 32, 'ar', '{\\\"image\\\":\\\"\\/store\\/1\\/default_images\\/home_sections_banners\\/instructor_finder_banner.jpg\\\",\\\"title\\\":\\\"\\u0627\\u0639\\u062b\\u0631 \\u0639\\u0644\\u0649 \\u0623\\u0641\\u0636\\u0644 \\u0645\\u062f\\u0631\\u0628\\\",\\\"description\\\":\\\"\\u062a\\u0628\\u062d\\u062b \\u0639\\u0646 \\u0645\\u062f\\u0631\\u0628\\u061f \\u0627\\u0639\\u062b\\u0631 \\u0639\\u0644\\u0649 \\u0623\\u0641\\u0636\\u0644 \\u0627\\u0644\\u0645\\u062f\\u0631\\u0628\\u064a\\u0646 \\u0648\\u0641\\u0642\\u064b\\u0627 \\u0644\\u0645\\u0639\\u0627\\u064a\\u064a\\u0631 \\u0645\\u062e\\u062a\\u0644\\u0641\\u0629 \\u0645\\u062b\\u0644 \\u0627\\u0644\\u062c\\u0646\\u0633 \\u0648\\u0645\\u0633\\u062a\\u0648\\u0649 \\u0627\\u0644\\u0645\\u0647\\u0627\\u0631\\u0629 \\u0648\\u0627\\u0644\\u0633\\u0639\\u0631 \\u0648\\u0646\\u0648\\u0639 \\u0627\\u0644\\u0627\\u062c\\u062a\\u0645\\u0627\\u0639 \\u0648\\u0627\\u0644\\u062a\\u0642\\u064a\\u064a\\u0645 \\u0648\\u0645\\u0627 \\u0625\\u0644\\u0649 \\u0630\\u0644\\u0643.\\r\\n\\u0627\\u0628\\u062d\\u062b \\u0639\\u0646 \\u0645\\u062f\\u0631\\u0628\\u064a\\u0646 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u062e\\u0631\\u064a\\u0637\\u0629.\\\",\\\"button1\\\":{\\\"title\\\":\\\"\\u0627\\u0644\\u0628\\u0627\\u062d\\u062b \\u0639\\u0646 \\u0627\\u0644\\u0645\\u0639\\u0644\\u0645\\\",\\\"link\\\":\\\"\\/instructor-finder\\/wizard\\\"},\\\"button2\\\":{\\\"title\\\":\\\"\\u0645\\u062f\\u0631\\u0633\\u0648\\u0646 \\u0639\\u0644\\u0649 \\u0627\\u0644\\u062e\\u0631\\u064a\\u0637\\u0629\\\",\\\"link\\\":\\\"\\/instructor-finder\\\"}}', NULL, NULL),
(54, 32, 'es', '{\\\"image\\\":\\\"\\/store\\/1\\/default_images\\/home_sections_banners\\/instructor_finder_banner.jpg\\\",\\\"title\\\":\\\"Encuentra la mejor instructora\\\",\\\"description\\\":\\\"\\u00bfBuscas un instructor? Encuentre los mejores instructores seg\\u00fan diferentes par\\u00e1metros como g\\u00e9nero, nivel de habilidad, precio, tipo de reuni\\u00f3n, calificaci\\u00f3n, etc.\\r\\nEncuentra instructores en el mapa.\\\",\\\"button1\\\":{\\\"title\\\":\\\"Buscadora de tutores\\\",\\\"link\\\":\\\"\\/instructor-finder\\/wizard\\\"},\\\"button2\\\":{\\\"title\\\":\\\"Tutores en el mapa\\\",\\\"link\\\":\\\"\\/instructor-finder\\\"}}', NULL, NULL),
(55, 33, 'ar', '{\\\"image\\\":\\\"\\/store\\/1\\/default_images\\/home_sections_banners\\/club_points_banner.png\\\",\\\"title\\\":\\\"\\u0627\\u0631\\u0628\\u062d \\u0646\\u0642\\u0627\\u0637 \\u0627\\u0644\\u0646\\u0627\\u062f\\u064a\\\",\\\"description\\\":\\\"\\u0627\\u0633\\u062a\\u062e\\u062f\\u0645 Chamivs SMS \\u0648\\u0627\\u0631\\u0628\\u062d \\u0646\\u0642\\u0627\\u0637 \\u0627\\u0644\\u0646\\u0627\\u062f\\u064a \\u0648\\u0641\\u0642\\u064b\\u0627 \\u0644\\u0644\\u0623\\u0646\\u0634\\u0637\\u0629 \\u0627\\u0644\\u0645\\u062e\\u062a\\u0644\\u0641\\u0629.\\r\\n\\u0633\\u062a\\u062a\\u0645\\u0643\\u0646 \\u0645\\u0646 \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u0646\\u0642\\u0627\\u0637 \\u0627\\u0644\\u0646\\u0627\\u062f\\u064a \\u0627\\u0644\\u062e\\u0627\\u0635\\u0629 \\u0628\\u0643 \\u0644\\u0644\\u062d\\u0635\\u0648\\u0644 \\u0639\\u0644\\u0649 \\u062c\\u0648\\u0627\\u0626\\u0632 \\u0648\\u062f\\u0648\\u0631\\u0627\\u062a \\u0645\\u062c\\u0627\\u0646\\u064a\\u0629. \\u0627\\u0628\\u062f\\u0623 \\u0641\\u064a \\u0627\\u0633\\u062a\\u062e\\u062f\\u0627\\u0645 \\u0627\\u0644\\u0646\\u0638\\u0627\\u0645 \\u0627\\u0644\\u0622\\u0646 \\u0648\\u0627\\u062c\\u0645\\u0639 \\u0627\\u0644\\u0646\\u0642\\u0627\\u0637!\\\",\\\"button1\\\":{\\\"title\\\":\\\"\\u0627\\u0644\\u0645\\u0643\\u0627\\u0641\\u0622\\u062a\\\",\\\"link\\\":\\\"\\/reward-courses\\\"},\\\"button2\\\":{\\\"title\\\":\\\"\\u0646\\u0627\\u062f\\u064a \\u0627\\u0644\\u0646\\u0642\\u0627\\u0637\\\",\\\"link\\\":\\\"\\/panel\\/rewards\\\"}}', NULL, NULL),
(56, 33, 'es', '{\\\"image\\\":\\\"\\/store\\/1\\/default_images\\/home_sections_banners\\/club_points_banner.png\\\",\\\"title\\\":\\\"Gana puntos del club\\\",\\\"description\\\":\\\"Utilice Chamivs SMS y gane puntos del club seg\\u00fan diferentes actividades.\\r\\nPodr\\u00e1s utilizar tus puntos del club para conseguir premios y cursos gratuitos. \\u00a1Comience a usar el sistema ahora y acumule puntos!\\\",\\\"button1\\\":{\\\"title\\\":\\\"Recompensas\\\",\\\"link\\\":\\\"\\/reward-courses\\\"},\\\"button2\\\":{\\\"title\\\":\\\"club de puntos\\\",\\\"link\\\":\\\"\\/panel\\/rewards\\\"}}', NULL, NULL),
(57, 40, 'ar', '{\\\"image\\\":\\\"\\/store\\/1\\/default_images\\/home_sections_banners\\/become_instructor_banner.jpg\\\",\\\"title\\\":\\\"\\u0643\\u0646 \\u0645\\u062f\\u0631\\u0628\\u064b\\u0627\\\",\\\"description\\\":\\\"\\u0647\\u0644 \\u0623\\u0646\\u062a \\u0645\\u0647\\u062a\\u0645 \\u0628\\u0623\\u0646 \\u062a\\u0643\\u0648\\u0646 \\u062c\\u0632\\u0621\\u064b\\u0627 \\u0645\\u0646 \\u0645\\u062c\\u062a\\u0645\\u0639\\u0646\\u0627\\u061f\\r\\n\\u064a\\u0645\\u0643\\u0646\\u0643 \\u0623\\u0646 \\u062a\\u0643\\u0648\\u0646 \\u062c\\u0632\\u0621\\u064b\\u0627 \\u0645\\u0646 \\u0645\\u062c\\u062a\\u0645\\u0639\\u0646\\u0627 \\u0645\\u0646 \\u062e\\u0644\\u0627\\u0644 \\u0627\\u0644\\u062a\\u0633\\u062c\\u064a\\u0644 \\u0643\\u0645\\u062f\\u0631\\u0628 \\u0623\\u0648 \\u0645\\u0646\\u0638\\u0645\\u0629.\\\",\\\"button1\\\":{\\\"title\\\":\\\"\\u0643\\u0646 \\u0645\\u062f\\u0631\\u0633\\u064b\\u0627\\\",\\\"link\\\":\\\"\\/become-instructor\\\"},\\\"button2\\\":{\\\"title\\\":\\\"\\u062d\\u0632\\u0645 \\u0627\\u0644\\u062a\\u0633\\u062c\\u064a\\u0644\\\",\\\"link\\\":\\\"become-instructor\\/packages\\/\\\"}}', NULL, NULL),
(58, 40, 'es', '{\\\"image\\\":\\\"\\/store\\/1\\/default_images\\/home_sections_banners\\/become_instructor_banner.jpg\\\",\\\"title\\\":\\\"Convi\\u00e9rtete en instructora\\\",\\\"description\\\":\\\"\\u00bfEst\\u00e1s interesado en ser parte de nuestra comunidad?\\r\\nPuedes ser parte de nuestra comunidad registr\\u00e1ndote como instructor u organizaci\\u00f3n.\\\",\\\"button1\\\":{\\\"title\\\":\\\"Convi\\u00e9rtete en instructora\\\",\\\"link\\\":\\\"\\/become-instructor\\\"},\\\"button2\\\":{\\\"title\\\":\\\"Paquetes de registro\\\",\\\"link\\\":\\\"become-instructor\\/packages\\/\\\"}}', NULL, NULL),
(59, 42, 'en', '{\\\"primary\\\":null,\\\"primary-border\\\":null,\\\"primary-hover\\\":null,\\\"primary-border-hover\\\":null,\\\"primary-btn-shadow\\\":null,\\\"primary-btn-shadow-hover\\\":null,\\\"primary-btn-color\\\":null,\\\"primary-btn-color-hover\\\":null,\\\"secondary\\\":null,\\\"secondary-border\\\":null,\\\"secondary-hover\\\":null,\\\"secondary-border-hover\\\":null,\\\"secondary-btn-shadow\\\":null,\\\"secondary-btn-shadow-hover\\\":null,\\\"secondary-btn-color\\\":null,\\\"secondary-btn-color-hover\\\":null,\\\"admin_primary\\\":\\\"#6777ef\\\"}', NULL, NULL),
(60, 44, 'en', '{\\\"cookie_settings_modal_message\\\":\\\"<p>When you visit any of our websites, it may store or retrieve information on your browser, mostly in the form of cookies. This information might be about you, your preferences or your device and is mostly used to make the site work as you expect it to. The information does not usually directly identify you, but it can give you a more personalized web experience. Because we respect your right to privacy, you can choose not to allow some types of cookies. Click on the different category headings to find out more and manage your preferences. Please note, that blocking some types of cookies may impact your experience of the site and the services we are able to offer.<\\/p>\\\",\\\"cookie_settings_modal_items\\\":{\\\"dDRjfkGvQfFzQJpa\\\":{\\\"title\\\":\\\"Strictly Necessary\\\",\\\"description\\\":\\\"These cookies are necessary for our website to function properly and cannot be switched off in our systems. They are usually only set in response to actions made by you that amount to a request for services, such as setting your privacy preferences, logging in or filling in forms, or where they\\u2019re essential to providing you with a service you have requested. You cannot opt out of these cookies. You can set your browser to block or alert you about these cookies, but if you do, some parts of the site will not then work. These cookies do not store any personally identifiable information.\\\",\\\"required\\\":\\\"1\\\"},\\\"mOzJowgvTnWFlRzz\\\":{\\\"title\\\":\\\"Performance Cookies\\\",\\\"description\\\":\\\"These cookies allow us to count visits and traffic sources so we can measure and improve the performance of our site. They help us to know which pages are the most and least popular and see how visitors move around the site, which helps us optimize your experience. All information these cookies collect is aggregated and therefore anonymous. If you do not allow these cookies we will not be able to use your data in this way.\\\",\\\"required\\\":\\\"0\\\"},\\\"XBMtdYaeSrqMicTH\\\":{\\\"title\\\":\\\"Functional Cookies\\\",\\\"description\\\":\\\"These cookies enable the website to provide enhanced functionality and personalization. They may be set by us or by third-party providers whose services we have added to our pages. If you do not allow these cookies then some or all of these services may not function properly.\\\",\\\"required\\\":\\\"0\\\"},\\\"XlLqzsvNpRqdcNWP\\\":{\\\"title\\\":\\\"Targeting Cookies\\\",\\\"description\\\":\\\"These cookies may be set through our site by our advertising partners. They may be used by those companies to build a profile of your interests and show you relevant adverts on other sites. They do not store directly personal information but are based on uniquely identifying your browser and internet device. If you do not allow these cookies, you will experience less targeted advertising.\\\",\\\"required\\\":\\\"0\\\"}}}', NULL, NULL),
(61, 41, 'en', '{\\\"status\\\":\\\"1\\\",\\\"virtual_product_commission\\\":\\\"20\\\",\\\"physical_product_commission\\\":\\\"10\\\",\\\"store_tax\\\":\\\"10\\\",\\\"possibility_create_virtual_product\\\":\\\"0\\\",\\\"possibility_create_physical_product\\\":\\\"0\\\",\\\"shipping_tracking_url\\\":\\\"https:\\/\\/www.tracking.my\\/\\\",\\\"activate_comments\\\":\\\"0\\\",\\\"show_address_selection_in_cart\\\":\\\"0\\\",\\\"take_address_selection_optional\\\":\\\"0\\\"}', NULL, NULL),
(62, 46, 'en', '{\\\"main\\\":{\\\"regular\\\":\\\"\\/store\\/1\\/fonts\\/montserrat-regular.woff2\\\",\\\"bold\\\":\\\"\\/store\\/1\\/fonts\\/montserrat-bold.woff2\\\",\\\"medium\\\":\\\"\\/store\\/1\\/fonts\\/montserrat-medium.woff2\\\"},\\\"rtl\\\":{\\\"regular\\\":\\\"\\/store\\/1\\/fonts\\/Vazir-Regular.woff2\\\",\\\"bold\\\":\\\"\\/store\\/1\\/fonts\\/Vazir-Bold.woff2\\\",\\\"medium\\\":\\\"\\/store\\/1\\/fonts\\/Vazir-Medium.woff2\\\"}}', NULL, NULL),
(63, 43, 'en', '{\\\"image\\\":\\\"\\/store\\/1\\/default_images\\/forums\\/forum_section.jpg\\\",\\\"title\\\":\\\"Have a Question? Ask it in forum and get answer\\\",\\\"description\\\":\\\"Our forums helps you to create your questions on different subjects and communicate with other forum users. Our users will help you to get the best answer!\\\",\\\"button1\\\":{\\\"title\\\":\\\"Create a new topic\\\",\\\"link\\\":\\\"\\/forums\\/create-topic\\\"},\\\"button2\\\":{\\\"title\\\":\\\"Browse forums\\\",\\\"link\\\":\\\"\\/forums\\\"}}', NULL, NULL),
(64, 45, 'en', '{\\\"mobile_app_hero_image\\\":\\\"\\/store\\/1\\/default_images\\/app_only.png\\\",\\\"mobile_app_description\\\":\\\"<div>Is an amazing, modern, and clean landing page for showcasing your app or anything else.<\\/div><div><br><\\/div><div>A mobile application or app is a computer program or software application designed to run on a mobile device such as a phone, tablet, or watch. Mobile applications often stand in contrast to desktop applications which are designed to run on desktop computers, and web applications which run in mobile web browsers rather than directly on the mobile device.<\\/div>\\\",\\\"mobile_app_buttons\\\":{\\\"htQgcSjzjLJlGRyY\\\":{\\\"title\\\":\\\"Download from Play Store\\\",\\\"link\\\":\\\"https:\\/\\/play.google.com\\/store\\/games\\\",\\\"icon\\\":\\\"\\/store\\/1\\/default_images\\/google-play.png\\\",\\\"color\\\":\\\"primary\\\"}}}', NULL, NULL),
(65, 48, 'en', '{\\\"image\\\":\\\"\\/store\\/1\\/default_images\\/ads_modal.png\\\",\\\"title\\\":\\\"Sales Campaign\\\",\\\"description\\\":\\\"We have a sales campaign on our promoted courses and products. You can purchase 150 products at a discounted price up to 50% discount.\\\",\\\"button1\\\":{\\\"title\\\":\\\"View Courses\\\",\\\"link\\\":\\\"\\/classes\\\"},\\\"button2\\\":{\\\"title\\\":\\\"View Products\\\",\\\"link\\\":\\\"\\/products\\\"}}', NULL, NULL),
(66, 52, 'en', '{\\\"show_guarantee_text\\\":\\\"0\\\",\\\"guarantee_text\\\":\\\"5 Days money back guarantee\\\",\\\"user_avatar_style\\\":\\\"ui_avatar\\\",\\\"default_user_avatar\\\":\\\"\\/store\\/1\\/default_images\\/default_profile.jpg\\\",\\\"platform_phone_and_email_position\\\":\\\"footer\\\"}', NULL, NULL),
(67, 47, 'en', '{\\\"webinar_reminder_schedule\\\":\\\"1\\\",\\\"meeting_reminder_schedule\\\":\\\"1\\\",\\\"subscribe_reminder_schedule\\\":\\\"48\\\"}', NULL, NULL),
(68, 61, 'en', '{\\\"offline_banks_status\\\":\\\"0\\\"}', NULL, NULL),
(69, 62, 'en', '{\\\"status\\\":\\\"1\\\",\\\"allow_sending_gift_for_courses\\\":\\\"1\\\",\\\"allow_sending_gift_for_bundles\\\":\\\"1\\\",\\\"allow_sending_gift_for_products\\\":\\\"1\\\"}', NULL, NULL),
(70, 63, 'en', '{\\\"status\\\":\\\"0\\\",\\\"unlock_registration_bonus_instantly\\\":\\\"0\\\",\\\"unlock_registration_bonus_with_referral\\\":\\\"0\\\",\\\"number_of_referred_users\\\":null,\\\"enable_referred_users_purchase\\\":\\\"0\\\",\\\"purchase_amount_for_unlocking_bonus\\\":null,\\\"registration_bonus_amount\\\":\\\"50\\\",\\\"bonus_wallet\\\":\\\"balance_wallet\\\"}', NULL, NULL),
(71, 57, 'en', '{\\\"enable_statistics\\\":\\\"1\\\",\\\"display_default_statistics\\\":\\\"1\\\"}', NULL, NULL),
(72, 56, 'en', '{\\\"currency\\\":\\\"USD\\\",\\\"currency_position\\\":\\\"right\\\",\\\"currency_separator\\\":\\\"dot\\\",\\\"currency_decimal\\\":\\\"2\\\",\\\"multi_currency\\\":\\\"1\\\"}', NULL, NULL),
(73, 53, 'en', '{\\\"login_device_limit\\\":\\\"0\\\",\\\"number_of_allowed_devices\\\":\\\"10\\\",\\\"captcha_for_admin_login\\\":\\\"0\\\",\\\"captcha_for_admin_forgot_pass\\\":\\\"0\\\",\\\"captcha_for_login\\\":\\\"0\\\",\\\"captcha_for_register\\\":\\\"0\\\",\\\"captcha_for_forgot_pass\\\":\\\"0\\\",\\\"admin_panel_url\\\":\\\"admin\\\"}', NULL, NULL),
(74, 54, 'en', '{\\\"status\\\":\\\"0\\\",\\\"disable_course_access_when_user_have_an_overdue_installment\\\":\\\"0\\\",\\\"disable_all_courses_access_when_user_have_an_overdue_installment\\\":\\\"0\\\",\\\"disable_instalments_when_the_user_have_an_overdue_installment\\\":\\\"1\\\",\\\"allow_cancel_verification\\\":\\\"1\\\",\\\"display_installment_button\\\":\\\"1\\\",\\\"overdue_interval_days\\\":\\\"3\\\",\\\"installment_plans_position\\\":\\\"top_of_page\\\",\\\"reminder_before_overdue_days\\\":\\\"3\\\",\\\"reminder_after_overdue_days\\\":\\\"2\\\"}', NULL, NULL),
(75, 58, 'en', '{\\\"title\\\":\\\"We are under maintenance!\\\",\\\"image\\\":\\\"\\/store\\/1\\/default_images\\/maintenance.png\\\",\\\"description\\\":\\\"We are working on the platform; It won\'t take a long time. We will try to back as soon as possible.\\\",\\\"maintenance_button\\\":{\\\"title\\\":\\\"Sample Button\\\",\\\"link\\\":\\\"\\/\\\"},\\\"end_date\\\":1740094200}', NULL, NULL),
(76, 64, 'en', '{\\\"term_image\\\":\\\"\",\\\"items\\\":{\\\"DnrPr\\\":{\\\"icon\\\":\\\"\\/store\\/1\\/default_images\\/registration bonus\\/step1.svg\\\",\\\"title\\\":\\\"Sign up\\\",\\\"description\\\":\\\"Create an account on platform and get $50\\\"},\\\"eNMTB\\\":{\\\"icon\\\":\\\"\\/store\\/1\\/default_images\\/registration bonus\\/step2.svg\\\",\\\"title\\\":\\\"Refer your friends\\\",\\\"description\\\":\\\"Refer at least 5 users to the system using your affiliate URL\\\"},\\\"fdIUc\\\":{\\\"icon\\\":\\\"\\/store\\/1\\/default_images\\/registration bonus\\/step3.svg\\\",\\\"title\\\":\\\"Reach purchase target\\\",\\\"description\\\":\\\"Each referred user should purchase $100 on the platform\\\"},\\\"oeMZr\\\":{\\\"icon\\\":\\\"\\/store\\/1\\/default_images\\/registration bonus\\/step4.svg\\\",\\\"title\\\":\\\"Unlock your bonus\\\",\\\"description\\\":\\\"Your bonus will be unlocked! Enjoy spending...\\\"}}}', NULL, NULL),
(77, 55, 'en', '{\\\"terms_description\\\":\\\"\\\"}', NULL, NULL),
(78, 65, 'en', '{\\\"status\\\":\\\"1\\\",\\\"active_for_admin_panel\\\":\\\"1\\\",\\\"active_for_organization_panel\\\":\\\"1\\\",\\\"active_for_instructor_panel\\\":\\\"1\\\",\\\"secret_key\\\":null,\\\"activate_text_service_type\\\":\\\"1\\\",\\\"text_service_type\\\":\\\"gpt-3.5-turbo\\\",\\\"number_of_text_generated_per_request\\\":\\\"1\\\",\\\"max_tokens\\\":\\\"500\\\",\\\"activate_image_service_type\\\":\\\"1\\\",\\\"number_of_images_generated_per_request\\\":\\\"1\\\"}', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `social_situations`
--

CREATE TABLE `social_situations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `situation` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_situations`
--

INSERT INTO `social_situations` (`id`, `situation`, `note`, `created_at`, `updated_at`) VALUES
(1, 'أعزب', NULL, '2024-07-30 23:11:44', '2024-07-30 23:11:44'),
(2, 'متزوج', NULL, '2024-07-30 23:11:51', '2024-07-30 23:11:51');

-- --------------------------------------------------------

--
-- Table structure for table `social_traits`
--

CREATE TABLE `social_traits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `social_traits`
--

INSERT INTO `social_traits` (`id`, `name`, `note`, `created_at`, `updated_at`) VALUES
(2, 'صفة 1', '', '2024-07-30 21:05:08', '2024-07-30 21:05:08'),
(3, 'صفة 2', '', '2024-07-30 21:05:18', '2024-07-30 21:05:18'),
(4, 'صفة 3', '', '2024-07-30 21:05:26', '2024-07-30 21:05:26');

-- --------------------------------------------------------

--
-- Table structure for table `sort_of_employments`
--

CREATE TABLE `sort_of_employments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `kind_of_employment_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sort_of_employments`
--

INSERT INTO `sort_of_employments` (`id`, `name`, `kind_of_employment_id`, `created_at`, `updated_at`) VALUES
(9, 'مدرس', 1, '2024-08-02 20:42:06', '2024-08-02 20:42:06'),
(10, 'معلم صف', 1, '2024-08-02 20:42:18', '2024-08-02 20:42:18'),
(11, 'مدرس مساعد', 1, '2024-08-02 20:42:33', '2024-08-02 20:42:33'),
(12, 'معلم', 1, '2024-08-02 20:42:48', '2024-08-02 20:42:48'),
(13, 'معلم حرفة', 1, '2024-08-02 20:43:06', '2024-08-02 20:43:06'),
(14, 'ادارة', 2, '2024-08-02 20:43:34', '2024-08-02 20:43:34'),
(15, 'خدمات', 3, '2024-08-02 20:44:00', '2024-08-02 20:44:00');

-- --------------------------------------------------------

--
-- Table structure for table `special_needs_types`
--

CREATE TABLE `special_needs_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `special_needs_types`
--

INSERT INTO `special_needs_types` (`id`, `type`, `note`, `created_at`, `updated_at`) VALUES
(1, 'بصرية', NULL, '2024-07-31 00:07:55', '2024-07-31 00:08:03'),
(2, 'سمعية', NULL, '2024-07-31 00:08:11', '2024-07-31 00:08:11'),
(3, 'حركية', NULL, '2024-07-31 00:08:17', '2024-07-31 00:08:17'),
(4, 'صعوبات تعلم', NULL, '2024-07-31 00:08:26', '2024-07-31 00:08:26'),
(5, 'اضطرابات تفسية', NULL, '2024-07-31 00:08:35', '2024-07-31 00:08:35');

-- --------------------------------------------------------

--
-- Table structure for table `stages`
--

CREATE TABLE `stages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stages`
--

INSERT INTO `stages` (`id`, `name`, `note`, `created_at`, `updated_at`) VALUES
(4, 'رياض الأطفال', NULL, '2024-08-01 17:41:46', '2024-08-01 17:41:46'),
(5, 'الفئة ب', NULL, '2024-08-01 17:41:57', '2024-08-01 17:57:00'),
(6, 'مرحلة التعليم الأساسي', NULL, '2024-08-01 17:42:16', '2024-08-01 17:42:16'),
(7, 'مرحلة التعليم الثانوي', NULL, '2024-08-01 17:42:38', '2024-08-01 17:42:38'),
(8, 'المعاهد', NULL, '2024-08-01 17:42:52', '2024-08-01 17:42:52');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL COMMENT 'الاسم الأول',
  `last_name` varchar(255) NOT NULL COMMENT 'الاسم الأخير',
  `name_ar` varchar(255) NOT NULL COMMENT 'الاسم باللغة العربية',
  `name_en` varchar(255) NOT NULL COMMENT 'الاسم باللغة الانجليزية',
  `email` varchar(255) NOT NULL COMMENT 'البريد الإلكتروني',
  `password` varchar(255) NOT NULL COMMENT 'كلمة المرور',
  `birthdate` date NOT NULL COMMENT 'تاريخ الميلاد',
  `gender` enum('male','female') NOT NULL COMMENT 'الجنس',
  `nationality_id` bigint(20) UNSIGNED NOT NULL COMMENT 'الجنسية',
  `blood_type_id` bigint(20) UNSIGNED NOT NULL COMMENT 'فصيلة الدم',
  `religion_id` bigint(20) UNSIGNED NOT NULL COMMENT 'الديانة',
  `national_id` varchar(255) NOT NULL COMMENT 'الرقم الوطني',
  `passport_id` varchar(255) NOT NULL COMMENT 'رقم جواز السفر',
  `phone` varchar(255) NOT NULL COMMENT 'رقم الهاتف',
  `mobile` varchar(255) NOT NULL COMMENT 'رقم الموبايل',
  `father_id` bigint(20) UNSIGNED NOT NULL COMMENT 'الأب',
  `mother_id` bigint(20) UNSIGNED NOT NULL COMMENT 'الأم',
  `record_place` varchar(255) NOT NULL COMMENT 'مكان القيد',
  `record_id` varchar(255) NOT NULL COMMENT 'رقم القيد',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `first_name`, `last_name`, `name_ar`, `name_en`, `email`, `password`, `birthdate`, `gender`, `nationality_id`, `blood_type_id`, `religion_id`, `national_id`, `passport_id`, `phone`, `mobile`, `father_id`, `mother_id`, `record_place`, `record_id`, `created_at`, `updated_at`) VALUES
(1, 'عبدالله', 'الحسين', 'عبدالله', 'Abdullah', 'c2.abdullah@chamivs.com', 'A123456@', '2017-10-13', 'male', 1, 6, 1, '..', '013131367', '000', '00971', 3, 1, 'حوارنة', '18', '2024-07-24 17:05:37', '2024-07-24 17:05:37'),
(2, 'فيصل', 'عنبرجي', 'فيصل', 'Faisal', 'Faisal@chamivs.com', 'F123456@', '2011-10-25', 'male', 1, 2, 1, '02040646106', '016371893', '00', '00971', 4, 2, 'جلوم كبرى', '124', '2024-07-24 17:09:44', '2024-07-24 17:09:44'),
(3, 'لمار', 'عنبرجي', 'لمار', 'Lamar', 'lamar@chamivs.com', 'L123456@', '2014-03-07', 'female', 1, 3, 1, '02040664228', '013326006', '00', '00971', 4, 2, 'جلوم كبرى', '124', '2024-07-24 17:12:10', '2024-07-24 17:12:10'),
(4, 'ورد', 'عنبرجي', 'ورد', 'ward', 'ward@chamivs.com', 'W123456@', '2015-10-08', 'male', 1, 6, 1, '02040678256', '016354412', '00', '00971', 4, 2, 'جلوم كبرى', '124', '2024-07-24 17:17:02', '2024-07-24 17:17:02'),
(5, 'رؤى', 'السليم', 'رؤى', 'Rouaa', 'rouaa@chamivs.com', 'R123456@', '2007-04-29', 'female', 1, 5, 1, '09080341216', '014722766', '..', '00971', 6, 4, 'الغرب', '94', '2024-07-24 17:28:17', '2024-07-24 17:28:17'),
(6, 'سلطان', 'علاء الدين', 'سلطان', 'Sultan', 'sultan@chamivs.com', 'S123456@', '2015-12-28', 'male', 1, 4, 1, '...', '013399131', '00', '00966', 7, 5, 'جديده الخاص', '15', '2024-07-24 17:30:06', '2024-07-24 17:30:06'),
(7, 'جنان', 'الأحمد', 'جنان', 'Jenan', 'c2.jenan@chamivs.com', 'J123456@', '2016-05-01', 'female', 1, 5, 1, '---', '011083002', '...', '00971', 8, 6, 'ابو كنصة', '29', '2024-07-25 17:20:07', '2024-07-25 17:22:37'),
(8, 'ساري', 'الوتار', 'ساري', 'Sare', 'c7.sare@chamivs.com', 'S123456@', '2010-04-12', 'male', 1, 7, 1, '0000', '012013062', '...', '00971', 9, 7, 'عليليات', '59', '2024-07-25 17:24:47', '2024-07-25 17:24:47'),
(9, 'عبد الرحمن', 'دياب', 'عبد الرحمن', 'Abdulrahman', 'c11s.abdulrahman@chamivs.com', 'A123456@', '2008-07-08', 'male', 1, 5, 1, '06010425153', '013378621', '...', '00971', 10, 8, 'شيخضاهر', '1299', '2024-07-25 17:28:02', '2024-07-25 17:28:02'),
(10, 'مصطفى', 'الشعار', 'مصطفى', 'Mustafa', 'c7.mustafa@chamivs.com', 'M123456@', '2013-01-25', 'male', 1, 2, 1, '03080148885', '014661241', '...', '00971', 11, 9, 'حلبون', '25', '2024-07-25 17:34:50', '2024-07-25 17:34:50'),
(11, 'فاطمة', 'الشعار', 'فاطمة', 'Fatema', 'c3.fatema@chamivs.com', 'F123456@', '2016-03-21', 'female', 1, 3, 1, '03080152272', '014661217', '...', '00971', 11, 9, 'حلبون', '25', '2024-07-27 13:20:17', '2024-07-27 13:20:17'),
(12, 'محمد نور', 'اعكاشه', 'محمد نور', 'Mhd Nour', 'c12s.mhd.nour@chamivs.com', 'M123456@', '2008-01-01', 'male', 1, 3, 1, '01030398439', '014130692', '...', '00971', 12, 10, 'سخانه', '41', '2024-07-27 13:23:33', '2024-07-27 13:23:33'),
(13, 'مصطفى', 'فياض', 'مصطفى', 'Mostafa', 'c2.mostafa@chamivs.com', 'M123456@', '2017-02-18', 'male', 1, 3, 1, '12020145830', '016198682', '...', '00971', 13, 11, 'بصرى الشام', '281', '2024-07-27 13:27:32', '2024-07-27 13:27:32'),
(14, 'وداد', 'محمد', 'وداد', 'Wedad', 'c4.wedad@chamivs.com', 'W123456@', '2015-07-30', 'female', 1, 6, 1, '..........', '011037786', '.', '00966', 14, 12, 'جديده الخاص', '15', '2024-07-27 13:30:27', '2024-07-27 13:30:27'),
(15, 'علاء', 'الدرويش', 'علاء', 'Alaa', 'c12s.alaa@chamivs.com', 'A123456@', '2007-01-01', 'male', 1, 7, 1, '...........', '008676573', '...', '00966', 15, 13, 'شمره', '410596', '2024-07-27 13:37:22', '2024-07-27 13:37:22'),
(16, 'جويل', 'مرهج', 'جويل', 'Joelle', 'c3.joelle@chamivs.com', 'J123456@', '2017-01-01', 'female', 1, 7, 1, '10220060830', '016368065', '...', '00971', 16, 14, 'دوير العوينية', '13', '2024-07-27 14:03:12', '2024-07-27 14:03:12'),
(17, 'بحر', 'قدم خير', 'بحر', 'Bahr', 'c7.bahr@chamivs.com', 'B123456@', '2012-04-20', 'male', 1, 5, 1, '03260019296', '012088043', '....', '00971', 17, 15, 'اشرافية صحناية', '71', '2024-07-27 14:05:28', '2024-07-27 14:05:28'),
(18, 'هادي', 'الجباعي', 'هادي', 'Hadi', 'c8.hadi@chamivs.com', 'H123456@', '2011-04-22', 'male', 1, 3, 1, '1030417796', '0527458', '...', '00971', 18, 17, 'زنبركي', '4', '2024-07-27 14:13:17', '2024-07-27 14:13:17'),
(19, 'خالد', 'الجباعي', 'خالد', 'Khaled', 'c11s.khaled@chamivs.com', 'K123456@', '2008-03-24', 'male', 1, 5, 1, '010303081154', '527457', '...', '00971', 18, 17, 'زنبركجي', '4', '2024-07-27 14:22:15', '2024-07-27 14:22:15'),
(20, 'حلا', 'بشير', 'حلا', 'Hala', 'c7.hala@chamivs.com', 'H123456@', '2012-07-09', 'female', 1, 3, 1, '..........1', '013337387', '...', '00971', 19, 18, 'التل', '268', '2024-07-27 14:29:39', '2024-07-27 14:37:39'),
(21, 'مايا', 'سيد خضر', 'مايا', 'Maya', 'c7.maya@chamivs.com', 'M123456@', '2012-01-01', 'female', 1, 4, 1, '00001111111', '012431322', '..', '00971', 20, 19, 'الشرق', '73', '2024-07-27 14:37:04', '2024-07-27 14:37:04'),
(22, 'ريان', 'عزام', 'ريان', 'Rayan', 'c4.rayan@chamivs.com', 'R123456@', '2016-01-05', 'male', 1, 5, 1, '13080027911', '014910313', '0000', '00974', 21, 20, 'عريقة', '123', '2024-07-27 14:40:01', '2024-07-27 14:40:01'),
(23, 'ريته', 'عزام', 'ريته', 'Reta', 'c5.reta@chamivs.com', 'R123456@', '2014-06-19', 'female', 1, 3, 1, '13080027259', '014910300', '00', '00974', 21, 20, 'عريقة', '123', '2024-07-27 14:54:00', '2024-07-27 14:54:00'),
(24, 'ملك', 'قصار بني المرجه', 'ملك', 'Malak', 'c4.malak@chamivs.com', 'M123456@', '2016-01-05', 'female', 1, 4, 1, '09010174145', '013492092', '....', '00971', 22, 28, 'قنوات باب سريجه', '398', '2024-07-27 14:58:08', '2024-07-27 15:00:20'),
(25, 'عبد الهادي', 'بشير', 'عبد الهادي', 'AbdulHadi', 'c12s.abdulhadi@chamivs.com', 'A123456@', '2007-06-19', 'male', 1, 7, 1, '03080126985', '014218185', '..', '00971', 32, 29, 'التل', '268', '2024-07-27 15:08:09', '2024-07-27 15:08:09'),
(26, 'غزل', 'بشير', 'غزل', 'Ghazal', 'c8.ghazal@chamivs.com', 'G123456@', '2010-02-02', 'female', 1, 3, 1, '03080138823', '012463657', '....', '00971', 32, 29, 'التل', '268', '2024-07-27 15:11:23', '2024-07-27 15:11:23'),
(27, 'فيصل', 'المغامس', 'فيصل', 'Faisal', 'c3.faisal@chamivs.com', 'F123456@', '2016-03-21', 'male', 1, 7, 1, '.........0.', '.0..3', '...', '00966', 23, 21, 'الحسكة', '0', '2024-07-27 15:14:23', '2024-07-27 15:14:23'),
(28, 'مرام', 'الخضر', 'مرام', 'Maram', 'c4.maram@chamivs.com', 'M123456@', '2014-11-11', 'female', 1, 2, 1, '..........3', '011817216', '.2..', '00966', 24, 22, 'ذيبان', '238', '2024-07-27 15:17:18', '2024-07-27 15:17:18'),
(29, 'مرام', 'الخضر', 'مرام', 'Maram', 'c4.maaram@chamivs.com', 'M123456@', '2014-11-11', 'female', 1, 2, 1, '11111111111', '0118172160', '.2.', '00966', 24, 22, 'ذيبان', '238', '2024-07-27 15:21:28', '2024-07-27 15:21:28'),
(30, 'محمد', 'الفجير', 'محمد', 'Mohamad', 'c3.mohamad@chamivs.com', 'M123456@', '2016-05-25', 'male', 1, 7, 1, '.....2.....', '.........', '..', '00966', 25, 23, 'ريف دمشق', '0', '2024-07-27 15:24:01', '2024-07-27 15:24:01'),
(31, 'محمد', 'الخضر', 'محمد', 'Mohamad', 'c4.mohamad@chamivs.com', 'M123456@', '2015-10-10', 'male', 1, 7, 1, '00000020300', '015612495', '..', '00966', 26, 24, 'ذيبان', '238', '2024-07-27 15:26:32', '2024-07-27 15:26:32'),
(32, 'عامر', 'الكردي', 'عامر', 'Amer', 'c6.amer@chamivs.com', 'A123456@', '2011-05-05', 'male', 1, 7, 1, '....9......', '011113376', '.', '00966', 27, 25, 'حلب', '0', '2024-07-27 15:29:58', '2024-07-27 15:29:58'),
(34, 'تيم', 'الأحمد', 'تيم', 'Taim', 'c7.taim@chamivs.com', 'T123456@', '2013-01-31', 'male', 1, 7, 1, '33332333333', '009869368', '009', '00966', 28, 26, 'أم عدسة-قارات', '13', '2024-07-27 15:34:46', '2024-07-27 15:34:46'),
(35, 'كنان', 'الخضر', 'كنان', 'Kenan', 'c2.kenan@chamivs.com', 'K123456@', '2017-08-30', 'male', 1, 2, 1, '11111144111', '012522854', '1', '00966', 24, 22, 'ذيبان', '238', '2024-07-27 15:36:59', '2024-07-27 15:36:59'),
(36, 'مروه', 'اليونس', 'مروه', 'Marwa', 'c78.marwa@chamivs.com', 'M123456@', '2009-01-25', 'female', 1, 4, 1, '00000010000', '008895714', '....', '00966', 29, 27, 'الرقة', '0', '2024-07-27 15:39:33', '2024-07-27 15:39:33'),
(38, 'خالد', 'العويد', 'خالد', 'Khaled', 'c2.khaled@chamivs.com', 'K123456@', '2016-07-22', 'male', 1, 6, 1, '......1....', '015645430', '000', '00966', 31, 39, 'الحسكة', '0', '2024-07-27 15:58:46', '2024-07-27 15:58:46'),
(39, 'سلطان', 'المشوح', 'سلطان', 'Sultan', 'c7.sultan@chamivs.com', 'S123456@', '2011-12-01', 'male', 1, 6, 1, '11115111111', '016042412', '00', '00966', 40, 40, 'دير الزور', '0', '2024-07-27 16:01:28', '2024-07-27 16:01:28'),
(40, 'اسيل', 'الناصر الموسى', 'اسيل', 'Aseel', 'c3.aseel@chamivs.com', 'A123456@', '2016-08-22', 'female', 1, 8, 1, '12121212111', '013737082', '00', '00966', 43, 43, 'حميدية', '549', '2024-07-27 16:03:42', '2024-07-27 16:03:42'),
(41, 'وضحى', 'غراف', 'وضحى', 'Wadha', 'c3.wadha@chamivs.com', 'W123456@', '2015-07-05', 'female', 1, 3, 1, '14140000000', '000001', '...', '00966', 33, 31, 'الحسكة', '0', '2024-07-27 16:12:08', '2024-07-27 16:12:08'),
(42, 'الحمزة', 'الغدير', 'الحمزة', 'Alhamza', 'c8.alhamza@chamivs.com', 'A123456@', '2011-10-09', 'male', 1, 8, 1, '09010362258', '006458954', '.', '00966', 34, 32, 'أبو عابد', '291', '2024-07-27 16:16:03', '2024-07-27 16:16:03'),
(43, 'طارق', 'الغدير', 'طارق', 'Tarek', 'c5.tarek@chamivs.com', 'T123456@', '2014-08-26', 'male', 1, 8, 1, '09010401044', '014155413', '000', '00966', 34, 32, 'أبو عابد', '291', '2024-07-27 16:21:15', '2024-07-27 16:21:15'),
(44, 'ليان', 'الجندي', 'ليان', 'Layan', 'c11s.layan@chamivs.com', 'L123456@', '2008-07-07', 'female', 1, 4, 1, '02010387284', '014522284', '00', '00971', 35, 33, 'عزيزيه', '12/251', '2024-07-27 16:24:59', '2024-07-27 16:24:59'),
(45, 'شام', 'النوير', 'شام', 'Sham', 'c7.sham@chamivs.com', 'S123456@', '2011-09-01', 'female', 1, 7, 1, '00011144410', '016280119', '000', '00964', 36, 35, 'بين الحارتين', '184', '2024-07-27 16:33:04', '2024-07-27 16:33:04'),
(46, 'عبد المجيد', 'موسى', 'عبد المجيد', 'Abdulmajed', 'c3.abdulmajed@chamivs.com', 'A123456@', '2016-03-01', 'male', 1, 7, 1, '03190079004', '014583461', '00', '00971', 37, 36, 'دير عطية', '356', '2024-07-27 16:42:22', '2024-07-27 16:42:22'),
(47, 'يوسف', 'الأمين', 'يوسف', 'Yosef', 'c2.yosef@chamivs.com', 'Y123456@', '2017-09-02', 'male', 1, 5, 1, '05011057178', '012898057', '00', '00971', 38, 37, 'شماليه', '59', '2024-07-27 16:52:40', '2024-07-27 16:52:40'),
(48, 'شهاب', 'الزعبي', 'شهاب', 'Shehab', 'c2.shehab@chamivs.com', 'S123456@', '2016-08-01', 'male', 1, 8, 1, '11114444444', '011294576', '00', '00971', 39, 38, 'الطيبة', '37', '2024-07-27 16:56:40', '2024-07-27 16:56:40'),
(49, 'عليا', 'الزعبي', 'عليا', 'Alia', 'c2.alia@chamivs.com', 'A123456@', '2017-09-15', 'female', 1, 7, 1, '12120211111', '012463592', '0000', '00971', 39, 38, 'الطيبة', '37', '2024-07-27 16:59:15', '2024-07-27 16:59:15'),
(50, 'نسيبه', 'المحيمد', 'نسيبه', 'Nasebah', 'c10.nasebah@chamivs.com', 'N123456@', '2008-03-15', 'female', 1, 7, 1, '09140093510', '013985773', '000', '00971', 45, 46, 'دير الزور', '0', '2024-07-27 17:04:36', '2024-07-27 17:04:36'),
(51, 'نور', 'المحيمد', 'نور', 'Nour', 'c8.nour@chamivs.com', 'N123456@', '2010-12-15', 'female', 1, 5, 1, '09140104919', '013985659', '00', '00971', 45, 46, 'دير الزور', '0', '2024-07-27 17:07:16', '2024-07-27 17:07:16'),
(52, 'مازن', 'حاج محمد', 'مازن', 'Mazen', 'c2.mazen@chamivs.com', 'M123456@', '2017-12-14', 'male', 1, 7, 1, '04020148193', '0000005', '0', '00966', 46, 47, 'الطيبه', '68', '2024-07-27 17:10:48', '2024-07-27 17:10:48'),
(53, 'محمد', 'المقداد', 'محمد', 'Mohamed', 'c2.mohamed@chamivs.com', 'M123456@', '2016-08-22', 'male', 1, 7, 1, '....', '012897809', '00', '00971', 47, 48, 'درعا', '0', '2024-07-27 17:14:45', '2024-07-27 17:14:45'),
(54, 'يعرب', 'المعاز', 'يعرب', 'Yarub', 'c5.yarub@chamivs.com', 'Y123456@', '2014-12-11', 'male', 1, 7, 1, '13110021720', '016231892', '0', '00971', 48, 49, 'القريا', '193', '2024-07-27 17:17:39', '2024-07-27 17:17:39'),
(55, 'شهد', 'المشوح', 'شهد', 'Shahed', 'c3.shahed@chamivs.com', 'S123456@', '2015-02-24', 'female', 1, 7, 1, '00002580000', '014984417', '000', '00966', 49, 50, 'السويعية أساس', '108', '2024-07-27 17:20:56', '2024-07-27 17:20:56'),
(56, 'عبد الكريم', 'الباشا', 'عبد الكريم', 'Abdlkarim', 'c2.abdlkarim@chamivs.com', 'A123456@', '2016-10-05', 'male', 1, 5, 1, '......36...', '012456739', '..', '00966', 50, 51, 'حمص', '0', '2024-07-28 14:47:37', '2024-07-28 14:47:37'),
(57, 'نايا', 'عطار', 'نايا', 'Naya', 'c5.naya@chamivs.com', 'N123456@', '2014-05-22', 'female', 1, 4, 1, '02030581139', '016566636', '000', '00971', 53, 53, 'دلالين', '117', '2024-07-28 15:01:44', '2024-07-28 15:01:44'),
(58, 'نيسان', 'بشير ابو فخر', 'نيسان', 'Nissan', 'c9.nissan@chamivs.com', 'N123456@', '2010-04-21', 'female', 1, 7, 1, '13020043273', '016383005', '00', '00971', 54, 55, 'السويداء', '0', '2024-07-28 15:05:25', '2024-07-28 15:09:02'),
(59, 'طاهر', 'مشلح', 'طاهر', 'Taher', 'c3.taher@chamivs.com', 'T123456@', '2016-03-25', 'male', 1, 5, 1, '.......3...', '015743821', '..', '00971', 57, 57, 'حلب', '0', '2024-07-28 15:23:20', '2024-07-28 15:23:20'),
(60, 'آدم', 'ورده', 'آدم', 'Adam', 'c3.adam@chamivs.com', 'A123456@', '2016-08-08', 'male', 1, 7, 1, '05050229958', '016370573', '00', '00971', 58, 58, 'تلدره', '93', '2024-07-28 15:28:38', '2024-07-28 15:28:38'),
(61, 'هدى', 'خروب', 'هدى', 'Houda', 'c3.houda@chamivs.com', 'H123456@', '2016-11-20', 'female', 1, 5, 1, '......5....', '00518776', '..', '00971', 59, 59, 'درعا', '.', '2024-07-28 15:34:37', '2024-07-28 15:34:37'),
(62, 'غيث', 'فارس', 'غيث', 'Ghaith', 'c5.ghaith@chamivs.com', 'G123456@', '2014-08-15', 'male', 1, 7, 1, '08160158608', '009728261', '..', '00966', 60, 60, 'رأس العين', '1035', '2024-07-28 15:40:29', '2024-07-28 15:40:29'),
(63, 'اميره', 'كعكه', 'اميره', 'Amira', 'c4.amira@chamivs.com', 'A123456@', '2015-04-06', 'female', 1, 6, 1, '11111185111', '00001', '..', '00966', 61, 61, 'حلب', '0', '2024-07-28 15:50:59', '2024-07-28 15:50:59'),
(64, 'محمد', 'قاق', 'محمد', 'Mouhamad', 'c7.mouhamad@chamivs.com', 'm123456@', '2011-02-01', 'male', 1, 7, 1, '07010244274', '007401964', '..', '00966', 62, 62, 'بني الله', '64', '2024-07-28 15:53:13', '2024-07-28 15:53:13'),
(65, 'وديع', 'الباشا', 'وديع', 'Wadee', 'c5.wadee@chamivs.com', 'W123456@', '2014-09-29', 'male', 1, 7, 1, '03080150078', '015752552', '..', '00966', 65, 65, 'ريف دمشق', '0', '2024-07-28 15:57:36', '2024-07-28 15:57:36'),
(66, 'ميرا', 'الباشا', 'ميرا', 'Mira', 'c2.mira@chamivs.com', 'M123456@', '2017-10-30', 'female', 1, 7, 1, '03080156917', '015752496', '..', '00966', 65, 65, 'ريف دمشق', '0', '2024-07-28 15:59:10', '2024-07-28 15:59:10'),
(67, 'جواد', 'الكردي', 'جواد', 'Jawad', 'c34.jawad@chamivs.com', 'J123456@', '2015-01-29', 'male', 1, 8, 1, '11111141411', '000000', '..', '00966', 51, 52, 'ريف دمشق التل', '171', '2024-07-28 16:04:42', '2024-07-28 16:04:42'),
(68, 'عمر', 'الغياض', 'عمر', 'Omar', 'c2.omar@chamivs.com', 'O123456@', '2017-01-01', 'male', 1, 7, 1, '00330000741', '00000', '..', '00966', 55, 54, 'الحارة', '3', '2024-07-28 16:06:22', '2024-07-28 16:06:22'),
(69, 'عبد الإله', 'الغياض', 'عبد الإله', 'Abd Alelah', 'c34.abdalelah@chamivs.com', 'A123456@', '2015-09-04', 'male', 1, 3, 1, '00330000704', '0000', '..', '00966', 55, 54, 'الحارة', '3', '2024-07-28 16:09:05', '2024-07-28 16:09:05'),
(70, 'دينة', 'فخار', 'دينة', 'Dina', 'c2.dina@chamivs.com', 'D123456@', '2016-05-10', 'female', 1, 5, 1, '11141111111', '9628394', '...', '00971', 56, 56, 'المغرب', '0', '2024-07-28 16:10:45', '2024-07-28 16:10:45'),
(71, 'شام', 'المحمد', 'شام', 'Sham', 'c2.sham@chamivs.com', 'S123456@', '2017-01-09', 'female', 1, 7, 1, '22222222222', '013836854', '..', '00966', 63, 63, 'درعا', '0', '2024-07-28 16:11:56', '2024-07-28 16:11:56'),
(72, 'محمد يوسف', 'غلام', 'محمد يوسف', 'Mohammad Yousef', 'c2.mohammadyousef@chamivs.com', 'M123456@', '2016-06-21', 'male', 1, 7, 1, '784201689194609', '000', '...', '00971', 64, 64, 'باكستان', '0', '2024-07-28 16:16:21', '2024-07-28 16:16:21'),
(73, 'ياسمين', 'السكيف', 'ياسمين', 'Yasmin', 'c2.yasmin@chamivs.com', 'Y123456@', '2017-05-06', 'female', 1, 7, 1, '14141111115', '013145875', '..', '00971', 66, 66, 'طرطوس', '0', '2024-07-28 16:18:49', '2024-07-28 16:18:49'),
(74, 'سلسبيل', 'العبود', 'سلسبيل', 'Salsabel', 'c2.salsabel@chamivs.com', 'S123456@', '2017-09-14', 'female', 15, 5, 1, '21212121000', '17947587', '..', '00971', 67, 67, 'العراق', '0', '2024-07-28 16:20:57', '2024-07-28 16:20:57'),
(75, 'حسين', 'الحسين', 'حسين', 'Hussein', 'c5.hussain@chamivs.com', 'H123456@', '2012-05-01', 'male', 1, 7, 1, '00001212012', '002800', '..', '00966', 68, 68, 'قيطة أبو جبار', '21/81', '2024-07-28 16:31:28', '2024-07-28 16:31:28'),
(76, 'عهد', 'مطاوع', 'عهد', 'Ahed', 'c5.ahed@chamivs.com', 'a123456@', '2014-11-23', 'male', 1, 7, 1, '00033793222', '001256', '..', '00966', 69, 69, 'الحارة', '114', '2024-07-28 16:33:46', '2024-07-28 16:33:46'),
(77, 'أمير', 'الطحان', 'أمير', 'Amir', 'c2.amir@chamivs.com', 'A123456@', '2016-12-11', 'male', 1, 7, 1, '03080165791', '013228067', '..', '00966', 70, 70, 'التل', '577', '2024-07-28 16:36:25', '2024-07-28 16:36:25'),
(78, 'خالد', 'شنو', 'خالد', 'Khaled', 'c3.khaled@chamivs.com', 'K123456@', '2015-02-13', 'male', 1, 8, 1, '21215555555', '322658', '..', '00966', 71, 71, 'حمص', '0', '2024-07-28 16:38:27', '2024-07-28 16:38:27'),
(79, 'تقى', 'فراوي', 'تقى', 'Tuka', 'c8.tuka@chamivs.com', 'T123456@', '2011-07-20', 'female', 1, 2, 1, '03360027880', '008066607', '..', '00966', 73, 73, 'قدسيا', '106', '2024-07-28 16:40:30', '2024-07-28 16:40:30'),
(80, 'تالين', 'كردي', 'تالين', 'Talin', 'c2.talin@chamivs.com', 'T123456@', '2017-03-02', 'female', 1, 3, 1, '11111118545', '015059351', '.', '00966', 72, 72, 'حلب', '0', '2024-07-28 16:41:54', '2024-07-28 16:41:54'),
(81, 'نجم', 'مقلد', 'نجم', 'Najm', 'c12.najm@chamivs.com', 'N123456@', '2007-03-16', 'male', 1, 8, 1, '11111459711', '00391060', '..', '00964', 74, 74, 'السويداء', '3437', '2024-07-28 16:44:26', '2024-07-28 16:44:26'),
(82, 'بهاء الدين', 'الأحمدية', 'بهاء الدين', 'Bahaa Aldeen', 'c9.bahaaaldeen@chamivs.com', 'B123456@', '2009-12-07', 'male', 22, 8, 1, '00000011111', '101023', '00', '00968', 75, 75, 'شارون', '207', '2024-07-28 16:46:56', '2024-07-28 16:46:56'),
(83, 'ماريا', 'يونس', 'ماريا', 'Mary', 'c34.mary@chamivs.com', 'M123456@', '2011-01-12', 'female', 30, 7, 1, '12123698745', '4520336', '..', '00971', 77, 77, 'فلسطين', '0', '2024-07-28 16:49:19', '2024-07-28 16:49:19'),
(84, 'محسن', 'فياض', 'محسن', 'Muhseen', 'c9.muhseen@chamivs.com', 'M123456@', '2008-03-17', 'male', 1, 1, 1, '12020119451', '016142775', '00', '00971', 78, 78, 'بصرى الشام', '281', '2024-07-28 16:54:59', '2024-07-28 16:54:59'),
(85, 'سامر', 'الحاجي', 'سامر', 'Samer', 'C9.samer@chamivs.com', 'S123456@', '2010-01-01', 'male', 1, 8, 1, '00011111111', '016739295', '...', '00966', 79, 79, 'حلب', '0', '2024-07-28 16:58:15', '2024-07-28 16:58:15'),
(86, 'حسن', 'الحاجي', 'حسن', 'Hasan', 'c9.hasan@chamivs.com', 'H123456@', '2010-01-01', 'male', 1, 7, 1, '12212121555', '016739302', '..', '00966', 79, 79, 'حلب', '0', '2024-07-28 17:00:36', '2024-07-28 17:00:36'),
(87, 'علي', 'الحاجي', 'علي', 'Ali', 'c2.ali@chamivs.com', 'A123456@', '2017-06-01', 'male', 1, 7, 1, '11111148951', '016739289', '0', '00966', 79, 79, 'حلب', '0', '2024-07-28 17:01:53', '2024-07-28 17:01:53'),
(88, 'عبد الحميد', 'الحاجي', 'عبد الحميد', 'Abdulhamid', 'c8.abdulhamid@chamivs.com', 'A123456@', '2011-06-07', 'male', 1, 8, 1, '12121212582', '016739290', '00', '00966', 79, 79, 'حلب', '0', '2024-07-28 17:04:11', '2024-07-28 17:04:11'),
(89, 'شهد', 'مصطفى', 'شهد', 'Shahed', 'c2.shahed@chamivs.com', 'S123456@', '2017-05-09', 'female', 1, 8, 1, '12151515151', '01645202', '0', '00971', 80, 80, 'الرقة', '0', '2024-07-28 17:05:38', '2024-07-28 17:05:38'),
(90, 'محمد', 'مصطفى', 'محمد', 'Mohamad', 'c6.mohamad@chamivs.com', 'M123456@', '2013-11-05', 'male', 1, 7, 1, '0032822033', '016373397', '00', '00971', 80, 80, 'الرقة', '0', '2024-07-28 17:07:15', '2024-07-28 17:07:15'),
(91, 'فرح', 'مصطفى', 'فرح', 'Farah', 'c7.farah@chamivs.com', 'F123456@', '2012-01-13', 'female', 1, 7, 1, '11010414017', '016373400', '0', '00971', 80, 80, 'الرقة', '0', '2024-07-28 17:08:49', '2024-07-28 17:08:49'),
(92, 'صلاح الدين', 'الزعبي', 'صلاح الدين', 'Salah Eddin', 'c34.salaheddin@chamivs.com', 'S123456@', '2012-02-25', 'male', 1, 7, 1, '00000000056', '652300', '..', '00971', 81, 81, 'درعا', '0', '2024-07-28 17:15:00', '2024-07-28 17:15:00'),
(95, 'ريمان', 'الزعبي', 'ريمان', 'Riman', 'c3.riman@chamivs.com', 'R123456@', '2016-01-01', 'female', 1, 7, 1, '11145410000', '0268013', '00', '00971', 81, 81, 'درعا', '0', '2024-07-28 17:20:51', '2024-07-28 17:20:51'),
(96, 'قمر', 'السيد', 'قمر', 'Qamar', 'c7.qamar@chamivs.com', 'Q123456@', '2013-01-01', 'female', 1, 7, 1, '02020847044', '015926489', '.', '00971', 82, 82, 'قارلق', '15', '2024-07-28 17:22:17', '2024-07-28 17:22:17'),
(97, 'انستاسيا', 'حنا', 'انستاسيا', 'Anstasea', 'c3.anstasea@chamivs.com', 'A123456@', '2015-05-18', 'female', 1, 7, 1, '12125262111', '012757409', '0', '00971', 83, 83, 'بطارش', '2', '2024-07-28 17:24:05', '2024-07-28 17:24:05'),
(98, 'شعيب', 'بابرزاي', 'شعيب', 'Shuaib', 'c3.shuaib@chamivs.com', 'S123456@', '2015-04-09', 'male', 51, 6, 1, '1212.......', '03414097', '0', '00971', 84, 84, 'أفغانستان', '0', '2024-07-28 17:25:55', '2024-07-28 17:25:55'),
(99, 'سيدرا', 'القدور', 'سيدرا', 'Sidra', 'c4.sidra@chamivs.com', 'S123456@', '2015-07-16', 'female', 1, 7, 1, '12151020000', '012679423', '.', '00966', 88, 90, 'احسم البارة شرقية', '59', '2024-07-28 17:30:29', '2024-07-28 17:34:48'),
(100, 'شهد', 'القدور', 'شهد', 'Shahed', 'c2.shahed.k@chamivs.com', 'S123456@', '2017-02-09', 'female', 1, 7, 1, '11115210211', '012679424', '0', '00966', 88, 90, 'احسم البارة شرقية', '59', '2024-07-28 17:37:51', '2024-07-28 17:37:51'),
(101, 'جان بيير', 'حنا', 'جان بيير', 'JanPierre', 'c3.janpierre@chamivs.com', 'J123456@', '2013-04-20', 'male', 1, 8, 1, '11117777777', '014682437', '...', '00971', 83, 83, 'بطاريش', '2', '2024-07-29 13:57:21', '2024-07-29 13:57:21'),
(102, 'ماريا', 'بشبش', 'ماريا', 'Marya', 'c11.marya@chamivs.com', 'M123456@', '2008-03-05', 'female', 1, 6, 1, '03190066647', '016191615', '..', '00971', 89, 91, 'دير عطية اسلام', '19', '2024-07-29 14:25:59', '2024-07-29 14:25:59'),
(103, 'يمان', 'جبور', 'يمان', 'Yaman', 'c12s.yaman@chamivs.com', 'Y123456@', '2007-08-30', 'male', 1, 5, 1, '13090057013', '014722430', '...', '00971', 90, 92, 'صلخد', '1/29', '2024-07-29 14:27:36', '2024-07-29 14:27:36'),
(104, 'رام', 'جبور', 'رام', 'Ram', 'c11s.ram@chamivs.com', 'R123456@', '2008-08-10', 'male', 1, 7, 1, '13090057923', '0147224119', '...', '00971', 90, 92, 'صلخد', '1/29', '2024-07-29 14:30:30', '2024-07-29 14:30:30'),
(105, 'جاد', 'الحسين', 'جاد', 'Jad', 'c5.jad@chamivs.com', 'J123456@', '2011-09-15', 'male', 1, 7, 1, '13030032860', '016397060', '000', '00971', 98, 99, 'الطيبة', '3', '2024-07-29 14:47:20', '2024-07-29 14:47:20'),
(106, 'ماريا', 'جنان', 'ماريا', 'Maria', 'c3.maria@chamivs.com', 'M123456@', '2016-01-03', 'female', 1, 7, 1, '00002220000', '302536392', '...', '00971', 100, 101, 'الجزائر', '0', '2024-07-29 14:51:06', '2024-07-29 14:51:06'),
(107, 'شهد', 'السيد', 'شهد', 'Shahd', 'c2.shahed.s@chamivs.com', 'S123456@', '2016-10-18', 'female', 1, 7, 1, '2003608020', '206992', '00', '00971', 105, 107, 'الأردن', '0', '2024-07-29 14:59:48', '2024-07-29 14:59:48'),
(108, 'ليا', 'زكرت', 'ليا', 'Laya', 'c7.laya@chamivs.com', 'L123456@', '2013-01-18', 'female', 1, 8, 1, '........526', '00207367', '..', '00971', 110, 113, 'حلب', '0', '2024-07-29 15:04:58', '2024-07-29 15:13:59'),
(109, 'كادي', 'عجاج', 'كادي', 'Kady', 'c3.kady@chamivs.com', 'K123456@', '2016-07-12', 'female', 1, 7, 1, '1004060067', '016718427', '0', '00971', 113, 115, 'سحم الجولان', '58', '2024-07-29 15:25:18', '2024-07-29 15:25:18'),
(110, 'زيد', 'السبع', 'زيد', 'Zaid', 'c3.zaid@chamivs.com', 'Z123456@', '2015-04-24', 'male', 1, 7, 1, '0380159286', '00512658', '00', '00971', 86, 87, 'الحلبون', '113', '2024-07-29 15:26:54', '2024-07-29 15:26:54'),
(111, 'يزن', 'السبع', 'يزن', 'Yazan', 'c6.yazan@chamivs.com', 'Y123456@', '2013-02-04', 'male', 1, 1, 1, '.......4...', '00512600', '00', '00971', 86, 87, 'الحلبون', '113', '2024-07-29 15:29:37', '2024-07-29 15:29:37'),
(112, 'مرح', 'الجندي', 'مرح', 'Marah', 'c6.marah@chamivs.com', 'M123456@', '2013-03-29', 'female', 1, 7, 1, '02010433011', '012667782', '0', '00971', 87, 88, 'حلب', '0', '2024-07-29 15:33:15', '2024-07-29 15:33:15'),
(114, 'حلا', 'الجندي', 'حلا', 'Hala', 'c4.hala@chamivs.com', 'H123456@', '2016-01-06', 'female', 1, 5, 1, '02010426212', '012562870', '00', '00971', 87, 88, 'حلب', '0', '2024-07-29 15:40:39', '2024-07-29 15:40:39'),
(115, 'حيدرة', 'السلامة', 'حيدرة', 'Haidara', 'c9.haidara@chamivs.com', 'H123456@', '2010-05-14', 'male', 1, 7, 1, '02210096408', '013467637', '0', '00971', 92, 93, 'نبل', '340', '2024-07-29 15:43:37', '2024-07-29 15:43:37'),
(116, 'هادي', 'السلامة', 'هادي', 'Hadi', 'c7.hadi@chamivs.com', 'H123456@', '2013-01-12', 'male', 1, 1, 1, '02210103738', '013467636', '0', '00971', 92, 93, 'نبل', '340/30', '2024-07-29 15:47:39', '2024-07-29 15:47:39'),
(117, 'حنين', 'مكارم', 'حنين', 'Haneen', 'c4.haneen@chamivs.com', 'H123456@', '2014-08-28', 'female', 1, 7, 1, '13050073552', '017040636', '0', '00961', 93, 94, 'عمره', '51', '2024-07-29 15:50:57', '2024-07-29 15:50:57'),
(118, 'محمد نور', 'الأخرس', 'محمد نور', 'MohamadNour', 'c2.mohamadnour@chamivs.com', 'M123456@', '2016-10-09', 'male', 1, 5, 1, '10102500000', '0021200', '0', '00966', 94, 95, 'حماة', '0', '2024-07-29 15:52:59', '2024-07-29 15:52:59'),
(119, 'غدير', 'الأخرس', 'غدير', 'Gadeer', 'c2.gadeer@chamivs.com', 'G123456@', '2017-01-06', 'male', 1, 1, 1, '121212121212', '0000056', '0', '00966', 95, 96, 'حماة', '0', '2024-07-29 15:54:39', '2024-07-29 15:54:39'),
(120, 'عبد الناصر', 'الأخرس', 'عبد الناصر', 'Abdulnaser', 'c4.abdulnaser@chamivs.com', 'A123456@', '2014-05-12', 'male', 1, 6, 1, '00000000853', '222220', '0', '00966', 95, 96, 'حماة', '0', '2024-07-29 15:57:16', '2024-07-29 15:57:16'),
(121, 'مصطفى', 'حاج ابراهيم', 'مصطفى', 'Mostafa', 'c3.mostafa@chamivs.com', 'M123456@', '2016-11-15', 'male', 1, 7, 1, '12121000000', '01015', '0', '00966', 96, 97, 'حماة', '0', '2024-07-29 15:59:25', '2024-07-29 15:59:25'),
(122, 'ليلاس', 'الأخرس', 'ليلاس', 'Lilas', 'c2.lilas@chamivs.com', 'L123456@', '2017-12-02', 'female', 1, 7, 1, '00000000864', '202222', '0', '00966', 94, 95, 'حماة', '0', '2024-07-29 16:04:39', '2024-07-29 16:04:39'),
(123, 'عبد الوهاب', 'رجا', 'عبد الوهاب', 'Abdulwahab', 'c2.abdulwahab@chamivs.com', 'A123456@', '2017-07-31', 'male', 1, 7, 1, '00000055555', '101010', '00', '00966', 97, 98, 'الرقة', '0', '2024-07-29 16:10:59', '2024-07-29 16:10:59'),
(124, 'عبدالله', 'البركات', 'عبدالله', 'Abdulallah', 'c2.abdullah.b@chamivs.com', 'A123456@', '2017-08-04', 'male', 1, 8, 1, '12120000002', '00212800', '00', '00966', 99, 100, 'حمص', '0', '2024-07-29 16:14:11', '2024-07-29 16:14:11'),
(125, 'علي', 'الجهماني', 'علي', 'Ali', 'c5.ali.j@chamivs.com', 'A123456@', '2013-09-24', 'male', 1, 6, 1, '01010101258', '555552', '0', '00966', 101, 102, 'درعا', '0', '2024-07-29 16:15:57', '2024-07-29 16:15:57'),
(126, 'محمد', 'حمود', 'محمد', 'Mohamad', 'c5.mohamad@chamivs.com', 'M123456@', '2014-05-30', 'male', 1, 6, 1, '00000589500', '0000125', '0', '00966', 102, 103, 'ريف دمشق', '0', '2024-07-29 16:18:20', '2024-07-29 16:18:20'),
(127, 'ساندي', 'حاج ابراهيم', 'ساندي', 'Sandi', 'c5.sandi@chamivs.com', 'S123456@', '2014-05-06', 'female', 1, 1, 1, '01010101523', '1010164', '0', '00966', 96, 97, 'حماة', '0', '2024-07-29 16:19:35', '2024-07-29 16:19:35'),
(128, 'عامر', 'الصلهام', 'عامر', 'Amir', 'c3.amir@chamivs.com', 'A123456@', '2016-02-23', 'male', 1, 4, 1, '11116464211', '0101920', '0', '00966', 103, 104, 'الرقة', '0', '2024-07-29 16:20:54', '2024-07-29 16:20:54'),
(129, 'لينة', 'أسود', 'لينة', 'Lina', 'c2.lina@chamivs.com', 'L123456@', '2017-10-12', 'female', 49, 1, 1, '21210000000', '09573460', '0', '00966', 104, 105, 'المغرب', '0', '2024-07-29 16:22:32', '2024-07-29 16:22:32'),
(130, 'منال', 'الصلهام', 'منال', 'Manal', 'c3.manal@chamivs.com', 'M123456@', '2015-02-09', 'female', 1, 1, 1, '22222254542', '020213', '0', '00966', 103, 104, 'الرقة', '0', '2024-07-29 16:29:03', '2024-07-29 16:29:03'),
(131, 'صالح', 'الحسين', 'صالح', 'Saleh', 'c2.saleh@chamivs.com', 'S123456@', '2017-08-05', 'male', 1, 6, 1, '11111122222', '012178128', '0', '00966', 106, 106, 'باب تدمر', '1962', '2024-07-29 16:30:48', '2024-07-29 16:30:48'),
(132, 'أمل', 'زين الدين', 'أمل', 'Amal', 'c3.amal@chamivs.com', 'A123456@', '2016-02-01', 'female', 1, 8, 1, '22222255555', '2222251', '.', '00966', 107, 108, 'إدلب', '0', '2024-07-29 16:32:27', '2024-07-29 16:32:27'),
(133, 'محمد', 'زين الدين', 'محمد', 'Mohamad', 'c5.mohamad.z@chamivs.com', 'M123456@', '2014-12-20', 'male', 1, 4, 1, '11116464646', '22222259', '0', '00966', 107, 108, 'إدلب', '0', '2024-07-29 16:33:46', '2024-07-29 16:33:46'),
(134, 'ماهر', 'الأخرس', 'ماهر', 'Maher', 'c2.maher@chamivs.com', 'M123456@', '2018-01-28', 'male', 1, 7, 1, '22233322222', '5557777', '0', '00966', 95, 96, 'حماة', '0', '2024-07-29 16:35:16', '2024-07-29 16:35:16'),
(135, 'حنين', 'سبقجي', 'حنين', 'Haneen', 'c2.haneen@chamivs.com', 'h123456@', '2017-03-05', 'female', 1, 1, 1, '11112222666', '2222563', '00', '00966', 108, 109, 'اللاذقية', '0', '2024-07-29 16:36:43', '2024-07-29 16:36:43'),
(136, 'مياس', 'احمد', 'مياس', 'Mayas', 'c8.mayas@chamivs.com', 'M123456@', '2011-10-04', 'male', 1, 7, 1, '11110000002', '008233847', '0', '00966', 109, 110, 'حلب', '0', '2024-07-29 16:38:29', '2024-07-29 16:38:29'),
(137, 'مجد', 'احمد', 'مجد', 'Majed', 'c8.majed@chamivs.com', 'M123456@', '2009-09-13', 'male', 1, 5, 1, '22222256565', '11111865', '0', '00966', 109, 110, 'حلب', '0', '2024-07-29 16:40:19', '2024-07-29 16:40:19'),
(138, 'ساتيا', 'مكارم', 'ساتيا', 'Satea', 'c8.satea@chamivs.com', 'S123456@', '2011-10-07', 'female', 1, 5, 1, '13050068503', '00953276', '0', '00964', 111, 111, 'بريكة', '13', '2024-07-29 16:42:26', '2024-07-29 16:42:26'),
(139, 'شهد', 'سلوم', 'شهد', 'Shahd', 'c12.shahd@chamivs.com', 'S123456@', '2006-07-03', 'female', 1, 7, 1, '14040090601', '00977716', '0', '00961', 112, 112, 'القنيطرة', '0', '2024-07-29 16:46:50', '2024-07-29 16:46:50'),
(140, 'ماسة', 'سلوم', 'ماسة', 'Masa', 'c11.masa@chamivs.com', 'M123456@', '2008-01-17', 'female', 1, 5, 1, '14040090603', '00977725', '0', '00961', 112, 112, 'القنيطرة', '0', '2024-07-29 16:47:54', '2024-07-29 16:47:54'),
(141, 'علي', 'سلوم', 'علي', 'Ali', 'c8.ali@chamivs.com', 'A123456@', '2011-02-09', 'male', 1, 7, 1, '14040100635', '00977723', '0', '00961', 112, 112, 'القنيطرة', '0', '2024-07-29 16:48:59', '2024-07-29 16:48:59'),
(142, 'زيد', 'سلوم', 'زيد', 'Zaid', 'c6.zaid@chamivs.com', 'Z123456@', '2013-05-16', 'male', 1, 7, 1, '14040104317', '00977747', '0', '00961', 112, 112, 'القنيطرة', '0', '2024-07-29 16:49:55', '2024-07-29 16:49:55'),
(143, 'لاريسا', 'الشحف', 'لاريسا', 'Laressa', 'c7.laressa@chamivs.com', 'L123456@', '2013-01-03', 'female', 1, 7, 1, '13050070165', '00521730', '0', '00971', 140, 141, 'مردك', '4', '2024-07-29 17:08:57', '2024-07-29 17:08:57'),
(144, 'كريستين', 'الشحف', 'كريستين', 'Kristen', 'c3.kristen@chamivs.com', 'K123456@', '2016-09-13', 'female', 1, 7, 1, '13050074842', '00521756', '0', '00971', 140, 141, 'مردك', '4', '2024-07-29 17:09:59', '2024-07-29 17:09:59'),
(145, 'تاج', 'الزعبي', 'تاج', 'Taj', 'c2.taj@chamivs.com', 'T123456@', '2018-01-19', 'female', 1, 6, 1, '12060084353', '015970322', '0', '00971', 141, 142, 'يادودة', '33', '2024-07-29 17:11:56', '2024-07-29 17:11:56'),
(146, 'ريتاج', 'حسن', 'ريتاج', 'Retaj', 'c9.retaj@chamivs.com', 'R123456@', '2010-03-23', 'female', 1, 7, 1, '14040099724', '016192565', '0', '00971', 144, 145, 'قرحتا', '33/99', '2024-07-29 17:14:40', '2024-07-29 17:14:40'),
(147, 'محمد علي', 'حسن', 'محمد علي', 'Mhd Ali', 'c11s.mhd.ali@chamivs.com', 'M123456@', '2008-02-27', 'male', 1, 7, 1, '14040092630', '016192558', '0', '00971', 144, 145, 'قرحتا', '33/99', '2024-07-29 17:16:02', '2024-07-29 17:16:02'),
(148, 'ايلين', 'غبره', 'ايلين', 'Ilen', 'c7.ilen@chamivs.com', 'I123456@', '2012-03-14', 'female', 1, 7, 1, '13130017459', '016293909', '0', '00971', 145, 146, 'ذيبين', '84', '2024-07-29 17:18:11', '2024-07-29 17:18:11'),
(149, 'رنيم', 'الجبان', 'رنيم', 'Raneem', 'c3.raneem@chamivs.com', 'R123456@', '2014-03-09', 'female', 1, 7, 1, '11114444225', '0020234', '00', '00966', 114, 114, 'حلب', '0', '2024-07-29 17:26:35', '2024-07-29 17:26:35'),
(150, 'طاهر', 'الجبان', 'طاهر', 'Taher', 'c3.taher.j@chamivs.com', 'T123456@', '2015-05-25', 'male', 1, 1, 1, '00003232000', '000653', '0', '00966', 114, 114, 'حلب', '0', '2024-07-29 17:27:07', '2024-07-29 17:27:07'),
(151, 'غراء', 'بحلاق', 'غراء', 'Gharraa', 'c12s.gharraa@chamivs.com', 'G123456@', '2005-12-17', 'female', 1, 7, 1, '11111164641', '013151177', '00', '00971', 117, 117, 'مريجة', '125', '2024-07-29 17:29:35', '2024-07-29 17:29:35'),
(152, 'ليالي', 'الجبان', 'ليالي', 'Layali', 'c3.layali@chamivs.com', 'L123456@', '2015-08-05', 'female', 1, 8, 1, '02390336449', '013714406', '0', '00966', 118, 118, 'حلب', '0', '2024-07-30 14:31:05', '2024-07-30 14:31:05'),
(153, 'موسى', 'عبد الرخانوف', 'موسى', 'Musa', 'c8.musa@chamivs.com', 'M123456@', '2009-11-05', 'male', 1, 1, 1, '00002588520', '0493387', '0', '00971', 119, 119, 'اوزباكستان', '0', '2024-07-30 14:39:07', '2024-07-30 14:44:45'),
(154, 'خوران', 'عبد الرخمونوف', 'خوران', 'Khorun', 'c9.khorun@chamivs.com', 'K123456@', '2007-07-05', 'male', 1, 7, 1, '11111154545', '0493388', '.', '00971', 120, 120, 'اوزباكستان', '00', '2024-07-30 14:43:36', '2024-07-30 14:46:26'),
(155, 'قصي', 'مصطفى', 'قصي', 'Kousai', 'c5.kousai@chamivs.com', 'K123456@', '2012-07-01', 'male', 1, 7, 1, '88888888888', '014742564', '0', '00971', 121, 121, 'حمامة', '69', '2024-07-30 14:48:24', '2024-07-30 14:48:24'),
(156, 'ملاك', 'قاق', 'ملاك', 'Malak', 'c11.malak@chamivs.com', 'M123456@', '2008-01-17', 'female', 1, 7, 1, '44444444411', '008353163', '0', '00966', 122, 122, 'سرمين الزاوية', '73', '2024-07-30 14:50:09', '2024-07-30 14:50:09'),
(157, 'عبد المطلب', 'الأحمد', 'عبد المطلب', 'Abdulmutaleb', 'c5.abdulmutaleb@chamivs.com', 'A123456@', '2010-02-08', 'male', 1, 7, 1, '11115555554', '011082978', '0', '00971', 8, 6, 'ابو كنصة', '29', '2024-07-30 14:53:05', '2024-07-30 14:53:05'),
(158, 'ليان', 'هلال', 'ليان', 'Lian', 'c3.lian@chamivs.com', 'L123456@', '2016-01-15', 'female', 1, 7, 1, '33336111111', '36650237', '0', '00971', 125, 126, 'باب أول', '747', '2024-07-30 14:54:58', '2024-07-30 14:54:58'),
(159, 'يعمر', 'البيضه', 'يعمر', 'Yamor', 'c6.yamor@chamivs.com', 'Y123456@', '2014-01-15', 'male', 1, 7, 1, '14020100955', '014961335', '0', '00971', 126, 127, 'الكوم', '485', '2024-07-30 14:56:43', '2024-07-30 14:56:43'),
(160, 'ريبال', 'الحسين', 'ريبال', 'Rebal', 'c9.rebal@chamivs.com', 'R123456@', '2007-08-01', 'male', 1, 7, 1, '13030030049', '016397027', '0', '00971', 98, 99, 'الطيبه', '3', '2024-07-30 14:59:11', '2024-07-30 14:59:11'),
(161, 'ذو الفقار', 'الخلف', 'ذو الفقار', 'Zulfqar', 'c8.zulfaqar@chamivs.com', 'Z123456@', '2011-01-31', 'male', 1, 6, 1, '44441111111', '009095985', '0', '00966', 128, 129, 'الرقة', '0', '2024-07-30 15:01:55', '2024-07-30 15:01:55'),
(162, 'كامله', 'الخلف', 'كامله', 'Kamleh', 'c7.kamleh@chamivs.com', 'K123456@', '2012-01-01', 'female', 1, 6, 1, '11111111852', '009095947', '0', '00966', 128, 129, 'الرقة', '0', '2024-07-30 15:04:19', '2024-07-30 15:04:19'),
(163, 'أوس', 'الخلف', 'أوس', 'Aos', 'c4.aos@chamivs.com', 'A123456@', '2015-07-11', 'male', 1, 7, 1, '55555555511', '000061', '0', '00966', 128, 129, 'الويدة', '50', '2024-07-30 15:07:05', '2024-07-30 15:07:05'),
(164, 'علي', 'بشير', 'علي', 'Ali', 'c9.ali@chamivs.com', 'A123456@', '2010-07-14', 'male', 1, 8, 1, '55551111112', '013337901', '0', '00971', 129, 130, 'التل', '268', '2024-07-30 15:08:45', '2024-07-30 15:08:45'),
(165, 'بلال', 'الواكد', 'بلال', 'Bilal', 'c3.bilal@chamivs.com', 'B123456@', '2016-04-04', 'male', 1, 5, 1, '01030465824', '011700352', '0', '00966', 130, 131, 'القدم', '342', '2024-07-30 15:10:28', '2024-07-30 15:10:28'),
(166, 'جودي', 'البري', 'جودي', 'Joudi', 'c6.joudi@chamivs.com', 'J123456@', '2012-10-01', 'male', 1, 7, 1, '04011136127', '016125872', '.', '00971', 131, 132, 'الشياح', '499', '2024-07-30 16:01:18', '2024-07-30 16:01:18'),
(167, 'محمد', 'الأحمد', 'محمد', 'Mohammad', 'c4.mohammad.a@chamivs.com', 'M123456@', '2014-01-01', 'male', 1, 1, 1, '00087444444', '011082973', '0', '00971', 8, 6, 'ابو كنصة', '29', '2024-07-30 16:03:57', '2024-07-30 16:03:57'),
(168, 'حسين', 'الأحمد', 'حسين', 'Housen', 'c5.housen@chamivs.com', 'H123456@', '2014-01-01', 'male', 1, 7, 1, '11114444561', '011082972', '0', '00971', 8, 6, 'ابو كنصة', '29', '2024-07-30 16:04:18', '2024-07-30 16:04:18'),
(169, 'احمد', 'الأحمد', 'احمد', 'Ahmad', 'c5.ahmad.a@chamivs.com', 'A123456@', '2014-01-01', 'male', 1, 7, 1, '66666661111', '011082974', '0', '00971', 8, 6, 'ابو كنصة', '29', '2024-07-30 16:05:29', '2024-07-30 16:05:29'),
(170, 'سالي', 'الجندي', 'سالي', 'Saly', 'c9.saly@chamivs.com', 'S123456@', '2010-01-01', 'female', 1, 7, 1, '02010396052', '014521997', '0', '00971', 35, 33, 'عزيزيه', '251/12', '2024-07-30 16:06:57', '2024-07-30 16:06:57'),
(171, 'ليلى', 'الجندي', 'ليلى', 'Laila', 'c6.laila@chamivs.com', 'L123456@', '2013-12-14', 'female', 1, 7, 1, '02010420368', '14522283', '0', '00971', 35, 33, 'عزيزيه', '251/12', '2024-07-30 16:08:57', '2024-07-30 16:08:57'),
(172, 'ريان', 'فخار', 'ريان', 'Rayan', 'c8.rayan@chamivs.com', 'R123456@', '2008-12-22', 'male', 49, 8, 1, '11114444856', '4593142', '0', '00971', 132, 133, 'المغرب', '0', '2024-07-30 16:10:20', '2024-07-30 16:10:20'),
(173, 'يوسف', 'ابو عاقله', 'يوسف', 'Yousif', 'c9.yousif@chamivs.com', 'Y123456@', '2008-12-30', 'male', 38, 8, 1, '55555520202', '06920964', '0', '00971', 133, 134, 'سودان', '0', '2024-07-30 16:12:07', '2024-07-30 16:12:07'),
(174, 'عدنان', 'غواصى', 'عدنان', 'Adnan', 'c11.adnan@chamivs.com', 'A123456@', '2008-08-26', 'male', 14, 8, 1, '55554812036', '96890166', '0', '00971', 134, 135, 'ايران', '0', '2024-07-30 16:13:45', '2024-07-30 16:13:45'),
(175, 'سيد محمد', 'محمدي', 'سيد محمد', 'Seyed Mohammad', 'c3.seyedmohammad@chamivs.com', 'M123456@', '2015-07-04', 'male', 14, 8, 1, '00002645890', '097417716', '0', '00971', 135, 136, 'ايران', '0', '2024-07-30 16:15:53', '2024-07-30 16:15:53'),
(176, 'محمد', 'قمحية', 'محمد', 'Mohammad', 'c5.mohammad@chamivs.com', 'M123456@', '2011-10-26', 'male', 1, 7, 1, '00000015489', '0003232', '0', '00966', 136, 137, 'خالديه', '99', '2024-07-30 16:17:12', '2024-07-30 16:17:12'),
(177, 'شام', 'الفريح', 'شام', 'Sham', 'c4.sham.f@chamivs.com', 'S123456@', '2014-11-19', 'female', 1, 6, 1, '22222254546', '011097673', '0', '00966', 137, 138, 'ميادين وسط', '205', '2024-07-30 16:18:47', '2024-07-30 16:18:47'),
(178, 'بسمله', 'المصطفى', 'بسمله', 'Basmala', 'c4.basmala@chamivs.com', 'B123456@', '2015-03-01', 'female', 1, 8, 1, '00033592867', '016575400', '0', '00966', 138, 139, 'وسط', '473', '2024-07-30 16:20:00', '2024-07-30 16:20:00'),
(179, 'بسمة', 'الكردي', 'بسمة', 'Basma', 'c6.basma@chamivs.com', 'B123456@', '2012-06-07', 'female', 1, 7, 1, '3080148323', '2222263', '0', '00966', 139, 140, 'التل', '171', '2024-07-30 16:22:39', '2024-07-30 16:22:39'),
(180, 'تالين', 'الكردي', 'تالين', 'Taleen', 'c3.taleen@chamivs.com', 'T123456@', '2014-11-02', 'female', 1, 7, 1, '00033696266', '1111123', '0', '00966', 139, 140, 'التل', '171', '2024-07-30 16:23:28', '2024-07-30 16:23:28'),
(181, 'سما', 'حوسو', 'سما', 'Sama', 'c7.sama@chamivs.com', 'S123456@', '2012-08-12', 'female', 1, 8, 1, '00002323000', '012762214', '0', '00971', 142, 143, 'حلب', '0', '2024-07-30 16:25:30', '2024-07-30 16:25:30'),
(182, 'شام', 'حوسو', 'شام', 'Sham', 'c7.sham.h@chamivs.com', 'S123456@', '2012-08-12', 'female', 1, 1, 1, '00008531200', '012762213', '0', '00971', 142, 143, 'حلب', '0', '2024-07-30 16:26:19', '2024-07-30 16:26:19'),
(183, 'كنده', 'المقداد', 'كنده', 'Kind', 'c9.kind@chamivs.com', 'K123456@', '2007-11-24', 'female', 1, 6, 1, '01030407015', '014938220', '0', '00971', 143, 144, 'زاهره', '227', '2024-07-30 16:29:10', '2024-07-30 16:29:10'),
(184, 'هيفاء', 'المقداد', 'هيفاء', 'Haifaa', 'c9.haifaa@chamivs.com', 'H123456@', '2010-01-03', 'female', 1, 7, 1, '01030400875', '014938218', '0', '00971', 143, 144, 'زاهره', '227', '2024-07-30 16:29:53', '2024-07-30 16:29:53'),
(185, 'غنى', 'حوسو', 'غنى', 'Ghena', 'c11.ghena@chamivs.com', 'G123456@', '2007-07-17', 'female', 1, 7, 1, '22225111111', '013150039', '0', '00971', 142, 143, 'حلب', '0', '2024-07-30 16:32:05', '2024-07-30 16:32:05'),
(186, 'عبد القادر', 'حاج محمد', 'عبد القادر', 'Abdulkader', 'c6.abdulkader@chamivs.com', 'A123456@', '2012-09-01', 'male', 1, 8, 1, '11115555555', '008759601', '0', '00966', 146, 147, 'الطيبة', '68', '2024-07-30 16:33:48', '2024-07-30 16:33:48'),
(187, 'نور', 'حاج محمد', 'نور', 'Noor', 'c3.noor@chamivs.com', 'N123456@', '2015-07-22', 'female', 1, 7, 1, '11111124541', '0002410', '0', '00966', 146, 147, 'الطيبة', '68', '2024-07-30 16:35:10', '2024-07-30 16:35:10'),
(188, 'بيسان', 'المقداد', 'بيسان', 'Bessan', 'c7.bessan@chamivs.com', 'B123456@', '2012-04-07', 'female', 1, 8, 1, '55556265201', '012461388', '0', '00971', 47, 48, 'درعا', '0', '2024-07-30 16:38:00', '2024-07-30 16:38:00'),
(189, 'علي', 'أيوب', 'علي', 'Ali', 'c11.ali@chamivs.com', 'A123456@', '2007-09-10', 'male', 1, 3, 1, '06100089576', '014566291', '0', '00971', 147, 149, 'ريف دمشق', '0', '2024-07-30 16:39:13', '2024-07-30 16:39:13'),
(190, 'صلاح الدين', 'الكردي', 'صلاح الدين', 'Salah Eddin', 'c5.salah.eddin@chamivs.com', 'S123456@', '2012-06-10', 'male', 1, 7, 1, '03080156760', '013398559', '0', '00966', 148, 150, 'التل', '171', '2024-07-30 16:41:00', '2024-07-30 16:41:00'),
(191, 'شام', 'تيناوي', 'شام', 'Sham', 'c4.sham.t@chamivs.com', 'S123456@', '2015-11-03', 'female', 1, 4, 1, '11114444254', '888814', '0', '00966', 149, 151, 'دمشق', '0', '2024-07-30 16:43:15', '2024-07-30 16:43:15'),
(192, 'راشد', 'جبارة', 'راشد', 'Rashed', 'c5.rashed@example.com', 'ٌ123456@', '2012-02-19', 'male', 53, 1, 1, '00000000005', '312284', '0', '00971', 151, 153, 'الأردن', '0', '2024-07-30 16:58:19', '2024-07-30 16:58:19'),
(193, 'جوان', 'جبارة', 'جوان', 'Jwan', 'c8.jwan@example.com', 'J123456@', '2010-06-22', 'female', 53, 1, 1, '00000000008', '312285', '0', '00971', 151, 153, 'الأردن', '0', '2024-07-30 17:00:12', '2024-07-30 17:00:12'),
(194, 'عدنان', 'فخار', 'عدنان', 'Adnane', 'c8.adnan@example.com', 'A123456@', '2008-12-22', 'male', 49, 1, 1, '00000000004', '9520842', '0', '00971', 132, 133, 'المغرب', '0', '2024-07-30 17:02:28', '2024-07-30 17:02:28'),
(195, 'فاطمة الزهراء', 'ضياء الدين', 'فاطمة الزهراء', 'Fatimalzahraa', 'c7.fatimalzahraa@chamivs.com', 'F123456@', '2012-10-23', 'female', 10, 6, 1, '11114445251', '23733205', '0', '00971', 152, 154, 'مصر', '0', '2024-07-30 17:12:21', '2024-07-30 17:12:21'),
(196, 'علي', 'ضياء الدين', 'علي', 'Ali', 'c7.ali.d@chamivs.com', 'A123456@', '2012-10-23', 'male', 10, 1, 1, '11115552333', '23733247', '0', '00971', 152, 154, 'مصر', '0', '2024-07-30 17:13:05', '2024-07-30 17:13:05'),
(197, 'حسام', 'القزاز', 'حسام', 'Husam', 'c3.husam@chamivs.com', 'H123456@', '2016-06-16', 'male', 15, 5, 1, '00000000045', '19481260', '0', '00971', 153, 155, 'العراق', '0', '2024-07-30 17:24:24', '2024-07-30 17:24:24'),
(198, 'أوسم', 'البلخي', 'أوسم', 'Awsam', 'c3.awsam@chamivs.com', 'A123456@', '2017-01-10', 'male', 1, 1, 1, '12100116932', '016561728', '0', '00971', 154, 156, 'بخيخ', '1', '2024-07-30 17:26:15', '2024-07-30 17:26:15'),
(199, 'محمد', 'حايك', 'محمد', 'Mohammad', 'c7.mohammad@chamivs.com', 'M123456@', '2012-09-08', 'male', 1, 1, 1, '00000007654', '007218451', '0', '00966', 155, 157, 'حلب', '0', '2024-07-30 17:28:07', '2024-07-30 17:31:21'),
(200, 'علي', 'العبود', 'علي', 'Ali', 'c7.aliabod@chamivs.com', 'A123456@', '2011-06-18', 'male', 15, 1, 1, '00000034678', '17830066', '00', '00971', 67, 67, 'العراق', '0', '2024-07-30 17:30:39', '2024-07-30 17:30:39'),
(201, 'جاسم', 'العبود', 'جاسم', 'Jasim', 'c8.jasim@chamivs.com', 'J123456@', '2010-10-30', 'male', 1, 7, 1, '00002225555', '15487791', '.', '00971', 156, 158, 'العراق', '0', '2024-07-31 13:45:50', '2024-07-31 13:45:50'),
(202, 'جاسم', 'العبود', 'جاسم', 'Jasim', 'c8.jasiim.a@chamivs.com', 'J123456@', '2010-10-30', 'male', 15, 7, 1, '00002225556', '154877910', '.', '00971', 156, 158, 'العراق', '0', '2024-07-31 13:47:40', '2024-07-31 13:47:40'),
(203, 'يوسف', 'العبود', 'يوسف', 'Yousif', 'c3.yousif@chamivs.com', 'Y123456@', '2016-02-22', 'male', 15, 8, 1, '22255566631', '19472655', '..', '00971', 156, 158, 'العراق', '0', '2024-07-31 13:50:15', '2024-07-31 13:50:15'),
(204, 'صفية', 'العنفوص', 'صفية', 'Sifiat', 'c3.sifiat@chamivs.com', 'S123456@', '2016-05-03', 'female', 1, 5, 1, '00033271197', '015705516', '0', '00971', 157, 159, 'دير الزور', '0', '2024-07-31 13:57:54', '2024-07-31 13:57:54'),
(205, 'مشاري', 'العنفوص', 'مشاري', 'Meshari', 'c3.meshari@chamivs.com', 'M123456@', '2015-02-25', 'male', 1, 7, 1, '55556222000', '012091124', '0', '00971', 157, 160, 'دير الزور', '0', '2024-07-31 14:03:24', '2024-07-31 14:03:24'),
(206, 'منار', 'الحسن', 'منار', 'Manar', 'c7.manar@chamivs.com', 'M123456@', '2011-02-05', 'female', 1, 7, 1, '44445555555', '011490297', '0', '00971', 158, 161, 'دير الزور', '0', '2024-07-31 14:06:23', '2024-07-31 14:06:23'),
(207, 'يحيى', 'خروب', 'يحيى', 'Yahya', 'c3.yahya@chamivs.com', 'Y123456@', '2015-12-27', 'male', 1, 7, 1, '12130075824', '015125102', '0', '00971', 159, 162, 'درعا', '0', '2024-07-31 14:11:10', '2024-07-31 14:11:10'),
(208, 'ندى', 'خروب', 'ندى', 'Nada', 'c7.nada.k@chamivs.com', 'N123456@', '2011-06-10', 'female', 1, 7, 1, '12130065529', '015149816', '0', '00971', 160, 163, 'درعا', '0', '2024-07-31 14:13:46', '2024-07-31 14:18:06'),
(209, 'حلا', 'خروب', 'حلا', 'Hala', 'c6.hala.k@chamivs.com', 'H123456@', '2013-11-14', 'female', 1, 7, 1, '121130075828', '015149753', '0', '00971', 160, 163, 'درعا', '0', '2024-07-31 14:20:53', '2024-07-31 14:20:53'),
(210, 'فهد', 'خروب', 'فهد', 'Fahed', 'c3.fahed@chamivs.com', 'F123456@', '2015-09-07', 'male', 1, 7, 1, '12130075827', '015149764', '0', '00971', 160, 163, 'درعا', '0', '2024-07-31 14:23:10', '2024-07-31 14:23:10'),
(211, 'جوري', 'الوحادي', 'جوري', 'Jory', 'c6.jory@chamivs.com', 'J123456@', '2013-04-03', 'female', 1, 7, 1, '00034756276', '0000356', '0', '00971', 161, 164, 'دير الزور', '0', '2024-07-31 14:31:04', '2024-07-31 14:31:04'),
(212, 'شهاب', 'الوحادي', 'شهاب', 'Shihab', 'c4.shihab.w@chamivs.com', 'S123456@', '2015-03-09', 'male', 1, 7, 1, '00034756374', '00510033', '0', '00971', 161, 164, 'دير الزور', '0', '2024-07-31 14:32:49', '2024-07-31 14:32:49'),
(213, 'هايدي', 'الوحادي', 'هايدي', 'Hayidi', 'c5.hayidi@chamivs.com', 'H123456@', '2014-03-30', 'female', 1, 7, 1, '00034756448', '00510027', '0', '00971', 161, 164, 'دير', '0', '2024-07-31 14:34:15', '2024-07-31 14:34:15'),
(214, 'صهيب', 'العرنوس', 'صهيب', 'Sohaib', 'c3.sohaib@chamivs.com', 'S123456@', '2016-09-16', 'male', 1, 6, 1, '66665555551', '1110340', '0', '00966', 162, 165, 'ريف دمشق', '0', '2024-07-31 14:36:20', '2024-07-31 14:36:20'),
(215, 'نور العين', 'السيد', 'نور العين', 'Nooralain', 'c3.nooralain@chamivs.com', 'N123456@', '2015-06-30', 'female', 19, 1, 1, '22223333301', '486597', '0', '00971', 105, 107, 'الأردن', '0', '2024-07-31 14:39:20', '2024-07-31 14:39:20'),
(216, 'أحمد', 'عبد الله', 'أحمد', 'Ahmed', 'c6.ahmeed@chamivs.com', 'A123456@', '2013-10-10', 'male', 38, 7, 1, '22391647432', '07031270', '0', '00966', 163, 166, 'السودان', '0', '2024-07-31 14:44:05', '2024-07-31 14:44:05'),
(217, 'مزمل', 'عبد الله', 'مزمل', 'Muzamil', 'c4.muzamil@chamivs.com', 'M123456@', '2015-06-05', 'male', 38, 3, 1, '22403801353', '07032085', '0', '00966', 163, 166, 'السودان', '0', '2024-07-31 14:46:02', '2024-07-31 14:46:02'),
(218, 'محمد', 'عبد الله', 'محمد', 'Mohamed', 'c8.mohamed@chamivs.com', 'M123456@', '2011-02-10', 'male', 38, 7, 1, '10101528409', '07031774', '0', '00966', 163, 166, 'السودان', '0', '2024-07-31 14:47:22', '2024-07-31 14:47:22'),
(219, 'محمد معاذ', 'بحلاق', 'محمد معاذ', 'M.Moaz', 'c11s.m.moaz@chamivs.com', 'M123456@', '2008-06-10', 'male', 1, 7, 1, '11112530123', '13150839', '0', '00971', 117, 117, 'مريجه', '125', '2024-07-31 14:49:32', '2024-07-31 14:49:32'),
(220, 'راما', 'قاق', 'راما', 'Rama', 'c4.rama.k@chamivs.com', 'R123456@', '2014-09-10', 'female', 1, 1, 1, '11144465456', '010307741', '0', '00966', 5, 3, 'سرمين الزاويه', '73', '2024-07-31 14:51:18', '2024-07-31 14:51:18'),
(221, 'تيم', 'عزي', 'تيم', 'Taim', 'c11.taim@chamivs.com', 'T123456@', '2008-07-30', 'male', 1, 7, 1, '11144455523', '015094544', '0', '00964', 164, 168, 'السويداء', '47', '2024-07-31 14:56:31', '2024-07-31 14:58:06'),
(222, 'شهد', 'السيد', 'شهد', 'Shahed', 'c5.shahed.s@chamivs.com', 'S123456@', '2012-08-25', 'female', 1, 1, 1, '00000022352', '0003061', '0', '00966', 165, 169, 'حمص', '0', '2024-07-31 14:59:33', '2024-07-31 14:59:33'),
(223, 'هبه', 'الكريم', 'هبه', 'Heba', 'c2.heba@chamivs.com', 'H123456@', '2017-01-09', 'female', 1, 7, 1, '11112203202', '013082220', '0', '00971', 166, 170, 'الطيبة', '97', '2024-07-31 15:01:58', '2024-07-31 15:02:37'),
(224, 'مثنى', 'السعيد', 'مثنى', 'Muthana', 'c9.muthana@chamivs.com', 'M123456@', '2009-01-24', 'male', 1, 7, 1, '11120202011', '014127868', '0', '00971', 167, 171, 'القنيطرة', '0', '2024-07-31 15:04:59', '2024-07-31 15:06:33'),
(225, 'عبد الرحمن', 'عبد الرحمن', 'عبد الرحمن', 'Abdul Rahman', 'c7.abdulraman@chamivs.com', 'A123456@', '2013-01-01', 'male', 1, 7, 1, '07170112597', '014298254', '0', '0090', 168, 172, 'ارمناز مناسيه', '46', '2024-07-31 15:14:27', '2024-07-31 15:15:14'),
(226, 'كرم', 'عبد الرحمن', 'كرم', 'Karam', 'c5.kamam@chamivs.com', 'K123456@', '2014-07-01', 'male', 1, 1, 1, '07170112596', '014298255', '0', '0090', 168, 172, 'ارمناز مناسيه', '46', '2024-07-31 15:18:50', '2024-07-31 15:18:50'),
(227, 'ميرا', 'أبازيد', 'ميرا', 'Mira', 'c2.mira.a@chamivs.com', 'M123456@', '2017-12-02', 'female', 1, 4, 1, '22226565214', '015105549', '0', '00966', 169, 173, 'درعا', '0', '2024-07-31 15:22:17', '2024-07-31 15:22:17'),
(228, 'مريم', 'أبازيد', 'مريم', 'Mariam', 'c4.mariam.a@chamivs.com', 'M123456@', '2015-12-26', 'female', 1, 4, 1, '55556666485', '015105550', '0', '00966', 169, 173, 'درعا', '0', '2024-07-31 15:24:30', '2024-07-31 15:24:30');
INSERT INTO `students` (`id`, `first_name`, `last_name`, `name_ar`, `name_en`, `email`, `password`, `birthdate`, `gender`, `nationality_id`, `blood_type_id`, `religion_id`, `national_id`, `passport_id`, `phone`, `mobile`, `father_id`, `mother_id`, `record_place`, `record_id`, `created_at`, `updated_at`) VALUES
(229, 'ملاك', 'عفان', 'ملاك', 'Malak', 'c6.malak.a@chamivs.com', 'M123456@', '2013-02-02', 'female', 1, 8, 1, '64641111111', '008379695', '0', '00966', 170, 174, 'دمشق قنيطره', '1714', '2024-07-31 15:26:09', '2024-07-31 15:29:17'),
(230, 'سمير', 'العدس', 'سمير', 'Samir', 'c11s.samir@chamivs.com', 'S123456@', '2008-06-26', 'male', 1, 7, 1, '01040363853', '00092654', '0', '0062', 171, 175, 'قراونة', '29', '2024-07-31 15:38:25', '2024-07-31 15:40:11'),
(231, 'قصي', 'العدس', 'قصي', 'Kusai', 'c8.kusai@chamivs.com', 'K123456@', '2012-01-10', 'male', 1, 7, 1, '01040403390', '00090223', '0', '0062', 171, 175, 'قراونة', '29', '2024-07-31 15:42:16', '2024-07-31 15:42:16'),
(232, 'وسام', 'قطان', 'وسام', 'Wesam', 'c5.wesam@chamivs.com', 'W123456@', '2013-07-14', 'male', 1, 7, 1, '02020760930', '009209441', '000', '00966', 172, 176, 'صاجليخان', '104', '2024-07-31 15:49:44', '2024-07-31 15:49:44'),
(233, 'اسراء', 'قطان', 'اسراء', 'Esraa', 'c3.esraa@chamivs.com', 'E123456@', '2015-10-08', 'female', 1, 7, 1, '22211121222', '666521', '0', '00966', 172, 176, 'صاجليخان', '104', '2024-07-31 15:52:06', '2024-07-31 15:52:06'),
(234, 'ابي', 'غانم', 'ابي', 'Obai', 'c12s.obai@chamivs.com', 'O123456@', '2007-07-05', 'male', 1, 1, 1, '13010029996', '015522217', '0', '00966', 173, 177, 'المشنف', '61', '2024-07-31 15:55:58', '2024-07-31 15:56:50'),
(235, 'حلا', 'الحسين الشيخ', 'حلا', 'Hala', 'c3.hala.h@chamivs.com', 'H123456@', '2016-10-03', 'female', 1, 7, 1, '00003131000', '0004328', '0', '00966', 174, 178, 'الرقة', '0', '2024-07-31 15:59:06', '2024-07-31 15:59:06'),
(236, 'بندر', 'الكحطان', 'بندر', 'Bandar', 'c7.bandar@chamivs.com', 'B123456@', '2012-02-20', 'male', 1, 1, 1, '55588841200', '606010', '0', '00966', 175, 179, 'الحسكة', '0', '2024-07-31 16:01:42', '2024-07-31 16:02:51'),
(237, 'شام', 'المشوح', 'شام', 'Sham', 'c6.sham.m@chamivs.com', 'S123456@', '2012-11-08', 'female', 1, 7, 1, '333222000125', '014984416', '0', '00966', 176, 180, 'السويعية أساس', '108', '2024-07-31 16:04:36', '2024-07-31 16:05:31'),
(238, 'غرام', 'قناص', 'غرام', 'Arram', 'c7.arram.k@chamivs.com', 'A123456@', '2010-05-01', 'female', 1, 7, 1, '32323232111', '008663416', '0', '00966', 177, 181, 'حمص', '0', '2024-07-31 16:07:34', '2024-07-31 16:08:04'),
(239, 'جود', 'نضر', 'جود', 'Joud', 'c4.joud@chamivs.com', 'J123456@', '2015-08-09', 'male', 1, 1, 1, '21521215000', '015104884', '0', '00966', 178, 182, 'دمشق', '0', '2024-07-31 16:09:56', '2024-07-31 16:14:15'),
(240, 'عبدالله', 'الظاهر', 'عبدالله', 'Abdullah', 'abdullah.z@chamivs.com', 'A123456@', '2011-09-19', 'male', 1, 7, 1, '22221111110', '006920596', '0', '00966', 179, 183, 'ريف دمشق', '0', '2024-07-31 16:16:04', '2024-07-31 16:16:04'),
(241, 'جنى', 'بيرقدار', 'جنى', 'Jana', 'c5.jana.b@chamivs.com', 'J123456@', '2014-08-29', 'female', 1, 6, 1, '11111125251', '012024871', '0', '00966', 180, 184, 'حمص', '0', '2024-07-31 16:19:12', '2024-07-31 16:19:12'),
(242, 'حلا', 'السعدي', 'حلا', 'Hala', 'c3.hala.s@chamivs.com', 'H123456@', '2015-03-30', 'female', 1, 1, 1, '00080011111', '008916640', '0', '00966', 181, 185, 'الحسكة', '0', '2024-07-31 16:26:16', '2024-07-31 16:26:16'),
(243, 'حسن', 'بكاري', 'حسن', 'Hasan', 'c4.hasan.b@chamivs.com', 'H123456@', '2014-05-30', 'male', 1, 7, 1, '01020390296', '009680558', '0', '00966', 182, 186, 'أكراد', '650', '2024-07-31 16:54:18', '2024-07-31 16:54:18'),
(244, 'فهد', 'السباح', 'فهد', 'Fahad', 'c7.fahad@chamivs.com', 'F123456@', '2011-01-04', 'male', 1, 7, 1, '44444411113', '011237622', '0', '00966', 190, 194, 'الحسكة', '0', '2024-07-31 16:58:29', '2024-07-31 16:58:29'),
(245, 'بكر', 'زوارعه', 'بكر', 'Baker', 'c3.baker.za@chamivs.com', 'B123456@', '2016-06-27', 'male', 1, 7, 1, '..........8', '0112376220', '00', '00966', 191, 195, 'ريف دمشق', '0', '2024-07-31 17:21:39', '2024-07-31 17:21:39'),
(246, 'خالد', 'الظاهر', 'خالد', 'Khaled', 'khaled.d@chamivs.com', 'K123456@', '2013-03-14', 'male', 1, 6, 1, '21210685201', '008436695', '0', '00966', 179, 183, 'ريف دمشق', '0', '2024-07-31 17:26:26', '2024-07-31 17:26:26'),
(247, 'جولين', 'السعدي', 'جولين', 'Jolin', 'c2.jolin@chamivs.com', 'J123456@', '2016-08-28', 'female', 1, 7, 1, '11120232411', '08248008', '0', '00966', 192, 196, 'اليمن', '0', '2024-07-31 17:28:25', '2024-07-31 17:28:25'),
(248, 'ليلى', 'كبور', 'ليلى', 'Laila', 'c3.laila@chamivs.com', 'L123456@', '2016-09-19', 'female', 1, 6, 1, '33322200059', '012153150', '0', '00966', 194, 197, 'يبرود', '499', '2024-07-31 17:31:12', '2024-07-31 17:31:12'),
(250, 'عمر فاروق', 'علي عثمان', 'عمر فاروق', 'Omar Farouk', 'c3.omar.farouk@chamivs.com', 'O123456@', '2016-03-27', 'male', 1, 1, 1, '23333333333', '12256677', '0', '00966', 195, 198, 'حلب', '0', '2024-08-01 14:41:38', '2024-08-01 14:41:38'),
(251, 'نتالي', 'نضر', 'نتالي', 'Natali', 'c7.natali@chamivs.com', 'password', '2011-07-25', 'female', 1, 1, 1, '77886785678', '006488150', '00', '00966', 178, 182, 'دمشق', '0', '2024-08-01 14:44:56', '2024-08-01 14:44:56'),
(252, 'سيدرا', 'الباقر', 'سيدرا', 'Sidra', 'c2.sidra@chamivs.com', 'c123456@', '2017-10-24', 'female', 1, 1, 1, '22266645789', '566666', '0', '00966', 197, 199, 'دير الزور', '0', '2024-08-01 14:47:42', '2024-08-01 14:47:42'),
(253, 'محمود', 'العبود', 'محمود', 'Mahmoud', 'c7.mahmoud@chamivs.com', 'M123456@', '2012-09-09', 'male', 1, 1, 1, '76576556765', '007675023', '0', '00966', 198, 200, 'حلب', '0', '2024-08-01 14:50:02', '2024-08-01 14:50:02'),
(254, 'يزن', 'الباقر', 'يزن', 'Yazan', 'c6.yazanbb@chamivs.com', 'Y123456@', '2013-01-07', 'male', 1, 1, 1, '98980987654', '0', '0', '00966', 197, 199, 'دير الزور', '0', '2024-08-01 14:53:43', '2024-08-01 14:53:43'),
(255, 'عبد اللطيف', 'العبود', 'عبد اللطيف', 'Abdullatif', 'c4.Abdullatifal@chamivs.com', 'password', '2015-01-24', 'male', 1, 1, 1, '90876545678', '012106502', '0', '00966', 198, 200, 'حلب', '0', '2024-08-01 14:59:34', '2024-08-01 14:59:34'),
(256, 'شهد', 'المصري', 'شهد', 'Shahd', 'c7.shahdmm@chamivs.com', 'S123456@', '2010-07-30', 'male', 1, 1, 1, '23232323233', '012884465', '0', '00966', 199, 201, 'دمشق', '0', '2024-08-01 15:01:59', '2024-08-01 15:07:05'),
(257, 'ريماس', 'الفحيمان', 'ريماس', 'Remas', 'c7.remas@chamivs.com', 'R123456@', '2011-01-01', 'female', 1, 7, 1, '00097631024', '006496389', '0', '00966', 200, 202, 'دير الزور', '0', '2024-08-01 15:15:21', '2024-08-01 15:15:21'),
(258, 'ميار', 'الشحمه', 'ميار', 'Mayar', 'C4.mayar@chamivs.com', 'M123456@', '2013-06-29', 'female', 1, 7, 1, '11122200030', '013764563', '0', '00966', 201, 203, 'درعا', '0', '2024-08-01 15:17:39', '2024-08-01 15:17:39'),
(260, 'جراح', 'المشوح', 'جراح', 'Jarah', 'c2.jarah@chamivs.com', 'J123456@', '2016-10-05', 'male', 1, 7, 1, '44422203102', '011932952', '00', '00966', 176, 180, 'السويعية أساس', '108', '2024-08-01 15:30:39', '2024-08-01 15:30:39'),
(261, 'يقين', 'الحسن', 'يقين', 'Yakeen', 'c2.yakeen@chamivs.com', 'Y123456@', '2017-07-08', 'female', 1, 6, 1, '33321120245', '0000930', '00', '00966', 188, 192, 'بقرص تحتاني أساس', '41', '2024-08-01 15:32:35', '2024-08-01 15:32:35'),
(262, 'حسن', 'كوسا', 'حسن', 'Hasan', 'c6.hasan.k@chamivs.com', 'H123456@', '2013-07-20', 'male', 1, 8, 1, '99977733301', '001092', '0', '00966', 202, 204, 'ريف دمشق', '0', '2024-08-01 15:34:50', '2024-08-01 15:39:20'),
(263, 'أحمد', 'كوسا', 'أحمد', 'Ahmad', 'c2ahmad.k@chamivs.com', 'A123456@', '2016-11-18', 'male', 1, 1, 1, '11112220644', '0026402', '0', '00966', 202, 204, 'ريف دمشق', '0', '2024-08-01 15:42:03', '2024-08-01 15:42:03'),
(264, 'ابراهيم', 'الكردي', 'ابراهيم', 'Ibrahim', 'c6.ibrahim@chamivs.com', 'I123456@', '2011-05-05', 'male', 1, 7, 1, '11114530111', '011113375', '0', '00966', 187, 191, 'حلب', '0', '2024-08-01 15:45:14', '2024-08-01 15:45:14'),
(265, 'حلا', 'الفواز', 'حلا', 'Hala', 'c3.hala.fa@chamivs.com', 'H123456@', '2016-06-27', 'female', 1, 7, 1, '32222222122', '016107267', '0', '00966', 203, 205, 'قرية أم عظام', '46', '2024-08-01 15:48:49', '2024-08-01 15:52:06'),
(266, 'عبدالله', 'المقداد', 'عبدالله', 'Abdallah', 'c2.abdallah@chamivs.com', 'A123456@', '2016-04-06', 'male', 1, 8, 1, '10102222220', '014952150', '0', '00966', 186, 190, 'درعا', '0', '2024-08-01 15:54:56', '2024-08-01 15:54:56'),
(267, 'فاطمه', 'قناص', 'فاطمه', 'Fatema', 'c7.fatema@chamivs.com', 'F123456@', '2012-01-23', 'female', 1, 1, 1, '11111162042', '008663415', '0', '00966', 177, 181, 'حمص', '0', '2024-08-01 15:57:12', '2024-08-01 15:57:12'),
(268, 'مريم', 'الحمد', 'مريم', 'Mariam', 'c2.mariam@chamivs.com', 'M123456@', '2017-06-10', 'female', 1, 6, 1, '22233366666', '6662031', '0', '00966', 183, 187, 'دير الزور', '0', '2024-08-01 15:58:59', '2024-08-01 15:58:59'),
(269, 'مشعل', 'الطلب', 'مشعل', 'Meshaal', 'c7meshaal@chamivs.com', 'M123456@', '2011-04-01', 'male', 1, 7, 1, '11112020111', '006485106', '0', '00966', 185, 189, 'الحسكة', '0', '2024-08-01 16:01:04', '2024-08-01 16:01:04'),
(270, 'مجد', 'العبد الله', 'مجد', 'Majed', 'c2.majed@chamivs.com', 'M123456@', '2017-10-21', 'male', 1, 7, 1, '64646464646', '444002', '0', '00966', 184, 188, 'دير الزور', '0', '2024-08-01 16:02:50', '2024-08-01 16:02:50'),
(271, 'وعد', 'الحمد', 'وعد', 'Waed', 'c2.waed@chamivs.com', 'W123456@', '2016-04-08', 'female', 1, 7, 1, '11110203145', '0006501', '0', '00966', 183, 187, 'دير الزور', '0', '2024-08-01 16:04:11', '2024-08-01 16:04:11'),
(272, 'غيداء', 'الحفاشي', 'غيداء', 'Ghaida', 'c2.ghaida@chamivs.com', 'G123456@', '2016-05-05', 'female', 48, 6, 1, '11111110288', '11069306', '0', '00966', 189, 193, 'اليمن', '0', '2024-08-01 16:06:19', '2024-08-01 16:06:19');

-- --------------------------------------------------------

--
-- Table structure for table `student_additional_details`
--

CREATE TABLE `student_additional_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `number_of_fail_years` int(11) NOT NULL DEFAULT 0,
  `previous_school` varchar(255) DEFAULT NULL,
  `registration_type_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_courses`
--

CREATE TABLE `student_courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `type_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_course_locations`
--

CREATE TABLE `student_course_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `location` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_course_types`
--

CREATE TABLE `student_course_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_living_places`
--

CREATE TABLE `student_living_places` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_living_places`
--

INSERT INTO `student_living_places` (`id`, `name`, `note`, `created_at`, `updated_at`) VALUES
(2, 'dsadsa', NULL, '2024-08-03 00:42:57', '2024-08-03 00:42:57');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `name_ar`, `name_en`, `order`, `parent_id`, `note`, `created_at`, `updated_at`) VALUES
(1, 'التربية الدينية', 'ISL1', 0, NULL, NULL, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(2, 'اللغة العربية', 'ar', 0, NULL, NULL, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(3, 'المهارات الشفوية', 'ar11', 0, 2, NULL, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(4, 'المهارات الكتابية', 'ar12', 0, 2, NULL, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(5, 'اللغة الأجنبية', 'EN', 0, NULL, NULL, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(6, 'الرياضيات', 'MATH', 0, NULL, NULL, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(7, 'الدراسات الإجتماعية', 'IS', 0, NULL, NULL, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(8, 'العلوم و التربية الصحية', 'ALM', 0, NULL, NULL, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(9, 'التربية الفنية البصرية والجمالية', 'ART', 0, NULL, NULL, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(10, 'التربية البدنية و الرياضة', 'SPORT', 0, NULL, NULL, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(11, 'التربية الزراعية', 'AGR', 0, NULL, NULL, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(12, 'المشروع', 'pr', 0, NULL, NULL, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(13, 'السلوك', 'SL', 0, NULL, NULL, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(14, 'النشاط المدرسي و الطلائع', 'NST', 0, NULL, NULL, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(16, 'التربية المهنية', 'MHN', 0, NULL, NULL, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(18, 'اللغة الإنجليزية', 'EN', 0, NULL, NULL, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(19, 'اللغة الفرنسية / الروسية', 'FR/RUS', 0, NULL, NULL, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(20, 'العلوم العامة', 'SI', 0, NULL, NULL, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(21, 'تكنولوجيا المعلومات والاتصالات', 'INF', 0, NULL, NULL, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(22, 'التربية الموسيقية', 'MUS', 0, NULL, NULL, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(23, 'التربية الوطنية', 'WAT', 0, 32, 'null', '2024-07-22 18:26:35', '2024-07-25 09:15:55'),
(24, 'التاريخ', 'HIST', 0, 32, 'null', '2024-07-22 18:26:35', '2024-07-25 09:15:12'),
(25, 'الجغرافية', 'GEO', 0, 32, 'null', '2024-07-22 18:26:35', '2024-07-25 09:15:32'),
(26, 'الفلسفة والعلوم الإنسانية', 'FALS', 0, NULL, NULL, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(27, 'الفيزياء', 'FIS', 0, NULL, NULL, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(28, 'الكيمياء', 'KEM', 0, NULL, NULL, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(29, 'علم الأحياء والبيئة', 'ALOM', 0, NULL, NULL, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(30, 'الرياضيات / الاحصاء والاحتمال', 'MATH/11L', 0, NULL, NULL, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(31, 'قضايا فلسفية وإجتماعية ونفسية', 'PHLS', 0, NULL, NULL, '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(32, 'الدراسات الاجتماعية', 'soc2', 0, NULL, NULL, '2024-07-25 09:13:49', '2024-07-25 09:13:49');

-- --------------------------------------------------------

--
-- Table structure for table `subject_details`
--

CREATE TABLE `subject_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `max_grade` int(11) NOT NULL DEFAULT 100,
  `min_grade` int(11) NOT NULL DEFAULT 0,
  `failing_grade` int(11) NOT NULL DEFAULT 50,
  `is_failing` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `grade_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subject_details`
--

INSERT INTO `subject_details` (`id`, `subject_id`, `max_grade`, `min_grade`, `failing_grade`, `is_failing`, `is_active`, `grade_id`, `created_at`, `updated_at`) VALUES
(1, 1, 100, 41, 40, 0, 1, 1, '2024-07-17 15:05:04', '2024-07-23 10:59:07'),
(2, 3, 100, 41, 40, 0, 1, 1, '2024-07-17 15:05:04', '2024-07-23 11:22:48'),
(3, 4, 100, 41, 40, 0, 1, 1, '2024-07-17 15:05:04', '2024-07-23 11:02:19'),
(5, 5, 100, 41, 40, 0, 1, 1, '2024-07-17 15:05:04', '2024-07-23 11:02:49'),
(6, 6, 100, 41, 40, 0, 1, 1, '2024-07-17 15:05:04', '2024-07-23 11:03:02'),
(7, 8, 100, 41, 40, 0, 1, 1, '2024-07-17 15:05:04', '2024-07-23 11:03:16'),
(8, 7, 100, 41, 40, 0, 1, 1, '2024-07-17 15:05:04', '2024-07-23 11:03:28'),
(9, 9, 100, 41, 40, 0, 1, 1, '2024-07-17 15:05:04', '2024-07-23 11:03:53'),
(10, 10, 100, 41, 40, 0, 1, 1, '2024-07-17 15:05:04', '2024-07-23 11:04:14'),
(11, 11, 100, 41, 40, 0, 0, 1, '2024-07-17 15:05:04', '2024-07-23 11:04:45'),
(12, 12, 100, 41, 40, 0, 1, 1, '2024-07-17 15:05:04', '2024-07-23 11:04:28'),
(13, 13, 100, 41, 40, 0, 1, 1, '2024-07-17 15:05:04', '2024-07-23 11:04:56'),
(14, 14, 100, 41, 40, 0, 1, 1, '2024-07-17 15:05:04', '2024-07-23 11:05:14'),
(15, 16, 100, 41, 40, 0, 1, 1, '2024-07-17 15:05:04', '2024-07-23 11:23:11'),
(16, 1, 200, 0, 99, 0, 1, 2, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(17, 2, 600, 0, 300, 0, 1, 2, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(18, 18, 400, 0, 200, 0, 1, 2, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(19, 19, 300, 0, 150, 0, 1, 2, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(20, 7, 600, 0, 300, 0, 1, 2, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(21, 6, 600, 0, 300, 0, 1, 2, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(22, 21, 200, 0, 100, 0, 1, 2, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(23, 22, 200, 0, 100, 0, 1, 2, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(24, 22, 100, 41, 40, 0, 1, 1, '2024-07-17 15:05:04', '2024-07-23 11:10:39'),
(25, 9, 200, 0, 100, 0, 1, 2, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(26, 10, 200, 0, 100, 0, 1, 2, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(27, 12, 200, 0, 100, 0, 1, 2, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(28, 16, 200, 0, 100, 0, 1, 2, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(29, 13, 200, 0, 100, 1, 1, 2, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(30, 1, 200, 0, 40, 0, 0, 3, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(31, 2, 500, 0, 250, 0, 1, 3, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(32, 18, 400, 0, 80, 0, 1, 3, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(33, 19, 300, 0, 60, 0, 1, 3, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(34, 23, 200, 0, 40, 0, 1, 3, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(35, 24, 200, 0, 40, 0, 1, 3, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(36, 25, 200, 0, 40, 0, 1, 3, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(37, 26, 200, 0, 40, 0, 1, 3, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(38, 6, 400, 0, 80, 0, 1, 3, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(39, 21, 200, 0, 40, 0, 1, 3, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(40, 27, 200, 0, 40, 0, 1, 3, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(41, 28, 200, 0, 40, 0, 1, 3, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(42, 29, 200, 0, 40, 0, 1, 3, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(43, 9, 200, 0, 40, 0, 1, 3, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(44, 10, 200, 0, 40, 0, 1, 3, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(45, 12, 200, 0, 40, 0, 1, 3, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(46, 13, 200, 0, 140, 1, 1, 3, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(47, 2, 500, 0, 200, 0, 0, 3, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(48, 2, 600, 0, 300, 1, 0, 3, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(49, 24, 300, 0, 60, 0, 1, 3, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(50, 25, 300, 0, 60, 0, 1, 3, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(51, 26, 400, 0, 80, 0, 1, 3, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(52, 30, 100, 0, 20, 0, 0, 3, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(53, 2, 400, 0, 160, 1, 1, 3, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(54, 18, 300, 0, 60, 0, 1, 3, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(55, 19, 200, 0, 40, 0, 1, 3, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(56, 6, 600, 0, 120, 0, 1, 3, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(57, 27, 400, 0, 80, 0, 1, 3, '2024-07-17 15:05:04', '2024-07-17 09:40:48'),
(58, 29, 300, 0, 60, 0, 1, 3, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(59, 19, 400, 0, 80, 0, 1, 3, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(60, 31, 400, 0, 80, 0, 1, 3, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(61, 1, 100, 0, 50, 0, 0, 4, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(62, 3, 100, 0, 50, 0, 1, 4, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(63, 4, 100, 0, 50, 0, 1, 4, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(64, 5, 100, 0, 50, 0, 1, 4, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(65, 6, 100, 0, 50, 0, 1, 4, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(66, 7, 100, 0, 50, 0, 1, 4, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(67, 8, 100, 0, 50, 0, 1, 4, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(68, 22, 100, 0, 50, 0, 1, 4, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(69, 9, 100, 0, 50, 0, 1, 4, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(70, 10, 100, 0, 50, 0, 1, 4, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(71, 11, 100, 0, 50, 0, 0, 4, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(72, 12, 100, 0, 50, 0, 1, 4, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(73, 13, 100, 0, 50, 0, 1, 4, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(74, 14, 100, 0, 50, 0, 1, 4, '2024-07-17 15:05:04', '2024-07-17 15:05:04'),
(75, 20, 400, 0, 200, 0, 1, 2, '2024-07-17 08:41:36', '2024-07-17 08:41:36'),
(76, 18, 400, 0, 80, 0, 1, 3, '2024-07-17 09:41:47', '2024-07-17 09:41:47'),
(77, 16, 100, 0, 50, 0, 0, 4, '2024-07-17 10:00:35', '2024-07-17 10:00:35'),
(78, 1, 100, 50, 49, 0, 0, 1, '2024-07-23 11:28:15', '2024-07-23 11:28:15'),
(79, 3, 100, 50, 49, 0, 0, 1, '2024-07-23 11:28:55', '2024-07-23 11:28:55'),
(80, 4, 100, 50, 49, 0, 0, 1, '2024-07-23 11:29:13', '2024-07-23 11:29:13'),
(81, 5, 100, 50, 49, 0, 0, 1, '2024-07-23 11:32:26', '2024-07-23 11:32:26'),
(82, 6, 100, 50, 49, 0, 0, 1, '2024-07-23 11:33:03', '2024-07-23 11:33:03'),
(83, 7, 100, 50, 49, 0, 0, 1, '2024-07-23 11:33:21', '2024-07-23 11:33:21'),
(84, 8, 100, 50, 49, 0, 0, 1, '2024-07-23 11:33:38', '2024-07-23 11:33:38'),
(85, 22, 100, 50, 49, 0, 0, 1, '2024-07-23 11:34:23', '2024-07-23 11:34:23'),
(86, 9, 100, 50, 49, 0, 0, 1, '2024-07-23 11:34:42', '2024-07-23 11:34:42'),
(87, 10, 100, 50, 49, 0, 0, 1, '2024-07-23 11:35:05', '2024-07-23 11:35:05'),
(88, 11, 100, 50, 49, 0, 0, 1, '2024-07-23 11:35:24', '2024-07-23 11:35:24'),
(89, 12, 100, 50, 49, 0, 0, 1, '2024-07-23 11:35:40', '2024-07-23 11:35:40'),
(90, 16, 100, 50, 49, 0, 0, 1, '2024-07-23 11:35:59', '2024-07-23 11:35:59'),
(91, 13, 100, 50, 49, 0, 0, 1, '2024-07-23 11:36:14', '2024-07-23 11:36:14'),
(92, 14, 100, 50, 49, 0, 0, 1, '2024-07-23 11:36:40', '2024-07-23 11:36:40'),
(93, 2, 100, 41, 40, 1, 1, 1, '2024-07-24 08:33:03', '2024-07-24 09:59:43');

-- --------------------------------------------------------

--
-- Table structure for table `svg_ids`
--

CREATE TABLE `svg_ids` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `exam_id` bigint(20) UNSIGNED NOT NULL,
  `classs_school_years_id` bigint(20) UNSIGNED NOT NULL,
  `subject_detail_id` bigint(20) UNSIGNED NOT NULL,
  `svg_id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `max_width` int(11) DEFAULT NULL,
  `max_height` int(11) DEFAULT NULL,
  `font_size` varchar(255) DEFAULT NULL,
  `fill_color` varchar(255) DEFAULT NULL,
  `anchortext` varchar(255) DEFAULT NULL,
  `transform` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tableheaders`
--

CREATE TABLE `tableheaders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `min_height` int(11) NOT NULL,
  `max_width` int(11) NOT NULL,
  `left_margin` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tableheaders`
--

INSERT INTO `tableheaders` (`id`, `name`, `class_id`, `min_height`, `max_width`, `left_margin`, `created_at`, `updated_at`) VALUES
(2, 'dsadsa', 13, 1232, 231, 321, '2024-08-02 22:58:30', '2024-08-02 22:58:44');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name_ar` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `mother` varchar(255) NOT NULL,
  `specialization_id` bigint(20) UNSIGNED NOT NULL,
  `gender_id` bigint(20) UNSIGNED NOT NULL,
  `marital_status` tinyint(3) UNSIGNED NOT NULL,
  `birthdate` date NOT NULL,
  `address_birth` varchar(255) NOT NULL,
  `add_num` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `gern` varchar(255) NOT NULL,
  `religion` varchar(255) NOT NULL,
  `work_type` varchar(255) NOT NULL,
  `joining_date` date NOT NULL,
  `address` text NOT NULL,
  `address_fixed` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `certificates` varchar(255) NOT NULL,
  `highest_cert` varchar(255) NOT NULL,
  `date_obtained` date NOT NULL,
  `salary` decimal(8,2) NOT NULL,
  `type_job` varchar(255) NOT NULL,
  `type_dis` varchar(255) NOT NULL,
  `type_of_job` tinyint(3) UNSIGNED NOT NULL,
  `cityI` varchar(255) NOT NULL,
  `date_admin_work` date NOT NULL,
  `belongs_him` varchar(255) NOT NULL,
  `subjet` varchar(255) NOT NULL,
  `quorum_hours` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `e_quorum_hours` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `email`, `password`, `name_ar`, `name_en`, `mother`, `specialization_id`, `gender_id`, `marital_status`, `birthdate`, `address_birth`, `add_num`, `tel`, `mobile`, `gern`, `religion`, `work_type`, `joining_date`, `address`, `address_fixed`, `state`, `certificates`, `highest_cert`, `date_obtained`, `salary`, `type_job`, `type_dis`, `type_of_job`, `cityI`, `date_admin_work`, `belongs_him`, `subjet`, `quorum_hours`, `e_quorum_hours`, `created_at`, `updated_at`) VALUES
(1, 't.amal@chamivs.com', '$2y$12$2oxmCemxGatIkU/Pg8lMCO/ibwkgSw9lqv9EPH/qBPbpw//ukwo6O', 'أمل نجم', 'Amal Najm', 'سلمى عريج', 10, 6, 1, '2024-07-01', 'التياس', '13120005125', '319173', '0988072815', 'السورية', 'اسلامية', 'أمانة السر', '2023-08-01', 'السويداء-حي النهضة', 'السويداء-حي النهضة', 'السويداء', 'أهلية تعليم إعدادي/قسم اللغة الأنكليزية', 'أهلية تعليم إعدادي/قسم اللغة الأنكليزية', '1993-01-01', 251564.00, 'type job', 'dis jb', 2, 'state pos', '2023-08-01', 'malak', 'انكليزي', 20, 1, '2024-07-16 17:24:28', '2024-07-16 17:28:55');

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE `terms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `terms`
--

INSERT INTO `terms` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'الفصل الأول', '2024-07-22 18:26:35', '2024-07-22 18:26:35'),
(2, 'الفصل الثاني', '2024-07-22 18:26:35', '2024-07-22 18:26:35');

-- --------------------------------------------------------

--
-- Table structure for table `type_of_appointments`
--

CREATE TABLE `type_of_appointments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type_of_employment_id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `type_of_appointments`
--

INSERT INTO `type_of_appointments` (`id`, `type_of_employment_id`, `type`, `note`, `created_at`, `updated_at`) VALUES
(1, 1, 'عامل دائم', NULL, '2024-07-30 23:50:03', '2024-07-30 23:50:03'),
(2, 1, 'عقد رسمي', NULL, '2024-07-30 23:50:19', '2024-07-30 23:50:19'),
(3, 2, 'وكيل', NULL, '2024-07-30 23:50:28', '2024-07-30 23:50:28'),
(4, 2, 'مكلف', NULL, '2024-07-30 23:50:35', '2024-07-30 23:50:57'),
(5, 3, 'متعاقد', NULL, '2024-07-30 23:50:48', '2024-07-30 23:50:48'),
(6, 1, 'تحديد مركز عمل', NULL, '2024-07-31 17:08:09', '2024-07-31 17:08:09'),
(7, 4, 'متعاقد', NULL, '2024-07-31 17:08:48', '2024-07-31 17:08:48');

-- --------------------------------------------------------

--
-- Table structure for table `type_of_employments`
--

CREATE TABLE `type_of_employments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `type_of_employments`
--

INSERT INTO `type_of_employments` (`id`, `type`, `note`, `created_at`, `updated_at`) VALUES
(1, 'داخل الملاك', NULL, '2024-07-30 23:47:45', '2024-07-30 23:47:45'),
(2, 'خارج الملاك', NULL, '2024-07-30 23:47:56', '2024-07-30 23:47:56'),
(3, 'التعليم الخاص', NULL, '2024-07-30 23:48:30', '2024-07-31 17:07:08'),
(4, 'المدارس بالوكالة', NULL, '2024-07-31 17:07:22', '2024-07-31 17:07:22');

-- --------------------------------------------------------

--
-- Table structure for table `type_of_permanences`
--

CREATE TABLE `type_of_permanences` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `type_of_permanences`
--

INSERT INTO `type_of_permanences` (`id`, `type`, `note`, `created_at`, `updated_at`) VALUES
(1, 'كامل', NULL, '2024-07-31 01:46:54', '2024-07-31 01:46:54'),
(2, 'نصفي مع نفسها', NULL, '2024-07-31 01:47:02', '2024-07-31 01:47:29'),
(3, 'نصفي مع الغير', NULL, '2024-07-31 01:47:18', '2024-07-31 01:47:18');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin User', 'admin@example.com', NULL, '$2y$12$RPcWSVksNafXnbXiuXisR.W0eJytM77N9OEUet8jv5KweROAu5OBS', NULL, NULL, NULL, 'kDiMVv4wWJ2V6uti0Lfo90GQVfYuUdxb5e99BZSothDTfWjhgmW5XR76zGUO', '2024-07-22 18:26:34', '2024-07-22 18:26:34'),
(2, 'Teacher User', 'teacher@example.com', NULL, '$2y$12$L93jYxnBl4.kIrEpl3wZBOlZsuBjlp9hhhL3g9XZYxZFKloAKtCHi', NULL, NULL, NULL, NULL, '2024-07-22 18:26:34', '2024-07-22 18:26:34'),
(3, 'Student User', 'student@example.com', NULL, '$2y$12$gZmdy/VLA7LbJQusFJ6opeuUEzVfO3Ruct86d4sS3QtxLV7MVEiT6', NULL, NULL, NULL, NULL, '2024-07-22 18:26:34', '2024-07-22 18:26:34'),
(4, 'Parent User', 'parent@example.com', NULL, '$2y$12$6DpBajIAZ5BPaF7whKGXzumTrFo9UwIG6CVybVWViBf9E.Iwo9aoG', NULL, NULL, NULL, NULL, '2024-07-22 18:26:34', '2024-07-22 18:26:34');

-- --------------------------------------------------------

--
-- Table structure for table `verified_students`
--

CREATE TABLE `verified_students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `section_id` bigint(20) UNSIGNED NOT NULL,
  `is_confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `order` int(11) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `register_status` enum('waiting','normal','pending','graduated','moved','else') NOT NULL DEFAULT 'normal',
  `confirm_register_date` timestamp NULL DEFAULT NULL,
  `general_record` varchar(255) DEFAULT NULL,
  `language_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `verified_student_admin_notes`
--

CREATE TABLE `verified_student_admin_notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `verified_student_id` bigint(20) UNSIGNED NOT NULL,
  `note` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `verified_student_teacher_notes`
--

CREATE TABLE `verified_student_teacher_notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `verified_student_id` bigint(20) UNSIGNED NOT NULL,
  `note` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wives`
--

CREATE TABLE `wives` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `father_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `job` varchar(255) NOT NULL,
  `job_en` varchar(255) NOT NULL,
  `national_id` varchar(255) NOT NULL,
  `passport_id` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `nationality_id` bigint(20) UNSIGNED NOT NULL,
  `blood_type_id` bigint(20) UNSIGNED NOT NULL,
  `religion_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wives`
--

INSERT INTO `wives` (`id`, `father_id`, `name`, `name_en`, `job`, `job_en`, `national_id`, `passport_id`, `phone`, `nationality_id`, `blood_type_id`, `religion_id`, `created_at`, `updated_at`) VALUES
(1, 3, 'مؤمنه سلوم', 'Moamena', 'ربة منزل', 'Housewaife', '..', '..', '00971', 1, 2, 1, '2024-07-24 16:53:48', '2024-07-24 16:53:48'),
(2, 4, 'زهره محنايه', 'Zahra', 'ربة منزل', 'Housewaife', '..', '..', '00971', 1, 8, 1, '2024-07-24 17:02:04', '2024-07-24 17:02:04'),
(3, 5, 'رهف طالب', 'Rahf', 'ربة منزل', 'Housewaife', '...', '..', '00966', 1, 6, 1, '2024-07-24 17:19:38', '2024-07-24 17:19:38'),
(4, 6, 'هبا الربيع', 'Heba', 'ربة منزل', 'Housewaife', '...', '...', '00971', 1, 5, 1, '2024-07-24 17:22:12', '2024-07-24 17:22:12'),
(5, 7, 'سناء محمد', 'Sanaa', 'ربة منزل', 'Housewaife', '..', '...', '00966', 1, 5, 1, '2024-07-24 17:25:23', '2024-07-24 17:25:23'),
(6, 8, 'صفاء العلو', 'Safaa', 'ربة منزل', 'Housewaife', '....', '...', '00971', 1, 7, 1, '2024-07-25 15:15:43', '2024-07-25 15:15:43'),
(7, 9, 'رشا العلي', 'Racha', 'ربة منزل', 'Housewaife', '...', '...', '00971', 1, 7, 1, '2024-07-25 15:50:59', '2024-07-25 15:50:59'),
(8, 10, 'اماني زرنيخ', 'Amani', 'ربة منزل', 'Housewaife', '....', '...', '00971', 1, 8, 1, '2024-07-25 15:51:58', '2024-07-25 15:51:58'),
(9, 11, 'أمل الطباع', 'Amal', 'ربة منزل', 'Housewaife', '....', '....', '00971', 1, 7, 1, '2024-07-25 15:55:51', '2024-07-25 15:55:51'),
(10, 12, 'هدى عسراوي', 'Huda', 'ربة منزل', 'Housewaife', '..', '..', '00971', 1, 4, 1, '2024-07-25 16:02:12', '2024-07-25 16:02:12'),
(11, 13, 'زهراء مهدي', 'Zahraa', 'ربة منزل', 'Housewaife', '...', '....', '00971', 1, 3, 1, '2024-07-25 16:09:11', '2024-07-25 16:09:11'),
(12, 14, 'فاطمة محمد', 'Fatima', 'ربة منزل', 'Housewaife', '.........', '....', '00966', 1, 1, 1, '2024-07-25 16:16:03', '2024-07-25 16:16:03'),
(13, 15, 'خديجة المحمد الدرويش', 'Khadeja', 'ربة منزل', 'Housewaife', '...', '.........', '00966', 1, 3, 1, '2024-07-25 16:19:45', '2024-07-25 16:19:45'),
(14, 16, 'زهور ابراهيم', 'Zohour Ebrahem', 'ربة منزل', 'Housewaife', '.', '016368022', '00971', 1, 3, 1, '2024-07-25 16:24:26', '2024-07-25 16:24:26'),
(15, 17, 'ليال أبو حلا', 'Layal', 'ربة منزل', 'Housewaife', '....', '...', '00971', 1, 2, 1, '2024-07-25 16:27:56', '2024-07-25 16:27:56'),
(17, 18, 'رؤى دواره', 'Roa', 'ربة منزل', 'Housewaife', '...', '....', '00971', 1, 2, 1, '2024-07-25 16:45:19', '2024-07-25 16:45:19'),
(18, 19, 'ريما الشيخ الأرض', 'Rima', 'ربة منزل', 'Housewaife', '....', '...', '00971', 1, 5, 1, '2024-07-25 16:54:43', '2024-07-25 16:54:43'),
(19, 20, 'نور عبد المجيد', 'Noor', 'ربة منزل', 'Housewaife', '.....', '....', '00971', 1, 3, 1, '2024-07-25 16:57:14', '2024-07-25 16:57:14'),
(20, 21, 'رهام عسقول', 'Riham', 'ربة منزل', 'Housewaife', '....', '...', '00974', 1, 1, 1, '2024-07-25 17:02:06', '2024-07-25 17:02:06'),
(21, 23, 'مها الدليمان', 'Maha', 'ربة منزل', 'housewife', '00', '00', '00966', 1, 7, 1, '2024-07-27 14:00:26', '2024-07-27 14:00:26'),
(22, 24, 'بشرى الميزر', 'Bshra', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 7, 1, '2024-07-27 14:05:08', '2024-07-27 14:05:08'),
(23, 25, 'هدى الخولي', 'hoda', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 7, 1, '2024-07-27 14:08:34', '2024-07-27 14:08:34'),
(24, 26, 'بشرى الميزر', 'بشرى', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 7, 1, '2024-07-27 14:19:03', '2024-07-27 14:19:03'),
(25, 27, 'نبكية الحسين', 'nabkieh', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 7, 1, '2024-07-27 14:31:53', '2024-07-27 14:31:53'),
(26, 28, 'نعيمة الخلف البكار', 'Naima', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 3, 1, '2024-07-27 14:52:34', '2024-07-27 14:52:34'),
(27, 29, 'وفاء الذياب', 'wafaa', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 3, 1, '2024-07-27 14:57:20', '2024-07-27 14:57:20'),
(28, 22, 'يسرى عبد الغفور', 'Yusra', 'ربة منزل', 'Housewaife', '...', '......', '00971', 1, 7, 1, '2024-07-27 14:59:34', '2024-07-27 14:59:34'),
(29, 32, 'عائشة عاشور', 'Aicha', 'ربة منزل', 'Housewaife', '....', '.....', '00971', 1, 8, 1, '2024-07-27 15:04:56', '2024-07-27 15:04:56'),
(31, 33, 'فادية', 'fadia', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 4, 1, '2024-07-27 15:09:33', '2024-07-27 15:09:33'),
(32, 34, 'مريم الشيخ ابراهيم', 'Maryam', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 8, 1, '2024-07-27 15:15:13', '2024-07-27 15:15:13'),
(33, 35, 'غصون الضابطي', 'Ghoson Aldabti', 'مغترب', 'traveler', '000000000', '00', '00971', 1, 3, 1, '2024-07-27 15:23:46', '2024-07-27 15:23:46'),
(34, 35, 'غصون الضابطي', 'Ghoson Aldabti', 'مغترب', 'traveler', '000000000', '00', '00971', 1, 3, 1, '2024-07-27 15:24:06', '2024-07-27 15:24:06'),
(35, 36, 'أمل', 'ِAmal', 'ربة منزل', 'housewife', '000000000', '00', '00964', 1, 3, 1, '2024-07-27 15:31:55', '2024-07-27 15:31:55'),
(36, 37, 'جمانة الحسامي', 'joumana', 'ربة منزل', 'housewife', '000000000', '00', '00971', 1, 3, 1, '2024-07-27 15:36:06', '2024-07-27 15:36:06'),
(37, 38, 'حزامي البارودي', 'Hazami', 'ربة منزل', 'housewife', '000000000', '00', '00971', 1, 2, 1, '2024-07-27 15:40:48', '2024-07-27 15:40:48'),
(38, 39, 'علا محمود', 'ola', 'ربة منزل', 'housewife', '000000000', '00', '00971', 1, 6, 1, '2024-07-27 15:45:42', '2024-07-27 15:45:42'),
(39, 31, 'فطيم الخليف', 'Fteim', 'ربة منزل', 'Housewaife', '....', '.....', '00966', 1, 1, 1, '2024-07-27 15:45:53', '2024-07-27 15:45:53'),
(40, 40, 'محاسن نايف', 'Mahassen', 'ربة منزل', 'Housewaife', '....', '.....', '00966', 1, 3, 1, '2024-07-27 15:48:54', '2024-07-27 15:48:54'),
(41, 41, 'نها خضر', 'Noha', 'ربة منزل', 'housewife', '000000000', '00', '00971', 1, 6, 1, '2024-07-27 15:50:52', '2024-07-27 15:50:52'),
(42, 42, 'سماح نعيم', 'Samah', 'ربة منزل', 'housewife', '000000000', '00', '00974', 1, 3, 1, '2024-07-27 15:53:30', '2024-07-27 15:53:30'),
(43, 43, 'ريان الدرويش', 'Rayan', 'ربة منزل', 'Housewaife', '....', '000', '00966', 1, 8, 1, '2024-07-27 15:55:58', '2024-07-27 15:55:58'),
(44, 44, 'رشا عبد الرزاق', 'ٌRasha', 'ربة منزل', 'housewife', '000000000', '00', '00971', 1, 1, 1, '2024-07-27 15:57:09', '2024-07-27 15:57:09'),
(46, 45, 'مريم الحسن', 'Mariam', 'ربة منزل', 'housewife', '000000000', '00', '00971', 1, 4, 1, '2024-07-27 16:01:07', '2024-07-27 16:01:07'),
(47, 46, 'ايمان القاسم', 'Iman', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 3, 1, '2024-07-27 16:05:58', '2024-07-27 16:05:58'),
(48, 47, 'هيفاء المقداد', 'Haifaa', 'ربة منزل', 'housewife', '000000000', '00', '00971', 1, 2, 1, '2024-07-27 16:09:04', '2024-07-27 16:09:04'),
(49, 48, 'أمل أبو لطيف', 'ِِِAmal', 'ربة منزل', 'housewife', '000000000', '00', '00971', 1, 1, 1, '2024-07-27 16:13:12', '2024-07-27 17:18:21'),
(50, 49, 'نوف ناصيف', 'Nouf', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 2, 1, '2024-07-27 16:23:49', '2024-07-27 16:23:49'),
(51, 50, 'شيمه البرجس', 'Shema', 'ربة منزل', 'Housewaife', '...', '00..', '00966', 1, 7, 1, '2024-07-28 14:44:15', '2024-07-28 14:44:15'),
(52, 51, 'آلاء الكردي', 'ِِAlaa', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 8, 1, '2024-07-28 14:44:16', '2024-07-28 14:44:16'),
(53, 53, 'نسرين برو', 'Nisreen', 'ربة منزل', 'Housewaife', '00', '111', '00971', 1, 5, 1, '2024-07-28 14:52:43', '2024-07-28 14:52:43'),
(54, 55, 'وفاء البركات', 'ًWafaa', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 2, 1, '2024-07-28 15:05:09', '2024-07-28 15:05:09'),
(55, 54, 'مها الأطرش', 'Maha', 'ربة منزل', 'Housewaife', '...', '....', '00971', 1, 6, 1, '2024-07-28 15:07:28', '2024-07-28 15:07:28'),
(56, 56, 'نعيمة جمايلي', 'آشهةش', 'ربة منزل', 'housewife', '000000000', '00', '00971', 1, 2, 1, '2024-07-28 15:08:48', '2024-07-28 15:08:48'),
(57, 57, 'خوله مهملات', 'Khawla', 'ربة منزل', 'Housewaife', '......', '....', '0971', 1, 3, 1, '2024-07-28 15:17:00', '2024-07-28 15:17:00'),
(58, 58, 'روعه عليا', 'Rawaa', 'ربة منزل', 'Housewaife', '...', '...', '00971', 1, 6, 1, '2024-07-28 15:26:26', '2024-07-28 15:26:26'),
(59, 59, 'ايثار خروب', 'Eithr', 'ربة منزل', 'Housewaife', '00.', '0.0.0', '00971', 1, 2, 1, '2024-07-28 15:32:18', '2024-07-28 15:32:18'),
(60, 60, 'فاطمه الأحمد', 'Fatima', 'ربة منزل', 'Housewaife', '..', '..', '00966', 1, 7, 1, '2024-07-28 15:38:16', '2024-07-28 15:38:16'),
(61, 61, 'بتول كعكه', 'Batoul', 'ربة منزل', 'Housewaife', '...', '....', '00966', 1, 7, 1, '2024-07-28 15:44:17', '2024-07-28 15:44:17'),
(62, 62, 'زينب سلامه', 'Zainab', 'ربة منزل', 'Housewaife', '...', '....', '00966', 1, 2, 1, '2024-07-28 15:46:27', '2024-07-28 15:46:27'),
(63, 63, 'هبة الناصيف', 'Heba', 'ربة منزل', 'housewife', '000000000', '00', '00971', 1, 1, 1, '2024-07-28 15:51:22', '2024-07-28 15:51:22'),
(64, 64, 'تبسم رحيم', 'Tabassum', 'ربة منزل', 'housewife', '000000000', '00', '00971', 1, 5, 1, '2024-07-28 15:54:05', '2024-07-28 15:54:05'),
(65, 65, 'هبه الروس', 'Heba', 'ربة منزل', 'Housewaife', '....', '...', '00966', 1, 5, 1, '2024-07-28 15:56:04', '2024-07-28 15:56:04'),
(66, 66, 'احسان عبد العال', 'ِAhssan', 'ربة منزل', 'housewife', '000000000', '00', '00971', 1, 3, 1, '2024-07-28 15:56:31', '2024-07-28 15:56:31'),
(67, 67, 'مريم الوندي', 'Maryam', 'ربة منزل', 'housewife', '000000000', '00', '00971', 1, 2, 1, '2024-07-28 16:00:55', '2024-07-28 16:00:55'),
(68, 68, 'ايمان العسكر', 'Iman', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 3, 1, '2024-07-28 16:04:54', '2024-07-28 16:04:54'),
(69, 69, 'مريم غانم', 'Mariam', 'ربة منزل', 'housewife', '000000000', '00', '00971', 1, 1, 1, '2024-07-28 16:06:59', '2024-07-28 16:06:59'),
(70, 70, 'امنة صراميجو', 'Amneh', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 3, 1, '2024-07-28 16:10:48', '2024-07-28 16:10:48'),
(71, 71, 'فاطمه القاسم', 'Fatimah', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 2, 1, '2024-07-28 16:13:10', '2024-07-28 16:13:10'),
(72, 72, 'رزان مصري', 'Razan', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 2, 1, '2024-07-28 16:21:54', '2024-07-28 16:21:54'),
(73, 73, 'منال طير', 'Manal', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 4, 1, '2024-07-28 16:27:42', '2024-07-28 16:27:42'),
(74, 74, 'خلود ابو عساف', 'Kholod', 'ربة منزل', 'housewife', '000000000', '00', '00964', 1, 1, 1, '2024-07-28 16:31:23', '2024-07-28 16:31:23'),
(75, 75, 'رنده وهبة', 'Randa', 'ربة منزل', 'housewife', '000000000', '00', '00968', 22, 3, 1, '2024-07-28 16:36:36', '2024-07-28 16:36:36'),
(76, 76, 'هبة دروزه', 'أثلاشا', 'ربة منزل', 'housewife', '000000000', '00', '00971', 19, 1, 1, '2024-07-28 16:39:38', '2024-07-28 16:39:38'),
(77, 77, 'نور خلو', 'Nour', 'ربة منزل', 'housewife', '000000000', '00', '00971', 30, 8, 1, '2024-07-28 16:42:17', '2024-07-28 16:42:17'),
(78, 78, 'خيريه الجوفي', 'Khirya', 'ربة منزل', 'housewife', '000000000', '00', '00971', 1, 5, 1, '2024-07-28 16:45:03', '2024-07-28 16:45:03'),
(79, 79, 'بتول عويس', 'Batoul', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 6, 1, '2024-07-28 16:47:35', '2024-07-28 16:47:35'),
(80, 80, 'هدى العبيد', 'Hoda', 'ربة منزل', 'housewife', '000000000', '00', '00971', 1, 5, 1, '2024-07-28 16:50:41', '2024-07-28 16:50:41'),
(81, 81, 'ايمان الخطيب', 'Iman', 'ربة منزل', 'housewife', '000000', '00', '00971', 1, 3, 1, '2024-07-28 16:55:32', '2024-07-28 16:55:32'),
(82, 82, 'رنا حموي', 'ٌRana', 'ربة منزل', 'housewife', '000000000', '00', '00971', 1, 4, 1, '2024-07-28 16:58:45', '2024-07-28 16:58:45'),
(83, 83, 'سيلفا حنا', 'ٍSilfa', 'ربة منزل', 'housewife', '000000000', '00', '00971', 1, 3, 2, '2024-07-28 17:01:42', '2024-07-28 17:01:42'),
(84, 84, 'زينب سيدجان خير محمد', 'Zainab', 'ربة منزل', 'Housewaife', '0...', '....', '00971', 51, 7, 1, '2024-07-28 17:12:29', '2024-07-28 17:12:29'),
(86, 85, 'روعه عبد ربه', 'ٌRawaa', 'ربة منزل', 'housewife', '000000000', '00', '00971', 1, 1, 1, '2024-07-28 17:21:10', '2024-07-28 17:21:10'),
(87, 86, 'فاطمه الطباع', 'Fatimah', 'ربة منزل', 'housewife', '000000000', '00', '00971', 1, 6, 1, '2024-07-28 17:23:48', '2024-07-29 14:16:20'),
(88, 87, 'هبه الخليلي', 'Heba', 'ربة منزل', 'housewife', '000000000', '00', '00971', 1, 8, 1, '2024-07-28 17:26:40', '2024-07-28 17:26:40'),
(90, 88, 'جواهر البظاظ', 'jawahar', 'ربة منزل', 'housewife', '000000000', '00', '00971', 1, 5, 1, '2024-07-28 17:33:08', '2024-07-28 17:35:23'),
(91, 89, 'منال غره', 'Manal', 'ربة منزل', 'Housewaife', '...', '..', '00971', 1, 7, 1, '2024-07-29 14:08:50', '2024-07-29 14:08:50'),
(92, 90, 'نجلا الزوبعه', 'Najla', 'ربة منزل', 'Housewaife', '..', '...', '00971', 1, 8, 1, '2024-07-29 14:18:19', '2024-07-29 14:18:19'),
(93, 92, 'نرجس جعفر', 'Narjes', 'ربة منزل', 'housewife', '000000000', '00', '00971', 1, 5, 1, '2024-07-29 14:21:08', '2024-07-29 14:21:08'),
(94, 93, 'رشا عباس', 'rasha', 'ربة منزل', 'housewife', '000000000', '00', '00961', 1, 6, 1, '2024-07-29 14:25:28', '2024-07-29 14:25:28'),
(95, 94, 'قمر عرواني', 'Qamar', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 5, 1, '2024-07-29 14:28:45', '2024-07-29 14:28:45'),
(96, 95, 'نور دبيس', 'Nour', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 5, 1, '2024-07-29 14:33:07', '2024-07-29 14:33:07'),
(97, 96, 'احلام الأستانبولي', 'Ahlam', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 5, 1, '2024-07-29 14:35:32', '2024-07-29 14:35:32'),
(98, 97, 'سكينة الجاسم الأحمد', 'Sokaina', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 4, 1, '2024-07-29 14:38:04', '2024-07-29 14:38:04'),
(99, 98, 'ربا الحلبي', 'Ruba', 'ربة منزل', 'Housewaife', '....', '0000.', '00971', 1, 7, 1, '2024-07-29 14:40:45', '2024-07-29 14:40:45'),
(100, 99, 'مها بركات', 'Maha', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 5, 1, '2024-07-29 14:41:21', '2024-07-29 14:41:21'),
(101, 100, 'زينب مكاوي', 'Zineb', 'ربة منزل', 'Housewaife', '....', '.....', '00971', 1, 7, 1, '2024-07-29 14:44:53', '2024-07-29 14:44:53'),
(102, 101, 'فاطمة الجهماني', 'Fatema', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 6, 1, '2024-07-29 14:46:21', '2024-07-29 14:46:21'),
(103, 102, 'عبير وردة', 'Abir', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 3, 1, '2024-07-29 14:48:54', '2024-07-29 14:48:54'),
(104, 103, 'منى خزين', 'Mona', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 5, 1, '2024-07-29 14:51:08', '2024-07-29 14:51:08'),
(105, 104, 'ايمان المواتي', 'Eman', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 6, 1, '2024-07-29 14:53:05', '2024-07-29 14:53:05'),
(106, 106, 'ايمان الخلاوي', 'Eman', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 5, 1, '2024-07-29 14:55:20', '2024-07-29 14:55:20'),
(107, 105, 'خديجة الخطيب', 'Khadija', 'ربة منزل', 'Housewaife', '...', '....', '00971', 1, 6, 1, '2024-07-29 14:55:50', '2024-07-29 14:55:50'),
(108, 107, 'رهف كردي', 'Rahaf', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 6, 1, '2024-07-29 14:57:29', '2024-07-29 14:57:29'),
(109, 108, 'غفران الجهماني', 'Gofran', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 4, 1, '2024-07-29 14:59:54', '2024-07-29 14:59:54'),
(110, 109, 'صفاء المرعي', 'Safaa', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 3, 1, '2024-07-29 15:02:04', '2024-07-29 15:02:04'),
(111, 111, 'علا الشاطر', 'Ola', 'ربة منزل', 'housewife', '000000000', '00', '00964', 1, 5, 1, '2024-07-29 15:04:53', '2024-07-29 15:04:53'),
(112, 112, 'الاء الشيخ خالد', 'Alaa', 'ربة منزل', 'housewife', '000000000', '00', '00961', 1, 5, 1, '2024-07-29 15:09:18', '2024-07-29 15:09:18'),
(113, 110, 'صفاء بربانه', 'Safaa', 'ربة منزل', 'Housewaife', '00133', '1203', '00971', 1, 7, 1, '2024-07-29 15:10:25', '2024-07-29 15:10:25'),
(114, 114, 'جولينا الشليخ', 'Joulina', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 6, 1, '2024-07-29 15:19:48', '2024-07-29 15:19:48'),
(115, 113, 'روعه عبد ربه', 'Rawaa', 'ربة منزل', 'Housewaife', '..', '......', '00971', 1, 8, 1, '2024-07-29 15:20:31', '2024-07-29 15:20:31'),
(117, 117, 'ساريه هلال', 'Saria', 'ربة منزل', 'housewife', '000000000', '00', '00971', 1, 5, 1, '2024-07-29 15:27:34', '2024-07-29 15:27:34'),
(118, 118, 'فوزيه الحمادي', 'Fouzie', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 2, 1, '2024-07-29 15:29:45', '2024-07-29 15:29:45'),
(119, 119, 'ايروداخون خابيروفا', 'Irodakhon', 'ربة منزل', 'housewife', '000000000', '00', '00971', 52, 6, 1, '2024-07-29 15:45:02', '2024-07-29 15:45:02'),
(120, 120, 'ايروداخون خابيروفا', 'Irodakhon', 'ربة منزل', 'housewife', '00', '00', '00971', 52, 3, 1, '2024-07-29 15:49:12', '2024-07-29 15:49:12'),
(121, 121, 'منتهى بنا', 'Muntaha', 'ربة منزل', 'housewife', '000000000', '00', '00971', 1, 7, 1, '2024-07-29 15:52:38', '2024-07-29 15:52:38'),
(122, 122, 'رهف طالب', 'Rahaf', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 4, 1, '2024-07-29 15:55:06', '2024-07-29 15:55:06'),
(123, 123, 'فاطمه سهيل', 'Fatima', 'ربة منزل', 'housewife', '000000000', '00', '00971', 1, 2, 1, '2024-07-29 15:57:18', '2024-07-29 15:57:18'),
(125, 124, 'صفاء العلو', 'Safaa', 'ربة منزل', 'housewife', '000000000', '00', '00971', 1, 7, 1, '2024-07-29 16:00:11', '2024-07-29 16:00:11'),
(126, 125, 'تغريد صافي', 'Taghred', 'ربة منزل', 'housewife', '000000000', '00', '00971', 1, 4, 1, '2024-07-29 16:02:23', '2024-07-29 16:02:23'),
(127, 126, 'سناء البيضه', 'Sanaa', 'مغترب', 'traveler', '000000000', '00', '00971', 1, 6, 1, '2024-07-29 16:05:07', '2024-07-29 16:05:07'),
(128, 127, 'ربا الحلبي', 'Ruba', 'ربة منزل', 'housewife', '000000000', '00', '00971', 1, 4, 1, '2024-07-29 16:06:50', '2024-07-29 16:06:50'),
(129, 128, 'هدله الياسين', 'Hadla', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 4, 1, '2024-07-29 16:08:58', '2024-07-29 16:08:58'),
(130, 129, 'ريما شيخ الأرض', 'Rima', 'ربة منزل', 'housewife', '000000000', '00', '00971', 1, 3, 1, '2024-07-29 16:11:22', '2024-07-29 16:11:22'),
(131, 130, 'ايمان الدريبي', 'Eman', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 7, 1, '2024-07-29 16:13:14', '2024-07-29 16:13:14'),
(132, 131, 'نسرين المغربل', 'Nsreen', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 3, 1, '2024-07-29 16:15:14', '2024-07-29 16:15:14'),
(133, 132, 'نعيمه جمايلي', 'Naima', 'ربة منزل', 'housewife', '000000000', '00', '00971', 49, 3, 1, '2024-07-29 16:23:30', '2024-07-29 16:23:30'),
(134, 133, 'إسراء حمدين', 'Isra', 'ربة منزل', 'housewife', '000000000', '00', '00971', 38, 7, 1, '2024-07-29 16:27:59', '2024-07-29 16:27:59'),
(135, 134, 'سهيلا عارف', 'Soheila', 'ربة منزل', 'housewife', '000000000', '00', '00971', 14, 7, 1, '2024-07-29 16:32:40', '2024-07-29 16:32:49'),
(136, 135, 'سيدة كلثوم هاشمي', 'Seyedeh', 'ربة منزل', 'housewife', '000000000', '00', '00971', 14, 6, 1, '2024-07-29 16:35:48', '2024-07-29 16:35:48'),
(137, 136, 'سحر قمحيه', 'sahar', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 7, 1, '2024-07-29 16:37:32', '2024-07-29 16:37:32'),
(138, 137, 'نور العبد الرحمن عشيش', 'Nour', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 4, 1, '2024-07-29 16:39:54', '2024-07-29 16:39:54'),
(139, 138, 'زهره الحويج العمر', 'Zahra', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 5, 1, '2024-07-29 16:43:55', '2024-07-29 16:43:55'),
(140, 139, 'سماهر حامد', 'Samaher', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 4, 1, '2024-07-29 16:45:52', '2024-07-29 16:45:52'),
(141, 140, 'ندى الحسنيه', 'Nada', 'ربة منزل', 'Housewaife', '...', '.......', '00971', 1, 5, 1, '2024-07-29 16:55:13', '2024-07-29 16:55:13'),
(142, 141, 'ريمه ابو عليقه', 'Reema', 'ربة منزل', 'Housewaife', '....', '..22', '00971', 1, 5, 1, '2024-07-29 16:58:35', '2024-07-29 16:58:35'),
(143, 142, 'صباح يحيى', 'Sabah', 'ربة منزل', 'housewife', '000000000', '00', '00971', 1, 8, 1, '2024-07-29 16:58:39', '2024-07-29 16:58:39'),
(144, 143, 'هناء المقداد', 'Hanaa', 'ربة منزل', 'housewife', '000000000', '00', '00971', 1, 5, 1, '2024-07-29 17:00:27', '2024-07-29 17:00:27'),
(145, 144, 'سمر اليوسف', 'Samar', 'ربة منزل', 'Housewaife', '.....', '...', '00971', 1, 7, 1, '2024-07-29 17:02:49', '2024-07-29 17:02:49'),
(146, 145, 'ايناس العاقل', 'Inas', 'ربة منزل', 'Housewaife', '0000', '0000', '00971', 1, 7, 1, '2024-07-29 17:05:18', '2024-07-29 17:05:18'),
(147, 146, 'ايمان القاسم', 'Iman', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 6, 1, '2024-07-29 17:05:49', '2024-07-29 17:05:49'),
(149, 147, 'سماح ابو المعاطي', 'Samah', 'ربة منزل', 'housewife', '000000000', '00', '00971', 1, 6, 1, '2024-07-29 17:12:02', '2024-07-29 17:12:02'),
(150, 148, 'آلاء الكردي', 'Alaa', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 4, 1, '2024-07-29 17:14:23', '2024-07-29 17:14:23'),
(151, 149, 'عبير فرحات', 'Abir', 'ربة منزل', 'housewife', '000000000', '00', '00966', 1, 5, 1, '2024-07-29 17:17:39', '2024-07-29 17:17:39'),
(153, 151, 'هبه دروزه', 'Hebah', 'ربة منزل', 'Housewaife', '...', '.....', '00971', 53, 1, 1, '2024-07-30 16:53:22', '2024-07-30 16:53:22'),
(154, 152, 'احسان عبد العال', 'Ahssan', 'ربة منزل', 'Housewaife', '...', '....', '00971', 10, 3, 1, '2024-07-30 17:08:05', '2024-07-30 17:08:05'),
(155, 153, 'فرح الخشاب', 'Farah', 'ربة منزل', 'Housewaife', '...', '....', '00971', 15, 5, 1, '2024-07-30 17:18:32', '2024-07-30 17:18:32'),
(156, 154, 'نور عاقل', 'Nour', 'ربة منزل', 'Housewaife', '...', '...', '00971', 1, 8, 1, '2024-07-30 17:19:37', '2024-07-30 17:19:37'),
(157, 155, 'نجاح عقاد', 'Najah', 'ربة منزل', 'Housewaife', '..', '....', '00966', 1, 5, 1, '2024-07-30 17:22:19', '2024-07-30 17:22:19'),
(158, 156, 'ريما مطر', 'Rima', 'ربة منزل', 'Housewaife', '.....', '..', '00971', 1, 6, 1, '2024-07-31 13:43:08', '2024-07-31 13:43:08'),
(159, 157, 'نشميه عنفوص', 'Nashmieh', 'ربة منزل', 'housewife', '000', '000', '00971', 1, 6, 1, '2024-07-31 13:56:49', '2024-07-31 13:58:13'),
(160, 157, 'نظام عنفوص', 'Nezam', 'ربة منزل', 'housewife', '000', '000', '00971', 1, 5, 1, '2024-07-31 13:59:19', '2024-07-31 13:59:19'),
(161, 158, 'غاليه الحسن', 'Galiaa', 'ربة منزل', 'housewife', '000', '000', '00971', 1, 4, 1, '2024-07-31 14:02:32', '2024-07-31 14:02:32'),
(162, 159, 'نداء الفروح', 'Nedaa', 'ربة منزل', 'housewife', '000', '000', '00971', 1, 3, 1, '2024-07-31 14:08:24', '2024-07-31 14:08:24'),
(163, 160, 'غرام خروب', 'Gharam', 'ربة منزل', 'housewife', '000', '000', '00971', 1, 8, 1, '2024-07-31 14:15:43', '2024-07-31 14:15:43'),
(164, 161, 'لارا سلوم', 'Lara', 'ربة منزل', 'housewife', '000', '000', '00971', 1, 3, 1, '2024-07-31 14:26:55', '2024-07-31 14:26:55'),
(165, 162, 'راوية الفجير', 'Rawia', 'ربة منزل', 'housewife', '000', '000', '00966', 1, 5, 1, '2024-07-31 14:35:58', '2024-07-31 14:35:58'),
(166, 163, 'ولاء عبد الرسول', 'Walaa', 'ربة منزل', 'housewife', '000', '000', '00966', 38, 4, 1, '2024-07-31 14:41:44', '2024-07-31 14:41:44'),
(168, 164, 'راما دواره', 'Rama', 'ربة منزل', 'housewife', '000', '000', '00964', 1, 6, 1, '2024-07-31 14:56:13', '2024-07-31 14:56:13'),
(169, 165, 'سمر مشعل', 'Samar', 'ربة منزل', 'housewife', '000', '000', '00966', 1, 4, 1, '2024-07-31 14:58:58', '2024-07-31 14:58:58'),
(170, 166, 'ايه محمد', 'Aya', 'ربة منزل', 'housewife', '000', '000', '00971', 1, 6, 1, '2024-07-31 15:02:14', '2024-07-31 15:02:14'),
(171, 167, 'زينب المحمد', 'Zainab', 'ربة منزل', 'housewife', '000', '000', '00966', 1, 2, 1, '2024-07-31 15:05:59', '2024-07-31 15:05:59'),
(172, 168, 'ميادة الشيح ديبو', 'Mayada', 'ربة منزل', 'housewife', '000', '000', '0090', 1, 3, 1, '2024-07-31 15:12:45', '2024-07-31 15:12:45'),
(173, 169, 'ريم طحينه', 'Reem', 'ربة منزل', 'housewife', '000', '000', '00966', 1, 3, 1, '2024-07-31 15:18:16', '2024-07-31 15:18:16'),
(174, 170, 'سوزان المصري', 'Souzan', 'ربة منزل', 'housewife', '000', '000', '00966', 1, 6, 1, '2024-07-31 15:28:36', '2024-07-31 15:28:36'),
(175, 171, 'ديما البهني', 'Dima', 'ربة منزل', 'housewife', '000', '00', '0062', 1, 7, 1, '2024-07-31 15:35:35', '2024-07-31 15:35:35'),
(176, 172, 'عائشة قول اغاسي', 'Aisha', 'ربة منزل', 'Housewaife', '....', '0000', '00966', 1, 7, 1, '2024-07-31 15:46:44', '2024-07-31 15:46:44'),
(177, 173, 'وصال زين', 'Wesal', 'ربة منزل', 'housewife', '000', '000', '00966', 1, 2, 1, '2024-07-31 15:53:58', '2024-07-31 15:53:58'),
(178, 174, 'عذراء الموسى', 'Azraa', 'ربة منزل', 'housewife', '000', '000', '00966', 1, 6, 1, '2024-07-31 15:57:23', '2024-07-31 15:57:23'),
(179, 175, 'ايمان الكحطان', 'Iman', 'ربة منزل', 'housewife', '000', '000', '00966', 1, 6, 1, '2024-07-31 16:01:58', '2024-07-31 16:01:58'),
(180, 176, 'نوف ناصيف', 'Nouf', 'ربة منزل', 'housewife', '000', '000', '00966', 1, 4, 1, '2024-07-31 16:04:48', '2024-07-31 16:04:48'),
(181, 177, 'رشا قناص', 'Rsha', 'ربة منزل', 'housewife', '000', '000', '00966', 1, 6, 1, '2024-07-31 16:07:17', '2024-07-31 16:07:17'),
(182, 178, 'نسرين حسواني', 'Nisreen', 'ربة منزل', 'housewife', '000', '000', '00966', 1, 4, 1, '2024-07-31 16:10:09', '2024-07-31 16:10:09'),
(183, 179, 'عليا الظاهر', 'Alia', 'ربة منزل', 'housewife', '000', '000', '00966', 1, 5, 1, '2024-07-31 16:13:15', '2024-07-31 16:13:15'),
(184, 180, 'مؤمنه بكار', 'Moaamena', 'ربة منزل', 'housewife', '0000', '000', '00966', 1, 6, 1, '2024-07-31 16:16:32', '2024-07-31 16:16:32'),
(185, 181, 'منى المحمض', 'Mona', 'ربة منزل', 'housewife', '0000', '000', '00966', 1, 3, 1, '2024-07-31 16:20:48', '2024-07-31 16:20:48'),
(186, 182, 'سلام حياريه', 'Salam', 'ربة منزل', 'housewife', '000', '000', '00966', 1, 6, 1, '2024-07-31 16:24:16', '2024-07-31 16:24:16'),
(187, 183, 'فاطمه الحسن', 'Fatema', 'ربة منزل', 'housewife', '00', '00', '00966', 1, 6, 1, '2024-07-31 16:33:17', '2024-07-31 16:33:17'),
(188, 184, 'فاطمه الخضر', 'Fatima', 'ربة منزل', 'housewife', '00', '00', '00966', 1, 5, 1, '2024-07-31 16:35:25', '2024-07-31 16:35:25'),
(189, 185, 'نشميه الشحاده', 'Nashmia', 'ربة منزل', 'housewife', '00', '00', '00966', 1, 8, 1, '2024-07-31 16:37:48', '2024-07-31 16:37:48'),
(190, 186, 'مناهل أحمد', 'Manahel', 'ربة منزل', 'housewife', '00', '00', '00966', 1, 2, 1, '2024-07-31 16:40:54', '2024-07-31 16:40:54'),
(191, 187, 'نبكيه الحسن', 'Nabkieh', 'ربة منزل', 'housewife', '00', '00', '00966', 1, 5, 1, '2024-07-31 16:43:16', '2024-07-31 16:43:16'),
(192, 188, 'هدى المحمود الخلف', 'Hoda', 'ربة منزل', 'housewife', '00', '00', '00966', 1, 6, 1, '2024-07-31 16:45:13', '2024-07-31 16:45:13'),
(193, 189, 'عزيزه الشريف', 'Aziza', 'ربة منزل', 'housewife', '00', '00', '00966', 1, 4, 1, '2024-07-31 16:47:28', '2024-07-31 16:47:28'),
(194, 190, 'ساره السباح', 'Sara', 'ربة منزل', 'housewife', '000', '000', '00966', 1, 5, 1, '2024-07-31 16:53:14', '2024-07-31 16:53:14'),
(195, 191, 'هبا النحاس', 'Heba', 'ربة منزل', 'housewife', '000', '000', '00966', 1, 4, 1, '2024-07-31 17:02:03', '2024-07-31 17:02:03'),
(196, 192, 'رنا الكبدي', 'Rana', 'ربة منزل', 'housewife', '000', '000', '00966', 48, 6, 1, '2024-07-31 17:11:31', '2024-07-31 17:11:31'),
(197, 194, 'هديه عزوز', 'Hadia', 'ربة منزل', 'housewife', '000', '000', '00966', 1, 4, 1, '2024-07-31 17:14:42', '2024-07-31 17:14:42'),
(198, 195, 'نسرين حسن', 'Nesrin', 'ربة منزل', 'housewife', '000', '000', '00966', 1, 5, 1, '2024-07-31 17:18:23', '2024-07-31 17:18:23'),
(199, 197, 'ضحى الأمين آغا', 'Doha', 'ربة منزل', 'housewife', '000', '000', '00966', 1, 4, 1, '2024-07-31 17:26:57', '2024-07-31 17:26:57'),
(200, 198, 'منال الحمود', 'Manal', 'ربة منزل', 'housewife', '000', '000', '00966', 1, 4, 1, '2024-07-31 17:31:19', '2024-07-31 17:31:19'),
(201, 199, 'يمن حسواني', 'Yamn', 'ربة منزل', 'Housewaife', '..', '....', '00966', 1, 5, 1, '2024-08-01 15:05:07', '2024-08-01 15:05:07'),
(202, 200, 'بسمه الفحيمان', 'Bsmh', 'ربة منزل', 'Housewaife', '...', '....', '00966', 1, 7, 1, '2024-08-01 15:12:27', '2024-08-01 15:12:27'),
(203, 201, 'خلود السيبراني', 'Kholod', 'ربة منزل', 'Housewaife', '..', '...', '00966', 1, 2, 1, '2024-08-01 15:13:35', '2024-08-01 15:13:35'),
(204, 202, 'فاطمه دقاق', 'Fatima', 'ربة منزل', 'Housewaife', '0000', '000', '00966', 1, 8, 1, '2024-08-01 15:37:44', '2024-08-01 15:37:44'),
(205, 203, 'هند السعدي', 'Hind', 'ربة منزل', 'Housewaife', '000', '000', '00966', 1, 3, 1, '2024-08-01 15:51:25', '2024-08-01 15:51:25');

-- --------------------------------------------------------

--
-- Table structure for table `youth_activities`
--

CREATE TABLE `youth_activities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `type_id` bigint(20) UNSIGNED NOT NULL,
  `location_id` bigint(20) UNSIGNED DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `youth_activity_locations`
--

CREATE TABLE `youth_activity_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `location` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `youth_activity_types`
--

CREATE TABLE `youth_activity_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `youth_activity_types`
--

INSERT INTO `youth_activity_types` (`id`, `type`, `created_at`, `updated_at`) VALUES
(1, 'نوع 1', '2024-07-30 21:43:07', '2024-07-30 21:43:12'),
(2, 'نوع 2', '2024-07-30 21:43:18', '2024-07-30 21:43:29');

-- --------------------------------------------------------

--
-- Table structure for table `youth_standards`
--

CREATE TABLE `youth_standards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `youth_standard_ratings`
--

CREATE TABLE `youth_standard_ratings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rate` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absences`
--
ALTER TABLE `absences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `age_groups`
--
ALTER TABLE `age_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `age_groups_classs_id_foreign` (`classs_id`);

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendances_verified_student_id_foreign` (`verified_student_id`),
  ADD KEY `attendances_absence_id_foreign` (`absence_id`);

--
-- Indexes for table `blood_types`
--
ALTER TABLE `blood_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`),
  ADD KEY `books_class_id_foreign` (`class_id`);

--
-- Indexes for table `book_verified_student`
--
ALTER TABLE `book_verified_student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `book_verified_student_verified_student_id_foreign` (`verified_student_id`),
  ADD KEY `book_verified_student_book_id_foreign` (`book_id`);

--
-- Indexes for table `building_statuses`
--
ALTER TABLE `building_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `camps`
--
ALTER TABLE `camps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `camps_location_id_foreign` (`location_id`),
  ADD KEY `camps_type_id_foreign` (`type_id`);

--
-- Indexes for table `camp_locations`
--
ALTER TABLE `camp_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `camp_types`
--
ALTER TABLE `camp_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `classses`
--
ALTER TABLE `classses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classses_grade_id_foreign` (`grade_id`);

--
-- Indexes for table `classs_school_years`
--
ALTER TABLE `classs_school_years`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `classs_school_years_classs_id_school_year_id_unique` (`classs_id`,`school_year_id`),
  ADD KEY `classs_school_years_school_year_id_foreign` (`school_year_id`);

--
-- Indexes for table `classs_school_year_details`
--
ALTER TABLE `classs_school_year_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `classs_school_year_details_classs_school_year_id_foreign` (`classs_school_year_id`);

--
-- Indexes for table `collaboration_and_activities`
--
ALTER TABLE `collaboration_and_activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `collaboration_and_activities_verified_student_id_foreign` (`verified_student_id`);

--
-- Indexes for table `columns`
--
ALTER TABLE `columns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `columns_tableheader_id_foreign` (`tableheader_id`),
  ADD KEY `columns_parent_id_foreign` (`parent_id`),
  ADD KEY `columns_term_id_foreign` (`term_id`);

--
-- Indexes for table `common_fields`
--
ALTER TABLE `common_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courses_teacher_id_foreign` (`teacher_id`);

--
-- Indexes for table `c_s_y_s_detail`
--
ALTER TABLE `c_s_y_s_detail`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `c_s_y_s_detail_c_s_y_id_subject_detail_id_unique` (`c_s_y_id`,`subject_detail_id`),
  ADD KEY `c_s_y_s_detail_subject_detail_id_foreign` (`subject_detail_id`);

--
-- Indexes for table `diseases`
--
ALTER TABLE `diseases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `diseases_type_id_foreign` (`type_id`);

--
-- Indexes for table `disease_types`
--
ALTER TABLE `disease_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documents_documentable_type_documentable_id_index` (`documentable_type`,`documentable_id`);

--
-- Indexes for table `education_levels`
--
ALTER TABLE `education_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `education_specializations`
--
ALTER TABLE `education_specializations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `education_specializations_education_level_id_foreign` (`education_level_id`);

--
-- Indexes for table `education_types`
--
ALTER TABLE `education_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_types`
--
ALTER TABLE `employee_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `equipment_statuses`
--
ALTER TABLE `equipment_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `equipment_types`
--
ALTER TABLE `equipment_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exams_classs_school_year_id_foreign` (`classs_school_year_id`),
  ADD KEY `exams_term_id_foreign` (`term_id`),
  ADD KEY `exams_part_id_foreign` (`part_id`);

--
-- Indexes for table `exam_results`
--
ALTER TABLE `exam_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `exam_results_exam_id_foreign` (`exam_id`),
  ADD KEY `exam_results_class_id_foreign` (`class_id`),
  ADD KEY `exam_results_verified_student_id_foreign` (`verified_student_id`),
  ADD KEY `exam_results_subject_detail_id_foreign` (`subject_detail_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `family_members_changes`
--
ALTER TABLE `family_members_changes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fathers`
--
ALTER TABLE `fathers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fathers_email_unique` (`email`),
  ADD KEY `fathers_nationality_id_foreign` (`nationality_id`),
  ADD KEY `fathers_blood_type_id_foreign` (`blood_type_id`),
  ADD KEY `fathers_religion_id_foreign` (`religion_id`);

--
-- Indexes for table `governates`
--
ALTER TABLE `governates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `governates_country_id_foreign` (`country_id`);

--
-- Indexes for table `grades`
--
ALTER TABLE `grades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `grades_stage_id_foreign` (`stage_id`),
  ADD KEY `grades_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `ground_types`
--
ALTER TABLE `ground_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `health_conditions`
--
ALTER TABLE `health_conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `institutions`
--
ALTER TABLE `institutions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `institutions_governate_id_foreign` (`governate_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_sequences`
--
ALTER TABLE `job_sequences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_sequences_teacher_id_foreign` (`teacher_id`);

--
-- Indexes for table `job_titles`
--
ALTER TABLE `job_titles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_titles_kind_of_employment_id_foreign` (`kind_of_employment_id`);

--
-- Indexes for table `kind_of_employments`
--
ALTER TABLE `kind_of_employments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leave_types`
--
ALTER TABLE `leave_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `local_sections`
--
ALTER TABLE `local_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marks`
--
ALTER TABLE `marks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mark_reviews`
--
ALTER TABLE `mark_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medals`
--
ALTER TABLE `medals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medical_conditions`
--
ALTER TABLE `medical_conditions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `nationalities`
--
ALTER TABLE `nationalities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oldyears`
--
ALTER TABLE `oldyears`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `option_question`
--
ALTER TABLE `option_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `option_question_question_id_foreign` (`question_id`),
  ADD KEY `option_question_option_id_foreign` (`option_id`);

--
-- Indexes for table `ownership_types`
--
ALTER TABLE `ownership_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parts`
--
ALTER TABLE `parts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parts_year_class_subject_id_foreign` (`year_class_subject_id`),
  ADD KEY `parts_mark_review_id_foreign` (`mark_review_id`),
  ADD KEY `parts_term_id_foreign` (`term_id`);

--
-- Indexes for table `part_operations`
--
ALTER TABLE `part_operations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `part_operations_part_id_foreign` (`part_id`),
  ADD KEY `part_operations_operand_part_id_foreign` (`operand_part_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `penalties`
--
ALTER TABLE `penalties`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `public_utilities`
--
ALTER TABLE `public_utilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_options`
--
ALTER TABLE `question_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_options_school_question_id_foreign` (`school_question_id`);

--
-- Indexes for table `question_option_relations`
--
ALTER TABLE `question_option_relations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_option_relations_question_id_foreign` (`question_id`),
  ADD KEY `question_option_relations_option_id_foreign` (`option_id`);

--
-- Indexes for table `registration_types`
--
ALTER TABLE `registration_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `religions`
--
ALTER TABLE `religions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rewards`
--
ALTER TABLE `rewards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reward_punishments`
--
ALTER TABLE `reward_punishments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reward_punishments_teacher_id_foreign` (`teacher_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `schools`
--
ALTER TABLE `schools`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `school_building_types`
--
ALTER TABLE `school_building_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `school_genders`
--
ALTER TABLE `school_genders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `school_questions`
--
ALTER TABLE `school_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `school_questions_dependent_option_id_foreign` (`dependent_option_id`);

--
-- Indexes for table `school_room_types`
--
ALTER TABLE `school_room_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `school_types`
--
ALTER TABLE `school_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `school_years`
--
ALTER TABLE `school_years`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sections_classs_school_year_id_foreign` (`classs_school_year_id`),
  ADD KEY `sections_section_type_id_foreign` (`section_type_id`),
  ADD KEY `sections_teacher_id_foreign` (`teacher_id`);

--
-- Indexes for table `section_language`
--
ALTER TABLE `section_language`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section_language_section_id_foreign` (`section_id`),
  ADD KEY `section_language_language_id_foreign` (`language_id`);

--
-- Indexes for table `section_types`
--
ALTER TABLE `section_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `settings_name_index` (`name`);

--
-- Indexes for table `setting_translations`
--
ALTER TABLE `setting_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `setting_translations_setting_id_locale_index` (`setting_id`,`locale`);

--
-- Indexes for table `social_situations`
--
ALTER TABLE `social_situations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `social_traits`
--
ALTER TABLE `social_traits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sort_of_employments`
--
ALTER TABLE `sort_of_employments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sort_of_employments_kind_of_employment_id_foreign` (`kind_of_employment_id`);

--
-- Indexes for table `special_needs_types`
--
ALTER TABLE `special_needs_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stages`
--
ALTER TABLE `stages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `students_email_unique` (`email`),
  ADD UNIQUE KEY `students_national_id_unique` (`national_id`),
  ADD UNIQUE KEY `students_passport_id_unique` (`passport_id`),
  ADD KEY `students_nationality_id_foreign` (`nationality_id`),
  ADD KEY `students_blood_type_id_foreign` (`blood_type_id`),
  ADD KEY `students_religion_id_foreign` (`religion_id`),
  ADD KEY `students_father_id_foreign` (`father_id`),
  ADD KEY `students_mother_id_foreign` (`mother_id`);

--
-- Indexes for table `student_additional_details`
--
ALTER TABLE `student_additional_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_additional_details_student_id_foreign` (`student_id`),
  ADD KEY `student_additional_details_registration_type_id_foreign` (`registration_type_id`);

--
-- Indexes for table `student_courses`
--
ALTER TABLE `student_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_courses_location_id_foreign` (`location_id`),
  ADD KEY `student_courses_type_id_foreign` (`type_id`);

--
-- Indexes for table `student_course_locations`
--
ALTER TABLE `student_course_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_course_types`
--
ALTER TABLE `student_course_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_living_places`
--
ALTER TABLE `student_living_places`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subjects_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `subject_details`
--
ALTER TABLE `subject_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject_details_subject_id_foreign` (`subject_id`),
  ADD KEY `subject_details_grade_id_foreign` (`grade_id`);

--
-- Indexes for table `svg_ids`
--
ALTER TABLE `svg_ids`
  ADD PRIMARY KEY (`id`),
  ADD KEY `svg_ids_exam_id_foreign` (`exam_id`),
  ADD KEY `svg_ids_classs_school_years_id_foreign` (`classs_school_years_id`),
  ADD KEY `svg_ids_subject_detail_id_foreign` (`subject_detail_id`);

--
-- Indexes for table `tableheaders`
--
ALTER TABLE `tableheaders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tableheaders_class_id_foreign` (`class_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `teachers_email_unique` (`email`),
  ADD UNIQUE KEY `teachers_add_num_unique` (`add_num`);

--
-- Indexes for table `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_of_appointments`
--
ALTER TABLE `type_of_appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `types_of_appointments_type_of_employment_id_foreign` (`type_of_employment_id`);

--
-- Indexes for table `type_of_employments`
--
ALTER TABLE `type_of_employments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `type_of_permanences`
--
ALTER TABLE `type_of_permanences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `verified_students`
--
ALTER TABLE `verified_students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `verified_students_student_id_foreign` (`student_id`),
  ADD KEY `verified_students_section_id_foreign` (`section_id`),
  ADD KEY `verified_students_language_id_foreign` (`language_id`);

--
-- Indexes for table `verified_student_admin_notes`
--
ALTER TABLE `verified_student_admin_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `verified_student_admin_notes_verified_student_id_foreign` (`verified_student_id`);

--
-- Indexes for table `verified_student_teacher_notes`
--
ALTER TABLE `verified_student_teacher_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `verified_student_teacher_notes_verified_student_id_foreign` (`verified_student_id`);

--
-- Indexes for table `wives`
--
ALTER TABLE `wives`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wives_father_id_foreign` (`father_id`),
  ADD KEY `wives_nationality_id_foreign` (`nationality_id`),
  ADD KEY `wives_blood_type_id_foreign` (`blood_type_id`),
  ADD KEY `wives_religion_id_foreign` (`religion_id`);

--
-- Indexes for table `youth_activities`
--
ALTER TABLE `youth_activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `youth_activities_type_id_foreign` (`type_id`),
  ADD KEY `youth_activities_location_id_foreign` (`location_id`);

--
-- Indexes for table `youth_activity_locations`
--
ALTER TABLE `youth_activity_locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `youth_activity_types`
--
ALTER TABLE `youth_activity_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `youth_standards`
--
ALTER TABLE `youth_standards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `youth_standard_ratings`
--
ALTER TABLE `youth_standard_ratings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absences`
--
ALTER TABLE `absences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `age_groups`
--
ALTER TABLE `age_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blood_types`
--
ALTER TABLE `blood_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book_verified_student`
--
ALTER TABLE `book_verified_student`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `building_statuses`
--
ALTER TABLE `building_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `camps`
--
ALTER TABLE `camps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `camp_locations`
--
ALTER TABLE `camp_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `camp_types`
--
ALTER TABLE `camp_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `classses`
--
ALTER TABLE `classses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `classs_school_years`
--
ALTER TABLE `classs_school_years`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `classs_school_year_details`
--
ALTER TABLE `classs_school_year_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `collaboration_and_activities`
--
ALTER TABLE `collaboration_and_activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `columns`
--
ALTER TABLE `columns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `common_fields`
--
ALTER TABLE `common_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `c_s_y_s_detail`
--
ALTER TABLE `c_s_y_s_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=311;

--
-- AUTO_INCREMENT for table `diseases`
--
ALTER TABLE `diseases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `disease_types`
--
ALTER TABLE `disease_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `education_levels`
--
ALTER TABLE `education_levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `education_specializations`
--
ALTER TABLE `education_specializations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `education_types`
--
ALTER TABLE `education_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employee_types`
--
ALTER TABLE `employee_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `equipment_statuses`
--
ALTER TABLE `equipment_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `equipment_types`
--
ALTER TABLE `equipment_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exam_results`
--
ALTER TABLE `exam_results`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `family_members_changes`
--
ALTER TABLE `family_members_changes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fathers`
--
ALTER TABLE `fathers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `governates`
--
ALTER TABLE `governates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `grades`
--
ALTER TABLE `grades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `ground_types`
--
ALTER TABLE `ground_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `health_conditions`
--
ALTER TABLE `health_conditions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `institutions`
--
ALTER TABLE `institutions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_sequences`
--
ALTER TABLE `job_sequences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_titles`
--
ALTER TABLE `job_titles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `kind_of_employments`
--
ALTER TABLE `kind_of_employments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `leave_types`
--
ALTER TABLE `leave_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `local_sections`
--
ALTER TABLE `local_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `marks`
--
ALTER TABLE `marks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mark_reviews`
--
ALTER TABLE `mark_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medals`
--
ALTER TABLE `medals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `medical_conditions`
--
ALTER TABLE `medical_conditions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `nationalities`
--
ALTER TABLE `nationalities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `oldyears`
--
ALTER TABLE `oldyears`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `option_question`
--
ALTER TABLE `option_question`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ownership_types`
--
ALTER TABLE `ownership_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `parts`
--
ALTER TABLE `parts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2579;

--
-- AUTO_INCREMENT for table `part_operations`
--
ALTER TABLE `part_operations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2864;

--
-- AUTO_INCREMENT for table `penalties`
--
ALTER TABLE `penalties`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `public_utilities`
--
ALTER TABLE `public_utilities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `question_options`
--
ALTER TABLE `question_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `question_option_relations`
--
ALTER TABLE `question_option_relations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `registration_types`
--
ALTER TABLE `registration_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `religions`
--
ALTER TABLE `religions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `rewards`
--
ALTER TABLE `rewards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reward_punishments`
--
ALTER TABLE `reward_punishments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `schools`
--
ALTER TABLE `schools`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `school_building_types`
--
ALTER TABLE `school_building_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `school_genders`
--
ALTER TABLE `school_genders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `school_questions`
--
ALTER TABLE `school_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `school_room_types`
--
ALTER TABLE `school_room_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `school_types`
--
ALTER TABLE `school_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `school_years`
--
ALTER TABLE `school_years`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `section_language`
--
ALTER TABLE `section_language`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `section_types`
--
ALTER TABLE `section_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `setting_translations`
--
ALTER TABLE `setting_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `social_situations`
--
ALTER TABLE `social_situations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `social_traits`
--
ALTER TABLE `social_traits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sort_of_employments`
--
ALTER TABLE `sort_of_employments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `special_needs_types`
--
ALTER TABLE `special_needs_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `stages`
--
ALTER TABLE `stages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=273;

--
-- AUTO_INCREMENT for table `student_additional_details`
--
ALTER TABLE `student_additional_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_courses`
--
ALTER TABLE `student_courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_course_locations`
--
ALTER TABLE `student_course_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_course_types`
--
ALTER TABLE `student_course_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_living_places`
--
ALTER TABLE `student_living_places`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `subject_details`
--
ALTER TABLE `subject_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `svg_ids`
--
ALTER TABLE `svg_ids`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tableheaders`
--
ALTER TABLE `tableheaders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `type_of_appointments`
--
ALTER TABLE `type_of_appointments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `type_of_employments`
--
ALTER TABLE `type_of_employments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `type_of_permanences`
--
ALTER TABLE `type_of_permanences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `verified_students`
--
ALTER TABLE `verified_students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `verified_student_admin_notes`
--
ALTER TABLE `verified_student_admin_notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `verified_student_teacher_notes`
--
ALTER TABLE `verified_student_teacher_notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wives`
--
ALTER TABLE `wives`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- AUTO_INCREMENT for table `youth_activities`
--
ALTER TABLE `youth_activities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `youth_activity_locations`
--
ALTER TABLE `youth_activity_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `youth_activity_types`
--
ALTER TABLE `youth_activity_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `youth_standards`
--
ALTER TABLE `youth_standards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `youth_standard_ratings`
--
ALTER TABLE `youth_standard_ratings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `age_groups`
--
ALTER TABLE `age_groups`
  ADD CONSTRAINT `age_groups_classs_id_foreign` FOREIGN KEY (`classs_id`) REFERENCES `classses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attendances`
--
ALTER TABLE `attendances`
  ADD CONSTRAINT `attendances_absence_id_foreign` FOREIGN KEY (`absence_id`) REFERENCES `absences` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `attendances_verified_student_id_foreign` FOREIGN KEY (`verified_student_id`) REFERENCES `verified_students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `book_verified_student`
--
ALTER TABLE `book_verified_student`
  ADD CONSTRAINT `book_verified_student_book_id_foreign` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `book_verified_student_verified_student_id_foreign` FOREIGN KEY (`verified_student_id`) REFERENCES `verified_students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `camps`
--
ALTER TABLE `camps`
  ADD CONSTRAINT `camps_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `camp_locations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `camps_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `camp_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `classses`
--
ALTER TABLE `classses`
  ADD CONSTRAINT `classses_grade_id_foreign` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `classs_school_years`
--
ALTER TABLE `classs_school_years`
  ADD CONSTRAINT `classs_school_years_classs_id_foreign` FOREIGN KEY (`classs_id`) REFERENCES `classses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `classs_school_years_school_year_id_foreign` FOREIGN KEY (`school_year_id`) REFERENCES `school_years` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `classs_school_year_details`
--
ALTER TABLE `classs_school_year_details`
  ADD CONSTRAINT `classs_school_year_details_classs_school_year_id_foreign` FOREIGN KEY (`classs_school_year_id`) REFERENCES `classs_school_years` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `collaboration_and_activities`
--
ALTER TABLE `collaboration_and_activities`
  ADD CONSTRAINT `collaboration_and_activities_verified_student_id_foreign` FOREIGN KEY (`verified_student_id`) REFERENCES `verified_students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `columns`
--
ALTER TABLE `columns`
  ADD CONSTRAINT `columns_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `columns` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `columns_tableheader_id_foreign` FOREIGN KEY (`tableheader_id`) REFERENCES `tableheaders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `columns_term_id_foreign` FOREIGN KEY (`term_id`) REFERENCES `terms` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `c_s_y_s_detail`
--
ALTER TABLE `c_s_y_s_detail`
  ADD CONSTRAINT `c_s_y_s_detail_c_s_y_id_foreign` FOREIGN KEY (`c_s_y_id`) REFERENCES `classs_school_years` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `c_s_y_s_detail_subject_detail_id_foreign` FOREIGN KEY (`subject_detail_id`) REFERENCES `subject_details` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `diseases`
--
ALTER TABLE `diseases`
  ADD CONSTRAINT `diseases_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `disease_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `education_specializations`
--
ALTER TABLE `education_specializations`
  ADD CONSTRAINT `education_specializations_education_level_id_foreign` FOREIGN KEY (`education_level_id`) REFERENCES `education_levels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `exams_classs_school_year_id_foreign` FOREIGN KEY (`classs_school_year_id`) REFERENCES `classs_school_years` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exams_part_id_foreign` FOREIGN KEY (`part_id`) REFERENCES `parts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `exams_term_id_foreign` FOREIGN KEY (`term_id`) REFERENCES `terms` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `exam_results`
--
ALTER TABLE `exam_results`
  ADD CONSTRAINT `exam_results_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classs_school_years` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_results_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_results_subject_detail_id_foreign` FOREIGN KEY (`subject_detail_id`) REFERENCES `c_s_y_s_detail` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `exam_results_verified_student_id_foreign` FOREIGN KEY (`verified_student_id`) REFERENCES `verified_students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `fathers`
--
ALTER TABLE `fathers`
  ADD CONSTRAINT `fathers_blood_type_id_foreign` FOREIGN KEY (`blood_type_id`) REFERENCES `blood_types` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fathers_nationality_id_foreign` FOREIGN KEY (`nationality_id`) REFERENCES `nationalities` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fathers_religion_id_foreign` FOREIGN KEY (`religion_id`) REFERENCES `religions` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `governates`
--
ALTER TABLE `governates`
  ADD CONSTRAINT `governates_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `grades`
--
ALTER TABLE `grades`
  ADD CONSTRAINT `grades_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `grades` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `grades_stage_id_foreign` FOREIGN KEY (`stage_id`) REFERENCES `stages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `institutions`
--
ALTER TABLE `institutions`
  ADD CONSTRAINT `institutions_governate_id_foreign` FOREIGN KEY (`governate_id`) REFERENCES `governates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `job_sequences`
--
ALTER TABLE `job_sequences`
  ADD CONSTRAINT `job_sequences_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `job_titles`
--
ALTER TABLE `job_titles`
  ADD CONSTRAINT `job_titles_kind_of_employment_id_foreign` FOREIGN KEY (`kind_of_employment_id`) REFERENCES `kind_of_employments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `option_question`
--
ALTER TABLE `option_question`
  ADD CONSTRAINT `option_question_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `question_options` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `option_question_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `school_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `parts`
--
ALTER TABLE `parts`
  ADD CONSTRAINT `parts_mark_review_id_foreign` FOREIGN KEY (`mark_review_id`) REFERENCES `mark_reviews` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `parts_term_id_foreign` FOREIGN KEY (`term_id`) REFERENCES `terms` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `parts_year_class_subject_id_foreign` FOREIGN KEY (`year_class_subject_id`) REFERENCES `c_s_y_s_detail` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `part_operations`
--
ALTER TABLE `part_operations`
  ADD CONSTRAINT `part_operations_operand_part_id_foreign` FOREIGN KEY (`operand_part_id`) REFERENCES `parts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `part_operations_part_id_foreign` FOREIGN KEY (`part_id`) REFERENCES `parts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `question_options`
--
ALTER TABLE `question_options`
  ADD CONSTRAINT `question_options_school_question_id_foreign` FOREIGN KEY (`school_question_id`) REFERENCES `school_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `question_option_relations`
--
ALTER TABLE `question_option_relations`
  ADD CONSTRAINT `question_option_relations_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `question_options` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `question_option_relations_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `school_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reward_punishments`
--
ALTER TABLE `reward_punishments`
  ADD CONSTRAINT `reward_punishments_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `school_questions`
--
ALTER TABLE `school_questions`
  ADD CONSTRAINT `school_questions_dependent_option_id_foreign` FOREIGN KEY (`dependent_option_id`) REFERENCES `question_options` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `sections_classs_school_year_id_foreign` FOREIGN KEY (`classs_school_year_id`) REFERENCES `classs_school_years` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sections_section_type_id_foreign` FOREIGN KEY (`section_type_id`) REFERENCES `section_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sections_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `section_language`
--
ALTER TABLE `section_language`
  ADD CONSTRAINT `section_language_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `section_language_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `setting_translations`
--
ALTER TABLE `setting_translations`
  ADD CONSTRAINT `setting_translations_setting_id_foreign` FOREIGN KEY (`setting_id`) REFERENCES `settings` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sort_of_employments`
--
ALTER TABLE `sort_of_employments`
  ADD CONSTRAINT `sort_of_employments_kind_of_employment_id_foreign` FOREIGN KEY (`kind_of_employment_id`) REFERENCES `kind_of_employments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_blood_type_id_foreign` FOREIGN KEY (`blood_type_id`) REFERENCES `blood_types` (`id`),
  ADD CONSTRAINT `students_father_id_foreign` FOREIGN KEY (`father_id`) REFERENCES `fathers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `students_mother_id_foreign` FOREIGN KEY (`mother_id`) REFERENCES `wives` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `students_nationality_id_foreign` FOREIGN KEY (`nationality_id`) REFERENCES `nationalities` (`id`),
  ADD CONSTRAINT `students_religion_id_foreign` FOREIGN KEY (`religion_id`) REFERENCES `religions` (`id`);

--
-- Constraints for table `student_additional_details`
--
ALTER TABLE `student_additional_details`
  ADD CONSTRAINT `student_additional_details_registration_type_id_foreign` FOREIGN KEY (`registration_type_id`) REFERENCES `registration_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_additional_details_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_courses`
--
ALTER TABLE `student_courses`
  ADD CONSTRAINT `student_courses_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `student_course_locations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `student_courses_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `student_course_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subjects`
--
ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subject_details`
--
ALTER TABLE `subject_details`
  ADD CONSTRAINT `subject_details_grade_id_foreign` FOREIGN KEY (`grade_id`) REFERENCES `grades` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subject_details_subject_id_foreign` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `svg_ids`
--
ALTER TABLE `svg_ids`
  ADD CONSTRAINT `svg_ids_classs_school_years_id_foreign` FOREIGN KEY (`classs_school_years_id`) REFERENCES `classs_school_years` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `svg_ids_exam_id_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `svg_ids_subject_detail_id_foreign` FOREIGN KEY (`subject_detail_id`) REFERENCES `subject_details` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tableheaders`
--
ALTER TABLE `tableheaders`
  ADD CONSTRAINT `tableheaders_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `classses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `type_of_appointments`
--
ALTER TABLE `type_of_appointments`
  ADD CONSTRAINT `types_of_appointments_type_of_employment_id_foreign` FOREIGN KEY (`type_of_employment_id`) REFERENCES `type_of_employments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `verified_students`
--
ALTER TABLE `verified_students`
  ADD CONSTRAINT `verified_students_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `verified_students_section_id_foreign` FOREIGN KEY (`section_id`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `verified_students_student_id_foreign` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `verified_student_admin_notes`
--
ALTER TABLE `verified_student_admin_notes`
  ADD CONSTRAINT `verified_student_admin_notes_verified_student_id_foreign` FOREIGN KEY (`verified_student_id`) REFERENCES `verified_students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `verified_student_teacher_notes`
--
ALTER TABLE `verified_student_teacher_notes`
  ADD CONSTRAINT `verified_student_teacher_notes_verified_student_id_foreign` FOREIGN KEY (`verified_student_id`) REFERENCES `verified_students` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wives`
--
ALTER TABLE `wives`
  ADD CONSTRAINT `wives_blood_type_id_foreign` FOREIGN KEY (`blood_type_id`) REFERENCES `blood_types` (`id`),
  ADD CONSTRAINT `wives_father_id_foreign` FOREIGN KEY (`father_id`) REFERENCES `fathers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wives_nationality_id_foreign` FOREIGN KEY (`nationality_id`) REFERENCES `nationalities` (`id`),
  ADD CONSTRAINT `wives_religion_id_foreign` FOREIGN KEY (`religion_id`) REFERENCES `religions` (`id`);

--
-- Constraints for table `youth_activities`
--
ALTER TABLE `youth_activities`
  ADD CONSTRAINT `youth_activities_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `youth_activity_locations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `youth_activities_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `youth_activity_types` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
