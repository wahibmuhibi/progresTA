-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 30, 2025 at 10:54 AM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 5.6.40

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
-- Table structure for table `asesi`
--

CREATE TABLE `asesi` (
  `id` int(11) NOT NULL,
  `asesmen_kode` varchar(50) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `asesor_id` int(11) DEFAULT NULL,
  `asesmen_periode` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `form_status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `asesi`
--

INSERT INTO `asesi` (`id`, `asesmen_kode`, `user_id`, `asesor_id`, `asesmen_periode`, `created_at`, `form_status`) VALUES
(27, 'AUDIT-67895A8F32211', 6, NULL, 2025, '2025-01-16 19:14:23', 1),
(28, 'AUDIT-678B58BED30CD', 6, NULL, 2025, '2025-01-18 07:31:10', 1),
(31, 'AUDIT-678B8E207D7A0', 6, NULL, 2025, '2025-01-18 11:18:56', 0),
(32, 'AUDIT-678B8FE23D23B', 6, NULL, 2025, '2025-01-18 11:26:26', 0),
(33, 'AUDIT-678B9156A2267', 6, NULL, 2025, '2025-01-18 11:32:38', 1),
(34, 'ASESMEN-678B919B15AA9', 6, NULL, 2025, '2025-01-18 11:33:47', 1),
(35, 'ASESMEN-678B91E2C1D49', 6, NULL, 2025, '2025-01-18 11:34:58', 1),
(36, 'ASESMEN-678E22B15EA8D', 6, NULL, 2025, '2025-01-20 10:17:21', 0),
(37, 'ASESMEN-678E26C309799', 6, NULL, 2025, '2025-01-20 10:34:43', 0),
(38, 'ASESMEN-678E318D275F5', 6, NULL, 2025, '2025-01-20 11:20:45', 0),
(39, 'ASESMEN-678E3F7DA6736', 6, 0, 2025, '2025-01-20 12:20:13', 0),
(40, 'ASESMEN-678E49F187A18', 6, 0, 2025, '2025-01-20 13:04:49', 0),
(41, 'ASESMEN-678E4FB55F8E7', 6, 7, 2025, '2025-01-20 13:29:25', 1),
(42, 'ASESMEN-678E4FBF2AC22', 6, 8, 2025, '2025-01-20 13:29:35', 0),
(44, 'ASESMEN-678E60AEAF6D8', 6, 9, 2026, '2025-01-20 14:41:50', 0),
(46, 'ASESMEN-6791FF409CC44', 6, 7, 2025, '2025-01-23 08:35:12', 0);

-- --------------------------------------------------------

--
-- Table structure for table `asesmen_hasil`
--

CREATE TABLE `asesmen_hasil` (
  `id` int(11) NOT NULL,
  `asesmen_kode` varchar(50) DEFAULT NULL,
  `score_session_id` int(11) NOT NULL,
  `aspek` varchar(255) DEFAULT NULL,
  `skor_rata_rata` float DEFAULT NULL,
  `verification_code` varchar(50) DEFAULT NULL,
  `verified_at` datetime DEFAULT NULL,
  `rekomendasi` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `asesmen_hasil`
--

INSERT INTO `asesmen_hasil` (`id`, `asesmen_kode`, `score_session_id`, `aspek`, `skor_rata_rata`, `verification_code`, `verified_at`, `rekomendasi`, `created_at`) VALUES
(1, 'AUDIT-67895A8F32211', 1737083362, 'Service Strategy', 5, NULL, NULL, NULL, '2025-01-18 04:33:03'),
(2, 'AUDIT-67895A8F32211', 1737083362, 'Service Design', 5, NULL, NULL, NULL, '2025-01-18 04:33:03'),
(3, 'AUDIT-67895A8F32211', 1737083362, 'Service Transition', 5, NULL, NULL, NULL, '2025-01-18 04:33:03'),
(4, 'AUDIT-67895A8F32211', 1737083362, 'Service Operation', 5, NULL, NULL, NULL, '2025-01-18 04:33:03'),
(5, 'AUDIT-67895A8F32211', 1737083362, 'Continual Service Improvement', 5, NULL, NULL, NULL, '2025-01-18 04:33:03'),
(6, 'AUDIT-67895A8F32211', 1737170025, 'Service Strategy', 5, NULL, NULL, 'Tes', '2025-01-18 05:08:47'),
(7, 'AUDIT-67895A8F32211', 1737170025, 'Service Design', 5, NULL, NULL, 'Tes', '2025-01-18 05:08:47'),
(8, 'AUDIT-67895A8F32211', 1737170025, 'Service Transition', 5, NULL, NULL, 'Tes', '2025-01-18 05:08:47'),
(9, 'AUDIT-67895A8F32211', 1737170025, 'Service Operation', 5, NULL, NULL, 'Tes', '2025-01-18 05:08:47'),
(10, 'AUDIT-67895A8F32211', 1737170025, 'Continual Service Improvement', 5, NULL, NULL, 'Tes', '2025-01-18 05:08:47'),
(11, 'AUDIT-67895A8F32211', 1737083362, 'Service Strategy', 5, NULL, NULL, NULL, '2025-01-18 05:38:12'),
(12, 'AUDIT-67895A8F32211', 1737083362, 'Service Design', 5, NULL, NULL, NULL, '2025-01-18 05:38:12'),
(13, 'AUDIT-67895A8F32211', 1737083362, 'Service Transition', 5, NULL, NULL, NULL, '2025-01-18 05:38:12'),
(14, 'AUDIT-67895A8F32211', 1737083362, 'Service Operation', 5, NULL, NULL, NULL, '2025-01-18 05:38:12'),
(15, 'AUDIT-67895A8F32211', 1737083362, 'Continual Service Improvement', 5, NULL, NULL, NULL, '2025-01-18 05:38:12'),
(16, 'AUDIT-67895A8F32211', 1737170025, 'Service Strategy', 5, NULL, NULL, 'Tes', '2025-01-18 05:39:43'),
(17, 'AUDIT-67895A8F32211', 1737170025, 'Service Design', 5, NULL, NULL, 'Tes', '2025-01-18 05:39:43'),
(18, 'AUDIT-67895A8F32211', 1737170025, 'Service Transition', 5, NULL, NULL, 'Tes', '2025-01-18 05:39:43'),
(19, 'AUDIT-67895A8F32211', 1737170025, 'Service Operation', 5, NULL, NULL, 'Tes', '2025-01-18 05:39:43'),
(20, 'AUDIT-67895A8F32211', 1737170025, 'Continual Service Improvement', 5, NULL, NULL, 'Tes', '2025-01-18 05:39:43'),
(21, 'AUDIT-67895A8F32211', 1737170025, 'Service Strategy', 5, NULL, NULL, 'Tes', '2025-01-18 07:28:13'),
(22, 'AUDIT-67895A8F32211', 1737170025, 'Service Design', 5, NULL, NULL, 'Tes', '2025-01-18 07:28:13'),
(23, 'AUDIT-67895A8F32211', 1737170025, 'Service Transition', 5, NULL, NULL, 'Tes', '2025-01-18 07:28:13'),
(24, 'AUDIT-67895A8F32211', 1737170025, 'Service Operation', 5, NULL, NULL, 'Tes', '2025-01-18 07:28:13'),
(25, 'AUDIT-67895A8F32211', 1737170025, 'Continual Service Improvement', 5, NULL, NULL, 'Tes', '2025-01-18 07:28:13'),
(26, 'AUDIT-678B58BED30CD', 1737185533, 'Service Strategy', 1, NULL, NULL, NULL, '2025-01-18 07:32:23'),
(27, 'AUDIT-678B58BED30CD', 1737185533, 'Service Design', 1, NULL, NULL, NULL, '2025-01-18 07:32:23'),
(28, 'AUDIT-678B58BED30CD', 1737185533, 'Service Transition', 1, NULL, NULL, NULL, '2025-01-18 07:32:23'),
(29, 'AUDIT-678B58BED30CD', 1737185533, 'Service Operation', 1, NULL, NULL, NULL, '2025-01-18 07:32:23'),
(30, 'AUDIT-678B58BED30CD', 1737185533, 'Continual Service Improvement', 1, NULL, NULL, NULL, '2025-01-18 07:32:23'),
(31, 'AUDIT-678B58BED30CD', 1737189188, 'Service Strategy', 1, NULL, NULL, 'Tes', '2025-01-18 08:33:15'),
(32, 'AUDIT-678B58BED30CD', 1737189188, 'Service Design', 1, NULL, NULL, 'Tes', '2025-01-18 08:33:15'),
(33, 'AUDIT-678B58BED30CD', 1737189188, 'Service Transition', 1, NULL, NULL, 'Tes', '2025-01-18 08:33:15'),
(34, 'AUDIT-678B58BED30CD', 1737189188, 'Service Operation', 1, NULL, NULL, 'Tes', '2025-01-18 08:33:15'),
(35, 'AUDIT-678B58BED30CD', 1737189188, 'Continual Service Improvement', 1, NULL, NULL, 'Tes', '2025-01-18 08:33:15'),
(36, 'AUDIT-67895A8F32211', 1737170025, 'Service Strategy', 5, NULL, NULL, 'Tes', '2025-01-18 11:53:03'),
(37, 'AUDIT-67895A8F32211', 1737170025, 'Service Design', 5, NULL, NULL, 'Tes', '2025-01-18 11:53:03'),
(38, 'AUDIT-67895A8F32211', 1737170025, 'Service Transition', 5, NULL, NULL, 'Tes', '2025-01-18 11:53:03'),
(39, 'AUDIT-67895A8F32211', 1737170025, 'Service Operation', 5, NULL, NULL, 'Tes', '2025-01-18 11:53:03'),
(40, 'AUDIT-67895A8F32211', 1737170025, 'Continual Service Improvement', 5, NULL, NULL, 'Tes', '2025-01-18 11:53:03'),
(41, 'AUDIT-678B58BED30CD', 1737351416, 'Service Strategy', 1, NULL, NULL, 'Tes', '2025-01-20 05:37:02'),
(42, 'AUDIT-678B58BED30CD', 1737351416, 'Service Design', 1, NULL, NULL, 'Tes', '2025-01-20 05:37:02'),
(43, 'AUDIT-678B58BED30CD', 1737351416, 'Service Transition', 1, NULL, NULL, 'Tes', '2025-01-20 05:37:02'),
(44, 'AUDIT-678B58BED30CD', 1737351416, 'Service Operation', 1, NULL, NULL, 'Tes', '2025-01-20 05:37:02'),
(45, 'AUDIT-678B58BED30CD', 1737351416, 'Continual Service Improvement', 1, NULL, NULL, 'Tes', '2025-01-20 05:37:02'),
(46, 'ASESMEN-678E60AEAF6D8', 1737385915, 'Service Strategy', 0, NULL, NULL, NULL, '2025-01-20 15:12:01'),
(47, 'ASESMEN-678E60AEAF6D8', 1737385915, 'Service Design', 0, NULL, NULL, NULL, '2025-01-20 15:12:01'),
(48, 'ASESMEN-678E60AEAF6D8', 1737385915, 'Service Transition', 0, NULL, NULL, NULL, '2025-01-20 15:12:01'),
(49, 'ASESMEN-678E60AEAF6D8', 1737385915, 'Service Operation', 0, NULL, NULL, NULL, '2025-01-20 15:12:01'),
(50, 'ASESMEN-678E60AEAF6D8', 1737385915, 'Continual Service Improvement', 4, NULL, NULL, NULL, '2025-01-20 15:12:01'),
(51, 'ASESMEN-678E60AEAF6D8', 1737387395, 'Service Strategy', 0, NULL, NULL, NULL, '2025-01-20 15:39:12'),
(52, 'ASESMEN-678E60AEAF6D8', 1737387395, 'Service Design', 0, NULL, NULL, NULL, '2025-01-20 15:39:12'),
(53, 'ASESMEN-678E60AEAF6D8', 1737387395, 'Service Transition', 0, NULL, NULL, NULL, '2025-01-20 15:39:12'),
(54, 'ASESMEN-678E60AEAF6D8', 1737387395, 'Service Operation', 0, NULL, NULL, NULL, '2025-01-20 15:39:12'),
(55, 'ASESMEN-678E60AEAF6D8', 1737387395, 'Continual Service Improvement', 4, NULL, NULL, NULL, '2025-01-20 15:39:12'),
(56, 'ASESMEN-678E60AEAF6D8', 1737387562, 'Service Strategy', 0, 'VERIFY-678E71BBAB1B3', '2025-01-20 16:54:35', 'Aman', '2025-01-20 15:39:26'),
(57, 'ASESMEN-678E60AEAF6D8', 1737387562, 'Service Design', 0, 'VERIFY-678E71BBAB1B3', '2025-01-20 16:54:35', 'Aman', '2025-01-20 15:39:26'),
(58, 'ASESMEN-678E60AEAF6D8', 1737387562, 'Service Transition', 0, 'VERIFY-678E71BBAB1B3', '2025-01-20 16:54:35', 'Aman', '2025-01-20 15:39:26'),
(59, 'ASESMEN-678E60AEAF6D8', 1737387562, 'Service Operation', 0, 'VERIFY-678E71BBAB1B3', '2025-01-20 16:54:35', 'Aman', '2025-01-20 15:39:26'),
(60, 'ASESMEN-678E60AEAF6D8', 1737387562, 'Continual Service Improvement', 4, 'VERIFY-678E71BBAB1B3', '2025-01-20 16:54:35', 'Aman', '2025-01-20 15:39:26'),
(61, 'ASESMEN-678E4FB55F8E7', 1737388549, 'Service Strategy', 5, 'VERIFY-6791FF6E99B54', '2025-01-23 09:35:58', 'Tes', '2025-01-20 15:55:54'),
(62, 'ASESMEN-678E4FB55F8E7', 1737388549, 'Service Design', 5, 'VERIFY-6791FF6E99B54', '2025-01-23 09:35:58', 'Tes', '2025-01-20 15:55:54'),
(63, 'ASESMEN-678E4FB55F8E7', 1737388549, 'Service Transition', 5, 'VERIFY-6791FF6E99B54', '2025-01-23 09:35:58', 'Tes', '2025-01-20 15:55:54'),
(64, 'ASESMEN-678E4FB55F8E7', 1737388549, 'Service Operation', 5, 'VERIFY-6791FF6E99B54', '2025-01-23 09:35:58', 'Tes', '2025-01-20 15:55:54'),
(65, 'ASESMEN-678E4FB55F8E7', 1737388549, 'Continual Service Improvement', 5, 'VERIFY-6791FF6E99B54', '2025-01-23 09:35:58', 'Tes', '2025-01-20 15:55:54'),
(66, 'ASESMEN-678E4FB55F8E7', 1737621660, 'Service Strategy', 5, 'VERIFY-679200D550E70', '2025-01-23 09:41:57', 'harus diisi', '2025-01-23 08:41:25'),
(67, 'ASESMEN-678E4FB55F8E7', 1737621660, 'Service Design', 5, 'VERIFY-679200D550E70', '2025-01-23 09:41:57', 'harus diisi', '2025-01-23 08:41:25'),
(68, 'ASESMEN-678E4FB55F8E7', 1737621660, 'Service Transition', 3.75, 'VERIFY-679200D550E70', '2025-01-23 09:41:57', 'harus diisi', '2025-01-23 08:41:25'),
(69, 'ASESMEN-678E4FB55F8E7', 1737621660, 'Service Operation', 5, 'VERIFY-679200D550E70', '2025-01-23 09:41:57', 'harus diisi', '2025-01-23 08:41:25'),
(70, 'ASESMEN-678E4FB55F8E7', 1737621660, 'Continual Service Improvement', 3.33333, 'VERIFY-679200D550E70', '2025-01-23 09:41:57', 'harus diisi', '2025-01-23 08:41:25');

-- --------------------------------------------------------

--
-- Table structure for table `asesmen_jawaban`
--

CREATE TABLE `asesmen_jawaban` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `question_id` int(11) NOT NULL,
  `asesmen_kode` varchar(50) DEFAULT NULL,
  `jawaban` text,
  `skor` int(11) DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `status` enum('draft','submitted') DEFAULT 'draft',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `asesor_id` int(11) DEFAULT NULL,
  `periode_audit` year(4) NOT NULL,
  `score_session_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `asesmen_jawaban`
--

INSERT INTO `asesmen_jawaban` (`id`, `user_id`, `question_id`, `asesmen_kode`, `jawaban`, `skor`, `file_path`, `status`, `created_at`, `asesor_id`, `periode_audit`, `score_session_id`) VALUES
(381, 6, 38, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 19:15:04', NULL, 2025, NULL),
(382, 6, 39, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 19:15:04', NULL, 2025, NULL),
(383, 6, 40, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 19:15:04', NULL, 2025, NULL),
(384, 6, 41, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 19:15:04', NULL, 2025, NULL),
(385, 6, 42, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 19:15:04', NULL, 2025, NULL),
(386, 6, 43, 'AUDIT-67895A8F32211', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-16 19:15:04', NULL, 2025, NULL),
(387, 6, 44, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 19:15:04', NULL, 2025, NULL),
(388, 6, 45, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 19:15:04', NULL, 2025, NULL),
(389, 6, 46, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 19:15:04', NULL, 2025, NULL),
(390, 6, 47, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 19:15:04', NULL, 2025, NULL),
(391, 6, 48, 'AUDIT-67895A8F32211', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-16 19:15:04', NULL, 2025, NULL),
(392, 6, 49, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 19:15:04', NULL, 2025, NULL),
(393, 6, 50, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 19:15:04', NULL, 2025, NULL),
(394, 6, 52, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 19:15:04', NULL, 2025, NULL),
(395, 6, 53, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 19:15:04', NULL, 2025, NULL),
(396, 6, 54, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 19:15:04', NULL, 2025, NULL),
(397, 6, 55, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 19:15:04', NULL, 2025, NULL),
(398, 6, 56, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 19:15:04', NULL, 2025, NULL),
(399, 6, 57, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 19:15:04', NULL, 2025, NULL),
(400, 6, 38, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 19:40:26', NULL, 2025, NULL),
(401, 6, 39, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 19:40:26', NULL, 2025, NULL),
(402, 6, 40, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 19:40:26', NULL, 2025, NULL),
(403, 6, 41, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 19:40:26', NULL, 2025, NULL),
(404, 6, 42, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 19:40:26', NULL, 2025, NULL),
(405, 6, 43, 'AUDIT-67895A8F32211', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-16 19:40:26', NULL, 2025, NULL),
(406, 6, 44, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 19:40:26', NULL, 2025, NULL),
(407, 6, 45, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 19:40:26', NULL, 2025, NULL),
(408, 6, 46, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 19:40:26', NULL, 2025, NULL),
(409, 6, 47, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 19:40:26', NULL, 2025, NULL),
(410, 6, 48, 'AUDIT-67895A8F32211', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-16 19:40:26', NULL, 2025, NULL),
(411, 6, 49, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 19:40:26', NULL, 2025, NULL),
(412, 6, 50, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 19:40:26', NULL, 2025, NULL),
(413, 6, 52, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 19:40:26', NULL, 2025, NULL),
(414, 6, 53, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 19:40:26', NULL, 2025, NULL),
(415, 6, 54, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 19:40:26', NULL, 2025, NULL),
(416, 6, 55, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 19:40:26', NULL, 2025, NULL),
(417, 6, 56, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 19:40:26', NULL, 2025, NULL),
(418, 6, 57, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 19:40:26', NULL, 2025, NULL),
(419, 6, 38, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 19:52:13', NULL, 2025, NULL),
(420, 6, 39, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 19:52:13', NULL, 2025, NULL),
(421, 6, 40, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 19:52:13', NULL, 2025, NULL),
(422, 6, 41, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 19:52:13', NULL, 2025, NULL),
(423, 6, 42, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 19:52:13', NULL, 2025, NULL),
(424, 6, 43, 'AUDIT-67895A8F32211', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-16 19:52:13', NULL, 2025, NULL),
(425, 6, 44, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 19:52:13', NULL, 2025, NULL),
(426, 6, 45, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 19:52:13', NULL, 2025, NULL),
(427, 6, 46, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 19:52:13', NULL, 2025, NULL),
(428, 6, 47, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 19:52:13', NULL, 2025, NULL),
(429, 6, 48, 'AUDIT-67895A8F32211', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-16 19:52:13', NULL, 2025, NULL),
(430, 6, 49, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 19:52:13', NULL, 2025, NULL),
(431, 6, 50, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 19:52:13', NULL, 2025, NULL),
(432, 6, 52, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 19:52:13', NULL, 2025, NULL),
(433, 6, 53, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 19:52:13', NULL, 2025, NULL),
(434, 6, 54, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 19:52:13', NULL, 2025, NULL),
(435, 6, 55, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 19:52:13', NULL, 2025, NULL),
(436, 6, 56, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 19:52:13', NULL, 2025, NULL),
(437, 6, 57, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 19:52:13', NULL, 2025, NULL),
(438, 6, 38, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 19:52:44', NULL, 2025, NULL),
(439, 6, 39, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 19:52:44', NULL, 2025, NULL),
(440, 6, 40, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 19:52:44', NULL, 2025, NULL),
(441, 6, 41, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 19:52:44', NULL, 2025, NULL),
(442, 6, 42, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 19:52:44', NULL, 2025, NULL),
(443, 6, 43, 'AUDIT-67895A8F32211', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-16 19:52:44', NULL, 2025, NULL),
(444, 6, 44, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 19:52:44', NULL, 2025, NULL),
(445, 6, 45, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 19:52:44', NULL, 2025, NULL),
(446, 6, 46, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 19:52:44', NULL, 2025, NULL),
(447, 6, 47, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 19:52:44', NULL, 2025, NULL),
(448, 6, 48, 'AUDIT-67895A8F32211', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-16 19:52:44', NULL, 2025, NULL),
(449, 6, 49, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 19:52:44', NULL, 2025, NULL),
(450, 6, 50, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 19:52:44', NULL, 2025, NULL),
(451, 6, 52, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 19:52:44', NULL, 2025, NULL),
(452, 6, 53, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 19:52:44', NULL, 2025, NULL),
(453, 6, 54, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 19:52:44', NULL, 2025, NULL),
(454, 6, 55, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 19:52:44', NULL, 2025, NULL),
(455, 6, 56, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 19:52:44', NULL, 2025, NULL),
(456, 6, 57, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 19:52:44', NULL, 2025, NULL),
(457, 6, 38, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:03:31', NULL, 2025, NULL),
(458, 6, 39, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:03:31', NULL, 2025, NULL),
(459, 6, 40, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:03:31', NULL, 2025, NULL),
(460, 6, 41, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:03:31', NULL, 2025, NULL),
(461, 6, 42, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:03:31', NULL, 2025, NULL),
(462, 6, 43, 'AUDIT-67895A8F32211', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-16 20:03:31', NULL, 2025, NULL),
(463, 6, 44, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:03:31', NULL, 2025, NULL),
(464, 6, 45, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:03:31', NULL, 2025, NULL),
(465, 6, 46, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:03:31', NULL, 2025, NULL),
(466, 6, 47, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:03:31', NULL, 2025, NULL),
(467, 6, 48, 'AUDIT-67895A8F32211', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-16 20:03:31', NULL, 2025, NULL),
(468, 6, 49, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:03:31', NULL, 2025, NULL),
(469, 6, 50, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:03:31', NULL, 2025, NULL),
(470, 6, 52, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:03:31', NULL, 2025, NULL),
(471, 6, 53, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:03:31', NULL, 2025, NULL),
(472, 6, 54, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:03:31', NULL, 2025, NULL),
(473, 6, 55, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:03:31', NULL, 2025, NULL),
(474, 6, 56, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:03:31', NULL, 2025, NULL),
(475, 6, 57, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:03:31', NULL, 2025, NULL),
(476, 6, 38, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:05:56', NULL, 2025, NULL),
(477, 6, 39, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:05:56', NULL, 2025, NULL),
(478, 6, 40, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:05:56', NULL, 2025, NULL),
(479, 6, 41, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:05:56', NULL, 2025, NULL),
(480, 6, 42, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:05:56', NULL, 2025, NULL),
(481, 6, 43, 'AUDIT-67895A8F32211', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-16 20:05:56', NULL, 2025, NULL),
(482, 6, 44, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:05:56', NULL, 2025, NULL),
(483, 6, 45, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:05:56', NULL, 2025, NULL),
(484, 6, 46, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:05:56', NULL, 2025, NULL),
(485, 6, 47, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:05:56', NULL, 2025, NULL),
(486, 6, 48, 'AUDIT-67895A8F32211', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-16 20:05:56', NULL, 2025, NULL),
(487, 6, 49, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:05:56', NULL, 2025, NULL),
(488, 6, 50, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:05:56', NULL, 2025, NULL),
(489, 6, 52, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:05:56', NULL, 2025, NULL),
(490, 6, 53, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:05:56', NULL, 2025, NULL),
(491, 6, 54, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:05:56', NULL, 2025, NULL),
(492, 6, 55, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:05:56', NULL, 2025, NULL),
(493, 6, 56, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:05:56', NULL, 2025, NULL),
(494, 6, 57, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:05:56', NULL, 2025, NULL),
(495, 6, 38, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:11:14', NULL, 2025, NULL),
(496, 6, 39, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:11:14', NULL, 2025, NULL),
(497, 6, 40, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:11:14', NULL, 2025, NULL),
(498, 6, 41, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:11:14', NULL, 2025, NULL),
(499, 6, 42, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:11:14', NULL, 2025, NULL),
(500, 6, 43, 'AUDIT-67895A8F32211', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-16 20:11:14', NULL, 2025, NULL),
(501, 6, 44, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:11:14', NULL, 2025, NULL),
(502, 6, 45, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:11:14', NULL, 2025, NULL),
(503, 6, 46, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:11:14', NULL, 2025, NULL),
(504, 6, 47, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:11:14', NULL, 2025, NULL),
(505, 6, 48, 'AUDIT-67895A8F32211', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-16 20:11:14', NULL, 2025, NULL),
(506, 6, 49, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:11:14', NULL, 2025, NULL),
(507, 6, 50, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:11:14', NULL, 2025, NULL),
(508, 6, 52, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:11:14', NULL, 2025, NULL),
(509, 6, 53, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:11:14', NULL, 2025, NULL),
(510, 6, 54, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:11:14', NULL, 2025, NULL),
(511, 6, 55, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:11:14', NULL, 2025, NULL),
(512, 6, 56, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:11:14', NULL, 2025, NULL),
(513, 6, 57, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:11:14', NULL, 2025, NULL),
(514, 6, 38, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:29:55', NULL, 2025, NULL),
(515, 6, 39, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:29:55', NULL, 2025, NULL),
(516, 6, 40, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:29:55', NULL, 2025, NULL),
(517, 6, 41, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:29:55', NULL, 2025, NULL),
(518, 6, 42, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:29:55', NULL, 2025, NULL),
(519, 6, 43, 'AUDIT-67895A8F32211', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-16 20:29:55', NULL, 2025, NULL),
(520, 6, 44, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:29:55', NULL, 2025, NULL),
(521, 6, 45, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:29:55', NULL, 2025, NULL),
(522, 6, 46, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:29:55', NULL, 2025, NULL),
(523, 6, 47, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:29:55', NULL, 2025, NULL),
(524, 6, 48, 'AUDIT-67895A8F32211', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-16 20:29:55', NULL, 2025, NULL),
(525, 6, 49, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:29:55', NULL, 2025, NULL),
(526, 6, 50, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:29:55', NULL, 2025, NULL),
(527, 6, 52, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:29:55', NULL, 2025, NULL),
(528, 6, 53, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:29:55', NULL, 2025, NULL),
(529, 6, 54, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:29:55', NULL, 2025, NULL),
(530, 6, 55, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:29:55', NULL, 2025, NULL),
(531, 6, 56, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:29:55', NULL, 2025, NULL),
(532, 6, 57, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:29:55', NULL, 2025, NULL),
(533, 6, 38, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:34:54', NULL, 2025, NULL),
(534, 6, 39, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:34:54', NULL, 2025, NULL),
(535, 6, 40, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:34:54', NULL, 2025, NULL),
(536, 6, 41, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:34:54', NULL, 2025, NULL),
(537, 6, 42, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:34:54', NULL, 2025, NULL),
(538, 6, 43, 'AUDIT-67895A8F32211', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-16 20:34:54', NULL, 2025, NULL),
(539, 6, 44, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:34:54', NULL, 2025, NULL),
(540, 6, 45, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:34:54', NULL, 2025, NULL),
(541, 6, 46, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:34:54', NULL, 2025, NULL),
(542, 6, 47, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:34:54', NULL, 2025, NULL),
(543, 6, 48, 'AUDIT-67895A8F32211', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-16 20:34:54', NULL, 2025, NULL),
(544, 6, 49, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:34:54', NULL, 2025, NULL),
(545, 6, 50, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:34:54', NULL, 2025, NULL),
(546, 6, 52, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:34:54', NULL, 2025, NULL),
(547, 6, 53, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:34:54', NULL, 2025, NULL),
(548, 6, 54, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:34:54', NULL, 2025, NULL),
(549, 6, 55, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:34:54', NULL, 2025, NULL),
(550, 6, 56, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:34:54', NULL, 2025, NULL),
(551, 6, 57, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:34:54', NULL, 2025, NULL),
(552, 6, 38, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:36:05', NULL, 2025, NULL),
(553, 6, 39, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:36:05', NULL, 2025, NULL),
(554, 6, 40, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:36:05', NULL, 2025, NULL),
(555, 6, 41, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:36:05', NULL, 2025, NULL),
(556, 6, 42, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:36:05', NULL, 2025, NULL),
(557, 6, 43, 'AUDIT-67895A8F32211', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-16 20:36:05', NULL, 2025, NULL),
(558, 6, 44, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:36:05', NULL, 2025, NULL),
(559, 6, 45, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:36:05', NULL, 2025, NULL),
(560, 6, 46, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:36:05', NULL, 2025, NULL),
(561, 6, 47, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:36:05', NULL, 2025, NULL),
(562, 6, 48, 'AUDIT-67895A8F32211', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-16 20:36:05', NULL, 2025, NULL),
(563, 6, 49, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:36:05', NULL, 2025, NULL),
(564, 6, 50, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:36:05', NULL, 2025, NULL),
(565, 6, 52, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:36:05', NULL, 2025, NULL),
(566, 6, 53, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:36:05', NULL, 2025, NULL),
(567, 6, 54, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:36:05', NULL, 2025, NULL),
(568, 6, 55, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:36:05', NULL, 2025, NULL),
(569, 6, 56, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:36:05', NULL, 2025, NULL),
(570, 6, 57, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:36:05', NULL, 2025, NULL),
(571, 6, 38, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:40:35', NULL, 2025, NULL),
(572, 6, 39, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:40:35', NULL, 2025, NULL),
(573, 6, 40, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:40:35', NULL, 2025, NULL),
(574, 6, 41, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:40:35', NULL, 2025, NULL),
(575, 6, 42, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:40:35', NULL, 2025, NULL),
(576, 6, 43, 'AUDIT-67895A8F32211', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-16 20:40:35', NULL, 2025, NULL),
(577, 6, 44, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:40:35', NULL, 2025, NULL),
(578, 6, 45, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:40:35', NULL, 2025, NULL),
(579, 6, 46, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:40:35', NULL, 2025, NULL),
(580, 6, 47, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:40:35', NULL, 2025, NULL),
(581, 6, 48, 'AUDIT-67895A8F32211', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-16 20:40:35', NULL, 2025, NULL),
(582, 6, 49, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:40:35', NULL, 2025, NULL),
(583, 6, 50, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:40:35', NULL, 2025, NULL),
(584, 6, 52, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:40:35', NULL, 2025, NULL),
(585, 6, 53, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:40:35', NULL, 2025, NULL),
(586, 6, 54, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:40:35', NULL, 2025, NULL),
(587, 6, 55, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:40:35', NULL, 2025, NULL),
(588, 6, 56, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:40:35', NULL, 2025, NULL),
(589, 6, 57, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:40:35', NULL, 2025, NULL),
(590, 6, 38, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:46:11', NULL, 2025, 1737060371),
(591, 6, 39, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:46:11', NULL, 2025, 1737060371),
(592, 6, 40, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:46:11', NULL, 2025, 1737060371),
(593, 6, 41, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:46:11', NULL, 2025, 1737060371),
(594, 6, 42, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:46:11', NULL, 2025, 1737060371),
(595, 6, 43, 'AUDIT-67895A8F32211', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-16 20:46:11', NULL, 2025, 1737060371),
(596, 6, 44, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:46:11', NULL, 2025, 1737060371),
(597, 6, 45, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:46:11', NULL, 2025, 1737060371),
(598, 6, 46, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:46:11', NULL, 2025, 1737060371),
(599, 6, 47, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:46:11', NULL, 2025, 1737060371),
(600, 6, 48, 'AUDIT-67895A8F32211', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-16 20:46:11', NULL, 2025, 1737060371),
(601, 6, 49, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:46:11', NULL, 2025, 1737060371),
(602, 6, 50, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:46:11', NULL, 2025, 1737060371),
(603, 6, 52, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:46:11', NULL, 2025, 1737060371),
(604, 6, 53, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:46:11', NULL, 2025, 1737060371),
(605, 6, 54, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:46:11', NULL, 2025, 1737060371),
(606, 6, 55, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:46:11', NULL, 2025, 1737060371),
(607, 6, 56, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:46:11', NULL, 2025, 1737060371),
(608, 6, 57, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:46:11', NULL, 2025, 1737060371),
(609, 6, 38, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:46:46', NULL, 2025, 1737060406),
(610, 6, 39, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:46:46', NULL, 2025, 1737060406),
(611, 6, 40, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:46:46', NULL, 2025, 1737060406),
(612, 6, 41, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:46:46', NULL, 2025, 1737060406),
(613, 6, 42, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:46:46', NULL, 2025, 1737060406),
(614, 6, 43, 'AUDIT-67895A8F32211', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-16 20:46:46', NULL, 2025, 1737060406),
(615, 6, 44, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:46:46', NULL, 2025, 1737060406),
(616, 6, 45, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:46:46', NULL, 2025, 1737060406),
(617, 6, 46, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:46:46', NULL, 2025, 1737060406),
(618, 6, 47, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:46:46', NULL, 2025, 1737060406),
(619, 6, 48, 'AUDIT-67895A8F32211', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-16 20:46:46', NULL, 2025, 1737060406),
(620, 6, 49, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:46:46', NULL, 2025, 1737060406),
(621, 6, 50, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:46:46', NULL, 2025, 1737060406),
(622, 6, 52, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:46:46', NULL, 2025, 1737060406),
(623, 6, 53, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:46:46', NULL, 2025, 1737060406),
(624, 6, 54, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:46:46', NULL, 2025, 1737060406),
(625, 6, 55, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:46:46', NULL, 2025, 1737060406),
(626, 6, 56, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:46:46', NULL, 2025, 1737060406),
(627, 6, 57, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:46:46', NULL, 2025, 1737060406),
(628, 6, 38, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:46:49', NULL, 2025, 1737060409),
(629, 6, 39, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:46:49', NULL, 2025, 1737060409),
(630, 6, 40, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:46:49', NULL, 2025, 1737060409),
(631, 6, 41, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:46:49', NULL, 2025, 1737060409),
(632, 6, 42, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:46:49', NULL, 2025, 1737060409),
(633, 6, 43, 'AUDIT-67895A8F32211', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-16 20:46:49', NULL, 2025, 1737060409),
(634, 6, 44, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:46:49', NULL, 2025, 1737060409),
(635, 6, 45, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:46:49', NULL, 2025, 1737060409),
(636, 6, 46, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:46:49', NULL, 2025, 1737060409),
(637, 6, 47, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:46:49', NULL, 2025, 1737060409),
(638, 6, 48, 'AUDIT-67895A8F32211', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-16 20:46:49', NULL, 2025, 1737060409),
(639, 6, 49, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:46:49', NULL, 2025, 1737060409),
(640, 6, 50, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:46:49', NULL, 2025, 1737060409),
(641, 6, 52, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:46:49', NULL, 2025, 1737060409),
(642, 6, 53, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:46:49', NULL, 2025, 1737060409),
(643, 6, 54, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:46:49', NULL, 2025, 1737060409),
(644, 6, 55, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:46:49', NULL, 2025, 1737060409),
(645, 6, 56, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:46:49', NULL, 2025, 1737060409),
(646, 6, 57, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:46:49', NULL, 2025, 1737060409),
(647, 6, 38, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:47:20', NULL, 2025, 1737060440),
(648, 6, 39, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:47:20', NULL, 2025, 1737060440),
(649, 6, 40, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:47:20', NULL, 2025, 1737060440),
(650, 6, 41, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:47:20', NULL, 2025, 1737060440),
(651, 6, 42, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:47:20', NULL, 2025, 1737060440),
(652, 6, 43, 'AUDIT-67895A8F32211', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-16 20:47:20', NULL, 2025, 1737060440),
(653, 6, 44, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:47:20', NULL, 2025, 1737060440),
(654, 6, 45, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:47:20', NULL, 2025, 1737060440),
(655, 6, 46, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:47:20', NULL, 2025, 1737060440),
(656, 6, 47, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:47:20', NULL, 2025, 1737060440),
(657, 6, 48, 'AUDIT-67895A8F32211', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-16 20:47:20', NULL, 2025, 1737060440),
(658, 6, 49, 'AUDIT-67895A8F32211', 'Sudah Ada, tanpa dokumentasi', 2, NULL, 'draft', '2025-01-16 20:47:20', NULL, 2025, 1737060440),
(659, 6, 50, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:47:20', NULL, 2025, 1737060440),
(660, 6, 52, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:47:20', NULL, 2025, 1737060440),
(661, 6, 53, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:47:20', NULL, 2025, 1737060440),
(662, 6, 54, 'AUDIT-67895A8F32211', 'Sudah Ada, dan terdokumentasikan', 3, NULL, 'draft', '2025-01-16 20:47:20', NULL, 2025, 1737060440),
(663, 6, 55, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:47:20', NULL, 2025, 1737060440),
(664, 6, 56, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:47:20', NULL, 2025, 1737060440),
(665, 6, 57, 'AUDIT-67895A8F32211', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-16 20:47:20', NULL, 2025, 1737060440),
(666, 6, 38, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-17 03:09:22', NULL, 2025, 1737083362),
(667, 6, 39, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-17 03:09:22', NULL, 2025, 1737083362),
(668, 6, 40, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-17 03:09:22', NULL, 2025, 1737083362),
(669, 6, 41, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-17 03:09:22', NULL, 2025, 1737083362),
(670, 6, 42, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-17 03:09:22', NULL, 2025, 1737083362),
(671, 6, 43, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-17 03:09:22', NULL, 2025, 1737083362),
(672, 6, 44, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-17 03:09:22', NULL, 2025, 1737083362),
(673, 6, 45, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-17 03:09:22', NULL, 2025, 1737083362),
(674, 6, 46, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-17 03:09:22', NULL, 2025, 1737083362),
(675, 6, 47, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-17 03:09:22', NULL, 2025, 1737083362),
(676, 6, 48, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-17 03:09:22', NULL, 2025, 1737083362),
(677, 6, 49, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-17 03:09:22', NULL, 2025, 1737083362),
(678, 6, 50, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-17 03:09:22', NULL, 2025, 1737083362),
(679, 6, 52, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-17 03:09:22', NULL, 2025, 1737083362),
(680, 6, 53, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-17 03:09:22', NULL, 2025, 1737083362),
(681, 6, 54, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-17 03:09:22', NULL, 2025, 1737083362),
(682, 6, 55, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-17 03:09:22', NULL, 2025, 1737083362),
(683, 6, 56, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-17 03:09:22', NULL, 2025, 1737083362),
(684, 6, 57, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-17 03:09:22', NULL, 2025, 1737083362),
(685, 6, 38, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 03:13:45', NULL, 2025, 1737170025),
(686, 6, 39, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 03:13:45', NULL, 2025, 1737170025),
(687, 6, 40, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 03:13:45', NULL, 2025, 1737170025),
(688, 6, 41, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 03:13:45', NULL, 2025, 1737170025),
(689, 6, 42, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 03:13:45', NULL, 2025, 1737170025),
(690, 6, 43, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 03:13:45', NULL, 2025, 1737170025),
(691, 6, 44, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 03:13:45', NULL, 2025, 1737170025),
(692, 6, 45, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 03:13:45', NULL, 2025, 1737170025),
(693, 6, 46, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 03:13:45', NULL, 2025, 1737170025),
(694, 6, 47, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 03:13:45', NULL, 2025, 1737170025),
(695, 6, 48, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 03:13:45', NULL, 2025, 1737170025),
(696, 6, 49, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 03:13:45', NULL, 2025, 1737170025),
(697, 6, 50, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 03:13:45', NULL, 2025, 1737170025),
(698, 6, 52, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 03:13:45', NULL, 2025, 1737170025),
(699, 6, 53, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 03:13:45', NULL, 2025, 1737170025),
(700, 6, 54, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 03:13:45', NULL, 2025, 1737170025),
(701, 6, 55, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 03:13:45', NULL, 2025, 1737170025),
(702, 6, 56, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 03:13:45', NULL, 2025, 1737170025),
(703, 6, 57, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 03:13:45', NULL, 2025, 1737170025),
(704, 6, 38, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:32:13', NULL, 2025, 1737185533),
(705, 6, 39, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:32:13', NULL, 2025, 1737185533),
(706, 6, 40, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:32:13', NULL, 2025, 1737185533),
(707, 6, 41, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:32:13', NULL, 2025, 1737185533),
(708, 6, 42, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:32:13', NULL, 2025, 1737185533),
(709, 6, 43, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:32:13', NULL, 2025, 1737185533),
(710, 6, 44, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:32:13', NULL, 2025, 1737185533),
(711, 6, 45, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:32:13', NULL, 2025, 1737185533),
(712, 6, 46, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:32:13', NULL, 2025, 1737185533),
(713, 6, 47, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:32:13', NULL, 2025, 1737185533),
(714, 6, 48, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:32:13', NULL, 2025, 1737185533),
(715, 6, 49, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:32:13', NULL, 2025, 1737185533),
(716, 6, 50, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:32:13', NULL, 2025, 1737185533),
(717, 6, 52, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:32:13', NULL, 2025, 1737185533),
(718, 6, 53, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:32:13', NULL, 2025, 1737185533),
(719, 6, 54, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:32:13', NULL, 2025, 1737185533),
(720, 6, 55, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:32:13', NULL, 2025, 1737185533),
(721, 6, 56, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:32:13', NULL, 2025, 1737185533),
(722, 6, 57, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:32:13', NULL, 2025, 1737185533),
(723, 6, 38, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:57:57', NULL, 2025, 1737187077),
(724, 6, 39, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:57:57', NULL, 2025, 1737187077),
(725, 6, 40, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:57:57', NULL, 2025, 1737187077),
(726, 6, 41, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:57:57', NULL, 2025, 1737187077),
(727, 6, 42, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:57:57', NULL, 2025, 1737187077),
(728, 6, 43, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:57:57', NULL, 2025, 1737187077),
(729, 6, 44, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:57:57', NULL, 2025, 1737187077),
(730, 6, 45, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:57:57', NULL, 2025, 1737187077),
(731, 6, 46, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:57:57', NULL, 2025, 1737187077),
(732, 6, 47, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:57:57', NULL, 2025, 1737187077),
(733, 6, 48, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:57:57', NULL, 2025, 1737187077),
(734, 6, 49, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:57:57', NULL, 2025, 1737187077),
(735, 6, 50, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:57:57', NULL, 2025, 1737187077),
(736, 6, 52, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:57:57', NULL, 2025, 1737187077),
(737, 6, 53, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:57:57', NULL, 2025, 1737187077),
(738, 6, 54, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:57:57', NULL, 2025, 1737187077),
(739, 6, 55, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:57:57', NULL, 2025, 1737187077),
(740, 6, 56, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:57:57', NULL, 2025, 1737187077),
(741, 6, 57, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 07:57:57', NULL, 2025, 1737187077),
(742, 6, 38, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 08:33:08', NULL, 2025, 1737189188),
(743, 6, 39, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 08:33:08', NULL, 2025, 1737189188),
(744, 6, 40, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 08:33:08', NULL, 2025, 1737189188),
(745, 6, 41, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 08:33:08', NULL, 2025, 1737189188),
(746, 6, 42, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 08:33:08', NULL, 2025, 1737189188),
(747, 6, 43, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 08:33:08', NULL, 2025, 1737189188),
(748, 6, 44, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 08:33:08', NULL, 2025, 1737189188),
(749, 6, 45, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 08:33:08', NULL, 2025, 1737189188),
(750, 6, 46, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 08:33:08', NULL, 2025, 1737189188),
(751, 6, 47, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 08:33:08', NULL, 2025, 1737189188),
(752, 6, 48, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 08:33:08', NULL, 2025, 1737189188),
(753, 6, 49, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 08:33:08', NULL, 2025, 1737189188),
(754, 6, 50, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 08:33:08', NULL, 2025, 1737189188),
(755, 6, 52, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 08:33:08', NULL, 2025, 1737189188),
(756, 6, 53, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 08:33:08', NULL, 2025, 1737189188),
(757, 6, 54, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 08:33:08', NULL, 2025, 1737189188);
INSERT INTO `asesmen_jawaban` (`id`, `user_id`, `question_id`, `asesmen_kode`, `jawaban`, `skor`, `file_path`, `status`, `created_at`, `asesor_id`, `periode_audit`, `score_session_id`) VALUES
(758, 6, 55, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 08:33:08', NULL, 2025, 1737189188),
(759, 6, 56, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 08:33:08', NULL, 2025, 1737189188),
(760, 6, 57, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 08:33:08', NULL, 2025, 1737189188),
(761, 6, 38, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:26', NULL, 2025, 1737204806),
(762, 6, 39, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:26', NULL, 2025, 1737204806),
(763, 6, 40, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:26', NULL, 2025, 1737204806),
(764, 6, 41, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:26', NULL, 2025, 1737204806),
(765, 6, 42, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:26', NULL, 2025, 1737204806),
(766, 6, 43, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:26', NULL, 2025, 1737204806),
(767, 6, 44, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:26', NULL, 2025, 1737204806),
(768, 6, 45, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:26', NULL, 2025, 1737204806),
(769, 6, 46, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:26', NULL, 2025, 1737204806),
(770, 6, 47, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:26', NULL, 2025, 1737204806),
(771, 6, 48, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:26', NULL, 2025, 1737204806),
(772, 6, 49, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:26', NULL, 2025, 1737204806),
(773, 6, 50, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:26', NULL, 2025, 1737204806),
(774, 6, 52, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:26', NULL, 2025, 1737204806),
(775, 6, 53, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:26', NULL, 2025, 1737204806),
(776, 6, 54, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:26', NULL, 2025, 1737204806),
(777, 6, 55, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:26', NULL, 2025, 1737204806),
(778, 6, 56, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:26', NULL, 2025, 1737204806),
(779, 6, 57, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:26', NULL, 2025, 1737204806),
(780, 6, 38, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:40', NULL, 2025, 1737204820),
(781, 6, 39, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:40', NULL, 2025, 1737204820),
(782, 6, 40, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:40', NULL, 2025, 1737204820),
(783, 6, 41, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:40', NULL, 2025, 1737204820),
(784, 6, 42, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:40', NULL, 2025, 1737204820),
(785, 6, 43, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:40', NULL, 2025, 1737204820),
(786, 6, 44, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:40', NULL, 2025, 1737204820),
(787, 6, 45, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:40', NULL, 2025, 1737204820),
(788, 6, 46, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:40', NULL, 2025, 1737204820),
(789, 6, 47, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:40', NULL, 2025, 1737204820),
(790, 6, 48, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:40', NULL, 2025, 1737204820),
(791, 6, 49, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:40', NULL, 2025, 1737204820),
(792, 6, 50, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:40', NULL, 2025, 1737204820),
(793, 6, 52, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:40', NULL, 2025, 1737204820),
(794, 6, 53, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:40', NULL, 2025, 1737204820),
(795, 6, 54, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:40', NULL, 2025, 1737204820),
(796, 6, 55, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:40', NULL, 2025, 1737204820),
(797, 6, 56, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:40', NULL, 2025, 1737204820),
(798, 6, 57, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 12:53:40', NULL, 2025, 1737204820),
(799, 6, 38, 'ASESMEN-678B91E2C1D49', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 12:54:33', NULL, 2025, 1737204873),
(800, 6, 39, 'ASESMEN-678B91E2C1D49', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 12:54:33', NULL, 2025, 1737204873),
(801, 6, 40, 'ASESMEN-678B91E2C1D49', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 12:54:33', NULL, 2025, 1737204873),
(802, 6, 41, 'ASESMEN-678B91E2C1D49', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 12:54:33', NULL, 2025, 1737204873),
(803, 6, 42, 'ASESMEN-678B91E2C1D49', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 12:54:33', NULL, 2025, 1737204873),
(804, 6, 43, 'ASESMEN-678B91E2C1D49', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 12:54:33', NULL, 2025, 1737204873),
(805, 6, 44, 'ASESMEN-678B91E2C1D49', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 12:54:33', NULL, 2025, 1737204873),
(806, 6, 45, 'ASESMEN-678B91E2C1D49', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 12:54:33', NULL, 2025, 1737204873),
(807, 6, 46, 'ASESMEN-678B91E2C1D49', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 12:54:33', NULL, 2025, 1737204873),
(808, 6, 47, 'ASESMEN-678B91E2C1D49', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 12:54:33', NULL, 2025, 1737204873),
(809, 6, 48, 'ASESMEN-678B91E2C1D49', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 12:54:33', NULL, 2025, 1737204873),
(810, 6, 49, 'ASESMEN-678B91E2C1D49', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 12:54:33', NULL, 2025, 1737204873),
(811, 6, 50, 'ASESMEN-678B91E2C1D49', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 12:54:33', NULL, 2025, 1737204873),
(812, 6, 52, 'ASESMEN-678B91E2C1D49', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 12:54:33', NULL, 2025, 1737204873),
(813, 6, 53, 'ASESMEN-678B91E2C1D49', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 12:54:33', NULL, 2025, 1737204873),
(814, 6, 54, 'ASESMEN-678B91E2C1D49', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 12:54:33', NULL, 2025, 1737204873),
(815, 6, 55, 'ASESMEN-678B91E2C1D49', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 12:54:33', NULL, 2025, 1737204873),
(816, 6, 56, 'ASESMEN-678B91E2C1D49', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 12:54:33', NULL, 2025, 1737204873),
(817, 6, 57, 'ASESMEN-678B91E2C1D49', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-18 12:54:33', NULL, 2025, 1737204873),
(818, 6, 38, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 13:10:30', NULL, 2025, 1737205830),
(819, 6, 39, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 13:10:30', NULL, 2025, 1737205830),
(820, 6, 40, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 13:10:30', NULL, 2025, 1737205830),
(821, 6, 41, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 13:10:30', NULL, 2025, 1737205830),
(822, 6, 42, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 13:10:30', NULL, 2025, 1737205830),
(823, 6, 43, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 13:10:30', NULL, 2025, 1737205830),
(824, 6, 44, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 13:10:30', NULL, 2025, 1737205830),
(825, 6, 45, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 13:10:30', NULL, 2025, 1737205830),
(826, 6, 46, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 13:10:30', NULL, 2025, 1737205830),
(827, 6, 47, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 13:10:30', NULL, 2025, 1737205830),
(828, 6, 48, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 13:10:30', NULL, 2025, 1737205830),
(829, 6, 49, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 13:10:30', NULL, 2025, 1737205830),
(830, 6, 50, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 13:10:30', NULL, 2025, 1737205830),
(831, 6, 52, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 13:10:30', NULL, 2025, 1737205830),
(832, 6, 53, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 13:10:30', NULL, 2025, 1737205830),
(833, 6, 54, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 13:10:30', NULL, 2025, 1737205830),
(834, 6, 55, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 13:10:30', NULL, 2025, 1737205830),
(835, 6, 56, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 13:10:30', NULL, 2025, 1737205830),
(836, 6, 57, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-18 13:10:30', NULL, 2025, 1737205830),
(837, 6, 38, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:31:10', NULL, 2025, 1737351070),
(838, 6, 39, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:31:10', NULL, 2025, 1737351070),
(839, 6, 40, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:31:10', NULL, 2025, 1737351070),
(840, 6, 41, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:31:10', NULL, 2025, 1737351070),
(841, 6, 42, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:31:10', NULL, 2025, 1737351070),
(842, 6, 43, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:31:10', NULL, 2025, 1737351070),
(843, 6, 44, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:31:10', NULL, 2025, 1737351070),
(844, 6, 45, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:31:10', NULL, 2025, 1737351070),
(845, 6, 46, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:31:10', NULL, 2025, 1737351070),
(846, 6, 47, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:31:10', NULL, 2025, 1737351070),
(847, 6, 48, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:31:10', NULL, 2025, 1737351070),
(848, 6, 49, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:31:10', NULL, 2025, 1737351070),
(849, 6, 50, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:31:10', NULL, 2025, 1737351070),
(850, 6, 52, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:31:10', NULL, 2025, 1737351070),
(851, 6, 53, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:31:10', NULL, 2025, 1737351070),
(852, 6, 54, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:31:10', NULL, 2025, 1737351070),
(853, 6, 55, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:31:10', NULL, 2025, 1737351070),
(854, 6, 56, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:31:10', NULL, 2025, 1737351070),
(855, 6, 57, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:31:10', NULL, 2025, 1737351070),
(856, 6, 38, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:36:56', NULL, 2025, 1737351416),
(857, 6, 39, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:36:56', NULL, 2025, 1737351416),
(858, 6, 40, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:36:56', NULL, 2025, 1737351416),
(859, 6, 41, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:36:56', NULL, 2025, 1737351416),
(860, 6, 42, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:36:56', NULL, 2025, 1737351416),
(861, 6, 43, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:36:56', NULL, 2025, 1737351416),
(862, 6, 44, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:36:56', NULL, 2025, 1737351416),
(863, 6, 45, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:36:56', NULL, 2025, 1737351416),
(864, 6, 46, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:36:56', NULL, 2025, 1737351416),
(865, 6, 47, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:36:56', NULL, 2025, 1737351416),
(866, 6, 48, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:36:56', NULL, 2025, 1737351416),
(867, 6, 49, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:36:56', NULL, 2025, 1737351416),
(868, 6, 50, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:36:56', NULL, 2025, 1737351416),
(869, 6, 52, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:36:56', NULL, 2025, 1737351416),
(870, 6, 53, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:36:56', NULL, 2025, 1737351416),
(871, 6, 54, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:36:56', NULL, 2025, 1737351416),
(872, 6, 55, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:36:56', NULL, 2025, 1737351416),
(873, 6, 56, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:36:56', NULL, 2025, 1737351416),
(874, 6, 57, 'AUDIT-678B58BED30CD', 'Belum Ada, masih di inisiasikan', 1, NULL, 'draft', '2025-01-20 05:36:56', NULL, 2025, 1737351416),
(875, 6, 38, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 05:46:05', NULL, 2025, 1737351965),
(876, 6, 39, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 05:46:05', NULL, 2025, 1737351965),
(877, 6, 40, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 05:46:05', NULL, 2025, 1737351965),
(878, 6, 41, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 05:46:05', NULL, 2025, 1737351965),
(879, 6, 42, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 05:46:05', NULL, 2025, 1737351965),
(880, 6, 43, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 05:46:05', NULL, 2025, 1737351965),
(881, 6, 44, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 05:46:05', NULL, 2025, 1737351965),
(882, 6, 45, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 05:46:05', NULL, 2025, 1737351965),
(883, 6, 46, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 05:46:05', NULL, 2025, 1737351965),
(884, 6, 47, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 05:46:05', NULL, 2025, 1737351965),
(885, 6, 48, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 05:46:05', NULL, 2025, 1737351965),
(886, 6, 49, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 05:46:05', NULL, 2025, 1737351965),
(887, 6, 50, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 05:46:05', NULL, 2025, 1737351965),
(888, 6, 52, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 05:46:05', NULL, 2025, 1737351965),
(889, 6, 53, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 05:46:05', NULL, 2025, 1737351965),
(890, 6, 54, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 05:46:05', NULL, 2025, 1737351965),
(891, 6, 55, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 05:46:05', NULL, 2025, 1737351965),
(892, 6, 56, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 05:46:05', NULL, 2025, 1737351965),
(893, 6, 57, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 05:46:05', NULL, 2025, 1737351965),
(894, 6, 38, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 08:20:52', NULL, 2025, 1737361252),
(895, 6, 39, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 08:20:52', NULL, 2025, 1737361252),
(896, 6, 40, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 08:20:52', NULL, 2025, 1737361252),
(897, 6, 41, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 08:20:52', NULL, 2025, 1737361252),
(898, 6, 42, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 08:20:52', NULL, 2025, 1737361252),
(899, 6, 43, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 08:20:52', NULL, 2025, 1737361252),
(900, 6, 44, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 08:20:52', NULL, 2025, 1737361252),
(901, 6, 45, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 08:20:52', NULL, 2025, 1737361252),
(902, 6, 46, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 08:20:52', NULL, 2025, 1737361252),
(903, 6, 47, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 08:20:52', NULL, 2025, 1737361252),
(904, 6, 48, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 08:20:52', NULL, 2025, 1737361252),
(905, 6, 49, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 08:20:52', NULL, 2025, 1737361252),
(906, 6, 50, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 08:20:52', NULL, 2025, 1737361252),
(907, 6, 52, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 08:20:52', NULL, 2025, 1737361252),
(908, 6, 53, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 08:20:52', NULL, 2025, 1737361252),
(909, 6, 54, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 08:20:52', NULL, 2025, 1737361252),
(910, 6, 55, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 08:20:52', NULL, 2025, 1737361252),
(911, 6, 56, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 08:20:52', NULL, 2025, 1737361252),
(912, 6, 57, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 08:20:52', NULL, 2025, 1737361252),
(913, 6, 38, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 11:58:36', NULL, 2025, 1737374316),
(914, 6, 39, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 11:58:36', NULL, 2025, 1737374316),
(915, 6, 40, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 11:58:36', NULL, 2025, 1737374316),
(916, 6, 41, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 11:58:36', NULL, 2025, 1737374316),
(917, 6, 42, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 11:58:36', NULL, 2025, 1737374316),
(918, 6, 43, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 11:58:36', NULL, 2025, 1737374316),
(919, 6, 44, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 11:58:36', NULL, 2025, 1737374316),
(920, 6, 45, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 11:58:36', NULL, 2025, 1737374316),
(921, 6, 46, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 11:58:36', NULL, 2025, 1737374316),
(922, 6, 47, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 11:58:36', NULL, 2025, 1737374316),
(923, 6, 48, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 11:58:36', NULL, 2025, 1737374316),
(924, 6, 49, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 11:58:36', NULL, 2025, 1737374316),
(925, 6, 50, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 11:58:36', NULL, 2025, 1737374316),
(926, 6, 52, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 11:58:36', NULL, 2025, 1737374316),
(927, 6, 53, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 11:58:36', NULL, 2025, 1737374316),
(928, 6, 54, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 11:58:36', NULL, 2025, 1737374316),
(929, 6, 55, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 11:58:36', NULL, 2025, 1737374316),
(930, 6, 56, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 11:58:36', NULL, 2025, 1737374316),
(931, 6, 57, 'AUDIT-67895A8F32211', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 11:58:36', NULL, 2025, 1737374316),
(932, 6, 60, 'ASESMEN-678E60AEAF6D8', 'Belum Terfikirkan', 0, NULL, 'draft', '2025-01-20 15:08:05', NULL, 2026, 1737385685),
(933, 6, 60, 'ASESMEN-678E60AEAF6D8', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-20 15:08:15', NULL, 2026, 1737385695),
(934, 6, 60, 'ASESMEN-678E60AEAF6D8', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-20 15:10:15', NULL, 2026, 1737385815),
(935, 6, 60, 'ASESMEN-678E60AEAF6D8', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-20 15:11:55', NULL, 2026, 1737385915),
(936, 6, 60, 'ASESMEN-678E60AEAF6D8', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-20 15:13:15', NULL, 2026, 1737385995),
(937, 6, 60, 'ASESMEN-678E60AEAF6D8', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-20 15:28:57', 9, 2026, 1737386937),
(938, 6, 60, 'ASESMEN-678E60AEAF6D8', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-20 15:36:35', 9, 2026, 1737387395),
(939, 6, 60, 'ASESMEN-678E60AEAF6D8', 'Sudah Ada, terdokumentasi dan termonitoring', 4, NULL, 'draft', '2025-01-20 15:39:22', 9, 2026, 1737387562),
(940, 6, 38, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 15:55:49', 7, 2025, 1737388549),
(941, 6, 39, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 15:55:49', 7, 2025, 1737388549),
(942, 6, 40, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 15:55:49', 7, 2025, 1737388549),
(943, 6, 59, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 15:55:49', 7, 2025, 1737388549),
(944, 6, 41, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 15:55:49', 7, 2025, 1737388549),
(945, 6, 42, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 15:55:49', 7, 2025, 1737388549),
(946, 6, 43, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 15:55:49', 7, 2025, 1737388549),
(947, 6, 44, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 15:55:49', 7, 2025, 1737388549),
(948, 6, 45, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 15:55:49', 7, 2025, 1737388549),
(949, 6, 46, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 15:55:49', 7, 2025, 1737388549),
(950, 6, 47, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 15:55:49', 7, 2025, 1737388549),
(951, 6, 48, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 15:55:49', 7, 2025, 1737388549),
(952, 6, 49, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 15:55:49', 7, 2025, 1737388549),
(953, 6, 50, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 15:55:49', 7, 2025, 1737388549),
(954, 6, 52, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 15:55:49', 7, 2025, 1737388549),
(955, 6, 53, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 15:55:49', 7, 2025, 1737388549),
(956, 6, 54, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 15:55:49', 7, 2025, 1737388549),
(957, 6, 55, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 15:55:49', 7, 2025, 1737388549),
(958, 6, 56, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 15:55:49', 7, 2025, 1737388549),
(959, 6, 57, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-20 15:55:49', 7, 2025, 1737388549),
(960, 6, 38, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-21 10:42:36', 7, 2025, 1737456156),
(961, 6, 39, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-21 10:42:36', 7, 2025, 1737456156),
(962, 6, 40, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-21 10:42:36', 7, 2025, 1737456156),
(963, 6, 59, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-21 10:42:36', 7, 2025, 1737456156),
(964, 6, 41, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-21 10:42:36', 7, 2025, 1737456156),
(965, 6, 42, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-21 10:42:36', 7, 2025, 1737456156),
(966, 6, 43, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-21 10:42:36', 7, 2025, 1737456156),
(967, 6, 44, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-21 10:42:36', 7, 2025, 1737456156),
(968, 6, 45, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-21 10:42:36', 7, 2025, 1737456156),
(969, 6, 46, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-21 10:42:36', 7, 2025, 1737456156),
(970, 6, 47, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-21 10:42:36', 7, 2025, 1737456156),
(971, 6, 48, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-21 10:42:36', 7, 2025, 1737456156),
(972, 6, 49, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-21 10:42:36', 7, 2025, 1737456156),
(973, 6, 50, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-21 10:42:36', 7, 2025, 1737456156),
(974, 6, 52, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-21 10:42:36', 7, 2025, 1737456156),
(975, 6, 53, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-21 10:42:36', 7, 2025, 1737456156),
(976, 6, 54, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-21 10:42:36', 7, 2025, 1737456156),
(977, 6, 55, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-21 10:42:36', 7, 2025, 1737456156),
(978, 6, 56, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-21 10:42:36', 7, 2025, 1737456156),
(979, 6, 57, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-21 10:42:36', 7, 2025, 1737456156),
(980, 6, 38, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-23 08:41:00', 7, 2025, 1737621660),
(981, 6, 39, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-23 08:41:00', 7, 2025, 1737621660),
(982, 6, 40, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-23 08:41:00', 7, 2025, 1737621660),
(983, 6, 59, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-23 08:41:00', 7, 2025, 1737621660),
(984, 6, 61, 'ASESMEN-678E4FB55F8E7', 'Belum Terfikirkan', 0, NULL, 'draft', '2025-01-23 08:41:00', 7, 2025, 1737621660),
(985, 6, 62, 'ASESMEN-678E4FB55F8E7', 'Belum Terfikirkan', 0, NULL, 'draft', '2025-01-23 08:41:00', 7, 2025, 1737621660),
(986, 6, 41, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-23 08:41:00', 7, 2025, 1737621660),
(987, 6, 42, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-23 08:41:00', 7, 2025, 1737621660),
(988, 6, 43, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-23 08:41:00', 7, 2025, 1737621660),
(989, 6, 44, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-23 08:41:00', 7, 2025, 1737621660),
(990, 6, 45, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-23 08:41:00', 7, 2025, 1737621660),
(991, 6, 46, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-23 08:41:00', 7, 2025, 1737621660),
(992, 6, 47, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-23 08:41:00', 7, 2025, 1737621660),
(993, 6, 48, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-23 08:41:00', 7, 2025, 1737621660),
(994, 6, 49, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-23 08:41:00', 7, 2025, 1737621660),
(995, 6, 50, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-23 08:41:00', 7, 2025, 1737621660),
(996, 6, 52, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-23 08:41:00', 7, 2025, 1737621660),
(997, 6, 53, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-23 08:41:00', 7, 2025, 1737621660),
(998, 6, 54, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-23 08:41:00', 7, 2025, 1737621660),
(999, 6, 55, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-23 08:41:00', 7, 2025, 1737621660),
(1000, 6, 56, 'ASESMEN-678E4FB55F8E7', 'Sudah Ada, dan sudah Optimal', 5, NULL, 'draft', '2025-01-23 08:41:00', 7, 2025, 1737621660),
(1001, 6, 57, 'ASESMEN-678E4FB55F8E7', 'Belum Terfikirkan', 0, NULL, 'draft', '2025-01-23 08:41:00', 7, 2025, 1737621660);

--
-- Triggers `asesmen_jawaban`
--
DELIMITER $$
CREATE TRIGGER `after_assessment_answers_update` AFTER UPDATE ON `asesmen_jawaban` FOR EACH ROW BEGIN
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
-- Table structure for table `asesmen_pertanyaan`
--

CREATE TABLE `asesmen_pertanyaan` (
  `id` int(11) NOT NULL,
  `kode_mapping` varchar(255) NOT NULL,
  `asesmen_periode` int(11) DEFAULT NULL,
  `pertanyaan` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `asesor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `asesmen_pertanyaan`
--

INSERT INTO `asesmen_pertanyaan` (`id`, `kode_mapping`, `asesmen_periode`, `pertanyaan`, `created_at`, `asesor_id`) VALUES
(38, '1_Continual Service Improvement_5', 2025, 'Apakah kejadian yang mungkin mengganggu proses bisnis telah diidentifikasi (contoh : kebakaran, banjir, gempa, dll)?', '2025-01-09 02:36:32', 7),
(39, '1_Continual Service Improvement_6', 2025, 'Apakah Strategy Plan dikembangkan berdasarkan hasil penilaian risiko ini untuk menentukan pendekatan menyeluruh dalam Business Continuity Plan?\r\n', '2025-01-09 02:36:45', 7),
(40, '1_Continual Service Improvement_7', 2025, 'Apakah terdapat proses yang mengatur pengembangan dan pembangunan keberlanjutan bisnis diseluruh organisasi?', '2025-01-09 02:37:01', 7),
(41, '1_Service Design_1', 2025, 'Apakah terdapat catatan inventaris aset penting yang berhubungan dengan sistem informasi?\r\n', '2025-01-09 02:37:17', 7),
(42, '1_Service Design_2', 2025, 'Apakah klasifikasi keamanan dan identifikasi keamanan lokasi aset telah didefinisikan?\r\n', '2025-01-09 02:37:26', 7),
(43, '1_Service Design_3', 2025, 'Apakah terdapat skema atau pedoman klasifikasi yang membantu dalam menentukan penanganan dan penjagaan informasi?\r\n', '2025-01-09 02:37:40', 7),
(44, '1_Service Design_4', 2025, 'Apakah terdapat prosedur labelling dan handling informasi berdasarkan skema klasifikasi informasi organisasi?\r\n', '2025-01-09 02:37:52', 7),
(45, '1_Service Operation_1', 2025, 'Apakah Kebijakan Keamanan telah mengidentifikasikan setiap prosedur operasional (contoh : back-up, pengecekan perlengkapan, proses pemeliharaan, dll) ?\r\n', '2025-01-09 02:38:16', 7),
(46, '1_Service Operation_2', 2025, 'Apakah semua program dalam sistem produksi tunduk dengan peraturan change control ?\r\n', '2025-01-09 02:38:24', 7),
(47, '1_Service Operation_3', 2025, 'Apakah audit log dilakukan untuk setiap perubahan dalam program produksi?\r\n', '2025-01-09 02:38:35', 7),
(48, '1_Service Operation_5', 2025, 'Apakah kapasitas ( contoh : Hard disk space, RAM, CPU, server) dimonitoring dan peramalan kebutuhan kapasitas dilakukan?\r\n', '2025-01-09 02:38:44', 7),
(49, '1_Service Strategy_1', 2025, 'Apakah terdapat dokumen Kebijakan Keamanan Informasi yang sudah disetujui oleh pihak manajemen dan telah dikomunikasikan kepada seluruh karyawan?\r\n', '2025-01-09 02:39:02', 7),
(50, '1_Service Strategy_2', 2025, 'Apakah dokumen Kebijakan Keamanan Informasi telah membahas komitmen pihak manajemen terhadap keamanan TI?\r\n', '2025-01-09 02:39:12', 7),
(52, '1_Service Strategy_3', 2025, 'Apakah terdapat penanggung jawab terhadap dokumen Kebijakan Keamanan Informasi, baik untuk melakukan perubahan maupun penilaian pencapain ?\r\n', '2025-01-09 02:39:31', 7),
(53, '1_Service Strategy_4', 2025, 'Apakah terdapat forum yang membahas keamanan informasi ?\r\n', '2025-01-09 02:39:47', 7),
(54, '1_Service Transition_1', 2025, 'Apakah kebutuhan akan keamanan merupakan bagian dari kebutuhan bisnis yang dinyatakan untuk sistem atau peningkatan sistem yang sudah ada sebelumnya?', '2025-01-09 02:40:41', 7),
(55, '1_Service Transition_2', 2025, 'Apakah identifikasi kebutuhan dan kontrol keamanan telah mencerminkan nilai bisnis dari aset informasi, termasuk konsekuensi akan kegagalan keamanan?\r\n', '2025-01-09 02:40:50', 7),
(56, '1_Service Transition_3', 2025, 'Apakah penilaian risiko telah selesai sebelum pengembangan sistem dilakukan?\r\n', '2025-01-09 02:41:00', 7),
(57, '1_Service Transition_4', 2025, 'Apakah data inputterhadap sistem aplikasi divalidasi untuk memastikan data yang dimasukkan adalah benar dan sesuai?\r\n', '2025-01-09 02:41:09', 7);

-- --------------------------------------------------------

--
-- Table structure for table `cobit`
--

CREATE TABLE `cobit` (
  `id` int(11) NOT NULL,
  `versi` varchar(255) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `process_id` varchar(10) DEFAULT NULL,
  `process_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cobit`
--

INSERT INTO `cobit` (`id`, `versi`, `domain`, `process_id`, `process_name`) VALUES
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
-- Table structure for table `iso`
--

CREATE TABLE `iso` (
  `id` int(11) NOT NULL,
  `versi` varchar(255) DEFAULT NULL,
  `annex` varchar(50) NOT NULL,
  `control` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `iso`
--

INSERT INTO `iso` (`id`, `versi`, `annex`, `control`) VALUES
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
-- Table structure for table `itil`
--

CREATE TABLE `itil` (
  `id` int(11) NOT NULL,
  `versi` varchar(255) DEFAULT NULL,
  `service_lifecycle` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `itil`
--

INSERT INTO `itil` (`id`, `versi`, `service_lifecycle`) VALUES
(1, 'ITIL v3', 'Service Strategy'),
(2, 'ITIL v3', 'Service Design'),
(3, 'ITIL v3', 'Service Transition'),
(4, 'ITIL v3', 'Service Operation'),
(5, 'ITIL v3', 'Continual Service Improvement');

-- --------------------------------------------------------

--
-- Table structure for table `log_aktivitas`
--

CREATE TABLE `log_aktivitas` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `aktivitas` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log_aktivitas`
--

INSERT INTO `log_aktivitas` (`id`, `user_id`, `aktivitas`, `timestamp`) VALUES
(0, 1, 'Login ke sistem', '2025-01-15 05:33:10'),
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
-- Table structure for table `mapping_criteria`
--

CREATE TABLE `mapping_criteria` (
  `id` int(11) NOT NULL,
  `kode_mapping` varchar(255) NOT NULL,
  `jenis_kriteria` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mapping_criteria`
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
-- Table structure for table `mapping_standard`
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
-- Dumping data for table `mapping_standard`
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
(29, '1', 'ITIL v3', 'Continual Service Improvement', 'DS4.4', 'Maintenance of the IT Continuity Plan', 7, '1_Continual Service Improvement_7', 'COBIT 4.1', 'A 9.1.1', 'Access Control Policy', 'BS 7799:2002', '2025-01-05 22:44:14'),
(0, '2', 'ITIL v3', 'Service Strategy', 'AI1.2', 'Risk Analysis Report', 1, '2_Service Strategy_1', 'COBIT 4.1', 'A.5.1.1', 'Policies for information security', 'ISO 27002:2013', '2025-01-27 03:41:44');

-- --------------------------------------------------------

--
-- Table structure for table `maturity`
--

CREATE TABLE `maturity` (
  `id` int(11) NOT NULL,
  `jenis` varchar(255) NOT NULL,
  `kondisi` varchar(255) NOT NULL,
  `skor` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `maturity`
--

INSERT INTO `maturity` (`id`, `jenis`, `kondisi`, `skor`, `created_at`) VALUES
(8, 'Maturity Level', 'Belum Terfikirkan', 0, '2025-01-07 16:02:24'),
(9, 'Maturity Level', 'Belum Ada, masih di inisiasikan', 1, '2025-01-07 16:02:43'),
(10, 'Maturity Level', 'Sudah Ada, tanpa dokumentasi', 2, '2025-01-07 16:03:29'),
(11, 'Maturity Level', 'Sudah Ada, dan terdokumentasikan', 3, '2025-01-07 16:03:43'),
(12, 'Maturity Level', 'Sudah Ada, terdokumentasi dan termonitoring', 4, '2025-01-07 16:03:55'),
(13, 'Maturity Level', 'Sudah Ada, dan sudah Optimal', 5, '2025-01-07 16:04:08');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Admin','Asesi','Asesor') NOT NULL,
  `institusi` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`, `institusi`, `created_at`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', 'Admin', 'Dinas Kominfo Provinsi Jawa Timur', '2025-01-05 07:45:08'),
(6, 'it_kominfogresik', '202cb962ac59075b964b07152d234b70', 'Asesi', 'Dinas Kominfo Kabupaten Gresik', '2025-01-07 16:37:23'),
(7, 'kominfojatim', '202cb962ac59075b964b07152d234b70', 'Asesor', 'Dinas Kominfo Provinsi Jawa Timur', '2025-01-20 10:04:03'),
(9, 'kominfojakarta', '202cb962ac59075b964b07152d234b70', 'Asesor', 'Dinas Kominfo Provinsi DKI Jakarta', '2025-01-20 13:54:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `asesi`
--
ALTER TABLE `asesi`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_audit` (`asesmen_kode`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `asesmen_hasil`
--
ALTER TABLE `asesmen_hasil`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `asesmen_jawaban`
--
ALTER TABLE `asesmen_jawaban`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `asesmen_pertanyaan`
--
ALTER TABLE `asesmen_pertanyaan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_mapping` (`kode_mapping`),
  ADD KEY `fk_asesor` (`asesor_id`);

--
-- Indexes for table `cobit`
--
ALTER TABLE `cobit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `iso`
--
ALTER TABLE `iso`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `itil`
--
ALTER TABLE `itil`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `mapping_criteria`
--
ALTER TABLE `mapping_criteria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kode_mapping` (`kode_mapping`);

--
-- Indexes for table `maturity`
--
ALTER TABLE `maturity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `asesi`
--
ALTER TABLE `asesi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `asesmen_hasil`
--
ALTER TABLE `asesmen_hasil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `asesmen_jawaban`
--
ALTER TABLE `asesmen_jawaban`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1002;

--
-- AUTO_INCREMENT for table `asesmen_pertanyaan`
--
ALTER TABLE `asesmen_pertanyaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `asesmen_pertanyaan`
--
ALTER TABLE `asesmen_pertanyaan`
  ADD CONSTRAINT `fk_asesor` FOREIGN KEY (`asesor_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
