-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 15, 2023 at 05:22 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rotiku`
--

-- --------------------------------------------------------

--
-- Table structure for table `bayar`
--

CREATE TABLE `bayar` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stok` bigint(20) NOT NULL,
  `total_bayar` int(11) NOT NULL,
  `id_roti` bigint(20) UNSIGNED NOT NULL,
  `alamat` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bayar`
--

INSERT INTO `bayar` (`id`, `stok`, `total_bayar`, `id_roti`, `alamat`, `created_at`, `updated_at`) VALUES
(1, 4, 60000, 16, 'bissmillah jadi', '2023-05-30 06:56:25', '2023-05-30 06:56:25'),
(2, 3, 93000, 14, 'Soni 12 rpl 2', '2023-05-30 07:02:05', '2023-05-30 07:02:05'),
(6, 1, 26000, 20, 'Soni XI Rpl 2', '2023-06-09 03:10:17', '2023-06-09 03:10:17');

--
-- Triggers `bayar`
--
DELIMITER $$
CREATE TRIGGER `update_stok` AFTER INSERT ON `bayar` FOR EACH ROW BEGIN
    UPDATE roti SET stok = stok - NEW.stok WHERE id_roti = NEW.id_roti;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `carousel`
--

CREATE TABLE `carousel` (
  `id_carousel` bigint(20) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carousel`
--

INSERT INTO `carousel` (`id_carousel`, `title`, `description`, `created_at`, `updated_at`) VALUES
(5, 'Molenpan', 'baoncikadap', '2023-05-19 02:31:51', '2023-05-19 02:31:51');

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
-- Table structure for table `help`
--

CREATE TABLE `help` (
  `id_help` bigint(20) UNSIGNED NOT NULL,
  `subtitle` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jumlah`
--

CREATE TABLE `jumlah` (
  `id_jumlah` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `foto` varchar(225) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` bigint(20) UNSIGNED NOT NULL,
  `kategori` varchar(255) NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `kategori`, `gambar`, `created_at`, `updated_at`) VALUES
