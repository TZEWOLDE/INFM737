-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2021 at 02:48 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kpi`
--

-- --------------------------------------------------------

--
-- Table structure for table `dataset`
--

CREATE TABLE `dataset` (
  `dataset_ID` int(11) NOT NULL,
  `dataset_Name` varchar(45) DEFAULT NULL,
  `dataset_owner_ID` int(11) DEFAULT NULL,
  `dataset_steward_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dataset`
--

INSERT INTO `dataset` (`dataset_ID`, `dataset_Name`, `dataset_owner_ID`, `dataset_steward_ID`) VALUES
(2, 'Iris dataset', 1, 1),
(3, 'Car dataset', 2, 2),
(4, 'Faces dataset', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `dataset_owner`
--

CREATE TABLE `dataset_owner` (
  `dataset_owner_ID` int(11) NOT NULL,
  `dataset_owner_name` varchar(45) DEFAULT NULL,
  `dataset_owner_email` varchar(45) DEFAULT NULL,
  `dataset_owner_phone` varchar(45) DEFAULT NULL,
  `dataset_steward_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dataset_owner`
--

INSERT INTO `dataset_owner` (`dataset_owner_ID`, `dataset_owner_name`, `dataset_owner_email`, `dataset_owner_phone`, `dataset_steward_ID`) VALUES
(1, 'Brice John', 'bj@gmail.com', '+1022883277', 1),
(2, 'Tron Meghan', 'tm@gmail.com', '+1928443884', 2),
(3, 'Steve Nice', 'sn@gmail.com', '+172349828482', 3);

-- --------------------------------------------------------

--
-- Table structure for table `dataset_steward`
--

CREATE TABLE `dataset_steward` (
  `dataset_steward_ID` int(11) NOT NULL,
  `dataset_steward_name` varchar(45) DEFAULT NULL,
  `dataset_owner_name` varchar(45) DEFAULT NULL,
  `dept_ID` int(11) DEFAULT NULL,
  `dataset_steward_email` varchar(45) DEFAULT NULL,
  `dataset_steward_phone` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dataset_steward`
--

INSERT INTO `dataset_steward` (`dataset_steward_ID`, `dataset_steward_name`, `dataset_owner_name`, `dept_ID`, `dataset_steward_email`, `dataset_steward_phone`) VALUES
(1, 'Steve Bruce', 'Brice John', 1, 'sb@gmail.com', '+1927377466'),
(2, 'Mike Posner', 'Tron Meghan', 1, 'mk@gmail.com', '+18420004239'),
(3, 'Garry Barry', 'Steve Nice', 1, 'gb@gmail.com', '+1666568836');

-- --------------------------------------------------------

--
-- Table structure for table `kpi`
--

