-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 27, 2026 at 09:24 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dw_retail_sales`
--

-- --------------------------------------------------------

--
-- Table structure for table `dim_customer`
--

DROP TABLE IF EXISTS `dim_customer`;
CREATE TABLE `dim_customer` (
  `id_dimCustomer` int NOT NULL,
  `Customer ID` varchar(50) DEFAULT NULL,
  `Customer Name` varchar(100) DEFAULT NULL,
  `Segment` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dim_location`
--

DROP TABLE IF EXISTS `dim_location`;
CREATE TABLE `dim_location` (
  `id_dimLocation` int NOT NULL,
  `Postal Code` varchar(20) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  `Region` varchar(50) DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  `City` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dim_product`
--

DROP TABLE IF EXISTS `dim_product`;
CREATE TABLE `dim_product` (
  `id_dimProduct` int NOT NULL,
  `Product ID` varchar(50) DEFAULT NULL,
  `Category` varchar(50) DEFAULT NULL,
  `Sub-Category` varchar(50) DEFAULT NULL,
  `Product Name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fact_sales`
--

DROP TABLE IF EXISTS `fact_sales`;
CREATE TABLE `fact_sales` (
  `id_factSales` int NOT NULL,
  `Order ID` varchar(50) DEFAULT NULL,
  `Order Date` date DEFAULT NULL,
  `id_dimCustomer` int DEFAULT NULL,
  `id_dimProduct` int DEFAULT NULL,
  `id_dimLocation` int DEFAULT NULL,
  `Sales` decimal(15,4) DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `Discount` decimal(5,2) DEFAULT NULL,
  `Profit` decimal(15,4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dim_customer`
--
ALTER TABLE `dim_customer`
  ADD PRIMARY KEY (`id_dimCustomer`);

--
-- Indexes for table `dim_location`
--
ALTER TABLE `dim_location`
  ADD PRIMARY KEY (`id_dimLocation`);

--
-- Indexes for table `dim_product`
--
ALTER TABLE `dim_product`
  ADD PRIMARY KEY (`id_dimProduct`);

--
-- Indexes for table `fact_sales`
--
ALTER TABLE `fact_sales`
  ADD PRIMARY KEY (`id_factSales`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dim_customer`
--
ALTER TABLE `dim_customer`
  MODIFY `id_dimCustomer` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dim_location`
--
ALTER TABLE `dim_location`
  MODIFY `id_dimLocation` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dim_product`
--
ALTER TABLE `dim_product`
  MODIFY `id_dimProduct` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fact_sales`
--
ALTER TABLE `fact_sales`
  MODIFY `id_factSales` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
