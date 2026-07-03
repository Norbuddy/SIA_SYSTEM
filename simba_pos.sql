-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 03, 2026 at 12:28 PM
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
-- Database: `simba_pos`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` enum('income','expense') NOT NULL,
  `description` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `entry_date` date NOT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(30) DEFAULT '',
  `password` varchar(255) NOT NULL,
  `role` enum('admin','cashier') NOT NULL DEFAULT 'cashier',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `reset_token` varchar(128) DEFAULT NULL,
  `reset_exp` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `username`, `email`, `phone`, `password`, `role`, `status`, `reset_token`, `reset_exp`, `created_at`, `updated_at`) VALUES
(1, 'Admin User', 'admin', 'admin@simbacafe.com', '', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', 'active', NULL, NULL, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(2, 'Cashier One', 'cashier', 'cashier@simbacafe.com', '', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'cashier', 'active', NULL, NULL, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(3, 'aaron', 'cashier1', 'cashier1@email.com', '0912345678', '$2y$10$nQX1hR3399SghK16XNdFy.7NTNuJVWEA0GnR/k8eEPITLwanu8FxO', 'cashier', 'active', NULL, NULL, '2026-06-27 06:56:36', '2026-06-27 06:56:36'),
(4, 'ampogi ko tlaga', 'invalid', 'ampogikotlaga@gmail.com', '09268663521', '$2y$10$leLEUXyrmWJaVgiAXHn6auvnPf5d33La2FwjdzKmuifNPZKIZGNW2', 'cashier', 'active', NULL, NULL, '2026-07-03 07:11:56', '2026-07-03 07:11:56'),
(5, 'rv', 'invalid247', 'ampogikotlaga1@gmail.com', '022123454879', '$2y$10$0ygY/Ds1.nRy4wfLGI5f3.ns0Dvr371smFRahHnmIICZzeimB5laS', 'cashier', 'active', NULL, NULL, '2026-07-03 09:06:04', '2026-07-03 09:06:04');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(80) NOT NULL,
  `icon` varchar(10) NOT NULL DEFAULT '?️',
  `sort_order` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `icon`, `sort_order`) VALUES
(1, 'Food', '🍔', 1),
(2, 'Alcohol', '🍷', 2),
(3, 'Cold Drinks', '🥤', 3),
(4, 'Hot Drinks', '☕', 4),
(5, 'Desserts', '🍰', 5);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `username` varchar(100) NOT NULL,
  `phone` varchar(30) DEFAULT '',
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `username`, `phone`, `password`, `created_at`) VALUES
(1, 'Jane Doe', 'jane@example.com', 'janedoe', '09123456789', '$2y$10$2ulROFwd4RJzFBuPBWctxuIVHPsFRDMp6pFHGOXICAeIESUjioYxK', '2026-07-03 12:00:00'),
(2, 'John Smith', 'john@example.com', 'johnsmith', '09998887766', '$2y$10$DNau6yaisFQyNoEseTobReBObZ7C8JPiOwulOJaeCb1qS0uqkcB2.', '2026-07-03 12:00:00'),
(3, 'rv', 'ampogikotlaga@gmail.com', 'ampogikotlaga', '09566545123', '$2y$10$2OzHl7dMe58lQh9TBep1ZOWHcyGoFDHtQz81lWn8bujzYNq03WOAO', '2026-07-03 08:10:21'),
(4, 'juan', 'juan@gmail.com', 'juan', '', '$2y$10$AY1Ptq6Cm0NDkVCpf0gCF.VBCobkyqmalnLmoFkBNNU80KrqPJ5gK', '2026-07-03 09:21:12'),
(5, 'rv', 'ampogikotlaga2@gmail.com', 'ampogikotlaga2', '09268663521', '$2y$10$5.12qhRtGDGEp1ngcMLxzecCIS4TD7rfQNiaqfm0fI6Irg/qIZTiy', '2026-07-03 11:35:50'),
(6, 'juan2', 'juan2@gmail.com', 'juan2', '022123454879', '$2y$10$KGhHplBuSVRg6dA979tZ3eSUIk2iFtYgbDa8fZEKQi2TWXcfOrPgW', '2026-07-03 18:26:51');

-- --------------------------------------------------------

--
-- Table structure for table `managers`
--

CREATE TABLE `managers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(30) DEFAULT '',
  `password` varchar(255) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `reset_token` varchar(128) DEFAULT NULL,
  `reset_exp` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `managers`
