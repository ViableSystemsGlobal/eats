-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 30, 2025 at 02:45 AM
-- Server version: 10.11.10-MariaDB-log
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u259087657_eats`
--

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `area_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `branch_id`, `area_name`, `created_at`, `updated_at`) VALUES
(1, 3, 'Main Area', '2025-04-19 03:15:08', '2025-04-19 03:15:08'),
(2, 4, 'Main Space', '2025-05-30 08:35:33', '2025-05-30 08:35:33'),
(3, 4, 'High Table', '2025-07-12 00:56:02', '2025-07-12 00:56:02'),
(4, 4, 'Lovers Area', '2025-07-12 00:56:22', '2025-07-12 00:56:22');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unique_hash` varchar(64) DEFAULT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `cloned_branch_name` varchar(191) DEFAULT NULL,
  `cloned_branch_id` varchar(191) DEFAULT NULL,
  `is_menu_clone` tinyint(1) NOT NULL DEFAULT 0,
  `is_item_categories_clone` tinyint(1) NOT NULL DEFAULT 0,
  `is_menu_items_clone` tinyint(1) NOT NULL DEFAULT 0,
  `is_item_modifiers_clone` tinyint(1) NOT NULL DEFAULT 0,
  `is_clone_reservation_settings` tinyint(1) NOT NULL DEFAULT 0,
  `is_clone_delivery_settings` tinyint(1) NOT NULL DEFAULT 0,
  `is_clone_kot_setting` tinyint(1) NOT NULL DEFAULT 0,
  `is_modifiers_groups_clone` tinyint(1) NOT NULL DEFAULT 0,
  `address` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lat` decimal(10,7) DEFAULT NULL,
  `lng` decimal(10,7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `unique_hash`, `restaurant_id`, `name`, `cloned_branch_name`, `cloned_branch_id`, `is_menu_clone`, `is_item_categories_clone`, `is_menu_items_clone`, `is_item_modifiers_clone`, `is_clone_reservation_settings`, `is_clone_delivery_settings`, `is_clone_kot_setting`, `is_modifiers_groups_clone`, `address`, `created_at`, `updated_at`, `lat`, `lng`) VALUES
(1, 'd048b5831af48cc6a588', 1, 'Dorrishaven', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '245 Clifford Row Apt. 154\nLake Terrellbury, OK 78218', '2025-04-18 06:02:05', '2025-07-12 20:17:00', NULL, NULL),
(2, '86535004c8528f96679d', 1, 'McCulloughmouth', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, '8664 Hirthe Place\nEverettside, NC 57198-3423', '2025-04-18 06:02:05', '2025-07-12 20:17:00', NULL, NULL),
(3, '02886b01dea2f083949c', 2, 'Main', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 'm', '2025-04-18 20:42:26', '2025-07-12 20:17:00', NULL, NULL),
(4, '8adc517ef2ae7fc3b697', 3, 'BackPass Accra Central', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 'BackPass Restaurant,\nAsafoatse Nettey Rd, \nAccra, Greater Accra. ', '2025-05-30 08:33:04', '2025-07-12 20:17:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `branch_delivery_settings`
--

CREATE TABLE `branch_delivery_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `max_radius` decimal(8,2) NOT NULL DEFAULT 5.00,
  `unit` enum('km','miles') NOT NULL DEFAULT 'km',
  `fee_type` varchar(191) NOT NULL DEFAULT 'fixed',
  `fixed_fee` decimal(8,2) DEFAULT NULL,
  `per_distance_rate` decimal(8,2) DEFAULT NULL,
  `free_delivery_over_amount` decimal(8,2) DEFAULT NULL,
  `free_delivery_within_radius` double DEFAULT NULL,
  `delivery_schedule_start` time DEFAULT NULL,
  `delivery_schedule_end` time DEFAULT NULL,
  `prep_time_minutes` int(11) NOT NULL DEFAULT 20,
  `additional_eta_buffer_time` int(11) DEFAULT NULL,
  `avg_delivery_speed_kmh` int(11) NOT NULL DEFAULT 30,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(191) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(191) NOT NULL,
  `owner` varchar(191) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_setting_id` bigint(20) UNSIGNED DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `contact_company` varchar(191) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `language_setting_id`, `email`, `contact_company`, `image`, `address`, `created_at`, `updated_at`) VALUES
(1, 1, 'support@usethriveerp.com', 'Viable Systems', NULL, '55 Kwame Nkrumah Avenue, Adabraka, Ghana', '2025-06-16 07:59:56', '2025-07-17 21:52:20');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `countries_code` char(2) NOT NULL,
  `countries_name` varchar(191) NOT NULL,
  `phonecode` varchar(191) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `countries_code`, `countries_name`, `phonecode`) VALUES
(1, 'AF', 'Afghanistan', '93'),
(2, 'AX', 'Åland Islands', '358'),
(3, 'AL', 'Albania', '355'),
(4, 'DZ', 'Algeria', '213'),
(5, 'AS', 'American Samoa', '1684'),
(6, 'AD', 'Andorra', '376'),
(7, 'AO', 'Angola', '244'),
(8, 'AI', 'Anguilla', '1264'),
(9, 'AQ', 'Antarctica', '0'),
(10, 'AG', 'Antigua and Barbuda', '1268'),
(11, 'AR', 'Argentina', '54'),
(12, 'AM', 'Armenia', '374'),
(13, 'AW', 'Aruba', '297'),
(14, 'AU', 'Australia', '61'),
(15, 'AT', 'Austria', '43'),
(16, 'AZ', 'Azerbaijan', '994'),
(17, 'BS', 'Bahamas', '1242'),
(18, 'BH', 'Bahrain', '973'),
(19, 'BD', 'Bangladesh', '880'),
(20, 'BB', 'Barbados', '1246'),
(21, 'BY', 'Belarus', '375'),
(22, 'BE', 'Belgium', '32'),
(23, 'BZ', 'Belize', '501'),
(24, 'BJ', 'Benin', '229'),
(25, 'BM', 'Bermuda', '1441'),
(26, 'BT', 'Bhutan', '975'),
(27, 'BO', 'Bolivia, Plurinational State of', '591'),
(28, 'BQ', 'Bonaire, Sint Eustatius and Saba', '599'),
(29, 'BA', 'Bosnia and Herzegovina', '387'),
(30, 'BW', 'Botswana', '267'),
(31, 'BV', 'Bouvet Island', '0'),
(32, 'BR', 'Brazil', '55'),
(33, 'IO', 'British Indian Ocean Territory', '246'),
(34, 'BN', 'Brunei Darussalam', '673'),
(35, 'BG', 'Bulgaria', '359'),
(36, 'BF', 'Burkina Faso', '226'),
(37, 'BI', 'Burundi', '257'),
(38, 'KH', 'Cambodia', '855'),
(39, 'CM', 'Cameroon', '237'),
(40, 'CA', 'Canada', '1'),
(41, 'CV', 'Cape Verde', '238'),
(42, 'KY', 'Cayman Islands', '1345'),
(43, 'CF', 'Central African Republic', '236'),
(44, 'TD', 'Chad', '235'),
(45, 'CL', 'Chile', '56'),
(46, 'CN', 'China', '86'),
(47, 'CX', 'Christmas Island', '61'),
(48, 'CC', 'Cocos (Keeling) Islands', '672'),
(49, 'CO', 'Colombia', '57'),
(50, 'KM', 'Comoros', '269'),
(51, 'CG', 'Congo', '242'),
(52, 'CD', 'Congo, the Democratic Republic of the', '242'),
(53, 'CK', 'Cook Islands', '682'),
(54, 'CR', 'Costa Rica', '506'),
(55, 'CI', 'Côte d\'Ivoire', '225'),
(56, 'HR', 'Croatia', '385'),
(57, 'CU', 'Cuba', '53'),
(58, 'CW', 'Curaçao', '599'),
(59, 'CY', 'Cyprus', '357'),
(60, 'CZ', 'Czech Republic', '420'),
(61, 'DK', 'Denmark', '45'),
(62, 'DJ', 'Djibouti', '253'),
(63, 'DM', 'Dominica', '1767'),
(64, 'DO', 'Dominican Republic', '1809'),
(65, 'EC', 'Ecuador', '593'),
(66, 'EG', 'Egypt', '20'),
(67, 'SV', 'El Salvador', '503'),
(68, 'GQ', 'Equatorial Guinea', '240'),
(69, 'ER', 'Eritrea', '291'),
(70, 'EE', 'Estonia', '372'),
(71, 'ET', 'Ethiopia', '251'),
(72, 'FK', 'Falkland Islands (Malvinas)', '500'),
(73, 'FO', 'Faroe Islands', '298'),
(74, 'FJ', 'Fiji', '679'),
(75, 'FI', 'Finland', '358'),
(76, 'FR', 'France', '33'),
(77, 'GF', 'French Guiana', '594'),
(78, 'PF', 'French Polynesia', '689'),
(79, 'TF', 'French Southern Territories', '0'),
(80, 'GA', 'Gabon', '241'),
(81, 'GM', 'Gambia', '220'),
(82, 'GE', 'Georgia', '995'),
(83, 'DE', 'Germany', '49'),
(84, 'GH', 'Ghana', '233'),
(85, 'GI', 'Gibraltar', '350'),
(86, 'GR', 'Greece', '30'),
(87, 'GL', 'Greenland', '299'),
(88, 'GD', 'Grenada', '1473'),
(89, 'GP', 'Guadeloupe', '590'),
(90, 'GU', 'Guam', '1671'),
(91, 'GT', 'Guatemala', '502'),
(92, 'GG', 'Guernsey', '44'),
(93, 'GN', 'Guinea', '224'),
(94, 'GW', 'Guinea-Bissau', '245'),
(95, 'GY', 'Guyana', '592'),
(96, 'HT', 'Haiti', '509'),
(97, 'HM', 'Heard Island and McDonald Islands', '0'),
(98, 'VA', 'Holy See (Vatican City State)', '39'),
(99, 'HN', 'Honduras', '504'),
(100, 'HK', 'Hong Kong', '852'),
(101, 'HU', 'Hungary', '36'),
(102, 'IS', 'Iceland', '354'),
(103, 'IN', 'India', '91'),
(104, 'ID', 'Indonesia', '62'),
(105, 'IR', 'Iran, Islamic Republic of', '98'),
(106, 'IQ', 'Iraq', '964'),
(107, 'IE', 'Ireland', '353'),
(108, 'IM', 'Isle of Man', '44'),
(109, 'IL', 'Israel', '972'),
(110, 'IT', 'Italy', '39'),
(111, 'JM', 'Jamaica', '1876'),
(112, 'JP', 'Japan', '81'),
(113, 'JE', 'Jersey', '44'),
(114, 'JO', 'Jordan', '962'),
(115, 'KZ', 'Kazakhstan', '7'),
(116, 'KE', 'Kenya', '254'),
(117, 'KI', 'Kiribati', '686'),
(118, 'KP', 'Korea, Democratic People\'s Republic of', '850'),
(119, 'KR', 'Korea, Republic of', '82'),
(120, 'KW', 'Kuwait', '965'),
(121, 'KG', 'Kyrgyzstan', '996'),
(122, 'LA', 'Lao People\'s Democratic Republic', '856'),
(123, 'LV', 'Latvia', '371'),
(124, 'LB', 'Lebanon', '961'),
(125, 'LS', 'Lesotho', '266'),
(126, 'LR', 'Liberia', '231'),
(127, 'LY', 'Libya', '218'),
(128, 'LI', 'Liechtenstein', '423'),
(129, 'LT', 'Lithuania', '370'),
(130, 'LU', 'Luxembourg', '352'),
(131, 'MO', 'Macao', '853'),
(132, 'MK', 'Macedonia, the Former Yugoslav Republic of', '389'),
(133, 'MG', 'Madagascar', '261'),
(134, 'MW', 'Malawi', '265'),
(135, 'MY', 'Malaysia', '60'),
(136, 'MV', 'Maldives', '960'),
(137, 'ML', 'Mali', '223'),
(138, 'MT', 'Malta', '356'),
(139, 'MH', 'Marshall Islands', '692'),
(140, 'MQ', 'Martinique', '596'),
(141, 'MR', 'Mauritania', '222'),
(142, 'MU', 'Mauritius', '230'),
(143, 'YT', 'Mayotte', '269'),
(144, 'MX', 'Mexico', '52'),
(145, 'FM', 'Micronesia, Federated States of', '691'),
(146, 'MD', 'Moldova, Republic of', '373'),
(147, 'MC', 'Monaco', '377'),
(148, 'MN', 'Mongolia', '976'),
(149, 'ME', 'Montenegro', '382'),
(150, 'MS', 'Montserrat', '1664'),
(151, 'MA', 'Morocco', '212'),
(152, 'MZ', 'Mozambique', '258'),
(153, 'MM', 'Myanmar', '95'),
(154, 'NA', 'Namibia', '264'),
(155, 'NR', 'Nauru', '674'),
(156, 'NP', 'Nepal', '977'),
(157, 'NL', 'Netherlands', '31'),
(158, 'NC', 'New Caledonia', '687'),
(159, 'NZ', 'New Zealand', '64'),
(160, 'NI', 'Nicaragua', '505'),
(161, 'NE', 'Niger', '227'),
(162, 'NG', 'Nigeria', '234'),
(163, 'NU', 'Niue', '683'),
(164, 'NF', 'Norfolk Island', '672'),
(165, 'MP', 'Northern Mariana Islands', '1670'),
(166, 'NO', 'Norway', '47'),
(167, 'OM', 'Oman', '968'),
(168, 'PK', 'Pakistan', '92'),
(169, 'PW', 'Palau', '680'),
(170, 'PS', 'Palestine, State of', '970'),
(171, 'PA', 'Panama', '507'),
(172, 'PG', 'Papua New Guinea', '675'),
(173, 'PY', 'Paraguay', '595'),
(174, 'PE', 'Peru', '51'),
(175, 'PH', 'Philippines', '63'),
(176, 'PN', 'Pitcairn', '0'),
(177, 'PL', 'Poland', '48'),
(178, 'PT', 'Portugal', '351'),
(179, 'PR', 'Puerto Rico', '1787'),
(180, 'QA', 'Qatar', '974'),
(181, 'RE', 'Réunion', '262'),
(182, 'RO', 'Romania', '40'),
(183, 'RU', 'Russian Federation', '7'),
(184, 'RW', 'Rwanda', '250'),
(185, 'BL', 'Saint Barthélemy', '590'),
(186, 'SH', 'Saint Helena, Ascension and Tristan da Cunha', '290'),
(187, 'KN', 'Saint Kitts and Nevis', '1869'),
(188, 'LC', 'Saint Lucia', '1758'),
(189, 'MF', 'Saint Martin (French part)', '590'),
(190, 'PM', 'Saint Pierre and Miquelon', '508'),
(191, 'VC', 'Saint Vincent and the Grenadines', '1784'),
(192, 'WS', 'Samoa', '684'),
(193, 'SM', 'San Marino', '378'),
(194, 'ST', 'Sao Tome and Principe', '239'),
(195, 'SA', 'Saudi Arabia', '966'),
(196, 'SN', 'Senegal', '221'),
(197, 'RS', 'Serbia', '381'),
(198, 'SC', 'Seychelles', '248'),
(199, 'SL', 'Sierra Leone', '232'),
(200, 'SG', 'Singapore', '65'),
(201, 'SX', 'Sint Maarten (Dutch part)', '1'),
(202, 'SK', 'Slovakia', '421'),
(203, 'SI', 'Slovenia', '386'),
(204, 'SB', 'Solomon Islands', '677'),
(205, 'SO', 'Somalia', '252'),
(206, 'ZA', 'South Africa', '27'),
(207, 'GS', 'South Georgia and the South Sandwich Islands', '0'),
(208, 'SS', 'South Sudan', '211'),
(209, 'ES', 'Spain', '34'),
(210, 'LK', 'Sri Lanka', '94'),
(211, 'SD', 'Sudan', '249'),
(212, 'SR', 'Suriname', '597'),
(213, 'SJ', 'Svalbard and Jan Mayen', '47'),
(214, 'SZ', 'Swaziland', '268'),
(215, 'SE', 'Sweden', '46'),
(216, 'CH', 'Switzerland', '41'),
(217, 'SY', 'Syrian Arab Republic', '963'),
(218, 'TW', 'Taiwan, Province of China', '886'),
(219, 'TJ', 'Tajikistan', '992'),
(220, 'TZ', 'Tanzania, United Republic of', '255'),
(221, 'TH', 'Thailand', '66'),
(222, 'TL', 'Timor-Leste', '670'),
(223, 'TG', 'Togo', '228'),
(224, 'TK', 'Tokelau', '690'),
(225, 'TO', 'Tonga', '676'),
(226, 'TT', 'Trinidad and Tobago', '1868'),
(227, 'TN', 'Tunisia', '216'),
(228, 'TR', 'Turkey', '90'),
(229, 'TM', 'Turkmenistan', '7370'),
(230, 'TC', 'Turks and Caicos Islands', '1649'),
(231, 'TV', 'Tuvalu', '688'),
(232, 'UG', 'Uganda', '256'),
(233, 'UA', 'Ukraine', '380'),
(234, 'AE', 'United Arab Emirates', '971'),
(235, 'GB', 'United Kingdom', '44'),
(236, 'US', 'United States', '1'),
(237, 'UM', 'United States Minor Outlying Islands', '1'),
(238, 'UY', 'Uruguay', '598'),
(239, 'UZ', 'Uzbekistan', '998'),
(240, 'VU', 'Vanuatu', '678'),
(241, 'VE', 'Venezuela, Bolivarian Republic of', '58'),
(242, 'VN', 'Viet Nam', '84'),
(243, 'VG', 'Virgin Islands, British', '1284'),
(244, 'VI', 'Virgin Islands, U.S.', '1340'),
(245, 'WF', 'Wallis and Futuna', '681'),
(246, 'EH', 'Western Sahara', '212'),
(247, 'YE', 'Yemen', '967'),
(248, 'ZM', 'Zambia', '260'),
(249, 'ZW', 'Zimbabwe', '263');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency_name` varchar(191) NOT NULL,
  `currency_code` varchar(191) NOT NULL,
  `currency_symbol` varchar(191) NOT NULL,
  `currency_position` enum('left','right','left_with_space','right_with_space') NOT NULL DEFAULT 'left',
  `no_of_decimal` int(10) UNSIGNED NOT NULL DEFAULT 2,
  `thousand_separator` varchar(191) DEFAULT ',',
  `decimal_separator` varchar(191) DEFAULT '.',
  `exchange_rate` decimal(16,2) DEFAULT NULL,
  `usd_price` decimal(16,2) DEFAULT NULL,
  `is_cryptocurrency` enum('yes','no') NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `restaurant_id`, `currency_name`, `currency_code`, `currency_symbol`, `currency_position`, `no_of_decimal`, `thousand_separator`, `decimal_separator`, `exchange_rate`, `usd_price`, `is_cryptocurrency`) VALUES
(1, 1, 'Dollars', 'USD', '$', 'left', 2, ',', '.', NULL, NULL, 'no'),
(2, 1, 'Rupee', 'INR', '₹', 'left', 2, ',', '.', NULL, NULL, 'no'),
(3, 1, 'Pounds', 'GBP', '£', 'left', 2, ',', '.', NULL, NULL, 'no'),
(4, 1, 'Euros', 'EUR', '€', 'left', 2, ',', '.', NULL, NULL, 'no'),
(5, 2, 'Dollars', 'USD', '$', 'left', 2, ',', '.', NULL, NULL, 'no'),
(6, 2, 'Ghana Cedis', 'GHS', 'GH₵', 'left', 2, ',', '.', NULL, NULL, 'no'),
(7, 2, 'Pounds', 'GBP', '£', 'left', 2, ',', '.', NULL, NULL, 'no'),
(8, 2, 'Euros', 'EUR', '€', 'left', 2, ',', '.', NULL, NULL, 'no'),
(9, 3, 'GHS', 'GHS', 'GHS', 'left', 2, ',', '.', NULL, NULL, 'no'),
(10, 3, 'Rupee', 'INR', '₹', 'left', 2, ',', '.', NULL, NULL, 'no'),
(11, 3, 'Pounds', 'GBP', '£', 'left', 2, ',', '.', NULL, NULL, 'no'),
(12, 3, 'Euros', 'EUR', '€', 'left', 2, ',', '.', NULL, NULL, 'no');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `email_otp` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `delivery_address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `restaurant_id`, `name`, `phone`, `email`, `email_otp`, `created_at`, `updated_at`, `delivery_address`) VALUES
(1, 3, 'Nana', '0570150105', 'ysasu38@gmail.com', NULL, '2025-07-17 21:20:14', '2025-07-17 21:20:14', 'plot 62. '),
(2, 3, 'Dorcas', NULL, NULL, NULL, '2025-07-23 18:03:44', '2025-07-23 19:05:10', NULL),
(3, 3, 'Nana', '0281232310', 'baron@gmail.com', NULL, '2025-07-23 18:48:04', '2025-07-23 18:48:04', 'To Absa');

-- --------------------------------------------------------

--
-- Table structure for table `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `label` varchar(191) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `lat` decimal(10,7) DEFAULT NULL,
  `lng` decimal(10,7) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_menus`
--

CREATE TABLE `custom_menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_name` varchar(191) NOT NULL,
  `menu_slug` varchar(191) NOT NULL,
  `menu_content` longtext DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `position` enum('header','footer') NOT NULL DEFAULT 'header',
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_executives`
--

CREATE TABLE `delivery_executives` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `photo` varchar(191) DEFAULT NULL,
  `status` enum('available','on_delivery','inactive') NOT NULL DEFAULT 'available',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_fee_tiers`
--

CREATE TABLE `delivery_fee_tiers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `min_distance` double DEFAULT NULL,
  `max_distance` double DEFAULT NULL,
  `fee` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `desktop_applications`
--

CREATE TABLE `desktop_applications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `windows_file_path` varchar(191) DEFAULT NULL,
  `mac_intel_file_path` varchar(191) DEFAULT NULL,
  `linux_file_path` varchar(191) DEFAULT NULL,
  `mac_silicon_file_path` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `desktop_applications`
--

INSERT INTO `desktop_applications` (`id`, `windows_file_path`, `mac_intel_file_path`, `linux_file_path`, `mac_silicon_file_path`, `created_at`, `updated_at`) VALUES
(1, 'https://envato.froid.works/app/download/windows', 'https://envato.froid.works/app/download/macos-intel', 'https://envato.froid.works/app/download/linux', 'https://envato.froid.works/app/download/macos-silicon', '2025-07-12 20:17:00', '2025-07-12 20:17:00');

-- --------------------------------------------------------

--
-- Table structure for table `email_settings`
--

CREATE TABLE `email_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mail_from_name` varchar(191) DEFAULT NULL,
  `mail_from_email` varchar(191) DEFAULT NULL,
  `enable_queue` enum('yes','no') NOT NULL DEFAULT 'no',
  `mail_driver` enum('mail','smtp') NOT NULL DEFAULT 'mail',
  `smtp_host` varchar(191) DEFAULT NULL,
  `smtp_port` varchar(191) DEFAULT NULL,
  `smtp_encryption` varchar(191) DEFAULT NULL,
  `mail_username` varchar(191) DEFAULT NULL,
  `mail_password` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email_verified` tinyint(1) NOT NULL DEFAULT 0,
  `verified` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_settings`
--

INSERT INTO `email_settings` (`id`, `mail_from_name`, `mail_from_email`, `enable_queue`, `mail_driver`, `smtp_host`, `smtp_port`, `smtp_encryption`, `mail_username`, `mail_password`, `created_at`, `updated_at`, `email_verified`, `verified`) VALUES
(1, 'Thrive Eats', 'hello@eats.usethriveerp.com', 'no', 'smtp', 'smtp.hostinger.com', '465', 'ssl', 'hello@eats.usethriveerp.com', 'T$aJ*wV7:', '2025-04-18 06:02:05', '2025-04-18 06:10:27', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `expense_category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `expense_title` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `expense_date` date NOT NULL,
  `payment_status` varchar(191) NOT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_due_date` date DEFAULT NULL,
  `payment_method` varchar(191) DEFAULT NULL,
  `receipt_path` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expense_categories`
--

INSERT INTO `expense_categories` (`id`, `branch_id`, `name`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 4, 'Indirect Cost', NULL, 1, '2025-07-23 18:00:05', '2025-07-23 18:00:05');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `file_storage`
--

CREATE TABLE `file_storage` (
  `id` int(10) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `path` varchar(191) NOT NULL,
  `filename` varchar(191) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `size` int(10) UNSIGNED NOT NULL,
  `storage_location` enum('local','aws_s3','digitalocean','wasabi','minio') NOT NULL DEFAULT 'local',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `file_storage`
--

INSERT INTO `file_storage` (`id`, `restaurant_id`, `path`, `filename`, `type`, `size`, `storage_location`, `created_at`, `updated_at`) VALUES
(1, 1, 'qrcodes', 'qrcode-branch-1-1.png', 'image/png', 2558, 'local', '2025-04-18 06:02:05', '2025-04-18 06:02:05'),
(2, 1, 'qrcodes', 'qrcode-branch-2-1.png', 'image/png', 2578, 'local', '2025-04-18 06:02:05', '2025-04-18 06:02:05'),
(3, 2, 'qrcodes', 'qrcode-branch-3-2.png', 'image/png', 2524, 'local', '2025-04-18 20:42:26', '2025-04-18 20:42:26'),
(4, NULL, 'logo', '37edd5a3c275b50b53244239613a16a2.png', 'image/png', 13730, 'local', '2025-04-19 02:29:08', '2025-04-19 02:29:08'),
(5, 2, 'item', 'fa497bf5667802b013057c27ef6a3e60.png', 'image/png', 2078635, 'local', '2025-04-19 02:53:35', '2025-04-19 02:53:35'),
(6, 2, 'qrcodes', 'qrcode-3-t01.png', 'image/png', 4944, 'local', '2025-04-19 03:15:27', '2025-04-19 03:15:27'),
(7, 2, 'item', 'd340bf9ca1342c7f00cd033c89bab455.png', 'image/png', 2286931, 'local', '2025-04-19 03:18:27', '2025-04-19 03:18:27'),
(8, 2, 'logo', '4424ce38598620aa9f89d9803797f1d9.jpeg', 'image/jpeg', 136094, 'local', '2025-04-21 00:56:50', '2025-04-21 00:56:50'),
(9, 3, 'qrcodes', 'qrcode-branch-4-3.png', 'image/png', 2777, 'local', '2025-05-30 08:33:04', '2025-05-30 08:33:04'),
(11, 3, 'qrcodes', 'qrcode-4-6.png', 'image/png', 4648, 'local', '2025-06-06 04:35:58', '2025-06-06 04:35:58'),
(12, 3, 'item', 'ff8e502c4648e1cd3bb013f9bb293a44.jpg', 'image/jpeg', 111298, 'local', '2025-06-13 09:28:26', '2025-06-13 09:28:26'),
(13, 3, 'item', 'fcf9aaec4aee2bff505d8039fa584f70.jpg', 'image/jpeg', 413946, 'local', '2025-06-13 10:23:09', '2025-06-13 10:23:09'),
(14, 3, 'item', 'a295b56dabde1c8fa8be55da29a9074b.webp', 'image/webp', 10628, 'local', '2025-06-13 10:28:26', '2025-06-13 10:28:26'),
(15, 3, 'item', 'b32fcfd8777ea2f97353c1aa79bf872d.jpg', 'image/jpeg', 369166, 'local', '2025-06-13 10:33:44', '2025-06-13 10:33:44'),
(16, 3, 'item', '94cf8927a5c98f1d650dd1150808cd4b.jpg', 'image/jpeg', 216554, 'local', '2025-06-13 10:43:20', '2025-06-13 10:43:20'),
(17, 3, 'item', '1c819e452278d6f2adef8b051026a855.jpg', 'image/jpeg', 84855, 'local', '2025-06-13 10:59:44', '2025-06-13 10:59:44'),
(18, 3, 'item', '6498e6cee50a25b4f0a9f6e4dcd9b831.webp', 'image/webp', 7588, 'local', '2025-06-13 11:09:24', '2025-06-13 11:09:24'),
(19, 3, 'item', 'd78b60d68b7b42505a6be501de9c4135.webp', 'image/webp', 6040, 'local', '2025-06-13 11:11:38', '2025-06-13 11:11:38'),
(20, 3, 'item', 'edd0ca511809937c58d0bcadd460bccb.webp', 'image/webp', 6040, 'local', '2025-06-13 11:13:12', '2025-06-13 11:13:12'),
(21, 3, 'item', 'fb9755d2bbbc7cb56b9c273d8fb48bf8.webp', 'image/webp', 9960, 'local', '2025-06-13 11:19:26', '2025-06-13 11:19:26'),
(22, 3, 'item', '84bb67beb4abd6fd31c76373fa628692.webp', 'image/webp', 10926, 'local', '2025-06-13 12:51:47', '2025-06-13 12:51:47'),
(23, 3, 'item', '9c7fdf51baf6dc2c723db09a8935ea9a.webp', 'image/webp', 10380, 'local', '2025-06-13 12:57:46', '2025-06-13 12:57:46'),
(24, 3, 'item', '9affee768b5243457f6dd77a9c1a636c.png', 'image/png', 3325686, 'local', '2025-06-13 13:03:49', '2025-06-13 13:03:49'),
(25, 3, 'item', '5b99baabbe89c600af265c1f2134c2c4.jpg', 'image/jpeg', 74027, 'local', '2025-06-13 13:35:37', '2025-06-13 13:35:37'),
(26, 3, 'item', 'e178ae349e1d7f71bd407dffebe79e1d.webp', 'image/webp', 9028, 'local', '2025-06-13 13:39:31', '2025-06-13 13:39:31'),
(27, 3, 'item', '2201dfc72b2579934cbf5f33bd4f6871.webp', 'image/webp', 10380, 'local', '2025-06-13 13:39:55', '2025-06-13 13:39:55'),
(28, 3, 'item', '3999c3b3fd42e64e73f433133c3fee11.webp', 'image/webp', 10380, 'local', '2025-06-13 13:40:53', '2025-06-13 13:40:53'),
(29, 3, 'item', '411daca4c7ebc992f7ebf6bd424f860b.jpg', 'image/jpeg', 264685, 'local', '2025-06-13 13:46:47', '2025-06-13 13:46:47'),
(30, 3, 'item', 'fb369c27572c04f1447e70f0d6d06f2f.jpg', 'image/jpeg', 264685, 'local', '2025-06-13 13:48:46', '2025-06-13 13:48:46'),
(31, 3, 'item', '17f9df2044bc193213f00737a956f8f3.webp', 'image/webp', 9262, 'local', '2025-06-13 13:51:31', '2025-06-13 13:51:31'),
(32, 3, 'item', '7ef122968c9a5e671980ffbf8f842e51.webp', 'image/webp', 8676, 'local', '2025-06-13 13:55:44', '2025-06-13 13:55:44'),
(33, 3, 'item', '302c452236566b324e060675ea3f9be8.jpeg', 'image/jpeg', 12610, 'local', '2025-06-13 13:56:44', '2025-06-13 13:56:44'),
(34, 3, 'item', '15e349df443112166c6d340b2ef50e9b.webp', 'image/webp', 9960, 'local', '2025-06-13 13:58:38', '2025-06-13 13:58:38'),
(35, 3, 'item', '4ba49cabc8efd658c6ed8eab61161f57.jpeg', 'image/jpeg', 12111, 'local', '2025-06-13 15:44:05', '2025-06-13 15:44:05'),
(36, 3, 'item', 'bd0b16196e92cfa4ada00a95b03b342c.jpeg', 'image/jpeg', 12111, 'local', '2025-06-13 15:44:40', '2025-06-13 15:44:40'),
(37, 3, 'item', '694db3faf4a03af91d64264866e6895b.webp', 'image/webp', 3312, 'local', '2025-06-13 15:46:21', '2025-06-13 15:46:21'),
(38, 3, 'item', 'fc6e4fdd1688b604817bbea8e2e37d96.webp', 'image/webp', 5070, 'local', '2025-06-13 15:47:56', '2025-06-13 15:47:56'),
(39, 3, 'item', 'ca73580d1ca3aec01b440c2038f430a2.webp', 'image/webp', 2142, 'local', '2025-06-13 15:57:19', '2025-06-13 15:57:19'),
(40, 3, 'item', 'f1927177785247bcc2852fc8daefbed6.webp', 'image/webp', 1912, 'local', '2025-06-13 16:00:11', '2025-06-13 16:00:11'),
(41, 3, 'item', '59b138c6a08005d5474e1bd5810644ec.webp', 'image/webp', 3474, 'local', '2025-06-13 16:02:38', '2025-06-13 16:02:38'),
(42, 3, 'item', '75083ad24059bc496226bd40aaa38128.webp', 'image/webp', 5122, 'local', '2025-06-13 16:04:14', '2025-06-13 16:04:14'),
(43, 3, 'item', '11a5dbf901ce3b658f9bdee888ba93a3.webp', 'image/webp', 5122, 'local', '2025-06-13 16:04:42', '2025-06-13 16:04:42'),
(44, 3, 'item', '1782c535380cb9e3f6b795c51b6bd77b.webp', 'image/webp', 2766, 'local', '2025-06-13 16:06:14', '2025-06-13 16:06:14'),
(45, 3, 'item', '6ee7100823cbc5a106dde92980fbd0ea.webp', 'image/webp', 2204, 'local', '2025-06-13 16:07:31', '2025-06-13 16:07:31'),
(46, 3, 'item', '584633b80469640ba1bbd80c1a6c7732.webp', 'image/webp', 10258, 'local', '2025-06-13 16:09:29', '2025-06-13 16:09:29'),
(47, 3, 'item', '731d41450eeef960d24537a574396f9f.webp', 'image/webp', 4042, 'local', '2025-06-13 16:12:44', '2025-06-13 16:12:44'),
(48, 3, 'item', 'ac85d78375e23dec21c50ae01cf5c5dd.webp', 'image/webp', 6906, 'local', '2025-06-13 16:29:26', '2025-06-13 16:29:26'),
(49, 3, 'item', '73470e303266faae4a63021d8c64c7ea.webp', 'image/webp', 2674, 'local', '2025-06-13 16:30:46', '2025-06-13 16:30:46'),
(50, 3, 'item', 'dde9fffe99cfa5be7ba96c9959659a1b.webp', 'image/webp', 2592, 'local', '2025-06-13 16:32:15', '2025-06-13 16:32:15'),
(51, 3, 'item', '7f0d5a1b79f7627576c0658f4c9e4fd2.webp', 'image/webp', 2416, 'local', '2025-06-13 16:33:30', '2025-06-13 16:33:30'),
(52, 3, 'item', '6869e038657382b7ef04151a3377f044.webp', 'image/webp', 2198, 'local', '2025-06-13 17:02:20', '2025-06-13 17:02:20'),
(53, 3, 'item', 'e6a3de43f3b14815f2ec25b14aa394e2.webp', 'image/webp', 6516, 'local', '2025-06-13 17:10:19', '2025-06-13 17:10:19'),
(54, 3, 'item', 'a47d7138b207a202feb4590b8f5cbcc3.webp', 'image/webp', 3458, 'local', '2025-06-13 17:11:33', '2025-06-13 17:11:33'),
(55, 3, 'item', 'e6a38b645ade1518f2a7520efd80ef08.webp', 'image/webp', 3670, 'local', '2025-06-13 17:13:10', '2025-06-13 17:13:10'),
(56, 3, 'item', '870db423a61172947a2ee65f992a2311.webp', 'image/webp', 5770, 'local', '2025-06-13 17:14:28', '2025-06-13 17:14:28'),
(57, 3, 'item', 'ea56aed8c2c38a709207e425ea956902.webp', 'image/webp', 3850, 'local', '2025-06-13 17:16:04', '2025-06-13 17:16:04'),
(58, 3, 'item', 'b7fdfa46c7777ee1d819f6f7a608a74f.webp', 'image/webp', 3372, 'local', '2025-06-13 17:16:49', '2025-06-13 17:16:49'),
(59, 3, 'item', '18c60f481cc55318e2f30a45a9e864d6.webp', 'image/webp', 2016, 'local', '2025-06-13 17:18:24', '2025-06-13 17:18:24'),
(60, 3, 'item', 'acd6e308b4c3718f3ba563fccaf4a756.webp', 'image/webp', 4136, 'local', '2025-06-13 17:21:08', '2025-06-13 17:21:08'),
(61, 3, 'item', 'b8694f2167997090b90f645e5b945551.webp', 'image/webp', 1530, 'local', '2025-06-13 17:26:49', '2025-06-13 17:26:49'),
(62, 3, 'item', 'bb08083b789a2aa1033e31bfc9f206d7.webp', 'image/webp', 6938, 'local', '2025-06-13 17:47:39', '2025-06-13 17:47:39'),
(63, 3, 'item', 'e894e40655c1f928745f53a9eedebd10.webp', 'image/webp', 3898, 'local', '2025-06-13 17:50:11', '2025-06-13 17:50:11'),
(64, 3, 'item', '9e3dc33c36f44a0b07f152fadc1cb80a.webp', 'image/webp', 2274, 'local', '2025-06-13 17:55:20', '2025-06-13 17:55:20'),
(65, 3, 'item', '5b6d2dba5d861b73966841e673cab4c2.webp', 'image/webp', 2812, 'local', '2025-06-13 17:57:12', '2025-06-13 17:57:12'),
(66, 3, 'item', '22969a9fbf89f89525ba400c768dcb76.webp', 'image/webp', 2710, 'local', '2025-06-13 17:58:33', '2025-06-13 17:58:33'),
(67, 3, 'item', '2811b8a6922569fc1d9e644826f26086.webp', 'image/webp', 3852, 'local', '2025-06-13 18:02:36', '2025-06-13 18:02:36'),
(68, 3, 'item', '3d2a097e193a22e6ae903a83b2ff0147.webp', 'image/webp', 5838, 'local', '2025-06-13 18:04:32', '2025-06-13 18:04:32'),
(69, 3, 'item', '68e18be8465e9064d359c9c6652f12d8.webp', 'image/webp', 1838, 'local', '2025-06-13 18:05:52', '2025-06-13 18:05:52'),
(70, 3, 'item', '5df20645f8660ad3041fe317e393411d.webp', 'image/webp', 1312, 'local', '2025-06-13 18:07:10', '2025-06-13 18:07:10'),
(71, 3, 'item', 'f35eab101084c5e5ddf8dbdd02a31d4c.webp', 'image/webp', 2360, 'local', '2025-06-13 18:08:47', '2025-06-13 18:08:47'),
(72, 3, 'item', '546e09ccece2b0c826bee2b638882336.jpg', 'image/jpeg', 137910, 'local', '2025-06-13 18:20:03', '2025-06-13 18:20:03'),
(73, 3, 'item', '6f44a3c1b341a9e224e731fe9ee06a8f.jpg', 'image/jpeg', 105111, 'local', '2025-06-13 18:20:58', '2025-06-13 18:20:58'),
(74, 3, 'item', '24e72994a939eeed585e4297229c3157.webp', 'image/webp', 14090, 'local', '2025-06-13 18:21:59', '2025-06-13 18:21:59'),
(75, 3, 'item', '1040228b82803e774637b878147c7161.webp', 'image/webp', 10136, 'local', '2025-06-13 18:24:15', '2025-06-13 18:24:15'),
(76, 3, 'item', 'd4d7902e326b59891b0f1f384df4e5fe.webp', 'image/webp', 16594, 'local', '2025-06-13 18:25:18', '2025-06-13 18:25:18'),
(77, 3, 'item', '59b9ff0fb17a8b923e4770029adbd3ce.webp', 'image/webp', 16594, 'local', '2025-06-13 18:25:39', '2025-06-13 18:25:39'),
(78, 3, 'item', '45988b853bd0bce145b26683df53a194.webp', 'image/webp', 11710, 'local', '2025-06-13 18:27:12', '2025-06-13 18:27:12'),
(79, 3, 'item', 'c5fa37900c0ec632e0142f4e475bf270.webp', 'image/webp', 18072, 'local', '2025-06-13 18:28:08', '2025-06-13 18:28:08'),
(80, 3, 'item', 'f1ec1059e525533a9373e067ba2368db.webp', 'image/webp', 7938, 'local', '2025-06-13 18:31:16', '2025-06-13 18:31:16'),
(81, 3, 'item', '0ab9981f1456bb0429d3588e14e8e885.jpg', 'image/jpeg', 1064436, 'local', '2025-06-13 18:59:38', '2025-06-13 18:59:38'),
(82, 3, 'item', '2079b4502d31d19d4bdac411dcbb4c84.webp', 'image/webp', 7938, 'local', '2025-06-13 19:01:32', '2025-06-13 19:01:32'),
(83, 3, 'item', '22d9e3a8d3f4d6007328e2da6656c02a.webp', 'image/webp', 8282, 'local', '2025-06-13 19:03:27', '2025-06-13 19:03:27'),
(84, 3, 'item', '6efee91c875df0311f93549e102f5ea6.webp', 'image/webp', 6174, 'local', '2025-06-13 19:06:48', '2025-06-13 19:06:48'),
(85, 3, 'item', '06bd1e3804f2ad9efa8cf5da0a18f6f9.webp', 'image/webp', 4680, 'local', '2025-06-13 19:11:56', '2025-06-13 19:11:56'),
(86, 3, 'item', '29775b0b3026a3f6dc3f707992640c02.jpeg', 'image/jpeg', 84220, 'local', '2025-06-13 19:13:13', '2025-06-13 19:13:13'),
(87, 3, 'item', '4434b311871b3899069b86fdd5484f7d.webp', 'image/webp', 11980, 'local', '2025-06-13 19:15:24', '2025-06-13 19:15:24'),
(88, 3, 'item', '94741a84cf65ca9731bfb7e4a3718212.jpeg', 'image/jpeg', 16004, 'local', '2025-06-13 19:17:24', '2025-06-13 19:17:24'),
(89, 3, 'item', '55caae0f6980a4edbbd45d2a601317c0.webp', 'image/webp', 6296, 'local', '2025-06-13 19:18:32', '2025-06-13 19:18:32'),
(90, 3, 'item', '63928181cac16379da85534412b3c271.webp', 'image/webp', 12814, 'local', '2025-06-13 19:21:12', '2025-06-13 19:21:12'),
(91, 3, 'item', '877939ca5c91af960574a353e8fc6846.webp', 'image/webp', 7618, 'local', '2025-06-13 19:23:00', '2025-06-13 19:23:00'),
(92, 3, 'item', '9c214a9eb4f5f8c7f7f39753ff5ac26a.jpeg', 'image/jpeg', 218820, 'local', '2025-06-13 19:32:35', '2025-06-13 19:32:35'),
(93, 3, 'item', '081ef40abc807c69e2e1fbcc5f039d18.jpeg', 'image/jpeg', 183711, 'local', '2025-06-13 19:34:05', '2025-06-13 19:34:05'),
(94, 3, 'item', '53553a5639b372306858530bce08daf0.webp', 'image/webp', 9028, 'local', '2025-06-13 19:35:31', '2025-06-13 19:35:31'),
(95, 3, 'item', '9a776c39f9f6486de2d9eeba682dc42f.webp', 'image/webp', 6174, 'local', '2025-06-13 19:38:36', '2025-06-13 19:38:36'),
(96, 3, 'item', '14dbfed9db684c5f72a345a5ba26a7d4.jpeg', 'image/jpeg', 56842, 'local', '2025-06-13 19:41:12', '2025-06-13 19:41:12'),
(97, 3, 'item', 'd86971483f023b4df6dc93de6db28b8b.jpeg', 'image/jpeg', 31500, 'local', '2025-06-13 20:19:41', '2025-06-13 20:19:41'),
(98, 3, 'item', 'b64a641c8178bd342e69f718f8ee2bc9.jpeg', 'image/jpeg', 31500, 'local', '2025-06-13 20:51:44', '2025-06-13 20:51:44'),
(99, 3, 'item', 'bdf4b02c5e8a81c9bf99acf47ad66813.webp', 'image/webp', 2278, 'local', '2025-06-13 21:06:35', '2025-06-13 21:06:35'),
(100, 3, 'item', 'dc1895b45bd890c145b4dc2e8894e4f4.jpg', 'image/jpeg', 50444, 'local', '2025-06-13 21:07:23', '2025-06-13 21:07:23'),
(101, 3, 'item', 'dddc726f0bae7a6015d2f12490d9fe51.webp', 'image/webp', 5722, 'local', '2025-06-13 21:11:23', '2025-06-13 21:11:23'),
(102, 3, 'item', 'caac6ab35ed48c4ec304bbc837bc0c68.jpeg', 'image/jpeg', 97870, 'local', '2025-06-13 21:14:11', '2025-06-13 21:14:11'),
(103, 3, 'item', '54c63c1205acfab583c02dcd00015e2e.webp', 'image/webp', 8416, 'local', '2025-06-13 21:19:33', '2025-06-13 21:19:33'),
(104, 3, 'item', '1f1503050669aff504655c04327a3306.webp', 'image/webp', 20562, 'local', '2025-06-13 21:21:12', '2025-06-13 21:21:12'),
(105, 3, 'item', '1a473ed6f58e84ffcea29a72b26ee44e.webp', 'image/webp', 12306, 'local', '2025-06-13 21:23:49', '2025-06-13 21:23:49'),
(106, 3, 'item', '9ad1db909e0e8b766e4a933f2686441a.webp', 'image/webp', 12306, 'local', '2025-06-13 21:24:09', '2025-06-13 21:24:09'),
(107, 3, 'item', '9452d2f2de79dcb178c1a19bf8afbf1a.webp', 'image/webp', 12306, 'local', '2025-06-13 21:24:33', '2025-06-13 21:24:33'),
(108, 3, 'item', 'e545f306682fb5b307f10f8bedb65d6f.webp', 'image/webp', 14842, 'local', '2025-06-13 21:26:33', '2025-06-13 21:26:33'),
(109, 3, 'item', '9a932e78c76e1a5c273313642535cc95.webp', 'image/webp', 12502, 'local', '2025-06-13 21:28:30', '2025-06-13 21:28:30'),
(110, 3, 'item', 'ad5714d979e4a39e1d919e5b394064f2.webp', 'image/webp', 9228, 'local', '2025-06-13 21:30:26', '2025-06-13 21:30:26'),
(111, 3, 'item', 'fe80ae2680f1792aafeb45a35e19a4d3.jpeg', 'image/jpeg', 137594, 'local', '2025-06-13 21:37:33', '2025-06-13 21:37:33'),
(112, 3, 'item', '2aabbd4a9822c4b68780813b17cefb96.jpeg', 'image/jpeg', 105159, 'local', '2025-06-13 21:37:57', '2025-06-13 21:37:57'),
(113, 3, 'item', 'c4943ec41f259d5be4181093d33d5cb1.jpeg', 'image/jpeg', 157865, 'local', '2025-06-13 22:32:35', '2025-06-13 22:32:35'),
(114, 3, 'item', 'f616333fc318d92d886e84b0269afdac.jpg', 'image/jpeg', 101244, 'local', '2025-06-13 22:36:29', '2025-06-13 22:36:29'),
(115, 3, 'item', 'aa7227a997a86e8049e7dc7df56c6e3d.jpg', 'image/jpeg', 365022, 'local', '2025-06-13 22:36:56', '2025-06-13 22:36:56'),
(116, 3, 'item', '837d0647f6a40d29b95430afb03b844a.webp', 'image/webp', 17910, 'local', '2025-06-13 22:39:00', '2025-06-13 22:39:00'),
(117, 3, 'item', '158e4a52eaed6b199da36ce24468b9d0.webp', 'image/webp', 12306, 'local', '2025-06-13 22:39:26', '2025-06-13 22:39:26'),
(118, 3, 'item', '54087b4c238eb7843ef86620cdcbde95.webp', 'image/webp', 16832, 'local', '2025-06-13 22:40:36', '2025-06-13 22:40:36'),
(119, 3, 'item', 'decba83cf29305c1747f4cb7fc8626c7.webp', 'image/webp', 10926, 'local', '2025-06-13 22:41:28', '2025-06-13 22:41:28'),
(120, 3, 'item', 'd2bc8184d134328541b6b2adf752025b.jpeg', 'image/jpeg', 16324, 'local', '2025-06-13 22:42:05', '2025-06-13 22:42:05'),
(121, 3, 'item', 'cee69fc648bdefc375870abc61d8a5c5.webp', 'image/webp', 966, 'local', '2025-06-13 22:43:32', '2025-06-13 22:43:32'),
(124, 3, 'qrcodes', 'qrcode-4-2.png', 'image/png', 4623, 'local', '2025-06-15 00:46:07', '2025-06-15 00:46:07'),
(125, 3, 'item', '67d4e9c5cc23d90dcec3efbc4653da1c.jpeg', 'image/jpeg', 119747, 'local', '2025-06-16 17:56:59', '2025-06-16 17:56:59'),
(126, 3, 'item', '7644529e42473ff77f32eeaf72e0b835.jpeg', 'image/jpeg', 11433, 'local', '2025-06-18 01:43:06', '2025-06-18 01:43:06'),
(127, 3, 'item', 'b0821c242165ec9c092ac3efd9b90feb.jpeg', 'image/jpeg', 12398, 'local', '2025-06-18 01:44:00', '2025-06-18 01:44:00'),
(128, 3, 'item', '6e9147f643ede20251e4ab0c90023cf3.jpeg', 'image/jpeg', 15124, 'local', '2025-06-18 02:01:04', '2025-06-18 02:01:04'),
(129, 3, 'item', '799994af7457d70b410c47f7735a218a.jpg', 'image/jpeg', 264685, 'local', '2025-06-18 02:01:47', '2025-06-18 02:01:47'),
(130, 3, 'item', '82e5d014ce30d439586471a141b265f5.jpg', 'image/jpeg', 74027, 'local', '2025-06-18 02:11:32', '2025-06-18 02:11:32'),
(131, 3, 'item', '12e50a0f95863e739143cb44478cd25a.jpg', 'image/jpeg', 74027, 'local', '2025-06-18 02:12:43', '2025-06-18 02:12:43'),
(132, 3, 'item', '8d13cbbb23feda61b4914cbc4204df28.jpeg', 'image/jpeg', 11413, 'local', '2025-06-18 02:21:44', '2025-06-18 02:21:44'),
(133, 3, 'item', '5e7420c7b94dcbe555ae802f05cecb84.jpeg', 'image/jpeg', 11413, 'local', '2025-06-18 02:24:28', '2025-06-18 02:24:28'),
(134, 3, 'item', '0b88a8939a579b62b2770daba6623f08.jpeg', 'image/jpeg', 10286, 'local', '2025-06-18 02:45:30', '2025-06-18 02:45:30'),
(135, 3, 'item', 'ea2261e0807fb5cac91aa621b159a99f.jpg', 'image/jpeg', 1064436, 'local', '2025-06-24 02:10:16', '2025-06-24 02:10:16'),
(136, 3, 'item', 'd6ed16f2e3f54428f68975f56e29ebdc.jpg', 'image/jpeg', 1064436, 'local', '2025-06-24 02:21:34', '2025-06-24 02:21:34'),
(137, 3, 'item', 'fdb514919d45adcba1daec517bee254f.jpeg', 'image/jpeg', 16004, 'local', '2025-06-24 02:29:31', '2025-06-24 02:29:31'),
(138, 3, 'item', 'f2683a71d24402f23bdb6210efee133a.jpeg', 'image/jpeg', 12398, 'local', '2025-06-24 02:32:14', '2025-06-24 02:32:14'),
(139, 3, 'item', 'cd2e7602dd310c81ba229469b5225e53.jpeg', 'image/jpeg', 12210, 'local', '2025-06-24 02:42:04', '2025-06-24 02:42:04'),
(140, 3, 'item', 'f48dbdc5c73195a5c763da0be8e1cdad.jpeg', 'image/jpeg', 7983, 'local', '2025-06-24 02:44:39', '2025-06-24 02:44:39'),
(141, 3, 'item', '2914c612c963bc75bc2992aad99ccfe4.jpeg', 'image/jpeg', 13520, 'local', '2025-06-24 02:47:21', '2025-06-24 02:47:21'),
(142, 3, 'item', '455771128d51053ce52a788aaff0f4a0.jpeg', 'image/jpeg', 9953, 'local', '2025-06-24 02:50:48', '2025-06-24 02:50:48'),
(143, 3, 'item', '1752504e0eb0e7907f779208b54e729b.jpeg', 'image/jpeg', 8037, 'local', '2025-06-24 03:42:25', '2025-06-24 03:42:25'),
(144, 3, 'item', '672786e22d0c42674fafb212ebcd1637.jpg', 'image/jpeg', 111298, 'local', '2025-06-25 11:08:46', '2025-06-25 11:08:46'),
(145, 3, 'item', '8d627de48f05f707e25dc8901e5b5b8f.jpg', 'image/jpeg', 413946, 'local', '2025-06-25 11:12:11', '2025-06-25 11:12:11'),
(146, 3, 'item', '5e927950f70294694d1b9143c85a4615.jpg', 'image/jpeg', 413946, 'local', '2025-06-25 11:13:03', '2025-06-25 11:13:03'),
(147, 3, 'item', '02307ed9cb6abb0ab8ba74a7779d51a9.jpeg', 'image/jpeg', 9953, 'local', '2025-06-25 11:18:44', '2025-06-25 11:18:44'),
(148, 3, 'item', 'f357012581d2e6aaec25599bb95d453a.jpg', 'image/jpeg', 170154, 'local', '2025-06-25 11:19:54', '2025-06-25 11:19:54'),
(149, 3, 'qrcodes', 'qrcode-4-t-5.png', 'image/png', 4777, 'local', '2025-07-12 00:41:10', '2025-07-12 00:41:10'),
(150, 3, 'qrcodes', 'qrcode-4-t-1.png', 'image/png', 4569, 'local', '2025-07-12 00:41:50', '2025-07-12 00:41:50'),
(151, 3, 'qrcodes', 'qrcode-4-t-2.png', 'image/png', 4843, 'local', '2025-07-12 00:42:23', '2025-07-12 00:42:23'),
(152, 3, 'qrcodes', 'qrcode-4-t-3.png', 'image/png', 4843, 'local', '2025-07-12 00:42:49', '2025-07-12 00:42:49'),
(154, 3, 'qrcodes', 'qrcode-4-t-4.png', 'image/png', 4719, 'local', '2025-07-12 00:46:37', '2025-07-12 00:46:37'),
(155, 3, 'qrcodes', 'qrcode-4-t-5.png', 'image/png', 4780, 'local', '2025-07-12 00:46:55', '2025-07-12 00:46:55'),
(156, 3, 'qrcodes', 'qrcode-4-t-6.png', 'image/png', 4972, 'local', '2025-07-12 00:47:13', '2025-07-12 00:47:13'),
(157, 3, 'qrcodes', 'qrcode-4-t-7.png', 'image/png', 4600, 'local', '2025-07-12 00:47:47', '2025-07-12 00:47:47'),
(158, 3, 'qrcodes', 'qrcode-4-t-8.png', 'image/png', 4870, 'local', '2025-07-12 00:48:01', '2025-07-12 00:48:01'),
(159, 3, 'qrcodes', 'qrcode-4-t-9.png', 'image/png', 4921, 'local', '2025-07-12 00:48:27', '2025-07-12 00:48:27'),
(160, 3, 'qrcodes', 'qrcode-4-t-10.png', 'image/png', 4963, 'local', '2025-07-12 00:48:45', '2025-07-12 00:48:45'),
(161, 3, 'qrcodes', 'qrcode-4-t-11.png', 'image/png', 4603, 'local', '2025-07-12 00:50:16', '2025-07-12 00:50:16'),
(162, 3, 'qrcodes', 'qrcode-4-t-12.png', 'image/png', 4994, 'local', '2025-07-12 00:51:34', '2025-07-12 00:51:34'),
(163, 3, 'qrcodes', 'qrcode-4-ht-1.png', 'image/png', 4667, 'local', '2025-07-12 00:57:24', '2025-07-12 00:57:24'),
(164, 3, 'qrcodes', 'qrcode-4-ht-2.png', 'image/png', 5027, 'local', '2025-07-12 00:57:41', '2025-07-12 00:57:41'),
(165, 3, 'qrcodes', 'qrcode-4-ht-3.png', 'image/png', 5028, 'local', '2025-07-12 00:57:58', '2025-07-12 00:57:58'),
(166, 3, 'qrcodes', 'qrcode-4-ht-4.png', 'image/png', 4869, 'local', '2025-07-12 00:58:25', '2025-07-12 00:58:25'),
(167, 3, 'qrcodes', 'qrcode-4-la-1.png', 'image/png', 4356, 'local', '2025-07-12 00:59:53', '2025-07-12 00:59:53'),
(168, 3, 'profile-photos', 'ae7be6f70d6f5449be00c44a66e92c30.jpeg', 'image/jpeg', 109527, 'local', '2025-07-12 19:46:21', '2025-07-12 19:46:21'),
(175, NULL, 'favicons/super-admin/', 'android-chrome-192x192.png', 'image/png', 20259, 'local', '2025-07-17 21:43:34', '2025-07-17 21:43:34'),
(176, NULL, 'favicons/super-admin/', 'android-chrome-512x512.png', 'image/png', 93855, 'local', '2025-07-17 21:43:35', '2025-07-17 21:43:35'),
(177, NULL, 'favicons/super-admin/', 'apple-touch-icon.png', 'image/png', 18184, 'local', '2025-07-17 21:43:35', '2025-07-17 21:43:35'),
(178, NULL, 'favicons/super-admin/', 'favicon-16x16.png', 'image/png', 581, 'local', '2025-07-17 21:43:35', '2025-07-17 21:43:35'),
(179, NULL, 'favicons/super-admin/', 'favicon-32x32.png', 'image/png', 1364, 'local', '2025-07-17 21:43:35', '2025-07-17 21:43:35'),
(180, NULL, 'favicons/super-admin/', 'favicon.ico', 'image/vnd.microsoft.icon', 15406, 'local', '2025-07-17 21:43:35', '2025-07-17 21:43:35'),
(181, 3, 'logo', 'e4fc5d7cf5d09af893dc8fb1670e3567.jpg', 'image/jpeg', 48824, 'local', '2025-07-25 12:19:19', '2025-07-25 12:19:19'),
(188, 3, 'favicons/restaurant/backpass-restaurant/', 'android-chrome-192x192.png', 'image/png', 30424, 'local', '2025-07-25 12:20:48', '2025-07-25 12:20:48'),
(189, 3, 'favicons/restaurant/backpass-restaurant/', 'android-chrome-512x512.png', 'image/png', 171251, 'local', '2025-07-25 12:20:48', '2025-07-25 12:20:48'),
(190, 3, 'favicons/restaurant/backpass-restaurant/', 'apple-touch-icon.png', 'image/png', 27287, 'local', '2025-07-25 12:20:48', '2025-07-25 12:20:48'),
(191, 3, 'favicons/restaurant/backpass-restaurant/', 'favicon-16x16.png', 'image/png', 595, 'local', '2025-07-25 12:20:48', '2025-07-25 12:20:48'),
(192, 3, 'favicons/restaurant/backpass-restaurant/', 'favicon-32x32.png', 'image/png', 1539, 'local', '2025-07-25 12:20:48', '2025-07-25 12:20:48'),
(193, 3, 'favicons/restaurant/backpass-restaurant/', 'favicon.ico', 'image/vnd.microsoft.icon', 15406, 'local', '2025-07-25 12:20:48', '2025-07-25 12:20:48');

-- --------------------------------------------------------

--
-- Table structure for table `file_storage_settings`
--

CREATE TABLE `file_storage_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `filesystem` varchar(191) NOT NULL,
  `auth_keys` text DEFAULT NULL,
  `status` enum('enabled','disabled') NOT NULL DEFAULT 'disabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `file_storage_settings`
--

INSERT INTO `file_storage_settings` (`id`, `filesystem`, `auth_keys`, `status`, `created_at`, `updated_at`) VALUES
(1, 'local', NULL, 'enabled', '2025-04-18 06:02:04', '2025-04-18 06:02:04');

-- --------------------------------------------------------

--
-- Table structure for table `flags`
--

CREATE TABLE `flags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `capital` varchar(191) DEFAULT NULL,
  `code` varchar(191) DEFAULT NULL,
  `continent` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `flags`
--

INSERT INTO `flags` (`id`, `capital`, `code`, `continent`, `name`) VALUES
(1, 'Kabul', 'af', 'Asia', 'Afghanistan'),
(2, 'Mariehamn', 'ax', 'Europe', 'Aland Islands'),
(3, 'Tirana', 'al', 'Europe', 'Albania'),
(4, 'Algiers', 'dz', 'Africa', 'Algeria'),
(5, 'Pago Pago', 'as', 'Oceania', 'American Samoa'),
(6, 'Andorra la Vella', 'ad', 'Europe', 'Andorra'),
(7, 'Luanda', 'ao', 'Africa', 'Angola'),
(8, 'The Valley', 'ai', 'North America', 'Anguilla'),
(9, '', 'aq', '', 'Antarctica'),
(10, 'St. John\'s', 'ag', 'North America', 'Antigua and Barbuda'),
(11, 'Buenos Aires', 'ar', 'South America', 'Argentina'),
(12, 'Yerevan', 'am', 'Asia', 'Armenia'),
(13, 'Oranjestad', 'aw', 'South America', 'Aruba'),
(14, 'Georgetown', 'ac', 'Africa', 'Ascension Island'),
(15, 'Canberra', 'au', 'Oceania', 'Australia'),
(16, 'Vienna', 'at', 'Europe', 'Austria'),
(17, 'Baku', 'az', 'Asia', 'Azerbaijan'),
(18, 'Nassau', 'bs', 'North America', 'Bahamas'),
(19, 'Manama', 'bh', 'Asia', 'Bahrain'),
(20, 'Dhaka', 'bd', 'Asia', 'Bangladesh'),
(21, 'Bridgetown', 'bb', 'North America', 'Barbados'),
(22, 'Minsk', 'by', 'Europe', 'Belarus'),
(23, 'Brussels', 'be', 'Europe', 'Belgium'),
(24, 'Belmopan', 'bz', 'North America', 'Belize'),
(25, 'Porto-Novo', 'bj', 'Africa', 'Benin'),
(26, 'Hamilton', 'bm', 'North America', 'Bermuda'),
(27, 'Thimphu', 'bt', 'Asia', 'Bhutan'),
(28, 'Sucre', 'bo', 'South America', 'Bolivia'),
(29, 'Kralendijk', 'bq', 'South America', 'Bonaire, Sint Eustatius and Saba'),
(30, 'Sarajevo', 'ba', 'Europe', 'Bosnia and Herzegovina'),
(31, 'Gaborone', 'bw', 'Africa', 'Botswana'),
(32, '', 'bv', '', 'Bouvet Island'),
(33, 'Brasília', 'br', 'South America', 'Brazil'),
(34, 'Diego Garcia', 'io', 'Asia', 'British Indian Ocean Territory'),
(35, 'Bandar Seri Begawan', 'bn', 'Asia', 'Brunei Darussalam'),
(36, 'Sofia', 'bg', 'Europe', 'Bulgaria'),
(37, 'Ouagadougou', 'bf', 'Africa', 'Burkina Faso'),
(38, 'Bujumbura', 'bi', 'Africa', 'Burundi'),
(39, 'Praia', 'cv', 'Africa', 'Cabo Verde'),
(40, 'Phnom Penh', 'kh', 'Asia', 'Cambodia'),
(41, 'Yaoundé', 'cm', 'Africa', 'Cameroon'),
(42, 'Ottawa', 'ca', 'North America', 'Canada'),
(43, '', 'ic', '', 'Canary Islands'),
(44, '', 'es-ct', '', 'Catalonia'),
(45, 'George Town', 'ky', 'North America', 'Cayman Islands'),
(46, 'Bangui', 'cf', 'Africa', 'Central African Republic'),
(47, '', 'cefta', '', 'Central European Free Trade Agreement'),
(48, '', 'ea', '', 'Ceuta & Melilla'),
(49, 'N\'Djamena', 'td', 'Africa', 'Chad'),
(50, 'Santiago', 'cl', 'South America', 'Chile'),
(51, 'Beijing', 'cn', 'Asia', 'China'),
(52, 'Flying Fish Cove', 'cx', 'Asia', 'Christmas Island'),
(53, '', 'cp', '', 'Clipperton Island'),
(54, 'West Island', 'cc', 'Asia', 'Cocos (Keeling) Islands'),
(55, 'Bogotá', 'co', 'South America', 'Colombia'),
(56, 'Moroni', 'km', 'Africa', 'Comoros'),
(57, 'Avarua', 'ck', 'Oceania', 'Cook Islands'),
(58, 'San José', 'cr', 'North America', 'Costa Rica'),
(59, 'Zagreb', 'hr', 'Europe', 'Croatia'),
(60, 'Havana', 'cu', 'North America', 'Cuba'),
(61, 'Willemstad', 'cw', 'South America', 'Curaçao'),
(62, 'Nicosia', 'cy', 'Europe', 'Cyprus'),
(63, 'Prague', 'cz', 'Europe', 'Czech Republic'),
(64, 'Yamoussoukro', 'ci', 'Africa', 'Côte d\'Ivoire'),
(65, 'Kinshasa', 'cd', 'Africa', 'Democratic Republic of the Congo'),
(66, 'Copenhagen', 'dk', 'Europe', 'Denmark'),
(67, '', 'dg', '', 'Diego Garcia'),
(68, 'Djibouti', 'dj', 'Africa', 'Djibouti'),
(69, 'Roseau', 'dm', 'North America', 'Dominica'),
(70, 'Santo Domingo', 'do', 'North America', 'Dominican Republic'),
(71, 'Quito', 'ec', 'South America', 'Ecuador'),
(72, 'Cairo', 'eg', 'Africa', 'Egypt'),
(73, 'San Salvador', 'sv', 'North America', 'El Salvador'),
(74, 'London', 'gb-eng', 'Europe', 'England'),
(75, 'Malabo', 'gq', 'Africa', 'Equatorial Guinea'),
(76, 'Asmara', 'er', 'Africa', 'Eritrea'),
(77, 'Tallinn', 'ee', 'Europe', 'Estonia'),
(78, 'Lobamba, Mbabane', 'sz', 'Africa', 'Eswatini'),
(79, 'Addis Ababa', 'et', 'Africa', 'Ethiopia'),
(80, '', 'eu', '', 'Europe'),
(81, 'Stanley', 'fk', 'South America', 'Falkland Islands'),
(82, 'Tórshavn', 'fo', 'Europe', 'Faroe Islands'),
(83, 'Palikir', 'fm', 'Oceania', 'Federated States of Micronesia'),
(84, 'Suva', 'fj', 'Oceania', 'Fiji'),
(85, 'Helsinki', 'fi', 'Europe', 'Finland'),
(86, 'Paris', 'fr', 'Europe', 'France'),
(87, 'Cayenne', 'gf', 'South America', 'French Guiana'),
(88, 'Papeete', 'pf', 'Oceania', 'French Polynesia'),
(89, 'Saint-Pierre, Réunion', 'tf', 'Africa', 'French Southern Territories'),
(90, 'Libreville', 'ga', 'Africa', 'Gabon'),
(91, '', 'es-ga', '', 'Galicia'),
(92, 'Banjul', 'gm', 'Africa', 'Gambia'),
(93, 'Tbilisi', 'ge', 'Asia', 'Georgia'),
(94, 'Berlin', 'de', 'Europe', 'Germany'),
(95, 'Accra', 'gh', 'Africa', 'Ghana'),
(96, 'Gibraltar', 'gi', 'Europe', 'Gibraltar'),
(97, 'Athens', 'gr', 'Europe', 'Greece'),
(98, 'Nuuk', 'gl', 'North America', 'Greenland'),
(99, 'St. George\'s', 'gd', 'North America', 'Grenada'),
(100, 'Basse-Terre', 'gp', 'North America', 'Guadeloupe'),
(101, 'Hagåtña', 'gu', 'Oceania', 'Guam'),
(102, 'Guatemala City', 'gt', 'North America', 'Guatemala'),
(103, 'Saint Peter Port', 'gg', 'Europe', 'Guernsey'),
(104, 'Conakry', 'gn', 'Africa', 'Guinea'),
(105, 'Bissau', 'gw', 'Africa', 'Guinea-Bissau'),
(106, 'Georgetown', 'gy', 'South America', 'Guyana'),
(107, 'Port-au-Prince', 'ht', 'North America', 'Haiti'),
(108, '', 'hm', '', 'Heard Island and McDonald Islands'),
(109, 'Vatican City', 'va', 'Europe', 'Holy See'),
(110, 'Tegucigalpa', 'hn', 'North America', 'Honduras'),
(111, 'Hong Kong', 'hk', 'Asia', 'Hong Kong'),
(112, 'Budapest', 'hu', 'Europe', 'Hungary'),
(113, 'Reykjavik', 'is', 'Europe', 'Iceland'),
(114, 'New Delhi', 'in', 'Asia', 'India'),
(115, 'Jakarta', 'id', 'Asia', 'Indonesia'),
(116, 'Tehran', 'ir', 'Asia', 'Iran'),
(117, 'Baghdad', 'iq', 'Asia', 'Iraq'),
(118, 'Dublin', 'ie', 'Europe', 'Ireland'),
(119, 'Douglas', 'im', 'Europe', 'Isle of Man'),
(120, 'Jerusalem', 'il', 'Asia', 'Israel'),
(121, 'Rome', 'it', 'Europe', 'Italy'),
(122, 'Kingston', 'jm', 'North America', 'Jamaica'),
(123, 'Tokyo', 'jp', 'Asia', 'Japan'),
(124, 'Saint Helier', 'je', 'Europe', 'Jersey'),
(125, 'Amman', 'jo', 'Asia', 'Jordan'),
(126, 'Astana', 'kz', 'Asia', 'Kazakhstan'),
(127, 'Nairobi', 'ke', 'Africa', 'Kenya'),
(128, 'South Tarawa', 'ki', 'Oceania', 'Kiribati'),
(129, 'Pristina', 'xk', 'Europe', 'Kosovo'),
(130, 'Kuwait City', 'kw', 'Asia', 'Kuwait'),
(131, 'Bishkek', 'kg', 'Asia', 'Kyrgyzstan'),
(132, 'Vientiane', 'la', 'Asia', 'Laos'),
(133, 'Riga', 'lv', 'Europe', 'Latvia'),
(134, 'Beirut', 'lb', 'Asia', 'Lebanon'),
(135, 'Maseru', 'ls', 'Africa', 'Lesotho'),
(136, 'Monrovia', 'lr', 'Africa', 'Liberia'),
(137, 'Tripoli', 'ly', 'Africa', 'Libya'),
(138, 'Vaduz', 'li', 'Europe', 'Liechtenstein'),
(139, 'Vilnius', 'lt', 'Europe', 'Lithuania'),
(140, 'Luxembourg City', 'lu', 'Europe', 'Luxembourg'),
(141, 'Macau', 'mo', 'Asia', 'Macau'),
(142, 'Antananarivo', 'mg', 'Africa', 'Madagascar'),
(143, 'Lilongwe', 'mw', 'Africa', 'Malawi'),
(144, 'Kuala Lumpur', 'my', 'Asia', 'Malaysia'),
(145, 'Malé', 'mv', 'Asia', 'Maldives'),
(146, 'Bamako', 'ml', 'Africa', 'Mali'),
(147, 'Valletta', 'mt', 'Europe', 'Malta'),
(148, 'Majuro', 'mh', 'Oceania', 'Marshall Islands'),
(149, 'Fort-de-France', 'mq', 'North America', 'Martinique'),
(150, 'Nouakchott', 'mr', 'Africa', 'Mauritania'),
(151, 'Port Louis', 'mu', 'Africa', 'Mauritius'),
(152, 'Mamoudzou', 'yt', 'Africa', 'Mayotte'),
(153, 'Mexico City', 'mx', 'North America', 'Mexico'),
(154, 'Chișinău', 'md', 'Europe', 'Moldova'),
(155, 'Monaco', 'mc', 'Europe', 'Monaco'),
(156, 'Ulaanbaatar', 'mn', 'Asia', 'Mongolia'),
(157, 'Podgorica', 'me', 'Europe', 'Montenegro'),
(158, 'Little Bay, Brades, Plymouth', 'ms', 'North America', 'Montserrat'),
(159, 'Rabat', 'ma', 'Africa', 'Morocco'),
(160, 'Maputo', 'mz', 'Africa', 'Mozambique'),
(161, 'Naypyidaw', 'mm', 'Asia', 'Myanmar'),
(162, 'Windhoek', 'na', 'Africa', 'Namibia'),
(163, 'Yaren District', 'nr', 'Oceania', 'Nauru'),
(164, 'Kathmandu', 'np', 'Asia', 'Nepal'),
(165, 'Amsterdam', 'nl', 'Europe', 'Netherlands'),
(166, 'Nouméa', 'nc', 'Oceania', 'New Caledonia'),
(167, 'Wellington', 'nz', 'Oceania', 'New Zealand'),
(168, 'Managua', 'ni', 'North America', 'Nicaragua'),
(169, 'Niamey', 'ne', 'Africa', 'Niger'),
(170, 'Abuja', 'ng', 'Africa', 'Nigeria'),
(171, 'Alofi', 'nu', 'Oceania', 'Niue'),
(172, 'Kingston', 'nf', 'Oceania', 'Norfolk Island'),
(173, 'Pyongyang', 'kp', 'Asia', 'North Korea'),
(174, 'Skopje', 'mk', 'Europe', 'North Macedonia'),
(175, 'Belfast', 'gb-nir', 'Europe', 'Northern Ireland'),
(176, 'Saipan', 'mp', 'Oceania', 'Northern Mariana Islands'),
(177, 'Oslo', 'no', 'Europe', 'Norway'),
(178, 'Muscat', 'om', 'Asia', 'Oman'),
(179, 'Islamabad', 'pk', 'Asia', 'Pakistan'),
(180, 'Ngerulmud', 'pw', 'Oceania', 'Palau'),
(181, 'Panama City', 'pa', 'North America', 'Panama'),
(182, 'Port Moresby', 'pg', 'Oceania', 'Papua New Guinea'),
(183, 'Asunción', 'py', 'South America', 'Paraguay'),
(184, 'Lima', 'pe', 'South America', 'Peru'),
(185, 'Manila', 'ph', 'Asia', 'Philippines'),
(186, 'Adamstown', 'pn', 'Oceania', 'Pitcairn'),
(187, 'Warsaw', 'pl', 'Europe', 'Poland'),
(188, 'Lisbon', 'pt', 'Europe', 'Portugal'),
(189, 'San Juan', 'pr', 'North America', 'Puerto Rico'),
(190, 'Doha', 'qa', 'Asia', 'Qatar'),
(191, 'Brazzaville', 'cg', 'Africa', 'Republic of the Congo'),
(192, 'Bucharest', 'ro', 'Europe', 'Romania'),
(193, 'Moscow', 'ru', 'Europe', 'Russia'),
(194, 'Kigali', 'rw', 'Africa', 'Rwanda'),
(195, 'Saint-Denis', 're', 'Africa', 'Réunion'),
(196, 'Gustavia', 'bl', 'North America', 'Saint Barthélemy'),
(197, 'Jamestown', 'sh', 'Africa', 'Saint Helena, Ascension and Tristan da Cunha'),
(198, 'Basseterre', 'kn', 'North America', 'Saint Kitts and Nevis'),
(199, 'Castries', 'lc', 'North America', 'Saint Lucia'),
(200, 'Marigot', 'mf', 'North America', 'Saint Martin'),
(201, 'Saint-Pierre', 'pm', 'North America', 'Saint Pierre and Miquelon'),
(202, 'Kingstown', 'vc', 'North America', 'Saint Vincent and the Grenadines'),
(203, 'Apia', 'ws', 'Oceania', 'Samoa'),
(204, 'San Marino', 'sm', 'Europe', 'San Marino'),
(205, 'São Tomé', 'st', 'Africa', 'Sao Tome and Principe'),
(206, 'Riyadh', 'sa', 'Asia', 'Saudi Arabia'),
(207, 'Edinburgh', 'gb-sct', 'Europe', 'Scotland'),
(208, 'Dakar', 'sn', 'Africa', 'Senegal'),
(209, 'Belgrade', 'rs', 'Europe', 'Serbia'),
(210, 'Victoria', 'sc', 'Africa', 'Seychelles'),
(211, 'Freetown', 'sl', 'Africa', 'Sierra Leone'),
(212, 'Singapore', 'sg', 'Asia', 'Singapore'),
(213, 'Philipsburg', 'sx', 'North America', 'Sint Maarten'),
(214, 'Bratislava', 'sk', 'Europe', 'Slovakia'),
(215, 'Ljubljana', 'si', 'Europe', 'Slovenia'),
(216, 'Honiara', 'sb', 'Oceania', 'Solomon Islands'),
(217, 'Mogadishu', 'so', 'Africa', 'Somalia'),
(218, 'Pretoria', 'za', 'Africa', 'South Africa'),
(219, 'King Edward Point', 'gs', 'Antarctica', 'South Georgia and the South Sandwich Islands'),
(220, 'Seoul', 'kr', 'Asia', 'South Korea'),
(221, 'Juba', 'ss', 'Africa', 'South Sudan'),
(222, 'Madrid', 'es', 'Europe', 'Spain'),
(223, 'Sri Jayawardenepura Kotte, Colombo', 'lk', 'Asia', 'Sri Lanka'),
(224, 'Ramallah', 'ps', 'Asia', 'State of Palestine'),
(225, 'Khartoum', 'sd', 'Africa', 'Sudan'),
(226, 'Paramaribo', 'sr', 'South America', 'Suriname'),
(227, 'Longyearbyen', 'sj', 'Europe', 'Svalbard and Jan Mayen'),
(228, 'Stockholm', 'se', 'Europe', 'Sweden'),
(229, 'Bern', 'ch', 'Europe', 'Switzerland'),
(230, 'Damascus', 'sy', 'Asia', 'Syria'),
(231, 'Taipei', 'tw', 'Asia', 'Taiwan'),
(232, 'Dushanbe', 'tj', 'Asia', 'Tajikistan'),
(233, 'Dodoma', 'tz', 'Africa', 'Tanzania'),
(234, 'Bangkok', 'th', 'Asia', 'Thailand'),
(235, 'Dili', 'tl', 'Asia', 'Timor-Leste'),
(236, 'Lomé', 'tg', 'Africa', 'Togo'),
(237, 'Nukunonu, Atafu,Tokelau', 'tk', 'Oceania', 'Tokelau'),
(238, 'Nukuʻalofa', 'to', 'Oceania', 'Tonga'),
(239, 'Port of Spain', 'tt', 'South America', 'Trinidad and Tobago'),
(240, '', 'ta', '', 'Tristan da Cunha'),
(241, 'Tunis', 'tn', 'Africa', 'Tunisia'),
(242, 'Ankara', 'tr', 'Asia', 'Turkey'),
(243, 'Ashgabat', 'tm', 'Asia', 'Turkmenistan'),
(244, 'Cockburn Town', 'tc', 'North America', 'Turks and Caicos Islands'),
(245, 'Funafuti', 'tv', 'Oceania', 'Tuvalu'),
(246, 'Kampala', 'ug', 'Africa', 'Uganda'),
(247, 'Kiev', 'ua', 'Europe', 'Ukraine'),
(248, 'Abu Dhabi', 'ae', 'Asia', 'United Arab Emirates'),
(249, 'London', 'gb', 'Europe', 'United Kingdom'),
(250, '', 'un', '', 'United Nations'),
(251, 'Washington, D.C.', 'um', 'North America', 'United States Minor Outlying Islands'),
(252, 'Washington, D.C.', 'us', 'North America', 'United States of America'),
(253, '', 'xx', '', 'Unknown'),
(254, 'Montevideo', 'uy', 'South America', 'Uruguay'),
(255, 'Tashkent', 'uz', 'Asia', 'Uzbekistan'),
(256, 'Port Vila', 'vu', 'Oceania', 'Vanuatu'),
(257, 'Caracas', 've', 'South America', 'Venezuela'),
(258, 'Hanoi', 'vn', 'Asia', 'Vietnam'),
(259, 'Road Town', 'vg', 'North America', 'Virgin Islands (British)'),
(260, 'Charlotte Amalie', 'vi', 'North America', 'Virgin Islands (U.S.)'),
(261, 'Cardiff', 'gb-wls', 'Europe', 'Wales'),
(262, 'Mata-Utu', 'wf', 'Oceania', 'Wallis and Futuna'),
(263, 'Laayoune', 'eh', 'Africa', 'Western Sahara'),
(264, 'Sana\'a', 'ye', 'Asia', 'Yemen'),
(265, 'Lusaka', 'zm', 'Africa', 'Zambia'),
(266, 'Harare', 'zw', 'Africa', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `flutterwave_payments`
--

CREATE TABLE `flutterwave_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `flutterwave_payment_id` varchar(191) DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_status` enum('pending','completed','failed') NOT NULL DEFAULT 'pending',
  `payment_date` timestamp NULL DEFAULT NULL,
  `payment_error_response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payment_error_response`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `front_details`
--

CREATE TABLE `front_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_setting_id` bigint(20) UNSIGNED DEFAULT NULL,
  `header_title` varchar(200) DEFAULT NULL,
  `header_description` text DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `feature_with_image_heading` varchar(191) DEFAULT NULL,
  `review_heading` varchar(191) DEFAULT NULL,
  `feature_with_icon_heading` varchar(191) DEFAULT NULL,
  `comments_heading` varchar(191) DEFAULT NULL,
  `price_heading` varchar(191) DEFAULT NULL,
  `price_description` varchar(191) DEFAULT NULL,
  `faq_heading` varchar(191) DEFAULT NULL,
  `faq_description` text DEFAULT NULL,
  `contact_heading` text DEFAULT NULL,
  `footer_copyright_text` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `front_details`
--

INSERT INTO `front_details` (`id`, `language_setting_id`, `header_title`, `header_description`, `image`, `feature_with_image_heading`, `review_heading`, `feature_with_icon_heading`, `comments_heading`, `price_heading`, `price_description`, `faq_heading`, `faq_description`, `contact_heading`, `footer_copyright_text`, `created_at`, `updated_at`) VALUES
(1, 1, 'Restaurant POS software made simple!', 'Easily manage orders, menus, and tables in one place. Save time, reduce errors, and grow your business faster', NULL, 'Take Control of Your Restaurant', 'What Restaurant Owners Are Saying', 'Powerful Features Built to Elevate Your Restaurant Operations', NULL, 'Simple, Transparent Pricing', 'Get everything you need to manage your restaurant with one affordable plan.', 'Your questions, answered', 'Answers to the most frequently asked questions.', 'Contact', '© 2025 TableTrack. All Rights Reserved.', '2025-06-16 07:59:56', '2025-06-16 07:59:56');

-- --------------------------------------------------------

--
-- Table structure for table `front_faq_settings`
--

CREATE TABLE `front_faq_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_setting_id` bigint(20) UNSIGNED DEFAULT NULL,
  `question` text DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `front_faq_settings`
--

INSERT INTO `front_faq_settings` (`id`, `language_setting_id`, `question`, `answer`, `created_at`, `updated_at`) VALUES
(1, 1, 'How can I contact customer support?', 'Our dedicated support team is available via email to assist you with any questions or technical issues.', NULL, NULL),
(2, 1, 'Is the software easy to use?', 'Yes, our software is designed to be user-friendly and intuitive.', NULL, NULL),
(3, 1, 'Can I manage multiple locations with TableTrack?', 'Yes, TableTrack allows you to manage multiple restaurant locations from a single dashboard.', NULL, NULL),
(4, 1, 'Does TableTrack support online payments?', 'Absolutely. TableTrack integrates with leading payment gateways like Stripe and Razorpay for secure transactions.', NULL, NULL),
(5, 1, 'Is my restaurant data secure?', 'We use industry-standard security measures to ensure your data is safe and protected at all times.', NULL, NULL),
(6, 1, 'Can I customize the menu and floor plan?', 'Yes, you can easily customize your menu and design your restaurant’s floor plan to fit your needs.', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `front_features`
--

CREATE TABLE `front_features` (
  `id` int(10) UNSIGNED NOT NULL,
  `language_setting_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(191) NOT NULL,
  `description` longtext DEFAULT NULL,
  `image` longtext DEFAULT NULL,
  `icon` longtext DEFAULT NULL,
  `type` enum('image','icon','task','bills','team','apps') NOT NULL DEFAULT 'image',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `front_features`
--

INSERT INTO `front_features` (`id`, `language_setting_id`, `title`, `description`, `image`, `icon`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 'Streamline Order Management', 'Never lose track of an order again. All your customer orders—from dine-in to takeout—are organized and easily accessible in one place. Speed up service and keep your kitchen running smoothly.', '', '', 'image', NULL, NULL),
(2, 1, 'Optimize Table Reservations', 'Maximize seating efficiency with real-time table tracking and reservations. Reduce wait times and ensure no table sits empty during peak hours, improving customer experience and turnover.', '', '', 'image', NULL, NULL),
(3, 1, 'Effortless Menu Management', 'Easily add, edit, or remove items from your menu on the go. Highlight specials, update prices, and keep everything in sync across all platforms, so your staff and customers always see the latest offerings.', '', '', 'image', NULL, NULL),
(4, 1, 'QR Code Menu', 'Contactless Ordering Made Easy', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\"\n                        class=\"bi bi-qr-code-scan text-skin-base dark:text-skin-base size-6\" viewBox=\"0 0 16 16\">\n                        <path\n                            d=\"M0 .5A.5.5 0 0 1 .5 0h3a.5.5 0 0 1 0 1H1v2.5a.5.5 0 0 1-1 0zm12 0a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-1 0V1h-2.5a.5.5 0 0 1-.5-.5M.5 12a.5.5 0 0 1 .5.5V15h2.5a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5v-3a.5.5 0 0 1 .5-.5m15 0a.5.5 0 0 1 .5.5v3a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1 0-1H15v-2.5a.5.5 0 0 1 .5-.5M4 4h1v1H4z\" />\n                        <path d=\"M7 2H2v5h5zM3 3h3v3H3zm2 8H4v1h1z\" />\n                        <path d=\"M7 9H2v5h5zm-4 1h3v3H3zm8-6h1v1h-1z\" />\n                        <path\n                            d=\"M9 2h5v5H9zm1 1v3h3V3zM8 8v2h1v1H8v1h2v-2h1v2h1v-1h2v-1h-3V8zm2 2H9V9h1zm4 2h-1v1h-2v1h3zm-4 2v-1H8v1z\" />\n                        <path d=\"M12 9h2V8h-2z\" />\n                    </svg>', 'qr-code-scan', 'icon', NULL, NULL),
(5, 1, 'Payment Gateway Integration', 'Fast, Secure, and Flexible Payments using Stripe and Razorpay', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-qr-code-scan text-skin-base dark:text-skin-base size-6\" viewBox=\"0 0 16 16\">\n                          <path d=\"M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm6.226 5.385c-.584 0-.937.164-.937.593 0 .468.607.674 1.36.93 1.228.415 2.844.963 2.851 2.993C11.5 11.868 9.924 13 7.63 13a7.7 7.7 0 0 1-3.009-.626V9.758c.926.506 2.095.88 3.01.88.617 0 1.058-.165 1.058-.671 0-.518-.658-.755-1.453-1.041C6.026 8.49 4.5 7.94 4.5 6.11 4.5 4.165 5.988 3 8.226 3a7.3 7.3 0 0 1 2.734.505v2.583c-.838-.45-1.896-.703-2.734-.703\"></path>\n                        </svg>', 'bi-bootstrap-fill', 'icon', NULL, NULL),
(6, 1, 'Staff Management', 'Separate login for every staff role with different permissions.', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-qr-code-scan text-skin-base dark:text-skin-base size-6\" viewBox=\"0 0 16 16\">\n                        <path d=\"M15 14s1 0 1-1-1-4-5-4-5 3-5 4 1 1 1 1zm-7.978-1L7 12.996c.001-.264.167-1.03.76-1.72C8.312 10.629 9.282 10 11 10c1.717 0 2.687.63 3.24 1.276.593.69.758 1.457.76 1.72l-.008.002-.014.002zM11 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4m3-2a3 3 0 1 1-6 0 3 3 0 0 1 6 0M6.936 9.28a6 6 0 0 0-1.23-.247A7 7 0 0 0 5 9c-4 0-5 3-5 4q0 1 1 1h4.216A2.24 2.24 0 0 1 5 13c0-1.01.377-2.042 1.09-2.904.243-.294.526-.569.846-.816M4.92 10A5.5 5.5 0 0 0 4 13H1c0-.26.164-1.03.76-1.724.545-.636 1.492-1.256 3.16-1.275ZM1.5 5.5a3 3 0 1 1 6 0 3 3 0 0 1-6 0m3-2a2 2 0 1 0 0 4 2 2 0 0 0 0-4\"></path>\n                        </svg>', 'bi-people', 'icon', NULL, NULL),
(7, 1, 'POS (Point of Sale)', 'Complete POS Integration', '<svg class=\"size-6 transition duration-75 text-skin-base dark:text-skin-base\" fill=\"currentColor\" viewBox=\"0 -0.5 25 25\" xmlns=\"http://www.w3.org/2000/svg\">\n                            <g id=\"SVGRepo_bgCarrier\" stroke-width=\"0\"></g>\n                            <g id=\"SVGRepo_tracerCarrier\" stroke-linecap=\"round\" stroke-linejoin=\"round\"></g>\n                            <g id=\"SVGRepo_iconCarrier\">\n                                <path fill-rule=\"evenodd\" d=\"M16,6 L20,6 C21.1045695,6 22,6.8954305 22,8 L22,16 C22,17.1045695 21.1045695,18 20,18 L16,18 L16,19.9411765 C16,21.0658573 15.1177541,22 14,22 L4,22 C2.88224586,22 2,21.0658573 2,19.9411765 L2,4.05882353 C2,2.93414267 2.88224586,2 4,2 L14,2 C15.1177541,2 16,2.93414267 16,4.05882353 L16,6 Z M20,11 L16,11 L16,16 L20,16 L20,11 Z M14,19.9411765 L14,4.05882353 C14,4.01396021 13.9868154,4 14,4 L4,4 C4.01318464,4 4,4.01396021 4,4.05882353 L4,19.9411765 C4,19.9860398 4.01318464,20 4,20 L14,20 C13.9868154,20 14,19.9860398 14,19.9411765 Z M5,19 L5,17 L7,17 L7,19 L5,19 Z M8,19 L8,17 L10,17 L10,19 L8,19 Z M11,19 L11,17 L13,17 L13,19 L11,19 Z M5,16 L5,14 L7,14 L7,16 L5,16 Z M8,16 L8,14 L10,14 L10,16 L8,16 Z M11,16 L11,14 L13,14 L13,16 L11,16 Z M13,5 L13,13 L5,13 L5,5 L13,5 Z M7,7 L7,11 L11,11 L11,7 L7,7 Z M20,9 L20,8 L16,8 L16,9 L20,9 Z\">\n                                </path>\n                            </g>\n                        </svg>', 'print-icon', 'icon', NULL, NULL),
(8, 1, 'Custom Floor Plans', 'Design Your Restaurants Layout.', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-qr-code-scan text-skin-base dark:text-skin-base size-6\" viewBox=\"0 0 16 16\">\n                        <path d=\"M8.235 1.559a.5.5 0 0 0-.47 0l-7.5 4a.5.5 0 0 0 0 .882L3.188 8 .264 9.559a.5.5 0 0 0 0 .882l7.5 4a.5.5 0 0 0 .47 0l7.5-4a.5.5 0 0 0 0-.882L12.813 8l2.922-1.559a.5.5 0 0 0 0-.882zm3.515 7.008L14.438 10 8 13.433 1.562 10 4.25 8.567l3.515 1.874a.5.5 0 0 0 .47 0zM8 9.433 1.562 6 8 2.567 14.438 6z\"></path>\n                    </svg>', 'bi-box', 'icon', NULL, NULL),
(9, 1, 'Kitchen Order Tickets (KOT)', 'Efficient Kitchen Workflow.', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-qr-code-scan text-skin-base dark:text-skin-base size-6\" viewBox=\"0 0 16 16\">\n                        <path d=\"M3 4.5a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 1 1 0 1h-6a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5M11.5 4a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1zm0 2a.5.5 0 0 0 0 1h1a.5.5 0 0 0 0-1z\"></path>\n                        <path d=\"M2.354.646a.5.5 0 0 0-.801.13l-.5 1A.5.5 0 0 0 1 2v13H.5a.5.5 0 0 0 0 1h15a.5.5 0 0 0 0-1H15V2a.5.5 0 0 0-.053-.224l-.5-1a.5.5 0 0 0-.8-.13L13 1.293l-.646-.647a.5.5 0 0 0-.708 0L11 1.293l-.646-.647a.5.5 0 0 0-.708 0L9 1.293 8.354.646a.5.5 0 0 0-.708 0L7 1.293 6.354.646a.5.5 0 0 0-.708 0L5 1.293 4.354.646a.5.5 0 0 0-.708 0L3 1.293zm-.217 1.198.51.51a.5.5 0 0 0 .707 0L4 1.707l.646.647a.5.5 0 0 0 .708 0L6 1.707l.646.647a.5.5 0 0 0 .708 0L8 1.707l.646.647a.5.5 0 0 0 .708 0L10 1.707l.646.647a.5.5 0 0 0 .708 0L12 1.707l.646.647a.5.5 0 0 0 .708 0l.509-.51.137.274V15H2V2.118z\"></path>\n                    </svg>', 'bi-newspaper', 'icon', NULL, NULL),
(10, 1, 'Bill Printing', 'Quick and Accurate Billing.', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-qr-code-scan text-skin-base dark:text-skin-base size-6\" viewBox=\"0 0 16 16\">\n                        <path d=\"M2.5 8a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1\"></path>\n                        <path d=\"M5 1a2 2 0 0 0-2 2v2H2a2 2 0 0 0-2 2v3a2 2 0 0 0 2 2h1v1a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2v-1h1a2 2 0 0 0 2-2V7a2 2 0 0 0-2-2h-1V3a2 2 0 0 0-2-2zM4 3a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1v2H4zm1 5a2 2 0 0 0-2 2v1H2a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-1v-1a2 2 0 0 0-2-2zm7 2v3a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-3a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1\"></path>\n                        </svg>', 'bi-house-door-fill', 'icon', NULL, NULL),
(11, 1, 'Reports', 'Data-Driven Decisions.', '<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"16\" height=\"16\" fill=\"currentColor\" class=\"bi bi-qr-code-scan text-skin-base dark:text-skin-base size-6\" viewBox=\"0 0 16 16\">\n                        <path fill-rule=\"evenodd\" d=\"M0 0h1v15h15v1H0zm10 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-1 0V4.9l-3.613 4.417a.5.5 0 0 1-.74.037L7.06 6.767l-3.656 5.027a.5.5 0 0 1-.808-.588l4-5.5a.5.5 0 0 1 .758-.06l2.609 2.61L13.445 4H10.5a.5.5 0 0 1-.5-.5\"></path>\n                    </svg>', 'bi-arrow-right-circle-fill', 'icon', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `front_review_settings`
--

CREATE TABLE `front_review_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_setting_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reviews` text DEFAULT NULL,
  `reviewer_name` varchar(191) DEFAULT NULL,
  `reviewer_designation` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `front_review_settings`
--

INSERT INTO `front_review_settings` (`id`, `language_setting_id`, `reviews`, `reviewer_name`, `reviewer_designation`, `created_at`, `updated_at`) VALUES
(1, 1, 'It has completely transformed how we operate. Managing orders, tables, and staff all from one platform has reduced our workload and made everything run more smoothly. ', 'John Martin', 'Owner of Riverbend Bistro', NULL, NULL),
(2, 1, 'The QR Code menu and payment integration have made a huge difference for us, especially after the pandemic. Customers love the ease, and we’ve seen faster table turnover.', 'Emily Thompson', 'Manager at Lakeside Grill', NULL, NULL),
(3, 1, 'We are able to track every order in real time, keep our menu updated, and quickly manage payments. It is like having an extra set of hands in the restaurant.', 'Emily Thompson', 'Manager at Lakeside Grill', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `global_currencies`
--

CREATE TABLE `global_currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency_name` varchar(191) NOT NULL,
  `currency_symbol` varchar(191) NOT NULL,
  `currency_code` varchar(191) NOT NULL,
  `exchange_rate` decimal(16,2) DEFAULT NULL,
  `usd_price` decimal(16,2) DEFAULT NULL,
  `is_cryptocurrency` enum('yes','no') NOT NULL DEFAULT 'no',
  `currency_position` enum('left','right','left_with_space','right_with_space') NOT NULL DEFAULT 'left',
  `no_of_decimal` int(10) UNSIGNED NOT NULL DEFAULT 2,
  `thousand_separator` varchar(191) DEFAULT NULL,
  `decimal_separator` varchar(191) DEFAULT NULL,
  `status` enum('enable','disable') NOT NULL DEFAULT 'enable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `global_currencies`
--

INSERT INTO `global_currencies` (`id`, `currency_name`, `currency_symbol`, `currency_code`, `exchange_rate`, `usd_price`, `is_cryptocurrency`, `currency_position`, `no_of_decimal`, `thousand_separator`, `decimal_separator`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Dollars', '$', 'USD', NULL, NULL, 'no', 'left', 2, ',', '.', 'enable', '2025-04-18 06:02:03', '2025-04-18 06:02:03', NULL),
(2, 'Rupee', '₹', 'INR', NULL, NULL, 'no', 'left', 2, ',', '.', 'enable', '2025-04-18 06:02:03', '2025-04-18 06:02:03', NULL),
(3, 'Pounds', '£', 'GBP', NULL, NULL, 'no', 'left', 2, ',', '.', 'enable', '2025-04-18 06:02:03', '2025-04-18 06:02:03', NULL),
(4, 'Euros', '€', 'EUR', NULL, NULL, 'no', 'left', 2, ',', '.', 'enable', '2025-04-18 06:02:03', '2025-04-18 06:02:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `global_invoices`
--

CREATE TABLE `global_invoices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `package_id` bigint(20) UNSIGNED DEFAULT NULL,
  `global_subscription_id` bigint(20) UNSIGNED DEFAULT NULL,
  `offline_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `signature` varchar(191) DEFAULT NULL,
  `token` varchar(191) DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `event_id` varchar(191) DEFAULT NULL,
  `package_type` varchar(191) DEFAULT NULL,
  `sub_total` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `billing_frequency` varchar(191) DEFAULT NULL,
  `billing_interval` varchar(191) DEFAULT NULL,
  `recurring` enum('yes','no') DEFAULT NULL,
  `plan_id` varchar(191) DEFAULT NULL,
  `subscription_id` varchar(191) DEFAULT NULL,
  `invoice_id` varchar(191) DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `stripe_invoice_number` varchar(191) DEFAULT NULL,
  `pay_date` datetime DEFAULT NULL,
  `next_pay_date` datetime DEFAULT NULL,
  `gateway_name` varchar(191) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `m_payment_id` varchar(191) DEFAULT NULL,
  `pf_payment_id` varchar(191) DEFAULT NULL,
  `payfast_plan` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `global_invoices`
--

INSERT INTO `global_invoices` (`id`, `restaurant_id`, `currency_id`, `package_id`, `global_subscription_id`, `offline_method_id`, `signature`, `token`, `transaction_id`, `event_id`, `package_type`, `sub_total`, `total`, `billing_frequency`, `billing_interval`, `recurring`, `plan_id`, `subscription_id`, `invoice_id`, `amount`, `stripe_invoice_number`, `pay_date`, `next_pay_date`, `gateway_name`, `status`, `created_at`, `updated_at`, `m_payment_id`, `pf_payment_id`, `payfast_plan`) VALUES
(1, 1, 1, 5, 1, NULL, NULL, NULL, 'S4GIEXGLYR1W51S', NULL, 'trial', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-18 06:02:05', '2025-05-18 06:02:05', 'offline', 'active', '2025-04-18 06:02:05', '2025-04-18 06:02:05', NULL, NULL, NULL),
(2, 2, 1, 5, 2, NULL, NULL, NULL, 'MQKWXSO1USIBJA8', NULL, 'trial', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-18 20:42:26', '2025-05-18 20:42:26', 'offline', 'active', '2025-04-18 20:42:26', '2025-04-18 20:42:26', NULL, NULL, NULL),
(3, 2, 1, 3, 3, NULL, NULL, NULL, 'GGCZ8KVWSP6VKGS', NULL, 'lifetime', NULL, 199, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-18 00:00:00', NULL, 'offline', NULL, '2025-04-19 02:38:48', '2025-04-19 02:38:48', NULL, NULL, NULL),
(4, 3, 1, 5, 4, NULL, NULL, NULL, 'K4N8RGPCCDBAWXN', NULL, 'trial', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-05-30 08:33:04', '2025-06-29 08:33:04', 'offline', 'active', '2025-05-30 08:33:04', '2025-05-30 08:33:04', NULL, NULL, NULL),
(5, 3, 1, 3, 5, NULL, NULL, NULL, 'DO8UBTW5GVM9CND', NULL, 'lifetime', NULL, 199, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-06-26 00:00:00', '2025-07-26 00:00:00', 'offline', NULL, '2025-06-26 17:24:15', '2025-06-26 17:24:15', NULL, NULL, NULL),
(6, 1, 1, 1, 6, NULL, NULL, NULL, 'WWSEVDAM2BQUIEG', NULL, 'monthly', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-13 00:00:08', '2025-08-13 00:00:00', 'offline', NULL, '2025-07-13 00:00:08', '2025-07-13 00:00:08', NULL, NULL, NULL),
(7, 3, 1, 3, 7, NULL, NULL, NULL, '4PLFT9GZIXQHW64', NULL, 'lifetime', NULL, 199, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-17 00:00:00', NULL, 'offline', NULL, '2025-07-17 21:55:06', '2025-07-17 21:55:06', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `global_settings`
--

CREATE TABLE `global_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_code` varchar(80) DEFAULT NULL,
  `supported_until` timestamp NULL DEFAULT NULL,
  `last_license_verified_at` timestamp NULL DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `theme_hex` varchar(191) DEFAULT NULL,
  `theme_rgb` varchar(191) DEFAULT NULL,
  `locale` varchar(191) NOT NULL DEFAULT 'en',
  `license_type` varchar(191) DEFAULT NULL,
  `hide_cron_job` tinyint(1) NOT NULL DEFAULT 0,
  `last_cron_run` timestamp NULL DEFAULT NULL,
  `system_update` tinyint(1) NOT NULL DEFAULT 1,
  `purchased_on` timestamp NULL DEFAULT NULL,
  `timezone` varchar(191) DEFAULT 'Asia/Kolkata',
  `disable_landing_site` tinyint(1) NOT NULL DEFAULT 0,
  `landing_type` varchar(191) NOT NULL DEFAULT 'static',
  `landing_site_type` enum('theme','custom') NOT NULL DEFAULT 'theme',
  `landing_site_url` varchar(191) DEFAULT NULL,
  `installed_url` tinytext DEFAULT NULL,
  `requires_approval_after_signup` tinyint(1) NOT NULL DEFAULT 0,
  `facebook_link` varchar(255) DEFAULT NULL,
  `instagram_link` varchar(255) DEFAULT NULL,
  `twitter_link` varchar(255) DEFAULT NULL,
  `yelp_link` varchar(255) DEFAULT NULL,
  `default_currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `show_logo_text` tinyint(1) NOT NULL DEFAULT 1,
  `meta_title` varchar(191) DEFAULT NULL,
  `meta_keyword` text DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `upload_fav_icon_android_chrome_192` varchar(191) DEFAULT NULL,
  `upload_fav_icon_android_chrome_512` varchar(191) DEFAULT NULL,
  `upload_fav_icon_apple_touch_icon` varchar(191) DEFAULT NULL,
  `upload_favicon_16` varchar(191) DEFAULT NULL,
  `upload_favicon_32` varchar(191) DEFAULT NULL,
  `favicon` varchar(191) DEFAULT NULL,
  `hash` varchar(191) DEFAULT NULL,
  `webmanifest` varchar(191) DEFAULT NULL,
  `is_pwa_install_alert_show` varchar(191) NOT NULL DEFAULT '1',
  `google_map_api_key` varchar(191) DEFAULT NULL,
  `session_driver` enum('file','database') NOT NULL DEFAULT 'database',
  `enable_stripe` tinyint(1) NOT NULL DEFAULT 1,
  `enable_razorpay` tinyint(1) NOT NULL DEFAULT 1,
  `enable_flutterwave` tinyint(1) NOT NULL DEFAULT 1,
  `enable_payfast` tinyint(1) NOT NULL DEFAULT 1,
  `enable_paypal` tinyint(1) NOT NULL DEFAULT 1,
  `enable_paystack` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `global_settings`
--

INSERT INTO `global_settings` (`id`, `purchase_code`, `supported_until`, `last_license_verified_at`, `email`, `created_at`, `updated_at`, `name`, `logo`, `theme_hex`, `theme_rgb`, `locale`, `license_type`, `hide_cron_job`, `last_cron_run`, `system_update`, `purchased_on`, `timezone`, `disable_landing_site`, `landing_type`, `landing_site_type`, `landing_site_url`, `installed_url`, `requires_approval_after_signup`, `facebook_link`, `instagram_link`, `twitter_link`, `yelp_link`, `default_currency_id`, `show_logo_text`, `meta_title`, `meta_keyword`, `meta_description`, `upload_fav_icon_android_chrome_192`, `upload_fav_icon_android_chrome_512`, `upload_fav_icon_apple_touch_icon`, `upload_favicon_16`, `upload_favicon_32`, `favicon`, `hash`, `webmanifest`, `is_pwa_install_alert_show`, `google_map_api_key`, `session_driver`, `enable_stripe`, `enable_razorpay`, `enable_flutterwave`, `enable_payfast`, `enable_paypal`, `enable_paystack`) VALUES
(1, '173eb172-baea-4f9c-876c-09d4bf3d28eb', '2025-10-17 20:15:54', '2025-07-29 23:16:20', NULL, '2025-04-18 06:02:05', '2025-07-29 23:16:20', 'Thrive Eats', '37edd5a3c275b50b53244239613a16a2.png', '#1226ac', '18, 38, 172', 'en', 'Regular License', 1, '2025-07-29 15:25:03', 1, '2025-04-18 05:15:54', 'Asia/Kolkata', 0, 'dynamic', 'theme', NULL, 'https://eats.usethriveerp.com', 0, 'https://www.facebook.com/', 'https://www.instagram.com/', 'https://www.twitter.com/', NULL, 1, 1, NULL, NULL, NULL, 'android-chrome-192x192.png', 'android-chrome-512x512.png', 'apple-touch-icon.png', 'favicon-16x16.png', 'favicon-32x32.png', 'favicon.ico', '9f2b3fedd0f659cd3161e68570ca3c8b', NULL, '1', NULL, 'database', 0, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `global_subscriptions`
--

CREATE TABLE `global_subscriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `package_id` bigint(20) UNSIGNED DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `package_type` varchar(191) DEFAULT NULL,
  `plan_type` varchar(191) DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `user_id` varchar(191) DEFAULT NULL,
  `quantity` varchar(191) DEFAULT NULL,
  `token` varchar(191) DEFAULT NULL,
  `razorpay_id` varchar(191) DEFAULT NULL,
  `razorpay_plan` varchar(191) DEFAULT NULL,
  `stripe_id` varchar(191) DEFAULT NULL,
  `stripe_status` varchar(191) DEFAULT NULL,
  `stripe_price` varchar(191) DEFAULT NULL,
  `gateway_name` varchar(191) DEFAULT NULL,
  `trial_ends_at` varchar(191) DEFAULT NULL,
  `subscription_status` enum('active','inactive') DEFAULT NULL,
  `ends_at` datetime DEFAULT NULL,
  `subscribed_on_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `subscription_id` varchar(191) DEFAULT NULL,
  `customer_id` varchar(191) DEFAULT NULL,
  `flutterwave_id` varchar(191) DEFAULT NULL,
  `flutterwave_payment_ref` varchar(191) DEFAULT NULL,
  `flutterwave_status` varchar(191) DEFAULT NULL,
  `flutterwave_customer_id` varchar(191) DEFAULT NULL,
  `payfast_plan` varchar(191) DEFAULT NULL,
  `payfast_status` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `global_subscriptions`
--

INSERT INTO `global_subscriptions` (`id`, `restaurant_id`, `package_id`, `currency_id`, `package_type`, `plan_type`, `transaction_id`, `name`, `user_id`, `quantity`, `token`, `razorpay_id`, `razorpay_plan`, `stripe_id`, `stripe_status`, `stripe_price`, `gateway_name`, `trial_ends_at`, `subscription_status`, `ends_at`, `subscribed_on_date`, `created_at`, `updated_at`, `subscription_id`, `customer_id`, `flutterwave_id`, `flutterwave_payment_ref`, `flutterwave_status`, `flutterwave_customer_id`, `payfast_plan`, `payfast_status`) VALUES
(1, 1, 5, 1, 'trial', NULL, 'S4GIEXGLYR1W51S', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, 'offline', '2025-05-18 06:02:05', 'inactive', '2025-05-18 06:02:05', '2025-04-18 06:02:05', '2025-04-18 06:02:05', '2025-07-13 00:00:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 5, 1, 'trial', NULL, 'MQKWXSO1USIBJA8', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, 'offline', '2025-05-18 20:42:26', 'inactive', '2025-05-18 20:42:26', '2025-04-18 20:42:26', '2025-04-18 20:42:26', '2025-04-19 02:38:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 2, 3, 1, 'lifetime', NULL, 'GGCZ8KVWSP6VKGS', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, 'offline', NULL, 'active', NULL, '2025-04-18 00:00:00', '2025-04-19 02:38:48', '2025-04-19 02:38:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 3, 5, 1, 'trial', NULL, 'K4N8RGPCCDBAWXN', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, 'offline', '2025-06-29 08:33:04', 'inactive', '2025-06-29 08:33:04', '2025-05-30 08:33:04', '2025-05-30 08:33:04', '2025-06-26 17:24:15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 3, 3, 1, 'lifetime', NULL, 'DO8UBTW5GVM9CND', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, 'offline', NULL, 'inactive', NULL, '2025-06-26 00:00:00', '2025-06-26 17:24:15', '2025-07-17 21:55:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 1, 1, 1, 'monthly', NULL, 'WWSEVDAM2BQUIEG', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, 'offline', NULL, 'active', '2025-08-13 00:00:00', '2025-07-13 00:00:08', '2025-07-13 00:00:08', '2025-07-13 00:00:08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 3, 3, 1, 'lifetime', NULL, '4PLFT9GZIXQHW64', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, 'offline', NULL, 'active', NULL, '2025-07-17 00:00:00', '2025-07-17 21:55:06', '2025-07-17 21:55:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_global_settings`
--

CREATE TABLE `inventory_global_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `license_type` varchar(20) DEFAULT NULL,
  `purchase_code` varchar(191) DEFAULT NULL,
  `purchased_on` timestamp NULL DEFAULT NULL,
  `supported_until` timestamp NULL DEFAULT NULL,
  `notify_update` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventory_global_settings`
--

INSERT INTO `inventory_global_settings` (`id`, `license_type`, `purchase_code`, `purchased_on`, `supported_until`, `notify_update`, `created_at`, `updated_at`) VALUES
(1, 'Regular License', 'b71756c0-e740-4d49-bd8a-3ce490efc71b', '2025-06-16 07:56:24', '2025-12-15 22:56:24', 1, '2025-06-16 08:05:09', '2025-06-16 08:05:45');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_items`
--

CREATE TABLE `inventory_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `inventory_item_category_id` bigint(20) UNSIGNED NOT NULL,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `threshold_quantity` decimal(16,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `preferred_supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reorder_quantity` decimal(16,2) NOT NULL DEFAULT 0.00,
  `unit_purchase_price` decimal(16,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventory_items`
--

INSERT INTO `inventory_items` (`id`, `branch_id`, `name`, `inventory_item_category_id`, `unit_id`, `threshold_quantity`, `created_at`, `updated_at`, `preferred_supplier_id`, `reorder_quantity`, `unit_purchase_price`) VALUES
(1, 4, 'Chicken wings', 46, 41, 20.00, '2025-06-16 17:37:35', '2025-06-16 17:37:35', 1, 10.00, 60.00);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_item_categories`
--

CREATE TABLE `inventory_item_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventory_item_categories`
--

INSERT INTO `inventory_item_categories` (`id`, `branch_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Meat & Poultry', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(2, 1, 'Seafood', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(3, 1, 'Dairy & Eggs', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(4, 1, 'Fresh Produce', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(5, 1, 'Herbs & Spices', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(6, 1, 'Dry Goods', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(7, 1, 'Canned Goods', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(8, 1, 'Beverages', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(9, 1, 'Condiments & Sauces', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(10, 1, 'Baking Supplies', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(11, 1, 'Oils & Vinegars', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(12, 1, 'Frozen Foods', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(13, 1, 'Cleaning Supplies', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(14, 1, 'Kitchen Equipment', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(15, 1, 'Disposables', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(16, 2, 'Meat & Poultry', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(17, 2, 'Seafood', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(18, 2, 'Dairy & Eggs', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(19, 2, 'Fresh Produce', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(20, 2, 'Herbs & Spices', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(21, 2, 'Dry Goods', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(22, 2, 'Canned Goods', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(23, 2, 'Beverages', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(24, 2, 'Condiments & Sauces', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(25, 2, 'Baking Supplies', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(26, 2, 'Oils & Vinegars', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(27, 2, 'Frozen Foods', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(28, 2, 'Cleaning Supplies', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(29, 2, 'Kitchen Equipment', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(30, 2, 'Disposables', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(31, 3, 'Meat & Poultry', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(32, 3, 'Seafood', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(33, 3, 'Dairy & Eggs', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(34, 3, 'Fresh Produce', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(35, 3, 'Herbs & Spices', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(36, 3, 'Dry Goods', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(37, 3, 'Canned Goods', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(38, 3, 'Beverages', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(39, 3, 'Condiments & Sauces', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(40, 3, 'Baking Supplies', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(41, 3, 'Oils & Vinegars', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(42, 3, 'Frozen Foods', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(43, 3, 'Cleaning Supplies', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(44, 3, 'Kitchen Equipment', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(45, 3, 'Disposables', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(46, 4, 'Meat & Poultry', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(47, 4, 'Seafood', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(48, 4, 'Dairy & Eggs', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(49, 4, 'Fresh Produce', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(50, 4, 'Herbs & Spices', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(51, 4, 'Dry Goods', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(52, 4, 'Canned Goods', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(53, 4, 'Beverages', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(54, 4, 'Condiments & Sauces', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(55, 4, 'Baking Supplies', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(56, 4, 'Oils & Vinegars', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(57, 4, 'Frozen Foods', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(58, 4, 'Cleaning Supplies', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(59, 4, 'Kitchen Equipment', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(60, 4, 'Disposables', '2025-06-16 08:05:10', '2025-06-16 08:05:10');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_movements`
--

CREATE TABLE `inventory_movements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `inventory_item_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` decimal(16,2) NOT NULL DEFAULT 0.00,
  `transaction_type` enum('in','out','waste','transfer') NOT NULL DEFAULT 'in',
  `waste_reason` enum('expiry','spoilage','customer_complaint','over_preparation','other') DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `transfer_branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unit_purchase_price` decimal(16,2) NOT NULL DEFAULT 0.00,
  `expiration_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_settings`
--

CREATE TABLE `inventory_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `allow_auto_purchase` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventory_settings`
--

INSERT INTO `inventory_settings` (`id`, `restaurant_id`, `allow_auto_purchase`, `created_at`, `updated_at`) VALUES
(1, 1, 0, '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(2, 2, 0, '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(3, 3, 0, '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(4, 1, 0, '2025-06-16 08:05:11', '2025-06-16 08:05:11'),
(5, 2, 0, '2025-06-16 08:05:11', '2025-06-16 08:05:11'),
(6, 3, 0, '2025-06-16 08:05:11', '2025-06-16 08:05:11');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_stocks`
--

CREATE TABLE `inventory_stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `inventory_item_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` decimal(16,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `item_categories`
--

CREATE TABLE `item_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_name` text DEFAULT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `item_categories`
--

INSERT INTO `item_categories` (`id`, `branch_id`, `category_name`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 3, '{\"en\":\"Swallow\"}', 1, '2025-04-19 02:53:28', '2025-04-19 02:53:28'),
(2, 4, '{\"en\":\"Special\"}', 2, '2025-06-06 04:44:18', '2025-06-06 04:44:18'),
(3, 4, '{\"en\":\"Salads\"}', 3, '2025-06-11 15:56:33', '2025-06-11 15:56:33'),
(4, 4, '{\"en\":\"Rice\"}', 4, '2025-06-11 16:02:42', '2025-06-11 16:02:42'),
(5, 4, '{\"en\":\"Chips\"}', 5, '2025-06-11 16:39:19', '2025-06-11 16:39:19'),
(6, 4, '{\"en\":\"Chicken\"}', 6, '2025-06-11 16:42:19', '2025-06-11 16:42:19'),
(7, 4, '{\"en\":\"Turkey\"}', 7, '2025-06-11 16:44:05', '2025-06-11 16:44:05'),
(8, 4, '{\"en\":\"Stew\"}', 8, '2025-06-11 17:35:23', '2025-06-11 17:35:23'),
(9, 4, '{\"en\":\"Tilapia\"}', 9, '2025-06-11 17:40:26', '2025-06-11 17:40:26'),
(10, 4, '{\"en\":\"Swallow\"}', 10, '2025-06-11 17:44:37', '2025-06-11 17:44:37'),
(11, 4, '{\"en\":\"Yam\"}', 11, '2025-06-11 17:46:47', '2025-06-11 17:46:47'),
(12, 4, '{\"en\":\"Carbs\"}', 12, '2025-06-11 17:46:56', '2025-06-11 17:46:56'),
(13, 4, '{\"en\":\"Shitor\"}', 13, '2025-06-11 17:48:17', '2025-06-11 17:48:17'),
(14, 4, '{\"en\":\"Pepper\"}', 14, '2025-06-11 17:48:58', '2025-06-11 17:48:58'),
(15, 4, '{\"en\":\"Coleslaw\"}', 15, '2025-06-11 17:49:46', '2025-06-11 17:49:46'),
(16, 4, '{\"en\":\"Sauce\"}', 16, '2025-06-13 03:46:42', '2025-06-13 03:46:42'),
(17, 4, '{\"en\":\"Grill\"}', 17, '2025-06-13 10:32:47', '2025-06-13 10:32:47'),
(18, 4, '{\"en\":\"Fish\"}', 18, '2025-06-13 13:14:57', '2025-06-13 13:14:57'),
(19, 4, '{\"en\":\"Hard\"}', 19, '2025-06-13 14:19:36', '2025-06-13 14:19:36'),
(20, 4, '{\"en\":\"Soft Drinks\"}', 20, '2025-06-13 16:37:21', '2025-06-13 16:37:21'),
(21, 4, '{\"en\":\"Spirit-Foreign\"}', 21, '2025-06-13 17:27:38', '2025-06-13 17:27:38'),
(22, 4, '{\"en\":\"Spirit-Local\"}', 22, '2025-06-13 17:28:02', '2025-06-13 17:28:02'),
(23, 4, '{\"en\":\"Goat\"}', 23, '2025-06-18 02:19:12', '2025-06-18 02:19:12'),
(24, 4, '{\"en\":\"Beef\"}', 24, '2025-06-24 03:37:56', '2025-06-24 03:37:56'),
(25, 4, '{\"en\":\"Seafood\"}', 25, '2025-06-25 11:11:00', '2025-06-25 11:11:00');

-- --------------------------------------------------------

--
-- Table structure for table `item_modifiers`
--

CREATE TABLE `item_modifiers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `modifier_group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 0,
  `allow_multiple_selection` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kots`
--

CREATE TABLE `kots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `kot_number` varchar(191) NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `status` enum('pending_confirmation','in_kitchen','food_ready','served','cancelled') NOT NULL DEFAULT 'in_kitchen',
  `cancel_reason_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cancel_reason_text` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kots`
--

INSERT INTO `kots` (`id`, `branch_id`, `kot_number`, `order_id`, `transaction_id`, `note`, `status`, `cancel_reason_id`, `cancel_reason_text`, `created_at`, `updated_at`) VALUES
(2, 3, '2', 3, NULL, NULL, 'in_kitchen', NULL, NULL, '2025-04-20 00:59:31', '2025-04-20 00:59:31'),
(3, 3, '4', 5, NULL, NULL, 'food_ready', NULL, NULL, '2025-04-21 01:06:13', '2025-04-21 01:10:12'),
(4, 3, '6', 6, NULL, NULL, 'food_ready', NULL, NULL, '2025-04-21 01:09:25', '2025-04-21 01:10:14'),
(5, 3, '8', 6, NULL, NULL, 'in_kitchen', NULL, NULL, '2025-04-21 01:10:58', '2025-04-21 01:10:58'),
(6, 3, '10', 7, NULL, NULL, 'in_kitchen', NULL, NULL, '2025-04-29 12:01:23', '2025-04-29 12:01:23'),
(7, 3, '12', 11, NULL, NULL, 'in_kitchen', NULL, NULL, '2025-04-29 12:10:27', '2025-04-29 12:10:27'),
(8, 3, '14', 12, NULL, NULL, 'in_kitchen', NULL, NULL, '2025-04-29 12:16:10', '2025-04-29 12:16:10'),
(9, 3, '16', 13, NULL, NULL, 'in_kitchen', NULL, NULL, '2025-04-29 12:43:35', '2025-04-29 12:43:35'),
(10, 4, '2', 14, 'TXN_684cae3234bc95.27908847_933981', NULL, 'pending_confirmation', NULL, NULL, '2025-06-13 23:03:14', '2025-06-13 23:03:14'),
(11, 4, '4', 15, 'TXN_684caf413f5330.67744559_942314', NULL, 'pending_confirmation', NULL, NULL, '2025-06-13 23:07:45', '2025-06-13 23:07:45'),
(12, 4, '6', 16, 'TXN_684cb2208d3da1.34231370_823250', NULL, 'pending_confirmation', NULL, NULL, '2025-06-13 23:20:00', '2025-06-13 23:20:00'),
(13, 4, '8', 17, 'TXN_684cb2e41a4bf0.52555493_744307', NULL, 'pending_confirmation', NULL, NULL, '2025-06-13 23:23:16', '2025-06-13 23:23:16'),
(14, 4, '10', 18, 'TXN_684d163499ed72.26945943_100367', NULL, 'pending_confirmation', NULL, NULL, '2025-06-14 06:27:00', '2025-06-14 06:27:00'),
(18, 4, '12', 25, 'TXN_684f36ac9a50d7.48816438_951262', NULL, 'served', NULL, NULL, '2025-06-15 21:10:04', '2025-06-15 21:23:48'),
(19, 4, '14', 25, 'TXN_684f38057f4d90.93410689_444233', NULL, 'served', NULL, NULL, '2025-06-15 21:15:49', '2025-06-15 21:23:43'),
(20, 4, '16', 26, 'TXN_685124930ce854.43205179_979258', NULL, 'pending_confirmation', NULL, NULL, '2025-06-17 08:17:23', '2025-06-17 08:17:23'),
(21, 4, '18', 25, 'TXN_68512628d18549.66698888_219094', NULL, 'food_ready', NULL, NULL, '2025-06-17 08:24:08', '2025-06-17 08:26:20'),
(22, 4, '20', 27, 'TXN_685cfe0fd08e84.58818729_787996', NULL, 'in_kitchen', NULL, NULL, '2025-06-26 08:00:15', '2025-06-26 08:13:21'),
(23, 4, '22', 28, 'TXN_685d32d43a9547.14979069_620011', NULL, 'pending_confirmation', NULL, NULL, '2025-06-26 11:45:24', '2025-06-26 11:45:24'),
(26, 4, '24', 31, 'TXN_68600a44e3bf07.03901450_131490', NULL, 'in_kitchen', NULL, NULL, '2025-06-28 15:29:08', '2025-06-28 15:33:16'),
(27, 4, '26', 32, 'TXN_6871b64b33f203.76548937_854626', NULL, 'pending_confirmation', NULL, NULL, '2025-07-12 01:11:39', '2025-07-12 01:11:39'),
(28, 4, '28', 33, 'TXN_6872a0c16e3138.50749586_274994', NULL, 'pending_confirmation', NULL, NULL, '2025-07-12 17:52:01', '2025-07-12 17:52:01'),
(29, 4, '30', 34, NULL, NULL, 'in_kitchen', NULL, NULL, '2025-07-12 17:53:47', '2025-07-12 17:53:47'),
(30, 4, '32', 33, 'TXN_6872a7c2c0c7c1.31735729_830251', NULL, 'pending_confirmation', NULL, NULL, '2025-07-12 18:21:54', '2025-07-12 18:21:54'),
(31, 4, '34', 35, NULL, NULL, 'in_kitchen', NULL, NULL, '2025-07-12 18:40:32', '2025-07-12 18:40:32'),
(32, 4, '36', 36, NULL, NULL, 'in_kitchen', NULL, NULL, '2025-07-12 18:41:03', '2025-07-12 18:41:03'),
(33, 4, '38', 37, 'TXN_6872b39cd732a1.87666459_188382', NULL, 'pending_confirmation', NULL, NULL, '2025-07-12 19:12:28', '2025-07-12 19:12:28'),
(34, 4, '40', 38, 'TXN_6872b4b7ba5ed4.03744313_424090', NULL, 'pending_confirmation', NULL, NULL, '2025-07-12 19:17:11', '2025-07-12 19:17:11'),
(35, 4, '42', 39, NULL, NULL, 'in_kitchen', NULL, NULL, '2025-07-12 19:36:44', '2025-07-12 19:36:44'),
(36, 4, '44', 44, NULL, NULL, 'pending_confirmation', NULL, NULL, '2025-07-12 21:18:24', '2025-07-12 21:18:24'),
(37, 4, '46', 45, NULL, NULL, 'pending_confirmation', NULL, NULL, '2025-07-17 21:18:31', '2025-07-17 21:18:31'),
(38, 4, '48', 46, NULL, NULL, 'pending_confirmation', NULL, NULL, '2025-07-17 21:18:50', '2025-07-17 21:18:50'),
(39, 4, '50', 47, NULL, NULL, 'in_kitchen', NULL, NULL, '2025-07-20 02:13:11', '2025-07-20 02:13:11'),
(40, 4, '52', 48, NULL, NULL, 'in_kitchen', NULL, NULL, '2025-07-20 02:13:31', '2025-07-20 02:13:31'),
(41, 4, '54', 49, NULL, NULL, 'in_kitchen', NULL, NULL, '2025-07-20 02:13:46', '2025-07-20 02:13:46'),
(42, 4, '56', 50, 'TXN_687c5234ae76b6.05985102_165365', NULL, 'pending_confirmation', NULL, NULL, '2025-07-20 02:19:32', '2025-07-20 02:19:32'),
(43, 4, '58', 51, 'TXN_688119d2b6a184.15803976_455219', NULL, 'pending_confirmation', NULL, NULL, '2025-07-23 17:20:18', '2025-07-23 17:20:18'),
(44, 4, '60', 51, 'TXN_68811c9b351bf8.86564440_430908', NULL, 'pending_confirmation', NULL, NULL, '2025-07-23 17:32:11', '2025-07-23 17:32:11'),
(45, 4, '62', 52, NULL, NULL, 'in_kitchen', NULL, NULL, '2025-07-23 17:41:43', '2025-07-23 17:41:43'),
(46, 4, '64', 61, NULL, NULL, 'in_kitchen', NULL, NULL, '2025-07-23 18:52:39', '2025-07-23 18:52:39'),
(47, 4, '66', 63, NULL, NULL, 'in_kitchen', NULL, NULL, '2025-07-23 18:57:45', '2025-07-23 18:57:45'),
(48, 4, '68', 64, NULL, NULL, 'in_kitchen', NULL, NULL, '2025-07-23 19:06:22', '2025-07-23 19:06:22'),
(49, 4, '70', 65, NULL, NULL, 'in_kitchen', NULL, NULL, '2025-07-23 19:13:51', '2025-07-23 19:13:51'),
(50, 4, '72', 66, NULL, NULL, 'in_kitchen', NULL, NULL, '2025-07-23 19:19:52', '2025-07-23 19:19:52'),
(51, 4, '74', 67, NULL, NULL, 'in_kitchen', NULL, NULL, '2025-07-23 19:22:52', '2025-07-23 19:22:52'),
(52, 4, '76', 69, NULL, NULL, 'in_kitchen', NULL, NULL, '2025-07-25 17:29:15', '2025-07-25 17:29:15'),
(53, 4, '78', 70, NULL, NULL, 'in_kitchen', NULL, NULL, '2025-07-25 17:30:37', '2025-07-25 17:30:37'),
(54, 4, '80', 71, NULL, NULL, 'in_kitchen', NULL, NULL, '2025-07-25 17:39:54', '2025-07-25 17:39:54'),
(55, 4, '82', 71, NULL, NULL, 'in_kitchen', NULL, NULL, '2025-07-25 17:50:56', '2025-07-25 17:50:56'),
(56, 4, '84', 72, NULL, NULL, 'in_kitchen', NULL, NULL, '2025-07-25 17:53:06', '2025-07-25 17:53:06');

-- --------------------------------------------------------

--
-- Table structure for table `kot_cancel_reasons`
--

CREATE TABLE `kot_cancel_reasons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reason` varchar(191) NOT NULL,
  `cancel_order` tinyint(1) NOT NULL DEFAULT 0,
  `cancel_kot` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kot_cancel_reasons`
--

INSERT INTO `kot_cancel_reasons` (`id`, `restaurant_id`, `reason`, `cancel_order`, `cancel_kot`, `created_at`, `updated_at`) VALUES
(1, 1, 'Customer changed their mind', 1, 0, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(2, 1, 'Customer requested to cancel', 1, 0, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(3, 1, 'Payment issues', 1, 0, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(4, 1, 'Order placed by mistake', 1, 0, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(5, 1, 'Customer no longer wants the order', 1, 0, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(6, 1, 'Ingredient not available', 0, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(7, 1, 'Item out of stock', 0, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(8, 1, 'Kitchen overloaded', 0, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(9, 1, 'Preparation time too long', 0, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(10, 1, 'Quality issue with ingredients', 0, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(11, 1, 'Equipment malfunction', 0, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(12, 1, 'Chef unavailable', 0, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(13, 1, 'System error/Technical issue', 1, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(14, 1, 'Wrong item ordered', 1, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(15, 1, 'Staff unavailable', 1, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(16, 1, 'Health and safety concerns', 1, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(17, 1, 'Other', 1, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(18, 2, 'Customer changed their mind', 1, 0, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(19, 2, 'Customer requested to cancel', 1, 0, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(20, 2, 'Payment issues', 1, 0, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(21, 2, 'Order placed by mistake', 1, 0, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(22, 2, 'Customer no longer wants the order', 1, 0, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(23, 2, 'Ingredient not available', 0, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(24, 2, 'Item out of stock', 0, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(25, 2, 'Kitchen overloaded', 0, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(26, 2, 'Preparation time too long', 0, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(27, 2, 'Quality issue with ingredients', 0, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(28, 2, 'Equipment malfunction', 0, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(29, 2, 'Chef unavailable', 0, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(30, 2, 'System error/Technical issue', 1, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(31, 2, 'Wrong item ordered', 1, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(32, 2, 'Staff unavailable', 1, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(33, 2, 'Health and safety concerns', 1, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(34, 2, 'Other', 1, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(35, 3, 'Customer changed their mind', 1, 0, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(36, 3, 'Customer requested to cancel', 1, 0, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(37, 3, 'Payment issues', 1, 0, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(38, 3, 'Order placed by mistake', 1, 0, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(39, 3, 'Customer no longer wants the order', 1, 0, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(40, 3, 'Ingredient not available', 0, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(41, 3, 'Item out of stock', 0, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(42, 3, 'Kitchen overloaded', 0, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(43, 3, 'Preparation time too long', 0, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(44, 3, 'Quality issue with ingredients', 0, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(45, 3, 'Equipment malfunction', 0, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(46, 3, 'Chef unavailable', 0, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(47, 3, 'System error/Technical issue', 1, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(48, 3, 'Wrong item ordered', 1, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(49, 3, 'Staff unavailable', 1, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(50, 3, 'Health and safety concerns', 1, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00'),
(51, 3, 'Other', 1, 1, '2025-07-12 20:17:00', '2025-07-12 20:17:00');

-- --------------------------------------------------------

--
-- Table structure for table `kot_items`
--

CREATE TABLE `kot_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kot_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `menu_item_id` bigint(20) UNSIGNED NOT NULL,
  `menu_item_variation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `note` text DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `status` enum('pending','cooking','ready') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kot_items`
--

INSERT INTO `kot_items` (`id`, `kot_id`, `transaction_id`, `menu_item_id`, `menu_item_variation_id`, `note`, `quantity`, `status`, `created_at`, `updated_at`) VALUES
(2, 2, NULL, 1, NULL, NULL, 1, NULL, '2025-04-20 00:59:31', '2025-04-20 00:59:31'),
(3, 2, NULL, 2, NULL, NULL, 1, NULL, '2025-04-20 00:59:31', '2025-04-20 00:59:31'),
(4, 3, NULL, 2, NULL, NULL, 1, NULL, '2025-04-21 01:06:13', '2025-04-21 01:06:13'),
(5, 4, NULL, 1, NULL, NULL, 1, NULL, '2025-04-21 01:09:25', '2025-04-21 01:09:25'),
(6, 4, NULL, 2, NULL, NULL, 1, NULL, '2025-04-21 01:09:25', '2025-04-21 01:09:25'),
(7, 5, NULL, 1, NULL, NULL, 1, NULL, '2025-04-21 01:10:58', '2025-04-21 01:10:58'),
(8, 6, NULL, 2, NULL, NULL, 1, NULL, '2025-04-29 12:01:23', '2025-04-29 12:01:23'),
(9, 7, NULL, 1, NULL, NULL, 1, NULL, '2025-04-29 12:10:27', '2025-04-29 12:10:27'),
(10, 7, NULL, 2, NULL, NULL, 1, NULL, '2025-04-29 12:10:27', '2025-04-29 12:10:27'),
(11, 8, NULL, 1, NULL, NULL, 1, NULL, '2025-04-29 12:16:10', '2025-04-29 12:16:10'),
(12, 9, NULL, 1, NULL, NULL, 1, NULL, '2025-04-29 12:43:35', '2025-04-29 12:43:35'),
(13, 9, NULL, 2, NULL, NULL, 1, NULL, '2025-04-29 12:43:35', '2025-04-29 12:43:35'),
(14, 10, 'TXN_684cae3234bc95.27908847_933981', 34, NULL, NULL, 1, NULL, '2025-06-13 23:03:14', '2025-06-13 23:03:14'),
(16, 11, 'TXN_684caf413f5330.67744559_942314', 34, NULL, NULL, 6, NULL, '2025-06-13 23:07:45', '2025-06-13 23:07:45'),
(17, 12, 'TXN_684cb2208d3da1.34231370_823250', 34, NULL, NULL, 2, NULL, '2025-06-13 23:20:00', '2025-06-13 23:20:00'),
(18, 12, 'TXN_684cb2208d3da1.34231370_823250', 35, NULL, NULL, 1, NULL, '2025-06-13 23:20:00', '2025-06-13 23:20:00'),
(19, 12, 'TXN_684cb2208d3da1.34231370_823250', 22, NULL, NULL, 1, NULL, '2025-06-13 23:20:00', '2025-06-13 23:20:00'),
(20, 12, 'TXN_684cb2208d3da1.34231370_823250', 23, NULL, NULL, 1, NULL, '2025-06-13 23:20:00', '2025-06-13 23:20:00'),
(21, 13, 'TXN_684cb2e41a4bf0.52555493_744307', 40, NULL, NULL, 2, NULL, '2025-06-13 23:23:16', '2025-06-13 23:23:16'),
(30, 18, 'TXN_684f36ac9a50d7.48816438_951262', 56, 44, NULL, 1, NULL, '2025-06-15 21:10:04', '2025-06-15 21:10:04'),
(31, 18, 'TXN_684f36ac9a50d7.48816438_951262', 55, 42, NULL, 1, NULL, '2025-06-15 21:10:04', '2025-06-15 21:10:04'),
(32, 19, 'TXN_684f38057f4d90.93410689_444233', 39, NULL, NULL, 2, NULL, '2025-06-15 21:15:49', '2025-06-15 21:15:49'),
(33, 19, 'TXN_684f38057f4d90.93410689_444233', 35, NULL, NULL, 2, NULL, '2025-06-15 21:15:49', '2025-06-15 21:15:49'),
(34, 20, 'TXN_685124930ce854.43205179_979258', 40, NULL, NULL, 1, NULL, '2025-06-17 08:17:23', '2025-06-17 08:17:23'),
(35, 20, 'TXN_685124930ce854.43205179_979258', 41, NULL, NULL, 1, NULL, '2025-06-17 08:17:23', '2025-06-17 08:17:23'),
(36, 20, 'TXN_685124930ce854.43205179_979258', 42, NULL, NULL, 1, NULL, '2025-06-17 08:17:23', '2025-06-17 08:17:23'),
(37, 21, 'TXN_68512628d18549.66698888_219094', 39, NULL, NULL, 1, 'ready', '2025-06-17 08:24:08', '2025-06-17 08:26:20'),
(38, 21, 'TXN_68512628d18549.66698888_219094', 20, 104, NULL, 1, 'ready', '2025-06-17 08:24:08', '2025-06-17 08:26:20'),
(39, 22, 'TXN_685cfe0fd08e84.58818729_787996', 35, NULL, NULL, 1, NULL, '2025-06-26 08:00:15', '2025-06-26 08:00:15'),
(40, 22, 'TXN_685cfe0fd08e84.58818729_787996', 65, 68, NULL, 1, NULL, '2025-06-26 08:00:15', '2025-06-26 08:00:15'),
(41, 23, 'TXN_685d32d43a9547.14979069_620011', 6, NULL, NULL, 1, NULL, '2025-06-26 11:45:24', '2025-06-26 11:45:24'),
(42, 23, 'TXN_685d32d43a9547.14979069_620011', 7, NULL, NULL, 1, NULL, '2025-06-26 11:45:24', '2025-06-26 11:45:24'),
(46, 26, 'TXN_68600a44e3bf07.03901450_131490', 71, 81, NULL, 1, NULL, '2025-06-28 15:29:08', '2025-06-28 15:29:08'),
(47, 27, 'TXN_6871b64b33f203.76548937_854626', 19, 244, NULL, 1, NULL, '2025-07-12 01:11:39', '2025-07-12 01:11:39'),
(48, 27, 'TXN_6871b64b33f203.76548937_854626', 64, 307, NULL, 1, NULL, '2025-07-12 01:11:39', '2025-07-12 01:11:39'),
(49, 27, 'TXN_6871b64b33f203.76548937_854626', 122, 147, NULL, 1, NULL, '2025-07-12 01:11:39', '2025-07-12 01:11:39'),
(50, 28, 'TXN_6872a0c16e3138.50749586_274994', 149, NULL, NULL, 1, NULL, '2025-07-12 17:52:01', '2025-07-12 17:52:01'),
(51, 29, NULL, 7, NULL, NULL, 4, NULL, '2025-07-12 17:53:47', '2025-07-12 17:53:47'),
(52, 30, 'TXN_6872a7c2c0c7c1.31735729_830251', 149, NULL, NULL, 1, NULL, '2025-07-12 18:21:54', '2025-07-12 18:21:54'),
(53, 31, NULL, 50, 320, NULL, 1, NULL, '2025-07-12 18:40:32', '2025-07-12 18:40:32'),
(54, 32, NULL, 5, NULL, NULL, 1, NULL, '2025-07-12 18:41:03', '2025-07-12 18:41:03'),
(55, 33, 'TXN_6872b39cd732a1.87666459_188382', 145, 231, NULL, 1, NULL, '2025-07-12 19:12:28', '2025-07-12 19:12:28'),
(56, 33, 'TXN_6872b39cd732a1.87666459_188382', 58, 51, NULL, 1, NULL, '2025-07-12 19:12:28', '2025-07-12 19:12:28'),
(57, 34, 'TXN_6872b4b7ba5ed4.03744313_424090', 140, 208, NULL, 1, NULL, '2025-07-12 19:17:11', '2025-07-12 19:17:11'),
(58, 35, NULL, 7, NULL, NULL, 1, NULL, '2025-07-12 19:36:44', '2025-07-12 19:36:44'),
(59, 36, NULL, 4, NULL, NULL, 1, 'cooking', '2025-07-12 21:18:24', '2025-07-12 21:53:20'),
(60, 36, NULL, 8, NULL, NULL, 1, 'cooking', '2025-07-12 21:18:24', '2025-07-12 21:53:22'),
(61, 37, NULL, 14, 91, NULL, 1, NULL, '2025-07-17 21:18:31', '2025-07-17 21:18:31'),
(62, 37, NULL, 12, 165, NULL, 1, NULL, '2025-07-17 21:18:31', '2025-07-17 21:18:31'),
(63, 38, NULL, 14, 92, NULL, 1, NULL, '2025-07-17 21:18:50', '2025-07-17 21:18:50'),
(64, 38, NULL, 13, 246, NULL, 1, NULL, '2025-07-17 21:18:50', '2025-07-17 21:18:50'),
(65, 39, NULL, 5, NULL, NULL, 1, NULL, '2025-07-20 02:13:11', '2025-07-20 02:13:11'),
(66, 39, NULL, 6, NULL, NULL, 1, NULL, '2025-07-20 02:13:11', '2025-07-20 02:13:11'),
(67, 39, NULL, 7, NULL, NULL, 1, NULL, '2025-07-20 02:13:11', '2025-07-20 02:13:11'),
(68, 40, NULL, 5, NULL, NULL, 1, NULL, '2025-07-20 02:13:31', '2025-07-20 02:13:31'),
(69, 40, NULL, 6, NULL, NULL, 1, NULL, '2025-07-20 02:13:31', '2025-07-20 02:13:31'),
(70, 40, NULL, 7, NULL, NULL, 1, NULL, '2025-07-20 02:13:31', '2025-07-20 02:13:31'),
(71, 41, NULL, 5, NULL, NULL, 1, NULL, '2025-07-20 02:13:46', '2025-07-20 02:13:46'),
(72, 41, NULL, 6, NULL, NULL, 1, NULL, '2025-07-20 02:13:46', '2025-07-20 02:13:46'),
(73, 41, NULL, 7, NULL, NULL, 1, NULL, '2025-07-20 02:13:46', '2025-07-20 02:13:46'),
(74, 42, 'TXN_687c5234ae76b6.05985102_165365', 3, 82, '', 1, NULL, '2025-07-20 02:19:32', '2025-07-20 02:19:32'),
(75, 42, 'TXN_687c5234ae76b6.05985102_165365', 4, NULL, '', 1, NULL, '2025-07-20 02:19:32', '2025-07-20 02:19:32'),
(76, 43, 'TXN_688119d2b6a184.15803976_455219', 3, 82, '', 1, NULL, '2025-07-23 17:20:18', '2025-07-23 17:20:18'),
(77, 44, 'TXN_68811c9b351bf8.86564440_430908', 4, NULL, '', 4, NULL, '2025-07-23 17:32:11', '2025-07-23 17:32:11'),
(78, 45, NULL, 10, NULL, NULL, 2, NULL, '2025-07-23 17:41:43', '2025-07-23 17:41:43'),
(79, 46, NULL, 6, NULL, NULL, 1, NULL, '2025-07-23 18:52:39', '2025-07-23 18:52:39'),
(80, 47, NULL, 10, NULL, NULL, 3, NULL, '2025-07-23 18:57:45', '2025-07-23 18:57:45'),
(81, 48, NULL, 17, 109, NULL, 1, 'cooking', '2025-07-23 19:06:22', '2025-07-23 19:07:24'),
(82, 49, NULL, 60, NULL, NULL, 3, NULL, '2025-07-23 19:13:51', '2025-07-23 19:13:51'),
(83, 50, NULL, 6, NULL, NULL, 1, NULL, '2025-07-23 19:19:52', '2025-07-23 19:19:52'),
(84, 51, NULL, 4, NULL, NULL, 3, NULL, '2025-07-23 19:22:52', '2025-07-23 19:22:52'),
(85, 52, NULL, 5, NULL, NULL, 1, NULL, '2025-07-25 17:29:15', '2025-07-25 17:29:15'),
(86, 53, NULL, 4, NULL, NULL, 1, NULL, '2025-07-25 17:30:37', '2025-07-25 17:30:37'),
(87, 54, NULL, 4, NULL, NULL, 1, NULL, '2025-07-25 17:39:54', '2025-07-25 17:39:54'),
(88, 54, NULL, 11, 170, NULL, 1, NULL, '2025-07-25 17:39:54', '2025-07-25 17:39:54'),
(89, 55, NULL, 5, NULL, NULL, 1, NULL, '2025-07-25 17:50:56', '2025-07-25 17:50:56'),
(90, 55, NULL, 6, NULL, NULL, 1, NULL, '2025-07-25 17:50:56', '2025-07-25 17:50:56'),
(91, 56, NULL, 4, NULL, NULL, 1, NULL, '2025-07-25 17:53:06', '2025-07-25 17:53:06');

-- --------------------------------------------------------

--
-- Table structure for table `kot_item_modifier_options`
--

CREATE TABLE `kot_item_modifier_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kot_item_id` bigint(20) UNSIGNED NOT NULL,
  `modifier_option_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kot_places`
--

CREATE TABLE `kot_places` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `printer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kot_places`
--

INSERT INTO `kot_places` (`id`, `printer_id`, `branch_id`, `name`, `type`, `is_active`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Default Kitchen', 'food', 1, 1, '2025-07-12 20:16:59', '2025-07-12 20:16:59'),
(2, 2, 2, 'Default Kitchen', 'food', 1, 1, '2025-07-12 20:16:59', '2025-07-12 20:16:59'),
(3, 3, 3, 'Default Kitchen', 'food', 1, 1, '2025-07-12 20:16:59', '2025-07-12 20:16:59'),
(4, 4, 4, 'Default Kitchen', 'food', 1, 1, '2025-07-12 20:16:59', '2025-07-12 20:16:59');

-- --------------------------------------------------------

--
-- Table structure for table `kot_settings`
--

CREATE TABLE `kot_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `default_status` enum('pending','cooking') NOT NULL DEFAULT 'pending',
  `enable_item_level_status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kot_settings`
--

INSERT INTO `kot_settings` (`id`, `branch_id`, `default_status`, `enable_item_level_status`, `created_at`, `updated_at`) VALUES
(1, 1, 'pending', 1, '2025-07-12 20:16:59', '2025-07-12 20:16:59'),
(2, 2, 'pending', 1, '2025-07-12 20:16:59', '2025-07-12 20:16:59'),
(3, 3, 'pending', 1, '2025-07-12 20:16:59', '2025-07-12 20:16:59'),
(4, 4, 'cooking', 1, '2025-07-12 20:16:59', '2025-07-17 21:59:22');

-- --------------------------------------------------------

--
-- Table structure for table `language_settings`
--

CREATE TABLE `language_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `language_code` varchar(191) NOT NULL,
  `language_name` varchar(191) NOT NULL,
  `flag_code` varchar(191) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `is_rtl` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `language_settings`
--

INSERT INTO `language_settings` (`id`, `language_code`, `language_name`, `flag_code`, `active`, `is_rtl`, `created_at`, `updated_at`) VALUES
(1, 'en', 'English', 'gb', 1, 0, NULL, NULL),
(2, 'ar', 'Arabic', 'sa', 0, 0, NULL, NULL),
(3, 'de', 'German', 'de', 0, 0, NULL, NULL),
(4, 'es', 'Spanish', 'es', 0, 0, NULL, NULL),
(5, 'et', 'Estonian', 'et', 0, 0, NULL, NULL),
(6, 'fa', 'Farsi', 'ir', 0, 0, NULL, NULL),
(7, 'fr', 'French', 'fr', 0, 0, NULL, NULL),
(8, 'gr', 'Greek', 'gr', 0, 0, NULL, NULL),
(9, 'it', 'Italian', 'it', 0, 0, NULL, NULL),
(10, 'nl', 'Dutch', 'nl', 0, 0, NULL, NULL),
(11, 'pl', 'Polish', 'pl', 0, 0, NULL, NULL),
(12, 'pt', 'Portuguese', 'pt', 0, 0, NULL, NULL),
(13, 'pt-br', 'Portuguese (Brazil)', 'br', 0, 0, NULL, NULL),
(14, 'ro', 'Romanian', 'ro', 0, 0, NULL, NULL),
(15, 'ru', 'Russian', 'ru', 0, 0, NULL, NULL),
(16, 'tr', 'Turkish', 'tr', 0, 0, NULL, NULL),
(17, 'zh-CN', 'Chinese (S)', 'cn', 0, 0, NULL, NULL),
(18, 'zh-TW', 'Chinese (T)', 'cn', 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ltm_translations`
--

CREATE TABLE `ltm_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `locale` varchar(191) NOT NULL,
  `group` varchar(191) NOT NULL,
  `key` text NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `menu_name` text DEFAULT NULL,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `branch_id`, `menu_name`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 3, '{\"en\":\"Dinner\"}', 1, '2025-04-19 02:50:17', '2025-04-19 02:50:17'),
(2, 3, '{\"en\":\"Lunch\"}', 2, '2025-04-19 03:15:41', '2025-04-19 03:15:41'),
(3, 4, '{\"en\":\"BP Special\"}', 3, '2025-06-06 04:42:45', '2025-06-14 06:24:20'),
(6, 4, '{\"en\":\"Continental Dishes \"}', 6, '2025-06-11 15:23:59', '2025-06-11 15:23:59'),
(7, 4, '{\"en\":\"Assorted Dishes\"}', 7, '2025-06-11 15:24:20', '2025-06-11 15:24:20'),
(8, 4, '{\"en\":\"Sauces\"}', 8, '2025-06-11 15:24:34', '2025-06-11 15:24:34'),
(9, 4, '{\"en\":\"Local Dishes\"}', 9, '2025-06-11 15:25:27', '2025-06-11 15:25:27'),
(10, 4, '{\"en\":\"Portions\"}', 10, '2025-06-11 15:26:04', '2025-06-11 15:26:04'),
(11, 4, '{\"en\":\"Proteins\"}', 11, '2025-06-11 15:26:41', '2025-06-11 15:26:41'),
(12, 4, '{\"en\":\"Drinks\"}', 12, '2025-06-13 14:31:33', '2025-06-13 14:31:33');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `kot_place_id` bigint(20) UNSIGNED DEFAULT NULL,
  `item_name` varchar(191) NOT NULL,
  `image` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `type` enum('veg','non-veg','egg','drink','other') NOT NULL DEFAULT 'veg',
  `price` decimal(16,2) DEFAULT NULL,
  `menu_id` bigint(20) UNSIGNED NOT NULL,
  `item_category_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `preparation_time` int(11) DEFAULT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `show_on_customer_site` tinyint(1) NOT NULL DEFAULT 1,
  `in_stock` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `branch_id`, `kot_place_id`, `item_name`, `image`, `description`, `type`, `price`, `menu_id`, `item_category_id`, `created_at`, `updated_at`, `preparation_time`, `is_available`, `show_on_customer_site`, `in_stock`, `sort_order`) VALUES
(1, 3, 3, 'Banku with Catfish', 'fa497bf5667802b013057c27ef6a3e60.png', 'Banku with Catfish', 'other', 85.00, 1, 1, '2025-04-19 02:53:34', '2025-04-19 02:53:35', 10, 1, 1, 1, 1),
(2, 3, 3, 'Kenkey', 'd340bf9ca1342c7f00cd033c89bab455.png', 'Kenkey', 'other', 89.00, 2, 1, '2025-04-19 03:18:27', '2025-04-19 03:18:27', 6, 1, 1, 1, 2),
(3, 4, 4, 'Samosa', '546e09ccece2b0c826bee2b638882336.jpg', 'Samosa(3 pieces)', 'other', 10.00, 3, 2, '2025-06-06 04:47:42', '2025-06-13 18:20:35', NULL, 1, 1, 1, 3),
(4, 4, 4, 'Pie', '6f44a3c1b341a9e224e731fe9ee06a8f.jpg', 'Meat Pie', 'non-veg', 15.00, 3, 2, '2025-06-06 04:50:58', '2025-06-13 18:20:58', NULL, 1, 1, 1, 4),
(5, 4, 4, 'Club Sandwich', '24e72994a939eeed585e4297229c3157.webp', '', 'veg', 70.00, 3, 2, '2025-06-10 15:42:18', '2025-06-13 18:21:59', NULL, 1, 1, 1, 5),
(6, 4, 4, 'Tuna Sandwich ', '1040228b82803e774637b878147c7161.webp', '', 'other', 70.00, 3, 2, '2025-06-10 15:43:00', '2025-06-13 18:24:15', NULL, 1, 1, 1, 6),
(7, 4, 4, 'Mini Salad', 'd4d7902e326b59891b0f1f384df4e5fe.webp', '', 'veg', 45.00, 3, 3, '2025-06-11 15:56:51', '2025-06-13 18:25:18', NULL, 1, 1, 1, 7),
(8, 4, 4, 'Mixed Salad ', '45988b853bd0bce145b26683df53a194.webp', '', 'veg', 60.00, 3, 3, '2025-06-11 15:57:30', '2025-06-13 18:27:12', NULL, 1, 1, 1, 8),
(9, 4, 4, 'Tuna Salad', 'c5fa37900c0ec632e0142f4e475bf270.webp', '', 'veg', 70.00, 3, 3, '2025-06-11 15:58:16', '2025-06-13 18:28:08', NULL, 1, 1, 1, 9),
(10, 4, NULL, 'Chicken Salad', '59b9ff0fb17a8b923e4770029adbd3ce.webp', '', 'other', 63.75, 3, 3, '2025-06-11 15:59:06', '2025-07-23 18:02:39', NULL, 1, 1, 1, 10),
(11, 4, 4, 'Jollof Rice with Turkey wings', 'f1ec1059e525533a9373e067ba2368db.webp', '', 'other', 0.00, 6, 4, '2025-06-11 16:17:43', '2025-06-24 02:19:32', NULL, 1, 1, 1, 11),
(12, 4, 4, 'Jollof Rice with Chicken', '0ab9981f1456bb0429d3588e14e8e885.jpg', '', 'other', 0.00, 6, 4, '2025-06-11 16:19:01', '2025-06-24 02:07:14', NULL, 1, 1, 1, 12),
(13, 4, 4, 'Vegetable Rice with Turkey wings ', '2079b4502d31d19d4bdac411dcbb4c84.webp', '', 'other', 0.00, 6, 7, '2025-06-11 16:20:05', '2025-06-25 11:16:47', NULL, 1, 1, 1, 13),
(14, 4, 4, 'Vegetable Rice with Chicken', '22d9e3a8d3f4d6007328e2da6656c02a.webp', '', 'veg', 0.00, 6, 4, '2025-06-11 16:21:05', '2025-06-13 19:03:27', NULL, 1, 1, 1, 14),
(15, 4, 4, 'Plain Rice with Egg stew', '6efee91c875df0311f93549e102f5ea6.webp', '', 'egg', 0.00, 6, 4, '2025-06-11 16:28:42', '2025-06-13 19:06:48', NULL, 1, 1, 1, 15),
(16, 4, 4, 'Plain Rice with Egg  & Sausage Stew', '06bd1e3804f2ad9efa8cf5da0a18f6f9.webp', '', 'egg', 0.00, 6, 4, '2025-06-11 16:31:19', '2025-06-13 19:11:56', NULL, 1, 1, 1, 16),
(17, 4, 4, 'Plain Rice with Egg & Sausage Stew', '9a776c39f9f6486de2d9eeba682dc42f.webp', '', 'egg', 0.00, 6, 4, '2025-06-11 16:32:51', '2025-06-13 19:38:36', NULL, 1, 1, 1, 17),
(19, 4, 4, 'Yam Chips/ Potato Chips with Chicken', '53553a5639b372306858530bce08daf0.webp', '', 'other', 0.00, 6, 5, '2025-06-11 16:40:37', '2025-06-25 11:15:54', NULL, 1, 1, 1, 19),
(20, 4, 4, 'Chicken', '081ef40abc807c69e2e1fbcc5f039d18.jpeg', '', 'other', 0.00, 11, 6, '2025-06-11 16:43:21', '2025-06-13 19:34:05', NULL, 1, 1, 1, 20),
(21, 4, 4, 'Turkey Wings', '9c214a9eb4f5f8c7f7f39753ff5ac26a.jpeg', '', 'other', 0.00, 11, 7, '2025-06-11 16:45:11', '2025-06-13 19:32:35', NULL, 1, 1, 1, 21),
(22, 4, 4, 'Fried Rice', '63928181cac16379da85534412b3c271.webp', '', 'other', 40.00, 10, 4, '2025-06-11 17:30:44', '2025-06-13 19:21:12', NULL, 1, 1, 1, 22),
(23, 4, 4, 'Plain Rice', '55caae0f6980a4edbbd45d2a601317c0.webp', '', 'other', 40.00, 10, 4, '2025-06-11 17:31:29', '2025-06-13 19:18:32', NULL, 1, 1, 1, 23),
(24, 4, 4, 'Jollof Rice', '94741a84cf65ca9731bfb7e4a3718212.jpeg', '', 'veg', 40.00, 10, 4, '2025-06-11 17:33:01', '2025-06-13 19:17:24', NULL, 1, 1, 1, 24),
(25, 4, 4, 'Portion Goat Stew', '4434b311871b3899069b86fdd5484f7d.webp', '', 'other', 65.00, 10, 8, '2025-06-11 17:37:40', '2025-06-13 19:15:24', NULL, 1, 1, 1, 25),
(26, 4, 4, 'Portion Fish Stew', '29775b0b3026a3f6dc3f707992640c02.jpeg', '', 'other', 65.00, 10, 8, '2025-06-11 17:38:15', '2025-06-13 19:13:13', NULL, 1, 1, 1, 26),
(27, 4, 4, 'Turkey Wings Stew', '9ad1db909e0e8b766e4a933f2686441a.webp', '', 'other', 65.00, 10, 8, '2025-06-11 17:38:42', '2025-06-13 21:24:09', NULL, 1, 1, 1, 27),
(28, 4, 4, 'Portion Chicken Stew', '1a473ed6f58e84ffcea29a72b26ee44e.webp', '', 'veg', 60.00, 10, 8, '2025-06-11 17:39:27', '2025-06-13 21:23:49', NULL, 1, 1, 1, 28),
(29, 4, 4, 'Portion Tilapia', '1f1503050669aff504655c04327a3306.webp', '', 'other', 0.00, 10, 9, '2025-06-11 17:41:15', '2025-06-13 21:21:12', NULL, 1, 1, 1, 29),
(30, 4, 4, 'Portion Yam Chips', '54c63c1205acfab583c02dcd00015e2e.webp', '', 'other', 45.00, 10, 5, '2025-06-11 17:41:59', '2025-06-13 21:19:33', NULL, 1, 1, 1, 30),
(31, 4, 4, 'Portion Potato Chips', 'caac6ab35ed48c4ec304bbc837bc0c68.jpeg', '', 'veg', 45.00, 10, 5, '2025-06-11 17:43:00', '2025-06-13 21:14:11', NULL, 1, 1, 1, 31),
(32, 4, 4, 'Portion Fufu', 'dddc726f0bae7a6015d2f12490d9fe51.webp', '', 'veg', 0.00, 10, 10, '2025-06-11 17:45:37', '2025-06-13 21:11:23', NULL, 1, 1, 1, 32),
(33, 4, 4, 'Portion Banku', 'bdf4b02c5e8a81c9bf99acf47ad66813.webp', '', 'veg', 10.00, 10, 10, '2025-06-11 17:46:13', '2025-06-13 21:06:35', NULL, 1, 1, 1, 33),
(34, 4, 4, 'Portion Boiled Yam', 'b64a641c8178bd342e69f718f8ee2bc9.jpeg', '', 'veg', 45.00, 10, 12, '2025-06-11 17:47:18', '2025-06-13 20:51:44', NULL, 1, 1, 1, 34),
(35, 4, 4, 'Portion Boiled Apem', 'dc1895b45bd890c145b4dc2e8894e4f4.jpg', '', 'veg', 45.00, 10, 12, '2025-06-11 17:47:42', '2025-06-13 21:07:23', NULL, 1, 1, 1, 35),
(36, 4, 4, 'Extra Shitor', '14dbfed9db684c5f72a345a5ba26a7d4.jpeg', '', 'veg', 5.00, 10, 13, '2025-06-11 17:48:28', '2025-06-13 19:41:12', NULL, 1, 1, 1, 36),
(37, 4, 4, 'Extra Pepper', 'ad5714d979e4a39e1d919e5b394064f2.webp', '', 'veg', 5.00, 10, 14, '2025-06-11 17:49:14', '2025-06-13 21:30:27', NULL, 1, 1, 1, 37),
(38, 4, 4, 'Extra Coleslaw', '2aabbd4a9822c4b68780813b17cefb96.jpeg', '', 'veg', 5.00, 10, 3, '2025-06-11 17:49:58', '2025-06-13 21:37:57', NULL, 1, 1, 1, 38),
(39, 4, 4, 'Portion Fried Plantain', 'fe80ae2680f1792aafeb45a35e19a4d3.jpeg', '', 'veg', 45.00, 10, 12, '2025-06-11 17:50:34', '2025-06-13 21:37:33', NULL, 1, 1, 1, 39),
(40, 4, 4, 'Chicken Sauce', 'fcf9aaec4aee2bff505d8039fa584f70.jpg', 'This sauce comes with either Yam Chips/Potato Chips/ Fried Rice/Jollof Rice/Plain Rice/ Fried Plantain\n', 'other', 0.00, 8, 16, '2025-06-13 03:46:58', '2025-06-25 11:26:28', NULL, 1, 1, 1, 40),
(41, 4, 4, 'Beef Sauce', 'ff8e502c4648e1cd3bb013f9bb293a44.jpg', 'This sauce comes with either Yam Chips/Potato Chips/ Fried Rice/Jollof Rice/Plain Rice/ Fried Plantain\n', 'other', 0.00, 8, 16, '2025-06-13 03:47:28', '2025-06-25 11:25:49', NULL, 1, 1, 1, 41),
(42, 4, 4, 'Seafood Sauce', 'c4943ec41f259d5be4181093d33d5cb1.jpeg', 'This sauce comes with either Yam Chips/Potato Chips/ Fried Rice/Jollof Rice/Plain Rice/ Fried Plantain\n', 'other', 0.00, 8, 16, '2025-06-13 03:47:56', '2025-06-25 11:25:00', NULL, 1, 1, 1, 42),
(43, 4, 4, 'Fish Sauce', '9a932e78c76e1a5c273313642535cc95.webp', 'This sauce comes with either Yam Chips/Potato Chips/ Fried Rice/Jollof Rice/Plain Rice/ Fried Plantain\n', 'other', 0.00, 8, 16, '2025-06-13 03:49:12', '2025-06-25 11:24:08', NULL, 1, 1, 1, 43),
(44, 4, 4, 'Fish Provenca', 'a295b56dabde1c8fa8be55da29a9074b.webp', 'This sauce comes with either Yam Chips/Potato Chips/ Fried Rice/Jollof Rice/Plain Rice/ Fried Plantain\n', 'other', 0.00, 8, 16, '2025-06-13 03:51:20', '2025-06-25 11:23:20', NULL, 1, 1, 1, 44),
(45, 4, 4, 'Octopus Sauce', 'e545f306682fb5b307f10f8bedb65d6f.webp', 'This sauce comes with either Yam Chips/Potato Chips/ Fried Rice/Jollof Rice/Plain Rice/ Fried Plantain\n', 'other', 0.00, 8, 16, '2025-06-13 03:53:11', '2025-06-25 11:36:16', NULL, 1, 1, 1, 45),
(46, 4, 4, 'Goat Stew', '9452d2f2de79dcb178c1a19bf8afbf1a.webp', 'This sauce comes with either Yam Chips/Potato Chips/ Fried Rice/Jollof Rice/Plain Rice/ Fried Plantain\n', 'other', 0.00, 8, 8, '2025-06-13 09:39:42', '2025-06-25 11:35:17', NULL, 1, 1, 1, 46),
(47, 4, 4, 'Beef Stew', '158e4a52eaed6b199da36ce24468b9d0.webp', 'This sauce comes with either Yam Chips/Potato Chips/ Fried Rice/Jollof Rice/Plain Rice/ Fried Plantain\n', 'other', 0.00, 8, 8, '2025-06-13 10:16:39', '2025-06-25 11:32:07', NULL, 1, 1, 1, 47),
(48, 4, 4, 'Vegetable Sauce', '54087b4c238eb7843ef86620cdcbde95.webp', 'This sauce comes with either Yam Chips/Potato Chips/ Fried Rice/Jollof Rice/Plain Rice/ Fried Plantain\n\n', 'veg', 0.00, 8, 16, '2025-06-13 10:17:16', '2025-06-25 11:28:45', NULL, 1, 1, 1, 48),
(49, 4, 4, 'Mixed Grilled with Fried rice/ Jollof Rice/ Yam Chips/ Potato Chips/ Gari Fortor', 'b32fcfd8777ea2f97353c1aa79bf872d.jpg', '', 'other', 0.00, 6, 17, '2025-06-13 10:33:44', '2025-06-25 11:45:52', NULL, 1, 1, 1, 49),
(50, 4, 4, 'Seafood Assorted (Fried rice, Jollof rice, Noodles)', 'aa7227a997a86e8049e7dc7df56c6e3d.jpg', '', 'other', 0.00, 7, 2, '2025-06-13 10:36:04', '2025-06-25 11:49:33', NULL, 1, 1, 1, 50),
(51, 4, 4, 'Assorted meat (Fried rice, Jollof rice, Noodles)', '837d0647f6a40d29b95430afb03b844a.webp', '', 'other', 0.00, 7, 2, '2025-06-13 10:41:01', '2025-06-25 11:50:42', NULL, 1, 1, 1, 51),
(52, 4, 4, 'Noodles (Chicken)', '94cf8927a5c98f1d650dd1150808cd4b.jpg', '', 'other', 0.00, 7, 2, '2025-06-13 10:43:20', '2025-06-24 03:37:07', NULL, 1, 1, 1, 52),
(53, 4, 4, 'Spaghetti Bolognese ', '302c452236566b324e060675ea3f9be8.jpeg', '', 'other', 75.00, 7, 2, '2025-06-13 10:50:22', '2025-06-13 13:56:44', NULL, 1, 1, 1, 53),
(54, 4, 4, 'Banku & Tilapia', '1c819e452278d6f2adef8b051026a855.jpg', '', 'other', 0.00, 9, 9, '2025-06-13 10:59:44', '2025-06-13 10:59:44', NULL, 1, 1, 1, 54),
(55, 4, 4, 'Banku with Okro and Tilapia ', '6498e6cee50a25b4f0a9f6e4dcd9b831.webp', '', 'other', 0.00, 9, 9, '2025-06-13 11:09:24', '2025-06-13 11:09:24', NULL, 1, 1, 1, 55),
(56, 4, 4, 'Banku with Okro and Chicken', 'd78b60d68b7b42505a6be501de9c4135.webp', '', 'veg', 0.00, 9, 6, '2025-06-13 11:11:38', '2025-06-13 11:11:38', NULL, 1, 1, 1, 56),
(57, 4, 4, 'Banku with Okro (Goat)', '1752504e0eb0e7907f779208b54e729b.jpeg', '', 'other', 0.00, 9, 7, '2025-06-13 11:13:12', '2025-06-24 03:42:25', NULL, 1, 1, 1, 57),
(58, 4, 4, 'Banku with Pepper and Chicken', 'fb9755d2bbbc7cb56b9c273d8fb48bf8.webp', '', 'other', 0.00, 9, 6, '2025-06-13 11:14:15', '2025-06-13 11:19:26', NULL, 1, 1, 1, 58),
(59, 4, 4, 'Banku with Pepper and Goat', '15e349df443112166c6d340b2ef50e9b.webp', '', 'other', 0.00, 9, 7, '2025-06-13 11:23:54', '2025-06-24 03:46:34', NULL, 1, 1, 1, 59),
(60, 4, 4, 'Fufu with Light Soup or Groundnut Soup', 'decba83cf29305c1747f4cb7fc8626c7.webp', 'Comes with Chicken or Fish', 'other', 60.00, 9, 10, '2025-06-13 12:34:24', '2025-06-13 22:41:28', NULL, 1, 1, 1, 60),
(61, 4, 4, 'Fufu with Goat Light Soup or Groundnut Soup (1 Portion of Goat) ', '84bb67beb4abd6fd31c76373fa628692.webp', 'It comes with one portion of goat meat\n1 portion of goat meat is 25gh', 'other', 0.00, 9, 10, '2025-06-13 12:51:47', '2025-06-18 02:41:33', NULL, 1, 1, 1, 61),
(62, 4, 4, 'Red Red (only)', '9c7fdf51baf6dc2c723db09a8935ea9a.webp', 'Only beans and plaintain', 'veg', 60.00, 9, 8, '2025-06-13 12:57:46', '2025-06-13 12:57:46', NULL, 1, 1, 1, 62),
(63, 4, 4, 'Fufu with Light soup or Groundnut soup and Tilapia', '9affee768b5243457f6dd77a9c1a636c.png', '', 'other', 0.00, 9, 9, '2025-06-13 13:03:49', '2025-06-18 02:29:18', NULL, 1, 1, 1, 63),
(64, 4, 4, 'Red Red with Fish', '3999c3b3fd42e64e73f433133c3fee11.webp', '', 'other', 0.00, 9, 18, '2025-06-13 13:28:54', '2025-06-25 11:41:01', NULL, 1, 1, 1, 64),
(65, 4, 4, 'Red Red with Chicken ', '2201dfc72b2579934cbf5f33bd4f6871.webp', '', 'other', 0.00, 9, 6, '2025-06-13 13:32:31', '2025-06-13 13:39:55', NULL, 1, 1, 1, 65),
(66, 4, 4, 'Yam Chips with Fish', '5b99baabbe89c600af265c1f2134c2c4.jpg', '', 'other', 0.00, 9, 5, '2025-06-13 13:35:37', '2025-06-18 02:04:28', NULL, 1, 1, 1, 66),
(67, 4, 4, 'Yam Chips with Chicken', 'e178ae349e1d7f71bd407dffebe79e1d.webp', '', 'other', 0.00, 9, 5, '2025-06-13 13:36:33', '2025-06-13 13:39:31', NULL, 1, 1, 1, 67),
(68, 4, 4, 'Yam with Palava Sauce/Garden Eggs and Goat', '411daca4c7ebc992f7ebf6bd424f860b.jpg', '', 'other', 0.00, 9, 23, '2025-06-13 13:46:47', '2025-06-24 03:28:52', NULL, 1, 1, 1, 68),
(69, 4, 4, 'Yam with Palava Sauce/Garden Eggs and Chicken', 'fb369c27572c04f1447e70f0d6d06f2f.jpg', '', 'other', 0.00, 9, 6, '2025-06-13 13:48:45', '2025-06-18 01:50:45', NULL, 1, 1, 1, 69),
(70, 4, 4, 'Gari Fotor with Goat', '17f9df2044bc193213f00737a956f8f3.webp', '', 'other', 0.00, 9, 12, '2025-06-13 13:51:31', '2025-06-18 01:36:48', NULL, 1, 1, 1, 70),
(71, 4, 4, 'Gari Fortor with Chicken', '7ef122968c9a5e671980ffbf8f842e51.webp', '', 'other', 0.00, 9, 6, '2025-06-13 13:55:44', '2025-06-13 13:55:44', NULL, 1, 1, 1, 71),
(72, 4, 4, 'Guinness', 'd2bc8184d134328541b6b2adf752025b.jpeg', '', 'drink', 20.00, 12, 19, '2025-06-13 15:32:32', '2025-06-13 22:42:05', NULL, 1, 1, 1, 72),
(73, 4, 4, 'Orijin', '6869e038657382b7ef04151a3377f044.webp', '', 'drink', 20.00, 12, 19, '2025-06-13 15:33:47', '2025-06-13 17:02:20', NULL, 1, 1, 1, 73),
(74, 4, 4, 'Club', '4ba49cabc8efd658c6ed8eab61161f57.jpeg', '', 'drink', 20.00, 12, 19, '2025-06-13 15:44:05', '2025-06-13 15:44:05', NULL, 1, 1, 1, 74),
(75, 4, 4, 'Club Mini', 'bd0b16196e92cfa4ada00a95b03b342c.jpeg', '', 'drink', 15.00, 12, 19, '2025-06-13 15:44:40', '2025-06-13 15:44:40', NULL, 1, 1, 1, 75),
(76, 4, 4, 'Gulder', '694db3faf4a03af91d64264866e6895b.webp', '', 'drink', 20.00, 12, 19, '2025-06-13 15:46:21', '2025-06-13 15:46:21', NULL, 1, 1, 1, 76),
(77, 4, 4, 'Eagle', 'fc6e4fdd1688b604817bbea8e2e37d96.webp', '', 'drink', 15.00, 12, 19, '2025-06-13 15:47:56', '2025-06-13 15:47:56', NULL, 1, 1, 1, 77),
(78, 4, 4, 'ABC', 'ca73580d1ca3aec01b440c2038f430a2.webp', '', 'drink', 15.00, 12, 19, '2025-06-13 15:57:19', '2025-06-13 15:57:19', NULL, 1, 1, 1, 78),
(79, 4, 4, 'Savanna', 'f1927177785247bcc2852fc8daefbed6.webp', '', 'drink', 30.00, 12, 19, '2025-06-13 16:00:11', '2025-06-13 16:00:11', NULL, 1, 1, 1, 79),
(80, 4, 4, 'Star Beer', '59b138c6a08005d5474e1bd5810644ec.webp', '', 'drink', 20.00, 12, 19, '2025-06-13 16:02:38', '2025-06-13 16:02:38', NULL, 1, 1, 1, 80),
(81, 4, 4, 'Shandy', '75083ad24059bc496226bd40aaa38128.webp', '', 'drink', 20.00, 12, 19, '2025-06-13 16:04:14', '2025-06-13 16:04:14', NULL, 1, 1, 1, 81),
(82, 4, 4, 'Shandy Mini', '11a5dbf901ce3b658f9bdee888ba93a3.webp', '', 'drink', 15.00, 12, 19, '2025-06-13 16:04:42', '2025-06-13 16:04:42', NULL, 1, 1, 1, 82),
(83, 4, 4, 'Red Bull', '1782c535380cb9e3f6b795c51b6bd77b.webp', '', 'drink', 25.00, 12, 19, '2025-06-13 16:06:14', '2025-06-13 16:06:14', NULL, 1, 1, 1, 83),
(84, 4, 4, 'Vody', '6ee7100823cbc5a106dde92980fbd0ea.webp', '', 'drink', 25.00, 12, 19, '2025-06-13 16:07:31', '2025-06-13 16:07:31', NULL, 1, 1, 1, 84),
(85, 4, 4, 'Faxe Beer', '584633b80469640ba1bbd80c1a6c7732.webp', '', 'drink', 30.00, 12, 19, '2025-06-13 16:09:29', '2025-06-13 16:09:29', NULL, 1, 1, 1, 85),
(86, 4, 4, 'Kiss Beer', '731d41450eeef960d24537a574396f9f.webp', '', 'drink', 30.00, 12, 19, '2025-06-13 16:12:44', '2025-06-13 16:12:44', NULL, 1, 1, 1, 86),
(87, 4, 4, 'Don Gracia', 'ac85d78375e23dec21c50ae01cf5c5dd.webp', '', 'drink', 40.00, 12, 19, '2025-06-13 16:29:26', '2025-06-13 16:29:26', NULL, 1, 1, 1, 87),
(88, 4, 4, 'Smirfoff Ice', '73470e303266faae4a63021d8c64c7ea.webp', '', 'drink', 25.00, 12, 19, '2025-06-13 16:30:46', '2025-06-13 16:30:46', NULL, 1, 1, 1, 88),
(89, 4, 4, 'Stella Artois', 'dde9fffe99cfa5be7ba96c9959659a1b.webp', '', 'drink', 25.00, 12, 19, '2025-06-13 16:32:15', '2025-06-13 16:32:15', NULL, 1, 1, 1, 89),
(90, 4, 4, 'Bubra', '7f0d5a1b79f7627576c0658f4c9e4fd2.webp', '', 'drink', 15.00, 12, 19, '2025-06-13 16:33:30', '2025-06-13 16:39:37', NULL, 1, 1, 1, 90),
(91, 4, 4, 'Mineral', 'e6a3de43f3b14815f2ec25b14aa394e2.webp', NULL, 'drink', 10.00, 12, 20, '2025-06-13 17:10:19', '2025-06-13 17:10:19', NULL, 1, 1, 1, 91),
(92, 4, 4, 'Water ', 'cee69fc648bdefc375870abc61d8a5c5.webp', '', 'drink', 5.00, 12, 20, '2025-06-13 17:10:53', '2025-06-13 22:43:32', NULL, 1, 1, 1, 92),
(93, 4, 4, 'Can Coke', 'a47d7138b207a202feb4590b8f5cbcc3.webp', '', 'drink', 15.00, 12, 20, '2025-06-13 17:11:33', '2025-06-13 17:11:33', NULL, 1, 1, 1, 93),
(94, 4, 4, 'Malta Guinness', 'e6a38b645ade1518f2a7520efd80ef08.webp', '', 'drink', 15.00, 12, 20, '2025-06-13 17:13:10', '2025-06-13 17:13:10', NULL, 1, 1, 1, 94),
(95, 4, 4, 'Can Malt', '870db423a61172947a2ee65f992a2311.webp', '', 'drink', 17.00, 12, 20, '2025-06-13 17:14:28', '2025-06-13 17:14:28', NULL, 1, 1, 1, 95),
(96, 4, 4, 'Nourisher', NULL, '', 'drink', 12.00, 12, 20, '2025-06-13 17:15:15', '2025-06-13 17:15:15', NULL, 1, 1, 1, 96),
(97, 4, 4, 'Don Simon', 'ea56aed8c2c38a709207e425ea956902.webp', '', 'drink', 40.00, 12, 20, '2025-06-13 17:16:04', '2025-06-13 17:16:04', NULL, 1, 1, 1, 97),
(98, 4, 4, 'Cocktail', 'b7fdfa46c7777ee1d819f6f7a608a74f.webp', '', 'drink', 15.00, 12, 20, '2025-06-13 17:16:48', '2025-06-13 17:16:49', NULL, 1, 1, 1, 98),
(99, 4, 4, 'Vitamilk', '18c60f481cc55318e2f30a45a9e864d6.webp', '', 'drink', 20.00, 12, 20, '2025-06-13 17:18:24', '2025-06-13 17:18:24', NULL, 1, 1, 1, 99),
(100, 4, 4, 'Panache ', 'acd6e308b4c3718f3ba563fccaf4a756.webp', '', 'drink', 15.00, 12, 20, '2025-06-13 17:21:08', '2025-06-13 17:21:08', NULL, 1, 1, 1, 100),
(101, 4, 4, 'Alvaro', 'b8694f2167997090b90f645e5b945551.webp', '', 'drink', 15.00, 12, 20, '2025-06-13 17:26:49', '2025-06-13 17:26:49', NULL, 1, 1, 1, 101),
(102, 4, 4, 'Herb Akrik', NULL, '(1x shot)', 'drink', 5.00, 12, 22, '2025-06-13 17:29:05', '2025-06-13 17:29:05', NULL, 1, 1, 1, 102),
(103, 4, 4, 'Joy Dadi', 'bb08083b789a2aa1033e31bfc9f206d7.webp', '(1x shot)', 'drink', 5.00, 12, 22, '2025-06-13 17:47:39', '2025-06-13 17:47:39', NULL, 1, 1, 1, 103),
(104, 4, 4, 'Origin Bitters', 'e894e40655c1f928745f53a9eedebd10.webp', '', 'drink', 5.00, 12, 22, '2025-06-13 17:50:11', '2025-06-13 17:50:11', NULL, 1, 1, 1, 104),
(105, 4, 4, 'Lime ', NULL, '', 'drink', 5.00, 12, 22, '2025-06-13 17:51:22', '2025-06-13 17:51:22', NULL, 1, 1, 1, 105),
(106, 4, 4, 'Mandingo', NULL, '(1x shot)', 'drink', 5.00, 12, 22, '2025-06-13 17:52:36', '2025-06-13 17:52:36', NULL, 1, 1, 1, 106),
(107, 4, 4, 'Castle Bridge', NULL, '', 'drink', 5.00, 12, 22, '2025-06-13 17:53:44', '2025-06-13 17:53:44', NULL, 1, 1, 1, 107),
(108, 4, 4, 'Alomo Bitters', '9e3dc33c36f44a0b07f152fadc1cb80a.webp', NULL, 'drink', 5.00, 12, 22, '2025-06-13 17:55:20', '2025-06-13 17:55:20', NULL, 1, 1, 1, 108),
(109, 4, 4, 'Monarch Ginseng Bitters', NULL, '(1x shot)', 'drink', 5.00, 12, 22, '2025-06-13 17:56:00', '2025-06-13 17:56:00', NULL, 1, 1, 1, 109),
(110, 4, 4, 'Red Label', '5b6d2dba5d861b73966841e673cab4c2.webp', '(1x shot)', 'drink', 5.00, 12, 21, '2025-06-13 17:57:12', '2025-06-13 17:57:12', NULL, 1, 1, 1, 110),
(111, 4, 4, 'Baileys', '22969a9fbf89f89525ba400c768dcb76.webp', '(1x shot)', 'drink', 15.00, 12, 21, '2025-06-13 17:58:33', '2025-06-13 17:58:33', NULL, 1, 1, 1, 111),
(112, 4, 4, 'Gordon’s (London dry gin)', '2811b8a6922569fc1d9e644826f26086.webp', '(1x shot)', 'drink', 15.00, 12, 21, '2025-06-13 18:02:36', '2025-06-13 18:02:36', NULL, 1, 1, 1, 112),
(113, 4, 4, 'Teachers (Blended scotch whiskey)', '3d2a097e193a22e6ae903a83b2ff0147.webp', '( 1x shot ) ', 'veg', 15.00, 12, 21, '2025-06-13 18:04:32', '2025-06-13 18:04:32', NULL, 1, 1, 1, 113),
(114, 4, 4, 'Campari', '68e18be8465e9064d359c9c6652f12d8.webp', '(1x shot)', 'drink', 15.00, 12, 21, '2025-06-13 18:05:52', '2025-06-13 18:05:52', NULL, 1, 1, 1, 114),
(115, 4, 4, 'Carnival Strawberry', '5df20645f8660ad3041fe317e393411d.webp', '(1x shot)', 'drink', 15.00, 12, 21, '2025-06-13 18:07:10', '2025-06-16 17:57:57', NULL, 1, 1, 1, 115),
(116, 4, 4, 'Jagermeister', 'f35eab101084c5e5ddf8dbdd02a31d4c.webp', '(1x shot)', 'drink', 15.00, 12, 21, '2025-06-13 18:08:47', '2025-06-13 18:08:47', NULL, 1, 1, 1, 116),
(117, 4, 4, 'Bubra', '67d4e9c5cc23d90dcec3efbc4653da1c.jpeg', '', 'drink', 15.00, 12, 19, '2025-06-16 17:55:52', '2025-06-16 17:56:59', NULL, 1, 1, 1, 117),
(118, 4, 4, 'Gari Fotor with Fish', '7644529e42473ff77f32eeaf72e0b835.jpeg', NULL, 'other', 0.00, 9, 18, '2025-06-18 01:43:06', '2025-06-18 01:43:06', NULL, 1, 1, 1, 118),
(119, 4, 4, 'Gari Fotor with Turkey Wings', 'b0821c242165ec9c092ac3efd9b90feb.jpeg', '', 'other', 0.00, 9, 7, '2025-06-18 01:44:00', '2025-06-18 01:44:00', NULL, 1, 1, 1, 119),
(120, 4, 4, 'Apem with Palava Sauce/Garden Eggs and Chicken', '799994af7457d70b410c47f7735a218a.jpg', '', 'other', 0.00, 9, 6, '2025-06-18 01:56:37', '2025-06-18 02:01:47', NULL, 1, 1, 1, 120),
(121, 4, 4, 'Plain Rice with Palava Sauce/Garden Eggs and Chicken', '6e9147f643ede20251e4ab0c90023cf3.jpeg', '', 'other', 0.00, 9, 6, '2025-06-18 02:01:04', '2025-06-18 02:01:04', NULL, 1, 1, 1, 121),
(122, 4, 4, 'Yam Chips with Goat', '82e5d014ce30d439586471a141b265f5.jpg', '', 'other', 0.00, 9, 5, '2025-06-18 02:11:32', '2025-06-18 02:11:32', NULL, 1, 1, 1, 122),
(123, 4, 4, 'Yam Chips with Turkey Wings', '12e50a0f95863e739143cb44478cd25a.jpg', '', 'other', 0.00, 9, 7, '2025-06-18 02:12:43', '2025-06-18 02:12:43', NULL, 1, 1, 1, 123),
(124, 4, 4, 'Red Red with Goat', '8d13cbbb23feda61b4914cbc4204df28.jpeg', '', 'other', 0.00, 9, 23, '2025-06-18 02:21:44', '2025-06-18 02:21:44', NULL, 1, 1, 1, 124),
(125, 4, 4, 'Red Red with Turkey Wings', '5e7420c7b94dcbe555ae802f05cecb84.jpeg', '', 'other', 0.00, 9, 7, '2025-06-18 02:24:28', '2025-06-18 02:24:28', NULL, 1, 1, 1, 125),
(126, 4, 4, 'Fufu with Cowleg Light soup or Groundnut soup (1 Portion of Goat)', '0b88a8939a579b62b2770daba6623f08.jpeg', '1 portion of goat meat is 25gh', 'other', 0.00, 9, 10, '2025-06-18 02:45:30', '2025-06-18 02:45:30', NULL, 1, 1, 1, 126),
(127, 4, 4, 'Plain Rice with Chicken', 'ea2261e0807fb5cac91aa621b159a99f.jpg', NULL, 'other', 0.00, 6, 4, '2025-06-24 02:10:16', '2025-06-24 02:10:16', NULL, 1, 1, 1, 127),
(128, 4, 4, 'Fried Rice with Chicken', NULL, '', 'other', 0.00, 6, 4, '2025-06-24 02:11:09', '2025-06-24 02:11:09', NULL, 1, 1, 1, 128),
(129, 4, 4, 'Jollof Rice with Goat', 'd6ed16f2e3f54428f68975f56e29ebdc.jpg', NULL, 'other', 0.00, 6, 4, '2025-06-24 02:21:34', '2025-06-24 02:21:34', NULL, 1, 1, 1, 129),
(130, 4, 4, 'Jollof Rice with Fish', 'fdb514919d45adcba1daec517bee254f.jpeg', NULL, 'other', 0.00, 6, 4, '2025-06-24 02:29:31', '2025-06-24 02:29:31', NULL, 1, 1, 1, 130),
(131, 4, 4, 'Plain Rice with Turkey wings', 'f2683a71d24402f23bdb6210efee133a.jpeg', '', 'other', 0.00, 6, 7, '2025-06-24 02:32:14', '2025-06-24 02:32:14', NULL, 1, 1, 1, 131),
(132, 4, 4, 'Plain Rice with Goat', 'cd2e7602dd310c81ba229469b5225e53.jpeg', '', 'other', 0.00, 6, 23, '2025-06-24 02:42:04', '2025-06-24 02:42:04', NULL, 1, 1, 1, 132),
(133, 4, 4, 'Plain Rice with Fish', 'f48dbdc5c73195a5c763da0be8e1cdad.jpeg', '', 'other', 0.00, 6, 4, '2025-06-24 02:44:39', '2025-06-24 02:44:39', NULL, 1, 1, 1, 133),
(134, 4, 4, 'Fried Rice with Turkey wings', '2914c612c963bc75bc2992aad99ccfe4.jpeg', '', 'other', 0.00, 6, 4, '2025-06-24 02:47:21', '2025-06-24 02:47:21', NULL, 1, 1, 1, 134),
(135, 4, 4, 'Fried Rice with Goat', '455771128d51053ce52a788aaff0f4a0.jpeg', '', 'other', 0.00, 6, 23, '2025-06-24 02:50:48', '2025-06-24 02:50:48', NULL, 1, 1, 1, 135),
(136, 4, 4, 'Fried Rice with Fish', NULL, '', 'other', 0.00, 6, 18, '2025-06-24 03:18:24', '2025-06-24 03:18:24', NULL, 1, 1, 1, 136),
(137, 4, 4, 'Yam with Palava Sauce/Garden Eggs and Fish', NULL, '', 'other', 0.00, 9, 18, '2025-06-24 03:30:16', '2025-06-24 03:30:16', NULL, 1, 1, 1, 137),
(138, 4, 4, 'Yam with Palava Sauce/Garden Eggs and Turkey wings', NULL, '', 'other', 0.00, 9, 7, '2025-06-24 03:31:16', '2025-06-24 03:31:16', NULL, 1, 1, 1, 138),
(139, 4, 4, 'Apem with Palava Sauce/Garden Eggs and Goat', NULL, '', 'other', 0.00, 9, 23, '2025-06-24 03:32:03', '2025-06-24 03:32:03', NULL, 1, 1, 1, 139),
(140, 4, 4, 'Apem with Palava Sauce/Garden Eggs and Fish', NULL, '', 'other', 0.00, 9, 18, '2025-06-24 03:32:47', '2025-06-24 03:32:47', NULL, 1, 1, 1, 140),
(141, 4, 4, 'Apem with Palava Sauce/Garden Eggs and Turkey wings', NULL, '', 'other', 0.00, 9, 7, '2025-06-24 03:33:23', '2025-06-24 03:33:23', NULL, 1, 1, 1, 141),
(142, 4, 4, 'Plain Rice with Palava Sauce/Garden Eggs and Goat', NULL, '', 'other', 0.00, 9, 23, '2025-06-24 03:33:58', '2025-06-24 03:33:58', NULL, 1, 1, 1, 142),
(143, 4, 4, 'Plain Rice with Palava Sauce/Garden Eggs and Fish', NULL, '', 'other', 0.00, 9, 18, '2025-06-24 03:34:30', '2025-06-24 03:34:30', NULL, 1, 1, 1, 143),
(144, 4, 4, 'Plain Rice with Palava Sauce/Garden Eggs and Goat', NULL, '', 'other', 0.00, 9, 23, '2025-06-24 03:35:08', '2025-06-24 03:35:08', NULL, 1, 1, 1, 144),
(145, 4, 4, 'Noodles (Beef)', NULL, '', 'other', 0.00, 6, 24, '2025-06-24 03:38:40', '2025-06-24 03:39:13', NULL, 1, 1, 1, 145),
(146, 4, 4, 'Banku with Okro (Turkey Wings)', NULL, '', 'other', 0.00, 9, 7, '2025-06-24 03:43:18', '2025-06-24 03:43:18', NULL, 1, 1, 1, 146),
(147, 4, 4, 'Banku with Okro (Fish)', NULL, '', 'other', 0.00, 9, 18, '2025-06-24 03:44:00', '2025-06-24 03:44:00', NULL, 1, 1, 1, 147),
(148, 4, 4, 'Banku with Pepper and Fish', NULL, '', 'other', 0.00, 9, 18, '2025-06-24 04:13:47', '2025-06-24 04:13:47', NULL, 1, 1, 1, 148),
(149, 4, 4, 'Beef Sauce only', '672786e22d0c42674fafb212ebcd1637.jpg', NULL, 'other', 60.00, 8, 24, '2025-06-25 11:08:46', '2025-06-25 11:08:46', NULL, 1, 1, 1, 149),
(150, 4, 4, ' Chicken Sauce only', NULL, '', 'veg', 60.00, 8, 6, '2025-06-25 11:09:54', '2025-06-25 11:09:54', NULL, 1, 1, 1, 150),
(151, 4, 4, 'Seafood Sauce only', '8d627de48f05f707e25dc8901e5b5b8f.jpg', '', 'other', 60.00, 8, 25, '2025-06-25 11:12:11', '2025-06-25 11:12:11', NULL, 1, 1, 1, 151),
(152, 4, 4, 'Fish Sauce only', '5e927950f70294694d1b9143c85a4615.jpg', '', 'other', 60.00, 8, 18, '2025-06-25 11:13:02', '2025-06-25 11:13:22', NULL, 1, 1, 1, 152),
(153, 4, 4, 'Vegetable Rice with Fish', '02307ed9cb6abb0ab8ba74a7779d51a9.jpeg', '', 'other', 0.00, 7, 18, '2025-06-25 11:18:44', '2025-06-25 11:18:44', NULL, 1, 1, 1, 153),
(154, 4, 4, 'Vegetable Rice with Goat ', 'f357012581d2e6aaec25599bb95d453a.jpg', '', 'other', 0.00, 7, 23, '2025-06-25 11:19:54', '2025-06-25 11:19:54', NULL, 1, 1, 1, 154),
(155, 4, 4, 'Vegetable Rice Only', NULL, NULL, 'veg', 55.00, 10, 4, '2025-07-12 01:08:06', '2025-07-12 01:08:06', 20, 1, 1, 1, 155);

-- --------------------------------------------------------

--
-- Table structure for table `menu_item_translations`
--

CREATE TABLE `menu_item_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_item_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `item_name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_item_translations`
--

INSERT INTO `menu_item_translations` (`id`, `menu_item_id`, `locale`, `item_name`, `description`) VALUES
(1, 1, 'en', 'Banku with Catfish', 'Banku with Catfish'),
(2, 2, 'en', 'Kenkey', 'Kenkey'),
(3, 3, 'en', 'Samosa', 'Samosa(3 pieces)'),
(4, 4, 'en', 'Pie', 'Meat Pie'),
(5, 5, 'en', 'Club Sandwich', ''),
(6, 6, 'en', 'Tuna Sandwich ', ''),
(7, 7, 'en', 'Mini Salad', ''),
(8, 8, 'en', 'Mixed Salad ', ''),
(9, 9, 'en', 'Tuna Salad', ''),
(10, 10, 'en', 'Chicken Salad', ''),
(11, 11, 'en', 'Jollof Rice with Turkey wings', ''),
(12, 12, 'en', 'Jollof Rice with Chicken', ''),
(13, 13, 'en', 'Vegetable Rice with Turkey wings ', ''),
(14, 14, 'en', 'Vegetable Rice with Chicken', ''),
(15, 15, 'en', 'Plain Rice with Egg stew', ''),
(16, 16, 'en', 'Plain Rice with Egg  & Sausage Stew', ''),
(17, 17, 'en', 'Plain Rice with Egg & Sausage Stew', ''),
(19, 19, 'en', 'Yam Chips/ Potato Chips with Chicken', ''),
(20, 20, 'en', 'Chicken', ''),
(21, 21, 'en', 'Turkey Wings', ''),
(22, 22, 'en', 'Fried Rice', ''),
(23, 23, 'en', 'Plain Rice', ''),
(24, 24, 'en', 'Jollof Rice', ''),
(25, 25, 'en', 'Portion Goat Stew', ''),
(26, 26, 'en', 'Portion Fish Stew', ''),
(27, 27, 'en', 'Turkey Wings Stew', ''),
(28, 28, 'en', 'Portion Chicken Stew', ''),
(29, 29, 'en', 'Portion Tilapia', ''),
(30, 30, 'en', 'Portion Yam Chips', ''),
(31, 31, 'en', 'Portion Potato Chips', ''),
(32, 32, 'en', 'Portion Fufu', ''),
(33, 33, 'en', 'Portion Banku', ''),
(34, 34, 'en', 'Portion Boiled Yam', ''),
(35, 35, 'en', 'Portion Boiled Apem', ''),
(36, 36, 'en', 'Extra Shitor', ''),
(37, 37, 'en', 'Extra Pepper', ''),
(38, 38, 'en', 'Extra Coleslaw', ''),
(39, 39, 'en', 'Portion Fried Plantain', ''),
(40, 40, 'en', 'Chicken Sauce', 'This sauce comes with either Yam Chips/Potato Chips/ Fried Rice/Jollof Rice/Plain Rice/ Fried Plantain\n'),
(41, 41, 'en', 'Beef Sauce', 'This sauce comes with either Yam Chips/Potato Chips/ Fried Rice/Jollof Rice/Plain Rice/ Fried Plantain\n'),
(42, 42, 'en', 'Seafood Sauce', 'This sauce comes with either Yam Chips/Potato Chips/ Fried Rice/Jollof Rice/Plain Rice/ Fried Plantain\n'),
(43, 43, 'en', 'Fish Sauce', 'This sauce comes with either Yam Chips/Potato Chips/ Fried Rice/Jollof Rice/Plain Rice/ Fried Plantain\n'),
(44, 44, 'en', 'Fish Provenca', 'This sauce comes with either Yam Chips/Potato Chips/ Fried Rice/Jollof Rice/Plain Rice/ Fried Plantain\n'),
(45, 45, 'en', 'Octopus Sauce', 'This sauce comes with either Yam Chips/Potato Chips/ Fried Rice/Jollof Rice/Plain Rice/ Fried Plantain\n'),
(46, 46, 'en', 'Goat Stew', 'This sauce comes with either Yam Chips/Potato Chips/ Fried Rice/Jollof Rice/Plain Rice/ Fried Plantain\n'),
(47, 47, 'en', 'Beef Stew', 'This sauce comes with either Yam Chips/Potato Chips/ Fried Rice/Jollof Rice/Plain Rice/ Fried Plantain\n'),
(48, 48, 'en', 'Vegetable Sauce', 'This sauce comes with either Yam Chips/Potato Chips/ Fried Rice/Jollof Rice/Plain Rice/ Fried Plantain\n\n'),
(49, 49, 'en', 'Mixed Grilled with Fried rice/ Jollof Rice/ Yam Chips/ Potato Chips/ Gari Fortor', ''),
(50, 50, 'en', 'Seafood Assorted (Fried rice, Jollof rice, Noodles)', ''),
(51, 51, 'en', 'Assorted meat (Fried rice, Jollof rice, Noodles)', ''),
(52, 52, 'en', 'Noodles (Chicken)', ''),
(53, 53, 'en', 'Spaghetti Bolognese ', ''),
(54, 54, 'en', 'Banku & Tilapia', ''),
(55, 55, 'en', 'Banku with Okro and Tilapia ', ''),
(56, 56, 'en', 'Banku with Okro and Chicken', ''),
(57, 57, 'en', 'Banku with Okro (Goat)', ''),
(58, 58, 'en', 'Banku with Pepper and Chicken', ''),
(59, 59, 'en', 'Banku with Pepper and Goat', ''),
(60, 60, 'en', 'Fufu with Light Soup or Groundnut Soup', 'Comes with Chicken or Fish'),
(61, 61, 'en', 'Fufu with Goat Light Soup or Groundnut Soup (1 Portion of Goat) ', 'It comes with one portion of goat meat\n1 portion of goat meat is 25gh'),
(62, 62, 'en', 'Red Red (only)', 'Only beans and plaintain'),
(63, 63, 'en', 'Fufu with Light soup or Groundnut soup and Tilapia', ''),
(64, 64, 'en', 'Red Red with Fish', ''),
(65, 65, 'en', 'Red Red with Chicken ', ''),
(66, 66, 'en', 'Yam Chips with Fish', ''),
(67, 67, 'en', 'Yam Chips with Chicken', ''),
(68, 68, 'en', 'Yam with Palava Sauce/Garden Eggs and Goat', ''),
(69, 69, 'en', 'Yam with Palava Sauce/Garden Eggs and Chicken', ''),
(70, 70, 'en', 'Gari Fotor with Goat', ''),
(71, 71, 'en', 'Gari Fortor with Chicken', ''),
(72, 72, 'en', 'Guinness', ''),
(73, 73, 'en', 'Orijin', ''),
(74, 74, 'en', 'Club', ''),
(75, 75, 'en', 'Club Mini', ''),
(76, 76, 'en', 'Gulder', ''),
(77, 77, 'en', 'Eagle', ''),
(78, 78, 'en', 'ABC', ''),
(79, 79, 'en', 'Savanna', ''),
(80, 80, 'en', 'Star Beer', ''),
(81, 81, 'en', 'Shandy', ''),
(82, 82, 'en', 'Shandy Mini', ''),
(83, 83, 'en', 'Red Bull', ''),
(84, 84, 'en', 'Vody', ''),
(85, 85, 'en', 'Faxe Beer', ''),
(86, 86, 'en', 'Kiss Beer', ''),
(87, 87, 'en', 'Don Gracia', ''),
(88, 88, 'en', 'Smirfoff Ice', ''),
(89, 89, 'en', 'Stella Artois', ''),
(90, 90, 'en', 'Bubra', ''),
(91, 91, 'en', 'Mineral', NULL),
(92, 92, 'en', 'Water ', ''),
(93, 93, 'en', 'Can Coke', ''),
(94, 94, 'en', 'Malta Guinness', ''),
(95, 95, 'en', 'Can Malt', ''),
(96, 96, 'en', 'Nourisher', ''),
(97, 97, 'en', 'Don Simon', ''),
(98, 98, 'en', 'Cocktail', ''),
(99, 99, 'en', 'Vitamilk', ''),
(100, 100, 'en', 'Panache ', ''),
(101, 101, 'en', 'Alvaro', ''),
(102, 102, 'en', 'Herb Akrik', '(1x shot)'),
(103, 103, 'en', 'Joy Dadi', '(1x shot)'),
(104, 104, 'en', 'Origin Bitters', ''),
(105, 105, 'en', 'Lime ', ''),
(106, 106, 'en', 'Mandingo', '(1x shot)'),
(107, 107, 'en', 'Castle Bridge', ''),
(108, 108, 'en', 'Alomo Bitters', NULL),
(109, 109, 'en', 'Monarch Ginseng Bitters', '(1x shot)'),
(110, 110, 'en', 'Red Label', '(1x shot)'),
(111, 111, 'en', 'Baileys', '(1x shot)'),
(112, 112, 'en', 'Gordon’s (London dry gin)', '(1x shot)'),
(113, 113, 'en', 'Teachers (Blended scotch whiskey)', '( 1x shot ) '),
(114, 114, 'en', 'Campari', '(1x shot)'),
(115, 115, 'en', 'Carnival Strawberry', '(1x shot)'),
(116, 116, 'en', 'Jagermeister', '(1x shot)'),
(117, 117, 'en', 'Bubra', ''),
(118, 118, 'en', 'Gari Fotor with Fish', NULL),
(119, 119, 'en', 'Gari Fotor with Turkey Wings', ''),
(120, 120, 'en', 'Apem with Palava Sauce/Garden Eggs and Chicken', ''),
(121, 121, 'en', 'Plain Rice with Palava Sauce/Garden Eggs and Chicken', ''),
(122, 122, 'en', 'Yam Chips with Goat', ''),
(123, 123, 'en', 'Yam Chips with Turkey Wings', ''),
(124, 124, 'en', 'Red Red with Goat', ''),
(125, 125, 'en', 'Red Red with Turkey Wings', ''),
(126, 126, 'en', 'Fufu with Cowleg Light soup or Groundnut soup (1 Portion of Goat)', '1 portion of goat meat is 25gh'),
(127, 127, 'en', 'Plain Rice with Chicken', NULL),
(128, 128, 'en', 'Fried Rice with Chicken', ''),
(129, 129, 'en', 'Jollof Rice with Goat', NULL),
(130, 130, 'en', 'Jollof Rice with Fish', NULL),
(131, 131, 'en', 'Plain Rice with Turkey wings', ''),
(132, 132, 'en', 'Plain Rice with Goat', ''),
(133, 133, 'en', 'Plain Rice with Fish', ''),
(134, 134, 'en', 'Fried Rice with Turkey wings', ''),
(135, 135, 'en', 'Fried Rice with Goat', ''),
(136, 136, 'en', 'Fried Rice with Fish', ''),
(137, 137, 'en', 'Yam with Palava Sauce/Garden Eggs and Fish', ''),
(138, 138, 'en', 'Yam with Palava Sauce/Garden Eggs and Turkey wings', ''),
(139, 139, 'en', 'Apem with Palava Sauce/Garden Eggs and Goat', ''),
(140, 140, 'en', 'Apem with Palava Sauce/Garden Eggs and Fish', ''),
(141, 141, 'en', 'Apem with Palava Sauce/Garden Eggs and Turkey wings', ''),
(142, 142, 'en', 'Plain Rice with Palava Sauce/Garden Eggs and Goat', ''),
(143, 143, 'en', 'Plain Rice with Palava Sauce/Garden Eggs and Fish', ''),
(144, 144, 'en', 'Plain Rice with Palava Sauce/Garden Eggs and Goat', ''),
(145, 145, 'en', 'Noodles (Beef)', ''),
(146, 146, 'en', 'Banku with Okro (Turkey Wings)', ''),
(147, 147, 'en', 'Banku with Okro (Fish)', ''),
(148, 148, 'en', 'Banku with Pepper and Fish', ''),
(149, 149, 'en', 'Beef Sauce only', NULL),
(150, 150, 'en', ' Chicken Sauce only', ''),
(151, 151, 'en', 'Seafood Sauce only', ''),
(152, 152, 'en', 'Fish Sauce only', ''),
(153, 153, 'en', 'Vegetable Rice with Fish', ''),
(154, 154, 'en', 'Vegetable Rice with Goat ', ''),
(155, 155, 'en', 'Vegetable Rice Only', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menu_item_variations`
--

CREATE TABLE `menu_item_variations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `variation` varchar(191) NOT NULL,
  `price` decimal(16,2) NOT NULL,
  `menu_item_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_item_variations`
--

INSERT INTO `menu_item_variations` (`id`, `variation`, `price`, `menu_item_id`, `created_at`, `updated_at`) VALUES
(40, 'Regular Size ', 110.00, 54, '2025-06-13 10:59:44', '2025-06-13 10:59:44'),
(41, 'Mini Size', 80.00, 54, '2025-06-13 10:59:44', '2025-06-13 10:59:44'),
(42, 'Regular Size ', 120.00, 55, '2025-06-13 11:09:24', '2025-06-13 11:09:24'),
(43, 'Mini Size', 85.00, 55, '2025-06-13 11:09:24', '2025-06-13 11:09:24'),
(44, 'Regular Size ', 95.00, 56, '2025-06-13 11:11:38', '2025-06-13 11:11:38'),
(45, 'Mini Size', 85.00, 56, '2025-06-13 11:11:38', '2025-06-13 11:11:38'),
(50, 'Regular Size ', 105.00, 58, '2025-06-13 11:19:26', '2025-06-13 11:19:26'),
(51, 'Mini Size', 95.00, 58, '2025-06-13 11:19:26', '2025-06-13 11:19:26'),
(66, 'Regular Size ', 90.00, 67, '2025-06-13 13:39:31', '2025-06-13 13:39:31'),
(67, 'Mini Size', 70.00, 67, '2025-06-13 13:39:31', '2025-06-13 13:39:31'),
(68, 'Regular Size ', 90.00, 65, '2025-06-13 13:39:55', '2025-06-13 13:39:55'),
(69, 'Mini Size', 70.00, 65, '2025-06-13 13:39:55', '2025-06-13 13:39:55'),
(80, 'Regular Size ', 90.00, 71, '2025-06-13 13:55:44', '2025-06-13 13:55:44'),
(81, 'Mini Size', 70.00, 71, '2025-06-13 13:55:45', '2025-06-13 13:55:45'),
(82, '3 pieces', 10.00, 3, '2025-06-13 18:20:03', '2025-06-13 18:20:03'),
(91, 'Regular Size', 90.00, 14, '2025-06-13 19:03:27', '2025-06-13 19:03:27'),
(92, 'Mini Size', 70.00, 14, '2025-06-13 19:03:27', '2025-06-13 19:03:27'),
(93, 'Regular Size ', 85.00, 15, '2025-06-13 19:06:48', '2025-06-13 19:06:48'),
(94, 'Mini Size', 65.00, 15, '2025-06-13 19:06:48', '2025-06-13 19:06:48'),
(95, 'Regular Size ', 95.00, 16, '2025-06-13 19:11:56', '2025-06-13 19:11:56'),
(96, 'Mini Size', 75.00, 16, '2025-06-13 19:11:56', '2025-06-13 19:11:56'),
(100, 'Quarter Turkey Wings', 70.00, 21, '2025-06-13 19:32:35', '2025-06-13 19:32:35'),
(101, 'Half Turkey Wings', 140.00, 21, '2025-06-13 19:32:35', '2025-06-13 19:32:35'),
(102, 'Full Turkey Wings', 210.00, 21, '2025-06-13 19:32:35', '2025-06-13 19:32:35'),
(103, 'Quarter Chicken', 55.00, 20, '2025-06-13 19:34:05', '2025-06-13 19:34:05'),
(104, 'Half Chicken', 110.00, 20, '2025-06-13 19:34:05', '2025-06-13 19:34:05'),
(105, 'Full Chicken', 165.00, 20, '2025-06-13 19:34:05', '2025-06-13 19:34:05'),
(108, 'Regular Size ', 120.00, 17, '2025-06-13 19:38:36', '2025-06-13 19:38:36'),
(109, 'Mini Size', 100.00, 17, '2025-06-13 19:38:36', '2025-06-13 19:38:36'),
(110, 'Small', 10.00, 32, '2025-06-13 21:11:23', '2025-06-13 21:11:23'),
(111, 'Mid', 15.00, 32, '2025-06-13 21:11:23', '2025-06-13 21:11:23'),
(112, 'Regular Size ', 100.00, 29, '2025-06-13 21:21:12', '2025-06-13 21:21:12'),
(113, 'Mini Size', 60.00, 29, '2025-06-13 21:21:12', '2025-06-13 21:21:12'),
(120, 'Regular Size ', 100.00, 70, '2025-06-18 01:36:48', '2025-06-18 01:36:48'),
(121, 'Mini Size', 90.00, 70, '2025-06-18 01:36:48', '2025-06-18 01:36:48'),
(122, 'Regular Size ', 100.00, 118, '2025-06-18 01:43:06', '2025-06-18 01:43:06'),
(123, 'Mini Size', 90.00, 118, '2025-06-18 01:43:06', '2025-06-18 01:43:06'),
(124, 'Regular Size ', 100.00, 119, '2025-06-18 01:44:00', '2025-06-18 01:44:00'),
(125, 'Mini Size', 90.00, 119, '2025-06-18 01:44:00', '2025-06-18 01:44:00'),
(126, 'Palava Sauce Regular Size (L)', 90.00, 69, '2025-06-18 01:50:45', '2025-06-18 01:50:45'),
(127, 'Palava Sauce Mini Size (M)', 70.00, 69, '2025-06-18 01:50:45', '2025-06-18 01:50:45'),
(128, 'Garden Egg Regular Size (L)', 90.00, 69, '2025-06-18 01:50:45', '2025-06-18 01:50:45'),
(129, 'Garden Egg Mini Size (M)', 70.00, 69, '2025-06-18 01:50:45', '2025-06-18 01:50:45'),
(134, 'Palava Sauce Regular Size (L)', 90.00, 121, '2025-06-18 02:01:04', '2025-06-18 02:01:04'),
(135, 'Palava Sauce Mini Size (M)', 70.00, 121, '2025-06-18 02:01:04', '2025-06-18 02:01:04'),
(136, 'Garden Egg Regular Size (L)', 90.00, 121, '2025-06-18 02:01:04', '2025-06-18 02:01:04'),
(137, 'Garden Egg Mini Size (M)', 70.00, 121, '2025-06-18 02:01:04', '2025-06-18 02:01:04'),
(138, 'Palava Sauce Regular Size (L)', 90.00, 120, '2025-06-18 02:01:47', '2025-06-18 02:01:47'),
(139, 'Palava Sauce Mini Size (M)', 70.00, 120, '2025-06-18 02:01:47', '2025-06-18 02:01:47'),
(140, 'Garden Egg Regular Size (L)', 90.00, 120, '2025-06-18 02:01:47', '2025-06-18 02:01:47'),
(141, 'Garden Egg Mini Size (M)', 70.00, 120, '2025-06-18 02:01:47', '2025-06-18 02:01:47'),
(144, 'Regular Size ', 100.00, 66, '2025-06-18 02:04:28', '2025-06-18 02:04:28'),
(145, 'Mini Size', 90.00, 66, '2025-06-18 02:04:28', '2025-06-18 02:04:28'),
(146, 'Regular Size ', 100.00, 122, '2025-06-18 02:11:32', '2025-06-18 02:11:32'),
(147, 'Mini Size', 90.00, 122, '2025-06-18 02:11:32', '2025-06-18 02:11:32'),
(148, 'Regular Size ', 100.00, 123, '2025-06-18 02:12:43', '2025-06-18 02:12:43'),
(149, 'Mini Size', 90.00, 123, '2025-06-18 02:12:43', '2025-06-18 02:12:43'),
(152, 'Regular Size ', 100.00, 124, '2025-06-18 02:21:44', '2025-06-18 02:21:44'),
(153, 'Mini Size', 90.00, 124, '2025-06-18 02:21:44', '2025-06-18 02:21:44'),
(154, 'Regular Size ', 100.00, 125, '2025-06-18 02:24:28', '2025-06-18 02:24:28'),
(155, 'Mini Size', 90.00, 125, '2025-06-18 02:24:28', '2025-06-18 02:24:28'),
(156, 'Light Soup Regular Size ', 110.00, 63, '2025-06-18 02:29:18', '2025-06-18 02:29:18'),
(157, 'Light Soup Mini Size', 70.00, 63, '2025-06-18 02:29:18', '2025-06-18 02:29:18'),
(158, 'Groundnut Regular Size', 110.00, 63, '2025-06-18 02:29:18', '2025-06-18 02:29:18'),
(159, 'Groundnut Mini Size', 70.00, 63, '2025-06-18 02:29:18', '2025-06-18 02:29:18'),
(160, 'Light Soup', 60.00, 61, '2025-06-18 02:41:33', '2025-06-18 02:41:33'),
(161, 'Groundnut Soup', 60.00, 61, '2025-06-18 02:41:33', '2025-06-18 02:41:33'),
(162, 'Light Soup', 60.00, 126, '2025-06-18 02:45:31', '2025-06-18 02:45:31'),
(163, 'Groundnut Soup', 60.00, 126, '2025-06-18 02:45:31', '2025-06-18 02:45:31'),
(164, 'Regular Size ', 72.35, 12, '2025-06-24 02:07:14', '2025-07-26 16:07:56'),
(165, 'Mini Size', 56.79, 12, '2025-06-24 02:07:14', '2025-07-26 16:14:13'),
(166, ' Regular Size', 90.00, 127, '2025-06-24 02:10:16', '2025-06-24 02:10:16'),
(167, 'Mini Size', 70.00, 127, '2025-06-24 02:10:16', '2025-06-24 02:10:16'),
(168, ' Regular Size', 90.00, 128, '2025-06-24 02:11:09', '2025-06-24 02:11:09'),
(169, 'Mini Size', 70.00, 128, '2025-06-24 02:11:09', '2025-06-24 02:11:09'),
(170, 'Regular Size ', 100.00, 11, '2025-06-24 02:19:32', '2025-06-24 02:19:32'),
(171, 'Mini Size', 80.00, 11, '2025-06-24 02:19:32', '2025-06-24 02:19:32'),
(172, ' Regular Size', 100.00, 129, '2025-06-24 02:21:34', '2025-06-24 02:21:34'),
(173, 'Mini Size', 80.00, 129, '2025-06-24 02:21:34', '2025-06-24 02:21:34'),
(174, ' Regular Size', 100.00, 130, '2025-06-24 02:29:31', '2025-06-24 02:29:31'),
(175, 'Mini Size', 80.00, 130, '2025-06-24 02:29:31', '2025-06-24 02:29:31'),
(176, ' Regular Size', 100.00, 131, '2025-06-24 02:32:14', '2025-06-24 02:32:14'),
(177, 'Mini Size', 80.00, 131, '2025-06-24 02:32:14', '2025-06-24 02:32:14'),
(178, ' Regular Size', 100.00, 132, '2025-06-24 02:42:04', '2025-06-24 02:42:04'),
(179, 'Mini Size', 80.00, 132, '2025-06-24 02:42:04', '2025-06-24 02:42:04'),
(180, ' Regular Size', 100.00, 133, '2025-06-24 02:44:39', '2025-06-24 02:44:39'),
(181, 'Mini Size', 80.00, 133, '2025-06-24 02:44:39', '2025-06-24 02:44:39'),
(182, ' Regular Size', 100.00, 134, '2025-06-24 02:47:21', '2025-06-24 02:47:21'),
(183, 'Mini Size', 80.00, 134, '2025-06-24 02:47:21', '2025-06-24 02:47:21'),
(184, ' Regular Size', 100.00, 135, '2025-06-24 02:50:48', '2025-06-24 02:50:48'),
(185, 'Mini Size', 80.00, 135, '2025-06-24 02:50:48', '2025-06-24 02:50:48'),
(186, ' Regular Size', 100.00, 136, '2025-06-24 03:18:24', '2025-06-24 03:18:24'),
(187, 'Mini Size', 80.00, 136, '2025-06-24 03:18:24', '2025-06-24 03:18:24'),
(190, 'Palava Sauce Regular Size ', 100.00, 68, '2025-06-24 03:28:52', '2025-06-24 03:28:52'),
(191, 'Palava Sauce Mini Size', 90.00, 68, '2025-06-24 03:28:52', '2025-06-24 03:28:52'),
(192, 'Garden Egg Regular Size (L)', 100.00, 68, '2025-06-24 03:28:52', '2025-06-24 03:28:52'),
(193, 'Garden Egg Mini Size (M)', 90.00, 68, '2025-06-24 03:28:52', '2025-06-24 03:28:52'),
(194, 'Palava Sauce Regular Size (L)', 100.00, 137, '2025-06-24 03:30:16', '2025-06-24 03:30:16'),
(195, 'Palava Sauce Mini Size (M)', 90.00, 137, '2025-06-24 03:30:16', '2025-06-24 03:30:16'),
(196, 'Garden Egg Regular Size (L)', 100.00, 137, '2025-06-24 03:30:16', '2025-06-24 03:30:16'),
(197, 'Garden Egg Mini Size (M)', 90.00, 137, '2025-06-24 03:30:16', '2025-06-24 03:30:16'),
(198, 'Palava Sauce Regular Size (L)', 100.00, 138, '2025-06-24 03:31:16', '2025-06-24 03:31:16'),
(199, 'Palava Sauce Mini Size (M)', 90.00, 138, '2025-06-24 03:31:16', '2025-06-24 03:31:16'),
(200, 'Garden Egg Regular Size (L)', 100.00, 138, '2025-06-24 03:31:16', '2025-06-24 03:31:16'),
(201, 'Garden Egg Mini Size (M)', 90.00, 138, '2025-06-24 03:31:16', '2025-06-24 03:31:16'),
(202, 'Palava Sauce Regular Size (L)', 100.00, 139, '2025-06-24 03:32:03', '2025-06-24 03:32:03'),
(203, 'Palava Sauce Mini Size (M)', 90.00, 139, '2025-06-24 03:32:03', '2025-06-24 03:32:03'),
(204, 'Garden Egg Regular Size (L)', 100.00, 139, '2025-06-24 03:32:03', '2025-06-24 03:32:03'),
(205, 'Garden Egg Mini Size (M)', 90.00, 139, '2025-06-24 03:32:03', '2025-06-24 03:32:03'),
(206, 'Palava Sauce Regular Size (L)', 100.00, 140, '2025-06-24 03:32:47', '2025-06-24 03:32:47'),
(207, 'Palava Sauce Mini Size (M)', 90.00, 140, '2025-06-24 03:32:47', '2025-06-24 03:32:47'),
(208, 'Garden Egg Regular Size (L)', 100.00, 140, '2025-06-24 03:32:47', '2025-06-24 03:32:47'),
(209, 'Garden Egg Mini Size (M)', 90.00, 140, '2025-06-24 03:32:47', '2025-06-24 03:32:47'),
(210, 'Palava Sauce Regular Size (L)', 100.00, 141, '2025-06-24 03:33:23', '2025-06-24 03:33:23'),
(211, 'Palava Sauce Mini Size (M)', 90.00, 141, '2025-06-24 03:33:23', '2025-06-24 03:33:23'),
(212, 'Garden Egg Regular Size (L)', 100.00, 141, '2025-06-24 03:33:23', '2025-06-24 03:33:23'),
(213, 'Garden Egg Mini Size (M)', 90.00, 141, '2025-06-24 03:33:23', '2025-06-24 03:33:23'),
(214, 'Palava Sauce Regular Size (L)', 100.00, 142, '2025-06-24 03:33:58', '2025-06-24 03:33:58'),
(215, 'Palava Sauce Mini Size (M)', 90.00, 142, '2025-06-24 03:33:58', '2025-06-24 03:33:58'),
(216, 'Garden Egg Regular Size (L)', 100.00, 142, '2025-06-24 03:33:58', '2025-06-24 03:33:58'),
(217, 'Garden Egg Mini Size (M)', 90.00, 142, '2025-06-24 03:33:58', '2025-06-24 03:33:58'),
(218, 'Palava Sauce Regular Size (L)', 100.00, 143, '2025-06-24 03:34:30', '2025-06-24 03:34:30'),
(219, 'Palava Sauce Mini Size (M)', 90.00, 143, '2025-06-24 03:34:30', '2025-06-24 03:34:30'),
(220, 'Garden Egg Regular Size (L)', 100.00, 143, '2025-06-24 03:34:30', '2025-06-24 03:34:30'),
(221, 'Garden Egg Mini Size (M)', 90.00, 143, '2025-06-24 03:34:30', '2025-06-24 03:34:30'),
(222, 'Palava Sauce Regular Size (L)', 100.00, 144, '2025-06-24 03:35:08', '2025-06-24 03:35:08'),
(223, 'Palava Sauce Mini Size (M)', 90.00, 144, '2025-06-24 03:35:08', '2025-06-24 03:35:08'),
(224, 'Garden Egg Regular Size (L)', 100.00, 144, '2025-06-24 03:35:08', '2025-06-24 03:35:08'),
(225, 'Garden Egg Mini Size (M)', 90.00, 144, '2025-06-24 03:35:08', '2025-06-24 03:35:08'),
(226, 'Regular Size ', 115.00, 52, '2025-06-24 03:37:07', '2025-06-24 03:37:07'),
(227, 'Mini Size', 80.00, 52, '2025-06-24 03:37:07', '2025-06-24 03:37:07'),
(230, 'Regular Size ', 115.00, 145, '2025-06-24 03:39:13', '2025-06-24 03:39:13'),
(231, 'Mini Size', 80.00, 145, '2025-06-24 03:39:13', '2025-06-24 03:39:13'),
(232, 'Regular Size ', 105.00, 57, '2025-06-24 03:42:25', '2025-06-24 03:42:25'),
(233, 'Mini Size', 95.00, 57, '2025-06-24 03:42:25', '2025-06-24 03:42:25'),
(234, 'Regular Size ', 105.00, 146, '2025-06-24 03:43:18', '2025-06-24 03:43:18'),
(235, 'Mini Size', 95.00, 146, '2025-06-24 03:43:18', '2025-06-24 03:43:18'),
(236, 'Regular Size ', 105.00, 147, '2025-06-24 03:44:00', '2025-06-24 03:44:00'),
(237, 'Mini Size', 95.00, 147, '2025-06-24 03:44:00', '2025-06-24 03:44:00'),
(238, 'Regular Size ', 100.00, 59, '2025-06-24 03:46:34', '2025-06-24 03:46:34'),
(239, 'Mini Size', 80.00, 59, '2025-06-24 03:46:34', '2025-06-24 03:46:34'),
(240, 'Regular Size ', 105.00, 148, '2025-06-24 04:13:47', '2025-06-24 04:13:47'),
(241, 'Mini Size', 95.00, 148, '2025-06-24 04:13:47', '2025-06-24 04:13:47'),
(242, 'Regular Size (Yam Chips)', 90.00, 19, '2025-06-25 11:15:54', '2025-06-25 11:15:54'),
(243, 'Mini Size (Yam Chips)', 70.00, 19, '2025-06-25 11:15:54', '2025-06-25 11:15:54'),
(244, 'Regular Size (Potato Chips)', 90.00, 19, '2025-06-25 11:15:54', '2025-06-25 11:15:54'),
(245, 'Mini Size (Potato Chips)', 70.00, 19, '2025-06-25 11:15:54', '2025-06-25 11:15:54'),
(246, 'Regular Size', 100.00, 13, '2025-06-25 11:16:47', '2025-06-25 11:16:47'),
(247, 'Mini Size', 80.00, 13, '2025-06-25 11:16:47', '2025-06-25 11:16:47'),
(248, 'Regular Size ', 100.00, 153, '2025-06-25 11:18:44', '2025-06-25 11:18:44'),
(249, 'Mini Size', 80.00, 153, '2025-06-25 11:18:44', '2025-06-25 11:18:44'),
(250, 'Regular Size ', 100.00, 154, '2025-06-25 11:19:54', '2025-06-25 11:19:54'),
(251, 'Mini Size', 80.00, 154, '2025-06-25 11:19:54', '2025-06-25 11:19:54'),
(252, 'Yam Chips', 115.00, 44, '2025-06-25 11:23:20', '2025-06-25 11:23:20'),
(253, 'Potato Chips', 115.00, 44, '2025-06-25 11:23:20', '2025-06-25 11:23:20'),
(254, 'Fried Rice', 115.00, 44, '2025-06-25 11:23:20', '2025-06-25 11:23:20'),
(255, 'Jollof Rice', 115.00, 44, '2025-06-25 11:23:20', '2025-06-25 11:23:20'),
(256, 'Plain Rice', 115.00, 44, '2025-06-25 11:23:20', '2025-06-25 11:23:20'),
(257, 'Fried Plantain', 115.00, 44, '2025-06-25 11:23:20', '2025-06-25 11:23:20'),
(258, 'Yam Chips', 115.00, 43, '2025-06-25 11:24:08', '2025-06-25 11:24:08'),
(259, 'Potato Chips', 115.00, 43, '2025-06-25 11:24:08', '2025-06-25 11:24:08'),
(260, 'Fried Rice', 115.00, 43, '2025-06-25 11:24:08', '2025-06-25 11:24:08'),
(261, 'Jollof Rice', 115.00, 43, '2025-06-25 11:24:08', '2025-06-25 11:24:08'),
(262, 'Plain Rice', 115.00, 43, '2025-06-25 11:24:08', '2025-06-25 11:24:08'),
(263, 'Fried Plantain', 115.00, 43, '2025-06-25 11:24:08', '2025-06-25 11:24:08'),
(264, 'Yam Chips', 125.00, 42, '2025-06-25 11:25:00', '2025-06-25 11:25:00'),
(265, 'Potato Chips', 125.00, 42, '2025-06-25 11:25:00', '2025-06-25 11:25:00'),
(266, 'Fried Rice', 125.00, 42, '2025-06-25 11:25:00', '2025-06-25 11:25:00'),
(267, 'Jollof Rice', 125.00, 42, '2025-06-25 11:25:00', '2025-06-25 11:25:00'),
(268, 'Plain Rice', 125.00, 42, '2025-06-25 11:25:00', '2025-06-25 11:25:00'),
(269, 'Fried Plantain', 125.00, 42, '2025-06-25 11:25:00', '2025-06-25 11:25:00'),
(270, 'Yam Chips', 115.00, 41, '2025-06-25 11:25:49', '2025-06-25 11:25:49'),
(271, 'Potato Chips', 115.00, 41, '2025-06-25 11:25:49', '2025-06-25 11:25:49'),
(272, 'Fried Rice', 115.00, 41, '2025-06-25 11:25:49', '2025-06-25 11:25:49'),
(273, 'Jollof Rice', 115.00, 41, '2025-06-25 11:25:49', '2025-06-25 11:25:49'),
(274, 'Plain Rice', 115.00, 41, '2025-06-25 11:25:49', '2025-06-25 11:25:49'),
(275, 'Fried Plantain', 115.00, 41, '2025-06-25 11:25:49', '2025-06-25 11:25:49'),
(276, 'Yam Chips', 115.00, 40, '2025-06-25 11:26:28', '2025-06-25 11:26:28'),
(277, 'Potato Chips', 115.00, 40, '2025-06-25 11:26:28', '2025-06-25 11:26:28'),
(278, 'Fried Rice', 115.00, 40, '2025-06-25 11:26:28', '2025-06-25 11:26:28'),
(279, 'Jollof Rice', 115.00, 40, '2025-06-25 11:26:28', '2025-06-25 11:26:28'),
(280, 'Plain Rice', 115.00, 40, '2025-06-25 11:26:28', '2025-06-25 11:26:28'),
(281, 'Fried Plantain', 115.00, 40, '2025-06-25 11:26:28', '2025-06-25 11:26:28'),
(282, 'Yam Chips', 75.00, 48, '2025-06-25 11:28:45', '2025-06-25 11:28:45'),
(283, 'Potato Chips', 75.00, 48, '2025-06-25 11:28:45', '2025-06-25 11:28:45'),
(284, 'Fried Rice', 75.00, 48, '2025-06-25 11:28:45', '2025-06-25 11:28:45'),
(285, 'Jollof Rice', 75.00, 48, '2025-06-25 11:28:45', '2025-06-25 11:28:45'),
(286, 'Plain Rice', 75.00, 48, '2025-06-25 11:28:45', '2025-06-25 11:28:45'),
(287, 'Fried Plantain', 75.00, 48, '2025-06-25 11:28:45', '2025-06-25 11:28:45'),
(288, 'Yam Chips', 100.00, 47, '2025-06-25 11:32:07', '2025-06-25 11:32:07'),
(289, 'Potato Chips', 100.00, 47, '2025-06-25 11:32:07', '2025-06-25 11:32:07'),
(290, 'Fried Rice', 100.00, 47, '2025-06-25 11:32:07', '2025-06-25 11:32:07'),
(291, 'Jollof Rice', 100.00, 47, '2025-06-25 11:32:07', '2025-06-25 11:32:07'),
(292, 'Plain Rice', 100.00, 47, '2025-06-25 11:32:07', '2025-06-25 11:32:07'),
(293, 'Fried Plantain', 100.00, 47, '2025-06-25 11:32:07', '2025-06-25 11:32:07'),
(294, 'Yam Chips', 100.00, 46, '2025-06-25 11:35:17', '2025-06-25 11:35:17'),
(295, 'Potato Chips', 100.00, 46, '2025-06-25 11:35:17', '2025-06-25 11:35:17'),
(296, 'Fried Rice', 100.00, 46, '2025-06-25 11:35:17', '2025-06-25 11:35:17'),
(297, 'Jollof Rice', 100.00, 46, '2025-06-25 11:35:17', '2025-06-25 11:35:17'),
(298, 'Plain Rice', 100.00, 46, '2025-06-25 11:35:17', '2025-06-25 11:35:17'),
(299, 'Fried Plantain', 100.00, 46, '2025-06-25 11:35:17', '2025-06-25 11:35:17'),
(300, 'Yam Chips', 115.00, 45, '2025-06-25 11:36:16', '2025-06-25 11:36:16'),
(301, 'Potato Chips', 115.00, 45, '2025-06-25 11:36:16', '2025-06-25 11:36:16'),
(302, 'Fried Rice', 115.00, 45, '2025-06-25 11:36:16', '2025-06-25 11:36:16'),
(303, 'Jollof Rice', 115.00, 45, '2025-06-25 11:36:16', '2025-06-25 11:36:16'),
(304, 'Plain Rice', 115.00, 45, '2025-06-25 11:36:16', '2025-06-25 11:36:16'),
(305, 'Fried Plantain', 115.00, 45, '2025-06-25 11:36:16', '2025-06-25 11:36:16'),
(306, 'Regular Size ', 100.00, 64, '2025-06-25 11:41:01', '2025-06-25 11:41:01'),
(307, 'Mini Size', 90.00, 64, '2025-06-25 11:41:01', '2025-06-25 11:41:01'),
(310, 'Regular Size (Yam Chips)', 170.00, 49, '2025-06-25 11:45:52', '2025-06-25 11:45:52'),
(311, 'Mini Size (Yam Chips)', 100.00, 49, '2025-06-25 11:45:52', '2025-06-25 11:45:52'),
(312, 'Regular Size (Potato Chips)', 170.00, 49, '2025-06-25 11:45:52', '2025-06-25 11:45:52'),
(313, 'Mini Size (Potato Chips)', 100.00, 49, '2025-06-25 11:45:52', '2025-06-25 11:45:52'),
(314, 'Regular Size (Fried Rice)', 170.00, 49, '2025-06-25 11:45:52', '2025-06-25 11:45:52'),
(315, 'Mini Size (Fried Rice)', 100.00, 49, '2025-06-25 11:45:52', '2025-06-25 11:45:52'),
(316, 'Regular Size (Jollof Rice)', 170.00, 49, '2025-06-25 11:45:52', '2025-06-25 11:45:52'),
(317, 'Mini Size (Jollof Rice)', 100.00, 49, '2025-06-25 11:45:52', '2025-06-25 11:45:52'),
(318, 'Regular Size (Gari Fortor)', 170.00, 49, '2025-06-25 11:45:52', '2025-06-25 11:45:52'),
(319, 'Mini Size (Gari Fortor)', 100.00, 49, '2025-06-25 11:45:52', '2025-06-25 11:45:52'),
(320, 'Regular Size (Jollof Rice)', 125.00, 50, '2025-06-25 11:49:33', '2025-06-25 11:49:33'),
(321, 'Mini Size (Jollof Rice)', 80.00, 50, '2025-06-25 11:49:33', '2025-06-25 11:49:33'),
(322, 'Regular Size (Fried Rice)', 125.00, 50, '2025-06-25 11:49:33', '2025-06-25 11:49:33'),
(323, 'Mini Size (Fried Rice)', 80.00, 50, '2025-06-25 11:49:33', '2025-06-25 11:49:33'),
(324, 'Regular Size (Noodles)', 125.00, 50, '2025-06-25 11:49:33', '2025-06-25 11:49:33'),
(325, 'Mini Size (Noodles)', 80.00, 50, '2025-06-25 11:49:33', '2025-06-25 11:49:33'),
(326, 'Regular Size (Jollof Rice)', 125.00, 51, '2025-06-25 11:50:42', '2025-06-25 11:50:42'),
(327, 'Mini Size (Jollof Rice)', 80.00, 51, '2025-06-25 11:50:42', '2025-06-25 11:50:42'),
(328, 'Regular Size (Fried Rice)', 125.00, 51, '2025-06-25 11:50:42', '2025-06-25 11:50:42'),
(329, 'Mini Size (Fried Rice)', 80.00, 51, '2025-06-25 11:50:42', '2025-06-25 11:50:42'),
(330, 'Regular Size (Noodles)', 125.00, 51, '2025-06-25 11:50:42', '2025-06-25 11:50:42'),
(331, 'Mini Size (Noodles)', 80.00, 51, '2025-06-25 11:50:42', '2025-06-25 11:50:42');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2014_04_02_193005_create_translations_table', 1),
(5, '2024_03_13_000002_create_expense_categories_table', 1),
(6, '2024_07_01_060651_add_two_factor_columns_to_users_table', 1),
(7, '2024_07_01_060707_create_personal_access_tokens_table', 1),
(8, '2024_07_02_064204_create_menus_table', 1),
(9, '2024_07_12_070634_create_areas_table', 1),
(10, '2024_07_16_103816_create_orders_table', 1),
(11, '2024_07_21_083459_add_user_type_column', 1),
(12, '2024_07_24_131631_create_payments_table', 1),
(13, '2024_07_31_081306_add_email_otp_column', 1),
(14, '2024_08_02_061808_create_countries_table', 1),
(15, '2024_08_02_071637_create_restaurant_settings_table', 1),
(16, '2024_08_04_104258_create_razorpay_payments_table', 1),
(17, '2024_08_05_092258_create_stripe_payments_table', 1),
(18, '2024_08_05_110157_create_payment_gateway_credentials_table', 1),
(19, '2024_08_13_033139_create_global_settings_table', 1),
(20, '2024_08_13_073129_update_settings_add_envato_key', 1),
(21, '2024_08_13_073129_update_settings_add_support_key', 1),
(22, '2024_08_14_073129_update_settings_add_email', 1),
(23, '2024_08_14_073129_update_settings_add_last_verified_key', 1),
(24, '2024_09_13_081726_create_modules_table', 1),
(25, '2024_09_14_130619_create_permission_tables', 1),
(26, '2024_09_27_071339_create_reservations_table', 1),
(27, '2024_10_02_090924_create_email_settings_table', 1),
(28, '2024_10_03_073837_create_notification_settings_table', 1),
(29, '2024_10_11_100539_create_branches_table', 1),
(30, '2024_10_14_121135_create_onboarding_steps_table', 1),
(31, '2024_10_15_071238_add_restaurant_hash_column', 1),
(32, '2024_10_15_071238_storage', 1),
(33, '2024_10_15_100639_create_restaurant_payments_table', 1),
(34, '2024_10_27_101326_create_packages_table', 1),
(35, '2024_11_02_112920_create_language_settings_table', 1),
(36, '2024_11_02_120314_create_flags_table', 1),
(37, '2024_11_02_120314_email_settings_table', 1),
(38, '2024_11_08_071617_add_customer_login_required_column', 1),
(39, '2024_11_08_093032_create_superadmin_payment_gateways_table', 1),
(40, '2024_11_08_133506_add_stripe_column_for_license', 1),
(41, '2024_11_12_055119_create_delivery_executives_table', 1),
(42, '2024_11_12_055632_add_order_types_column', 1),
(43, '2024_11_12_060500_create_order_histories_table', 1),
(44, '2024_11_12_060500_global_license_type_table', 1),
(45, '2024_11_12_060500_global_purchase_on_table', 1),
(46, '2024_11_12_060500_global_setting_timezone_table', 1),
(47, '2024_11_17_052707_currency_position', 1),
(48, '2024_11_17_052707_move_qr_code', 1),
(49, '2024_11_19_113852_add_is_active_to_restaurants_table', 1),
(50, '2024_11_20_114816_add_staff_welcome_email_notification', 1),
(51, '2024_11_25_061322_create_pusher_settings_table', 1),
(52, '2024_11_26_090216_create_global_currencies_table', 1),
(53, '2024_12_03_085842_add_about_us_column', 1),
(54, '2024_12_03_104817_add_currency_id_packages', 1),
(55, '2024_12_04_080223_add_allow_customer_delivery_orders', 1),
(56, '2024_12_04_115601_add_preparation_time_column', 1),
(57, '2024_12_11_110000_create_tables_for_subscription_table', 1),
(58, '2024_12_11_131225_add_disable_landing_site_columns', 1),
(59, '2024_12_12_090840_create_waiter_requests_table', 1),
(60, '2024_12_13_090840_add_domain_global_setting', 1),
(61, '2024_12_16_080201_create_lifetime_subscriptions_for_paid_restaurants', 1),
(62, '2024_12_23_124452_add_payment_enabled_columns_to_payment_settings_table', 1),
(63, '2024_12_27_054246_add_table_reservation_default_status_to_restaurants_table', 1),
(64, '2024_12_30_074018_create_split_orders_table', 1),
(65, '2024_12_30_200942_create_restaurant_settings_table', 1),
(66, '2025_01_03_050139_add_social_media_links_to_reataurants_table', 1),
(67, '2025_01_03_093938_add_social_media_links_to_global_settings_table', 1),
(68, '2025_01_06_111550_create_receipt_settings_table', 1),
(69, '2025_01_09_073145_generate_qr_codes_for_existing_branches', 1),
(70, '2025_01_09_115652_update_receipt_settings_for_existing_restaurants', 1),
(71, '2025_01_10_064103_add_table_required_column_to_customer_settings_table', 1),
(72, '2025_01_10_100552_insert_to_file_storage_settings_default_values', 1),
(73, '2025_01_11_063817_add_default_currency_column', 1),
(74, '2025_01_16_125322_add_is_enabled_to_menu_items_table', 1),
(75, '2025_01_16_131100_regenrate_qr_codes', 1),
(76, '2025_01_20_000000_add_restaurant_id_to_roles', 1),
(77, '2025_01_20_071544_add_branch_limit_to_packages_table', 1),
(78, '2025_01_20_091630_update_item_type', 1),
(79, '2025_01_20_125429_add_discount_columns_to_orders_table', 1),
(80, '2025_01_21_064139_add_show_logo_text_column', 1),
(81, '2025_01_21_064256_add_offline_payment', 1),
(82, '2025_01_21_132218_fix_user_roles', 1),
(83, '2025_01_22_114720_add_show_tax_to_receipt_setting', 1),
(84, '2025_01_23_065746_create_modifier_groups_table', 1),
(85, '2025_01_23_085333_create_restaurant_taxes_table', 1),
(86, '2025_01_23_090554_create_modifier_options_table', 1),
(87, '2025_01_23_094318_create_item_modifiers_table', 1),
(88, '2025_01_23_121154_create_order_item_modifier_options_table', 1),
(89, '2025_01_27_065822_add_balance_column_to_payment', 1),
(90, '2025_01_28_111039_add_allow_dine_in_orders_to_restaurant', 1),
(91, '2025_01_30_050755_add_yelp_icon_to_global_settings', 1),
(92, '2025_01_30_055744_add_yelp_link_to_restaurants', 1),
(93, '2025_01_30_100556_fix_package_price_length', 1),
(94, '2025_01_30_104043_add_meta_data_to_global_settings', 1),
(95, '2025_02_03_062109_add_is_cash_payment_enabled_to_payment', 1),
(96, '2025_02_04_140538_add_transaction_id_kot', 1),
(97, '2025_02_15_121956_add_hide_new_orders_option_to_restaurant', 1),
(98, '2025_02_17_052801_create_restaurant_charges_settings_table', 1),
(99, '2025_02_17_093729_add_favicon_to_restaurant', 1),
(100, '2025_02_19_091730_update_menu_name_to_json', 1),
(101, '2025_02_20_095321_add_waiter_request_options_to_restaurant', 1),
(102, '2025_02_21_051534_add_hash_to_global_settings_table', 1),
(103, '2025_02_21_102116_add_column_to_settings', 1),
(104, '2025_02_24_063827_add_payment_qr_to_receipt_settings', 1),
(105, '2025_02_24_111946_add_permissions_to_customers', 1),
(106, '2025_03_04_114535_add_is_enabled_to_restaurant_charges', 1),
(107, '2025_03_10_055100_add_tip_column_to_orders_table', 1),
(108, '2025_03_10_100727_add_is_pwa_intall_alert_show_column_in_restaurants_table', 1),
(109, '2025_03_17_090450_add_meta_title_to_global_settings', 1),
(110, '2025_03_18_044410_create_expenses_table', 1),
(111, '2025_03_19_092459_create_custom_menus_table', 1),
(112, '2025_03_19_103047_update_additional_modules', 1),
(113, '2025_03_24_084350_add_show_payments_column_to_receipt_settings_table', 1),
(114, '2025_04_01_050059_add_branch_id_to_expense_category', 1),
(115, '2025_04_01_051356_add_branch_id_to_expenses', 1),
(116, '2025_04_02_071911_update_kot_status_enum', 1),
(117, '2025_04_07_112351_add_payment_recived_status_to_orders_table', 1),
(118, '2025_04_08_063624_update_meta_keywords', 1),
(119, '2025_04_10_065753_add_flutterwave_payment_gateway_columns_and_tables', 2),
(120, '2025_04_15_084543_create_front_details_table', 2),
(121, '2025_04_22_065157_create_front_reviews_setting_table', 2),
(122, '2025_04_22_091055_create_branch_delivery_settings_table', 2),
(123, '2025_04_22_091146_create_customer_addresses_table', 2),
(124, '2025_04_22_091223_create_delivery_fee_tiers_table', 2),
(125, '2025_04_22_091258_add_delivery_columns_to_orders_table', 2),
(126, '2025_04_29_102014_add_landing_type_column_in_global_settings_table', 2),
(127, '2025_04_29_114538_add_front_data_in_front_details_table', 2),
(128, '2025_05_23_124746_add_in_stock_column', 2),
(129, '2025_05_26_105151_relocate_map_api_key_to_superadmin_settings', 2),
(130, '2025_05_30_081624_add_show_item_on_customer_site_to_menu_items', 2),
(131, '2025_06_02_081928_add_session_driver_column_to_global_settings', 2),
(132, '2025_06_03_095923_add_status_column_kot_item', 2),
(133, '2025_01_01_121040_inventory_global_settings', 3),
(134, '2025_02_06_095827_create_invetory_module_table', 3),
(135, '2025_02_12_create_purchase_orders_tables', 3),
(136, '2025_03_02_181226_create_inventory_settings_table', 3),
(137, '2025_03_05_100018_create_inventory_settings_table', 3),
(138, '2025_03_19_113535_soft_delete_supplier', 3),
(139, '2025_03_20_113535_permission_supplier', 3),
(140, '2024_01_01_create_printers_table', 4),
(141, '2025_05_14_094039_update_printers_settings_columns_to_printers_table', 4),
(142, '2025_05_15_071027_create_kot_places_table', 4),
(143, '2025_05_26_114443_modify_kot_places_table', 4),
(144, '2025_06_02_112147_add_columns_to_superadmin_payment_gateways_table', 4),
(145, '2025_06_02_112903_add_paypal_payment_column_to_payment_gateway_credentials', 4),
(146, '2025_06_02_113108_create_paypal_payments_table', 4),
(147, '2025_06_02_114326_add_paypal_payment_in_payment_method_to_payments', 4),
(148, '2025_06_04_065130_add_columns_payfast_in_superadmin_payment_gateways_table', 4),
(149, '2025_06_05_063256_add_sort_order_columns_in_menu_and_items', 4),
(150, '2025_06_05_112055_create_kot_settings_table', 4),
(151, '2025_06_06_050159_add_payfast_payment_column_to_payment_gateway_credentials', 4),
(152, '2025_06_06_051204_create_payfast_payments_table', 4),
(153, '2025_06_10_093131_change_delete_cascade_for_orders', 4),
(154, '2025_06_11_061716_add_uuid_to_orders_table', 4),
(155, '2025_06_11_062354_add_columns_paystack_in_superadmin_payment_gateways_table', 4),
(156, '2025_06_13_112612_add_phone_to_users', 4),
(157, '2025_06_13_113200_add_column_paystack_payments_to_payment_gateway_credentials', 4),
(158, '2025_06_13_113240_create_paystack_payments_table', 4),
(159, '2025_06_16_104533_add_note_columns_to_kot_items_and_order_items', 4),
(160, '2025_06_18_112425_add_payment_gateways_to_restaurants_table', 4),
(161, '2025_06_19_070518_add_position_to_custom_menus_table', 4),
(162, '2025_06_20_060452_add_columns_to_branch_table', 4),
(163, '2025_06_20_092521_add_others_type_to_payments_table', 4),
(164, '2025_06_23_101041_create_kot_cancel_reasons_table', 4),
(165, '2025_06_23_120021_update_kot_place_id_in_menu_items', 4),
(166, '2025_06_24_092521_disable_printer', 4),
(167, '2025_06_24_092811_add_column_cancel_kot_reason_to_kots_table', 4),
(168, '2025_06_24_102830_update_enum_status_to_kots_table', 4),
(169, '2025_06_25_094311_add_column_cancellation_reason_to_orders_table', 4),
(170, '2025_06_27_084541_insert_sample_kot_cancel_reasons_data', 4),
(171, '2025_07_01_112529_create_print_jobs_table', 4),
(172, '2025_07_01_133114_add_placed_via_column_orders_table', 4),
(173, '2025_07_02_105440_add_translations_columns_for_modifier_group', 4),
(174, '2025_07_02_114040_add_unique_hash_to_branches_table', 4),
(175, '2025_07_03_123829_update_kot_place_id_for_cloned_menu_items', 4),
(176, '2025_07_04_131541_create_desktop_applications_table', 4),
(177, '2025_07_07_070122_add_pusher_broadcast_to_pusher_settings_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(4, 'App\\Models\\User', 3),
(6, 'App\\Models\\User', 4),
(8, 'App\\Models\\User', 5),
(10, 'App\\Models\\User', 6),
(11, 'App\\Models\\User', 7),
(11, 'App\\Models\\User', 8),
(12, 'App\\Models\\User', 9),
(12, 'App\\Models\\User', 10);

-- --------------------------------------------------------

--
-- Table structure for table `modifier_groups`
--

CREATE TABLE `modifier_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modifier_group_translations`
--

CREATE TABLE `modifier_group_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `modifier_group_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(191) NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modifier_options`
--

CREATE TABLE `modifier_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `modifier_group_id` bigint(20) UNSIGNED NOT NULL,
  `name` text DEFAULT NULL,
  `price` decimal(16,2) NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `is_preselected` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Menu', NULL, NULL),
(2, 'Menu Item', NULL, NULL),
(3, 'Item Category', NULL, NULL),
(4, 'Area', NULL, NULL),
(5, 'Table', NULL, NULL),
(6, 'Reservation', NULL, NULL),
(7, 'KOT', NULL, NULL),
(8, 'Order', NULL, NULL),
(9, 'Customer', NULL, NULL),
(10, 'Staff', NULL, NULL),
(11, 'Payment', NULL, NULL),
(12, 'Report', NULL, NULL),
(13, 'Settings', NULL, NULL),
(14, 'Delivery Executive', NULL, NULL),
(15, 'Waiter Request', NULL, NULL),
(16, 'Expense', NULL, NULL),
(17, 'Inventory', '2025-06-16 08:05:10', '2025-06-16 08:05:10');

-- --------------------------------------------------------

--
-- Table structure for table `notification_settings`
--

CREATE TABLE `notification_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` varchar(191) NOT NULL,
  `send_email` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_settings`
--

INSERT INTO `notification_settings` (`id`, `restaurant_id`, `type`, `send_email`, `created_at`, `updated_at`) VALUES
(1, 1, 'order_received', 1, NULL, NULL),
(2, 1, 'reservation_confirmed', 1, NULL, NULL),
(3, 1, 'new_reservation', 1, NULL, NULL),
(4, 1, 'order_bill_sent', 1, NULL, NULL),
(5, 1, 'staff_welcome', 1, NULL, NULL),
(6, 2, 'order_received', 1, NULL, NULL),
(7, 2, 'reservation_confirmed', 1, NULL, NULL),
(8, 2, 'new_reservation', 1, NULL, NULL),
(9, 2, 'order_bill_sent', 1, NULL, NULL),
(10, 2, 'staff_welcome', 1, NULL, NULL),
(11, 3, 'order_received', 1, NULL, NULL),
(12, 3, 'reservation_confirmed', 1, NULL, NULL),
(13, 3, 'new_reservation', 1, NULL, NULL),
(14, 3, 'order_bill_sent', 1, NULL, NULL),
(15, 3, 'staff_welcome', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `offline_payment_methods`
--

CREATE TABLE `offline_payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offline_plan_changes`
--

CREATE TABLE `offline_plan_changes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `package_type` varchar(191) NOT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `pay_date` date DEFAULT NULL,
  `next_pay_date` date DEFAULT NULL,
  `invoice_id` bigint(20) UNSIGNED DEFAULT NULL,
  `offline_method_id` bigint(20) UNSIGNED DEFAULT NULL,
  `file_name` varchar(191) DEFAULT NULL,
  `status` enum('verified','pending','rejected') NOT NULL DEFAULT 'pending',
  `remark` text DEFAULT NULL,
  `description` mediumtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `onboarding_steps`
--

CREATE TABLE `onboarding_steps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `add_area_completed` tinyint(1) NOT NULL DEFAULT 0,
  `add_table_completed` tinyint(1) NOT NULL DEFAULT 0,
  `add_menu_completed` tinyint(1) NOT NULL DEFAULT 0,
  `add_menu_items_completed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `onboarding_steps`
--

INSERT INTO `onboarding_steps` (`id`, `branch_id`, `add_area_completed`, `add_table_completed`, `add_menu_completed`, `add_menu_items_completed`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 0, 0, 0, '2025-04-18 06:02:05', '2025-04-18 06:02:05'),
(2, 2, 0, 0, 0, 0, '2025-04-18 06:02:05', '2025-04-18 06:02:05'),
(3, 3, 1, 1, 1, 1, '2025-04-18 20:42:26', '2025-04-19 03:18:28'),
(4, 4, 1, 1, 1, 1, '2025-05-30 08:33:04', '2025-06-06 04:47:43');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_number` varchar(191) NOT NULL,
  `date_time` datetime NOT NULL,
  `table_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `number_of_pax` int(11) DEFAULT NULL,
  `waiter_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('draft','kot','billed','paid','canceled','payment_due','ready','out_for_delivery','delivered','pending_verification') NOT NULL DEFAULT 'kot',
  `placed_via` enum('pos','shop') DEFAULT NULL,
  `sub_total` decimal(16,2) NOT NULL,
  `tip_amount` decimal(16,2) DEFAULT 0.00,
  `tip_note` text DEFAULT NULL,
  `total` decimal(16,2) NOT NULL,
  `amount_paid` decimal(16,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_type` enum('dine_in','delivery','pickup') NOT NULL DEFAULT 'dine_in',
  `delivery_executive_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivery_address` text DEFAULT NULL,
  `delivery_time` datetime DEFAULT NULL,
  `estimated_delivery_time` datetime DEFAULT NULL,
  `split_type` enum('even','custom','items') DEFAULT NULL,
  `discount_type` varchar(191) DEFAULT NULL,
  `discount_value` decimal(16,2) DEFAULT NULL,
  `discount_amount` decimal(16,2) DEFAULT NULL,
  `order_status` varchar(191) NOT NULL DEFAULT 'placed',
  `delivery_fee` decimal(8,2) NOT NULL DEFAULT 0.00,
  `customer_lat` decimal(10,7) DEFAULT NULL,
  `customer_lng` decimal(10,7) DEFAULT NULL,
  `is_within_radius` tinyint(1) NOT NULL DEFAULT 0,
  `delivery_started_at` timestamp NULL DEFAULT NULL,
  `delivered_at` timestamp NULL DEFAULT NULL,
  `estimated_eta_min` int(11) DEFAULT NULL,
  `estimated_eta_max` int(11) DEFAULT NULL,
  `cancel_reason_id` bigint(20) UNSIGNED DEFAULT NULL,
  `cancel_reason_text` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `uuid`, `branch_id`, `order_number`, `date_time`, `table_id`, `customer_id`, `number_of_pax`, `waiter_id`, `status`, `placed_via`, `sub_total`, `tip_amount`, `tip_note`, `total`, `amount_paid`, `created_at`, `updated_at`, `order_type`, `delivery_executive_id`, `delivery_address`, `delivery_time`, `estimated_delivery_time`, `split_type`, `discount_type`, `discount_value`, `discount_amount`, `order_status`, `delivery_fee`, `customer_lat`, `customer_lng`, `is_within_radius`, `delivery_started_at`, `delivered_at`, `estimated_eta_min`, `estimated_eta_max`, `cancel_reason_id`, `cancel_reason_text`) VALUES
(3, '81acabb4-7e86-4943-acd7-51ce97115512', 3, '1', '2025-04-20 01:00:31', NULL, NULL, 1, 4, 'paid', NULL, 174.00, 0.00, NULL, 200.10, 200.10, '2025-04-20 00:59:31', '2025-07-12 20:16:59', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'served', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'fd94893b-8798-45eb-8941-8b0bad2886a4', 3, '2', '2025-04-20 01:09:25', NULL, NULL, 1, 4, 'paid', NULL, 344.00, 0.00, NULL, 395.60, 395.60, '2025-04-20 01:09:25', '2025-07-12 20:16:59', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'served', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(5, '00c5278e-ac6b-4265-835f-7dbb813b588c', 3, '3', '2025-04-21 01:06:42', NULL, NULL, 1, 4, 'paid', NULL, 89.00, 0.00, NULL, 102.35, 102.35, '2025-04-21 01:06:13', '2025-07-12 20:16:59', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'served', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'aea414ba-ad17-4a14-a268-08e2a2f50994', 3, '4', '2025-04-21 01:10:58', NULL, NULL, 1, 4, 'kot', NULL, 259.00, 0.00, NULL, 297.85, 0.00, '2025-04-21 01:09:25', '2025-07-12 20:16:59', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'served', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'cfafb0a1-c3eb-42c7-91be-089c0b88fe0c', 3, '5', '2025-04-29 12:01:23', NULL, NULL, 1, 4, 'kot', NULL, 89.00, 0.00, NULL, 102.35, 0.00, '2025-04-29 12:01:23', '2025-07-12 20:16:59', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'b0ba6f22-30da-4a18-994f-b1db1cbdd6d0', 3, '6', '2025-04-29 12:07:42', NULL, NULL, 1, 4, 'billed', NULL, 89.00, 0.00, NULL, 102.35, 0.00, '2025-04-29 12:07:42', '2025-07-12 20:16:59', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'd08b6576-fddc-4a65-b3df-694564ae93b1', 3, '7', '2025-04-29 12:08:32', NULL, NULL, NULL, 4, 'billed', NULL, 89.00, 0.00, NULL, 102.35, 0.00, '2025-04-29 12:08:32', '2025-07-12 20:16:59', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(10, '9a383d4b-27f7-4c4f-b393-3af9790a2546', 3, '8', '2025-04-29 12:09:08', NULL, NULL, NULL, 4, 'billed', NULL, 89.00, 0.00, NULL, 102.35, 0.00, '2025-04-29 12:09:08', '2025-07-12 20:16:59', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'e14da8cb-d17e-4dfe-9231-fdd44e2e1605', 3, '9', '2025-04-29 12:11:37', NULL, NULL, NULL, 4, 'paid', NULL, 174.00, 0.00, NULL, 200.10, 200.10, '2025-04-29 12:10:27', '2025-07-12 20:16:59', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'served', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(12, '6db32b0e-283d-4514-b6f6-49cb6344b14e', 3, '10', '2025-04-29 12:21:59', NULL, NULL, 1, 4, 'billed', NULL, 85.00, 0.00, NULL, 97.75, 0.00, '2025-04-29 12:16:10', '2025-07-12 20:16:59', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'bde452d9-8325-4ea0-a283-7cd737f703bd', 3, '11', '2025-04-29 12:48:25', NULL, NULL, 1, 4, 'paid', NULL, 174.00, 0.00, NULL, 200.10, 200.10, '2025-04-29 12:43:35', '2025-07-12 20:16:59', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'served', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(14, '2fdd2279-4eba-4214-9eae-0e95e5e9f5c9', 4, '1', '2025-06-13 23:03:14', NULL, NULL, NULL, NULL, 'kot', NULL, 115.00, 0.00, NULL, 115.00, 0.00, '2025-06-13 23:03:14', '2025-07-12 20:16:59', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'placed', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'c353bc7b-45f5-48d7-b075-d1bc8c14fcfa', 4, '2', '2025-06-13 23:07:45', NULL, NULL, NULL, NULL, 'kot', NULL, 270.00, 0.00, NULL, 270.00, 0.00, '2025-06-13 23:07:45', '2025-07-12 20:16:59', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'placed', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'a9b51fa4-ed0d-4f42-9ed3-0414cc1f7dcd', 4, '3', '2025-06-13 23:20:00', NULL, NULL, NULL, NULL, 'kot', NULL, 215.00, 0.00, NULL, 215.00, 0.00, '2025-06-13 23:20:00', '2025-07-12 20:16:59', 'pickup', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'placed', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'f514a2cc-b233-419a-bb80-671ecb3131c6', 4, '4', '2025-06-13 23:23:16', NULL, NULL, NULL, NULL, 'kot', NULL, 230.00, 0.00, NULL, 230.00, 0.00, '2025-06-13 23:23:16', '2025-07-12 20:16:59', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'placed', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'a5bb67f3-9391-45f2-b0d9-28be38931e94', 4, '5', '2025-06-14 06:27:00', NULL, NULL, NULL, NULL, 'kot', NULL, 100.00, 0.00, NULL, 100.00, 0.00, '2025-06-14 06:27:00', '2025-07-12 20:16:59', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'placed', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'bcd2a24f-aec7-40ac-a6a4-620ba6564127', 4, '6', '2025-06-14 09:23:42', NULL, NULL, 1, 7, 'canceled', NULL, 70.00, 0.00, NULL, 70.00, 70.00, '2025-06-14 09:23:42', '2025-07-12 20:16:59', 'pickup', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'delivered', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(21, '9f0819a5-2b20-45a6-9e3f-a60fdcccad42', 4, '7', '2025-06-14 23:59:10', NULL, NULL, 1, 7, 'billed', NULL, 100.00, 0.00, NULL, 100.00, 0.00, '2025-06-14 23:59:10', '2025-07-12 20:16:59', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(22, '777d8f55-3649-4693-9366-8f229e9225ea', 4, '8', '2025-06-15 00:56:11', NULL, NULL, 1, 7, 'paid', NULL, 140.00, 0.00, NULL, 140.00, 140.00, '2025-06-15 00:56:11', '2025-07-12 20:16:59', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'served', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(25, '748a186b-69cc-49c4-b00e-24ee55f51d48', 4, '9', '2025-06-15 21:10:04', NULL, NULL, NULL, NULL, 'kot', NULL, 550.00, 0.00, NULL, 550.00, 0.00, '2025-06-15 21:10:04', '2025-07-12 20:16:59', 'pickup', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 'bf7a49e5-f380-4d08-9282-d204cdd2de05', 4, '10', '2025-06-17 08:17:23', NULL, NULL, NULL, NULL, 'kot', NULL, 355.00, 0.00, NULL, 355.00, 0.00, '2025-06-17 08:17:23', '2025-07-12 20:16:59', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'placed', 0.00, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(27, '62931968-3a48-4849-83f4-c329a6ee1102', 4, '11', '2025-06-26 08:12:42', NULL, NULL, NULL, NULL, 'billed', NULL, 135.00, 0.00, NULL, 135.00, 0.00, '2025-06-26 08:00:15', '2025-07-12 20:16:59', 'pickup', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 'e5f36f92-6c80-47e7-853a-b44b94310ed3', 4, '12', '2025-06-26 11:45:24', NULL, NULL, NULL, NULL, 'kot', NULL, 115.00, 0.00, NULL, 115.00, 0.00, '2025-06-26 11:45:24', '2025-07-12 20:16:59', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'placed', 0.00, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(30, '667d6446-d03b-4356-8b16-cca104ea394b', 4, '14', '2025-06-28 15:01:44', NULL, NULL, NULL, NULL, 'canceled', NULL, 115.00, 0.00, NULL, 115.00, 115.00, '2025-06-28 01:32:05', '2025-07-12 20:16:59', 'pickup', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ready_for_pickup', 0.00, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 'ff0c6bf2-b238-4539-92a3-cfd7b7c0c014', 4, '15', '2025-06-28 15:33:46', NULL, NULL, NULL, NULL, 'billed', NULL, 70.00, 0.00, NULL, 70.00, 0.00, '2025-06-28 15:29:08', '2025-07-12 20:16:59', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'served', 0.00, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(32, '7c4672aa-5422-48c5-8fa2-571bfd571e5d', 4, '16', '2025-07-12 01:11:39', NULL, NULL, NULL, NULL, 'canceled', NULL, 270.00, 0.00, NULL, 270.00, 0.00, '2025-07-12 01:11:39', '2025-07-12 20:16:59', 'pickup', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cancelled', 0.00, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(33, '923ad9ba-760b-407b-839d-8eb7727cfcf6', 4, '17', '2025-07-12 17:52:01', NULL, NULL, NULL, NULL, 'kot', NULL, 120.00, 0.00, NULL, 120.00, 0.00, '2025-07-12 17:52:01', '2025-07-12 20:16:59', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'placed', 0.00, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 'dbb4ea86-8823-432e-ab70-be80137a8da5', 4, '18', '2025-07-12 17:53:47', NULL, NULL, 1, 6, 'kot', NULL, 180.00, 0.00, NULL, 180.00, 0.00, '2025-07-12 17:53:47', '2025-07-12 20:16:59', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 'dfdb9ea2-1aae-4cda-b9c8-321c38b770f3', 4, '19', '2025-07-12 18:40:32', NULL, NULL, 1, 7, 'kot', NULL, 125.00, 0.00, NULL, 125.00, 0.00, '2025-07-12 18:40:32', '2025-07-12 20:16:59', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(36, '8104ab8e-542b-4b8b-8a34-ba034595bfc1', 4, '20', '2025-07-12 18:41:03', NULL, NULL, NULL, 7, 'kot', NULL, 70.00, 0.00, NULL, 70.00, 0.00, '2025-07-12 18:41:03', '2025-07-12 20:16:59', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(37, '2a5b7e11-6bd2-49d9-b7a5-75203ab47ace', 4, '21', '2025-07-12 19:12:28', NULL, NULL, NULL, NULL, 'kot', NULL, 175.00, 0.00, NULL, 175.00, 0.00, '2025-07-12 19:12:28', '2025-07-12 20:16:59', 'pickup', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'placed', 0.00, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(38, '94239687-766a-4979-a843-6ed30ccbf013', 4, '22', '2025-07-12 19:17:11', NULL, NULL, NULL, NULL, 'kot', NULL, 100.00, 0.00, NULL, 100.00, 0.00, '2025-07-12 19:17:11', '2025-07-12 20:16:59', 'pickup', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'placed', 0.00, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(39, '46ab120c-3f7a-4866-8094-eb8b45a75b3e', 4, '23', '2025-07-12 19:36:44', NULL, NULL, 1, 7, 'kot', NULL, 45.00, 0.00, NULL, 45.00, 0.00, '2025-07-12 19:36:44', '2025-07-12 20:16:59', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(40, '5e9193a1-8948-4a3b-a8ef-7b4dc927bdc6', 4, '24', '2025-07-12 19:37:18', NULL, NULL, NULL, 7, 'billed', NULL, 70.00, 0.00, NULL, 70.00, 0.00, '2025-07-12 19:37:18', '2025-07-12 20:16:59', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(41, '5e3337ec-d64a-49ba-8cfe-f35eb0dd1968', 4, '25', '2025-07-12 19:42:59', NULL, NULL, NULL, 7, 'billed', NULL, 70.00, 0.00, NULL, 70.00, 0.00, '2025-07-12 19:42:59', '2025-07-12 20:16:59', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(42, '810ad863-1ac4-4b92-8326-cb9ce8e46486', 4, '26', '2025-07-12 19:43:29', NULL, NULL, NULL, 7, 'billed', NULL, 30.00, 0.00, NULL, 30.00, 0.00, '2025-07-12 19:43:29', '2025-07-12 20:16:59', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(43, '7017d1cc-503d-4f49-afb1-374f7b942d8d', 4, '27', '2025-07-12 20:21:59', 2, NULL, 1, 6, 'paid', 'pos', 105.00, 0.00, NULL, 105.00, 105.00, '2025-07-12 20:21:59', '2025-07-12 20:22:05', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(44, '196a2df5-3efd-4aca-8d41-7be48780cbd1', 4, '28', '2025-07-12 21:18:24', NULL, NULL, 1, 7, 'kot', 'pos', 75.00, 0.00, NULL, 75.00, 0.00, '2025-07-12 21:18:24', '2025-07-12 21:18:24', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(45, '0e5797cc-c3a1-48ba-a338-9e3411d5404f', 4, '29', '2025-07-17 21:18:31', NULL, NULL, 1, 6, 'kot', 'pos', 160.00, 0.00, NULL, 160.00, 0.00, '2025-07-17 21:18:31', '2025-07-17 21:18:31', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 'e985cdd8-2774-4e1d-b9fc-f32e47040a6f', 4, '30', '2025-07-17 21:18:50', NULL, 1, NULL, 6, 'paid', 'pos', 170.00, 0.00, NULL, 170.00, 170.00, '2025-07-17 21:18:50', '2025-07-17 21:23:03', 'dine_in', NULL, 'plot 62. ', NULL, NULL, NULL, NULL, NULL, NULL, 'served', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(47, '652c97fd-6e19-496a-8c90-c2097891433b', 4, '31', '2025-07-20 02:13:11', NULL, NULL, 1, 6, 'kot', 'pos', 185.00, 0.00, NULL, 185.00, 0.00, '2025-07-20 02:13:11', '2025-07-20 02:13:11', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(48, '08fd1b74-7f9a-4c22-a8d5-b565ace12275', 4, '31', '2025-07-20 02:13:31', NULL, NULL, 1, 6, 'kot', 'pos', 185.00, 0.00, NULL, 185.00, 0.00, '2025-07-20 02:13:31', '2025-07-20 02:13:31', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(49, '7d61f78c-d12b-4b0f-8f9d-6828b60b94a6', 4, '31', '2025-07-20 02:15:25', NULL, NULL, 1, 6, 'paid', 'pos', 185.00, 0.00, NULL, 185.00, 185.00, '2025-07-20 02:13:46', '2025-07-20 02:17:04', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'served', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(50, '2a33bf53-bb1d-42c6-95b2-a2180838d519', 4, '32', '2025-07-20 02:19:32', 6, NULL, NULL, NULL, 'kot', 'shop', 25.00, 0.00, NULL, 25.00, 0.00, '2025-07-20 02:19:32', '2025-07-20 02:19:32', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'placed', 0.00, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(51, '6307b459-a5a1-4f95-a148-97bc52211bfd', 4, '33', '2025-07-23 17:20:18', NULL, NULL, NULL, NULL, 'kot', 'shop', 70.00, 0.00, NULL, 80.50, 0.00, '2025-07-23 17:20:18', '2025-07-23 17:32:11', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'placed', 0.00, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(52, '9f80beb7-1175-4533-8597-26feac959b5d', 4, '34', '2025-07-23 17:41:43', NULL, NULL, 1, 10, 'kot', 'pos', 140.00, 0.00, NULL, 161.00, 0.00, '2025-07-23 17:41:43', '2025-07-23 17:41:43', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(53, '068fe81d-b955-40c3-aa1e-f7e1218b33d5', 4, '35', '2025-07-23 17:42:13', NULL, NULL, NULL, 10, 'billed', 'pos', 15.00, 0.00, NULL, 17.25, 0.00, '2025-07-23 17:42:13', '2025-07-23 17:42:13', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 'c933d1b6-4b05-4cc2-81de-dbd30483e4d7', 4, '36', '2025-07-23 18:04:26', NULL, NULL, 1, 10, 'paid', 'pos', 10.00, 0.00, NULL, 11.50, 11.50, '2025-07-23 18:04:26', '2025-07-23 18:05:02', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(55, '41d572fc-2216-48cb-a029-1427aee988d8', 4, '37', '2025-07-23 18:06:13', NULL, NULL, NULL, 10, 'billed', 'pos', 10.00, 0.00, NULL, 11.50, 0.00, '2025-07-23 18:06:13', '2025-07-23 18:07:07', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'served', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(56, 'f2ed1f98-bbf7-4ca3-8ad0-12131d5de006', 4, '38', '2025-07-23 18:15:05', NULL, NULL, 1, 10, 'paid', 'pos', 15.00, 0.00, NULL, 17.25, 17.25, '2025-07-23 18:15:05', '2025-07-23 18:16:53', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(57, '39d4b089-122b-4405-8a96-85c32c4c2b26', 4, '39', '2025-07-23 18:26:13', NULL, NULL, 1, 10, 'paid', 'pos', 70.00, 0.00, NULL, 80.50, 80.50, '2025-07-23 18:26:13', '2025-07-23 18:26:29', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(58, '7ed62039-ce08-4368-8213-d9bffffd6149', 4, '40', '2025-07-23 18:34:42', NULL, NULL, 1, 10, 'billed', 'pos', 15.00, 0.00, NULL, 17.25, 0.00, '2025-07-23 18:34:42', '2025-07-23 18:34:42', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 'f72861b2-910a-49c9-9b9b-d0818a496816', 4, '41', '2025-07-23 18:39:26', NULL, NULL, 1, 10, 'paid', 'pos', 10.00, 0.00, NULL, 11.50, 11.50, '2025-07-23 18:39:26', '2025-07-23 18:39:38', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(60, '38f6d977-faa0-4932-98ae-e4d126ee80f2', 4, '42', '2025-07-23 18:46:54', NULL, 3, 1, 10, 'paid', 'pos', 63.75, 0.00, NULL, 73.31, 73.31, '2025-07-23 18:46:54', '2025-07-23 18:48:24', 'dine_in', NULL, 'To Absa', NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(61, 'f3fbacf7-b016-47fa-bb3d-3be1b31e94fd', 4, '43', '2025-07-23 18:52:39', NULL, NULL, 1, 10, 'kot', 'pos', 70.00, 0.00, NULL, 80.50, 0.00, '2025-07-23 18:52:39', '2025-07-23 18:52:39', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(62, 'abdf52ba-55e0-4508-9043-c867c35e559a', 4, '44', '2025-07-23 18:53:30', NULL, NULL, NULL, 10, 'paid', 'pos', 140.00, 0.00, NULL, 161.00, 161.00, '2025-07-23 18:53:30', '2025-07-23 18:53:44', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'served', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(63, 'a914f9ff-eec3-42f5-8b7e-9a61cc4bd218', 4, '45', '2025-07-23 19:18:16', NULL, NULL, 1, 10, 'billed', 'pos', 0.00, 0.00, NULL, 0.00, 0.00, '2025-07-23 18:57:45', '2025-07-23 19:19:03', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(64, 'f003a741-0e40-4f37-bad5-0d1172bc1210', 4, '46', '2025-07-23 19:16:12', NULL, NULL, 1, 10, 'billed', 'pos', 100.00, 0.00, NULL, 115.00, 0.00, '2025-07-23 19:06:22', '2025-07-23 19:16:12', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'served', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(65, 'f952d7ca-4a78-4f3f-a3b8-ae89c4bf2364', 4, '47', '2025-07-23 19:14:59', NULL, NULL, 1, 10, 'billed', 'pos', 180.00, 0.00, NULL, 207.00, 0.00, '2025-07-23 19:13:50', '2025-07-23 19:14:59', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(66, 'a5b9a001-9a77-455d-a2ca-31094058a207', 4, '48', '2025-07-23 19:21:23', NULL, NULL, 1, 10, 'billed', 'pos', 70.00, 0.00, NULL, 80.50, 0.00, '2025-07-23 19:19:52', '2025-07-23 19:21:23', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(67, 'b47ae394-74dc-4e27-9742-0c3c545d7f8c', 4, '49', '2025-07-23 19:23:08', NULL, NULL, 1, 10, 'billed', 'pos', 45.00, 0.00, NULL, 51.75, 0.00, '2025-07-23 19:22:51', '2025-07-23 19:23:08', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(68, '6f41a860-90b8-4418-b297-37e6c313a474', 4, '50', '2025-07-23 19:24:28', NULL, NULL, 1, 10, 'paid', 'pos', 90.00, 0.00, NULL, 103.50, 103.50, '2025-07-23 19:24:28', '2025-07-23 19:24:59', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(69, 'fb2c8df3-0c9c-4fcd-9cc5-56d49d29dfc0', 4, '51', '2025-07-25 17:29:15', NULL, NULL, 1, 6, 'kot', 'pos', 70.00, 0.00, NULL, 80.50, 0.00, '2025-07-25 17:29:15', '2025-07-25 17:29:15', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(70, 'e5210d2e-57a0-414b-ac9c-d788cf5831a1', 4, '52', '2025-07-25 17:30:37', NULL, NULL, NULL, 6, 'kot', 'pos', 15.00, 0.00, NULL, 17.25, 0.00, '2025-07-25 17:30:37', '2025-07-25 17:30:37', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(71, 'f7746ed9-b9aa-4e2d-b11e-f9d304722b92', 4, '52', '2025-07-25 17:50:56', NULL, NULL, NULL, 6, 'kot', 'pos', 155.00, 0.00, NULL, 178.25, 0.00, '2025-07-25 17:39:54', '2025-07-25 17:50:56', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0.00, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(72, '06944def-869e-43dc-929f-f8aa1c0c8187', 4, '53', '2025-07-25 17:53:06', NULL, NULL, 1, 6, 'kot', 'pos', 15.00, 0.00, NULL, 17.25, 0.00, '2025-07-25 17:53:06', '2025-07-25 17:53:06', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(73, 'e22e1369-332a-4704-9789-5530d674e84c', 4, '54', '2025-07-26 16:20:51', NULL, NULL, 1, 6, 'billed', 'pos', 72.35, 0.00, NULL, 88.27, 0.00, '2025-07-26 16:20:51', '2025-07-26 16:20:51', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL),
(74, '478d9010-e8e9-4145-81de-eeba8a3be431', 4, '55', '2025-07-26 16:24:48', NULL, NULL, NULL, 6, 'billed', 'pos', 56.79, 0.00, NULL, 69.28, 0.00, '2025-07-26 16:24:48', '2025-07-26 16:24:48', 'dine_in', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'preparing', 0.00, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_charges`
--

CREATE TABLE `order_charges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `charge_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_histories`
--

CREATE TABLE `order_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `menu_item_id` bigint(20) UNSIGNED NOT NULL,
  `menu_item_variation_id` bigint(20) UNSIGNED DEFAULT NULL,
  `note` text DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(16,2) NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `branch_id`, `order_id`, `transaction_id`, `menu_item_id`, `menu_item_variation_id`, `note`, `quantity`, `price`, `amount`, `created_at`, `updated_at`) VALUES
(3, 3, 3, NULL, 1, NULL, NULL, 1, 85.00, 85.00, '2025-04-20 01:00:31', '2025-04-20 01:00:31'),
(4, 3, 3, NULL, 2, NULL, NULL, 1, 89.00, 89.00, '2025-04-20 01:00:31', '2025-04-20 01:00:31'),
(5, 3, 4, NULL, 2, NULL, NULL, 1, 89.00, 89.00, '2025-04-20 01:09:25', '2025-04-20 01:09:25'),
(6, 3, 4, NULL, 1, NULL, NULL, 3, 85.00, 255.00, '2025-04-20 01:09:25', '2025-04-20 01:09:25'),
(7, 3, 5, NULL, 2, NULL, NULL, 1, 89.00, 89.00, '2025-04-21 01:06:42', '2025-04-21 01:06:42'),
(8, 3, 8, NULL, 2, NULL, NULL, 1, 89.00, 89.00, '2025-04-29 12:07:42', '2025-04-29 12:07:42'),
(9, 3, 9, NULL, 2, NULL, NULL, 1, 89.00, 89.00, '2025-04-29 12:08:32', '2025-04-29 12:08:32'),
(10, 3, 10, NULL, 2, NULL, NULL, 1, 89.00, 89.00, '2025-04-29 12:09:08', '2025-04-29 12:09:08'),
(11, 3, 11, NULL, 1, NULL, NULL, 1, 85.00, 85.00, '2025-04-29 12:11:37', '2025-04-29 12:11:37'),
(12, 3, 11, NULL, 2, NULL, NULL, 1, 89.00, 89.00, '2025-04-29 12:11:37', '2025-04-29 12:11:37'),
(14, 3, 12, NULL, 1, NULL, NULL, 1, 85.00, 85.00, '2025-04-29 12:21:59', '2025-04-29 12:21:59'),
(15, 3, 13, NULL, 1, NULL, NULL, 1, 85.00, 85.00, '2025-04-29 12:48:25', '2025-04-29 12:48:25'),
(16, 3, 13, NULL, 2, NULL, NULL, 1, 89.00, 89.00, '2025-04-29 12:48:25', '2025-04-29 12:48:25'),
(17, 4, 14, 'TXN_684cae3234bc95.27908847_933981', 34, NULL, NULL, 1, 45.00, 45.00, '2025-06-13 23:03:14', '2025-06-13 23:03:14'),
(19, 4, 15, 'TXN_684caf413f5330.67744559_942314', 34, NULL, NULL, 6, 45.00, 270.00, '2025-06-13 23:07:45', '2025-06-13 23:07:45'),
(20, 4, 16, 'TXN_684cb2208d3da1.34231370_823250', 34, NULL, NULL, 2, 45.00, 90.00, '2025-06-13 23:20:00', '2025-06-13 23:20:00'),
(21, 4, 16, 'TXN_684cb2208d3da1.34231370_823250', 35, NULL, NULL, 1, 45.00, 45.00, '2025-06-13 23:20:00', '2025-06-13 23:20:00'),
(22, 4, 16, 'TXN_684cb2208d3da1.34231370_823250', 22, NULL, NULL, 1, 40.00, 40.00, '2025-06-13 23:20:00', '2025-06-13 23:20:00'),
(23, 4, 16, 'TXN_684cb2208d3da1.34231370_823250', 23, NULL, NULL, 1, 40.00, 40.00, '2025-06-13 23:20:00', '2025-06-13 23:20:00'),
(24, 4, 17, 'TXN_684cb2e41a4bf0.52555493_744307', 40, NULL, NULL, 2, 115.00, 230.00, '2025-06-13 23:23:16', '2025-06-13 23:23:16'),
(26, 4, 19, NULL, 6, NULL, NULL, 1, 70.00, 70.00, '2025-06-14 09:23:42', '2025-06-14 09:23:42'),
(29, 4, 22, NULL, 24, NULL, NULL, 1, 40.00, 40.00, '2025-06-15 00:56:11', '2025-06-15 00:56:11'),
(35, 4, 25, 'TXN_684f36ac9a50d7.48816438_951262', 56, 44, NULL, 1, 95.00, 95.00, '2025-06-15 21:10:04', '2025-06-15 21:10:04'),
(36, 4, 25, 'TXN_684f36ac9a50d7.48816438_951262', 55, 42, NULL, 1, 120.00, 120.00, '2025-06-15 21:10:04', '2025-06-15 21:10:04'),
(37, 4, 25, 'TXN_684f38057f4d90.93410689_444233', 39, NULL, NULL, 2, 45.00, 90.00, '2025-06-15 21:15:49', '2025-06-15 21:15:49'),
(38, 4, 25, 'TXN_684f38057f4d90.93410689_444233', 35, NULL, NULL, 2, 45.00, 90.00, '2025-06-15 21:15:49', '2025-06-15 21:15:49'),
(39, 4, 26, 'TXN_685124930ce854.43205179_979258', 40, NULL, NULL, 1, 115.00, 115.00, '2025-06-17 08:17:23', '2025-06-17 08:17:23'),
(40, 4, 26, 'TXN_685124930ce854.43205179_979258', 41, NULL, NULL, 1, 115.00, 115.00, '2025-06-17 08:17:23', '2025-06-17 08:17:23'),
(41, 4, 26, 'TXN_685124930ce854.43205179_979258', 42, NULL, NULL, 1, 125.00, 125.00, '2025-06-17 08:17:23', '2025-06-17 08:17:23'),
(42, 4, 25, 'TXN_68512628d18549.66698888_219094', 39, NULL, NULL, 1, 45.00, 45.00, '2025-06-17 08:24:08', '2025-06-17 08:24:08'),
(43, 4, 25, 'TXN_68512628d18549.66698888_219094', 20, 104, NULL, 1, 110.00, 110.00, '2025-06-17 08:24:08', '2025-06-17 08:24:08'),
(46, 4, 27, NULL, 35, NULL, NULL, 1, 45.00, 45.00, '2025-06-26 08:12:42', '2025-06-26 08:12:42'),
(47, 4, 27, NULL, 65, 68, NULL, 1, 90.00, 90.00, '2025-06-26 08:12:42', '2025-06-26 08:12:42'),
(48, 4, 28, 'TXN_685d32d43a9547.14979069_620011', 6, NULL, NULL, 1, 70.00, 70.00, '2025-06-26 11:45:24', '2025-06-26 11:45:24'),
(49, 4, 28, 'TXN_685d32d43a9547.14979069_620011', 7, NULL, NULL, 1, 45.00, 45.00, '2025-06-26 11:45:24', '2025-06-26 11:45:24'),
(53, 4, 30, NULL, 145, 230, NULL, 1, 115.00, 115.00, '2025-06-28 15:01:44', '2025-06-28 15:01:44'),
(55, 4, 31, NULL, 71, 81, NULL, 1, 70.00, 70.00, '2025-06-28 15:33:46', '2025-06-28 15:33:46'),
(56, 4, 32, 'TXN_6871b64b33f203.76548937_854626', 19, 244, NULL, 1, 90.00, 90.00, '2025-07-12 01:11:39', '2025-07-12 01:11:39'),
(57, 4, 32, 'TXN_6871b64b33f203.76548937_854626', 64, 307, NULL, 1, 90.00, 90.00, '2025-07-12 01:11:39', '2025-07-12 01:11:39'),
(58, 4, 32, 'TXN_6871b64b33f203.76548937_854626', 122, 147, NULL, 1, 90.00, 90.00, '2025-07-12 01:11:39', '2025-07-12 01:11:39'),
(59, 4, 33, 'TXN_6872a0c16e3138.50749586_274994', 149, NULL, NULL, 1, 60.00, 60.00, '2025-07-12 17:52:01', '2025-07-12 17:52:01'),
(60, 4, 33, 'TXN_6872a7c2c0c7c1.31735729_830251', 149, NULL, NULL, 1, 60.00, 60.00, '2025-07-12 18:21:54', '2025-07-12 18:21:54'),
(61, 4, 37, 'TXN_6872b39cd732a1.87666459_188382', 145, 231, NULL, 1, 80.00, 80.00, '2025-07-12 19:12:28', '2025-07-12 19:12:28'),
(62, 4, 37, 'TXN_6872b39cd732a1.87666459_188382', 58, 51, NULL, 1, 95.00, 95.00, '2025-07-12 19:12:28', '2025-07-12 19:12:28'),
(63, 4, 38, 'TXN_6872b4b7ba5ed4.03744313_424090', 140, 208, NULL, 1, 100.00, 100.00, '2025-07-12 19:17:11', '2025-07-12 19:17:11'),
(64, 4, 40, NULL, 6, NULL, NULL, 1, 70.00, 70.00, '2025-07-12 19:37:18', '2025-07-12 19:37:18'),
(65, 4, 41, NULL, 5, NULL, NULL, 1, 70.00, 70.00, '2025-07-12 19:42:59', '2025-07-12 19:42:59'),
(66, 4, 42, NULL, 4, NULL, NULL, 2, 15.00, 30.00, '2025-07-12 19:43:29', '2025-07-12 19:43:29'),
(67, 4, 43, NULL, 7, NULL, '', 1, 45.00, 45.00, '2025-07-12 20:21:59', '2025-07-12 20:21:59'),
(68, 4, 43, NULL, 8, NULL, '', 1, 60.00, 60.00, '2025-07-12 20:21:59', '2025-07-12 20:21:59'),
(69, 4, 44, NULL, 4, NULL, NULL, 1, 15.00, 15.00, '2025-07-12 21:18:24', '2025-07-12 21:18:24'),
(70, 4, 44, NULL, 8, NULL, NULL, 1, 60.00, 60.00, '2025-07-12 21:18:24', '2025-07-12 21:18:24'),
(71, 4, 46, NULL, 14, 92, NULL, 1, 70.00, 70.00, '2025-07-17 21:18:50', '2025-07-17 21:18:50'),
(72, 4, 46, NULL, 13, 246, NULL, 1, 100.00, 100.00, '2025-07-17 21:18:50', '2025-07-17 21:18:50'),
(73, 4, 47, NULL, 5, NULL, NULL, 1, 70.00, 70.00, '2025-07-20 02:13:11', '2025-07-20 02:13:11'),
(74, 4, 47, NULL, 6, NULL, NULL, 1, 70.00, 70.00, '2025-07-20 02:13:11', '2025-07-20 02:13:11'),
(75, 4, 47, NULL, 7, NULL, NULL, 1, 45.00, 45.00, '2025-07-20 02:13:11', '2025-07-20 02:13:11'),
(76, 4, 48, NULL, 5, NULL, NULL, 1, 70.00, 70.00, '2025-07-20 02:13:31', '2025-07-20 02:13:31'),
(77, 4, 48, NULL, 6, NULL, NULL, 1, 70.00, 70.00, '2025-07-20 02:13:31', '2025-07-20 02:13:31'),
(78, 4, 48, NULL, 7, NULL, NULL, 1, 45.00, 45.00, '2025-07-20 02:13:31', '2025-07-20 02:13:31'),
(79, 4, 49, NULL, 5, NULL, NULL, 1, 70.00, 70.00, '2025-07-20 02:15:25', '2025-07-20 02:15:25'),
(80, 4, 49, NULL, 6, NULL, NULL, 1, 70.00, 70.00, '2025-07-20 02:15:25', '2025-07-20 02:15:25'),
(81, 4, 49, NULL, 7, NULL, NULL, 1, 45.00, 45.00, '2025-07-20 02:15:25', '2025-07-20 02:15:25'),
(82, 4, 50, 'TXN_687c5234ae76b6.05985102_165365', 3, 82, '', 1, 10.00, 10.00, '2025-07-20 02:19:32', '2025-07-20 02:19:32'),
(83, 4, 50, 'TXN_687c5234ae76b6.05985102_165365', 4, NULL, '', 1, 15.00, 15.00, '2025-07-20 02:19:32', '2025-07-20 02:19:32'),
(84, 4, 51, 'TXN_688119d2b6a184.15803976_455219', 3, 82, '', 1, 10.00, 10.00, '2025-07-23 17:20:18', '2025-07-23 17:20:18'),
(85, 4, 51, 'TXN_68811c9b351bf8.86564440_430908', 4, NULL, '', 4, 15.00, 60.00, '2025-07-23 17:32:11', '2025-07-23 17:32:11'),
(86, 4, 53, NULL, 4, NULL, '', 1, 15.00, 15.00, '2025-07-23 17:42:13', '2025-07-23 17:42:13'),
(87, 4, 54, NULL, 3, 82, NULL, 1, 10.00, 10.00, '2025-07-23 18:04:26', '2025-07-23 18:04:26'),
(88, 4, 55, NULL, 3, 82, NULL, 1, 10.00, 10.00, '2025-07-23 18:06:13', '2025-07-23 18:06:13'),
(89, 4, 56, NULL, 4, NULL, '', 1, 15.00, 15.00, '2025-07-23 18:15:05', '2025-07-23 18:15:05'),
(90, 4, 57, NULL, 6, NULL, '', 1, 70.00, 70.00, '2025-07-23 18:26:13', '2025-07-23 18:26:13'),
(91, 4, 58, NULL, 4, NULL, '', 1, 15.00, 15.00, '2025-07-23 18:34:42', '2025-07-23 18:34:42'),
(92, 4, 59, NULL, 3, 82, NULL, 1, 10.00, 10.00, '2025-07-23 18:39:26', '2025-07-23 18:39:26'),
(93, 4, 60, NULL, 10, NULL, '', 1, 63.75, 63.75, '2025-07-23 18:46:54', '2025-07-23 18:46:54'),
(94, 4, 62, NULL, 5, NULL, '', 2, 70.00, 140.00, '2025-07-23 18:53:30', '2025-07-23 18:53:30'),
(95, 4, 65, NULL, 60, NULL, NULL, 3, 60.00, 180.00, '2025-07-23 19:14:59', '2025-07-23 19:14:59'),
(96, 4, 64, NULL, 17, 109, NULL, 1, 100.00, 100.00, '2025-07-23 19:16:12', '2025-07-23 19:16:12'),
(98, 4, 66, NULL, 6, NULL, NULL, 1, 70.00, 70.00, '2025-07-23 19:21:23', '2025-07-23 19:21:23'),
(99, 4, 67, NULL, 4, NULL, NULL, 3, 15.00, 45.00, '2025-07-23 19:23:08', '2025-07-23 19:23:08'),
(100, 4, 68, NULL, 12, 164, NULL, 1, 90.00, 90.00, '2025-07-23 19:24:28', '2025-07-23 19:24:28'),
(101, 4, 70, NULL, 4, NULL, NULL, 1, 15.00, 15.00, '2025-07-25 17:30:37', '2025-07-25 17:30:37'),
(104, 4, 73, NULL, 12, 164, NULL, 1, 72.35, 72.35, '2025-07-26 16:20:51', '2025-07-26 16:20:51'),
(105, 4, 74, NULL, 12, 165, NULL, 1, 56.79, 56.79, '2025-07-26 16:24:48', '2025-07-26 16:24:48');

-- --------------------------------------------------------

--
-- Table structure for table `order_item_modifier_options`
--

CREATE TABLE `order_item_modifier_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `modifier_option_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_places`
--

CREATE TABLE `order_places` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `printer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `type` varchar(191) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_places`
--

INSERT INTO `order_places` (`id`, `printer_id`, `branch_id`, `name`, `type`, `is_active`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Default POS Terminal', 'vegetarian', 1, 1, '2025-07-12 20:16:59', '2025-07-12 20:16:59'),
(2, 2, 2, 'Default POS Terminal', 'vegetarian', 1, 1, '2025-07-12 20:16:59', '2025-07-12 20:16:59'),
(3, 3, 3, 'Default POS Terminal', 'vegetarian', 1, 1, '2025-07-12 20:16:59', '2025-07-12 20:16:59'),
(4, 4, 4, 'Default POS Terminal', 'vegetarian', 1, 1, '2025-07-12 20:16:59', '2025-07-12 20:16:59');

-- --------------------------------------------------------

--
-- Table structure for table `order_taxes`
--

CREATE TABLE `order_taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `tax_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_taxes`
--

INSERT INTO `order_taxes` (`id`, `order_id`, `tax_id`) VALUES
(3, 3, 3),
(4, 4, 3),
(5, 5, 3),
(6, 8, 3),
(7, 9, 3),
(8, 10, 3),
(9, 11, 3),
(11, 12, 3),
(12, 13, 3),
(31, 73, 5),
(32, 73, 6),
(33, 73, 7),
(34, 73, 8),
(35, 73, 9),
(36, 74, 5),
(37, 74, 6),
(38, 74, 7),
(39, 74, 8),
(40, 74, 9);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_name` varchar(191) NOT NULL,
  `price` decimal(16,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` varchar(191) DEFAULT NULL,
  `annual_price` decimal(16,2) DEFAULT NULL,
  `monthly_price` decimal(16,2) DEFAULT NULL,
  `monthly_status` varchar(191) DEFAULT '1',
  `annual_status` varchar(191) DEFAULT '1',
  `stripe_annual_plan_id` varchar(191) DEFAULT NULL,
  `stripe_monthly_plan_id` varchar(191) DEFAULT NULL,
  `razorpay_annual_plan_id` varchar(191) DEFAULT NULL,
  `razorpay_monthly_plan_id` varchar(191) DEFAULT NULL,
  `flutterwave_annual_plan_id` varchar(191) DEFAULT NULL,
  `flutterwave_monthly_plan_id` varchar(191) DEFAULT NULL,
  `paystack_annual_plan_id` varchar(191) DEFAULT NULL,
  `paystack_monthly_plan_id` varchar(191) DEFAULT NULL,
  `stripe_lifetime_plan_id` varchar(191) DEFAULT NULL,
  `razorpay_lifetime_plan_id` varchar(191) DEFAULT NULL,
  `billing_cycle` tinyint(3) UNSIGNED DEFAULT NULL,
  `sort_order` int(10) UNSIGNED DEFAULT NULL,
  `is_private` tinyint(1) NOT NULL DEFAULT 0,
  `is_free` tinyint(1) NOT NULL DEFAULT 0,
  `is_recommended` tinyint(1) NOT NULL DEFAULT 0,
  `package_type` varchar(191) NOT NULL DEFAULT 'standard',
  `trial_status` tinyint(1) DEFAULT NULL,
  `trial_days` int(11) DEFAULT NULL,
  `trial_notification_before_days` int(11) DEFAULT NULL,
  `trial_message` varchar(191) DEFAULT NULL,
  `additional_features` longtext DEFAULT NULL,
  `branch_limit` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `package_name`, `price`, `created_at`, `updated_at`, `currency_id`, `description`, `annual_price`, `monthly_price`, `monthly_status`, `annual_status`, `stripe_annual_plan_id`, `stripe_monthly_plan_id`, `razorpay_annual_plan_id`, `razorpay_monthly_plan_id`, `flutterwave_annual_plan_id`, `flutterwave_monthly_plan_id`, `paystack_annual_plan_id`, `paystack_monthly_plan_id`, `stripe_lifetime_plan_id`, `razorpay_lifetime_plan_id`, `billing_cycle`, `sort_order`, `is_private`, `is_free`, `is_recommended`, `package_type`, `trial_status`, `trial_days`, `trial_notification_before_days`, `trial_message`, `additional_features`, `branch_limit`) VALUES
(1, 'Default', 0.00, '2025-04-18 06:02:05', '2025-04-18 06:02:05', 1, 'Its a default package and cannot be deleted', NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, 1, 0, 1, 0, 'default', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Subscription Package', 0.00, '2025-04-18 06:02:05', '2025-04-18 06:02:05', 1, 'This is a subscription package', 100.00, 10.00, '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, 2, 0, 0, 1, 'standard', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'Life Time', 199.00, '2025-04-18 06:02:05', '2025-07-12 18:12:30', 1, 'This is a lifetime access package', NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 3, 0, 0, 1, 'lifetime', NULL, NULL, NULL, NULL, '[\"Change Branch\",\"Export Report\",\"Table Reservation\",\"Payment Gateway Integration\",\"Theme Setting\"]', 1),
(4, 'Private Package', 0.00, '2025-04-18 06:02:05', '2025-04-18 06:02:05', 1, 'This is a private package', 50.00, 5.00, '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, 4, 1, 0, 0, 'standard', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 'Trial Package', 0.00, '2025-04-18 06:02:05', '2025-06-16 08:06:16', 1, 'This is a trial package', NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, 1, 0, 'trial', 1, 30, 5, '30 Days Free Trial', '[\"Change Branch\",\"Export Report\",\"Table Reservation\",\"Payment Gateway Integration\",\"Theme Setting\"]', 1);

-- --------------------------------------------------------

--
-- Table structure for table `package_modules`
--

CREATE TABLE `package_modules` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED DEFAULT NULL,
  `module_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `package_modules`
--

INSERT INTO `package_modules` (`id`, `package_id`, `module_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 1, 3, NULL, NULL),
(4, 1, 4, NULL, NULL),
(5, 1, 5, NULL, NULL),
(6, 1, 6, NULL, NULL),
(7, 1, 7, NULL, NULL),
(8, 1, 8, NULL, NULL),
(9, 1, 9, NULL, NULL),
(10, 1, 10, NULL, NULL),
(11, 1, 11, NULL, NULL),
(12, 1, 12, NULL, NULL),
(13, 1, 13, NULL, NULL),
(14, 1, 14, NULL, NULL),
(15, 1, 15, NULL, NULL),
(16, 1, 16, NULL, NULL),
(17, 2, 1, NULL, NULL),
(18, 2, 2, NULL, NULL),
(19, 2, 3, NULL, NULL),
(20, 2, 4, NULL, NULL),
(21, 2, 5, NULL, NULL),
(22, 2, 6, NULL, NULL),
(23, 2, 7, NULL, NULL),
(24, 2, 8, NULL, NULL),
(25, 2, 9, NULL, NULL),
(26, 2, 10, NULL, NULL),
(27, 2, 11, NULL, NULL),
(28, 2, 12, NULL, NULL),
(29, 2, 13, NULL, NULL),
(30, 2, 14, NULL, NULL),
(31, 2, 15, NULL, NULL),
(32, 2, 16, NULL, NULL),
(33, 3, 1, NULL, NULL),
(34, 3, 2, NULL, NULL),
(35, 3, 3, NULL, NULL),
(36, 3, 4, NULL, NULL),
(37, 3, 5, NULL, NULL),
(38, 3, 6, NULL, NULL),
(39, 3, 7, NULL, NULL),
(40, 3, 8, NULL, NULL),
(41, 3, 9, NULL, NULL),
(42, 3, 10, NULL, NULL),
(43, 3, 11, NULL, NULL),
(44, 3, 12, NULL, NULL),
(45, 3, 13, NULL, NULL),
(46, 3, 14, NULL, NULL),
(47, 3, 15, NULL, NULL),
(48, 3, 16, NULL, NULL),
(49, 4, 1, NULL, NULL),
(50, 4, 2, NULL, NULL),
(51, 4, 3, NULL, NULL),
(52, 4, 4, NULL, NULL),
(53, 4, 5, NULL, NULL),
(54, 4, 6, NULL, NULL),
(55, 4, 7, NULL, NULL),
(56, 4, 8, NULL, NULL),
(57, 4, 9, NULL, NULL),
(58, 4, 10, NULL, NULL),
(59, 4, 11, NULL, NULL),
(60, 4, 12, NULL, NULL),
(61, 4, 13, NULL, NULL),
(62, 4, 14, NULL, NULL),
(63, 4, 15, NULL, NULL),
(64, 4, 16, NULL, NULL),
(65, 5, 1, NULL, NULL),
(66, 5, 2, NULL, NULL),
(67, 5, 3, NULL, NULL),
(68, 5, 4, NULL, NULL),
(69, 5, 5, NULL, NULL),
(70, 5, 6, NULL, NULL),
(71, 5, 7, NULL, NULL),
(72, 5, 8, NULL, NULL),
(73, 5, 9, NULL, NULL),
(74, 5, 10, NULL, NULL),
(75, 5, 11, NULL, NULL),
(76, 5, 12, NULL, NULL),
(77, 5, 13, NULL, NULL),
(78, 5, 14, NULL, NULL),
(79, 5, 15, NULL, NULL),
(80, 5, 16, NULL, NULL),
(81, 5, 17, NULL, NULL),
(82, 3, 17, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('mercyakortiahemaa@gmail.com', '$2y$12$DP0RtzWGhthpi7OLowEujuncBIIIjRzzQqjwCcYVf/57O1IX9RAmy', '2025-07-12 19:53:25');

-- --------------------------------------------------------

--
-- Table structure for table `payfast_payments`
--

CREATE TABLE `payfast_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `payfast_payment_id` varchar(191) DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_status` enum('pending','completed','failed') NOT NULL DEFAULT 'pending',
  `payment_date` timestamp NULL DEFAULT NULL,
  `payment_error_response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payment_error_response`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `payment_method` enum('cash','upi','card','due','stripe','razorpay','flutterwave','paypal','payfast','others') NOT NULL DEFAULT 'cash',
  `amount` decimal(16,2) NOT NULL,
  `balance` decimal(16,2) DEFAULT 0.00,
  `transaction_id` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `branch_id`, `order_id`, `payment_method`, `amount`, `balance`, `transaction_id`, `created_at`, `updated_at`) VALUES
(1, 3, 3, 'upi', 200.10, 0.00, NULL, '2025-04-20 01:01:49', '2025-04-20 01:01:49'),
(2, 3, 4, 'cash', 395.60, 0.00, NULL, '2025-04-20 01:11:19', '2025-04-20 01:11:19'),
(3, 3, 5, 'cash', 102.35, 0.00, NULL, '2025-04-21 01:08:46', '2025-04-21 01:08:46'),
(4, 3, 11, 'cash', 200.10, 0.00, NULL, '2025-04-29 12:14:57', '2025-04-29 12:14:57'),
(5, 3, 13, 'cash', 200.10, 299.90, NULL, '2025-04-29 12:54:14', '2025-04-29 12:54:14'),
(7, 4, 22, 'cash', 140.00, 0.00, NULL, '2025-06-15 00:56:28', '2025-06-15 00:56:28'),
(9, 4, 43, 'cash', 105.00, 0.00, NULL, '2025-07-12 20:22:05', '2025-07-12 20:22:05'),
(10, 4, 46, 'cash', 170.00, 0.00, NULL, '2025-07-17 21:19:06', '2025-07-17 21:19:06'),
(11, 4, 49, 'cash', 185.00, 0.00, NULL, '2025-07-20 02:17:04', '2025-07-20 02:17:04'),
(12, 4, 54, 'cash', 11.50, 0.00, NULL, '2025-07-23 18:05:02', '2025-07-23 18:05:02'),
(13, 4, 56, 'cash', 17.25, 0.00, NULL, '2025-07-23 18:16:53', '2025-07-23 18:16:53'),
(14, 4, 57, 'cash', 80.50, 0.00, NULL, '2025-07-23 18:26:29', '2025-07-23 18:26:29'),
(15, 4, 59, 'cash', 11.50, 0.00, NULL, '2025-07-23 18:39:38', '2025-07-23 18:39:38'),
(16, 4, 60, 'card', 73.31, 0.00, NULL, '2025-07-23 18:48:24', '2025-07-23 18:50:03'),
(17, 4, 62, 'cash', 161.00, 0.00, NULL, '2025-07-23 18:53:37', '2025-07-23 18:53:37'),
(18, 4, 68, 'cash', 103.50, 0.00, NULL, '2025-07-23 19:24:59', '2025-07-23 19:24:59');

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateway_credentials`
--

CREATE TABLE `payment_gateway_credentials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `razorpay_key` text DEFAULT NULL,
  `razorpay_secret` text DEFAULT NULL,
  `razorpay_status` tinyint(1) NOT NULL DEFAULT 0,
  `stripe_key` text DEFAULT NULL,
  `stripe_secret` text DEFAULT NULL,
  `stripe_status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_dine_in_payment_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `is_delivery_payment_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `is_pickup_payment_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `is_cash_payment_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `is_qr_payment_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `is_offline_payment_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `offline_payment_detail` varchar(191) DEFAULT NULL,
  `qr_code_image` varchar(191) DEFAULT NULL,
  `flutterwave_status` tinyint(1) NOT NULL DEFAULT 0,
  `flutterwave_mode` enum('test','live') NOT NULL DEFAULT 'test',
  `test_flutterwave_key` varchar(191) DEFAULT NULL,
  `test_flutterwave_secret` varchar(191) DEFAULT NULL,
  `test_flutterwave_hash` varchar(191) DEFAULT NULL,
  `live_flutterwave_key` varchar(191) DEFAULT NULL,
  `live_flutterwave_secret` varchar(191) DEFAULT NULL,
  `live_flutterwave_hash` varchar(191) DEFAULT NULL,
  `flutterwave_webhook_secret_hash` varchar(191) DEFAULT NULL,
  `paypal_client_id` varchar(191) DEFAULT NULL,
  `paypal_secret` varchar(191) DEFAULT NULL,
  `paypal_status` tinyint(1) NOT NULL DEFAULT 0,
  `paypal_mode` enum('sandbox','live') NOT NULL DEFAULT 'sandbox',
  `sandbox_paypal_client_id` varchar(191) DEFAULT NULL,
  `sandbox_paypal_secret` varchar(191) DEFAULT NULL,
  `payfast_merchant_id` varchar(191) DEFAULT NULL,
  `payfast_merchant_key` varchar(191) DEFAULT NULL,
  `payfast_passphrase` varchar(191) DEFAULT NULL,
  `payfast_mode` enum('sandbox','live') NOT NULL DEFAULT 'sandbox',
  `payfast_status` tinyint(1) NOT NULL DEFAULT 0,
  `test_payfast_merchant_id` varchar(191) DEFAULT NULL,
  `test_payfast_merchant_key` varchar(191) DEFAULT NULL,
  `test_payfast_passphrase` varchar(191) DEFAULT NULL,
  `paystack_key` varchar(191) DEFAULT NULL,
  `paystack_secret` varchar(191) DEFAULT NULL,
  `paystack_merchant_email` varchar(191) DEFAULT NULL,
  `paystack_status` tinyint(1) NOT NULL DEFAULT 0,
  `paystack_mode` enum('sandbox','live') NOT NULL DEFAULT 'sandbox',
  `test_paystack_key` varchar(191) DEFAULT NULL,
  `test_paystack_secret` varchar(191) DEFAULT NULL,
  `test_paystack_merchant_email` varchar(191) DEFAULT NULL,
  `paystack_payment_url` varchar(191) DEFAULT 'https://api.paystack.co'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_gateway_credentials`
--

INSERT INTO `payment_gateway_credentials` (`id`, `restaurant_id`, `razorpay_key`, `razorpay_secret`, `razorpay_status`, `stripe_key`, `stripe_secret`, `stripe_status`, `created_at`, `updated_at`, `is_dine_in_payment_enabled`, `is_delivery_payment_enabled`, `is_pickup_payment_enabled`, `is_cash_payment_enabled`, `is_qr_payment_enabled`, `is_offline_payment_enabled`, `offline_payment_detail`, `qr_code_image`, `flutterwave_status`, `flutterwave_mode`, `test_flutterwave_key`, `test_flutterwave_secret`, `test_flutterwave_hash`, `live_flutterwave_key`, `live_flutterwave_secret`, `live_flutterwave_hash`, `flutterwave_webhook_secret_hash`, `paypal_client_id`, `paypal_secret`, `paypal_status`, `paypal_mode`, `sandbox_paypal_client_id`, `sandbox_paypal_secret`, `payfast_merchant_id`, `payfast_merchant_key`, `payfast_passphrase`, `payfast_mode`, `payfast_status`, `test_payfast_merchant_id`, `test_payfast_merchant_key`, `test_payfast_passphrase`, `paystack_key`, `paystack_secret`, `paystack_merchant_email`, `paystack_status`, `paystack_mode`, `test_paystack_key`, `test_paystack_secret`, `test_paystack_merchant_email`, `paystack_payment_url`) VALUES
(1, 1, NULL, NULL, 0, NULL, NULL, 0, '2025-04-18 06:02:05', '2025-07-17 21:44:32', 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'sandbox', NULL, NULL, NULL, NULL, NULL, 'sandbox', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'sandbox', NULL, NULL, NULL, 'https://api.paystack.co'),
(2, 1, NULL, NULL, 0, NULL, NULL, 0, '2025-04-18 06:02:05', '2025-07-17 21:44:32', 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'sandbox', NULL, NULL, NULL, NULL, NULL, 'sandbox', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'sandbox', NULL, NULL, NULL, 'https://api.paystack.co'),
(3, 2, NULL, NULL, 0, NULL, NULL, 0, '2025-04-18 20:42:26', '2025-07-17 21:44:32', 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'sandbox', NULL, NULL, NULL, NULL, NULL, 'sandbox', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'sandbox', NULL, NULL, NULL, 'https://api.paystack.co'),
(4, 3, NULL, NULL, 0, NULL, NULL, 0, '2025-05-30 08:33:04', '2025-07-17 21:44:32', 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'sandbox', NULL, NULL, NULL, NULL, NULL, 'sandbox', 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'sandbox', NULL, NULL, NULL, 'https://api.paystack.co');

-- --------------------------------------------------------

--
-- Table structure for table `paypal_payments`
--

CREATE TABLE `paypal_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `paypal_payment_id` varchar(191) DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_status` enum('pending','completed','failed') NOT NULL DEFAULT 'pending',
  `payment_date` timestamp NULL DEFAULT NULL,
  `payment_error_response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payment_error_response`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paystack_payments`
--

CREATE TABLE `paystack_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `paystack_payment_id` varchar(191) DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_status` enum('pending','completed','failed') NOT NULL DEFAULT 'pending',
  `payment_date` timestamp NULL DEFAULT NULL,
  `payment_error_response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payment_error_response`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
  `module_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `module_id`, `created_at`, `updated_at`) VALUES
(1, 'Create Menu', 'web', 1, NULL, NULL),
(2, 'Show Menu', 'web', 1, NULL, NULL),
(3, 'Update Menu', 'web', 1, NULL, NULL),
(4, 'Delete Menu', 'web', 1, NULL, NULL),
(5, 'Create Menu Item', 'web', 2, NULL, NULL),
(6, 'Show Menu Item', 'web', 2, NULL, NULL),
(7, 'Update Menu Item', 'web', 2, NULL, NULL),
(8, 'Delete Menu Item', 'web', 2, NULL, NULL),
(9, 'Create Item Category', 'web', 3, NULL, NULL),
(10, 'Show Item Category', 'web', 3, NULL, NULL),
(11, 'Update Item Category', 'web', 3, NULL, NULL),
(12, 'Delete Item Category', 'web', 3, NULL, NULL),
(13, 'Create Area', 'web', 4, NULL, NULL),
(14, 'Show Area', 'web', 4, NULL, NULL),
(15, 'Update Area', 'web', 4, NULL, NULL),
(16, 'Delete Area', 'web', 4, NULL, NULL),
(17, 'Create Table', 'web', 5, NULL, NULL),
(18, 'Show Table', 'web', 5, NULL, NULL),
(19, 'Update Table', 'web', 5, NULL, NULL),
(20, 'Delete Table', 'web', 5, NULL, NULL),
(21, 'Create Reservation', 'web', 6, NULL, NULL),
(22, 'Show Reservation', 'web', 6, NULL, NULL),
(23, 'Update Reservation', 'web', 6, NULL, NULL),
(24, 'Delete Reservation', 'web', 6, NULL, NULL),
(25, 'Manage KOT', 'web', 7, NULL, NULL),
(26, 'Create Order', 'web', 8, NULL, NULL),
(27, 'Show Order', 'web', 8, NULL, NULL),
(28, 'Update Order', 'web', 8, NULL, NULL),
(29, 'Delete Order', 'web', 8, NULL, NULL),
(30, 'Create Customer', 'web', 9, NULL, NULL),
(31, 'Show Customer', 'web', 9, NULL, NULL),
(32, 'Update Customer', 'web', 9, NULL, NULL),
(33, 'Delete Customer', 'web', 9, NULL, NULL),
(34, 'Create Staff Member', 'web', 10, NULL, NULL),
(35, 'Show Staff Member', 'web', 10, NULL, NULL),
(36, 'Update Staff Member', 'web', 10, NULL, NULL),
(37, 'Delete Staff Member', 'web', 10, NULL, NULL),
(38, 'Create Delivery Executive', 'web', 14, NULL, NULL),
(39, 'Show Delivery Executive', 'web', 14, NULL, NULL),
(40, 'Update Delivery Executive', 'web', 14, NULL, NULL),
(41, 'Delete Delivery Executive', 'web', 14, NULL, NULL),
(42, 'Show Payments', 'web', 11, NULL, NULL),
(43, 'Show Reports', 'web', 12, NULL, NULL),
(44, 'Manage Settings', 'web', 13, NULL, NULL),
(45, 'Manage Waiter Request', 'web', 15, NULL, NULL),
(46, 'Create Expense', 'web', 16, NULL, NULL),
(47, 'Show Expense', 'web', 16, NULL, NULL),
(48, 'Update Expense', 'web', 16, NULL, NULL),
(49, 'Delete Expense', 'web', 16, NULL, NULL),
(50, 'Create Expense Category', 'web', 16, NULL, NULL),
(51, 'Show Expense Category', 'web', 16, NULL, NULL),
(52, 'Update Expense Category', 'web', 16, NULL, NULL),
(53, 'Delete Expense Category', 'web', 16, NULL, NULL),
(54, 'Create Inventory Item', 'web', 17, NULL, NULL),
(55, 'Show Inventory Item', 'web', 17, NULL, NULL),
(56, 'Update Inventory Item', 'web', 17, NULL, NULL),
(57, 'Delete Inventory Item', 'web', 17, NULL, NULL),
(58, 'Create Inventory Movement', 'web', 17, NULL, NULL),
(59, 'Show Inventory Movement', 'web', 17, NULL, NULL),
(60, 'Update Inventory Movement', 'web', 17, NULL, NULL),
(61, 'Delete Inventory Movement', 'web', 17, NULL, NULL),
(62, 'Show Inventory Stock', 'web', 17, NULL, NULL),
(63, 'Create Unit', 'web', 17, NULL, NULL),
(64, 'Show Unit', 'web', 17, NULL, NULL),
(65, 'Update Unit', 'web', 17, NULL, NULL),
(66, 'Delete Unit', 'web', 17, NULL, NULL),
(67, 'Create Recipe', 'web', 17, NULL, NULL),
(68, 'Show Recipe', 'web', 17, NULL, NULL),
(69, 'Update Recipe', 'web', 17, NULL, NULL),
(70, 'Delete Recipe', 'web', 17, NULL, NULL),
(71, 'Create Purchase Order', 'web', 17, NULL, NULL),
(72, 'Show Purchase Order', 'web', 17, NULL, NULL),
(73, 'Update Purchase Order', 'web', 17, NULL, NULL),
(74, 'Delete Purchase Order', 'web', 17, NULL, NULL),
(75, 'Show Inventory Report', 'web', 17, NULL, NULL),
(76, 'Update Inventory Settings', 'web', 17, NULL, NULL),
(77, 'Show Supplier', 'web', 17, NULL, NULL),
(78, 'Create Supplier', 'web', 17, NULL, NULL),
(79, 'Update Supplier', 'web', 17, NULL, NULL),
(80, 'Delete Supplier', 'web', 17, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `printers`
--

CREATE TABLE `printers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `printing_choice` varchar(191) DEFAULT NULL,
  `kots` text DEFAULT NULL,
  `orders` text DEFAULT NULL,
  `print_format` varchar(191) DEFAULT NULL,
  `invoice_qr_code` int(11) DEFAULT NULL,
  `open_cash_drawer` enum('yes','no') DEFAULT NULL,
  `ipv4_address` varchar(191) DEFAULT NULL,
  `thermal_or_nonthermal` varchar(191) DEFAULT NULL,
  `share_name` varchar(191) DEFAULT NULL,
  `type` enum('network','windows','linux','default') DEFAULT NULL,
  `profile` enum('default','simple','SP2000','TEP-200M','P822D') DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `char_per_line` int(11) DEFAULT NULL,
  `ip_address` varchar(191) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `path` varchar(191) DEFAULT NULL,
  `printer_name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `printers`
--

INSERT INTO `printers` (`id`, `restaurant_id`, `branch_id`, `name`, `printing_choice`, `kots`, `orders`, `print_format`, `invoice_qr_code`, `open_cash_drawer`, `ipv4_address`, `thermal_or_nonthermal`, `share_name`, `type`, `profile`, `is_active`, `is_default`, `char_per_line`, `ip_address`, `port`, `path`, `printer_name`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Default Thermal Printer', 'browserPopupPrint', '[1]', '[1]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, '2025-07-12 20:16:59', '2025-07-12 20:17:00'),
(2, 1, 2, 'Default Thermal Printer', 'browserPopupPrint', '[2]', '[2]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, '2025-07-12 20:16:59', '2025-07-12 20:17:00'),
(3, 2, 3, 'Default Thermal Printer', 'browserPopupPrint', '[3]', '[3]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, '2025-07-12 20:16:59', '2025-07-12 20:17:00'),
(4, 3, 4, 'Default Thermal Printer', 'browserPopupPrint', '[4]', '[4]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, '2025-07-12 20:16:59', '2025-07-12 20:17:00');

-- --------------------------------------------------------

--
-- Table structure for table `print_jobs`
--

CREATE TABLE `print_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `printer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(191) NOT NULL DEFAULT 'pending',
  `response_printer` varchar(191) DEFAULT NULL,
  `payload` longtext NOT NULL,
  `printed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `po_number` varchar(191) NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `order_date` date NOT NULL,
  `expected_delivery_date` date DEFAULT NULL,
  `total_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `status` enum('draft','sent','received','partially_received','cancelled') NOT NULL DEFAULT 'draft',
  `notes` text DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_items`
--

CREATE TABLE `purchase_order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_order_id` bigint(20) UNSIGNED NOT NULL,
  `inventory_item_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `received_quantity` decimal(10,2) NOT NULL DEFAULT 0.00,
  `unit_price` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pusher_settings`
--

CREATE TABLE `pusher_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `beamer_status` tinyint(1) NOT NULL DEFAULT 0,
  `instance_id` varchar(191) DEFAULT NULL,
  `beam_secret` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `pusher_broadcast` tinyint(1) NOT NULL DEFAULT 0,
  `pusher_app_id` varchar(191) DEFAULT NULL,
  `pusher_key` varchar(191) DEFAULT NULL,
  `pusher_secret` varchar(191) DEFAULT NULL,
  `pusher_cluster` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pusher_settings`
--

INSERT INTO `pusher_settings` (`id`, `beamer_status`, `instance_id`, `beam_secret`, `created_at`, `updated_at`, `pusher_broadcast`, `pusher_app_id`, `pusher_key`, `pusher_secret`, `pusher_cluster`) VALUES
(1, 0, NULL, NULL, '2025-04-18 06:02:03', '2025-04-18 06:02:03', 0, NULL, NULL, NULL, NULL),
(2, 0, NULL, NULL, '2025-04-18 06:02:05', '2025-04-18 06:02:05', 0, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `razorpay_payments`
--

CREATE TABLE `razorpay_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `payment_date` datetime DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `payment_status` enum('pending','requested','declined','completed') NOT NULL DEFAULT 'pending',
  `payment_error_response` text DEFAULT NULL,
  `razorpay_order_id` varchar(191) DEFAULT NULL,
  `razorpay_payment_id` varchar(191) DEFAULT NULL,
  `razorpay_signature` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receipt_settings`
--

CREATE TABLE `receipt_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `show_customer_name` tinyint(1) NOT NULL DEFAULT 0,
  `show_customer_address` tinyint(1) NOT NULL DEFAULT 0,
  `show_table_number` tinyint(1) NOT NULL DEFAULT 0,
  `payment_qr_code` varchar(191) DEFAULT NULL,
  `show_payment_qr_code` tinyint(1) NOT NULL DEFAULT 0,
  `show_waiter` tinyint(1) NOT NULL DEFAULT 0,
  `show_total_guest` tinyint(1) NOT NULL DEFAULT 0,
  `show_restaurant_logo` tinyint(1) NOT NULL DEFAULT 0,
  `show_tax` tinyint(1) NOT NULL DEFAULT 0,
  `show_payment_details` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `receipt_settings`
--

INSERT INTO `receipt_settings` (`id`, `restaurant_id`, `show_customer_name`, `show_customer_address`, `show_table_number`, `payment_qr_code`, `show_payment_qr_code`, `show_waiter`, `show_total_guest`, `show_restaurant_logo`, `show_tax`, `show_payment_details`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 1, '2025-04-18 06:02:05', '2025-04-18 06:02:05'),
(2, 2, 0, 0, 0, NULL, 0, 1, 0, 1, 0, 1, '2025-04-18 20:42:26', '2025-04-19 03:23:42'),
(3, 3, 1, 0, 0, NULL, 0, 1, 0, 1, 1, 1, '2025-05-30 08:33:04', '2025-07-17 21:57:47');

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_item_id` bigint(20) UNSIGNED NOT NULL,
  `inventory_item_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` decimal(16,2) NOT NULL DEFAULT 0.00,
  `unit_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `table_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reservation_date_time` datetime NOT NULL,
  `party_size` int(11) NOT NULL,
  `special_requests` text DEFAULT NULL,
  `reservation_status` enum('Pending','Confirmed','Checked_In','Cancelled','No_Show') NOT NULL DEFAULT 'Confirmed',
  `reservation_slot_type` enum('Breakfast','Lunch','Dinner') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reservations`
--

INSERT INTO `reservations` (`id`, `branch_id`, `table_id`, `customer_id`, `reservation_date_time`, `party_size`, `special_requests`, `reservation_status`, `reservation_slot_type`, `created_at`, `updated_at`) VALUES
(1, 4, NULL, 2, '2025-07-24 12:00:00', 3, NULL, 'Confirmed', 'Lunch', '2025-07-23 18:03:44', '2025-07-23 18:03:44'),
(2, 4, NULL, 2, '2025-07-31 13:00:00', 6, NULL, 'Confirmed', 'Lunch', '2025-07-23 19:05:10', '2025-07-23 19:05:10');

-- --------------------------------------------------------

--
-- Table structure for table `reservation_settings`
--

CREATE TABLE `reservation_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `day_of_week` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') NOT NULL,
  `time_slot_start` time NOT NULL,
  `time_slot_end` time NOT NULL,
  `time_slot_difference` int(11) NOT NULL,
  `slot_type` enum('Breakfast','Lunch','Dinner') NOT NULL,
  `available` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reservation_settings`
--

INSERT INTO `reservation_settings` (`id`, `branch_id`, `day_of_week`, `time_slot_start`, `time_slot_end`, `time_slot_difference`, `slot_type`, `available`, `created_at`, `updated_at`) VALUES
(1, 1, 'Monday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-04-18 06:02:06', '2025-04-18 06:02:06'),
(2, 1, 'Monday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-04-18 06:02:06', '2025-04-18 06:02:06'),
(3, 1, 'Monday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-04-18 06:02:06', '2025-04-18 06:02:06'),
(4, 1, 'Tuesday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-04-18 06:02:06', '2025-04-18 06:02:06'),
(5, 1, 'Tuesday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-04-18 06:02:06', '2025-04-18 06:02:06'),
(6, 1, 'Tuesday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-04-18 06:02:06', '2025-04-18 06:02:06'),
(7, 1, 'Wednesday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-04-18 06:02:06', '2025-04-18 06:02:06'),
(8, 1, 'Wednesday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-04-18 06:02:06', '2025-04-18 06:02:06'),
(9, 1, 'Wednesday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-04-18 06:02:06', '2025-04-18 06:02:06'),
(10, 1, 'Thursday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-04-18 06:02:06', '2025-04-18 06:02:06'),
(11, 1, 'Thursday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-04-18 06:02:06', '2025-04-18 06:02:06'),
(12, 1, 'Thursday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-04-18 06:02:06', '2025-04-18 06:02:06'),
(13, 1, 'Friday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-04-18 06:02:06', '2025-04-18 06:02:06'),
(14, 1, 'Friday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-04-18 06:02:06', '2025-04-18 06:02:06'),
(15, 1, 'Friday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-04-18 06:02:06', '2025-04-18 06:02:06'),
(16, 1, 'Saturday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-04-18 06:02:06', '2025-04-18 06:02:06'),
(17, 1, 'Saturday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-04-18 06:02:06', '2025-04-18 06:02:06'),
(18, 1, 'Saturday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-04-18 06:02:06', '2025-04-18 06:02:06'),
(19, 1, 'Sunday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-04-18 06:02:06', '2025-04-18 06:02:06'),
(20, 1, 'Sunday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-04-18 06:02:06', '2025-04-18 06:02:06'),
(21, 1, 'Sunday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-04-18 06:02:06', '2025-04-18 06:02:06'),
(22, 3, 'Monday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-04-18 20:42:26', '2025-04-18 20:42:26'),
(23, 3, 'Monday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-04-18 20:42:26', '2025-04-18 20:42:26'),
(24, 3, 'Monday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-04-18 20:42:26', '2025-04-18 20:42:26'),
(25, 3, 'Tuesday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-04-18 20:42:26', '2025-04-18 20:42:26'),
(26, 3, 'Tuesday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-04-18 20:42:26', '2025-04-18 20:42:26'),
(27, 3, 'Tuesday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-04-18 20:42:26', '2025-04-18 20:42:26'),
(28, 3, 'Wednesday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-04-18 20:42:26', '2025-04-18 20:42:26'),
(29, 3, 'Wednesday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-04-18 20:42:26', '2025-04-18 20:42:26'),
(30, 3, 'Wednesday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-04-18 20:42:26', '2025-04-18 20:42:26'),
(31, 3, 'Thursday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-04-18 20:42:26', '2025-04-18 20:42:26'),
(32, 3, 'Thursday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-04-18 20:42:26', '2025-04-18 20:42:26'),
(33, 3, 'Thursday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-04-18 20:42:26', '2025-04-18 20:42:26'),
(34, 3, 'Friday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-04-18 20:42:26', '2025-04-18 20:42:26'),
(35, 3, 'Friday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-04-18 20:42:26', '2025-04-18 20:42:26'),
(36, 3, 'Friday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-04-18 20:42:26', '2025-04-18 20:42:26'),
(37, 3, 'Saturday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-04-18 20:42:26', '2025-04-18 20:42:26'),
(38, 3, 'Saturday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-04-18 20:42:26', '2025-04-18 20:42:26'),
(39, 3, 'Saturday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-04-18 20:42:26', '2025-04-18 20:42:26'),
(40, 3, 'Sunday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-04-18 20:42:26', '2025-04-18 20:42:26'),
(41, 3, 'Sunday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-04-18 20:42:26', '2025-04-18 20:42:26'),
(42, 3, 'Sunday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-04-18 20:42:26', '2025-04-18 20:42:26'),
(43, 4, 'Monday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-05-30 08:33:04', '2025-05-30 08:33:04'),
(44, 4, 'Monday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-05-30 08:33:04', '2025-05-30 08:33:04'),
(45, 4, 'Monday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-05-30 08:33:04', '2025-05-30 08:33:04'),
(46, 4, 'Tuesday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-05-30 08:33:04', '2025-05-30 08:33:04'),
(47, 4, 'Tuesday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-05-30 08:33:04', '2025-05-30 08:33:04'),
(48, 4, 'Tuesday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-05-30 08:33:04', '2025-05-30 08:33:04'),
(49, 4, 'Wednesday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-05-30 08:33:04', '2025-05-30 08:33:04'),
(50, 4, 'Wednesday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-05-30 08:33:04', '2025-05-30 08:33:04'),
(51, 4, 'Wednesday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-05-30 08:33:04', '2025-05-30 08:33:04'),
(52, 4, 'Thursday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-05-30 08:33:04', '2025-05-30 08:33:04'),
(53, 4, 'Thursday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-05-30 08:33:04', '2025-05-30 08:33:04'),
(54, 4, 'Thursday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-05-30 08:33:04', '2025-05-30 08:33:04'),
(55, 4, 'Friday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-05-30 08:33:04', '2025-05-30 08:33:04'),
(56, 4, 'Friday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-05-30 08:33:04', '2025-05-30 08:33:04'),
(57, 4, 'Friday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-05-30 08:33:04', '2025-05-30 08:33:04'),
(58, 4, 'Saturday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-05-30 08:33:04', '2025-05-30 08:33:04'),
(59, 4, 'Saturday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-05-30 08:33:04', '2025-05-30 08:33:04'),
(60, 4, 'Saturday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-05-30 08:33:04', '2025-05-30 08:33:04'),
(61, 4, 'Sunday', '08:00:00', '11:00:00', 30, 'Breakfast', 1, '2025-05-30 08:33:04', '2025-05-30 08:33:04'),
(62, 4, 'Sunday', '12:00:00', '17:00:00', 60, 'Lunch', 1, '2025-05-30 08:33:04', '2025-05-30 08:33:04'),
(63, 4, 'Sunday', '18:00:00', '22:00:00', 60, 'Dinner', 1, '2025-05-30 08:33:04', '2025-05-30 08:33:04');

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `hash` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `phone_number` varchar(191) DEFAULT NULL,
  `phone_code` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `timezone` varchar(191) NOT NULL,
  `theme_hex` varchar(191) NOT NULL,
  `theme_rgb` varchar(191) NOT NULL,
  `logo` varchar(191) DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `hide_new_orders` tinyint(1) NOT NULL DEFAULT 0,
  `hide_new_reservations` tinyint(1) NOT NULL DEFAULT 0,
  `hide_new_waiter_request` tinyint(1) NOT NULL DEFAULT 0,
  `currency_id` bigint(20) UNSIGNED DEFAULT NULL,
  `license_type` enum('free','paid') NOT NULL DEFAULT 'free',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_login_required` tinyint(1) NOT NULL DEFAULT 0,
  `about_us` longtext DEFAULT NULL,
  `allow_customer_delivery_orders` tinyint(1) NOT NULL DEFAULT 1,
  `allow_customer_pickup_orders` tinyint(1) NOT NULL DEFAULT 1,
  `allow_customer_orders` tinyint(1) NOT NULL DEFAULT 1,
  `allow_dine_in_orders` tinyint(1) NOT NULL DEFAULT 1,
  `package_id` bigint(20) UNSIGNED DEFAULT NULL,
  `package_type` varchar(191) DEFAULT NULL,
  `status` enum('active','inactive','license_expired') NOT NULL DEFAULT 'active',
  `license_expire_on` datetime DEFAULT NULL,
  `trial_ends_at` datetime DEFAULT NULL,
  `license_updated_at` datetime DEFAULT NULL,
  `subscription_updated_at` datetime DEFAULT NULL,
  `stripe_id` varchar(191) DEFAULT NULL,
  `pm_type` varchar(191) DEFAULT NULL,
  `pm_last_four` varchar(4) DEFAULT NULL,
  `is_waiter_request_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `default_table_reservation_status` varchar(191) NOT NULL DEFAULT 'Confirmed',
  `approval_status` enum('Pending','Approved','Rejected') NOT NULL DEFAULT 'Approved',
  `rejection_reason` text DEFAULT NULL,
  `facebook_link` varchar(255) DEFAULT NULL,
  `instagram_link` varchar(255) DEFAULT NULL,
  `twitter_link` varchar(255) DEFAULT NULL,
  `yelp_link` varchar(255) DEFAULT NULL,
  `table_required` tinyint(1) NOT NULL DEFAULT 0,
  `show_logo_text` tinyint(1) NOT NULL DEFAULT 1,
  `meta_keyword` text DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `upload_fav_icon_android_chrome_192` varchar(191) DEFAULT NULL,
  `upload_fav_icon_android_chrome_512` varchar(191) DEFAULT NULL,
  `upload_fav_icon_apple_touch_icon` varchar(191) DEFAULT NULL,
  `upload_favicon_16` varchar(191) DEFAULT NULL,
  `upload_favicon_32` varchar(191) DEFAULT NULL,
  `favicon` varchar(191) DEFAULT NULL,
  `is_waiter_request_enabled_on_desktop` tinyint(1) NOT NULL DEFAULT 1,
  `is_waiter_request_enabled_on_mobile` tinyint(1) NOT NULL DEFAULT 1,
  `is_waiter_request_enabled_open_by_qr` tinyint(1) NOT NULL DEFAULT 0,
  `webmanifest` varchar(191) DEFAULT NULL,
  `enable_tip_shop` tinyint(1) NOT NULL DEFAULT 1,
  `enable_tip_pos` tinyint(1) NOT NULL DEFAULT 1,
  `is_pwa_install_alert_show` tinyint(1) NOT NULL DEFAULT 1,
  `auto_confirm_orders` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurants`
--

INSERT INTO `restaurants` (`id`, `name`, `hash`, `address`, `phone_number`, `phone_code`, `email`, `timezone`, `theme_hex`, `theme_rgb`, `logo`, `country_id`, `hide_new_orders`, `hide_new_reservations`, `hide_new_waiter_request`, `currency_id`, `license_type`, `is_active`, `created_at`, `updated_at`, `customer_login_required`, `about_us`, `allow_customer_delivery_orders`, `allow_customer_pickup_orders`, `allow_customer_orders`, `allow_dine_in_orders`, `package_id`, `package_type`, `status`, `license_expire_on`, `trial_ends_at`, `license_updated_at`, `subscription_updated_at`, `stripe_id`, `pm_type`, `pm_last_four`, `is_waiter_request_enabled`, `default_table_reservation_status`, `approval_status`, `rejection_reason`, `facebook_link`, `instagram_link`, `twitter_link`, `yelp_link`, `table_required`, `show_logo_text`, `meta_keyword`, `meta_description`, `upload_fav_icon_android_chrome_192`, `upload_fav_icon_android_chrome_512`, `upload_fav_icon_apple_touch_icon`, `upload_favicon_16`, `upload_favicon_32`, `favicon`, `is_waiter_request_enabled_on_desktop`, `is_waiter_request_enabled_on_mobile`, `is_waiter_request_enabled_open_by_qr`, `webmanifest`, `enable_tip_shop`, `enable_tip_pos`, `is_pwa_install_alert_show`, `auto_confirm_orders`) VALUES
(1, 'Demo Restaurant', 'demo-restaurant', '101 Elinor Throughway Suite 282\nVirginiamouth, NV 90103-7015', '+15742519293', NULL, 'demo.restaurant@example.com', 'America/New_York', '#A78BFA', '167, 139, 250', NULL, 236, 0, 0, 0, 1, 'free', 1, '2025-04-18 06:02:05', '2025-07-13 00:00:08', 0, '<p class=\"text-lg text-gray-600 mb-6\">\n          Welcome to our restaurant, where great food and good vibes come together! We\'re a local, family-owned spot that loves bringing people together over delicious meals and unforgettable moments. Whether you\'re here for a quick bite, a family dinner, or a celebration, we\'re all about making your time with us special.\n        </p>\n        <p class=\"text-lg text-gray-600 mb-6\">\n          Our menu is packed with dishes made from fresh, quality ingredients because we believe food should taste as\n          good as it makes you feel. From our signature dishes to seasonal specials, there\'s always something to excite\n          your taste buds.\n        </p>\n        <p class=\"text-lg text-gray-600 mb-6\">\n          But we\'re not just about the food—we\'re about community. We love seeing familiar faces and welcoming new ones.\n          Our team is a fun, friendly bunch dedicated to serving you with a smile and making sure every visit feels like\n          coming home.\n        </p>\n        <p class=\"text-lg text-gray-600\">\n          So, come on in, grab a seat, and let us take care of the rest. We can\'t wait to share our love of food with\n          you!\n        </p>\n        <p class=\"text-lg text-gray-800 font-semibold mt-6\">See you soon! 🍽️✨</p>', 1, 1, 1, 1, 1, 'monthly', 'license_expired', '2025-08-13 00:00:00', '2025-05-18 06:02:05', '2025-04-18 06:02:05', '2025-04-18 06:02:05', NULL, NULL, NULL, 1, 'Confirmed', 'Approved', NULL, 'https://www.facebook.com/', 'https://www.instagram.com/', 'https://www.twitter.com/', NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, NULL, 1, 1, 1, 0),
(2, 'Central City', 'central-city', 'm', NULL, NULL, 'apsolutions16@gmail.com', 'Africa/Accra', '#065527', '6, 85, 39', '4424ce38598620aa9f89d9803797f1d9.jpeg', 84, 0, 0, 0, 6, 'free', 1, '2025-04-18 20:42:26', '2025-04-21 00:57:24', 0, NULL, 1, 1, 1, 1, 3, 'lifetime', 'active', NULL, NULL, '2025-04-18 20:42:26', '2025-04-18 20:42:26', NULL, NULL, NULL, 1, 'Confirmed', 'Approved', NULL, 'https://www.facebook.com', 'https://www.instagram.com', 'https://www.twitter.com', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, NULL, 1, 1, 1, 0),
(3, 'BackPass Restaurant', 'backpass-restaurant', 'BackPass Restaurant,\nAsafoatse Nettey Rd, \nAccra, Greater Accra. ', '302665201', '242', 'baronessda99@gmail.com', 'Africa/Accra', '#1226ac', '18, 38, 172', 'e4fc5d7cf5d09af893dc8fb1670e3567.jpg', 84, 0, 0, 0, 9, 'free', 1, '2025-05-30 08:33:04', '2025-07-25 12:20:48', 0, '<div>&nbsp;Welcome to our restaurant, where great food and good vibes come together! We\'re a local, family-owned spot that loves bringing people together over delicious meals and unforgettable moments. Whether you\'re here for a quick bite, a family dinner, or a celebration, we\'re all about making your time with us special.&nbsp;</div><div>&nbsp;Our menu is packed with dishes made from fresh, quality ingredients because we believe food should taste as good as it makes you feel. From our signature dishes to seasonal specials, there\'s always something to excite your taste buds.&nbsp;</div><div>&nbsp;But we\'re not just about the food—we\'re about community. We love seeing familiar faces and welcoming new ones. Our team is a fun, friendly bunch dedicated to serving you with a smile and making sure every visit feels like coming home.&nbsp;</div><div>&nbsp;So, come on in, grab a seat, and let us take care of the rest. We can\'t wait to share our love of food with you!&nbsp;</div><div><strong>BackPass Restaurant,<br></strong>Good Food, Good Mood! 🍽️✨</div>', 1, 1, 1, 1, 3, 'lifetime', 'active', NULL, NULL, '2025-05-30 08:33:04', '2025-05-30 08:33:04', NULL, NULL, NULL, 1, 'Confirmed', 'Approved', NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, 'android-chrome-192x192.png', 'android-chrome-512x512.png', 'apple-touch-icon.png', 'favicon-16x16.png', 'favicon-32x32.png', 'favicon.ico', 1, 1, 0, NULL, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_charges`
--

CREATE TABLE `restaurant_charges` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `charge_name` varchar(191) NOT NULL,
  `charge_type` enum('percent','fixed') NOT NULL DEFAULT 'fixed',
  `charge_value` decimal(16,2) DEFAULT NULL,
  `order_types` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'Supported order types: DineIn, Delivery, PickUp' CHECK (json_valid(`order_types`)),
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_payments`
--

CREATE TABLE `restaurant_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `status` enum('pending','paid','failed') NOT NULL DEFAULT 'pending',
  `payment_source` enum('official_site','app_sumo') NOT NULL DEFAULT 'official_site',
  `razorpay_order_id` varchar(191) DEFAULT NULL,
  `razorpay_payment_id` varchar(191) DEFAULT NULL,
  `razorpay_signature` varchar(191) DEFAULT NULL,
  `transaction_id` varchar(191) DEFAULT NULL,
  `payment_date_time` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_payment_intent` varchar(191) DEFAULT NULL,
  `stripe_session_id` text DEFAULT NULL,
  `package_id` bigint(20) UNSIGNED DEFAULT NULL,
  `package_type` varchar(191) DEFAULT NULL,
  `currency_id` varchar(191) DEFAULT NULL,
  `flutterwave_transaction_id` varchar(191) DEFAULT NULL,
  `flutterwave_payment_ref` varchar(191) DEFAULT NULL,
  `paypal_payment_id` varchar(191) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_taxes`
--

CREATE TABLE `restaurant_taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `tax_id` varchar(191) DEFAULT NULL,
  `tax_name` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `display_name` varchar(191) DEFAULT NULL,
  `guard_name` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `guard_name`, `created_at`, `updated_at`, `restaurant_id`) VALUES
(1, 'Super Admin', 'Super Admin', 'web', '2025-04-18 06:02:05', '2025-04-18 06:02:05', NULL),
(2, 'Admin_1', 'Admin', 'web', '2025-04-18 06:02:05', '2025-04-18 06:02:05', 1),
(3, 'Branch Head_1', 'Branch Head', 'web', '2025-04-18 06:02:05', '2025-04-18 06:02:05', 1),
(4, 'Waiter_1', 'Waiter', 'web', '2025-04-18 06:02:05', '2025-04-18 06:02:05', 1),
(5, 'Chef_1', 'Chef', 'web', '2025-04-18 06:02:05', '2025-04-18 06:02:05', 1),
(6, 'Admin_2', 'Admin', 'web', '2025-04-18 20:42:26', '2025-04-18 20:42:26', 2),
(7, 'Branch Head_2', 'Branch Head', 'web', '2025-04-18 20:42:26', '2025-04-18 20:42:26', 2),
(8, 'Waiter_2', 'Waiter', 'web', '2025-04-18 20:42:26', '2025-04-18 20:42:26', 2),
(9, 'Chef_2', 'Chef', 'web', '2025-04-18 20:42:26', '2025-04-18 20:42:26', 2),
(10, 'Admin_3', 'Admin', 'web', '2025-05-30 08:33:04', '2025-05-30 08:33:04', 3),
(11, 'Branch Head_3', 'Branch Head', 'web', '2025-05-30 08:33:04', '2025-05-30 08:33:04', 3),
(12, 'Waiter_3', 'Waiter', 'web', '2025-05-30 08:33:04', '2025-05-30 08:33:04', 3),
(13, 'Chef_3', 'Chef', 'web', '2025-05-30 08:33:04', '2025-05-30 08:33:04', 3);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 2),
(1, 3),
(1, 6),
(1, 7),
(1, 8),
(1, 10),
(1, 11),
(2, 2),
(2, 3),
(2, 6),
(2, 7),
(2, 10),
(2, 11),
(2, 13),
(3, 2),
(3, 3),
(3, 6),
(3, 7),
(3, 10),
(3, 11),
(4, 2),
(4, 3),
(4, 6),
(4, 7),
(4, 10),
(4, 11),
(5, 2),
(5, 3),
(5, 6),
(5, 7),
(5, 10),
(5, 11),
(6, 2),
(6, 3),
(6, 6),
(6, 7),
(6, 10),
(6, 11),
(7, 2),
(7, 3),
(7, 6),
(7, 7),
(7, 10),
(7, 11),
(8, 2),
(8, 3),
(8, 6),
(8, 7),
(8, 10),
(8, 11),
(9, 2),
(9, 3),
(9, 6),
(9, 7),
(9, 10),
(9, 11),
(10, 2),
(10, 3),
(10, 6),
(10, 7),
(10, 10),
(10, 11),
(10, 12),
(11, 2),
(11, 3),
(11, 6),
(11, 7),
(11, 10),
(11, 11),
(12, 2),
(12, 3),
(12, 6),
(12, 7),
(12, 10),
(12, 11),
(13, 2),
(13, 3),
(13, 6),
(13, 7),
(13, 10),
(13, 11),
(14, 2),
(14, 3),
(14, 6),
(14, 7),
(14, 10),
(14, 11),
(14, 12),
(15, 2),
(15, 3),
(15, 6),
(15, 7),
(15, 10),
(15, 11),
(16, 2),
(16, 3),
(16, 6),
(16, 7),
(16, 10),
(16, 11),
(17, 2),
(17, 3),
(17, 6),
(17, 7),
(17, 10),
(17, 11),
(18, 2),
(18, 3),
(18, 6),
(18, 7),
(18, 10),
(18, 11),
(18, 12),
(19, 2),
(19, 3),
(19, 6),
(19, 7),
(19, 10),
(19, 11),
(19, 12),
(20, 2),
(20, 3),
(20, 6),
(20, 7),
(20, 10),
(20, 11),
(21, 2),
(21, 3),
(21, 6),
(21, 7),
(21, 10),
(21, 11),
(21, 12),
(22, 2),
(22, 3),
(22, 6),
(22, 7),
(22, 10),
(22, 11),
(22, 12),
(23, 2),
(23, 3),
(23, 6),
(23, 7),
(23, 10),
(23, 11),
(23, 12),
(24, 2),
(24, 3),
(24, 6),
(24, 7),
(24, 10),
(24, 11),
(25, 2),
(25, 3),
(25, 6),
(25, 7),
(25, 10),
(25, 11),
(25, 12),
(25, 13),
(26, 2),
(26, 3),
(26, 6),
(26, 7),
(26, 8),
(26, 10),
(26, 11),
(26, 12),
(27, 2),
(27, 3),
(27, 6),
(27, 7),
(27, 8),
(27, 10),
(27, 11),
(27, 12),
(28, 2),
(28, 3),
(28, 6),
(28, 7),
(28, 8),
(28, 10),
(28, 11),
(28, 12),
(29, 2),
(29, 3),
(29, 6),
(29, 7),
(29, 8),
(29, 10),
(29, 11),
(29, 12),
(30, 2),
(30, 3),
(30, 6),
(30, 7),
(30, 10),
(30, 11),
(30, 12),
(31, 2),
(31, 3),
(31, 6),
(31, 7),
(31, 10),
(31, 11),
(31, 12),
(32, 2),
(32, 3),
(32, 6),
(32, 7),
(32, 10),
(32, 11),
(32, 12),
(33, 2),
(33, 3),
(33, 6),
(33, 7),
(33, 10),
(33, 11),
(34, 2),
(34, 3),
(34, 6),
(34, 7),
(34, 10),
(34, 11),
(35, 2),
(35, 3),
(35, 6),
(35, 7),
(35, 10),
(35, 11),
(35, 12),
(36, 2),
(36, 3),
(36, 6),
(36, 7),
(36, 10),
(36, 11),
(37, 2),
(37, 3),
(37, 6),
(37, 7),
(37, 10),
(37, 11),
(38, 2),
(38, 3),
(38, 6),
(38, 7),
(38, 10),
(38, 11),
(39, 2),
(39, 3),
(39, 6),
(39, 7),
(39, 10),
(39, 11),
(40, 2),
(40, 3),
(40, 6),
(40, 7),
(40, 10),
(40, 11),
(41, 2),
(41, 3),
(41, 6),
(41, 7),
(41, 10),
(41, 11),
(42, 2),
(42, 3),
(42, 6),
(42, 7),
(42, 8),
(42, 10),
(42, 11),
(42, 12),
(43, 2),
(43, 3),
(43, 6),
(43, 7),
(43, 10),
(43, 11),
(44, 2),
(44, 3),
(44, 6),
(44, 7),
(44, 10),
(44, 11),
(45, 2),
(45, 3),
(45, 6),
(45, 7),
(45, 10),
(45, 11),
(46, 2),
(46, 3),
(46, 6),
(46, 7),
(46, 10),
(46, 11),
(47, 2),
(47, 3),
(47, 6),
(47, 7),
(47, 10),
(47, 11),
(48, 2),
(48, 3),
(48, 6),
(48, 7),
(48, 10),
(48, 11),
(49, 2),
(49, 3),
(49, 6),
(49, 7),
(49, 10),
(49, 11),
(50, 2),
(50, 3),
(50, 6),
(50, 7),
(50, 10),
(50, 11),
(51, 2),
(51, 3),
(51, 6),
(51, 7),
(51, 10),
(51, 11),
(52, 2),
(52, 3),
(52, 6),
(52, 7),
(52, 10),
(52, 11),
(53, 2),
(53, 3),
(53, 6),
(53, 7),
(53, 10),
(53, 11),
(54, 2),
(54, 3),
(54, 6),
(54, 7),
(54, 10),
(54, 11),
(55, 2),
(55, 3),
(55, 6),
(55, 7),
(55, 10),
(55, 11),
(56, 2),
(56, 3),
(56, 6),
(56, 7),
(56, 10),
(56, 11),
(57, 2),
(57, 3),
(57, 6),
(57, 7),
(57, 10),
(57, 11),
(58, 2),
(58, 3),
(58, 6),
(58, 7),
(58, 10),
(58, 11),
(59, 2),
(59, 3),
(59, 6),
(59, 7),
(59, 10),
(59, 11),
(60, 2),
(60, 3),
(60, 6),
(60, 7),
(60, 10),
(60, 11),
(61, 2),
(61, 3),
(61, 6),
(61, 7),
(61, 10),
(61, 11),
(62, 2),
(62, 3),
(62, 6),
(62, 7),
(62, 10),
(62, 11),
(63, 2),
(63, 3),
(63, 6),
(63, 7),
(63, 10),
(63, 11),
(64, 2),
(64, 3),
(64, 6),
(64, 7),
(64, 10),
(64, 11),
(65, 2),
(65, 3),
(65, 6),
(65, 7),
(65, 10),
(65, 11),
(66, 2),
(66, 3),
(66, 6),
(66, 7),
(66, 10),
(66, 11),
(67, 2),
(67, 3),
(67, 6),
(67, 7),
(67, 10),
(67, 11),
(68, 2),
(68, 3),
(68, 6),
(68, 7),
(68, 10),
(68, 11),
(69, 2),
(69, 3),
(69, 6),
(69, 7),
(69, 10),
(69, 11),
(70, 2),
(70, 3),
(70, 6),
(70, 7),
(70, 10),
(70, 11),
(71, 2),
(71, 3),
(71, 6),
(71, 7),
(71, 10),
(71, 11),
(72, 2),
(72, 3),
(72, 6),
(72, 7),
(72, 10),
(72, 11),
(73, 2),
(73, 3),
(73, 6),
(73, 7),
(73, 10),
(73, 11),
(74, 2),
(74, 3),
(74, 6),
(74, 7),
(74, 10),
(74, 11),
(75, 2),
(75, 3),
(75, 6),
(75, 7),
(75, 10),
(75, 11),
(76, 2),
(76, 3),
(76, 6),
(76, 7),
(76, 10),
(76, 11),
(77, 2),
(77, 3),
(77, 6),
(77, 7),
(77, 10),
(77, 11),
(78, 2),
(78, 3),
(78, 6),
(78, 7),
(78, 10),
(78, 11),
(79, 2),
(79, 3),
(79, 6),
(79, 7),
(79, 10),
(79, 11),
(80, 2),
(80, 3),
(80, 6),
(80, 7),
(80, 10),
(80, 11);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('0BkbCumn9L1mlkmwSXo3RVmrbnTTknBqnqibnCwO', NULL, '102.176.75.173', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_1) AppleWebKit/601.2.4 (KHTML, like Gecko) Version/9.0.1 Safari/601.2.4 facebookexternalhit/1.1 Facebot Twitterbot/1.0', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiQ01PQWVJRExHYXJZRktSc1gzSFo4WWhVTnhYSnhobzV2a2pUUUZtdiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo0NjoiaHR0cHM6Ly9lYXRzLnVzZXRocml2ZWVycC5jb20vcHVibGljL2Rhc2hib2FyZCI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQyOiJodHRwczovL2VhdHMudXNldGhyaXZlZXJwLmNvbS9wdWJsaWMvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjIwOiJjaGVja19taWdyYXRlX3N0YXR1cyI7czo0OiJHb29kIjtzOjQ6InVzZXIiO047fQ==', 1753830980),
('0c7WZNg8w0KoQyyvCN6sCuFEFwVwDPbcFO08uB2a', NULL, '52.167.144.169', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVDR3czBpcERCY1JrMDlISDBYWWk1d2hDWm1rYm9rdkFMcE01bXo2ZSI7czoyMDoiY2hlY2tfbWlncmF0ZV9zdGF0dXMiO3M6NDoiR29vZCI7czo0OiJ1c2VyIjtOO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQyOiJodHRwczovL2VhdHMudXNldGhyaXZlZXJwLmNvbS9wdWJsaWMvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753660886),
('9bclsFKHRQB95hYg6mUdNOQwQKd8l1Q2XDNsYaXw', NULL, '52.167.144.194', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoienJxenhlcWJ0WjBBM2hvZ1ZpQ1RIb3ZkRE9UREt6NWVHNXNOY3FqcCI7czoyMDoiY2hlY2tfbWlncmF0ZV9zdGF0dXMiO3M6NDoiR29vZCI7czozMToiZ2xvYmFsX2N1cnJlbmN5X2Zvcm1hdF9zZXR0aW5nMSI7TzoyNToiQXBwXE1vZGVsc1xHbG9iYWxDdXJyZW5jeSI6MzQ6e3M6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6MTc6Imdsb2JhbF9jdXJyZW5jaWVzIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6MTU6e3M6MjoiaWQiO2k6MTtzOjEzOiJjdXJyZW5jeV9uYW1lIjtzOjc6IkRvbGxhcnMiO3M6MTU6ImN1cnJlbmN5X3N5bWJvbCI7czoxOiIkIjtzOjEzOiJjdXJyZW5jeV9jb2RlIjtzOjM6IlVTRCI7czoxMzoiZXhjaGFuZ2VfcmF0ZSI7TjtzOjk6InVzZF9wcmljZSI7TjtzOjE3OiJpc19jcnlwdG9jdXJyZW5jeSI7czoyOiJubyI7czoxNzoiY3VycmVuY3lfcG9zaXRpb24iO3M6NDoibGVmdCI7czoxMzoibm9fb2ZfZGVjaW1hbCI7aToyO3M6MTg6InRob3VzYW5kX3NlcGFyYXRvciI7czoxOiIsIjtzOjE3OiJkZWNpbWFsX3NlcGFyYXRvciI7czoxOiIuIjtzOjY6InN0YXR1cyI7czo2OiJlbmFibGUiO3M6MTA6ImNyZWF0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', 1753717780);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('e3Hn7kRBLky4xKDE8dS2Lu055GPPkybFLuEwijRv', 6, '41.204.44.175', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 Edg/138.0.0.0', 'YToxOTp7czo2OiJfdG9rZW4iO3M6NDA6IlpwTHNIU2tDNWFYd0RDQWJMVUk4ZWNnaHZSeXRKYnFodHBDN2NLdUMiO3M6MjA6ImNoZWNrX21pZ3JhdGVfc3RhdHVzIjtzOjQ6Ikdvb2QiO3M6MzE6Imdsb2JhbF9jdXJyZW5jeV9mb3JtYXRfc2V0dGluZzEiO086MjU6IkFwcFxNb2RlbHNcR2xvYmFsQ3VycmVuY3kiOjM0OntzOjEzOiIAKgBjb25uZWN0aW9uIjtzOjU6Im15c3FsIjtzOjg6IgAqAHRhYmxlIjtzOjE3OiJnbG9iYWxfY3VycmVuY2llcyI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjE1OntzOjI6ImlkIjtpOjE7czoxMzoiY3VycmVuY3lfbmFtZSI7czo3OiJEb2xsYXJzIjtzOjE1OiJjdXJyZW5jeV9zeW1ib2wiO3M6MToiJCI7czoxMzoiY3VycmVuY3lfY29kZSI7czozOiJVU0QiO3M6MTM6ImV4Y2hhbmdlX3JhdGUiO047czo5OiJ1c2RfcHJpY2UiO047czoxNzoiaXNfY3J5cHRvY3VycmVuY3kiO3M6Mjoibm8iO3M6MTc6ImN1cnJlbmN5X3Bvc2l0aW9uIjtzOjQ6ImxlZnQiO3M6MTM6Im5vX29mX2RlY2ltYWwiO2k6MjtzOjE4OiJ0aG91c2FuZF9zZXBhcmF0b3IiO3M6MToiLCI7czoxNzoiZGVjaW1hbF9zZXBhcmF0b3IiO3M6MToiLiI7czo2OiJzdGF0dXMiO3M6NjoiZW5hYmxlIjtzOjEwOiJjcmVh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ZWQiO2I6MDtzOjI4OiIAKgBlc2NhcGVXaGVuQ2FzdGluZ1RvU3RyaW5nIjtiOjA7czoxMzoiACoAYXR0cmlidXRlcyI7YToyMjp7czoyOiJpZCI7aTo2O3M6MTM6InJlc3RhdXJhbnRfaWQiO2k6MztzOjk6ImJyYW5jaF9pZCI7aTo0O3M6NDoibmFtZSI7czoyNToiQmFyb25lc3MgRGlvd3Vzby1BZ3llbWFuICI7czo1OiJlbWFpbCI7czoyMjoiYmFyb25lc3NkYTk5QGdtYWlsLmNvbSI7czoxMjoicGhvbmVfbnVtYmVyIjtOO3M6MTA6InBob25lX2NvZGUiO047czoxNzoiZW1haWxfdmVyaWZpZWRfYXQiO047czo4OiJwYXNzd29yZCI7czo2MDoiJDJ5JDEyJDg1REtvcnZhR21zd0xqUzJUMmxFT3V0bnNWRDdrbFRlRURYRTU1eXBPNTdZbXlUMk41QTFDIjtzOjE3OiJ0d29fZmFjdG9yX3NlY3JldCI7TjtzOjI1OiJ0d29fZmFjdG9yX3JlY292ZXJ5X2NvZGVzIjtOO3M6MjM6InR3b19mYWN0b3JfY29uZmlybWVkX2F0IjtOO3M6MTQ6InJlbWVtYmVyX3Rva2VuIjtzOjYwOiJMTmE0WjRnbHFadm5lNmxDRTdQZjY3SEx4VEJkY0J4U202d3FLeWhtTVdWRE1taTQ1YWx4TG9nUzRjOTEiO3M6MTU6ImN1cnJlbnRfdGVhbV9pZCI7TjtzOjE4OiJwcm9maWxlX3Bob3RvX3BhdGgiO047czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNS0wNS0zMCAwODozMzowNCI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNi0wNiAwNDozMzowMCI7czo2OiJsb2NhbGUiO3M6MjoiZW4iO3M6OToic3RyaXBlX2lkIjtOO3M6NzoicG1fdHlwZSI7TjtzOjEyOiJwbV9sYXN0X2ZvdXIiO047czoxMzoidHJpYWxfZW5kc19hdCI7Tjt9czoxMToiACoAb3JpZ2luYWwiO2E6MjI6e3M6MjoiaWQiO2k6NjtzOjEzOiJyZXN0YXVyYW50X2lkIjtpOjM7czo5OiJicmFuY2hfaWQiO2k6NDtzOjQ6Im5hbWUiO3M6MjU6IkJhcm9uZXNzIERpb3d1c28tQWd5ZW1hbiAiO3M6NToiZW1haWwiO3M6MjI6ImJhcm9uZXNzZGE5OUBnbWFpbC5jb20iO3M6MTI6InBob25lX251bWJlciI7TjtzOjEwOiJwaG9uZV9jb2RlIjtOO3M6MTc6ImVtYWlsX3ZlcmlmaWVkX2F0IjtOO3M6ODoicGFzc3dvcmQiO3M6NjA6IiQyeSQxMiQ4NURLb3J2YUdtc3dMalMyVDJsRU91dG5zVkQ3a2xUZUVEWEU1NXlwTzU3WW15VDJONUExQyI7czoxNzoidHdvX2ZhY3Rvcl9zZWNyZXQiO047czoyNToidHdvX2ZhY3Rvcl9yZWNvdmVyeV9jb2RlcyI7TjtzOjIzOiJ0d29fZmFjdG9yX2NvbmZpcm1lZF9hdCI7TjtzOjE0OiJyZW1lbWJlcl90b2tlbiI7czo2MDoiTE5hNFo0Z2xxWnZuZTZsQ0U3UGY2N0hMeFRCZGNCeFNtNndxS3lobU1XVkRNbWk0NWFseExvZ1M0YzkxIjtzOjE1OiJjdXJyZW50X3RlYW1faWQiO047czoxODoicHJvZmlsZV9waG90b19wYXRoIjtOO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMDUtMzAgMDg6MzM6MDQiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDYtMDYgMDQ6MzM6MDAiO3M6NjoibG9jYWxlIjtzOjI6ImVuIjtzOjk6InN0cmlwZV9pZCI7TjtzOjc6InBtX3R5cGUiO047czoxMjoicG1fbGFzdF9mb3VyIjtOO3M6MTM6InRyaWFsX2VuZHNfYXQiO047fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6MTE6IgAqAHByZXZpb3VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjQ6e3M6MTc6ImVtYWlsX3ZlcmlmaWVkX2F0IjtzOjg6ImRhdGV0aW1lIjtzOjg6InBhc3N3b3JkIjtzOjY6Imhhc2hlZCI7czoxMzoicmVzdGF1cmFudF9pZCI7czo3OiJpbnRlZ2VyIjtzOjk6ImJyYW5jaF9pZCI7czo3OiJpbnRlZ2VyIjt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6MjE6IgAqAGF0dHJp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NzoiIzEyMjZhYyI7czo5OiJ0aGVtZV9yZ2IiO3M6MTE6IjE4LCAzOCwgMTcyIjtzOjQ6ImxvZ28iO3M6MzY6ImU0ZmM1ZDdjZjVkMDlhZjg5M2RjOGZiMTY3MGUzNTY3LmpwZyI7czoxMDoiY291bnRyeV9pZCI7aTo4NDtzOjE1OiJoaWRlX25ld19vcmRlcnMiO2k6MDtzOjIxOiJoaWRlX25ld19yZXNlcnZhdGlvbnMiO2k6MDtzOjIzOiJoaWRlX25ld193YWl0ZXJfcmVxdWVzdCI7aTowO3M6MTE6ImN1cnJlbmN5X2lkIjtpOjk7czoxMjoibGljZW5zZV90eXBlIjtzOjQ6ImZyZWUiO3M6OToiaXNfYWN0aXZlIjtpOjE7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNS0wNS0zMCAwODozMzowNCI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNy0yNSAxMjoyMDo0OCI7czoyMzoiY3VzdG9tZXJfbG9naW5fcmVxdWlyZWQiO2k6MDtzOjg6ImFib3V0X3VzIjtzOjEwNzE6IjxkaXY+Jm5ic3A7V2VsY29tZSB0byBvdXIgcmVzdGF1cmFudCwgd2hlcmUgZ3JlYXQgZm9vZCBhbmQgZ29vZCB2aWJlcyBjb21lIHRvZ2V0aGVyISBXZSdyZSBhIGxvY2FsLCBmYW1pbHktb3duZWQgc3BvdCB0aGF0IGxvdmVzIGJyaW5naW5nIHBlb3BsZSB0b2dldGhlciBvdmVyIGRlbGljaW91cyBtZWFscyBhbmQgdW5mb3JnZXR0YWJsZSBtb21lbnRzLiBXaGV0aGVyIHlvdSdyZSBoZXJlIGZvciBhIHF1aWNrIGJpdGUsIGEgZmFtaWx5IGRpbm5lciwgb3IgYSBjZWxlYnJhdGlvbiwgd2UncmUgYWxsIGFib3V0IG1ha2luZyB5b3VyIHRpbWUgd2l0aCB1cyBzcGVjaWFsLiZuYnNwOzwvZGl2PjxkaXY+Jm5ic3A7T3VyIG1lbnUgaXMgcGFja2VkIHdpdGggZGlzaGVzIG1hZGUgZnJvbSBmcmVzaCwgcXVhbGl0eSBpbmdyZWRpZW50cyBiZWNhdXNlIHdlIGJlbGlldmUgZm9vZCBzaG91bGQgdGFzdGUgYXMgZ29vZCBhcyBpdCBtYWtlcyB5b3UgZmVlbC4gRnJvbSBvdXIgc2lnbmF0dXJlIGRpc2hlcyB0byBzZWFzb25hbCBzcGVjaWFscywgdGhlcmUncyBhbHdheXMgc29tZXRoaW5nIHRvIGV4Y2l0ZSB5b3VyIHRhc3RlIGJ1ZHMuJm5ic3A7PC9kaXY+PGRpdj4mbmJzcDtCdXQgd2UncmUgbm90IGp1c3QgYWJvdXQgdGhlIGZvb2TigJR3ZSdyZSBhYm91dCBjb21tdW5pdHkuIFdlIGxvdmUgc2VlaW5nIGZhbWlsaWFyIGZhY2VzIGFuZCB3ZWxjb21pbmcgbmV3IG9uZXMuIE91ciB0ZWFtIGlzIGEgZnVuLCBmcmllbmRseSBidW5jaCBkZWRpY2F0ZWQgdG8gc2VydmluZyB5b3Ugd2l0aCBhIHNtaWxlIGFuZCBtYWtpbmcgc3VyZSBldmVyeSB2aXNpdCBmZWVscyBsaWtlIGNvbWluZyBob21lLiZuYnNwOzwvZGl2PjxkaXY+Jm5ic3A7U28sIGNvbWUgb24gaW4sIGdyYWIgYSBzZWF0LCBhbmQgbGV0IHVzIHRha2UgY2FyZSBvZiB0aGUgcmVzdC4gV2UgY2FuJ3Qgd2FpdCB0byBzaGFyZSBvdXIgbG92ZSBvZiBmb29kIHdpdGggeW91ISZuYnNwOzwvZGl2PjxkaXY+PHN0cm9uZz5CYWNrUGFzcyBSZXN0YXVyYW50LDxicj48L3N0cm9uZz5Hb29kIEZvb2QsIEdvb2QgTW9vZCEg8J+Nve+4j+KcqDwvZGl2PiI7czozMDoiYWxsb3dfY3VzdG9tZXJfZGVsaXZlcnlfb3JkZXJzIjtpOjE7czoyODoiYWxsb3dfY3VzdG9tZXJfcGlja3VwX29yZGVycyI7aToxO3M6MjE6ImFsbG93X2N1c3RvbWVyX29yZGVycyI7aToxO3M6MjA6ImFsbG93X2RpbmVfaW5fb3JkZXJzIjtpOjE7czoxMDoicGFja2FnZV9pZCI7aTozO3M6MTI6InBhY2thZ2VfdHlwZSI7czo4OiJsaWZldGltZSI7czo2OiJzdGF0dXMiO3M6NjoiYWN0aXZlIjtzOjE3OiJsaWNlbnNlX2V4cGlyZV9vbiI7TjtzOjEzOiJ0cmlhbF9lbmRzX2F0IjtOO3M6MTg6ImxpY2Vuc2VfdXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNS0zMCAwODozMzowNCI7czoyMzoic3Vic2NyaXB0aW9uX3VwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDUtMzAgMDg6MzM6MDQiO3M6OToic3RyaXBlX2lkIjtOO3M6NzoicG1fdHlwZSI7TjtzOjEyOiJwbV9sYXN0X2ZvdXIiO047czoyNToiaXNfd2FpdGVyX3JlcXVlc3RfZW5hYmxlZCI7aToxO3M6MzI6ImRlZmF1bHRfdGFibGVfcmVzZXJ2YXRpb25fc3RhdHVzIjtzOjk6IkNvbmZpcm1lZCI7czoxNToiYXBwcm92YWxfc3RhdHVzIjtzOjg6IkFwcHJvdmVkIjtzOjE2OiJyZWplY3Rpb25fcmVhc29uIjtOO3M6MTM6ImZhY2Vib29rX2xpbmsiO047czoxNDoiaW5zdGFncmFtX2xpbmsiO047czoxMjoidHdpdHRlcl9saW5rIjtOO3M6OToieWVscF9saW5rIjtOO3M6MTQ6InRhYmxlX3JlcXVpcmVkIjtpOjA7czoxNDoic2hvd19sb2dvX3RleHQiO2k6MTtzOjEyOiJtZXRhX2tleXdvcmQiO047czoxNjoibWV0YV9kZXNjcmlwdGlvbiI7TjtzOjM0OiJ1cGxvYWRfZmF2X2ljb25fYW5kcm9pZF9jaHJvbWVfMTkyIjtzOjI2OiJhbmRyb2lkLWNocm9tZS0xOTJ4MTkyLnBuZyI7czozNDoidXBsb2FkX2Zhdl9pY29uX2FuZHJvaWRfY2hyb21lXzUxMiI7czoyNjoiYW5kcm9pZC1jaHJvbWUtNTEyeDUxMi5wbmciO3M6MzI6InVwbG9hZF9mYXZfaWNvbl9hcHBsZV90b3VjaF9pY29uIjtzOjIwOiJhcHBsZS10b3VjaC1pY29uLnBuZyI7czoxNzoidXBsb2FkX2Zhdmljb25fMTYiO3M6MTc6ImZhdmljb24tMTZ4MTYucG5nIjtzOjE3OiJ1cGxvYWRfZmF2aWNvbl8zMiI7czoxNzoiZmF2aWNvbi0zMngzMi5wbmciO3M6NzoiZmF2aWNvbiI7czoxMToiZmF2aWNvbi5pY28iO3M6MzY6ImlzX3dhaXRlcl9yZXF1ZXN0X2VuYWJsZWRfb25fZGVza3RvcCI7aToxO3M6MzU6ImlzX3dhaXRlcl9yZXF1ZXN0X2VuYWJsZWRfb25fbW9iaWxlIjtpOjE7czozNjoiaXNfd2FpdGVyX3JlcXVlc3RfZW5hYmxlZF9vcGVuX2J5X3FyIjtpOjA7czoxMToid2VibWFuaWZlc3QiO047czoxNToiZW5hYmxlX3RpcF9zaG9wIjtpOjE7czoxNDoiZW5hYmxlX3RpcF9wb3MiO2k6MTtzOjI1OiJpc19wd2FfaW5zdGFsbF9hbGVydF9zaG93IjtpOjE7czoxOToiYXV0b19jb25maXJtX29yZGVycyI7aTowO31zOjExOiIAKgBvcmlnaW5hbCI7YTo2Mjp7czoyOiJpZCI7aTozO3M6NDoibmFtZSI7czoxOToiQmFja1Bhc3MgUmVzdGF1cmFudCI7czo0OiJoYXNoIjtzOjE5OiJiYWNrcGFzcy1yZXN0YXVyYW50IjtzOjc6ImFkZHJlc3MiO3M6NjU6IkJhY2tQYXNzIFJlc3RhdXJhbnQsCkFzYWZvYXRzZSBOZXR0ZXkgUmQsIApBY2NyYSwgR3JlYXRlciBBY2NyYS4gIjtzOjEyOiJwaG9uZV9udW1iZXIiO3M6OToiMzAyNjY1MjAxIjtzOjEwOiJwaG9uZV9jb2RlIjtzOjM6IjI0MiI7czo1OiJlbWFpbCI7czoyMjoiYmFyb25lc3NkYTk5QGdtYWlsLmNvbSI7czo4OiJ0aW1lem9uZSI7czoxMjoiQWZyaWNhL0FjY3JhIjtzOjk6InRoZW1lX2hleCI7czo3OiIjMTIyNmFjIjtzOjk6InRoZW1lX3JnYiI7czoxMToiMTgsIDM4LCAxNzIiO3M6NDoibG9nbyI7czozNjoiZTRmYzVkN2NmNWQwOWFmODkzZGM4ZmIxNjcwZTM1NjcuanBnIjtzOjEwOiJjb3VudHJ5X2lkIjtpOjg0O3M6MTU6ImhpZGVfbmV3X29yZGVycyI7aTowO3M6MjE6ImhpZGVfbmV3X3Jlc2VydmF0aW9ucyI7aTowO3M6MjM6ImhpZGVfbmV3X3dhaXRlcl9yZXF1ZXN0IjtpOjA7czoxMToiY3VycmVuY3lfaWQiO2k6OTtzOjEyOiJsaWNlbnNlX3R5cGUiO3M6NDoiZnJlZSI7czo5OiJpc19hY3RpdmUiO2k6MTtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA1LTMwIDA4OjMzOjA0IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTI1IDEyOjIwOjQ4IjtzOjIzOiJjdXN0b21lcl9sb2dpbl9yZXF1aXJlZCI7aTowO3M6ODoiYWJvdXRfdXMiO3M6MTA3MToiPGRpdj4mbmJzcDtXZWxjb21lIHRvIG91ciByZXN0YXVyYW50LCB3aGVyZSBncmVhdCBmb29kIGFuZCBnb29kIHZpYmVzIGNvbWUgdG9nZXRoZXIhIFdlJ3JlIGEgbG9jYWwsIGZhbWlseS1vd25lZCBzcG90IHRoYXQgbG92ZXMgYnJpbmdpbmcgcGVvcGxlIHRvZ2V0aGVyIG92ZXIgZGVsaWNpb3VzIG1lYWxzIGFuZCB1bmZvcmdldHRhYmxlIG1vbWVudHMuIFdoZXRoZXIgeW91J3JlIGhlcmUgZm9yIGEgcXVpY2sgYml0ZSwgYSBmYW1pbHkgZGlubmVyLCBvciBhIGNlbGVicmF0aW9uLCB3ZSdyZSBhbGwgYWJvdXQgbWFraW5nIHlvdXIgdGltZSB3aXRoIHVzIHNwZWNpYWwuJm5ic3A7PC9kaXY+PGRpdj4mbmJzcDtPdXIgbWVudSBpcyBwYWNrZWQgd2l0aCBkaXNoZXMgbWFkZSBmcm9tIGZyZXNoLCBxdWFsaXR5IGluZ3JlZGllbnRzIGJlY2F1c2Ugd2UgYmVsaWV2ZSBmb29kIHNob3VsZCB0YXN0ZSBhcyBnb29kIGFzIGl0IG1ha2VzIHlvdSBmZWVsLiBGcm9tIG91ciBzaWduYXR1cmUgZGlzaGVzIHRvIHNlYXNvbmFsIHNwZWNpYWxzLCB0aGVyZSdzIGFsd2F5cyBzb21ldGhpbmcgdG8gZXhjaXRlIHlvdXIgdGFzdGUgYnVkcy4mbmJzcDs8L2Rpdj48ZGl2PiZuYnNwO0J1dCB3ZSdyZSBub3QganVzdCBhYm91dCB0aGUgZm9vZOKAlHdlJ3JlIGFib3V0IGNvbW11bml0eS4gV2UgbG92ZSBzZWVpbmcgZmFtaWxpYXIgZmFjZXMgYW5kIHdlbGNvbWluZyBuZXcgb25lcy4gT3VyIHRlYW0gaXMgYSBmdW4sIGZyaWVuZGx5IGJ1bmNoIGRlZGljYXRlZCB0byBzZXJ2aW5nIHlvdSB3aXRoIGEgc21pbGUgYW5kIG1ha2luZyBzdXJlIGV2ZXJ5IHZpc2l0IGZlZWxzIGxpa2UgY29taW5nIGhvbWUuJm5ic3A7PC9kaXY+PGRpdj4mbmJzcDtTbywgY29tZSBvbiBpbiwgZ3JhYiBhIHNlYXQsIGFuZCBsZXQgdXMgdGFrZSBjYXJlIG9mIHRoZSByZXN0LiBXZSBjYW4ndCB3YWl0IHRvIHNoYXJlIG91ciBsb3ZlIG9mIGZvb2Qgd2l0aCB5b3UhJm5ic3A7PC9kaXY+PGRpdj48c3Ryb25nPkJhY2tQYXNzIFJlc3RhdXJhbnQsPGJyPjwvc3Ryb25nPkdvb2QgRm9vZCwgR29vZCBNb29kISDwn42977iP4pyoPC9kaXY+IjtzOjMwOiJhbGxvd19jdXN0b21lcl9kZWxpdmVyeV9vcmRlcnMiO2k6MTtzOjI4OiJhbGxvd19jdXN0b21lcl9waWNrdXBfb3JkZXJzIjtpOjE7czoyMToiYWxsb3dfY3VzdG9tZXJfb3JkZXJzIjtpOjE7czoyMDoiYWxsb3dfZGluZV9pbl9vcmRlcnMiO2k6MTtzOjEwOiJwYWNrYWdlX2lkIjtpOjM7czoxMjoicGFja2FnZV90eXBlIjtzOjg6ImxpZmV0aW1lIjtzOjY6InN0YXR1cyI7czo2OiJhY3RpdmUiO3M6MTc6ImxpY2Vuc2VfZXhwaXJlX29uIjtOO3M6MTM6InRyaWFsX2VuZHNfYXQiO047czoxODoibGljZW5zZV91cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA1LTMwIDA4OjMzOjA0IjtzOjIzOiJzdWJzY3JpcHRpb25fdXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNS0zMCAwODozMzowNCI7czo5OiJzdHJpcGVfaWQiO047czo3OiJwbV90eXBlIjtOO3M6MTI6InBtX2xhc3RfZm91ciI7TjtzOjI1OiJpc193YWl0ZXJfcmVxdWVzdF9lbmFibGVkIjtpOjE7czozMjoiZGVmYXVsdF90YWJsZV9yZXNlcnZhdGlvbl9zdGF0dXMiO3M6OToiQ29uZmlybWVkIjtzOjE1OiJhcHByb3ZhbF9zdGF0dXMiO3M6ODoiQXBwcm92ZWQiO3M6MTY6InJlamVjdGlvbl9yZWFzb24iO047czoxMzoiZmFjZWJvb2tfbGluayI7TjtzOjE0OiJpbnN0YWdyYW1fbGluayI7TjtzOjEyOiJ0d2l0dGVyX2xpbmsiO047czo5OiJ5ZWxwX2xpbmsiO047czoxNDoidGFibGVfcmVxdWlyZWQiO2k6MDtzOjE0OiJzaG93X2xvZ29fdGV4dCI7aToxO3M6MTI6Im1ldGFfa2V5d29yZCI7TjtzOjE2OiJtZXRhX2Rlc2NyaXB0aW9uIjtOO3M6MzQ6InVwbG9hZF9mYXZfaWNvbl9hbmRyb2lkX2Nocm9tZV8xOTIiO3M6MjY6ImFuZHJvaWQtY2hyb21lLTE5MngxOTIucG5nIjtzOjM0OiJ1cGxvYWRfZmF2X2ljb25fYW5kcm9pZF9jaHJvbWVfNTEyIjtzOjI2OiJhbmRyb2lkLWNocm9tZS01MTJ4NTEyLnBuZyI7czozMjoidXBsb2FkX2Zhdl9pY29uX2FwcGxlX3RvdWNoX2ljb24iO3M6MjA6ImFwcGxlLXRvdWNoLWljb24ucG5nIjtzOjE3OiJ1cGxvYWRfZmF2aWNvbl8xNiI7czoxNzoiZmF2aWNvbi0xNngxNi5wbmciO3M6MTc6InVwbG9hZF9mYXZpY29uXzMyIjtzOjE3OiJmYXZpY29uLTMyeDMyLnBuZyI7czo3OiJmYXZpY29uIjtzOjExOiJmYXZpY29uLmljbyI7czozNjoiaXNfd2FpdGVyX3JlcXVlc3RfZW5hYmxlZF9vbl9kZXNrdG9wIjtpOjE7czozNToiaXNfd2FpdGVyX3JlcXVlc3RfZW5hYmxlZF9vbl9tb2JpbGUiO2k6MTtzOjM2OiJpc193YWl0ZXJfcmVxdWVzdF9lbmFibGVkX29wZW5fYnlfcXIiO2k6MDtzOjExOiJ3ZWJtYW5pZmVzdCI7TjtzOjE1OiJlbmFibGVfdGlwX3Nob3AiO2k6MTtzOjE0OiJlbmFibGVfdGlwX3BvcyI7aToxO3M6MjU6ImlzX3B3YV9pbnN0YWxsX2FsZXJ0X3Nob3ciO2k6MTtzOjE5OiJhdXRvX2NvbmZpcm1fb3JkZXJzIjtpOjA7fXM6MTA6IgAqAGNoYW5nZXMiO2E6MDp7fXM6MTE6IgAqAHByZXZpb3VzIjthOjA6e31zOjg6IgAqAGNhc3RzIjthOjY6e3M6MTc6ImxpY2Vuc2VfZXhwaXJlX29uIjtzOjg6ImRhdGV0aW1lIjtzOjE1OiJ0cmlhbF9leHBpcmVfb24iO3M6ODoiZGF0ZXRpbWUiO3M6MTg6ImxpY2Vuc2VfdXBkYXRlZF9hdCI7czo4OiJkYXRldGltZSI7czoyMzoic3Vic2NyaXB0aW9uX3VwZGF0ZWRfYXQiO3M6ODoiZGF0ZXRpbWUiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6ODoiZGF0ZXRpbWUiO3M6MTA6InVwZGF0ZWRfYXQiO3M6ODoiZGF0ZXRpbWUiO31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czoyMToiACoAYXR0cmlidXRlQ2FzdENhY2hlIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MTp7aTowO3M6ODoibG9nb191cmwiO31zOjE5OiIAKgBkaXNwYXRjaGVzRXZlbnRzIjthOjA6e31zOjE0OiIAKgBvYnNlcnZhYmxlcyI7YTowOnt9czoxMjoiACoAcmVsYXRpb25zIjthOjE6e3M6ODoiYnJhbmNoZXMiO086Mzk6IklsbHVtaW5hdGVcRGF0YWJhc2VcRWxvcXVlbnRcQ29sbGVjdGlvbiI6Mjp7czo4OiIAKgBpdGVtcyI7YToxOntpOjA7TzoxNzoiQXBwXE1vZGVsc1xCcmFuY2giOjMzOntzOjEzOiIAKgBjb25uZWN0aW9uIjtzOjU6Im15c3FsIjtzOjg6IgAqAHRhYmxlIjtzOjg6ImJyYW5jaGVzIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6MTk6e3M6MjoiaWQiO2k6NDtzOjExOiJ1bmlxdWVfaGFzaCI7czoyMDoiOGFkYzUxN2VmMmFlN2ZjM2I2OTciO3M6MTM6InJlc3RhdXJhbnRfaWQiO2k6MztzOjQ6Im5hbWUiO3M6MjI6IkJhY2tQYXNzIEFjY3JhIENlbnRyYWwiO3M6MTg6ImNsb25lZF9icmFuY2hfbmFtZSI7TjtzOjE2OiJjbG9uZWRfYnJhbmNoX2lkIjtOO3M6MTM6ImlzX21lbnVfY2xvbmUiO2k6MDtzOjI0OiJpc19pdGVtX2NhdGVnb3JpZXNfY2xvbmUiO2k6MDtzOjE5OiJpc19tZW51X2l0ZW1zX2Nsb25lIjtpOjA7czoyMzoiaXNfaXRlbV9tb2RpZmllcnNfY2xvbmUiO2k6MDtzOjI5OiJpc19jbG9uZV9yZXNlcnZhdGlvbl9zZXR0aW5ncyI7aTowO3M6MjY6ImlzX2Nsb25lX2RlbGl2ZXJ5X3NldHRpbmdzIjtpOjA7czoyMDoiaXNfY2xvbmVfa290X3NldHRpbmciO2k6MDtzOjI1OiJpc19tb2RpZmllcnNfZ3JvdXBzX2Nsb25lIjtpOjA7czo3OiJhZGRyZXNzIjtzOjY1OiJCYWNrUGFzcyBSZXN0YXVyYW50LApBc2Fmb2F0c2UgTmV0dGV5IFJkLCAKQWNjcmEsIEdyZWF0ZXIgQWNjcmEuICI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNS0wNS0zMCAwODozMzowNCI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNy0xMiAyMDoxNzowMCI7czozOiJsYXQiO047czozOiJsbmciO047fXM6MTE6IgAqAG9yaWdpbmFsIjthOjE5OntzOjI6ImlkIjtpOjQ7czoxMToidW5pcXVlX2hhc2giO3M6MjA6IjhhZGM1MTdlZjJhZTdmYzNiNjk3IjtzOjEzOiJyZXN0YXVyYW50X2lkIjtpOjM7czo0OiJuYW1lIjtzOjIyOiJCYWNrUGFzcyBBY2NyYSBDZW50cmFsIjtzOjE4OiJjbG9uZWRfYnJhbmNoX25hbWUiO047czoxNjoiY2xvbmVkX2JyYW5j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cmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6NjI6e3M6MjoiaWQiO2k6MztzOjQ6Im5hbWUiO3M6MTk6IkJhY2tQYXNzIFJlc3RhdXJhbnQiO3M6NDoiaGFzaCI7czoxOToiYmFja3Bhc3MtcmVzdGF1cmFudCI7czo3OiJhZGRyZXNzIjtzOjY1OiJCYWNrUGFzcyBSZXN0YXVyYW50LApBc2Fmb2F0c2UgTmV0dGV5IFJkLCAKQWNjcmEsIEdyZWF0ZXIgQWNjcmEuICI7czoxMjoicGhvbmVfbnVtYmVyIjtpOjMwMjY2NTIwMTtzOjEwOiJwaG9uZV9jb2RlIjtpOjI0MjtzOjU6ImVtYWlsIjtzOjIyOiJiYXJvbmVzc2RhOTlAZ21haWwuY29tIjtzOjg6InRpbWV6b25lIjtzOjEyOiJBZnJpY2EvQWNjcmEiO3M6OToidGhlbWVfaGV4IjtzOjc6IiMxMjI2YWMiO3M6OToidGhlbWVfcmdiIjtzOjExOiIxOCwgMzgsIDE3MiI7czo0OiJsb2dvIjtzOjM2OiJlNGZjNWQ3Y2Y1ZDA5YWY4OTNkYzhmYjE2NzBlMzU2Ny5qcGciO3M6MTA6ImNvdW50cnlfaWQiO2k6ODQ7czoxNToiaGlkZV9uZXdfb3JkZXJzIjtpOjA7czoyMToiaGlkZV9uZXdfcmVzZXJ2YXRpb25zIjtpOjA7czoyMzoiaGlkZV9uZXdfd2FpdGVyX3JlcXVlc3QiO2k6MDtzOjExOiJjdXJyZW5jeV9pZCI7aTo5O3M6MTI6ImxpY2Vuc2VfdHlwZSI7czo0OiJmcmVlIjtzOjk6ImlzX2FjdGl2ZSI7aToxO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMDUtMzAgMDg6MzM6MDQiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjUgMTI6MjA6NDgiO3M6MjM6ImN1c3RvbWVyX2xvZ2luX3JlcXVpcmVkIjtpOjA7czo4OiJhYm91dF91cyI7czoxMDcxOiI8ZGl2PiZuYnNwO1dlbGNvbWUgdG8gb3VyIHJlc3RhdXJhbnQsIHdoZXJlIGdyZWF0IGZvb2QgYW5kIGdvb2QgdmliZXMgY29tZSB0b2dldGhlciEgV2UncmUgYSBsb2NhbCwgZmFtaWx5LW93bmVkIHNwb3QgdGhhdCBsb3ZlcyBicmluZ2luZyBwZW9wbGUgdG9nZXRoZXIgb3ZlciBkZWxpY2lvdXMgbWVhbHMgYW5kIHVuZm9yZ2V0dGFibGUgbW9tZW50cy4gV2hldGhlciB5b3UncmUgaGVyZSBmb3IgYSBxdWljayBiaXRlLCBhIGZhbWlseSBkaW5uZXIsIG9yIGEgY2VsZWJyYXRpb24sIHdlJ3JlIGFsbCBhYm91dCBtYWtpbmcgeW91ciB0aW1lIHdpdGggdXMgc3BlY2lhbC4mbmJzcDs8L2Rpdj48ZGl2PiZuYnNwO091ciBtZW51IGlzIHBhY2tlZCB3aXRoIGRpc2hlcyBtYWRlIGZyb20gZnJlc2gsIHF1YWxpdHkgaW5ncmVkaWVudHMgYmVjYXVzZSB3ZSBiZWxpZXZlIGZvb2Qgc2hvdWxkIHRhc3RlIGFzIGdvb2QgYXMgaXQgbWFrZXMgeW91IGZlZWwuIEZyb20gb3VyIHNpZ25hdHVyZSBkaXNoZXMgdG8gc2Vhc29uYWwgc3BlY2lhbHMsIHRoZXJlJ3MgYWx3YXlzIHNvbWV0aGluZyB0byBleGNpdGUgeW91ciB0YXN0ZSBidWRzLiZuYnNwOzwvZGl2PjxkaXY+Jm5ic3A7QnV0IHdlJ3JlIG5vdCBqdXN0IGFib3V0IHRoZSBmb29k4oCUd2UncmUgYWJvdXQgY29tbXVuaXR5LiBXZSBsb3ZlIHNlZWluZyBmYW1pbGlhciBmYWNlcyBhbmQgd2VsY29taW5nIG5ldyBvbmVzLiBPdXIgdGVhbSBpcyBhIGZ1biwgZnJpZW5kbHkgYnVuY2ggZGVkaWNhdGVkIHRvIHNlcnZpbmcgeW91IHdpdGggYSBzbWlsZSBhbmQgbWFraW5nIHN1cmUgZXZlcnkgdmlzaXQgZmVlbHMgbGlrZSBjb21pbmcgaG9tZS4mbmJzcDs8L2Rpdj48ZGl2PiZuYnNwO1NvLCBjb21lIG9uIGluLCBncmFiIGEgc2VhdCwgYW5kIGxldCB1cyB0YWtlIGNhcmUgb2YgdGhlIHJlc3QuIFdlIGNhbid0IHdhaXQgdG8gc2hhcmUgb3VyIGxvdmUgb2YgZm9vZCB3aXRoIHlvdSEmbmJzcDs8L2Rpdj48ZGl2PjxzdHJvbmc+QmFja1Bhc3MgUmVzdGF1cmFudCw8YnI+PC9zdHJvbmc+R29vZCBGb29kLCBHb29kIE1vb2QhIPCfjb3vuI/inKg8L2Rpdj4iO3M6MzA6ImFsbG93X2N1c3RvbWVyX2RlbGl2ZXJ5X29yZGVycyI7aToxO3M6Mjg6ImFsbG93X2N1c3RvbWVyX3BpY2t1cF9vcmRlcnMiO2k6MTtzOjIxOiJhbGxvd19jdXN0b21lcl9vcmRlcnMiO2k6MTtzOjIwOiJhbGxvd19kaW5lX2luX29yZGVycyI7aToxO3M6MTA6InBhY2thZ2VfaWQiO2k6MztzOjEyOiJwYWNrYWdlX3R5cGUiO3M6ODoibGlmZXRpbWUiO3M6Njoic3RhdHVzIjtzOjY6ImFjdGl2ZSI7czoxNzoibGljZW5zZV9leHBpcmVfb24iO047czoxMzoidHJpYWxfZW5kc19hdCI7TjtzOjE4OiJsaWNlbnNlX3VwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDUtMzAgMDg6MzM6MDQiO3M6MjM6InN1YnNjcmlwdGlvbl91cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA1LTMwIDA4OjMzOjA0IjtzOjk6InN0cmlwZV9pZCI7TjtzOjc6InBtX3R5cGUiO047czoxMjoicG1fbGFzdF9mb3VyIjtOO3M6MjU6ImlzX3dhaXRlcl9yZXF1ZXN0X2VuYWJsZWQiO2k6MTtzOjMyOiJkZWZhdWx0X3RhYmxlX3Jlc2VydmF0aW9uX3N0YXR1cyI7czo5OiJDb25maXJtZWQiO3M6MTU6ImFwcHJvdmFsX3N0YXR1cyI7czo4OiJBcHByb3ZlZCI7czoxNjoicmVqZWN0aW9uX3JlYXNvbiI7TjtzOjEzOiJmYWNlYm9va19saW5rIjtOO3M6MTQ6Imluc3RhZ3JhbV9saW5rIjtOO3M6MTI6InR3aXR0ZXJfbGluayI7TjtzOjk6InllbHBfbGluayI7TjtzOjE0OiJ0YWJsZV9yZXF1aXJlZCI7aTowO3M6MTQ6InNob3dfbG9nb190ZXh0IjtpOjE7czoxMjoibWV0YV9rZXl3b3JkIjtOO3M6MTY6Im1ldGFfZGVzY3JpcHRpb24iO047czozNDoidXBsb2FkX2Zhdl9pY29uX2FuZHJvaWRfY2hyb21lXzE5MiI7czoyNjoiYW5kcm9pZC1jaHJvbWUtMTkyeDE5Mi5wbmciO3M6MzQ6InVwbG9hZF9mYXZfaWNvbl9hbmRyb2lkX2Nocm9tZV81MTIiO3M6MjY6ImFuZHJvaWQtY2hyb21lLTUxMng1MTIucG5nIjtzOjMyOiJ1cGxvYWRfZmF2X2ljb25fYXBwbGVfdG91Y2hfaWNvbiI7czoyMDoiYXBwbGUtdG91Y2gtaWNvbi5wbmciO3M6MTc6InVwbG9hZF9mYXZpY29uXzE2IjtzOjE3OiJmYXZpY29uLTE2eDE2LnBuZyI7czoxNzoidXBsb2FkX2Zhdmljb25fMzIiO3M6MTc6ImZhdmljb24tMzJ4MzIucG5nIjtzOjc6ImZhdmljb24iO3M6MTE6ImZhdmljb24uaWNvIjtzOjM2OiJpc193YWl0ZXJfcmVxdWVzdF9lbmFibGVkX29uX2Rlc2t0b3AiO2k6MTtzOjM1OiJpc193YWl0ZXJfcmVxdWVzdF9lbmFibGVkX29uX21vYmlsZSI7aToxO3M6MzY6ImlzX3dhaXRlcl9yZXF1ZXN0X2VuYWJsZWRfb3Blbl9ieV9xciI7aTowO3M6MTE6IndlYm1hbmlmZXN0IjtOO3M6MTU6ImVuYWJsZV90aXBfc2hvcCI7aToxO3M6MTQ6ImVuYWJsZV90aXBfcG9zIjtpOjE7czoyNToiaXNfcHdhX2luc3RhbGxfYWxlcnRfc2hvdyI7aToxO3M6MTk6ImF1dG9fY29uZmlybV9vcmRlcnMiO2k6MDt9czoxMToiACoAb3JpZ2luYWwiO2E6NjI6e3M6MjoiaWQiO2k6MztzOjQ6Im5hbWUiO3M6MTk6IkJhY2tQYXNzIFJlc3RhdXJhbnQiO3M6NDoiaGFzaCI7czoxOToiYmFja3Bhc3MtcmVzdGF1cmFudCI7czo3OiJhZGRyZXNzIjtzOjY1OiJCYWNrUGFzcyBSZXN0YXVyYW50LApBc2Fmb2F0c2UgTmV0dGV5IFJkLCAKQWNjcmEsIEdyZWF0ZXIgQWNjcmEuICI7czoxMjoicGhvbmVfbnVtYmVyIjtzOjk6IjMwMjY2NTIwMSI7czoxMDoicGhvbmVfY29kZSI7czozOiIyNDIiO3M6NToiZW1haWwiO3M6MjI6ImJhcm9uZXNzZGE5OUBnbWFpbC5jb20iO3M6ODoidGltZXpvbmUiO3M6MTI6IkFmcmljYS9BY2NyYSI7czo5OiJ0aGVtZV9oZXgiO3M6NzoiIzEyMjZhYyI7czo5OiJ0aGVtZV9yZ2IiO3M6MTE6IjE4LCAzOCwgMTcyIjtzOjQ6ImxvZ28iO3M6MzY6ImU0ZmM1ZDdjZjVkMDlhZjg5M2RjOGZiMTY3MGUzNTY3LmpwZyI7czoxMDoiY291bnRyeV9pZCI7aTo4NDtzOjE1OiJoaWRlX25ld19vcmRlcnMiO2k6MDtzOjIxOiJoaWRlX25ld19yZXNlcnZhdGlvbnMiO2k6MDtzOjIzOiJoaWRlX25ld193YWl0ZXJfcmVxdWVzdCI7aTowO3M6MTE6ImN1cnJlbmN5X2lkIjtpOjk7czoxMjoibGljZW5zZV90eXBlIjtzOjQ6ImZyZWUiO3M6OToiaXNfYWN0aXZlIjtpOjE7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNS0wNS0zMCAwODozMzowNCI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNy0yNSAxMjoyMDo0OCI7czoyMzoiY3VzdG9tZXJfbG9naW5fcmVxdWlyZWQiO2k6MDtzOjg6ImFib3V0X3VzIjtzOjEwNzE6IjxkaXY+Jm5ic3A7V2VsY29tZSB0byBvdXIgcmVzdGF1cmFudCwgd2hlcmUgZ3JlYXQgZm9vZCBhbmQgZ29vZCB2aWJlcyBjb21lIHRvZ2V0aGVyISBXZSdyZSBhIGxvY2FsLCBmYW1pbHktb3duZWQgc3BvdCB0aGF0IGxvdmVzIGJyaW5naW5nIHBlb3BsZSB0b2dldGhlciBvdmVyIGRlbGljaW91cyBtZWFscyBhbmQgdW5mb3JnZXR0YWJsZSBtb21lbnRzLiBXaGV0aGVyIHlvdSdyZSBoZXJlIGZvciBhIHF1aWNrIGJpdGUsIGEgZmFtaWx5IGRpbm5lciwgb3IgYSBjZWxlYnJhdGlvbiwgd2UncmUgYWxsIGFib3V0IG1ha2luZyB5b3VyIHRpbWUgd2l0aCB1cyBzcGVjaWFsLiZuYnNwOzwvZGl2PjxkaXY+Jm5ic3A7T3VyIG1lbnUgaXMgcGFja2VkIHdpdGggZGlzaGVzIG1hZGUgZnJvbSBmcmVzaCwgcXVhbGl0eSBpbmdyZWRpZW50cyBiZWNhdXNlIHdlIGJlbGlldmUgZm9vZCBzaG91bGQgdGFzdGUgYXMgZ29vZCBhcyBpdCBtYWtlcyB5b3UgZmVlbC4gRnJvbSBvdXIgc2lnbmF0dXJlIGRpc2hlcyB0byBzZWFzb25hbCBzcGVjaWFscywgdGhlcmUncyBhbHdheXMgc29tZXRoaW5nIHRvIGV4Y2l0ZSB5b3VyIHRhc3RlIGJ1ZHMuJm5ic3A7PC9kaXY+PGRpdj4mbmJzcDtCdXQgd2UncmUgbm90IGp1c3QgYWJvdXQgdGhlIGZvb2TigJR3ZSdyZSBhYm91dCBjb21tdW5pdHkuIFdlIGxvdmUgc2VlaW5nIGZhbWlsaWFyIGZhY2VzIGFuZCB3ZWxjb21pbmcgbmV3IG9uZXMuIE91ciB0ZWFtIGlzIGEgZnVuLCBmcmllbmRseSBidW5jaCBkZWRpY2F0ZWQgdG8gc2VydmluZyB5b3Ugd2l0aCBhIHNtaWxlIGFuZCBtYWtpbmcgc3VyZSBldmVyeSB2aXNpdCBmZWVscyBsaWtlIGNvbWluZyBob21lLiZuYnNwOzwvZGl2PjxkaXY+Jm5ic3A7U28sIGNvbWUgb24gaW4sIGdyYWIgYSBzZWF0LCBhbmQgbGV0IHVzIHRha2UgY2FyZSBvZiB0aGUgcmVzdC4gV2UgY2FuJ3Qgd2FpdCB0byBzaGFyZSBvdXIgbG92ZSBvZiBmb29kIHdpdGggeW91ISZuYnNwOzwvZGl2PjxkaXY+PHN0cm9uZz5CYWNrUGFzcyBSZXN0YXVyYW50LDxicj48L3N0cm9uZz5Hb29kIEZvb2QsIEdvb2QgTW9vZCEg8J+Nve+4j+KcqDwvZGl2PiI7czozMDoiYWxsb3dfY3VzdG9tZXJfZGVsaXZlcnlfb3JkZXJzIjtpOjE7czoyODoiYWxsb3dfY3VzdG9tZXJfcGlja3VwX29yZGVycyI7aToxO3M6MjE6ImFsbG93X2N1c3RvbWVyX29yZGVycyI7aToxO3M6MjA6ImFsbG93X2RpbmVfaW5fb3JkZXJzIjtpOjE7czoxMDoicGFja2FnZV9pZCI7aTozO3M6MTI6InBhY2thZ2VfdHlwZSI7czo4OiJsaWZldGltZSI7czo2OiJzdGF0dXMiO3M6NjoiYWN0aXZlIjtzOjE3OiJsaWNlbnNlX2V4cGlyZV9vbiI7TjtzOjEzOiJ0cmlhbF9lbmRzX2F0IjtOO3M6MTg6ImxpY2Vuc2VfdXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNS0zMCAwODozMzowNCI7czoyMzoic3Vic2NyaXB0aW9uX3VwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDUtMzAgMDg6MzM6MDQiO3M6OToic3RyaXBlX2lkIjtOO3M6NzoicG1fdHlwZSI7TjtzOjEyOiJwbV9sYXN0X2ZvdXIiO047czoyNToiaXNfd2FpdGVyX3JlcXVlc3RfZW5hYmxlZCI7aToxO3M6MzI6ImRlZmF1bHRfdGFibGVfcmVzZXJ2YXRpb25fc3RhdHVzIjtzOjk6IkNvbmZpcm1lZCI7czoxNToiYXBwcm92YWxfc3RhdHVzIjtzOjg6IkFwcHJvdmVkIjtzOjE2OiJyZWplY3Rpb25fcmVhc29uIjtOO3M6MTM6ImZhY2Vib29rX2xpbmsiO047czoxNDoiaW5zdGFncmFtX2xpbmsiO047czoxMjoidHdpdHRlcl9saW5rIjtOO3M6OToieWVscF9saW5rIjtOO3M6MTQ6InRhYmxlX3JlcXVpcmVkIjtpOjA7czoxNDoic2hvd19sb2dvX3RleHQiO2k6MTtzOjEyOiJtZXRhX2tleXdvcmQiO047czoxNjoibWV0YV9kZXNjcmlwdGlvbiI7TjtzOjM0OiJ1cGxvYWRfZmF2X2ljb25fYW5kcm9pZF9jaHJvbWVfMTkyIjtzOjI2OiJhbmRyb2lkLWNocm9tZS0xOTJ4MTkyLnBuZyI7czozNDoidXBsb2FkX2Zhdl9pY29uX2FuZHJvaWRfY2hyb21lXzUxMiI7czoyNjoiYW5kcm9pZC1jaHJvbWUtNTEyeDUxMi5wbmciO3M6MzI6InVwbG9hZF9mYXZfaWNvbl9hcHBsZV90b3VjaF9pY29uIjtzOjIwOiJhcHBsZS10b3VjaC1pY29uLnBuZyI7czoxNzoidXBsb2FkX2Zhdmljb25fMTYiO3M6MTc6ImZhdmljb24tMTZ4MTYucG5nIjtzOjE3OiJ1cGxvYWRfZmF2aWNvbl8zMiI7czoxNzoiZmF2aWNvbi0zMngzMi5wbmciO3M6NzoiZmF2aWNvbiI7czoxMToiZmF2aWNvbi5pY28iO3M6MzY6ImlzX3dhaXRlcl9yZXF1ZXN0X2VuYWJsZWRfb25fZGVza3RvcCI7aToxO3M6MzU6ImlzX3dhaXRlcl9yZXF1ZXN0X2VuYWJsZWRfb25fbW9iaWxlIjtpOjE7czozNjoiaXNfd2FpdGVyX3JlcXVlc3RfZW5hYmxlZF9vcGVuX2J5X3FyIjtpOjA7czoxMToid2VibWFuaWZlc3QiO047czoxNToiZW5hYmxlX3RpcF9zaG9wIjtpOjE7czoxNDoiZW5hYmxlX3RpcF9wb3MiO2k6MTtzOjI1OiJpc19wd2FfaW5zdGFsbF9hbGVydF9zaG93IjtpOjE7czoxOToiYXV0b19jb25maXJtX29yZGVycyI7aTowO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjExOiIAKgBwcmV2aW91cyI7YTowOnt9czo4OiIAKgBjYXN0cyI7YTo2OntzOjE3OiJsaWNlbnNlX2V4cGlyZV9vbiI7czo4OiJkYXRldGltZSI7czoxNToidHJpYWxfZXhwaXJlX29uIjtzOjg6ImRhdGV0aW1lIjtzOjE4OiJsaWNlbnNlX3VwZGF0ZWRfYXQiO3M6ODoiZGF0ZXRpbWUiO3M6MjM6InN1YnNjcmlwdGlvbl91cGRhdGVkX2F0IjtzOjg6ImRhdGV0aW1lIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjg6ImRhdGV0aW1lIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjg6ImRhdGV0aW1lIjt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6MjE6IgAqAGF0dHJpYnV0ZUNhc3RDYWNoZSI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEw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O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6NjI6e3M6MjoiaWQiO2k6MztzOjQ6Im5hbWUiO3M6MTk6IkJhY2tQYXNzIFJlc3RhdXJhbnQiO3M6NDoiaGFzaCI7czoxOToiYmFja3Bhc3MtcmVzdGF1cmFudCI7czo3OiJhZGRyZXNzIjtzOjY1OiJCYWNrUGFzcyBSZXN0YXVyYW50LApBc2Fmb2F0c2UgTmV0dGV5IFJkLCAKQWNjcmEsIEdyZWF0ZXIgQWNjcmEuICI7czoxMjoicGhvbmVfbnVtYmVyIjtpOjMwMjY2NTIwMTtzOjEwOiJwaG9uZV9jb2RlIjtpOjI0MjtzOjU6ImVtYWlsIjtzOjIyOiJiYXJvbmVzc2RhOTlAZ21haWwuY29tIjtzOjg6InRpbWV6b25lIjtzOjEyOiJBZnJpY2EvQWNjcmEiO3M6OToidGhlbWVfaGV4IjtzOjc6IiMxMjI2YWMiO3M6OToidGhlbWVfcmdiIjtzOjExOiIxOCwgMzgsIDE3MiI7czo0OiJsb2dvIjtzOjM2OiJlNGZjNWQ3Y2Y1ZDA5YWY4OTNkYzhmYjE2NzBlMzU2Ny5qcGciO3M6MTA6ImNvdW50cnlfaWQiO2k6ODQ7czoxNToiaGlkZV9uZXdfb3JkZXJzIjtpOjA7czoyMToiaGlkZV9uZXdfcmVzZXJ2YXRpb25zIjtpOjA7czoyMzoiaGlkZV9uZXdfd2FpdGVyX3JlcXVlc3QiO2k6MDtzOjExOiJjdXJyZW5jeV9pZCI7aTo5O3M6MTI6ImxpY2Vuc2VfdHlwZSI7czo0OiJmcmVlIjtzOjk6ImlzX2FjdGl2ZSI7aToxO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMDUtMzAgMDg6MzM6MDQiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjUgMTI6MjA6NDgiO3M6MjM6ImN1c3RvbWVyX2xvZ2luX3JlcXVpcmVkIjtpOjA7czo4OiJhYm91dF91cyI7czoxMDcxOiI8ZGl2PiZuYnNwO1dlbGNvbWUgdG8gb3VyIHJlc3RhdXJhbnQsIHdoZXJlIGdyZWF0IGZvb2QgYW5kIGdvb2QgdmliZXMgY29tZSB0b2dldGhlciEgV2UncmUgYSBsb2NhbCwgZmFtaWx5LW93bmVkIHNwb3QgdGhhdCBsb3ZlcyBicmluZ2luZyBwZW9wbGUgdG9nZXRoZXIgb3ZlciBkZWxpY2lvdXMgbWVhbHMgYW5kIHVuZm9yZ2V0dGFibGUgbW9tZW50cy4gV2hldGhlciB5b3UncmUgaGVyZSBmb3IgYSBxdWljayBiaXRlLCBhIGZhbWlseSBkaW5uZXIsIG9yIGEgY2VsZWJyYXRpb24sIHdlJ3JlIGFsbCBhYm91dCBtYWtpbmcgeW91ciB0aW1lIHdpdGggdXMgc3BlY2lhbC4mbmJzcDs8L2Rpdj48ZGl2PiZuYnNwO091ciBtZW51IGlzIHBhY2tlZCB3aXRoIGRpc2hlcyBtYWRlIGZyb20gZnJlc2gsIHF1YWxpdHkgaW5ncmVkaWVudHMgYmVjYXVzZSB3ZSBiZWxpZXZlIGZvb2Qgc2hvdWxkIHRhc3RlIGFzIGdvb2QgYXMgaXQgbWFrZXMgeW91IGZlZWwuIEZyb20gb3VyIHNpZ25hdHVyZSBkaXNoZXMgdG8gc2Vhc29uYWwgc3BlY2lhbHMsIHRoZXJlJ3MgYWx3YXlzIHNvbWV0aGluZyB0byBleGNpdGUgeW91ciB0YXN0ZSBidWRzLiZuYnNwOzwvZGl2PjxkaXY+Jm5ic3A7QnV0IHdlJ3JlIG5vdCBqdXN0IGFib3V0IHRoZSBmb29k4oCUd2UncmUgYWJvdXQgY29tbXVuaXR5LiBXZSBsb3ZlIHNlZWluZyBmYW1pbGlhciBmYWNlcyBhbmQgd2VsY29taW5nIG5ldyBvbmVzLiBPdXIgdGVhbSBpcyBhIGZ1biwgZnJpZW5kbHkgYnVuY2ggZGVkaWNhdGVkIHRvIHNlcnZpbmcgeW91IHdpdGggYSBzbWlsZSBhbmQgbWFraW5nIHN1cmUgZXZlcnkgdmlzaXQgZmVlbHMgbGlrZSBjb21pbmcgaG9tZS4mbmJzcDs8L2Rpdj48ZGl2PiZuYnNwO1NvLCBjb21lIG9uIGluLCBncmFiIGEgc2VhdCwgYW5kIGxldCB1cyB0YWtlIGNhcmUgb2YgdGhlIHJlc3QuIFdlIGNhbid0IHdhaXQgdG8gc2hhcmUgb3VyIGxvdmUgb2YgZm9vZCB3aXRoIHlvdSEmbmJzcDs8L2Rpdj48ZGl2PjxzdHJvbmc+QmFja1Bhc3MgUmVzdGF1cmFudCw8YnI+PC9zdHJvbmc+R29vZCBGb29kLCBHb29kIE1vb2QhIPCfjb3vuI/inKg8L2Rpdj4iO3M6MzA6ImFsbG93X2N1c3RvbWVyX2RlbGl2ZXJ5X29yZGVycyI7aToxO3M6Mjg6ImFsbG93X2N1c3RvbWVyX3BpY2t1cF9vcmRlcnMiO2k6MTtzOjIxOiJhbGxvd19jdXN0b21lcl9vcmRlcnMiO2k6MTtzOjIwOiJhbGxvd19kaW5lX2luX29yZGVycyI7aToxO3M6MTA6InBhY2thZ2VfaWQiO2k6MztzOjEyOiJwYWNrYWdlX3R5cGUiO3M6ODoibGlmZXRpbWUiO3M6Njoic3RhdHVzIjtzOjY6ImFjdGl2ZSI7czoxNzoibGljZW5zZV9leHBpcmVfb24iO047czoxMzoidHJpYWxfZW5kc19hdCI7TjtzOjE4OiJsaWNlbnNlX3VwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDUtMzAgMDg6MzM6MDQiO3M6MjM6InN1YnNjcmlwdGlvbl91cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA1LTMwIDA4OjMzOjA0IjtzOjk6InN0cmlwZV9pZCI7TjtzOjc6InBtX3R5cGUiO047czoxMjoicG1fbGFzdF9mb3VyIjtOO3M6MjU6ImlzX3dhaXRlcl9yZXF1ZXN0X2VuYWJsZWQiO2k6MTtzOjMyOiJkZWZhdWx0X3RhYmxlX3Jlc2VydmF0aW9uX3N0YXR1cyI7czo5OiJDb25maXJtZWQiO3M6MTU6ImFwcHJvdmFsX3N0YXR1cyI7czo4OiJBcHByb3ZlZCI7czoxNjoicmVqZWN0aW9uX3JlYXNvbiI7TjtzOjEzOiJmYWNlYm9va19saW5rIjtOO3M6MTQ6Imluc3RhZ3JhbV9saW5rIjtOO3M6MTI6InR3aXR0ZXJfbGluayI7TjtzOjk6InllbHBfbGluayI7TjtzOjE0OiJ0YWJsZV9yZXF1aXJlZCI7aTowO3M6MTQ6InNob3dfbG9nb190ZXh0IjtpOjE7czoxMjoibWV0YV9rZXl3b3JkIjtOO3M6MTY6Im1ldGFfZGVzY3JpcHRpb24iO047czozNDoidXBsb2FkX2Zhdl9pY29uX2FuZHJvaWRfY2hyb21lXzE5MiI7czoyNjoiYW5kcm9pZC1jaHJvbWUtMTkyeDE5Mi5wbmciO3M6MzQ6InVwbG9hZF9mYXZfaWNvbl9hbmRyb2lkX2Nocm9tZV81MTIiO3M6MjY6ImFuZHJvaWQtY2hyb21lLTUxMng1MTIucG5nIjtzOjMyOiJ1cGxvYWRfZmF2X2ljb25fYXBwbGVfdG91Y2hfaWNvbiI7czoyMDoiYXBwbGUtdG91Y2gtaWNvbi5wbmciO3M6MTc6InVwbG9hZF9mYXZpY29uXzE2IjtzOjE3OiJmYXZpY29uLTE2eDE2LnBuZyI7czoxNzoidXBsb2FkX2Zhdmljb25fMzIiO3M6MTc6ImZhdmljb24tMzJ4MzIucG5nIjtzOjc6ImZhdmljb24iO3M6MTE6ImZhdmljb24uaWNvIjtzOjM2OiJpc193YWl0ZXJfcmVxdWVzdF9lbmFibGVkX29uX2Rlc2t0b3AiO2k6MTtzOjM1OiJpc193YWl0ZXJfcmVxdWVzdF9lbmFibGVkX29uX21vYmlsZSI7aToxO3M6MzY6ImlzX3dhaXRlcl9yZXF1ZXN0X2VuYWJsZWRfb3Blbl9ieV9xciI7aTowO3M6MTE6IndlYm1hbmlmZXN0IjtOO3M6MTU6ImVuYWJsZV90aXBfc2hvcCI7aToxO3M6MTQ6ImVuYWJsZV90aXBfcG9zIjtpOjE7czoyNToiaXNfcHdhX2luc3RhbGxfYWxlcnRfc2hvdyI7aToxO3M6MTk6ImF1dG9fY29uZmlybV9vcmRlcnMiO2k6MDt9czoxMToiACoAb3JpZ2luYWwiO2E6NjI6e3M6MjoiaWQiO2k6MztzOjQ6Im5hbWUiO3M6MTk6IkJhY2tQYXNzIFJlc3RhdXJhbnQiO3M6NDoiaGFzaCI7czoxOToiYmFja3Bhc3MtcmVzdGF1cmFudCI7czo3OiJhZGRyZXNzIjtzOjY1OiJCYWNrUGFzcyBSZXN0YXVyYW50LApBc2Fmb2F0c2UgTmV0dGV5IFJkLCAKQWNjcmEsIEdyZWF0ZXIgQWNjcmEuICI7czoxMjoicGhvbmVfbnVtYmVyIjtzOjk6IjMwMjY2NTIwMSI7czoxMDoicGhvbmVfY29kZSI7czozOiIyNDIiO3M6NToiZW1haWwiO3M6MjI6ImJhcm9uZXNzZGE5OUBnbWFpbC5jb20iO3M6ODoidGltZXpvbmUiO3M6MTI6IkFmcmljYS9BY2NyYSI7czo5OiJ0aGVtZV9oZXgiO3M6NzoiIzEyMjZhYyI7czo5OiJ0aGVtZV9yZ2IiO3M6MTE6IjE4LCAzOCwgMTcyIjtzOjQ6ImxvZ28iO3M6MzY6ImU0ZmM1ZDdjZjVkMDlhZjg5M2RjOGZiMTY3MGUzNTY3LmpwZyI7czoxMDoiY291bnRyeV9pZCI7aTo4NDtzOjE1OiJoaWRlX25ld19vcmRlcnMiO2k6MDtzOjIxOiJoaWRlX25ld19yZXNlcnZhdGlvbnMiO2k6MDtzOjIzOiJoaWRlX25ld193YWl0ZXJfcmVxdWVzdCI7aTowO3M6MTE6ImN1cnJlbmN5X2lkIjtpOjk7czoxMjoibGljZW5zZV90eXBlIjtzOjQ6ImZyZWUiO3M6OToiaXNfYWN0aXZlIjtpOjE7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNS0wNS0zMCAwODozMzowNCI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNy0yNSAxMjoyMDo0OCI7czoyMzoiY3VzdG9tZXJfbG9naW5fcmVxdWlyZWQiO2k6MDtzOjg6ImFib3V0X3VzIjtzOjEwNzE6IjxkaXY+Jm5ic3A7V2VsY29tZSB0byBvdXIgcmVzdGF1cmFudCwgd2hlcmUgZ3JlYXQgZm9vZCBhbmQgZ29vZCB2aWJlcyBjb21lIHRvZ2V0aGVyISBXZSdyZSBhIGxvY2FsLCBmYW1pbHktb3duZWQgc3BvdCB0aGF0IGxvdmVzIGJyaW5naW5nIHBlb3BsZSB0b2dldGhlciBvdmVyIGRlbGljaW91cyBtZWFscyBhbmQgdW5mb3JnZXR0YWJsZSBtb21lbnRzLiBXaGV0aGVyIHlvdSdyZSBoZXJlIGZvciBhIHF1aWNrIGJpdGUsIGEgZmFtaWx5IGRpbm5lciwgb3IgYSBjZWxlYnJhdGlvbiwgd2UncmUgYWxsIGFib3V0IG1ha2luZyB5b3VyIHRpbWUgd2l0aCB1cyBzcGVjaWFsLiZuYnNwOzwvZGl2PjxkaXY+Jm5ic3A7T3VyIG1lbnUgaXMgcGFja2VkIHdpdGggZGlzaGVzIG1hZGUgZnJvbSBmcmVzaCwgcXVhbGl0eSBpbmdyZWRpZW50cyBiZWNhdXNlIHdlIGJlbGlldmUgZm9vZCBzaG91bGQgdGFzdGUgYXMgZ29vZCBhcyBpdCBtYWtlcyB5b3UgZmVlbC4gRnJvbSBvdXIgc2lnbmF0dXJlIGRpc2hlcyB0byBzZWFzb25hbCBzcGVjaWFscywgdGhlcmUncyBhbHdheXMgc29tZXRoaW5nIHRvIGV4Y2l0ZSB5b3VyIHRhc3RlIGJ1ZHMuJm5ic3A7PC9kaXY+PGRpdj4mbmJzcDtCdXQgd2UncmUgbm90IGp1c3QgYWJvdXQgdGhlIGZvb2TigJR3ZSdyZSBhYm91dCBjb21tdW5pdHkuIFdlIGxvdmUgc2VlaW5nIGZhbWlsaWFyIGZhY2VzIGFuZCB3ZWxjb21pbmcgbmV3IG9uZXMuIE91ciB0ZWFtIGlzIGEgZnVuLCBmcmllbmRseSBidW5jaCBkZWRpY2F0ZWQgdG8gc2VydmluZyB5b3Ugd2l0aCBhIHNtaWxlIGFuZCBtYWtpbmcgc3VyZSBldmVyeSB2aXNpdCBmZWVscyBsaWtlIGNvbWluZyBob21lLiZuYnNwOzwvZGl2PjxkaXY+Jm5ic3A7U28sIGNvbWUgb24gaW4sIGdyYWIgYSBzZWF0LCBhbmQgbGV0IHVzIHRha2UgY2FyZSBvZiB0aGUgcmVzdC4gV2UgY2FuJ3Qgd2FpdCB0byBzaGFyZSBvdXIgbG92ZSBvZiBmb29kIHdpdGggeW91ISZuYnNwOzwvZGl2PjxkaXY+PHN0cm9uZz5CYWNrUGFzcyBSZXN0YXVyYW50LDxicj48L3N0cm9uZz5Hb29kIEZvb2QsIEdvb2QgTW9vZCEg8J+Nve+4j+KcqDwvZGl2PiI7czozMDoiYWxsb3dfY3VzdG9tZXJfZGVsaXZlcnlfb3JkZXJzIjtpOjE7czoyODoiYWxsb3dfY3VzdG9tZXJfcGlja3VwX29yZGVycyI7aToxO3M6MjE6ImFsbG93X2N1c3RvbWVyX29yZGVycyI7aToxO3M6MjA6ImFsbG93X2RpbmVfaW5fb3JkZXJzIjtpOjE7czoxMDoicGFja2FnZV9pZCI7aTozO3M6MTI6InBhY2thZ2VfdHlwZSI7czo4OiJsaWZldGltZSI7czo2OiJzdGF0dXMiO3M6NjoiYWN0aXZlIjtzOjE3OiJsaWNlbnNlX2V4cGlyZV9vbiI7TjtzOjEzOiJ0cmlhbF9lbmRzX2F0IjtOO3M6MTg6ImxpY2Vuc2VfdXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNS0zMCAwODozMzowNCI7czoyMzoic3Vic2NyaXB0aW9uX3VwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDUtMzAgMDg6MzM6MDQiO3M6OToic3RyaXBlX2lkIjtOO3M6NzoicG1fdHlwZSI7TjtzOjEyOiJwbV9sYXN0X2ZvdXIiO047czoyNToiaXNfd2FpdGVyX3JlcXVlc3RfZW5hYmxlZCI7aToxO3M6MzI6ImRlZmF1bHRfdGFibGVfcmVzZXJ2YXRpb25fc3RhdHVzIjtzOjk6IkNvbmZpcm1lZCI7czoxNToiYXBwcm92YWxfc3RhdHVzIjtzOjg6IkFwcHJvdmVkIjtzOjE2OiJyZWplY3Rpb25fcmVhc29uIjtOO3M6MTM6ImZhY2Vib29rX2xpbmsiO047czoxNDoiaW5zdGFncmFtX2xpbmsiO047czoxMjoidHdpdHRlcl9saW5rIjtOO3M6OToieWVscF9saW5rIjtOO3M6MTQ6InRhYmxlX3JlcXVpcmVkIjtpOjA7czoxNDoic2hvd19sb2dvX3RleHQiO2k6MTtzOjEyOiJtZXRhX2tleXdvcmQiO047czoxNjoibWV0YV9kZXNjcmlwdGlvbiI7TjtzOjM0OiJ1cGxvYWRfZmF2X2ljb25fYW5kcm9pZF9jaHJvbWVfMTkyIjtzOjI2OiJhbmRyb2lkLWNocm9tZS0xOTJ4MTkyLnBuZyI7czozNDoidXBsb2FkX2Zhdl9pY29uX2FuZHJvaWRfY2hyb21lXzUxMiI7czoyNjoiYW5kcm9pZC1jaHJvbWUtNTEyeDUxMi5wbmciO3M6MzI6InVwbG9hZF9mYXZfaWNvbl9hcHBsZV90b3VjaF9pY29uIjtzOjIwOiJhcHBsZS10b3VjaC1pY29uLnBuZyI7czoxNzoidXBsb2FkX2Zhdmljb25fMTYiO3M6MTc6ImZhdmljb24tMTZ4MTYucG5nIjtzOjE3OiJ1cGxvYWRfZmF2aWNvbl8zMiI7czoxNzoiZmF2aWNvbi0zMngzMi5wbmciO3M6NzoiZmF2aWNvbiI7czoxMToiZmF2aWNvbi5pY28iO3M6MzY6ImlzX3dhaXRlcl9yZXF1ZXN0X2VuYWJsZWRfb25fZGVza3RvcCI7aToxO3M6MzU6ImlzX3dhaXRlcl9yZXF1ZXN0X2VuYWJsZWRfb25fbW9iaWxlIjtpOjE7czozNjoiaXNfd2FpdGVyX3JlcXVlc3RfZW5hYmxlZF9vcGVuX2J5X3FyIjtpOjA7czoxMToid2VibWFuaWZlc3QiO047czoxNToiZW5hYmxlX3RpcF9zaG9wIjtpOjE7czoxNDoiZW5hYmxlX3RpcF9wb3MiO2k6MTtzOjI1OiJpc19wd2FfaW5zdGFsbF9hbGVydF9zaG93IjtpOjE7czoxOToiYXV0b19jb25maXJtX29yZGVycyI7aTowO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjExOiIAKgBwcmV2aW91cyI7YTowOnt9czo4OiIAKgBjYXN0cyI7YTo2OntzOjE3OiJsaWNlbnNlX2V4cGlyZV9vbiI7czo4OiJkYXRldGltZSI7czoxNToidHJpYWxfZXhwaXJlX29uIjtzOjg6ImRhdGV0aW1lIjtzOjE4OiJsaWNlbnNlX3VwZGF0ZWRfYXQiO3M6ODoiZGF0ZXRpbWUiO3M6MjM6InN1YnNjcmlwdGlvbl91cGRhdGVkX2F0IjtzOjg6ImRhdGV0aW1lIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjg6ImRhdGV0aW1lIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjg6ImRhdGV0aW1lIjt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6MjE6IgAqAGF0dHJpYnV0ZUNhc3RDYWNoZSI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjE6e2k6MDtzOjg6ImxvZ29fdXJsIjt9czoxOToiACoAZGlzcGF0Y2hlc0V2ZW50cyI7YTowOnt9czoxNDoiACoAb2JzZXJ2YWJsZXMiO2E6MDp7fXM6MTI6IgAqAHJlbGF0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YnV0ZXMiO2E6MzM6e3M6MjoiaWQiO2k6MztzOjEyOiJwYWNrYWdlX25hbWUiO3M6OToiTGlmZSBUaW1lIjtzOjU6InByaWNlIjtzOjY6IjE5OS4wMCI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNS0wNC0xOCAwNjowMjowNSI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNy0xMiAxODoxMjozMCI7czoxMToiY3VycmVuY3lfaWQiO2k6MTtzOjExOiJkZXNjcmlwdGlvbiI7czozMzoiVGhpcyBpcyBhIGxpZmV0aW1lIGFjY2VzcyBwYWNrYWdlIjtzOjEyOiJhbm51YWxfcHJpY2UiO047czoxMzoibW9udGhseV9wcmljZSI7TjtzOjE0OiJtb250aGx5X3N0YXR1cyI7aTowO3M6MTM6ImFubnVhbF9zdGF0dXMiO2k6MDtzOjIxOiJzdHJpcGVfYW5udWFsX3BsYW5faWQiO047czoyMjoic3RyaXBlX21vbnRobHlfcGxhbl9pZCI7TjtzOjIzOiJyYXpvcnBheV9hbm51YWxfcGxhbl9pZCI7TjtzOjI0OiJyYXpvcnBheV9tb250aGx5X3BsYW5faWQiO047czoyNjoiZmx1dHRlcndhdmVfYW5udWFsX3BsYW5faWQiO047czoyNzoiZmx1dHRlcndhdmVfbW9udGhseV9wbGFuX2lkIjtOO3M6MjM6InBheXN0YWNrX2FubnVhbF9wbGFuX2lkIjtOO3M6MjQ6InBheXN0YWNrX21vbnRobHlfcGxhbl9pZCI7TjtzOjIzOiJzdHJpcGVfbGlmZXRpbWVfcGxhbl9pZCI7TjtzOjI1OiJyYXpvcnBheV9saWZldGltZV9wbGFuX2lkIjtOO3M6MTM6ImJpbGxpbmdfY3ljbGUiO2k6MDtzOjEwOiJzb3J0X29yZGVyIjtpOjM7czoxMDoiaXNfcHJpdmF0ZSI7aTowO3M6NzoiaXNfZnJlZSI7aTowO3M6MTQ6ImlzX3JlY29tbWVuZGVkIjtpOjE7czoxMjoicGFja2FnZV90eXBlIjtzOjg6ImxpZmV0aW1lIjtzOjEyOiJ0cmlhbF9zdGF0dXMiO047czoxMDoidHJpYWxfZGF5cyI7TjtzOjMwOiJ0cmlhbF9ub3RpZmljYXRpb25fYmVmb3JlX2RheXMiO047czoxMzoidHJpYWxfbWVzc2FnZSI7TjtzOjE5OiJhZGRpdGlvbmFsX2ZlYXR1cmVzIjtzOjk5OiJbIkNoYW5nZSBCcmFuY2giLCJFeHBvcnQgUmVwb3J0IiwiVGFibGUgUmVzZXJ2YXRpb24iLCJQYXltZW50IEdhdGV3YXkgSW50ZWdyYXRpb24iLCJUaGVtZSBTZXR0aW5nIl0iO3M6MTI6ImJyYW5jaF9saW1pdCI7aToxO31zOjExOiIAKgBvcmlnaW5hbCI7YTozMzp7czoyOiJpZCI7aTozO3M6MTI6InBhY2thZ2VfbmFtZSI7czo5OiJMaWZlIFRpbWUiO3M6NToicHJpY2UiO3M6NjoiMTk5LjAwIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjE5OiIyMDI1LTA0LTE4IDA2OjAyOjA1IjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA3LTEyIDE4OjEyOjMwIjtzOjExOiJjdXJyZW5jeV9pZCI7aToxO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjMzOiJUaGlzIGlzIGEgbGlmZXRpbWUgYWNjZXNzIHBhY2thZ2UiO3M6MTI6ImFubnVhbF9wcmljZSI7TjtzOjEzOiJtb250aGx5X3ByaWNlIjtOO3M6MTQ6Im1vbnRobHlfc3RhdHVzIjtzOjE6IjAiO3M6MTM6ImFubnVhbF9zdGF0dXMiO3M6MToiMCI7czoyMToic3RyaXBlX2FubnVhbF9wbGFuX2lkIjtOO3M6MjI6InN0cmlwZV9tb250aGx5X3BsYW5faWQiO047czoyMzoicmF6b3JwYXlfYW5udWFsX3BsYW5faWQiO047czoyNDoicmF6b3JwYXlfbW9udGhseV9wbGFuX2lkIjtOO3M6MjY6ImZsdXR0ZXJ3YXZlX2FubnVhbF9wbGFuX2lkIjtOO3M6Mjc6ImZsdXR0ZXJ3YXZlX21vbnRobHlfcGxhbl9pZCI7TjtzOjIzOiJwYXlzdGFja19hbm51YWxfcGxhbl9pZCI7TjtzOjI0OiJwYXlzdGFja19tb250aGx5X3BsYW5faWQiO047czoyMzoic3RyaXBlX2xpZmV0aW1lX3BsYW5faWQiO047czoyNToicmF6b3JwYXlfbGlmZXRpbWVfcGxhbl9pZCI7TjtzOjEzOiJiaWxsaW5nX2N5Y2xlIjtpOjA7czoxMDoic29ydF9vcmRlciI7aTozO3M6MTA6ImlzX3ByaXZhdGUiO2k6MDtzOjc6ImlzX2ZyZWUiO2k6MDtzOjE0OiJpc19yZWNvbW1lbmRlZCI7aToxO3M6MTI6InBhY2thZ2VfdHlwZSI7czo4OiJsaWZldGltZSI7czoxMjoidHJpYWxfc3RhdHVzIjtOO3M6MTA6InRyaWFsX2RheXMiO047czozMDoidHJpYWxfbm90aWZpY2F0aW9uX2JlZm9yZV9kYXlzIjtOO3M6MTM6InRyaWFsX21lc3NhZ2UiO047czoxOToiYWRkaXRpb25hbF9mZWF0dXJlcyI7czo5OToiWyJDaGFuZ2UgQnJhbmNoIiwiRXhwb3J0IFJlcG9ydCIsIlRhYmxlIFJlc2VydmF0aW9uIiwiUGF5bWVudCBHYXRld2F5IEludGVncmF0aW9uIiwiVGhlbWUgU2V0dGluZyJdIjtzOjEyOiJicmFuY2hfbGltaXQiO2k6MTt9czoxMDoiACoAY2hhbmdlcyI7YTowOnt9czoxMToiACoAcHJldmlvdXMiO2E6MDp7fXM6ODoiACoAY2FzdHMiO2E6Mzp7czoxMjoicGFja2FnZV90eXBlIjtzOjIxOiJBcHBcRW51bXNcUGFja2FnZVR5cGUiO3M6MTA6InRyaWFsX2RheXMiO3M6NzoiaW50ZWdlciI7czozMDoidHJpYWxfbm90aWZpY2F0aW9uX2JlZm9yZV9kYXlzIjtzOjc6ImludGVnZXIiO31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czoyMToiACoAYXR0cmlidXRlQ2FzdENhY2hlIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MDp7fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6Mjc6IgAqAHJlbGF0aW9uQXV0b2xvYWRDYWxsYmFjayI7TjtzOjI2OiIAKgByZWxhdGlvbkF1dG9sb2FkQ29udGV4dCI7TjtzOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czoxMzoidXNlc1VuaXF1ZUlkcyI7YjowO3M6OToiACoAaGlkZGVuIjthOjA6e31zOjEwOiIAKgB2aXNpYmxlIjthOjA6e31zOjExOiIAKgBmaWxsYWJsZSI7YTowOnt9czoxMDoiACoAZ3VhcmRlZCI7YToxOntpOjA7czoyOiJpZCI7fX1zOjg6ImJyYW5jaGVzIjtPOjM5OiJJbGx1bWluYXRlXERhdGFiYXNlXEVsb3F1ZW50XENvbGxlY3Rpb24iOjI6e3M6ODoiACoAaXRlbXMiO2E6MTp7aTowO086MTc6IkFwcFxNb2RlbHNcQnJhbmNoIjozMzp7czoxMzoiACoAY29ubmVjdGlvbiI7czo1OiJteXNxbCI7czo4OiIAKgB0YWJsZSI7czo4OiJicmFuY2hlcyI7czoxMzoiACoAcHJpbWFyeUtleSI7czoyOiJpZCI7czoxMDoiACoAa2V5VHlwZSI7czozOiJpbnQiO3M6MTI6ImluY3JlbWVudGluZyI7YjoxO3M6NzoiACoAd2l0aCI7YTowOnt9czoxMjoiACoAd2l0aENvdW50IjthOjA6e31zOjE5OiJwcmV2ZW50c0xhenlMb2FkaW5nIjtiOjA7czoxMDoiACoAcGVyUGFnZSI7aToxNTtzOjY6ImV4aXN0cyI7YjoxO3M6MTg6Indhc1JlY2VudGx5Q3JlYXRlZCI7YjowO3M6Mjg6IgAqAGVzY2FwZVdoZW5DYXN0aW5nVG9TdHJpbmciO2I6MDtzOjEzOiIAKgBhdHRyaWJ1dGVzIjthOjE5OntzOjI6ImlkIjtpOjQ7czoxMToidW5pcXVlX2hhc2giO3M6MjA6IjhhZGM1MTdlZjJhZTdmYzNiNjk3IjtzOjEzOiJyZXN0YXVyYW50X2lkIjtpOjM7czo0OiJuYW1lIjtzOjIyOiJCYWNrUGFzcyBBY2NyYSBDZW50cmFsIjtzOjE4OiJjbG9uZWRfYnJhbmNoX25hbWUiO047czoxNjoiY2xvbmVkX2JyYW5jaF9pZCI7TjtzOjEzOiJpc19tZW51X2Nsb25lIjtpOjA7czoyNDoiaXNfaXRlbV9jYXRlZ29yaWVzX2Nsb25lIjtpOjA7czoxOToiaXNfbWVudV9pdGVtc19jbG9uZSI7aTowO3M6MjM6ImlzX2l0ZW1fbW9kaWZpZXJzX2Nsb25lIjtpOjA7czoyOToiaXNfY2xvbmVfcmVzZXJ2YXRpb25fc2V0dGluZ3MiO2k6MDtzOjI2OiJpc19jbG9uZV9kZWxpdmVyeV9zZXR0aW5ncyI7aTowO3M6MjA6ImlzX2Nsb25lX2tvdF9zZXR0aW5nIjtpOjA7czoyNToiaXNfbW9kaWZpZXJzX2dyb3Vwc19jbG9uZSI7aTowO3M6NzoiYWRkcmVzcyI7czo2NToiQmFja1Bhc3MgUmVzdGF1cmFudCwKQXNhZm9hdHNlIE5ldHRleSBSZCwgCkFjY3JhLCBHcmVhdGVyIEFjY3JhLiAiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMDUtMzAgMDg6MzM6MDQiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMTIgMjA6MTc6MDAiO3M6MzoibGF0IjtOO3M6MzoibG5nIjtOO31zOjExOiIAKgBvcmlnaW5hbCI7YToxOTp7czoyOiJpZCI7aTo0O3M6MTE6InVuaXF1ZV9oYXNoIjtzOjIwOiI4YWRjNTE3ZWYyYWU3ZmMzYjY5NyI7czoxMzoicmVzdGF1cmFudF9pZCI7aTozO3M6NDoibmFtZSI7czoyMjoiQmFja1Bhc3MgQWNjcmEgQ2VudHJhbCI7czoxODoiY2xvbmVkX2JyYW5jaF9uYW1lIjtOO3M6MTY6ImNsb25lZF9icmFuY2hfaWQiO047czoxMzoiaXNfbWVudV9jbG9uZSI7aTowO3M6MjQ6ImlzX2l0ZW1fY2F0ZWdvcmllc19jbG9uZSI7aTowO3M6MTk6ImlzX21lbnVfaXRlbXNfY2xvbmUiO2k6MDtzOjIzOiJpc19pdGVtX21vZGlmaWVyc19jbG9uZSI7aTowO3M6Mjk6ImlzX2Nsb25lX3Jlc2VydmF0aW9uX3NldHRpbmdzIjtpOjA7czoyNjoiaXNfY2xvbmVfZGVsaXZlcnlfc2V0dGluZ3MiO2k6MDtzOjIwOiJpc19jbG9uZV9rb3Rfc2V0dGluZyI7aTowO3M6MjU6ImlzX21vZGlmaWVyc19ncm91cHNfY2xvbmUiO2k6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IgAqAGF0dHJpYnV0ZXMiO2E6MTk6e3M6MjoiaWQiO2k6NDtzOjExOiJ1bmlxdWVfaGFzaCI7czoyMDoiOGFkYzUxN2VmMmFlN2ZjM2I2OTciO3M6MTM6InJlc3RhdXJhbnRfaWQiO2k6MztzOjQ6Im5hbWUiO3M6MjI6IkJhY2tQYXNzIEFjY3JhIENlbnRyYWwiO3M6MTg6ImNsb25lZF9icmFuY2hfbmFtZSI7TjtzOjE2OiJjbG9uZWRfYnJhbmNoX2lkIjtOO3M6MTM6ImlzX21lbnVfY2xvbmUiO2k6MDtzOjI0OiJpc19pdGVtX2NhdGVnb3JpZXNfY2xvbmUiO2k6MDtzOjE5OiJpc19tZW51X2l0ZW1zX2Nsb25lIjtpOjA7czoyMzoiaXNfaXRlbV9tb2RpZmllcnNfY2xvbmUiO2k6MDtzOjI5OiJpc19jbG9uZV9yZXNlcnZhdGlvbl9zZXR0aW5ncyI7aTowO3M6MjY6ImlzX2Nsb25lX2RlbGl2ZXJ5X3NldHRpbmdzIjtpOjA7czoyMDoiaXNfY2xvbmVfa290X3NldHRpbmciO2k6MDtzOjI1OiJpc19tb2RpZmllcnNfZ3JvdXBzX2Nsb25lIjtpOjA7czo3OiJhZGRyZXNzIjtzOjY1OiJCYWNrUGFzcyBSZXN0YXVyYW50LApBc2Fmb2F0c2UgTmV0dGV5IFJkLCAKQWNjcmEsIEdyZWF0ZXIgQWNjcmEuICI7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNS0wNS0zMCAwODozMzowNCI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNy0xMiAyMDoxNzowMCI7czozOiJsYXQiO047czozOiJsbmciO047fXM6MTE6IgAqAG9yaWdpbmFsIjthOjE5OntzOjI6ImlkIjtpOjQ7czoxMToidW5pcXVlX2hhc2giO3M6MjA6IjhhZGM1MTdlZjJhZTdmYzNiNjk3IjtzOjEzOiJyZXN0YXVyYW50X2lkIjtpOjM7czo0OiJuYW1lIjtzOjIyOiJCYWNrUGFzcyBBY2NyYSBDZW50cmFsIjtzOjE4OiJjbG9uZWRfYnJhbmNoX25hbWUiO047czoxNjoiY2xvbmVkX2JyYW5jaF9pZCI7TjtzOjEzOiJpc19tZW51X2Nsb25lIjtpOjA7czoyNDoiaXNfaXRlbV9jYXRlZ29yaWVzX2Nsb25lIjtpOjA7czoxOToiaXNfbWVudV9pdGVtc19jbG9uZSI7aTowO3M6MjM6ImlzX2l0ZW1fbW9kaWZpZXJzX2Nsb25lIjtpOjA7czoyOToiaXNfY2xvbmVfcmVzZXJ2YXRpb25fc2V0dGluZ3MiO2k6MDtzOjI2OiJpc19jbG9uZV9kZWxpdmVyeV9zZXR0aW5ncyI7aTowO3M6MjA6ImlzX2Nsb25lX2tvdF9zZXR0aW5nIjtpOjA7czoyNToiaXNfbW9kaWZpZXJzX2dyb3Vwc19jbG9uZSI7aTowO3M6NzoiYWRkcmVzcyI7czo2NToiQmFja1Bhc3MgUmVzdGF1cmFudCwKQXNhZm9hdHNlIE5ldHRleSBSZCwgCkFjY3JhLCBHcmVhdGVyIEFjY3JhLiAiO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMDUtMzAgMDg6MzM6MDQiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMTIgMjA6MTc6MDAiO3M6MzoibGF0IjtOO3M6MzoibG5nIjtOO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjExOiIAKgBwcmV2aW91cyI7YTowOnt9czo4OiIAKgBjYXN0cyI7YToyOntzOjM6ImxhdCI7czo1OiJmbG9hdCI7czozOiJsbmciO3M6NToiZmxvYXQiO31zOjE3OiIAKgBjbGFzc0Nhc3RDYWNoZSI7YTowOnt9czoyMToiACoAYXR0cmlidXRlQ2FzdENhY2hlIjthOjA6e31zOjEzOiIAKgBkYXRlRm9ybWF0IjtOO3M6MTA6IgAqAGFwcGVuZHMiO2E6MDp7fXM6MTk6IgAqAGRpc3BhdGNoZXNFdmVudHMiO2E6MDp7fXM6MTQ6IgAqAG9ic2VydmFibGVzIjthOjA6e31zOjEyOiIAKgByZWxhdGlvbnMiO2E6MDp7fXM6MTA6IgAqAHRvdWNoZXMiO2E6MDp7fXM6Mjc6IgAqAHJlbGF0aW9uQXV0b2xvYWRDYWxsYmFjayI7TjtzOjI2OiIAKgByZWxhdGlvbkF1dG9sb2FkQ29udGV4dCI7TjtzOjEwOiJ0aW1lc3RhbXBzIjtiOjE7czoxMzoidXNlc1VuaXF1ZUlkcyI7YjowO3M6OToiACoAaGlkZGVuIjthOjA6e31zOjEwOiIAKgB2aXNpYmxlIjthOjA6e31zOjExOiIAKgBmaWxsYWJsZSI7YTo5OntpOjA7czo0OiJuYW1lIjtpOjE7czo3OiJhZGRyZXNzIjtpOjI7czo1OiJwaG9uZSI7aTozO3M6NToiZW1haWwiO2k6NDtzOjEzOiJyZXN0YXVyYW50X2lkIjtpOjU7czo5OiJpc19hY3RpdmUiO2k6NjtzOjExOiJ1bmlxdWVfaGFzaCI7aTo3O3M6MzoibGF0IjtpOjg7czozOiJsbmciO31zOjEwOiIAKgBndWFyZGVkIjthOjE6e2k6MDtzOjI6ImlkIjt9fXM6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTIkODVES29ydmFHbXN3TGpTMlQybEVPdXRuc1ZEN2tsVGVFRFhFNTV5cE81N1lteVQyTjVBMUMiO3M6ODoidGltZXpvbmUiO3M6MTI6IkFmcmljYS9BY2NyYSI7czoxNjoicm9sZV9wZXJtaXNzaW9ucyI7YTo4MDp7aTowO3M6MTE6IkNyZWF0ZSBNZW51IjtpOjE7czo5OiJTaG93IE1lbnUiO2k6MjtzOjExOiJVcGRhdGUgTWVudSI7aTozO3M6MTE6IkRlbGV0ZSBNZW51IjtpOjQ7czoxNjoiQ3JlYXRlIE1lbnUgSXRlbSI7aTo1O3M6MTQ6IlNob3cgTWVudSBJdGVtIjtpOjY7czoxNjoiVXBkYXRlIE1lbnUgSXRlbSI7aTo3O3M6MTY6IkRlbGV0ZSBNZW51IEl0ZW0iO2k6ODtzOjIwOiJDcmVhdGUgSXRlbSBDYXRlZ29yeSI7aTo5O3M6MTg6IlNob3cgSXRlbSBDYXRlZ29yeSI7aToxMDtzOjIwOiJVcGRhdGUgSXRlbSBDYXRlZ29yeSI7aToxMTtzOjIwOiJEZWxldGUgSXRlbSBDYXRlZ29yeSI7aToxMjtzOjExOiJDcmVhdGUgQXJlYSI7aToxMztzOjk6IlNob3cgQXJlYSI7aToxNDtzOjExOiJVcGRhdGUgQXJlYSI7aToxNTtzOjExOiJEZWxldGUgQXJlYSI7aToxNjtzOjEyOiJDcmVhdGUgVGFibGUiO2k6MTc7czoxMDoiU2hvdyBUYWJsZSI7aToxODtzOjEyOiJVcGRhdGUgVGFibGUiO2k6MTk7czoxMjoiRGVsZXRlIFRhYmxlIjtpOjIwO3M6MTg6IkNyZWF0ZSBSZXNlcnZhdGlvbiI7aToyMTtzOjE2OiJTaG93IFJlc2VydmF0aW9uIjtpOjIyO3M6MTg6IlVwZGF0ZSBSZXNlcnZhdGlvbiI7aToyMztzOjE4OiJEZWxldGUgUmVzZXJ2YXRpb24iO2k6MjQ7czoxMDoiTWFuYWdlIEtPVCI7aToyNTtzOjEyOiJDcmVhdGUgT3JkZXIiO2k6MjY7czoxMDoiU2hvdyBPcmRlciI7aToyNztzOjEyOiJVcGRhdGUgT3JkZXIiO2k6Mjg7czoxMjoiRGVsZXRlIE9yZGVyIjtpOjI5O3M6MTU6IkNyZWF0ZSBDdXN0b21lciI7aTozMDtzOjEzOiJTaG93IEN1c3RvbWVyIjtpOjMxO3M6MTU6IlVwZGF0ZSBDdXN0b21lciI7aTozMjtzOjE1OiJEZWxldGUgQ3VzdG9tZXIiO2k6MzM7czoxOToiQ3JlYXRlIFN0YWZmIE1lbWJlciI7aTozNDtzOjE3OiJTaG93IFN0YWZmIE1lbWJlciI7aTozNTtzOjE5OiJVcGRhdGUgU3RhZmYgTWVtYmVyIjtpOjM2O3M6MTk6IkRlbGV0ZSBTdGFmZiBNZW1iZXIiO2k6Mzc7czoyNToiQ3JlYXRlIERlbGl2ZXJ5IEV4ZWN1dGl2ZSI7aTozODtzOjIzOiJTaG93IERlbGl2ZXJ5IEV4ZWN1dGl2ZSI7aTozOTtzOjI1OiJVcGRhdGUgRGVsaXZlcnkgRXhlY3V0aXZlIjtpOjQwO3M6MjU6IkRlbGV0ZSBEZWxpdmVyeSBFeGVjdXRpdmUiO2k6NDE7czoxMzoiU2hvdyBQYXltZW50cyI7aTo0MjtzOjEyOiJTaG93IFJlcG9ydHMiO2k6NDM7czoxNToiTWFuYWdlIFNldHRpbmdzIjtpOjQ0O3M6MjE6Ik1hbmFnZSBXYWl0ZXIgUmVxdWVzdCI7aTo0NTtzOjE0OiJDcmVhdGUgRXhwZW5zZSI7aTo0NjtzOjEyOiJTaG93IEV4cGVuc2UiO2k6NDc7czoxNDoiVXBkYXRlIEV4cGVuc2UiO2k6NDg7czoxNDoiRGVsZXRlIEV4cGVuc2UiO2k6NDk7czoyMzoiQ3JlYXRlIEV4cGVuc2UgQ2F0ZWdvcnkiO2k6NTA7czoyMToiU2hvdyBFeHBlbnNlIENhdGVnb3J5IjtpOjUxO3M6MjM6IlVwZGF0ZSBFeHBlbnNlIENhdGVnb3J5IjtpOjUyO3M6MjM6IkRlbGV0ZSBFeHBlbnNlIENhdGVnb3J5IjtpOjUzO3M6MjE6IkNyZWF0ZSBJbnZlbnRvcnkgSXRlbSI7aTo1NDtzOjE5OiJTaG93IEludmVudG9yeSBJdGVtIjtpOjU1O3M6MjE6IlVwZGF0ZSBJbnZlbnRvcnkgSXRlbSI7aTo1NjtzOjIxOiJEZWxldGUgSW52ZW50b3J5IEl0ZW0iO2k6NTc7czoyNToiQ3JlYXRlIEludmVudG9yeSBNb3ZlbWVudCI7aTo1ODtzOjIzOiJTaG93IEludmVudG9yeSBNb3ZlbWVudCI7aTo1OTtzOjI1OiJVcGRhdGUgSW52ZW50b3J5IE1vdmVtZW50IjtpOjYwO3M6MjU6IkRlbGV0ZSBJbnZlbnRvcnkgTW92ZW1lbnQiO2k6NjE7czoyMDoiU2hvdyBJbnZlbnRvcnkgU3RvY2siO2k6NjI7czoxMToiQ3JlYXRlIFVuaXQiO2k6NjM7czo5OiJTaG93IFVuaXQiO2k6NjQ7czoxMToiVXBkYXRlIFVuaXQiO2k6NjU7czoxMToiRGVsZXRlIFVuaXQiO2k6NjY7czoxMzoiQ3JlYXRlIFJlY2lwZSI7aTo2NztzOjExOiJTaG93IFJlY2lwZSI7aTo2ODtzOjEzOiJVcGRhdGUgUmVjaXBlIjtpOjY5O3M6MTM6IkRlbGV0ZSBSZWNpcGUiO2k6NzA7czoyMToiQ3JlYXRlIFB1cmNoYXNlIE9yZGVyIjtpOjcxO3M6MTk6IlNob3cgUHVyY2hhc2UgT3JkZXIiO2k6NzI7czoyMToiVXBkYXRlIFB1cmNoYXNlIE9yZGVyIjtpOjczO3M6MjE6IkRlbGV0ZSBQdXJjaGFzZSBPcmRlciI7aTo3NDtzOjIxOiJTaG93IEludmVudG9yeSBSZXBvcnQiO2k6NzU7czoyNToiVXBkYXRlIEludmVudG9yeSBTZXR0aW5ncyI7aTo3NjtzOjEzOiJTaG93IFN1cHBsaWVyIjtp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d2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6NjI6e3M6MjoiaWQiO2k6MztzOjQ6Im5hbWUiO3M6MTk6IkJhY2tQYXNzIFJlc3RhdXJhbnQiO3M6NDoiaGFzaCI7czoxOToiYmFja3Bhc3MtcmVzdGF1cmFudCI7czo3OiJhZGRyZXNzIjtzOjY1OiJCYWNrUGFzcyBSZXN0YXVyYW50LApBc2Fmb2F0c2UgTmV0dGV5IFJkLCAKQWNjcmEsIEdyZWF0ZXIgQWNjcmEuICI7czoxMjoicGhvbmVfbnVtYmVyIjtpOjMwMjY2NTIwMTtzOjEwOiJwaG9uZV9jb2RlIjtpOjI0MjtzOjU6ImVtYWlsIjtzOjIyOiJiYXJvbmVzc2RhOTlAZ21haWwuY29tIjtzOjg6InRpbWV6b25lIjtzOjEyOiJBZnJpY2EvQWNjcmEiO3M6OToidGhlbWVfaGV4IjtzOjc6IiMxMjI2YWMiO3M6OToidGhlbWVfcmdiIjtzOjExOiIxOCwgMzgsIDE3MiI7czo0OiJsb2dvIjtzOjM2OiJlNGZjNWQ3Y2Y1ZDA5YWY4OTNkYzhmYjE2NzBlMzU2Ny5qcGciO3M6MTA6ImNvdW50cnlfaWQiO2k6ODQ7czoxNToiaGlkZV9uZXdfb3JkZXJzIjtpOjA7czoyMToiaGlkZV9uZXdfcmVzZXJ2YXRpb25zIjtpOjA7czoyMzoiaGlkZV9uZXdfd2FpdGVyX3JlcXVlc3QiO2k6MDtzOjExOiJjdXJyZW5jeV9pZCI7aTo5O3M6MTI6ImxpY2Vuc2VfdHlwZSI7czo0OiJmcmVlIjtzOjk6ImlzX2FjdGl2ZSI7aToxO3M6MTA6ImNyZWF0ZWRfYXQiO3M6MTk6IjIwMjUtMDUtMzAgMDg6MzM6MDQiO3M6MTA6InVwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDctMjUgMTI6MjA6NDgiO3M6MjM6ImN1c3RvbWVyX2xvZ2luX3JlcXVpcmVkIjtpOjA7czo4OiJhYm91dF91cyI7czoxMDcxOiI8ZGl2PiZuYnNwO1dlbGNvbWUgdG8gb3VyIHJlc3RhdXJhbnQsIHdoZXJlIGdyZWF0IGZvb2QgYW5kIGdvb2QgdmliZXMgY29tZSB0b2dldGhlciEgV2UncmUgYSBsb2NhbCwgZmFtaWx5LW93bmVkIHNwb3QgdGhhdCBsb3ZlcyBicmluZ2luZyBwZW9wbGUgdG9nZXRoZXIgb3ZlciBkZWxpY2lvdXMgbWVhbHMgYW5kIHVuZm9yZ2V0dGFibGUgbW9tZW50cy4gV2hldGhlciB5b3UncmUgaGVyZSBmb3IgYSBxdWljayBiaXRlLCBhIGZhbWlseSBkaW5uZXIsIG9yIGEgY2VsZWJyYXRpb24sIHdlJ3JlIGFsbCBhYm91dCBtYWtpbmcgeW91ciB0aW1lIHdpdGggdXMgc3BlY2lhbC4mbmJzcDs8L2Rpdj48ZGl2PiZuYnNwO091ciBtZW51IGlzIHBhY2tlZCB3aXRoIGRpc2hlcyBtYWRlIGZyb20gZnJlc2gsIHF1YWxpdHkgaW5ncmVkaWVudHMgYmVjYXVzZSB3ZSBiZWxpZXZlIGZvb2Qgc2hvdWxkIHRhc3RlIGFzIGdvb2QgYXMgaXQgbWFrZXMgeW91IGZlZWwuIEZyb20gb3VyIHNpZ25hdHVyZSBkaXNoZXMgdG8gc2Vhc29uYWwgc3BlY2lhbHMsIHRoZXJlJ3MgYWx3YXlzIHNvbWV0aGluZyB0byBleGNpdGUgeW91ciB0YXN0ZSBidWRzLiZuYnNwOzwvZGl2PjxkaXY+Jm5ic3A7QnV0IHdlJ3JlIG5vdCBqdXN0IGFib3V0IHRoZSBmb29k4oCUd2UncmUgYWJvdXQgY29tbXVuaXR5LiBXZSBsb3ZlIHNlZWluZyBmYW1pbGlhciBmYWNlcyBhbmQgd2VsY29taW5nIG5ldyBvbmVzLiBPdXIgdGVhbSBpcyBhIGZ1biwgZnJpZW5kbHkgYnVuY2ggZGVkaWNhdGVkIHRvIHNlcnZpbmcgeW91IHdpdGggYSBzbWlsZSBhbmQgbWFraW5nIHN1cmUgZXZlcnkgdmlzaXQgZmVlbHMgbGlrZSBjb21pbmcgaG9tZS4mbmJzcDs8L2Rpdj48ZGl2PiZuYnNwO1NvLCBjb21lIG9uIGluLCBncmFiIGEgc2VhdCwgYW5kIGxldCB1cyB0YWtlIGNhcmUgb2YgdGhlIHJlc3QuIFdlIGNhbid0IHdhaXQgdG8gc2hhcmUgb3VyIGxvdmUgb2YgZm9vZCB3aXRoIHlvdSEmbmJzcDs8L2Rpdj48ZGl2PjxzdHJvbmc+QmFja1Bhc3MgUmVzdGF1cmFudCw8YnI+PC9zdHJvbmc+R29vZCBGb29kLCBHb29kIE1vb2QhIPCfjb3vuI/inKg8L2Rpdj4iO3M6MzA6ImFsbG93X2N1c3RvbWVyX2RlbGl2ZXJ5X29yZGVycyI7aToxO3M6Mjg6ImFsbG93X2N1c3RvbWVyX3BpY2t1cF9vcmRlcnMiO2k6MTtzOjIxOiJhbGxvd19jdXN0b21lcl9vcmRlcnMiO2k6MTtzOjIwOiJhbGxvd19kaW5lX2luX29yZGVycyI7aToxO3M6MTA6InBhY2thZ2VfaWQiO2k6MztzOjEyOiJwYWNrYWdlX3R5cGUiO3M6ODoibGlmZXRpbWUiO3M6Njoic3RhdHVzIjtzOjY6ImFjdGl2ZSI7czoxNzoibGljZW5zZV9leHBpcmVfb24iO047czoxMzoidHJpYWxfZW5kc19hdCI7TjtzOjE4OiJsaWNlbnNlX3VwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDUtMzAgMDg6MzM6MDQiO3M6MjM6InN1YnNjcmlwdGlvbl91cGRhdGVkX2F0IjtzOjE5OiIyMDI1LTA1LTMwIDA4OjMzOjA0IjtzOjk6InN0cmlwZV9pZCI7TjtzOjc6InBtX3R5cGUiO047czoxMjoicG1fbGFzdF9mb3VyIjtOO3M6MjU6ImlzX3dhaXRlcl9yZXF1ZXN0X2VuYWJsZWQiO2k6MTtzOjMyOiJkZWZhdWx0X3RhYmxlX3Jlc2VydmF0aW9uX3N0YXR1cyI7czo5OiJDb25maXJtZWQiO3M6MTU6ImFwcHJvdmFsX3N0YXR1cyI7czo4OiJBcHByb3ZlZCI7czoxNjoicmVqZWN0aW9uX3JlYXNvbiI7TjtzOjEzOiJmYWNlYm9va19saW5rIjtOO3M6MTQ6Imluc3RhZ3JhbV9saW5rIjtOO3M6MTI6InR3aXR0ZXJfbGluayI7TjtzOjk6InllbHBfbGluayI7TjtzOjE0OiJ0YWJsZV9yZXF1aXJlZCI7aTowO3M6MTQ6InNob3dfbG9nb190ZXh0IjtpOjE7czoxMjoibWV0YV9rZXl3b3JkIjtOO3M6MTY6Im1ldGFfZGVzY3JpcHRpb24iO047czozNDoidXBsb2FkX2Zhdl9pY29uX2FuZHJvaWRfY2hyb21lXzE5MiI7czoyNjoiYW5kcm9pZC1jaHJvbWUtMTkyeDE5Mi5wbmciO3M6MzQ6InVwbG9hZF9mYXZfaWNvbl9hbmRyb2lkX2Nocm9tZV81MTIiO3M6MjY6ImFuZHJvaWQtY2hyb21lLTUxMng1MTIucG5nIjtzOjMyOiJ1cGxvYWRfZmF2X2ljb25fYXBwbGVfdG91Y2hfaWNvbiI7czoyMDoiYXBwbGUtdG91Y2gtaWNvbi5wbmciO3M6MTc6InVwbG9hZF9mYXZpY29uXzE2IjtzOjE3OiJmYXZpY29uLTE2eDE2LnBuZyI7czoxNzoidXBsb2FkX2Zhdmljb25fMzIiO3M6MTc6ImZhdmljb24tMzJ4MzIucG5nIjtzOjc6ImZhdmljb24iO3M6MTE6ImZhdmljb24uaWNvIjtzOjM2OiJpc193YWl0ZXJfcmVxdWVzdF9lbmFibGVkX29uX2Rlc2t0b3AiO2k6MTtzOjM1OiJpc193YWl0ZXJfcmVxdWVzdF9lbmFibGVkX29uX21vYmlsZSI7aToxO3M6MzY6ImlzX3dhaXRlcl9yZXF1ZXN0X2VuYWJsZWRfb3Blbl9ieV9xciI7aTowO3M6MTE6IndlYm1hbmlmZXN0IjtOO3M6MTU6ImVuYWJsZV90aXBfc2hvcCI7aToxO3M6MTQ6ImVuYWJsZV90aXBfcG9zIjtpOjE7czoyNToiaXNfcHdhX2luc3RhbGxfYWxlcnRfc2hvdyI7aToxO3M6MTk6ImF1dG9fY29uZmlybV9vcmRlcnMiO2k6MDt9czoxMToiACoAb3JpZ2luYWwiO2E6NjI6e3M6MjoiaWQiO2k6MztzOjQ6Im5hbWUiO3M6MTk6IkJhY2tQYXNzIFJlc3RhdXJhbnQiO3M6NDoiaGFzaCI7czoxOToiYmFja3Bhc3MtcmVzdGF1cmFudCI7czo3OiJhZGRyZXNzIjtzOjY1OiJCYWNrUGFzcyBSZXN0YXVyYW50LApBc2Fmb2F0c2UgTmV0dGV5IFJkLCAKQWNjcmEsIEdyZWF0ZXIgQWNjcmEuICI7czoxMjoicGhvbmVfbnVtYmVyIjtzOjk6IjMwMjY2NTIwMSI7czoxMDoicGhvbmVfY29kZSI7czozOiIyNDIiO3M6NToiZW1haWwiO3M6MjI6ImJhcm9uZXNzZGE5OUBnbWFpbC5jb20iO3M6ODoidGltZXpvbmUiO3M6MTI6IkFmcmljYS9BY2NyYSI7czo5OiJ0aGVtZV9oZXgiO3M6NzoiIzEyMjZhYyI7czo5OiJ0aGVtZV9yZ2IiO3M6MTE6IjE4LCAzOCwgMTcyIjtzOjQ6ImxvZ28iO3M6MzY6ImU0ZmM1ZDdjZjVkMDlhZjg5M2RjOGZiMTY3MGUzNTY3LmpwZyI7czoxMDoiY291bnRyeV9pZCI7aTo4NDtzOjE1OiJoaWRlX25ld19vcmRlcnMiO2k6MDtzOjIxOiJoaWRlX25ld19yZXNlcnZhdGlvbnMiO2k6MDtzOjIzOiJoaWRlX25ld193YWl0ZXJfcmVxdWVzdCI7aTowO3M6MTE6ImN1cnJlbmN5X2lkIjtpOjk7czoxMjoibGljZW5zZV90eXBlIjtzOjQ6ImZyZWUiO3M6OToiaXNfYWN0aXZlIjtpOjE7czoxMDoiY3JlYXRlZF9hdCI7czoxOToiMjAyNS0wNS0zMCAwODozMzowNCI7czoxMDoidXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNy0yNSAxMjoyMDo0OCI7czoyMzoiY3VzdG9tZXJfbG9naW5fcmVxdWlyZWQiO2k6MDtzOjg6ImFib3V0X3VzIjtzOjEwNzE6IjxkaXY+Jm5ic3A7V2VsY29tZSB0byBvdXIgcmVzdGF1cmFudCwgd2hlcmUgZ3JlYXQgZm9vZCBhbmQgZ29vZCB2aWJlcyBjb21lIHRvZ2V0aGVyISBXZSdyZSBhIGxvY2FsLCBmYW1pbHktb3duZWQgc3BvdCB0aGF0IGxvdmVzIGJyaW5naW5nIHBlb3BsZSB0b2dldGhlciBvdmVyIGRlbGljaW91cyBtZWFscyBhbmQgdW5mb3JnZXR0YWJsZSBtb21lbnRzLiBXaGV0aGVyIHlvdSdyZSBoZXJlIGZvciBhIHF1aWNrIGJpdGUsIGEgZmFtaWx5IGRpbm5lciwgb3IgYSBjZWxlYnJhdGlvbiwgd2UncmUgYWxsIGFib3V0IG1ha2luZyB5b3VyIHRpbWUgd2l0aCB1cyBzcGVjaWFsLiZuYnNwOzwvZGl2PjxkaXY+Jm5ic3A7T3VyIG1lbnUgaXMgcGFja2VkIHdpdGggZGlzaGVzIG1hZGUgZnJvbSBmcmVzaCwgcXVhbGl0eSBpbmdyZWRpZW50cyBiZWNhdXNlIHdlIGJlbGlldmUgZm9vZCBzaG91bGQgdGFzdGUgYXMgZ29vZCBhcyBpdCBtYWtlcyB5b3UgZmVlbC4gRnJvbSBvdXIgc2lnbmF0dXJlIGRpc2hlcyB0byBzZWFzb25hbCBzcGVjaWFscywgdGhlcmUncyBhbHdheXMgc29tZXRoaW5nIHRvIGV4Y2l0ZSB5b3VyIHRhc3RlIGJ1ZHMuJm5ic3A7PC9kaXY+PGRpdj4mbmJzcDtCdXQgd2UncmUgbm90IGp1c3QgYWJvdXQgdGhlIGZvb2TigJR3ZSdyZSBhYm91dCBjb21tdW5pdHkuIFdlIGxvdmUgc2VlaW5nIGZhbWlsaWFyIGZhY2VzIGFuZCB3ZWxjb21pbmcgbmV3IG9uZXMuIE91ciB0ZWFtIGlzIGEgZnVuLCBmcmllbmRseSBidW5jaCBkZWRpY2F0ZWQgdG8gc2VydmluZyB5b3Ugd2l0aCBhIHNtaWxlIGFuZCBtYWtpbmcgc3VyZSBldmVyeSB2aXNpdCBmZWVscyBsaWtlIGNvbWluZyBob21lLiZuYnNwOzwvZGl2PjxkaXY+Jm5ic3A7U28sIGNvbWUgb24gaW4sIGdyYWIgYSBzZWF0LCBhbmQgbGV0IHVzIHRha2UgY2FyZSBvZiB0aGUgcmVzdC4gV2UgY2FuJ3Qgd2FpdCB0byBzaGFyZSBvdXIgbG92ZSBvZiBmb29kIHdpdGggeW91ISZuYnNwOzwvZGl2PjxkaXY+PHN0cm9uZz5CYWNrUGFzcyBSZXN0YXVyYW50LDxicj48L3N0cm9uZz5Hb29kIEZvb2QsIEdvb2QgTW9vZCEg8J+Nve+4j+KcqDwvZGl2PiI7czozMDoiYWxsb3dfY3VzdG9tZXJfZGVsaXZlcnlfb3JkZXJzIjtpOjE7czoyODoiYWxsb3dfY3VzdG9tZXJfcGlja3VwX29yZGVycyI7aToxO3M6MjE6ImFsbG93X2N1c3RvbWVyX29yZGVycyI7aToxO3M6MjA6ImFsbG93X2RpbmVfaW5fb3JkZXJzIjtpOjE7czoxMDoicGFja2FnZV9pZCI7aTozO3M6MTI6InBhY2thZ2VfdHlwZSI7czo4OiJsaWZldGltZSI7czo2OiJzdGF0dXMiO3M6NjoiYWN0aXZlIjtzOjE3OiJsaWNlbnNlX2V4cGlyZV9vbiI7TjtzOjEzOiJ0cmlhbF9lbmRzX2F0IjtOO3M6MTg6ImxpY2Vuc2VfdXBkYXRlZF9hdCI7czoxOToiMjAyNS0wNS0zMCAwODozMzowNCI7czoyMzoic3Vic2NyaXB0aW9uX3VwZGF0ZWRfYXQiO3M6MTk6IjIwMjUtMDUtMzAgMDg6MzM6MDQiO3M6OToic3RyaXBlX2lkIjtOO3M6NzoicG1fdHlwZSI7TjtzOjEyOiJwbV9sYXN0X2ZvdXIiO047czoyNToiaXNfd2FpdGVyX3JlcXVlc3RfZW5hYmxlZCI7aToxO3M6MzI6ImRlZmF1bHRfdGFibGVfcmVzZXJ2YXRpb25fc3RhdHVzIjtzOjk6IkNvbmZpcm1lZCI7czoxNToiYXBwcm92YWxfc3RhdHVzIjtzOjg6IkFwcHJvdmVkIjtzOjE2OiJyZWplY3Rpb25fcmVhc29uIjtOO3M6MTM6ImZhY2Vib29rX2xpbmsiO047czoxNDoiaW5zdGFncmFtX2xpbmsiO047czoxMjoidHdpdHRlcl9saW5rIjtOO3M6OToieWVscF9saW5rIjtOO3M6MTQ6InRhYmxlX3JlcXVpcmVkIjtpOjA7czoxNDoic2hvd19sb2dvX3RleHQiO2k6MTtzOjEyOiJtZXRhX2tleXdvcmQiO047czoxNjoibWV0YV9kZXNjcmlwdGlvbiI7TjtzOjM0OiJ1cGxvYWRfZmF2X2ljb25fYW5kcm9pZF9jaHJvbWVfMTkyIjtzOjI2OiJhbmRyb2lkLWNocm9tZS0xOTJ4MTkyLnBuZyI7czozNDoidXBsb2FkX2Zhdl9pY29uX2FuZHJvaWRfY2hyb21lXzUxMiI7czoyNjoiYW5kcm9pZC1jaHJvbWUtNTEyeDUxMi5wbmciO3M6MzI6InVwbG9hZF9mYXZfaWNvbl9hcHBsZV90b3VjaF9pY29uIjtzOjIwOiJhcHBsZS10b3VjaC1pY29uLnBuZyI7czoxNzoidXBsb2FkX2Zhdmljb25fMTYiO3M6MTc6ImZhdmljb24tMTZ4MTYucG5nIjtzOjE3OiJ1cGxvYWRfZmF2aWNvbl8zMiI7czoxNzoiZmF2aWNvbi0zMngzMi5wbmciO3M6NzoiZmF2aWNvbiI7czoxMToiZmF2aWNvbi5pY28iO3M6MzY6ImlzX3dhaXRlcl9yZXF1ZXN0X2VuYWJsZWRfb25fZGVza3RvcCI7aToxO3M6MzU6ImlzX3dhaXRlcl9yZXF1ZXN0X2VuYWJsZWRfb25fbW9iaWxlIjtpOjE7czozNjoiaXNfd2FpdGVyX3JlcXVlc3RfZW5hYmxlZF9vcGVuX2J5X3FyIjtpOjA7czoxMToid2VibWFuaWZlc3QiO047czoxNToiZW5hYmxlX3RpcF9zaG9wIjtpOjE7czoxNDoiZW5hYmxlX3RpcF9wb3MiO2k6MTtzOjI1OiJpc19wd2FfaW5zdGFsbF9hbGVydF9zaG93IjtpOjE7czoxOToiYXV0b19jb25maXJtX29yZGVycyI7aTowO31zOjEwOiIAKgBjaGFuZ2VzIjthOjA6e31zOjExOiIAKgBwcmV2aW91cyI7YTowOnt9czo4OiIAKgBjYXN0cyI7YTo2OntzOjE3OiJsaWNlbnNlX2V4cGlyZV9vbiI7czo4OiJkYXRldGltZSI7czoxNToidHJpYWxfZXhwaXJlX29uIjtzOjg6ImRhdGV0aW1lIjtzOjE4OiJsaWNlbnNlX3VwZGF0ZWRfYXQiO3M6ODoiZGF0ZXRpbWUiO3M6MjM6InN1YnNjcmlwdGlvbl91cGRhdGVkX2F0IjtzOjg6ImRhdGV0aW1lIjtzOjEwOiJjcmVhdGVkX2F0IjtzOjg6ImRhdGV0aW1lIjtzOjEwOiJ1cGRhdGVkX2F0IjtzOjg6ImRhdGV0aW1lIjt9czoxNzoiACoAY2xhc3NDYXN0Q2FjaGUiO2E6MDp7fXM6MjE6IgAqAGF0dHJpYnV0ZUNhc3RDYWNoZSI7YTowOnt9czoxMzoiACoAZGF0ZUZvcm1hdCI7TjtzOjEwOiIAKgBhcHBlbmRzIjthOjE6e2k6MDtzOjg6ImxvZ29fdXJsIjt9czoxOToiACoAZGlzcGF0Y2hlc0V2ZW50cyI7YTowOnt9czoxNDoiACoAb2JzZXJ2YWJsZXMiO2E6MDp7fXM6MTI6IgAqAHJlbGF0aW9ucyI7YTowOnt9czoxMDoiACoAdG91Y2hlcyI7YTowOnt9czoyNzoiACoAcmVsYXRpb25BdXRvbG9hZENhbGxiYWNrIjtOO3M6MjY6IgAqAHJlbGF0aW9uQXV0b2xvYWRDb250ZXh0IjtOO3M6MTA6InRpbWVzdGFtcHMiO2I6MTtzOjEzOiJ1c2VzVW5pcXVlSWRzIjtiOjA7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTE6IgAqAGZpbGxhYmxlIjthOjA6e31zOjEwOiIAKgBndWFyZGVkIjthOjE6e2k6MDtzOjI6ImlkIjt9czoxNzoiY3VzdG9tZXJJcEFkZHJlc3MiO047czoyNDoiZXN0aW1hdGlvbkJpbGxpbmdBZGRyZXNzIjthOjA6e31zOjEzOiJjb2xsZWN0VGF4SWRzIjtiOjA7czo4OiJjb3Vwb25JZCI7TjtzOjE1OiJwcm9tb3Rpb25Db2RlSWQiO047czoxOToiYWxsb3dQcm9tb3Rpb25Db2RlcyI7YjowO319czoxMDoiACoAdG91Y2hlcyI7YTowOnt9czoyNzoiACoAcmVsYXRpb25BdXRvbG9hZENhbGxiYWNrIjtOO3M6MjY6IgAqAHJlbGF0aW9uQXV0b2xvYWRDb250ZXh0IjtOO3M6MTA6InRpbWVzdGFtcHMiO2I6MDtzOjEzOiJ1c2VzVW5pcXVlSWRzIjtiOjA7czo5OiIAKgBoaWRkZW4iO2E6MDp7fXM6MTA6IgAqAHZpc2libGUiO2E6MDp7fXM6MTE6IgAqAGZpbGxhYmxlIjthOjA6e31zOjEwOiIAKgBndWFyZGVkIjthOjE6e2k6MDtzOjE6IioiO319czo4OiJjdXJyZW5jeSI7czozOiJHSFMiO3M6NToiaXNSdGwiO2I6MDtzOjE3OiJ0b2RheV9vcmRlcl9jb3VudCI7aTowO3M6Mjg6ImFjdGl2ZV93YWl0ZXJfcmVxdWVzdHNfY291bnQiO2k6MDtzOjg6ImJyYW5jaGVzIjtyOjExODc7czoyMzoiY3VycmVuY3lfZm9ybWF0X3NldHRpbmciO3I6NzkzO30=', 1753547223);
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('fspPEPlZyyakks0zeIHketzruUqvYaBQdgxTJedV', NULL, '157.55.39.51', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiUFVCaDBXSGhaWG01YTRWakhrdzd1SjRzdUhGdlNZZkx3Y2hQMll5MiI7czoyMDoiY2hlY2tfbWlncmF0ZV9zdGF0dXMiO3M6NDoiR29vZCI7czo0OiJ1c2VyIjtOO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQyOiJodHRwczovL2VhdHMudXNldGhyaXZlZXJwLmNvbS9wdWJsaWMvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753542729),
('H4TE168B2bRYWzWc1ZwRZw70KvbmVfDtObXx09hY', NULL, '40.77.167.13', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiYjFXUVl4c1luU1puN0hZdkcwcjFHN2ZLNDF5dG1TMDZtMzEwRmpsTyI7czoyMDoiY2hlY2tfbWlncmF0ZV9zdGF0dXMiO3M6NDoiR29vZCI7czozMToiZ2xvYmFsX2N1cnJlbmN5X2Zvcm1hdF9zZXR0aW5nMSI7TzoyNToiQXBwXE1vZGVsc1xHbG9iYWxDdXJyZW5jeSI6MzQ6e3M6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6MTc6Imdsb2JhbF9jdXJyZW5jaWVzIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6MTU6e3M6MjoiaWQiO2k6MTtzOjEzOiJjdXJyZW5jeV9uYW1lIjtzOjc6IkRvbGxhcnMiO3M6MTU6ImN1cnJlbmN5X3N5bWJvbCI7czoxOiIkIjtzOjEzOiJjdXJyZW5jeV9jb2RlIjtzOjM6IlVTRCI7czoxMzoiZXhjaGFuZ2VfcmF0ZSI7TjtzOjk6InVzZF9wcmljZSI7TjtzOjE3OiJpc19jcnlwdG9jdXJyZW5jeSI7czoyOiJubyI7czoxNzoiY3VycmVuY3lfcG9zaXRpb24iO3M6NDoibGVmdCI7czoxMzoibm9fb2ZfZGVjaW1hbCI7aToyO3M6MTg6InRob3VzYW5kX3NlcGFyYXRvciI7czoxOiIsIjtzOjE3OiJkZWNpbWFsX3NlcGFyYXRvciI7czoxOiIuIjtzOjY6InN0YXR1cyI7czo2OiJlbmFibGUiO3M6MTA6ImNyZWF0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', 1753618950),
('RwJ4nY41oINovzJRoR5W6DbXPUtiaZquak86m2W7', NULL, '2a03:2880:25ff:4c::', 'meta-externalagent/1.1 (+https://developers.facebook.com/docs/sharing/webmasters/crawler)', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoia2sxZ2Y1S1pYMHRNbVBFYThOTTZLSk0wT2R6U2haQm9Yc2x1RjZaaCI7czoyMDoiY2hlY2tfbWlncmF0ZV9zdGF0dXMiO3M6NDoiR29vZCI7czozMToiZ2xvYmFsX2N1cnJlbmN5X2Zvcm1hdF9zZXR0aW5nMSI7TzoyNToiQXBwXE1vZGVsc1xHbG9iYWxDdXJyZW5jeSI6MzQ6e3M6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6MTc6Imdsb2JhbF9jdXJyZW5jaWVzIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6MTU6e3M6MjoiaWQiO2k6MTtzOjEzOiJjdXJyZW5jeV9uYW1lIjtzOjc6IkRvbGxhcnMiO3M6MTU6ImN1cnJlbmN5X3N5bWJvbCI7czoxOiIkIjtzOjEzOiJjdXJyZW5jeV9jb2RlIjtzOjM6IlVTRCI7czoxMzoiZXhjaGFuZ2VfcmF0ZSI7TjtzOjk6InVzZF9wcmljZSI7TjtzOjE3OiJpc19jcnlwdG9jdXJyZW5jeSI7czoyOiJubyI7czoxNzoiY3VycmVuY3lfcG9zaXRpb24iO3M6NDoibGVmdCI7czoxMzoibm9fb2ZfZGVjaW1hbCI7aToyO3M6MTg6InRob3VzYW5kX3NlcGFyYXRvciI7czoxOiIsIjtzOjE3OiJkZWNpbWFsX3NlcGFyYXRvciI7czoxOiIuIjtzOjY6InN0YXR1cyI7czo2OiJlbmFibGUiO3M6MTA6ImNyZWF0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', 1753672786),
('S3i6hC58xEK3i9X1hFPwfVgxXe8hNiZwKowfDqFe', NULL, '157.55.39.203', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiT3V1MTI0TUhkbW9oZGVROXJyWEJwUWhNTDJ6a3ZjVDJZYVNoYlBNVCI7czoyMDoiY2hlY2tfbWlncmF0ZV9zdGF0dXMiO3M6NDoiR29vZCI7czo0OiJ1c2VyIjtOO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQyOiJodHRwczovL2VhdHMudXNldGhyaXZlZXJwLmNvbS9wdWJsaWMvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753574546),
('SsrUqSYYlfvVak5l00ZMHXXmk6xAu2UecqmdvOAR', NULL, '40.77.167.76', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiRGczRzdGbXU5UGltMzlxU1RuOXY1WEtvRjlrTzVIUm4yVksxR0t1MCI7czoyMDoiY2hlY2tfbWlncmF0ZV9zdGF0dXMiO3M6NDoiR29vZCI7czo0OiJ1c2VyIjtOO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQyOiJodHRwczovL2VhdHMudXNldGhyaXZlZXJwLmNvbS9wdWJsaWMvbG9naW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1753711432),
('x3Yy0Ns9HrzHphiwgILAU9vmf4iFnA8gc4OfAmQR', NULL, '52.167.144.159', 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/116.0.1938.76 Safari/537.36', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoib3Bjbk0wQVNjNXJSN1ZXbVgxOXFMSEkzQk9LQjF4NGxURUlRUnVuUyI7czoyMDoiY2hlY2tfbWlncmF0ZV9zdGF0dXMiO3M6NDoiR29vZCI7czozMToiZ2xvYmFsX2N1cnJlbmN5X2Zvcm1hdF9zZXR0aW5nMSI7TzoyNToiQXBwXE1vZGVsc1xHbG9iYWxDdXJyZW5jeSI6MzQ6e3M6MTM6IgAqAGNvbm5lY3Rpb24iO3M6NToibXlzcWwiO3M6ODoiACoAdGFibGUiO3M6MTc6Imdsb2JhbF9jdXJyZW5jaWVzIjtzOjEzOiIAKgBwcmltYXJ5S2V5IjtzOjI6ImlkIjtzOjEwOiIAKgBrZXlUeXBlIjtzOjM6ImludCI7czoxMjoiaW5jcmVtZW50aW5nIjtiOjE7czo3OiIAKgB3aXRoIjthOjA6e31zOjEyOiIAKgB3aXRoQ291bnQiO2E6MDp7fXM6MTk6InByZXZlbnRzTGF6eUxvYWRpbmciO2I6MDtzOjEwOiIAKgBwZXJQYWdlIjtpOjE1O3M6NjoiZXhpc3RzIjtiOjE7czoxODoid2FzUmVjZW50bHlDcmVhdGVkIjtiOjA7czoyODoiACoAZXNjYXBlV2hlbkNhc3RpbmdUb1N0cmluZyI7YjowO3M6MTM6IgAqAGF0dHJpYnV0ZXMiO2E6MTU6e3M6MjoiaWQiO2k6MTtzOjEzOiJjdXJyZW5jeV9uYW1lIjtzOjc6IkRvbGxhcnMiO3M6MTU6ImN1cnJlbmN5X3N5bWJvbCI7czoxOiIkIjtzOjEzOiJjdXJyZW5jeV9jb2RlIjtzOjM6IlVTRCI7czoxMzoiZXhjaGFuZ2VfcmF0ZSI7TjtzOjk6InVzZF9wcmljZSI7TjtzOjE3OiJpc19jcnlwdG9jdXJyZW5jeSI7czoyOiJubyI7czoxNzoiY3VycmVuY3lfcG9zaXRpb24iO3M6NDoibGVmdCI7czoxMzoibm9fb2ZfZGVjaW1hbCI7aToyO3M6MTg6InRob3VzYW5kX3NlcGFyYXRvciI7czoxOiIsIjtzOjE3OiJkZWNpbWFsX3NlcGFyYXRvciI7czoxOiIuIjtzOjY6InN0YXR1cyI7czo2OiJlbmFibGUiO3M6MTA6ImNyZWF0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', 1753571208);

-- --------------------------------------------------------

--
-- Table structure for table `split_orders`
--

CREATE TABLE `split_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(16,2) NOT NULL,
  `status` enum('pending','paid') NOT NULL DEFAULT 'pending',
  `payment_method` enum('cash','upi','card','due','stripe','razorpay') NOT NULL DEFAULT 'cash',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `split_order_items`
--

CREATE TABLE `split_order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `split_order_id` bigint(20) UNSIGNED NOT NULL,
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stripe_payments`
--

CREATE TABLE `stripe_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `payment_date` datetime DEFAULT NULL,
  `amount` decimal(16,2) DEFAULT NULL,
  `payment_status` enum('pending','requested','declined','completed') NOT NULL DEFAULT 'pending',
  `payment_error_response` text DEFAULT NULL,
  `stripe_payment_intent` varchar(191) DEFAULT NULL,
  `stripe_session_id` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `superadmin_payment_gateways`
--

CREATE TABLE `superadmin_payment_gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `razorpay_type` enum('test','live') NOT NULL DEFAULT 'test',
  `test_razorpay_key` text DEFAULT NULL,
  `test_razorpay_secret` text DEFAULT NULL,
  `razorpay_test_webhook_key` text DEFAULT NULL,
  `live_razorpay_key` text DEFAULT NULL,
  `live_razorpay_secret` text DEFAULT NULL,
  `razorpay_live_webhook_key` text DEFAULT NULL,
  `razorpay_status` tinyint(1) NOT NULL DEFAULT 0,
  `stripe_type` enum('test','live') NOT NULL DEFAULT 'test',
  `test_stripe_key` text DEFAULT NULL,
  `test_stripe_secret` text DEFAULT NULL,
  `stripe_test_webhook_key` text DEFAULT NULL,
  `live_stripe_key` text DEFAULT NULL,
  `live_stripe_secret` text DEFAULT NULL,
  `stripe_live_webhook_key` text DEFAULT NULL,
  `stripe_status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `flutterwave_status` tinyint(1) NOT NULL DEFAULT 0,
  `flutterwave_type` enum('test','live') NOT NULL DEFAULT 'test',
  `test_flutterwave_key` text DEFAULT NULL,
  `test_flutterwave_secret` text DEFAULT NULL,
  `test_flutterwave_hash` text DEFAULT NULL,
  `flutterwave_test_webhook_key` text DEFAULT NULL,
  `live_flutterwave_key` text DEFAULT NULL,
  `live_flutterwave_secret` text DEFAULT NULL,
  `live_flutterwave_hash` text DEFAULT NULL,
  `flutterwave_live_webhook_key` text DEFAULT NULL,
  `live_paypal_client_id` varchar(191) DEFAULT NULL,
  `live_paypal_secret` varchar(191) DEFAULT NULL,
  `test_paypal_client_id` varchar(191) DEFAULT NULL,
  `test_paypal_secret` varchar(191) DEFAULT NULL,
  `paypal_status` tinyint(1) NOT NULL DEFAULT 0,
  `paypal_mode` enum('sandbox','live') NOT NULL DEFAULT 'sandbox',
  `payfast_merchant_id` varchar(191) DEFAULT NULL,
  `payfast_merchant_key` varchar(191) DEFAULT NULL,
  `payfast_passphrase` varchar(191) DEFAULT NULL,
  `test_payfast_merchant_id` varchar(191) DEFAULT NULL,
  `test_payfast_merchant_key` varchar(191) DEFAULT NULL,
  `test_payfast_passphrase` varchar(191) DEFAULT NULL,
  `payfast_mode` enum('sandbox','live') NOT NULL DEFAULT 'sandbox',
  `payfast_status` tinyint(1) NOT NULL DEFAULT 0,
  `live_paystack_key` varchar(191) DEFAULT NULL,
  `live_paystack_secret` varchar(191) DEFAULT NULL,
  `live_paystack_merchant_email` varchar(191) DEFAULT NULL,
  `test_paystack_key` varchar(191) DEFAULT NULL,
  `test_paystack_secret` varchar(191) DEFAULT NULL,
  `test_paystack_merchant_email` varchar(191) DEFAULT NULL,
  `paystack_payment_url` varchar(191) DEFAULT 'https://api.paystack.co',
  `paystack_status` tinyint(1) NOT NULL DEFAULT 0,
  `paystack_mode` enum('sandbox','live') NOT NULL DEFAULT 'sandbox'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `superadmin_payment_gateways`
--

INSERT INTO `superadmin_payment_gateways` (`id`, `razorpay_type`, `test_razorpay_key`, `test_razorpay_secret`, `razorpay_test_webhook_key`, `live_razorpay_key`, `live_razorpay_secret`, `razorpay_live_webhook_key`, `razorpay_status`, `stripe_type`, `test_stripe_key`, `test_stripe_secret`, `stripe_test_webhook_key`, `live_stripe_key`, `live_stripe_secret`, `stripe_live_webhook_key`, `stripe_status`, `created_at`, `updated_at`, `flutterwave_status`, `flutterwave_type`, `test_flutterwave_key`, `test_flutterwave_secret`, `test_flutterwave_hash`, `flutterwave_test_webhook_key`, `live_flutterwave_key`, `live_flutterwave_secret`, `live_flutterwave_hash`, `flutterwave_live_webhook_key`, `live_paypal_client_id`, `live_paypal_secret`, `test_paypal_client_id`, `test_paypal_secret`, `paypal_status`, `paypal_mode`, `payfast_merchant_id`, `payfast_merchant_key`, `payfast_passphrase`, `test_payfast_merchant_id`, `test_payfast_merchant_key`, `test_payfast_passphrase`, `payfast_mode`, `payfast_status`, `live_paystack_key`, `live_paystack_secret`, `live_paystack_merchant_email`, `test_paystack_key`, `test_paystack_secret`, `test_paystack_merchant_email`, `paystack_payment_url`, `paystack_status`, `paystack_mode`) VALUES
(1, 'test', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'test', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-04-18 06:02:03', '2025-04-18 06:02:03', 0, 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'sandbox', NULL, NULL, NULL, NULL, NULL, NULL, 'sandbox', 0, NULL, NULL, NULL, NULL, NULL, NULL, 'https://api.paystack.co', 0, 'sandbox'),
(2, 'test', NULL, NULL, NULL, NULL, NULL, NULL, 0, 'test', NULL, NULL, NULL, NULL, NULL, NULL, 0, '2025-04-18 06:02:05', '2025-04-18 06:02:05', 0, 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'sandbox', NULL, NULL, NULL, NULL, NULL, NULL, 'sandbox', 0, NULL, NULL, NULL, NULL, NULL, NULL, 'https://api.paystack.co', 0, 'sandbox');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `email` varchar(191) DEFAULT NULL,
  `address` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `restaurant_id`, `name`, `phone`, `email`, `address`, `created_at`, `updated_at`) VALUES
(1, 3, 'Nana Chicken', '0224139577', 'nana@gmail.com', 'Tema', '2025-06-16 17:02:32', '2025-06-16 17:02:32');

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE `tables` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `table_code` varchar(191) NOT NULL,
  `hash` varchar(191) NOT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `available_status` enum('available','reserved','running') NOT NULL DEFAULT 'available',
  `area_id` bigint(20) UNSIGNED NOT NULL,
  `seating_capacity` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`id`, `branch_id`, `table_code`, `hash`, `status`, `available_status`, `area_id`, `seating_capacity`, `created_at`, `updated_at`) VALUES
(1, 3, 'T01', 'e94e8174dcc6d9921859b8b5ac35f475', 'active', 'available', 1, 4, '2025-04-19 03:15:27', '2025-04-19 03:15:27'),
(2, 4, 'T 1', 'ac1380fa8371f503ff1a99be5bc01078', 'active', 'available', 2, 3, '2025-05-30 08:40:11', '2025-07-12 20:22:05'),
(6, 4, 'T 2', 'c2c437f4a88bae45311ab711a7413a1f', 'active', 'running', 2, 3, '2025-07-12 00:42:23', '2025-07-20 02:19:32'),
(7, 4, 'T 3', 'e376726edf1b9f2ec17191eb8bf7afad', 'active', 'available', 2, 3, '2025-07-12 00:42:49', '2025-07-12 00:42:49'),
(8, 4, 'T 4', '1b193fa1a8a06ed044d16c7d6dda3b82', 'active', 'available', 2, 3, '2025-07-12 00:43:18', '2025-07-12 00:46:37'),
(9, 4, 'T 5', '8c3f081d50522f8e38612c8699cbdeb2', 'active', 'available', 2, 3, '2025-07-12 00:46:55', '2025-07-12 00:46:55'),
(10, 4, 'T 6', 'f39d1429e5afa8dc6717691d85f6a039', 'active', 'available', 2, 4, '2025-07-12 00:47:13', '2025-07-12 00:47:13'),
(11, 4, 'T 7', '519857d46f4550ba8a89d771d651fca5', 'active', 'available', 2, 3, '2025-07-12 00:47:47', '2025-07-12 00:47:47'),
(12, 4, 'T 8', '6b5b95f7483da3e24721f7971bb158b0', 'active', 'available', 2, 3, '2025-07-12 00:48:00', '2025-07-12 00:48:00'),
(13, 4, 'T 9', 'b869bfc243accbdd798251d1c46244c5', 'active', 'available', 2, 3, '2025-07-12 00:48:27', '2025-07-12 00:48:27'),
(14, 4, 'T 10', '3aa834f58ec221b9684a93248b507679', 'active', 'available', 2, 3, '2025-07-12 00:48:45', '2025-07-12 00:48:45'),
(15, 4, 'T 11', '1f001aefb260fe5de9db4b085bcce2df', 'active', 'available', 2, 3, '2025-07-12 00:50:16', '2025-07-12 00:50:16'),
(16, 4, 'T 12', '6b5acd4c42bb9c13902759afdb9647b4', 'active', 'available', 2, 3, '2025-07-12 00:51:34', '2025-07-12 00:51:34'),
(17, 4, 'HT 1', 'bc7976f1174ecb70f27bc79a55a7232c', 'active', 'available', 3, 1, '2025-07-12 00:57:24', '2025-07-12 00:57:24'),
(18, 4, 'HT 2', 'd55a57c9ec28a5d9366ec653160937b3', 'active', 'available', 3, 1, '2025-07-12 00:57:41', '2025-07-12 00:57:41'),
(19, 4, 'HT 3', '8a25fd9d9c453346e2b3fe38b57dbf5a', 'active', 'available', 3, 1, '2025-07-12 00:57:58', '2025-07-12 00:57:58'),
(20, 4, 'HT 4', 'abda637299f6caa7e1cc70e9aca7ea45', 'active', 'available', 3, 1, '2025-07-12 00:58:25', '2025-07-12 00:58:25'),
(21, 4, 'LA 1', '18633328f56ae09de5eed8f2a7c5e417', 'active', 'available', 4, 1, '2025-07-12 00:59:53', '2025-07-12 00:59:53');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tax_name` varchar(191) NOT NULL,
  `tax_percent` decimal(16,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `restaurant_id`, `tax_name`, `tax_percent`, `created_at`, `updated_at`) VALUES
(1, 1, 'SGST', 2.50, '2025-04-18 06:02:05', '2025-04-18 06:02:05'),
(2, 1, 'CGST', 2.50, '2025-04-18 06:02:05', '2025-04-18 06:02:05'),
(3, 2, 'VAT', 15.00, '2025-04-19 02:45:17', '2025-04-19 02:45:17'),
(5, 3, 'NHIL', 2.50, '2025-07-26 15:57:25', '2025-07-26 15:57:25'),
(6, 3, 'GETFund', 2.50, '2025-07-26 15:57:57', '2025-07-26 15:57:57'),
(7, 3, 'COVID Fund', 1.00, '2025-07-26 15:58:54', '2025-07-26 15:58:54'),
(8, 3, 'Tourism', 1.00, '2025-07-26 15:59:27', '2025-07-26 15:59:27'),
(9, 3, 'VAT', 15.00, '2025-07-26 15:59:51', '2025-07-26 15:59:51');

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `symbol` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `branch_id`, `name`, `symbol`, `created_at`, `updated_at`) VALUES
(1, 1, 'Kilogram', 'kg', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(2, 1, 'Gram', 'g', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(3, 1, 'Liter', 'L', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(4, 1, 'Milliliter', 'ml', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(5, 1, 'Piece', 'pc', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(6, 1, 'Box', 'box', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(7, 1, 'Dozen', 'dz', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(8, 1, 'Bottle', 'btl', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(9, 1, 'Package', 'pkg', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(10, 1, 'Can', 'can', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(11, 2, 'Kilogram', 'kg', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(12, 2, 'Gram', 'g', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(13, 2, 'Liter', 'L', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(14, 2, 'Milliliter', 'ml', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(15, 2, 'Piece', 'pc', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(16, 2, 'Box', 'box', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(17, 2, 'Dozen', 'dz', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(18, 2, 'Bottle', 'btl', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(19, 2, 'Package', 'pkg', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(20, 2, 'Can', 'can', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(21, 3, 'Kilogram', 'kg', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(22, 3, 'Gram', 'g', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(23, 3, 'Liter', 'L', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(24, 3, 'Milliliter', 'ml', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(25, 3, 'Piece', 'pc', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(26, 3, 'Box', 'box', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(27, 3, 'Dozen', 'dz', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(28, 3, 'Bottle', 'btl', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(29, 3, 'Package', 'pkg', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(30, 3, 'Can', 'can', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(31, 4, 'Kilogram', 'kg', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(32, 4, 'Gram', 'g', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(33, 4, 'Liter', 'L', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(34, 4, 'Milliliter', 'ml', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(35, 4, 'Piece', 'pc', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(36, 4, 'Box', 'box', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(37, 4, 'Dozen', 'dz', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(38, 4, 'Bottle', 'btl', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(39, 4, 'Package', 'pkg', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(40, 4, 'Can', 'can', '2025-06-16 08:05:10', '2025-06-16 08:05:10'),
(41, 4, 'Portions', 'Portions', '2025-06-16 17:35:36', '2025-06-16 17:35:36');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `restaurant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `phone_number` varchar(191) DEFAULT NULL,
  `phone_code` varchar(191) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `locale` varchar(191) NOT NULL DEFAULT 'en',
  `stripe_id` varchar(191) DEFAULT NULL,
  `pm_type` varchar(191) DEFAULT NULL,
  `pm_last_four` varchar(4) DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `restaurant_id`, `branch_id`, `name`, `email`, `phone_number`, `phone_code`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`, `locale`, `stripe_id`, `pm_type`, `pm_last_four`, `trial_ends_at`) VALUES
(1, NULL, NULL, 'Emma Holden', 'superadmin@example.com', NULL, NULL, NULL, '$2y$12$Tjb0.9uGJW855Hc.7rxKaumsJusvdrpwjzrREyowREk03NCG6n1k6', NULL, NULL, NULL, 'Fj04W6MSWlVyb1OzrOYsAkDzsFWT1KZMEOf1suPx9Q8vIfvenb3soZlO2HN5', NULL, NULL, '2025-04-18 06:02:05', '2025-04-18 06:11:46', 'en', NULL, NULL, NULL, NULL),
(2, 1, NULL, 'John Doe', 'admin@example.com', NULL, NULL, NULL, '$2y$12$e7GPnG.wH..56cABkW5umu3JFj4nfmJGw5CArDyBlrMTG.Iy2lTcK', NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-18 06:02:06', '2025-04-18 06:11:46', 'en', NULL, NULL, NULL, NULL),
(3, 1, 1, 'Jaquelyn Battle', 'waiter@example.com', NULL, NULL, NULL, '$2y$12$9eCJCoxEknVgcEPqbUio3uHqn7yU9hfGPZ0t4TsOFZwononR2GwL6', NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-18 06:02:06', '2025-04-18 06:11:46', 'en', NULL, NULL, NULL, NULL),
(4, 2, 3, 'Nana Ewudzi Acquah', 'apsolutions16@gmail.com', NULL, NULL, NULL, '$2y$12$6fgt89FaNj68aUpH.jIkDOAEQ/4AC.05lRBqwevUpMAiMBOD3cSh6', NULL, NULL, NULL, 'rDk3RfA3W69ZxPzUTCftaSdkqmC26afvLy7jHC1NcWgHImWKftyLafmXG0nr', NULL, NULL, '2025-04-18 20:42:26', '2025-04-18 20:42:26', 'en', NULL, NULL, NULL, NULL),
(5, 2, 3, 'Kofi', 'baronessda@gmail.com', NULL, NULL, NULL, '$2y$12$JJf.lzpmCCRnNondWFLZKep3ZupMr05X9GnLIdUHmGBd0g9O4nc.q', NULL, NULL, NULL, NULL, NULL, NULL, '2025-04-29 12:58:03', '2025-04-29 12:58:03', 'en', NULL, NULL, NULL, NULL),
(6, 3, 4, 'Baroness Diowuso-Agyeman ', 'baronessda99@gmail.com', NULL, NULL, NULL, '$2y$12$85DKorvaGmswLjS2T2lEOutnsVD7klTeEDXE55ypO57YmyT2N5A1C', NULL, NULL, NULL, 'LNa4Z4glqZvne6lCE7Pf67HLxTBdcBxSm6wqKyhmMWVDMmi45alxLogS4c91', NULL, NULL, '2025-05-30 08:33:04', '2025-06-06 04:33:00', 'en', NULL, NULL, NULL, NULL),
(7, 3, 4, 'Admin', 'ananseliveinc@gmail.com', NULL, NULL, NULL, '$2y$12$9wiHy9bFjTWIKlPs2L3MRuJeW./jmSVQ9pwXOY5Y5OTViwIGb4EB2', NULL, NULL, NULL, 'kWwen5VPOvrdZuUMI3jGTEkSaZfjocLPHZzXZZgXxSZh4tfB1gNmRKJzTu50', NULL, NULL, '2025-06-14 06:13:10', '2025-06-14 06:13:10', 'en', NULL, NULL, NULL, NULL),
(8, 3, 4, 'Nagyi', 'amoahnagyi@gmail.com', NULL, NULL, NULL, '$2y$12$72pMC71gP7Lb7VwD7fJupeyyFl2.fnuqL6uSnAuxtFUEsKX7zkJDG', NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-12 18:51:30', '2025-07-12 18:51:30', 'en', NULL, NULL, NULL, NULL),
(9, 3, 4, 'Mercy Akortia', 'mercyakortiahemaa@gmail.com', NULL, NULL, NULL, '$2y$12$XfoNnFTHOQb/gcjGvCjbhOe1SQ7wpjBILCe/6ozdrtRp3..ZY7b4W', NULL, NULL, NULL, NULL, NULL, 'profile-photos/ae7be6f70d6f5449be00c44a66e92c30.jpeg', '2025-07-12 19:27:40', '2025-07-12 19:47:57', 'en', NULL, NULL, NULL, NULL),
(10, 3, 4, 'Dorcas Kyei', 'dobenewaa765@gmail.com', NULL, NULL, NULL, '$2y$12$Hb1CYf5kGHijA8krbt553.nXaDrAh79Xbsa36m/D6Vc/lJesFvH5.', NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-12 19:29:31', '2025-07-12 19:29:31', 'en', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `waiter_requests`
--

CREATE TABLE `waiter_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL,
  `table_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending','completed') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `waiter_requests`
--

INSERT INTO `waiter_requests` (`id`, `branch_id`, `table_id`, `status`, `created_at`, `updated_at`) VALUES
(3, 4, 2, 'completed', '2025-06-26 08:05:35', '2025-06-26 08:09:25'),
(5, 4, 7, 'completed', '2025-07-23 19:09:17', '2025-07-24 15:00:32'),
(6, 4, 12, 'completed', '2025-07-25 17:57:51', '2025-07-26 15:20:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `areas_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `branches_unique_hash_unique` (`unique_hash`),
  ADD KEY `branches_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `branch_delivery_settings`
--
ALTER TABLE `branch_delivery_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branch_delivery_settings_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_language_setting_id_foreign` (`language_setting_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `countries_countries_code_index` (`countries_code`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `currencies_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_phone_unique` (`phone`),
  ADD UNIQUE KEY `customers_email_unique` (`email`),
  ADD KEY `customers_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_addresses_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `custom_menus`
--
ALTER TABLE `custom_menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `custom_menus_menu_slug_unique` (`menu_slug`);

--
-- Indexes for table `delivery_executives`
--
ALTER TABLE `delivery_executives`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_executives_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `delivery_fee_tiers`
--
ALTER TABLE `delivery_fee_tiers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_fee_tiers_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `desktop_applications`
--
ALTER TABLE `desktop_applications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_settings`
--
ALTER TABLE `email_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_expense_category_id_foreign` (`expense_category_id`),
  ADD KEY `expenses_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expense_categories_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `file_storage`
--
ALTER TABLE `file_storage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `file_storage_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `file_storage_settings`
--
ALTER TABLE `file_storage_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flags`
--
ALTER TABLE `flags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `flutterwave_payments`
--
ALTER TABLE `flutterwave_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flutterwave_payments_order_id_foreign` (`order_id`);

--
-- Indexes for table `front_details`
--
ALTER TABLE `front_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `front_details_language_setting_id_foreign` (`language_setting_id`);

--
-- Indexes for table `front_faq_settings`
--
ALTER TABLE `front_faq_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `front_faq_settings_language_setting_id_foreign` (`language_setting_id`);

--
-- Indexes for table `front_features`
--
ALTER TABLE `front_features`
  ADD PRIMARY KEY (`id`),
  ADD KEY `front_features_language_setting_id_foreign` (`language_setting_id`);

--
-- Indexes for table `front_review_settings`
--
ALTER TABLE `front_review_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `front_review_settings_language_setting_id_foreign` (`language_setting_id`);

--
-- Indexes for table `global_currencies`
--
ALTER TABLE `global_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `global_invoices`
--
ALTER TABLE `global_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `global_invoices_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `global_invoices_currency_id_foreign` (`currency_id`),
  ADD KEY `global_invoices_package_id_foreign` (`package_id`),
  ADD KEY `global_invoices_global_subscription_id_foreign` (`global_subscription_id`),
  ADD KEY `global_invoices_offline_method_id_foreign` (`offline_method_id`);

--
-- Indexes for table `global_settings`
--
ALTER TABLE `global_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `global_settings_default_currency_id_foreign` (`default_currency_id`);

--
-- Indexes for table `global_subscriptions`
--
ALTER TABLE `global_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `global_subscriptions_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `global_subscriptions_package_id_foreign` (`package_id`),
  ADD KEY `global_subscriptions_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `inventory_global_settings`
--
ALTER TABLE `inventory_global_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory_items`
--
ALTER TABLE `inventory_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_items_branch_id_foreign` (`branch_id`),
  ADD KEY `inventory_items_inventory_item_category_id_foreign` (`inventory_item_category_id`),
  ADD KEY `inventory_items_unit_id_foreign` (`unit_id`),
  ADD KEY `inventory_items_preferred_supplier_id_foreign` (`preferred_supplier_id`);

--
-- Indexes for table `inventory_item_categories`
--
ALTER TABLE `inventory_item_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_item_categories_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `inventory_movements`
--
ALTER TABLE `inventory_movements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_movements_branch_id_foreign` (`branch_id`),
  ADD KEY `inventory_movements_inventory_item_id_foreign` (`inventory_item_id`),
  ADD KEY `inventory_movements_added_by_foreign` (`added_by`),
  ADD KEY `inventory_movements_supplier_id_foreign` (`supplier_id`),
  ADD KEY `inventory_movements_transfer_branch_id_foreign` (`transfer_branch_id`);

--
-- Indexes for table `inventory_settings`
--
ALTER TABLE `inventory_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_settings_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `inventory_stocks`
--
ALTER TABLE `inventory_stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventory_stocks_branch_id_foreign` (`branch_id`),
  ADD KEY `inventory_stocks_inventory_item_id_foreign` (`inventory_item_id`);

--
-- Indexes for table `item_categories`
--
ALTER TABLE `item_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_categories_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `item_modifiers`
--
ALTER TABLE `item_modifiers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_modifiers_menu_item_id_foreign` (`menu_item_id`),
  ADD KEY `item_modifiers_modifier_group_id_foreign` (`modifier_group_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kots`
--
ALTER TABLE `kots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kots_order_id_foreign` (`order_id`),
  ADD KEY `kots_branch_id_foreign` (`branch_id`),
  ADD KEY `kots_cancel_reason_id_foreign` (`cancel_reason_id`);

--
-- Indexes for table `kot_cancel_reasons`
--
ALTER TABLE `kot_cancel_reasons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kot_cancel_reasons_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `kot_items`
--
ALTER TABLE `kot_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kot_items_kot_id_foreign` (`kot_id`),
  ADD KEY `kot_items_menu_item_id_foreign` (`menu_item_id`),
  ADD KEY `kot_items_menu_item_variation_id_foreign` (`menu_item_variation_id`);

--
-- Indexes for table `kot_item_modifier_options`
--
ALTER TABLE `kot_item_modifier_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kot_item_modifier_options_kot_item_id_foreign` (`kot_item_id`),
  ADD KEY `kot_item_modifier_options_modifier_option_id_foreign` (`modifier_option_id`);

--
-- Indexes for table `kot_places`
--
ALTER TABLE `kot_places`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kot_places_branch_id_foreign` (`branch_id`),
  ADD KEY `kot_places_printer_id_foreign` (`printer_id`);

--
-- Indexes for table `kot_settings`
--
ALTER TABLE `kot_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kot_settings_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `language_settings`
--
ALTER TABLE `language_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menus_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`),
  ADD KEY `menu_items_item_category_id_foreign` (`item_category_id`),
  ADD KEY `idx_branch_available` (`branch_id`,`is_available`);

--
-- Indexes for table `menu_item_translations`
--
ALTER TABLE `menu_item_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menu_item_translations_menu_item_id_locale_unique` (`menu_item_id`,`locale`),
  ADD KEY `menu_item_translations_locale_index` (`locale`);

--
-- Indexes for table `menu_item_variations`
--
ALTER TABLE `menu_item_variations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_item_variations_menu_item_id_foreign` (`menu_item_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `modifier_groups`
--
ALTER TABLE `modifier_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modifier_groups_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `modifier_group_translations`
--
ALTER TABLE `modifier_group_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `modifier_group_translations_modifier_group_id_locale_unique` (`modifier_group_id`,`locale`),
  ADD KEY `modifier_group_translations_locale_index` (`locale`);

--
-- Indexes for table `modifier_options`
--
ALTER TABLE `modifier_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modifier_options_modifier_group_id_foreign` (`modifier_group_id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_settings`
--
ALTER TABLE `notification_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notification_settings_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `offline_payment_methods`
--
ALTER TABLE `offline_payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offline_payment_methods_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `offline_plan_changes`
--
ALTER TABLE `offline_plan_changes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offline_plan_changes_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `offline_plan_changes_package_id_foreign` (`package_id`),
  ADD KEY `offline_plan_changes_invoice_id_foreign` (`invoice_id`),
  ADD KEY `offline_plan_changes_offline_method_id_foreign` (`offline_method_id`);

--
-- Indexes for table `onboarding_steps`
--
ALTER TABLE `onboarding_steps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `onboarding_steps_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_uuid_unique` (`uuid`),
  ADD KEY `orders_table_id_foreign` (`table_id`),
  ADD KEY `orders_customer_id_foreign` (`customer_id`),
  ADD KEY `orders_delivery_executive_id_foreign` (`delivery_executive_id`),
  ADD KEY `orders_waiter_id_foreign` (`waiter_id`),
  ADD KEY `orders_cancel_reason_id_foreign` (`cancel_reason_id`),
  ADD KEY `idx_branch_date` (`branch_id`,`date_time`);

--
-- Indexes for table `order_charges`
--
ALTER TABLE `order_charges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_charges_order_id_foreign` (`order_id`),
  ADD KEY `order_charges_charge_id_foreign` (`charge_id`);

--
-- Indexes for table `order_histories`
--
ALTER TABLE `order_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_histories_order_id_foreign` (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_menu_item_id_foreign` (`menu_item_id`),
  ADD KEY `order_items_menu_item_variation_id_foreign` (`menu_item_variation_id`),
  ADD KEY `order_items_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `order_item_modifier_options`
--
ALTER TABLE `order_item_modifier_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_item_modifier_options_order_item_id_foreign` (`order_item_id`),
  ADD KEY `order_item_modifier_options_modifier_option_id_foreign` (`modifier_option_id`);

--
-- Indexes for table `order_places`
--
ALTER TABLE `order_places`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_places_branch_id_foreign` (`branch_id`),
  ADD KEY `order_places_printer_id_foreign` (`printer_id`);

--
-- Indexes for table `order_taxes`
--
ALTER TABLE `order_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_taxes_order_id_foreign` (`order_id`),
  ADD KEY `order_taxes_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `packages_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `package_modules`
--
ALTER TABLE `package_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package_modules_package_id_foreign` (`package_id`),
  ADD KEY `package_modules_module_id_foreign` (`module_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payfast_payments`
--
ALTER TABLE `payfast_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payfast_payments_order_id_foreign` (`order_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_order_id_foreign` (`order_id`),
  ADD KEY `payments_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `payment_gateway_credentials`
--
ALTER TABLE `payment_gateway_credentials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_gateway_credentials_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `paypal_payments`
--
ALTER TABLE `paypal_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paypal_payments_order_id_foreign` (`order_id`);

--
-- Indexes for table `paystack_payments`
--
ALTER TABLE `paystack_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paystack_payments_order_id_foreign` (`order_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`),
  ADD KEY `permissions_module_id_foreign` (`module_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `printers`
--
ALTER TABLE `printers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `printers_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `printers_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `print_jobs`
--
ALTER TABLE `print_jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `print_jobs_printer_id_foreign` (`printer_id`),
  ADD KEY `print_jobs_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `print_jobs_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `purchase_orders_po_number_unique` (`po_number`),
  ADD KEY `purchase_orders_branch_id_foreign` (`branch_id`),
  ADD KEY `purchase_orders_supplier_id_foreign` (`supplier_id`),
  ADD KEY `purchase_orders_created_by_foreign` (`created_by`);

--
-- Indexes for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_order_items_purchase_order_id_foreign` (`purchase_order_id`),
  ADD KEY `purchase_order_items_inventory_item_id_foreign` (`inventory_item_id`);

--
-- Indexes for table `pusher_settings`
--
ALTER TABLE `pusher_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `razorpay_payments`
--
ALTER TABLE `razorpay_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `razorpay_payments_order_id_foreign` (`order_id`);

--
-- Indexes for table `receipt_settings`
--
ALTER TABLE `receipt_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `receipt_settings_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipes_menu_item_id_foreign` (`menu_item_id`),
  ADD KEY `recipes_inventory_item_id_foreign` (`inventory_item_id`),
  ADD KEY `recipes_unit_id_foreign` (`unit_id`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reservations_table_id_foreign` (`table_id`),
  ADD KEY `reservations_customer_id_foreign` (`customer_id`),
  ADD KEY `reservations_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `reservation_settings`
--
ALTER TABLE `reservation_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reservation_settings_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_settings_country_id_foreign` (`country_id`),
  ADD KEY `restaurant_settings_currency_id_foreign` (`currency_id`),
  ADD KEY `restaurants_package_id_foreign` (`package_id`);

--
-- Indexes for table `restaurant_charges`
--
ALTER TABLE `restaurant_charges`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_charges_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `restaurant_charges_charge_name_index` (`charge_name`);

--
-- Indexes for table `restaurant_payments`
--
ALTER TABLE `restaurant_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_payments_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `restaurant_payments_package_id_foreign` (`package_id`);

--
-- Indexes for table `restaurant_taxes`
--
ALTER TABLE `restaurant_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `restaurant_taxes_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`),
  ADD KEY `roles_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `split_orders`
--
ALTER TABLE `split_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `split_orders_order_id_foreign` (`order_id`);

--
-- Indexes for table `split_order_items`
--
ALTER TABLE `split_order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `split_order_items_split_order_id_foreign` (`split_order_id`),
  ADD KEY `split_order_items_order_item_id_foreign` (`order_item_id`);

--
-- Indexes for table `stripe_payments`
--
ALTER TABLE `stripe_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stripe_payments_order_id_foreign` (`order_id`);

--
-- Indexes for table `superadmin_payment_gateways`
--
ALTER TABLE `superadmin_payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `suppliers_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `tables`
--
ALTER TABLE `tables`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tables_area_id_foreign` (`area_id`),
  ADD KEY `tables_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taxes_restaurant_id_foreign` (`restaurant_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `units_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_restaurant_id_foreign` (`restaurant_id`),
  ADD KEY `users_stripe_id_index` (`stripe_id`),
  ADD KEY `idx_branch_email` (`branch_id`,`email`);

--
-- Indexes for table `waiter_requests`
--
ALTER TABLE `waiter_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `waiter_requests_branch_id_foreign` (`branch_id`),
  ADD KEY `waiter_requests_table_id_foreign` (`table_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `branch_delivery_settings`
--
ALTER TABLE `branch_delivery_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_menus`
--
ALTER TABLE `custom_menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_executives`
--
ALTER TABLE `delivery_executives`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_fee_tiers`
--
ALTER TABLE `delivery_fee_tiers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `desktop_applications`
--
ALTER TABLE `desktop_applications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `email_settings`
--
ALTER TABLE `email_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `file_storage`
--
ALTER TABLE `file_storage`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT for table `file_storage_settings`
--
ALTER TABLE `file_storage_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `flags`
--
ALTER TABLE `flags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=267;

--
-- AUTO_INCREMENT for table `flutterwave_payments`
--
ALTER TABLE `flutterwave_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `front_details`
--
ALTER TABLE `front_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `front_faq_settings`
--
ALTER TABLE `front_faq_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `front_features`
--
ALTER TABLE `front_features`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `front_review_settings`
--
ALTER TABLE `front_review_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `global_currencies`
--
ALTER TABLE `global_currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `global_invoices`
--
ALTER TABLE `global_invoices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `global_settings`
--
ALTER TABLE `global_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `global_subscriptions`
--
ALTER TABLE `global_subscriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `inventory_global_settings`
--
ALTER TABLE `inventory_global_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inventory_items`
--
ALTER TABLE `inventory_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `inventory_item_categories`
--
ALTER TABLE `inventory_item_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `inventory_movements`
--
ALTER TABLE `inventory_movements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory_settings`
--
ALTER TABLE `inventory_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `inventory_stocks`
--
ALTER TABLE `inventory_stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `item_categories`
--
ALTER TABLE `item_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `item_modifiers`
--
ALTER TABLE `item_modifiers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kots`
--
ALTER TABLE `kots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `kot_cancel_reasons`
--
ALTER TABLE `kot_cancel_reasons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `kot_items`
--
ALTER TABLE `kot_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `kot_item_modifier_options`
--
ALTER TABLE `kot_item_modifier_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kot_places`
--
ALTER TABLE `kot_places`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kot_settings`
--
ALTER TABLE `kot_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `language_settings`
--
ALTER TABLE `language_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `menu_item_translations`
--
ALTER TABLE `menu_item_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=156;

--
-- AUTO_INCREMENT for table `menu_item_variations`
--
ALTER TABLE `menu_item_variations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=332;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT for table `modifier_groups`
--
ALTER TABLE `modifier_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modifier_group_translations`
--
ALTER TABLE `modifier_group_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modifier_options`
--
ALTER TABLE `modifier_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `notification_settings`
--
ALTER TABLE `notification_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `offline_payment_methods`
--
ALTER TABLE `offline_payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offline_plan_changes`
--
ALTER TABLE `offline_plan_changes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `onboarding_steps`
--
ALTER TABLE `onboarding_steps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `order_charges`
--
ALTER TABLE `order_charges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_histories`
--
ALTER TABLE `order_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `order_item_modifier_options`
--
ALTER TABLE `order_item_modifier_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_places`
--
ALTER TABLE `order_places`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_taxes`
--
ALTER TABLE `order_taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `package_modules`
--
ALTER TABLE `package_modules`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `payfast_payments`
--
ALTER TABLE `payfast_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `payment_gateway_credentials`
--
ALTER TABLE `payment_gateway_credentials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `paypal_payments`
--
ALTER TABLE `paypal_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `paystack_payments`
--
ALTER TABLE `paystack_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `printers`
--
ALTER TABLE `printers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `print_jobs`
--
ALTER TABLE `print_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pusher_settings`
--
ALTER TABLE `pusher_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `razorpay_payments`
--
ALTER TABLE `razorpay_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `receipt_settings`
--
ALTER TABLE `receipt_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `recipes`
--
ALTER TABLE `recipes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reservation_settings`
--
ALTER TABLE `reservation_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `restaurant_charges`
--
ALTER TABLE `restaurant_charges`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurant_payments`
--
ALTER TABLE `restaurant_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurant_taxes`
--
ALTER TABLE `restaurant_taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `split_orders`
--
ALTER TABLE `split_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `split_order_items`
--
ALTER TABLE `split_order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stripe_payments`
--
ALTER TABLE `stripe_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `superadmin_payment_gateways`
--
ALTER TABLE `superadmin_payment_gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tables`
--
ALTER TABLE `tables`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `waiter_requests`
--
ALTER TABLE `waiter_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `areas`
--
ALTER TABLE `areas`
  ADD CONSTRAINT `areas_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `branches`
--
ALTER TABLE `branches`
  ADD CONSTRAINT `branches_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `branch_delivery_settings`
--
ALTER TABLE `branch_delivery_settings`
  ADD CONSTRAINT `branch_delivery_settings_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_language_setting_id_foreign` FOREIGN KEY (`language_setting_id`) REFERENCES `language_settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `currencies`
--
ALTER TABLE `currencies`
  ADD CONSTRAINT `currencies_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD CONSTRAINT `customer_addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `delivery_executives`
--
ALTER TABLE `delivery_executives`
  ADD CONSTRAINT `delivery_executives_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `delivery_fee_tiers`
--
ALTER TABLE `delivery_fee_tiers`
  ADD CONSTRAINT `delivery_fee_tiers_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_expense_category_id_foreign` FOREIGN KEY (`expense_category_id`) REFERENCES `expense_categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD CONSTRAINT `expense_categories_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `file_storage`
--
ALTER TABLE `file_storage`
  ADD CONSTRAINT `file_storage_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flutterwave_payments`
--
ALTER TABLE `flutterwave_payments`
  ADD CONSTRAINT `flutterwave_payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `front_details`
--
ALTER TABLE `front_details`
  ADD CONSTRAINT `front_details_language_setting_id_foreign` FOREIGN KEY (`language_setting_id`) REFERENCES `language_settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `front_faq_settings`
--
ALTER TABLE `front_faq_settings`
  ADD CONSTRAINT `front_faq_settings_language_setting_id_foreign` FOREIGN KEY (`language_setting_id`) REFERENCES `language_settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `front_features`
--
ALTER TABLE `front_features`
  ADD CONSTRAINT `front_features_language_setting_id_foreign` FOREIGN KEY (`language_setting_id`) REFERENCES `language_settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `front_review_settings`
--
ALTER TABLE `front_review_settings`
  ADD CONSTRAINT `front_review_settings_language_setting_id_foreign` FOREIGN KEY (`language_setting_id`) REFERENCES `language_settings` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `global_invoices`
--
ALTER TABLE `global_invoices`
  ADD CONSTRAINT `global_invoices_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `global_currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `global_invoices_global_subscription_id_foreign` FOREIGN KEY (`global_subscription_id`) REFERENCES `global_subscriptions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `global_invoices_offline_method_id_foreign` FOREIGN KEY (`offline_method_id`) REFERENCES `offline_payment_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `global_invoices_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `global_invoices_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `global_settings`
--
ALTER TABLE `global_settings`
  ADD CONSTRAINT `global_settings_default_currency_id_foreign` FOREIGN KEY (`default_currency_id`) REFERENCES `global_currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `global_subscriptions`
--
ALTER TABLE `global_subscriptions`
  ADD CONSTRAINT `global_subscriptions_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `global_currencies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `global_subscriptions_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `global_subscriptions_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `inventory_items`
--
ALTER TABLE `inventory_items`
  ADD CONSTRAINT `inventory_items_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inventory_items_inventory_item_category_id_foreign` FOREIGN KEY (`inventory_item_category_id`) REFERENCES `inventory_item_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inventory_items_preferred_supplier_id_foreign` FOREIGN KEY (`preferred_supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `inventory_items_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `inventory_item_categories`
--
ALTER TABLE `inventory_item_categories`
  ADD CONSTRAINT `inventory_item_categories_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `inventory_movements`
--
ALTER TABLE `inventory_movements`
  ADD CONSTRAINT `inventory_movements_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inventory_movements_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inventory_movements_inventory_item_id_foreign` FOREIGN KEY (`inventory_item_id`) REFERENCES `inventory_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inventory_movements_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `inventory_movements_transfer_branch_id_foreign` FOREIGN KEY (`transfer_branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `inventory_settings`
--
ALTER TABLE `inventory_settings`
  ADD CONSTRAINT `inventory_settings_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `inventory_stocks`
--
ALTER TABLE `inventory_stocks`
  ADD CONSTRAINT `inventory_stocks_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inventory_stocks_inventory_item_id_foreign` FOREIGN KEY (`inventory_item_id`) REFERENCES `inventory_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `item_categories`
--
ALTER TABLE `item_categories`
  ADD CONSTRAINT `item_categories_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `item_modifiers`
--
ALTER TABLE `item_modifiers`
  ADD CONSTRAINT `item_modifiers_menu_item_id_foreign` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_modifiers_modifier_group_id_foreign` FOREIGN KEY (`modifier_group_id`) REFERENCES `modifier_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kots`
--
ALTER TABLE `kots`
  ADD CONSTRAINT `kots_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kots_cancel_reason_id_foreign` FOREIGN KEY (`cancel_reason_id`) REFERENCES `kot_cancel_reasons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kots_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kot_cancel_reasons`
--
ALTER TABLE `kot_cancel_reasons`
  ADD CONSTRAINT `kot_cancel_reasons_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kot_items`
--
ALTER TABLE `kot_items`
  ADD CONSTRAINT `kot_items_kot_id_foreign` FOREIGN KEY (`kot_id`) REFERENCES `kots` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kot_items_menu_item_id_foreign` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kot_items_menu_item_variation_id_foreign` FOREIGN KEY (`menu_item_variation_id`) REFERENCES `menu_item_variations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kot_item_modifier_options`
--
ALTER TABLE `kot_item_modifier_options`
  ADD CONSTRAINT `kot_item_modifier_options_kot_item_id_foreign` FOREIGN KEY (`kot_item_id`) REFERENCES `kot_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kot_item_modifier_options_modifier_option_id_foreign` FOREIGN KEY (`modifier_option_id`) REFERENCES `modifier_options` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kot_places`
--
ALTER TABLE `kot_places`
  ADD CONSTRAINT `kot_places_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kot_places_printer_id_foreign` FOREIGN KEY (`printer_id`) REFERENCES `printers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `kot_settings`
--
ALTER TABLE `kot_settings`
  ADD CONSTRAINT `kot_settings_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menus`
--
ALTER TABLE `menus`
  ADD CONSTRAINT `menus_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menu_items_item_category_id_foreign` FOREIGN KEY (`item_category_id`) REFERENCES `item_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_item_translations`
--
ALTER TABLE `menu_item_translations`
  ADD CONSTRAINT `menu_item_translations_menu_item_id_foreign` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menu_item_variations`
--
ALTER TABLE `menu_item_variations`
  ADD CONSTRAINT `menu_item_variations_menu_item_id_foreign` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `modifier_groups`
--
ALTER TABLE `modifier_groups`
  ADD CONSTRAINT `modifier_groups_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `modifier_group_translations`
--
ALTER TABLE `modifier_group_translations`
  ADD CONSTRAINT `modifier_group_translations_modifier_group_id_foreign` FOREIGN KEY (`modifier_group_id`) REFERENCES `modifier_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `modifier_options`
--
ALTER TABLE `modifier_options`
  ADD CONSTRAINT `modifier_options_modifier_group_id_foreign` FOREIGN KEY (`modifier_group_id`) REFERENCES `modifier_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notification_settings`
--
ALTER TABLE `notification_settings`
  ADD CONSTRAINT `notification_settings_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `offline_payment_methods`
--
ALTER TABLE `offline_payment_methods`
  ADD CONSTRAINT `offline_payment_methods_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `offline_plan_changes`
--
ALTER TABLE `offline_plan_changes`
  ADD CONSTRAINT `offline_plan_changes_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `global_invoices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offline_plan_changes_offline_method_id_foreign` FOREIGN KEY (`offline_method_id`) REFERENCES `offline_payment_methods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offline_plan_changes_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `offline_plan_changes_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `onboarding_steps`
--
ALTER TABLE `onboarding_steps`
  ADD CONSTRAINT `onboarding_steps_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_cancel_reason_id_foreign` FOREIGN KEY (`cancel_reason_id`) REFERENCES `kot_cancel_reasons` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_delivery_executive_id_foreign` FOREIGN KEY (`delivery_executive_id`) REFERENCES `delivery_executives` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_table_id_foreign` FOREIGN KEY (`table_id`) REFERENCES `tables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_waiter_id_foreign` FOREIGN KEY (`waiter_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_charges`
--
ALTER TABLE `order_charges`
  ADD CONSTRAINT `order_charges_charge_id_foreign` FOREIGN KEY (`charge_id`) REFERENCES `restaurant_charges` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_charges_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_histories`
--
ALTER TABLE `order_histories`
  ADD CONSTRAINT `order_histories_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_menu_item_id_foreign` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_menu_item_variation_id_foreign` FOREIGN KEY (`menu_item_variation_id`) REFERENCES `menu_item_variations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_item_modifier_options`
--
ALTER TABLE `order_item_modifier_options`
  ADD CONSTRAINT `order_item_modifier_options_modifier_option_id_foreign` FOREIGN KEY (`modifier_option_id`) REFERENCES `modifier_options` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_item_modifier_options_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_places`
--
ALTER TABLE `order_places`
  ADD CONSTRAINT `order_places_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_places_printer_id_foreign` FOREIGN KEY (`printer_id`) REFERENCES `printers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_taxes`
--
ALTER TABLE `order_taxes`
  ADD CONSTRAINT `order_taxes_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_taxes_tax_id_foreign` FOREIGN KEY (`tax_id`) REFERENCES `taxes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `packages`
--
ALTER TABLE `packages`
  ADD CONSTRAINT `packages_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `global_currencies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `package_modules`
--
ALTER TABLE `package_modules`
  ADD CONSTRAINT `package_modules_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `package_modules_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payfast_payments`
--
ALTER TABLE `payfast_payments`
  ADD CONSTRAINT `payfast_payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payment_gateway_credentials`
--
ALTER TABLE `payment_gateway_credentials`
  ADD CONSTRAINT `payment_gateway_credentials_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `paypal_payments`
--
ALTER TABLE `paypal_payments`
  ADD CONSTRAINT `paypal_payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `paystack_payments`
--
ALTER TABLE `paystack_payments`
  ADD CONSTRAINT `paystack_payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `printers`
--
ALTER TABLE `printers`
  ADD CONSTRAINT `printers_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `printers_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `print_jobs`
--
ALTER TABLE `print_jobs`
  ADD CONSTRAINT `print_jobs_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `print_jobs_printer_id_foreign` FOREIGN KEY (`printer_id`) REFERENCES `printers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `print_jobs_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD CONSTRAINT `purchase_orders_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_orders_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `purchase_orders_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`);

--
-- Constraints for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  ADD CONSTRAINT `purchase_order_items_inventory_item_id_foreign` FOREIGN KEY (`inventory_item_id`) REFERENCES `inventory_items` (`id`),
  ADD CONSTRAINT `purchase_order_items_purchase_order_id_foreign` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `razorpay_payments`
--
ALTER TABLE `razorpay_payments`
  ADD CONSTRAINT `razorpay_payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `receipt_settings`
--
ALTER TABLE `receipt_settings`
  ADD CONSTRAINT `receipt_settings_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `recipes`
--
ALTER TABLE `recipes`
  ADD CONSTRAINT `recipes_inventory_item_id_foreign` FOREIGN KEY (`inventory_item_id`) REFERENCES `inventory_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recipes_menu_item_id_foreign` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `recipes_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservations_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `reservations_table_id_foreign` FOREIGN KEY (`table_id`) REFERENCES `tables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reservation_settings`
--
ALTER TABLE `reservation_settings`
  ADD CONSTRAINT `reservation_settings_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD CONSTRAINT `restaurant_settings_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `restaurant_settings_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `restaurants_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `restaurant_charges`
--
ALTER TABLE `restaurant_charges`
  ADD CONSTRAINT `restaurant_charges_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `restaurant_payments`
--
ALTER TABLE `restaurant_payments`
  ADD CONSTRAINT `restaurant_payments_package_id_foreign` FOREIGN KEY (`package_id`) REFERENCES `packages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `restaurant_payments_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `restaurant_taxes`
--
ALTER TABLE `restaurant_taxes`
  ADD CONSTRAINT `restaurant_taxes_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `roles`
--
ALTER TABLE `roles`
  ADD CONSTRAINT `roles_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `split_orders`
--
ALTER TABLE `split_orders`
  ADD CONSTRAINT `split_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `split_order_items`
--
ALTER TABLE `split_order_items`
  ADD CONSTRAINT `split_order_items_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `split_order_items_split_order_id_foreign` FOREIGN KEY (`split_order_id`) REFERENCES `split_orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stripe_payments`
--
ALTER TABLE `stripe_payments`
  ADD CONSTRAINT `stripe_payments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD CONSTRAINT `suppliers_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tables`
--
ALTER TABLE `tables`
  ADD CONSTRAINT `tables_area_id_foreign` FOREIGN KEY (`area_id`) REFERENCES `areas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tables_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `taxes`
--
ALTER TABLE `taxes`
  ADD CONSTRAINT `taxes_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `units_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_restaurant_id_foreign` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurants` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `waiter_requests`
--
ALTER TABLE `waiter_requests`
  ADD CONSTRAINT `waiter_requests_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `waiter_requests_table_id_foreign` FOREIGN KEY (`table_id`) REFERENCES `tables` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
