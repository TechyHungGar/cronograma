-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2016 at 08:24 PM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school`
--

-- --------------------------------------------------------

--
-- Table structure for table `completecourses`
--

CREATE TABLE `completecourses` (
  `studentID` int(11) NOT NULL,
  `courseID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `completecourses`
--

INSERT INTO `completecourses` (`studentID`, `courseID`) VALUES
(1, 9),
(1, 14),
(1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `courseinfo`
--

CREATE TABLE `courseinfo` (
  `id` int(11) NOT NULL,
  `name` varchar(39) NOT NULL,
  `day` varchar(39) NOT NULL,
  `courseType` varchar(39) NOT NULL,
  `start` time(2) NOT NULL,
  `end` time(2) NOT NULL,
  `code` varchar(39) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `courseinfo`
--

INSERT INTO `courseinfo` (`id`, `name`, `day`, `courseType`, `start`, `end`, `code`, `course_id`) VALUES
(1, 'Web Programming', '-T-----', 'Tut', '11:45:00.00', '13:25:00.00', 'SOEN287', 1),
(2, 'Web Programming', '---J---', 'Tut', '18:15:00.00', '19:55:00.00', 'SOEN287', 1),
(3, 'Web Programming', '-T-J---', 'Lec', '10:15:00.00', '11:30:00.00', 'SOEN287', 1),
(4, 'Information Systems Security', 'M------', 'Tut', '20:30:00.00', '21:20:00.00', 'SOEN321', 2),
(5, 'Information Systems Security', 'M------', 'Tut', '20:30:00.00', '21:20:00.00', 'SOEN321', 2),
(6, 'Information Systems Security', 'M------', 'Lec', '17:45:00.00', '20:15:00.00', 'SOEN321', 2),
(7, 'Software Process', '----F--', 'Tut', '11:45:00.00', '12:35:00.00', 'SOEN341', 3),
(8, 'Software Process', '----F--', 'Tut', '12:45:00.00', '13:35:00.00', 'SOEN341', 3),
(9, 'Software Process', '--W-F--', 'Lec', '10:15:00.00', '11:30:00.00', 'SOEN341', 3),
(10, 'Software Requirements and Specification', '----F--', 'Tut', '15:45:00.00', '16:35:00.00', 'SOEN342', 4),
(11, 'Software Requirements and Specification', '--W----', 'Tut', '14:45:00.00', '15:35:00.00', 'SOEN342', 4),
(12, 'Software Requirements and Specification', '--W-F--', 'Lec', '11:45:00.00', '13:00:00.00', 'SOEN342', 4),
(13, 'Software Architecture and Design', '----F--', 'Tut', '14:45:00.00', '15:35:00.00', 'SOEN343', 5),
(14, 'Software Architecture and Design', '----F--', 'Tut', '14:45:00.00', '15:35:00.00', 'SOEN343', 5),
(15, 'Software Architecture and Design', '--W-F--', 'Lec', '13:15:00.00', '14:30:00.00', 'SOEN343', 5),
(16, 'Management, Measurement and Quality Con', '----F--', 'Tut', '09:15:00.00', '10:05:00.00', 'SOEN384', 6),
(17, 'Management, Measurement and Quality Con', '----F--', 'Tut', '09:15:00.00', '10:05:00.00', 'SOEN384', 6),
(18, 'Management, Measurement and Quality Con', '--W-F--', 'Lec', '10:15:00.00', '11:30:00.00', 'SOEN384', 6),
(19, 'Capstone Software Engineering Design Pr', '-T-J---', 'Lab', '08:30:00.00', '10:30:00.00', 'SOEN490', 7),
(20, 'Capstone Software Engineering Design Pr', '-T-J---', 'Lab', '08:30:00.00', '10:30:00.00', 'SOEN490', 7),
(30, 'Capstone Software Engineering Design Pr', '----F--', 'Lec', '18:25:00.00', '19:25:00.00', 'SOEN490', 7),
(31, 'Math for Computer Science', '--W----', 'Tut', '20:30:00.00', '22:10:00.00', 'COMP232', 8),
(32, 'Math for Computer Science', '--W----', 'Tut', '20:30:00.00', '22:10:00.00', 'COMP232', 8),
(33, 'Math for Computer Science', '--W----', 'Tut', '20:30:00.00', '22:10:00.00', 'COMP232', 8),
(34, 'Math for Computer Science', '---J---', 'Tut', '20:30:00.00', '22:10:00.00', 'COMP232', 8),
(35, 'Math for Computer Science', '---J---', 'Tut', '20:30:00.00', '22:10:00.00', 'COMP232', 8),
(36, 'Math for Computer Science', '---J---', 'Tut', '20:30:00.00', '22:10:00.00', 'COMP232', 8),
(37, 'Math for Computer Science', '-T-----', 'Tut', '16:15:00.00', '17:55:00.00', 'COMP232', 8),
(38, 'Math for Computer Science', '---J---', 'Tut', '14:45:00.00', '16:25:00.00', 'COMP232', 8),
(39, 'Math for Computer Science', '---J---', 'Tut', '14:45:00.00', '16:25:00.00', 'COMP232', 8),
(40, 'Math for Computer Science', '-T-----', 'Tut', '16:15:00.00', '17:55:00.00', 'COMP232', 8),
(41, 'Math for Computer Science', '-T-----', 'Tut', '16:15:00.00', '17:55:00.00', 'COMP232', 8),
(42, 'Math for Computer Science', '-T-----', 'Tut', '16:15:00.00', '17:55:00.00', 'COMP232', 8),
(43, 'Math for Computer Science', '--W----', 'Lec', '17:45:00.00', '20:15:00.00', 'COMP232', 8),
(44, 'Math for Computer Science', '---J---', 'Lec', '17:45:00.00', '20:15:00.00', 'COMP232', 8),
(45, 'Math for Computer Science', '-T-J---', 'Lec', '13:15:00.00', '14:30:00.00', 'COMP232', 8),
(46, 'Math for Computer Science', '-T-J---', 'Lec', '13:15:00.00', '14:30:00.00', 'COMP232', 8),
(47, 'Object-Oriented Programming I', '-T-----', 'Tut', '11:45:00.00', '13:25:00.00', 'COMP248', 9),
(48, 'Object-Oriented Programming I', '---J---', 'Tut', '11:45:00.00', '13:25:00.00', 'COMP248', 9),
(49, 'Object-Oriented Programming I', 'M------', 'Lab', '19:45:00.00', '20:45:00.00', 'COMP248', 9),
(50, 'Object-Oriented Programming I', '-T-----', 'Lab', '10:15:00.00', '11:15:00.00', 'COMP248', 9),
(51, 'Object-Oriented Programming I', '---J---', 'Lab', '20:30:00.00', '21:30:00.00', 'COMP248', 9),
(52, 'Object-Oriented Programming I', 'M------', 'Tut', '17:45:00.00', '19:25:00.00', 'COMP248', 9),
(53, 'Object-Oriented Programming I', '----F--', 'Tut', '11:45:00.00', '13:25:00.00', 'COMP248', 9),
(54, 'Object-Oriented Programming I', 'M------', 'Lab', '19:45:00.00', '20:45:00.00', 'COMP248', 9),
(55, 'Object-Oriented Programming I', '----F--', 'Lab', '10:15:00.00', '11:15:00.00', 'COMP248', 9),
(56, 'Object-Oriented Programming I', '----F--', 'Lab', '20:30:00.00', '21:30:00.00', 'COMP248', 9),
(57, 'Object-Oriented Programming I', '----F--', 'Lab', '10:40:00.00', '11:40:00.00', 'COMP248', 9),
(58, 'Object-Oriented Programming I', 'M------', 'Lab', '12:10:00.00', '13:10:00.00', 'COMP248', 9),
(59, 'Object-Oriented Programming I', 'M------', 'Lab', '12:10:00.00', '13:10:00.00', 'COMP248', 9),
(60, 'Object-Oriented Programming I', '----F--', 'Tut', '08:45:00.00', '10:25:00.00', 'COMP248', 9),
(61, 'Object-Oriented Programming I', 'M------', 'Tut', '10:15:00.00', '11:55:00.00', 'COMP248', 9),
(62, 'Object-Oriented Programming I', '--W----', 'Lab', '12:10:00.00', '13:10:00.00', 'COMP248', 9),
(63, 'Object-Oriented Programming I', '--W----', 'Lab', '12:10:00.00', '13:10:00.00', 'COMP248', 9),
(64, 'Object-Oriented Programming I', 'M------', 'Lab', '12:10:00.00', '13:10:00.00', 'COMP248', 9),
(65, 'Object-Oriented Programming I', 'M------', 'Tut', '10:15:00.00', '11:55:00.00', 'COMP248', 9),
(66, 'Object-Oriented Programming I', '--W----', 'Tut', '10:15:00.00', '11:55:00.00', 'COMP248', 9),
(67, 'Object-Oriented Programming I', '--W----', 'Tut', '10:15:00.00', '11:55:00.00', 'COMP248', 9),
(68, 'Object-Oriented Programming I', '----F--', 'Lab', '10:40:00.00', '11:40:00.00', 'COMP248', 9),
(69, 'Object-Oriented Programming I', '----F--', 'Lab', '10:40:00.00', '11:40:00.00', 'COMP248', 9),
(70, 'Object-Oriented Programming I', '--W----', 'Lab', '12:10:00.00', '13:10:00.00', 'COMP248', 9),
(71, 'Object-Oriented Programming I', 'M------', 'Tut', '10:15:00.00', '11:55:00.00', 'COMP248', 9),
(72, 'Object-Oriented Programming I', '--W----', 'Tut', '10:15:00.00', '11:55:00.00', 'COMP248', 9),
(73, 'Object-Oriented Programming I', '----F--', 'Tut', '08:45:00.00', '10:25:00.00', 'COMP248', 9),
(74, 'Object-Oriented Programming I', '---J---', 'Lec', '17:45:00.00', '20:15:00.00', 'COMP248', 9),
(75, 'Object-Oriented Programming I', '----F--', 'Lec', '17:45:00.00', '20:15:00.00', 'COMP248', 9),
(76, 'Object-Oriented Programming I', 'M-W----', 'Lec', '13:15:00.00', '14:30:00.00', 'COMP248', 9),
(77, 'Object-Oriented Programming I', 'M-W----', 'Lec', '13:15:00.00', '14:30:00.00', 'COMP248', 9),
(78, 'Object-Oriented Programming I', 'M-W----', 'Lec', '08:45:00.00', '10:00:00.00', 'COMP248', 9),
(79, 'Object-Oriented Programming II', 'M------', 'Tut', '12:45:00.00', '14:35:00.00', 'COMP249', 10),
(80, 'Object-Oriented Programming II', '--W----', 'Tut', '16:15:00.00', '17:55:00.00', 'COMP249', 10),
(81, 'Object-Oriented Programming II', 'M------', 'Tut', '16:15:00.00', '17:55:00.00', 'COMP249', 10),
(82, 'Object-Oriented Programming II', 'M------', 'Lab', '18:15:00.00', '19:15:00.00', 'COMP249', 10),
(83, 'Object-Oriented Programming II', '--W----', 'Lab', '18:15:00.00', '19:15:00.00', 'COMP249', 10),
(84, 'Object-Oriented Programming II', '--W----', 'Lab', '19:30:00.00', '20:30:00.00', 'COMP249', 10),
(85, 'Object-Oriented Programming II', 'M------', 'Tut', '12:45:00.00', '14:35:00.00', 'COMP249', 10),
(86, 'Object-Oriented Programming II', '--W----', 'Tut', '16:15:00.00', '17:55:00.00', 'COMP249', 10),
(87, 'Object-Oriented Programming II', 'M------', 'Tut', '16:15:00.00', '17:55:00.00', 'COMP249', 10),
(88, 'Object-Oriented Programming II', 'M------', 'Lab', '18:15:00.00', '19:15:00.00', 'COMP249', 10),
(89, 'Object-Oriented Programming II', '--W----', 'Lab', '18:15:00.00', '19:15:00.00', 'COMP249', 10),
(90, 'Object-Oriented Programming II', '--W----', 'Lab', '19:30:00.00', '20:30:00.00', 'COMP249', 10),
(91, 'Object-Oriented Programming II', 'M-W----', 'Lec', '14:45:00.00', '16:00:00.00', 'COMP249', 10),
(92, 'Object-Oriented Programming II', 'M-W----', 'Lec', '14:45:00.00', '16:00:00.00', 'COMP249', 10),
(93, 'Object-Oriented Programming I', 'M-W----', 'Lec', '08:45:00.00', '10:00:00.00', 'COMP248', 9),
(94, 'Object-Oriented Programming II', 'M------', 'Tut', '12:45:00.00', '14:35:00.00', 'COMP249', 10),
(95, 'Object-Oriented Programming II', '--W----', 'Tut', '16:15:00.00', '17:55:00.00', 'COMP249', 10),
(96, 'Object-Oriented Programming II', 'M------', 'Tut', '16:15:00.00', '17:55:00.00', 'COMP249', 10),
(97, 'Object-Oriented Programming II', 'M------', 'Lab', '18:15:00.00', '19:15:00.00', 'COMP249', 10),
(98, 'Object-Oriented Programming II', '--W----', 'Lab', '18:15:00.00', '19:15:00.00', 'COMP249', 10),
(99, 'Object-Oriented Programming II', '--W----', 'Lab', '19:30:00.00', '20:30:00.00', 'COMP249', 10),
(100, 'Object-Oriented Programming II', 'M------', 'Tut', '12:45:00.00', '14:35:00.00', 'COMP249', 10),
(101, 'Object-Oriented Programming II', '--W----', 'Tut', '16:15:00.00', '17:55:00.00', 'COMP249', 10),
(102, 'Object-Oriented Programming II', 'M------', 'Tut', '16:15:00.00', '17:55:00.00', 'COMP249', 10),
(103, 'Object-Oriented Programming II', 'M------', 'Lab', '18:15:00.00', '19:15:00.00', 'COMP249', 10),
(104, 'Object-Oriented Programming II', '--W----', 'Lab', '18:15:00.00', '19:15:00.00', 'COMP249', 10),
(105, 'Object-Oriented Programming II', '--W----', 'Lab', '19:30:00.00', '20:30:00.00', 'COMP249', 10),
(106, 'Object-Oriented Programming II', 'M-W----', 'Lec', '14:45:00.00', '16:00:00.00', 'COMP249', 10),
(107, 'Object-Oriented Programming II', 'M-W----', 'Lec', '14:45:00.00', '16:00:00.00', 'COMP249', 10),
(108, 'Introduction to Theoretical Computer Sc', '---J---', 'Tut', '11:45:00.00', '12:35:00.00', 'COMP335', 11),
(109, 'Introduction to Theoretical Computer Sc', '-T-----', 'Tut', '11:45:00.00', '12:35:00.00', 'COMP335', 11),
(110, 'Introduction to Theoretical Computer Sc', '-T-----', 'Tut', '14:45:00.00', '15:35:00.00', 'COMP335', 11),
(111, 'Introduction to Theoretical Computer Sc', '-T-----', 'Tut', '14:45:00.00', '15:35:00.00', 'COMP335', 11),
(112, 'Introduction to Theoretical Computer Sc', '-T-J---', 'Lec', '10:15:00.00', '11:30:00.00', 'COMP335', 11),
(113, 'Introduction to Theoretical Computer Sc', '-T-J---', 'Lec', '13:15:00.00', '14:30:00.00', 'COMP335', 11),
(114, 'Operating Systems', '-T-----', 'Tut', '20:30:00.00', '21:20:00.00', 'COMP346', 12),
(115, 'Operating Systems', '-T-----', 'Tut', '20:30:00.00', '21:20:00.00', 'COMP346', 12),
(116, 'Operating Systems', '---J---', 'Lab', '17:45:00.00', '19:35:00.00', 'COMP346', 12),
(117, 'Operating Systems', '---J---', 'Lab', '19:45:00.00', '21:35:00.00', 'COMP346', 12),
(118, 'Operating Systems', '-T-----', 'Lec', '17:45:00.00', '20:15:00.00', 'COMP346', 12),
(119, 'Principles of Programming Languages', '-T-----', 'Tut', '14:45:00.00', '15:35:00.00', 'COMP348', 13),
(120, 'Principles of Programming Languages', '---J---', 'Tut', '14:45:00.00', '15:35:00.00', 'COMP348', 13),
(121, 'Principles of Programming Languages', '-T-----', 'Tut', '14:45:00.00', '15:35:00.00', 'COMP348', 13),
(122, 'Principles of Programming Languages', 'M------', 'Tut', '10:15:00.00', '11:05:00.00', 'COMP348', 13),
(123, 'Principles of Programming Languages', 'M------', 'Tut', '10:15:00.00', '11:05:00.00', 'COMP348', 13),
(124, 'Principles of Programming Languages', '--W----', 'Tut', '10:15:00.00', '11:05:00.00', 'COMP348', 13),
(125, 'Principles of Programming Languages', 'M------', 'Tut', '10:15:00.00', '11:05:00.00', 'COMP348', 13),
(126, 'Principles of Programming Languages', '--W----', 'Tut', '10:15:00.00', '11:05:00.00', 'COMP348', 13),
(127, 'Principles of Programming Languages', '--W----', 'Tut', '10:15:00.00', '11:05:00.00', 'COMP348', 13),
(128, 'Principles of Programming Languages', '--W----', 'Lec', '17:45:00.00', '20:15:00.00', 'COMP348', 13),
(129, 'Principles of Programming Languages', 'M-W----', 'Lec', '08:45:00.00', '10:00:00.00', 'COMP348', 13),
(130, 'Principles of Programming Languages', 'M-W----', 'Lec', '08:45:00.00', '10:00:00.00', 'COMP348', 13),
(131, 'Data Structures and Algorithms', '----F--', 'Tut', '14:45:00.00', '15:35:00.00', 'COMP352', 14),
(132, 'Data Structures and Algorithms', 'M------', 'Tut', '11:45:00.00', '12:35:00.00', 'COMP352', 14),
(133, 'Data Structures and Algorithms', '----F--', 'Tut', '14:45:00.00', '15:35:00.00', 'COMP352', 14),
(134, 'Data Structures and Algorithms', 'M------', 'Tut', '11:45:00.00', '12:35:00.00', 'COMP352', 14),
(135, 'Data Structures and Algorithms', '----F--', 'Tut', '14:45:00.00', '15:35:00.00', 'COMP352', 14),
(136, 'Data Structures and Algorithms', 'M------', 'Tut', '11:45:00.00', '12:35:00.00', 'COMP352', 14),
(137, 'Data Structures and Algorithms', '--W----', 'Tut', '14:45:00.00', '15:35:00.00', 'COMP352', 14),
(138, 'Data Structures and Algorithms', '----F--', 'Tut', '14:45:00.00', '15:35:00.00', 'COMP352', 14),
(139, 'Data Structures and Algorithms', '--W-F--', 'Lec', '13:15:00.00', '14:30:00.00', 'COMP352', 14),
(140, 'Data Structures and Algorithms', '--W-F--', 'Lec', '13:15:00.00', '14:30:00.00', 'COMP352', 14),
(141, 'Data Structures and Algorithms', '--W-F--', 'Lec', '13:15:00.00', '14:30:00.00', 'COMP352', 14),
(142, 'Data Structures and Algorithms', '--W-F--', 'Lec', '13:15:00.00', '14:30:00.00', 'COMP352', 14),
(143, 'Statics', '----F--', 'Tut', '13:15:00.00', '14:55:00.00', 'ENGR242', 15),
(144, 'Statics', '----F--', 'Tut', '13:15:00.00', '14:55:00.00', 'ENGR242', 15),
(145, 'Statics', '---J---', 'Tut', '17:45:00.00', '19:25:00.00', 'ENGR242', 15),
(146, 'Statics', '--W----', 'Tut', '17:45:00.00', '19:25:00.00', 'ENGR242', 15),
(147, 'Statics', 'M------', 'Tut', '20:30:00.00', '22:10:00.00', 'ENGR242', 15),
(148, 'Statics', 'M------', 'Tut', '20:30:00.00', '22:10:00.00', 'ENGR242', 15),
(149, 'Statics', '--W-F--', 'Lec', '10:15:00.00', '11:30:00.00', 'ENGR242', 15),
(150, 'Statics', '-T-J---', 'Lec', '10:15:00.00', '11:30:00.00', 'ENGR242', 15),
(151, 'Statics', 'M------', 'Lec', '17:45:00.00', '20:15:00.00', 'ENGR242', 15),
(152, 'Statics', 'M------', 'Tut', '08:25:00.00', '10:05:00.00', 'ENGR242', 15),
(153, 'Statics', 'M------', 'Tut', '08:25:00.00', '10:05:00.00', 'ENGR242', 15),
(154, 'Statics', '-T-----', 'Tut', '20:30:00.00', '22:10:00.00', 'ENGR242', 15),
(155, 'Statics', '-T-----', 'Tut', '20:30:00.00', '22:10:00.00', 'ENGR242', 15),
(156, 'Statics', '-T-J---', 'Lec', '10:15:00.00', '11:30:00.00', 'ENGR242', 15),
(157, 'Statics', '-T-----', 'Lec', '17:45:00.00', '20:15:00.00', 'ENGR242', 15),
(158, 'Thermodynamics I', '--W----', 'Tut', '08:20:00.00', '10:10:00.00', 'ENGR251', 16),
(159, 'Thermodynamics I', '----F--', 'Tut', '08:20:00.00', '10:10:00.00', 'ENGR251', 16),
(160, 'Thermodynamics I', '----F--', 'Tut', '16:15:00.00', '17:55:00.00', 'ENGR251', 16),
(161, 'Thermodynamics I', '----F--', 'Tut', '16:15:00.00', '17:55:00.00', 'ENGR251', 16),
(162, 'Thermodynamics I', '----F--', 'Tut', '11:45:00.00', '13:25:00.00', 'ENGR251', 16),
(163, 'Thermodynamics I', '----F--', 'Tut', '16:15:00.00', '17:55:00.00', 'ENGR251', 16),
(164, 'Thermodynamics I', '----F--', 'Tut', '11:45:00.00', '13:25:00.00', 'ENGR251', 16),
(165, 'Thermodynamics I', '----F--', 'Tut', '11:45:00.00', '13:25:00.00', 'ENGR251', 16),
(166, 'Thermodynamics I', '-T-J---', 'Lec', '10:15:00.00', '11:30:00.00', 'ENGR251', 16),
(167, 'Thermodynamics I', 'M-W----', 'Lec', '16:15:00.00', '17:30:00.00', 'ENGR251', 16),
(168, 'Thermodynamics I', '-T-J---', 'Lec', '10:15:00.00', '11:30:00.00', 'ENGR251', 16),
(169, 'Thermodynamics I', 'M-W----', 'Lec', '16:15:00.00', '17:30:00.00', 'ENGR251', 16),
(170, 'Fluid Mechanics I', 'M------', 'Tut', '10:15:00.00', '11:05:00.00', 'ENGR361', 17),
(171, 'Fluid Mechanics I', '--W----', 'Tut', '10:15:00.00', '11:05:00.00', 'ENGR361', 17),
(172, 'Fluid Mechanics I', '----F--', 'Tut', '13:15:00.00', '14:05:00.00', 'ENGR361', 17),
(173, 'Fluid Mechanics I', '--W----', 'Tut', '13:15:00.00', '14:05:00.00', 'ENGR361', 17),
(174, 'Fluid Mechanics I', '----F--', 'Tut', '13:15:00.00', '14:05:00.00', 'ENGR361', 17),
(175, 'Fluid Mechanics I', '--W----', 'Tut', '13:15:00.00', '14:05:00.00', 'ENGR361', 17),
(176, 'Fluid Mechanics I', '-------', 'Lec', '00:00:00.00', '00:00:00.00', 'ENGR361', 17),
(177, 'Materials Science', 'M------', 'Tut', '15:15:00.00', '16:05:00.00', 'MECH221', 18),
(178, 'Materials Science', 'M------', 'Tut', '15:15:00.00', '16:05:00.00', 'MECH221', 18),
(179, 'Materials Science', '----F--', 'Tut', '15:15:00.00', '16:05:00.00', 'MECH221', 18),
(180, 'Materials Science', '----F--', 'Tut', '15:15:00.00', '16:05:00.00', 'MECH221', 18),
(181, 'Materials Science', '----F--', 'Tut', '15:15:00.00', '16:05:00.00', 'MECH221', 18),
(182, 'Materials Science', '----F--', 'Tut', '15:15:00.00', '16:05:00.00', 'MECH221', 18),
(183, 'Materials Science', '----F--', 'Tut', '15:15:00.00', '16:05:00.00', 'MECH221', 18),
(184, 'Materials Science', '-T-J---', 'Lec', '08:45:00.00', '10:00:00.00', 'MECH221', 18),
(185, 'Materials Science', '--W-F--', 'Lec', '10:15:00.00', '11:30:00.00', 'MECH221', 18),
(186, 'Materials Science', '--W-F--', 'Lec', '10:15:00.00', '11:30:00.00', 'MECH221', 18),
(187, 'Advanced Program Design with C++', '--W----', 'Lab', '20:30:00.00', '22:20:00.00', 'COMP345', 19),
(188, 'Advanced Program Design with C++', '--W----', 'Lab', '20:30:00.00', '22:20:00.00', 'COMP345', 19),
(189, 'Advanced Program Design with C++', '--W----', 'Lab', '17:45:00.00', '19:35:00.00', 'COMP345', 19),
(190, 'Advanced Program Design with C++', '--W----', 'Lab', '17:45:00.00', '19:35:00.00', 'COMP345', 19),
(191, 'Advanced Program Design with C++', '--W----', 'Lab', '17:45:00.00', '19:35:00.00', 'COMP345', 19),
(192, 'Advanced Program Design with C++', '-T-J---', 'Lec', '13:15:00.00', '14:30:00.00', 'COMP345', 19),
(193, 'Advanced Program Design with C++', 'M-W----', 'Lec', '16:15:00.00', '17:30:00.00', 'COMP345', 19),
(194, 'Computer Graphics', '--W----', 'Lab', '16:15:00.00', '18:05:00.00', 'COMP371', 20),
(195, 'Computer Graphics', 'M------', 'Lab', '16:15:00.00', '18:05:00.00', 'COMP371', 20),
(196, 'Computer Graphics', '-T-----', 'Lec', '17:45:00.00', '20:15:00.00', 'COMP371', 20),
(197, 'Introduction to Game Development', '-T-----', 'Lab', '15:45:00.00', '17:35:00.00', 'COMP376', 21),
(198, 'Introduction to Game Development', '-T-----', 'Lab', '20:30:00.00', '22:20:00.00', 'COMP376', 21),
(199, 'Introduction to Game Development', '---J---', 'Lab', '15:45:00.00', '17:35:00.00', 'COMP376', 21),
(200, 'Introduction to Game Development', '---J---', 'Lab', '20:30:00.00', '22:20:00.00', 'COMP376', 21),
(201, 'Introduction to Game Development', '-T-----', 'Lec', '17:45:00.00', '20:15:00.00', 'COMP376', 21),
(202, 'Introduction to Game Development', '---J---', 'Lec', '17:45:00.00', '20:15:00.00', 'COMP376', 21),
(203, 'Introduction to Artificial Intelligence', '-T-----', 'Lab', '16:15:00.00', '18:15:00.00', 'COMP472', 22),
(204, 'Introduction to Artificial Intelligence', '--W----', 'Lab', '16:15:00.00', '18:15:00.00', 'COMP472', 22),
(205, 'Introduction to Artificial Intelligence', '--W----', 'Lab', '18:30:00.00', '20:30:00.00', 'COMP472', 22),
(206, 'Introduction to Artificial Intelligence', 'M-W----', 'Lec', '11:45:00.00', '13:00:00.00', 'COMP472', 22),
(207, 'Animation for Computer Games', 'M------', 'Lab', '14:45:00.00', '16:35:00.00', 'COMP477', 23),
(208, 'Animation for Computer Games', '--W----', 'Lab', '14:45:00.00', '16:35:00.00', 'COMP477', 23),
(209, 'Animation for Computer Games', 'M-W----', 'Lec', '13:15:00.00', '14:30:00.00', 'COMP477', 23),
(210, 'Databases', '---J---', 'Tut', '12:15:00.00', '13:05:00.00', 'COMP353', 24),
(211, 'Databases', '---J---', 'Tut', '12:15:00.00', '13:05:00.00', 'COMP353', 24),
(212, 'Databases', '---J---', 'Lab', '14:45:00.00', '15:35:00.00', 'COMP353', 24),
(213, 'Databases', '----F--', 'Lab', '13:15:00.00', '15:05:00.00', 'COMP353', 24),
(214, 'Databases', '-T-J---', 'Lec', '13:15:00.00', '14:30:00.00', 'COMP353', 24),
(215, 'Data Communication and Computer Network', 'M------', 'Lab', '13:15:00.00', '15:05:00.00', 'COMP445', 25),
(216, 'Data Communication and Computer Network', 'M------', 'Lab', '17:45:00.00', '19:35:00.00', 'COMP445', 25),
(217, 'Data Communication and Computer Network', 'M------', 'Lab', '13:15:00.00', '15:05:00.00', 'COMP445', 25),
(218, 'Data Communication and Computer Network', 'M------', 'Lab', '17:45:00.00', '19:35:00.00', 'COMP445', 25),
(219, 'Data Communication and Computer Network', 'M-W----', 'Lec', '10:15:00.00', '11:30:00.00', 'COMP445', 25),
(220, 'Info. Retrieval & Web Search', '---J---', 'Lab', '14:45:00.00', '16:35:00.00', 'COMP479', 26),
(221, 'Info. Retrieval & Web Search', '--W----', 'Lab', '14:45:00.00', '16:35:00.00', 'COMP479', 26),
(222, 'Info. Retrieval & Web Search', '-T-----', 'Lab', '14:45:00.00', '16:35:00.00', 'COMP479', 26),
(223, 'Info. Retrieval & Web Search', '-T-J---', 'Lec', '13:15:00.00', '14:30:00.00', 'COMP479', 26),
(224, 'Web-Based Enter. App. Design', '----F--', 'Tut', '11:45:00.00', '12:35:00.00', 'SOEN387', 27),
(225, 'Web-Based Enter. App. Design', '----F--', 'Tut', '11:45:00.00', '12:35:00.00', 'SOEN387', 27),
(226, 'Web-Based Enter. App. Design', 'M-W----', 'Lec', '11:45:00.00', '13:00:00.00', 'SOEN387', 27),
(227, 'FLIGHT CONTROL SYSTEMS', 'M------', 'Lab', '11:45:00.00', '13:35:00.00', 'AERO480', 28),
(228, 'FLIGHT CONTROL SYSTEMS', 'M------', 'Lab', '11:45:00.00', '13:35:00.00', 'AERO480', 28),
(229, 'FLIGHT CONTROL SYSTEMS', '--W----', 'Lab', '12:05:00.00', '13:55:00.00', 'AERO480', 28),
(230, 'FLIGHT CONTROL SYSTEMS', '--W----', 'Lab', '12:05:00.00', '13:55:00.00', 'AERO480', 28),
(231, 'FLIGHT CONTROL SYSTEMS', '--W----', 'Lab', '09:45:00.00', '11:35:00.00', 'AERO480', 28),
(232, 'FLIGHT CONTROL SYSTEMS', '--W----', 'Lab', '09:45:00.00', '11:35:00.00', 'AERO480', 28),
(233, 'FLIGHT CONTROL SYSTEMS', '--W----', 'Lab', '14:45:00.00', '16:35:00.00', 'AERO480', 28),
(234, 'FLIGHT CONTROL SYSTEMS', '---J---', 'Lec', '17:45:00.00', '20:15:00.00', 'AERO480', 28),
(235, 'AVIONIC NAVIGATION SYSTEMS', 'M------', 'Lec', '14:45:00.00', '17:45:00.00', 'AERO482', 29),
(236, 'Intro to Real-time Systems', '--W----', 'Tut', '14:45:00.00', '15:35:00.00', 'COEN320', 30),
(237, 'Intro to Real-time Systems', 'M-W----', 'Lec', '16:15:00.00', '17:30:00.00', 'COEN320', 30),
(238, 'Embedded Systems/Software', '--W----', 'Lab', '21:10:00.00', '23:00:00.00', 'SOEN422', 31),
(239, 'Embedded Systems/Software', '---J---', 'Lab', '14:45:00.00', '16:35:00.00', 'SOEN422', 31),
(240, 'Embedded Systems/Software', '--W----', 'Tut', '20:20:00.00', '21:05:00.00', 'SOEN422', 31),
(241, 'Embedded Systems/Software', '--W----', 'Lec', '17:45:00.00', '20:15:00.00', 'SOEN422', 31),
(242, 'Distributed Systems', '-T-----', 'Tut', '14:45:00.00', '15:35:00.00', 'SOEN423', 32),
(243, 'Distributed Systems', '-T-----', 'Lab', '15:45:00.00', '17:30:00.00', 'SOEN423', 32),
(244, 'Distributed Systems', '-T-J---', 'Lec', '13:15:00.00', '14:30:00.00', 'SOEN423', 32),
(245, 'Multicore Programming', '-T-----', 'Lab', '20:30:00.00', '22:10:00.00', 'COMP426', 33),
(246, 'Multicore Programming', '-T-----', 'Lab', '20:30:00.00', '22:10:00.00', 'COMP426', 33),
(247, 'Multicore Programming', '-T-----', 'Lec', '17:45:00.00', '20:15:00.00', 'COMP426', 33),
(248, 'Parallel Programming', '---J---', 'Tut', '20:30:00.00', '21:20:00.00', 'COMP428', 34),
(249, 'Parallel Programming', '---J---', 'Tut', '20:30:00.00', '21:20:00.00', 'COMP428', 34),
(250, 'Parallel Programming', '---J---', 'Lab', '15:30:00.00', '17:20:00.00', 'COMP428', 34),
(251, 'Parallel Programming', '----F--', 'Lab', '15:30:00.00', '17:20:00.00', 'COMP428', 34),
(252, 'Parallel Programming', '---J---', 'Lec', '17:45:00.00', '20:15:00.00', 'COMP428', 34),
(253, 'Design and Analysis of Algorithms', '---J---', 'Tut', '13:15:00.00', '14:05:00.00', 'COMP465', 35),
(254, 'Design and Analysis of Algorithms', '-T-J---', 'Lec', '16:15:00.00', '17:30:00.00', 'COMP465', 35),
(255, 'Pattern Recognition', '---J---', 'Lab', '20:30:00.00', '22:20:00.00', 'COMP473', 36),
(256, 'Pattern Recognition', '---J---', 'Lab', '20:30:00.00', '22:20:00.00', 'COMP473', 36),
(257, 'Pattern Recognition', '---J---', 'Lab', '20:30:00.00', '22:20:00.00', 'COMP473', 36),
(258, 'Pattern Recognition', '---J---', 'Lec', '17:45:00.00', '20:15:00.00', 'COMP473', 36),
(259, 'Image Processing', '--W----', 'Lab', '20:30:00.00', '22:30:00.00', 'COMP478', 37),
(260, 'Image Processing', 'M------', 'Lab', '20:30:00.00', '22:30:00.00', 'COMP478', 37),
(261, 'Image Processing', 'M------', 'Lec', '17:45:00.00', '20:15:00.00', 'COMP478', 37),
(262, 'SOFTWARE ENGINEERING PROJECT', '-------', 'Lec', '00:00:00.00', '00:00:00.00', 'SOEN491', 38),
(263, 'System Hardware', '-T-----', 'Tut', '20:30:00.00', '22:10:00.00', 'SOEN228', 40),
(264, 'System Hardware', '-T-----', 'Lab', '10:00:00.00', '12:00:00.00', 'SOEN228', 40),
(265, 'System Hardware', 'M------', 'Lab', '10:00:00.00', '12:00:00.00', 'SOEN228', 40),
(266, 'System Hardware', '--W----', 'Lab', '10:00:00.00', '12:00:00.00', 'SOEN228', 40),
(267, 'System Hardware', '--W----', 'Lab', '18:00:00.00', '20:00:00.00', 'SOEN228', 40),
(268, 'System Hardware', '--W----', 'Tut', '16:15:00.00', '17:55:00.00', 'SOEN228', 40),
(269, 'Introduction to Formal Methods for Soft', '----F--', 'Tut', '14:15:00.00', '16:05:00.00', 'SOEN331', 41),
(270, 'Introduction to Formal Methods for Soft', '----F--', 'Tut', '12:15:00.00', '14:05:00.00', 'SOEN331', 41),
(271, 'Introduction to Formal Methods for Soft', '-T-J---', 'Lec', '16:15:00.00', '17:30:00.00', 'SOEN331', 41),
(272, 'Software Architecture and Design II', '---J---', 'Tut', '14:15:00.00', '15:35:00.00', 'SOEN344', 42),
(273, 'Software Architecture and Design II', '-T-J---', 'Lec', '13:15:00.00', '14:30:00.00', 'SOEN344', 42),
(274, 'Software Testing, Verification and Qual', '--W----', 'Tut', '16:15:00.00', '17:05:00.00', 'SOEN345', 43),
(275, 'Software Testing, Verification and Qual', '--W----', 'Tut', '17:45:00.00', '18:35:00.00', 'SOEN345', 43),
(276, 'Software Testing, Verification and Qual', 'M-W----', 'Lec', '14:45:00.00', '16:00:00.00', 'SOEN345', 43),
(277, 'Software Testing, Verification and Qual', '----F--', 'Tut', '11:45:00.00', '12:35:00.00', 'SOEN357', 44),
(278, 'Software Testing, Verification and Qual', '--W-F--', 'Lec', '10:15:00.00', '11:30:00.00', 'SOEN357', 44),
(279, 'Software Testing, Verification and Qual', '-T-----', 'Tut', '10:45:00.00', '11:35:00.00', 'SOEN385', 45),
(280, 'Software Testing, Verification and Qual', '---J---', 'Tut', '10:45:00.00', '11:35:00.00', 'SOEN385', 45),
(281, 'Software Testing, Verification and Qual', 'M------', 'Tut', '10:45:00.00', '11:35:00.00', 'SOEN385', 45),
(282, 'Software Testing, Verification and Qual', '-T-J---', 'Lec', '11:45:00.00', '13:00:00.00', 'SOEN385', 45),
(283, 'Software Engineering Team Design Projec', '---J---', 'Lab', '15:45:00.00', '18:25:00.00', 'SOEN390', 46),
(284, 'Software Engineering Team Design Projec', '-T-----', 'Lab', '15:45:00.00', '18:25:00.00', 'SOEN390', 46),
(285, 'Software Engineering Team Design Projec', 'M------', 'Tut', '18:15:00.00', '19:05:00.00', 'SOEN390', 46),
(286, 'Software Engineering Team Design Projec', 'M------', 'Lec', '16:15:00.00', '17:55:00.00', 'SOEN390', 46),
(287, 'Technical Writing and Communication', 'M------', 'Tut', '16:15:00.00', '17:55:00.00', 'ENCS282', 47),
(288, 'Technical Writing and Communication', '---J---', 'Tut', '16:15:00.00', '17:55:00.00', 'ENCS282', 47),
(289, 'Technical Writing and Communication', '----F--', 'Tut', '16:15:00.00', '17:55:00.00', 'ENCS282', 47),
(290, 'Technical Writing and Communication', '-T-----', 'Tut', '20:30:00.00', '22:10:00.00', 'ENCS282', 47),
(291, 'Technical Writing and Communication', '-T-----', 'Lec', '17:45:00.00', '20:15:00.00', 'ENCS282', 47);

-- --------------------------------------------------------

--
-- Table structure for table `courselist`
--

CREATE TABLE `courselist` (
  `id` int(11) NOT NULL,
  `code` varchar(39) NOT NULL,
  `credits` double NOT NULL,
  `name` varchar(39) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `courselist`
--

INSERT INTO `courselist` (`id`, `code`, `credits`, `name`) VALUES
(1, 'SOEN287', 3, 'Web Programming'),
(2, 'SOEN321', 3, 'Information Systems Security'),
(3, 'SOEN341', 3, 'Software Process'),
(4, 'SOEN342', 3, 'Software Requirements and Specification'),
(5, 'SOEN343', 3, 'Software Architecture and Design'),
(6, 'SOEN384', 3, 'Management, Measurement and Quality Con'),
(7, 'SOEN490', 3, 'Capstone Software Engineering Design Pr'),
(8, 'COMP232', 3, 'Math for Computer Science'),
(9, 'COMP248', 3.5, 'Object-Oriented Programming I'),
(10, 'COMP249', 3.5, 'Object-Oriented Programming II'),
(11, 'COMP335', 3, 'Introduction to Theoretical Computer Sc'),
(12, 'COMP346', 4, 'Operating Systems'),
(13, 'COMP348', 3, 'Principles of Programming Languages'),
(14, 'COMP352', 3, 'Data Structures and Algorithms'),
(15, 'ENGR242', 3, 'Statics'),
(16, 'ENGR251', 3, 'Thermodynamics I'),
(17, 'ENGR361', 3, 'Fluid Mechanics I'),
(18, 'MECH221', 3, 'Materials Science'),
(19, 'COMP345', 4, 'Advanced Program Design with C++'),
(20, 'COMP371', 4, 'Computer Graphics'),
(21, 'COMP376', 3, 'Introduction to Game Development'),
(22, 'COMP472', 4, 'Introduction to Artificial Intelligence'),
(23, 'COMP477', 4, 'Animation for Computer Games'),
(24, 'COMP353', 4, 'Databases'),
(25, 'COMP445', 4, 'Data Communication and Computer Network'),
(26, 'COMP479', 4, 'Info. Retrieval & Web Search'),
(27, 'SOEN387', 3, 'Web-Based Enter. App. Design'),
(28, 'AERO480', 3.5, 'FLIGHT CONTROL SYSTEMS'),
(29, 'AERO482', 3, 'AVIONIC NAVIGATION SYSTEMS'),
(30, 'COEN320', 3, 'Intro to Real-time Systems'),
(31, 'SOEN422', 4, 'Embedded Systems/Software'),
(32, 'SOEN423', 4, 'Distributed Systems'),
(33, 'COMP426', 4, 'Multicore Programming'),
(34, 'COMP428', 4, 'Parallel Programming'),
(35, 'COMP465', 3, 'Design and Analysis of Algorithms'),
(36, 'COMP473', 4, 'Pattern Recognition'),
(37, 'COMP478', 4, 'Image Processing'),
(38, 'SOEN491', 1, 'SOFTWARE ENGINEERING PROJECT'),
(39, 'ENGR411', 1, 'Project Technical Report'),
(40, 'SOEN228', 4, 'System Hardware'),
(41, 'SOEN331', 3, 'Introduction to Formal Methods for Soft'),
(42, 'SOEN344', 3, 'Software Architecture and Design II'),
(43, 'SOEN345', 3, 'Software Testing, Verification and Qual'),
(44, 'SOEN357', 3, 'User Interface Design'),
(45, 'SOEN385', 3, 'Control Systems and Applications'),
(46, 'SOEN390', 3.5, 'Software Engineering Team Design Projec'),
(47, 'ENCS282', 3, 'Technical Writing and Communication'),
(100, 'SPECIAL', 1, 'PERMISION TO TAKE PROJECT');

-- --------------------------------------------------------

--
-- Table structure for table `courserequisites`
--

CREATE TABLE `courserequisites` (
  `courseID` int(11) NOT NULL,
  `reqID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `courserequisites`
--

INSERT INTO `courserequisites` (`courseID`, `reqID`) VALUES
(1, 9),
(2, 12),
(3, 14),
(4, 3),
(5, 3),
(5, 4),
(6, 47),
(6, 3),
(7, 46),
(10, 9),
(11, 8),
(12, 40),
(12, 14),
(13, 10),
(14, 8),
(14, 10),
(17, 16),
(19, 14),
(20, 8),
(20, 14),
(21, 20),
(22, 14),
(23, 20),
(24, 8),
(24, 14),
(25, 12),
(26, 14),
(27, 24),
(27, 3),
(27, 1),
(28, 45),
(29, 45),
(30, 12),
(31, 12),
(32, 12),
(33, 12),
(34, 12),
(35, 8),
(35, 14),
(36, 14),
(37, 14),
(38, 100),
(39, 47),
(41, 8),
(41, 10),
(42, 5),
(43, 5),
(44, 4),
(46, 44),
(46, 42);

-- --------------------------------------------------------

--
-- Table structure for table `preferences`
--

CREATE TABLE `preferences` (
  `studentID` int(11) NOT NULL,
  `day` varchar(39) NOT NULL,
  `start` time(2) NOT NULL,
  `end` time(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `preferences`
--

INSERT INTO `preferences` (`studentID`, `day`, `start`, `end`) VALUES
(2, '', '00:00:00.00', '00:00:00.00'),
(1, '', '00:00:00.00', '00:00:00.00');

-- --------------------------------------------------------

--
-- Table structure for table `schedule`
--

CREATE TABLE `schedule` (
  `studentID` int(11) NOT NULL,
  `day` varchar(255) NOT NULL,
  `courseName` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `start` time(2) NOT NULL,
  `end` time(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schedule`
--

INSERT INTO `schedule` (`studentID`, `day`, `courseName`, `type`, `start`, `end`) VALUES
(2, '--W----', 8, 'Lec', '17:45:00.00', '20:15:00.00'),
(2, '--W----', 8, 'Tut', '20:30:00.00', '22:10:00.00'),
(2, '---J---', 9, 'Lec', '17:45:00.00', '20:15:00.00'),
(2, '-T-----', 9, 'Tut', '11:45:00.00', '13:25:00.00'),
(2, 'M------', 9, 'Lab', '19:45:00.00', '20:45:00.00'),
(2, '--W-F--', 15, 'Lec', '10:15:00.00', '11:30:00.00'),
(2, '----F--', 15, 'Tut', '13:15:00.00', '14:55:00.00'),
(2, '-T-J---', 16, 'Lec', '10:15:00.00', '11:30:00.00'),
(2, '--W----', 16, 'Tut', '08:20:00.00', '10:10:00.00'),
(2, '-T-J---', 18, 'Lec', '08:45:00.00', '10:00:00.00'),
(2, 'M------', 18, 'Tut', '15:15:00.00', '16:05:00.00'),
(1, '-T-J---', 1, 'Lec', '10:15:00.00', '11:30:00.00'),
(1, '-T-----', 1, 'Tut', '11:45:00.00', '13:25:00.00'),
(1, '--W-F--', 4, 'Lec', '11:45:00.00', '13:00:00.00'),
(1, '----F--', 4, 'Tut', '15:45:00.00', '16:35:00.00'),
(1, '--W-F--', 5, 'Lec', '13:15:00.00', '14:30:00.00'),
(1, '----F--', 5, 'Tut', '14:45:00.00', '15:35:00.00'),
(1, '--W-F--', 6, 'Lec', '10:15:00.00', '11:30:00.00'),
(1, '----F--', 6, 'Tut', '09:15:00.00', '10:05:00.00'),
(1, '--W----', 8, 'Lec', '17:45:00.00', '20:15:00.00'),
(1, '--W----', 8, 'Tut', '20:30:00.00', '22:10:00.00');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `name` varchar(39) NOT NULL,
  `email` varchar(39) NOT NULL,
  `password` varchar(39) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `name`, `email`, `password`) VALUES
(1, 'Mike Basdeo', 'test@test.com', 'basdeoPassword'),
(2, 'Michael Scalera', 'mike@test.com', 'scaleraPassword');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `courseinfo`
--
ALTER TABLE `courseinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courselist`
--
ALTER TABLE `courselist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
