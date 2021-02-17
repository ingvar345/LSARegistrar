-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 17, 2021 at 03:57 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lsa_system`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`ing`@`%` PROCEDURE `insert_student` (`idnumber` VARCHAR(45), `lastname` VARCHAR(45), `firstname` VARCHAR(45), `middlename` VARCHAR(45), `suffix` VARCHAR(45), `barangay` VARCHAR(45), `city` VARCHAR(45), `province` VARCHAR(45), `birthdate` DATE, `birthplace` VARCHAR(45), `citizenship` VARCHAR(45), `sex` VARCHAR(45), `contactnumber` VARCHAR(45), `religion` VARCHAR(45), `emailaddress` VARCHAR(45), `paymentplan` VARCHAR(45))  BEGIN
INSERT INTO `lsa_system`.`tbl_student`
(`id_number`,
`first_name`,
`middle_name`,
`last_name`,
`suffix`,
`barangay`,
`city`,
`province`,
`citizenship`,
`sex`,
`contact_number`,
`email_address`,
`payment_plan`
)
VALUES
(
idnumber,
firstname,
middlename,
lastname,
suffix,
barangay,
city,
province,
citizenship,
sex,
contact_number,
emailaddress,
paymentplan
);


END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_accounts`
--

CREATE TABLE `tbl_accounts` (
  `accounts_id` int(11) NOT NULL,
  `id_number` varchar(45) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) NOT NULL,
  `suffix` varchar(45) DEFAULT NULL,
  `password` varbinary(225) NOT NULL,
  `account_type` varchar(45) NOT NULL,
  `department` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_educational_background`
--

CREATE TABLE `tbl_educational_background` (
  `educational_backgruond_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `school_last_attended` varchar(45) NOT NULL,
  `school_year` varchar(45) DEFAULT NULL,
  `address` varchar(45) NOT NULL,
  `honors_obtained` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_parent`
--

CREATE TABLE `tbl_parent` (
  `parent_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `relationship` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) NOT NULL,
  `occupation` varchar(45) NOT NULL,
  `business_address` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_religious_background`
--

CREATE TABLE `tbl_religious_background` (
  `religious_background_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `religion` varchar(45) NOT NULL,
  `parish` varchar(45) NOT NULL,
  `baptized` varchar(45) NOT NULL,
  `confirmed` varchar(45) NOT NULL,
  `received_first_communion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sibling`
--

CREATE TABLE `tbl_sibling` (
  `sibling_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) NOT NULL,
  `suffix` varchar(45) NOT NULL,
  `school` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_student`
--

CREATE TABLE `tbl_student` (
  `student_id` int(11) NOT NULL,
  `id_number` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) NOT NULL,
  `suffix` varchar(45) DEFAULT NULL,
  `barangay` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `province` varchar(45) NOT NULL,
  `citizenship` varchar(45) NOT NULL,
  `sex` varchar(45) NOT NULL,
  `contact_number` varchar(45) NOT NULL,
  `email_address` varchar(45) NOT NULL,
  `birthdate` date NOT NULL,
  `birthplace` varchar(45) NOT NULL,
  `payment_plan` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_accounts`
--
ALTER TABLE `tbl_accounts`
  ADD PRIMARY KEY (`accounts_id`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `tbl_educational_background`
--
ALTER TABLE `tbl_educational_background`
  ADD PRIMARY KEY (`educational_backgruond_id`),
  ADD KEY `fk_tbl_educational_background_tbl_student1_idx` (`student_id`);

--
-- Indexes for table `tbl_parent`
--
ALTER TABLE `tbl_parent`
  ADD PRIMARY KEY (`parent_id`),
  ADD KEY `fk_tbl_parent_tbl_student_idx` (`student_id`);

--
-- Indexes for table `tbl_religious_background`
--
ALTER TABLE `tbl_religious_background`
  ADD PRIMARY KEY (`religious_background_id`),
  ADD KEY `fk_tbl_religious_background_tbl_student1_idx` (`student_id`);

--
-- Indexes for table `tbl_sibling`
--
ALTER TABLE `tbl_sibling`
  ADD PRIMARY KEY (`sibling_id`),
  ADD KEY `fk_tbl_sibling_tbl_student1_idx` (`student_id`);

--
-- Indexes for table `tbl_student`
--
ALTER TABLE `tbl_student`
  ADD PRIMARY KEY (`student_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_accounts`
--
ALTER TABLE `tbl_accounts`
  MODIFY `accounts_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_educational_background`
--
ALTER TABLE `tbl_educational_background`
  MODIFY `educational_backgruond_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_parent`
--
ALTER TABLE `tbl_parent`
  MODIFY `parent_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_religious_background`
--
ALTER TABLE `tbl_religious_background`
  MODIFY `religious_background_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_sibling`
--
ALTER TABLE `tbl_sibling`
  MODIFY `sibling_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_student`
--
ALTER TABLE `tbl_student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_educational_background`
--
ALTER TABLE `tbl_educational_background`
  ADD CONSTRAINT `fk_tbl_educational_background_tbl_student1` FOREIGN KEY (`student_id`) REFERENCES `tbl_student` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tbl_parent`
--
ALTER TABLE `tbl_parent`
  ADD CONSTRAINT `fk_tbl_parent_tbl_student` FOREIGN KEY (`student_id`) REFERENCES `tbl_student` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tbl_religious_background`
--
ALTER TABLE `tbl_religious_background`
  ADD CONSTRAINT `fk_tbl_religious_background_tbl_student1` FOREIGN KEY (`student_id`) REFERENCES `tbl_student` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tbl_sibling`
--
ALTER TABLE `tbl_sibling`
  ADD CONSTRAINT `fk_tbl_sibling_tbl_student1` FOREIGN KEY (`student_id`) REFERENCES `tbl_student` (`student_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