--

INSERT INTO `managers` (`id`, `name`, `username`, `email`, `phone`, `password`, `status`, `reset_token`, `reset_exp`, `created_at`, `updated_at`) VALUES
(1, 'rv', 'manager1', 'manager1@gmail.com', '09265358745', '45612378', 'active', NULL, NULL, '2026-07-03 12:00:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` enum('Pending','To Ship','Received','Completed','Processing','Cancelled') NOT NULL DEFAULT 'Pending',
  `order_date` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `subtotal` decimal(10,2) NOT NULL DEFAULT 0.00,
  `delivery_method` enum('Shipping','Pickup') NOT NULL DEFAULT 'Pickup',
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT 0.00,
  `grand_total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `full_name` varchar(150) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  `barangay` varchar(255) DEFAULT NULL,
  `city` varchar(150) DEFAULT NULL,
  `province` varchar(150) DEFAULT NULL,
  `zip_code` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `total_price`, `status`, `order_date`, `created_at`, `subtotal`, `delivery_method`, `shipping_fee`, `grand_total`, `full_name`, `phone`, `street_address`, `barangay`, `city`, `province`, `zip_code`) VALUES
(1, 3, 11.31, 'Pending', '2026-07-03 08:21:03', '2026-07-03 08:21:03', 0.00, 'Pickup', 0.00, 0.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 3, 0.00, 'Pending', '2026-07-03 08:37:37', '2026-07-03 08:37:37', 11.31, 'Pickup', 0.00, 11.31, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 4, 0.00, 'Pending', '2026-07-03 09:21:40', '2026-07-03 09:21:40', 9.53, 'Pickup', 0.00, 9.53, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 4, 0.00, 'Pending', '2026-07-03 09:47:23', '2026-07-03 09:47:23', 17.28, 'Pickup', 0.00, 17.28, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 5, 0.00, 'To Ship', '2026-07-03 11:36:48', '2026-07-03 11:36:48', 11.31, 'Pickup', 0.00, 11.31, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 5, 0.00, 'Processing', '2026-07-03 13:02:22', '2026-07-03 13:02:22', 9.53, 'Pickup', 0.00, 9.53, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `unit_price`, `total_price`, `created_at`) VALUES
(1, 1, 1, 1, 7.75, 7.75, '2026-07-03 08:21:03'),
(2, 1, 13, 1, 1.78, 1.78, '2026-07-03 08:21:03'),
(3, 1, 16, 1, 1.78, 1.78, '2026-07-03 08:21:03'),
(4, 2, 13, 1, 1.78, 1.78, '2026-07-03 08:37:37'),
(5, 2, 1, 1, 7.75, 7.75, '2026-07-03 08:37:37'),
(6, 2, 18, 1, 1.78, 1.78, '2026-07-03 08:37:37'),
(7, 3, 14, 1, 1.78, 1.78, '2026-07-03 09:21:40'),
(8, 3, 1, 1, 7.75, 7.75, '2026-07-03 09:21:40'),
(9, 4, 1, 2, 7.75, 15.50, '2026-07-03 09:47:23'),
(10, 4, 13, 1, 1.78, 1.78, '2026-07-03 09:47:23'),
(11, 5, 13, 1, 1.78, 1.78, '2026-07-03 11:36:48'),
(12, 5, 14, 1, 1.78, 1.78, '2026-07-03 11:36:48'),
(13, 5, 1, 1, 7.75, 7.75, '2026-07-03 11:36:48'),
(14, 6, 13, 1, 1.78, 1.78, '2026-07-03 13:02:22'),
(15, 6, 1, 1, 7.75, 7.75, '2026-07-03 13:02:22');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `icon` varchar(10) NOT NULL DEFAULT '?️',
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `stock` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `icon`, `price`, `stock`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Original Burger', '🍔', 7.75, 42, 1, '2026-06-27 06:52:21', '2026-07-03 13:02:22'),
(2, 1, 'Ranch Burger', '🍔', 7.75, 39, 1, '2026-06-27 06:52:21', '2026-07-03 10:17:56'),
(3, 1, 'Pizza', '🍕', 10.78, 29, 1, '2026-06-27 06:52:21', '2026-07-03 13:25:38'),
(4, 1, 'Chicken', '🍗', 6.78, 44, 1, '2026-06-27 06:52:21', '2026-07-03 13:23:31'),
(5, 1, 'Fries', '🍟', 5.78, 60, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(6, 1, 'Chicken Wings', '🍗', 9.78, 35, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(7, 2, 'Vermouth', '🍸', 10.78, 20, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(8, 2, 'Cognac', '🥃', 9.78, 15, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(9, 2, 'Wine', '🍷', 8.78, 25, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(10, 2, 'Rum', '🥃', 8.78, 18, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(11, 3, 'Coca-Cola', '🥤', 1.78, 80, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(12, 3, 'Pepsi', '🥤', 1.78, 75, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(13, 3, 'Diet Coke', '🥤', 1.78, 55, 1, '2026-06-27 06:52:21', '2026-07-03 13:02:22'),
(14, 3, 'Dr Pepper', '🥤', 1.78, 51, 1, '2026-06-27 06:52:21', '2026-07-03 13:25:38'),
(15, 3, 'Mountain Dew', '🥤', 1.78, 50, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(16, 3, 'Sprite', '🥤', 1.78, 64, 1, '2026-06-27 06:52:21', '2026-07-03 08:21:03'),
(17, 3, 'Diet Pepsi', '🥤', 1.78, 42, 1, '2026-06-27 06:52:21', '2026-07-03 13:25:38'),
(18, 3, 'Coke Zero', '🥤', 1.78, 39, 1, '2026-06-27 06:52:21', '2026-07-03 08:37:37'),
(19, 3, 'Fresh Juice', '🍊', 1.78, 30, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(20, 3, 'Water', '💧', 1.78, 100, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(24, 5, 'Cheesecake', '🍰', 5.50, 25, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(25, 5, 'Ice Cream', '🍨', 3.25, 40, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `key` varchar(80) NOT NULL,
  `value` text NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`key`, `value`) VALUES
('auto_print', '0'),
('cafe_address', '123 Main Street, Quezon City'),
('cafe_name', 'Simba Cafe'),
('cafe_phone', '+63 912 345 6789'),
('currency', '$'),
('low_stock_threshold', '10'),
('tax_rate', '10');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `txn_code` varchar(20) NOT NULL,
  `cashier_id` int(10) UNSIGNED NOT NULL,
  `subtotal` decimal(10,2) NOT NULL DEFAULT 0.00,
  `tax_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount_pct` decimal(5,2) NOT NULL DEFAULT 0.00,
  `discount_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payment_method` enum('cash','card','gcash') NOT NULL DEFAULT 'cash',
  `cash_received` decimal(10,2) NOT NULL DEFAULT 0.00,
  `change_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `card_ref` varchar(100) DEFAULT '',
  `gcash_ref` varchar(100) DEFAULT '',
  `status` enum('completed','voided') NOT NULL DEFAULT 'completed',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `txn_code`, `cashier_id`, `subtotal`, `tax_amount`, `discount_pct`, `discount_amount`, `total_amount`, `payment_method`, `cash_received`, `change_amount`, `card_ref`, `gcash_ref`, `status`, `created_at`) VALUES
