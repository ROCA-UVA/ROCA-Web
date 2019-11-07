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
-- Table structure for table `rooms'
--

CREATE TABLE `rooms` (
    `ID` INT NOT NULL AUTO_INCREMENT ,
    `roomName` VARCHAR(50) NOT NULL ,
    PRIMARY KEY (`ID`)
    ) ENGINE = InnoDB;
    
    
--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`ID`, `roomName`) VALUES 
    ('1', 'MSB202'),
    ('2', 'PLSB310'),
    ('3', 'CHEM102');

-- --------------------------------------------------------

--
-- Table structure for table `room_coordinates`
--

CREATE TABLE `room_coordinates` ( 
    `ID` INT NOT NULL AUTO_INCREMENT , 
    `rID` INT NOT NULL COMMENT 'room ID' , 
    `sP` VARCHAR(5) NOT NULL COMMENT 'starting point' , 
    `eP` VARCHAR(5) NOT NULL COMMENT 'ending point' , 
    `sectID` INT NOT NULL COMMENT 'section ID' , 
    PRIMARY KEY (`ID`)
    ) ENGINE = InnoDB;

--
-- Dumping data for table `room_coordinates`
--
INSERT INTO `room_coordinates` (`ID`, `rID`, `sP`, `eP`, `sectID`) VALUES
 ('1', '1', '12.34', '24.29', '1'), 
 ('2', '1', '43.24', '5.983', '2'), 
 ('3', '1', '24.14', '53.25', '3'), 
 ('4', '1', '12.64', '33.34', '4'), 
 ('5', '1', '52.84', '74.64', '5'), 
 ('6', '1', '23.23', '55.23', '6'), 
 ('7', '2', '42.64', '11.23', '1');



--
-- Indexes for table `room_coordinates`
--
ALTER TABLE `room_coordinates` 
ADD FOREIGN KEY (`rID`) REFERENCES `rooms`(`ID`) 
ON DELETE RESTRICT ON UPDATE RESTRICT;


COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
