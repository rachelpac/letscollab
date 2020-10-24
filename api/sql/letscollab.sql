-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Oct 24, 2020 at 11:26 AM
-- Server version: 5.7.26
-- PHP Version: 7.3.9

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

--
-- Dumping data for table `Collaboration`
--

INSERT INTO `Collaboration` (`CollaborationID`, `Title`, `Description`, `Date`, `Status`, `LocationID`, `UserID`) VALUES
(1, 'collab title', 'collab descript', '2020-09-23 16:37:00', 'Open', 1, 1),
(2, 'test2', 'test2', '2020-09-30 17:58:00', 'Open', 2, 1),
(3, 'test3', 'test3', '2020-09-21 17:14:00', 'Open', NULL, 1),
(4, 'test4', 'test4', '2020-09-30 16:32:00', 'Open', 1, 1),
(5, 'test5', 'test5', '2020-09-09 15:49:00', 'Open', 1, 1),
(6, 'test6', 'test6', '2020-09-29 17:01:00', 'Open', 1, 1),
(7, 'test7', 'test7', '2020-09-23 18:17:00', 'Open', 1, 1),
(8, '', '', '2020-10-06 02:10:44', 'Open', NULL, 1),
(9, '', '', '2020-10-13 12:03:48', 'Open', NULL, 1),
(10, 'cc', 'cd', '2020-10-22 17:31:00', 'Open', NULL, 1),
(11, 'Celebrate Our Creatives', '50 local creatives celebrated by the inspired co', '2020-10-01 08:15:00', 'Open', NULL, 1),
(12, 'Celebrate Our Creatives', '50 local creatives celebrated by the inspired co', '2020-10-01 08:15:00', 'Open', 1, 1),
(13, 'Celebrate Our Creatives', '50 local creatives celebrated by the inspired co', '2020-10-01 08:15:00', 'Open', NULL, 1),
(14, 'editorial', 'graphic makeup', '2020-10-25 15:14:00', 'Open', NULL, 1),
(15, 'editorial', 'graphic makeup', '2020-10-25 15:14:00', 'Open', NULL, 1),
(16, 'test all', 'test all', '2020-10-22 17:06:00', 'Open', NULL, 1),
(17, 'test all', 'test all', '2020-10-22 17:06:00', 'Open', NULL, 1),
(18, 'test all', 'test all', '2020-10-22 17:06:00', 'Open', NULL, 1),
(19, 'test all', 'test all', '2020-10-22 17:06:00', 'Open', 2, 1),
(20, 'test all', 'test all', '2020-10-22 17:06:00', 'Open', NULL, 1),
(21, 'portfolio shoot', 'book images', '2020-10-21 17:45:00', 'Open', NULL, 1),
(22, 'portfolio shoot', 'book images', '2020-10-21 17:45:00', 'Open', NULL, 1),
(23, 'portfolio shoot', 'book images', '2020-10-21 17:45:00', 'Open', 2, 1),
(24, 'portfolio shoot', 'book images', '2020-10-21 17:45:00', 'Open', 2, 1),
(25, 'portfolio shoot', 'book images', '2020-10-21 17:45:00', 'Open', 2, 1),
(28, 'test owner id', 'test', '2020-10-26 04:44:00', 'Open', NULL, 5);

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

--
-- Dumping data for table `Location`
--

INSERT INTO `Location` (`LocationID`, `Name`, `Address`, `City`, `State`, `PostCode`, `Email`, `Description`, `ProfilePicture`, `InstagramHandle`, `WebsiteURL`, `LoginID`) VALUES
(1, 'lname', 'l street', 'l city', 'QLD', 4000, 'l@l', 'l descript', 0x696d616765732f70726f66696c652e706e67, 'https://www.instagram.com/', 'https://linktr.ee/vacayco', 2),
(2, 'locname', 'locadd', 'loccty', 'QLD', 4170, 'testlocacc@test.com', 'loc descript', 0x696d616765732f70726f66696c652e706e67, 'https://www.instagram.com/', 'https://linktr.ee/vacayco', 4),
(3, 'test log name', '52 Test Lane', 'Brisbane', 'QLD', 4000, 'testuser@test.com', 'shoot space', 0x696d616765732f70726f66696c652e706e67, 'https://www.instagram.com/', 'https://linktr.ee/vacayco', 8);

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

