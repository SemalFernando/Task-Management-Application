-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 16, 2025 at 09:34 AM
-- Server version: 8.3.0
-- PHP Version: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `task_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '#4361ee',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `user_id`, `name`, `color`, `created_at`, `updated_at`) VALUES
(1, 1, 'Work', '#3b82f6', '2025-06-15 13:18:29', '2025-06-15 13:18:29'),
(2, 1, 'Personal', '#10b981', '2025-06-15 13:18:29', '2025-06-15 13:18:29'),
(3, 1, 'Urgent', '#ef4444', '2025-06-15 13:18:29', '2025-06-15 13:18:29');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_06_14_092946_create_categories_table', 1),
(6, '2025_06_14_092959_create_tasks_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(2, 'App\\Models\\User', 1, 'auth_token', '4a194ae277642ceb4fc9fa501272f6772d1c80581845f8e90b82b12ab06281ec', '[\"*\"]', '2025-06-16 12:57:36', '2025-06-15 13:31:08', '2025-06-16 12:57:36'),
(3, 'App\\Models\\User', 1, 'auth_token', '93b5b0e54e012e7c60473df95cd04ad9abc8f51da78fe4b3863aefd82ef9096b', '[\"*\"]', '2025-06-15 15:14:36', '2025-06-15 15:04:27', '2025-06-15 15:14:36'),
(4, 'App\\Models\\User', 2, 'auth_token', '5d1dc101e296e7f0e1f96010f3d06e843eaed36a6bc1e350eba49a540d77f010', '[\"*\"]', '2025-06-15 20:28:20', '2025-06-15 19:39:01', '2025-06-15 20:28:20'),
(5, 'App\\Models\\User', 3, 'auth_token', 'dd87e54107a19ce32b9006118434436feff67473a1eec0c45366639e666ac9f6', '[\"*\"]', NULL, '2025-06-15 21:16:39', '2025-06-15 21:16:39'),
(6, 'App\\Models\\User', 4, 'auth_token', '7fbdc55f1dddfaa52172853de10ab6524b881f6f253bf68d00f3af774ccbd19c', '[\"*\"]', NULL, '2025-06-15 21:18:46', '2025-06-15 21:18:46'),
(7, 'App\\Models\\User', 5, 'auth_token', '56cff91f94a40fc4358f29a76a5b1ea61f15dd78ededd0fa3484c4d76342e1f0', '[\"*\"]', NULL, '2025-06-15 21:19:58', '2025-06-15 21:19:58'),
(8, 'App\\Models\\User', 5, 'auth_token', '67077eef98c18b6264aaaae8afe882f31f92d748ea5eede5c3a072455562f7f9', '[\"*\"]', NULL, '2025-06-15 22:12:25', '2025-06-15 22:12:25'),
(9, 'App\\Models\\User', 5, 'auth_token', '2fc76952f2986c4c9098eb3d3030d0e16ec3ad5c5ecef9c3cafafd5cdb5c2d8b', '[\"*\"]', '2025-06-15 22:50:40', '2025-06-15 22:41:02', '2025-06-15 22:50:40'),
(10, 'App\\Models\\User', 5, 'auth_token', '45d0f00c80a64988bb10211bdfaaf43f4647975ceab81f53e4fb253667122d79', '[\"*\"]', '2025-06-15 23:10:16', '2025-06-15 23:10:16', '2025-06-15 23:10:16'),
(11, 'App\\Models\\User', 5, 'auth_token', '1080da3a9d37605ba3471651f45be967171bbc3c6681c2b0a06817e945e604fc', '[\"*\"]', '2025-06-15 23:10:47', '2025-06-15 23:10:46', '2025-06-15 23:10:47'),
(12, 'App\\Models\\User', 5, 'auth_token', 'cb8c56749fa0fe9a3423243bfa48ed453d5e22017761b854003e0e0c22f691ca', '[\"*\"]', '2025-06-15 23:13:16', '2025-06-15 23:13:15', '2025-06-15 23:13:16'),
(13, 'App\\Models\\User', 5, 'auth_token', 'bc4bb5d350e74154ddeb6c66555601a6e5ddf4811125f81b804f756e51007119', '[\"*\"]', '2025-06-15 23:13:45', '2025-06-15 23:13:45', '2025-06-15 23:13:45'),
(14, 'App\\Models\\User', 5, 'auth_token', 'd22d0323dcf8c8d09353ab6dbbd5fde49100ff2d90e9e34f9dcf5a42d58036c8', '[\"*\"]', '2025-06-16 00:41:29', '2025-06-16 00:41:28', '2025-06-16 00:41:29'),
(15, 'App\\Models\\User', 5, 'auth_token', '3500b82b3767bd99909583b4ebd141edd6978c66339e79a65689e1cd95bdff19', '[\"*\"]', '2025-06-16 02:11:10', '2025-06-16 02:11:10', '2025-06-16 02:11:10'),
(16, 'App\\Models\\User', 5, 'auth_token', '994b4ea66e0844a9adfd596b10c94933862957466cc88bd7b815f99066e3105c', '[\"*\"]', '2025-06-16 02:18:52', '2025-06-16 02:18:51', '2025-06-16 02:18:52'),
(17, 'App\\Models\\User', 5, 'auth_token', 'e7b46858ae09c02d9abf0fd65beba5d7508d49a71c09b365b22e8af50b12425d', '[\"*\"]', '2025-06-16 02:20:37', '2025-06-16 02:20:36', '2025-06-16 02:20:37'),
(18, 'App\\Models\\User', 5, 'auth_token', '5ba2e8d52a355dd5fbd0e324038514b0e07135d4bac1530dff16f3db3b1755f0', '[\"*\"]', NULL, '2025-06-16 03:13:39', '2025-06-16 03:13:39'),
(19, 'App\\Models\\User', 5, 'auth_token', 'b9fa7b95e67b7ae98510dfa2d5af229514b80144869b69a110ad4aeaf8add82e', '[\"*\"]', '2025-06-16 03:25:44', '2025-06-16 03:25:43', '2025-06-16 03:25:44'),
(20, 'App\\Models\\User', 5, 'auth_token', 'e02124caff18396955bf84e7df1fdc8ea56c85f9b3a2ae55a1d8499653890059', '[\"*\"]', '2025-06-16 03:28:16', '2025-06-16 03:26:37', '2025-06-16 03:28:16'),
(21, 'App\\Models\\User', 5, 'auth_token', 'a105e7bfb6a603ac8d7444d7250ffb6bad183baa1e06b82708104886cb6f9dfd', '[\"*\"]', '2025-06-16 03:28:52', '2025-06-16 03:28:51', '2025-06-16 03:28:52'),
(22, 'App\\Models\\User', 5, 'auth_token', '60e384c484372a00c60f6c0c85bba2ebb37d117221d1be7b25201cd0361049bb', '[\"*\"]', '2025-06-16 11:25:00', '2025-06-16 11:25:00', '2025-06-16 11:25:00'),
(23, 'App\\Models\\User', 6, 'auth_token', 'e74868f697742334784ba536e9a55a6f21e1a953c775fd50ebfa6d7b7101dac7', '[\"*\"]', NULL, '2025-06-16 11:27:15', '2025-06-16 11:27:15'),
(24, 'App\\Models\\User', 6, 'auth_token', 'b8198955db495269b0db1f1f065bf40d9488b1bf0908911efd21cb2503138ce2', '[\"*\"]', '2025-06-16 11:34:21', '2025-06-16 11:27:42', '2025-06-16 11:34:21'),
(25, 'App\\Models\\User', 5, 'auth_token', 'f6a3a706c1ff7eeb8e628c93428e4707b7db78a1544d277b7b9416f0b0368eba', '[\"*\"]', '2025-06-16 12:04:39', '2025-06-16 12:03:43', '2025-06-16 12:04:39'),
(26, 'App\\Models\\User', 5, 'auth_token', '0d281b8a7d1a7706f57085ed9e89127c9e0e803f04a4c3e4dce37b85176b455f', '[\"*\"]', '2025-06-16 12:53:36', '2025-06-16 12:50:46', '2025-06-16 12:53:36'),
(27, 'App\\Models\\User', 7, 'auth_token', 'e69323af8574f8ff8f8bf456294e76d69087c23c798a45a4e6fee79d87376bf9', '[\"*\"]', NULL, '2025-06-16 13:08:04', '2025-06-16 13:08:04'),
(28, 'App\\Models\\User', 7, 'auth_token', 'f61639313de9815c888594dd798541da6578106663987548a88375897a106301', '[\"*\"]', '2025-06-16 13:33:01', '2025-06-16 13:08:53', '2025-06-16 13:33:01'),
(29, 'App\\Models\\User', 7, 'auth_token', 'f66e6b1e50e6fae68597d97463166486ee4b3a467a676beef116c575378368e5', '[\"*\"]', '2025-06-16 13:42:20', '2025-06-16 13:37:50', '2025-06-16 13:42:20'),
(30, 'App\\Models\\User', 5, 'auth_token', '7c03366b84bf3b7889ca83055fc88343e0adee09f267b4eb0c421709837e18a5', '[\"*\"]', '2025-06-16 13:43:17', '2025-06-16 13:42:36', '2025-06-16 13:43:17'),
(31, 'App\\Models\\User', 5, 'auth_token', '08d92f2c5a7ba244cf1d179c99936264981dad7ec57f0e250d4574817f78570d', '[\"*\"]', '2025-06-16 13:49:33', '2025-06-16 13:49:32', '2025-06-16 13:49:33'),
(32, 'App\\Models\\User', 5, 'auth_token', '269833cd16b3d1632cd9467c857774ba76ecdae960d8ed11b37007694e56047f', '[\"*\"]', '2025-06-16 14:12:45', '2025-06-16 13:59:29', '2025-06-16 14:12:45'),
(33, 'App\\Models\\User', 5, 'auth_token', '4b14d4b40210fce9c94095bc1b12296f442a3bb1d1e1b3539b090c177bf610d9', '[\"*\"]', '2025-06-16 14:14:16', '2025-06-16 14:13:55', '2025-06-16 14:14:16'),
(34, 'App\\Models\\User', 5, 'auth_token', '8593d9c18073bb8be653e5cde79d8b32a5a0e028b0b23f200e492ba8f7245055', '[\"*\"]', '2025-06-16 14:14:32', '2025-06-16 14:14:31', '2025-06-16 14:14:32'),
(35, 'App\\Models\\User', 5, 'auth_token', '90a482b9f5d619aff56595bc578f20abac09fcced8b06f8ea7df2866faf7f9e0', '[\"*\"]', '2025-06-16 14:18:57', '2025-06-16 14:15:38', '2025-06-16 14:18:57'),
(36, 'App\\Models\\User', 5, 'auth_token', '216ad73852f34ac4076e81970ec43a659b69a0e962ae7f5b850c8093b4e1301c', '[\"*\"]', '2025-06-16 14:19:28', '2025-06-16 14:19:27', '2025-06-16 14:19:28'),
(37, 'App\\Models\\User', 5, 'auth_token', 'f37c6673c47ec37c26a04421e3abfbc9f01a58f82ead536d6219a5fd4dcea3ae', '[\"*\"]', '2025-06-16 14:28:27', '2025-06-16 14:20:38', '2025-06-16 14:28:27');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
CREATE TABLE IF NOT EXISTS `tasks` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `due_date` date NOT NULL,
  `status` enum('pending','in_progress','completed') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `priority` enum('high','medium','low') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'medium',
  `category_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `progress` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_category_id_foreign` (`category_id`),
  KEY `tasks_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `title`, `description`, `due_date`, `status`, `priority`, `category_id`, `user_id`, `progress`, `created_at`, `updated_at`) VALUES
