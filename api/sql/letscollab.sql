-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Apr 29, 2021 at 07:42 AM
-- Server version: 5.7.26
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `letscollab`
--

-- --------------------------------------------------------

--
-- Table structure for table `Collaboration`
--

CREATE TABLE `Collaboration` (
  `CollaborationID` int(11) NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Description` longtext NOT NULL,
  `Date` datetime NOT NULL,
  `Status` varchar(50) NOT NULL,
  `LocationID` int(11) DEFAULT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Location`
--

CREATE TABLE `Location` (
  `LocationID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `City` varchar(255) NOT NULL,
  `State` varchar(3) NOT NULL,
  `PostCode` int(4) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Description` longtext NOT NULL,
  `ProfilePicture` blob NOT NULL,
  `InstagramHandle` varchar(30) NOT NULL,
  `WebsiteURL` varchar(255) NOT NULL,
  `LoginID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `LocationRequest`
--

CREATE TABLE `LocationRequest` (
  `LocationRequestID` int(11) NOT NULL,
  `RequestStatus` varchar(30) NOT NULL,
  `LocationID` int(11) NOT NULL,
  `LocationSearchID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `LocationSearch`
--

CREATE TABLE `LocationSearch` (
  `LocationSearchID` int(11) NOT NULL,
  `City` varchar(255) NOT NULL,
  `LocationBookingFee` decimal(7,2) NOT NULL,
  `LocationDescription` longtext NOT NULL,
  `SearchStatus` varchar(30) NOT NULL,
  `CollaborationID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `Login`
--

CREATE TABLE `Login` (
  `LoginID` int(11) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `TeamMember`
--

CREATE TABLE `TeamMember` (
  `TeamMemberID` int(11) NOT NULL,
  `Role` varchar(50) NOT NULL,
  `UserID` int(11) NOT NULL,
  `CollaborationID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `TeamMemberRequest`
--

CREATE TABLE `TeamMemberRequest` (
  `TeamMemberRequestID` int(11) NOT NULL,
  `RequestStatus` varchar(50) NOT NULL,
  `TeamMemberSearchID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `TeamMemberSearch`
--

CREATE TABLE `TeamMemberSearch` (
  `TeamMemberSearchID` int(11) NOT NULL,
  `Role` varchar(50) NOT NULL,
  `TeamMemberBookingFee` decimal(7,2) NOT NULL,
  `TeamMemberDescription` longtext NOT NULL,
  `SearchStatus` varchar(50) NOT NULL,
  `CollaborationID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE `User` (
  `UserID` int(11) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Bio` longtext NOT NULL,
  `ProfilePicture` blob NOT NULL,
  `InstagramHandle` varchar(30) NOT NULL,
  `PortfolioURL` varchar(255) NOT NULL,
  `LoginID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `UserRequests`
--

CREATE TABLE `UserRequests` (
  `UserRequestID` int(11) NOT NULL,
  `UserAction` varchar(255) NOT NULL,
  `UserAddress` varchar(255) NOT NULL,
  `UserBrowser` varchar(255) NOT NULL,
  `RequestTime` datetime NOT NULL,
  `UserSessionID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Collaboration`
--
ALTER TABLE `Collaboration`
  ADD PRIMARY KEY (`CollaborationID`),
  ADD KEY `FK_CollaborationOwner` (`UserID`),
  ADD KEY `FK_CollaborationLocation` (`LocationID`);

--
-- Indexes for table `Location`
--
ALTER TABLE `Location`
  ADD PRIMARY KEY (`LocationID`),
  ADD KEY `FK_LocationLogin` (`LoginID`);

--
-- Indexes for table `LocationRequest`
--
ALTER TABLE `LocationRequest`
  ADD PRIMARY KEY (`LocationRequestID`),
  ADD KEY `FK_Location` (`LocationID`),
  ADD KEY `FK_LocationSearch` (`LocationSearchID`);

--
-- Indexes for table `LocationSearch`
--
ALTER TABLE `LocationSearch`
  ADD PRIMARY KEY (`LocationSearchID`),
  ADD KEY `FK_LocationCollaboration` (`CollaborationID`);

--
-- Indexes for table `Login`
--
ALTER TABLE `Login`
  ADD PRIMARY KEY (`LoginID`);

--
-- Indexes for table `TeamMember`
--
ALTER TABLE `TeamMember`
  ADD PRIMARY KEY (`TeamMemberID`),
  ADD KEY `FK_TeamUser` (`UserID`),
  ADD KEY `FK_TeamCollaboration` (`CollaborationID`);

--
-- Indexes for table `TeamMemberRequest`
--
ALTER TABLE `TeamMemberRequest`
  ADD PRIMARY KEY (`TeamMemberRequestID`),
  ADD KEY `FK_User` (`UserID`),
  ADD KEY `FK_TeamMemberSearch` (`TeamMemberSearchID`);

--
-- Indexes for table `TeamMemberSearch`
--
ALTER TABLE `TeamMemberSearch`
  ADD PRIMARY KEY (`TeamMemberSearchID`),
  ADD KEY `FK_Collaboration` (`CollaborationID`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`UserID`),
  ADD KEY `FK_UserLogin` (`LoginID`) USING BTREE;

--
-- Indexes for table `UserRequests`
--
ALTER TABLE `UserRequests`
  ADD PRIMARY KEY (`UserRequestID`),
  ADD KEY `FK_RequestLog` (`UserSessionID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Collaboration`
--
ALTER TABLE `Collaboration`
  MODIFY `CollaborationID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Location`
--
ALTER TABLE `Location`
  MODIFY `LocationID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `LocationRequest`
--
ALTER TABLE `LocationRequest`
  MODIFY `LocationRequestID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `LocationSearch`
--
ALTER TABLE `LocationSearch`
  MODIFY `LocationSearchID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Login`
--
ALTER TABLE `Login`
  MODIFY `LoginID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `TeamMember`
--
ALTER TABLE `TeamMember`
  MODIFY `TeamMemberID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `TeamMemberRequest`
--
ALTER TABLE `TeamMemberRequest`
  MODIFY `TeamMemberRequestID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `TeamMemberSearch`
--
ALTER TABLE `TeamMemberSearch`
  MODIFY `TeamMemberSearchID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `UserRequests`
--
ALTER TABLE `UserRequests`
  MODIFY `UserRequestID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Collaboration`
--
ALTER TABLE `Collaboration`
  ADD CONSTRAINT `FK_CollaborationLocation` FOREIGN KEY (`LocationID`) REFERENCES `Location` (`LocationID`),
  ADD CONSTRAINT `FK_CollaborationOwner` FOREIGN KEY (`UserID`) REFERENCES `User` (`UserID`);

--
-- Constraints for table `Location`
--
ALTER TABLE `Location`
  ADD CONSTRAINT `FK_LocationLogin` FOREIGN KEY (`LoginID`) REFERENCES `Login` (`LoginID`) ON UPDATE CASCADE;

--
-- Constraints for table `LocationRequest`
--
ALTER TABLE `LocationRequest`
  ADD CONSTRAINT `FK_Location` FOREIGN KEY (`LocationID`) REFERENCES `Location` (`LocationID`),
  ADD CONSTRAINT `FK_LocationSearch` FOREIGN KEY (`LocationSearchID`) REFERENCES `LocationSearch` (`LocationSearchID`);

--
-- Constraints for table `LocationSearch`
--
ALTER TABLE `LocationSearch`
  ADD CONSTRAINT `FK_LocationCollaboration` FOREIGN KEY (`CollaborationID`) REFERENCES `Collaboration` (`CollaborationID`);

--
-- Constraints for table `TeamMember`
--
ALTER TABLE `TeamMember`
  ADD CONSTRAINT `FK_TeamCollaboration` FOREIGN KEY (`CollaborationID`) REFERENCES `Collaboration` (`CollaborationID`),
  ADD CONSTRAINT `FK_TeamUser` FOREIGN KEY (`UserID`) REFERENCES `User` (`UserID`) ON UPDATE CASCADE;

--
-- Constraints for table `TeamMemberRequest`
--
ALTER TABLE `TeamMemberRequest`
  ADD CONSTRAINT `FK_TeamMemberSearch` FOREIGN KEY (`TeamMemberSearchID`) REFERENCES `TeamMemberSearch` (`TeamMemberSearchID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_User` FOREIGN KEY (`UserID`) REFERENCES `User` (`UserID`) ON UPDATE CASCADE;

--
-- Constraints for table `TeamMemberSearch`
--
ALTER TABLE `TeamMemberSearch`
  ADD CONSTRAINT `FK_Collaboration` FOREIGN KEY (`CollaborationID`) REFERENCES `Collaboration` (`CollaborationID`) ON UPDATE CASCADE;

--
-- Constraints for table `User`
--
ALTER TABLE `User`
  ADD CONSTRAINT `FK_Login` FOREIGN KEY (`LoginID`) REFERENCES `Login` (`LoginID`) ON UPDATE CASCADE;

--
-- Constraints for table `UserRequests`
--
ALTER TABLE `UserRequests`
  ADD CONSTRAINT `FK_RequestLog` FOREIGN KEY (`UserSessionID`) REFERENCES `Login` (`LoginID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
