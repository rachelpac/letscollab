-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 06, 2020 at 10:38 PM
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
(28, 'test owner id', 'test', '2020-10-26 04:44:00', 'Open', NULL, 5),
(29, 'testauthpass', 'testauthpass', '2020-10-30 08:39:00', 'Open', NULL, 5),
(30, 'testfaillocacc', 'testfaillocacc', '2020-10-21 17:37:00', 'Open', NULL, 5),
(31, 'testlogtime', 'testlogtime', '2020-11-28 17:47:00', 'Open', NULL, 5),
(32, 'testlogtime', 'testlogtime', '2020-11-28 17:47:00', 'Open', NULL, 5),
(33, 'testlogtime', 'testlogtime', '2020-11-28 17:47:00', 'Open', NULL, 5),
(34, 'testcollabreq', 'testcollabreq', '2020-11-24 16:01:00', 'Open', NULL, 5),
(35, 'testcollabreq', 'testcollabreq', '2020-11-24 16:01:00', 'Open', NULL, 5);

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
(6, 'Denied', 1, 5),
(7, 'Pending', 3, 1);

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
(7, 'brisbane', '600.00', 'mansion', 'In Progress', 28),
(8, 'testauthpass', '700.00', 'testauthpass', 'In Progress', 29),
(9, 'testfaillocacc', '700.00', 'testfaillocacc', 'In Progress', 30),
(10, 'Brisbane', '100.00', 'studio', 'In Progress', 31),
(11, 'Brisbane', '100.00', 'studio', 'In Progress', 32),
(12, 'Brisbane', '100.00', 'studio', 'In Progress', 33),
(13, 'testcollabreq', '200.00', 'testcollabreq', 'In Progress', 34),
(14, 'testcollabreq', '200.00', 'testcollabreq', 'In Progress', 35);

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
(8, 'testlocloguser', '$2y$10$tpYyRF7cuv6DYboSNCaax.4GWV7ElMYaFA4Wq.K3phq.zV6SXAHs6'),
(9, 'testrequser', '$2y$10$0bqyxvca6p7OVILP8hrUv.YLR19i44nEeDzkOl7/YvRA27ggQrzum');

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
(40, 'photographer', 5, 28),
(41, 'makeupartist', 5, 29),
(42, 'model', 5, 30),
(43, 'model', 5, 31),
(44, 'model', 5, 32),
(45, 'model', 5, 33),
(46, 'photographer', 5, 34),
(47, 'photographer', 5, 35);

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
(6, 'Pending', 1, 5),
(7, 'Pending', 2, 5);

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
(10, 'model', '300.00', 'curve', 'In Progress', 28),
(11, 'model', '200.00', 'testauthpass', 'In Progress', 29),
(12, 'photographer', '200.00', 'testfaillocacc', 'In Progress', 30),
(13, 'photographer', '200.00', 'folio', 'In Progress', 31),
(14, 'photographer', '200.00', 'folio', 'In Progress', 32),
(15, 'photographer', '200.00', 'folio', 'In Progress', 33),
(16, 'photographer', '400.00', 'testcollabreq', 'In Progress', 34),
(17, 'photographer', '400.00', 'testcollabreq', 'In Progress', 35);

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
(5, 'Test', 'Type', 'testuser@test.com', 'bio', 0x696d616765732f70726f66696c652e706e67, 'https://www.instagram.com/', 'https://www.imgmodels.com/', 7),
(6, 'testrequser', 'testrequser', 'testuser@test.com', 'testrequser', 0x7070, 'ig', 'url', 9);

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
(1, 'TEST', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.80 Safari/537.36', '2020-10-24 11:05:56', NULL),
(2, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.80 Safari/537.36', '2020-10-24 11:12:34', NULL),
(3, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.80 Safari/537.36', '2020-10-24 11:22:45', NULL),
(4, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.80 Safari/537.36', '2020-10-24 11:23:12', NULL),
(5, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.80 Safari/537.36', '2020-10-24 11:23:35', NULL),
(6, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-24 20:19:53', NULL),
(7, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-24 20:20:06', NULL),
(8, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-24 20:21:34', NULL),
(9, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-24 21:43:57', NULL),
(10, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-24 22:28:06', NULL),
(11, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-24 23:49:28', NULL),
(12, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-24 23:53:38', NULL),
(13, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-25 00:09:47', NULL),
(14, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-25 00:11:22', NULL),
(15, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-25 00:16:52', NULL),
(16, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-26 23:32:58', NULL),
(17, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-27 04:47:19', NULL),
(18, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-27 04:48:06', NULL),
(19, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-27 04:48:46', NULL),
(20, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-27 21:03:09', NULL),
(21, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-28 01:39:29', NULL),
(22, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-28 01:39:37', NULL),
(23, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-28 01:40:57', NULL),
(24, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-28 07:43:23', NULL),
(25, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-28 07:46:13', NULL),
(26, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-28 07:46:15', NULL),
(27, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-28 07:46:36', NULL),
(28, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-28 07:46:37', NULL),
(29, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-28 07:46:52', NULL),
(30, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-28 07:47:35', NULL),
(31, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-28 07:47:49', NULL),
(32, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-28 07:48:17', NULL),
(33, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-28 07:48:19', NULL),
(34, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-28 08:41:56', NULL),
(35, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-28 09:30:28', NULL),
(36, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-28 09:30:30', NULL),
(37, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-28 09:49:50', NULL),
(38, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-28 10:18:28', NULL),
(39, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-28 10:55:15', NULL),
(40, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-29 00:30:25', NULL),
(41, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-29 00:30:36', NULL),
(42, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-29 00:32:24', NULL),
(43, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-29 01:57:35', NULL),
(44, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-29 01:58:14', NULL),
(45, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-29 01:58:17', NULL),
(46, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-29 02:03:21', NULL),
(47, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-29 05:34:48', NULL),
(48, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-29 05:36:08', NULL),
(49, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 05:58:04', NULL),
(50, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 06:55:58', NULL),
(51, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 06:56:06', NULL),
(52, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 06:56:12', NULL),
(53, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 06:56:33', NULL),
(54, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 06:57:14', NULL),
(55, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 06:58:31', NULL),
(56, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:01:15', NULL),
(57, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:03:47', NULL),
(58, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:03:58', NULL),
(59, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:04:09', NULL),
(60, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:04:20', NULL),
(61, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:03', NULL),
(62, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:04', NULL),
(63, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:05', NULL),
(64, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:05', NULL),
(65, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:06', NULL),
(66, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:07', NULL),
(67, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:08', NULL),
(68, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:08', NULL),
(69, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:09', NULL),
(70, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:10', NULL),
(71, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:10', NULL),
(72, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:11', NULL),
(73, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:12', NULL),
(74, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:13', NULL),
(75, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:14', NULL),
(76, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:14', NULL),
(77, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:15', NULL),
(78, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:15', NULL),
(79, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:16', NULL),
(80, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:16', NULL),
(81, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:17', NULL),
(82, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:17', NULL),
(83, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:18', NULL),
(84, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:18', NULL),
(85, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:19', NULL),
(86, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:19', NULL),
(87, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:20', NULL),
(88, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:21', NULL),
(89, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:21', NULL),
(90, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:22', NULL),
(91, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:22', NULL),
(92, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:23', NULL),
(93, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:23', NULL),
(94, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:24', NULL),
(95, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:25', NULL),
(96, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:26', NULL),
(97, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:35', NULL),
(98, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:37', NULL),
(99, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:38', NULL),
(100, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:38', NULL),
(101, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:39', NULL),
(102, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:39', NULL),
(103, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:39', NULL),
(104, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:40', NULL),
(105, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:40', NULL),
(106, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:40', NULL),
(107, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:41', NULL),
(108, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:41', NULL),
(109, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:42', NULL),
(110, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:42', NULL),
(111, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:43', NULL),
(112, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:43', NULL),
(113, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:43', NULL),
(114, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:44', NULL),
(115, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:44', NULL),
(116, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:44', NULL),
(117, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:45', NULL),
(118, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 07:27:45', NULL),
(119, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 09:20:08', NULL),
(120, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 09:20:14', NULL),
(121, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 09:20:15', NULL),
(122, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 09:20:16', NULL),
(123, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 09:20:23', NULL),
(124, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 09:20:24', NULL),
(125, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 09:20:25', NULL),
(126, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 09:20:26', NULL),
(127, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 09:20:28', NULL),
(128, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 09:20:30', NULL),
(129, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 09:20:32', NULL),
(130, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 09:20:33', NULL),
(131, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 09:20:34', NULL),
(132, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 09:20:35', NULL),
(133, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 09:20:36', NULL),
(134, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 09:20:37', NULL),
(135, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 09:20:38', NULL),
(136, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 09:22:25', NULL),
(137, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:03:26', NULL),
(138, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:04:01', NULL),
(139, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:07:30', NULL),
(140, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:08:05', NULL),
(141, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:08:27', NULL),
(142, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:09:57', NULL),
(143, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:12:01', NULL),
(144, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:13:17', NULL),
(145, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:19:06', NULL),
(146, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:21:33', NULL),
(147, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:24:30', NULL),
(148, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:24:57', NULL),
(149, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:26:17', NULL),
(150, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:26:39', NULL),
(151, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:27:24', NULL),
(152, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:27:30', NULL),
(153, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:27:45', NULL),
(154, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:27:49', NULL),
(155, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:27:52', NULL),
(156, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:28:00', NULL),
(157, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:28:04', NULL),
(158, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:28:22', NULL),
(159, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:28:26', NULL),
(160, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:29:53', NULL),
(161, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:29:58', NULL),
(162, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:30:44', NULL),
(163, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:30:47', NULL),
(164, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:30:55', NULL),
(165, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:31:29', NULL),
(166, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:31:33', NULL),
(167, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:31:36', NULL),
(168, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:31:46', NULL),
(169, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:31:52', NULL),
(170, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:31:55', NULL),
(171, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:32:01', NULL),
(172, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:32:08', NULL),
(173, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:32:33', NULL),
(174, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:36:03', NULL),
(175, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:36:10', NULL),
(176, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:36:12', NULL),
(177, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:36:14', NULL),
(178, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:36:15', NULL),
(179, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:36:16', NULL),
(180, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:36:17', NULL),
(181, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:36:49', NULL),
(182, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:36:55', NULL),
(183, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:37:00', NULL),
(184, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:37:03', NULL),
(185, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:37:17', NULL),
(186, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:44:32', NULL),
(187, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:47:13', NULL),
(188, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:47:17', NULL),
(189, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:47:29', NULL),
(190, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:48:09', NULL),
(191, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:48:17', NULL),
(192, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:48:42', NULL),
(193, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:49:21', NULL),
(194, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:49:26', NULL),
(195, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:49:29', NULL),
(196, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:49:45', NULL),
(197, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:49:49', NULL),
(198, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:49:56', NULL),
(199, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:49:59', NULL),
(200, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:50:06', NULL),
(201, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:50:10', NULL),
(202, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:50:27', NULL),
(203, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:50:30', NULL),
(204, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:50:35', NULL),
(205, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:50:50', NULL),
(206, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:50:54', NULL),
(207, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:50:58', NULL),
(208, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:52:44', NULL),
(209, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:52:49', NULL),
(210, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:53:06', NULL),
(211, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:53:19', NULL),
(212, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:53:26', NULL),
(213, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:53:54', NULL),
(214, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:54:30', NULL),
(215, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:54:35', NULL),
(216, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:54:42', NULL),
(217, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:54:48', NULL),
(218, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:54:51', NULL),
(219, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:56:06', NULL),
(220, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:56:12', NULL),
(221, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:56:16', NULL),
(222, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:56:19', NULL),
(223, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:56:49', NULL),
(224, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:56:55', NULL),
(225, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 10:57:00', NULL),
(226, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 11:01:48', NULL),
(227, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 11:01:56', NULL),
(228, 'Load User Collaboration Details', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 11:02:22', NULL),
(229, 'Load Collaboration Team', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 11:02:22', NULL),
(230, 'Load Collaboration Location', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 11:02:22', NULL),
(231, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 11:03:08', NULL),
(232, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 11:03:13', NULL),
(233, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 11:03:22', NULL),
(234, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 11:03:32', NULL),
(235, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 11:03:37', NULL),
(236, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 11:20:42', NULL),
(237, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 11:20:45', NULL),
(238, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 11:20:55', NULL),
(239, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 11:21:06', NULL),
(240, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 11:21:11', NULL),
(241, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 11:21:15', NULL),
(242, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 11:21:21', NULL),
(243, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 11:21:26', NULL),
(244, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 11:21:47', NULL),
(245, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 11:21:54', NULL),
(246, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 11:22:40', NULL),
(247, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 11:22:46', NULL),
(248, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 11:57:54', NULL),
(249, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 11:58:38', NULL),
(250, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:03:28', 7),
(251, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:25:56', 7),
(252, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:25:59', 7),
(253, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:26:04', 7),
(254, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:26:07', 7),
(255, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:26:11', 7),
(256, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:40:30', 7),
(257, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:40:41', 7),
(258, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:40:52', 7),
(259, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:41:34', 7),
(260, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:41:37', 7),
(261, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:41:47', 7),
(262, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:42:28', 7),
(263, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:42:31', 7);
INSERT INTO `UserRequests` (`UserRequestID`, `UserAction`, `UserAddress`, `UserBrowser`, `RequestTime`, `UserSessionID`) VALUES
(264, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:42:35', 7),
(265, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:42:45', 7),
(266, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:42:49', 7),
(267, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:43:08', 7),
(268, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:44:14', 7),
(269, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:45:10', 7),
(270, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:45:14', 7),
(271, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:45:21', 7),
(272, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:45:27', 7),
(273, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:45:35', 7),
(274, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:46:47', 7),
(275, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:46:50', 7),
(276, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:46:57', 7),
(277, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:47:00', 7),
(278, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:47:06', 7),
(279, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:47:15', 7),
(280, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:47:21', 7),
(281, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:47:24', 7),
(282, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:47:32', 7),
(283, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:47:40', 7),
(284, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:51:40', 7),
(285, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:51:44', 7),
(286, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:51:54', 7),
(287, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:53:15', 7),
(288, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:53:19', 7),
(289, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:53:48', 7),
(290, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:53:53', 7),
(291, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:58:15', 7),
(292, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:58:21', 7),
(293, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:58:27', 7),
(294, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:58:32', 7),
(295, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:58:46', NULL),
(296, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 12:58:51', NULL),
(297, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 13:07:40', 7),
(298, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 13:07:47', 7),
(299, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 13:07:51', 7),
(300, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 13:07:54', 7),
(301, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 13:08:05', 7),
(302, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 13:08:12', 7),
(303, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 13:08:15', 7),
(304, 'Load User Team Requests', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 13:12:31', 7),
(305, 'Load User Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 13:12:31', 7),
(306, 'Load User Collaboration Details', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 13:12:35', 7),
(307, 'Load Collaboration Team', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 13:12:35', 7),
(308, 'Load Collaboration Location', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 13:12:35', 7),
(309, 'Load Collaboration Team Requests', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 13:12:35', 7),
(310, 'Load Collaboration Location Requests', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 13:12:35', 7),
(311, 'Load User Collaboration Details', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 13:12:38', 7),
(312, 'Load Collaboration Location', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 13:12:38', 7),
(313, 'Load Collaboration Team', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 13:12:38', 7),
(314, 'Load Collaboration Team Requests', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 13:12:38', 7),
(315, 'Load Collaboration Location Requests', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 13:12:38', 7),
(316, 'Load User Collaboration Details', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 13:12:40', 7),
(317, 'Load Collaboration Team', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 13:12:40', 7),
(318, 'Load Collaboration Location', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 13:12:40', 7),
(319, 'Load Collaboration Team Requests', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 13:12:40', 7),
(320, 'Load Collaboration Location Requests', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 13:12:40', 7),
(321, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 13:12:52', 7),
(322, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 13:13:00', 7),
(323, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 21:52:26', 7),
(324, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 23:21:42', NULL),
(325, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 23:21:48', NULL),
(326, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 23:22:00', NULL),
(327, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 23:23:39', NULL),
(328, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 23:23:46', NULL),
(329, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 23:26:07', NULL),
(330, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 23:26:13', NULL),
(331, 'Failed Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 23:35:26', NULL),
(332, 'Failed Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 23:35:28', NULL),
(333, 'Failed Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 23:35:31', NULL),
(334, 'Failed Load User Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 23:35:36', NULL),
(335, 'Failed Load User Team Requests', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 23:35:36', NULL),
(336, 'Failed Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 23:35:43', NULL),
(337, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 23:36:22', NULL),
(338, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 23:36:25', NULL),
(339, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-10-30 23:36:28', NULL),
(340, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 04:06:39', NULL),
(341, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 04:06:43', NULL),
(342, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 04:07:00', NULL),
(343, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 04:07:52', NULL),
(344, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 04:07:55', NULL),
(345, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 04:12:38', 7),
(346, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 04:12:41', 7),
(347, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 04:12:44', 7),
(348, 'Submit Collaboration', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 04:52:30', 7),
(349, 'Submit Collaboration', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 04:56:53', 7),
(350, 'Submit Collaboration', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 04:56:58', 7),
(351, 'Submit Collaboration', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 05:06:01', 7),
(352, 'Submit Collaboration', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 05:06:07', 7),
(353, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 05:06:38', 7),
(354, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 06:23:16', 7),
(355, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 06:23:19', 7),
(356, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 06:23:22', 7),
(357, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 06:23:44', NULL),
(358, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 06:23:51', NULL),
(359, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 06:23:57', NULL),
(360, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 06:27:43', NULL),
(361, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 06:27:46', NULL),
(362, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 07:47:23', NULL),
(363, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 07:47:28', NULL),
(364, 'Register Account', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 08:10:16', NULL),
(365, 'Failed Register Account', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 08:10:19', NULL),
(366, 'Failed Register Account', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 08:10:22', NULL),
(367, 'Failed Register Account', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 08:10:54', NULL),
(368, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 10:00:52', 7),
(369, 'Load User Team Requests', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 10:01:13', 7),
(370, 'Load User Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 10:01:13', 7),
(371, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 10:01:17', 7),
(372, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 10:02:34', 7),
(373, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 10:48:13', 7),
(374, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 10:49:06', 7),
(375, 'Load User Team Requests', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 10:49:24', 7),
(376, 'Load User Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 10:49:24', 7),
(377, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 10:49:27', 7),
(378, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 10:49:33', 7),
(379, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 10:56:59', 7),
(380, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 13:23:03', NULL),
(381, 'Failed Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 13:25:00', NULL),
(382, 'Failed Load User Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 13:25:06', NULL),
(383, 'Failed Load User Team Requests', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 13:25:06', NULL),
(384, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 13:25:10', NULL),
(385, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 13:25:28', NULL),
(386, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 13:27:15', 7),
(387, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 13:30:22', 7),
(388, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 13:30:35', 7),
(389, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 13:38:44', 7),
(390, 'Load User Team Requests', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 13:38:53', 7),
(391, 'Load User Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 13:38:53', 7),
(392, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 13:39:48', 7),
(393, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 13:41:10', 7),
(394, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 13:41:38', 7),
(395, 'Load User Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 13:41:45', 7),
(396, 'Load User Team Requests', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 13:41:45', 7),
(397, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 13:41:48', 7),
(398, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 13:41:51', 7),
(399, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 13:41:58', 7),
(400, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 13:42:04', 7),
(401, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 13:49:54', 7),
(402, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 13:50:55', NULL),
(403, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 21:09:09', NULL),
(404, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 21:50:57', 7),
(405, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 21:54:40', 7),
(406, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 21:54:50', 7),
(407, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 21:55:02', 7),
(408, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 21:56:31', 7),
(409, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 22:05:03', 7),
(410, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 22:05:10', 7),
(411, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 22:05:47', 7),
(412, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 22:07:08', 7),
(413, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.111 Safari/537.36', '2020-11-03 22:07:13', 7),
(414, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 00:25:16', NULL),
(415, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 00:25:17', NULL),
(416, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 00:25:18', NULL),
(417, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 00:25:19', NULL),
(418, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 00:25:23', NULL),
(419, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 00:25:24', NULL),
(420, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 00:25:34', NULL),
(421, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 00:25:35', NULL),
(422, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 00:25:36', NULL),
(423, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 02:44:19', NULL),
(424, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 02:44:22', NULL),
(425, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 02:45:14', NULL),
(426, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 02:48:16', NULL),
(427, 'Failed Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 02:48:22', NULL),
(428, 'Failed Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 02:48:22', NULL),
(429, 'Failed Load User Team Requests', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 02:48:48', NULL),
(430, 'Failed Load User Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 02:48:48', NULL),
(431, 'Failed Load User Location Requests', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 02:48:48', NULL),
(432, 'Failed Load User Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 02:49:06', NULL),
(433, 'Failed Load User Team Requests', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 02:49:06', NULL),
(434, 'Failed Load User Location Requests', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 02:49:06', NULL),
(435, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 02:49:09', NULL),
(436, 'Failed Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 02:50:10', NULL),
(437, 'Failed Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 02:50:10', NULL),
(438, 'Failed Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 02:51:17', NULL),
(439, 'Failed Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 02:51:17', NULL),
(440, 'Failed Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 02:51:27', NULL),
(441, 'Failed Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 02:51:27', NULL),
(442, 'Failed Load User Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 02:51:28', NULL),
(443, 'Failed Load User Team Requests', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 02:51:28', NULL),
(444, 'Failed Load User Location Requests', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 02:51:28', NULL),
(445, 'Failed Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 02:52:20', NULL),
(446, 'Failed Load User Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 02:52:21', NULL),
(447, 'Failed Load User Team Requests', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 02:52:21', NULL),
(448, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 02:52:26', NULL),
(449, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 02:52:41', NULL),
(450, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 02:52:46', NULL),
(451, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 02:53:58', NULL),
(452, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 02:54:15', NULL),
(453, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 02:54:20', NULL),
(454, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 03:19:17', NULL),
(455, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 03:46:26', NULL),
(456, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 03:46:45', NULL),
(457, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 04:07:12', 7),
(458, 'Load User Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 04:07:13', 7),
(459, 'Load User Team Requests', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 04:07:13', 7),
(460, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 04:07:18', 7),
(461, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 04:07:21', 7),
(462, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 04:07:55', 7),
(463, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 04:09:34', 7),
(464, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 04:09:58', 7),
(465, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 04:10:01', 7),
(466, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 04:10:19', 7),
(467, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 04:10:35', 7),
(468, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 04:11:39', 7),
(469, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 04:11:43', 7),
(470, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 04:11:53', 7),
(471, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 04:12:19', 7),
(472, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 04:12:22', 7),
(473, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 04:12:37', 7),
(474, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 04:13:09', 7),
(475, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 04:22:15', NULL),
(476, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 04:22:30', NULL),
(477, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 04:23:30', 7),
(478, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 04:23:40', 7),
(479, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 04:58:07', 7),
(480, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 04:58:30', 7),
(481, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 04:58:35', 7),
(482, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 04:58:50', 7),
(483, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 04:58:59', 7),
(484, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 04:59:07', 7),
(485, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 04:59:14', 7),
(486, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 04:59:21', 7),
(487, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 04:59:24', 7),
(488, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 04:59:28', 7),
(489, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 04:59:34', 7),
(490, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 04:59:59', 7),
(491, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 05:00:03', 7),
(492, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 05:58:23', NULL),
(493, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 05:59:09', NULL),
(494, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 05:59:16', NULL),
(495, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 05:59:26', NULL),
(496, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 06:00:13', NULL),
(497, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 06:13:19', 7),
(498, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 06:14:35', 7),
(499, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 06:15:07', 7),
(500, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 06:15:45', 7),
(501, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 06:16:34', 7),
(502, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 06:16:38', 7),
(503, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 06:17:24', 7),
(504, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 06:17:30', 7),
(505, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 06:22:16', 7),
(506, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 06:25:35', 7),
(507, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 06:27:55', 7),
(508, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 06:29:02', 7),
(509, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 06:29:09', 7),
(510, 'Load User Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 06:29:15', 7),
(511, 'Load User Team Requests', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 06:29:15', 7),
(512, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 06:29:18', 7),
(513, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 06:41:05', 7),
(514, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 06:42:13', 7),
(515, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 06:43:26', 7),
(516, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 12:03:26', 7),
(517, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 12:03:30', 7),
(518, 'Load User Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 12:03:31', 7),
(519, 'Load User Team Requests', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 12:03:31', 7),
(520, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 12:03:35', 7),
(521, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 12:28:37', 7),
(522, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 12:31:18', 7),
(523, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 12:33:42', 7),
(524, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 12:35:03', 7),
(525, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 12:36:36', 7),
(526, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 12:37:23', 7),
(527, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 12:39:40', 7),
(528, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 12:41:34', 7);
INSERT INTO `UserRequests` (`UserRequestID`, `UserAction`, `UserAddress`, `UserBrowser`, `RequestTime`, `UserSessionID`) VALUES
(529, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 12:42:28', 7),
(530, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 12:43:31', 7),
(531, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 12:44:41', 7),
(532, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 12:45:12', 7),
(533, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 12:45:49', 7),
(534, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 12:46:23', 7),
(535, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 12:47:11', 7),
(536, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 12:49:31', 7),
(537, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 13:11:41', 7),
(538, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 13:12:46', 7),
(539, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 13:42:28', 7),
(540, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 13:43:22', 7),
(541, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 13:44:27', 7),
(542, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 13:44:34', 7),
(543, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 13:44:53', 7),
(544, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 13:45:47', 7),
(545, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 13:46:03', 7),
(546, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 13:46:11', 7),
(547, 'Load User Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 13:46:17', 7),
(548, 'Load User Team Requests', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 13:46:17', 7),
(549, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 13:46:22', 7),
(550, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 13:47:10', 7),
(551, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 13:47:14', 7),
(552, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 13:47:20', 7),
(553, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 14:13:53', 7),
(554, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 14:13:58', 7),
(555, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 14:15:14', 7),
(556, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 14:18:55', 7),
(557, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 14:19:01', 7),
(558, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 14:19:09', 7),
(559, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 14:19:16', 7),
(560, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 14:23:20', 7),
(561, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 14:23:24', 7),
(562, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 14:23:32', 7),
(563, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 14:26:17', 7),
(564, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 14:29:02', 7),
(565, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 14:30:29', 7),
(566, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 14:35:23', NULL),
(567, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 14:35:30', NULL),
(568, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 14:35:38', NULL),
(569, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 14:35:57', NULL),
(570, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 14:36:47', NULL),
(571, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 14:39:06', NULL),
(572, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 14:39:18', NULL),
(573, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 14:41:30', NULL),
(574, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 14:41:34', NULL),
(575, 'Load Profile', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 14:43:43', 7),
(576, 'Load User Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 14:43:46', 7),
(577, 'Load User Team Requests', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 14:43:46', 7),
(578, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 14:43:50', 7),
(579, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 14:43:54', 7),
(580, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 14:44:27', 7),
(581, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 14:44:33', 7),
(582, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 14:46:20', 7),
(583, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-04 14:46:58', 7),
(584, 'Browse Collaborations', '::1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.183 Safari/537.36', '2020-11-05 01:12:40', NULL),
(585, 'Failed Load Profile', '::1', 'Chrome', '2020-11-05 02:15:20', NULL),
(586, 'Failed Load User Team Requests', '::1', 'Chrome', '2020-11-05 02:15:24', NULL),
(587, 'Failed Load User Collaborations', '::1', 'Chrome', '2020-11-05 02:15:24', NULL),
(588, 'Failed Load Profile', '::1', 'Chrome', '2020-11-05 02:15:31', NULL),
(589, 'Browse Collaborations', '::1', 'Chrome', '2020-11-05 02:15:47', NULL),
(590, 'Browse Collaborations', '::1', 'Chrome', '2020-11-05 02:15:56', NULL),
(591, 'Browse Collaborations', '::1', 'Chrome', '2020-11-05 02:18:16', NULL),
(592, 'Browse Collaborations', '::1', 'Chrome', '2020-11-05 02:18:19', NULL),
(593, 'Browse Collaborations', '::1', 'Chrome', '2020-11-05 02:18:29', NULL),
(594, 'Browse Collaborations', '::1', 'Chrome', '2020-11-05 02:18:50', NULL),
(595, 'Browse Collaborations', '::1', 'Chrome', '2020-11-05 02:19:01', NULL),
(596, 'Browse Collaborations', '::1', 'Chrome', '2020-11-05 02:19:05', NULL),
(597, 'Browse Collaborations', '::1', 'Chrome', '2020-11-05 02:37:15', NULL),
(598, 'Browse Collaborations', '::1', 'Chrome', '2020-11-05 02:37:38', NULL),
(599, 'Browse Collaborations', '::1', 'Chrome', '2020-11-05 02:38:26', NULL),
(600, 'Browse Collaborations', '::1', 'Chrome', '2020-11-05 02:38:49', NULL),
(601, 'Browse Collaborations', '::1', 'Chrome', '2020-11-05 02:59:25', NULL),
(602, 'Browse Collaborations', '::1', 'Chrome', '2020-11-05 05:45:30', NULL),
(603, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 02:32:40', NULL),
(604, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 02:33:23', NULL),
(605, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 02:33:41', NULL),
(606, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 02:33:58', NULL),
(607, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 02:34:07', NULL),
(608, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 02:38:57', NULL),
(609, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 02:40:02', NULL),
(610, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 02:40:21', NULL),
(611, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 02:40:51', NULL),
(612, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 02:44:58', NULL),
(613, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 02:45:09', NULL),
(614, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 02:46:01', NULL),
(615, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 02:47:04', NULL),
(616, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 02:47:16', NULL),
(617, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 02:47:45', NULL),
(618, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 03:13:51', NULL),
(619, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 03:16:10', NULL),
(620, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 03:16:25', NULL),
(621, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 03:30:16', NULL),
(622, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 03:38:59', NULL),
(623, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 03:40:11', NULL),
(624, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 06:14:30', NULL),
(625, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 06:14:35', NULL),
(626, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 06:15:20', NULL),
(627, 'Browse Collaborations', '::1', 'Safari', '2020-11-06 08:04:38', NULL),
(628, 'Browse Collaborations', '::1', 'Safari', '2020-11-06 08:05:18', NULL),
(629, 'Browse Collaborations', '::1', 'Safari', '2020-11-06 08:06:02', NULL),
(630, 'Browse Collaborations', '::1', 'Safari', '2020-11-06 08:06:19', NULL),
(631, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 08:25:31', NULL),
(632, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 08:25:39', NULL),
(633, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 09:25:10', NULL),
(634, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 09:25:16', NULL),
(635, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 09:25:19', NULL),
(636, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 09:27:01', NULL),
(637, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 09:27:10', NULL),
(638, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 09:56:32', NULL),
(639, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 09:58:46', NULL),
(640, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 09:59:31', NULL),
(641, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 10:00:20', NULL),
(642, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 10:01:06', NULL),
(643, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 10:01:16', NULL),
(644, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 10:01:39', NULL),
(645, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 10:01:43', NULL),
(646, 'Browse Collaborations', '::1', 'Safari', '2020-11-06 10:04:12', NULL),
(647, 'Load Collaboration Team', '::1', 'Safari', '2020-11-06 10:04:26', NULL),
(648, 'Load Collaboration Location', '::1', 'Safari', '2020-11-06 10:04:26', NULL),
(649, 'Load User Collaboration Details', '::1', 'Safari', '2020-11-06 10:04:26', NULL),
(650, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 10:23:58', NULL),
(651, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 10:24:35', NULL),
(652, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 10:35:04', NULL),
(653, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 10:39:24', NULL),
(654, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 10:49:55', NULL),
(655, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 11:14:40', NULL),
(656, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 11:15:21', NULL),
(657, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 11:15:25', NULL),
(658, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 11:16:29', NULL),
(659, 'Browse Collaborations', '::1', 'Safari', '2020-11-06 11:23:04', NULL),
(660, 'Browse Collaborations', '::1', 'Safari', '2020-11-06 11:26:56', NULL),
(661, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 11:49:44', NULL),
(662, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 11:59:52', NULL),
(663, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 11:59:59', NULL),
(664, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 12:00:02', NULL),
(665, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 12:00:10', NULL),
(666, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 12:00:23', NULL),
(667, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 12:00:26', NULL),
(668, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 12:00:35', NULL),
(669, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 12:01:18', NULL),
(670, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 12:03:15', NULL),
(671, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 12:03:43', NULL),
(672, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 12:32:51', NULL),
(673, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 12:33:20', NULL),
(674, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 12:33:40', NULL),
(675, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 12:33:44', NULL),
(676, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 12:34:01', NULL),
(677, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 12:34:05', NULL),
(678, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 12:34:14', NULL),
(679, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 12:42:13', NULL),
(680, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 12:47:20', NULL),
(681, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 12:48:29', NULL),
(682, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 12:49:03', NULL),
(683, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 12:49:12', NULL),
(684, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 12:49:16', NULL),
(685, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 12:49:22', NULL),
(686, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 12:59:59', NULL),
(687, 'Browse Collaborations', '::1', 'Chrome', '2020-11-06 22:36:03', NULL),
(688, 'Browse Collaborations', '::1', 'Safari', '2020-11-06 22:36:36', NULL),
(689, 'Browse Collaborations', '::1', 'Safari', '2020-11-06 22:37:22', NULL);

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
  MODIFY `CollaborationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `Location`
--
ALTER TABLE `Location`
  MODIFY `LocationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `LocationRequest`
--
ALTER TABLE `LocationRequest`
  MODIFY `LocationRequestID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `LocationSearch`
--
ALTER TABLE `LocationSearch`
  MODIFY `LocationSearchID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `Login`
--
ALTER TABLE `Login`
  MODIFY `LoginID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `TeamMember`
--
ALTER TABLE `TeamMember`
  MODIFY `TeamMemberID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `TeamMemberRequest`
--
ALTER TABLE `TeamMemberRequest`
  MODIFY `TeamMemberRequestID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `TeamMemberSearch`
--
ALTER TABLE `TeamMemberSearch`
  MODIFY `TeamMemberSearchID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `User`
--
ALTER TABLE `User`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `UserRequests`
--
ALTER TABLE `UserRequests`
  MODIFY `UserRequestID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=690;

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
