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
-- Table structure for table `course'
--

CREATE TABLE `course` ( 
    `ID` INT NOT NULL AUTO_INCREMENT ,
    `cName` VARCHAR(50) NOT NULL COMMENT 'courseName' ,
    `cCode` VARCHAR(10) NOT NULL COMMENT 'courseCode' ,
    `semyear` VARCHAR(5) NOT NULL COMMENT 'semesterYear', 
    `sectionNum` INT NOT NULL COMMENT 'section number' , 
    `rId` INT NOT NULL COMMENT 'room ID' , 
    `iId` INT NOT NULL COMMENT 'instructor ID' , 
    PRIMARY KEY (`ID`)
) ENGINE = InnoDB;
       

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`ID`, `cName`, `cCode`, `semyear`, `sectionNum`, `rId`, `iId`) VALUES 
('1', 'Introduction to Computer Science', 'CS1110', 'F2019', '1', '1', '1');
-- --------------------------------------------------------

--
-- Indexes for table `course`
--


;

ALTER TABLE `course` ADD FOREIGN KEY (`rId`) REFERENCES `room`(`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `course` ADD FOREIGN KEY (`iId`) REFERENCES `instructor`(`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;






COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;