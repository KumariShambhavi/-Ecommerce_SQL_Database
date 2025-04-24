-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2025 at 05:51 PM
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
-- Database: `ecommerce_analysis`
--

-- --------------------------------------------------------

--
-- Table structure for table `expense_iigf`
--

CREATE TABLE `expense_iigf` (
  `id` int(11) NOT NULL,
  `received_date` date DEFAULT NULL,
  `received_amount` decimal(10,2) DEFAULT NULL,
  `expense_category` varchar(100) DEFAULT NULL,
  `expense_amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `international_sales`
--

CREATE TABLE `international_sales` (
  `id` int(11) NOT NULL,
  `sale_date` date DEFAULT NULL,
  `month` varchar(20) DEFAULT NULL,
  `customer` varchar(100) DEFAULT NULL,
  `style` varchar(50) DEFAULT NULL,
  `sku` varchar(50) DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL,
  `pcs` int(11) DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `gross_amt` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Stand-in structure for view `monthly_sales_summary`
-- (See below for the actual view)
--
CREATE TABLE `monthly_sales_summary` (
`month` varchar(20)
,`customer` varchar(100)
,`total_sales` decimal(32,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `pnl_march_2021`
--

CREATE TABLE `pnl_march_2021` (
  `id` int(11) NOT NULL,
  `sku` varchar(50) DEFAULT NULL,
  `style_id` varchar(50) DEFAULT NULL,
  `catalog` varchar(50) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `weight` decimal(10,2) DEFAULT NULL,
  `tp1` decimal(10,2) DEFAULT NULL,
  `tp2` decimal(10,2) DEFAULT NULL,
  `mrp_old` decimal(10,2) DEFAULT NULL,
  `ajio_mrp` decimal(10,2) DEFAULT NULL,
  `amazon_mrp` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sale_report`
--

CREATE TABLE `sale_report` (
  `id` int(11) NOT NULL,
  `sku_code` varchar(50) DEFAULT NULL,
  `design_no` varchar(50) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure for view `monthly_sales_summary`
--
DROP TABLE IF EXISTS `monthly_sales_summary`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `monthly_sales_summary`  AS SELECT `international_sales`.`month` AS `month`, `international_sales`.`customer` AS `customer`, sum(`international_sales`.`gross_amt`) AS `total_sales` FROM `international_sales` GROUP BY `international_sales`.`month`, `international_sales`.`customer` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `expense_iigf`
--
ALTER TABLE `expense_iigf`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `international_sales`
--
ALTER TABLE `international_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_customer` (`customer`),
  ADD KEY `idx_style` (`style`);

--
-- Indexes for table `pnl_march_2021`
--
ALTER TABLE `pnl_march_2021`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sale_report`
--
ALTER TABLE `sale_report`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `expense_iigf`
--
ALTER TABLE `expense_iigf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `international_sales`
--
ALTER TABLE `international_sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pnl_march_2021`
--
ALTER TABLE `pnl_march_2021`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sale_report`
--
ALTER TABLE `sale_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
