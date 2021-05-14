-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2021 at 03:32 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `buyerandpaymentdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `bids`
--

CREATE TABLE `bids` (
  `bidid` int(11) NOT NULL,
  `itemCode` varchar(45) NOT NULL,
  `customerId` varchar(45) NOT NULL,
  `Amount` varchar(45) NOT NULL,
  `sConditions` varchar(45) DEFAULT NULL,
  `dueDate` date DEFAULT NULL,
  `accepted` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bids`
--

INSERT INTO `bids` (`bidid`, `itemCode`, `customerId`, `Amount`, `sConditions`, `dueDate`, `accepted`) VALUES
(1, 'itm1', 'customer1', '4545', NULL, '2020-12-12', 'Yes'),
(2, 'itm2', 'customer2', '2000', 'Products with defects will be returned', NULL, 'Yes'),
(3, 'itm3', 'customer1', '1000', NULL, NULL, 'No'),
(4, 'itm1', 'customer3', '4545', 'must be delivered within 7 days.', '2020-12-30', 'Yes'),
(5, 'itm2', 'customer4', '1200', NULL, NULL, 'No');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payId` int(11) NOT NULL,
  `itemCode` varchar(45) NOT NULL,
  `bidId` int(11) NOT NULL,
  `customerId` varchar(45) NOT NULL,
  `amount` float NOT NULL,
  `pMethod` varchar(45) NOT NULL,
  `cardNo` varchar(45) NOT NULL,
  `paymentDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payId`, `itemCode`, `bidId`, `customerId`, `amount`, `pMethod`, `cardNo`, `paymentDate`) VALUES
(16, 'item1', 1, 'customer1', 3000, 'credit', '09986544', '2020-12-21'),
(17, 'item2', 2, 'customer2', 45000, 'credit', '09876543', '2020-12-31'),
(18, 'item1', 3, 'customer3', 6700, 'credit', '09876544', '2021-01-01'),
(19, 'item1', 1, 'customer1', 150000, 'debit', '009864327', '2021-04-21'),
(20, 'item1', 1, 'customer1', 150000, 'debit', '009864327', '2021-04-22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bids`
--
ALTER TABLE `bids`
  ADD PRIMARY KEY (`bidid`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bids`
--
ALTER TABLE `bids`
  MODIFY `bidid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
