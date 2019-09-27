-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 20, 2019 at 03:29 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.2.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `roca_codebook`
--

-- --------------------------------------------------------

--
-- Table structure for table `roca_codebook_activities`
--

CREATE TABLE `roca_codebook_activities` (
  `ID` int(11) NOT NULL,
  `Category` varchar(10) NOT NULL,
  `dC` varchar(20) NOT NULL,
  `dN` varchar(70) NOT NULL,
  `dD` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roca_codebook_activities`
--

INSERT INTO `roca_codebook_activities` (`ID`, `Category`, `dC`, `dN`, `dD`) VALUES
(1, 'Instructor', 'Lec', 'Lecturing', 'The instructor is talking to the students about course content, concepts, or ideas. The instructor does the majority of the talking and can be coupled with events of duration (i.e., working problems on the board) and can be interrupted by instantaneous events (i.e., question to students. (Examples: instructor lecturing while working through a problem on the board, instructor lecturing while going through slides)'),
(2, 'Instructor', 'Grp Disc', 'Group discussion', 'The instructor is leading student through a discussion by asking a series of questions that students individually answer. The instructor plays the role as facilitator of these discussions. There should be a coherent and repeated question and answer back-and-forth between the instructor and students.'),
(3, 'Instructor', 'Admin', 'Administrative task', 'The instructor is talking to students about non-content related course material. (Examples:  instructor discusses exams/homework/ assignments, logistics about the course, directions for an activities, or events related to the course or material)'),
(4, 'Instructor', 'Med', 'Media', 'The instructor plays a video or movie for students to watch. This should be coded when other activities are stopped and does not include demonstrations, .gifs, or short clips.'),
(5, 'Instructor', 'Idle', 'Idle', 'The instructor is not running class during class time. (Examples: class starts late, there is a break during class, or an unforeseen occurrence happens)'),
(6, 'Student', 'Grp wk', 'Group work', 'Students are engaging with each other in small groups. (Examples: working problems, discussing case studies, pairing up during a think, pair, share, discussing a ‘clicker question’)'),
(7, 'Student', 'Ind wk', 'Individual work', 'Students are working through or engaging with course material individually. (Examples: working problems, completing a writing prompt, answering a ‘clicker question’)'),
(8, 'Student', 'Pres', 'Presentation', 'A student or group of students are leading class while the instructor takes on an observatory or student role. (Examples: presenting a project, leading a group discussion, running a review session)');

-- --------------------------------------------------------

--
-- Table structure for table `roca_codebook_events_of_duration`
--

CREATE TABLE `roca_codebook_events_of_duration` (
  `Id` int(11) NOT NULL,
  `Category` varchar(10) NOT NULL,
  `dC` varchar(20) NOT NULL,
  `dN` varchar(70) NOT NULL,
  `dD` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roca_codebook_events_of_duration`
--

INSERT INTO `roca_codebook_events_of_duration` (`Id`, `Category`, `dC`, `dN`, `dD`) VALUES
(1, 'Instructor', 'Prob', 'Problems', 'The instructor works through a computational or theoretical question or problem. This can be in front of the whole class, or with an individual group. (Examples: solving a math problem, talking through the answer to a theoretical question)'),
(2, 'Instructor', 'Writ', 'Writing', 'The instructor actively writes on a blank surface or pre-made visual. Writing can be electronic or non-electronic. (Examples: writing on a chalkboard or whiteboard, writing on a tablet, writing within a powerpoint slide, typing out code, writing under a document camera)'),
(3, 'Instructor', 'Pre-made', 'Pre-made materials', 'The instructor uses materials made prior to the class session to help convey course content/ideas. The instructor should be using the material or having students use the material in some way. The materials can be electronic or non-electronic (Examples: powerpoint, printed handout, set of images, programming code, audio/video previously recorded by instructor)'),
(4, 'Instructor', 'Live', 'Live action', 'The instructor uses equipment, simulation, or students (e.g., role play) to convey course content. The instructor’s reference to the live action, the action itself, and follow-up conversation should be included. (Examples: using an online simulation, setting up equipment to demonstrate a phenomenon, students perform role play/skit in front of the entire class)'),
(5, 'Instructor', 'Feedbk', 'Class feedback', 'The instructor follows up with the whole class following an activity. (Examples: instructor debriefs after group discussion or group work, instructor goes through an answer to a ‘clicker question’)'),
(6, 'Instructor', 'Monit', 'Monitoring', 'The instructor is attentive and gauging student progress during an active learning task but does not interact with the students. (Examples: standing at the front of the room and observing, walking around the room to observe individual groups, checking response rate for a ‘clicker question’)'),
(7, 'Instructor', 'Move in Gr', 'Moving in groups', 'The instructor is moving through class and engaging with students and groups of students to guide ongoing work during an active learning task. (Examples: asking students questions in groups, commenting on student progress)'),
(8, 'Technology', 'Non-digit', 'Non-digital', 'The use of any non-electronic surface for disseminating content or engaging students in the content. (Examples: chalkboard, whiteboard, document camera, students raising hands for agree/disagree )'),
(9, 'Technology', 'Digit', 'Digital', 'The use of an electronic device or technology during class to disseminate content or engage students in the content. Can be coded with instructor and student events  of duration as well as other technology. (Examples: desktop or laptop computer, tablet, smart phone)'),
(10, 'Technology', 'Project', 'Projection', 'The use of a digital display in projecting material that the instructor references. (Examples: computer screen with a powerpoint slide or static website)'),
(11, 'Technology', 'Resp Sys', 'Response system', 'The active use of a website or learning management system. (Examples: Using a youtube video, showing students how to navigate the course website resources, googling answers)'),
(12, 'Technology', 'Web', 'Website', 'The active use of a website or learning management system. (Examples: Using a youtube video, showing students how to navigate the course website resources, googling answers)'),
(13, 'Student', 'Strc Wk', 'Structured work', 'Students work individually or in small groups on a specific task. (Examples: working on a worksheet, problem set or case study, answering specific question prompts with targeted responses)'),
(14, 'Student', 'Inf Disc', 'Informal discussion', 'Students interact with each other in pairs or small groups around a general topic. (Examples: pairing up as part of a think, pair, share activity, talking in a group about an activity)'),
(15, 'Student', 'Live', 'Live action', 'In small groups, the students use equipment, simulation, or role play/skit to work through a task (Examples: using an online simulation, setting up equipment to demonstrate a phenomenon, students perform role play/skit in groups)'),
(16, 'Student', 'Notes', 'Taking notes', 'Students are taking notes. (Examples: typing on computer, hand written)'),
(17, 'Student', 'Distract', 'Distracted', 'Students are not focused on the instruction or activity. (Examples: non-academic web browsing, sleeping, talking/texting during lecture, not participating in small group activity)');

-- --------------------------------------------------------

--
-- Table structure for table `roca_codebook_instaneous`
--

CREATE TABLE `roca_codebook_instaneous` (
  `ID` int(11) NOT NULL,
  `Category` varchar(10) NOT NULL,
  `dC` varchar(20) NOT NULL,
  `dN` varchar(70) NOT NULL,
  `dD` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roca_codebook_instaneous`
--

INSERT INTO `roca_codebook_instaneous` (`ID`, `Category`, `dC`, `dN`, `dD`) VALUES
(1, 'Instructor', 'Pose Q', 'Poses question', 'The instructor poses a question to the class that seeks input or response from student(s). (Examples: Asking an open-ended question to start a whole class discussion, asking a clicker question for all students to answer, asking for an answer to a problem that a single student would answer in front of the whole class)  '),
(2, 'Instructor', 'Comp Q', 'Comprehension question', 'The instructor asks a question to check for understanding of content or process. (Examples: ‘Do you understand?’, ‘Do you have any questions?’)'),
(3, 'Instructor', 'Rhetoric Q', 'Rhetorical question', 'The instructor poses a question without seeking an answer or without giving students an opportunity to answer. (Examples: a question posed that an instructor asks students to think about before answering/pairing/sharing, a pose question that the instructor immediately answers themselves, a comprehension question with no wait time)'),
(4, 'Instructor', 'Answer Q', 'Answers question', 'The instructor answers a student-posed question. (Examples: Answers a question from a student who raised their hand in class)'),
(5, 'Instructor', 'Ind Feedback', 'Individual feedback', 'The instructor follows-up, or provides feedback, to an individual student response . (Examples: after a student answers a question the instructor asks a follow-up question directed back at that student)'),
(6, 'Instructor', 'Humor', 'Uses Humor', 'The instructor tells a joke or uses a humorous anecdote that gets laughter from students . (Example: joke of the day, sharing a story)'),
(7, 'Instructor', 'Emphasis', 'Uses emphasis', 'The instructor explicitly states that something is important for students to learn for course assessments, future careers, or to learn the material well. Assumptions or implicit emphasis should not be coded. (Example: ‘If you remember from last class when we talked about…’, ‘You will use X when you go into Y career’, ‘This is important to understand for your final project/test’).'),
(8, 'Student', 'Asks Q', 'Asks a question', 'A student asks a question to the instructor or to the class related to the content of the course. (Examples: Clarifying a concept/ checking for clarification on directions/course assessments, asking a question to an instructor comprehension question, posing a question to other students during a whole class discussion).'),
(9, 'Student', 'Respond to I', 'Responds to instructor', 'A student responds to a question posed by the instructor. This could be a single student or a series of students but does not include the whole class answering a question together. (Examples: a student raising their hand to answer an instructor posed question during lecture, a student responding to an instructor prompt during a whole class discussion)'),
(10, 'Student', 'Respond to S', 'Responds to another student', 'A student responds to a question posed by another student. This could be prompted by the instructor or a direct response. (Example: a student directly answers a question posed by another student during a whole class discussion, a student answers a question posed by another student after the instructor asks students to answer the question)'),
(11, 'Student', 'Predict', 'Makes prediction', 'A student/class makes a prediction about the outcome of a demonstration, simulation, thought experiment, or live action activity before it occurs. (Examples: a student shares their idea of what would happen if X, students predict what will happen as a result of X occurring during a demonstration)'),
(12, 'Student', 'Whole Class Ans', 'Whole class response', 'Students respond as a whole class to an instructor question, either through digital or non-digital means. (Example: students using a classroom response system to answer a question or make a prediction, students raising hands to tally whole class response)');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `roca_codebook_activities`
--
ALTER TABLE `roca_codebook_activities`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `roca_codebook_events_of_duration`
--
ALTER TABLE `roca_codebook_events_of_duration`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `roca_codebook_instaneous`
--
ALTER TABLE `roca_codebook_instaneous`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `roca_codebook_activities`
--
ALTER TABLE `roca_codebook_activities`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `roca_codebook_events_of_duration`
--
ALTER TABLE `roca_codebook_events_of_duration`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `roca_codebook_instaneous`
--
ALTER TABLE `roca_codebook_instaneous`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
