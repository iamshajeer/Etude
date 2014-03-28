-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.1.40-community


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema library
--

CREATE DATABASE IF NOT EXISTS library;
USE library;

--
-- Definition of table `biotechpatron`
--

DROP TABLE IF EXISTS `biotechpatron`;
CREATE TABLE `biotechpatron` (
  `uid` varchar(15) NOT NULL,
  `uname` varchar(30) DEFAULT NULL,
  `dob` varchar(20) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `place` varchar(30) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `doj` varchar(20) DEFAULT NULL,
  `batch` varchar(15) DEFAULT NULL,
  `rollnumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `biotechpatron`
--

/*!40000 ALTER TABLE `biotechpatron` DISABLE KEYS */;
INSERT INTO `biotechpatron` (`uid`,`uname`,`dob`,`address`,`place`,`pincode`,`phone`,`email`,`doj`,`batch`,`rollnumber`) VALUES 
 ('102','sreejith','26-01-1991','km h','manjeri',676509,9809856484,'info4shajeer@gmail.com','23-01-2011','2011-14',90);
/*!40000 ALTER TABLE `biotechpatron` ENABLE KEYS */;


--
-- Definition of table `btechpatron`
--

DROP TABLE IF EXISTS `btechpatron`;
CREATE TABLE `btechpatron` (
  `uid` varchar(15) NOT NULL,
  `uname` varchar(30) DEFAULT NULL,
  `dob` varchar(20) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `place` varchar(30) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `doj` varchar(20) DEFAULT NULL,
  `batch` varchar(15) DEFAULT NULL,
  `rollnumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `btechpatron`
--

/*!40000 ALTER TABLE `btechpatron` DISABLE KEYS */;
INSERT INTO `btechpatron` (`uid`,`uname`,`dob`,`address`,`place`,`pincode`,`phone`,`email`,`doj`,`batch`,`rollnumber`) VALUES 
 ('103','suhail','26-01-1993','kpp ','calicut',654427,9809856484,'iamshajeer@yahoo.com','','',41);
/*!40000 ALTER TABLE `btechpatron` ENABLE KEYS */;


--
-- Definition of table `department`
--

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `dptid` varchar(15) NOT NULL,
  `dptname` varchar(30) DEFAULT NULL,
  `lname` varchar(35) DEFAULT NULL,
  `lid` varchar(15) DEFAULT NULL,
  `lpassword` varchar(35) DEFAULT NULL,
  `lnumber` bigint(20) DEFAULT NULL,
  `laddress` varchar(150) DEFAULT NULL,
  `lmail` varchar(100) DEFAULT NULL,
  `lplace` varchar(50) DEFAULT NULL,
  `lpin` int(11) DEFAULT NULL,
  PRIMARY KEY (`dptid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` (`dptid`,`dptname`,`lname`,`lid`,`lpassword`,`lnumber`,`laddress`,`lmail`,`lplace`,`lpin`) VALUES 
 ('mca100','Mca','shajeerkpahamed','shajeer','sha123',9809856484,'kp h','iamshajeer@gmail.com','manjeri',676509);
/*!40000 ALTER TABLE `department` ENABLE KEYS */;


--
-- Definition of table `mbapatron`
--

DROP TABLE IF EXISTS `mbapatron`;
CREATE TABLE `mbapatron` (
  `uid` varchar(15) NOT NULL,
  `uname` varchar(30) DEFAULT NULL,
  `dob` varchar(20) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `place` varchar(30) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `doj` varchar(20) DEFAULT NULL,
  `batch` varchar(15) DEFAULT NULL,
  `rollnumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mbapatron`
--

/*!40000 ALTER TABLE `mbapatron` DISABLE KEYS */;
INSERT INTO `mbapatron` (`uid`,`uname`,`dob`,`address`,`place`,`pincode`,`phone`,`email`,`doj`,`batch`,`rollnumber`) VALUES 
 ('101','vipin','87878','k h','manjeri',676598,87878,'iamshajeer@yahoo.com','23-01-2011','2011-14',23);
/*!40000 ALTER TABLE `mbapatron` ENABLE KEYS */;


--
-- Definition of table `mcapatron`
--

DROP TABLE IF EXISTS `mcapatron`;
CREATE TABLE `mcapatron` (
  `uid` varchar(15) NOT NULL,
  `uname` varchar(30) DEFAULT NULL,
  `dob` varchar(20) DEFAULT NULL,
  `address` varchar(150) DEFAULT NULL,
  `place` varchar(30) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `doj` varchar(20) DEFAULT NULL,
  `batch` varchar(15) DEFAULT NULL,
  `rollnumber` int(11) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mcapatron`
--

/*!40000 ALTER TABLE `mcapatron` DISABLE KEYS */;
INSERT INTO `mcapatron` (`uid`,`uname`,`dob`,`address`,`place`,`pincode`,`phone`,`email`,`doj`,`batch`,`rollnumber`) VALUES 
 ('101','shaj','26-01-1991','kp h','malappuram',676509,9809856484,'iamshajeer@yahoo.com','23-01-2011','2011-14',42);
/*!40000 ALTER TABLE `mcapatron` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
