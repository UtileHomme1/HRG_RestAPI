-- phpMyAdmin SQL Dump
-- version 4.0.10deb1ubuntu0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 15, 2019 at 08:08 AM
-- Server version: 5.7.25
-- PHP Version: 7.1.26-1+ubuntu14.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `authAPI`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=15 ;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(8, '2014_10_12_000000_create_users_table', 1),
(9, '2014_10_12_100000_create_password_resets_table', 1),
(10, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(11, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(12, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(13, '2016_06_01_000004_create_oauth_clients_table', 1),
(14, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('3c930fd4d8a8acf0095da336e12867e8665bc66d3f67c2af27826ab9cd5ec48fee6fee661a1ea532', 1, 3, 'User Token', '[]', 0, '2019-02-14 11:26:31', '2019-02-14 11:26:31', '2020-02-14 16:56:31'),
('4734a23f98d313394a7b88600b1453d186e3fe5e11fa8d7990b98aac654e01bd35dbe98e5e194d14', 1, 3, 'User Token', '[]', 0, '2019-02-14 09:16:48', '2019-02-14 09:16:48', '2020-02-14 14:46:48'),
('578d922e406e7a9baa46a356c5d3c8a40cf6bd3553df80891aeca538d8a5c61da106947c07a7577b', 1, 3, 'User Token', '[]', 0, '2019-02-14 11:26:25', '2019-02-14 11:26:25', '2020-02-14 16:56:25'),
('74d97540543d4e3b995f943ce140f2d3945195243561dc375048439171a573393d0151710f9ec6e8', 1, 3, 'User Token', '[]', 0, '2019-02-14 11:26:34', '2019-02-14 11:26:34', '2020-02-14 16:56:34'),
('809a67ff7d25a4f707237c7a706810c1e200c1f9da0cf9a1c0dbdb3c8bcaa71f653c5db68001c29f', 1, 3, 'User Token', '[]', 0, '2019-02-14 09:56:42', '2019-02-14 09:56:42', '2020-02-14 15:26:42'),
('a4ffc87e93fa99b3c14a217f5730c23ca7c7a0e4a3546af84a86449d9cb97d7a4ccc540271bd5c98', 1, 3, 'User Token', '[]', 0, '2019-02-14 11:26:33', '2019-02-14 11:26:33', '2020-02-14 16:56:33'),
('b86bb9ca87e4ead4dd1848991c3cbf092106d375d6a473f3a0e1fb26fc86a623729ddf49e39b1f9c', 1, 3, 'User Token', '[]', 0, '2019-02-14 11:22:32', '2019-02-14 11:22:32', '2020-02-14 16:52:32'),
('d51dae5bdad8ca84d7e491ceadc3a9f7ef9721d8b173de627883462465a3712ae1149cad4adcd680', 1, 3, 'User Token', '[]', 0, '2019-02-14 11:26:28', '2019-02-14 11:26:28', '2020-02-14 16:56:28');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'vutmcaWTPFlBZGj1Em9x8Mhqm8s4B1KDjjzQj9Om', 'http://localhost', 1, 0, 0, '2019-02-14 09:16:32', '2019-02-14 09:16:32'),
(2, NULL, 'Laravel Password Grant Client', 'ghCM2T8od7jXRIxw8Mkb4cKwGzrUaynwXtxUeqs2', 'http://localhost', 0, 1, 0, '2019-02-14 09:16:33', '2019-02-14 09:16:33'),
(3, NULL, 'Laravel Personal Access Client', 'cujAJrEMmXBod3WXXW6MR1I24jmpRftEj2dSplXT', 'http://localhost', 1, 0, 0, '2019-02-14 09:16:43', '2019-02-14 09:16:43'),
(4, NULL, 'Laravel Password Grant Client', 'oYmw4nFiU8KTIfEujrH7HEd2cMM6lUJQwDG7FLXN', 'http://localhost', 0, 1, 0, '2019-02-14 09:16:43', '2019-02-14 09:16:43');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-02-14 09:16:33', '2019-02-14 09:16:33'),
(2, 3, '2019-02-14 09:16:43', '2019-02-14 09:16:43');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_forgots`
--

CREATE TABLE IF NOT EXISTS `password_forgots` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Jatin Sharma', 'jatins368@gmail.com', NULL, '$2y$10$344Od/RIZzE6W501.aPaie5QFNt4yApOvxiurUbrJTAEu5OpirmHa', NULL, '2019-02-14 09:13:25', '2019-02-14 11:24:20'),
(2, 'Yash Sharma', 'jatins3681@gmail.com', NULL, '$2y$10$4q22Ls7OLlTSw86Xy8dBhONCN0U0aN1luIWWz/3GwEQTqpPlKLsKS', NULL, '2019-02-14 09:17:33', '2019-02-14 09:17:33');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
