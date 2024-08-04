-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 04, 2024 at 10:18 AM
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
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `destinations`
--

CREATE TABLE `destinations` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `weather_id` varchar(11) NOT NULL,
  `created_at` bigint(20) UNSIGNED NOT NULL,
  `updated_at` bigint(20) UNSIGNED NOT NULL,
  `deleted_at` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `destinations`
--

INSERT INTO `destinations` (`id`, `title`, `weather_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'تبریز', '1', 1721233356, 1721234361, NULL),
(2, 'تهران', '1', 1721234366, 1721234366, 1721234471);

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `updated_at` bigint(20) NOT NULL,
  `deleted_at` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'پارکینگ', 0, 0, NULL),
(2, 'کولر گازی', 0, 0, NULL),
(3, 'تخت دو نفره', 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reserves`
--

CREATE TABLE `reserves` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `entry_date` varchar(50) NOT NULL,
  `entry_timestamp` bigint(20) UNSIGNED NOT NULL,
  `exit_date` varchar(50) NOT NULL,
  `exit_timestamp` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending','payed','cancel','reject') NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `updated_at` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) UNSIGNED NOT NULL,
  `host_id` int(11) UNSIGNED NOT NULL,
  `destination_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `room_detail` varchar(255) NOT NULL,
  `capacity` tinyint(3) UNSIGNED NOT NULL,
  `addition_capacity` int(11) NOT NULL,
  `daily_price` int(11) UNSIGNED NOT NULL,
  `off_percent` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` bigint(20) NOT NULL,
  `updated_at` bigint(20) NOT NULL,
  `deleted_at` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `host_id`, `destination_id`, `title`, `room_detail`, `capacity`, `addition_capacity`, `daily_price`, `off_percent`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 15, 1, 'تبریز اتاق', 'این یک پیام تستی برای یک اتاق در تبریز است', 1, 0, 200000, 0, 1721387067, 1721413963, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `room_feature`
--

CREATE TABLE `room_feature` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `deleted_at` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `room_feature`
--

INSERT INTO `room_feature` (`id`, `room_id`, `feature_id`, `created_at`, `deleted_at`) VALUES
(1, 2, 1, 1721468487, NULL),
(2, 2, 2, 1721469717, NULL),
(3, 2, 3, 1721469719, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `room_like`
--

CREATE TABLE `room_like` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `deleted_at` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `mobile_number` varchar(11) NOT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `role` enum('guest','host','admin','support') NOT NULL DEFAULT 'guest',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `deleted_at` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('pending','reject','accept') NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `display_name`, `mobile_number`, `profile_image`, `role`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(11, 'arashnasri', 'آرش نصری وطن', '09022612070', NULL, 'admin', '2024-06-26 00:13:56', '2024-06-26 00:13:56', NULL, 'pending'),
(15, 'nima', 'نیما عباسی', '09057130907', '', 'host', '2024-07-19 14:16:31', '2024-07-19 14:16:31', NULL, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `weathers`
--

CREATE TABLE `weathers` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` bigint(20) NOT NULL,
  `updated_at` bigint(20) NOT NULL,
  `deleted_at` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_persian_ci;

--
-- Dumping data for table `weathers`
--

INSERT INTO `weathers` (`id`, `title`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'گرم و خشک', 1719945054, 1719945054, NULL),
(2, 'گرم', 1720348425, 1720538884, 1721121630);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `destinations`
--
ALTER TABLE `destinations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reserves`
--
ALTER TABLE `reserves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`,`host_id`);

--
-- Indexes for table `room_feature`
--
ALTER TABLE `room_feature`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_like`
--
ALTER TABLE `room_like`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `mobile_number` (`mobile_number`);

--
-- Indexes for table `weathers`
--
ALTER TABLE `weathers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `destinations`
--
ALTER TABLE `destinations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reserves`
--
ALTER TABLE `reserves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `room_feature`
--
ALTER TABLE `room_feature`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `room_like`
--
ALTER TABLE `room_like`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `weathers`
--
ALTER TABLE `weathers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