(1, 'TXN-0001', 4, 7.75, 0.78, 0.00, 0.00, 8.53, 'cash', 10.00, 1.47, '', '', 'completed', '2026-07-03 07:14:35'),
(2, 'TXN-0002', 5, 13.09, 1.31, 0.00, 0.00, 14.40, 'cash', 20.00, 5.60, '', '', 'completed', '2026-07-03 10:17:56'),
(3, 'TXN-0003', 5, 6.78, 0.68, 0.00, 0.00, 7.46, 'cash', 10.00, 2.54, '', '', 'completed', '2026-07-03 13:23:31'),
(4, 'TXN-0004', 5, 14.34, 1.43, 0.00, 0.00, 15.77, 'cash', 20.00, 4.23, '', '', 'completed', '2026-07-03 13:25:38');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_items`
--

CREATE TABLE `transaction_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_name` varchar(120) NOT NULL,
  `product_icon` varchar(10) NOT NULL DEFAULT '?️',
  `unit_price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `line_total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transaction_items`
--

INSERT INTO `transaction_items` (`id`, `transaction_id`, `product_id`, `product_name`, `product_icon`, `unit_price`, `quantity`, `line_total`) VALUES
(1, 1, 1, 'Original Burger', '🍔', 7.75, 1, 7.75),
(2, 2, 17, 'Diet Pepsi', '🥤', 1.78, 2, 3.56),
(3, 2, 2, 'Ranch Burger', '🍔', 7.75, 1, 7.75),
(4, 2, 14, 'Dr Pepper', '🥤', 1.78, 1, 1.78),
(5, 3, 4, 'Chicken', '🍗', 6.78, 1, 6.78),
(6, 4, 17, 'Diet Pepsi', '🥤', 1.78, 1, 1.78),
(7, 4, 14, 'Dr Pepper', '🥤', 1.78, 1, 1.78),
(8, 4, 3, 'Pizza', '🍕', 10.78, 1, 10.78);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(60) NOT NULL,
  `email` varchar(150) NOT NULL,
  `phone` varchar(30) DEFAULT '',
  `password` varchar(255) NOT NULL,
  `role` enum('admin','manager','cashier') NOT NULL DEFAULT 'cashier',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `reset_token` varchar(100) DEFAULT NULL,
  `reset_exp` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `phone`, `password`, `role`, `status`, `reset_token`, `reset_exp`, `created_at`, `updated_at`) VALUES
