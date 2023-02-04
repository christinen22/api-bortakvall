-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: b4yk2s1z653ziq0ln2zd-mysql.services.clever-cloud.com:3306
-- Generation Time: Feb 04, 2023 at 03:08 PM
-- Server version: 8.0.22-13
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `b4yk2s1z653ziq0ln2zd`
--

-- --------------------------------------------------------

--
-- Table structure for table `Order`
--

CREATE TABLE `Order` (
  `id` int UNSIGNED NOT NULL,
  `order_date` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `customer_first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_postcode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_total` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Order`
--

INSERT INTO `Order` (`id`, `customer_first_name`, `customer_last_name`, `customer_address`, `customer_postcode`, `customer_city`, `customer_email`, `customer_phone`, `order_total`) VALUES
(1, 'Ture', 'Sventon', 'Semmelvägen 1', '24751', 'Semmelville', 'ture_sventon@gmail.com', '0735030594', 16),
(2, 'Link', 'Swordsman', 'Hyrule way 8', '21630', 'h', 'christine.elin.louise@gmail.com', '0735030594', 72),
(3, 'Stina', 'Svensson', 'Malmövägen 11', '21630', 'Malmö', 'christine.elin.louise@gmail.com', '0735030594', 24);

-- --------------------------------------------------------

--
-- Table structure for table `Order_items`
--

CREATE TABLE `Order_items` (
  `product_id` int UNSIGNED NOT NULL,
  `order_id` int UNSIGNED NOT NULL,
  `qty` int NOT NULL,
  `item_price` int NOT NULL,
  `item_total` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Order_items`
--

INSERT INTO `Order_items` (`product_id`, `order_id`, `qty`, `item_price`, `item_total`) VALUES
(4, 1, 2, 8, 16),
(2, 2, 3, 8, 24),
(3, 2, 3, 8, 24),
(4, 2, 3, 8, 24),
(2, 3, 3, 8, 24);

-- --------------------------------------------------------

--
-- Table structure for table `Product`
--

CREATE TABLE `Product` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int NOT NULL,
  `on_sale` tinyint(1) NOT NULL,
  `images` json NOT NULL,
  `stock_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock_quantity` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `Product`
--

INSERT INTO `Product` (`id`, `name`, `description`, `price`, `on_sale`, `images`, `stock_status`, `stock_quantity`) VALUES
(1, 'Gott & Blandat Giants', 'En mix av lakrits och gelé med fruktsmak. Innehållsförteckning: Socker, glukossirap, glukos-fruktossirap, stärkelse, VETEMJÖL, melass, syra (citronsyra), fuktighetsbevarande medel (sorbitoler, glycerol), lakritsextrakt, salt, vegetabiliska oljor (kokos, palm), aromer, färgämnen (E153, E120, E100, E141), ytbehandlingsmedel (bivax), stabiliseringsmedel (E471). Alla priser är per skopa.', 12, 0, '{\"large\": \"https://www.bortakvall.se/storage/products/1997509.png\", \"thumbnail\": \"https://www.bortakvall.se/storage/products/thumbnails/1997509-300x300.png\"}', 'instock', 5),
(2, 'Banana Bubs', 'Banan/gräddkola</p>\n<p>Innehållsförteckning: Glukos-fruktossirap, socker, majsstärkelse, vatten, surhetsreglerande medel (äppelsyra, natriumcitrat), potatisprotein, aromämnen, färgämnen: (E150d, E100), kokosolja, ytbehandlingsmedel (karnaubavax). Alla priser är per skopa.', 8, 0, '{\"large\": \"https://bortakvall.se/storage/products/156622.png\", \"thumbnail\": \"https://bortakvall.se/storage/products/thumbnails/156622-300x300.png\"}', 'instock', 8),
(3, 'Banana Splits', 'Fyllig vitchoklad med smak av kola krispig banan. Innehållsförteckning: Socker, kakaosmör, torkad banan, HELMJÖLKSPULVER, mjölksocker(LAKTOS), SKUMMJÖLKSPULVER, emulgeringsmedel E322 (SOJALECITIN), naturliga aromer, ytbehandlingsmedel (E414, E904). Kan innehålla spår av MANDEL, NÖTTER och VETE.</p>\n<p><em>Alla priser är per skopa.', 8, 0, '{\"large\": \"https://www.bortakvall.se/storage/products/3827741.png\", \"thumbnail\": \"https://www.bortakvall.se/storage/products/thumbnails/3827741-300x300.png\"}', 'instock', 6),
(4, 'Bubs Cool Cola Skalle', 'Sur cola. Innehållsförteckning: Socker, glukos-fruktossirap, vatten, majsstärkelse, surhetsreglerande medel (äppelsyra, natriumcitrat), aromämnen, färgämnen (E150d). Alla priser är per skopa.', 8, 0, '{\"large\": \"https://www.bortakvall.se/storage/products/1595204.png\", \"thumbnail\": \"https://www.bortakvall.se/storage/products/thumbnails/1595204-300x300.png\"}', 'instock', 4);

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
  `applied_steps_count` int UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_prisma_migrations`
--

INSERT INTO `_prisma_migrations` (`id`, `checksum`, `finished_at`, `migration_name`, `logs`, `rolled_back_at`, `applied_steps_count`) VALUES
('73b582c7-4dd1-4feb-a396-4dd8da7ae79a', '142b7a91f4d82ec6609db9a470edb3b2e64ede657f508076b24c592276a0abad', '2023-02-04 12:15:19.018', '20230201174024_new_schema', NULL, NULL, 1),
('f92a4ed2-c5f8-4d71-a08c-479baa5c8319', '70db2f5406aff69e8b824186313ce061b14a97e4f5761fe87f74614190c340a5', NULL, '20230204094331_images_optional', 'A migration failed to apply. New migrations cannot be applied before the error is recovered from. Read more about how to resolve migration issues in a production database: https://pris.ly/d/migrate-resolve\n\nMigration name: 20230204094331_images_optional\n\nDatabase error code: 1064\n\nDatabase error:\nYou have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'{}\' at line 2\n\nPlease check the query number 1 from the migration file.\n\n   0: sql_migration_connector::apply_migration::apply_script\n           with migration_name=\"20230204094331_images_optional\"\n             at migration-engine/connectors/sql-migration-connector/src/apply_migration.rs:105\n   1: migration_core::commands::apply_migrations::Applying migration\n           with migration_name=\"20230204094331_images_optional\"\n             at migration-engine/core/src/commands/apply_migrations.rs:91\n   2: migration_core::state::ApplyMigrations\n             at migration-engine/core/src/state.rs:200', NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Order`
--
ALTER TABLE `Order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Order_items`
--
ALTER TABLE `Order_items`
  ADD PRIMARY KEY (`order_id`,`product_id`),
  ADD KEY `Order_items_product_id_fkey` (`product_id`);

--
-- Indexes for table `Product`
--
ALTER TABLE `Product`
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
-- AUTO_INCREMENT for table `Order`
--
ALTER TABLE `Order`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Product`
--
ALTER TABLE `Product`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Order_items`
--
ALTER TABLE `Order_items`
  ADD CONSTRAINT `Order_items_order_id_fkey` FOREIGN KEY (`order_id`) REFERENCES `Order` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `Order_items_product_id_fkey` FOREIGN KEY (`product_id`) REFERENCES `Product` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