--
-- Dumping data for table `LocationRequest`
--

INSERT INTO `LocationRequest` (`LocationRequestID`, `RequestStatus`, `LocationID`, `LocationSearchID`) VALUES
(1, 'Pending', 1, 1),
(2, 'Pending', 2, 1),
(3, 'Denied', 2, 2),
(4, 'Approved', 1, 2),
(5, 'Approved', 1, 3),
(6, 'Denied', 1, 5);

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

--
-- Dumping data for table `LocationSearch`
--

INSERT INTO `LocationSearch` (`LocationSearchID`, `City`, `LocationBookingFee`, `LocationDescription`, `SearchStatus`, `CollaborationID`) VALUES
(1, 'test', '300.00', 'test', 'In Progress', 1),
(2, 'citysearch', '700.00', 'citydesript', 'Complete', 5),
(3, 'Brisbane', '400.00', 'Studio', 'Complete', 12),
(4, 'Brisbane', '400.00', 'Studio', 'In Progress', 13),
(5, 'test all loc', '700.00', 'test all loc', 'In Progress', 16),
(6, 'test all loc', '700.00', 'test all loc', 'In Progress', 17),
(7, 'brisbane', '600.00', 'mansion', 'In Progress', 28);

-- --------------------------------------------------------

--
-- Table structure for table `Login`
--