(1, 'Admin User', 'admin', 'admin@simbacafe.com', '', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', 'active', NULL, NULL, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(2, 'Cashier One', 'cashier', 'cashier@simbacafe.com', '', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'cashier', 'active', NULL, NULL, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(3, 'aaron', 'cashier1', 'cashier1@email.com', '0912345678', '$2y$10$nQX1hR3399SghK16XNdFy.7NTNuJVWEA0GnR/k8eEPITLwanu8FxO', 'cashier', 'active', NULL, NULL, '2026-06-27 06:56:36', '2026-06-27 06:56:36'),
(4, 'ampogi ko tlaga', 'invalid', 'ampogikotlaga@gmail.com', '09268663521', '$2y$10$leLEUXyrmWJaVgiAXHn6auvnPf5d33La2FwjdzKmuifNPZKIZGNW2', 'cashier', 'active', NULL, NULL, '2026-07-03 07:11:56', '2026-07-03 07:11:56'),
(5, 'rv', 'invalid247', 'ampogikotlaga1@gmail.com', '022123454879', '$2y$10$0ygY/Ds1.nRy4wfLGI5f3.ns0Dvr371smFRahHnmIICZzeimB5laS', 'cashier', 'active', NULL, NULL, '2026-07-03 09:06:04', '2026-07-03 09:06:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `managers`
--
ALTER TABLE `managers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_customer_id` (`customer_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_order_id` (`order_id`),
  ADD KEY `idx_product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `txn_code` (`txn_code`),
  ADD KEY `cashier_id` (`cashier_id`);

--
-- Indexes for table `transaction_items`
--
ALTER TABLE `transaction_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaction_id` (`transaction_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `managers`
--
ALTER TABLE `managers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `transaction_items`
--
ALTER TABLE `transaction_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `fk_order_items_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_order_items_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`cashier_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `transaction_items`
--
ALTER TABLE `transaction_items`
  ADD CONSTRAINT `transaction_items_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaction_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
