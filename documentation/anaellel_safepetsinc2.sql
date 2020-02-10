-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 29, 2019 at 09:30 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `anaellel_safepetsinc2`
--

-- --------------------------------------------------------

--
-- Table structure for table `dogs`
--

CREATE TABLE `dogs` (
  `DOG_ID` int(11) UNSIGNED NOT NULL,
  `DOG_NAME` varchar(25) NOT NULL,
  `DOB` date NOT NULL,
  `SEX` varchar(1) NOT NULL,
  `BREED` varchar(25) NOT NULL,
  `WEIGHT` int(5) DEFAULT NULL,
  `SIZE` varchar(1) NOT NULL,
  `VET_CHECKS` varchar(25) NOT NULL,
  `DOG_DESCRIPTION` text,
  `ADOPTION_STATUS` varchar(1) DEFAULT NULL,
  `STAFF_ID` int(11) UNSIGNED NOT NULL,
  `KENNEL_NUMBER` int(11) UNSIGNED NOT NULL,
  `SPONSOR_ID` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dogs`
--

INSERT INTO `dogs` (`DOG_ID`, `DOG_NAME`, `DOB`, `SEX`, `BREED`, `WEIGHT`, `SIZE`, `VET_CHECKS`, `DOG_DESCRIPTION`, `ADOPTION_STATUS`, `STAFF_ID`, `KENNEL_NUMBER`, `SPONSOR_ID`) VALUES
(1, 'Chevvy', '2017-10-08', 'F', 'Rottweiler', NULL, 'M', 'Y', NULL, 'Y', 4, 1, 4),
(2, 'Butch', '2017-05-15', 'M', 'Husky x Mastiff', NULL, 'L', 'Y', NULL, 'Y', 2, 2, 2),
(3, 'Durah', '2012-04-01', 'F', 'Mastiff x', NULL, 'M', 'Y', NULL, 'Y', 5, 3, 5),
(4, 'Yogi', '2017-02-24', 'M', 'Mastiff', NULL, 'L', 'Y', NULL, 'Y', 4, 4, 4),
(5, 'Marnie', '2017-01-01', 'F', 'Staffy', NULL, 'M', 'Y', NULL, 'Y', 1, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `duties`
--

CREATE TABLE `duties` (
  `DUTY_ID` int(11) UNSIGNED NOT NULL,
  `DUTY_TASK` varchar(25) NOT NULL,
  `DATE_SET` datetime NOT NULL,
  `DATE_DUE` datetime DEFAULT NULL,
  `COMPLETION_STATUS` varchar(1) DEFAULT NULL,
  `DOG_ID` int(11) UNSIGNED NOT NULL,
  `VOLUNTEER_ID` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `duties`
--

INSERT INTO `duties` (`DUTY_ID`, `DUTY_TASK`, `DATE_SET`, `DATE_DUE`, `COMPLETION_STATUS`, `DOG_ID`, `VOLUNTEER_ID`) VALUES
(1, 'Cleaning', '2019-10-30 00:00:00', '2019-11-01 00:00:00', 'Y', 1, 1),
(2, 'Vet visit', '2019-11-05 00:00:00', '2020-01-05 00:00:00', '', 4, 2),
(3, 'Grooming', '2019-11-04 00:00:00', '2019-12-23 00:00:00', '', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `kennels`
--

CREATE TABLE `kennels` (
  `KENNEL_NUMBER` int(11) UNSIGNED NOT NULL,
  `ADDRESS` varchar(60) NOT NULL,
  `CITY` varchar(25) NOT NULL,
  `POSTCODE` varchar(25) NOT NULL,
  `STATE` varchar(5) NOT NULL,
  `PHONE` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kennels`
--

INSERT INTO `kennels` (`KENNEL_NUMBER`, `ADDRESS`, `CITY`, `POSTCODE`, `STATE`, `PHONE`) VALUES
(1, '58 Sunshine Place', 'Nambeelup', '6207', 'WA', '0890123456'),
(2, '58 Sunshine Place', 'Nambeelup', '6207', 'WA', '0890123456'),
(3, '58 Sunshine Place', 'Nambeelup', '6207', 'WA', '0890123456'),
(4, '58 Sunshine Place', 'Nambeelup', '6207', 'WA', '0890123456'),
(5, '58 Sunshine Place', 'Nambeelup', '6207', 'WA', '0890123456');

-- --------------------------------------------------------

--
-- Table structure for table `sponsors`
--

CREATE TABLE `sponsors` (
  `SPONSOR_ID` int(11) UNSIGNED NOT NULL,
  `SPONSOR_PHONE` varchar(25) NOT NULL,
  `FIRSTNAME` varchar(25) NOT NULL,
  `LASTNAME` varchar(25) NOT NULL,
  `ADDRESS` varchar(60) NOT NULL,
  `CITY` varchar(25) NOT NULL,
  `POSTCODE` varchar(25) NOT NULL,
  `STATE` varchar(5) NOT NULL,
  `PAYMENT_STATUS` varchar(10) DEFAULT NULL,
  `PET_OWNERSHIP` varchar(1) DEFAULT NULL,
  `RENTAL_STATUS` varchar(1) DEFAULT NULL,
  `PET_PREFERENCES` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sponsors`
--

INSERT INTO `sponsors` (`SPONSOR_ID`, `SPONSOR_PHONE`, `FIRSTNAME`, `LASTNAME`, `ADDRESS`, `CITY`, `POSTCODE`, `STATE`, `PAYMENT_STATUS`, `PET_OWNERSHIP`, `RENTAL_STATUS`, `PET_PREFERENCES`) VALUES
(1, '495810011', 'Irena', 'D\'CRUZ', '21 Planet place', 'Nambeelup', '6207', 'WA', '07/2020', NULL, NULL, NULL),
(2, '495810012', 'Jolly', 'JUMPING', '43 Levy avenue', 'Rockingham', '6168', 'WA', '03/2020', NULL, NULL, NULL),
(3, '495810013', 'Soli', 'TARYSM', '95 Lonesome road', 'Perth', '6100', 'WA', '', NULL, NULL, NULL),
(4, '495810014', 'Mourad', 'BENAZIR', '24 Awesome parade', 'Perth', '6100', 'WA', '04/2020', NULL, NULL, NULL),
(5, '495810015', 'Ku-oon', 'LIN', '10 Viva street', 'Mandurah', '6210', 'WA', '', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `STAFF_ID` int(11) UNSIGNED NOT NULL,
  `EMPLOYEE_ID` varchar(25) NOT NULL,
  `FIRSTNAME` varchar(25) NOT NULL,
  `LASTNAME` varchar(25) NOT NULL,
  `DOB` date NOT NULL,
  `ADDRESS` varchar(60) NOT NULL,
  `CITY` varchar(25) NOT NULL,
  `POSTCODE` varchar(25) NOT NULL,
  `STATE` varchar(5) NOT NULL,
  `POLICE_CHECKS` char(1) NOT NULL,
  `START_DATE` date NOT NULL,
  `END_DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`STAFF_ID`, `EMPLOYEE_ID`, `FIRSTNAME`, `LASTNAME`, `DOB`, `ADDRESS`, `CITY`, `POSTCODE`, `STATE`, `POLICE_CHECKS`, `START_DATE`, `END_DATE`) VALUES
(1, 'SP001', 'Carol', 'CARTER', '1960-01-10', '10 Lorri street', 'Perth', '6100', 'WA', 'Y', '2014-01-10', NULL),
(2, 'SP002', 'Carol', 'CAMPLIN', '1955-05-24', '24 Keet street', 'Perth', '6100', 'WA', 'Y', '2015-05-24', NULL),
(3, 'SP003', 'Rhonda', 'DONOVAN', '1965-03-08', '48 South road', 'Busselton', '6280', 'WA', 'Y', '2013-03-08', NULL),
(4, 'SP004', 'Duncan', 'PRATT', '1978-09-16', '7 Haskell Place', 'Mandurah', '6210', 'WA', 'Y', '2016-08-05', NULL),
(5, 'SP005', 'Janine', 'MATTHEWS', '1963-10-29', '2 Linux Boulevard', 'Nambelup', '6207', 'WA', 'Y', '2017-11-04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `volunteers`
--

CREATE TABLE `volunteers` (
  `VOLUNTEER_ID` int(11) UNSIGNED NOT NULL,
  `NICKNAME` varchar(10) NOT NULL,
  `FIRSTNAME` varchar(25) NOT NULL,
  `LASTNAME` varchar(25) NOT NULL,
  `DOB` date NOT NULL,
  `ADDRESS` varchar(60) NOT NULL,
  `CITY` varchar(25) NOT NULL,
  `POSTCODE` varchar(25) NOT NULL,
  `STATE` varchar(5) NOT NULL,
  `POLICE_CHECKS` varchar(1) NOT NULL,
  `INDUCTION_CHECKS` varchar(1) NOT NULL,
  `START_DATE` date NOT NULL,
  `END_DATE` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `volunteers`
--

INSERT INTO `volunteers` (`VOLUNTEER_ID`, `NICKNAME`, `FIRSTNAME`, `LASTNAME`, `DOB`, `ADDRESS`, `CITY`, `POSTCODE`, `STATE`, `POLICE_CHECKS`, `INDUCTION_CHECKS`, `START_DATE`, `END_DATE`) VALUES
(1, 'Mic', 'Michael', 'PLUNKETT', '1960-12-15', '54 Hope street', 'Perth', '6100', 'WA', 'Y', 'Y', '2018-05-26', '2019-12-15'),
(2, 'Sally', 'Salome', 'DJAWAD', '1999-09-11', '63 Free road', 'Rockingham', '6168', 'WA', 'Y', 'Y', '2018-08-20', '2020-01-26'),
(3, 'Hik', 'Hikomori', 'SUSUME', '1997-06-13', '21 Garage parade', 'Rockingham', '6168', 'WA', 'Y', 'Y', '2018-10-24', '2019-12-30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dogs`
--
ALTER TABLE `dogs`
  ADD PRIMARY KEY (`DOG_ID`),
  ADD KEY `SPONSOR_ID` (`SPONSOR_ID`),
  ADD KEY `STAFF_ID` (`STAFF_ID`),
  ADD KEY `KENNEL_NUMBER` (`KENNEL_NUMBER`);

--
-- Indexes for table `duties`
--
ALTER TABLE `duties`
  ADD PRIMARY KEY (`DUTY_ID`),
  ADD KEY `DOG_ID` (`DOG_ID`),
  ADD KEY `VOLUNTEER_ID` (`VOLUNTEER_ID`);

--
-- Indexes for table `kennels`
--
ALTER TABLE `kennels`
  ADD PRIMARY KEY (`KENNEL_NUMBER`);

--
-- Indexes for table `sponsors`
--
ALTER TABLE `sponsors`
  ADD PRIMARY KEY (`SPONSOR_ID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`STAFF_ID`);

--
-- Indexes for table `volunteers`
--
ALTER TABLE `volunteers`
  ADD PRIMARY KEY (`VOLUNTEER_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `dogs`
--
ALTER TABLE `dogs`
  MODIFY `DOG_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `duties`
--
ALTER TABLE `duties`
  MODIFY `DUTY_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kennels`
--
ALTER TABLE `kennels`
  MODIFY `KENNEL_NUMBER` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sponsors`
--
ALTER TABLE `sponsors`
  MODIFY `SPONSOR_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `STAFF_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `volunteers`
--
ALTER TABLE `volunteers`
  MODIFY `VOLUNTEER_ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dogs`
--
ALTER TABLE `dogs`
  ADD CONSTRAINT `dogs_ibfk_1` FOREIGN KEY (`SPONSOR_ID`) REFERENCES `sponsors` (`SPONSOR_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dogs_ibfk_2` FOREIGN KEY (`STAFF_ID`) REFERENCES `staff` (`STAFF_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `dogs_ibfk_3` FOREIGN KEY (`KENNEL_NUMBER`) REFERENCES `kennels` (`KENNEL_NUMBER`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `duties`
--
ALTER TABLE `duties`
  ADD CONSTRAINT `duties_ibfk_1` FOREIGN KEY (`DOG_ID`) REFERENCES `dogs` (`DOG_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `duties_ibfk_2` FOREIGN KEY (`VOLUNTEER_ID`) REFERENCES `volunteers` (`VOLUNTEER_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