CREATE TABLE `Login` (
  `LoginID` int(11) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Login`
--

INSERT INTO `Login` (`LoginID`, `Username`, `Password`) VALUES
(1, 'joeblogs', 'joepass1'),
(2, 'locationtest', 'locationpass1'),
(3, 'testuseracc', 'testpass1'),
(4, 'testlocacc', 'testpass1'),
(5, 'rachelpac', 'Rachelpac1!'),
(6, 'rachelpac', 'Password2020!'),
(7, 'testusertypeloc', '$2y$10$OctBMojzn2lfekTNuVQ7Wu31N511ySQ3wiN3n03mTwGiRU9qW3Hea'),
(8, 'testlocloguser', '$2y$10$tpYyRF7cuv6DYboSNCaax.4GWV7ElMYaFA4Wq.K3phq.zV6SXAHs6');

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

--
-- Dumping data for table `TeamMember`
--

INSERT INTO `TeamMember` (`TeamMemberID`, `Role`, `UserID`, `CollaborationID`) VALUES
(1, 'photographer', 1, 1),
(2, 'model', 1, 1),
(3, 'model', 1, 3),
(4, 'photographer', 1, 4),
(5, '', 1, 5),
(6, 'makeupartist', 1, 6),
(7, 'model', 1, 6),
(8, 'model', 1, 7),
(9, 'photographer', 1, 7),
(10, '', 1, 8),
(11, 'makeupartist', 1, 1),
(12, 'makeupartist', 1, 1),
(13, '', 1, 9),
(14, 'makeupartist', 1, 10),
(15, 'photographer', 1, 11),
(16, 'photographer', 1, 12),
(17, 'makeupartist', 3, 12),
(18, 'photographer', 1, 13),
(19, 'makeupartist', 3, 13),
(20, 'makeupartist', 1, 14),
(21, 'makeupartist', 1, 15),
(22, 'photographer', 1, 16),
(23, 'makeupartist', 3, 16),
(24, 'photographer', 1, 17),
(25, 'makeupartist', 3, 17),
(26, 'photographer', 1, 18),
(27, 'photographer', 1, 19),
(28, 'makeupartist', 3, 19),
(29, 'photographer', 1, 20),
(30, 'model', 1, 21),
(31, 'model', 1, 22),
(32, 'model', 1, 23),
(33, 'makeupartist', 1, 23),
(34, 'model', 1, 24),
(35, 'makeupartist', 3, 24),
(36, 'model', 1, 25),
(37, 'makeupartist', 1, 1),
(38, 'makeupartist', 1, 1),
(39, 'photographer', 1, 25),
(40, 'photographer', 5, 28);

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

--
-- Dumping data for table `TeamMemberRequest`
--

INSERT INTO `TeamMemberRequest` (`TeamMemberRequestID`, `RequestStatus`, `TeamMemberSearchID`, `UserID`) VALUES
(1, 'Approved', 1, 1),
(2, 'Pending', 2, 2),
(3, 'Pending', 2, 1),
(4, 'Approved', 9, 1),
(5, 'Denied', 6, 1),
(6, 'Pending', 1, 5);

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

--
-- Dumping data for table `TeamMemberSearch`
--

INSERT INTO `TeamMemberSearch` (`TeamMemberSearchID`, `Role`, `TeamMemberBookingFee`, `TeamMemberDescription`, `SearchStatus`, `CollaborationID`) VALUES
(1, 'makeupartist', '100.00', 'makeup search ', 'Complete', 1),
(2, 'makeupartist', '100.00', 'natural glam', 'In Progress', 7),
(3, 'model', '100.00', 'Afro hair', 'In Progress', 13),
(4, 'model', '100.00', 'dark skin', 'In Progress', 15),
(5, 'model', '300.00', 'testlocmodel', 'In Progress', 17),
(6, 'model', '300.00', 'testlocmodel', 'In Progress', 19),
(7, 'photographer', '150.00', 'portfolio', 'In Progress', 23),
(8, 'photographer', '150.00', 'portfolio', 'In Progress', 24),
(9, 'photographer', '150.00', 'portfolio', 'Complete', 25),
(10, 'model', '300.00', 'curve', 'In Progress', 28);

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

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`UserID`, `FirstName`, `LastName`, `Email`, `Bio`, `ProfilePicture`, `InstagramHandle`, `PortfolioURL`, `LoginID`) VALUES
(1, 'joe', 'blogs', 'joe@blogs', 'bio', 0x696d616765732f70726f66696c652e706e67, 'https://www.instagram.com/', 'https://www.imgmodels.com/', 1),
(2, 'Jane', 'User', 'testuseracc@test.com', 'Jane Bio', 0x696d616765732f70726f66696c652e706e67, 'https://www.instagram.com/', 'https://www.imgmodels.com/', 3),
(3, 'Rachel', 'Pac', 'rachel@hotmail.com', 'bio', 0x696d616765732f70726f66696c652e706e67, 'https://www.instagram.com/', 'https://www.imgmodels.com/', 5),
(4, 'rachel', 'pac', 'rachel@hotmail.com', 'bio', 0x696d616765732f70726f66696c652e706e67, 'https://www.instagram.com/', 'https://www.imgmodels.com/', 6),
(5, 'Test', 'Type', 'testuser@test.com', 'bio', 0x696d616765732f70726f66696c652e706e67, 'https://www.instagram.com/', 'https://www.imgmodels.com/', 7);

-- --------------------------------------------------------

--
-- Table structure for table `UserRequests`
--

CREATE TABLE `UserRequests` (
  `UserRequestID` int(11) NOT NULL,
  `UserAction` varchar(255) NOT NULL,
  `UserAddress` varchar(255) NOT NULL,
  `UserBrowser` varchar(255) NOT NULL,
  `RequestTime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `UserRequests`
--

INSERT INTO `UserRequests` (`UserRequestID`, `UserAction`, `UserAddress`, `UserBrowser`, `RequestTime`) VALUES
(1, 'TEST', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.80 Safari/537.36', '2020-10-24 11:05:56'),
(2, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.80 Safari/537.36', '2020-10-24 11:12:34'),
(3, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.80 Safari/537.36', '2020-10-24 11:22:45'),
(4, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.80 Safari/537.36', '2020-10-24 11:23:12'),
(5, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.80 Safari/537.36', '2020-10-24 11:23:35');

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
  ADD PRIMARY KEY (`UserRequestID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Collaboration`
--
ALTER TABLE `Collaboration`
  MODIFY `CollaborationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `Location`
--
ALTER TABLE `Location`
  MODIFY `LocationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `LocationRequest`
--
ALTER TABLE `LocationRequest`
  MODIFY `LocationRequestID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `LocationSearch`
--
ALTER TABLE `LocationSearch`
  MODIFY `LocationSearchID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `Login`
--
ALTER TABLE `Login`
  MODIFY `LoginID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `TeamMember`
--
ALTER TABLE `TeamMember`
  MODIFY `TeamMemberID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `TeamMemberRequest`
--
ALTER TABLE `TeamMemberRequest`
  MODIFY `TeamMemberRequestID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `TeamMemberSearch`
--
ALTER TABLE `TeamMemberSearch`
  MODIFY `TeamMemberSearchID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `UserRequests`
--
ALTER TABLE `UserRequests`
  MODIFY `UserRequestID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
