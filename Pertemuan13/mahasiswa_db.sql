-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 11, 2026 at 01:50 PM
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
-- Database: `abyad_apparel`
--
CREATE DATABASE IF NOT EXISTS `abyad_apparel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `abyad_apparel`;

-- --------------------------------------------------------

--
-- Table structure for table `admin_messages`
--

CREATE TABLE `admin_messages` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `sender` varchar(20) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_code` varchar(30) DEFAULT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `whatsapp` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `apparel_type` varchar(100) DEFAULT NULL,
  `apparel_model` varchar(100) DEFAULT NULL,
  `apparel_color` varchar(50) DEFAULT NULL,
  `design_notes` text DEFAULT NULL,
  `design_image` longtext DEFAULT NULL,
  `mockup_front` varchar(255) DEFAULT NULL,
  `mockup_back` varchar(255) DEFAULT NULL,
  `total_qty` int(11) DEFAULT 0,
  `total_price` decimal(12,2) DEFAULT 0.00,
  `payment_status` enum('pending','paid','rejected') DEFAULT 'pending',
  `order_status` varchar(50) DEFAULT 'pending',
  `admin_notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_code`, `customer_name`, `whatsapp`, `email`, `apparel_type`, `apparel_model`, `apparel_color`, `design_notes`, `design_image`, `mockup_front`, `mockup_back`, `total_qty`, `total_price`, `payment_status`, `order_status`, `admin_notes`, `created_at`) VALUES
(28, 'ABY-2026-001331', 'ar', '081361738134', 'Rabu@gmail.com', 'T-Shirt', 'Cotton Combed 30s', '#8b0000', '', 'data:image/jpeg;base64,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', NULL, NULL, 1, 75000.00, 'pending', 'payment_confirmed', NULL, '2026-06-12 12:41:50');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `size_name` varchar(10) DEFAULT NULL,
  `quantity` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `payment_proof` varchar(255) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_status` enum('pending','approved','rejected','verified','waiting') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `amount` decimal(15,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `payment_proof`, `payment_method`, `payment_status`, `created_at`, `amount`) VALUES
(24, 28, '1781268173936.jpg', 'BCA', 'approved', '2026-06-12 12:42:54', 75000.00);

-- --------------------------------------------------------

--
-- Table structure for table `tracking_logs`
--

CREATE TABLE `tracking_logs` (
  `id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `status_name` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_messages`
--
ALTER TABLE `admin_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_code` (`order_code`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_ibfk_1` (`order_id`);

--
-- Indexes for table `tracking_logs`
--
ALTER TABLE `tracking_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_messages`
--
ALTER TABLE `admin_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tracking_logs`
--
ALTER TABLE `tracking_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin_messages`
--
ALTER TABLE `admin_messages`
  ADD CONSTRAINT `admin_messages_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tracking_logs`
--
ALTER TABLE `tracking_logs`
  ADD CONSTRAINT `tracking_logs_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;
--
-- Database: `kos`
--
CREATE DATABASE IF NOT EXISTS `kos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `kos`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`) VALUES
('admin', '123');

-- --------------------------------------------------------

--
-- Table structure for table `kamar`
--

CREATE TABLE `kamar` (
  `id_kamar` int(11) NOT NULL,
  `nomor_kamar` varchar(10) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kamar`
--

INSERT INTO `kamar` (`id_kamar`, `nomor_kamar`, `harga`, `status`) VALUES
(1, '001', 2000000, 'Terisi'),
(2, '002', 2500000, 'Terisi'),
(3, '003', 2000000, 'Kosong'),
(4, '004', 1000000, 'Terisi'),
(5, '005', 2000000, 'Kosong'),
(6, '006', 2500000, 'Kosong'),
(7, '007', 2500000, 'Terisi'),
(9, '008', 2000000, 'Kosong');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_bayar` int(11) NOT NULL,
  `id_penghuni` int(11) DEFAULT NULL,
  `bulan` varchar(20) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_bayar`, `id_penghuni`, `bulan`, `jumlah`) VALUES
(2, 1, 'Juni', 2000000);

-- --------------------------------------------------------

--
-- Table structure for table `penghuni`
--

