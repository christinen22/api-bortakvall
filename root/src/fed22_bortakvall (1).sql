-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 02, 2023 at 08:06 AM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fed22_bortakvall`
--

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_date` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `customer_first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_postcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_total` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `order_date`, `customer_first_name`, `customer_last_name`, `customer_address`, `customer_postcode`, `customer_city`, `customer_email`, `customer_phone`, `order_total`) VALUES
(7, '2023-02-01 17:53:15.215', 'Ture', 'Sventon', 'Gräddvägen 1', '21630', 'Semmelville', 'ture.sventon@gmail.com', '0735030594', 32),
(8, '2023-02-01 17:55:31.920', 'Link', 'Coolguy', 'Sword master', '21630', 'Hyrule', 'linkidinki@gmail.com', '0735030594', 8),
(9, '2023-02-01 18:00:33.931', 'Christine', 'Nilsson', 'Hammars parkväg', '21630', 'Limhamn', 'christine.elin.louise@gmail.com', '0735030594', 28),
(10, '2023-02-01 18:00:53.307', 'Christine', 'Nilsson', 'Hammars parkväg', '21630', 'Limhamn', 'christine.elin.louise@gmail.com', '0735030594', 8),
(11, '2023-02-01 18:01:04.386', 'Christine', 'Nilsson', 'Hammars parkväg', '21630', 'Limhamn', 'christine.elin.louise@gmail.com', '0735030594', 40);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `item_price` int(11) NOT NULL,
  `item_total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`product_id`, `order_id`, `qty`, `item_price`, `item_total`) VALUES
(2, 7, 1, 12, 12),
(3, 7, 1, 8, 8),
(4, 7, 1, 12, 12),
(3, 8, 1, 8, 8),
(1, 9, 1, 12, 12),
(3, 9, 1, 8, 8),
(6, 9, 1, 8, 8),
(3, 10, 1, 8, 8),
(6, 11, 5, 8, 40);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `on_sale` tinyint(1) NOT NULL,
  `images` json NOT NULL,
  `stock_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock_quantity` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `name`, `description`, `price`, `on_sale`, `images`, `stock_status`, `stock_quantity`) VALUES
(1, 'Gott & Blandat Giants', 'En mix av lakrits och gelé med fruktsmak. Innehållsförteckning: Socker, glukossirap, glukos-fruktossirap, stärkelse, VETEMJÖL, melass, syra (citronsyra), fuktighetsbevarande medel (sorbitoler, glycerol), lakritsextrakt, salt, vegetabiliska oljor (kokos, palm), aromer, färgämnen (E153, E120, E100, E141), ytbehandlingsmedel (bivax), stabiliseringsmedel (E471). Alla priser är per skopa.', 12, 0, '{\"large\": \"https://www.bortakvall.se/storage/products/1997509.png\", \"thumbnail\": \"https://www.bortakvall.se/storage/products/thumbnails/1997509-300x300.png\"}', 'instock', 5),
(2, 'Banana Bubs', 'Banan/gräddkola</p>\n<p>Innehållsförteckning: Glukos-fruktossirap, socker, majsstärkelse, vatten, surhetsreglerande medel (äppelsyra, natriumcitrat), potatisprotein, aromämnen, färgämnen: (E150d, E100), kokosolja, ytbehandlingsmedel (karnaubavax). Alla priser är per skopa.', 8, 0, '{\"large\": \"https://www.bortakvall.se/storage/products/156622.png\", \"thumbnail\": \"https://www.bortakvall.se/storage/products/thumbnails/156622-300x300.png\"}', 'instock', 8),
(3, 'Banana Splits', 'Fyllig vitchoklad med smak av kola krispig banan. Innehållsförteckning: Socker, kakaosmör, torkad banan, HELMJÖLKSPULVER, mjölksocker(LAKTOS), SKUMMJÖLKSPULVER, emulgeringsmedel E322 (SOJALECITIN), naturliga aromer, ytbehandlingsmedel (E414, E904). Kan innehålla spår av MANDEL, NÖTTER och VETE. Alla priser är per skopa.', 8, 0, '{\"large\": \"https://www.bortakvall.se/storage/products/3827741.png\", \"thumbnail\": \"https://www.bortakvall.se/storage/products/thumbnails/3827741-300x300.png\"}', 'instock', 6),
(4, 'Ananas', 'Ananas. Innehållsförteckning: Glukosirap, socker, majsstärkelse, gelatin, syror: citronsyra, aromämnen, vegetabiliska oljor (kokosnöt, palmkärna), glansmedel: bivax, carnaubavax, färger: E100, E133. Alla priser är per skopa.', 9, 0, '{\"large\": \"https://www.bortakvall.se/storage/products/2147890-1.png\", \"thumbnail\": \"https://www.bortakvall.se/storage/products/thumbnails/2147890-1-300x300.png\"}', 'outofstock', 10),
(5, 'Bubs Cool Cola Skalle', 'Sur cola. Innehållsförteckning: Socker, glukos-fruktossirap, vatten, majsstärkelse, surhetsreglerande medel (äppelsyra, natriumcitrat), aromämnen, färgämnen (E150d). Alla priser är per skopa.', 8, 0, '{\"large\": \"https://www.bortakvall.se/storage/products/1595204.png\", \"thumbnail\": \"https://www.bortakvall.se/storage/products/thumbnails/1595204-300x300.png\"}', 'instock', 4),
(6, 'Center', 'Mjölkchokladpralin med toffeefyllning. Innehållsförteckning: Socker, glukossirap, kakaosmör, vegetabiliska fetter (palm, shea), HELMJÖLKSPULVER, kakaomassa, SKUMMJÖLKSPULVER, VASSLEPULVER (MJÖLK), salt, aromer (bl.a. vanillin), emulgeringsmedel (SOJALECITIN). Kan innehålla NÖTTER. Alla priser är per skopa.', 8, 0, '{\"large\": \"https://www.bortakvall.se/storage/products/200423.png\", \"thumbnail\": \"https://www.bortakvall.se/storage/products/thumbnails/200423-300x300.png\"}', 'instock', 13);

-- --------------------------------------------------------

--
-- Table structure for table `_prisma_migrations`
--

CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `started_at`, `applied_steps_count`) VALUES
('20d6e3f0-2caf-445c-a88d-aa4146640e85', '142b7a91f4d82ec6609db9a470edb3b2e64ede657f508076b24c592276a0abad', '2023-02-01 17:40:25.159', '20230201174024_new_schema', NULL, NULL, '2023-02-01 17:40:24.711', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_id`,`product_id`),
  ADD KEY `Order_items_product_id_fkey` (`product_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_prisma_migrations`
--
ALTER TABLE `_prisma_migrations`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `Order_items_order_id_fkey` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `Order_items_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