(1, 'Complete project proposal', 'Finish the client proposal document', '2025-06-18', 'completed', 'medium', 1, 1, 100, '2025-06-15 13:18:29', '2025-06-15 15:04:58'),
(2, 'Buy groceries', 'Milk, eggs, bread, fruits', '2025-06-16', 'pending', 'medium', 2, 1, 0, '2025-06-15 13:18:29', '2025-06-15 13:18:29'),
(3, 'Complete project', 'Finish all remaining tasks', '2023-12-31', 'pending', 'high', 1, 1, 0, '2025-06-15 13:27:55', '2025-06-15 13:27:55'),
(4, 'Laundry Work', 'Do laundry', '2025-06-17', 'in_progress', 'low', 2, 7, 0, '2025-06-16 13:09:39', '2025-06-16 13:40:31'),
(7, 'Finish Assignment', 'Have to finish assignment before deadline', '2025-06-17', 'pending', 'high', 1, 7, 0, '2025-06-16 13:38:48', '2025-06-16 13:38:48'),
(8, 'Do project work', 'finish today\'s part', '2025-06-16', 'pending', 'medium', 1, 5, 0, '2025-06-16 13:43:17', '2025-06-16 14:26:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Test User', 'test@example.com', '2025-06-15 13:18:29', '$2y$10$CpiCgnMo90nkJH3QuRIUM.kSAcceN5HbBzoc0Jy7FO92715o8g426', 'zeOXZy7U7P', '2025-06-15 13:18:29', '2025-06-15 15:14:36'),
(2, 'Alex', 'alex@gmail.com', NULL, '$2y$10$HfKHaOiVlbvHPHSOFqOlMuIBDMLd3P8IJHuwUmooF/NMWRKYuirkW', NULL, '2025-06-15 19:39:01', '2025-06-15 19:39:01'),
(3, 'Bryan', 'bryan@gmail.com', NULL, '$2y$10$Bdvw82mhNVb.Jmh8DrZtdu5cxMxDOBV8uCxLc9OF4iviAeBa9ssp6', NULL, '2025-06-15 21:16:39', '2025-06-15 21:16:39'),
(4, 'Tom', 'tom@gmail.com', NULL, '$2y$10$3VjCeQCH0fxC/1oBusNd6uuV3OdOf9VIEk.Q.YVEsNsKd7.Xz.5hy', NULL, '2025-06-15 21:18:46', '2025-06-15 21:18:46'),
(5, 'Semal Fernando', 'fernandosemal2124@gmail.com', NULL, '$2y$10$/csYqcdA8Qq0Zek0DYnKROirDCb6cQCXJDpQAT1PGQh66IsV0ICpy', NULL, '2025-06-15 21:19:58', '2025-06-16 14:00:00'),
(6, 'Nisal Perera', 'nisal@gmail.com', NULL, '$2y$10$JpbyghPhvDaQwNjGa7k23uAwEBLpQu4xVb1BKtsw.d0vFToRSwXMm', NULL, '2025-06-16 11:27:15', '2025-06-16 11:27:15'),
(7, 'Hailey', 'hailey@gmail.com', NULL, '$2y$10$r8otfF2Wu4ehIRTs033oLu71H1p52xV4iK0e1g/ZVOFP.C9TvT0Km', NULL, '2025-06-16 13:08:04', '2025-06-16 13:08:04');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
