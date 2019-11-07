-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2019 at 04:44 AM
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
-- Table structure for table `activities_code_bank`
--

CREATE TABLE `activities_code_bank` (
  `ID` int(11) NOT NULL,
  `scID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `code` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activities_code_bank`
--

INSERT INTO `activities_code_bank` (`ID`, `scID`, `name`, `code`) VALUES
(1, 1, 'Lecturing', 'Lec'),
(2, 1, 'Group Discussion', 'Grp Disc'),
(3, 1, 'Administrative Task', 'Admin'),
(4, 1, 'Media', 'Med'),
(5, 1, 'Idle', 'Idle'),
(6, 2, 'Group Work', 'Grp Wk'),
(7, 2, 'Individual Work', 'Ind Wk'),
(8, 2, 'Presentation', 'Pres');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `ID` int(11) NOT NULL,
  `category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`ID`, `category`) VALUES
(1, 'Activity'),
(2, 'Instantaneous Event'),
(3, 'Durational Event');

-- --------------------------------------------------------

--
-- Table structure for table `dependencies`
--

CREATE TABLE `dependencies` (
  `ID` int(11) NOT NULL,
  `aID` int(11) NOT NULL COMMENT 'activities_code_bank ID',
  `eID` int(11) NOT NULL COMMENT 'events_code_bank ID'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dependencies`
--

INSERT INTO `dependencies` (`ID`, `aID`, `eID`) VALUES
(1, 1, 13),
(2, 1, 14),
(3, 1, 15),
(4, 1, 16),
(5, 1, 17),
(6, 1, 1),
(7, 1, 2),
(8, 1, 3),
(9, 1, 4),
(10, 1, 5),
(11, 1, 6),
(12, 1, 7),
(13, 1, 25),
(14, 1, 26),
(15, 1, 27),
(16, 1, 28),
(17, 1, 29),
(18, 1, 20),
(19, 1, 21),
(20, 1, 22),
(21, 1, 23),
(22, 1, 24),
(23, 1, 8),
(24, 1, 9),
(25, 1, 10),
(26, 1, 11),
(27, 1, 12),
(28, 2, 13),
(29, 2, 14),
(30, 2, 15),
(31, 2, 16),
(32, 2, 17),
(33, 2, 18),
(34, 2, 19),
(35, 2, 1),
(36, 2, 2),
(37, 2, 3),
(38, 2, 4),
(39, 2, 5),
(40, 2, 6),
(41, 2, 7),
(42, 2, 25),
(43, 2, 26),
(44, 2, 27),
(45, 2, 28),
(46, 2, 29),
(47, 2, 20),
(48, 2, 21),
(49, 2, 22),
(50, 2, 23),
(51, 2, 24),
(52, 2, 8),
(53, 2, 9),
(54, 2, 10),
(55, 2, 11),
(56, 3, 13),
(57, 3, 14),
(58, 3, 15),
(59, 3, 1),
(60, 3, 2),
(61, 3, 4),
(62, 3, 5),
(63, 3, 6),
(64, 3, 7),
(65, 3, 25),
(66, 3, 26),
(67, 3, 27),
(68, 3, 29),
(69, 3, 20),
(70, 3, 21),
(71, 3, 22),
(72, 3, 23),
(73, 3, 24),
(74, 3, 8),
(75, 3, 9),
(76, 3, 10),
(77, 3, 12),
(78, 4, 15),
(79, 4, 18),
(80, 4, 26),
(81, 4, 27),
(82, 4, 29),
(83, 4, 23),
(84, 4, 24),
(85, 4, 8),
(86, 4, 9),
(87, 4, 10),
(88, 4, 12),
(89, 6, 13),
(90, 6, 14),
(91, 6, 15),
(92, 6, 17),
(93, 6, 18),
(94, 6, 19),
(95, 6, 2),
(96, 6, 4),
(97, 6, 5),
(98, 6, 6),
(99, 6, 7),
(100, 6, 25),
(101, 6, 26),
(102, 6, 27),
(103, 6, 28),
(104, 6, 29),
(105, 6, 20),
(106, 6, 21),
(107, 6, 22),
(108, 6, 23),
(109, 6, 24),
(110, 6, 8),
(111, 6, 9),
(112, 6, 10),
(113, 6, 11),
(114, 7, 13),
(115, 7, 14),
(116, 7, 15),
(117, 7, 16),
(118, 7, 17),
(119, 7, 18),
(120, 7, 2),
(121, 7, 4),
(122, 7, 5),
(123, 7, 6),
(124, 7, 7),
(125, 7, 25),
(126, 7, 26),
(127, 7, 27),
(128, 7, 28),
(129, 7, 29),
(130, 7, 20),
(131, 7, 23),
(132, 7, 24),
(133, 7, 8),
(134, 7, 9),
(135, 7, 10),
(136, 7, 11),
(137, 8, 18),
(138, 8, 4),
(139, 8, 5),
(140, 8, 6),
(141, 8, 7),
(142, 8, 25),
(143, 8, 26),
(144, 8, 27),
(145, 8, 28),
(146, 8, 29),
(147, 8, 20),
(148, 8, 21),
(149, 8, 22),
(150, 8, 23),
(151, 8, 24),
(152, 8, 8),
(153, 8, 9),
(154, 8, 10),
(155, 8, 11),
(156, 8, 12),
(157, 2, 12);

-- --------------------------------------------------------

--
-- Table structure for table `events_code_bank`
--

CREATE TABLE `events_code_bank` (
  `ID` int(11) NOT NULL,
  `scID` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `code` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `events_code_bank`
--

INSERT INTO `events_code_bank` (`ID`, `scID`, `name`, `code`) VALUES
(1, 3, 'Poses Question', 'Pose Q'),
(2, 3, 'Comprehension Question', 'Comp Q'),
(3, 3, 'Rhetorical Question', 'Rhetoric Q'),
(4, 3, 'Answers Question', 'Answer Q'),
(5, 3, 'Individual Feedback', 'Ind Feedback'),
(6, 3, 'Uses Humor', 'Humor'),
(7, 3, 'Uses Emphasis', 'Emphasis'),
(8, 4, 'Asks a Question', 'Asks Q'),
(9, 4, 'Responds to Instructor', 'Responds to I'),
(10, 4, 'Responds to Student', 'Responds to S'),
(11, 4, 'Makes Prediction', 'Predict'),
(12, 4, 'Whole Class Response', 'Whole Class Ans'),
(13, 5, 'Problems', 'Prob'),
(14, 5, 'Writing', 'Write'),
(15, 5, 'Pre-made Materials', 'Pre-made'),
(16, 5, 'Live Action', 'Live'),
(17, 5, 'Class Feedback', 'Feedbk'),
(18, 5, 'Monitoring', 'Monit'),
(19, 5, 'Moving in Groups', 'Move in Grp'),
(20, 6, 'Structured Work', 'Strc Wk'),
(21, 6, 'Informal Discussion', 'Inf Disc'),
(22, 6, 'Live Action', 'Live'),
(23, 6, 'Taking Notes', 'Notes'),
(24, 6, 'Distracted', 'Distract'),
(25, 7, 'Non-digital', 'Non-digit'),
(26, 7, 'Digital', 'Digit'),
(27, 7, 'Projection', 'Project'),
(28, 7, 'Response System', 'Resp Sys'),
(29, 7, 'Website', 'Web');

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `ID` int(11) NOT NULL,
  `cID` int(11) NOT NULL,
  `subcategory` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`ID`, `cID`, `subcategory`) VALUES
(1, 1, 'Instructor Activity'),
(2, 1, 'Student Activity'),
(3, 2, 'Instructor Event'),
(4, 2, 'Student Event'),
(5, 3, 'Instructor Event'),
(6, 3, 'Student Event'),
(7, 3, 'Technology');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities_code_bank`
--
ALTER TABLE `activities_code_bank`
  ADD PRIMARY KEY (`ID`);
ALTER TABLE `activities_code_bank`
  ADD FOREIGN KEY (`scID`) REFERENCES `subcategories`(`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `dependencies`
--
ALTER TABLE `dependencies`
  ADD PRIMARY KEY (`ID`);
ALTER TABLE `dependencies`
  ADD FOREIGN KEY (`aID`) REFERENCES `activities_code_bank`(`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE `dependencies`
  ADD FOREIGN KEY (`eID`) REFERENCES `events_code_bank`(`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Indexes for table `events_code_bank`
--
ALTER TABLE `events_code_bank`
  ADD PRIMARY KEY (`ID`);
ALTER TABLE `events_code_bank`
  ADD FOREIGN KEY (`scID`) REFERENCES `subcategories`(`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`ID`);
ALTER TABLE `subcategories`
  ADD FOREIGN KEY (`catID`) REFERENCES `categories`(`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities_code_bank`
--
ALTER TABLE `activities_code_bank`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dependencies`
--
ALTER TABLE `dependencies`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT for table `events_code_bank`
--
ALTER TABLE `events_code_bank`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
