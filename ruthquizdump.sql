-- MySQL dump 10.10
--
-- Host: localhost    Database: onlinequiz
-- ------------------------------------------------------
-- Server version	5.0.27-community-nt

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `algos`
--

DROP TABLE IF EXISTS `algos`;
CREATE TABLE `algos` (
  `question_id` varchar(10) NOT NULL,
  PRIMARY KEY  (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `algos`
--

LOCK TABLES `algos` WRITE;
/*!40000 ALTER TABLE `algos` DISABLE KEYS */;
INSERT INTO `algos` VALUES ('qu001');
/*!40000 ALTER TABLE `algos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allquizzes`
--

DROP TABLE IF EXISTS `allquizzes`;
CREATE TABLE `allquizzes` (
  `quiz_name` varchar(20) NOT NULL,
  PRIMARY KEY  (`quiz_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `allquizzes`
--

LOCK TABLES `allquizzes` WRITE;
/*!40000 ALTER TABLE `allquizzes` DISABLE KEYS */;
INSERT INTO `allquizzes` VALUES ('algos'),('C_basics'),('C_extended'),('Database'),('Database_basics'),('Db'),('Java_basics'),('Java_extended'),('WebQuiz');
/*!40000 ALTER TABLE `allquizzes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_basics`
--

DROP TABLE IF EXISTS `c_basics`;
CREATE TABLE `c_basics` (
  `question_id` varchar(10) NOT NULL,
  PRIMARY KEY  (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `c_basics`
--

LOCK TABLES `c_basics` WRITE;
/*!40000 ALTER TABLE `c_basics` DISABLE KEYS */;
INSERT INTO `c_basics` VALUES ('q003'),('q004');
/*!40000 ALTER TABLE `c_basics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `c_extended`
--

DROP TABLE IF EXISTS `c_extended`;
CREATE TABLE `c_extended` (
  `question_id` varchar(10) NOT NULL,
  PRIMARY KEY  (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `c_extended`
--

LOCK TABLES `c_extended` WRITE;
/*!40000 ALTER TABLE `c_extended` DISABLE KEYS */;
/*!40000 ALTER TABLE `c_extended` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `course_id` varchar(20) NOT NULL default '',
  `course_name` varchar(30) default NULL,
  PRIMARY KEY  (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('c001','C'),('c002','C++'),('c003','Java'),('c004','WEB PROGRAMMING');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `database_basics`
--

DROP TABLE IF EXISTS `database_basics`;
CREATE TABLE `database_basics` (
  `question_id` varchar(10) NOT NULL,
  PRIMARY KEY  (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `database_basics`
--

LOCK TABLES `database_basics` WRITE;
/*!40000 ALTER TABLE `database_basics` DISABLE KEYS */;
INSERT INTO `database_basics` VALUES ('q003'),('q004'),('qu001'),('qu002');
/*!40000 ALTER TABLE `database_basics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db`
--

DROP TABLE IF EXISTS `db`;
CREATE TABLE `db` (
  `question_id` varchar(10) NOT NULL,
  PRIMARY KEY  (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `db`
--

LOCK TABLES `db` WRITE;
/*!40000 ALTER TABLE `db` DISABLE KEYS */;
INSERT INTO `db` VALUES ('q003'),('q004'),('qu001');
/*!40000 ALTER TABLE `db` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `java_basics`
--

DROP TABLE IF EXISTS `java_basics`;
CREATE TABLE `java_basics` (
  `question_id` varchar(10) NOT NULL,
  PRIMARY KEY  (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `java_basics`
--

LOCK TABLES `java_basics` WRITE;
/*!40000 ALTER TABLE `java_basics` DISABLE KEYS */;
INSERT INTO `java_basics` VALUES ('qu001');
/*!40000 ALTER TABLE `java_basics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `java_extended`
--

DROP TABLE IF EXISTS `java_extended`;
CREATE TABLE `java_extended` (
  `question_id` varchar(10) NOT NULL,
  PRIMARY KEY  (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `java_extended`
--

LOCK TABLES `java_extended` WRITE;
/*!40000 ALTER TABLE `java_extended` DISABLE KEYS */;
INSERT INTO `java_extended` VALUES ('qu001');
/*!40000 ALTER TABLE `java_extended` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `uname` varchar(20) NOT NULL,
  `password` varchar(20) default NULL,
  PRIMARY KEY  (`uname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logindetails`
--

DROP TABLE IF EXISTS `logindetails`;
CREATE TABLE `logindetails` (
  `uname` varchar(20) NOT NULL,
  `password` varchar(20) default NULL,
  PRIMARY KEY  (`uname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logindetails`
--

LOCK TABLES `logindetails` WRITE;
/*!40000 ALTER TABLE `logindetails` DISABLE KEYS */;
INSERT INTO `logindetails` VALUES ('dinesh','M@gna123'),('ruthmercy','M@gna123');
/*!40000 ALTER TABLE `logindetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `question_id` varchar(20) NOT NULL,
  `subject` varchar(50) default NULL,
  `question` varchar(300) default NULL,
  `options` varchar(300) default NULL,
  `answer` varchar(20) default NULL,
  PRIMARY KEY  (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES ('q003','C-basics','Who invented C?\r\n\r\n','a)Charles Babbage~\r\nb)James Miller~\r\nc)Issac Newton~\r\nd)Dennis Richie~\r\n\r\n','d'),('q004','C-basics','Which of the following is not a conditional statement?\r\n\r\n','a)if~\r\nb)for~\r\nc)while~\r\nd) do while~\r\n\r\n','b'),('qu001','oops','which of the following does not contain oop?\r\n\r\n','a)C++~\r\nb)C#~\r\nc)Java~\r\nd)C~\r\n\r\n','d'),('qu002','pointers','How to fetch the address of a variable?\r\n\r\n','a)&~\r\nb)*~\r\nc)@~\r\nd)#~\r\n\r\n','a'),('qu005','web_basics','What is an ISP?','a)Internet System Protocol~\r\nb)Internal System Program~\r\nc)Internet Service Provider~\r\nd)None of the above~','c'),('qu006','web_basics','Which of the following are commonly found on web pages?','a)internet~\r\nb)hyperlinks~\r\nc)intranet~\r\nd)all of the above~','b'),('qu007','web_basics','Which is not a domain name extension?','a).mil~\r\nb).org~\r\nc).int~\r\nd).com~','c'),('qu008','web_basics','What do I need to get on to the internet?','a)Computer~\r\nb)Modem~\r\nc)Browser~\r\nd)all of the above~','d'),('qu009','web_basics','What is internet Explorer?','a)An Icon~\r\nb)A file manager~\r\nc)A browser~\r\nd)The Internet~','c'),('qu010','web_basics','Which of the following is used to explore the internet?','a)Browser~\r\nb)SpreadSheet~\r\nc)Clipboard~\r\nd)Draw~','a');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
CREATE TABLE `quiz` (
  `course_id` varchar(20) default NULL,
  `quiz_id` varchar(20) NOT NULL default '',
  `quiz_name` varchar(20) default NULL,
  `start_time` time default NULL,
  `end_time` time default NULL,
  `date` date default NULL,
  PRIMARY KEY  (`quiz_id`),
  KEY `course_id` (`course_id`),
  CONSTRAINT `quiz_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
INSERT INTO `quiz` VALUES ('c001','q001','C_basics','01:00:00','02:00:00','2015-03-17'),('c001','q002','Java_basics','01:00:00','02:00:00','2015-03-17'),('c001','q003','C_extended','13:00:00','14:00:00','2015-03-18'),('c001','q004','Java_extended','15:00:00','16:00:00','2015-03-17'),('c001','q005','Database','01:00:00','14:00:00','2015-03-18'),('c002','q006','Database_basics','13:00:00','14:00:00','2015-03-21'),('c003','q007','Db','13:00:00','14:00:00','2015-03-23'),('c003','q008','algos','13:00:00','14:00:00','2015-03-25'),('c004','q009','WebQuiz','15:00:00','16:00:00','2015-03-27');
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `firstname` varchar(20) default NULL,
  `lastname` varchar(20) default NULL,
  `uname` varchar(20) NOT NULL default '',
  `password` varchar(20) default NULL,
  `cpassword` varchar(20) default NULL,
  `emailid` varchar(30) default NULL,
  `dob` date default NULL,
  `phno` decimal(30,0) default NULL,
  `gender` varchar(10) default NULL,
  `address` varchar(200) default NULL,
  PRIMARY KEY  (`uname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('Madigani   ','kavya','jntuh-02','qwerty','qwerty','kavya@gmail.com','2014-10-14','9874563214','female','hyd\r\n\r\n\r\n\r\n\r\n\r\n\r\n'),('guntupalli  ','durga','jntuh-03','qwerty','qwerty','durga@gmail.com','1992-05-29','9000611169','female','vsp\r\n'),('akula  ','vinay','jntuh-04','qwerty','qwerty','vinay@gmail.com','2014-10-23','8741259632','male','suryapet\r\n\r\n\r\n\r\n\r\n'),('Gara','Sheetal','sheetalg','M@gna123','M@gna123','sheetalg@gmail.com','2015-04-19','9703151534','female','connecticut\r\n'),('suryanarayana ','gollapalli','suryanarayana','M@gna123','M@gna123','ngsurya@gmail.com','1964-08-24','9052286954','male','madinaguda,Hyderabad\r\n\r\n\r\n');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webquiz`
--

DROP TABLE IF EXISTS `webquiz`;
CREATE TABLE `webquiz` (
  `question_id` varchar(10) NOT NULL,
  PRIMARY KEY  (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `webquiz`
--

LOCK TABLES `webquiz` WRITE;
/*!40000 ALTER TABLE `webquiz` DISABLE KEYS */;
INSERT INTO `webquiz` VALUES ('qu005'),('qu006'),('qu007'),('qu008'),('qu009'),('qu010');
/*!40000 ALTER TABLE `webquiz` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-30  2:48:30
