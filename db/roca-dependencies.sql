-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 27, 2019 at 04:15 AM
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
-- Table structure for table `instructor-actions`
--

CREATE TABLE `instructor-actions` (
  `ID` int(11) NOT NULL,
  `Action` varchar(100) NOT NULL COMMENT 'what the instructor is doing'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instructor-actions`
--

INSERT INTO `instructor-actions` (`ID`, `Action`) VALUES
(1, 'Problems'),
(2, 'Writing'),
(3, 'Pre-Made Materials'),
(4, 'Live Action'),
(5, 'Class Feedback'),
(6, 'Monitoring'),
(7, 'Moving in Groups'),
(8, 'Poses Question'),
(9, 'Rhetorical Question'),
(10, 'Comprehensive Question'),
(11, 'Answers Question'),
(12, 'Individual Follow-up'),
(13, 'Uses Humor'),
(14, 'Uses Emphasis');

-- --------------------------------------------------------

--
-- Table structure for table `instructor-activity-categories`
--

CREATE TABLE `instructor-activity-categories` (
  `id` int(11) NOT NULL,
  `category` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `instructor-activity-categories`
--

INSERT INTO `instructor-activity-categories` (`id`, `category`) VALUES
(1, 'Lecture'),
(2, 'Group Discussion'),
(3, 'Administrative Task'),
(4, 'Media'),
(5, 'Idle');

-- --------------------------------------------------------

--
-- Table structure for table `student-actions`
--

CREATE TABLE `student-actions` (
  `id` int(11) NOT NULL,
  `student-response` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student-actions`
--

INSERT INTO `student-actions` (`id`, `student-response`) VALUES
(1, 'Structured Work'),
(2, 'Informal Discussion'),
(3, 'Live Action'),
(4, 'Taking Notes'),
(5, 'Distracted');

-- --------------------------------------------------------

--
-- Table structure for table `student-activity-categories`
--

CREATE TABLE `student-activity-categories` (
  `id` int(11) NOT NULL,
  `category` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student-activity-categories`
--

INSERT INTO `student-activity-categories` (`id`, `category`) VALUES
(1, 'Group Work'),
(2, 'Independent Work'),
(3, 'Presentation');

-- --------------------------------------------------------

--
-- Table structure for table `technologies`
--

CREATE TABLE `technologies` (
  `id` int(11) NOT NULL,
  `technology` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `technologies`
--

INSERT INTO `technologies` (`id`, `technology`) VALUES
(1, 'Non-digital'),
(2, 'Digital'),
(3, 'Projection'),
(4, 'Response System'),
(5, 'Website');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `instructor-actions`
--
ALTER TABLE `instructor-actions`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `instructor-activity-categories`
--
ALTER TABLE `instructor-activity-categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student-actions`
--
ALTER TABLE `student-actions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student-activity-categories`
--
ALTER TABLE `student-activity-categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `technologies`
--
ALTER TABLE `technologies`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `instructor-actions`
--
ALTER TABLE `instructor-actions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `instructor-activity-categories`
--
ALTER TABLE `instructor-activity-categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `student-actions`
--
ALTER TABLE `student-actions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `student-activity-categories`
--
ALTER TABLE `student-activity-categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `technologies`
--
ALTER TABLE `technologies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