CREATE TABLE `kpi` (
  `kpi_ID` int(11) NOT NULL,
  `kpi_name` varchar(45) DEFAULT NULL,
  `kpi_owner_ID` int(11) DEFAULT NULL,
  `kpi_description` varchar(45) DEFAULT NULL,
  `dataset_ID` int(11) DEFAULT NULL,
  `permission_status` varchar(45) DEFAULT NULL,
  `strat_priority_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kpi`
--

INSERT INTO `kpi` (`kpi_ID`, `kpi_name`, `kpi_owner_ID`, `kpi_description`, `dataset_ID`, `permission_status`, `strat_priority_ID`) VALUES
(2, 'First KPI', 1, 'This is the first KPI description', 2, 'active', 1),
(3, 'Second KPI', 1, 'This is the second KPI description', 3, 'inactive', 2),
(4, 'Third KPI', 1, 'This is the third KPI description', 4, 'active', 3);

-- --------------------------------------------------------

--
-- Table structure for table `kpi_owner`
--

CREATE TABLE `kpi_owner` (
  `kpi_owner_ID` int(11) NOT NULL,
  `kpi_owner_name` varchar(45) NOT NULL,
  `kpi_owner_email` varchar(45) NOT NULL,
  `kpi_owner_phone` varchar(45) NOT NULL,
  `Dept_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kpi_owner`
--

INSERT INTO `kpi_owner` (`kpi_owner_ID`, `kpi_owner_name`, `kpi_owner_email`, `kpi_owner_phone`, `Dept_ID`) VALUES
(1, 'John Stewart', 'jstwt@gmail.com', '+15646646664', 1),
(2, 'Legend Bowie', 'lb@gmail.com', '+1628848884', 1),
(3, 'Brown Kepper', 'bk@gmail.com', '+12939948885', 1);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `permission_ID` int(11) NOT NULL,
  `permission_status` varchar(45) DEFAULT NULL,
  `dataset_ID` int(11) DEFAULT NULL,
  `dataset_owner_ID` int(11) DEFAULT NULL,
  `dataset_steward_ID` int(11) DEFAULT NULL,
  `date_granted` datetime DEFAULT NULL,
  `date_expires` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`permission_ID`, `permission_status`, `dataset_ID`, `dataset_owner_ID`, `dataset_steward_ID`, `date_granted`, `date_expires`) VALUES
(1, 'active', 2, 1, 1, '2021-11-18 00:00:00', '2022-11-18 00:00:00'),
(2, 'inactive', 3, 2, 2, '2021-11-18 00:00:00', '2022-11-18 00:00:00'),
(3, 'pending', 4, 3, 3, '2021-11-18 00:00:00', '2022-11-18 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `strategic_priority`
--

CREATE TABLE `strategic_priority` (
  `strat_priority_ID` int(11) NOT NULL,
  `strat_priority_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `strategic_priority`
--

INSERT INTO `strategic_priority` (`strat_priority_ID`, `strat_priority_name`) VALUES
(1, 'Urgent'),
(2, 'Long'),
(3, 'Medium');

-- --------------------------------------------------------

--
-- Table structure for table `user_`
--

CREATE TABLE `user_` (
  `user_ID` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `permission_ID` int(11) DEFAULT NULL,
  `user_phone` varchar(45) DEFAULT NULL,
  `user_email` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_`
--

INSERT INTO `user_` (`user_ID`, `username`, `permission_ID`, `user_phone`, `user_email`) VALUES
(1, 'JackMe', 1, '+1902837374', 'jm@gmail.com'),
(2, 'Sparrow25', 2, '+165634884894', 'sp@gmail.com'),
(3, 'GarryS', 3, '+14556887874', 'gs@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dataset`
--
ALTER TABLE `dataset`
  ADD PRIMARY KEY (`dataset_ID`),
  ADD KEY `dataset_owner_ID` (`dataset_owner_ID`),
  ADD KEY `dataset_steward_ID` (`dataset_steward_ID`);

--
-- Indexes for table `dataset_owner`
--
ALTER TABLE `dataset_owner`
  ADD PRIMARY KEY (`dataset_owner_ID`),
  ADD KEY `dataset_steward_ID` (`dataset_steward_ID`);

--
-- Indexes for table `dataset_steward`
--
ALTER TABLE `dataset_steward`
  ADD PRIMARY KEY (`dataset_steward_ID`);

--
-- Indexes for table `kpi`
--
ALTER TABLE `kpi`
  ADD PRIMARY KEY (`kpi_ID`),
  ADD KEY `kpi_owner_ID` (`kpi_owner_ID`),
  ADD KEY `dataset_ID` (`dataset_ID`),
  ADD KEY `strat_priority_ID` (`strat_priority_ID`);

--
-- Indexes for table `kpi_owner`
--
ALTER TABLE `kpi_owner`
  ADD PRIMARY KEY (`kpi_owner_ID`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`permission_ID`),
  ADD KEY `dataset_owner_ID` (`dataset_owner_ID`),
  ADD KEY `dataset_steward_ID` (`dataset_steward_ID`);

--
-- Indexes for table `strategic_priority`
--
ALTER TABLE `strategic_priority`
  ADD PRIMARY KEY (`strat_priority_ID`);

--
-- Indexes for table `user_`
--
ALTER TABLE `user_`
  ADD PRIMARY KEY (`user_ID`),
  ADD KEY `permission_ID` (`permission_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dataset`
--
ALTER TABLE `dataset`
  MODIFY `dataset_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dataset_owner`
--
ALTER TABLE `dataset_owner`
  MODIFY `dataset_owner_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dataset_steward`
--
ALTER TABLE `dataset_steward`
  MODIFY `dataset_steward_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kpi`
--
ALTER TABLE `kpi`
  MODIFY `kpi_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kpi_owner`
--
ALTER TABLE `kpi_owner`
  MODIFY `kpi_owner_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `permission_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `strategic_priority`
--
ALTER TABLE `strategic_priority`
  MODIFY `strat_priority_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_`
--
ALTER TABLE `user_`
  MODIFY `user_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dataset`
--
ALTER TABLE `dataset`
  ADD CONSTRAINT `dataset_ibfk_1` FOREIGN KEY (`dataset_owner_ID`) REFERENCES `dataset_owner` (`dataset_owner_ID`),
  ADD CONSTRAINT `dataset_ibfk_2` FOREIGN KEY (`dataset_steward_ID`) REFERENCES `dataset_steward` (`dataset_steward_ID`);

--
-- Constraints for table `dataset_owner`
--
ALTER TABLE `dataset_owner`
  ADD CONSTRAINT `dataset_owner_ibfk_1` FOREIGN KEY (`dataset_steward_ID`) REFERENCES `dataset_steward` (`dataset_steward_ID`);

--
-- Constraints for table `kpi`
--
ALTER TABLE `kpi`
  ADD CONSTRAINT `kpi_ibfk_1` FOREIGN KEY (`kpi_owner_ID`) REFERENCES `kpi_owner` (`kpi_owner_ID`),
  ADD CONSTRAINT `kpi_ibfk_2` FOREIGN KEY (`dataset_ID`) REFERENCES `dataset` (`dataset_ID`),
  ADD CONSTRAINT `kpi_ibfk_3` FOREIGN KEY (`strat_priority_ID`) REFERENCES `strategic_priority` (`strat_priority_ID`);

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `permissions_ibfk_1` FOREIGN KEY (`dataset_owner_ID`) REFERENCES `dataset_owner` (`dataset_owner_ID`),
  ADD CONSTRAINT `permissions_ibfk_2` FOREIGN KEY (`dataset_steward_ID`) REFERENCES `dataset_steward` (`dataset_steward_ID`);

--
-- Constraints for table `user_`
--
ALTER TABLE `user_`
  ADD CONSTRAINT `user__ibfk_1` FOREIGN KEY (`permission_ID`) REFERENCES `permissions` (`permission_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
