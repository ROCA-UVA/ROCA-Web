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
-- Table structure for table `observers'
--

CREATE TABLE `observers` ( 
    `ID` INT NOT NULL AUTO_INCREMENT ,
    `name` VARCHAR(50) NOT NULL ,
    `computingID` VARCHAR(6) NOT NULL ,
    PRIMARY KEY (`ID`)
) ENGINE = InnoDB;
       

--
-- Dumping data for table `observers`
--

INSERT INTO `observers` (`ID`, `name`, `computingID`) VALUES 
    ('1', 'Olivia Ryu', 'hr2ad'),
    ('2', 'Jenny Wang', 'jw4dk')
-- --------------------------------------------------------

--
-- Table structure for table `instructors`
--

CREATE TABLE `instructors` ( 
    `ID` INT NOT NULL AUTO_INCREMENT , 
    `name` VARCHAR(50) NOT NULL ,
    `computingID` VARCHAR(6) NOT NULL ,
    PRIMARY KEY (`ID`)
    ) ENGINE = InnoDB;

--
-- Dumping data for table `instructors`
--
INSERT INTO `instructors` (`ID`, `name`, `computingID`) VALUES
    ('1', 'Michael Redwine', 'mr7va')



COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
