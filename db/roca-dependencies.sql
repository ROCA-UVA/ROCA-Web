-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 10, 2019 at 06:13 AM
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
-- Table structure for table `activity_categories`
--

CREATE TABLE `activity_categories` (
  `ID` int(11) NOT NULL,
  `activity` varchar(50) DEFAULT NULL,
  `activityCode` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activity_categories`
--

INSERT INTO `activity_categories` (`ID`, `activity`, `activityCode`) VALUES
(1, 'Lecturing', 'Lec'),
(2, 'Group Discussion', 'Grp Disc'),
(3, 'Administrative Task', 'Admin'),
(4, 'Media', 'Med'),
(5, 'Idle', 'Idle'),
(6, 'Group Work', 'Grp wk'),
(7, 'Individual Work', 'Ind wk'),
(8, 'Presentation', 'Pres');

-- --------------------------------------------------------

--
-- Table structure for table `instructor_event_dependencies`
--

CREATE TABLE `instructor_event_dependencies` (
  `ID` int(11) NOT NULL,
  `categoryID` int(11) NOT NULL,
  `event` varchar(50) NOT NULL,
  `eventCode` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instructor_event_dependencies`
--

INSERT INTO `instructor_event_dependencies` (`ID`, `categoryID`, `event`, `eventCode`) VALUES
(1, 1, 'Problems', 'Prob'),
(2, 1, 'Writing', 'Write'),
(3, 1, 'Pre-made Materials', 'Pre-made'),
(4, 1, 'Live Action', 'Live'),
(5, 1, 'Class Feedback', 'Feedbk'),
(6, 2, 'Problems', 'Prob'),
(7, 2, 'Writing', 'Write'),
(8, 2, 'Pre-made Materials', 'Pre-made'),
(9, 2, 'Live Action', 'Live'),
(10, 2, 'Class Feedback', 'Feedbk'),
(11, 2, 'Monitoring', 'Monit'),
(12, 2, 'Moving In Groups', 'Move in Grp'),
(15, 3, 'Problems', 'Prob'),
(16, 3, 'Writing', 'Write'),
(17, 3, 'Pre-made Materials', 'Pre-made'),
(18, 4, 'Pre-made Materials', 'Pre-made'),
(19, 4, 'Monitoring', 'Monit');

-- --------------------------------------------------------

--
-- Table structure for table `instructor_inst_event_dependencies`
--

CREATE TABLE `instructor_inst_event_dependencies` (
  `ID` int(11) NOT NULL,
  `cateogoryID` int(11) NOT NULL,
  `instEvent` varchar(50) NOT NULL,
  `instEventCode` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instructor_inst_event_dependencies`
--

INSERT INTO `instructor_inst_event_dependencies` (`ID`, `cateogoryID`, `instEvent`, `instEventCode`) VALUES
(1, 1, 'Poses Question', 'Poses Q'),
(2, 1, 'Comprehension Question', 'Comp Q'),
(3, 1, 'Rhetorical Question', 'Rhetoric Q'),
(4, 1, 'Answers Question', 'Answers Q'),
(5, 1, 'Individual Feedback', 'Ind Feedback'),
(6, 1, 'Uses Humor', 'Humor'),
(7, 1, 'Uses Emphasis', 'Emphasis'),
(8, 2, 'Poses Question', 'Poses Q'),
(9, 2, 'Comprehension Question', 'Comp Q'),
(10, 2, 'Rhetorical Question', 'Rhetoric Q'),
(11, 2, 'Answers Question', 'Answers Q'),
(12, 2, 'Individual Feedback', 'Ind Feedback'),
(13, 2, 'Uses Humor', 'Humor'),
(14, 2, 'Uses Emphasis', 'Emphasis'),
(15, 3, 'Poses Question', 'Poses Q'),
(16, 3, 'Comprehension Question', 'Comp Q'),
(17, 3, 'Answers Question', 'Answers Q'),
(18, 3, 'Individual Feedback', 'Ind Feedback'),
(19, 3, 'Uses Humor', 'Humor'),
(20, 3, 'Uses Emphasis', 'Emphasis');

-- --------------------------------------------------------

--
-- Table structure for table `tech_dependencies`
--

CREATE TABLE `tech_dependencies` (
  `ID` int(11) NOT NULL,
  `categoryID` int(11) NOT NULL,
  `tech` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tech_dependencies`
--

INSERT INTO `tech_dependencies` (`ID`, `categoryID`, `tech`) VALUES
(1, 1, 'Non-digital'),
(2, 1, 'Digital'),
(3, 1, 'Projection'),
(4, 1, 'Response System'),
(5, 1, 'Website'),
(6, 2, 'Non-digital'),
(7, 2, 'Digital'),
(8, 2, 'Projection'),
(9, 2, 'Response System'),
(10, 2, 'Website'),
(11, 3, 'Non-digital'),
(12, 3, 'Digital'),
(13, 3, 'Projection'),
(14, 3, 'Website'),
(15, 4, 'Digital'),
(16, 4, 'Projection'),
(17, 4, 'Website'),
(18, 6, 'Non-digital'),
(19, 6, 'Digital'),
(20, 6, 'Projection'),
(21, 6, 'Response System'),
(22, 6, 'Website'),
(23, 7, 'Non-digital'),
(24, 7, 'Digital'),
(25, 7, 'Projection'),
(26, 7, 'Response System'),
(27, 7, 'Website'),
(28, 8, 'Non-digital'),
(29, 8, 'Digital'),
(30, 8, 'Projection'),
(31, 8, 'Response System'),
(32, 8, 'Website');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_categories`
--
ALTER TABLE `activity_categories`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `instructor_event_dependencies`
--
ALTER TABLE `instructor_event_dependencies`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `instructor_inst_event_dependencies`
--
ALTER TABLE `instructor_inst_event_dependencies`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tech_dependencies`
--
ALTER TABLE `tech_dependencies`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_categories`
--
ALTER TABLE `activity_categories`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `instructor_event_dependencies`
--
ALTER TABLE `instructor_event_dependencies`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `instructor_inst_event_dependencies`
--
ALTER TABLE `instructor_inst_event_dependencies`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tech_dependencies`
--
ALTER TABLE `tech_dependencies`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