(2, 'Bagel', '1686841026.png', '2023-05-16 08:59:48', '2023-06-15 08:15:30'),
(4, 'Roti manis', '1686841054.png', '2023-05-16 09:00:06', '2023-06-15 07:57:34'),
(22, 'Roti Tawar', '1686841065.png', '2023-05-16 21:20:03', '2023-06-15 07:57:45'),
(25, 'Pastry', '1686841123.png', '2023-05-18 07:51:33', '2023-06-15 07:58:43'),
(26, 'Bolu bule', '1686841139.png', '2023-05-29 21:01:59', '2023-06-15 07:58:59'),
(27, 'Roti Susu Keju', '1686841155.png', '2023-06-12 09:45:07', '2023-06-15 07:59:15'),
(28, 'Roti Coklat Di Coklatin', '1686841172.png', '2023-06-12 09:45:27', '2023-06-15 07:59:32'),
(29, 'sandwich', '1686841193.png', '2023-06-12 09:47:25', '2023-06-15 08:13:54'),
(30, 'Berger Double', '1686841210.png', '2023-06-12 09:48:02', '2023-06-15 08:16:51'),
(32, 'Roti Kopi Hangat', '1686841566.png', '2023-06-15 08:06:06', '2023-06-15 08:16:26');

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2023_05_10_044939_create_rotis_table', 1),
(5, '2023_05_10_063354_create_kategoris_table', 1),
(6, '2023_05_10_073504_add_relation_id_kategori', 1),
(7, '2023_05_10_080317_add_role_to_table_user', 1),
(8, '2023_05_17_121546_create_table_carousel', 2),
(9, '2023_05_17_121848_create_table_promosi', 2),
(10, '2023_05_17_122016_create_table_quotes', 2),
(11, '2023_05_17_122259_create_table_jumlah', 2),
(12, '2023_05_18_012408_create_table_help', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `promosi`
--

CREATE TABLE `promosi` (
  `id_promosi` bigint(20) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `subtitle` text NOT NULL,
  `description` text NOT NULL,
  `foto` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `promosi`
--

INSERT INTO `promosi` (`id_promosi`, `title`, `subtitle`, `description`, `foto`, `created_at`, `updated_at`) VALUES
(1, 'Molenpan', 'Molen mang dudung', 'baoncikadap', '1684488566.jpg', '2023-05-19 01:43:30', '2023-05-19 02:29:26');

-- --------------------------------------------------------

--
-- Table structure for table `quotes`
--

CREATE TABLE `quotes` (
  `id_quotes` bigint(20) UNSIGNED NOT NULL,
  `title_quotes` text NOT NULL,
  `quotes` text NOT NULL,
  `text_by` text NOT NULL,
  `foto` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roti`
--

CREATE TABLE `roti` (
  `id_roti` bigint(20) UNSIGNED NOT NULL,
  `roti` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `id_kategori` bigint(20) UNSIGNED NOT NULL,
  `gambar` varchar(255) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roti`
--

INSERT INTO `roti` (`id_roti`, `roti`, `description`, `id_kategori`, `gambar`, `harga`, `stok`, `created_at`, `updated_at`) VALUES
(14, 'Avocado Bagel Toastt', 'This bagel sandwich also completely customizable. Add in any other ingredients that you have on hand. Some of my favourites to use are smoked salmon, red onions, tomatoes and cucumbers.', 2, '1684737867.jpg', 31000, 10, '2023-05-21 23:44:27', '2023-05-25 07:56:59'),
(15, 'Roti Bolillo / Pan blanco', 'Roti ini berasal dari daerah Meksiko memiliki kulit yang keras dan biasanya dibelah untuk dipergunakan sebagai dasar dari sandwich.', 22, '1684821447.jpg', 50000, 31, '2023-05-22 22:57:27', '2023-05-22 22:57:27'),
(16, 'Breadsticks / Grissini', 'Roti renyah ini banyak di sajikan di restoran Italia sebagai snack pembuka, sehingga tamu yang datang menunggu makanan tidak bosan tapi juga tidak kekenyangan. Roti ini selain di sajikan polos, juga diberi aneka rasa seperti wijen, bawang, atau rempah dedaunan.', 4, '1684821553.jpg', 15000, 15, '2023-05-22 22:59:13', '2023-05-22 22:59:13'),
(17, 'Roti Brioche', 'Roti ini memiliki tekstur empuk dan rasa yang kaya serta sedikit manis. Dibuat dari telur, mentega, ragi, tepung, dan terkadang ditambahkan juga buah kering atau kacang-kacangan.', 4, '1684821865.jpg', 1000000, 15, '2023-05-22 23:04:25', '2023-05-22 23:04:25'),
(18, 'Roti Challah', 'Roti ini memiliki tekstur empuk dan rasa yang kaya serta sedikit manis. Dibuat dari telur, mentega, ragi, tepung, dan terkadang ditambahkan juga buah kering atau kacang-kacangan.', 4, '1684821969.jpg', 1500000, 12, '2023-05-22 23:06:09', '2023-05-22 23:06:09'),
(19, 'Roti Bakar Varian Coklat', 'Roti bakar mantap anjir ah siah mantap men', 4, '1684889220.PNG', 25000, 9, '2023-05-23 17:47:01', '2023-05-23 17:47:01'),
(20, 'Roti Bakar Varian Buah', 'Roti bakar varian buah dengan kelemutan rotinya dan kepadatan rotinya akan menambah sensasi kenyang ketika di makan dan akan terdapat beberapa rasa ketika di kunyah seperti asam manis dan gurih', 4, '1684889489.PNG', 26000, 1, '2023-05-23 17:51:29', '2023-05-23 17:51:29');

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
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `role`) VALUES
(4, 'prasetyanto', 'prasetyantotp@gmail.com', NULL, '$2y$10$KgAH7fBu5SSODJCO6DZYReJiHnCjVZVk22/TzKyLYM0xEp.miKKoe', NULL, '2023-05-24 21:47:58', '2023-05-24 21:47:58', 'admin'),
(6, 'Bowo Gaming', 'ihot849@gmail.com', NULL, '$2y$10$j9ajegXjf8UP6iVmuX0TauLQ2iT5TkN37mHXb.zaWZlz1ErlRGvzq', NULL, '2023-05-27 01:40:41', '2023-05-27 01:40:41', 'user'),
(7, 'Power Bet', 'powerbet31@gmail.com', NULL, '$2y$10$PpxOg..QXVVx07ufutUPc.kSlWSOiIHwYSXYbY21ordfjIVnW9PyW', NULL, '2023-05-27 06:37:34', '2023-05-27 06:37:34', 'user'),
(16, 'Sony Sudrajat', 'sonysudrajat94@gmail.com', NULL, '$2y$10$6qxY5ufaeYve/gHpeXTv..8bnzrcKCUEP3ZYcCqns/gis7zb2C3aa', NULL, '2023-06-11 05:00:18', '2023-06-11 05:00:18', 'user'),
(17, 'soo', 'sonysudrajat97@gmail.com', NULL, '$2y$10$SwpYjBxAZJGxt.r.Y/8i3eBEzzwRSc5cnaiy/DlZljawFUq0PMnPO', NULL, '2023-06-11 05:14:38', '2023-06-11 05:14:38', 'user'),
(18, 'asd', 'asd@gmail.com', NULL, '$2y$10$ufkDWeDNdpoBB8EBvafYc.0jh4Rym2CEAvoJUhq/k6clNnD44vBMa', NULL, '2023-06-11 05:33:43', '2023-06-11 05:33:43', 'user'),
(20, 'caff', 'caff@gmail.com', NULL, '$2y$10$e4Q.CCGFlLhhHD4Z1mAPl.EGkTlc5P6o23zLVU3ukuPT9K/cDJc/C', NULL, '2023-06-12 08:01:41', '2023-06-12 08:01:41', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bayar`
--
ALTER TABLE `bayar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_roti` (`id_roti`);

--
-- Indexes for table `carousel`
--
ALTER TABLE `carousel`
  ADD PRIMARY KEY (`id_carousel`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `help`
--
ALTER TABLE `help`
  ADD PRIMARY KEY (`id_help`);

--
-- Indexes for table `jumlah`
--
ALTER TABLE `jumlah`
  ADD PRIMARY KEY (`id_jumlah`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `promosi`
--
ALTER TABLE `promosi`
  ADD PRIMARY KEY (`id_promosi`);

--
-- Indexes for table `quotes`
--
ALTER TABLE `quotes`
  ADD PRIMARY KEY (`id_quotes`);

--
-- Indexes for table `roti`
--
ALTER TABLE `roti`
  ADD PRIMARY KEY (`id_roti`),
  ADD KEY `roti_id_kategori_foreign` (`id_kategori`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bayar`
--
ALTER TABLE `bayar`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `carousel`
--
ALTER TABLE `carousel`
  MODIFY `id_carousel` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `help`
--
ALTER TABLE `help`
  MODIFY `id_help` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jumlah`
--
ALTER TABLE `jumlah`
  MODIFY `id_jumlah` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `promosi`
--
ALTER TABLE `promosi`
  MODIFY `id_promosi` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `quotes`
--
ALTER TABLE `quotes`
  MODIFY `id_quotes` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roti`
--
ALTER TABLE `roti`
  MODIFY `id_roti` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bayar`
--
ALTER TABLE `bayar`
  ADD CONSTRAINT `bayar_ibfk_1` FOREIGN KEY (`id_roti`) REFERENCES `roti` (`id_roti`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `roti`
--
ALTER TABLE `roti`
  ADD CONSTRAINT `roti_id_kategori_foreign` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
