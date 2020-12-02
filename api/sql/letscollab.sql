-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 02, 2020 at 11:21 AM
-- Server version: 10.3.27-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rachelpac_letscollab`
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
(1, 'Test Collab', 'Test Collab Descript', '2020-12-30 10:30:00', 'Open', 1, 1);

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
(1, 'Mansion', '100 Mansion Street', 'Brisbane', 'QLD', 4000, 'testuserloc@test.com', 'Mansion Descript', 0x696d616765732f70726f66696c652e706e67, 'www.instagram.com', 'www.airbnb.com', 2);

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
(1, 'Approved', 1, 1);

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
(1, 'Brisbane', 400.00, 'Studio', 'Complete', 1);

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
(1, 'testuseracc', '$2y$10$xcxidO5M2cmdPQQa8DKzY.YDwu006n4KNfgKmaf9yk4/.V/xXvtyi'),
(2, 'testuserloc', '$2y$10$OrAYqd0JPIoisuG/pd.rUetG6wWlWkgE7OzY.AUdVBhWxso.1ALQC');

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
(1, 'photographer', 1, 1);

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

--
-- Dumping data for table `TeamMemberSearch`
--

INSERT INTO `TeamMemberSearch` (`TeamMemberSearchID`, `Role`, `TeamMemberBookingFee`, `TeamMemberDescription`, `SearchStatus`, `CollaborationID`) VALUES
(1, 'model', 700.00, 'Editorial', 'In Progress', 1);

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
(1, 'Test', 'User', 'testuseracc@test.com', 'Test User Bio', 0x696d616765732f70726f66696c652e706e67, 'www.instagram.com', 'www.imgmodels.com', 1);

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
-- Dumping data for table `UserRequests`
--

INSERT INTO `UserRequests` (`UserRequestID`, `UserAction`, `UserAddress`, `UserBrowser`, `RequestTime`, `UserSessionID`) VALUES
(1, 'Failed Load Profile', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:11:06', NULL),
(2, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:11:09', NULL),
(3, 'Failed Load User Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:13:00', NULL),
(4, 'Failed Load User Team Requests', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:13:00', NULL),
(5, 'Failed Load Profile', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:13:15', NULL),
(6, 'Failed Logout', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:13:28', NULL),
(7, 'Register Account', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:22:59', NULL),
(8, 'User Login', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:23:27', NULL),
(9, 'Load User Team Requests', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:23:36', 1),
(10, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:23:39', 1),
(11, 'Load User Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:23:41', 1),
(12, 'Load User Team Requests', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:23:41', 1),
(13, 'Load Profile', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:23:47', 1),
(14, 'Submit Collaboration', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:26:25', 1),
(15, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:26:27', 1),
(16, 'Load User Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:26:33', 1),
(17, 'Load User Team Requests', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:26:33', 1),
(18, 'Load User Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:26:38', 1),
(19, 'Load User Team Requests', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:26:38', 1),
(20, 'Load Profile', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:26:41', 1),
(21, 'Load Profile', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:26:47', 1),
(22, 'Load User Team Requests', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:26:48', 1),
(23, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:26:55', 1),
(24, 'User Logout', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:27:13', 1),
(25, 'Register Account', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:30:12', NULL),
(26, 'User Login', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:31:04', NULL),
(27, 'Load User Location Requests', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:31:20', 2),
(28, 'Load Profile', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:31:24', 2),
(29, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:31:26', 2),
(30, 'Load Profile', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:31:34', 2),
(31, 'Load User Location Requests', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:31:36', 2),
(32, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:31:41', 2),
(33, 'Load User Collaboration Details', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:31:43', 2),
(34, 'Load Collaboration Team', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:31:43', 2),
(35, 'Load Collaboration Location', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:31:43', 2),
(36, 'Submit Location Request', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:31:45', 2),
(37, 'Failed Submit Location Request', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:31:51', 2),
(38, 'Failed Submit Team Member Request', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:32:00', 2),
(39, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:32:04', 2),
(40, 'Load Profile', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:32:09', 2),
(41, 'Load User Location Requests', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:32:10', 2),
(42, 'Load User Location Requests', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:32:13', 2),
(43, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:32:20', 2),
(44, 'Load Profile', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:36:50', 2),
(45, 'Load Profile', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:37:14', 2),
(46, 'Load Profile', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:37:18', 2),
(47, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:37:55', 2),
(48, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:38:11', 2),
(49, 'Load User Location Requests', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:38:16', 2),
(50, 'Load Profile', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:38:18', 2),
(51, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:38:31', 2),
(52, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:38:36', 2),
(53, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:58:42', NULL),
(54, 'Failed Load User Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:58:46', NULL),
(55, 'Failed Load User Team Requests', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:58:46', NULL),
(56, 'Failed Load Profile', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:58:47', NULL),
(57, 'Failed Logout', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:58:52', NULL),
(58, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:58:59', NULL),
(59, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:59:19', NULL),
(60, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 20:59:22', NULL),
(61, 'Failed Load Profile', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 21:21:40', NULL),
(62, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 21:21:42', NULL),
(63, 'Failed Load User Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 21:21:50', NULL),
(64, 'Failed Load User Team Requests', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 21:21:50', NULL),
(65, 'Failed Load Profile', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 21:21:51', NULL),
(66, 'Failed Load Profile', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 21:21:56', NULL),
(67, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 21:22:04', NULL),
(68, 'Failed Load User Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 21:22:10', NULL),
(69, 'Failed Load User Team Requests', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 21:22:13', NULL),
(70, 'Failed Load User Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-01 21:22:16', NULL),
(71, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:24:30', NULL),
(72, 'Failed Load User Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:24:37', NULL),
(73, 'Failed Load User Team Requests', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:24:37', NULL),
(74, 'Failed Load Profile', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:24:42', NULL),
(75, 'Failed Logout', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:24:52', NULL),
(76, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:25:07', NULL),
(77, 'Load User Collaboration Details', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:25:11', NULL),
(78, 'Load Collaboration Team', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:25:11', NULL),
(79, 'Load Collaboration Location', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:25:11', NULL),
(80, 'Failed Submit Collaboration', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:25:32', NULL),
(81, 'User Login', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:26:49', NULL),
(82, 'Load Profile', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:26:52', 1),
(83, 'Load User Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:26:54', 1),
(84, 'Load User Collaboration Details', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:26:57', 1),
(85, 'Load Collaboration Location', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:26:57', 1),
(86, 'Load Collaboration Team', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:26:57', 1),
(87, 'Load Collaboration Team Requests', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:26:57', 1),
(88, 'Load Collaboration Location Requests', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:26:57', 1),
(89, 'Load User Team Requests', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:27:04', 1),
(90, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:27:09', 1),
(91, 'Load User Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:27:13', 1),
(92, 'Load User Team Requests', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:27:15', 1),
(93, 'Load User Team Requests', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:27:21', 1),
(94, 'Load User Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:27:24', 1),
(95, 'Load Profile', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:27:28', 1),
(96, 'Load Profile', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:27:36', 1),
(97, 'Load User Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:27:38', 1),
(98, 'Load User Team Requests', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:27:39', 1),
(99, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:27:45', 1),
(100, 'Load Profile', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:27:47', 1),
(101, 'Load User Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:27:49', 1),
(102, 'Load User Collaboration Details', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:27:56', 1),
(103, 'Load Collaboration Location', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:27:56', 1),
(104, 'Load Collaboration Team', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:27:56', 1),
(105, 'Load Collaboration Team Requests', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:27:56', 1),
(106, 'Load Collaboration Location Requests', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:27:56', 1),
(107, 'User Logout', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:28:08', 1),
(108, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 03:28:10', NULL),
(109, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:37:38', NULL),
(110, 'Failed Logout', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:37:52', NULL),
(111, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:38:15', NULL),
(112, 'Failed Load User Collaborations', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:38:26', NULL),
(113, 'Failed Load User Team Requests', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:38:26', NULL),
(114, 'Failed Load Profile', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:38:31', NULL),
(115, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:38:54', NULL),
(116, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:39:05', NULL),
(117, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:39:31', NULL),
(118, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:39:50', NULL),
(119, 'Load User Collaboration Details', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:40:37', NULL),
(120, 'Load Collaboration Team', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:40:37', NULL),
(121, 'Load Collaboration Location', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:40:37', NULL),
(122, 'Failed Submit Collaboration', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:40:44', NULL),
(123, 'User Login', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:41:31', NULL),
(124, 'Load Profile', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:41:38', 1),
(125, 'Load User Collaborations', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:41:42', 1),
(126, 'Load User Team Requests', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:41:43', 1),
(127, 'Load User Collaborations', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:41:45', 1),
(128, 'Load User Collaboration Details', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:41:46', 1),
(129, 'Load Collaboration Location', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:41:46', 1),
(130, 'Load Collaboration Team', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:41:46', 1),
(131, 'Load Collaboration Team Requests', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:41:46', 1),
(132, 'Load Collaboration Location Requests', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:41:46', 1),
(133, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:41:54', 1),
(134, 'Load User Collaboration Details', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:41:57', 1),
(135, 'Load Collaboration Team', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:41:57', 1),
(136, 'Load Collaboration Location', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:41:57', 1),
(137, 'Failed Submit Location Request', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:42:08', 1),
(138, 'Load Profile', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:42:25', 1),
(139, 'Load User Collaborations', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:42:29', 1),
(140, 'Load User Collaboration Details', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:42:31', 1),
(141, 'Load Collaboration Location', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:42:31', 1),
(142, 'Load Collaboration Team', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:42:31', 1),
(143, 'Load Collaboration Team Requests', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:42:31', 1),
(144, 'Load Collaboration Location Requests', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:42:31', 1),
(145, 'Load User Team Requests', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:42:37', 1),
(146, 'User Logout', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:42:46', 1),
(147, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 03:42:53', NULL),
(148, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 09:43:06', NULL),
(149, 'Failed Load User Collaborations', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 09:43:15', NULL),
(150, 'Failed Load User Team Requests', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 09:43:15', NULL),
(151, 'Failed Load Profile', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 09:43:22', NULL),
(152, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 09:43:48', NULL),
(153, 'Load User Collaboration Details', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 09:43:53', NULL),
(154, 'Load Collaboration Location', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 09:43:53', NULL),
(155, 'Load Collaboration Team', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 09:43:53', NULL),
(156, 'Failed Load User Collaborations', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 09:44:09', NULL),
(157, 'Failed Load User Team Requests', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 09:44:10', NULL),
(158, 'Failed Load User Collaborations', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 09:44:11', NULL),
(159, 'Failed Load Profile', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 09:44:14', NULL),
(160, 'Failed Load Profile', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 09:44:26', NULL),
(161, 'Failed Load User Collaborations', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 09:44:29', NULL),
(162, 'Failed Load User Team Requests', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 09:44:32', NULL),
(163, 'Failed Load User Collaborations', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 09:44:33', NULL),
(164, 'Failed Submit Collaboration', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 09:44:40', NULL),
(165, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1', '2020-12-02 09:44:46', NULL),
(166, 'Failed Submit Collaboration', '51.75.146.127', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.24 Safari/537.36 Edg/83.0.478.18', '2020-12-02 10:28:12', NULL),
(167, 'Failed Submit Collaboration', '51.75.146.127', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.24 Safari/537.36 Edg/83.0.478.18', '2020-12-02 10:28:14', NULL),
(168, 'Failed Load Profile', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 10:51:00', NULL),
(169, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 10:51:06', NULL),
(170, 'Failed Load Profile', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 10:51:10', NULL),
(171, 'User Login', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 10:52:39', NULL),
(172, 'Load Profile', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 10:52:43', 1),
(173, 'Load User Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 10:52:45', 1),
(174, 'Load User Team Requests', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 10:52:47', 1),
(175, 'Load User Team Requests', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 10:52:54', 1),
(176, 'Load User Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 10:52:56', 1),
(177, 'Load User Collaboration Details', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 10:53:00', 1),
(178, 'Load Collaboration Location', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 10:53:00', 1),
(179, 'Load Collaboration Team Requests', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 10:53:00', 1),
(180, 'Load Collaboration Team', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 10:53:00', 1),
(181, 'Load Collaboration Location Requests', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 10:53:00', 1),
(182, 'Approve Collaboration Location Requests', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 10:53:03', 1),
(183, 'Load User Team Requests', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 10:53:08', 1),
(184, 'Load User Team Requests', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 10:53:14', 1),
(185, 'Load User Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 10:53:16', 1),
(186, 'Load User Collaboration Details', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 10:53:18', 1),
(187, 'Load Collaboration Location', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 10:53:18', 1),
(188, 'Load Collaboration Team', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 10:53:18', 1),
(189, 'Load Collaboration Team Requests', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 10:53:18', 1),
(190, 'User Logout', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 10:53:40', 1),
(191, 'Failed Load Profile', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 10:53:43', NULL),
(192, 'User Login', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 10:54:36', NULL),
(193, 'Load Profile', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 10:54:40', 1),
(194, 'Load Profile', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 11:12:05', 1),
(195, 'Browse Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 11:12:09', 1),
(196, 'Load User Collaboration Details', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 11:16:07', 1),
(197, 'Load Collaboration Team', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 11:16:07', 1),
(198, 'Load Collaboration Location', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 11:16:07', 1),
(199, 'Load User Collaborations', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 11:16:14', 1),
(200, 'Load User Collaboration Details', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 11:16:16', 1),
(201, 'Load Collaboration Team Requests', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 11:16:16', 1),
(202, 'Load Collaboration Team', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 11:16:16', 1),
(203, 'Load Collaboration Location', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 11:16:16', 1),
(204, 'Load Profile', '220.239.48.8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36', '2020-12-02 11:16:24', 1);

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
  MODIFY `CollaborationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Location`
--
ALTER TABLE `Location`
  MODIFY `LocationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `LocationRequest`
--
ALTER TABLE `LocationRequest`
  MODIFY `LocationRequestID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `LocationSearch`
--
ALTER TABLE `LocationSearch`
  MODIFY `LocationSearchID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Login`
--
ALTER TABLE `Login`
  MODIFY `LoginID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `TeamMember`
--
ALTER TABLE `TeamMember`
  MODIFY `TeamMemberID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `TeamMemberRequest`
--
ALTER TABLE `TeamMemberRequest`
  MODIFY `TeamMemberRequestID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `TeamMemberSearch`
--
ALTER TABLE `TeamMemberSearch`
  MODIFY `TeamMemberSearchID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `UserRequests`
--
ALTER TABLE `UserRequests`
  MODIFY `UserRequestID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
