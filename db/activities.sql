-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 20, 2019 at 04:31 PM
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
-- Table structure for table `collected_activities`
--

CREATE TABLE IF NOT EXISTS `collected_activities` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `oID` int(11) NOT NULL COMMENT 'observation ID',
  `aID` int(11) NOT NULL COMMENT 'activity ID',
  `sT` varchar(10) CHARACTER SET latin1 NOT NULL COMMENT 'start time',
  `eT` varchar(10) CHARACTER SET latin1 NOT NULL COMMENT 'end time',
   PRIMARY KEY(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `collected_activities`
--
ALTER TABLE `collected_activities`
  ADD FOREIGN KEY (`aID`) REFERENCES `activities_code_bank`(`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `collected_activities`
  ADD FOREIGN KEY (`oID`) REFERENCES `observations`(`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
   
 COMMIT;
 
 
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