CREATE TABLE `penghuni` (
  `id_penghuni` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `id_kamar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penghuni`
--

INSERT INTO `penghuni` (`id_penghuni`, `nama`, `no_hp`, `alamat`, `id_kamar`) VALUES
(1, 'Alga', '0876423545', 'Jl. Mekarsari rt 001 rw 002 Pisangan, Ciputat Timur', 1),
(2, 'Ariel', '08562173781', 'Jl. Kenangan rt 005 rw 099 Ciredeu', 2),
(3, 'Syarief', '0838t16858', 'Jl Tarumanegara', 4),
(4, 'Firman', '08362627657', 'Jl. Bojongsari', 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`id_kamar`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_bayar`),
  ADD KEY `fk_pembayaran_penghuni` (`id_penghuni`);

--
-- Indexes for table `penghuni`
--
ALTER TABLE `penghuni`
  ADD PRIMARY KEY (`id_penghuni`),
  ADD KEY `fk_penghuni_kamar` (`id_kamar`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kamar`
--
ALTER TABLE `kamar`
  MODIFY `id_kamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_bayar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `penghuni`
--
ALTER TABLE `penghuni`
  MODIFY `id_penghuni` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD CONSTRAINT `fk_pembayaran_penghuni` FOREIGN KEY (`id_penghuni`) REFERENCES `penghuni` (`id_penghuni`);

--
-- Constraints for table `penghuni`
--
ALTER TABLE `penghuni`
  ADD CONSTRAINT `fk_penghuni_kamar` FOREIGN KEY (`id_kamar`) REFERENCES `kamar` (`id_kamar`);
--
-- Database: `mahasiswa_db`
--
CREATE DATABASE IF NOT EXISTS `mahasiswa_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `mahasiswa_db`;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id_mahasiswa` varchar(20) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jurusan` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `telepon` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id_mahasiswa`, `nama`, `jurusan`, `alamat`, `telepon`) VALUES
('231011402559', 'Rayyan Muhammad Arraffi', 'Teknik Informatika', 'Jl. Tarumanegara', '0832789748'),
('231011402659', 'Ariel Prama Yudha', 'Teknik Informatika', 'Jl. Matahari', '083642876'),
('231011406738', 'Muhammad Al Algadafi', 'Teknik Informatika', 'Jl. Bulan', '0855675667');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_mahasiswa`);
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"uas_rayyan\",\"table\":\"transaksi\"},{\"db\":\"kos\",\"table\":\"penghuni\"},{\"db\":\"kos\",\"table\":\"pembayaran\"},{\"db\":\"kos\",\"table\":\"kamar\"},{\"db\":\"kos\",\"table\":\"admin\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2026-11-11 12:39:26', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `sekolah`
--
CREATE DATABASE IF NOT EXISTS `sekolah` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sekolah`;

-- --------------------------------------------------------

--
-- Table structure for table `nilai_mahasiswa`
--

CREATE TABLE `nilai_mahasiswa` (
  `nim` varchar(20) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `nilai` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `uas_rayyan`
--
CREATE DATABASE IF NOT EXISTS `uas_rayyan` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `uas_rayyan`;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `kode_customer` varchar(10) NOT NULL,
  `nama_customer` varchar(100) NOT NULL,
  `alamat` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` varchar(10) NOT NULL,
  `kode_customer` varchar(10) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jenis_layanan` enum('Service','Maintenance') DEFAULT NULL,
  `jumlah_unit` int(11) DEFAULT NULL,
  `jenis_perangkat` enum('PC','Laptop','Printer') DEFAULT NULL,
  `mainboard` tinyint(1) DEFAULT 0,
  `ram` tinyint(1) DEFAULT 0,
  `keyboard_mouse` tinyint(1) DEFAULT 0,
  `monitor` tinyint(1) DEFAULT 0,
  `fan_processor` tinyint(1) DEFAULT 0,
  `biaya_transport` int(11) DEFAULT NULL,
  `biaya_kerusakan` int(11) DEFAULT NULL,
  `biaya_jasa` int(11) DEFAULT NULL,
  `total_biaya` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`kode_customer`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `kode_customer` (`kode_customer`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`kode_customer`) REFERENCES `customer` (`kode_customer`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
