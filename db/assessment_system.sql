-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Jan 2025 pada 09.04
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `assessment_system`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `activity` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `user_id`, `activity`, `timestamp`) VALUES
(1, 1, 'Login ke sistem', '2025-01-05 21:26:23'),
(2, 1, 'Login ke sistem', '2025-01-05 21:36:37'),
(3, 1, 'Login ke sistem', '2025-01-05 21:36:48'),
(4, 1, 'Logout dari sistem', '2025-01-05 21:39:16'),
(5, 1, 'Login ke sistem', '2025-01-05 21:39:20'),
(6, 1, 'Logout dari sistem', '2025-01-05 21:39:51'),
(13, 1, 'Login ke sistem', '2025-01-05 21:56:30'),
(15, 1, 'Menyimpan mapping versi: 1', '2025-01-05 22:03:30'),
(16, 1, 'Menyimpan mapping versi: 1', '2025-01-05 22:05:03'),
(17, 1, 'Menyimpan mapping versi: 1', '2025-01-05 22:06:12'),
(18, 1, 'Menyimpan mapping versi: 1', '2025-01-05 22:07:58'),
(19, 1, 'Menyimpan mapping versi: 1', '2025-01-05 22:10:27'),
(20, 1, 'Menyimpan mapping versi: 1', '2025-01-05 22:12:47'),
(21, 1, 'Menyimpan mapping versi: 1', '2025-01-05 22:13:34'),
(22, 1, 'Menyimpan mapping versi: 1', '2025-01-05 22:15:05'),
(23, 1, 'Menyimpan mapping versi: 1', '2025-01-05 22:16:37'),
(24, 1, 'Menyimpan mapping versi: 1', '2025-01-05 22:27:08'),
(25, 1, 'Menyimpan mapping versi: 1', '2025-01-05 22:27:57'),
(26, 1, 'Menyimpan mapping versi: 1', '2025-01-05 22:28:48'),
(27, 1, 'Menyimpan mapping versi: 1', '2025-01-05 22:30:00'),
(28, 1, 'Menyimpan mapping versi: 1', '2025-01-05 22:32:13'),
(29, 1, 'Menyimpan mapping versi: 1', '2025-01-05 22:32:45'),
(30, 1, 'Menyimpan mapping versi: 1', '2025-01-05 22:33:54'),
(31, 1, 'Menyimpan mapping versi: 1', '2025-01-05 22:34:54'),
(32, 1, 'Menyimpan mapping versi: 1', '2025-01-05 22:35:32'),
(33, 1, 'Menyimpan mapping versi: 1', '2025-01-05 22:36:04'),
(34, 1, 'Menyimpan mapping versi: 1', '2025-01-05 22:40:09'),
(35, 1, 'Menyimpan mapping versi: 1', '2025-01-05 22:43:02'),
(36, 1, 'Menyimpan mapping versi: 1', '2025-01-05 22:43:28'),
(37, 1, 'Menyimpan mapping versi: 1', '2025-01-05 22:44:14'),
(38, 1, 'Login ke sistem', '2025-01-06 01:52:57'),
(39, 1, 'Logout dari sistem', '2025-01-06 06:37:46'),
(41, 1, 'Login ke sistem', '2025-01-07 12:50:34'),
(42, 1, 'Logout dari sistem', '2025-01-07 12:52:38'),
(43, 1, 'Login ke sistem', '2025-01-07 12:52:57'),
(44, 1, 'Logout dari sistem', '2025-01-07 14:22:30'),
(46, 1, 'Login ke sistem', '2025-01-07 14:23:20'),
(52, 1, 'Login ke sistem', '2025-01-07 15:54:50'),
(53, 1, 'Logout dari sistem', '2025-01-07 16:04:49'),
(54, 1, 'Login ke sistem', '2025-01-07 16:05:16'),
(55, 1, 'Logout dari sistem', '2025-01-07 16:34:20'),
(56, 1, 'Login ke sistem', '2025-01-07 16:36:43'),
(57, 1, 'Logout dari sistem', '2025-01-07 16:36:53'),
(58, 1, 'Login ke sistem', '2025-01-07 16:38:00'),
(59, 1, 'Logout dari sistem', '2025-01-07 16:38:09'),
(60, 6, 'Login ke sistem', '2025-01-07 16:39:00'),
(61, 6, 'Logout dari sistem', '2025-01-07 16:39:05'),
(62, 1, 'Login ke sistem', '2025-01-07 16:39:33'),
(63, 1, 'Logout dari sistem', '2025-01-07 17:09:15'),
(64, 1, 'Login ke sistem', '2025-01-07 17:56:37'),
(65, 1, 'Logout dari sistem', '2025-01-07 17:56:45'),
(66, 6, 'Login ke sistem', '2025-01-07 17:59:31'),
(67, 1, 'Login ke sistem', '2025-01-07 18:34:43'),
(68, 6, 'Logout dari sistem', '2025-01-08 03:13:47'),
(69, 8, 'Login ke sistem', '2025-01-08 03:14:00'),
(70, 8, 'Logout dari sistem', '2025-01-08 03:20:28'),
(71, 6, 'Login ke sistem', '2025-01-08 03:20:43'),
(72, 6, 'Logout dari sistem', '2025-01-08 03:40:54'),
(73, 1, 'Login ke sistem', '2025-01-08 03:41:40'),
(74, 1, 'Logout dari sistem', '2025-01-08 05:05:50'),
(75, 6, 'Login ke sistem', '2025-01-08 05:06:01'),
(76, 1, 'Login ke sistem', '2025-01-08 05:09:28'),
(77, 1, 'Logout dari sistem', '2025-01-08 05:13:25'),
(78, 6, 'Login ke sistem', '2025-01-08 05:13:39'),
(79, 6, 'Logout dari sistem', '2025-01-08 10:04:44'),
(80, 8, 'Login ke sistem', '2025-01-08 10:04:53'),
(81, 8, 'Logout dari sistem', '2025-01-08 11:51:22'),
(82, 8, 'Login ke sistem', '2025-01-08 11:51:49'),
(83, 8, 'Logout dari sistem', '2025-01-08 12:36:55'),
(84, 6, 'Login ke sistem', '2025-01-08 12:37:03'),
(85, 6, 'Logout dari sistem', '2025-01-08 12:53:37'),
(86, 8, 'Login ke sistem', '2025-01-08 12:53:41'),
(87, 1, 'Logout dari sistem', '2025-01-08 13:08:30'),
(88, 8, 'Login ke sistem', '2025-01-08 13:08:38'),
(89, 8, 'Logout dari sistem', '2025-01-08 13:08:48'),
(90, 6, 'Login ke sistem', '2025-01-08 13:08:59'),
(91, 8, 'Logout dari sistem', '2025-01-08 17:57:55'),
(92, 1, 'Login ke sistem', '2025-01-08 17:58:00'),
(93, 1, 'Logout dari sistem', '2025-01-08 18:00:59'),
(94, 6, 'Login ke sistem', '2025-01-08 18:01:11'),
(95, 6, 'Logout dari sistem', '2025-01-08 18:04:35'),
(96, 1, 'Login ke sistem', '2025-01-08 18:04:41'),
(97, 1, 'Logout dari sistem', '2025-01-08 18:46:33'),
(98, 8, 'Login ke sistem', '2025-01-08 18:46:41'),
(99, 1, 'Login ke sistem', '2025-01-08 19:34:05'),
(100, 1, 'Logout dari sistem', '2025-01-08 19:34:28'),
(101, 8, 'Login ke sistem', '2025-01-08 19:34:33'),
(102, 8, 'Logout dari sistem', '2025-01-08 19:34:43'),
(103, 6, 'Login ke sistem', '2025-01-08 19:34:54'),
(104, 6, 'Logout dari sistem', '2025-01-08 19:35:30'),
(105, 8, 'Login ke sistem', '2025-01-08 19:35:33'),
(106, 6, 'Logout dari sistem', '2025-01-09 14:49:26'),
(107, 1, 'Login ke sistem', '2025-01-09 14:49:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `assessment_answers`
--

CREATE TABLE `assessment_answers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `kode_audit` varchar(50) NOT NULL,
  `jawaban` text,
  `skor` int(11) DEFAULT NULL,
  `bukti` varchar(255) DEFAULT NULL,
  `status` enum('draft','submitted') DEFAULT 'draft',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `source` varchar(50) DEFAULT NULL,
  `periode_audit` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `assessment_answers`
--

INSERT INTO `assessment_answers` (`id`, `user_id`, `question_id`, `kode_audit`, `jawaban`, `skor`, `bukti`, `status`, `created_at`, `source`, `periode_audit`) VALUES
(248, 6, 38, '', 'Belum Ada, masih di inisiasikan', NULL, '', 'submitted', '2025-01-09 07:24:32', NULL, 0000),
(249, 6, 39, '', 'Belum Ada, masih di inisiasikan', NULL, '', 'submitted', '2025-01-09 07:24:32', NULL, 0000),
(250, 6, 40, '', 'Sudah Ada, dan terdokumentasikan', NULL, '', 'submitted', '2025-01-09 07:24:32', NULL, 0000),
(251, 6, 41, '', 'Belum Ada, masih di inisiasikan', NULL, '', 'submitted', '2025-01-09 07:24:32', NULL, 0000),
(252, 6, 42, '', 'Belum Terfikirkan', NULL, '', 'submitted', '2025-01-09 07:24:32', NULL, 0000),
(253, 6, 43, '', 'Belum Terfikirkan', NULL, '', 'submitted', '2025-01-09 07:24:32', NULL, 0000),
(254, 6, 44, '', 'Sudah Ada, dan terdokumentasikan', NULL, '', 'submitted', '2025-01-09 07:24:32', NULL, 0000),
(255, 6, 45, '', 'Belum Ada, masih di inisiasikan', NULL, '', 'submitted', '2025-01-09 07:24:32', NULL, 0000),
(256, 6, 46, '', 'Sudah Ada, tanpa dokumentasi', NULL, '', 'submitted', '2025-01-09 07:24:32', NULL, 0000),
(257, 6, 47, '', 'Sudah Ada, tanpa dokumentasi', NULL, '', 'submitted', '2025-01-09 07:24:33', NULL, 0000),
(258, 6, 48, '', 'Belum Ada, masih di inisiasikan', NULL, '', 'submitted', '2025-01-09 07:24:33', NULL, 0000),
(259, 6, 49, '', 'Belum Ada, masih di inisiasikan', NULL, '', 'submitted', '2025-01-09 07:24:33', NULL, 0000),
(260, 6, 50, '', 'Sudah Ada, tanpa dokumentasi', NULL, '', 'submitted', '2025-01-09 07:24:33', NULL, 0000),
(261, 6, 52, '', 'Belum Ada, masih di inisiasikan', NULL, '', 'submitted', '2025-01-09 07:24:33', NULL, 0000),
(262, 6, 53, '', 'Belum Ada, masih di inisiasikan', NULL, '', 'submitted', '2025-01-09 07:24:33', NULL, 0000),
(263, 6, 54, '', 'Sudah Ada, terdokumentasi dan termonitoring', NULL, '', 'submitted', '2025-01-09 07:24:33', NULL, 0000),
(264, 6, 55, '', 'Belum Ada, masih di inisiasikan', NULL, '', 'submitted', '2025-01-09 07:24:33', NULL, 0000),
(265, 6, 56, '', 'Belum Ada, masih di inisiasikan', NULL, '', 'submitted', '2025-01-09 07:24:33', NULL, 0000),
(266, 6, 57, '', 'Sudah Ada, terdokumentasi dan termonitoring', NULL, '', 'submitted', '2025-01-09 07:24:33', NULL, 0000),
(267, 6, 38, '', 'Belum Ada, masih di inisiasikan', NULL, '', 'submitted', '2025-01-09 07:37:12', NULL, 0000),
(268, 6, 39, '', 'Belum Ada, masih di inisiasikan', NULL, '', 'submitted', '2025-01-09 07:37:12', NULL, 0000),
(269, 6, 40, '', 'Sudah Ada, tanpa dokumentasi', NULL, '', 'submitted', '2025-01-09 07:37:12', NULL, 0000),
(270, 6, 41, '', 'Belum Terfikirkan', NULL, '', 'submitted', '2025-01-09 07:37:12', NULL, 0000),
(271, 6, 42, '', 'Sudah Ada, tanpa dokumentasi', NULL, '', 'submitted', '2025-01-09 07:37:12', NULL, 0000),
(272, 6, 43, '', 'Sudah Ada, dan terdokumentasikan', NULL, '', 'submitted', '2025-01-09 07:37:12', NULL, 0000),
(273, 6, 44, '', 'Sudah Ada, dan terdokumentasikan', NULL, '', 'submitted', '2025-01-09 07:37:12', NULL, 0000),
(274, 6, 45, '', 'Belum Terfikirkan', NULL, '', 'submitted', '2025-01-09 07:37:12', NULL, 0000),
(275, 6, 46, '', 'Sudah Ada, dan terdokumentasikan', NULL, '', 'submitted', '2025-01-09 07:37:12', NULL, 0000),
(276, 6, 47, '', 'Sudah Ada, tanpa dokumentasi', NULL, '', 'submitted', '2025-01-09 07:37:12', NULL, 0000),
(277, 6, 48, '', 'Sudah Ada, tanpa dokumentasi', NULL, '', 'submitted', '2025-01-09 07:37:12', NULL, 0000),
(278, 6, 49, '', 'Sudah Ada, tanpa dokumentasi', NULL, '', 'submitted', '2025-01-09 07:37:12', NULL, 0000),
(279, 6, 50, '', 'Belum Ada, masih di inisiasikan', NULL, '', 'submitted', '2025-01-09 07:37:12', NULL, 0000),
(280, 6, 52, '', 'Belum Ada, masih di inisiasikan', NULL, '', 'submitted', '2025-01-09 07:37:12', NULL, 0000),
(281, 6, 53, '', 'Belum Ada, masih di inisiasikan', NULL, '', 'submitted', '2025-01-09 07:37:12', NULL, 0000),
(282, 6, 54, '', 'Sudah Ada, tanpa dokumentasi', NULL, '', 'submitted', '2025-01-09 07:37:12', NULL, 0000),
(283, 6, 55, '', 'Belum Ada, masih di inisiasikan', NULL, '', 'submitted', '2025-01-09 07:37:12', NULL, 0000),
(284, 6, 56, '', 'Belum Terfikirkan', NULL, '', 'submitted', '2025-01-09 07:37:12', NULL, 0000),
(285, 6, 57, '', 'Sudah Ada, dan terdokumentasikan', NULL, '', 'submitted', '2025-01-09 07:37:12', NULL, 0000),
(286, 6, 38, '', 'Belum Terfikirkan', NULL, '', 'submitted', '2025-01-09 08:41:57', NULL, 0000),
(287, 6, 39, '', 'Belum Ada, masih di inisiasikan', NULL, '', 'submitted', '2025-01-09 08:41:57', NULL, 0000),
(288, 6, 40, '', 'Belum Terfikirkan', NULL, '', 'submitted', '2025-01-09 08:41:57', NULL, 0000),
(289, 6, 41, '', 'Sudah Ada, tanpa dokumentasi', NULL, '', 'submitted', '2025-01-09 08:41:57', NULL, 0000),
(290, 6, 42, '', 'Belum Terfikirkan', NULL, '', 'submitted', '2025-01-09 08:41:57', NULL, 0000),
(291, 6, 43, '', 'Belum Terfikirkan', NULL, '', 'submitted', '2025-01-09 08:41:57', NULL, 0000),
(292, 6, 44, '', 'Sudah Ada, dan terdokumentasikan', NULL, '', 'submitted', '2025-01-09 08:41:57', NULL, 0000),
(293, 6, 45, '', 'Belum Ada, masih di inisiasikan', NULL, '', 'submitted', '2025-01-09 08:41:57', NULL, 0000),
(294, 6, 46, '', 'Belum Ada, masih di inisiasikan', NULL, '', 'submitted', '2025-01-09 08:41:57', NULL, 0000),
(295, 6, 47, '', 'Belum Terfikirkan', NULL, '', 'submitted', '2025-01-09 08:41:57', NULL, 0000),
(296, 6, 48, '', 'Belum Ada, masih di inisiasikan', NULL, '', 'submitted', '2025-01-09 08:41:57', NULL, 0000),
(297, 6, 49, '', 'Sudah Ada, dan terdokumentasikan', NULL, '', 'submitted', '2025-01-09 08:41:57', NULL, 0000),
(298, 6, 50, '', 'Sudah Ada, tanpa dokumentasi', NULL, '', 'submitted', '2025-01-09 08:41:57', NULL, 0000),
(299, 6, 52, '', 'Belum Ada, masih di inisiasikan', NULL, '', 'submitted', '2025-01-09 08:41:57', NULL, 0000),
(300, 6, 53, '', 'Belum Ada, masih di inisiasikan', NULL, '', 'submitted', '2025-01-09 08:41:57', NULL, 0000),
(301, 6, 54, '', 'Belum Ada, masih di inisiasikan', NULL, '', 'submitted', '2025-01-09 08:41:57', NULL, 0000),
(302, 6, 55, '', 'Belum Terfikirkan', NULL, '', 'submitted', '2025-01-09 08:41:57', NULL, 0000),
(303, 6, 56, '', 'Sudah Ada, terdokumentasi dan termonitoring', NULL, '', 'submitted', '2025-01-09 08:41:57', NULL, 0000),
(304, 6, 57, '', 'Sudah Ada, terdokumentasi dan termonitoring', NULL, '', 'submitted', '2025-01-09 08:41:57', NULL, 0000),
(305, 6, 38, 'AUDIT-677F9E616A8B8', 'Belum Terfikirkan', NULL, '', 'submitted', '2025-01-09 14:39:15', NULL, 0000),
(306, 6, 39, 'AUDIT-677F9E616A8B8', 'Belum Terfikirkan', NULL, '', 'submitted', '2025-01-09 14:39:15', NULL, 0000),
(307, 6, 40, 'AUDIT-677F9E616A8B8', 'Belum Ada, masih di inisiasikan', NULL, '', 'submitted', '2025-01-09 14:39:15', NULL, 0000),
(308, 6, 41, 'AUDIT-677F9E616A8B8', 'Belum Ada, masih di inisiasikan', NULL, '', 'submitted', '2025-01-09 14:39:15', NULL, 0000),
(309, 6, 42, 'AUDIT-677F9E616A8B8', 'Belum Terfikirkan', NULL, '', 'submitted', '2025-01-09 14:39:15', NULL, 0000),
(310, 6, 43, 'AUDIT-677F9E616A8B8', 'Belum Terfikirkan', NULL, '', 'submitted', '2025-01-09 14:39:15', NULL, 0000),
(311, 6, 44, 'AUDIT-677F9E616A8B8', 'Sudah Ada, dan sudah Optimal', NULL, '', 'submitted', '2025-01-09 14:39:15', NULL, 0000),
(312, 6, 45, 'AUDIT-677F9E616A8B8', 'Belum Terfikirkan', NULL, '', 'submitted', '2025-01-09 14:39:15', NULL, 0000),
(313, 6, 46, 'AUDIT-677F9E616A8B8', 'Belum Ada, masih di inisiasikan', NULL, '', 'submitted', '2025-01-09 14:39:15', NULL, 0000),
(314, 6, 47, 'AUDIT-677F9E616A8B8', 'Sudah Ada, tanpa dokumentasi', NULL, '', 'submitted', '2025-01-09 14:39:15', NULL, 0000),
(315, 6, 48, 'AUDIT-677F9E616A8B8', 'Belum Ada, masih di inisiasikan', NULL, '', 'submitted', '2025-01-09 14:39:15', NULL, 0000),
(316, 6, 49, 'AUDIT-677F9E616A8B8', 'Belum Terfikirkan', NULL, '', 'submitted', '2025-01-09 14:39:15', NULL, 0000),
(317, 6, 50, 'AUDIT-677F9E616A8B8', 'Sudah Ada, tanpa dokumentasi', NULL, '', 'submitted', '2025-01-09 14:39:15', NULL, 0000),
(318, 6, 52, 'AUDIT-677F9E616A8B8', 'Belum Terfikirkan', NULL, '', 'submitted', '2025-01-09 14:39:15', NULL, 0000),
(319, 6, 53, 'AUDIT-677F9E616A8B8', 'Belum Ada, masih di inisiasikan', NULL, '', 'submitted', '2025-01-09 14:39:15', NULL, 0000),
(320, 6, 54, 'AUDIT-677F9E616A8B8', 'Belum Terfikirkan', NULL, '', 'submitted', '2025-01-09 14:39:15', NULL, 0000),
(321, 6, 55, 'AUDIT-677F9E616A8B8', 'Belum Ada, masih di inisiasikan', NULL, '', 'submitted', '2025-01-09 14:39:15', NULL, 0000),
(322, 6, 56, 'AUDIT-677F9E616A8B8', 'Sudah Ada, terdokumentasi dan termonitoring', NULL, '', 'submitted', '2025-01-09 14:39:15', NULL, 0000),
(323, 6, 57, 'AUDIT-677F9E616A8B8', 'Sudah Ada, terdokumentasi dan termonitoring', NULL, '', 'submitted', '2025-01-09 14:39:15', NULL, 0000),
(324, 6, 38, 'AUDIT-677F9E616A8B8', 'Sudah Ada, tanpa dokumentasi', NULL, '', '', '2025-01-09 14:40:44', NULL, 0000),
(325, 6, 39, 'AUDIT-677F9E616A8B8', 'Sudah Ada, tanpa dokumentasi', NULL, '', '', '2025-01-09 14:40:44', NULL, 0000),
(326, 6, 40, 'AUDIT-677F9E616A8B8', 'Belum Ada, masih di inisiasikan', NULL, '', '', '2025-01-09 14:40:44', NULL, 0000),
(327, 6, 41, 'AUDIT-677F9E616A8B8', 'Belum Terfikirkan', NULL, '', '', '2025-01-09 14:40:44', NULL, 0000),
(328, 6, 42, 'AUDIT-677F9E616A8B8', 'Belum Ada, masih di inisiasikan', NULL, '', '', '2025-01-09 14:40:44', NULL, 0000),
(329, 6, 43, 'AUDIT-677F9E616A8B8', 'Belum Ada, masih di inisiasikan', NULL, '', '', '2025-01-09 14:40:44', NULL, 0000),
(330, 6, 44, 'AUDIT-677F9E616A8B8', 'Belum Ada, masih di inisiasikan', NULL, '', '', '2025-01-09 14:40:45', NULL, 0000),
(331, 6, 45, 'AUDIT-677F9E616A8B8', 'Belum Ada, masih di inisiasikan', NULL, '', '', '2025-01-09 14:40:45', NULL, 0000),
(332, 6, 46, 'AUDIT-677F9E616A8B8', 'Belum Terfikirkan', NULL, '', '', '2025-01-09 14:40:45', NULL, 0000),
(333, 6, 47, 'AUDIT-677F9E616A8B8', 'Sudah Ada, dan terdokumentasikan', NULL, '', '', '2025-01-09 14:40:45', NULL, 0000),
(334, 6, 48, 'AUDIT-677F9E616A8B8', 'Belum Terfikirkan', NULL, '', '', '2025-01-09 14:40:45', NULL, 0000),
(335, 6, 49, 'AUDIT-677F9E616A8B8', 'Sudah Ada, terdokumentasi dan termonitoring', NULL, '', '', '2025-01-09 14:40:45', NULL, 0000),
(336, 6, 50, 'AUDIT-677F9E616A8B8', 'Sudah Ada, terdokumentasi dan termonitoring', NULL, '', '', '2025-01-09 14:40:45', NULL, 0000),
(337, 6, 52, 'AUDIT-677F9E616A8B8', 'Sudah Ada, terdokumentasi dan termonitoring', NULL, '', '', '2025-01-09 14:40:45', NULL, 0000),
(338, 6, 53, 'AUDIT-677F9E616A8B8', 'Sudah Ada, tanpa dokumentasi', NULL, '', '', '2025-01-09 14:40:45', NULL, 0000),
(339, 6, 54, 'AUDIT-677F9E616A8B8', 'Sudah Ada, terdokumentasi dan termonitoring', NULL, '', '', '2025-01-09 14:40:45', NULL, 0000),
(340, 6, 55, 'AUDIT-677F9E616A8B8', 'Sudah Ada, dan terdokumentasikan', NULL, '', '', '2025-01-09 14:40:45', NULL, 0000),
(341, 6, 56, 'AUDIT-677F9E616A8B8', 'Sudah Ada, dan terdokumentasikan', NULL, '', '', '2025-01-09 14:40:45', NULL, 0000),
(342, 6, 57, 'AUDIT-677F9E616A8B8', 'Sudah Ada, tanpa dokumentasi', NULL, '', '', '2025-01-09 14:40:45', NULL, 0000);

--
-- Trigger `assessment_answers`
--
DELIMITER $$
CREATE TRIGGER `after_assessment_answers_update` AFTER UPDATE ON `assessment_answers` FOR EACH ROW BEGIN
    IF NEW.status <> OLD.status THEN
        UPDATE eksternal_audit_question
        SET status = NEW.status
        WHERE id = NEW.question_id;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auditee`
--

CREATE TABLE `auditee` (
  `id` int(11) NOT NULL,
  `kode_audit` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `periode_audit` year(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_read` tinyint(1) DEFAULT '0',
  `form_status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `auditee`
--

INSERT INTO `auditee` (`id`, `kode_audit`, `user_id`, `periode_audit`, `created_at`, `is_read`, `form_status`) VALUES
(19, 'AUDIT-677F9E616A8B8', 6, 2025, '2025-01-09 10:01:05', 0, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `audit_history`
--

CREATE TABLE `audit_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `result` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `cobit`
--

CREATE TABLE `cobit` (
  `id` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `process_id` varchar(10) DEFAULT NULL,
  `process_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `cobit`
--

INSERT INTO `cobit` (`id`, `version`, `domain`, `process_id`, `process_name`) VALUES
(36, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI1.1', 'Definition and Maintenance of Business Functional and Technical Requirements'),
(37, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI1.2', 'Risk Analysis Report'),
(38, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI1.3', 'Feasibility Study and Formulation of Alternative Courses of Action'),
(39, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI1.4', 'Requirements and Feasibility Decision and Approval'),
(40, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI2.1', 'High-level Design'),
(41, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI2.2', 'Detailed Design'),
(42, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI2.3', 'Application Control and Auditability'),
(43, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI2.4', 'Application Security and Availability'),
(44, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI2.4', 'Application Security and Availability'),
(45, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI2.4', 'Application Security and Availability'),
(46, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI2.4', 'Application Security and Availability'),
(47, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI2.5', 'Configuration and Implementation of Acquired Application Software'),
(48, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI2.5', 'Configuration and Implementation of Acquired Application Software'),
(49, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI2.6', 'Major Upgrades to Existing Systems'),
(50, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI2.7', 'Development of Application Software'),
(51, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI2.7', 'Development of Application Software'),
(52, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI2.8', 'Software Quality Assurance'),
(53, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI2.9', 'Applications Requirements Management'),
(54, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI2.10', 'Application Software Maintenance'),
(55, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI3.1', 'Technological Infrastructure Acquisition Plan'),
(56, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI3.2', 'Infrastructure Resource Protection and Availability'),
(57, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI3.2', 'Infrastructure Resource Protection and Availability'),
(58, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI3.3', 'Infrastructure Maintenance'),
(59, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI3.4', 'Feasibility Test Environment'),
(60, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI3.4', 'Feasibility Test Environment'),
(61, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI4.1', 'Planning for Operational Solutions'),
(62, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI4.2', 'Knowledge Transfer to Business Management'),
(63, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI4.2', 'Knowledge Transfer to Business Management'),
(64, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI4.2', 'Knowledge Transfer to Business Management'),
(65, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI4.2', 'Knowledge Transfer to Business Management'),
(66, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI4.3', 'Knowledge Transfer to End Users'),
(67, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI4.3', 'Knowledge Transfer to End Users'),
(68, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI4.3', 'Knowledge Transfer to End Users'),
(69, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI4.3', 'Knowledge Transfer to End Users'),
(70, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI4.4', 'Knowledge Transfer to Operations and Support Staff'),
(71, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI4.4', 'Knowledge Transfer to Operations and Support Staff'),
(72, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI4.4', 'Knowledge Transfer to Operations and Support Staff'),
(73, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI4.4', 'Knowledge Transfer to Operations and Support Staff'),
(74, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI5.1', 'Procurement Control'),
(75, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI5.2', 'Supplier Contract Management'),
(76, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI5.2', 'Supplier Contract Management'),
(77, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI5.3', 'Supplier Selection'),
(78, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI5.4', 'IT Resources Acquisition'),
(79, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI6.1', 'Change Standards and Procedures'),
(80, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI6.1', 'Change Standards and Procedures'),
(81, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI6.1', 'Change Standards and Procedures'),
(82, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI6.1', 'Change Standards and Procedures'),
(83, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI6.2', 'Impact Assessment, Prioritisation and Authorisation'),
(84, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI6.3', 'Emergency Changes'),
(85, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI6.4', 'Change Status Tracking and Reporting'),
(86, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI6.5', 'Change Closure and Documentation'),
(87, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI7.1', 'Training'),
(88, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI7.2', 'Test Plan'),
(89, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI7.2', 'Test Plan'),
(90, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI7.3', 'Implementation Plan'),
(91, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI7.4', 'Test Environment'),
(92, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI7.5', 'System and Data Conversion'),
(93, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI7.6', 'Testing of Changes'),
(94, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI7.7', 'Final Acceptance Test'),
(95, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI7.8', 'Promotion to Production'),
(96, 'COBIT 4.1', 'Acquire and Implement (AI)', 'AI7.9', 'Post-implementation Review'),
(97, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS1.1', 'Service Level Management Framework'),
(98, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS1.2', 'Definition of Services'),
(99, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS1.3', 'Service Level Agreements'),
(100, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS1.4', 'Operating Level Agreements'),
(101, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS1.5', 'Monitoring and Reporting of Service Level Achievements'),
(102, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS1.6', 'Review of Service Level Agreements and Contracts'),
(103, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS2.1', 'Identification of All Supplier Relationships'),
(104, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS2.2', 'Supplier Relationship Management'),
(105, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS2.3', 'Supplier Risk Management'),
(106, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS2.4', 'Supplier Performance Monitoring'),
(107, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS3.1', 'Performance and Capacity Planning'),
(108, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS3.2', 'Current Performance and Capacity'),
(109, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS3.3', 'Future Performance and Capacity'),
(110, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS3.4', 'IT Resources Availability'),
(111, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS3.5', 'Monitoring and Reporting'),
(112, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS4.1', 'IT Continuity Framework'),
(113, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS4.2', 'IT Continuity Plans'),
(114, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS4.3', 'Critical IT Resources'),
(115, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS4.4', 'Maintenance of the IT Continuity Plan'),
(116, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS4.5', 'Testing of the IT Continuity Plan'),
(117, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS4.6', 'IT Continuity Plan Training'),
(118, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS4.7', 'Distribution of the IT Continuity Plan'),
(119, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS4.8', 'IT Services Recovery and Resumption'),
(120, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS4.9', 'Offsite Backup Storage'),
(121, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS4.10', 'Post-resumption Review'),
(122, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS5.1', 'Management of IT Security'),
(123, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS5.2', 'IT Security Plan'),
(124, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS5.3', 'Identity Management'),
(125, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS5.4', 'User Account Management'),
(126, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS5.5', 'Security Testing, Surveillance and Monitoring'),
(127, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS5.6', 'Security Incident Definition'),
(128, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS5.7', 'Protection of Security Technology'),
(129, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS5.8', 'Cryptographic Key Management'),
(130, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS5.9', 'Malicious Software Prevention, Detection and Correction'),
(131, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS5.10', 'Network Security'),
(132, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS5.11', 'Exchange of Sensitive Data'),
(133, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS6.1', 'Definition of Services'),
(134, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS6.2', 'IT Accounting'),
(135, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS6.3', 'Cost Modelling and Charging'),
(136, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS6.4', 'Cost Model Maintenance'),
(137, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS7.1', 'Identification of Education and Training Needs'),
(138, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS7.2', 'Delivery of Training and Education'),
(139, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS7.3', 'Evaluation of Training Received'),
(140, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS8.1', 'Service Desk'),
(141, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS8.2', 'Registration of Customer Queries'),
(142, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS8.3', 'Incident Escalation'),
(143, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS8.4', 'Incident Closure'),
(144, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS8.5', 'Reporting and Trend Analysis'),
(145, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS9.1', 'Configuration Repository and Baseline'),
(146, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS9.2', 'Identification and Maintenance of Configuration Items'),
(147, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS9.3', 'Configuration Integrity Review'),
(148, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS10.1', 'Identification and Classification of Problems'),
(149, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS10.2', 'Problem Tracking and Resolution'),
(150, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS10.3', 'Problem Closure'),
(151, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS10.4', 'Integration of Configuration, Incident and Problem Management'),
(152, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS11.1', 'Business Requirements for Data Management'),
(153, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS11.2', 'Storage and Retention Arrangements'),
(154, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS11.3', 'Media Library Management System'),
(155, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS11.4', 'Disposal'),
(156, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS11.5', 'Backup and Restoration'),
(157, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS11.6', 'Security Requirements for Data Management'),
(158, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS12.1', 'Site Selection and Layout'),
(159, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS12.2', 'Physical Security Measures'),
(160, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS12.3', 'Physical Access'),
(161, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS12.4', 'Protection Against Environmental Factors'),
(162, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS12.5', 'Physical Facilities Management'),
(163, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS13.1', 'Operations Procedures and Instructions'),
(164, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS13.2', 'Job Scheduling'),
(165, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS13.3', 'IT Infrastructure Monitoring'),
(166, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS13.4', 'Sensitive Documents and Output Devices'),
(167, 'COBIT 4.1', 'Deliver and Support (DS)', 'DS13.5', 'Preventive Maintenance for Hardware'),
(168, 'COBIT 4.1', 'Monitor and Evaluate (ME)', 'ME1.1', 'Monitoring Approach'),
(169, 'COBIT 4.1', 'Monitor and Evaluate (ME)', 'ME1.2', 'Definition and Collection of Monitoring Data'),
(170, 'COBIT 4.1', 'Monitor and Evaluate (ME)', 'ME1.3', 'Monitoring Method'),
(171, 'COBIT 4.1', 'Monitor and Evaluate (ME)', 'ME1.4', 'Performance Assessment'),
(172, 'COBIT 4.1', 'Monitor and Evaluate (ME)', 'ME1.5', 'Board and Executive Reporting'),
(173, 'COBIT 4.1', 'Monitor and Evaluate (ME)', 'ME1.6', 'Remedial Actions'),
(174, 'COBIT 4.1', 'Monitor and Evaluate (ME)', 'ME2.1', 'Monitoring of Internal Control Framework'),
(175, 'COBIT 4.1', 'Monitor and Evaluate (ME)', 'ME2.2', 'Supervisory Review'),
(176, 'COBIT 4.1', 'Monitor and Evaluate (ME)', 'ME2.3', 'Control Exceptions'),
(177, 'COBIT 4.1', 'Monitor and Evaluate (ME)', 'ME2.4', 'Control Self-assessment'),
(178, 'COBIT 4.1', 'Monitor and Evaluate (ME)', 'ME2.5', 'Assurance of Internal Control'),
(179, 'COBIT 4.1', 'Monitor and Evaluate (ME)', 'ME2.6', 'Internal Control at Third Parties'),
(180, 'COBIT 4.1', 'Monitor and Evaluate (ME)', 'ME2.7', 'Remedial Actions'),
(181, 'COBIT 4.1', 'Monitor and Evaluate (ME)', 'ME3.1', 'Identification of External Legal, Regulatory and Contractual Compliance Requirements'),
(182, 'COBIT 4.1', 'Monitor and Evaluate (ME)', 'ME3.2', 'Optimisation of Response to External Requirements'),
(183, 'COBIT 4.1', 'Monitor and Evaluate (ME)', 'ME3.3', 'Evaluation of Compliance With External Requirements'),
(184, 'COBIT 4.1', 'Monitor and Evaluate (ME)', 'ME3.4', 'Positive Assurance of Compliance'),
(185, 'COBIT 4.1', 'Monitor and Evaluate (ME)', 'ME3.5', 'Integrated Reporting'),
(186, 'COBIT 4.1', 'Monitor and Evaluate (ME)', 'ME4.1', 'Establishment of an IT Governance Framework'),
(187, 'COBIT 4.1', 'Monitor and Evaluate (ME)', 'ME4.2', 'Strategic Alignment'),
(188, 'COBIT 4.1', 'Monitor and Evaluate (ME)', 'ME4.3', 'Value Delivery'),
(189, 'COBIT 4.1', 'Monitor and Evaluate (ME)', 'ME4.4', 'Resource Management'),
(190, 'COBIT 4.1', 'Monitor and Evaluate (ME)', 'ME4.5', 'Risk Management'),
(191, 'COBIT 4.1', 'Monitor and Evaluate (ME)', 'ME4.6', 'Performance Measurement'),
(192, 'COBIT 4.1', 'Monitor and Evaluate (ME)', 'ME4.7', 'Independent Assurance'),
(193, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO1.1', 'IT Value Management'),
(194, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO1.2', 'Business-IT Alignment'),
(195, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO1.3', 'Assessment of Current Capability and Performance'),
(196, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO1.4', 'IT Strategic Plan'),
(197, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO1.5', 'IT Tactical Plans'),
(198, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO1.6', 'IT Portfolio Management'),
(199, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO2.1', 'Enterprise Information Architecture Model'),
(200, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO2.2', 'Enterprise Data Dictionary and Data Syntax Rules'),
(201, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO2.3', 'Data Classification Scheme'),
(202, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO2.4', 'Integrity Management'),
(203, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO3.1', 'Technological Direction Planning'),
(204, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO3.2', 'Technical Infrastructure Plan'),
(205, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO3.3', 'Monitor Future Trends and Regulations'),
(206, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO3.4', 'Technology Standards'),
(207, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO3.5', 'IT Architecture Board'),
(208, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO4.1', 'IT Process Framework'),
(209, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO4.2', 'IT Strategy Committee'),
(210, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO4.3', 'IT Steering Committee'),
(211, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO4.4', 'Organisational Placement of the IT Function'),
(212, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO4.5', 'IT Organisational Structure'),
(213, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO4.6', 'Establishment of Roles and Responsibilities'),
(214, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO4.7', 'Responsibility for IT Quality Assurance'),
(215, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO4.8', 'Responsibility for Risk, Security and Compliance'),
(216, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO4.9', 'Data and System Ownership'),
(217, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO4.10', 'Supervision'),
(218, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO4.11', 'Segregation of Duties'),
(219, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO4.12', 'IT Staffing'),
(220, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO4.13', 'Key IT Personnel'),
(221, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO4.14', 'Contracted Staff Policies and Procedures'),
(222, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO4.15', 'Relationships'),
(223, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO5.1', 'Financial Management Framework'),
(224, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO5.2', 'Prioritisation Within IT Budget'),
(225, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO5.3', 'IT Budgeting'),
(226, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO5.4', 'Cost Management'),
(227, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO5.5', 'Benefit Management'),
(228, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO6.1', 'IT Policy and Control Environment'),
(229, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO6.2', 'Enterprise IT Risk and Control Framework'),
(230, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO6.3', 'IT Policies Management'),
(231, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO6.4', 'Policy, Standards and Procedures Rollout'),
(232, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO6.5', 'Communication of IT Objectives and Direction'),
(233, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO7.1', 'Personnel Recruitment and Retention'),
(234, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO7.2', 'Personnel Competencies'),
(235, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO7.3', 'Staffing of Roles'),
(236, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO7.4', 'Personnel Training'),
(237, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO7.5', 'Dependence Upon Individuals'),
(238, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO7.6', 'Personnel Clearance Procedures'),
(239, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO7.7', 'Employee Job Performance Evaluation'),
(240, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO7.8', 'Job Change and Termination'),
(241, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO8.1', 'Quality Management System'),
(242, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO8.2', 'IT Standards and Quality Practices'),
(243, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO8.3', 'Development and Acquisition Standards'),
(244, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO8.4', 'Customer Focus'),
(245, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO8.5', 'Continuous Improvement'),
(246, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO8.6', 'Quality Measurement, Monitoring and Review'),
(247, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO9.1', 'IT Risk Management Framework'),
(248, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO9.2', 'Establishment of Risk Context'),
(249, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO9.3', 'Event Identification'),
(250, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO9.4', 'Risk Assessment'),
(251, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO9.5', 'Risk Response'),
(252, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO9.6', 'Maintenance and Monitoring of a Risk Action Plan'),
(253, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO10.1', 'Programme Management Framework'),
(254, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO10.2', 'Project Management Framework'),
(255, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO10.3', 'Project Management Approach'),
(256, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO10.4', 'Stakeholder Commitment'),
(257, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO10.5', 'Project Scope Statement'),
(258, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO10.6', 'Project Phase Initiation'),
(259, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO10.7', 'Integrated Project Plan'),
(260, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO10.8', 'Project Resources'),
(261, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO10.9', 'Project Risk Management'),
(262, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO10.10', 'Project Quality Plan'),
(263, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO10.11', 'Project Change control'),
(264, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO10.12', 'Project Planning of Assurance Methods'),
(265, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO10.13', 'Project Performance Measurement, Reporting and Monitoring'),
(266, 'COBIT 4.1', 'Plan and Organize (PO)', 'PO10.14', 'Project Closure');

-- --------------------------------------------------------

--
-- Struktur dari tabel `criteria`
--

CREATE TABLE `criteria` (
  `id` int(11) NOT NULL,
  `jenis` varchar(255) NOT NULL,
  `kondisi` varchar(255) NOT NULL,
  `skor` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `criteria`
--

INSERT INTO `criteria` (`id`, `jenis`, `kondisi`, `skor`, `created_at`) VALUES
(8, 'Maturity Level', 'Belum Terfikirkan', 0, '2025-01-07 16:02:24'),
(9, 'Maturity Level', 'Belum Ada, masih di inisiasikan', 1, '2025-01-07 16:02:43'),
(10, 'Maturity Level', 'Sudah Ada, tanpa dokumentasi', 2, '2025-01-07 16:03:29'),
(11, 'Maturity Level', 'Sudah Ada, dan terdokumentasikan', 3, '2025-01-07 16:03:43'),
(12, 'Maturity Level', 'Sudah Ada, terdokumentasi dan termonitoring', 4, '2025-01-07 16:03:55'),
(13, 'Maturity Level', 'Sudah Ada, dan sudah Optimal', 5, '2025-01-07 16:04:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `eksternal_audit_question`
--

CREATE TABLE `eksternal_audit_question` (
  `id` int(11) NOT NULL,
  `kode_mapping` varchar(255) NOT NULL,
  `periode_audit` year(4) NOT NULL,
  `pertanyaan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `source` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `eksternal_audit_question`
--

INSERT INTO `eksternal_audit_question` (`id`, `kode_mapping`, `periode_audit`, `pertanyaan`, `created_at`, `source`) VALUES
(38, '1_Continual Service Improvement_5', 2025, 'Apakah kejadian yang mungkin mengganggu proses bisnis telah diidentifikasi (contoh : kebakaran, banjir, gempa, dll)?', '2025-01-09 02:36:32', 'kominfojatim'),
(39, '1_Continual Service Improvement_6', 2025, 'Apakah Strategy Plan dikembangkan berdasarkan hasil penilaian risiko ini untuk menentukan pendekatan menyeluruh dalam Business Continuity Plan?\r\n', '2025-01-09 02:36:45', 'kominfojatim'),
(40, '1_Continual Service Improvement_7', 2025, 'Apakah terdapat proses yang mengatur pengembangan dan pembangunan keberlanjutan bisnis diseluruh organisasi?', '2025-01-09 02:37:01', 'kominfojatim'),
(41, '1_Service Design_1', 2025, 'Apakah terdapat catatan inventaris aset penting yang berhubungan dengan sistem informasi?\r\n', '2025-01-09 02:37:17', 'kominfojatim'),
(42, '1_Service Design_2', 2025, 'Apakah klasifikasi keamanan dan identifikasi keamanan lokasi aset telah didefinisikan?\r\n', '2025-01-09 02:37:26', 'kominfojatim'),
(43, '1_Service Design_3', 2025, 'Apakah terdapat skema atau pedoman klasifikasi yang membantu dalam menentukan penanganan dan penjagaan informasi?\r\n', '2025-01-09 02:37:40', 'kominfojatim'),
(44, '1_Service Design_4', 2025, 'Apakah terdapat prosedur labelling dan handling informasi berdasarkan skema klasifikasi informasi organisasi?\r\n', '2025-01-09 02:37:52', 'kominfojatim'),
(45, '1_Service Operation_1', 2025, 'Apakah Kebijakan Keamanan telah mengidentifikasikan setiap prosedur operasional (contoh : back-up, pengecekan perlengkapan, proses pemeliharaan, dll) ?\r\n', '2025-01-09 02:38:16', 'kominfojatim'),
(46, '1_Service Operation_2', 2025, 'Apakah semua program dalam sistem produksi tunduk dengan peraturan change control ?\r\n', '2025-01-09 02:38:24', 'kominfojatim'),
(47, '1_Service Operation_3', 2025, 'Apakah audit log dilakukan untuk setiap perubahan dalam program produksi?\r\n', '2025-01-09 02:38:35', 'kominfojatim'),
(48, '1_Service Operation_5', 2025, 'Apakah kapasitas ( contoh : Hard disk space, RAM, CPU, server) dimonitoring dan peramalan kebutuhan kapasitas dilakukan?\r\n', '2025-01-09 02:38:44', 'kominfojatim'),
(49, '1_Service Strategy_1', 2025, 'Apakah terdapat dokumen Kebijakan Keamanan Informasi yang sudah disetujui oleh pihak manajemen dan telah dikomunikasikan kepada seluruh karyawan?\r\n', '2025-01-09 02:39:02', 'kominfojatim'),
(50, '1_Service Strategy_2', 2025, 'Apakah dokumen Kebijakan Keamanan Informasi telah membahas komitmen pihak manajemen terhadap keamanan TI?\r\n', '2025-01-09 02:39:12', 'kominfojatim'),
(52, '1_Service Strategy_3', 2025, 'Apakah terdapat penanggung jawab terhadap dokumen Kebijakan Keamanan Informasi, baik untuk melakukan perubahan maupun penilaian pencapain ?\r\n', '2025-01-09 02:39:31', 'kominfojatim'),
(53, '1_Service Strategy_4', 2025, 'Apakah terdapat forum yang membahas keamanan informasi ?\r\n', '2025-01-09 02:39:47', 'kominfojatim'),
(54, '1_Service Transition_1', 2025, 'Apakah kebutuhan akan keamanan merupakan bagian dari kebutuhan bisnis yang dinyatakan untuk sistem atau peningkatan sistem yang sudah ada sebelumnya?', '2025-01-09 02:40:41', 'kominfojatim'),
(55, '1_Service Transition_2', 2025, 'Apakah identifikasi kebutuhan dan kontrol keamanan telah mencerminkan nilai bisnis dari aset informasi, termasuk konsekuensi akan kegagalan keamanan?\r\n', '2025-01-09 02:40:50', 'kominfojatim'),
(56, '1_Service Transition_3', 2025, 'Apakah penilaian risiko telah selesai sebelum pengembangan sistem dilakukan?\r\n', '2025-01-09 02:41:00', 'kominfojatim'),
(57, '1_Service Transition_4', 2025, 'Apakah data inputterhadap sistem aplikasi divalidasi untuk memastikan data yang dimasukkan adalah benar dan sesuai?\r\n', '2025-01-09 02:41:09', 'kominfojatim'),
(58, '1_Continual Service Improvement_5', 2026, 'Tes', '2025-01-09 05:38:43', 'kominfojatim');

--
-- Trigger `eksternal_audit_question`
--
DELIMITER $$
CREATE TRIGGER `after_eksternal_audit_question_update` AFTER UPDATE ON `eksternal_audit_question` FOR EACH ROW BEGIN
    IF NEW.status <> OLD.status THEN
        UPDATE assessment_answers
        SET status = NEW.status
        WHERE question_id = NEW.id;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktur dari tabel `internal_audit_question`
--

CREATE TABLE `internal_audit_question` (
  `id` int(11) NOT NULL,
  `kode_mapping` varchar(255) NOT NULL,
  `periode_audit` year(4) NOT NULL,
  `pertanyaan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('draft','active','archived') DEFAULT 'draft'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `iso`
--

CREATE TABLE `iso` (
  `id` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `annex` varchar(50) NOT NULL,
  `control` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `iso`
--

INSERT INTO `iso` (`id`, `version`, `annex`, `control`) VALUES
(115, 'ISO 27002:2013', 'A.5.1.1', 'Policies for information security'),
(116, 'ISO 27002:2013', 'A.5.1.2', 'Review of the policies for information security'),
(117, 'ISO 27002:2013', 'A.6.1.1', 'Information security roles and responsibilities'),
(118, 'ISO 27002:2013', 'A.6.1.2', 'Segregation of duties'),
(119, 'ISO 27002:2013', 'A.6.1.3', 'Contact with authorities'),
(120, 'ISO 27002:2013', 'A.6.1.4', 'Contact with special interest groups'),
(121, 'ISO 27002:2013', 'A.6.1.5', 'Information security in project management'),
(122, 'ISO 27002:2013', 'A.6.2.1', 'Mobile device policy'),
(123, 'ISO 27002:2013', 'A.6.2.2', 'Teleworking'),
(124, 'ISO 27002:2013', 'A.7.1.1', 'Screening'),
(125, 'ISO 27002:2013', 'A.7.1.2', 'Terms and conditions of employment'),
(126, 'ISO 27002:2013', 'A.7.2.1', 'Management responsibilities'),
(127, 'ISO 27002:2013', 'A.7.2.2', 'Information security awareness, education and training'),
(128, 'ISO 27002:2013', 'A.7.2.3', 'Disciplinary process'),
(129, 'ISO 27002:2013', 'A.7.3.1', 'Termination or change of employment responsibilities'),
(130, 'ISO 27002:2013', 'A.8.1.1', 'Inventory of assets'),
(131, 'ISO 27002:2013', 'A.8.1.2', 'Ownership of assets'),
(132, 'ISO 27002:2013', 'A.8.1.3', 'Acceptable use of assets'),
(133, 'ISO 27002:2013', 'A.8.1.4', 'Return of assets'),
(134, 'ISO 27002:2013', 'A.8.2.1', 'Classification of information'),
(135, 'ISO 27002:2013', 'A.8.2.2', 'Labelling of information'),
(136, 'ISO 27002:2013', 'A.8.2.3', 'Handling of assets'),
(137, 'ISO 27002:2013', 'A.8.3.1', 'Management of removable media'),
(138, 'ISO 27002:2013', 'A.8.3.2', 'Disposal of media'),
(139, 'ISO 27002:2013', 'A.8.3.3', 'Physical media transfer'),
(140, 'ISO 27002:2013', 'A.9.1.1', 'Access Control policy'),
(141, 'ISO 27002:2013', 'A.9.1.2', 'Access to networks and network services'),
(142, 'ISO 27002:2013', 'A.9.2.1', 'User registration and de-registration'),
(143, 'ISO 27002:2013', 'A.9.2.2', 'User access provisioning'),
(144, 'ISO 27002:2013', 'A.9.2.3', 'Management of privileged access rights'),
(145, 'ISO 27002:2013', 'A.9.2.4', 'Management of secret authentication information of users'),
(146, 'ISO 27002:2013', 'A.9.2.5', 'Review of user access rights'),
(147, 'ISO 27002:2013', 'A.9.2.6', 'Removal or adjustment of access rights'),
(148, 'ISO 27002:2013', 'A.9.3.1', 'Use of secret authentication information'),
(149, 'ISO 27002:2013', 'A.9.4.1', 'Information access restriction'),
(150, 'ISO 27002:2013', 'A.9.4.2', 'Secure log-on procedures'),
(151, 'ISO 27002:2013', 'A.9.4.3', 'Password management system'),
(152, 'ISO 27002:2013', 'A.9.4.4', 'Use of privileged utility programs'),
(153, 'ISO 27002:2013', 'A.9.4.5', 'Access control to program source code'),
(154, 'ISO 27002:2013', 'A.10.1.1', 'Policy on the use of cryptographic controls'),
(155, 'ISO 27002:2013', 'A.10.1.2', 'Key management'),
(156, 'ISO 27002:2013', 'A.11.1.1', 'Physical security perimeter'),
(157, 'ISO 27002:2013', 'A.11.1.2', 'Physical entry controls'),
(158, 'ISO 27002:2013', 'A.11.1.3', 'Securing offices, rooms and facilities'),
(159, 'ISO 27002:2013', 'A.11.1.4', 'Protecting against external and environmental threats'),
(160, 'ISO 27002:2013', 'A.11.1.5', 'Working in secure areas'),
(161, 'ISO 27002:2013', 'A.11.1.6', 'Delivery and loading areas'),
(162, 'ISO 27002:2013', 'A.11.2.1', 'Equipment siting and protection'),
(163, 'ISO 27002:2013', 'A.11.2.2', 'Supporting utilities'),
(164, 'ISO 27002:2013', 'A.11.2.3', 'Cabling security'),
(165, 'ISO 27002:2013', 'A.11.2.4', 'Equipment maintenance'),
(166, 'ISO 27002:2013', 'A.11.2.5', 'Removal of assets'),
(167, 'ISO 27002:2013', 'A.11.2.6', 'Security of equipment and assets off-premises'),
(168, 'ISO 27002:2013', 'A.11.2.7', 'Secure disposal or reuse of equipment'),
(169, 'ISO 27002:2013', 'A.11.2.8', 'Unattended user equipment'),
(170, 'ISO 27002:2013', 'A.11.2.9', 'Clear desk and clear screen policy'),
(171, 'ISO 27002:2013', 'A.12.1.1', 'Documented operating procedures'),
(172, 'ISO 27002:2013', 'A.12.1.2', 'Change management'),
(173, 'ISO 27002:2013', 'A.12.1.3', 'Capacity management'),
(174, 'ISO 27002:2013', 'A.12.1.4', 'Separation of development, testing and operational environments'),
(175, 'ISO 27002:2013', 'A.12.2.1', 'Controls against malware'),
(176, 'ISO 27002:2013', 'A.12.3.1', 'Information backup'),
(177, 'ISO 27002:2013', 'A.12.4.1', 'Event logging'),
(178, 'ISO 27002:2013', 'A.12.4.2', 'Protection of log information'),
(179, 'ISO 27002:2013', 'A.12.4.3', 'Administrator and operator logs'),
(180, 'ISO 27002:2013', 'A.12.4.4', 'Clock synchronisation'),
(181, 'ISO 27002:2013', 'A.12.5.1', 'Installation of software on operational systems'),
(182, 'ISO 27002:2013', 'A.12.6.1', 'Management of technical vulnerabilities'),
(183, 'ISO 27002:2013', 'A.12.6.2', 'Restrictions on software installation'),
(184, 'ISO 27002:2013', 'A.12.7.1', 'Information systems audit controls'),
(185, 'ISO 27002:2013', 'A.13.1.1', 'Network controls'),
(186, 'ISO 27002:2013', 'A.13.1.2', 'Security of network services'),
(187, 'ISO 27002:2013', 'A.13.1.3', 'Segregation in networks'),
(188, 'ISO 27002:2013', 'A.13.2.1', 'Information transfer policies and procedures'),
(189, 'ISO 27002:2013', 'A.13.2.2', 'Agreements on information transfer'),
(190, 'ISO 27002:2013', 'A.13.2.3', 'Electronic messaging'),
(191, 'ISO 27002:2013', 'A.13.2.4', 'Confidentiality or nondisclosure agreements'),
(192, 'ISO 27002:2013', 'A.14.1.1', 'Information security requirements analysis and specification'),
(193, 'ISO 27002:2013', 'A.14.1.2', 'Securing application services on public networks'),
(194, 'ISO 27002:2013', 'A.14.1.3', 'Protecting application services transactions'),
(195, 'ISO 27002:2013', 'A.14.2.1', 'Secure development policy'),
(196, 'ISO 27002:2013', 'A.14.2.2', 'System change control procedures'),
(197, 'ISO 27002:2013', 'A.14.2.3', 'Technical review of applications after operating platform changes'),
(198, 'ISO 27002:2013', 'A.14.2.4', 'Restrictions on changes to software packages'),
(199, 'ISO 27002:2013', 'A.14.2.5', 'Secure system engineering principles'),
(200, 'ISO 27002:2013', 'A.14.2.6', 'Secure development environment'),
(201, 'ISO 27002:2013', 'A.14.2.7', 'Outsourced development'),
(202, 'ISO 27002:2013', 'A.14.2.8', 'System security testing'),
(203, 'ISO 27002:2013', 'A.14.2.9', 'System acceptance testing'),
(204, 'ISO 27002:2013', 'A.14.3.1', 'Protection of test data'),
(205, 'ISO 27002:2013', 'A.15.1.1', 'Information security policy for supplier relationships'),
(206, 'ISO 27002:2013', 'A.15.1.2', 'Addressing security within supplier agreements'),
(207, 'ISO 27002:2013', 'A.15.1.3', 'Information and communication technology supply chain'),
(208, 'ISO 27002:2013', 'A.15.2.1', 'Monitoring and review of supplier services'),
(209, 'ISO 27002:2013', 'A.15.2.2', 'Managing changes to supplier services'),
(210, 'ISO 27002:2013', 'A.16.1.1', 'Responsibilities and procedures'),
(211, 'ISO 27002:2013', 'A.16.1.2', 'Reporting information security events'),
(212, 'ISO 27002:2013', 'A.16.1.3', 'Reporting information security weaknesses'),
(213, 'ISO 27002:2013', 'A.16.1.4', 'Assessment of and decision on information security events'),
(214, 'ISO 27002:2013', 'A.16.1.5', 'Response to information security incidents'),
(215, 'ISO 27002:2013', 'A.16.1.6', 'Learning from information security incidents'),
(216, 'ISO 27002:2013', 'A.16.1.7', 'Collection of evidence'),
(217, 'ISO 27002:2013', 'A.17.1.1', 'Planning information security continuity'),
(218, 'ISO 27002:2013', 'A.17.1.2', 'Implementing information security continuity'),
(219, 'ISO 27002:2013', 'A.17.1.3', 'Verify, review and evaluate information security continuity'),
(220, 'ISO 27002:2013', 'A.17.2.1', 'Availability of information processing facilities'),
(221, 'ISO 27002:2013', 'A.18.1.1', 'Identification of applicable legislation and contractual requirements'),
(222, 'ISO 27002:2013', 'A.18.1.2', 'Intellectual property rights'),
(223, 'ISO 27002:2013', 'A.18.1.3', 'Protection of records'),
(224, 'ISO 27002:2013', 'A.18.1.4', 'Privacy and protection of personally identifiable information'),
(225, 'ISO 27002:2013', 'A.18.1.5', 'Regulation of cryptographic controls'),
(226, 'ISO 27002:2013', 'A.18.2.1', 'Independent review of information security'),
(227, 'ISO 27002:2013', 'A.18.2.2', 'Compliance with security policies and standards'),
(228, 'ISO 27002:2013', 'A.18.2.3', 'Technical compliance review'),
(229, 'BS 7799:2002', 'A 3.1.1', 'Information security policy document'),
(230, 'BS 7799:2002', 'A 3.1.1', 'Review and evaluation'),
(231, 'BS 7799:2002', 'A 3.1.2', 'Review and evaluation'),
(232, 'BS 7799:2002', 'A 4.1.1', 'Management information security forum'),
(233, 'BS 7799:2002', 'A 4.1.2', 'Information security coordination'),
(234, 'BS 7799:2002', 'A 4.1.3', 'Allocation of information security responsibilities'),
(235, 'BS 7799:2002', 'A 4.1.4', 'Authorisation process for information processing facilities'),
(236, 'BS 7799:2002', 'A 4.1.5', 'Specialist information security advice'),
(237, 'BS 7799:2002', 'A 4.1.6', 'Co-operation between organisations'),
(238, 'BS 7799:2002', 'A 4.1.7', 'Independent review of information security'),
(239, 'BS 7799:2002', 'A 4.2.1', 'Identification of risks from third party access'),
(240, 'BS 7799:2002', 'A 4.2.2', 'Security requirements in third party contracts'),
(241, 'BS 7799:2002', 'A 4.3.1', 'Security requirements in outsourcing contracts'),
(242, 'BS 7799:2002', 'A 5.1.1', 'Inventory of assets'),
(243, 'BS 7799:2002', 'A 5.2.1', 'Classification guidelines'),
(244, 'BS 7799:2002', 'A 5.2.2', 'Information labelling and handling'),
(245, 'BS 7799:2002', 'A 6.1.1', 'Including security in job responsibilities'),
(246, 'BS 7799:2002', 'A 6.1.2', 'Personnel screening and policy'),
(247, 'BS 7799:2002', 'A 6.1.3', 'Confidentiality agreements'),
(248, 'BS 7799:2002', 'A 6.1.4', 'Terms and conditions of employment'),
(249, 'BS 7799:2002', 'A 6.2.1', 'Information security education and training'),
(250, 'BS 7799:2002', 'A 6.3.1', 'Reporting security incidents'),
(251, 'BS 7799:2002', 'A 6.3.2', 'Reporting security weaknesses'),
(252, 'BS 7799:2002', 'A 6.3.3', 'Reporting software malfunctions'),
(253, 'BS 7799:2002', 'A 7.1.3', 'Securing Offices, rooms and facilities'),
(254, 'BS 7799:2002', 'A 7.1.4', 'Working in Secure Areas'),
(255, 'BS 7799:2002', 'A 7.1.5', 'Isolated delivery and loading areas'),
(256, 'BS 7799:2002', 'A 7.2.1', 'Equipment siting protection'),
(257, 'BS 7799:2002', 'A 7.2.2', 'Power Supplies'),
(258, 'BS 7799:2002', 'A 7.2.3', 'Cabling Security'),
(259, 'BS 7799:2002', 'A 7.2.4', 'Equipment Maintenance'),
(260, 'BS 7799:2002', 'A 7.2.5', 'Securing of equipment off-premises'),
(261, 'BS 7799:2002', 'A 7.2.6', 'Secure disposal or re-use of equipment'),
(262, 'BS 7799:2002', 'A 7.3.1', 'Clear Desk and clear screen policy'),
(263, 'BS 7799:2002', 'A 8.1.1', 'Documented Operating procedures'),
(264, 'BS 7799:2002', 'A 8.1.2', 'Operational Change Control'),
(265, 'BS 7799:2002', 'A 8.2.1', 'Capacity Planning'),
(266, 'BS 7799:2002', 'A 8.2.2', 'System Acceptance'),
(267, 'BS 7799:2002', 'A 8.3.1', 'Control against malicious software'),
(268, 'BS 7799:2002', 'A 8.4.1', 'Information back-up'),
(269, 'BS 7799:2002', 'A 8.4.2', 'Operator logs'),
(270, 'BS 7799:2002', 'A 8.4.3', 'Fault Logging'),
(271, 'BS 7799:2002', 'A 8.5.1', 'Network Controls'),
(272, 'BS 7799:2002', 'A 8.6.1', 'Management of removable computer media'),
(273, 'BS 7799:2002', 'A 8.6.4', 'Security of system documentation'),
(274, 'BS 7799:2002', 'A 8.7.2', 'Security of Media in transit'),
(275, 'BS 7799:2002', 'A 8.7.3', 'Electronic Commerce security'),
(276, 'BS 7799:2002', 'A 8.7.4', 'Security of Electronic mail'),
(277, 'BS 7799:2002', 'A 9.1.1', 'Access Control Policy'),
(278, 'BS 7799:2002', 'A 9.2.1', 'User Registration'),
(279, 'BS 7799:2002', 'A 9.2.2', 'Privilege Management'),
(280, 'BS 7799:2002', 'A 9.2.3', 'User Password Management'),
(281, 'BS 7799:2002', 'A 9.3.1', 'Password use'),
(282, 'BS 7799:2002', 'A 9.3.2', 'Unattended user equipment'),
(283, 'BS 7799:2002', 'A 9.4.1', 'Policy on use of network services'),
(284, 'BS 7799:2002', 'A 9.4.3', 'User authentication for external connections'),
(285, 'BS 7799:2002', 'A 9.5.2', 'Terminal logon procedures'),
(286, 'BS 7799:2002', 'A 9.5.3', 'User identification and authorisation'),
(287, 'BS 7799:2002', 'A 9.6.1', 'Information access restriction'),
(288, 'BS 7799:2002', 'A 9.8.1', 'Mobile computing'),
(289, 'BS 7799:2002', 'A 9.8.2', 'Teleworking'),
(290, 'BS 7799:2002', 'A 10.1.1', 'Security requirements analysis and specification'),
(291, 'BS 7799:2002', 'A 10.2.1', 'Input data validation'),
(292, 'BS 7799:2002', 'A 10.2.2', 'Control of internal processing'),
(293, 'BS 7799:2002', 'A 10.2.3', 'Message authentication'),
(294, 'BS 7799:2002', 'A 10.3.1', 'Policy on use of cryptographic controls'),
(295, 'BS 7799:2002', 'A 10.3.2', 'Encryption'),
(296, 'BS 7799:2002', 'A 10.3.5', 'Digital Signatures'),
(297, 'BS 7799:2002', 'A 10.4.1', 'Control of operational software'),
(298, 'BS 7799:2002', 'A 10.5.1', 'Change control procedures'),
(299, 'BS 7799:2002', 'A 11.1.1', 'Business continuity management process'),
(300, 'BS 7799:2002', 'A 11.1.2', 'Business continuity and impact analysis'),
(301, 'BS 7799:2002', 'A 12.1.1', 'Identification of applicable legislation'),
(302, 'BS 7799:2002', 'A 12.1.2', 'Intellectual property rights (IPR)'),
(303, 'BS 7799:2002', 'A 12.1.4', 'Data protection and privacy of personal information'),
(304, 'BS 7799:2002', 'A 12.1.5', 'Prevention of misuse of information processing facility'),
(305, 'BS 7799:2002', 'A 12.1.6', 'Regulation of cryptographic controls'),
(306, 'BS 7799:2002', 'A 12.2.1', 'Compliance with security policy'),
(307, 'BS 7799:2002', 'A 12.2.2', 'Technical compliance checking'),
(308, 'BS 7799:2002', 'A 12.3.1', 'System audit controls'),
(309, 'BS 7799:2002', 'A 12.3.2', 'Protection of system audit tools');

-- --------------------------------------------------------

--
-- Struktur dari tabel `itil`
--

CREATE TABLE `itil` (
  `id` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `service_lifecycle` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `itil`
--

INSERT INTO `itil` (`id`, `version`, `service_lifecycle`) VALUES
(1, 'ITIL v3', 'Service Strategy'),
(2, 'ITIL v3', 'Service Design'),
(3, 'ITIL v3', 'Service Transition'),
(4, 'ITIL v3', 'Service Operation'),
(5, 'ITIL v3', 'Continual Service Improvement');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mapping_criteria`
--

CREATE TABLE `mapping_criteria` (
  `id` int(11) NOT NULL,
  `kode_mapping` varchar(255) NOT NULL,
  `jenis_kriteria` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mapping_criteria`
--

INSERT INTO `mapping_criteria` (`id`, `kode_mapping`, `jenis_kriteria`, `created_at`) VALUES
(1, '1_Service Strategy_1', 'Maturity Level', '2025-01-08 03:59:03'),
(2, '1_Continual Service Improvement_5', 'Maturity Level', '2025-01-08 04:00:53'),
(5, '1_Service Transition_4', 'Maturity Level', '2025-01-08 04:38:51'),
(6, '1_Service Transition_3', 'Maturity Level', '2025-01-08 04:39:01'),
(7, '1_Service Transition_1', 'Maturity Level', '2025-01-08 04:39:07'),
(8, '1_Service Transition_2', 'Maturity Level', '2025-01-08 04:39:16'),
(9, '1_Service Strategy_4', 'Maturity Level', '2025-01-08 04:39:23'),
(10, '1_Service Strategy_3', 'Maturity Level', '2025-01-08 04:39:32'),
(11, '1_Service Strategy_2', 'Maturity Level', '2025-01-08 04:39:36'),
(12, '1_Service Operation_5', 'Maturity Level', '2025-01-08 04:39:53'),
(13, '1_Service Operation_3', 'Maturity Level', '2025-01-08 04:39:57'),
(14, '1_Service Operation_2', 'Maturity Level', '2025-01-08 04:40:02'),
(15, '1_Service Operation_1', 'Maturity Level', '2025-01-08 04:40:06'),
(16, '1_Service Design_4', 'Maturity Level', '2025-01-08 04:40:09'),
(17, '1_Service Design_3', 'Maturity Level', '2025-01-08 04:40:13'),
(18, '1_Service Design_2', 'Maturity Level', '2025-01-08 04:40:19'),
(19, '1_Service Design_1', 'Maturity Level', '2025-01-08 04:40:24'),
(20, '1_Continual Service Improvement_7', 'Maturity Level', '2025-01-08 04:40:29'),
(21, '1_Continual Service Improvement_6', 'Maturity Level', '2025-01-08 04:40:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mapping_standard`
--

CREATE TABLE `mapping_standard` (
  `id` int(11) NOT NULL,
  `mapping_version` varchar(50) NOT NULL,
  `itil_version` varchar(50) NOT NULL,
  `itil_service_lifecycle` varchar(255) DEFAULT NULL,
  `cobit_process_id` varchar(50) DEFAULT NULL,
  `cobit_process_name` varchar(255) DEFAULT NULL,
  `nomor_audit` int(11) NOT NULL,
  `kode_mapping` varchar(255) NOT NULL,
  `cobit_version` varchar(50) NOT NULL,
  `iso_annex` varchar(50) DEFAULT NULL,
  `iso_control` text,
  `iso_version` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mapping_standard`
--

INSERT INTO `mapping_standard` (`id`, `mapping_version`, `itil_version`, `itil_service_lifecycle`, `cobit_process_id`, `cobit_process_name`, `nomor_audit`, `kode_mapping`, `cobit_version`, `iso_annex`, `iso_control`, `iso_version`, `created_at`) VALUES
(6, '1', 'ITIL v3', 'Service Strategy', 'DS1.2', 'Definition of Services', 1, '1_Service Strategy_1', 'COBIT 4.1', 'A 3.1.1', 'Review and evaluation', 'BS 7799:2002', '2025-01-05 22:01:37'),
(8, '1', 'ITIL v3', 'Service Strategy', 'DS1.1', 'Service Level Management Framework', 2, '1_Service Strategy_2', 'COBIT 4.1', 'A 3.1.1', 'Review and evaluation', 'BS 7799:2002', '2025-01-05 22:05:03'),
(10, '1', 'ITIL v3', 'Service Strategy', 'DS1.5', 'Monitoring and Reporting of Service Level Achievements', 3, '1_Service Strategy_3', 'COBIT 4.1', 'A 3.1.2', 'Review and evaluation', 'BS 7799:2002', '2025-01-05 22:07:58'),
(11, '1', 'ITIL v3', 'Service Strategy', 'DS1.4', 'Operating Level Agreements', 4, '1_Service Strategy_4', 'COBIT 4.1', 'A 4.1.1', 'Management information security forum', 'BS 7799:2002', '2025-01-05 22:10:27'),
(12, '1', 'ITIL v3', 'Service Design', 'DS4.1', 'IT Continuity Framework', 1, '1_Service Design_1', 'COBIT 4.1', 'A 5.1.1', 'Inventory of assets', 'BS 7799:2002', '2025-01-05 22:12:47'),
(13, '1', 'ITIL v3', 'Service Design', 'DS5.3', 'Identity Management', 2, '1_Service Design_2', 'COBIT 4.1', 'A 5.1.1', 'Inventory of assets', 'BS 7799:2002', '2025-01-05 22:13:34'),
(14, '1', 'ITIL v3', 'Service Design', 'DS5.1', 'Management of IT Security', 3, '1_Service Design_3', 'COBIT 4.1', 'A 5.2.1', 'Classification guidelines', 'BS 7799:2002', '2025-01-05 22:15:05'),
(15, '1', 'ITIL v3', 'Service Design', 'DS4.4', 'Maintenance of the IT Continuity Plan', 4, '1_Service Design_4', 'COBIT 4.1', 'A 5.2.2', 'Information labelling and handling', 'BS 7799:2002', '2025-01-05 22:16:37'),
(16, '1', 'ITIL v3', 'Service Transition', 'DS9.1', 'Configuration Repository and Baseline', 1, '1_Service Transition_1', 'COBIT 4.1', 'A 10.1.1', 'Security requirements analysis and specification', 'BS 7799:2002', '2025-01-05 22:27:08'),
(17, '1', 'ITIL v3', 'Service Transition', 'DS9.1', 'Configuration Repository and Baseline', 2, '1_Service Transition_2', 'COBIT 4.1', 'A 10.1.1', 'Security requirements analysis and specification', 'BS 7799:2002', '2025-01-05 22:27:57'),
(18, '1', 'ITIL v3', 'Service Transition', 'DS9.2', 'Identification and Maintenance of Configuration Items', 3, '1_Service Transition_3', 'COBIT 4.1', 'A 10.1.1', 'Security requirements analysis and specification', 'BS 7799:2002', '2025-01-05 22:28:47'),
(19, '1', 'ITIL v3', 'Service Transition', 'DS13.4', 'Sensitive Documents and Output Devices', 4, '1_Service Transition_4', 'COBIT 4.1', 'A 10.2.1', 'Input data validation', 'BS 7799:2002', '2025-01-05 22:30:00'),
(20, '1', 'ITIL v3', 'Service Operation', 'DS13.1', 'Operations Procedures and Instructions', 1, '1_Service Operation_1', 'COBIT 4.1', 'A 8.1.1', 'Documented Operating procedures', 'BS 7799:2002', '2025-01-05 22:32:13'),
(24, '1', 'ITIL v3', 'Service Operation', 'DS13.3', 'IT Infrastructure Monitoring', 2, '1_Service Operation_2', 'COBIT 4.1', 'A 8.1.2', 'Operational Change Control', 'BS 7799:2002', '2025-01-05 22:35:32'),
(25, '1', 'ITIL v3', 'Service Operation', 'DS10.4', 'Integration of Configuration, Incident and Problem Management', 3, '1_Service Operation_3', 'COBIT 4.1', 'A 8.1.2', 'Operational Change Control', 'BS 7799:2002', '2025-01-05 22:36:04'),
(26, '1', 'ITIL v3', 'Service Operation', 'DS10.1', 'Identification and Classification of Problems', 5, '1_Service Operation_5', 'COBIT 4.1', 'A 8.2.1', 'Capacity Planning', 'BS 7799:2002', '2025-01-05 22:40:09'),
(27, '1', 'ITIL v3', 'Continual Service Improvement', 'DS4.8', 'IT Services Recovery and Resumption', 5, '1_Continual Service Improvement_5', 'COBIT 4.1', 'A 11.1.2', 'Business continuity and impact analysis', 'BS 7799:2002', '2025-01-05 22:43:02'),
(28, '1', 'ITIL v3', 'Continual Service Improvement', 'DS4.2', 'IT Continuity Plans', 6, '1_Continual Service Improvement_6', 'COBIT 4.1', 'A 11.1.2', 'Business continuity and impact analysis', 'BS 7799:2002', '2025-01-05 22:43:28'),
(29, '1', 'ITIL v3', 'Continual Service Improvement', 'DS4.4', 'Maintenance of the IT Continuity Plan', 7, '1_Continual Service Improvement_7', 'COBIT 4.1', 'A 9.1.1', 'Access Control Policy', 'BS 7799:2002', '2025-01-05 22:44:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `maturity_scores`
--

CREATE TABLE `maturity_scores` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `kode_mapping` varchar(255) NOT NULL,
  `skor` int(11) NOT NULL,
  `komentar` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `ITIL` varchar(255) NOT NULL,
  `iso_code` varchar(50) DEFAULT NULL,
  `cobit_code` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `question` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rankings`
--

CREATE TABLE `rankings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rank` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `recommendations`
--

CREATE TABLE `recommendations` (
  `id` int(11) NOT NULL,
  `auditor_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `recommendation` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `self_assessment`
--

CREATE TABLE `self_assessment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `kode_mapping` varchar(255) NOT NULL,
  `jawaban` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `self_assessments`
--

CREATE TABLE `self_assessments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `assessment` text NOT NULL,
  `score` int(11) DEFAULT NULL,
  `status` enum('Pending','Verified') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Manajemen TI','Admin','Tim Penilai','IT Auditor') NOT NULL,
  `company` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `company`, `created_at`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', 'Admin', 'Dinas Kominfo Provinsi Jawa Timur', '2025-01-05 07:45:08'),
(6, 'it_kominfogresik', '202cb962ac59075b964b07152d234b70', 'Manajemen TI', 'Dinas Kominfo Kabupaten Gresik', '2025-01-07 16:37:23'),
(7, 'auditor_kominfogresik', '202cb962ac59075b964b07152d234b70', 'IT Auditor', 'SPMI Dinas Kominfo Kabupaten Gresik', '2025-01-07 16:38:38'),
(8, 'kominfojatim', '202cb962ac59075b964b07152d234b70', 'Tim Penilai', 'Auditor Dinas Kominfo Provinsi Jawa Timur', '2025-01-07 16:38:54');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `assessment_answers`
--
ALTER TABLE `assessment_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indeks untuk tabel `auditee`
--
ALTER TABLE `auditee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_audit` (`kode_audit`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `audit_history`
--
ALTER TABLE `audit_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `cobit`
--
ALTER TABLE `cobit`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `criteria`
--
ALTER TABLE `criteria`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `eksternal_audit_question`
--
ALTER TABLE `eksternal_audit_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_mapping` (`kode_mapping`);

--
-- Indeks untuk tabel `internal_audit_question`
--
ALTER TABLE `internal_audit_question`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `iso`
--
ALTER TABLE `iso`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `itil`
--
ALTER TABLE `itil`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `mapping_criteria`
--
ALTER TABLE `mapping_criteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_mapping` (`kode_mapping`);

--
-- Indeks untuk tabel `mapping_standard`
--
ALTER TABLE `mapping_standard`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_mapping` (`kode_mapping`);

--
-- Indeks untuk tabel `maturity_scores`
--
ALTER TABLE `maturity_scores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `kode_mapping` (`kode_mapping`);

--
-- Indeks untuk tabel `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `rankings`
--
ALTER TABLE `rankings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `recommendations`
--
ALTER TABLE `recommendations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auditor_id` (`auditor_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `self_assessment`
--
ALTER TABLE `self_assessment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `kode_mapping` (`kode_mapping`);

--
-- Indeks untuk tabel `self_assessments`
--
ALTER TABLE `self_assessments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT untuk tabel `assessment_answers`
--
ALTER TABLE `assessment_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=343;

--
-- AUTO_INCREMENT untuk tabel `auditee`
--
ALTER TABLE `auditee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `audit_history`
--
ALTER TABLE `audit_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `cobit`
--
ALTER TABLE `cobit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=267;

--
-- AUTO_INCREMENT untuk tabel `criteria`
--
ALTER TABLE `criteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `eksternal_audit_question`
--
ALTER TABLE `eksternal_audit_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT untuk tabel `internal_audit_question`
--
ALTER TABLE `internal_audit_question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `iso`
--
ALTER TABLE `iso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=310;

--
-- AUTO_INCREMENT untuk tabel `itil`
--
ALTER TABLE `itil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `mapping_criteria`
--
ALTER TABLE `mapping_criteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `mapping_standard`
--
ALTER TABLE `mapping_standard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `maturity_scores`
--
ALTER TABLE `maturity_scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `rankings`
--
ALTER TABLE `rankings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `recommendations`
--
ALTER TABLE `recommendations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `self_assessment`
--
ALTER TABLE `self_assessment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `self_assessments`
--
ALTER TABLE `self_assessments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `assessment_answers`
--
ALTER TABLE `assessment_answers`
  ADD CONSTRAINT `assessment_answers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assessment_answers_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `eksternal_audit_question` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `auditee`
--
ALTER TABLE `auditee`
  ADD CONSTRAINT `auditee_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `audit_history`
--
ALTER TABLE `audit_history`
  ADD CONSTRAINT `audit_history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `eksternal_audit_question`
--
ALTER TABLE `eksternal_audit_question`
  ADD CONSTRAINT `eksternal_audit_question_ibfk_1` FOREIGN KEY (`kode_mapping`) REFERENCES `mapping_standard` (`kode_mapping`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `mapping_criteria`
--
ALTER TABLE `mapping_criteria`
  ADD CONSTRAINT `mapping_criteria_ibfk_1` FOREIGN KEY (`kode_mapping`) REFERENCES `mapping_standard` (`kode_mapping`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `maturity_scores`
--
ALTER TABLE `maturity_scores`
  ADD CONSTRAINT `maturity_scores_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `maturity_scores_ibfk_2` FOREIGN KEY (`kode_mapping`) REFERENCES `mapping_standard` (`kode_mapping`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `rankings`
--
ALTER TABLE `rankings`
  ADD CONSTRAINT `rankings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `recommendations`
--
ALTER TABLE `recommendations`
  ADD CONSTRAINT `recommendations_ibfk_1` FOREIGN KEY (`auditor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `recommendations_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `self_assessment`
--
ALTER TABLE `self_assessment`
  ADD CONSTRAINT `self_assessment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `self_assessment_ibfk_2` FOREIGN KEY (`kode_mapping`) REFERENCES `mapping_standard` (`kode_mapping`) ON DELETE CASCADE;

--
-- Ketidakleluasaan untuk tabel `self_assessments`
--
ALTER TABLE `self_assessments`
  ADD CONSTRAINT `self_assessments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `self_assessments_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
