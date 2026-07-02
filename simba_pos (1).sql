-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 27, 2026 at 01:26 AM
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
(1, 1, 'Original Burger', '🍔', 7.75, 50, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(2, 1, 'Ranch Burger', '🍔', 7.75, 40, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(3, 1, 'Pizza', '🍕', 10.78, 30, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(4, 1, 'Chicken', '🍗', 6.78, 45, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(5, 1, 'Fries', '🍟', 5.78, 60, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(6, 1, 'Chicken Wings', '🍗', 9.78, 35, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(7, 2, 'Vermouth', '🍸', 10.78, 20, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(8, 2, 'Cognac', '🥃', 9.78, 15, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(9, 2, 'Wine', '🍷', 8.78, 25, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(10, 2, 'Rum', '🥃', 8.78, 18, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(11, 3, 'Coca-Cola', '🥤', 1.78, 80, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(12, 3, 'Pepsi', '🥤', 1.78, 75, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(13, 3, 'Diet Coke', '🥤', 1.78, 60, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(14, 3, 'Dr Pepper', '🥤', 1.78, 55, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(15, 3, 'Mountain Dew', '🥤', 1.78, 50, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(16, 3, 'Sprite', '🥤', 1.78, 65, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(17, 3, 'Diet Pepsi', '🥤', 1.78, 45, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(18, 3, 'Coke Zero', '🥤', 1.78, 40, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(19, 3, 'Fresh Juice', '🍊', 1.78, 30, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(20, 3, 'Water', '💧', 1.78, 100, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(21, 4, 'Espresso', '☕', 3.50, 99, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(22, 4, 'Cappuccino', '☕', 4.25, 99, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
(23, 4, 'Hot Choco', '🍫', 3.75, 90, 1, '2026-06-27 06:52:21', '2026-06-27 06:52:21'),
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
(3, 'aaron', 'cashier1', 'cashier1@email.com', '0912345678', '$2y$10$nQX1hR3399SghK16XNdFy.7NTNuJVWEA0GnR/k8eEPITLwanu8FxO', 'cashier', 'active', NULL, NULL, '2026-06-27 06:56:36', '2026-06-27 06:56:36');

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
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction_items`
--
ALTER TABLE `transaction_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

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
