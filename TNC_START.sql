-- phpMyAdmin SQL Dump
-- version 3.4.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 09, 2012 at 07:31 AM
-- Server version: 5.5.16
-- PHP Version: 5.3.8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `TNC_START`
--

-- --------------------------------------------------------

--
-- Table structure for table `Address`
--

CREATE TABLE IF NOT EXISTS `Address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Country` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `street` varchar(20) NOT NULL,
  `add_last_updated` datetime NOT NULL,
  `last_inserted` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `user_id_2` (`user_id`),
  KEY `user_id_3` (`user_id`),
  KEY `user_id_4` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Phone_numbers`
--

CREATE TABLE IF NOT EXISTS `Phone_numbers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number_type` varchar(10) DEFAULT NULL,
  `number` varchar(10) DEFAULT NULL,
  `last_update` datetime NOT NULL,
  `last_inserted` date NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Profiles`
--

CREATE TABLE IF NOT EXISTS `Profiles` (
  `last_inserted` datetime NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `DOD` varchar(10) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `marital_status` varchar(20) NOT NULL,
  `profession` varchar(50) NOT NULL,
  `last_updated` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE IF NOT EXISTS `skill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skill_name` varchar(20) NOT NULL,
  `last_updated` datetime NOT NULL,
  `last_created` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `skill_name` (`skill_name`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE IF NOT EXISTS `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(38) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `last_inserted` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`id`, `username`, `email`, `password`, `last_inserted`, `last_updated`) VALUES
(1, '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `User_skill`
--

CREATE TABLE IF NOT EXISTS `User_skill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  `last_update` datetime NOT NULL,
  `last_inserted` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `skill_id` (`skill_id`),
  KEY `user_id_2` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Address`
--
ALTER TABLE `Address`
  ADD CONSTRAINT `Address_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`);

--
-- Constraints for table `Phone_numbers`
--
ALTER TABLE `Phone_numbers`
  ADD CONSTRAINT `Phone_numbers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`);

--
-- Constraints for table `Profiles`
--
ALTER TABLE `Profiles`
  ADD CONSTRAINT `Profiles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`);

--
-- Constraints for table `skill`
--
ALTER TABLE `skill`
  ADD CONSTRAINT `skill_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`);

--
-- Constraints for table `User_skill`
--
ALTER TABLE `User_skill`
  ADD CONSTRAINT `User_skill_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
