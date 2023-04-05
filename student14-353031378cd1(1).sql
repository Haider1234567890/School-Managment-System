-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: sdb-58.hosting.stackcp.net
-- Generation Time: Apr 05, 2023 at 11:59 AM
-- Server version: 10.4.28-MariaDB-log
-- PHP Version: 7.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student14-353031378cd1`
--

-- --------------------------------------------------------

--
-- Table structure for table `Classes`
--

CREATE TABLE `Classes` (
  `ClassesID` int(50) NOT NULL,
  `Year_Group` int(50) NOT NULL,
  `ClassName` varchar(50) NOT NULL,
  `Capacity` varchar(50) NOT NULL,
  `TeacherID` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Enroll`
--

CREATE TABLE `Enroll` (
  `StudentID` int(50) NOT NULL,
  `ClassesID` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Parents`
--

CREATE TABLE `Parents` (
  `ParentID` int(50) NOT NULL,
  `ParentName` varchar(250) NOT NULL,
  `Par_Address` varchar(250) NOT NULL,
  `Email` varchar(250) NOT NULL,
  `Telephone` int(250) NOT NULL,
  `StudentID` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Student`
--

CREATE TABLE `Student` (
  `StudentID` int(50) NOT NULL,
  `StudentName` varchar(250) NOT NULL,
  `Stud_Address` varchar(250) NOT NULL,
  `Medical_Info` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Teacher`
--

CREATE TABLE `Teacher` (
  `TeacherID` int(50) NOT NULL,
  `TeacherName` varchar(250) NOT NULL,
  `Teach_Address` varchar(250) NOT NULL,
  `Teach_MedInfo` varchar(250) NOT NULL,
  `Teach_Phone` int(250) NOT NULL,
  `Salary` varchar(250) NOT NULL,
  `Backround` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `Teacher`
--

INSERT INTO `Teacher` (`TeacherID`, `TeacherName`, `Teach_Address`, `Teach_MedInfo`, `Teach_Phone`, `Salary`, `Backround`) VALUES
(1, 'tw', 'fef', 'fef', 563, 'fwe', 'qrq');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Classes`
--
ALTER TABLE `Classes`
  ADD PRIMARY KEY (`ClassesID`),
  ADD KEY `TeacherID` (`TeacherID`);

--
-- Indexes for table `Enroll`
--
ALTER TABLE `Enroll`
  ADD KEY `StudentID` (`StudentID`),
  ADD KEY `ClassesID` (`ClassesID`);

--
-- Indexes for table `Parents`
--
ALTER TABLE `Parents`
  ADD PRIMARY KEY (`ParentID`),
  ADD KEY `StudentID` (`StudentID`);

--
-- Indexes for table `Student`
--
ALTER TABLE `Student`
  ADD PRIMARY KEY (`StudentID`);

--
-- Indexes for table `Teacher`
--
ALTER TABLE `Teacher`
  ADD PRIMARY KEY (`TeacherID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Classes`
--
ALTER TABLE `Classes`
  MODIFY `ClassesID` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Parents`
--
ALTER TABLE `Parents`
  MODIFY `ParentID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Student`
--
ALTER TABLE `Student`
  MODIFY `StudentID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `Teacher`
--
ALTER TABLE `Teacher`
  MODIFY `TeacherID` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Classes`
--
ALTER TABLE `Classes`
  ADD CONSTRAINT `Classes_ibfk_1` FOREIGN KEY (`TeacherID`) REFERENCES `Teacher` (`TeacherID`);

--
-- Constraints for table `Enroll`
--
ALTER TABLE `Enroll`
  ADD CONSTRAINT `Enroll_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`),
  ADD CONSTRAINT `Enroll_ibfk_2` FOREIGN KEY (`ClassesID`) REFERENCES `Classes` (`ClassesID`);

--
-- Constraints for table `Parents`
--
ALTER TABLE `Parents`
  ADD CONSTRAINT `Parents_ibfk_1` FOREIGN KEY (`StudentID`) REFERENCES `Student` (`StudentID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
