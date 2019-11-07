-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 11, 2019 at 11:04 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `roca`
--

-- --------------------------------------------------------

--
-- Table structure for table `collected_events'
--



CREATE TABLE `collected_events` (
`ID` INT NOT NULL AUTO_INCREMENT ,
`oID` INT NOT NULL COMMENT 'observation ID' ,
`aID` INT NOT NULL COMMENT 'activity ID' ,
`eID` INT NOT NULL COMMENT 'event ID' ,
`sT` INT NOT NULL COMMENT 'start time' ,
`eT` INT NOT NULL COMMENT 'end time' ,
`sectID` INT NOT NULL COMMENT 'section ID' ,
PRIMARY KEY (`ID`)) ENGINE = InnoDB;

-- Indexes for table `collected_events`
--
ALTER TABLE `collected_events` ADD FOREIGN KEY (`oID`) REFERENCES `observations`(`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `collected_events` ADD FOREIGN KEY (`aID`) REFERENCES `activities_code_bank`(`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `collected_events` ADD FOREIGN KEY (`eID`) REFERENCES `events_code_bank`(`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `collected_events` ADD FOREIGN KEY (`sectionID`) REFERENCES `room_coordinates`(`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;


COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
