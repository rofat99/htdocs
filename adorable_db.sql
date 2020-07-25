-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 22, 2020 at 06:48 AM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `adorable_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `sma_addresses`
--

DROP TABLE IF EXISTS `sma_addresses`;
CREATE TABLE IF NOT EXISTS `sma_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NOT NULL,
  `line1` varchar(50) NOT NULL,
  `line2` varchar(50) DEFAULT NULL,
  `city` varchar(25) NOT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `state` varchar(25) NOT NULL,
  `country` varchar(50) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `company_id` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustments`
--

DROP TABLE IF EXISTS `sma_adjustments`;
CREATE TABLE IF NOT EXISTS `sma_adjustments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` text,
  `attachment` varchar(55) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `count_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_adjustment_items`
--

DROP TABLE IF EXISTS `sma_adjustment_items`;
CREATE TABLE IF NOT EXISTS `sma_adjustment_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adjustment_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `spoiled` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `adjustment_id` (`adjustment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_brands`
--

DROP TABLE IF EXISTS `sma_brands`;
CREATE TABLE IF NOT EXISTS `sma_brands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_brands`
--

INSERT INTO `sma_brands` (`id`, `code`, `name`, `image`, `slug`) VALUES
(1, 'cas', 'thai', NULL, 'thai');

-- --------------------------------------------------------

--
-- Table structure for table `sma_calendar`
--

DROP TABLE IF EXISTS `sma_calendar`;
CREATE TABLE IF NOT EXISTS `sma_calendar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(55) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  `color` varchar(7) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_captcha`
--

DROP TABLE IF EXISTS `sma_captcha`;
CREATE TABLE IF NOT EXISTS `sma_captcha` (
  `captcha_id` bigint(13) UNSIGNED NOT NULL AUTO_INCREMENT,
  `captcha_time` int(10) UNSIGNED NOT NULL,
  `ip_address` varchar(16) CHARACTER SET latin1 NOT NULL DEFAULT '0',
  `word` varchar(20) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_categories`
--

DROP TABLE IF EXISTS `sma_categories`;
CREATE TABLE IF NOT EXISTS `sma_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  `image` varchar(55) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_categories`
--

INSERT INTO `sma_categories` (`id`, `code`, `name`, `image`, `parent_id`, `slug`) VALUES
(7, 'មួក', 'មួក', NULL, 0, '1'),
(8, 'រ៉ូប', 'រ៉ូប', NULL, 0, '1'),
(11, 'ខោរក្មេងស្រី', 'ខោរក្មេងស្រី', NULL, 0, '1'),
(12, 'ឈុត', 'ឈុត', NULL, 0, '1'),
(13, 'ស្បែកជើង', 'ស្បែកជើង', NULL, 0, NULL),
(14, 'អាវយឺត', 'អាវយឺត', NULL, 0, NULL),
(15, 'អាវក្នុង', 'អាវក្នុង', NULL, 0, '1'),
(16, 'ខោចម្រុះ', 'ខោចម្រុះ', NULL, 0, '1'),
(17, '9911', 'test', NULL, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_combo_items`
--

DROP TABLE IF EXISTS `sma_combo_items`;
CREATE TABLE IF NOT EXISTS `sma_combo_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `item_code` varchar(20) NOT NULL,
  `quantity` decimal(12,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_companies`
--

DROP TABLE IF EXISTS `sma_companies`;
CREATE TABLE IF NOT EXISTS `sma_companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(10) UNSIGNED DEFAULT NULL,
  `group_name` varchar(20) NOT NULL,
  `customer_group_id` int(11) DEFAULT NULL,
  `customer_group_name` varchar(100) DEFAULT NULL,
  `name` varchar(55) NOT NULL,
  `table` varchar(50) NOT NULL,
  `company` varchar(255) NOT NULL,
  `vat_no` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(55) DEFAULT NULL,
  `state` varchar(55) DEFAULT NULL,
  `postal_code` varchar(8) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `cf1` varchar(100) DEFAULT NULL,
  `cf2` varchar(100) DEFAULT NULL,
  `cf3` varchar(100) DEFAULT NULL,
  `cf4` varchar(100) DEFAULT NULL,
  `cf5` varchar(100) DEFAULT NULL,
  `cf6` varchar(100) DEFAULT NULL,
  `invoice_footer` text CHARACTER SET utf8mb4,
  `payment_term` int(11) DEFAULT '0',
  `logo` varchar(255) DEFAULT 'logo.png',
  `award_points` int(11) DEFAULT '0',
  `deposit_amount` decimal(25,4) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL,
  `price_group_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `group_id_2` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_companies`
--

INSERT INTO `sma_companies` (`id`, `group_id`, `group_name`, `customer_group_id`, `customer_group_name`, `name`, `table`, `company`, `vat_no`, `address`, `city`, `state`, `postal_code`, `country`, `phone`, `email`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `invoice_footer`, `payment_term`, `logo`, `award_points`, `deposit_amount`, `price_group_id`, `price_group_name`) VALUES
(1, 3, 'customer', 1, 'General', 'អតិថិជនទូទៅ', '', 'អតិថិជនទូទៅ', '', 'testing@gmail.com', 'PP', '', '', '', '123456789', '', '', '', '', '', '', '', NULL, 0, 'logo.png', 0, NULL, NULL, NULL),
(2, NULL, 'biller', NULL, NULL, 'Adorable Anakut', '', 'Adorable Anakut', '', 'Phnom penh', 'Phnom Penh', '', '', '', '123456789', 'adorableanakut@gmail.com', '', '', '', '', '', '', '', 0, 'sma-shop.png', 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_costing`
--

DROP TABLE IF EXISTS `sma_costing`;
CREATE TABLE IF NOT EXISTS `sma_costing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sale_item_id` int(11) NOT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `purchase_net_unit_cost` decimal(25,4) DEFAULT NULL,
  `purchase_unit_cost` decimal(25,4) DEFAULT NULL,
  `sale_net_unit_price` decimal(25,4) NOT NULL,
  `sale_unit_price` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT NULL,
  `inventory` tinyint(1) DEFAULT '0',
  `overselling` tinyint(1) DEFAULT '0',
  `option_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_costing`
--

INSERT INTO `sma_costing` (`id`, `date`, `product_id`, `sale_item_id`, `sale_id`, `purchase_item_id`, `quantity`, `purchase_net_unit_cost`, `purchase_unit_cost`, `sale_net_unit_price`, `sale_unit_price`, `quantity_balance`, `inventory`, `overselling`, `option_id`) VALUES
(1, '2020-06-21', 2, 1, 1, NULL, '1.0000', '1.5000', '1.5000', '3.0000', '3.0000', NULL, 1, 1, NULL),
(2, '2020-06-21', 1, 2, 1, NULL, '1.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 1, 1, NULL),
(3, '2020-06-21', 5, 3, 2, 5, '1.0000', '3.0000', '3.0000', '5.0000', '5.0000', '9.0000', 1, 0, NULL),
(4, '2020-06-21', 4, 4, 2, 4, '1.0000', '3.0000', '3.0000', '5.0000', '5.0000', '9.0000', 1, 0, NULL),
(5, '2020-06-21', 3, 5, 2, 3, '1.0000', '3.0000', '3.0000', '5.0000', '5.0000', '9.0000', 1, 0, NULL),
(6, '2020-06-21', 2, 6, 2, NULL, '1.0000', '1.5000', '1.5000', '3.0000', '3.0000', NULL, 1, 1, NULL),
(7, '2020-06-21', 2, 7, 3, NULL, '1.0000', '1.5000', '1.5000', '3.0000', '3.0000', NULL, 1, 1, NULL),
(8, '2020-06-21', 5, 8, 4, 5, '1.0000', '3.0000', '3.0000', '5.0000', '5.0000', '8.0000', 1, 0, NULL),
(9, '2020-06-21', 4, 9, 4, 4, '1.0000', '3.0000', '3.0000', '5.0000', '5.0000', '8.0000', 1, 0, NULL),
(10, '2020-06-21', 3, 10, 4, 3, '1.0000', '3.0000', '3.0000', '5.0000', '5.0000', '8.0000', 1, 0, NULL),
(11, '2020-06-21', 2, 11, 4, NULL, '1.0000', '1.5000', '1.5000', '3.0000', '3.0000', NULL, 1, 1, NULL),
(12, '2020-06-21', 1, 12, 4, NULL, '1.0000', '0.0000', '0.0000', '0.0000', '0.0000', NULL, 1, 1, NULL),
(13, '2020-06-21', 5, 13, 5, 5, '1.0000', '3.0000', '3.0000', '5.0000', '5.0000', '7.0000', 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_currencies`
--

DROP TABLE IF EXISTS `sma_currencies`;
CREATE TABLE IF NOT EXISTS `sma_currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(5) NOT NULL,
  `name` varchar(55) NOT NULL,
  `rate` decimal(12,4) NOT NULL,
  `auto_update` tinyint(1) NOT NULL DEFAULT '0',
  `symbol` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_currencies`
--

INSERT INTO `sma_currencies` (`id`, `code`, `name`, `rate`, `auto_update`, `symbol`) VALUES
(1, 'USD', 'US Dollar', '1.0000', 0, NULL),
(3, 'REL', 'riel', '4100.0000', 0, 'r');

-- --------------------------------------------------------

--
-- Table structure for table `sma_customer_groups`
--

DROP TABLE IF EXISTS `sma_customer_groups`;
CREATE TABLE IF NOT EXISTS `sma_customer_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `percent` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_customer_groups`
--

INSERT INTO `sma_customer_groups` (`id`, `name`, `percent`) VALUES
(1, 'General', 0),
(3, 'VIP', -10);

-- --------------------------------------------------------

--
-- Table structure for table `sma_date_format`
--

DROP TABLE IF EXISTS `sma_date_format`;
CREATE TABLE IF NOT EXISTS `sma_date_format` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `js` varchar(20) NOT NULL,
  `php` varchar(20) NOT NULL,
  `sql` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_date_format`
--

INSERT INTO `sma_date_format` (`id`, `js`, `php`, `sql`) VALUES
(1, 'mm-dd-yyyy', 'm-d-Y', '%m-%d-%Y'),
(2, 'mm/dd/yyyy', 'm/d/Y', '%m/%d/%Y'),
(3, 'mm.dd.yyyy', 'm.d.Y', '%m.%d.%Y'),
(4, 'dd-mm-yyyy', 'd-m-Y', '%d-%m-%Y'),
(5, 'dd/mm/yyyy', 'd/m/Y', '%d/%m/%Y'),
(6, 'dd.mm.yyyy', 'd.m.Y', '%d.%m.%Y');

-- --------------------------------------------------------

--
-- Table structure for table `sma_deliveries`
--

DROP TABLE IF EXISTS `sma_deliveries`;
CREATE TABLE IF NOT EXISTS `sma_deliveries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) NOT NULL,
  `do_reference_no` varchar(50) NOT NULL,
  `sale_reference_no` varchar(50) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `status` varchar(15) DEFAULT NULL,
  `attachment` varchar(50) DEFAULT NULL,
  `delivered_by` varchar(50) DEFAULT NULL,
  `received_by` varchar(50) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_deposits`
--

DROP TABLE IF EXISTS `sma_deposits`;
CREATE TABLE IF NOT EXISTS `sma_deposits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `company_id` int(11) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `paid_by` varchar(50) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_expenses`
--

DROP TABLE IF EXISTS `sma_expenses`;
CREATE TABLE IF NOT EXISTS `sma_expenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference` varchar(50) NOT NULL,
  `amount` decimal(25,4) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_expense_categories`
--

DROP TABLE IF EXISTS `sma_expense_categories`;
CREATE TABLE IF NOT EXISTS `sma_expense_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(55) NOT NULL,
  `name` varchar(55) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_expent_type`
--

DROP TABLE IF EXISTS `sma_expent_type`;
CREATE TABLE IF NOT EXISTS `sma_expent_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `expend_name` varchar(54) DEFAULT NULL,
  `expend_description` varchar(54) DEFAULT NULL,
  `date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `reference` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_expent_type`
--

INSERT INTO `sma_expent_type` (`id`, `expend_name`, `expend_description`, `date`, `reference`) VALUES
(1, 'Food', '', '2019-09-05 13:38:00', 'EXP/2019/09/0001'),
(2, 'ចាក់សាំង', '', '2019-09-06 10:35:00', 'ចាក់សាំង'),
(3, 'ផ្ញើ៏៏ឥវ៉ាន់', '', '2019-09-06 10:36:00', 'ផ្ញើ៏៏ឥវ៉ាន់'),
(4, 'ដូរទឺក', '', '2019-09-06 10:39:00', 'ដូរទឺក'),
(5, 'ធ្វើម៉ូតូ', '', '2019-09-07 14:22:00', 'ធ្វើម៉ូតូ'),
(6, 'ចាក់សាំងកង់បី', '', '2019-09-13 18:54:00', 'ចាក់សាំងកង់បី'),
(7, 'កន្លែងលក់', '', '2019-12-06 14:52:00', 'EXP/2019/12/0001'),
(8, 'ផាសុី', '', '2019-12-06 14:53:00', 'EXP/2019/12/0001'),
(9, 'តុត​តុត', '', '2019-12-06 14:53:00', 'EXP/2019/12/0001'),
(10, 'ទិញថង់', '', '2019-12-06 17:33:00', 'EXP/2019/12/0001'),
(14, 'ទិញប្រេងឆា', '', '2019-12-06 19:24:00', 'EXP/2019/12/0001'),
(15, 'បង្គ្រប់លីេប្រាក់បងខា(ប្តីបងភី)', '', '2019-12-07 19:22:00', 'EXP/2019/12/0001'),
(16, 'អាពី', '', '2019-12-08 19:50:00', 'EXP/2019/12/0001'),
(18, 'ទិញកាតទូរស័ព្ទ', '', '2019-12-10 19:04:00', 'EXP/2019/12/0001'),
(21, 'ជិះកង់បី', '', '2019-12-15 18:48:00', 'EXP/2019/12/0001'),
(22, 'ទឹកត្រី', '', '2019-12-15 18:49:00', 'EXP/2019/12/0001'),
(23, 'ទិញសាប៊ូ', '', '2019-12-25 08:14:00', 'EXP/2019/12/0001'),
(24, 'ទិញគុយទាវអោយចែ', '', '2019-12-27 16:34:00', 'EXP/2019/12/0001'),
(25, 'ម៉ូតូឌុប', '', '2020-01-01 13:55:00', 'EXP/2020/01/0001'),
(26, 'អូសអីវ៉ាន់ចូលផ្សារ', '', '2020-01-03 14:07:00', 'EXP/2020/01/0001'),
(27, 'ទិញឥវ៉ាន់online', '', '2020-01-05 12:10:00', 'ទិញឥវ៉ាន់online'),
(28, 'ទិញទឹកដោះគោ', '', '2020-01-05 18:54:00', 'ទិញទឹកដោះគោ'),
(29, 'បុគ្គលិកខ្ចីលុយ', '', '2020-01-06 17:11:00', 'បុគ្គលិកខ្ចីលុយ'),
(30, '6.25', '', '2020-01-09 17:20:00', 'Food'),
(32, '0.5', '', '2020-01-15 18:08:00', 'ទិញទឺកអោយបងពី'),
(33, 'បង្គ្រប់ប្រាក់ខែ', '', '2020-01-18 12:54:00', 'បង្គ្រប់ប្រាក់ខែ'),
(34, 'ទិញថ្នាំអោយបង', '', '2020-01-30 18:11:00', 'ទិញថ្នាំអោយបង'),
(35, 'ទិញផ្លែឈើសែន', '', '2020-02-01 17:15:00', 'ទិញផ្លែឈើសែន'),
(36, 'ចាក់សាំងឡាន', '', '2020-02-01 17:54:00', 'ចាក់សាំងឡាន'),
(37, 'បង់ថ្លៃទឹក', '', '2020-02-05 17:43:00', 'បង់ថ្លៃទឹក'),
(38, 'ទិញនំសែន', '', '2020-02-08 15:24:00', 'ទិញនំសែន'),
(39, 'ទិញមាន់សែន', '', '2020-02-11 19:24:00', 'ទិញមាន់សែន'),
(40, 'ទិញហ្វឺត', '', '2020-02-11 19:32:00', 'ទិញហ្វឺត'),
(41, 'ទិញស្រាសែន', '', '2020-02-11 19:34:00', 'ទិញស្រាសែន'),
(42, 'បងផាតដកទិញម្ហូប', '', '2020-02-12 17:28:00', 'បងផាតដកទិញម្ងូប'),
(43, 'ចែពៅដកជិះតុតុ', '', '2020-02-12 17:31:00', 'ចែពៅដកជិះតុតុ'),
(44, 'យកកាត់សក់', '', '2020-02-23 16:24:00', 'អាម៉ាប់'),
(45, 'ទិញគ្រឿង', '', '2020-02-26 19:32:00', 'ទិញគ្រឿង'),
(46, 'ថ្លៃដឺកអង្ករ', '', '2020-02-26 19:34:00', 'ថ្លៃដឺកអង្ករ'),
(47, 'ទិញព្រីភ្លើង', '', '2020-02-27 20:01:00', 'ទិញព្រីភ្លើង'),
(48, '1.25', '', '2020-02-28 17:47:00', 'ទិញបបរអោយអុំ'),
(49, 'ទិញបបរអោយអុំ', '', '2020-02-28 17:52:00', 'ទិញបបរអោយអុំ'),
(50, 'ទិញអំបោស', '', '2020-02-28 17:56:00', 'ទិញអំបោស'),
(51, 'ទិញបាកាសអោយចែពៅ', '', '2020-02-29 19:42:00', 'ទិញបាកាសអោយចែពៅ'),
(52, 'អោយនីននីនកាត់សក់', '', '2020-03-01 19:18:00', 'អោយនីននីនកាត់សក់'),
(53, 'ទិញសៀវភៅ', '', '2020-03-02 20:22:00', 'ទិញសៀវភៅ'),
(54, 'ទិញថ្នាំ', '', '2020-03-09 20:54:00', 'ទិញថ្នាំ'),
(55, 'ទីញថ្នាំលី', '', '2020-03-10 20:24:00', 'ទិញថ្នាំលី'),
(56, 'tes', '', '2020-03-15 19:26:00', 'tes'),
(57, 'អោយនីនទិញំ', '', '2020-03-31 19:52:00', 'អោយនីននីនទិញអីញូូុំ'),
(58, 'ចែលាបជិះតុតទៅលក់', '', '2020-04-02 09:29:00', 'ចែលាបដកជិះតុតទៅលក់'),
(59, 'ផាសុី', '', '2020-04-02 12:16:00', 'កន្លែងផាសុី'),
(60, 'ទិញអីញំុនៅកន្លែងលក់', '', '2020-04-02 12:19:00', 'ចែលាបទិញអីញំុនៅកន្លែងលក់'),
(61, 'រទេះដឹកអីវ៉ាន', '', '2020-04-02 12:21:00', 'រទេះដឹកអីវ៉ាននៅកន្លែងលក់'),
(62, 'តុត​តុត', '', '2020-04-02 12:23:00', 'អ៊ំផាតជិះតុត'),
(63, 'ទិញអាកុល', '', '2020-04-03 19:29:00', 'ទិញអាកុល'),
(64, 'សេវាអនឡាញ', '', '2020-04-03 19:31:00', 'សេវាអីវ៉ានអនឡាញបងវី'),
(65, 'ទិញសាច់ជ្រុួក', '', '2020-04-09 18:20:00', 'ទិញសាច់ជ្រូូក');

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_cards`
--

DROP TABLE IF EXISTS `sma_gift_cards`;
CREATE TABLE IF NOT EXISTS `sma_gift_cards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `card_no` varchar(20) NOT NULL,
  `value` decimal(25,4) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `balance` decimal(25,4) NOT NULL,
  `expiry` date DEFAULT NULL,
  `created_by` varchar(55) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `card_no` (`card_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_gift_card_topups`
--

DROP TABLE IF EXISTS `sma_gift_card_topups`;
CREATE TABLE IF NOT EXISTS `sma_gift_card_topups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `card_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `created_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `card_id` (`card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_groups`
--

DROP TABLE IF EXISTS `sma_groups`;
CREATE TABLE IF NOT EXISTS `sma_groups` (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_groups`
--

INSERT INTO `sma_groups` (`id`, `name`, `description`) VALUES
(1, 'owner', 'Owner'),
(2, 'admin', 'Administrator'),
(3, 'customer', 'Customer'),
(4, 'supplier', 'Supplier'),
(5, 'sales', 'Sales Staff'),
(6, 'cashier', 'cashier'),
(7, 'account', 'Account Staff');

-- --------------------------------------------------------

--
-- Table structure for table `sma_location`
--

DROP TABLE IF EXISTS `sma_location`;
CREATE TABLE IF NOT EXISTS `sma_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sma_location`
--

INSERT INTO `sma_location` (`id`, `name`, `code`, `slug`) VALUES
(3, 'Location A', 'Location A', 'location-a'),
(2, 'Location B', 'Location B', 'location-b');

-- --------------------------------------------------------

--
-- Table structure for table `sma_login_attempts`
--

DROP TABLE IF EXISTS `sma_login_attempts`;
CREATE TABLE IF NOT EXISTS `sma_login_attempts` (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_migrations`
--

DROP TABLE IF EXISTS `sma_migrations`;
CREATE TABLE IF NOT EXISTS `sma_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_migrations`
--

INSERT INTO `sma_migrations` (`version`) VALUES
(315);

-- --------------------------------------------------------

--
-- Table structure for table `sma_notifications`
--

DROP TABLE IF EXISTS `sma_notifications`;
CREATE TABLE IF NOT EXISTS `sma_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_date` datetime DEFAULT NULL,
  `till_date` datetime DEFAULT NULL,
  `scope` tinyint(1) NOT NULL DEFAULT '3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_notifications`
--

INSERT INTO `sma_notifications` (`id`, `comment`, `date`, `from_date`, `till_date`, `scope`) VALUES
(1, '<p>Thank you for purchasing Stock Manager Advance. Please don\'t forget to check the documentation in help folder. If you find any error/bug, please email to support@tecdiary.com with details. You can send us your valued suggestions/feedback too.</p><p>Please rate Stock Manager Advance on your download page of codecanyon.net</p>', '2014-08-14 23:00:57', '2015-01-01 00:00:00', '2017-01-01 00:00:00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `sma_order_ref`
--

DROP TABLE IF EXISTS `sma_order_ref`;
CREATE TABLE IF NOT EXISTS `sma_order_ref` (
  `ref_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `so` int(11) NOT NULL DEFAULT '1',
  `qu` int(11) NOT NULL DEFAULT '1',
  `po` int(11) NOT NULL DEFAULT '1',
  `to` int(11) NOT NULL DEFAULT '1',
  `pos` int(11) NOT NULL DEFAULT '1',
  `do` int(11) NOT NULL DEFAULT '1',
  `pay` int(11) NOT NULL DEFAULT '1',
  `re` int(11) NOT NULL DEFAULT '1',
  `rep` int(11) NOT NULL DEFAULT '1',
  `ex` int(11) NOT NULL DEFAULT '1',
  `ppay` int(11) NOT NULL DEFAULT '1',
  `qa` int(11) DEFAULT '1',
  PRIMARY KEY (`ref_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_order_ref`
--

INSERT INTO `sma_order_ref` (`ref_id`, `date`, `so`, `qu`, `po`, `to`, `pos`, `do`, `pay`, `re`, `rep`, `ex`, `ppay`, `qa`) VALUES
(1, '2015-03-01', 1431, 2, 470, 2, 2025, 1, 3223, 1, 1, 1, 204, 30);

-- --------------------------------------------------------

--
-- Table structure for table `sma_payments`
--

DROP TABLE IF EXISTS `sma_payments`;
CREATE TABLE IF NOT EXISTS `sma_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `sale_id` int(11) DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `reference_no` varchar(50) NOT NULL,
  `transaction_id` varchar(50) DEFAULT NULL,
  `paid_by` varchar(20) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cc_no` varchar(20) DEFAULT NULL,
  `cc_holder` varchar(25) DEFAULT NULL,
  `cc_month` varchar(2) DEFAULT NULL,
  `cc_year` varchar(4) DEFAULT NULL,
  `cc_type` varchar(20) DEFAULT NULL,
  `amount` decimal(25,4) NOT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `pos_paid` decimal(25,4) DEFAULT '0.0000',
  `pos_balance` decimal(25,4) DEFAULT '0.0000',
  `approval_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_payments`
--

INSERT INTO `sma_payments` (`id`, `date`, `sale_id`, `return_id`, `purchase_id`, `reference_no`, `transaction_id`, `paid_by`, `cheque_no`, `cc_no`, `cc_holder`, `cc_month`, `cc_year`, `cc_type`, `amount`, `currency`, `created_by`, `attachment`, `type`, `note`, `pos_paid`, `pos_balance`, `approval_code`) VALUES
(1, '2020-06-21 04:22:10', 1, NULL, NULL, 'IPAY/2020/06/3218', NULL, 'cash', '', '', '', '', '', '', '3.0000', NULL, 1, NULL, 'received', '', '3.0000', '0.0000', NULL),
(2, '2020-06-21 08:23:43', 2, NULL, NULL, 'IPAY/2020/06/3219', NULL, 'cash', '', '', '', '', '', '', '18.0000', NULL, 1, NULL, 'received', '', '18.0000', '0.0000', NULL),
(3, '2020-06-21 08:46:38', 3, NULL, NULL, 'IPAY/2020/06/3220', NULL, 'cash', '', '', '', '', '', '', '3.0000', NULL, 1, NULL, 'received', '', '3.0000', '0.0000', NULL),
(4, '2020-06-21 08:48:57', 4, NULL, NULL, 'IPAY/3221', NULL, 'cash', '', '', '', '', '', '', '18.0000', NULL, 1, NULL, 'received', '', '18.0000', '0.0000', NULL),
(5, '2020-06-21 08:51:07', 5, NULL, NULL, 'IPAY/3222', NULL, 'cash', '', '', '', '', '', '', '5.0000', NULL, 1, NULL, 'received', '', '5.0000', '0.0000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_payment_record`
--

DROP TABLE IF EXISTS `sma_payment_record`;
CREATE TABLE IF NOT EXISTS `sma_payment_record` (
  `rec_id` int(11) NOT NULL AUTO_INCREMENT,
  `cus_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount_usd` varchar(50) NOT NULL,
  `amount_r` varchar(50) NOT NULL,
  `amount_b` varchar(50) NOT NULL,
  `delete` int(10) NOT NULL,
  `billers` int(11) NOT NULL,
  PRIMARY KEY (`rec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_payment_record_detail`
--

DROP TABLE IF EXISTS `sma_payment_record_detail`;
CREATE TABLE IF NOT EXISTS `sma_payment_record_detail` (
  `record_detailid` int(11) NOT NULL AUTO_INCREMENT,
  `rec_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `amount_usd` varchar(50) NOT NULL,
  `amount_r` varchar(50) NOT NULL,
  `amount_b` varchar(50) NOT NULL,
  `payment_status` varchar(50) NOT NULL,
  PRIMARY KEY (`record_detailid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_paypal`
--

DROP TABLE IF EXISTS `sma_paypal`;
CREATE TABLE IF NOT EXISTS `sma_paypal` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL,
  `paypal_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '2.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '3.9000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '4.4000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_paypal`
--

INSERT INTO `sma_paypal` (`id`, `active`, `account_email`, `paypal_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'mypaypal@paypal.com', 'USD', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_permissions`
--

DROP TABLE IF EXISTS `sma_permissions`;
CREATE TABLE IF NOT EXISTS `sma_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `products-index` tinyint(1) DEFAULT '0',
  `products-add` tinyint(1) DEFAULT '0',
  `products-edit` tinyint(1) DEFAULT '0',
  `products-delete` tinyint(1) DEFAULT '0',
  `products-cost` tinyint(1) DEFAULT '0',
  `products-price` tinyint(1) DEFAULT '0',
  `quotes-index` tinyint(1) DEFAULT '0',
  `quotes-add` tinyint(1) DEFAULT '0',
  `quotes-edit` tinyint(1) DEFAULT '0',
  `quotes-pdf` tinyint(1) DEFAULT '0',
  `quotes-email` tinyint(1) DEFAULT '0',
  `quotes-delete` tinyint(1) DEFAULT '0',
  `sales-index` tinyint(1) DEFAULT '0',
  `sales-add` tinyint(1) DEFAULT '0',
  `sales-edit` tinyint(1) DEFAULT '0',
  `sales-pdf` tinyint(1) DEFAULT '0',
  `sales-email` tinyint(1) DEFAULT '0',
  `sales-delete` tinyint(1) DEFAULT '0',
  `purchases-index` tinyint(1) DEFAULT '0',
  `purchases-add` tinyint(1) DEFAULT '0',
  `purchases-edit` tinyint(1) DEFAULT '0',
  `purchases-pdf` tinyint(1) DEFAULT '0',
  `purchases-email` tinyint(1) DEFAULT '0',
  `purchases-delete` tinyint(1) DEFAULT '0',
  `transfers-index` tinyint(1) DEFAULT '0',
  `transfers-add` tinyint(1) DEFAULT '0',
  `transfers-edit` tinyint(1) DEFAULT '0',
  `transfers-pdf` tinyint(1) DEFAULT '0',
  `transfers-email` tinyint(1) DEFAULT '0',
  `transfers-delete` tinyint(1) DEFAULT '0',
  `customers-index` tinyint(1) DEFAULT '0',
  `customers-add` tinyint(1) DEFAULT '0',
  `customers-edit` tinyint(1) DEFAULT '0',
  `customers-delete` tinyint(1) DEFAULT '0',
  `suppliers-index` tinyint(1) DEFAULT '0',
  `suppliers-add` tinyint(1) DEFAULT '0',
  `suppliers-edit` tinyint(1) DEFAULT '0',
  `suppliers-delete` tinyint(1) DEFAULT '0',
  `sales-deliveries` tinyint(1) DEFAULT '0',
  `sales-add_delivery` tinyint(1) DEFAULT '0',
  `sales-edit_delivery` tinyint(1) DEFAULT '0',
  `sales-delete_delivery` tinyint(1) DEFAULT '0',
  `sales-email_delivery` tinyint(1) DEFAULT '0',
  `sales-pdf_delivery` tinyint(1) DEFAULT '0',
  `sales-gift_cards` tinyint(1) DEFAULT '0',
  `sales-add_gift_card` tinyint(1) DEFAULT '0',
  `sales-edit_gift_card` tinyint(1) DEFAULT '0',
  `sales-delete_gift_card` tinyint(1) DEFAULT '0',
  `pos-index` tinyint(1) DEFAULT '0',
  `sales-return_sales` tinyint(1) DEFAULT '0',
  `reports-index` tinyint(1) DEFAULT '0',
  `reports-warehouse_stock` tinyint(1) DEFAULT '0',
  `reports-quantity_alerts` tinyint(1) DEFAULT '0',
  `reports-expiry_alerts` tinyint(1) DEFAULT '0',
  `reports-products` tinyint(1) DEFAULT '0',
  `reports-daily_sales` tinyint(1) DEFAULT '0',
  `reports-monthly_sales` tinyint(1) DEFAULT '0',
  `reports-sales` tinyint(1) DEFAULT '0',
  `reports-payments` tinyint(1) DEFAULT '0',
  `reports-purchases` tinyint(1) DEFAULT '0',
  `reports-profit_loss` tinyint(1) DEFAULT '0',
  `reports-customers` tinyint(1) DEFAULT '0',
  `reports-suppliers` tinyint(1) DEFAULT '0',
  `reports-staff` tinyint(1) DEFAULT '0',
  `reports-register` tinyint(1) DEFAULT '0',
  `sales-payments` tinyint(1) DEFAULT '0',
  `purchases-payments` tinyint(1) DEFAULT '0',
  `purchases-expenses` tinyint(1) DEFAULT '0',
  `products-adjustments` tinyint(1) NOT NULL DEFAULT '0',
  `bulk_actions` tinyint(1) NOT NULL DEFAULT '0',
  `customers-deposits` tinyint(1) NOT NULL DEFAULT '0',
  `customers-delete_deposit` tinyint(1) NOT NULL DEFAULT '0',
  `products-barcode` tinyint(1) NOT NULL DEFAULT '0',
  `purchases-return_purchases` tinyint(1) NOT NULL DEFAULT '0',
  `reports-expenses` tinyint(1) NOT NULL DEFAULT '0',
  `reports-daily_purchases` tinyint(1) DEFAULT '0',
  `reports-monthly_purchases` tinyint(1) DEFAULT '0',
  `products-stock_count` tinyint(1) DEFAULT '0',
  `edit_price` tinyint(1) DEFAULT '0',
  `reports-profit_and_loss` tinyint(1) DEFAULT NULL,
  `reports-warehouse_chat` tinyint(1) DEFAULT NULL,
  `reports-stock_in_out_report` tinyint(1) DEFAULT NULL,
  `reports-register_report` tinyint(1) DEFAULT NULL,
  `account_receivable` tinyint(1) DEFAULT NULL,
  `account_payable` tinyint(1) DEFAULT NULL,
  `add-purchases-expenses` tinyint(1) DEFAULT NULL,
  `sum_purchases_payment` tinyint(1) DEFAULT NULL,
  `list_purchases_payment` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_permissions`
--

INSERT INTO `sma_permissions` (`id`, `group_id`, `products-index`, `products-add`, `products-edit`, `products-delete`, `products-cost`, `products-price`, `quotes-index`, `quotes-add`, `quotes-edit`, `quotes-pdf`, `quotes-email`, `quotes-delete`, `sales-index`, `sales-add`, `sales-edit`, `sales-pdf`, `sales-email`, `sales-delete`, `purchases-index`, `purchases-add`, `purchases-edit`, `purchases-pdf`, `purchases-email`, `purchases-delete`, `transfers-index`, `transfers-add`, `transfers-edit`, `transfers-pdf`, `transfers-email`, `transfers-delete`, `customers-index`, `customers-add`, `customers-edit`, `customers-delete`, `suppliers-index`, `suppliers-add`, `suppliers-edit`, `suppliers-delete`, `sales-deliveries`, `sales-add_delivery`, `sales-edit_delivery`, `sales-delete_delivery`, `sales-email_delivery`, `sales-pdf_delivery`, `sales-gift_cards`, `sales-add_gift_card`, `sales-edit_gift_card`, `sales-delete_gift_card`, `pos-index`, `sales-return_sales`, `reports-index`, `reports-warehouse_stock`, `reports-quantity_alerts`, `reports-expiry_alerts`, `reports-products`, `reports-daily_sales`, `reports-monthly_sales`, `reports-sales`, `reports-payments`, `reports-purchases`, `reports-profit_loss`, `reports-customers`, `reports-suppliers`, `reports-staff`, `reports-register`, `sales-payments`, `purchases-payments`, `purchases-expenses`, `products-adjustments`, `bulk_actions`, `customers-deposits`, `customers-delete_deposit`, `products-barcode`, `purchases-return_purchases`, `reports-expenses`, `reports-daily_purchases`, `reports-monthly_purchases`, `products-stock_count`, `edit_price`, `reports-profit_and_loss`, `reports-warehouse_chat`, `reports-stock_in_out_report`, `reports-register_report`, `account_receivable`, `account_payable`, `add-purchases-expenses`, `sum_purchases_payment`, `list_purchases_payment`) VALUES
(1, 5, 1, 1, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, NULL, 1, 1, NULL, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, NULL, 1, 1, 1, NULL, 1, 1, 1, NULL, NULL, 1, 1, 1, NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, 0, 0, 1, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(2, 6, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, NULL, NULL, 1, 1, NULL, 1, NULL, 1, 0, NULL, NULL, 0, 0, 1, NULL, NULL, 0, 0, 0, 0, 1, 0, 1, NULL, NULL, NULL, NULL, 1, 1, 1, 1, NULL, 1, NULL, NULL, NULL),
(3, 7, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 1, 1, NULL, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0, NULL, NULL, 1, 1, NULL, 1, NULL, 1, 0, NULL, NULL, 0, 0, 1, 1, 1, 1, 0, 1, 0, 1, 1, 1, NULL, NULL, 1, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_register`
--

DROP TABLE IF EXISTS `sma_pos_register`;
CREATE TABLE IF NOT EXISTS `sma_pos_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL,
  `cash_in_hand` decimal(25,4) NOT NULL,
  `status` varchar(10) NOT NULL,
  `total_cash` decimal(25,4) DEFAULT NULL,
  `total_cheques` int(11) DEFAULT NULL,
  `total_cc_slips` int(11) DEFAULT NULL,
  `total_cash_submitted` decimal(25,4) DEFAULT NULL,
  `total_cheques_submitted` int(11) DEFAULT NULL,
  `total_cc_slips_submitted` int(11) DEFAULT NULL,
  `note` text,
  `closed_at` timestamp NULL DEFAULT NULL,
  `transfer_opened_bills` varchar(50) DEFAULT NULL,
  `closed_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_pos_register`
--

INSERT INTO `sma_pos_register` (`id`, `date`, `user_id`, `cash_in_hand`, `status`, `total_cash`, `total_cheques`, `total_cc_slips`, `total_cash_submitted`, `total_cheques_submitted`, `total_cc_slips_submitted`, `note`, `closed_at`, `transfer_opened_bills`, `closed_by`) VALUES
(1, '2020-06-20 04:43:57', 1, '0.0000', 'open', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_pos_settings`
--

DROP TABLE IF EXISTS `sma_pos_settings`;
CREATE TABLE IF NOT EXISTS `sma_pos_settings` (
  `pos_id` int(1) NOT NULL,
  `cat_limit` int(11) NOT NULL,
  `pro_limit` int(11) NOT NULL,
  `default_category` int(11) NOT NULL,
  `default_customer` int(11) NOT NULL,
  `default_biller` int(11) NOT NULL,
  `display_time` varchar(3) NOT NULL DEFAULT 'yes',
  `cf_title1` varchar(255) DEFAULT NULL,
  `cf_title2` varchar(255) DEFAULT NULL,
  `cf_value1` varchar(255) DEFAULT NULL,
  `cf_value2` varchar(255) DEFAULT NULL,
  `receipt_printer` varchar(55) DEFAULT NULL,
  `cash_drawer_codes` varchar(55) DEFAULT NULL,
  `focus_add_item` varchar(55) DEFAULT NULL,
  `add_manual_product` varchar(55) DEFAULT NULL,
  `customer_selection` varchar(55) DEFAULT NULL,
  `add_customer` varchar(55) DEFAULT NULL,
  `toggle_category_slider` varchar(55) DEFAULT NULL,
  `toggle_subcategory_slider` varchar(55) DEFAULT NULL,
  `cancel_sale` varchar(55) DEFAULT NULL,
  `suspend_sale` varchar(55) DEFAULT NULL,
  `print_items_list` varchar(55) DEFAULT NULL,
  `finalize_sale` varchar(55) DEFAULT NULL,
  `today_sale` varchar(55) DEFAULT NULL,
  `open_hold_bills` varchar(55) DEFAULT NULL,
  `close_register` varchar(55) DEFAULT NULL,
  `keyboard` tinyint(1) NOT NULL,
  `pos_printers` varchar(255) DEFAULT NULL,
  `java_applet` tinyint(1) NOT NULL,
  `product_button_color` varchar(20) NOT NULL DEFAULT 'default',
  `tooltips` tinyint(1) DEFAULT '1',
  `paypal_pro` tinyint(1) DEFAULT '0',
  `stripe` tinyint(1) DEFAULT '0',
  `rounding` tinyint(1) DEFAULT '0',
  `char_per_line` tinyint(4) DEFAULT '42',
  `pin_code` varchar(20) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT 'purchase_code',
  `envato_username` varchar(50) DEFAULT 'envato_username',
  `version` varchar(10) DEFAULT '3.2.2',
  `after_sale_page` tinyint(1) DEFAULT '0',
  `item_order` tinyint(1) DEFAULT '0',
  `authorize` tinyint(1) DEFAULT '0',
  `toggle_brands_slider` varchar(55) DEFAULT NULL,
  `remote_printing` tinyint(1) DEFAULT '1',
  `printer` int(11) DEFAULT NULL,
  `order_printers` varchar(55) DEFAULT NULL,
  `auto_print` tinyint(1) DEFAULT '0',
  `customer_details` tinyint(1) DEFAULT NULL,
  `local_printers` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`pos_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_pos_settings`
--

INSERT INTO `sma_pos_settings` (`pos_id`, `cat_limit`, `pro_limit`, `default_category`, `default_customer`, `default_biller`, `display_time`, `cf_title1`, `cf_title2`, `cf_value1`, `cf_value2`, `receipt_printer`, `cash_drawer_codes`, `focus_add_item`, `add_manual_product`, `customer_selection`, `add_customer`, `toggle_category_slider`, `toggle_subcategory_slider`, `cancel_sale`, `suspend_sale`, `print_items_list`, `finalize_sale`, `today_sale`, `open_hold_bills`, `close_register`, `keyboard`, `pos_printers`, `java_applet`, `product_button_color`, `tooltips`, `paypal_pro`, `stripe`, `rounding`, `char_per_line`, `pin_code`, `purchase_code`, `envato_username`, `version`, `after_sale_page`, `item_order`, `authorize`, `toggle_brands_slider`, `remote_printing`, `printer`, `order_printers`, `auto_print`, `customer_details`, `local_printers`) VALUES
(1, 22, 36, 11, 1, 2, '1', 'GST Reg', 'VAT Reg', '123456789', '987654321', NULL, 'x1C', 'Ctrl+F3', 'Ctrl+Shift+M', 'Ctrl+Shift+C', 'Ctrl+Shift+A', 'Ctrl+F11', 'Ctrl+F12', 'F4', 'F7', 'F9', 'F8', 'Ctrl+F1', 'Ctrl+F2', 'Ctrl+F10', 0, NULL, 0, 'default', 1, 0, 0, 0, 42, NULL, 'purchase_code', 'envato_username', '3.2.2', 0, 0, 0, '', 1, NULL, 'null', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_price_groups`
--

DROP TABLE IF EXISTS `sma_price_groups`;
CREATE TABLE IF NOT EXISTS `sma_price_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_price_groups`
--

INSERT INTO `sma_price_groups` (`id`, `name`) VALUES
(11, 'sophorn');

-- --------------------------------------------------------

--
-- Table structure for table `sma_printers`
--

DROP TABLE IF EXISTS `sma_printers`;
CREATE TABLE IF NOT EXISTS `sma_printers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(55) NOT NULL,
  `type` varchar(25) NOT NULL,
  `profile` varchar(25) NOT NULL,
  `char_per_line` tinyint(3) UNSIGNED DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `ip_address` varbinary(45) DEFAULT NULL,
  `port` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_products`
--

DROP TABLE IF EXISTS `sma_products`;
CREATE TABLE IF NOT EXISTS `sma_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` char(255) NOT NULL,
  `unit` int(11) DEFAULT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) NOT NULL,
  `alert_quantity` decimal(15,4) DEFAULT '20.0000',
  `image` varchar(255) DEFAULT 'no_image.png',
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) DEFAULT NULL,
  `cf1` varchar(255) DEFAULT NULL,
  `cf2` varchar(255) DEFAULT NULL,
  `cf3` varchar(255) DEFAULT NULL,
  `cf4` varchar(255) DEFAULT NULL,
  `cf5` varchar(255) DEFAULT NULL,
  `cf6` varchar(255) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `tax_rate` int(11) DEFAULT NULL,
  `track_quantity` tinyint(1) DEFAULT '1',
  `details` varchar(1000) DEFAULT NULL,
  `warehouse` int(11) DEFAULT NULL,
  `barcode_symbology` varchar(55) NOT NULL DEFAULT 'code128',
  `file` varchar(100) DEFAULT NULL,
  `product_details` text,
  `tax_method` tinyint(1) DEFAULT '0',
  `type` varchar(55) NOT NULL DEFAULT 'standard',
  `supplier1` int(11) DEFAULT NULL,
  `supplier1price` decimal(25,4) DEFAULT NULL,
  `supplier2` int(11) DEFAULT NULL,
  `supplier2price` decimal(25,4) DEFAULT NULL,
  `supplier3` int(11) DEFAULT NULL,
  `supplier3price` decimal(25,4) DEFAULT NULL,
  `supplier4` int(11) DEFAULT NULL,
  `supplier4price` decimal(25,4) DEFAULT NULL,
  `supplier5` int(11) DEFAULT NULL,
  `supplier5price` decimal(25,4) DEFAULT NULL,
  `promotion` tinyint(1) DEFAULT '0',
  `promo_price` decimal(25,4) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `supplier1_part_no` varchar(50) DEFAULT NULL,
  `supplier2_part_no` varchar(50) DEFAULT NULL,
  `supplier3_part_no` varchar(50) DEFAULT NULL,
  `supplier4_part_no` varchar(50) DEFAULT NULL,
  `supplier5_part_no` varchar(50) DEFAULT NULL,
  `sale_unit` int(11) DEFAULT NULL,
  `purchase_unit` int(11) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  `slug` varchar(55) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `weight` decimal(10,4) DEFAULT NULL,
  `location` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `category_id` (`category_id`),
  KEY `id` (`id`),
  KEY `id_2` (`id`),
  KEY `category_id_2` (`category_id`),
  KEY `unit` (`unit`),
  KEY `brand` (`brand`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_products`
--

INSERT INTO `sma_products` (`id`, `code`, `name`, `unit`, `cost`, `price`, `alert_quantity`, `image`, `category_id`, `subcategory_id`, `cf1`, `cf2`, `cf3`, `cf4`, `cf5`, `cf6`, `quantity`, `tax_rate`, `track_quantity`, `details`, `warehouse`, `barcode_symbology`, `file`, `product_details`, `tax_method`, `type`, `supplier1`, `supplier1price`, `supplier2`, `supplier2price`, `supplier3`, `supplier3price`, `supplier4`, `supplier4price`, `supplier5`, `supplier5price`, `promotion`, `promo_price`, `start_date`, `end_date`, `supplier1_part_no`, `supplier2_part_no`, `supplier3_part_no`, `supplier4_part_no`, `supplier5_part_no`, `sale_unit`, `purchase_unit`, `brand`, `slug`, `featured`, `weight`, `location`) VALUES
(1, '70544162', 'admin', 5, '0.0000', '0.0000', '0.0000', 'no_image.png', 12, NULL, 'location A', 'location A', 'location A', 'location A', 'location A', 'location A', '-2.0000', NULL, 1, '', NULL, 'code128', '', '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 5, 5, 0, '0', NULL, '0.0000', 3),
(2, '42528321', 'Adidas EX', 18, '1.5000', '3.0000', '0.0000', 'no_image.png', 11, NULL, '', '', '', '', '', '', '-4.0000', NULL, 1, '', NULL, 'code128', '', '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 18, 18, 0, '0', NULL, '0.0000', 2),
(3, '61296271', 'test', 5, '3.0000', '5.0000', '0.0000', 'no_image.png', 11, NULL, '', '', '', '', '', '', '8.0000', NULL, 1, '', NULL, 'code128', '', '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 5, 5, 0, '0', NULL, '0.0000', 3),
(4, '21089365', 'tests', 5, '3.0000', '5.0000', '0.0000', 'no_image.png', 11, NULL, '', '', '', '', '', '', '8.0000', NULL, 1, '', NULL, 'code128', '', '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0, 0, 0, '0', NULL, '0.0000', 3),
(5, '15909299', 'testing', 5, '3.0000', '5.0000', '0.0000', 'no_image.png', 11, NULL, '', '', '', '', '', '', '7.0000', NULL, 1, '', NULL, 'code128', '', '', NULL, 'standard', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, 0, 0, 0, '0', NULL, '0.0000', 2);

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_photos`
--

DROP TABLE IF EXISTS `sma_product_photos`;
CREATE TABLE IF NOT EXISTS `sma_product_photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `photo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_product_photos`
--

INSERT INTO `sma_product_photos` (`id`, `product_id`, `photo`) VALUES
(1, 2452, '321d5d11aca605a06e125d4a1b58444f.gif'),
(2, 1767, 'deb06a93f73cea8725a30c95e2c67eb7.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_price`
--

DROP TABLE IF EXISTS `sma_product_price`;
CREATE TABLE IF NOT EXISTS `sma_product_price` (
  `price_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `price` decimal(11,4) DEFAULT NULL,
  `discount` varchar(11) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `warehouse` int(11) DEFAULT NULL,
  PRIMARY KEY (`price_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_prices`
--

DROP TABLE IF EXISTS `sma_product_prices`;
CREATE TABLE IF NOT EXISTS `sma_product_prices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `price_group_id` int(11) NOT NULL,
  `price` decimal(25,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `price_group_id` (`price_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_product_variants`
--

DROP TABLE IF EXISTS `sma_product_variants`;
CREATE TABLE IF NOT EXISTS `sma_product_variants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `name` varchar(55) NOT NULL,
  `cost` decimal(25,4) DEFAULT NULL,
  `price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchases`
--

DROP TABLE IF EXISTS `sma_purchases`;
CREATE TABLE IF NOT EXISTS `sma_purchases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reference_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int(11) NOT NULL,
  `supplier` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `note` varchar(1000) NOT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `product_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_discount` decimal(25,4) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT NULL,
  `product_tax` decimal(25,4) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `paid` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `status` varchar(55) DEFAULT '',
  `payment_status` varchar(20) DEFAULT 'pending',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `return_purchase_ref` varchar(55) DEFAULT NULL,
  `purchase_id` int(11) DEFAULT NULL,
  `return_purchase_total` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `reference` varchar(255) DEFAULT NULL,
  `exType_id` int(11) DEFAULT NULL,
  `abroad_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `abroad_shipping` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchase_items`
--

DROP TABLE IF EXISTS `sma_purchase_items`;
CREATE TABLE IF NOT EXISTS `sma_purchase_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(20) DEFAULT NULL,
  `discount` varchar(20) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `quantity_balance` decimal(15,4) DEFAULT '0.0000',
  `date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `quantity_received` decimal(15,4) DEFAULT NULL,
  `supplier_part_no` varchar(50) DEFAULT NULL,
  `purchase_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `purchase_id` (`purchase_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_purchase_items`
--

INSERT INTO `sma_purchase_items` (`id`, `purchase_id`, `transfer_id`, `product_id`, `product_code`, `product_name`, `option_id`, `net_unit_cost`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `expiry`, `subtotal`, `quantity_balance`, `date`, `status`, `unit_cost`, `real_unit_cost`, `quantity_received`, `supplier_part_no`, `purchase_item_id`, `product_unit_id`, `product_unit_code`, `unit_quantity`) VALUES
(1, NULL, NULL, 2, '', '', NULL, '0.0000', '0.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '-4.0000', '0000-00-00', 'received', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000'),
(2, NULL, NULL, 1, '', '', NULL, '0.0000', '0.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '0.0000', '-2.0000', '0000-00-00', 'received', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0.0000'),
(3, NULL, NULL, 3, '61296271', 'test', NULL, '3.0000', '10.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '30.0000', '8.0000', '2020-06-21', 'received', '3.0000', '3.0000', '10.0000', NULL, NULL, NULL, NULL, '0.0000'),
(4, NULL, NULL, 4, '21089365', 'tests', NULL, '3.0000', '10.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '30.0000', '8.0000', '2020-06-21', 'received', '3.0000', '3.0000', '10.0000', NULL, NULL, NULL, NULL, '0.0000'),
(5, NULL, NULL, 5, '15909299', 'testing', NULL, '3.0000', '10.0000', 1, '0.0000', NULL, NULL, NULL, NULL, NULL, '30.0000', '7.0000', '2020-06-21', 'received', '3.0000', '3.0000', '10.0000', NULL, NULL, NULL, NULL, '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchase_receive`
--

DROP TABLE IF EXISTS `sma_purchase_receive`;
CREATE TABLE IF NOT EXISTS `sma_purchase_receive` (
  `receive_id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) DEFAULT NULL,
  `receive_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `ref_no` varchar(45) DEFAULT NULL,
  `by` varchar(45) DEFAULT NULL,
  `no` int(11) DEFAULT NULL,
  `receive_no` varchar(45) DEFAULT NULL,
  `invoice_no` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`receive_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_purchase_receive`
--

INSERT INTO `sma_purchase_receive` (`receive_id`, `purchase_id`, `receive_date`, `ref_no`, `by`, `no`, `receive_no`, `invoice_no`) VALUES
(1, 147, '2019-12-03 13:50:00', 'PO/2019/12/0346', 'owner', 1, 'RC201912-0001', ''),
(2, 148, '2019-12-03 15:45:00', 'PO/2019/12/0347', 'owner', 2, 'RC201912-0002', ''),
(3, 150, '2019-12-03 16:21:00', 'PO/2019/12/0348', 'owner', 3, 'RC201912-0003', '');

-- --------------------------------------------------------

--
-- Table structure for table `sma_purchase_receive_item`
--

DROP TABLE IF EXISTS `sma_purchase_receive_item`;
CREATE TABLE IF NOT EXISTS `sma_purchase_receive_item` (
  `receive_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `receive_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity` decimal(11,4) DEFAULT '0.0000',
  `date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `cost` decimal(11,4) DEFAULT NULL,
  `purchase_itemid` int(11) DEFAULT NULL,
  `trans_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `not_include` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `transfer_id` int(11) DEFAULT NULL,
  `adjust_id` int(11) DEFAULT NULL,
  `old_stock` decimal(11,4) DEFAULT NULL,
  `internal_usage_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`receive_item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_purchase_receive_item`
--

INSERT INTO `sma_purchase_receive_item` (`receive_item_id`, `receive_id`, `item_id`, `quantity`, `date`, `cost`, `purchase_itemid`, `trans_date`, `not_include`, `warehouse_id`, `transfer_id`, `adjust_id`, `old_stock`, `internal_usage_id`) VALUES
(1, 1, 213, '20.0000', '2019-12-03 13:50:00', '0.0000', 421, '2019-12-03 13:51:34', NULL, 1, NULL, NULL, NULL, NULL),
(2, 2, 214, '100.0000', '2019-12-03 15:45:00', '0.0000', 422, '2019-12-03 15:47:45', NULL, 1, NULL, NULL, '0.0000', NULL),
(3, 3, 214, '100.0000', '2019-12-03 16:21:00', '0.0000', 423, '2019-12-03 16:21:32', NULL, 1, NULL, NULL, '99.0000', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_quotes`
--

DROP TABLE IF EXISTS `sma_quotes`;
CREATE TABLE IF NOT EXISTS `sma_quotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `internal_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `attachment` varchar(55) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `supplier` varchar(55) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_quote_items`
--

DROP TABLE IF EXISTS `sma_quote_items`;
CREATE TABLE IF NOT EXISTS `sma_quote_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quote_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `quote_id` (`quote_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_sales`
--

DROP TABLE IF EXISTS `sma_sales`;
CREATE TABLE IF NOT EXISTS `sma_sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) NOT NULL,
  `biller_id` int(11) NOT NULL,
  `biller` varchar(55) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `staff_note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `product_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount_id` varchar(20) DEFAULT NULL,
  `total_discount` decimal(25,4) DEFAULT '0.0000',
  `order_discount` decimal(25,4) DEFAULT '0.0000',
  `product_tax` decimal(25,4) DEFAULT '0.0000',
  `order_tax_id` int(11) DEFAULT NULL,
  `order_tax` decimal(25,4) DEFAULT '0.0000',
  `total_tax` decimal(25,4) DEFAULT '0.0000',
  `shipping` decimal(25,4) DEFAULT '0.0000',
  `grand_total` decimal(25,4) NOT NULL,
  `sale_status` varchar(20) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_term` tinyint(4) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_items` smallint(6) DEFAULT NULL,
  `pos` tinyint(1) NOT NULL DEFAULT '0',
  `paid` decimal(25,4) DEFAULT '0.0000',
  `return_id` int(11) DEFAULT NULL,
  `surcharge` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  `return_sale_ref` varchar(55) DEFAULT NULL,
  `sale_id` int(11) DEFAULT NULL,
  `return_sale_total` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `rounding` decimal(10,4) DEFAULT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `api` tinyint(1) DEFAULT '0',
  `shop` tinyint(1) DEFAULT '0',
  `address_id` int(11) DEFAULT NULL,
  `reserve_id` int(11) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sales`
--

INSERT INTO `sma_sales` (`id`, `date`, `reference_no`, `customer_id`, `customer`, `biller_id`, `biller`, `warehouse_id`, `note`, `staff_note`, `total`, `product_discount`, `order_discount_id`, `total_discount`, `order_discount`, `product_tax`, `order_tax_id`, `order_tax`, `total_tax`, `shipping`, `grand_total`, `sale_status`, `payment_status`, `payment_term`, `due_date`, `created_by`, `updated_by`, `updated_at`, `total_items`, `pos`, `paid`, `return_id`, `surcharge`, `attachment`, `return_sale_ref`, `sale_id`, `return_sale_total`, `rounding`, `suspend_note`, `api`, `shop`, `address_id`, `reserve_id`, `hash`) VALUES
(1, '2020-06-21 04:22:10', 'SALE/POS/2020/06/2020', 1, 'General Customer', 2, 'Adorable Anakut', 1, 'nullPay US&equals;3&comma; Pay riels&equals;', '', '3.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '3.0000', 'completed', 'paid', 0, NULL, 1, NULL, NULL, 2, 1, '3.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', NULL, 0, 0, NULL, NULL, '5f8970196e482606a9832ae38646d98ccdce858d6428c8cbf617ba6cefc4cb37'),
(2, '2020-06-21 08:23:43', '/POS/2020/06/2021', 1, 'General Customer', 2, 'Adorable Anakut', 1, 'nullPay US&equals;18&comma; Pay riels&equals;', '', '18.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '18.0000', 'completed', 'paid', 0, NULL, 1, NULL, NULL, 4, 1, '18.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', NULL, 0, 0, NULL, NULL, 'cadf621a8d99815b6b1f39ea8028c3f330a0857a086ca76dfa01deeb6574f8d6'),
(3, '2020-06-21 08:46:38', '2020/06/2022', 1, 'General Customer', 2, 'Adorable Anakut', 1, 'nullPay US&equals;3&comma; Pay riels&equals;', '', '3.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '3.0000', 'completed', 'paid', 0, NULL, 1, NULL, NULL, 1, 1, '3.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', NULL, 0, 0, NULL, NULL, '03565614b204ff0e9ceb5e645535708aae3e6d55911e3ab8a3bafade20b79408'),
(4, '2020-06-21 08:48:57', '2023', 1, 'General Customer', 2, 'Adorable Anakut', 1, 'nullPay US&equals;18&comma; Pay riels&equals;', '', '18.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '18.0000', 'completed', 'paid', 0, NULL, 1, NULL, NULL, 5, 1, '18.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', NULL, 0, 0, NULL, NULL, '91a3fe491beba42ac5de4736301c644c6f1837e10cefae5fb82e0b47fb79a698'),
(5, '2020-06-21 08:51:07', 'Adorable/2024', 1, 'General Customer', 2, 'Adorable Anakut', 1, 'nullPay US&equals;5&comma; Pay riels&equals;', '', '5.0000', '0.0000', NULL, '0.0000', '0.0000', '0.0000', 1, '0.0000', '0.0000', '0.0000', '5.0000', 'completed', 'paid', 0, NULL, 1, NULL, NULL, 1, 1, '5.0000', NULL, '0.0000', NULL, NULL, NULL, '0.0000', '0.0000', NULL, 0, 0, NULL, NULL, '8a40718dd8d05894464bde3eda9c8330769bc8de3b5c5264fb8a07555711dd11');

-- --------------------------------------------------------

--
-- Table structure for table `sma_saleunitprice`
--

DROP TABLE IF EXISTS `sma_saleunitprice`;
CREATE TABLE IF NOT EXISTS `sma_saleunitprice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `sale_unitname` varchar(54) DEFAULT NULL,
  `sale_unitprice` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_saleunitprice`
--

INSERT INTO `sma_saleunitprice` (`id`, `product_id`, `sale_unitname`, `sale_unitprice`) VALUES
(11, 177, 'យូ6', '10.0000'),
(14, 25, 'ដុំ(ខោរអាវ)', '10.0000'),
(104, 1, 'ដុំ(ខោរអាវ)', '14.0000'),
(103, 1, 'ដុំ(ខោរអាវ)', '14.0000'),
(19, 26, 'លក់ដុំX4', '12.0000'),
(20, 28, 'រ៉ូបX4', '12.0000'),
(21, 27, 'រ៉ូបX4', '20.0000'),
(22, 29, 'លក់ដុំX4', '12.0000'),
(23, 44, 'លក់ដុំX10គូ', '0.0000'),
(24, 109, 'លក់x5', '0.0000'),
(25, 147, 'លក់ដុំX3', '0.0000'),
(26, 147, 'លក់ដុំX4', '0.0000'),
(27, 147, 'លក់ដុំX5', '0.0000'),
(32, 145, 'លក់ដុំX4', '0.0000'),
(34, 158, 'លក់x5', '0.0000'),
(35, 217, 'លក់ដុំX3', '0.0000'),
(36, 217, 'លក់ដុំX4', '0.0000'),
(37, 217, 'លក់ដុំX5', '0.0000'),
(38, 218, 'លក់ដុំX4', '0.0000'),
(50, 220, 'លក់ដុំX5', '0.0000'),
(49, 220, 'លក់ដុំX4', '0.0000'),
(48, 220, 'លក់ដុំX3', '0.0000'),
(51, 221, 'លក់ដុំX3', '0.0000'),
(52, 221, 'លក់ដុំX4', '0.0000'),
(53, 221, 'លក់ដុំX5', '0.0000'),
(54, 222, 'លក់ដុំX3', '0.0000'),
(55, 222, 'លក់ដុំX4', '0.0000'),
(56, 222, 'លក់ដុំX5', '0.0000'),
(57, 223, 'លក់x5', '0.0000'),
(58, 224, 'លក់ដុំX3', '0.0000'),
(59, 224, 'លក់ដុំX4', '0.0000'),
(60, 224, 'លក់ដុំX5', '0.0000'),
(61, 225, 'លក់ដុំX10គូ', '0.0000'),
(62, 225, 'លក់ដុំX3', '0.0000'),
(63, 225, 'លក់ដុំX4', '0.0000'),
(64, 225, 'លក់ដុំX5', '0.0000'),
(65, 226, 'លក់ដុំX3', '0.0000'),
(66, 226, 'លក់ដុំX4', '0.0000'),
(67, 226, 'លក់ដុំX5', '0.0000'),
(68, 228, 'លក់ដុំX10គូ', '0.0000'),
(69, 235, 'លក់ដុំX10គូ', '0.0000'),
(70, 236, 'រ៉ូបX4', '0.0000'),
(71, 238, 'លក់ដុំX3', '0.0000'),
(72, 238, 'លក់ដុំX4', '0.0000'),
(73, 238, 'លក់ដុំX5', '0.0000'),
(79, 239, 'លក់ដុំX5', '0.0000'),
(78, 239, 'លក់ដុំX4', '0.0000'),
(77, 239, 'លក់ដុំX3', '0.0000'),
(85, 240, 'លក់ដុំX5', '0.0000'),
(84, 240, 'លក់ដុំX4', '0.0000'),
(83, 240, 'លក់ដុំX3', '0.0000'),
(86, 241, 'លក់x5', '0.0000'),
(87, 242, 'លក់ដុំX3', '0.0000'),
(88, 242, 'លក់ដុំX4', '0.0000'),
(89, 242, 'លក់ដុំX5', '0.0000'),
(90, 247, 'លក់ដុំX10គូ', '0.0000'),
(91, 247, 'លក់ដុំX3', '0.0000'),
(92, 247, 'លក់ដុំX4', '0.0000'),
(93, 247, 'លក់ដុំX5', '0.0000'),
(94, 249, 'លក់ដុំX10គូ', '0.0000'),
(95, 250, 'លក់ដុំX10គូ', '0.0000'),
(96, 251, 'លក់ដុំX3', '0.0000'),
(97, 251, 'លក់ដុំX4', '0.0000'),
(98, 251, 'លក់ដុំX5', '0.0000'),
(99, 252, 'លក់ដុំX3', '0.0000'),
(100, 252, 'លក់ដុំX4', '0.0000'),
(101, 252, 'លក់ដុំX5', '0.0000'),
(102, 253, 'លក់ដុំX10គូ', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_sale_items`
--

DROP TABLE IF EXISTS `sma_sale_items`;
CREATE TABLE IF NOT EXISTS `sma_sale_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `sale_item_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `sdate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `invoice_dis` varchar(55) DEFAULT '0',
  `item_invoice_dis` decimal(55,0) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `sale_id` (`sale_id`),
  KEY `product_id` (`product_id`),
  KEY `product_id_2` (`product_id`,`sale_id`),
  KEY `sale_id_2` (`sale_id`,`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sale_items`
--

INSERT INTO `sma_sale_items` (`id`, `sale_id`, `product_id`, `product_code`, `product_name`, `product_type`, `option_id`, `net_unit_price`, `unit_price`, `quantity`, `warehouse_id`, `item_tax`, `tax_rate_id`, `tax`, `discount`, `item_discount`, `subtotal`, `serial_no`, `real_unit_price`, `sale_item_id`, `product_unit_id`, `product_unit_code`, `unit_quantity`, `comment`, `sdate`, `invoice_dis`, `item_invoice_dis`) VALUES
(1, 1, 2, '42528321', 'Adidas EX', 'standard', NULL, '3.0000', '3.0000', '1.0000', 1, '0.0000', NULL, '', '0', '0.0000', '3.0000', '', '3.0000', NULL, 18, 'unit', '1.0000', '', NULL, '0', '0'),
(2, 1, 1, '70544162', 'admin', 'standard', NULL, '0.0000', '0.0000', '1.0000', 1, '0.0000', NULL, '', '0', '0.0000', '0.0000', '', '0.0000', NULL, 5, 'គូរ', '1.0000', '', NULL, '0', '0'),
(3, 2, 5, '15909299', 'testing', 'standard', NULL, '5.0000', '5.0000', '1.0000', 1, '0.0000', NULL, '', '0', '0.0000', '5.0000', '', '5.0000', NULL, 5, 'គូរ', '1.0000', '', NULL, '0', '0'),
(4, 2, 4, '21089365', 'tests', 'standard', NULL, '5.0000', '5.0000', '1.0000', 1, '0.0000', NULL, '', '0', '0.0000', '5.0000', '', '5.0000', NULL, 5, 'គូរ', '1.0000', '', NULL, '0', '0'),
(5, 2, 3, '61296271', 'test', 'standard', NULL, '5.0000', '5.0000', '1.0000', 1, '0.0000', NULL, '', '0', '0.0000', '5.0000', '', '5.0000', NULL, 5, 'គូរ', '1.0000', '', NULL, '0', '0'),
(6, 2, 2, '42528321', 'Adidas EX', 'standard', NULL, '3.0000', '3.0000', '1.0000', 1, '0.0000', NULL, '', '0', '0.0000', '3.0000', '', '3.0000', NULL, 18, 'unit', '1.0000', '', NULL, '0', '0'),
(7, 3, 2, '42528321', 'Adidas EX', 'standard', NULL, '3.0000', '3.0000', '1.0000', 1, '0.0000', NULL, '', '0', '0.0000', '3.0000', '', '3.0000', NULL, 18, 'unit', '1.0000', '', NULL, '0', '0'),
(8, 4, 5, '15909299', 'testing', 'standard', NULL, '5.0000', '5.0000', '1.0000', 1, '0.0000', NULL, '', '0', '0.0000', '5.0000', '', '5.0000', NULL, 5, 'គូរ', '1.0000', '', NULL, '0', '0'),
(9, 4, 4, '21089365', 'tests', 'standard', NULL, '5.0000', '5.0000', '1.0000', 1, '0.0000', NULL, '', '0', '0.0000', '5.0000', '', '5.0000', NULL, 5, 'គូរ', '1.0000', '', NULL, '0', '0'),
(10, 4, 3, '61296271', 'test', 'standard', NULL, '5.0000', '5.0000', '1.0000', 1, '0.0000', NULL, '', '0', '0.0000', '5.0000', '', '5.0000', NULL, 5, 'គូរ', '1.0000', '', NULL, '0', '0'),
(11, 4, 2, '42528321', 'Adidas EX', 'standard', NULL, '3.0000', '3.0000', '1.0000', 1, '0.0000', NULL, '', '0', '0.0000', '3.0000', '', '3.0000', NULL, 18, 'unit', '1.0000', '', NULL, '0', '0'),
(12, 4, 1, '70544162', 'admin', 'standard', NULL, '0.0000', '0.0000', '1.0000', 1, '0.0000', NULL, '', '0', '0.0000', '0.0000', '', '0.0000', NULL, 5, 'គូរ', '1.0000', '', NULL, '0', '0'),
(13, 5, 5, '15909299', 'testing', 'standard', NULL, '5.0000', '5.0000', '1.0000', 1, '0.0000', NULL, '', '0', '0.0000', '5.0000', '', '5.0000', NULL, 5, 'គូរ', '1.0000', '', NULL, '0', '0');

-- --------------------------------------------------------

--
-- Table structure for table `sma_sessions`
--

DROP TABLE IF EXISTS `sma_sessions`;
CREATE TABLE IF NOT EXISTS `sma_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_sessions`
--

INSERT INTO `sma_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('11k36rsret91e1u2rn3aet6r3fou29nk', '::1', 1592798750, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539323739383732343b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353932373234363132223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('1adjucb8goo4i4bll9p7ps2i8ehk1hoh', '::1', 1592801751, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539323830313530353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353932373234363132223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('1rbnv3kqjp8a3bthvbkp0vk1ntvg8om5', '::1', 1592806816, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539323830363537383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353932373234363132223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('1u2scs06o70d04mt1mkb29404flhvtci', '::1', 1592804026, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539323830333734333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353932373234363132223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('2cg7nu8def7grrqfjqmmr927sobast30', '::1', 1592806546, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539323830363237323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353932373234363132223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('2onqesobatrom96jgunh6im79eoibea9', '::1', 1592802312, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539323830323331323b),
('3prp616u125mair4j2m7ctn888glttmc', '::1', 1592799734, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539323739393434333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353932373234363132223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('420gtecquph9pqlk1msr2kkgt3aqrgop', '::1', 1592801845, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539323830313834353b),
('5uectg09ba1uiukdfi7sgdvrfo19mf5s', '::1', 1592806965, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539323830363932303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353932373234363132223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6572726f727c733a37303a22506c6561736520636865636b2063617465676f727920636f64652028292e2043617465676f727920436f646520646f6573206e6f742065786973742e204c696e65204e6f2032223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('69macm6nv2i177bbhikdtoecm2ptvbhb', '::1', 1592804183, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539323830343036353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353932373234363132223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b6572726f727c733a37343a22506c6561736520636865636b2063617465676f727920636f64652028756e6974292e2043617465676f727920436f646520646f6573206e6f742065786973742e204c696e65204e6f2032223b5f5f63695f766172737c613a313a7b733a353a226572726f72223b733a333a226f6c64223b7d),
('72aui1e2ueuc6orhsonk9vou7rdcjp88', '::1', 1592802466, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539323830323138383b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353932373234363132223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('7tbh0ssl9kgr67qk85777hml7ia6m6t7', '::1', 1592797420, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539323739373239333b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353932373234363132223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('92khji88ai0e3r4b7os135q23gjr83di', '::1', 1592802620, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539323830323631393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353932373234363132223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('cr0kvfpkel2nefqf4j7di2mush7711cb', '::1', 1592802052, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539323830313834353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353932373234363132223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('d4c92pm29ssdrg795plrp9t8a3r9ih43', '::1', 1592805929, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539323830353837393b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353932373234363132223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('dvfrvjgobb791220340q248negbuvric', '::1', 1592798460, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539323739383232323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353932373234363132223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('eo2mp2nkrgd76gi46l82ccoekjleijur', '::1', 1592802461, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539323830323436313b),
('hklr63jipreue1dhtnpuud0f86ld12ug', '::1', 1592805755, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539323830353530353b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353932373234363132223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('jgio8e799h6n44724gcprdv3uf2nm4vl', '::1', 1592800110, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539323739393831303b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353932373234363132223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('jmh2lfq4u1v3ng69vv8shfr56a68b3lf', '::1', 1592805003, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539323830343830363b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353932373234363132223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('r58d289iubbcenv2h2jnl1h7f5qqalhm', '::1', 1592800253, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539323830303133313b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353932373234363132223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b),
('tkahq9htdfpfeq7jl0lb7o82i0cacu33', '::1', 1592802324, 0x5f5f63695f6c6173745f726567656e65726174657c693a313539323830323331323b7265717565737465645f706167657c733a353a2261646d696e223b6964656e746974797c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365726e616d657c733a353a226f776e6572223b656d61696c7c733a32313a2261646d696e40383535736f6c7574696f6e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353932373839323934223b6c6173745f69707c733a333a223a3a31223b6176617461727c4e3b67656e6465727c733a343a226d616c65223b67726f75705f69647c733a313a2231223b77617265686f7573655f69647c4e3b766965775f72696768747c733a313a2230223b656469745f72696768747c733a313a2230223b616c6c6f775f646973636f756e747c733a313a2230223b62696c6c65725f69647c4e3b636f6d70616e795f69647c4e3b73686f775f636f73747c733a313a2230223b73686f775f70726963657c733a313a2230223b);

-- --------------------------------------------------------

--
-- Table structure for table `sma_settings`
--

DROP TABLE IF EXISTS `sma_settings`;
CREATE TABLE IF NOT EXISTS `sma_settings` (
  `setting_id` int(1) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `logo2` varchar(255) NOT NULL,
  `site_name` varchar(55) NOT NULL,
  `language` varchar(20) NOT NULL,
  `default_warehouse` int(2) NOT NULL,
  `accounting_method` tinyint(4) NOT NULL DEFAULT '0',
  `default_currency` varchar(3) NOT NULL,
  `default_tax_rate` int(2) NOT NULL,
  `rows_per_page` int(2) NOT NULL,
  `version` varchar(10) NOT NULL DEFAULT '1.0',
  `default_tax_rate2` int(11) NOT NULL DEFAULT '0',
  `dateformat` int(11) NOT NULL,
  `sales_prefix` varchar(20) DEFAULT NULL,
  `quote_prefix` varchar(20) DEFAULT NULL,
  `purchase_prefix` varchar(20) DEFAULT NULL,
  `transfer_prefix` varchar(20) DEFAULT NULL,
  `delivery_prefix` varchar(20) DEFAULT NULL,
  `payment_prefix` varchar(20) DEFAULT NULL,
  `return_prefix` varchar(20) DEFAULT NULL,
  `returnp_prefix` varchar(20) DEFAULT NULL,
  `expense_prefix` varchar(20) DEFAULT NULL,
  `item_addition` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(20) NOT NULL,
  `product_serial` tinyint(4) NOT NULL,
  `default_discount` int(11) NOT NULL,
  `product_discount` tinyint(1) NOT NULL DEFAULT '0',
  `discount_method` tinyint(4) NOT NULL,
  `tax1` tinyint(4) NOT NULL,
  `tax2` tinyint(4) NOT NULL,
  `overselling` tinyint(1) NOT NULL DEFAULT '0',
  `restrict_user` tinyint(4) NOT NULL DEFAULT '0',
  `restrict_calendar` tinyint(4) NOT NULL DEFAULT '0',
  `timezone` varchar(100) DEFAULT NULL,
  `iwidth` int(11) NOT NULL DEFAULT '0',
  `iheight` int(11) NOT NULL,
  `twidth` int(11) NOT NULL,
  `theight` int(11) NOT NULL,
  `watermark` tinyint(1) DEFAULT NULL,
  `reg_ver` tinyint(1) DEFAULT NULL,
  `allow_reg` tinyint(1) DEFAULT NULL,
  `reg_notification` tinyint(1) DEFAULT NULL,
  `auto_reg` tinyint(1) DEFAULT NULL,
  `protocol` varchar(20) NOT NULL DEFAULT 'mail',
  `mailpath` varchar(55) DEFAULT '/usr/sbin/sendmail',
  `smtp_host` varchar(100) DEFAULT NULL,
  `smtp_user` varchar(100) DEFAULT NULL,
  `smtp_pass` varchar(255) DEFAULT NULL,
  `smtp_port` varchar(10) DEFAULT '25',
  `smtp_crypto` varchar(10) DEFAULT NULL,
  `corn` datetime DEFAULT NULL,
  `customer_group` int(11) NOT NULL,
  `default_email` varchar(100) NOT NULL,
  `mmode` tinyint(1) NOT NULL,
  `bc_fix` tinyint(4) NOT NULL DEFAULT '0',
  `auto_detect_barcode` tinyint(1) NOT NULL DEFAULT '0',
  `captcha` tinyint(1) NOT NULL DEFAULT '1',
  `reference_format` tinyint(1) NOT NULL DEFAULT '1',
  `racks` tinyint(1) DEFAULT '0',
  `attributes` tinyint(1) NOT NULL DEFAULT '0',
  `product_expiry` tinyint(1) NOT NULL DEFAULT '0',
  `decimals` tinyint(2) NOT NULL DEFAULT '2',
  `qty_decimals` tinyint(2) NOT NULL DEFAULT '2',
  `decimals_sep` varchar(2) NOT NULL DEFAULT '.',
  `thousands_sep` varchar(2) NOT NULL DEFAULT ',',
  `invoice_view` tinyint(1) DEFAULT '0',
  `default_biller` int(11) DEFAULT NULL,
  `envato_username` varchar(50) DEFAULT NULL,
  `purchase_code` varchar(100) DEFAULT NULL,
  `rtl` tinyint(1) DEFAULT '0',
  `each_spent` decimal(15,4) DEFAULT NULL,
  `ca_point` tinyint(4) DEFAULT NULL,
  `each_sale` decimal(15,4) DEFAULT NULL,
  `sa_point` tinyint(4) DEFAULT NULL,
  `update` tinyint(1) DEFAULT '0',
  `sac` tinyint(1) DEFAULT '0',
  `display_all_products` tinyint(1) DEFAULT '0',
  `display_symbol` tinyint(1) DEFAULT NULL,
  `symbol` varchar(50) DEFAULT NULL,
  `remove_expired` tinyint(1) DEFAULT '0',
  `barcode_separator` varchar(2) NOT NULL DEFAULT '_',
  `set_focus` tinyint(1) NOT NULL DEFAULT '0',
  `price_group` int(11) DEFAULT NULL,
  `barcode_img` tinyint(1) NOT NULL DEFAULT '1',
  `ppayment_prefix` varchar(20) DEFAULT 'POP',
  `disable_editing` smallint(6) DEFAULT '90',
  `qa_prefix` varchar(55) DEFAULT NULL,
  `update_cost` tinyint(1) DEFAULT NULL,
  `apis` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_settings`
--

INSERT INTO `sma_settings` (`setting_id`, `logo`, `logo2`, `site_name`, `language`, `default_warehouse`, `accounting_method`, `default_currency`, `default_tax_rate`, `rows_per_page`, `version`, `default_tax_rate2`, `dateformat`, `sales_prefix`, `quote_prefix`, `purchase_prefix`, `transfer_prefix`, `delivery_prefix`, `payment_prefix`, `return_prefix`, `returnp_prefix`, `expense_prefix`, `item_addition`, `theme`, `product_serial`, `default_discount`, `product_discount`, `discount_method`, `tax1`, `tax2`, `overselling`, `restrict_user`, `restrict_calendar`, `timezone`, `iwidth`, `iheight`, `twidth`, `theight`, `watermark`, `reg_ver`, `allow_reg`, `reg_notification`, `auto_reg`, `protocol`, `mailpath`, `smtp_host`, `smtp_user`, `smtp_pass`, `smtp_port`, `smtp_crypto`, `corn`, `customer_group`, `default_email`, `mmode`, `bc_fix`, `auto_detect_barcode`, `captcha`, `reference_format`, `racks`, `attributes`, `product_expiry`, `decimals`, `qty_decimals`, `decimals_sep`, `thousands_sep`, `invoice_view`, `default_biller`, `envato_username`, `purchase_code`, `rtl`, `each_spent`, `ca_point`, `each_sale`, `sa_point`, `update`, `sac`, `display_all_products`, `display_symbol`, `symbol`, `remove_expired`, `barcode_separator`, `set_focus`, `price_group`, `barcode_img`, `ppayment_prefix`, `disable_editing`, `qa_prefix`, `update_cost`, `apis`) VALUES
(1, 'logo2.jpg', 'logo12.png', 'Adorable Anakut', 'english', 1, 2, 'USD', 0, 100, '3.2.3', 1, 5, 'Adorable', 'QUOTE', 'PO', 'TR', 'DO', 'IPAY', 'SR', 'PR', '', 1, 'default', 0, 1, 1, 1, 0, 1, 1, 1, 0, 'Asia/Phnom_Penh', 800, 800, 150, 150, 0, NULL, NULL, NULL, NULL, 'mail', '/usr/sbin/sendmail', 'pop.gmail.com', 'contact@sma.tecdiary.org', 'T3KCnp8DkuxG7QnbdpxI++GBV3wT2L7+n9VXTM8I0J4HRigzcQQpraPxE8EsEdGSxCQb+To6euZgK7bsf0lM8w==', '25', NULL, NULL, 1, 'contact@tecdiary.com', 0, 4, 0, 0, 2, 0, 0, 0, 2, 2, '.', ',', 0, 2, 'ryrun168', 'aec99605-5703-48fb-a0cc-8a55aded76f2', 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '', 0, '_', 0, 1, 1, 'POP', 90, '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_skrill`
--

DROP TABLE IF EXISTS `sma_skrill`;
CREATE TABLE IF NOT EXISTS `sma_skrill` (
  `id` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `account_email` varchar(255) NOT NULL DEFAULT 'testaccount2@moneybookers.com',
  `secret_word` varchar(20) NOT NULL DEFAULT 'mbtest',
  `skrill_currency` varchar(3) NOT NULL DEFAULT 'USD',
  `fixed_charges` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_my` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `extra_charges_other` decimal(25,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_skrill`
--

INSERT INTO `sma_skrill` (`id`, `active`, `account_email`, `secret_word`, `skrill_currency`, `fixed_charges`, `extra_charges_my`, `extra_charges_other`) VALUES
(1, 1, 'testaccount2@moneybookers.com', 'mbtest', 'USD', '0.0000', '0.0000', '0.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_stock_counts`
--

DROP TABLE IF EXISTS `sma_stock_counts`;
CREATE TABLE IF NOT EXISTS `sma_stock_counts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `reference_no` varchar(55) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `initial_file` varchar(50) NOT NULL,
  `final_file` varchar(50) DEFAULT NULL,
  `brands` varchar(50) DEFAULT NULL,
  `brand_names` varchar(100) DEFAULT NULL,
  `categories` varchar(50) DEFAULT NULL,
  `category_names` varchar(100) DEFAULT NULL,
  `note` text,
  `products` int(11) DEFAULT NULL,
  `rows` int(11) DEFAULT NULL,
  `differences` int(11) DEFAULT NULL,
  `matches` int(11) DEFAULT NULL,
  `missing` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `finalized` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_stock_count_items`
--

DROP TABLE IF EXISTS `sma_stock_count_items`;
CREATE TABLE IF NOT EXISTS `sma_stock_count_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_count_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_variant` varchar(55) DEFAULT NULL,
  `product_variant_id` int(11) DEFAULT NULL,
  `expected` decimal(15,4) NOT NULL,
  `counted` decimal(15,4) NOT NULL,
  `cost` decimal(25,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stock_count_id` (`stock_count_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_subcategories`
--

DROP TABLE IF EXISTS `sma_subcategories`;
CREATE TABLE IF NOT EXISTS `sma_subcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `code` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `image` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_bills`
--

DROP TABLE IF EXISTS `sma_suspended_bills`;
CREATE TABLE IF NOT EXISTS `sma_suspended_bills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(11) NOT NULL,
  `customer` varchar(55) DEFAULT NULL,
  `count` int(11) NOT NULL,
  `order_discount_id` varchar(20) DEFAULT NULL,
  `order_tax_id` int(11) DEFAULT NULL,
  `total` decimal(25,4) NOT NULL,
  `biller_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `suspend_note` varchar(255) DEFAULT NULL,
  `shipping` decimal(15,4) DEFAULT '0.0000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_suspended_items`
--

DROP TABLE IF EXISTS `sma_suspended_items`;
CREATE TABLE IF NOT EXISTS `sma_suspended_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `suspend_id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `net_unit_price` decimal(25,4) NOT NULL,
  `unit_price` decimal(25,4) NOT NULL,
  `quantity` decimal(15,4) DEFAULT '0.0000',
  `warehouse_id` int(11) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `discount` varchar(55) DEFAULT NULL,
  `item_discount` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) NOT NULL,
  `serial_no` varchar(255) DEFAULT NULL,
  `option_id` int(11) DEFAULT NULL,
  `product_type` varchar(20) DEFAULT NULL,
  `real_unit_price` decimal(25,4) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_table`
--

DROP TABLE IF EXISTS `sma_table`;
CREATE TABLE IF NOT EXISTS `sma_table` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_tax_rates`
--

DROP TABLE IF EXISTS `sma_tax_rates`;
CREATE TABLE IF NOT EXISTS `sma_tax_rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `rate` decimal(12,4) NOT NULL,
  `type` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_tax_rates`
--

INSERT INTO `sma_tax_rates` (`id`, `name`, `code`, `rate`, `type`) VALUES
(1, 'No Tax', 'NT', '0.0000', '2'),
(2, 'VAT @10%', 'VAT10', '10.0000', '1'),
(3, 'GST @6%', 'GST', '6.0000', '1'),
(4, 'VAT @20%', 'VT20', '20.0000', '1');

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfers`
--

DROP TABLE IF EXISTS `sma_transfers`;
CREATE TABLE IF NOT EXISTS `sma_transfers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transfer_no` varchar(55) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_warehouse_id` int(11) NOT NULL,
  `from_warehouse_code` varchar(55) NOT NULL,
  `from_warehouse_name` varchar(55) NOT NULL,
  `to_warehouse_id` int(11) NOT NULL,
  `to_warehouse_code` varchar(55) NOT NULL,
  `to_warehouse_name` varchar(55) NOT NULL,
  `note` varchar(1000) DEFAULT NULL,
  `total` decimal(25,4) DEFAULT NULL,
  `total_tax` decimal(25,4) DEFAULT NULL,
  `grand_total` decimal(25,4) DEFAULT NULL,
  `created_by` varchar(255) DEFAULT NULL,
  `status` varchar(55) NOT NULL DEFAULT 'pending',
  `shipping` decimal(25,4) NOT NULL DEFAULT '0.0000',
  `attachment` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_transfer_items`
--

DROP TABLE IF EXISTS `sma_transfer_items`;
CREATE TABLE IF NOT EXISTS `sma_transfer_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transfer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(55) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `option_id` int(11) DEFAULT NULL,
  `expiry` date DEFAULT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `tax_rate_id` int(11) DEFAULT NULL,
  `tax` varchar(55) DEFAULT NULL,
  `item_tax` decimal(25,4) DEFAULT NULL,
  `net_unit_cost` decimal(25,4) DEFAULT NULL,
  `subtotal` decimal(25,4) DEFAULT NULL,
  `quantity_balance` decimal(15,4) NOT NULL,
  `unit_cost` decimal(25,4) DEFAULT NULL,
  `real_unit_cost` decimal(25,4) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `product_unit_id` int(11) DEFAULT NULL,
  `product_unit_code` varchar(10) DEFAULT NULL,
  `unit_quantity` decimal(15,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `transfer_id` (`transfer_id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sma_units`
--

DROP TABLE IF EXISTS `sma_units`;
CREATE TABLE IF NOT EXISTS `sma_units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(55) NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` varchar(1) DEFAULT NULL,
  `unit_value` varchar(55) DEFAULT NULL,
  `operation_value` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `base_unit` (`base_unit`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_units`
--

INSERT INTO `sma_units` (`id`, `code`, `name`, `base_unit`, `operator`, `unit_value`, `operation_value`) VALUES
(5, 'គូរ', 'គូរ', NULL, NULL, NULL, NULL),
(6, 'ឈុត', 'ឈុត', NULL, NULL, NULL, NULL),
(8, 'រ៉ូប', 'រ៉ូប', NULL, NULL, NULL, NULL),
(9, 'លក់ដុំ', 'លក់ដុំX3', 6, '*', NULL, '3'),
(10, 'លក់​ដុំ', 'លក់ដុំX4', 6, '*', NULL, '4'),
(11, 'លក់ដុំ​​', 'លក់ដុំX5', 6, '*', NULL, '5'),
(12, 'លក់ដុំ​​​​', 'លក់ដុំX10គូ', 5, '*', NULL, '10'),
(13, 'លក់ដុំ​​​​', 'រ៉ូបX4', 8, '*', NULL, '4'),
(14, 'អាវ', 'អាវ', NULL, NULL, NULL, NULL),
(15, 'អាវលក់ដុំ', 'លក់ដុំX4', 14, '*', NULL, '4'),
(16, 'ខោរ', 'ខោរ', NULL, NULL, NULL, NULL),
(17, 'ខោរលក់ដុំ', 'លក់x5', 16, '*', NULL, '5'),
(18, 'unit', 'unit', NULL, NULL, NULL, NULL),
(19, '9900', 'ABC', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sma_users`
--

DROP TABLE IF EXISTS `sma_users`;
CREATE TABLE IF NOT EXISTS `sma_users` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `last_ip_address` varbinary(45) DEFAULT NULL,
  `ip_address` varbinary(45) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `avatar` varchar(55) DEFAULT NULL,
  `gender` varchar(20) DEFAULT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `warehouse_id` int(10) UNSIGNED DEFAULT NULL,
  `biller_id` int(10) UNSIGNED DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `show_cost` tinyint(1) DEFAULT '0',
  `show_price` tinyint(1) DEFAULT '0',
  `award_points` int(11) DEFAULT '0',
  `view_right` tinyint(1) NOT NULL DEFAULT '0',
  `edit_right` tinyint(1) NOT NULL DEFAULT '0',
  `allow_discount` tinyint(1) DEFAULT '0',
  `print_invoice` tinyint(1) DEFAULT NULL,
  `print_receipt` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`,`warehouse_id`,`biller_id`),
  KEY `group_id_2` (`group_id`,`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_users`
--

INSERT INTO `sma_users` (`id`, `last_ip_address`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `avatar`, `gender`, `group_id`, `warehouse_id`, `biller_id`, `company_id`, `show_cost`, `show_price`, `award_points`, `view_right`, `edit_right`, `allow_discount`, `print_invoice`, `print_receipt`) VALUES
(1, 0x3a3a31, 0x0000, 'owner', '586a1fba89145e289a7b5a6c58c086ff2616b700', NULL, 'admin@855solution.com', NULL, NULL, NULL, 'e7fa1bce74f667d7c792ab92ec868bba6c3b69fb', 1351661704, 1592802315, 1, 'Owner', 'Owner', 'Stock Manager', '012345678', NULL, 'male', 1, NULL, NULL, NULL, 0, 0, 0, 0, 0, 0, NULL, 1),
(18, 0x3131372e3133362e382e3138, 0x3137352e3130302e35302e3230, 'hongdavy', '06d725dd1c0256f174c3b6826f87d4185bc5d2bf', NULL, 'davychinastore@gmail.com', NULL, NULL, NULL, 'aec957f53f95f4bbcb3348c867d88c2a209cebb3', 1563182621, 1591431624, 1, 'Hong', 'Davy', 'Davy China Store', '089 65 65 36 ', NULL, 'female', 1, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 1, 1),
(19, 0x3137352e3130302e35302e3237, 0x3137352e3130302e35302e3230, 'himsavin', '8a19a2f1a32cf146910aa9d75fa5fcdfdcf50897', NULL, 'himsavin@gmail.com', NULL, NULL, NULL, '5f0f5bf99687063689c0629d42e8e49beed6deb6', 1563182953, 1576418022, 0, 'Him', 'Savin', 'Davy China Store', '088 433 43 40', NULL, 'female', 1, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 1, 1),
(20, 0x3137352e3130302e35302e3233, 0x3137352e3130302e35302e3230, 'chanthy', 'aa80d256c03a3a1fa9dc98f967233b2e04bcde23', NULL, 'chanthy@gmail.com', NULL, NULL, NULL, '821cac6156d2613c2aa7242b2aa243ecad5e4111', 1563183047, 1578313800, 1, 'Norn', 'Chanthy', 'Davy China Store', '0963213926', NULL, 'female', 1, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 1, 1),
(21, 0x3137352e3130302e35302e3238, 0x3137352e3130302e35302e3230, 'sreypy', '2139eaf9950bd9f7b342bdabb8bdfa200cf86c5f', NULL, 'sreypy@gmail.com', NULL, NULL, NULL, NULL, 1563183156, 1563944174, 1, 'Rin', 'SreyPy', 'Davy China Store', '098 22 81 54', NULL, 'female', 1, NULL, NULL, NULL, 0, 0, 0, 1, 0, 0, 1, 1),
(22, 0x3137352e3130302e35302e3139, 0x3137352e3130302e35302e3139, 'tabluch', '22f45814d2d3a01b2283791e0ee8b7362196c714', NULL, 'luch@gmail.com', '6f545d70eae1af6a09acf01775c76a232a8d8426', NULL, NULL, NULL, 1575364201, 1575364225, 0, 'luch', 'tab', 'tabluch', '010749219', NULL, 'male', 6, 1, 192, NULL, NULL, 1, 0, 1, 0, 0, 1, 1),
(23, 0x3137352e3130302e35302e3236, 0x3137352e3130302e35302e3139, 'chinsomphors', 'f12fa80585fca17d9d041c79f2bddb68958ef55e', NULL, 'chinsomphors@gmail.com', NULL, NULL, NULL, NULL, 1575367368, 1592464396, 1, 'chin ', 'somphors', 'chin', '123', NULL, 'female', 1, 0, 0, NULL, 0, 0, 0, 1, 0, 0, 1, 1),
(24, 0x3137352e3130302e35302e3137, 0x3137352e3130302e35302e3139, 'lin keavuth', '20277d4785de16ac9e2676c06c6ea56b011d0cf5', NULL, 'keavuth@gmail.com', NULL, NULL, NULL, NULL, 1575619693, 1584446614, 1, 'lin', 'keavuth', 'davy', '0962723777', NULL, 'male', 1, 0, 0, NULL, 0, 0, 0, 1, 0, 0, 1, 1),
(25, 0x3137352e3130302e35302e3137, 0x3137352e3130302e35302e3239, 'norn chantha', 'dc0ca15f04d5d992e15d34f565fecee92883e949', NULL, 'chantha@mail.com', NULL, NULL, NULL, NULL, 1584277796, 1584447222, 1, 'Norn', 'chantha', 'davy', '078915844', NULL, 'male', 1, 0, 0, NULL, 0, 0, 0, 1, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sma_user_logins`
--

DROP TABLE IF EXISTS `sma_user_logins`;
CREATE TABLE IF NOT EXISTS `sma_user_logins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1704 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_user_logins`
--

INSERT INTO `sma_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(0, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-07-19 09:31:30'),
(1, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-07-03 04:13:04'),
(2, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-07-24 04:22:35'),
(3, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-07-24 15:34:44'),
(4, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-07-25 01:29:15'),
(5, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-07-25 15:54:07'),
(6, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-07-26 01:23:04'),
(7, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-07-26 07:17:28'),
(8, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-07-26 14:56:05'),
(9, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-07-27 01:27:30'),
(10, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-07-27 04:45:41'),
(11, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-07-28 04:31:04'),
(12, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-07-30 10:24:15'),
(13, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-07-30 13:48:39'),
(14, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-07-31 01:31:55'),
(15, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-07-31 08:15:03'),
(16, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-08-01 01:07:23'),
(17, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-08-01 15:50:38'),
(18, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-08-02 02:08:09'),
(19, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-08-02 03:11:15'),
(20, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-08-02 03:49:31'),
(21, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-08-02 03:54:37'),
(22, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-08-02 09:03:08'),
(23, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-08-02 13:02:46'),
(24, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-08-02 13:30:56'),
(25, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-08-03 01:17:04'),
(26, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-08-03 01:28:09'),
(27, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-08-04 02:47:14'),
(28, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-08-04 07:21:00'),
(29, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-08-04 07:21:37'),
(30, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-08-04 07:22:44'),
(31, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-08-04 07:34:53'),
(32, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-08-07 00:58:17'),
(33, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-08-08 02:02:24'),
(34, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-08-08 08:43:56'),
(35, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-08-09 00:34:33'),
(36, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-08-10 00:49:36'),
(37, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-08-10 06:08:07'),
(38, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-08-22 02:37:15'),
(39, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-08-22 05:09:22'),
(40, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-08-28 05:20:35'),
(41, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-10-12 08:57:07'),
(42, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-10-13 02:06:07'),
(43, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-10-16 01:09:28'),
(44, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-10-16 20:34:21'),
(45, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-10-17 04:58:04'),
(46, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-10-17 15:45:48'),
(47, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-10-17 05:39:46'),
(48, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-10-17 05:43:56'),
(49, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-10-17 05:47:14'),
(50, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-10-17 08:51:46'),
(51, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-10-17 08:53:48'),
(52, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-10-20 01:13:36'),
(53, 3, NULL, 0x3a3a31, 'cashier@gmail.com', '2017-10-20 04:46:09'),
(54, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-10-20 04:47:18'),
(55, 1, NULL, 0x3139322e3136382e312e313033, 'owner@tecdiary.com', '2017-10-20 08:53:36'),
(56, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-10-20 15:33:00'),
(57, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-10-21 01:16:47'),
(58, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-10-21 05:52:06'),
(59, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-11-06 04:35:50'),
(60, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-11-07 01:17:54'),
(61, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-11-07 01:51:04'),
(62, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-11-08 01:07:57'),
(63, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-11-08 01:43:20'),
(64, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-11-08 06:58:51'),
(65, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-11-08 07:08:44'),
(66, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-11-08 07:34:35'),
(67, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-11-08 07:49:49'),
(68, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-11-13 01:17:58'),
(69, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-11-14 03:18:55'),
(70, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-11-14 08:54:43'),
(71, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-11-16 02:23:30'),
(72, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-11-17 01:04:06'),
(73, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-12-01 01:57:26'),
(74, 4, NULL, 0x3a3a31, 'layveasnasna@gmail.com', '2017-12-01 02:00:56'),
(75, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-12-01 03:05:41'),
(76, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-12-03 01:15:18'),
(77, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-12-04 01:01:44'),
(78, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-12-08 08:27:16'),
(79, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-12-11 01:09:36'),
(80, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-12-12 01:09:33'),
(81, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-12-12 01:55:55'),
(82, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-12-12 06:54:23'),
(83, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-12-13 01:10:47'),
(84, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-12-13 03:12:51'),
(85, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-12-13 03:44:32'),
(86, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-12-13 04:58:14'),
(87, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-12-14 00:59:02'),
(88, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2017-12-14 04:48:18'),
(89, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-01-23 01:28:57'),
(90, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-01-24 03:44:34'),
(91, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-01-29 09:49:47'),
(92, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-01-30 01:39:13'),
(93, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-01-31 02:27:17'),
(94, 5, NULL, 0x3a3a31, 'sna@gmail.com', '2018-01-31 04:24:56'),
(95, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-01-31 04:25:55'),
(96, 5, NULL, 0x3a3a31, 'sna@gmail.com', '2018-01-31 04:27:05'),
(97, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-01-31 04:27:39'),
(98, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-01-31 04:46:16'),
(99, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-01-31 04:57:31'),
(100, 5, NULL, 0x3a3a31, 'sna@gmail.com', '2018-01-31 07:27:18'),
(101, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-01-31 07:28:19'),
(102, 5, NULL, 0x3a3a31, 'sna@gmail.com', '2018-01-31 07:31:12'),
(103, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-01-31 07:33:14'),
(104, 5, NULL, 0x3a3a31, 'sna@gmail.com', '2018-01-31 07:34:55'),
(105, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-01-31 07:41:23'),
(106, 5, NULL, 0x3a3a31, 'sna@gmail.com', '2018-01-31 08:05:34'),
(107, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-01-31 08:06:36'),
(108, 5, NULL, 0x3a3a31, 'sna@gmail.com', '2018-01-31 08:07:10'),
(109, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-01-31 08:29:46'),
(110, 5, NULL, 0x3a3a31, 'sna@gmail.com', '2018-01-31 08:30:53'),
(111, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-01-31 08:31:10'),
(112, 5, NULL, 0x3a3a31, 'sna@gmail.com', '2018-01-31 08:55:28'),
(113, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-01-31 09:14:56'),
(114, 5, NULL, 0x3a3a31, 'sna@gmail.com', '2018-01-31 09:30:47'),
(115, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-01-31 09:47:42'),
(116, 5, NULL, 0x3a3a31, 'sna@gmail.com', '2018-01-31 09:51:36'),
(117, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-01-31 10:06:04'),
(118, 5, NULL, 0x3a3a31, 'sna@gmail.com', '2018-01-31 10:06:59'),
(119, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-02-01 03:35:24'),
(120, 5, NULL, 0x3a3a31, 'sna@gmail.com', '2018-02-01 03:39:01'),
(121, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-02-01 03:50:21'),
(122, 5, NULL, 0x3a3a31, 'sna@gmail.com', '2018-02-01 03:55:12'),
(123, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-02-01 04:02:35'),
(124, 5, NULL, 0x3a3a31, 'sna@gmail.com', '2018-02-01 04:11:21'),
(125, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-02-01 04:19:41'),
(126, 5, NULL, 0x3a3a31, 'sna@gmail.com', '2018-02-01 04:20:33'),
(127, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-02-01 04:22:25'),
(128, 5, NULL, 0x3a3a31, 'sna@gmail.com', '2018-02-01 04:23:02'),
(129, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-02-01 04:23:52'),
(130, 5, NULL, 0x3a3a31, 'sna@gmail.com', '2018-02-01 04:25:32'),
(131, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-02-01 04:33:00'),
(132, 5, NULL, 0x3a3a31, 'sna@gmail.com', '2018-02-01 04:34:18'),
(133, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-02-01 04:38:58'),
(134, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-02-01 09:28:51'),
(135, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-02-02 01:29:16'),
(136, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-02-05 01:39:45'),
(137, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-02-06 01:58:23'),
(138, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-02-07 01:17:50'),
(139, 1, NULL, 0x3139322e3136382e312e313036, 'owner@tecdiary.com', '2018-02-07 01:54:46'),
(140, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-02-07 01:56:19'),
(141, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-02-08 01:09:43'),
(142, 1, NULL, 0x3139322e3136382e312e313036, 'owner@tecdiary.com', '2018-02-08 03:30:03'),
(143, 1, NULL, 0x3139322e3136382e312e313134, 'owner@tecdiary.com', '2018-02-08 05:46:01'),
(144, 1, NULL, 0x3139322e3136382e312e313134, 'owner@tecdiary.com', '2018-02-08 05:47:34'),
(145, 5, NULL, 0x3a3a31, 'sna@gmail.com', '2018-02-08 06:06:11'),
(146, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-02-08 06:11:25'),
(147, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-02-08 06:26:10'),
(148, 1, NULL, 0x3139322e3136382e312e313036, 'owner@tecdiary.com', '2018-02-08 10:19:41'),
(149, 1, NULL, 0x3139322e3136382e312e313137, 'owner@tecdiary.com', '2018-02-08 10:21:35'),
(150, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-02-09 01:11:31'),
(151, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-02-09 01:16:05'),
(152, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-02-09 05:44:51'),
(153, 1, NULL, 0x3139322e3136382e312e313036, 'owner@tecdiary.com', '2018-02-09 05:48:03'),
(154, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-02-09 07:27:02'),
(155, 1, NULL, 0x3a3a31, 'owner@tecdiary.com', '2018-02-09 09:00:45'),
(156, 1, NULL, 0x3139322e3136382e312e313036, 'owner@tecdiary.com', '2018-02-09 10:09:31'),
(157, 1, NULL, 0x3132372e302e302e31, 'owner@tecdiary.com', '2018-02-10 04:03:12'),
(158, 1, NULL, 0x3132372e302e302e31, 'owner@tecdiary.com', '2018-02-10 04:07:54'),
(159, 1, NULL, 0x3132372e302e302e31, 'owner@tecdiary.com', '2018-02-10 04:46:29'),
(160, 1, NULL, 0x3132372e302e302e31, 'owner@tecdiary.com', '2018-02-10 09:04:31'),
(161, 1, NULL, 0x3132372e302e302e31, 'owner@tecdiary.com', '2018-02-11 02:24:40'),
(162, 1, NULL, 0x3132372e302e302e31, 'owner@tecdiary.com', '2018-02-11 02:52:07'),
(163, 1, NULL, 0x3139322e3136382e31302e3833, 'admin@855solution.com', '2018-02-11 04:00:45'),
(164, 1, NULL, 0x3139322e3136382e31302e3632, 'admin@855solution.com', '2018-02-11 04:03:06'),
(165, 1, NULL, 0x3139322e3136382e31302e3830, 'admin@855solution.com', '2018-02-11 04:03:32'),
(166, 6, NULL, 0x3132372e302e302e31, 'mlobsbov@gmail.com', '2018-02-11 04:26:16'),
(167, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-02-11 04:28:22'),
(168, 6, NULL, 0x3a3a31, 'mlobsbov', '2018-02-11 04:29:45'),
(169, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-02-11 04:30:28'),
(170, 6, NULL, 0x3a3a31, 'mlobsbov', '2018-02-11 04:30:59'),
(171, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-02-11 04:31:29'),
(172, 6, NULL, 0x3a3a31, 'mlobsbov', '2018-02-11 04:31:50'),
(173, 6, NULL, 0x3a3a31, 'mlobsbov', '2018-02-11 04:33:46'),
(174, 6, NULL, 0x3a3a31, 'mlobsbov', '2018-02-11 04:35:15'),
(175, 6, NULL, 0x3a3a31, 'mlobsbov', '2018-02-11 04:36:00'),
(176, 6, NULL, 0x3139322e3136382e31302e3830, 'mlobsbov', '2018-02-11 09:53:29'),
(177, 6, NULL, 0x3a3a31, 'mlobsbov', '2018-02-11 11:32:57'),
(178, 6, NULL, 0x3a3a31, 'mlobsbov', '2018-02-11 14:54:05'),
(179, 6, NULL, 0x3139322e3136382e31302e3830, 'mlobsbov', '2018-02-12 15:52:43'),
(180, 6, NULL, 0x3139322e3136382e31302e3830, 'mlobsbov', '2018-02-16 04:27:07'),
(181, 6, NULL, 0x3139322e3136382e31302e3830, 'mlobsbov', '2018-02-16 09:52:13'),
(182, 6, NULL, 0x3a3a31, 'mlobsbov', '2018-02-18 01:22:10'),
(183, 6, NULL, 0x3139322e3136382e31302e3830, 'mlobsbov', '2018-02-18 06:20:17'),
(184, 1, NULL, 0x3132372e302e302e31, 'admin@855solution.com', '2018-02-24 03:25:44'),
(185, 6, NULL, 0x3139322e3136382e31302e3830, 'mlobsbov', '2018-02-24 04:32:45'),
(186, 6, NULL, 0x3139322e3136382e31302e3632, 'mlobsbov', '2018-02-24 04:34:54'),
(187, 1, NULL, 0x3132372e302e302e31, 'admin@855solution.com', '2018-02-24 06:59:16'),
(188, 6, NULL, 0x3139322e3136382e31302e31, 'mlobsbov', '2018-02-24 07:29:09'),
(189, 1, NULL, 0x3139322e3136382e31302e31, 'admin@855solution.com', '2018-02-24 07:29:38'),
(190, 6, NULL, 0x3139322e3136382e31302e31, 'mlobsbov', '2018-02-24 07:33:49'),
(191, 1, NULL, 0x3139322e3136382e31302e31, 'admin@855solution.com', '2018-02-24 07:39:50'),
(192, 6, NULL, 0x3139322e3136382e31302e31, 'mlobsbov', '2018-02-24 11:02:41'),
(193, 1, NULL, 0x3139322e3136382e31302e31, 'admin@855solution.com', '2018-02-24 11:03:23'),
(194, 6, NULL, 0x3139322e3136382e31302e31, 'mlobsbov', '2018-02-24 11:16:45'),
(195, 6, NULL, 0x3139322e3136382e31302e31, 'mlobsbov', '2018-02-24 11:19:39'),
(196, 6, NULL, 0x3139322e3136382e31302e31, 'mlobsbov', '2018-02-24 14:20:31'),
(197, 6, NULL, 0x3139322e3136382e31302e31, 'mlobsbov', '2018-02-25 00:29:56'),
(198, 6, NULL, 0x3139322e3136382e31302e31, 'mlobsbov', '2018-02-25 01:04:42'),
(199, 7, NULL, 0x3139322e3136382e31302e31, 'mlobsbov1', '2018-02-25 01:07:06'),
(200, 6, NULL, 0x3139322e3136382e31302e31, 'mlobsbov', '2018-02-25 02:04:52'),
(201, 1, NULL, 0x3139322e3136382e31302e31, 'admin@855solution.com', '2018-02-25 02:07:05'),
(202, 1, NULL, 0x3139322e3136382e31302e31, 'admin@855solution.com', '2018-02-25 02:14:23'),
(203, 6, NULL, 0x3139322e3136382e31302e31, 'mlobsbov', '2018-02-25 02:23:51'),
(204, 1, NULL, 0x3139322e3136382e31302e3831, 'admin@855solution.com', '2018-02-25 03:51:56'),
(205, 8, NULL, 0x3139322e3136382e31302e3830, 'tenghuy', '2018-02-25 03:54:04'),
(206, 8, NULL, 0x3139322e3136382e31302e3830, 'tenghuy', '2018-02-25 04:01:53'),
(207, 6, NULL, 0x3139322e3136382e31302e3831, 'mlobsbov', '2018-02-25 05:39:27'),
(208, 1, NULL, 0x3139322e3136382e31302e3831, 'admin@855solution.com', '2018-02-25 05:40:21'),
(209, 6, NULL, 0x3139322e3136382e31302e3831, 'mlobsbov', '2018-02-25 05:40:51'),
(210, 1, NULL, 0x3139322e3136382e31302e3831, 'admin@855solution.com', '2018-02-25 05:41:30'),
(211, 1, NULL, 0x3139322e3136382e31302e3831, 'admin@855solution.com', '2018-02-25 05:43:13'),
(212, 9, NULL, 0x3139322e3136382e31302e3831, 'tse@gmail.com', '2018-02-25 05:43:42'),
(213, 1, NULL, 0x3139322e3136382e31302e3831, 'admin@855solution.com', '2018-02-25 05:45:54'),
(214, 6, NULL, 0x3139322e3136382e31302e3831, 'mlobsbov', '2018-02-25 05:55:37'),
(215, 1, NULL, 0x3139322e3136382e31302e3831, 'admin@855solution.com', '2018-02-25 06:00:11'),
(216, 1, NULL, 0x3139322e3136382e31302e3830, 'admin@855solution.com', '2018-02-25 06:07:44'),
(217, 8, NULL, 0x3139322e3136382e31302e3830, 'tenghuy', '2018-02-25 06:08:39'),
(218, 1, NULL, 0x3132372e302e302e31, 'admin@855solution.com', '2018-02-25 06:25:34'),
(219, 6, NULL, 0x3a3a31, 'mlobsbov', '2018-02-25 07:44:07'),
(220, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-02-25 07:44:23'),
(221, 1, NULL, 0x3139322e3136382e31302e3831, 'admin@855solution.com', '2018-02-25 09:30:51'),
(222, 8, NULL, 0x3139322e3136382e31302e3830, 'tenghuy', '2018-02-26 02:23:31'),
(223, 6, NULL, 0x3a3a31, 'mlobsbov', '2018-02-26 03:42:15'),
(224, 6, NULL, 0x3a3a31, 'mlobsbov', '2018-02-26 13:21:02'),
(225, 6, NULL, 0x3a3a31, 'mlobsbov', '2018-02-27 00:35:36'),
(226, 6, NULL, 0x3a3a31, 'mlobsbov', '2018-02-27 03:43:35'),
(227, 8, NULL, 0x3139322e3136382e31302e3830, 'tenghuy', '2018-02-27 05:01:20'),
(228, 8, NULL, 0x3132372e302e302e31, 'tenghuy', '2018-02-27 05:25:17'),
(229, 6, NULL, 0x3a3a31, 'mlobsbov', '2018-02-27 14:49:04'),
(230, 8, NULL, 0x3139322e3136382e31302e3830, 'tenghuy', '2018-02-28 04:53:12'),
(231, 6, NULL, 0x3a3a31, 'mlobsbov', '2018-02-28 05:42:54'),
(232, 8, NULL, 0x3132372e302e302e31, 'tenghuy', '2018-02-28 05:43:19'),
(233, 8, NULL, 0x3132372e302e302e31, 'tenghuy', '2018-03-01 03:15:26'),
(234, 6, NULL, 0x3139322e3136382e31302e3830, 'mlobsbov', '2018-03-01 04:46:23'),
(235, 8, NULL, 0x3139322e3136382e31302e3830, 'tenghuy', '2018-03-01 04:58:22'),
(236, 6, NULL, 0x3a3a31, 'mlobsbov', '2018-03-01 05:58:32'),
(237, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-03-01 08:05:16'),
(238, 6, NULL, 0x3a3a31, 'mlobsbov', '2018-03-01 08:55:55'),
(239, 10, NULL, 0x3a3a31, 'sopheak', '2018-03-01 10:31:10'),
(240, 6, NULL, 0x3a3a31, 'mlobsbov', '2018-03-01 10:32:38'),
(241, 8, NULL, 0x3139322e3136382e31302e3830, 'tenghuy', '2018-03-01 15:28:25'),
(242, 8, NULL, 0x3139322e3136382e31302e3830, 'tenghuy', '2018-03-02 04:45:12'),
(243, 6, NULL, 0x3a3a31, 'mlobsbov', '2018-03-02 05:23:20'),
(244, 10, NULL, 0x3132372e302e302e31, 'sopheak', '2018-03-02 05:30:57'),
(245, 8, NULL, 0x3139322e3136382e31302e3830, 'tenghuy', '2018-03-03 04:04:23'),
(246, 8, NULL, 0x3139322e3136382e31302e3830, 'tenghuy', '2018-03-03 05:12:34'),
(247, 10, NULL, 0x3132372e302e302e31, 'sopheak', '2018-03-03 05:32:18'),
(248, 8, NULL, 0x3139322e3136382e31302e3830, 'tenghuy', '2018-03-04 04:29:05'),
(249, 8, NULL, 0x3139322e3136382e31302e3830, 'tenghuy', '2018-03-05 04:48:08'),
(250, 6, NULL, 0x3a3a31, 'mlobsbov', '2018-03-05 13:07:07'),
(251, 10, NULL, 0x3a3a31, 'sopheak', '2018-03-05 13:08:28'),
(252, 8, NULL, 0x3132372e302e302e31, 'tenghuy', '2018-03-05 16:05:46'),
(253, 8, NULL, 0x3139322e3136382e31302e3830, 'tenghuy', '2018-03-06 02:54:23'),
(254, 8, NULL, 0x3139322e3136382e31302e3830, 'tenghuy', '2018-03-06 07:15:12'),
(255, 10, NULL, 0x3a3a31, 'sopheak', '2018-03-07 04:51:30'),
(256, 8, NULL, 0x3139322e3136382e31302e3830, 'tenghuy', '2018-03-07 05:06:12'),
(257, 8, NULL, 0x3139322e3136382e31302e3830, 'tenghuy', '2018-03-07 16:10:33'),
(258, 8, NULL, 0x3139322e3136382e31302e3830, 'tenghuy', '2018-03-08 04:55:56'),
(259, 8, NULL, 0x3139322e3136382e31302e3830, 'tenghuy', '2018-03-08 11:31:01'),
(260, 8, NULL, 0x3139322e3136382e31302e3830, 'tenghuy', '2018-03-09 03:25:29'),
(261, 8, NULL, 0x3139322e3136382e31302e3830, 'tenghuy', '2018-03-10 04:24:05'),
(262, 6, NULL, 0x3a3a31, 'mlobsbov', '2018-03-10 09:04:18'),
(263, 8, NULL, 0x3139322e3136382e31302e3830, 'tenghuy', '2018-03-11 05:21:58'),
(264, 8, NULL, 0x3139322e3136382e31302e3830, 'tenghuy', '2018-03-12 03:59:26'),
(265, 6, NULL, 0x3a3a31, 'mlobsbov', '2018-03-12 09:18:15'),
(266, 8, NULL, 0x3139322e3136382e31302e3830, 'tenghuy', '2018-03-12 09:22:41'),
(267, 8, NULL, 0x3139322e3136382e31302e3830, 'tenghuy', '2018-03-13 04:25:47'),
(268, 8, NULL, 0x3139322e3136382e31302e3830, 'tenghuy', '2018-03-14 06:07:05'),
(269, 8, NULL, 0x3139322e3136382e31302e3830, 'tenghuy', '2018-03-14 14:32:02'),
(270, 8, NULL, 0x3139322e3136382e31302e3830, 'tenghuy', '2018-03-15 04:38:01'),
(271, 8, NULL, 0x3139322e3136382e31302e3830, 'tenghuy', '2018-03-15 10:03:57'),
(272, 8, NULL, 0x3139322e3136382e31302e3830, 'tenghuy', '2018-03-16 04:11:56'),
(273, 8, NULL, 0x3132372e302e302e31, 'tenghuy', '2018-03-16 09:47:27'),
(274, 1, NULL, 0x3132372e302e302e31, 'admin@855solution.com', '2018-04-26 06:43:59'),
(275, 1, NULL, 0x3132372e302e302e31, 'admin@855solution.com', '2018-04-26 07:01:47'),
(276, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-04-30 08:03:07'),
(277, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-07-09 02:02:30'),
(278, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-07-16 06:18:45'),
(279, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-07-18 11:31:54'),
(280, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-07-19 01:21:47'),
(281, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-07-19 05:10:56'),
(282, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-07-19 08:15:50'),
(283, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-07-20 02:12:37'),
(284, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-07-20 09:58:18'),
(285, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-07-23 01:27:45'),
(286, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-07-23 03:56:07'),
(287, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-08-01 03:45:44'),
(288, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-08-02 02:33:58'),
(289, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-08-03 01:50:05'),
(290, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-08-03 03:38:04'),
(291, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-08-03 03:41:30'),
(292, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-08-03 03:46:03'),
(293, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-08-06 02:06:56'),
(294, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-08-06 03:56:39'),
(295, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-08-08 06:19:20'),
(296, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-08-13 02:14:55'),
(297, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-08-13 04:17:01'),
(298, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-08-13 09:24:48'),
(299, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-08-14 01:03:57'),
(300, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-08-15 01:41:04'),
(301, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-08-22 02:22:48'),
(302, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-09-05 06:20:54'),
(303, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-09-05 06:40:21'),
(304, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-09-05 07:43:35'),
(305, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-09-05 07:55:48'),
(306, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-09-05 07:56:51'),
(307, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-09-06 02:18:38'),
(308, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-09-06 04:44:28'),
(309, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-09-06 06:30:13'),
(310, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-09-06 07:38:16'),
(311, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-09-06 09:33:35'),
(312, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-09-06 09:58:13'),
(313, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-09-10 02:34:11'),
(314, 10, NULL, 0x3a3a31, 'layveasna@gmail.com', '2018-09-10 03:30:50'),
(315, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-09-10 04:49:46'),
(316, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-09-11 02:22:41'),
(317, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-09-11 05:26:47'),
(318, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-09-13 01:55:47'),
(319, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-09-13 02:42:18'),
(320, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-09-17 07:15:33'),
(321, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-09-17 07:15:51'),
(322, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-09-18 02:42:53'),
(323, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-09-20 01:19:25'),
(324, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-09-20 04:08:46'),
(325, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2018-09-20 04:11:02'),
(326, 1, NULL, 0x3139322e3136382e302e313039, 'admin@855solution.com', '2018-09-20 06:24:43'),
(327, 1, NULL, 0x3139322e3136382e302e313039, 'admin@855solution.com', '2018-09-20 06:28:56'),
(328, 1, NULL, 0x3139322e3136382e302e313039, 'admin@855solution.com', '2018-09-21 07:44:00'),
(329, 1, NULL, 0x3139322e3136382e302e313131, 'admin@855solution.com', '2018-09-21 07:47:18'),
(330, 1, NULL, 0x3139322e3136382e302e313131, 'admin@855solution.com', '2018-10-04 06:28:45'),
(331, 11, NULL, 0x3139322e3136382e302e313131, 'Sonito', '2018-10-04 06:58:09'),
(332, 12, NULL, 0x3139322e3136382e302e313131, 'Sok Lida', '2018-10-04 07:29:09'),
(333, 11, NULL, 0x3139322e3136382e302e313131, 'Sonito', '2018-10-04 07:29:52'),
(334, 12, NULL, 0x3139322e3136382e302e313131, 'Sok Lida', '2018-10-04 07:33:09'),
(335, 1, NULL, 0x3139322e3136382e302e313131, 'admin@855solution.com', '2018-10-04 07:34:24'),
(336, 1, NULL, 0x3139322e3136382e302e313131, 'admin@855solution.com', '2018-10-04 08:56:14'),
(337, 11, NULL, 0x3139322e3136382e302e313131, 'Sonito', '2018-10-04 09:53:21'),
(338, 11, NULL, 0x3139322e3136382e302e313132, 'Sonito', '2018-10-04 10:26:42'),
(339, 1, NULL, 0x3139322e3136382e302e313131, 'admin@855solution.com', '2018-10-05 02:31:49'),
(340, 1, NULL, 0x3139322e3136382e302e313131, 'admin@855solution.com', '2018-10-05 02:36:53'),
(341, 1, NULL, 0x3139322e3136382e302e313131, 'admin@855solution.com', '2018-10-05 02:37:17'),
(342, 1, NULL, 0x3139322e3136382e302e313131, 'admin@855solution.com', '2018-10-05 02:39:44'),
(343, 1, NULL, 0x3139322e3136382e302e313131, 'admin@855solution.com', '2018-10-05 02:42:47'),
(344, 1, NULL, 0x3139322e3136382e302e313131, 'admin@855solution.com', '2018-10-05 02:43:36'),
(345, 1, NULL, 0x3139322e3136382e302e313131, 'admin@855solution.com', '2018-10-05 02:44:30'),
(346, 1, NULL, 0x3139322e3136382e302e313131, 'admin@855solution.com', '2018-10-05 02:48:11'),
(347, 1, NULL, 0x3139322e3136382e302e313131, 'admin@855solution.com', '2018-10-05 02:48:45'),
(348, 1, NULL, 0x3139322e3136382e302e313033, 'admin@855solution.com', '2018-10-05 06:12:53'),
(349, 1, NULL, 0x3139322e3136382e302e313131, 'admin@855solution.com', '2018-10-05 09:41:34'),
(350, 1, NULL, 0x3139322e3136382e302e313131, 'admin@855solution.com', '2018-10-06 02:24:28'),
(351, 1, NULL, 0x3139322e3136382e302e313131, 'admin@855solution.com', '2018-10-06 02:25:39'),
(352, 12, NULL, 0x3139322e3136382e302e313131, 'Sok Lida', '2018-10-06 06:15:32'),
(353, 12, NULL, 0x3139322e3136382e302e313131, 'Sok Lida', '2018-10-06 06:17:07'),
(354, 12, NULL, 0x3139322e3136382e302e313131, 'Sok Lida', '2018-10-06 06:18:29'),
(355, 1, NULL, 0x3139322e3136382e302e313131, 'admin@855solution.com', '2018-10-06 06:19:12'),
(356, 13, NULL, 0x3139322e3136382e302e313131, 'CHHUN LENG', '2018-10-06 06:35:30'),
(357, 1, NULL, 0x3139322e3136382e302e313131, 'admin@855solution.com', '2018-10-06 06:56:06'),
(358, 1, NULL, 0x3139322e3136382e302e313131, 'admin@855solution.com', '2018-10-07 06:07:05'),
(359, 11, NULL, 0x3139322e3136382e302e313131, 'Sonito', '2018-10-07 06:27:13'),
(360, 11, NULL, 0x3139322e3136382e302e313131, 'Sonito', '2018-10-07 06:33:19'),
(361, 11, NULL, 0x3139322e3136382e302e313131, 'Sonito', '2018-10-07 06:34:25'),
(362, 11, NULL, 0x3139322e3136382e302e313131, 'Sonito', '2018-10-07 06:38:29'),
(363, 11, NULL, 0x3139322e3136382e302e313131, 'Sonito', '2018-10-07 06:39:32'),
(364, 11, NULL, 0x3139322e3136382e302e313131, 'Sonito', '2018-10-08 03:46:29'),
(365, 12, NULL, 0x3139322e3136382e302e313131, 'Sok Lida', '2018-10-08 03:48:46'),
(366, 11, NULL, 0x3139322e3136382e302e313131, 'Sonito', '2018-10-08 03:49:31'),
(367, 11, NULL, 0x3139322e3136382e302e313131, 'Sonito', '2018-10-08 04:22:00'),
(368, 11, NULL, 0x3139322e3136382e302e313131, 'Sonito', '2018-10-08 04:23:58'),
(369, 11, NULL, 0x3139322e3136382e302e313131, 'Sonito', '2018-10-08 04:28:37'),
(370, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-10-08 04:33:38'),
(371, 11, NULL, 0x3139322e3136382e302e313131, 'Sonito', '2018-10-11 09:58:20'),
(372, 11, NULL, 0x3139322e3136382e302e313131, 'Sonito', '2018-10-12 01:07:45'),
(373, 11, NULL, 0x3139322e3136382e302e313131, 'Sonito', '2018-10-12 07:23:14'),
(374, 12, NULL, 0x3139322e3136382e302e313131, 'sok-lida', '2018-10-12 07:26:48'),
(375, 11, NULL, 0x3139322e3136382e302e313131, 'Sonito', '2018-10-12 07:28:59'),
(376, 12, NULL, 0x3139322e3136382e302e313131, 'sok-lida', '2018-10-12 07:30:37'),
(377, 11, NULL, 0x3139322e3136382e302e313131, 'Sonito', '2018-10-13 00:26:48'),
(378, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-10-13 06:11:16'),
(379, 11, NULL, 0x3139322e3136382e302e313131, 'Sonito', '2018-10-13 07:18:06'),
(380, 11, NULL, 0x3139322e3136382e302e313131, 'Sonito', '2018-10-14 10:54:50'),
(381, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-10-15 02:02:13'),
(382, 11, NULL, 0x3139322e3136382e302e313131, 'Sonito', '2018-10-15 05:06:43'),
(383, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-10-15 05:07:19'),
(384, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-10-16 02:56:20'),
(385, 11, NULL, 0x3139322e3136382e302e313131, 'Sonito', '2018-10-18 06:36:32'),
(386, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-10-19 01:55:21'),
(387, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-10-20 01:37:46'),
(388, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-10-21 00:41:12'),
(389, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-10-21 03:32:02'),
(390, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-10-22 03:31:47'),
(391, 11, NULL, 0x3139322e3136382e302e313034, 'Sonito', '2018-10-22 04:34:32'),
(392, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-10-22 06:48:51'),
(393, 11, NULL, 0x3139322e3136382e302e313131, 'Sonito', '2018-10-22 07:48:41'),
(394, 15, NULL, 0x3139322e3136382e302e313131, 'chhunleng', '2018-10-22 07:50:44'),
(395, 15, NULL, 0x3139322e3136382e302e313131, 'chhunleng', '2018-10-22 08:16:03'),
(396, 11, NULL, 0x3139322e3136382e302e313039, 'Sonito', '2018-10-22 08:23:05'),
(397, 11, NULL, 0x3139322e3136382e302e313039, 'Sonito', '2018-10-22 08:31:59'),
(398, 11, NULL, 0x3139322e3136382e302e313131, 'Sonito', '2018-10-22 08:49:53'),
(399, 15, NULL, 0x3139322e3136382e302e313131, 'chhunleng', '2018-10-22 08:56:05'),
(400, 15, NULL, 0x3139322e3136382e302e313131, 'chhunleng', '2018-10-22 08:57:29'),
(401, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-10-22 08:58:47'),
(402, 15, NULL, 0x3139322e3136382e302e313131, 'chhunleng', '2018-10-22 09:04:12'),
(403, 11, NULL, 0x3139322e3136382e302e313039, 'Sonito', '2018-10-22 09:05:45'),
(404, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-10-22 09:32:41'),
(405, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-10-23 10:14:29'),
(406, 11, NULL, 0x3139322e3136382e302e313034, 'Sonito', '2018-10-23 10:27:37'),
(407, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-10-24 02:37:29'),
(408, 11, NULL, 0x3136392e3235342e3130382e3237, 'Sonito', '2018-10-24 07:32:52'),
(409, 11, NULL, 0x3136392e3235342e3130382e3237, 'Sonito', '2018-10-24 13:23:25'),
(410, 15, NULL, 0x3139322e3136382e302e313131, 'chhunleng', '2018-10-24 13:38:42'),
(411, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-10-24 14:54:46'),
(412, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-10-25 04:21:42'),
(413, 11, NULL, 0x3139322e3136382e302e313131, 'Sonito', '2018-10-26 02:37:59'),
(414, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-10-26 06:01:37'),
(415, 11, NULL, 0x3139322e3136382e302e313131, 'Sonito', '2018-10-26 15:10:07'),
(416, 11, NULL, 0x3139322e3136382e302e313131, 'Sonito', '2018-10-26 19:28:31'),
(417, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-10-27 02:15:33'),
(418, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-10-27 05:57:10'),
(419, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-10-27 05:57:10'),
(420, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-10-27 05:57:10'),
(421, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-10-27 05:59:17'),
(422, 12, NULL, 0x3139322e3136382e302e313034, 'sok-lida', '2018-10-27 06:22:36'),
(423, 11, NULL, 0x3139322e3136382e302e313039, 'Sonito', '2018-10-27 06:23:16'),
(424, 12, NULL, 0x3139322e3136382e302e313039, 'sok-lida', '2018-10-27 06:46:31'),
(425, 12, NULL, 0x3139322e3136382e302e313039, 'sok-lida', '2018-10-27 07:14:39'),
(426, 12, NULL, 0x3139322e3136382e302e313039, 'sok-lida', '2018-10-27 07:40:38'),
(427, 11, NULL, 0x3139322e3136382e302e313039, 'Sonito', '2018-10-27 07:48:54'),
(428, 12, NULL, 0x3139322e3136382e302e313039, 'sok-lida', '2018-10-27 07:52:56'),
(429, 11, NULL, 0x3139322e3136382e302e313131, 'Sonito', '2018-10-27 08:00:40'),
(430, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-10-29 05:22:23'),
(431, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-10-29 08:45:08'),
(432, 1, NULL, 0x3139322e3136382e302e313034, 'admin@855solution.com', '2018-10-29 08:56:31'),
(433, 1, NULL, 0x3139322e3136382e302e313131, 'admin@855solution.com', '2018-10-29 08:56:31'),
(434, 1, NULL, 0x3139322e3136382e302e313034, 'admin@855solution.com', '2018-10-29 08:57:20'),
(435, 1, NULL, 0x3139322e3136382e302e313133, 'admin@855solution.com', '2018-10-29 09:09:24'),
(436, 1, NULL, 0x3139322e3136382e302e313133, 'admin@855solution.com', '2018-10-29 09:10:46'),
(437, 1, NULL, 0x3139322e3136382e302e313034, 'admin@855solution.com', '2018-10-29 09:12:36'),
(438, 1, NULL, 0x3139322e3136382e302e313039, 'admin@855solution.com', '2018-10-29 09:17:04'),
(439, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-10-30 02:55:38'),
(440, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-10-30 07:16:39'),
(441, 11, NULL, 0x3139322e3136382e302e313131, 'Sonito', '2018-10-31 02:15:40'),
(442, 12, NULL, 0x3139322e3136382e302e313034, 'sok-lida', '2018-10-31 02:18:01'),
(443, 12, NULL, 0x3139322e3136382e302e313034, 'sok-lida', '2018-10-31 02:25:37'),
(444, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-10-31 05:23:57'),
(445, 1, NULL, 0x3139322e3136382e302e313131, 'admin@855solution.com', '2018-10-31 07:30:34'),
(446, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-10-31 08:58:03'),
(447, 11, NULL, 0x3139322e3136382e302e313131, 'Sonito', '2018-10-31 09:52:50'),
(448, 1, NULL, 0x3139322e3136382e302e313131, 'admin@855solution.com', '2018-11-01 02:46:20'),
(449, 12, NULL, 0x3136392e3235342e3130382e3237, 'sok-lida', '2018-11-01 05:18:36'),
(450, 11, NULL, 0x3139322e3136382e302e313131, 'Sonito', '2018-11-04 04:25:32'),
(451, 12, NULL, 0x3139322e3136382e302e313230, 'sok-lida', '2018-11-04 06:43:51'),
(452, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-11-04 07:28:44'),
(453, 12, NULL, 0x3139322e3136382e302e313230, 'sok-lida', '2018-11-04 07:41:21'),
(454, 12, NULL, 0x3139322e3136382e302e313034, 'sok-lida', '2018-11-04 07:48:58'),
(455, 1, NULL, 0x3139322e3136382e302e313131, 'admin@855solution.com', '2018-11-04 08:19:49'),
(456, 11, NULL, 0x3139322e3136382e302e313131, 'Sonito', '2018-11-05 01:34:57'),
(457, 12, NULL, 0x3139322e3136382e302e313037, 'sok-lida', '2018-11-05 01:38:27'),
(458, 14, NULL, 0x3139322e3136382e302e313039, 'LGB-CEO', '2018-11-05 01:42:25'),
(459, 12, NULL, 0x3139322e3136382e302e313131, 'sok-lida', '2018-11-05 02:52:10'),
(460, 11, NULL, 0x3139322e3136382e302e313037, 'Sonito', '2018-11-05 07:29:01'),
(461, 12, NULL, 0x3139322e3136382e302e313131, 'sok-lida', '2018-11-05 08:33:39'),
(462, 11, NULL, 0x3139322e3136382e302e313037, 'Sonito', '2018-11-05 09:53:28'),
(463, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-11-06 00:55:46'),
(464, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-11-07 01:31:58'),
(465, 12, NULL, 0x3139322e3136382e302e313037, 'sok-lida', '2018-11-07 01:53:51'),
(466, 12, NULL, 0x3139322e3136382e302e313131, 'sok-lida', '2018-11-07 09:29:18'),
(467, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-11-08 02:47:15'),
(468, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-11-08 09:06:15'),
(469, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-11-09 02:18:39'),
(470, 12, NULL, 0x3139322e3136382e302e313137, 'sok-lida', '2018-11-09 03:46:59'),
(471, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-11-09 15:05:07'),
(472, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-11-10 00:30:36'),
(473, 12, NULL, 0x3139322e3136382e302e313131, 'sok-lida', '2018-11-10 05:27:13'),
(474, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-11-10 09:13:08'),
(475, 12, NULL, 0x3139322e3136382e302e313131, 'sok-lida', '2018-11-11 02:50:54'),
(476, 12, NULL, 0x3139322e3136382e302e313137, 'sok-lida', '2018-11-12 01:28:04'),
(477, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-11-12 01:51:40'),
(478, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-11-13 00:57:38'),
(479, 12, NULL, 0x3139322e3136382e302e313131, 'sok-lida', '2018-11-13 09:29:36'),
(480, 12, NULL, 0x3139322e3136382e302e313137, 'sok-lida', '2018-11-14 01:27:59'),
(481, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-11-14 03:13:24'),
(482, 12, NULL, 0x3139322e3136382e302e313137, 'sok-lida', '2018-11-14 07:24:11'),
(483, 1, NULL, 0x3139322e3136382e302e313131, 'admin@855solution.com', '2018-11-14 07:44:56'),
(484, 12, NULL, 0x3139322e3136382e302e313137, 'sok-lida', '2018-11-15 01:19:44'),
(485, 1, NULL, 0x3139322e3136382e302e313131, 'admin@855solution.com', '2018-11-15 06:02:23'),
(486, 1, NULL, 0x3139322e3136382e302e313131, 'admin@855solution.com', '2018-11-15 07:10:10'),
(487, 12, NULL, 0x3139322e3136382e302e313137, 'sok-lida', '2018-11-16 01:41:48'),
(488, 1, NULL, 0x3139322e3136382e302e313131, 'admin@855solution.com', '2018-11-16 03:37:57'),
(489, 1, NULL, 0x3139322e3136382e302e313137, 'admin@855solution.com', '2018-11-16 03:59:29'),
(490, 12, NULL, 0x3139322e3136382e302e313137, 'sok-lida', '2018-11-16 04:05:17'),
(491, 12, NULL, 0x3139322e3136382e302e313137, 'sok-lida', '2018-11-16 08:01:44'),
(492, 12, NULL, 0x3139322e3136382e302e313137, 'sok-lida', '2018-11-17 01:14:14'),
(493, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-11-17 02:06:18'),
(494, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-11-17 07:34:42'),
(495, 12, NULL, 0x3139322e3136382e302e313131, 'sok-lida', '2018-11-17 08:05:52'),
(496, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-11-18 06:09:56'),
(497, 12, NULL, 0x3139322e3136382e302e313137, 'sok-lida', '2018-11-19 01:17:57'),
(498, 12, NULL, 0x3139322e3136382e302e313033, 'sok-lida', '2018-11-19 08:14:10'),
(499, 1, NULL, 0x3139322e3136382e302e313037, 'admin@855solution.com', '2018-11-19 08:20:45'),
(500, 12, NULL, 0x3139322e3136382e302e313035, 'sok-lida', '2018-11-20 02:32:28'),
(501, 12, NULL, 0x3139322e3136382e302e313035, 'sok-lida', '2018-11-26 01:38:33'),
(502, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-11-26 07:11:56'),
(503, 1, NULL, 0x3139322e3136382e302e313131, 'admin@855solution.com', '2018-11-27 02:31:39'),
(504, 12, NULL, 0x3136392e3235342e3135312e3636, 'sok-lida', '2018-11-27 03:00:07'),
(505, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-11-28 00:40:09'),
(506, 12, NULL, 0x3139322e3136382e302e313035, 'sok-lida', '2018-11-28 01:44:40'),
(507, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-11-28 07:41:50'),
(508, 12, NULL, 0x3139322e3136382e302e313035, 'sok-lida', '2018-11-28 08:04:38'),
(509, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-11-29 00:47:39'),
(510, 12, NULL, 0x3139322e3136382e302e313039, 'sok-lida', '2018-11-29 01:18:28'),
(511, 12, NULL, 0x3139322e3136382e302e313039, 'sok-lida', '2018-11-29 05:20:09'),
(512, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-11-29 09:16:42'),
(513, 12, NULL, 0x3139322e3136382e302e313039, 'sok-lida', '2018-11-30 01:46:10'),
(514, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-11-30 02:27:53'),
(515, 12, NULL, 0x3139322e3136382e302e313039, 'sok-lida', '2018-12-01 01:23:23'),
(516, 12, NULL, 0x3139322e3136382e302e313132, 'sok-lida', '2018-12-03 01:11:46'),
(517, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-03 01:27:41'),
(518, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-03 08:01:00'),
(519, 12, NULL, 0x3139322e3136382e302e313132, 'sok-lida', '2018-12-03 08:18:19'),
(520, 12, NULL, 0x3139322e3136382e302e313132, 'sok-lida', '2018-12-04 01:20:12'),
(521, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-04 02:29:40'),
(522, 12, NULL, 0x3139322e3136382e302e313132, 'sok-lida', '2018-12-04 07:03:34'),
(523, 12, NULL, 0x3139322e3136382e302e313132, 'sok-lida', '2018-12-04 10:13:32'),
(524, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-05 01:22:40'),
(525, 12, NULL, 0x3139322e3136382e302e313039, 'sok-lida', '2018-12-05 01:36:23'),
(526, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-05 06:17:29'),
(527, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-05 10:22:16'),
(528, 12, NULL, 0x3139322e3136382e302e313039, 'sok-lida', '2018-12-05 11:03:18'),
(529, 12, NULL, 0x3139322e3136382e302e313039, 'sok-lida', '2018-12-06 01:16:43'),
(530, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-06 01:35:25'),
(531, 12, NULL, 0x3139322e3136382e302e313039, 'sok-lida', '2018-12-06 05:05:40'),
(532, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-06 08:12:00'),
(533, 12, NULL, 0x3139322e3136382e302e313039, 'sok-lida', '2018-12-06 09:07:38'),
(534, 12, NULL, 0x3139322e3136382e302e313039, 'sok-lida', '2018-12-07 01:17:44'),
(535, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-07 04:06:37'),
(536, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-07 06:19:04'),
(537, 12, NULL, 0x3139322e3136382e302e313039, 'sok-lida', '2018-12-07 09:15:20'),
(538, 12, NULL, 0x3139322e3136382e302e313039, 'sok-lida', '2018-12-08 02:17:01'),
(539, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-08 02:58:36'),
(540, 12, NULL, 0x3139322e3136382e302e313039, 'sok-lida', '2018-12-10 00:44:39'),
(541, 12, NULL, 0x3139322e3136382e302e313132, 'sok-lida', '2018-12-10 01:43:39'),
(542, 11, NULL, 0x3139322e3136382e302e313131, 'Sonito', '2018-12-10 02:23:57'),
(543, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-10 04:33:05'),
(544, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-10 09:41:05'),
(545, 12, NULL, 0x3139322e3136382e302e313039, 'sok-lida', '2018-12-11 01:18:49'),
(546, 1, NULL, 0x3139322e3136382e302e313131, 'admin@855solution.com', '2018-12-11 02:42:30'),
(547, 12, NULL, 0x3139322e3136382e302e313039, 'sok-lida', '2018-12-12 01:15:16'),
(548, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-12 01:27:11'),
(549, 12, NULL, 0x3139322e3136382e302e313132, 'sok-lida', '2018-12-12 07:40:55'),
(550, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-12 10:43:06'),
(551, 12, NULL, 0x3139322e3136382e302e313039, 'sok-lida', '2018-12-13 01:43:39'),
(552, 12, NULL, 0x3139322e3136382e302e313039, 'sok-lida', '2018-12-13 06:41:27'),
(553, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-13 06:59:03'),
(554, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-14 02:34:56'),
(555, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-15 02:35:11'),
(556, 11, NULL, 0x3136392e3235342e3138352e323239, 'Sonito', '2018-12-15 03:07:52'),
(557, 12, NULL, 0x3139322e3136382e302e313130, 'sok-lida', '2018-12-15 06:37:03'),
(558, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-16 02:11:36'),
(559, 12, NULL, 0x3139322e3136382e302e313036, 'sok-lida', '2018-12-17 01:31:33'),
(560, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-17 02:10:58'),
(561, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-17 09:05:21'),
(562, 12, NULL, 0x3139322e3136382e302e313036, 'sok-lida', '2018-12-17 09:05:35'),
(563, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-18 01:42:43'),
(564, 12, NULL, 0x3139322e3136382e302e313038, 'sok-lida', '2018-12-18 01:49:13'),
(565, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-18 08:55:50'),
(566, 12, NULL, 0x3139322e3136382e302e313038, 'sok-lida', '2018-12-19 01:39:54'),
(567, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-19 02:02:53'),
(568, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-19 09:15:45'),
(569, 12, NULL, 0x3139322e3136382e302e313038, 'sok-lida', '2018-12-19 09:16:02'),
(570, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-20 01:05:44'),
(571, 12, NULL, 0x3139322e3136382e302e313130, 'sok-lida', '2018-12-20 01:26:18'),
(572, 12, NULL, 0x3139322e3136382e302e313130, 'sok-lida', '2018-12-20 09:26:51'),
(573, 12, NULL, 0x3139322e3136382e302e313130, 'sok-lida', '2018-12-21 02:03:09'),
(574, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-21 02:24:57'),
(575, 12, NULL, 0x3139322e3136382e302e313130, 'sok-lida', '2018-12-21 05:37:04'),
(576, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-22 00:22:27'),
(577, 12, NULL, 0x3139322e3136382e302e313130, 'sok-lida', '2018-12-22 01:56:09'),
(578, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-22 02:58:26'),
(579, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-22 09:14:57'),
(580, 12, NULL, 0x3139322e3136382e302e313130, 'sok-lida', '2018-12-24 01:25:17'),
(581, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-24 03:11:36'),
(582, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-24 07:56:26'),
(583, 12, NULL, 0x3139322e3136382e302e313130, 'sok-lida', '2018-12-25 01:10:18'),
(584, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-25 01:43:03'),
(585, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-25 06:23:38'),
(586, 12, NULL, 0x3139322e3136382e302e313130, 'sok-lida', '2018-12-25 08:59:29'),
(587, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-25 10:18:30'),
(588, 12, NULL, 0x3139322e3136382e302e313130, 'sok-lida', '2018-12-26 01:54:41'),
(589, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-26 04:00:38'),
(590, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-26 08:04:53'),
(591, 12, NULL, 0x3139322e3136382e302e313130, 'sok-lida', '2018-12-26 09:47:45'),
(592, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-27 00:50:23'),
(593, 12, NULL, 0x3139322e3136382e302e313130, 'sok-lida', '2018-12-27 01:35:36'),
(594, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-27 08:07:55'),
(595, 12, NULL, 0x3139322e3136382e302e313130, 'sok-lida', '2018-12-28 01:40:42'),
(596, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-28 05:00:50'),
(597, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-29 00:15:06'),
(598, 12, NULL, 0x3139322e3136382e302e313130, 'sok-lida', '2018-12-29 01:28:02'),
(599, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-29 06:23:50'),
(600, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2018-12-31 03:16:53'),
(601, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2019-01-01 03:31:47'),
(602, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2019-01-02 00:39:32'),
(603, 11, NULL, 0x3139322e3136382e302e313130, 'Sonito', '2019-01-02 04:29:54'),
(604, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2019-01-02 06:28:29'),
(605, 12, NULL, 0x3139322e3136382e302e313130, 'sok-lida', '2019-01-02 08:16:47'),
(606, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2019-01-02 09:45:33'),
(607, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2019-01-03 00:16:44'),
(608, 12, NULL, 0x3139322e3136382e302e313130, 'sok-lida', '2019-01-03 01:48:42'),
(609, 12, NULL, 0x3139322e3136382e302e313130, 'sok-lida', '2019-01-04 02:05:16'),
(610, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2019-01-04 02:31:41'),
(611, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2019-01-04 05:06:30'),
(612, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2019-01-04 07:51:57'),
(613, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2019-01-05 00:30:32'),
(614, 12, NULL, 0x3139322e3136382e302e313130, 'sok-lida', '2019-01-05 01:18:18'),
(615, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2019-01-05 02:47:21'),
(616, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2019-01-05 08:54:00'),
(617, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2019-01-05 11:23:56'),
(618, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2019-01-06 02:26:55'),
(619, 12, NULL, 0x3139322e3136382e302e313130, 'sok-lida', '2019-01-07 03:31:36'),
(620, 12, NULL, 0x3139322e3136382e302e313130, 'sok-lida', '2019-01-07 14:36:48'),
(621, 12, NULL, 0x3139322e3136382e302e313130, 'sok-lida', '2019-01-08 01:36:44'),
(622, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2019-01-08 03:22:56'),
(623, 12, NULL, 0x3139322e3136382e302e313130, 'sok-lida', '2019-01-08 08:19:02'),
(624, 12, NULL, 0x3139322e3136382e302e313130, 'sok-lida', '2019-01-09 01:33:12'),
(625, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2019-01-09 04:10:13'),
(626, 12, NULL, 0x3139322e3136382e302e313130, 'sok-lida', '2019-01-09 05:09:24'),
(627, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2019-01-09 09:19:49'),
(628, 12, NULL, 0x3139322e3136382e302e313130, 'sok-lida', '2019-01-10 01:10:29'),
(629, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2019-01-10 01:31:32'),
(630, 12, NULL, 0x3139322e3136382e302e313130, 'sok-lida', '2019-01-10 05:56:38'),
(631, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2019-01-10 08:35:28'),
(632, 12, NULL, 0x3139322e3136382e302e313130, 'sok-lida', '2019-01-11 01:17:35'),
(633, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2019-01-11 02:23:01'),
(634, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2019-01-11 06:27:26'),
(635, 12, NULL, 0x3139322e3136382e302e313130, 'sok-lida', '2019-01-11 08:15:02'),
(636, 12, NULL, 0x3139322e3136382e302e313130, 'sok-lida', '2019-01-11 11:03:49'),
(637, 12, NULL, 0x3139322e3136382e302e313130, 'sok-lida', '2019-01-12 01:28:52'),
(638, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2019-01-12 01:30:53'),
(639, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2019-01-12 04:30:41'),
(640, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2019-01-12 07:28:11'),
(641, 14, NULL, 0x3139322e3136382e302e313131, 'LGB-CEO', '2019-01-13 06:36:32'),
(642, 12, NULL, 0x3139322e3136382e302e313130, 'sok-lida', '2019-01-14 01:21:04'),
(643, 1, NULL, 0x3139322e3136382e302e313131, 'admin@855solution.com', '2019-01-14 06:06:01'),
(644, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-01-14 06:17:04'),
(645, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-01-15 01:17:05'),
(646, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-01-15 06:23:43'),
(647, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-01-16 01:07:34'),
(648, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-01-16 03:33:03'),
(649, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-01-17 03:50:00'),
(650, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-01-17 03:52:24'),
(651, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-03-19 02:22:55'),
(652, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-03-19 02:46:52'),
(653, 16, NULL, 0x3a3a31, 'sal_samnang', '2019-03-19 05:07:03');
INSERT INTO `sma_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(654, 16, NULL, 0x3a3a31, 'sal_samnang', '2019-03-19 05:09:52'),
(655, 17, NULL, 0x3a3a31, 'samnang', '2019-03-19 05:10:42'),
(656, 16, NULL, 0x3a3a31, 'sal_samnang', '2019-03-19 05:11:09'),
(657, 17, NULL, 0x3a3a31, 'samnang', '2019-03-19 05:12:43'),
(658, 16, NULL, 0x3a3a31, 'sal_samnang', '2019-03-19 05:15:17'),
(659, 16, NULL, 0x3a3a31, 'sal_samnang', '2019-02-10 07:09:29'),
(660, 17, NULL, 0x3a3a31, 'samnang', '2019-02-10 07:12:47'),
(661, 16, NULL, 0x3a3a31, 'sal_samnang', '2019-02-10 07:17:44'),
(662, 17, NULL, 0x3a3a31, 'samnang', '2019-02-10 07:18:24'),
(663, 16, NULL, 0x3a3a31, 'sal_samnang', '2019-02-10 08:16:02'),
(664, 17, NULL, 0x3a3a31, 'samnang', '2019-02-10 08:40:52'),
(665, 16, NULL, 0x3a3a31, 'sal_samnang', '2019-02-10 10:39:57'),
(666, 17, NULL, 0x3a3a31, 'samnang', '2019-02-10 13:41:05'),
(667, 16, NULL, 0x3a3a31, 'sal_samnang', '2019-02-10 13:41:53'),
(668, 16, NULL, 0x3a3a31, 'sal_samnang', '2019-02-10 20:50:24'),
(669, 16, NULL, 0x3a3a31, 'sal_samnang', '2019-02-10 23:43:53'),
(670, 16, NULL, 0x3a3a31, 'sal_samnang', '2019-02-11 00:42:59'),
(671, 17, NULL, 0x3a3a31, 'samnang', '2019-02-11 00:43:22'),
(672, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-02-11 02:58:56'),
(673, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-02-11 03:09:40'),
(674, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-02-11 03:11:29'),
(675, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-02-11 03:33:40'),
(676, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-02-12 18:19:29'),
(677, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-02-12 18:26:23'),
(678, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-02-12 23:39:55'),
(679, 16, NULL, 0x3a3a31, 'sal_samnang', '2019-02-13 02:40:11'),
(680, 16, NULL, 0x3a3a31, 'sal_samnang', '2019-02-13 03:07:47'),
(681, 16, NULL, 0x3a3a31, 'sal_samnang', '2019-02-13 10:15:58'),
(682, 16, NULL, 0x3a3a31, 'sal_samnang', '2019-02-13 10:54:50'),
(683, 17, NULL, 0x3a3a31, 'samnang', '2019-02-13 10:55:45'),
(684, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-02-13 15:21:39'),
(685, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-02-13 15:22:11'),
(686, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-05-09 16:04:42'),
(687, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-05-09 16:05:23'),
(688, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-05-11 01:07:05'),
(689, 16, NULL, 0x3a3a31, 'sal_samnang', '2019-05-11 01:40:56'),
(690, 17, NULL, 0x3a3a31, 'samnang', '2019-05-12 02:14:18'),
(691, 17, NULL, 0x3a3a31, 'samnang', '2019-05-21 19:01:13'),
(692, 17, NULL, 0x3a3a31, 'samnang', '2019-05-21 19:02:27'),
(693, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-05-21 19:03:02'),
(694, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-05-12 19:17:06'),
(695, 17, NULL, 0x3a3a31, 'samnang', '2019-05-12 19:25:50'),
(696, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-05-12 19:26:28'),
(697, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-05-12 19:27:03'),
(698, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-05-12 19:27:32'),
(699, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-05-23 01:36:09'),
(700, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-05-23 02:06:01'),
(701, 17, NULL, 0x3a3a31, 'samnang', '2019-05-23 09:05:13'),
(702, 16, NULL, 0x3a3a31, 'sal_samnang', '2019-05-23 09:10:47'),
(703, 16, NULL, 0x3a3a31, 'sal_samnang', '2019-05-24 01:58:32'),
(704, 16, NULL, 0x3a3a31, 'sal_samnang', '2019-05-24 07:09:27'),
(705, 16, NULL, 0x3a3a31, 'sal_samnang', '2019-05-24 07:23:56'),
(706, 17, NULL, 0x3a3a31, 'samnang', '2019-05-24 07:41:12'),
(707, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-05-25 10:05:10'),
(708, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-06-02 13:08:55'),
(709, 16, NULL, 0x3a3a31, 'sal_samnang', '2019-06-11 02:44:25'),
(710, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-06-12 02:05:24'),
(711, 16, NULL, 0x3a3a31, 'sal_samnang', '2019-06-15 02:10:34'),
(712, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-06-15 04:05:11'),
(713, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-06-17 02:32:59'),
(714, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-07-15 06:38:15'),
(715, 1, NULL, 0x34322e3131352e36362e3732, 'admin@855solution.com', '2019-07-15 07:47:00'),
(716, 1, NULL, 0x3137352e3130302e35302e3230, 'admin@855solution.com', '2019-07-15 08:43:36'),
(717, 1, NULL, 0x3131372e32302e3131332e3735, 'admin@855solution.com', '2019-07-16 07:34:34'),
(718, 1, NULL, 0x3137352e3130302e35302e3230, 'admin@855solution.com', '2019-07-18 03:32:31'),
(719, 1, NULL, 0x3137352e3130302e35302e3230, 'admin@855solution.com', '2019-07-18 08:20:17'),
(720, 21, NULL, 0x3137352e3130302e35302e3230, 'sreypy', '2019-07-18 08:45:09'),
(721, 1, NULL, 0x3137352e3130302e35302e3230, 'admin@855solution.com', '2019-07-18 09:02:05'),
(722, 1, NULL, 0x34322e3131352e36372e3833, 'admin@855solution.com', '2019-07-19 04:19:31'),
(723, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2019-07-20 03:46:46'),
(724, 1, NULL, 0x34322e3131352e36372e3833, 'admin@855solution.com', '2019-07-20 07:29:21'),
(725, 1, NULL, 0x34322e3131352e36372e3833, 'admin@855solution.com', '2019-07-22 03:30:56'),
(726, 1, NULL, 0x34322e3131352e32322e323035, 'admin@855solution.com', '2019-07-22 07:11:03'),
(727, 1, NULL, 0x3137352e3130302e35302e3238, 'admin@855solution.com', '2019-07-24 02:29:02'),
(728, 1, NULL, 0x3137352e3130302e35302e3238, 'admin@855solution.com', '2019-07-24 03:35:53'),
(729, 1, NULL, 0x3137352e3130302e35302e3238, 'admin@855solution.com', '2019-07-24 03:53:17'),
(730, 1, NULL, 0x3137352e3130302e35302e3238, 'admin@855solution.com', '2019-07-24 04:06:28'),
(731, 21, NULL, 0x3137352e3130302e35302e3238, 'sreypy', '2019-07-24 04:19:49'),
(732, 1, NULL, 0x3137352e3130302e35302e3238, 'admin@855solution.com', '2019-07-24 04:37:39'),
(733, 21, NULL, 0x3137352e3130302e35302e3238, 'sreypy', '2019-07-24 04:56:14'),
(734, 1, NULL, 0x3137352e3130302e35302e3238, 'admin@855solution.com', '2019-07-24 06:12:23'),
(735, 18, NULL, 0x3137352e3130302e35302e3238, 'hongdavy', '2019-07-24 06:13:31'),
(736, 20, NULL, 0x3137352e3130302e35302e3238, 'chanthy', '2019-07-24 08:28:23'),
(737, 18, NULL, 0x3137352e3130302e35302e3238, 'hongdavy', '2019-07-24 08:54:45'),
(738, 1, NULL, 0x34322e3131352e32322e3633, 'admin@855solution.com', '2019-07-24 09:27:26'),
(739, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-01 02:35:42'),
(740, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-01 03:54:45'),
(741, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-01 03:57:01'),
(742, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-01 04:42:14'),
(743, 1, NULL, 0x3137352e3130302e35302e3136, 'admin@855solution.com', '2019-08-01 06:54:21'),
(744, 1, NULL, 0x3137352e3130302e35302e3136, 'admin@855solution.com', '2019-08-01 07:10:14'),
(745, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-02 02:53:40'),
(746, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-02 07:15:10'),
(747, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-02 07:31:50'),
(748, 20, NULL, 0x3137352e3130302e35302e3136, 'chanthy', '2019-08-02 07:53:24'),
(749, 20, NULL, 0x3137352e3130302e35302e3136, 'chanthy', '2019-08-02 08:03:28'),
(750, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-02 16:07:02'),
(751, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-03 02:46:38'),
(752, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-03 03:03:24'),
(753, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-03 06:22:59'),
(754, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-05 05:22:40'),
(755, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-05 12:56:19'),
(756, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-05 13:20:04'),
(757, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-06 00:31:48'),
(758, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-06 00:32:22'),
(759, 1, NULL, 0x34322e3131352e32352e3736, 'admin@855solution.com', '2019-08-06 02:20:33'),
(760, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-07 07:05:32'),
(761, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-08 02:22:54'),
(762, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-08 03:15:45'),
(763, 1, NULL, 0x34322e3131352e32352e3736, 'admin@855solution.com', '2019-08-08 03:21:41'),
(764, 19, NULL, 0x3131372e32302e3131352e313538, 'himsavin', '2019-08-09 02:06:46'),
(765, 19, NULL, 0x3131372e32302e3131352e313538, 'himsavin', '2019-08-09 02:31:15'),
(766, 19, NULL, 0x3137352e3130302e35302e3230, 'himsavin', '2019-08-09 09:15:04'),
(767, 1, NULL, 0x34322e3131352e32342e323337, 'admin@855solution.com', '2019-08-09 10:37:12'),
(768, 1, NULL, 0x34322e3131352e32342e323337, 'admin@855solution.com', '2019-08-09 10:40:36'),
(769, 19, NULL, 0x3137352e3130302e35302e3230, 'himsavin', '2019-08-09 12:37:50'),
(770, 19, NULL, 0x3137352e3130302e35302e3230, 'himsavin', '2019-08-09 13:38:35'),
(771, 19, NULL, 0x3137352e3130302e35302e3230, 'himsavin', '2019-08-10 00:13:40'),
(772, 19, NULL, 0x3137352e3130302e35302e3230, 'himsavin', '2019-08-10 00:31:06'),
(773, 19, NULL, 0x3137352e3130302e35302e3230, 'himsavin', '2019-08-10 03:58:14'),
(774, 19, NULL, 0x3137352e3130302e35302e3230, 'himsavin', '2019-08-10 09:33:26'),
(775, 19, NULL, 0x3137352e3130302e35302e3137, 'himsavin', '2019-08-11 01:41:21'),
(776, 19, NULL, 0x3137352e3130302e35302e3137, 'himsavin', '2019-08-11 01:44:11'),
(777, 19, NULL, 0x3137352e3130302e35302e3137, 'himsavin', '2019-08-11 06:29:22'),
(778, 19, NULL, 0x3137352e3130302e35302e3137, 'himsavin', '2019-08-11 06:52:09'),
(779, 19, NULL, 0x3137352e3130302e35302e3137, 'himsavin', '2019-08-11 11:11:51'),
(780, 19, NULL, 0x3137352e3130302e35302e3137, 'himsavin', '2019-08-11 15:17:00'),
(781, 19, NULL, 0x3137352e3130302e35302e3137, 'himsavin', '2019-08-12 00:20:02'),
(782, 19, NULL, 0x3137352e3130302e35302e3137, 'himsavin', '2019-08-12 00:22:07'),
(783, 19, NULL, 0x3137352e3130302e35302e3137, 'himsavin', '2019-08-12 03:58:01'),
(784, 19, NULL, 0x3137352e3130302e35302e3137, 'himsavin', '2019-08-12 07:22:31'),
(785, 19, NULL, 0x3137352e3130302e35302e3137, 'himsavin', '2019-08-13 01:02:14'),
(786, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-13 04:31:10'),
(787, 1, NULL, 0x34322e3131352e32342e3437, 'admin@855solution.com', '2019-08-13 05:06:06'),
(788, 1, NULL, 0x34322e3131352e32342e3437, 'admin@855solution.com', '2019-08-13 07:25:01'),
(789, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-13 10:23:55'),
(790, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-13 13:05:31'),
(791, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-14 00:44:25'),
(792, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-14 01:59:23'),
(793, 20, NULL, 0x3137352e3130302e35302e3136, 'chanthy', '2019-08-14 05:25:10'),
(794, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-14 15:02:01'),
(795, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-15 03:54:47'),
(796, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-15 07:18:45'),
(797, 20, NULL, 0x3137352e3130302e35302e3136, 'chanthy', '2019-08-16 03:37:51'),
(798, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-16 06:37:48'),
(799, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-16 12:10:48'),
(800, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-17 03:47:54'),
(801, 20, NULL, 0x3137352e3130302e35302e3136, 'chanthy', '2019-08-17 11:04:01'),
(802, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-17 13:46:47'),
(803, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-18 00:59:44'),
(804, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-18 03:56:46'),
(805, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-18 14:00:26'),
(806, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-19 05:14:45'),
(807, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-19 09:29:17'),
(808, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-19 13:23:12'),
(809, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-20 03:50:37'),
(810, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-20 07:07:01'),
(811, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-21 10:52:16'),
(812, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-22 05:03:43'),
(813, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-22 11:10:44'),
(814, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-23 03:24:58'),
(815, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-23 12:41:49'),
(816, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-24 01:10:11'),
(817, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-24 06:35:30'),
(818, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-24 09:50:02'),
(819, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-25 00:42:59'),
(820, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-25 09:38:56'),
(821, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-26 02:27:34'),
(822, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-26 05:30:49'),
(823, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-27 01:41:12'),
(824, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-27 04:53:28'),
(825, 20, NULL, 0x3137352e3130302e35302e3136, 'chanthy', '2019-08-27 23:33:56'),
(826, 20, NULL, 0x3137352e3130302e35302e3136, 'chanthy', '2019-08-28 00:36:34'),
(827, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-28 02:36:11'),
(828, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-28 04:44:41'),
(829, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-28 23:58:07'),
(830, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-29 11:12:54'),
(831, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-30 12:29:40'),
(832, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-31 03:51:26'),
(833, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-31 08:44:32'),
(834, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-08-31 12:43:23'),
(835, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-01 11:19:13'),
(836, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-01 16:05:00'),
(837, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-02 03:52:37'),
(838, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-02 09:03:15'),
(839, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-02 13:08:15'),
(840, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-03 09:53:32'),
(841, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-03 15:02:52'),
(842, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-04 00:14:27'),
(843, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-04 01:12:40'),
(844, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-04 05:34:33'),
(845, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-04 13:51:23'),
(846, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-05 06:08:10'),
(847, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-05 07:25:17'),
(848, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-05 13:11:20'),
(849, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-06 01:12:55'),
(850, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-06 01:51:57'),
(851, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-07 02:30:06'),
(852, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-07 10:44:56'),
(853, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-08 00:32:08'),
(854, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-08 04:45:00'),
(855, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-08 11:48:28'),
(856, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-09 00:06:44'),
(857, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-09 01:48:48'),
(858, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-09 07:47:57'),
(859, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-09 08:59:13'),
(860, 1, NULL, 0x34322e3131352e36362e313030, 'admin@855solution.com', '2019-09-09 09:21:02'),
(861, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-10 01:42:54'),
(862, 18, NULL, 0x3137352e3130302e35302e3136, 'hongdavy', '2019-09-10 02:16:56'),
(863, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-10 02:30:19'),
(864, 1, NULL, 0x34322e3131352e36362e313030, 'admin@855solution.com', '2019-09-10 03:58:19'),
(865, 1, NULL, 0x34322e3131352e36362e313030, 'admin@855solution.com', '2019-09-10 03:58:19'),
(866, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-10 05:48:21'),
(867, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-10 05:55:38'),
(868, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-10 23:35:06'),
(869, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-11 01:36:15'),
(870, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-11 05:04:14'),
(871, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-11 08:49:38'),
(872, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-12 00:40:39'),
(873, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-12 05:08:01'),
(874, 18, NULL, 0x33362e33372e3233322e313134, 'hongdavy', '2019-09-12 05:28:48'),
(875, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-13 02:28:30'),
(876, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-13 08:31:44'),
(877, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-14 01:52:38'),
(878, 18, NULL, 0x3137352e3130302e35302e3136, 'hongdavy', '2019-09-14 03:36:15'),
(879, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-14 12:55:53'),
(880, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-15 11:45:34'),
(881, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-15 14:53:19'),
(882, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-16 14:20:08'),
(883, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-17 00:41:36'),
(884, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-09-17 00:50:49'),
(885, 19, NULL, 0x3137352e3130302e35302e3330, 'himsavin', '2019-09-18 00:48:18'),
(886, 19, NULL, 0x3137352e3130302e35302e3330, 'himsavin', '2019-09-18 03:24:39'),
(887, 19, NULL, 0x3137352e3130302e35302e3230, 'himsavin', '2019-09-18 15:35:46'),
(888, 19, NULL, 0x3137352e3130302e35302e3230, 'himsavin', '2019-09-19 03:40:28'),
(889, 19, NULL, 0x3137352e3130302e35302e3230, 'himsavin', '2019-09-19 09:30:02'),
(890, 19, NULL, 0x3137352e3130302e35302e3230, 'himsavin', '2019-09-19 11:52:49'),
(891, 19, NULL, 0x3137352e3130302e35302e3230, 'himsavin', '2019-09-19 17:36:15'),
(892, 19, NULL, 0x3137352e3130302e35302e3230, 'himsavin', '2019-09-20 00:59:21'),
(893, 19, NULL, 0x3137352e3130302e35302e3230, 'himsavin', '2019-09-20 09:08:57'),
(894, 19, NULL, 0x3137352e3130302e35302e3230, 'himsavin', '2019-09-20 12:19:32'),
(895, 19, NULL, 0x3137352e3130302e35302e3230, 'himsavin', '2019-09-21 09:25:18'),
(896, 19, NULL, 0x3137352e3130302e35302e3230, 'himsavin', '2019-09-21 10:08:39'),
(897, 19, NULL, 0x3137352e3130302e35302e3230, 'himsavin', '2019-09-21 13:00:08'),
(898, 19, NULL, 0x3137352e3130302e35302e3230, 'himsavin', '2019-09-22 02:33:35'),
(899, 19, NULL, 0x3137352e3130302e35302e3230, 'himsavin', '2019-09-22 02:36:24'),
(900, 19, NULL, 0x3137352e3130302e35302e3230, 'himsavin', '2019-09-22 08:26:06'),
(901, 19, NULL, 0x3137352e3130302e35302e3230, 'himsavin', '2019-09-22 08:38:12'),
(902, 18, NULL, 0x3137352e3130302e35302e3230, 'hongdavy', '2019-09-22 10:16:01'),
(903, 19, NULL, 0x3137352e3130302e35302e3235, 'himsavin', '2019-09-23 01:16:11'),
(904, 19, NULL, 0x3137352e3130302e35302e3235, 'himsavin', '2019-09-24 06:04:18'),
(905, 19, NULL, 0x3137352e3130302e35302e3235, 'himsavin', '2019-09-24 13:52:49'),
(906, 19, NULL, 0x3137352e3130302e35302e3235, 'himsavin', '2019-09-24 23:21:44'),
(907, 19, NULL, 0x3137352e3130302e35302e3235, 'himsavin', '2019-09-25 13:43:06'),
(908, 19, NULL, 0x3137352e3130302e35302e3235, 'himsavin', '2019-09-25 23:09:17'),
(909, 19, NULL, 0x3137352e3130302e35302e3235, 'himsavin', '2019-09-26 01:33:37'),
(910, 19, NULL, 0x3137352e3130302e35302e3235, 'himsavin', '2019-09-26 06:25:11'),
(911, 19, NULL, 0x3137352e3130302e35302e3235, 'himsavin', '2019-09-30 05:34:15'),
(912, 19, NULL, 0x3137352e3130302e35302e3234, 'himsavin', '2019-10-01 04:12:39'),
(913, 19, NULL, 0x3137352e3130302e35302e3234, 'himsavin', '2019-10-01 08:25:50'),
(914, 19, NULL, 0x3137352e3130302e35302e3234, 'himsavin', '2019-10-01 12:55:27'),
(915, 19, NULL, 0x3137352e3130302e35302e3234, 'himsavin', '2019-10-02 00:28:39'),
(916, 19, NULL, 0x3137352e3130302e35302e3234, 'himsavin', '2019-10-02 06:59:43'),
(917, 19, NULL, 0x3137352e3130302e35302e3234, 'himsavin', '2019-10-02 11:05:40'),
(918, 19, NULL, 0x3137352e3130302e35302e3331, 'himsavin', '2019-10-03 03:45:33'),
(919, 19, NULL, 0x3137352e3130302e35302e3331, 'himsavin', '2019-10-03 08:46:42'),
(920, 19, NULL, 0x3137352e3130302e35302e3331, 'himsavin', '2019-10-03 16:15:14'),
(921, 19, NULL, 0x3137352e3130302e35302e3331, 'himsavin', '2019-10-04 01:27:17'),
(922, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-10-04 06:34:51'),
(923, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-10-04 10:18:56'),
(924, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-10-04 13:07:22'),
(925, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-10-05 02:05:24'),
(926, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-10-05 06:05:56'),
(927, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-10-05 13:13:33'),
(928, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-10-06 02:21:46'),
(929, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-10-06 08:44:48'),
(930, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-10-06 13:04:20'),
(931, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-10-07 05:36:01'),
(932, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-10-07 08:24:32'),
(933, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-10-08 01:20:45'),
(934, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-10-08 03:29:05'),
(935, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-10-08 07:29:49'),
(936, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-10-08 10:47:41'),
(937, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-10-08 13:01:18'),
(938, 19, NULL, 0x3137352e3130302e35302e3330, 'himsavin', '2019-10-08 16:24:17'),
(939, 19, NULL, 0x3137352e3130302e35302e3330, 'himsavin', '2019-10-09 04:09:28'),
(940, 19, NULL, 0x3137352e3130302e35302e3330, 'himsavin', '2019-10-09 09:08:51'),
(941, 19, NULL, 0x3137352e3130302e35302e3330, 'himsavin', '2019-10-10 12:39:29'),
(942, 19, NULL, 0x3137352e3130302e35302e3330, 'himsavin', '2019-10-11 05:28:03'),
(943, 19, NULL, 0x3137352e3130302e35302e3330, 'himsavin', '2019-10-11 10:07:37'),
(944, 19, NULL, 0x3137352e3130302e35302e3330, 'himsavin', '2019-10-11 13:07:10'),
(945, 19, NULL, 0x3137352e3130302e35302e3330, 'himsavin', '2019-10-12 03:54:38'),
(946, 19, NULL, 0x3137352e3130302e35302e3330, 'himsavin', '2019-10-12 06:44:34'),
(947, 19, NULL, 0x3137352e3130302e35302e3330, 'himsavin', '2019-10-12 09:03:41'),
(948, 19, NULL, 0x3137352e3130302e35302e3330, 'himsavin', '2019-10-13 02:38:02'),
(949, 19, NULL, 0x3137352e3130302e35302e3330, 'himsavin', '2019-10-13 04:53:15'),
(950, 19, NULL, 0x3137352e3130302e35302e3330, 'himsavin', '2019-10-13 12:37:27'),
(951, 19, NULL, 0x3137352e3130302e35302e3330, 'himsavin', '2019-10-14 13:58:59'),
(952, 19, NULL, 0x3137352e3130302e35302e3330, 'himsavin', '2019-10-15 01:48:30'),
(953, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-10-16 02:46:08'),
(954, 20, NULL, 0x3137352e3130302e35302e3236, 'Chanthy', '2019-10-16 10:23:07'),
(955, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-10-16 18:02:17'),
(956, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-10-19 07:59:16'),
(957, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-10-19 12:37:22'),
(958, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-10-20 00:17:02'),
(959, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-10-20 07:50:43'),
(960, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-10-20 13:07:33'),
(961, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-10-21 13:24:37'),
(962, 20, NULL, 0x3137352e3130302e35302e3236, 'Chanthy', '2019-10-22 09:59:21'),
(963, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-10-22 14:18:02'),
(964, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-10-23 05:12:54'),
(965, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-10-24 12:57:42'),
(966, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-10-24 13:28:56'),
(967, 19, NULL, 0x3137352e3130302e35302e3239, 'himsavin', '2019-10-24 23:44:05'),
(968, 19, NULL, 0x3137352e3130302e35302e3239, 'himsavin', '2019-10-24 23:53:56'),
(969, 19, NULL, 0x3137352e3130302e35302e3239, 'himsavin', '2019-10-25 03:09:48'),
(970, 19, NULL, 0x3137352e3130302e35302e3239, 'himsavin', '2019-10-25 03:10:12'),
(971, 20, NULL, 0x3137352e3130302e35302e3239, 'Chanthy', '2019-10-25 08:30:04'),
(972, 20, NULL, 0x3137352e3130302e35302e3239, 'Chanthy', '2019-10-25 10:51:21'),
(973, 19, NULL, 0x3137352e3130302e35302e3239, 'himsavin', '2019-10-25 13:24:32'),
(974, 20, NULL, 0x3137352e3130302e35302e3239, 'Chanthy', '2019-10-26 01:30:16'),
(975, 20, NULL, 0x3137352e3130302e35302e3239, 'Chanthy', '2019-10-26 09:06:44'),
(976, 19, NULL, 0x3137352e3130302e35302e3239, 'himsavin', '2019-10-27 01:40:42'),
(977, 19, NULL, 0x3137352e3130302e35302e3239, 'himsavin', '2019-10-27 01:45:08'),
(978, 19, NULL, 0x3137352e3130302e35302e3239, 'himsavin', '2019-10-27 08:26:08'),
(979, 19, NULL, 0x3137352e3130302e35302e3239, 'himsavin', '2019-10-28 00:10:35'),
(980, 20, NULL, 0x3137352e3130302e35302e3239, 'Chanthy', '2019-10-28 05:05:31'),
(981, 20, NULL, 0x3137352e3130302e35302e3239, 'Chanthy', '2019-10-28 10:54:03'),
(982, 19, NULL, 0x3137352e3130302e35302e3239, 'himsavin', '2019-10-28 15:08:49'),
(983, 19, NULL, 0x3137352e3130302e35302e3239, 'himsavin', '2019-10-29 01:14:22'),
(984, 20, NULL, 0x3137352e3130302e35302e3139, 'Chanthy', '2019-10-29 12:30:47'),
(985, 20, NULL, 0x3137352e3130302e35302e3239, 'Chanthy', '2019-10-29 17:55:35'),
(986, 20, NULL, 0x3137352e3130302e35302e3239, 'Chanthy', '2019-10-30 13:25:58'),
(987, 20, NULL, 0x3137352e3130302e35302e3239, 'Chanthy', '2019-10-31 00:37:28'),
(988, 20, NULL, 0x3137352e3130302e35302e3239, 'Chanthy', '2019-10-31 04:14:35'),
(989, 20, NULL, 0x3137352e3130302e35302e3239, 'Chanthy', '2019-10-31 14:28:44'),
(990, 20, NULL, 0x3137352e3130302e35302e3239, 'Chanthy', '2019-11-01 08:25:53'),
(991, 19, NULL, 0x3137352e3130302e35302e3239, 'himsavin', '2019-11-01 15:49:56'),
(992, 19, NULL, 0x3137352e3130302e35302e3239, 'himsavin', '2019-11-02 00:50:55'),
(993, 19, NULL, 0x3137352e3130302e35302e3239, 'himsavin', '2019-11-02 14:00:14'),
(994, 20, NULL, 0x3137352e3130302e35302e3239, 'Chanthy', '2019-11-03 05:01:36'),
(995, 20, NULL, 0x3137352e3130302e35302e3239, 'Chanthy', '2019-11-03 07:52:01'),
(996, 19, NULL, 0x3137352e3130302e35302e3231, 'himsavin', '2019-11-04 14:59:36'),
(997, 19, NULL, 0x3137352e3130302e35302e3231, 'himsavin', '2019-11-05 03:29:49'),
(998, 19, NULL, 0x3137352e3130302e35302e3231, 'himsavin', '2019-11-05 17:11:17'),
(999, 20, NULL, 0x3137352e3130302e35302e3231, 'Chanthy', '2019-11-06 11:18:33'),
(1000, 19, NULL, 0x3137352e3130302e35302e3231, 'himsavin', '2019-11-07 11:16:08'),
(1001, 19, NULL, 0x3137352e3130302e35302e3231, 'himsavin', '2019-11-08 00:09:11'),
(1002, 20, NULL, 0x3137352e3130302e35302e3231, 'Chanthy', '2019-11-08 09:14:11'),
(1003, 20, NULL, 0x3137352e3130302e35302e3231, 'Chanthy', '2019-11-08 13:37:23'),
(1004, 20, NULL, 0x3137352e3130302e35302e3231, 'Chanthy', '2019-11-09 04:53:09'),
(1005, 20, NULL, 0x3137352e3130302e35302e3231, 'Chanthy', '2019-11-09 16:04:22'),
(1006, 20, NULL, 0x3137352e3130302e35302e3231, 'Chanthy', '2019-11-10 11:51:52'),
(1007, 20, NULL, 0x3137352e3130302e35302e3231, 'Chanthy', '2019-11-11 01:26:54'),
(1008, 20, NULL, 0x3137352e3130302e35302e3231, 'Chanthy', '2019-11-11 09:20:03'),
(1009, 20, NULL, 0x3137352e3130302e35302e3231, 'Chanthy', '2019-11-11 11:23:44'),
(1010, 20, NULL, 0x3137352e3130302e35302e3231, 'Chanthy', '2019-11-12 03:31:44'),
(1011, 20, NULL, 0x3137352e3130302e35302e3230, 'Chanthy', '2019-11-13 03:04:47'),
(1012, 20, NULL, 0x3137352e3130302e35302e3230, 'Chanthy', '2019-11-13 14:26:00'),
(1013, 20, NULL, 0x3137352e3130302e35302e3139, 'chanthy', '2019-11-14 09:23:27'),
(1014, 20, NULL, 0x3137352e3130302e35302e3139, 'Chanthy', '2019-11-14 13:24:36'),
(1015, 20, NULL, 0x3137352e3130302e35302e3137, 'Chanthy', '2019-11-15 03:33:48'),
(1016, 20, NULL, 0x3137352e3130302e35302e3137, 'Chanthy', '2019-11-16 11:36:46'),
(1017, 20, NULL, 0x3137352e3130302e35302e3238, 'Chanthy', '2019-11-17 11:27:56'),
(1018, 20, NULL, 0x3137352e3130302e35302e3238, 'Chanthy', '2019-11-18 05:43:05'),
(1019, 20, NULL, 0x3137352e3130302e35302e3238, 'Chanthy', '2019-11-18 10:44:49'),
(1020, 20, NULL, 0x3137352e3130302e35302e3238, 'Chanthy', '2019-11-19 05:15:54'),
(1021, 20, NULL, 0x3137352e3130302e35302e3238, 'Chanthy', '2019-11-19 08:55:50'),
(1022, 20, NULL, 0x3137352e3130302e35302e3238, 'Chanthy', '2019-11-19 11:46:33'),
(1023, 20, NULL, 0x3137352e3130302e35302e3238, 'Chanthy', '2019-11-20 05:04:23'),
(1024, 20, NULL, 0x3137352e3130302e35302e3238, 'Chanthy', '2019-11-20 11:03:50'),
(1025, 20, NULL, 0x3137352e3130302e35302e3233, 'Chanthy', '2019-11-21 09:29:01'),
(1026, 20, NULL, 0x3137352e3130302e35302e3233, 'Chanthy', '2019-11-22 03:29:30'),
(1027, 20, NULL, 0x3137352e3130302e35302e3233, 'Chanthy', '2019-11-22 07:11:52'),
(1028, 20, NULL, 0x3137352e3130302e35302e3136, 'Chanthy', '2019-11-23 01:02:55'),
(1029, 20, NULL, 0x3137352e3130302e35302e3136, 'Chanthy', '2019-11-23 08:41:10'),
(1030, 20, NULL, 0x3137352e3130302e35302e3136, 'Chanthy', '2019-11-23 11:27:28'),
(1031, 20, NULL, 0x3137352e3130302e35302e3238, 'Chanthy', '2019-11-24 09:36:25'),
(1032, 20, NULL, 0x3137352e3130302e35302e3138, 'Chanthy', '2019-11-25 07:28:53'),
(1033, 20, NULL, 0x3137352e3130302e35302e3138, 'Chanthy', '2019-11-25 11:13:18'),
(1034, 20, NULL, 0x3137352e3130302e35302e3233, 'Chanthy', '2019-11-26 13:28:43'),
(1035, 20, NULL, 0x3137352e3130302e35302e3233, 'Chanthy', '2019-11-27 09:54:46'),
(1036, 20, NULL, 0x3137352e3130302e35302e3139, 'Chanthy', '2019-11-28 12:54:19'),
(1037, 19, NULL, 0x3137352e3130302e35302e3139, 'himsavin', '2019-11-28 13:03:07'),
(1038, 20, NULL, 0x3137352e3130302e35302e3139, 'Chanthy', '2019-11-28 13:03:27'),
(1039, 20, NULL, 0x3137352e3130302e35302e3137, 'Chanthy', '2019-11-29 13:13:27'),
(1040, 18, NULL, 0x3137352e3130302e35302e3137, 'hongdavy', '2019-11-29 14:54:05'),
(1041, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-11-30 04:01:00'),
(1042, 20, NULL, 0x3137352e3130302e35302e3136, 'Chanthy', '2019-11-30 04:10:09'),
(1043, 19, NULL, 0x3137352e3130302e35302e3136, 'himsavin', '2019-11-30 07:18:14'),
(1044, 20, NULL, 0x3137352e3130302e35302e3136, 'Chanthy', '2019-11-30 07:26:53'),
(1045, 20, NULL, 0x3137352e3130302e35302e3136, 'Chanthy', '2019-11-30 12:15:06'),
(1046, 20, NULL, 0x3137352e3130302e35302e3235, 'Chanthy', '2019-12-01 04:21:49'),
(1047, 20, NULL, 0x3137352e3130302e35302e3237, 'Chanthy', '2019-12-02 00:34:55'),
(1048, 20, NULL, 0x3137352e3130302e35302e3237, 'Chanthy', '2019-12-02 04:35:58'),
(1049, 20, NULL, 0x3137352e3130302e35302e3233, 'Chanthy', '2019-12-02 09:17:11'),
(1050, 20, NULL, 0x3137352e3130302e35302e3139, 'Chanthy', '2019-12-03 05:19:07'),
(1051, 1, NULL, 0x3137352e3130302e35302e3139, 'admin@855solution.com', '2019-12-03 06:34:22'),
(1052, 1, NULL, 0x3137352e3130302e35302e3139, 'admin@855solution.com', '2019-12-03 06:38:46'),
(1053, 1, NULL, 0x3137352e3130302e35302e3139, 'admin@855solution.com', '2019-12-03 08:32:06'),
(1054, 1, NULL, 0x3137352e3130302e35302e3139, 'admin@855solution.com', '2019-12-03 08:34:58'),
(1055, 22, NULL, 0x3137352e3130302e35302e3139, 'tabluch', '2019-12-03 09:10:25'),
(1056, 1, NULL, 0x3137352e3130302e35302e3139, 'admin@855solution.com', '2019-12-03 09:11:32'),
(1057, 23, NULL, 0x3137352e3130302e35302e3139, 'chinsomphors', '2019-12-03 10:04:46'),
(1058, 23, NULL, 0x3137352e3130302e35302e3139, 'chinsomphors', '2019-12-03 10:37:32'),
(1059, 23, NULL, 0x3137352e3130302e35302e3139, 'chinsomphors', '2019-12-03 10:54:56'),
(1060, 23, NULL, 0x3137352e3130302e35302e3139, 'chinsomphors', '2019-12-03 12:00:51'),
(1061, 23, NULL, 0x3137352e3130302e35302e3139, 'chinsomphors', '2019-12-04 05:57:21'),
(1062, 23, NULL, 0x3137352e3130302e35302e3139, 'chinsomphors', '2019-12-04 09:30:05'),
(1063, 23, NULL, 0x3137352e3130302e35302e3139, 'chinsomphors', '2019-12-04 10:53:50'),
(1064, 23, NULL, 0x3137352e3130302e35302e3139, 'chinsomphors', '2019-12-04 11:10:54'),
(1065, 23, NULL, 0x3137352e3130302e35302e3139, 'chinsomphors', '2019-12-04 12:35:11'),
(1066, 23, NULL, 0x3137352e3130302e35302e3139, 'chinsomphors', '2019-12-04 12:50:44'),
(1067, 23, NULL, 0x3137352e3130302e35302e3139, 'chinsomphors', '2019-12-05 06:43:57'),
(1068, 23, NULL, 0x3137352e3130302e35302e3139, 'chinsomphors', '2019-12-05 11:03:55'),
(1069, 23, NULL, 0x3137352e3130302e35302e3139, 'chinsomphors', '2019-12-05 12:33:48'),
(1070, 18, NULL, 0x3137352e3130302e35302e3139, 'hongdavy', '2019-12-06 04:44:14'),
(1071, 23, NULL, 0x3137352e3130302e35302e3139, 'chinsomphors', '2019-12-06 07:40:23'),
(1072, 23, NULL, 0x3137352e3130302e35302e3139, 'Chinsomphors', '2019-12-06 08:03:13'),
(1073, 24, NULL, 0x3137352e3130302e35302e3139, 'lin keavuth', '2019-12-06 08:11:57'),
(1074, 24, NULL, 0x3137352e3130302e35302e3139, 'lin Keavuth', '2019-12-06 09:49:37'),
(1075, 23, NULL, 0x3137352e3130302e35302e3139, 'chinsomphors', '2019-12-06 10:13:00'),
(1076, 24, NULL, 0x3137352e3130302e35302e3139, 'lin Keavuth', '2019-12-06 10:41:07'),
(1077, 23, NULL, 0x3137352e3130302e35302e3139, 'chinsomphors', '2019-12-06 10:53:09'),
(1078, 23, NULL, 0x3137352e3130302e35302e3139, 'chinsomphors', '2019-12-06 11:45:48'),
(1079, 23, NULL, 0x3137352e3130302e35302e3139, 'chinsomphors', '2019-12-06 12:22:56'),
(1080, 23, NULL, 0x3137352e3130302e35302e3139, 'chinsomphors', '2019-12-06 12:28:52'),
(1081, 24, NULL, 0x3137352e3130302e35302e3236, 'lin keavuth', '2019-12-07 03:28:39'),
(1082, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-12-07 04:56:44'),
(1083, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-12-07 10:40:42'),
(1084, 24, NULL, 0x3137352e3130302e35302e3236, 'lin keavuth', '2019-12-07 11:52:18'),
(1085, 24, NULL, 0x3137352e3130302e35302e3236, 'lin keavuth', '2019-12-07 11:55:15'),
(1086, 24, NULL, 0x3137352e3130302e35302e3236, 'lin keavuth', '2019-12-07 12:46:12'),
(1087, 24, NULL, 0x3137352e3130302e35302e3236, 'lin Keavuth', '2019-12-07 13:00:11'),
(1088, 24, NULL, 0x3137352e3130302e35302e3236, 'lin keavuth', '2019-12-07 13:20:42'),
(1089, 24, NULL, 0x3137352e3130302e35302e3236, 'lin keavuth', '2019-12-08 01:08:03'),
(1090, 24, NULL, 0x3137352e3130302e35302e3236, 'lin keavuth', '2019-12-08 01:10:51'),
(1091, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-12-08 01:21:02'),
(1092, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-12-08 01:51:04'),
(1093, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-12-08 04:09:28'),
(1094, 23, NULL, 0x3137352e3130302e35302e3236, 'chinsomphors', '2019-12-08 07:09:53'),
(1095, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-12-08 09:43:40'),
(1096, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-12-08 09:50:59'),
(1097, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-12-08 09:52:14'),
(1098, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-12-08 10:03:34'),
(1099, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-12-08 10:06:56'),
(1100, 24, NULL, 0x3137352e3130302e35302e3236, 'lin Keavuth', '2019-12-08 11:05:18'),
(1101, 24, NULL, 0x3137352e3130302e35302e3236, 'lin keavuth', '2019-12-08 12:49:01'),
(1102, 24, NULL, 0x3137352e3130302e35302e3236, 'lin keavuth', '2019-12-09 05:02:48'),
(1103, 24, NULL, 0x3137352e3130302e35302e3236, 'lin Keavuth', '2019-12-09 05:43:53'),
(1104, 24, NULL, 0x3137352e3130302e35302e3236, 'lin keavuth', '2019-12-09 07:44:53'),
(1105, 24, NULL, 0x3137352e3130302e35302e3236, 'lin Keavuth', '2019-12-09 09:25:31'),
(1106, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-12-09 10:55:29'),
(1107, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-12-09 11:04:29'),
(1108, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-12-09 11:06:59'),
(1109, 24, NULL, 0x3137352e3130302e35302e3236, 'lin keavuth', '2019-12-09 11:18:12'),
(1110, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-12-09 12:09:50'),
(1111, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-12-09 12:36:06'),
(1112, 1, NULL, 0x34322e3131352e34312e313635, 'admin@855solution.com', '2019-12-09 12:43:14'),
(1113, 24, NULL, 0x3137352e3130302e35302e3236, 'lin Keavuth', '2019-12-10 08:29:38'),
(1114, 23, NULL, 0x3137352e3130302e35302e3236, 'chinsomphors', '2019-12-10 11:39:58'),
(1115, 23, NULL, 0x3137352e3130302e35302e3236, 'chinsomphors', '2019-12-10 12:10:35'),
(1116, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-12-10 12:38:52'),
(1117, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-12-11 08:19:13'),
(1118, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-12-11 08:20:19'),
(1119, 24, NULL, 0x3137352e3130302e35302e3236, 'lin Keavuth', '2019-12-11 10:06:43'),
(1120, 24, NULL, 0x3137352e3130302e35302e3236, 'lin keavuth', '2019-12-12 00:25:28'),
(1121, 24, NULL, 0x3137352e3130302e35302e3236, 'lin keavuth', '2019-12-12 02:41:51'),
(1122, 24, NULL, 0x3137352e3130302e35302e3236, 'lin keavuth', '2019-12-12 05:52:15'),
(1123, 24, NULL, 0x3137352e3130302e35302e3236, 'lin keavuth', '2019-12-12 05:56:25'),
(1124, 24, NULL, 0x3137352e3130302e35302e3236, 'lin keavuth', '2019-12-12 08:52:53'),
(1125, 23, NULL, 0x3137352e3130302e35302e3236, 'chinsomphors', '2019-12-12 10:14:21'),
(1126, 23, NULL, 0x3137352e3130302e35302e3236, 'chinsomphors', '2019-12-12 11:01:37'),
(1127, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-12-12 11:08:20'),
(1128, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-12-12 11:09:18'),
(1129, 24, NULL, 0x3137352e3130302e35302e3236, 'lin keavuth', '2019-12-13 04:59:36'),
(1130, 24, NULL, 0x3137352e3130302e35302e3236, 'lin keavuth', '2019-12-13 05:05:47'),
(1131, 24, NULL, 0x3137352e3130302e35302e3236, 'lin keavuth', '2019-12-13 05:17:58'),
(1132, 24, NULL, 0x3137352e3130302e35302e3236, 'lin keavuth', '2019-12-13 07:16:05'),
(1133, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-12-13 11:01:44'),
(1134, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-12-13 11:12:46'),
(1135, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-12-13 11:18:38'),
(1136, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-12-13 11:23:42'),
(1137, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-12-13 11:24:53'),
(1138, 19, NULL, 0x3137352e3130302e35302e3236, 'himsavin', '2019-12-13 11:26:48'),
(1139, 19, NULL, 0x3137352e3130302e35302e3139, 'himsavin', '2019-12-13 14:31:58'),
(1140, 19, NULL, 0x3137352e3130302e35302e3139, 'himsavin', '2019-12-13 14:36:36'),
(1141, 19, NULL, 0x3137352e3130302e35302e3139, 'himsavin', '2019-12-13 14:37:24'),
(1142, 19, NULL, 0x3137352e3130302e35302e3139, 'himsavin', '2019-12-13 14:50:11'),
(1143, 19, NULL, 0x3137352e3130302e35302e3139, 'himsavin', '2019-12-14 00:20:58'),
(1144, 20, NULL, 0x3137352e3130302e35302e3139, 'Chanthy', '2019-12-14 00:23:27'),
(1145, 20, NULL, 0x3137352e3130302e35302e3231, 'Chanthy', '2019-12-14 05:03:02'),
(1146, 20, NULL, 0x3137352e3130302e35302e3231, 'Chanthy', '2019-12-14 05:16:22'),
(1147, 20, NULL, 0x3137352e3130302e35302e3231, 'Chanthy', '2019-12-14 06:24:25'),
(1148, 20, NULL, 0x3137352e3130302e35302e3231, 'Chanthy', '2019-12-14 12:17:28'),
(1149, 20, NULL, 0x3137352e3130302e35302e3231, 'Chanthy', '2019-12-15 01:49:14'),
(1150, 20, NULL, 0x3137352e3130302e35302e3232, 'Chanthy', '2019-12-15 03:14:27'),
(1151, 23, NULL, 0x3137352e3130302e35302e3232, 'chinsomphors', '2019-12-15 10:35:27'),
(1152, 23, NULL, 0x3137352e3130302e35302e3232, 'chinsomphors', '2019-12-15 11:01:28'),
(1153, 23, NULL, 0x3137352e3130302e35302e3232, 'chinsomphors', '2019-12-15 11:12:09'),
(1154, 20, NULL, 0x3137352e3130302e35302e3232, 'Chanthy', '2019-12-15 12:26:33'),
(1155, 20, NULL, 0x3137352e3130302e35302e3237, 'Chanthy', '2019-12-15 13:50:32'),
(1156, 19, NULL, 0x3137352e3130302e35302e3237, 'himsavin', '2019-12-15 13:53:42'),
(1157, 20, NULL, 0x3137352e3130302e35302e3237, 'Chanthy', '2019-12-16 10:45:31'),
(1158, 20, NULL, 0x3137352e3130302e35302e3237, 'Chanthy', '2019-12-16 11:41:15'),
(1159, 20, NULL, 0x3137352e3130302e35302e3237, 'Chanthy', '2019-12-16 12:34:08'),
(1160, 20, NULL, 0x3137352e3130302e35302e3237, 'Chanthy', '2019-12-17 02:03:39'),
(1161, 20, NULL, 0x3137352e3130302e35302e3237, 'Chanthy', '2019-12-17 04:42:05'),
(1162, 20, NULL, 0x3137352e3130302e35302e3237, 'Chanthy', '2019-12-17 10:50:08'),
(1163, 20, NULL, 0x3137352e3130302e35302e3237, 'Chanthy', '2019-12-17 10:54:53'),
(1164, 23, NULL, 0x3137352e3130302e35302e3237, 'chinsomphors', '2019-12-18 09:47:15'),
(1165, 20, NULL, 0x3137352e3130302e35302e3237, 'Chanthy', '2019-12-18 11:15:46'),
(1166, 20, NULL, 0x3137352e3130302e35302e3237, 'Chanthy', '2019-12-18 11:19:52'),
(1167, 20, NULL, 0x3137352e3130302e35302e3237, 'Chanthy', '2019-12-18 12:07:18'),
(1168, 20, NULL, 0x3137352e3130302e35302e3237, 'Chanthy', '2019-12-18 12:37:01'),
(1169, 20, NULL, 0x3137352e3130302e35302e3237, 'Chanthy', '2019-12-19 02:34:04'),
(1170, 20, NULL, 0x3137352e3130302e35302e3237, 'Chanthy', '2019-12-19 04:17:21'),
(1171, 20, NULL, 0x3137352e3130302e35302e3237, 'Chanthy', '2019-12-19 05:18:16'),
(1172, 20, NULL, 0x3137352e3130302e35302e3237, 'Chanthy', '2019-12-19 08:48:59'),
(1173, 20, NULL, 0x3137352e3130302e35302e3237, 'Chanthy', '2019-12-19 08:50:52'),
(1174, 20, NULL, 0x3137352e3130302e35302e3237, 'Chanthy', '2019-12-19 08:52:35'),
(1175, 20, NULL, 0x3137352e3130302e35302e3237, 'Chanthy', '2019-12-19 08:54:52'),
(1176, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2019-12-19 10:00:57'),
(1177, 23, NULL, 0x3137352e3130302e35302e3237, 'chinsomphors', '2019-12-19 10:33:52'),
(1178, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2019-12-19 11:15:04'),
(1179, 20, NULL, 0x3137352e3130302e35302e3239, 'Chanthy', '2019-12-20 00:29:47'),
(1180, 20, NULL, 0x3137352e3130302e35302e3239, 'Chanthy', '2019-12-20 00:32:59'),
(1181, 20, NULL, 0x3137352e3130302e35302e3239, 'Chanthy', '2019-12-20 04:43:31'),
(1182, 20, NULL, 0x3137352e3130302e35302e3239, 'Chanthy', '2019-12-20 04:49:06'),
(1183, 20, NULL, 0x3137352e3130302e35302e3239, 'Chanthy', '2019-12-20 12:15:34'),
(1184, 20, NULL, 0x3137352e3130302e35302e3239, 'Chanthy', '2019-12-20 12:19:15'),
(1185, 20, NULL, 0x3137352e3130302e35302e3239, 'Chanthy', '2019-12-20 12:23:00'),
(1186, 20, NULL, 0x3137352e3130302e35302e3239, 'Chanthy', '2019-12-20 12:25:42'),
(1187, 20, NULL, 0x3137352e3130302e35302e3239, 'Chanthy', '2019-12-21 07:38:47'),
(1188, 20, NULL, 0x3137352e3130302e35302e3239, 'Chanthy', '2019-12-21 07:40:05'),
(1189, 20, NULL, 0x3137352e3130302e35302e3239, 'Chanthy', '2019-12-21 07:42:40'),
(1190, 20, NULL, 0x3137352e3130302e35302e3239, 'Chanthy', '2019-12-21 09:07:13'),
(1191, 20, NULL, 0x3137352e3130302e35302e3239, 'Chanthy', '2019-12-21 09:25:16'),
(1192, 20, NULL, 0x3137352e3130302e35302e3239, 'Chanthy', '2019-12-21 09:53:10'),
(1193, 20, NULL, 0x3137352e3130302e35302e3136, 'Chanthy', '2019-12-22 06:25:34'),
(1194, 20, NULL, 0x3137352e3130302e35302e3136, 'Chanthy', '2019-12-22 06:43:37'),
(1195, 20, NULL, 0x3137352e3130302e35302e3136, 'Chanthy', '2019-12-22 07:59:50'),
(1196, 20, NULL, 0x3137352e3130302e35302e3136, 'Chanthy', '2019-12-22 08:23:23'),
(1197, 20, NULL, 0x3137352e3130302e35302e3136, 'Chanthy', '2019-12-22 08:38:23'),
(1198, 20, NULL, 0x3137352e3130302e35302e3136, 'Chanthy', '2019-12-22 08:45:42'),
(1199, 20, NULL, 0x3137352e3130302e35302e3136, 'Chanthy', '2019-12-22 08:55:05'),
(1200, 24, NULL, 0x3137352e3130302e35302e3238, 'lin keavuth', '2019-12-23 02:04:07'),
(1201, 24, NULL, 0x3137352e3130302e35302e3238, 'lin keavuth', '2019-12-23 05:04:28'),
(1202, 24, NULL, 0x3137352e3130302e35302e3238, 'lin keavuth', '2019-12-23 05:12:12'),
(1203, 24, NULL, 0x3137352e3130302e35302e3238, 'lin keavuth', '2019-12-23 05:14:08'),
(1204, 24, NULL, 0x3137352e3130302e35302e3238, 'lin keavuth', '2019-12-23 05:15:35'),
(1205, 24, NULL, 0x3137352e3130302e35302e3238, 'lin keavuth', '2019-12-23 12:17:30'),
(1206, 24, NULL, 0x3137352e3130302e35302e3238, 'lin keavuth', '2019-12-23 12:30:01'),
(1207, 24, NULL, 0x3137352e3130302e35302e3238, 'lin keavuth', '2019-12-24 05:44:18'),
(1208, 24, NULL, 0x3137352e3130302e35302e3238, 'lin keavuth', '2019-12-24 10:46:01'),
(1209, 20, NULL, 0x3137352e3130302e35302e3238, 'Chanthy', '2019-12-24 12:29:16'),
(1210, 24, NULL, 0x3137352e3130302e35302e3238, 'lin keavuth', '2019-12-25 01:06:46'),
(1211, 24, NULL, 0x3137352e3130302e35302e3238, 'lin keavuth', '2019-12-25 08:45:12'),
(1212, 24, NULL, 0x3137352e3130302e35302e3238, 'lin keavuth', '2019-12-25 09:31:04'),
(1213, 24, NULL, 0x3137352e3130302e35302e3238, 'lin keavuth', '2019-12-25 11:15:28'),
(1214, 24, NULL, 0x3137352e3130302e35302e3238, 'lin keavuth', '2019-12-26 05:50:00'),
(1215, 23, NULL, 0x3137352e3130302e35302e3238, 'Chinsomphors', '2019-12-26 07:34:49'),
(1216, 23, NULL, 0x3137352e3130302e35302e3238, 'Chinsomphors', '2019-12-26 07:35:43'),
(1217, 24, NULL, 0x3137352e3130302e35302e3238, 'lin keavuth', '2019-12-26 08:48:30'),
(1218, 24, NULL, 0x3137352e3130302e35302e3238, 'lin keavuth', '2019-12-26 09:30:45'),
(1219, 24, NULL, 0x3137352e3130302e35302e3238, 'lin keavuth', '2019-12-26 10:57:30'),
(1220, 24, NULL, 0x3137352e3130302e35302e3238, 'lin keavuth', '2019-12-26 11:12:02'),
(1221, 24, NULL, 0x3137352e3130302e35302e3238, 'lin keavuth', '2019-12-26 12:07:25'),
(1222, 18, NULL, 0x3137352e3130302e35302e3238, 'hongdavy', '2019-12-27 01:13:35'),
(1223, 18, NULL, 0x3137352e3130302e35302e3238, 'hongdavy', '2019-12-27 01:28:26'),
(1224, 18, NULL, 0x3137352e3130302e35302e3238, 'hongdavy', '2019-12-27 02:43:45'),
(1225, 24, NULL, 0x3137352e3130302e35302e3238, 'lin keavuth', '2019-12-27 02:54:45'),
(1226, 18, NULL, 0x3137352e3130302e35302e3238, 'hongdavy', '2019-12-27 03:17:47'),
(1227, 24, NULL, 0x3137352e3130302e35302e3238, 'lin keavuth', '2019-12-27 08:10:06'),
(1228, 24, NULL, 0x3137352e3130302e35302e3238, 'lin keavuth', '2019-12-27 09:17:43'),
(1229, 24, NULL, 0x3137352e3130302e35302e3238, 'lin keavuth', '2019-12-27 09:29:18'),
(1230, 24, NULL, 0x3137352e3130302e35302e3238, 'lin keavuth', '2019-12-27 12:25:34'),
(1231, 24, NULL, 0x3137352e3130302e35302e3238, 'lin keavuth', '2019-12-27 13:09:01'),
(1232, 24, NULL, 0x3137352e3130302e35302e3238, 'lin keavuth', '2019-12-28 03:50:13'),
(1233, 24, NULL, 0x3137352e3130302e35302e3238, 'lin keavuth', '2019-12-28 05:20:13'),
(1234, 24, NULL, 0x3137352e3130302e35302e3230, 'lin keavuth', '2019-12-30 05:30:30'),
(1235, 24, NULL, 0x3137352e3130302e35302e3230, 'lin keavuth', '2019-12-30 07:19:13'),
(1236, 23, NULL, 0x3137352e3130302e35302e3230, 'chinsomphors', '2019-12-30 10:06:51'),
(1237, 23, NULL, 0x3137352e3130302e35302e3230, 'chinsomphors', '2019-12-30 10:28:46'),
(1238, 24, NULL, 0x3137352e3130302e35302e3230, 'lin keavuth', '2019-12-30 11:57:32'),
(1239, 24, NULL, 0x3137352e3130302e35302e3230, 'lin keavuth', '2019-12-30 12:03:19'),
(1240, 24, NULL, 0x3137352e3130302e35302e3233, 'lin keavuth', '2019-12-31 06:59:12'),
(1241, 24, NULL, 0x3137352e3130302e35302e3233, 'lin keavuth', '2019-12-31 08:41:12'),
(1242, 24, NULL, 0x3137352e3130302e35302e3233, 'lin keavuth', '2019-12-31 09:15:30'),
(1243, 24, NULL, 0x3137352e3130302e35302e3233, 'lin keavuth', '2019-12-31 12:03:52'),
(1244, 24, NULL, 0x3137352e3130302e35302e3233, 'lin keavuth', '2019-12-31 12:09:30'),
(1245, 24, NULL, 0x3137352e3130302e35302e3233, 'lin keavuth', '2019-12-31 12:21:15'),
(1246, 20, NULL, 0x3137352e3130302e35302e3233, 'Chanthy', '2019-12-31 13:43:22'),
(1247, 20, NULL, 0x3137352e3130302e35302e3233, 'Chanthy', '2019-12-31 13:44:45'),
(1248, 24, NULL, 0x3137352e3130302e35302e3233, 'lin keavuth', '2020-01-01 04:36:44'),
(1249, 24, NULL, 0x3137352e3130302e35302e3233, 'lin keavuth', '2020-01-01 06:38:52'),
(1250, 24, NULL, 0x3137352e3130302e35302e3233, 'lin keavuth', '2020-01-01 09:49:39'),
(1251, 24, NULL, 0x3137352e3130302e35302e3233, 'lin keavuth', '2020-01-01 09:56:57'),
(1252, 24, NULL, 0x3137352e3130302e35302e3233, 'lin keavuth', '2020-01-01 13:58:22'),
(1253, 24, NULL, 0x3137352e3130302e35302e3233, 'lin keavuth', '2020-01-02 02:49:00'),
(1254, 24, NULL, 0x3137352e3130302e35302e3233, 'lin keavuth', '2020-01-02 06:04:19'),
(1255, 24, NULL, 0x3137352e3130302e35302e3233, 'lin keavuth', '2020-01-02 10:14:40'),
(1256, 23, NULL, 0x3137352e3130302e35302e3233, 'Chinsomphors', '2020-01-02 11:57:21'),
(1257, 23, NULL, 0x3137352e3130302e35302e3233, 'Chinsomphors', '2020-01-02 12:04:30'),
(1258, 24, NULL, 0x3137352e3130302e35302e3233, 'lin keavuth', '2020-01-03 00:28:59'),
(1259, 24, NULL, 0x3137352e3130302e35302e3233, 'lin keavuth', '2020-01-03 02:05:02'),
(1260, 24, NULL, 0x3137352e3130302e35302e3233, 'lin keavuth', '2020-01-03 02:08:23'),
(1261, 24, NULL, 0x3137352e3130302e35302e3233, 'lin keavuth', '2020-01-03 04:18:14'),
(1262, 24, NULL, 0x3137352e3130302e35302e3233, 'lin keavuth', '2020-01-03 06:46:39'),
(1263, 24, NULL, 0x3137352e3130302e35302e3233, 'lin keavuth', '2020-01-03 09:52:48'),
(1264, 18, NULL, 0x3138332e38382e342e3630, 'hongdavy', '2020-01-03 10:30:20'),
(1265, 24, NULL, 0x3137352e3130302e35302e3233, 'lin keavuth', '2020-01-03 12:11:18'),
(1266, 24, NULL, 0x3137352e3130302e35302e3233, 'lin keavuth', '2020-01-03 12:39:23'),
(1267, 24, NULL, 0x3137352e3130302e35302e3233, 'lin keavuth', '2020-01-03 13:26:59'),
(1268, 24, NULL, 0x3137352e3130302e35302e3233, 'lin keavuth', '2020-01-04 00:49:27'),
(1269, 18, NULL, 0x3131302e34392e3231352e323535, 'hongdavy', '2020-01-04 02:37:19'),
(1270, 23, NULL, 0x3137352e3130302e35302e3233, 'Chinsomphors', '2020-01-04 07:26:43'),
(1271, 23, NULL, 0x3137352e3130302e35302e3233, 'Chinsomphors', '2020-01-04 10:49:14'),
(1272, 24, NULL, 0x3137352e3130302e35302e3233, 'lin keavuth', '2020-01-04 11:20:46'),
(1273, 23, NULL, 0x3137352e3130302e35302e3233, 'Chinsomphors', '2020-01-04 11:49:05'),
(1274, 20, NULL, 0x3137352e3130302e35302e3233, 'Chanthy', '2020-01-04 13:17:38'),
(1275, 20, NULL, 0x3137352e3130302e35302e3233, 'Chanthy', '2020-01-05 03:59:15');
INSERT INTO `sma_user_logins` (`id`, `user_id`, `company_id`, `ip_address`, `login`, `time`) VALUES
(1276, 24, NULL, 0x3137352e3130302e35302e3233, 'lin keavuth', '2020-01-05 05:13:06'),
(1277, 20, NULL, 0x3137352e3130302e35302e3233, 'Chanthy', '2020-01-05 10:17:00'),
(1278, 20, NULL, 0x3137352e3130302e35302e3233, 'Chanthy', '2020-01-05 10:46:29'),
(1279, 24, NULL, 0x3137352e3130302e35302e3233, 'lin keavuth', '2020-01-05 11:57:41'),
(1280, 24, NULL, 0x3137352e3130302e35302e3233, 'lin keavuth', '2020-01-05 13:47:50'),
(1281, 24, NULL, 0x3137352e3130302e35302e3233, 'lin keavuth', '2020-01-06 04:49:01'),
(1282, 24, NULL, 0x3137352e3130302e35302e3233, 'lin keavuth', '2020-01-06 09:51:10'),
(1283, 20, NULL, 0x3137352e3130302e35302e3233, 'Chanthy', '2020-01-06 12:20:12'),
(1284, 20, NULL, 0x3137352e3130302e35302e3233, 'Chanthy', '2020-01-06 12:30:00'),
(1285, 24, NULL, 0x3137352e3130302e35302e3233, 'lin keavuth', '2020-01-07 00:44:32'),
(1286, 24, NULL, 0x3137352e3130302e35302e3231, 'lin keavuth', '2020-01-07 09:39:46'),
(1287, 18, NULL, 0x3137352e3130302e35302e3231, 'hongdavy', '2020-01-07 11:17:27'),
(1288, 24, NULL, 0x3137352e3130302e35302e3231, 'lin keavuth', '2020-01-07 11:25:08'),
(1289, 18, NULL, 0x3137352e3130302e35302e3231, 'hongdavy', '2020-01-07 11:52:36'),
(1290, 24, NULL, 0x3137352e3130302e35302e3231, 'lin keavuth', '2020-01-07 12:25:54'),
(1291, 24, NULL, 0x3137352e3130302e35302e3231, 'lin keavuth', '2020-01-07 14:18:50'),
(1292, 23, NULL, 0x3137352e3130302e35302e3231, 'Chinsomphors', '2020-01-09 10:13:48'),
(1293, 23, NULL, 0x3137352e3130302e35302e3231, 'Chinsomphors', '2020-01-09 10:19:10'),
(1294, 23, NULL, 0x3137352e3130302e35302e3231, 'Chinsomphors', '2020-01-09 10:57:50'),
(1295, 23, NULL, 0x3137352e3130302e35302e3231, 'Chinsomphors', '2020-01-10 10:46:48'),
(1296, 24, NULL, 0x3137352e3130302e35302e3231, 'lin keavuth', '2020-01-10 11:57:37'),
(1297, 23, NULL, 0x3137352e3130302e35302e3231, 'Chinsomphors', '2020-01-11 10:58:21'),
(1298, 23, NULL, 0x3137352e3130302e35302e3231, 'Chinsomphors', '2020-01-12 09:12:40'),
(1299, 23, NULL, 0x3137352e3130302e35302e3231, 'Chinsomphors', '2020-01-12 09:23:08'),
(1300, 23, NULL, 0x3137352e3130302e35302e3231, 'Chinsomphors', '2020-01-12 10:03:01'),
(1301, 23, NULL, 0x3137352e3130302e35302e3231, 'Chinsomphors', '2020-01-12 10:38:33'),
(1302, 23, NULL, 0x3137352e3130302e35302e3231, 'Chinsomphors', '2020-01-12 11:49:37'),
(1303, 23, NULL, 0x3137352e3130302e35302e3231, 'Chinsomphors', '2020-01-13 08:16:25'),
(1304, 23, NULL, 0x3137352e3130302e35302e3231, 'Chinsomphors', '2020-01-13 10:16:58'),
(1305, 23, NULL, 0x3137352e3130302e35302e3231, 'Chinsomphors', '2020-01-13 11:02:00'),
(1306, 23, NULL, 0x3137352e3130302e35302e3231, 'Chinsomphors', '2020-01-13 11:07:19'),
(1307, 23, NULL, 0x3137352e3130302e35302e3231, 'Chinsomphors', '2020-01-13 11:14:17'),
(1308, 23, NULL, 0x3137352e3130302e35302e3231, 'Chinsomphors', '2020-01-13 11:24:47'),
(1309, 23, NULL, 0x3137352e3130302e35302e3231, 'Chinsomphors', '2020-01-13 12:28:42'),
(1310, 24, NULL, 0x3137352e3130302e35302e3231, 'lin keavuth', '2020-01-13 12:53:37'),
(1311, 24, NULL, 0x3137352e3130302e35302e3231, 'lin keavuth', '2020-01-13 13:03:04'),
(1312, 23, NULL, 0x3137352e3130302e35302e3231, 'Chinsomphors', '2020-01-14 10:07:56'),
(1313, 23, NULL, 0x3137352e3130302e35302e3231, 'Chinsomphors', '2020-01-14 10:35:49'),
(1314, 23, NULL, 0x3137352e3130302e35302e3231, 'Chinsomphors', '2020-01-14 11:20:59'),
(1315, 24, NULL, 0x3137352e3130302e35302e3231, 'lin keavuth', '2020-01-14 13:53:52'),
(1316, 24, NULL, 0x3137352e3130302e35302e3231, 'lin keavuth', '2020-01-15 03:09:43'),
(1317, 24, NULL, 0x3137352e3130302e35302e3139, 'lin keavuth', '2020-01-15 04:59:47'),
(1318, 24, NULL, 0x3137352e3130302e35302e3139, 'lin keavuth', '2020-01-15 09:05:40'),
(1319, 23, NULL, 0x3137352e3130302e35302e3139, 'Chinsomphors', '2020-01-15 09:17:43'),
(1320, 23, NULL, 0x3137352e3130302e35302e3139, 'Chinsomphors', '2020-01-15 09:38:25'),
(1321, 23, NULL, 0x3137352e3130302e35302e3139, 'Chinsomphors', '2020-01-15 09:48:35'),
(1322, 23, NULL, 0x3137352e3130302e35302e3139, 'Chinsomphors', '2020-01-15 10:31:11'),
(1323, 23, NULL, 0x3137352e3130302e35302e3139, 'Chinsomphors', '2020-01-15 10:55:00'),
(1324, 24, NULL, 0x3137352e3130302e35302e3139, 'lin keavuth', '2020-01-15 12:09:10'),
(1325, 24, NULL, 0x3137352e3130302e35302e3139, 'lin keavuth', '2020-01-16 06:23:18'),
(1326, 24, NULL, 0x3137352e3130302e35302e3139, 'lin keavuth', '2020-01-16 06:37:36'),
(1327, 24, NULL, 0x3137352e3130302e35302e3139, 'lin keavuth', '2020-01-16 06:58:42'),
(1328, 24, NULL, 0x3137352e3130302e35302e3139, 'lin keavuth', '2020-01-16 07:08:57'),
(1329, 24, NULL, 0x3137352e3130302e35302e3139, 'lin keavuth', '2020-01-16 10:02:50'),
(1330, 24, NULL, 0x3137352e3130302e35302e3139, 'lin keavuth', '2020-01-16 10:10:07'),
(1331, 24, NULL, 0x3137352e3130302e35302e3139, 'lin keavuth', '2020-01-16 11:33:18'),
(1332, 24, NULL, 0x3137352e3130302e35302e3139, 'lin keavuth', '2020-01-16 12:59:06'),
(1333, 23, NULL, 0x3137352e3130302e35302e3139, 'Chinsomphors', '2020-01-17 08:13:04'),
(1334, 23, NULL, 0x3137352e3130302e35302e3139, 'Chinsomphors', '2020-01-17 08:40:30'),
(1335, 23, NULL, 0x3137352e3130302e35302e3139, 'Chinsomphors', '2020-01-17 10:10:13'),
(1336, 24, NULL, 0x3137352e3130302e35302e3139, 'lin keavuth', '2020-01-17 10:38:49'),
(1337, 24, NULL, 0x3137352e3130302e35302e3139, 'lin keavuth', '2020-01-17 11:12:47'),
(1338, 23, NULL, 0x3137352e3130302e35302e3139, 'Chinsomphors', '2020-01-17 11:28:22'),
(1339, 23, NULL, 0x3137352e3130302e35302e3139, 'Chinsomphors ', '2020-01-17 11:34:25'),
(1340, 23, NULL, 0x3137352e3130302e35302e3139, 'Chinsomphors', '2020-01-17 11:56:47'),
(1341, 23, NULL, 0x3137352e3130302e35302e3139, 'Chinsomphors', '2020-01-17 12:01:11'),
(1342, 23, NULL, 0x3137352e3130302e35302e3139, 'Chinsomphors', '2020-01-17 12:08:24'),
(1343, 24, NULL, 0x3137352e3130302e35302e3139, 'lin keavuth', '2020-01-17 12:20:16'),
(1344, 24, NULL, 0x3137352e3130302e35302e3139, 'lin keavuth', '2020-01-18 00:08:22'),
(1345, 24, NULL, 0x3137352e3130302e35302e3139, 'lin keavuth', '2020-01-18 05:48:08'),
(1346, 23, NULL, 0x3137352e3130302e35302e3139, 'Chinsomphors', '2020-01-18 06:15:00'),
(1347, 23, NULL, 0x3137352e3130302e35302e3139, 'Chinsomphors', '2020-01-18 09:23:55'),
(1348, 23, NULL, 0x3137352e3130302e35302e3139, 'Chinsomphors', '2020-01-18 10:29:09'),
(1349, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-01-19 07:36:36'),
(1350, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-01-19 08:05:12'),
(1351, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-01-19 12:13:44'),
(1352, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-01-20 08:13:37'),
(1353, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-01-20 08:50:00'),
(1354, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-01-20 09:21:40'),
(1355, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-01-20 09:27:22'),
(1356, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-01-20 10:43:52'),
(1357, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-01-20 10:56:22'),
(1358, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-01-20 11:16:02'),
(1359, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-01-21 04:41:37'),
(1360, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-01-21 06:27:36'),
(1361, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-01-21 07:00:46'),
(1362, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-01-21 09:30:44'),
(1363, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-01-21 11:09:13'),
(1364, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-01-21 11:44:28'),
(1365, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-01-21 12:06:10'),
(1366, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-01-21 12:55:31'),
(1367, 23, NULL, 0x3137352e3130302e35302e3233, 'Chinsomphors', '2020-01-22 11:19:56'),
(1368, 23, NULL, 0x3137352e3130302e35302e3233, 'Chinsomphors', '2020-01-22 12:04:58'),
(1369, 23, NULL, 0x3137352e3130302e35302e3233, 'Chinsomphors', '2020-01-22 12:19:13'),
(1370, 23, NULL, 0x3137352e3130302e35302e3233, 'Chinsomphors', '2020-01-23 07:38:08'),
(1371, 23, NULL, 0x3137352e3130302e35302e3233, 'Chinsomphors', '2020-01-23 08:02:16'),
(1372, 23, NULL, 0x3137352e3130302e35302e3233, 'Chinsomphors', '2020-01-23 11:19:29'),
(1373, 23, NULL, 0x3137352e3130302e35302e3233, 'Chinsomphors', '2020-01-23 13:14:40'),
(1374, 23, NULL, 0x3137352e3130302e35302e3233, 'Chinsomphors', '2020-01-25 08:38:32'),
(1375, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-01-26 11:52:14'),
(1376, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-01-26 13:41:43'),
(1377, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-01-27 09:00:36'),
(1378, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-01-27 12:18:02'),
(1379, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-01-28 10:27:34'),
(1380, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-01-28 10:37:34'),
(1381, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-01-29 11:16:01'),
(1382, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-01-29 13:03:11'),
(1383, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-01-30 02:23:11'),
(1384, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-01-30 09:24:44'),
(1385, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-01-30 10:48:55'),
(1386, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-01-30 12:11:08'),
(1387, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-01-30 13:14:09'),
(1388, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-01-31 04:13:02'),
(1389, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-01-31 11:07:59'),
(1390, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-01-31 11:34:45'),
(1391, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-01-31 11:45:10'),
(1392, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-01-31 12:04:18'),
(1393, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-02-01 01:57:29'),
(1394, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-02-01 04:55:19'),
(1395, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-02-01 04:58:56'),
(1396, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-02-01 06:13:24'),
(1397, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-02-01 08:16:59'),
(1398, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-02-01 10:10:21'),
(1399, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-02-01 11:04:01'),
(1400, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-02-01 13:00:35'),
(1401, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-02-01 13:08:31'),
(1402, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-02-01 13:11:17'),
(1403, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-02-01 13:12:12'),
(1404, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-02-01 13:20:36'),
(1405, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-02-02 02:24:51'),
(1406, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-02-02 05:50:06'),
(1407, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-02-02 10:05:13'),
(1408, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-02-02 10:29:23'),
(1409, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-02-02 13:40:19'),
(1410, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-02-03 03:04:03'),
(1411, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-02-03 09:42:10'),
(1412, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-02-03 12:13:03'),
(1413, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-02-04 01:50:19'),
(1414, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-02-04 03:41:51'),
(1415, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-02-04 03:44:35'),
(1416, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-02-04 07:16:23'),
(1417, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-02-04 10:13:11'),
(1418, 23, NULL, 0x3137352e3130302e35302e3136, 'Chinsomphors', '2020-02-04 10:33:03'),
(1419, 23, NULL, 0x3137352e3130302e35302e3136, 'Chinsomphors', '2020-02-04 11:44:15'),
(1420, 24, NULL, 0x3137352e3130302e35302e3136, 'lin keavuth', '2020-02-04 12:29:16'),
(1421, 24, NULL, 0x3137352e3130302e35302e3136, 'lin keavuth', '2020-02-05 04:09:58'),
(1422, 23, NULL, 0x3137352e3130302e35302e3136, 'Chinsomphors', '2020-02-05 10:21:46'),
(1423, 24, NULL, 0x3137352e3130302e35302e3136, 'lin keavuth', '2020-02-05 12:47:12'),
(1424, 24, NULL, 0x3137352e3130302e35302e3136, 'lin keavuth', '2020-02-06 01:09:09'),
(1425, 24, NULL, 0x3137352e3130302e35302e3136, 'lin keavuth ', '2020-02-06 06:46:51'),
(1426, 24, NULL, 0x3137352e3130302e35302e3136, 'lin keavuth', '2020-02-06 11:50:52'),
(1427, 24, NULL, 0x3137352e3130302e35302e3136, 'lin keavuth', '2020-02-06 12:03:54'),
(1428, 24, NULL, 0x3137352e3130302e35302e3136, 'lin keavuth', '2020-02-06 13:22:00'),
(1429, 24, NULL, 0x3137352e3130302e35302e3136, 'lin keavuth', '2020-02-07 01:22:34'),
(1430, 24, NULL, 0x3137352e3130302e35302e3136, 'lin keavuth', '2020-02-07 02:10:50'),
(1431, 24, NULL, 0x3137352e3130302e35302e3136, 'lin keavuth', '2020-02-07 02:34:23'),
(1432, 24, NULL, 0x3137352e3130302e35302e3136, 'lin keavuth', '2020-02-07 08:21:21'),
(1433, 23, NULL, 0x3137352e3130302e35302e3136, 'Chinsomphors', '2020-02-07 08:31:29'),
(1434, 24, NULL, 0x3137352e3130302e35302e3136, 'lin keavuth', '2020-02-07 12:31:38'),
(1435, 24, NULL, 0x3137352e3130302e35302e3136, 'lin keavuth', '2020-02-07 13:39:39'),
(1436, 23, NULL, 0x3137352e3130302e35302e3136, 'Chinsomphors', '2020-02-08 07:52:18'),
(1437, 23, NULL, 0x3137352e3130302e35302e3136, 'Chinsomphors', '2020-02-08 08:06:11'),
(1438, 23, NULL, 0x3137352e3130302e35302e3136, 'Chinsomphors', '2020-02-08 10:31:25'),
(1439, 23, NULL, 0x3137352e3130302e35302e3235, 'Chinsomphors', '2020-02-09 08:43:40'),
(1440, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-10 05:31:40'),
(1441, 23, NULL, 0x3137352e3130302e35302e3235, 'Chinsomphors', '2020-02-10 12:10:08'),
(1442, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-10 13:47:46'),
(1443, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-11 03:06:12'),
(1444, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-11 04:43:19'),
(1445, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-11 07:02:37'),
(1446, 23, NULL, 0x3137352e3130302e35302e3235, 'Chinsomphors', '2020-02-11 11:17:59'),
(1447, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-11 12:21:32'),
(1448, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-11 13:19:56'),
(1449, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-12 05:09:22'),
(1450, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-12 05:12:13'),
(1451, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-12 10:22:33'),
(1452, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-12 11:19:11'),
(1453, 23, NULL, 0x3137352e3130302e35302e3235, 'Chinsomphors', '2020-02-13 08:14:08'),
(1454, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-13 11:14:22'),
(1455, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-13 12:04:55'),
(1456, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-13 13:14:09'),
(1457, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-14 01:06:40'),
(1458, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-14 01:17:15'),
(1459, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-14 03:27:54'),
(1460, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-14 05:52:24'),
(1461, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-14 07:54:39'),
(1462, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-14 09:49:45'),
(1463, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-14 10:20:52'),
(1464, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-14 10:55:09'),
(1465, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-14 11:46:29'),
(1466, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-14 13:06:12'),
(1467, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-15 06:12:19'),
(1468, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-15 11:12:33'),
(1469, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-15 11:44:27'),
(1470, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-15 12:21:38'),
(1471, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-15 12:40:51'),
(1472, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-15 13:30:19'),
(1473, 23, NULL, 0x3137352e3130302e35302e3235, 'Chinsomphors', '2020-02-16 02:41:35'),
(1474, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-16 04:07:39'),
(1475, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-16 13:14:17'),
(1476, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-16 13:37:37'),
(1477, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-17 07:49:24'),
(1478, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-17 11:32:58'),
(1479, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-18 01:45:31'),
(1480, 24, NULL, 0x3137352e3130302e35302e3235, 'lin keavuth', '2020-02-18 02:07:35'),
(1481, 24, NULL, 0x3137352e3130302e35302e3235, 'lin Keavuth', '2020-02-18 06:17:33'),
(1482, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-18 10:57:37'),
(1483, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-18 12:24:35'),
(1484, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-18 13:14:59'),
(1485, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-18 13:18:03'),
(1486, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-19 11:25:26'),
(1487, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-19 12:34:06'),
(1488, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-19 14:07:48'),
(1489, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-20 04:08:12'),
(1490, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-20 04:16:00'),
(1491, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-20 07:51:44'),
(1492, 23, NULL, 0x3137352e3130302e35302e3237, 'Chinsomphors', '2020-02-20 09:26:13'),
(1493, 23, NULL, 0x3137352e3130302e35302e3237, 'Chinsomphors', '2020-02-20 11:28:18'),
(1494, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-20 13:11:45'),
(1495, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-20 13:15:08'),
(1496, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-21 03:28:56'),
(1497, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-21 05:26:11'),
(1498, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-21 07:11:51'),
(1499, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-21 09:51:21'),
(1500, 23, NULL, 0x3137352e3130302e35302e3237, 'Chinsomphors', '2020-02-21 11:28:55'),
(1501, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-21 12:46:26'),
(1502, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-21 12:51:47'),
(1503, 23, NULL, 0x3137352e3130302e35302e3237, 'Chinsomphors', '2020-02-22 07:53:10'),
(1504, 23, NULL, 0x3137352e3130302e35302e3237, 'Chinsomphors', '2020-02-22 11:38:49'),
(1505, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-22 12:57:17'),
(1506, 23, NULL, 0x3137352e3130302e35302e3237, 'Chinsomphors', '2020-02-23 04:11:07'),
(1507, 23, NULL, 0x3137352e3130302e35302e3237, 'Chinsomphors', '2020-02-23 09:22:05'),
(1508, 23, NULL, 0x3137352e3130302e35302e3237, 'Chinsomphors', '2020-02-23 10:46:42'),
(1509, 23, NULL, 0x3137352e3130302e35302e3237, 'Chinsomphors', '2020-02-24 10:00:26'),
(1510, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-24 11:56:20'),
(1511, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-24 12:57:35'),
(1512, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-24 14:16:35'),
(1513, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-25 03:32:50'),
(1514, 23, NULL, 0x3137352e3130302e35302e3237, 'Chinsomphors', '2020-02-25 09:51:19'),
(1515, 23, NULL, 0x3137352e3130302e35302e3237, 'Chinsomphors', '2020-02-25 14:00:04'),
(1516, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-25 15:34:42'),
(1517, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-26 01:46:11'),
(1518, 23, NULL, 0x3137352e3130302e35302e3237, 'Chinsomphors', '2020-02-26 10:29:55'),
(1519, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-26 13:29:16'),
(1520, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-26 13:51:00'),
(1521, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-27 01:11:23'),
(1522, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-27 05:55:08'),
(1523, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-27 07:47:40'),
(1524, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-27 12:58:08'),
(1525, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-27 13:04:31'),
(1526, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-28 00:50:01'),
(1527, 23, NULL, 0x3137352e3130302e35302e3237, 'Chinsomphors', '2020-02-28 08:34:02'),
(1528, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-29 02:33:09'),
(1529, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-29 09:31:41'),
(1530, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-29 09:35:44'),
(1531, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-29 09:51:02'),
(1532, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-29 11:06:18'),
(1533, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-02-29 12:48:22'),
(1534, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-03-01 03:05:25'),
(1535, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-03-01 10:06:50'),
(1536, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-03-01 12:09:44'),
(1537, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-03-01 12:31:26'),
(1538, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-03-02 05:55:31'),
(1539, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-03-02 06:08:07'),
(1540, 23, NULL, 0x3137352e3130302e35302e3237, 'Chinsomphors', '2020-03-02 10:16:08'),
(1541, 23, NULL, 0x3137352e3130302e35302e3237, 'Chinsomphors', '2020-03-02 10:22:38'),
(1542, 23, NULL, 0x3137352e3130302e35302e3237, 'Chinsomphors', '2020-03-03 12:23:29'),
(1543, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-03-03 12:34:46'),
(1544, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-03-03 13:32:07'),
(1545, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-03-03 13:35:56'),
(1546, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-03-04 12:48:44'),
(1547, 24, NULL, 0x3137352e3130302e35302e3237, 'lin keavuth', '2020-03-04 13:41:55'),
(1548, 24, NULL, 0x3137352e3130302e35302e3136, 'lin keavuth', '2020-03-09 11:39:13'),
(1549, 24, NULL, 0x3137352e3130302e35302e3136, 'lin keavuth', '2020-03-09 13:26:35'),
(1550, 23, NULL, 0x3137352e3130302e35302e3136, 'Chinsomphors', '2020-03-10 10:25:14'),
(1551, 24, NULL, 0x3137352e3130302e35302e3136, 'lin keavuth', '2020-03-10 11:40:53'),
(1552, 23, NULL, 0x3137352e3130302e35302e3136, 'Chinsomphors', '2020-03-10 12:47:13'),
(1553, 23, NULL, 0x3137352e3130302e35302e3136, 'Chinsomphors', '2020-03-10 13:11:27'),
(1554, 24, NULL, 0x3137352e3130302e35302e3136, 'lin keavuth', '2020-03-11 03:48:45'),
(1555, 24, NULL, 0x3137352e3130302e35302e3136, 'lin keavuth', '2020-03-11 06:04:20'),
(1556, 24, NULL, 0x3137352e3130302e35302e3136, 'lin keavuth', '2020-03-11 07:18:21'),
(1557, 24, NULL, 0x3137352e3130302e35302e3136, 'lin keavuth', '2020-03-11 08:44:46'),
(1558, 23, NULL, 0x3137352e3130302e35302e3136, 'Chinsomphors', '2020-03-11 08:52:25'),
(1559, 23, NULL, 0x3137352e3130302e35302e3136, 'Chinsomphors', '2020-03-11 10:21:10'),
(1560, 23, NULL, 0x3137352e3130302e35302e3136, 'Chinsomphors', '2020-03-11 11:34:20'),
(1561, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-03-12 08:26:17'),
(1562, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-03-12 08:38:07'),
(1563, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-03-12 12:23:35'),
(1564, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-03-12 12:36:07'),
(1565, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-03-13 10:47:31'),
(1566, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-03-13 11:29:04'),
(1567, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-03-13 12:35:00'),
(1568, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-03-14 03:02:23'),
(1569, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-03-14 05:21:16'),
(1570, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-03-14 08:13:18'),
(1571, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-03-14 09:15:52'),
(1572, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-03-14 11:50:02'),
(1573, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-03-15 06:57:24'),
(1574, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-03-15 09:16:33'),
(1575, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-03-15 10:46:04'),
(1576, 24, NULL, 0x3137352e3130302e35302e3239, 'Lin keavuth', '2020-03-15 12:46:04'),
(1577, 25, NULL, 0x3137352e3130302e35302e3239, 'Norn chantha', '2020-03-15 13:11:31'),
(1578, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-03-16 10:10:29'),
(1579, 25, NULL, 0x3137352e3130302e35302e3239, 'Norn chantha', '2020-03-16 10:31:06'),
(1580, 24, NULL, 0x3137352e3130302e35302e3239, 'lin keavuth', '2020-03-16 13:08:07'),
(1581, 24, NULL, 0x3137352e3130302e35302e3137, 'lin keavuth', '2020-03-17 09:48:44'),
(1582, 24, NULL, 0x3137352e3130302e35302e3137, 'lin keavuth', '2020-03-17 12:03:34'),
(1583, 25, NULL, 0x3137352e3130302e35302e3137, 'Norn chantha', '2020-03-17 12:13:42'),
(1584, 23, NULL, 0x3137352e3130302e35302e3234, 'Chinsomphors', '2020-03-30 03:27:14'),
(1585, 23, NULL, 0x3137352e3130302e35302e3234, 'Chinsomphors', '2020-03-31 01:22:32'),
(1586, 23, NULL, 0x3137352e3130302e35302e3234, 'Chinsomphors', '2020-03-31 01:24:53'),
(1587, 23, NULL, 0x3137352e3130302e35302e3234, 'Chinsomphors', '2020-03-31 04:22:30'),
(1588, 23, NULL, 0x3137352e3130302e35302e3234, 'Chinsomphors', '2020-03-31 05:04:09'),
(1589, 23, NULL, 0x3137352e3130302e35302e3234, 'Chinsomphors', '2020-03-31 06:17:25'),
(1590, 23, NULL, 0x3137352e3130302e35302e3234, 'Chinsomphors', '2020-03-31 12:19:20'),
(1591, 23, NULL, 0x3137352e3130302e35302e3234, 'Chinsomphors', '2020-04-01 02:47:34'),
(1592, 23, NULL, 0x3137352e3130302e35302e3234, 'Chinsomphors', '2020-04-01 06:10:12'),
(1593, 23, NULL, 0x3137352e3130302e35302e3234, 'Chinsomphors', '2020-04-01 11:41:55'),
(1594, 23, NULL, 0x3137352e3130302e35302e3234, 'Chinsomphors', '2020-04-02 02:25:51'),
(1595, 23, NULL, 0x3137352e3130302e35302e3234, 'Chinsomphors', '2020-04-02 04:58:42'),
(1596, 23, NULL, 0x3137352e3130302e35302e3234, 'Chinsomphors', '2020-04-02 10:17:58'),
(1597, 23, NULL, 0x3137352e3130302e35302e3139, 'Chinsomphors', '2020-04-03 02:15:33'),
(1598, 23, NULL, 0x3137352e3130302e35302e3139, 'Chinsomphors', '2020-04-03 09:54:01'),
(1599, 23, NULL, 0x3137352e3130302e35302e3139, 'Chinsomphors', '2020-04-03 12:19:56'),
(1600, 23, NULL, 0x3137352e3130302e35302e3231, 'Chinsomphors', '2020-04-04 10:21:16'),
(1601, 23, NULL, 0x3137352e3130302e35302e3231, 'Chinsomphors', '2020-04-05 01:26:04'),
(1602, 23, NULL, 0x3137352e3130302e35302e3230, 'Chinsomphors', '2020-04-05 09:15:36'),
(1603, 23, NULL, 0x3137352e3130302e35302e3138, 'Chinsomphors', '2020-04-06 03:21:40'),
(1604, 23, NULL, 0x3137352e3130302e35302e3138, 'Chinsomphors', '2020-04-06 10:18:32'),
(1605, 23, NULL, 0x3137352e3130302e35302e3138, 'Chinsomphors', '2020-04-06 11:55:59'),
(1606, 23, NULL, 0x3137352e3130302e35302e3138, 'Chinsomphors', '2020-04-08 08:04:58'),
(1607, 23, NULL, 0x3137352e3130302e35302e3138, 'Chinsomphors', '2020-04-08 11:53:40'),
(1608, 23, NULL, 0x3137352e3130302e35302e3138, 'Chinsomphors', '2020-04-09 06:25:11'),
(1609, 23, NULL, 0x3137352e3130302e35302e3138, 'Chinsomphors', '2020-04-09 10:57:18'),
(1610, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-04-10 01:58:32'),
(1611, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-04-10 10:08:05'),
(1612, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-04-10 10:14:04'),
(1613, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-04-12 02:16:46'),
(1614, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-04-12 05:40:52'),
(1615, 18, NULL, 0x3137352e3130302e35302e3139, 'hongdavy', '2020-04-15 04:48:30'),
(1616, 1, NULL, 0x34322e3131352e33302e323236, 'admin@855solution.com', '2020-04-23 09:51:01'),
(1617, 1, NULL, 0x34322e3131352e33302e323236, 'admin@855solution.com', '2020-04-23 10:14:49'),
(1618, 1, NULL, 0x34322e3131352e33302e323236, 'admin@855solution.com', '2020-04-23 10:24:29'),
(1619, 1, NULL, 0x34322e3131352e33302e323236, 'admin@855solution.com', '2020-04-23 10:26:40'),
(1620, 1, NULL, 0x34322e3131352e33302e323236, 'admin@855solution.com', '2020-04-23 10:44:44'),
(1621, 1, NULL, 0x34322e3131352e33302e323236, 'admin@855solution.com', '2020-04-24 05:52:08'),
(1622, 1, NULL, 0x34322e3131352e33302e323236, 'admin@855solution.com', '2020-04-24 05:54:27'),
(1623, 23, NULL, 0x3137352e3130302e35302e3232, 'Chinsomphors', '2020-04-26 10:56:36'),
(1624, 23, NULL, 0x3137352e3130302e35302e3232, 'Chinsomphors', '2020-04-28 02:15:37'),
(1625, 23, NULL, 0x3137352e3130302e35302e3232, 'Chinsomphors', '2020-04-29 08:29:00'),
(1626, 23, NULL, 0x3137352e3130302e35302e3232, 'Chinsomphors', '2020-04-29 10:23:05'),
(1627, 23, NULL, 0x3137352e3130302e35302e3232, 'Chinsomphors', '2020-04-29 11:49:47'),
(1628, 23, NULL, 0x3137352e3130302e35302e3232, 'Chinsomphors', '2020-04-29 12:00:52'),
(1629, 23, NULL, 0x3137352e3130302e35302e3232, 'Chinsomphors', '2020-04-30 06:12:21'),
(1630, 23, NULL, 0x3137352e3130302e35302e3232, 'Chinsomphors', '2020-04-30 09:34:55'),
(1631, 23, NULL, 0x3137352e3130302e35302e3232, 'Chinsomphors', '2020-05-01 00:10:20'),
(1632, 23, NULL, 0x3137352e3130302e35302e3232, 'Chinsomphors', '2020-05-01 09:55:54'),
(1633, 23, NULL, 0x3137352e3130302e35302e3232, 'Chinsomphors', '2020-05-02 04:34:09'),
(1634, 23, NULL, 0x3137352e3130302e35302e3237, 'Chinsomphors', '2020-05-02 11:03:42'),
(1635, 23, NULL, 0x3137352e3130302e35302e3237, 'Chinsomphors', '2020-05-02 12:34:17'),
(1636, 23, NULL, 0x3137352e3130302e35302e3237, 'Chinsomphors', '2020-05-03 10:36:51'),
(1637, 23, NULL, 0x3137352e3130302e35302e3237, 'Chinsomphors', '2020-05-04 02:22:27'),
(1638, 23, NULL, 0x3137352e3130302e35302e3237, 'Chinsomphors', '2020-05-04 05:09:51'),
(1639, 23, NULL, 0x3137352e3130302e35302e3237, 'Chinsomphors', '2020-05-04 10:41:03'),
(1640, 23, NULL, 0x3137352e3130302e35302e3237, 'Chinsomphors', '2020-05-04 10:42:44'),
(1641, 23, NULL, 0x3137352e3130302e35302e3237, 'Chinsomphors', '2020-05-06 08:38:39'),
(1642, 23, NULL, 0x3137352e3130302e35302e3237, 'Chinsomphors', '2020-05-07 03:42:13'),
(1643, 23, NULL, 0x3137352e3130302e35302e3237, 'Chinsomphors', '2020-05-09 02:40:11'),
(1644, 23, NULL, 0x3137352e3130302e35302e3237, 'Chinsomphors', '2020-05-09 08:34:58'),
(1645, 23, NULL, 0x3137352e3130302e35302e3237, 'Chinsomphors', '2020-05-09 09:30:36'),
(1646, 23, NULL, 0x3137352e3130302e35302e3237, 'Chinsomphors', '2020-05-09 11:42:41'),
(1647, 23, NULL, 0x3137352e3130302e35302e3237, 'Chinsomphors', '2020-05-10 11:48:28'),
(1648, 23, NULL, 0x3137352e3130302e35302e3237, 'Chinsomphors', '2020-05-11 11:25:42'),
(1649, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-05-12 09:22:48'),
(1650, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-05-12 11:46:49'),
(1651, 23, NULL, 0x3137352e3130302e35302e3239, 'Chinsomphors', '2020-05-12 12:25:27'),
(1652, 23, NULL, 0x3137352e3130302e35302e3331, 'Chinsomphors', '2020-05-13 07:40:57'),
(1653, 23, NULL, 0x3137352e3130302e35302e3331, 'Chinsomphors', '2020-05-13 07:45:50'),
(1654, 23, NULL, 0x3137352e3130302e35302e3331, 'Chinsomphors', '2020-05-13 07:48:32'),
(1655, 23, NULL, 0x3137352e3130302e35302e3330, 'Chinsomphors', '2020-05-15 07:38:27'),
(1656, 23, NULL, 0x3137352e3130302e35302e3330, 'Chinsomphors', '2020-05-15 09:58:48'),
(1657, 23, NULL, 0x3137352e3130302e35302e3330, 'Chinsomphors', '2020-05-16 08:23:39'),
(1658, 23, NULL, 0x3137352e3130302e35302e3330, 'Chinsomphors', '2020-05-16 12:13:58'),
(1659, 23, NULL, 0x3137352e3130302e35302e3330, 'Chinsomphors', '2020-05-17 10:36:21'),
(1660, 23, NULL, 0x3137352e3130302e35302e3330, 'Chinsomphors', '2020-05-19 11:05:45'),
(1661, 23, NULL, 0x3137352e3130302e35302e3234, 'Chinsomphors', '2020-05-20 06:26:14'),
(1662, 23, NULL, 0x3137352e3130302e35302e3234, 'Chinsomphors', '2020-05-20 11:32:28'),
(1663, 23, NULL, 0x3137352e3130302e35302e3234, 'Chinsomphors', '2020-05-21 03:26:01'),
(1664, 23, NULL, 0x3137352e3130302e35302e3234, 'Chinsomphors', '2020-05-22 07:22:28'),
(1665, 23, NULL, 0x3137352e3130302e35302e3234, 'Chinsomphors', '2020-05-22 07:34:49'),
(1666, 23, NULL, 0x3137352e3130302e35302e3234, 'Chinsomphors', '2020-05-22 10:10:30'),
(1667, 23, NULL, 0x3137352e3130302e35302e3234, 'Chinsomphors', '2020-05-25 10:09:41'),
(1668, 23, NULL, 0x3137352e3130302e35302e3234, 'Chinsomphors', '2020-05-26 05:38:27'),
(1669, 23, NULL, 0x3137352e3130302e35302e3234, 'Chinsomphors', '2020-05-27 11:18:20'),
(1670, 23, NULL, 0x3137352e3130302e35302e3234, 'Chinsomphors', '2020-05-28 10:02:02'),
(1671, 23, NULL, 0x3137352e3130302e35302e3234, 'Chinsomphors', '2020-05-29 10:40:46'),
(1672, 23, NULL, 0x3137352e3130302e35302e3234, 'Chinsomphors', '2020-05-30 11:04:06'),
(1673, 23, NULL, 0x3137352e3130302e35302e3330, 'Chinsomphors', '2020-05-31 08:42:24'),
(1674, 23, NULL, 0x3137352e3130302e35302e3330, 'Chinsomphors', '2020-06-01 09:21:26'),
(1675, 23, NULL, 0x3137352e3130302e35302e3330, 'Chinsomphors', '2020-06-02 08:48:45'),
(1676, 23, NULL, 0x3137352e3130302e35302e3330, 'Chinsomphors', '2020-06-02 11:47:42'),
(1677, 23, NULL, 0x3137352e3130302e35302e3330, 'Chinsomphors', '2020-06-03 04:59:06'),
(1678, 23, NULL, 0x3137352e3130302e35302e3330, 'Chinsomphors', '2020-06-05 03:49:56'),
(1679, 23, NULL, 0x3137352e3130302e35302e3330, 'Chinsomphors', '2020-06-05 06:48:16'),
(1680, 18, NULL, 0x3131372e3133362e382e3138, 'hongdavy', '2020-06-06 08:20:24'),
(1681, 23, NULL, 0x3137352e3130302e35302e3330, 'Chinsomphors', '2020-06-06 12:03:51'),
(1682, 23, NULL, 0x3137352e3130302e35302e3330, 'Chinsomphors', '2020-06-07 11:19:38'),
(1683, 23, NULL, 0x3137352e3130302e35302e3330, 'Chinsomphors', '2020-06-08 11:13:04'),
(1684, 23, NULL, 0x3137352e3130302e35302e3330, 'Chinsomphors', '2020-06-09 07:09:24'),
(1685, 23, NULL, 0x3137352e3130302e35302e3330, 'Chinsomphors', '2020-06-09 11:37:43'),
(1686, 23, NULL, 0x3137352e3130302e35302e3330, 'Chinsomphors', '2020-06-10 04:46:39'),
(1687, 23, NULL, 0x3137352e3130302e35302e3330, 'Chinsomphors', '2020-06-10 04:49:54'),
(1688, 23, NULL, 0x3137352e3130302e35302e3138, 'Chinsomphors', '2020-06-11 10:19:31'),
(1689, 23, NULL, 0x3137352e3130302e35302e3138, 'Chinsomphors', '2020-06-12 10:37:15'),
(1690, 23, NULL, 0x3137352e3130302e35302e3138, 'Chinsomphors', '2020-06-12 11:54:55'),
(1691, 23, NULL, 0x3137352e3130302e35302e3138, 'Chinsomphors', '2020-06-13 06:54:54'),
(1692, 23, NULL, 0x3137352e3130302e35302e3138, 'Chinsomphors', '2020-06-13 10:00:32'),
(1693, 23, NULL, 0x3137352e3130302e35302e3138, 'Chinsomphors', '2020-06-15 03:16:26'),
(1694, 23, NULL, 0x3137352e3130302e35302e3138, 'Chinsomphors', '2020-06-15 08:24:23'),
(1695, 23, NULL, 0x3137352e3130302e35302e3138, 'Chinsomphors', '2020-06-16 09:41:51'),
(1696, 23, NULL, 0x3137352e3130302e35302e3236, 'Chinsomphors', '2020-06-18 07:13:16'),
(1697, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2020-06-19 07:28:05'),
(1698, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2020-06-20 01:59:50'),
(1699, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2020-06-20 10:04:11'),
(1700, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2020-06-21 03:47:27'),
(1701, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2020-06-21 07:30:12'),
(1702, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2020-06-22 01:28:14'),
(1703, 1, NULL, 0x3a3a31, 'admin@855solution.com', '2020-06-22 05:05:15');

-- --------------------------------------------------------

--
-- Table structure for table `sma_variants`
--

DROP TABLE IF EXISTS `sma_variants`;
CREATE TABLE IF NOT EXISTS `sma_variants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_variants`
--

INSERT INTO `sma_variants` (`id`, `name`) VALUES
(1, 'test');

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses`
--

DROP TABLE IF EXISTS `sma_warehouses`;
CREATE TABLE IF NOT EXISTS `sma_warehouses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `map` varchar(255) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `price_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses`
--

INSERT INTO `sma_warehouses` (`id`, `code`, `name`, `address`, `map`, `phone`, `email`, `price_group_id`) VALUES
(1, '01', 'Adorable Anakut', '<p>Phnom Penh</p>', NULL, '1223344445', 'adorableanakut@gmail.com', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products`
--

DROP TABLE IF EXISTS `sma_warehouses_products`;
CREATE TABLE IF NOT EXISTS `sma_warehouses_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL,
  `avg_cost` decimal(25,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sma_warehouses_products`
--

INSERT INTO `sma_warehouses_products` (`id`, `product_id`, `warehouse_id`, `quantity`, `rack`, `avg_cost`) VALUES
(25, 24, 1, '0.0000', NULL, '0.0000'),
(26, 23, 1, '0.0000', NULL, '0.0000'),
(31, 26, 1, '0.0000', NULL, NULL),
(32, 28, 1, '0.0000', NULL, NULL),
(34, 29, 1, '0.0000', NULL, NULL),
(35, 27, 1, '0.0000', NULL, '0.0000'),
(42, 46, 1, '0.0000', NULL, '0.0000'),
(53, 57, 1, '0.0000', NULL, '1.7582'),
(61, 66, 1, '0.0000', NULL, '0.0000'),
(96, 101, 1, '0.0000', NULL, '0.0000'),
(97, 102, 1, '0.0000', NULL, '0.0000'),
(109, 114, 1, '0.0000', NULL, '0.0000'),
(110, 115, 1, '0.0000', NULL, '0.0000'),
(113, 89, 1, '0.0000', NULL, '0.0000'),
(140, 130, 1, '0.0000', NULL, NULL),
(141, 132, 1, '0.0000', NULL, NULL),
(142, 127, 1, '0.0000', NULL, NULL),
(143, 79, 1, '0.0000', NULL, NULL),
(144, 125, 1, '0.0000', NULL, NULL),
(145, 120, 1, '0.0000', NULL, NULL),
(146, 65, 1, '0.0000', NULL, NULL),
(184, 180, 1, '0.0000', NULL, '0.6640'),
(191, 189, 1, '0.0000', NULL, '0.0000'),
(195, 194, 1, '0.0000', NULL, '0.0000'),
(196, 195, 1, '0.0000', NULL, '0.0000'),
(213, 212, 1, '0.0000', NULL, '0.0000'),
(221, 219, 1, '0.0000', NULL, NULL),
(225, 223, 1, '0.0000', NULL, '0.0000'),
(228, 227, 1, '0.0000', NULL, '0.0000'),
(233, 234, 1, '0.0000', NULL, '0.0000'),
(235, 176, 1, '0.0000', NULL, '2.1956'),
(236, 181, 1, '0.0000', NULL, '1.0843'),
(237, 126, 1, '0.0000', NULL, '0.8801'),
(238, 54, 1, '0.0000', NULL, '2.3168'),
(239, 134, 1, '0.0000', NULL, '2.1400'),
(240, 87, 1, '0.0000', NULL, '1.6800'),
(241, 61, 1, '0.0000', NULL, '1.8300'),
(246, 241, 1, '0.0000', NULL, '0.7015'),
(249, 244, 1, '0.0000', NULL, '1.9023'),
(250, 245, 1, '0.0000', NULL, '0.1453'),
(251, 246, 1, '0.0000', NULL, '1.8115'),
(252, 183, 1, '0.0000', NULL, '2.1463'),
(253, 184, 1, '0.0000', NULL, '2.2822'),
(254, 192, 1, '0.0000', NULL, '1.4641'),
(255, 193, 1, '0.0000', NULL, '1.4500'),
(256, 224, 1, '0.0000', NULL, '2.0000'),
(258, 248, 1, '0.0000', NULL, '2.8827'),
(259, 249, 1, '0.0000', NULL, '0.0000'),
(260, 250, 1, '0.0000', NULL, '0.0000'),
(261, 251, 1, '0.0000', NULL, '0.0000'),
(262, 252, 1, '0.0000', NULL, '0.0000'),
(263, 255, 1, '0.0000', NULL, '1.9287'),
(264, 254, 1, '0.0000', NULL, '1.5862'),
(265, 2, 1, '-4.0000', NULL, '1.5000'),
(266, 1, 1, '-2.0000', NULL, '0.0000'),
(267, 3, 1, '8.0000', NULL, '3.0000'),
(268, 4, 1, '8.0000', NULL, '3.0000'),
(269, 5, 1, '7.0000', NULL, '3.0000');

-- --------------------------------------------------------

--
-- Table structure for table `sma_warehouses_products_variants`
--

DROP TABLE IF EXISTS `sma_warehouses_products_variants`;
CREATE TABLE IF NOT EXISTS `sma_warehouses_products_variants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity` decimal(15,4) NOT NULL,
  `rack` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `option_id` (`option_id`),
  KEY `product_id` (`product_id`),
  KEY `warehouse_id` (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
