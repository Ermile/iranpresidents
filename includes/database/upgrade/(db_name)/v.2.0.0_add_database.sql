-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 13, 2018 at 05:36 AM
-- Server version: 5.7.21-0ubuntu0.17.10.1
-- PHP Version: 7.1.14-1+ubuntu17.10.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `election`
--

-- --------------------------------------------------------

--
-- Table structure for table `candidas`
--

CREATE TABLE `candidas` (
  `id` int(10) UNSIGNED NOT NULL,
  `election_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `family` varchar(255) NOT NULL,
  `father` varchar(255) DEFAULT NULL,
  `fame` varchar(255) DEFAULT NULL,
  `nationalcode` varchar(255) DEFAULT NULL,
  `birthdate` datetime DEFAULT NULL,
  `electioncode` varchar(255) DEFAULT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  `file_url_2` varchar(255) DEFAULT NULL,
  `win_url` varchar(255) DEFAULT NULL,
  `status` enum('active','cancel') NOT NULL DEFAULT 'active',
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `meta` mediumtext CHARACTER SET utf8mb4,
  `en_url` varchar(500) DEFAULT NULL,
  `en_name` varchar(255) NOT NULL,
  `en_family` varchar(255) NOT NULL,
  `en_father` varchar(255) DEFAULT NULL,
  `en_fame` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `candidas`
--

INSERT INTO `candidas` (`id`, `election_id`, `name`, `family`, `father`, `fame`, `nationalcode`, `birthdate`, `electioncode`, `file_url`, `file_url_2`, `win_url`, `status`, `createdate`, `date_modified`, `desc`, `meta`, `en_url`, `en_name`, `en_family`, `en_father`, `en_fame`) VALUES
(1, 1, 'حسن', 'روحانی', 'اسدالله', 'روحانی', '4569637574', '1948-11-12 00:00:00', NULL, '/files/election/iran-president-1396-hassan_rouhani.jpg', '/files/election/iran-president-1396-hassan_rouhani-vs.jpg', '/files/election/iran-president-1396-hassan_rouhani-winner.jpg', 'active', '2017-05-09 13:43:48', '2017-05-20 12:42:13', NULL, NULL, NULL, 'Hassan', 'Rouhani', 'Asadollah', 'Rouhani'),
(3, 1, 'سید ابراهیم', 'رئيس‌الساداتی', 'سید', 'رئیسی', NULL, '1960-12-14 00:00:00', NULL, '/files/election/iran-president-1396-ebrahim_raisos_sadati(raisi).jpg', '/files/election/iran-president-1396-ebrahim_raisos_sadati(raisi)-vs.jpg', NULL, 'active', '2017-05-09 15:39:58', '2017-05-20 12:42:20', NULL, NULL, NULL, 'Ebrahim', 'raisos sadati', 'Seyyed', 'Raisi'),
(4, 1, 'سید مصطفی', 'آقامیرسلیم', 'جلال', 'میرسلیم', NULL, '1947-06-10 00:00:00', NULL, '/files/election/iran-president-1396-mostafa_agha_mirsalim(mirsalim).jpg', NULL, NULL, 'active', '2017-05-09 15:45:24', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Mostafa', 'Agha Mirsalim', 'Seyyed Jalal', 'Mirsalim'),
(5, 13, '‌', 'باطله', NULL, NULL, NULL, NULL, NULL, '/files/election/unacceptable.jpg', NULL, NULL, 'active', '2017-05-09 15:49:07', '2017-05-19 12:49:54', NULL, NULL, NULL, '‌', 'unacceptable', NULL, NULL),
(6, 1, 'سید مصطفی', 'هاشمی‌طبا', 'سید ابوالقاسم', 'هاشمی‌طبا', NULL, '1946-05-22 00:00:00', NULL, '/files/election/iran-president-1396-mostafa_hashemitaba.jpg', NULL, NULL, 'active', '2017-05-09 15:52:28', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Mostafa', 'Hashemitaba', 'Seyyed Abolghasem', 'Hashemitaba'),
(7, 2, 'حسن', 'روحانی', 'اسدالله', 'روحانی', NULL, '1948-11-12 00:00:00', NULL, '/files/election/iran-president-1392-hassan_rouhani-winner.jpg', '/files/election/iran-president-1392-hassan_rouhani-vs.jpg', '/files/election/iran-president-1392-hassan_rouhani-winner.jpg', 'active', '2017-05-09 15:52:45', '2017-05-20 05:06:43', NULL, NULL, NULL, 'Hassan', 'Rouhani', 'Asadollah', 'Rouhani'),
(8, 2, 'سعید', 'جلیلی', 'محمدحسن', 'جلیلی', NULL, '1965-09-06 00:00:00', NULL, '/files/election/iran-president-1392-saeed_mohammad_hassan(jalili).jpg', NULL, NULL, 'active', '2017-05-13 11:01:37', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Saeed', 'Mohammad Hassan', 'Hossein', 'Jalili'),
(9, 2, 'محمدباقر', 'قالیباف', 'حسین', 'قالیباف', NULL, '1961-08-23 00:00:00', NULL, '/files/election/iran-president-1392-mohammad_bagher_ghalibaf.jpg', '/files/election/iran-president-1392-mohammad_bagher_ghalibaf-vs.jpg', NULL, 'active', '2017-05-13 11:01:51', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Mohammad Bagher', 'Ghalibaf', 'Hossein', 'Ghalibaf'),
(10, 2, 'محسن', 'رضایی میرقائد', 'نجف', 'رضایی', NULL, '1954-09-01 00:00:00', NULL, '/files/election/iran-president-1392-mohsen_rezaee_mirghaed(rezaee).jpg', NULL, NULL, 'active', '2017-05-13 11:19:55', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Mohsen', 'Rezaee Mirghaed', 'Najaf', 'Rezaee'),
(11, 2, 'علی‌اکبر', 'ولایتی', 'علی‌اصغر', 'ولایتی', NULL, '1945-06-25 00:00:00', NULL, '/files/election/iran-president-1392-ali_akbar_velayati.jpg', NULL, NULL, 'active', '2017-05-13 11:21:33', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Ali Akbar', 'Velayati', 'Ali Asghar', 'Velayati'),
(12, 2, 'سید محمد', 'غرضی', 'سید رضا', 'غرضی', NULL, '1942-02-12 00:00:00', NULL, '/files/election/iran-president-1392-seyyed_mohammad_gharazi.jpg', '/files/election/iran-president-1392-seyyed_mohammad_gharazi-vs.jpg', NULL, 'active', '2017-05-13 11:21:36', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Seyyed Mohammad', 'Gharazi', 'Seyyed Reza', 'Gharazi'),
(13, 3, 'محمود', 'احمدی‌نژاد', 'احمد', 'احمدی‌نژاد', NULL, '1956-10-28 00:00:00', NULL, '/files/election/iran-president-1388-mahmoud_ahmadinejad.jpg', '/files/election/iran-president-1388-mahmoud_ahmadinejad-vs.jpg', '/files/election/iran-president-1388-mahmoud_ahmadinejad-winner.jpg', 'active', '2017-05-13 15:33:47', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Mahmoud', 'Ahmadinejad', 'Ahmad', 'Ahmadinejad'),
(14, 3, 'میرحسین', 'موسوی خامنه', 'میراسماعیل', 'موسوی', NULL, '1942-12-21 00:00:00', NULL, '/files/election/iran-president-1388-mir_hossein_mousavi_khameneh(mousavi).jpg', '/files/election/iran-president-1388-mir_hossein_mousavi_khameneh(mousavi)-vs.jpg', NULL, 'active', '2017-05-13 15:37:06', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Mir Hossein', 'Mousavi Khameneh', 'Mir Esmail', 'Mousavi'),
(15, 3, 'محسن', 'رضایی میرقائد', 'نجف', 'رضایی', NULL, '1954-09-01 00:00:00', NULL, '/files/election/iran-president-1388-mohsen_rezaee_mirghaed(rezaee).jpg', NULL, NULL, 'active', '2017-05-13 15:38:52', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Mohsen', 'Rezaee Mirghaed', 'Najaf', 'Rezaee'),
(16, 3, 'مهدی', 'کروبی', 'احمد', 'کروبی', NULL, '1935-09-30 00:00:00', NULL, '/files/election/iran-president-1388-mehdi_karroubi.jpg', NULL, NULL, 'active', '2017-05-13 15:40:33', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Mehdi', 'Karroubi', 'Ahmad', 'Karroubi'),
(17, 4, 'محمود', 'احمدی‌نژاد', 'احمد', 'احمدی‌نژاد', NULL, '1956-10-28 00:00:00', NULL, '/files/election/iran-president-1384-mahmoud_ahmadinejad.jpg', '/files/election/iran-president-1384-mahmoud_ahmadinejad-vs.jpg', '/files/election/iran-president-1384-mahmoud_ahmadinejad-winner.jpg', 'active', '2017-05-13 16:40:53', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Mahmoud', 'Ahmadinejad', 'Ahmad', 'Ahmadinejad'),
(18, 4, 'اکبر', 'هاشمی بهرمانی', 'علی', 'هاشمی رفسنجانی', NULL, '1934-05-24 00:00:00', NULL, '/files/election/iran-president-1384-akbar_hashemi_bahramani(hashemi_rafsanjani).jpg', '/files/election/iran-president-1384-akbar_hashemi_bahramani(hashemi_rafsanjani)-vs.jpg', NULL, 'active', '2017-05-13 16:42:40', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Akbar', 'Hashemi Bahramani', 'Ali', 'Hashemi Rafsanjani'),
(19, 5, 'اکبر', 'هاشمی بهرمانی', 'علی', 'هاشمی رفسنجانی', NULL, '1934-05-24 00:00:00', NULL, '/files/election/iran-president-1384-akbar_hashemi_bahramani(hashemi_rafsanjani).jpg', '/files/election/iran-president-1384-akbar_hashemi_bahramani(hashemi_rafsanjani)-vs.jpg', NULL, 'active', '2017-05-13 16:49:23', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Akbar', 'Hashemi Bahramani', 'Ali', 'Hashemi Rafsanjani'),
(20, 5, 'محمود', 'احمدی‌نژاد', 'احمد', 'احمدی‌نژاد', NULL, '1956-10-28 00:00:00', NULL, '/files/election/iran-president-1384-mahmoud_ahmadinejad.jpg', '/files/election/iran-president-1384-mahmoud_ahmadinejad-vs.jpg', '/files/election/iran-president-1384-mahmoud_ahmadinejad-winner.jpg', 'active', '2017-05-13 16:50:51', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Mahmoud', 'Ahmadinejad', 'Ahmad', 'Ahmadinejad'),
(21, 5, 'مهدی', 'کروبی', 'احمد', 'کروبی', NULL, '1935-09-27 00:00:00', NULL, '/files/election/iran-president-1384-mehdi_karroubi(ahmad).jpg', NULL, NULL, 'active', '2017-05-13 16:51:53', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Mehdi', 'Karroubi', 'Ahmad', 'Ahmad'),
(22, 5, 'محمدباقر', 'قالیباف', 'حسین', 'قالیباف', NULL, '1961-08-23 00:00:00', NULL, '/files/election/iran-president-1384-mohammad_bagher_ghalibaf.jpg', NULL, NULL, 'active', '2017-05-13 16:53:05', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Mohammad Bagher', 'Ghalibaf', 'Hossein', 'Ghalibaf'),
(23, 5, 'مصطفی', 'معین نجف‌آبادی', 'مهدی', 'معین', NULL, '1951-04-01 00:00:00', NULL, '/files/election/iran-president-1384-mostafa_moeen_najafabadi(moeen).jpg', NULL, NULL, 'active', '2017-05-13 16:54:21', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Mostafa', 'Moeen Najafabadi', 'Mehdi', 'Moeen'),
(24, 5, 'علی', 'اردشیر لاریجانی', 'هاشم', 'لاریجانی', NULL, '1957-06-03 00:00:00', NULL, '/files/election/iran-president-1384-ali_ardeshir_larijani(larijani).jpg', NULL, NULL, 'active', '2017-05-13 16:55:28', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Ali', 'Ardeshir Larijani', 'Hashem', 'Larijani'),
(25, 5, 'محسن', 'مهرعلیزاده', NULL, 'مهرعلیزاده', NULL, '1956-09-30 00:00:00', NULL, '/files/election/iran-president-1384-mohsen_mehralizadeh.jpg', '/files/election/iran-president-1384-mohsen_mehralizadeh-vs.jpg', NULL, 'active', '2017-05-13 16:56:40', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Mohsen', 'Mehralizadeh', NULL, 'Mehralizadeh'),
(26, 6, 'سید محمد', 'خاتمی', 'سید روح‌الله', 'خاتمی', NULL, '1943-10-08 00:00:00', NULL, '/files/election/iran-president-1380-seyyed_mohammad_khatami.jpg', '/files/election/iran-president-1380-seyyed_mohammad_khatami-vs.jpg', '/files/election/iran-president-1380-seyyed_mohammad_khatami-winner.jpg', 'active', '2017-05-13 17:13:18', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Seyyed Mohammad', 'Khatami', 'Seyyed Ruhollah', 'Khatami'),
(27, 7, 'سید محمد', 'خاتمی', 'سید روح‌الله', 'خاتمی', NULL, '1943-10-08 00:00:00', NULL, '/files/election/iran-president-1376-seyyed_mohammad_khatami.jpg', '/files/election/iran-president-1376-seyyed_mohammad_khatami-vs.jpg', '/files/election/iran-president-1376-seyyed_mohammad_khatami-winner.jpg', 'active', '2017-05-14 09:39:43', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Seyyed Mohammad', 'Khatami', 'Seyyed Ruhollah', 'Khatami'),
(28, 6, 'احمد', 'توکلی', ' ابوالحسن', 'توکلی', NULL, '1951-03-05 00:00:00', NULL, '/files/election/iran-president-1380-ahmad_tavakkoli.jpg', '/files/election/iran-president-1380-ahmad_tavakkoli-vs.jpg', NULL, 'active', '2017-05-14 09:41:35', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Ahmad', 'Tavakkoli', 'Abolhassan', 'Tavakkoli'),
(29, 6, 'علی', 'شمخانی', 'صالح', 'شمخانی', NULL, '1955-09-29 00:00:00', NULL, '/files/election/iran-president-1380-ali_shamkhani.jpg', NULL, NULL, 'active', '2017-05-14 09:42:57', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Ali', 'Shamkhani', 'Saleh', 'Shamkhani'),
(30, 6, 'عبدالله', 'جعفرعلی جاسبی', 'اسکندر', 'جاسبی', NULL, '1944-10-26 00:00:00', NULL, '/files/election/iran-president-1380-abdollah_jafarali_jassbi(jassbi).jpg', NULL, NULL, 'active', '2017-05-14 09:44:22', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Abdollah', 'Jafarali Jassbi', 'Eskandar', 'Jassbi'),
(31, 6, 'سید محمود', 'مصطفوی کاشانی', 'سید ابوالقاسم', 'کاشانی', NULL, '1942-06-26 00:00:00', NULL, '/files/election/iran-president-1380-seyyed_mahmoud_mostafavi_kashani(kashani).jpg', NULL, NULL, 'active', '2017-05-14 09:45:54', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Seyyed Mahmoud', 'mostafavi kashani', 'Seyyed Abolghasem', 'Kashani'),
(32, 6, 'حسن', 'غفوری‌فرد', 'محمد', 'غفوری‌فرد', NULL, '1943-01-01 00:00:00', NULL, '/files/election/iran-president-1380-hassan_ghafourifard.jpg', NULL, NULL, 'active', '2017-05-14 09:47:47', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Hassan', 'Ghafourifard', 'Mohammad', 'Ghafourifard'),
(33, 6, ' ', 'باطله', NULL, NULL, NULL, NULL, NULL, '/files/election/unacceptable.jpg', NULL, NULL, 'active', '2017-05-14 09:48:20', '2017-05-19 12:49:54', NULL, NULL, NULL, ' ', 'unacceptable', NULL, NULL),
(34, 6, 'سید منصور', 'رضوی', 'سید مرتضی', 'رضوی', NULL, '1952-01-01 00:00:00', NULL, '/files/election/iran-president-1380-seyyed_mansour_razavi.jpg', NULL, NULL, 'active', '2017-05-14 09:49:53', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Seyyed Mansour', 'Razavi', 'Seyyed Mortaza', 'Razavi'),
(35, 6, 'سید شهاب‌الدین', 'صدر', 'سید عبدالله', 'صدر', NULL, '1962-04-06 00:00:00', NULL, '/files/election/iran-president-1380-seyyed_shahabedin_sadr.jpg', NULL, NULL, 'active', '2017-05-14 09:52:28', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Seyyed Shahabedin', 'Sadr', 'Seyyed Abdollah', 'Sadr'),
(36, 6, 'علی', 'فلاحیان', 'عبدالله', 'فلاحیان', NULL, '1949-10-23 00:00:00', NULL, '/files/election/iran-president-1380-ali_fallahian.jpg', NULL, NULL, 'active', '2017-05-14 09:53:37', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Ali', 'Fallahian', 'Abdollah', 'Fallahian'),
(37, 6, 'سید مصطفی', 'هاشمی‌طبا', 'سید ابوالقاسم', 'هاشمی‌طبا', NULL, '1946-05-22 00:00:00', NULL, '/files/election/iran-president-1380-seyyed_mostafa_hashemitaba.jpg', NULL, NULL, 'active', '2017-05-14 09:54:40', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Seyyed Mostafa', 'Hashemitaba', 'Seyyed Abolghasem', 'Hashemitaba'),
(38, 7, 'علی‌اکبر', 'جمشیدی', 'ابوالقاسم', 'ناطق‌نوری', NULL, '1944-10-06 00:00:00', NULL, '/files/election/iran-president-1376-ali_akbar_jamshidi(nategh_nouri).jpg', '/files/election/iran-president-1376-ali_akbar_jamshidi(nategh_nouri)-vs.jpg', NULL, 'active', '2017-05-14 10:13:45', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Ali Akbar', 'Jamshidi', 'Abolghasem', 'Nategh Nouri'),
(39, 7, 'سید رضا', 'زواره‌ای', 'سید اصغر', 'زواره‌ای', NULL, '1938-04-25 00:00:00', NULL, '/files/election/iran-president-1376-seyyed_reza_zavarei.jpg', NULL, NULL, 'active', '2017-05-14 10:14:51', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Seyyed Reza', 'Zavarei', 'Seyyed Asghar', 'Zavarei'),
(40, 7, 'محمد', 'محمدی نیک', 'اسماعیل', 'محمدی ری‌شهری', NULL, '1946-10-29 00:00:00', NULL, '/files/election/iran-president-1376-mohammad_mohammadi_nik(mohammadi_reyshahri).jpg', NULL, NULL, 'active', '2017-05-14 10:15:49', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Mohammad', 'Mohammadi Nik', 'Esmaeil', 'Mohammadi Reyshahri'),
(41, 8, 'اکبر', 'هاشمی بهرمانی', 'علی', 'هاشمی رفسنجانی', NULL, '1934-05-24 00:00:00', NULL, '/files/election/iran-president-1372-akbar_hashemi_bahramani(hashemi_rafsanjani).jpg', NULL, '/files/election/iran-president-1372-akbar_hashemi_bahramani(hashemi_rafsanjani)-winner.jpg', 'active', '2017-05-14 10:19:54', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Akbar', 'Hashemi Bahramani', 'Ali', 'Hashemi Rafsanjani'),
(42, 8, 'احمد', 'توکلی', ' ابوالحسن', 'توکلی', NULL, '1951-03-05 00:00:00', NULL, '/files/election/iran-president-1372-ahmad_tavakkoli.jpg', '/files/election/iran-president-1372-ahmad_tavakkoli-vs.jpg', NULL, 'active', '2017-05-14 10:21:04', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Ahmad', 'Tavakkoli', 'Abolhassan', 'Tavakkoli'),
(43, 8, 'عبدالله', 'جعفرعلی جاسبی', 'اسکندر', 'جاسبی', NULL, '1944-10-26 00:00:00', NULL, '/files/election/iran-president-1372-abdollah_jafarali_jassbi(jassbi).jpg', NULL, NULL, 'active', '2017-05-14 10:24:19', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Abdollah', 'Jafarali Jassbi', 'Eskandar', 'Jassbi'),
(44, 8, 'رجبعلی', 'طاهری', 'محمود', 'طاهری', NULL, '1936-09-20 00:00:00', NULL, '/files/election/iran-president-1372-rajabali_taheri.jpg', NULL, NULL, 'active', '2017-05-14 10:30:01', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Rajabali', 'Taheri', 'Mahmoud', 'Taheri'),
(45, 9, 'اکبر', 'هاشمی بهرمانی', 'علی', 'هاشمی رفسنجانی', NULL, '1934-05-24 00:00:00', NULL, '/files/election/iran-president-1368-akbar_hashemi_bahramani(hashemi_rafsanjani).jpg', '/files/election/iran-president-1368-akbar_hashemi_bahramani(hashemi_rafsanjani)-vs.jpg', '/files/election/iran-president-1368-akbar_hashemi_bahramani(hashemi_rafsanjani)-winner.jpg', 'active', '2017-05-14 10:33:28', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Akbar', 'Hashemi Bahramani', 'Ali', 'Hashemi Rafsanjani'),
(46, 9, 'عباس', 'شیبانی', 'هدایت‌الله', 'شیبانی', NULL, '1931-01-01 00:00:00', NULL, '/files/election/iran-president-1368-abbas_sheibani.jpg', NULL, NULL, 'active', '2017-05-14 10:35:55', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Abbas', 'Sheibani', 'Hedayatollah', 'Sheibani'),
(47, 10, 'سید علی', 'حسینی خامنه‌', 'سید جواد', 'خامنه‌ای', NULL, '1939-07-16 00:00:00', NULL, '/files/election/iran-president-1364-seyyed_ali_hosseini_khamene(khamenei).jpg', '/files/election/iran-president-1364-seyyed_ali_hosseini_khamene(khamenei)-vs.jpg', '/files/election/iran-president-1364-seyyed_ali_hosseini_khamene(khamenei)-winner.jpg', 'active', '2017-05-14 10:42:25', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Seyyed Ali', 'Hosseini Khamene', 'Seyyed Javad', 'Khamenei'),
(48, 10, 'سید محمود', 'مصطفوی کاشانی', 'سید ابوالقاسم', 'کاشانی', NULL, '1942-06-06 00:00:00', NULL, '/files/election/iran-president-1364-seyyed_mahmoud_mostafavi_kashani(kashani).jpg', NULL, NULL, 'active', '2017-05-14 10:43:41', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Seyyed Mahmoud', 'mostafavi kashani', 'Seyyed Abolghasem', 'Kashani'),
(49, 10, 'حبیب‌الله', 'عسگراولادی مسلمان', 'حسین', 'عسگراولادی', NULL, '1932-01-03 00:00:00', NULL, '/files/election/iran-president-1364-habibollah_asgaroladi_mosalman(asgaroladi).jpg', NULL, NULL, 'active', '2017-05-14 10:49:05', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Habibollah', 'Asgaroladi Mosalman', 'Hossein', 'Asgaroladi'),
(50, 11, 'سید علی', 'حسینی خامنه‌', 'سید جواد', 'خامنه‌ای', NULL, '1939-07-16 00:00:00', NULL, '/files/election/iran-president-1360-seyyed_ali_hosseini_khamene(khamenei).jpg', '/files/election/iran-president-1360-seyyed_ali_hosseini_khamene(khamenei)-vs.jpg', '/files/election/iran-president-1360-seyyed_ali_hosseini_khamene(khamenei)-winner.jpg', 'active', '2017-05-14 10:52:34', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Seyyed Ali', 'Hosseini Khamene', 'Seyyed Javad', 'Khamenei'),
(51, 11, 'سید علی‌اکبر', 'پرورش', NULL, 'پرورش', NULL, '1942-06-22 00:00:00', NULL, '/files/election/iran-president-1360-seyyed_ali_akbar_parvaresh.jpg', NULL, NULL, 'active', '2017-05-14 10:53:55', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Seyyed Ali Akbar', 'Parvaresh', NULL, 'Parvaresh'),
(52, 11, 'سید رضا', 'زواره‌ای', 'سید اصغر', 'زواره‌ای', NULL, '1938-04-25 00:00:00', NULL, '/files/election/iran-president-1360-seyyed_reza_zavarei.jpg', NULL, NULL, 'active', '2017-05-14 10:55:14', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Seyyed Reza', 'Zavarei', 'Seyyed Asghar', 'Zavarei'),
(53, 11, 'حسن', 'غفوری‌فرد', 'محمد', 'غفوری‌فرد', NULL, '1943-01-01 00:00:00', NULL, '/files/election/iran-president-1360-hassan_ghafourifard.jpg', NULL, NULL, 'active', '2017-05-14 10:56:35', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Hassan', 'Ghafourifard', 'Mohammad', 'Ghafourifard'),
(54, 12, 'محمدعلی', 'رجایی', 'عبدالصمد', 'رجایی', NULL, '1933-06-15 00:00:00', NULL, '/files/election/iran-president-1360-mohammad_ali_rajai.jpg', '/files/election/iran-president-1360-mohammad_ali_rajai-vs.jpg', '/files/election/iran-president-1360-mohammad_ali_rajai-winner.jpg', 'active', '2017-05-14 11:19:24', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Mohammad Ali', 'Rajai', 'Abdulsamad', 'Rajai'),
(55, 12, 'عباس', 'شیبانی', 'هدایت‌الله', 'شیبانی', NULL, '1932-01-01 00:00:00', NULL, '/files/election/iran-president-1360-abbas_sheibani.jpg', NULL, NULL, 'active', '2017-05-14 11:20:33', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Abbas', 'Sheibani', 'Hedayatollah', 'Sheibani'),
(56, 12, 'سید علی‌اکبر', 'پرورش', NULL, 'پرورش', NULL, '1942-06-22 00:00:00', NULL, '/files/election/iran-president-1360-seyyed_ali_akbar_parvaresh.jpg', NULL, NULL, 'active', '2017-05-14 11:21:26', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Seyyed Ali Akbar', 'Parvaresh', NULL, 'Parvaresh'),
(57, 12, 'حبیب‌الله', 'عسگراولادی مسلمان', 'حسین', 'عسگراولادی', NULL, '1932-02-02 00:00:00', NULL, '/files/election/iran-president-1360-habibollah_asgaroladi_mosalman(asgaroladi).jpg', NULL, NULL, 'active', '2017-05-14 11:22:18', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Habibollah', 'Asgaroladi Mosalman', 'Hossein', 'Asgaroladi'),
(58, 13, 'سید ابوالحسن', 'بنی‌صدر', 'سید نصرالله', 'بنی‌صدر', NULL, '1933-03-22 00:00:00', NULL, '/files/election/iran-president-1358-sayyed_abolhassan_banisadr.jpg', '/files/election/iran-president-1358-sayyed_abolhassan_banisadr-vs.jpg', '/files/election/iran-president-1358-sayyed_abolhassan_banisadr-winner.jpg', 'active', '2017-05-14 11:26:56', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Sayyed Abolhassan', 'Banisadr', 'Seyyed Nasrallah', 'Banisadr'),
(59, 13, 'سید احمد', 'مدنی', NULL, 'مدنی', NULL, '1929-07-23 00:00:00', NULL, '/files/election/iran-president-1358-seyyed_ahmad_madani.jpg', '/files/election/iran-president-1358-seyyed_ahmad_madani-vs.jpg', NULL, 'active', '2017-05-14 11:27:48', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Seyyed Ahmad', 'Madani', NULL, 'Madani'),
(60, 13, 'حسن', 'ابراهیم حبیبی', 'باقر', 'حبیبی', NULL, '1937-01-29 00:00:00', NULL, '/files/election/iran-president-1358-hassan_ebrahim_habibi(habibi).jpg', NULL, NULL, 'active', '2017-05-14 11:29:26', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Hassan', 'Ebrahim Habibi', 'baqer', 'Habibi'),
(61, 13, 'داریوش', 'فروهر', 'صادق', 'فروهر', NULL, '1928-12-28 00:00:00', NULL, '/files/election/iran-president-1358-dariush_forouhar.jpg', NULL, NULL, 'active', '2017-05-14 11:31:15', '2017-05-19 14:00:19', NULL, NULL, NULL, 'Dariush', 'Forouhar', 'Sadegh', 'Forouhar'),
(62, 13, 'صادق', 'طباطبایی', 'سید محمدباقر', 'طباطبایی', NULL, '1943-03-26 00:00:00', NULL, '/files/election/iran-president-1358-sadeq_tabatabaei.jpg', NULL, NULL, 'active', '2017-05-14 11:32:26', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Sadeq', 'Tabatabaei', 'Seyyed Mohammad Baqer', 'Tabatabaei'),
(63, 13, 'کاظم', 'سامی کرمانی', 'غلامرضا', 'کرمانی', NULL, '1935-01-01 00:00:00', NULL, '/files/election/iran-president-1358-kazem_sami_kermani(kermani).jpg', NULL, NULL, 'active', '2017-05-14 11:34:00', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Kazem', 'Sami Kermani', 'Gholamreza', 'Kermani'),
(64, 13, 'صادق', 'قطب‌زاده', 'حسین', 'قطب‌زاده', NULL, '1936-02-24 00:00:00', NULL, '/files/election/iran-president-1358-sadegh_ghotbzadeh.jpg', NULL, NULL, 'active', '2017-05-14 11:35:01', '2017-05-19 12:49:54', NULL, NULL, NULL, 'Sadegh', 'Ghotbzadeh', 'Hossein', 'Ghotbzadeh'),
(65, 2, '‌', 'باطله', NULL, NULL, NULL, NULL, NULL, '/files/election/unacceptable.jpg', NULL, NULL, 'active', '2017-05-15 13:54:43', '2017-05-19 12:49:54', NULL, NULL, NULL, '‌', 'unacceptable', NULL, NULL),
(66, 3, ' ', 'باطله', NULL, NULL, NULL, NULL, NULL, '/files/election/unacceptable.jpg', NULL, NULL, 'active', '2017-05-15 14:00:42', '2017-05-19 12:49:54', NULL, NULL, NULL, ' ', 'unacceptable', NULL, NULL),
(67, 4, '‌', 'باطله', NULL, NULL, NULL, NULL, NULL, '/files/election/unacceptable.jpg', NULL, NULL, 'active', '2017-05-15 15:23:48', '2017-05-19 12:49:54', NULL, NULL, NULL, '‌', 'unacceptable', NULL, NULL),
(68, 5, '‌', 'باطله', NULL, NULL, NULL, NULL, NULL, '/files/election/unacceptable.jpg', NULL, NULL, 'active', '2017-05-16 06:55:30', '2017-05-19 12:49:54', NULL, NULL, NULL, '‌', 'unacceptable', NULL, NULL),
(69, 12, ' ', 'باطله', NULL, NULL, NULL, NULL, NULL, '/files/election/unacceptable.jpg', NULL, NULL, 'active', '2017-05-17 12:53:24', '2017-05-19 12:49:54', NULL, NULL, NULL, ' ', 'unacceptable', NULL, NULL),
(70, 11, '‌', 'باطله', NULL, NULL, NULL, NULL, NULL, '/files/election/unacceptable.jpg', NULL, NULL, 'active', '2017-05-17 12:57:24', '2017-05-19 12:49:54', NULL, NULL, NULL, '‌', 'unacceptable', NULL, NULL),
(71, 10, '‌', 'باطله', NULL, NULL, NULL, NULL, NULL, '/files/election/unacceptable.jpg', NULL, NULL, 'active', '2017-05-17 12:59:06', '2017-05-19 12:49:54', NULL, NULL, NULL, '‌', 'unacceptable', NULL, NULL),
(72, 9, '‌', 'باطله', NULL, NULL, NULL, NULL, NULL, '/files/election/unacceptable.jpg', NULL, NULL, 'active', '2017-05-17 13:00:03', '2017-05-19 12:49:54', NULL, NULL, NULL, '‌', 'unacceptable', NULL, NULL),
(73, 8, '‌', 'باطله', NULL, NULL, NULL, NULL, NULL, '/files/election/unacceptable.jpg', NULL, NULL, 'active', '2017-05-17 13:00:40', '2017-05-19 12:49:54', NULL, NULL, NULL, '‌', 'unacceptable', NULL, NULL),
(74, 7, '‌', 'باطله', NULL, NULL, NULL, NULL, NULL, '/files/election/unacceptable.jpg', NULL, NULL, 'active', '2017-05-17 13:01:17', '2017-05-19 12:49:54', NULL, NULL, NULL, '‌', 'unacceptable', NULL, NULL),
(77, 1, ' ', 'باطله', NULL, NULL, NULL, NULL, NULL, '/files/election/unacceptable.jpg', NULL, NULL, 'active', '2017-05-18 05:29:49', '2017-05-19 12:49:54', NULL, NULL, NULL, ' ', 'unacceptable', NULL, NULL),
(78, 13, ' ', 'سایر', NULL, NULL, NULL, NULL, NULL, '/files/election/other.jpg', NULL, NULL, 'active', '2017-05-19 11:42:22', '2017-05-19 12:49:54', NULL, NULL, NULL, ' ', 'Other', NULL, NULL);


--
-- Table structure for table `elections`
--

CREATE TABLE `elections` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(500) NOT NULL,
  `status` enum('awaiting','running','done') DEFAULT 'awaiting',
  `eligible` int(10) UNSIGNED DEFAULT NULL,
  `voted` int(10) UNSIGNED DEFAULT NULL,
  `invalid` int(10) UNSIGNED DEFAULT NULL,
  `cash` int(10) UNSIGNED DEFAULT NULL,
  `branchs` int(10) UNSIGNED DEFAULT NULL,
  `first_vote_male_count` int(10) UNSIGNED DEFAULT NULL,
  `first_vote_female_count` int(10) UNSIGNED DEFAULT NULL,
  `signuped_count` int(10) UNSIGNED DEFAULT NULL,
  `verified_count` int(10) UNSIGNED DEFAULT NULL,
  `candida_count` int(10) UNSIGNED DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `election_date` datetime DEFAULT NULL,
  `jalali_year` int(4) DEFAULT NULL,
  `year` int(4) DEFAULT NULL,
  `en_url` varchar(500) DEFAULT NULL,
  `fa_url` varchar(500) DEFAULT NULL,
  `cat` varchar(255) DEFAULT NULL,
  `win` int(10) UNSIGNED DEFAULT NULL,
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `meta` mediumtext CHARACTER SET utf8mb4,
  `en_title` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `elections`
--

INSERT INTO `elections` (`id`, `title`, `status`, `eligible`, `voted`, `invalid`, `cash`, `branchs`, `first_vote_male_count`, `first_vote_female_count`, `signuped_count`, `verified_count`, `candida_count`, `start_time`, `end_time`, `election_date`, `jalali_year`, `year`, `en_url`, `fa_url`, `cat`, `win`, `createdate`, `date_modified`, `desc`, `meta`, `en_title`) VALUES
(1, 'دوازدهمین دوره‌ی انتخابات ریاست جمهوری اسلامی ایران', 'done', 56410234, 41220131, NULL, NULL, NULL, NULL, NULL, 1636, 6, NULL, NULL, NULL, '2017-05-19 00:00:00', 1396, 2017, 'iran/president/2017', 'iran/president/1396', 'president', 1, '2017-05-09 13:42:29', '2017-05-20 09:50:16', 'منبع سایت وزارت کشور می‌باشد.', NULL, 'Iranian presidential election, 2017'),
(2, 'یازدهمین دوره‌ی انتخابات ریاست جمهوری اسلامی ایران', 'done', 50483192, 36704156, 1245409, NULL, NULL, 831644, 799562, 686, 8, 6, '2013-06-14 08:00:00', '2013-06-14 23:00:00', '2013-06-14 00:00:00', 1392, 2013, 'iran/president/2013', 'iran/president/1392', 'president', 7, '2017-05-13 08:57:59', '2017-05-19 13:37:20', 'منبع سایت وزارت کشور و روزنامه جمهوری اسلامی می‌باشد.', NULL, 'Iranian presidential election, 2013'),
(3, 'دهمین دوره‌ی انتخابات ریاست جمهوری اسلامی ایران', 'done', 46199997, 39165191, 409389, NULL, NULL, NULL, NULL, 476, 4, 4, '2009-06-12 08:00:00', '2009-06-12 23:00:00', '2009-06-12 00:00:00', 1388, 2009, 'iran/president/2009', 'iran/president/1388', 'president', 13, '2017-05-13 15:29:51', '2017-05-19 13:37:29', 'منبع سایت وزارت کشور و روزنامه جمهوری اسلامی می‌باشد.', NULL, 'Iranian presidential election, 2009'),
(4, 'نهمین دوره‌ی انتخابات ریاست جمهوری اسلامی ایران - دور دوم', 'done', 46811418, 27959253, 663770, NULL, NULL, NULL, NULL, 2, 2, 2, '2005-06-24 09:00:00', '2005-06-24 23:00:00', '2005-06-24 00:00:00', 1384, 2005, 'iran/president/2005/2', 'iran/president/1384/2', 'president', 17, '2017-05-13 15:55:03', '2017-05-19 13:37:40', 'منبع سایت وزارت کشور و روزنامه جمهوری اسلامی می‌باشد.', NULL, 'Iranian presidential election, 2005'),
(5, 'نهمین دوره‌ی انتخابات ریاست جمهوری اسلامی ایران - دور اول', 'done', 46786418, 29400857, 1224882, NULL, NULL, NULL, NULL, 1014, 8, 7, '2005-06-17 09:00:00', '2005-06-17 23:00:00', '2005-06-17 00:00:00', 1384, 2005, 'iran/president/2005', 'iran/president/1384', 'president', NULL, '2017-05-13 15:56:12', '2017-05-19 13:37:58', 'انتخابات به دور دوم کشیده شد.\r\nمنبع آرای دو کاندید راه یافته به مرحله‌ی دوم، واجدین شرایط، آرای ماخوذه، آرای صحیح و آرای باطله روزنامه جمهوری اسلامی می‌باشد.\r\nمنبع آرای سایر کاندیداها سایت ویکی‌پدیا می‌باشد.', NULL, 'Iranian presidential election, 2005'),
(6, 'هشتمین دوره‌ی انتخابات ریاست جمهوری اسلامی ایران', 'done', 42170230, 28160396, 487751, NULL, NULL, NULL, NULL, 814, 10, 10, '2001-06-08 09:00:00', '2001-06-08 23:00:00', '2001-06-08 00:00:00', 1380, 2001, 'iran/president/2001', 'iran/president/1380', 'president', 26, '2017-05-13 15:56:54', '2017-05-19 13:38:04', 'منبع آرای رئیس‌جمهور منتخب، آرای ماخوذه، آرای صحیح و آرای باطله روزنامه جمهوری اسلامی می‌باشد.\r\nمنبع آرای سایر کاندیداها سایت ویکی‌پدیا می‌باشد.\r\nمنبع واجدین شرایط سایت وزارت کشور می‌باشد.', NULL, 'Iranian presidential election, 2001'),
(7, 'هفتمین دوره‌ی انتخابات ریاست جمهوری اسلامی ایران', 'done', 36466487, 29076070, 240966, NULL, NULL, NULL, NULL, 238, 4, 4, '1997-05-23 08:00:00', '1997-05-23 22:00:00', '1997-05-23 00:00:00', 1376, 1997, 'iran/president/1997', 'iran/president/1376', 'president', 27, '2017-05-13 15:57:37', '2017-05-19 13:38:08', 'منبع آرای کاندیداها، آرای ماخوذه، آرای صحیح و آرای باطله روزنامه جمهوری اسلامی می‌باشد.\r\nمنبع واجدین شرایط وزارت کشور می‌باشد.', NULL, 'Iranian presidential election, 1997'),
(8, 'ششمین دوره‌ی انتخابات ریاست جمهوری اسلامی ایران', 'done', 33156055, 16789666, 307868, NULL, NULL, NULL, NULL, 128, 4, 4, '1993-06-11 08:00:00', '1993-06-11 22:00:00', '1993-06-11 00:00:00', 1372, 1993, 'iran/president/1993', 'iran/president/1372', 'president', 41, '2017-05-13 15:58:17', '2017-05-19 13:38:14', 'منبع آرای ثبت‌شده روزنامه جمهوری اسلامی می‌باشد.\r\nمنبع واجدین شرایط سایت وزارت کشور می‌باشد.', NULL, 'Iranian presidential election, 1993'),
(9, 'پنجمین دوره‌ی انتخابات ریاست جمهوری اسلامی ایران', 'done', 30139598, 16454641, 267693, NULL, NULL, NULL, NULL, 79, 2, 2, '1989-07-28 07:00:00', '1989-07-28 21:00:00', '1989-07-28 00:00:00', 1368, 1989, 'iran/president/1989', 'iran/president/1368', 'president', 45, '2017-05-13 15:58:57', '2017-05-19 13:38:19', 'منبع آرای ماخوذه و آرای آقای هاشمی رفسنجانی روزنامه جمهوری اسلامی می‌باشد.\r\nمنبع آرای آقای شیبانی سایت ویکی‌پدیا می‌باشد.\r\nمنبع واجدین شرایط سایت وزارت کشور می‌باشد.', NULL, 'Iranian presidential election, 1989'),
(10, 'چهارمین دوره‌ی انتخابات ریاست جمهوری اسلامی ایران', 'done', 25993802, 14244630, 355047, NULL, NULL, NULL, NULL, 50, 3, 3, '1985-08-16 07:00:00', '1985-08-16 21:00:00', '1985-08-16 00:00:00', 1364, 1985, 'iran/president/1985', 'iran/president/1364', 'president', 47, '2017-05-13 15:59:31', '2017-05-19 13:38:23', 'منبع آرای ماخوذه و آرای کاندیداها روزنامه جمهوری اسلامی می‌باشد.\r\nمنبع واجدین شرایط سایت وزارت کشور می‌باشد.\r\n', NULL, 'Iranian presidential election, 1985'),
(11, 'سومین دوره‌ی انتخابات ریاست جمهوری اسلامی ایران', 'done', 22439930, 16847817, NULL, NULL, NULL, NULL, NULL, 46, 4, 4, '1981-10-02 07:00:00', '1981-10-02 18:00:00', '1981-10-02 00:00:00', 1360, 1360, 'iran/president/1981', 'iran/president/1360/2', 'president', 50, '2017-05-13 16:01:05', '2017-05-19 13:38:29', 'منبع آرای ماخوذه و آرای کاندیداها اطلاعات می‌باشد.\r\nمنبع واجدین شرایط سایت وزارت کشور می‌باشد.', NULL, 'Iranian presidential election, 1981'),
(12, 'دومین دوره‌ی انتخابات ریاست جمهوری اسلامی ایران', 'done', 22687017, 14763363, NULL, NULL, NULL, NULL, NULL, 71, 4, 4, '1981-07-24 08:00:00', '1981-07-24 18:00:00', '1981-07-24 00:00:00', 1360, 1981, 'iran/president/1981', 'iran/president/1360', 'president', 54, '2017-05-13 16:01:44', '2017-05-19 13:38:35', 'منبع آرای ماخوذه و آرای کاندیداها روزنامه اطلاعات می‌باشد.\r\nمنبع واجدین شرایط سایت وزارت کشور می‌باشد.', NULL, 'Iranian presidential election, 1981'),
(13, 'اولین دوره‌ی انتخابات ریاست جمهوری اسلامی ایران', 'done', 20993643, 14146622, 149798, NULL, 0, NULL, NULL, 125, 105, 96, '1980-01-25 07:00:00', '1980-01-25 18:00:00', '1980-01-24 00:00:00', 1358, 1980, 'iran/president/1980', 'iran/president/1358', 'president', 58, '2017-05-13 16:02:30', '2017-05-19 13:38:39', 'منبع آرای ماخوذه و آرای کاندیداها روزنامه جمهوری اسلامی می‌باشد.\r\nمنبع واجدین شرایط سایت وزارت کشور می‌باشد.', NULL, 'Iranian presidential election, 1980');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(10) UNSIGNED NOT NULL,
  `election_id` int(10) UNSIGNED NOT NULL,
  `date` datetime DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL,
  `number` smallint(3) DEFAULT NULL,
  `cash` int(10) UNSIGNED DEFAULT NULL,
  `voted` int(10) UNSIGNED DEFAULT NULL,
  `invalid` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('enable','disable') DEFAULT 'enable',
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `meta` mediumtext CHARACTER SET utf8mb4
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `election_id`, `date`, `level`, `number`, `cash`, `voted`, `invalid`, `status`, `createdate`, `date_modified`, `desc`, `meta`) VALUES
(33, 3, '2009-06-12 00:00:00', 'نتیجه نهایی', 1, 45713, 38755802, 409389, 'enable', '2017-05-19 06:00:40', '2017-05-19 17:26:52', NULL, NULL),
(34, 4, '2005-06-24 00:00:00', 'نتیجه نهایی', 1, 41071, 27295483, 663770, 'enable', '2017-05-19 06:09:38', '2017-05-19 17:25:36', NULL, NULL),
(36, 5, '2005-06-17 00:00:00', 'نتیجه نهایی', 1, NULL, 28175975, 1224882, 'enable', '2017-05-19 06:25:57', '2017-05-19 17:24:20', NULL, NULL),
(37, 7, '1997-05-23 00:00:00', 'نتیجه نهایی', 1, NULL, 28835104, 240966, 'enable', '2017-05-19 09:17:29', '2017-05-19 17:23:19', NULL, NULL),
(38, 8, '1993-06-11 00:00:00', 'نتیجه نهایی', 1, NULL, 16481798, 307868, 'enable', '2017-05-19 09:52:48', '2017-05-19 17:22:13', NULL, NULL),
(40, 9, '1989-07-28 00:00:00', 'نتیجه نهایی', 1, NULL, 16186948, 267693, 'enable', '2017-05-19 10:39:03', '2017-05-19 17:21:03', NULL, NULL),
(41, 10, '1985-08-16 00:00:00', 'نتیجه نهایی', 1, NULL, 13889583, 355047, 'enable', '2017-05-19 10:52:35', '2017-05-19 17:20:07', NULL, NULL),
(42, 11, '1981-02-10 00:00:00', 'نتیجه نهایی', 1, NULL, 16491305, 356411, 'enable', '2017-05-19 11:02:06', '2017-05-19 17:19:10', NULL, NULL),
(43, 12, '1981-07-24 00:00:00', 'نتیجه نهایی', 1, NULL, 14297088, 466275, 'enable', '2017-05-19 11:14:59', '2017-05-19 17:17:46', NULL, NULL),
(44, 13, '1980-01-25 00:00:00', 'نتیجه نهایی', 1, NULL, 13996824, 149798, 'enable', '2017-05-19 11:43:45', '2017-05-19 17:16:21', NULL, NULL),
(45, 2, '2013-06-15 05:46:00', 'نتایج اولیه', 1, 1631, 826649, 35217, 'enable', '2017-05-19 15:20:23', '2017-05-19 17:10:43', NULL, NULL),
(46, 2, '2013-06-15 07:00:00', 'مرحله دوم', 2, 3573, 1759079, 60905, 'enable', '2017-05-19 15:30:47', '2017-05-19 17:11:06', NULL, NULL),
(47, 2, '2013-06-15 07:30:00', 'مرحله سوم', 3, 4148, 2114163, 71906, 'enable', '2017-05-19 15:46:17', '2017-05-19 17:11:30', NULL, NULL),
(48, 2, '2013-06-15 08:00:00', 'مرحله چهارم', 4, 5876, 2927547, 96887, 'enable', '2017-05-19 15:50:58', '2017-05-19 17:11:44', NULL, NULL),
(49, 2, '2013-06-15 09:00:00', 'مرحله پنجم', 5, 10718, 5211245, 167469, 'enable', '2017-05-19 15:54:47', '2017-05-19 17:11:59', NULL, NULL),
(50, 2, '2013-06-15 09:35:00', 'مرحله ششم', 6, 12058, 6387317, 210983, 'enable', '2017-05-19 16:00:17', '2017-05-19 17:12:12', NULL, NULL),
(51, 2, '2013-06-15 10:30:00', 'مرحله هفتم', 7, 14603, 8050738, 269030, 'enable', '2017-05-19 16:04:58', '2017-05-19 17:12:19', NULL, NULL),
(52, 2, '2013-06-15 11:40:00', 'مرحله هشتم', 8, NULL, 9856142, 269030, 'enable', '2017-05-19 16:34:55', NULL, NULL, NULL),
(53, 2, '2013-06-15 12:10:00', 'مرحله نهم', 9, 21376, 11686139, 405560, 'enable', '2017-05-19 16:38:14', NULL, NULL, NULL),
(54, 2, '2013-06-15 14:00:00', 'مرحله دهم', 10, NULL, 16166392, 550545, 'enable', '2017-05-19 16:41:12', NULL, NULL, NULL),
(55, 2, '2013-06-15 15:30:00', 'مرحله یازدهم', 11, 38621, 22247364, 767509, 'enable', '2017-05-19 17:01:33', NULL, NULL, NULL),
(56, 2, '2015-06-15 17:00:00', 'مرحله دوازدهم', 12, 44745, 26682084, 912635, 'enable', '2017-05-19 17:04:55', NULL, NULL, NULL),
(57, 2, '2013-06-15 21:34:00', 'مرحله سیزدهم', 13, 52424, 31106865, 1082756, 'enable', '2017-05-19 17:07:11', NULL, NULL, NULL),
(58, 2, '2013-06-15 20:20:00', 'مرحله چهاردهم', 14, 58764, 35458747, 1245409, 'enable', '2017-05-19 17:10:15', NULL, NULL, NULL),
(59, 6, '2001-06-08 00:00:00', 'نتیجه نهایی', 1, NULL, 27675741, 484655, 'enable', '2017-05-19 17:39:08', NULL, NULL, NULL),
(60, 1, '2017-05-20 08:46:00', 'مرحله اول', 1, NULL, 25182310, 784419, 'enable', '2017-05-19 18:00:42', '2017-05-20 12:08:42', NULL, NULL),
(61, 1, '2017-05-20 11:02:00', 'مرحله دوم', 2, NULL, 38914470, 1162259, 'enable', '2017-05-20 06:32:41', '2017-05-20 06:38:39', NULL, NULL),
(62, 1, '2017-05-20 14:10:00', 'مرحله سوم', 3, NULL, 41220131, 1190401, 'enable', '2017-05-20 09:37:45', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `resultbyplaces`
--

CREATE TABLE `resultbyplaces` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `election_id` int(10) UNSIGNED NOT NULL,
  `report_id` int(10) UNSIGNED DEFAULT NULL,
  `candida_id` int(10) UNSIGNED NOT NULL,
  `location_type` enum('country','province','city') NOT NULL,
  `place` int(10) UNSIGNED NOT NULL,
  `total` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('enable','disable') DEFAULT 'enable',
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `meta` mediumtext CHARACTER SET utf8mb4
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `id` int(10) UNSIGNED NOT NULL,
  `election_id` int(10) UNSIGNED NOT NULL,
  `report_id` int(10) UNSIGNED DEFAULT NULL,
  `candida_id` int(10) UNSIGNED NOT NULL,
  `total` bigint(20) UNSIGNED NOT NULL,
  `status` enum('enable','disable') DEFAULT 'enable',
  `createdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `date_modified` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `meta` mediumtext CHARACTER SET utf8mb4
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`id`, `election_id`, `report_id`, `candida_id`, `total`, `status`, `createdate`, `date_modified`, `desc`, `meta`) VALUES
(162, 3, 33, 13, 24527516, 'enable', '2017-05-19 06:00:40', NULL, NULL, NULL),
(163, 3, 33, 66, 409389, 'enable', '2017-05-19 06:00:40', NULL, NULL, NULL),
(164, 3, 33, 15, 678240, 'enable', '2017-05-19 06:00:40', NULL, NULL, NULL),
(165, 3, 33, 14, 13216411, 'enable', '2017-05-19 06:00:40', NULL, NULL, NULL),
(166, 3, 33, 16, 333635, 'enable', '2017-05-19 06:00:40', NULL, NULL, NULL),
(167, 4, 34, 17, 17248782, 'enable', '2017-05-19 06:09:38', NULL, NULL, NULL),
(168, 4, 34, 67, 663770, 'enable', '2017-05-19 06:09:38', NULL, NULL, NULL),
(169, 4, 34, 18, 10046701, 'enable', '2017-05-19 06:09:38', NULL, NULL, NULL),
(178, 5, 36, 20, 5711696, 'enable', '2017-05-19 06:25:57', NULL, NULL, NULL),
(179, 5, 36, 24, 1713810, 'enable', '2017-05-19 06:25:57', NULL, NULL, NULL),
(180, 5, 36, 68, 1224882, 'enable', '2017-05-19 06:25:57', NULL, NULL, NULL),
(181, 5, 36, 22, 4095827, 'enable', '2017-05-19 06:25:57', NULL, NULL, NULL),
(182, 5, 36, 23, 4083951, 'enable', '2017-05-19 06:25:57', NULL, NULL, NULL),
(183, 5, 36, 25, 1288640, 'enable', '2017-05-19 06:25:57', NULL, NULL, NULL),
(184, 5, 36, 19, 6211937, 'enable', '2017-05-19 06:25:57', NULL, NULL, NULL),
(185, 5, 36, 21, 5070114, 'enable', '2017-05-19 06:25:57', NULL, NULL, NULL),
(186, 7, 37, 74, 240966, 'enable', '2017-05-19 09:17:29', NULL, NULL, NULL),
(187, 7, 37, 38, 7242859, 'enable', '2017-05-19 09:17:29', NULL, NULL, NULL),
(188, 7, 37, 27, 20078187, 'enable', '2017-05-19 09:17:29', NULL, NULL, NULL),
(189, 7, 37, 39, 742598, 'enable', '2017-05-19 09:17:29', NULL, NULL, NULL),
(190, 7, 37, 40, 771460, 'enable', '2017-05-19 09:17:29', NULL, NULL, NULL),
(191, 8, 38, 73, 307868, 'enable', '2017-05-19 09:52:48', NULL, NULL, NULL),
(192, 8, 38, 42, 4001017, 'enable', '2017-05-19 09:52:48', NULL, NULL, NULL),
(193, 8, 38, 43, 1528055, 'enable', '2017-05-19 09:52:48', NULL, NULL, NULL),
(194, 8, 38, 44, 396814, 'enable', '2017-05-19 09:52:48', NULL, NULL, NULL),
(195, 8, 38, 41, 10555912, 'enable', '2017-05-19 09:52:48', NULL, NULL, NULL),
(199, 9, 40, 72, 267693, 'enable', '2017-05-19 10:39:03', NULL, NULL, NULL),
(200, 9, 40, 46, 635165, 'enable', '2017-05-19 10:39:03', NULL, NULL, NULL),
(201, 9, 40, 45, 15551783, 'enable', '2017-05-19 10:39:03', NULL, NULL, NULL),
(202, 10, 41, 71, 355047, 'enable', '2017-05-19 10:52:35', NULL, NULL, NULL),
(203, 10, 41, 47, 12203870, 'enable', '2017-05-19 10:52:35', NULL, NULL, NULL),
(204, 10, 41, 49, 283297, 'enable', '2017-05-19 10:52:35', NULL, NULL, NULL),
(205, 10, 41, 48, 1402416, 'enable', '2017-05-19 10:52:35', NULL, NULL, NULL),
(206, 11, 42, 70, 356411, 'enable', '2017-05-19 11:02:06', NULL, NULL, NULL),
(207, 11, 42, 50, 16008579, 'enable', '2017-05-19 11:02:06', NULL, NULL, NULL),
(208, 11, 42, 52, 62162, 'enable', '2017-05-19 11:02:06', NULL, NULL, NULL),
(209, 11, 42, 53, 78691, 'enable', '2017-05-19 11:02:06', NULL, NULL, NULL),
(210, 11, 42, 51, 341873, 'enable', '2017-05-19 11:02:06', NULL, NULL, NULL),
(211, 12, 43, 69, 466275, 'enable', '2017-05-19 11:14:59', NULL, NULL, NULL),
(212, 12, 43, 54, 13001761, 'enable', '2017-05-19 11:14:59', NULL, NULL, NULL),
(213, 12, 43, 55, 633405, 'enable', '2017-05-19 11:14:59', NULL, NULL, NULL),
(214, 12, 43, 57, 254265, 'enable', '2017-05-19 11:14:59', NULL, NULL, NULL),
(215, 12, 43, 56, 407657, 'enable', '2017-05-19 11:14:59', NULL, NULL, NULL),
(216, 13, 44, 60, 674859, 'enable', '2017-05-19 11:43:45', NULL, NULL, NULL),
(217, 13, 44, 5, 149798, 'enable', '2017-05-19 11:43:45', NULL, NULL, NULL),
(218, 13, 44, 58, 10709230, 'enable', '2017-05-19 11:43:45', NULL, NULL, NULL),
(219, 13, 44, 63, 89270, 'enable', '2017-05-19 11:43:45', NULL, NULL, NULL),
(220, 13, 44, 78, 2110, 'enable', '2017-05-19 11:43:45', NULL, NULL, NULL),
(221, 13, 44, 62, 114776, 'enable', '2017-05-19 11:43:45', NULL, NULL, NULL),
(222, 13, 44, 61, 133478, 'enable', '2017-05-19 11:43:45', NULL, NULL, NULL),
(223, 13, 44, 64, 48547, 'enable', '2017-05-19 11:43:45', NULL, NULL, NULL),
(224, 13, 44, 59, 2224554, 'enable', '2017-05-19 11:43:45', NULL, NULL, NULL),
(225, 2, 45, 65, 35217, 'disable', '2017-05-19 15:20:23', '2017-05-19 15:30:47', NULL, NULL),
(226, 2, 45, 8, 119294, 'disable', '2017-05-19 15:20:23', '2017-05-19 15:30:47', NULL, NULL),
(227, 2, 45, 10, 109089, 'disable', '2017-05-19 15:20:23', '2017-05-19 15:30:47', NULL, NULL),
(228, 2, 45, 7, 401949, 'disable', '2017-05-19 15:20:23', '2017-05-19 15:30:47', NULL, NULL),
(229, 2, 45, 12, 13431, 'disable', '2017-05-19 15:20:23', '2017-05-19 15:30:47', NULL, NULL),
(230, 2, 45, 9, 126896, 'disable', '2017-05-19 15:20:23', '2017-05-19 15:30:47', NULL, NULL),
(231, 2, 45, 11, 55990, 'disable', '2017-05-19 15:20:23', '2017-05-19 15:30:47', NULL, NULL),
(232, 2, 46, 65, 60905, 'disable', '2017-05-19 15:30:47', '2017-05-19 15:46:17', NULL, NULL),
(233, 2, 46, 8, 257822, 'disable', '2017-05-19 15:30:47', '2017-05-19 15:46:17', NULL, NULL),
(234, 2, 46, 10, 214368, 'disable', '2017-05-19 15:30:47', '2017-05-19 15:46:17', NULL, NULL),
(235, 2, 46, 7, 834859, 'disable', '2017-05-19 15:30:47', '2017-05-19 15:46:17', NULL, NULL),
(236, 2, 46, 12, 25324, 'disable', '2017-05-19 15:30:47', '2017-05-19 15:46:17', NULL, NULL),
(237, 2, 46, 9, 320562, 'disable', '2017-05-19 15:30:47', '2017-05-19 15:46:17', NULL, NULL),
(238, 2, 46, 11, 106144, 'disable', '2017-05-19 15:30:47', '2017-05-19 15:46:17', NULL, NULL),
(239, 2, 47, 65, 71906, 'disable', '2017-05-19 15:46:17', '2017-05-19 18:31:38', NULL, NULL),
(240, 2, 47, 8, 302748, 'disable', '2017-05-19 15:46:17', '2017-05-19 15:50:58', NULL, NULL),
(241, 2, 47, 10, 240280, 'disable', '2017-05-19 15:46:17', '2017-05-19 15:50:58', NULL, NULL),
(242, 2, 47, 7, 1035805, 'disable', '2017-05-19 15:46:17', '2017-05-19 15:50:58', NULL, NULL),
(243, 2, 47, 12, 29448, 'disable', '2017-05-19 15:46:17', '2017-05-19 15:50:58', NULL, NULL),
(244, 2, 47, 9, 377733, 'disable', '2017-05-19 15:46:17', '2017-05-19 15:50:58', NULL, NULL),
(245, 2, 47, 11, 128049, 'disable', '2017-05-19 15:46:17', '2017-05-19 15:50:58', NULL, NULL),
(246, 2, 48, 65, 96887, 'disable', '2017-05-19 15:50:58', '2017-05-19 15:54:47', NULL, NULL),
(247, 2, 48, 8, 383820, 'disable', '2017-05-19 15:50:58', '2017-05-19 15:54:47', NULL, NULL),
(248, 2, 48, 10, 383489, 'disable', '2017-05-19 15:50:58', '2017-05-19 15:54:47', NULL, NULL),
(249, 2, 48, 7, 1459998, 'disable', '2017-05-19 15:50:58', '2017-05-19 15:54:47', NULL, NULL),
(250, 2, 48, 12, 38197, 'disable', '2017-05-19 15:50:58', '2017-05-19 15:54:47', NULL, NULL),
(251, 2, 48, 9, 487549, 'disable', '2017-05-19 15:50:58', '2017-05-19 15:54:47', NULL, NULL),
(252, 2, 48, 11, 174494, 'disable', '2017-05-19 15:50:58', '2017-05-19 15:54:47', NULL, NULL),
(253, 2, 49, 65, 167469, 'disable', '2017-05-19 15:54:47', '2017-05-19 18:36:21', NULL, NULL),
(254, 2, 49, 8, 679524, 'disable', '2017-05-19 15:54:47', '2017-05-19 18:36:21', NULL, NULL),
(255, 2, 49, 10, 536725, 'disable', '2017-05-19 15:54:47', '2017-05-19 18:36:21', NULL, NULL),
(256, 2, 49, 7, 2720144, 'disable', '2017-05-19 15:54:47', '2017-05-19 18:36:21', NULL, NULL),
(257, 2, 49, 12, 65934, 'disable', '2017-05-19 15:54:47', '2017-05-19 18:36:21', NULL, NULL),
(258, 2, 49, 9, 903389, 'disable', '2017-05-19 15:54:47', '2017-05-19 18:36:21', NULL, NULL),
(259, 2, 49, 11, 305529, 'disable', '2017-05-19 15:54:47', '2017-05-19 18:36:21', NULL, NULL),
(260, 2, 50, 65, 210983, 'disable', '2017-05-19 16:00:17', '2017-05-19 18:37:29', NULL, NULL),
(261, 2, 50, 8, 868301, 'disable', '2017-05-19 16:00:17', '2017-05-19 16:04:58', NULL, NULL),
(262, 2, 50, 10, 708941, 'disable', '2017-05-19 16:00:17', '2017-05-19 16:04:58', NULL, NULL),
(263, 2, 50, 7, 3219322, 'disable', '2017-05-19 16:00:17', '2017-05-19 16:04:58', NULL, NULL),
(264, 2, 50, 12, 82141, 'disable', '2017-05-19 16:00:17', '2017-05-19 16:04:58', NULL, NULL),
(265, 2, 50, 9, 1095671, 'disable', '2017-05-19 16:00:17', '2017-05-19 16:04:58', NULL, NULL),
(266, 2, 50, 11, 412941, 'disable', '2017-05-19 16:00:17', '2017-05-19 16:04:58', NULL, NULL),
(267, 2, 51, 65, 269030, 'disable', '2017-05-19 16:04:58', '2017-05-19 16:34:55', NULL, NULL),
(268, 2, 51, 8, 1056327, 'disable', '2017-05-19 16:04:58', '2017-05-19 16:34:55', NULL, NULL),
(269, 2, 51, 10, 902121, 'disable', '2017-05-19 16:04:58', '2017-05-19 16:34:55', NULL, NULL),
(270, 2, 51, 7, 4125032, 'disable', '2017-05-19 16:04:58', '2017-05-19 16:34:55', NULL, NULL),
(271, 2, 51, 12, 104214, 'disable', '2017-05-19 16:04:58', '2017-05-19 16:34:55', NULL, NULL),
(272, 2, 51, 9, 1341947, 'disable', '2017-05-19 16:04:58', '2017-05-19 16:34:55', NULL, NULL),
(273, 2, 51, 11, 521097, 'disable', '2017-05-19 16:04:58', '2017-05-19 16:34:55', NULL, NULL),
(274, 2, 52, 65, 269030, 'disable', '2017-05-19 16:34:55', '2017-05-19 16:38:14', NULL, NULL),
(275, 2, 52, 8, 1229151, 'disable', '2017-05-19 16:34:55', '2017-05-19 16:38:14', NULL, NULL),
(276, 2, 52, 10, 1295597, 'disable', '2017-05-19 16:34:55', '2017-05-19 16:38:14', NULL, NULL),
(277, 2, 52, 7, 5003633, 'disable', '2017-05-19 16:34:55', '2017-05-19 16:38:14', NULL, NULL),
(278, 2, 52, 12, 124129, 'disable', '2017-05-19 16:34:55', '2017-05-19 16:38:14', NULL, NULL),
(279, 2, 52, 9, 1582724, 'disable', '2017-05-19 16:34:55', '2017-05-19 16:38:14', NULL, NULL),
(280, 2, 52, 11, 620908, 'disable', '2017-05-19 16:34:55', '2017-05-19 16:38:14', NULL, NULL),
(281, 2, 53, 65, 405560, 'disable', '2017-05-19 16:38:14', '2017-05-19 16:41:12', NULL, NULL),
(282, 2, 53, 8, 1400712, 'disable', '2017-05-19 16:38:14', '2017-05-19 16:41:12', NULL, NULL),
(283, 2, 53, 10, 1518964, 'disable', '2017-05-19 16:38:14', '2017-05-19 16:41:12', NULL, NULL),
(284, 2, 53, 7, 6049655, 'disable', '2017-05-19 16:38:14', '2017-05-19 16:41:12', NULL, NULL),
(285, 2, 53, 12, 143301, 'disable', '2017-05-19 16:38:14', '2017-05-19 16:41:12', NULL, NULL),
(286, 2, 53, 9, 1844463, 'disable', '2017-05-19 16:38:14', '2017-05-19 16:41:12', NULL, NULL),
(287, 2, 53, 11, 729044, 'disable', '2017-05-19 16:38:14', '2017-05-19 16:41:12', NULL, NULL),
(288, 2, 54, 65, 550545, 'disable', '2017-05-19 16:41:12', '2017-05-19 17:01:33', NULL, NULL),
(289, 2, 54, 8, 1890462, 'disable', '2017-05-19 16:41:12', '2017-05-19 17:01:33', NULL, NULL),
(290, 2, 54, 10, 2101330, 'disable', '2017-05-19 16:41:12', '2017-05-19 17:01:33', NULL, NULL),
(291, 2, 54, 7, 8439530, 'disable', '2017-05-19 16:41:12', '2017-05-19 17:01:33', NULL, NULL),
(292, 2, 54, 12, 196922, 'disable', '2017-05-19 16:41:12', '2017-05-19 17:01:33', NULL, NULL),
(293, 2, 54, 9, 2560383, 'disable', '2017-05-19 16:41:12', '2017-05-19 17:01:33', NULL, NULL),
(294, 2, 54, 11, 977765, 'disable', '2017-05-19 16:41:12', '2017-05-19 17:01:33', NULL, NULL),
(295, 2, 55, 65, 767509, 'disable', '2017-05-19 17:01:33', '2017-05-19 17:04:55', NULL, NULL),
(296, 2, 55, 8, 2593169, 'disable', '2017-05-19 17:01:33', '2017-05-19 17:04:55', NULL, NULL),
(297, 2, 55, 10, 2723202, 'disable', '2017-05-19 17:01:33', '2017-05-19 17:04:55', NULL, NULL),
(298, 2, 55, 7, 11754013, 'disable', '2017-05-19 17:01:33', '2017-05-19 17:04:55', NULL, NULL),
(299, 2, 55, 12, 276449, 'disable', '2017-05-19 17:01:33', '2017-05-19 17:04:55', NULL, NULL),
(300, 2, 55, 9, 3494938, 'disable', '2017-05-19 17:01:33', '2017-05-19 17:04:55', NULL, NULL),
(301, 2, 55, 11, 1405543, 'disable', '2017-05-19 17:01:33', '2017-05-19 17:04:55', NULL, NULL),
(302, 2, 56, 65, 912635, 'disable', '2017-05-19 17:04:55', '2017-05-19 17:07:11', NULL, NULL),
(303, 2, 56, 8, 3163211, 'disable', '2017-05-19 17:04:55', '2017-05-19 17:07:11', NULL, NULL),
(304, 2, 56, 10, 3129444, 'disable', '2017-05-19 17:04:55', '2017-05-19 17:07:11', NULL, NULL),
(305, 2, 56, 7, 14020139, 'disable', '2017-05-19 17:04:55', '2017-05-19 17:07:11', NULL, NULL),
(306, 2, 56, 12, 326105, 'disable', '2017-05-19 17:04:55', '2017-05-19 17:07:11', NULL, NULL),
(307, 2, 56, 9, 4369985, 'disable', '2017-05-19 17:04:55', '2017-05-19 17:07:11', NULL, NULL),
(308, 2, 56, 11, 1673200, 'disable', '2017-05-19 17:04:55', '2017-05-19 17:07:11', NULL, NULL),
(309, 2, 57, 65, 1082756, 'disable', '2017-05-19 17:07:11', '2017-05-19 17:10:15', NULL, NULL),
(310, 2, 57, 8, 3665234, 'disable', '2017-05-19 17:07:11', '2017-05-19 17:10:15', NULL, NULL),
(311, 2, 57, 10, 3593507, 'disable', '2017-05-19 17:07:11', '2017-05-19 17:10:15', NULL, NULL),
(312, 2, 57, 7, 16413281, 'disable', '2017-05-19 17:07:11', '2017-05-19 17:10:15', NULL, NULL),
(313, 2, 57, 12, 391840, 'disable', '2017-05-19 17:07:11', '2017-05-19 17:10:15', NULL, NULL),
(314, 2, 57, 9, 5073652, 'disable', '2017-05-19 17:07:11', '2017-05-19 17:10:15', NULL, NULL),
(315, 2, 57, 11, 1969351, 'disable', '2017-05-19 17:07:11', '2017-05-19 17:10:15', NULL, NULL),
(316, 2, 58, 65, 1245409, 'enable', '2017-05-19 17:10:15', NULL, NULL, NULL),
(317, 2, 58, 8, 4168946, 'enable', '2017-05-19 17:10:15', NULL, NULL, NULL),
(318, 2, 58, 10, 3884412, 'enable', '2017-05-19 17:10:15', NULL, NULL, NULL),
(319, 2, 58, 7, 18613329, 'enable', '2017-05-19 17:10:15', NULL, NULL, NULL),
(320, 2, 58, 12, 446015, 'enable', '2017-05-19 17:10:15', NULL, NULL, NULL),
(321, 2, 58, 9, 6077292, 'enable', '2017-05-19 17:10:15', NULL, NULL, NULL),
(322, 2, 58, 11, 2268753, 'enable', '2017-05-19 17:10:15', NULL, NULL, NULL),
(323, 6, 59, 33, 484655, 'enable', '2017-05-19 17:39:08', NULL, NULL, NULL),
(324, 6, 59, 28, 4393544, 'enable', '2017-05-19 17:39:08', NULL, NULL, NULL),
(325, 6, 59, 30, 260082, 'enable', '2017-05-19 17:39:08', NULL, NULL, NULL),
(326, 6, 59, 26, 21659053, 'enable', '2017-05-19 17:39:08', NULL, NULL, NULL),
(327, 6, 59, 34, 114327, 'enable', '2017-05-19 17:39:08', NULL, NULL, NULL),
(328, 6, 59, 29, 737962, 'enable', '2017-05-19 17:39:08', NULL, NULL, NULL),
(329, 6, 59, 35, 59646, 'enable', '2017-05-19 17:39:08', NULL, NULL, NULL),
(330, 6, 59, 32, 129222, 'enable', '2017-05-19 17:39:08', NULL, NULL, NULL),
(331, 6, 59, 36, 55176, 'enable', '2017-05-19 17:39:08', NULL, NULL, NULL),
(332, 6, 59, 31, 235363, 'enable', '2017-05-19 17:39:08', NULL, NULL, NULL),
(333, 6, 59, 37, 28090, 'enable', '2017-05-19 17:39:08', NULL, NULL, NULL),
(334, 1, 60, 4, 297276, 'disable', '2017-05-19 18:00:42', '2017-05-20 06:32:41', NULL, NULL),
(335, 1, 60, 77, 784419, 'disable', '2017-05-19 18:00:42', '2017-05-20 06:32:41', NULL, NULL),
(336, 1, 60, 3, 10125855, 'disable', '2017-05-19 18:00:42', '2017-05-20 06:32:41', NULL, NULL),
(337, 1, 60, 1, 14619848, 'disable', '2017-05-19 18:00:42', '2017-05-20 06:32:41', NULL, NULL),
(338, 1, 60, 6, 139331, 'disable', '2017-05-19 18:00:42', '2017-05-20 06:32:41', NULL, NULL),
(339, 1, 61, 4, 455211, 'disable', '2017-05-20 06:32:41', '2017-05-20 09:37:45', NULL, NULL),
(340, 1, 61, 77, 1162259, 'disable', '2017-05-20 06:32:41', '2017-05-20 09:37:45', NULL, NULL),
(341, 1, 61, 3, 15452194, 'disable', '2017-05-20 06:32:41', '2017-05-20 09:37:45', NULL, NULL),
(342, 1, 61, 1, 22796468, 'disable', '2017-05-20 06:32:41', '2017-05-20 09:37:45', NULL, NULL),
(343, 1, 61, 6, 210597, 'disable', '2017-05-20 06:32:41', '2017-05-20 09:37:45', NULL, NULL),
(344, 1, 62, 4, 478215, 'enable', '2017-05-20 09:37:45', NULL, NULL, NULL),
(345, 1, 62, 77, 1190401, 'enable', '2017-05-20 09:37:45', NULL, NULL, NULL),
(346, 1, 62, 3, 15786449, 'enable', '2017-05-20 09:37:45', NULL, NULL, NULL),
(347, 1, 62, 1, 23549616, 'enable', '2017-05-20 09:37:45', NULL, NULL, NULL),
(348, 1, 62, 6, 215450, 'enable', '2017-05-20 09:37:45', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `candidas`
--
ALTER TABLE `candidas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `candida_election_id` (`election_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `elections`
--
ALTER TABLE `elections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reports_election_id` (`election_id`);

--
-- Indexes for table `resultbyplaces`
--
ALTER TABLE `resultbyplaces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resultbyplase_election_id` (`election_id`),
  ADD KEY `resultbyplase_candida_id` (`candida_id`),
  ADD KEY `resultbyplase_report_id` (`report_id`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `results_election_id` (`election_id`),
  ADD KEY `results_report_id` (`report_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `candidas`
--
ALTER TABLE `candidas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `elections`
--
ALTER TABLE `elections`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;
--
-- AUTO_INCREMENT for table `resultbyplaces`
--
ALTER TABLE `resultbyplaces`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=349;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `candidas`
--
ALTER TABLE `candidas`
  ADD CONSTRAINT `candida_election_id` FOREIGN KEY (`election_id`) REFERENCES `elections` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_election_id` FOREIGN KEY (`election_id`) REFERENCES `elections` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `resultbyplaces`
--
ALTER TABLE `resultbyplaces`
  ADD CONSTRAINT `resultbyplase_candida_id` FOREIGN KEY (`candida_id`) REFERENCES `candidas` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `resultbyplase_election_id` FOREIGN KEY (`election_id`) REFERENCES `elections` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `resultbyplase_report_id` FOREIGN KEY (`report_id`) REFERENCES `reports` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_election_id` FOREIGN KEY (`election_id`) REFERENCES `elections` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `results_report_id` FOREIGN KEY (`report_id`) REFERENCES `reports` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;