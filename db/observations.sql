-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 20, 2019 at 04:21 PM
-- Server version: 5.5.64-MariaDB
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ROCA`
--

-- --------------------------------------------------------

--
-- Table structure for table `observations`
--

CREATE TABLE IF NOT EXISTS `observations` (
  `ID` int(11) NOT NULL,
  `obsID` int(11) NOT NULL COMMENT 'observer ID',
  `cID` int(11) NOT NULL COMMENT 'course ID',
  `sT` varchar(10) CHARACTER SET latin1 NOT NULL COMMENT 'start time',
  `eT` varchar(10) CHARACTER SET latin1 NOT NULL COMMENT 'end time'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `observations`
--
ALTER TABLE `observations`
  ADD PRIMARY KEY (`ID`);
  
ALTER TABLE `observations` ADD FOREIGN KEY (`obsID`) REFERENCES `observers`(`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `observations` ADD FOREIGN KEY (`cID`) REFERENCES `courses`(`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
