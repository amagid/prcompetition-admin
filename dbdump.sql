-- MySQL dump 10.13  Distrib 5.7.16, for Win64 (x86_64)
--
-- Host: localhost    Database: prcompetition
-- ------------------------------------------------------
-- Server version	5.7.16-log

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
-- Table structure for table `ad_types`
--

DROP TABLE IF EXISTS `ad_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_types` (
  `ad_type` varchar(64) NOT NULL,
  `multiplier` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`ad_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_types`
--

LOCK TABLES `ad_types` WRITE;
/*!40000 ALTER TABLE `ad_types` DISABLE KEYS */;
INSERT INTO `ad_types` VALUES ('1/2 Page',3,'2017-02-27 06:27:56','2017-02-27 06:27:56',NULL),('1/4 Page',2,'2017-02-27 06:27:45','2017-02-27 06:27:45',NULL),('Back Cover',8,'2017-02-27 06:45:23','2017-02-27 06:45:23',NULL),('Full Page',5,'2017-02-27 06:28:10','2017-02-27 06:28:10',NULL),('Inside Back Cover',7,'2017-02-27 06:45:23','2017-02-27 06:45:23',NULL),('Inside Front Cover',7,'2017-02-27 06:28:29','2017-02-27 06:28:29',NULL);
/*!40000 ALTER TABLE `ad_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `additional_points`
--

DROP TABLE IF EXISTS `additional_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `additional_points` (
  `title` varchar(64) NOT NULL,
  `description` varchar(128) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `value` smallint(6) NOT NULL,
  `recipient` varchar(8) NOT NULL,
  `event` varchar(64) DEFAULT NULL,
  `semester` enum('spring','fall') NOT NULL,
  `year` smallint(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`title`),
  KEY `recipient` (`recipient`),
  KEY `event` (`event`,`semester`,`year`),
  CONSTRAINT `additional_points_ibfk_1` FOREIGN KEY (`recipient`) REFERENCES `participants` (`caseid`),
  CONSTRAINT `additional_points_ibfk_2` FOREIGN KEY (`event`, `semester`, `year`) REFERENCES `events` (`event`, `semester`, `year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `additional_points`
--

LOCK TABLES `additional_points` WRITE;
/*!40000 ALTER TABLE `additional_points` DISABLE KEYS */;
INSERT INTO `additional_points` VALUES ('Resized Miscast Cabaret Graphic for Website','Resized the Miscast graphic that he designed from FB cover photo-size to website carousel-size.','2017-02-15 01:36:00',10,'ztp3','Miscast Cabaret','spring',2017,'2017-02-15 19:42:17','2017-02-15 19:42:17',NULL);
/*!40000 ALTER TABLE `additional_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `advertisements`
--

DROP TABLE IF EXISTS `advertisements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `advertisements` (
  `buyer` varchar(64) NOT NULL,
  `event` varchar(64) NOT NULL,
  `semester` enum('spring','fall') NOT NULL,
  `year` smallint(6) NOT NULL,
  `creator` varchar(8) DEFAULT NULL,
  `comment` varchar(128) DEFAULT NULL,
  `interest` tinyint(1) DEFAULT NULL,
  `received` tinyint(1) DEFAULT NULL,
  `paid` tinyint(1) DEFAULT NULL,
  `initial_contact_date` datetime DEFAULT NULL,
  `last_contact_date` datetime DEFAULT NULL,
  `seller` varchar(8) DEFAULT NULL,
  `ad_type` varchar(64) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `buyer_type` enum('business','university organization','student organization') DEFAULT NULL,
  PRIMARY KEY (`buyer`,`event`,`semester`,`year`),
  KEY `event` (`event`,`semester`,`year`),
  KEY `creator` (`creator`),
  KEY `seller` (`seller`),
  KEY `ad_type` (`ad_type`),
  CONSTRAINT `advertisements_ibfk_1` FOREIGN KEY (`event`, `semester`, `year`) REFERENCES `events` (`event`, `semester`, `year`),
  CONSTRAINT `advertisements_ibfk_2` FOREIGN KEY (`creator`) REFERENCES `participants` (`caseid`),
  CONSTRAINT `advertisements_ibfk_3` FOREIGN KEY (`seller`) REFERENCES `participants` (`caseid`),
  CONSTRAINT `advertisements_ibfk_4` FOREIGN KEY (`ad_type`) REFERENCES `ad_types` (`ad_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertisements`
--

LOCK TABLES `advertisements` WRITE;
/*!40000 ALTER TABLE `advertisements` DISABLE KEYS */;
/*!40000 ALTER TABLE `advertisements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance` (
  `participant` varchar(8) NOT NULL,
  `opportunity` varchar(64) NOT NULL,
  `event` varchar(64) DEFAULT NULL,
  `semester` enum('spring','fall') NOT NULL,
  `year` smallint(6) NOT NULL,
  `date` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `comment` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`participant`,`opportunity`),
  KEY `opportunity` (`opportunity`),
  KEY `attendance_ibfk_2` (`opportunity`,`event`,`semester`,`year`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`participant`) REFERENCES `participants` (`caseid`),
  CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`opportunity`, `event`, `semester`, `year`) REFERENCES `opportunities` (`opportunity`, `event`, `semester`, `year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES ('aem99','Chalking for LB Auditions','Legally Blonde','spring',2017,'2017-01-18 19:00:00','2017-02-08 18:07:48','2017-02-08 18:07:48',NULL,NULL),('aem99','PR Committee Meeting 2/26/17','Legally Blonde','spring',2017,'2017-02-26 19:00:00','2017-02-27 05:48:43','2017-02-27 05:48:43',NULL,NULL),('alm170','PR Committee Meeting 2/26/17','Legally Blonde','spring',2017,'2017-02-26 19:00:00','2017-02-27 05:49:12','2017-02-27 05:49:12',NULL,NULL),('bxl353','Chalking for LB Auditions','Legally Blonde','spring',2017,'2017-01-18 19:00:00','2017-02-08 18:07:52','2017-02-08 18:07:52',NULL,NULL),('bxl353','PR Committee Meeting 2/26/17','Legally Blonde','spring',2017,'2017-02-26 19:00:00','2017-02-27 05:49:06','2017-02-27 05:49:06',NULL,NULL),('hec42','PR Committee Meeting 2/26/17','Legally Blonde','spring',2017,'2017-02-26 19:00:00','2017-02-27 05:48:58','2017-02-27 05:48:58',NULL,NULL),('hec42','Pseudo-PR Committee Meeting 2/5/17','Legally Blonde','spring',2017,'2017-02-05 20:00:00','2017-02-08 18:05:52','2017-02-08 18:05:52',NULL,NULL),('jlm246','Pseudo-PR Committee Meeting 2/5/17','Legally Blonde','spring',2017,'2017-02-05 20:00:00','2017-02-08 18:05:57','2017-02-08 18:05:57',NULL,NULL),('meg135','PR Committee Meeting 2/26/17','Legally Blonde','spring',2017,'2017-02-26 19:00:00','2017-02-27 05:49:02','2017-02-27 05:49:02',NULL,NULL),('mhy8','Pseudo-PR Committee Meeting 2/5/17','Legally Blonde','spring',2017,'2017-02-05 20:00:00','2017-02-08 18:06:02','2017-02-08 18:06:02',NULL,NULL),('mjb304','Chalking for LB Auditions','Legally Blonde','spring',2017,'2017-01-18 19:00:00','2017-02-08 18:07:57','2017-02-08 18:07:57',NULL,NULL),('mmr103','Chalking for LB Auditions','Legally Blonde','spring',2017,'2017-01-18 19:00:00','2017-02-08 18:08:01','2017-02-08 18:08:01',NULL,NULL),('mxl624','Pseudo-PR Committee Meeting 2/5/17','Legally Blonde','spring',2017,'2017-02-05 20:00:00','2017-02-08 18:06:07','2017-02-08 18:06:07',NULL,NULL),('nac71','PR Committee Meeting 2/26/17','Legally Blonde','spring',2017,'2017-02-26 19:00:00','2017-02-27 05:48:54','2017-02-27 05:48:54',NULL,NULL),('pmm93','Pseudo-PR Committee Meeting 2/5/17','Legally Blonde','spring',2017,'2017-02-05 20:00:00','2017-02-08 18:06:12','2017-02-08 18:06:12',NULL,NULL),('rap157','Pseudo-PR Committee Meeting 2/5/17','Legally Blonde','spring',2017,'2017-02-05 20:00:00','2017-02-08 18:06:15','2017-02-08 18:06:15',NULL,NULL),('tps45','Pseudo-PR Committee Meeting 2/5/17','Legally Blonde','spring',2017,'2017-02-05 20:00:00','2017-02-08 18:06:19','2017-02-08 18:06:19',NULL,NULL),('ztp3','PR Committee Meeting 2/26/17','Legally Blonde','spring',2017,'2017-02-26 19:00:00','2017-02-27 05:48:49','2017-02-27 05:48:49',NULL,NULL);
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `content` varchar(64) NOT NULL,
  `multiplier` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`content`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES ('Rehearsal - Acting',1,'2017-02-15 18:52:37','2017-02-15 18:52:37',NULL),('Rehearsal - Choreo',1,'2017-02-15 18:52:47','2017-02-15 18:52:47',NULL),('Rehearsal - Staff',1,'2017-02-15 18:52:29','2017-02-15 18:52:29',NULL),('Rehearsal - Vocals',1,'2017-02-08 18:15:43','2017-02-08 18:15:43',NULL),('Unique',1,'2017-04-22 00:28:04','2017-04-22 00:28:04',NULL);
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `event` varchar(64) NOT NULL,
  `semester` enum('spring','fall') NOT NULL,
  `year` smallint(6) NOT NULL,
  `multiplier` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`event`,`semester`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES ('Legally Blonde','spring',2017,1,'2017-03-06 03:01:38','2017-03-06 03:01:38',NULL),('Misc','spring',2017,1,'2017-02-15 19:17:20','2017-02-15 19:17:20',NULL),('Miscast Cabaret','spring',2017,1,'2017-02-15 19:00:50','2017-02-15 19:00:50',NULL);
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_types`
--

DROP TABLE IF EXISTS `file_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_types` (
  `file_type` varchar(64) NOT NULL,
  `value` smallint(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`file_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_types`
--

LOCK TABLES `file_types` WRITE;
/*!40000 ALTER TABLE `file_types` DISABLE KEYS */;
INSERT INTO `file_types` VALUES ('Graphics - External',20,'2017-02-15 19:13:12','2017-02-15 19:13:12',NULL),('Graphics - Internal',60,'2017-02-15 19:13:55','2017-02-15 19:13:55',NULL),('Photos',20,'2017-02-08 18:22:10','2017-02-08 18:22:10',NULL),('Videos',50,'2017-02-08 18:23:09','2017-02-08 18:23:09',NULL);
/*!40000 ALTER TABLE `file_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunities`
--

DROP TABLE IF EXISTS `opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opportunities` (
  `opportunity` varchar(64) NOT NULL,
  `value` smallint(6) NOT NULL,
  `date` datetime NOT NULL,
  `description` varchar(128) DEFAULT NULL,
  `event` varchar(64) NOT NULL,
  `semester` enum('spring','fall') NOT NULL,
  `year` smallint(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`opportunity`,`event`,`semester`,`year`),
  KEY `event` (`event`,`semester`,`year`),
  CONSTRAINT `opportunities_ibfk_1` FOREIGN KEY (`event`, `semester`, `year`) REFERENCES `events` (`event`, `semester`, `year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunities`
--

LOCK TABLES `opportunities` WRITE;
/*!40000 ALTER TABLE `opportunities` DISABLE KEYS */;
INSERT INTO `opportunities` VALUES ('Chalking for LB Auditions',100,'2017-01-18 19:00:00','8 in attendance, RSVPify worked well.','Legally Blonde','spring',2017,'2017-02-08 17:58:31','2017-02-08 17:58:31',NULL),('PR Committee Meeting 2/26/17',150,'2017-02-26 19:00:00','Scheduled PR Committee meeting #1.','Legally Blonde','spring',2017,'2017-02-27 05:45:55','2017-02-27 05:45:55',NULL),('Pseudo-PR Committee Meeting 2/5/17',75,'2017-02-05 20:00:00','Exec meeting / hangout turned into PR meeting. Half value because it was unannounced.','Legally Blonde','spring',2017,'2017-02-08 17:54:14','2017-02-08 17:54:14',NULL);
/*!40000 ALTER TABLE `opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participants`
--

DROP TABLE IF EXISTS `participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participants` (
  `caseid` varchar(8) NOT NULL,
  `name` varchar(64) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`caseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participants`
--

LOCK TABLES `participants` WRITE;
/*!40000 ALTER TABLE `participants` DISABLE KEYS */;
INSERT INTO `participants` VALUES ('aap110','Lexi Polykarpov',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('aem99','Angelina Masetta',250,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('ajw177','Ann Wang',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('alm170','Alex Meltsner',510,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('alo30','Andy Ogrinc',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('ama238','Anna Ashley',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('amr187','Amanda Rulis',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('anr41','Ashley Roberson',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('asc122','Annika Chura',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('azm3','Aaron Mann',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('bam133','Brandon McCourt',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('bfs22','Brittany Stern',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('bgs27','Brice Smith',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('bxl353','Briana Litchholt',250,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('cac211','Courtney Capra',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('cml155','Casey Lockridge',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('cxd283','Cindy Dong',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('dpo21','Devin Ohlson',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('ebs55','Ethan Smilg',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('erb77','Bessie Bulman',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('erm91','Beth McKay',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('exb324','Evelyn Bravo',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('fih5','Frances Harrison',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('hec42','Harper Case',225,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('jab318','Julia Bianco',720,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('jer135','Jonah Roth',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('jfo26','Jonathan O\'Brien',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('jlm246','Jenn Miller',75,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('jmd269','Jessica Dickson',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('jrb228','Jack Boatman',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('jrp161','Julia Pilla',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('jso33','Jack O\'Brien',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('jtr76','Jackson Routhier',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('kaw115','Keifer Wiley',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('kmc177','Katrina Claflin',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('kms283','Kristal Scott',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('krd37','Keith Dona',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('kwk24','Kevin Kwock',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('lcn12','Leah Neustadt',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('lgt7','Logan Trask',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('ljm107','Laura Mosteller',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('lmg85','Lily Gould',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('mbg63','Merit Glover',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('mdf63','Morgan Fox',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('meg135','Mara Grigg',390,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('mhm62','Maggie McClarren',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('mhr35','Malcolm Reitmeyer',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('mhy8','Maddy Yankell',75,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('min9','Melissa Nakazawa',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('mjb292','Michelle Berg',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('mjb304','Madi Burhenn',100,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('mjk211','Margaret Kowalski',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('mmh146','Madison Hillyard',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('mmr103','Michelle Rackish',100,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('mrp101','Molly Pfefferkorn',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('mrs246','Mary Schroeder',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('mxl624','Alice Li',75,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('mxn257','Morihisa Nagai',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('nac71','Nick Charles',150,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('nme17','Natalie El Dabh',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('pmm93','Paulina Martz',75,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('pmy8','Paige Yepko',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('raa116','Rachel Arvizu',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('rap157','Rich Pannullo',75,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('rdt44','Reno Tarquinio',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('rej41','Ruth Johnson',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('rfd27','Beca Dennis',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('rjb223','Roland Baumann',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('rtr29','Ryan Rose',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('rxc454','Sissi Chen',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('sag103','Sarah Glieberman',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('sbg53','Samantha Gallup',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('sek93','Steve Kerby',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('sjf57','Stephen Finnegan',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('src94','Samantha Chrin',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('ssa87','Sam Armm',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('sxt467','Sabrina Tay',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('tps45','Taylor Smith',75,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('vgv2','Vincenzo Volpe',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('vxr134','Victoria Radcliffe',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('wre8','Will Erickson',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),('ztp3','Zachary Palumbo',340,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL);
/*!40000 ALTER TABLE `participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploads`
--

DROP TABLE IF EXISTS `uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uploads` (
  `filename` varchar(64) NOT NULL,
  `extension` varchar(8) NOT NULL,
  `date` datetime DEFAULT NULL,
  `used` tinyint(1) NOT NULL DEFAULT '0',
  `content` varchar(64) NOT NULL,
  `file_type` varchar(64) NOT NULL,
  `submitter` varchar(8) DEFAULT NULL,
  `event` varchar(64) DEFAULT NULL,
  `semester` enum('spring','fall') NOT NULL,
  `year` smallint(6) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`filename`,`extension`),
  KEY `file_type` (`file_type`),
  KEY `submitter` (`submitter`),
  KEY `event` (`event`,`semester`,`year`),
  CONSTRAINT `uploads_ibfk_1` FOREIGN KEY (`file_type`) REFERENCES `file_types` (`file_type`),
  CONSTRAINT `uploads_ibfk_2` FOREIGN KEY (`submitter`) REFERENCES `participants` (`caseid`),
  CONSTRAINT `uploads_ibfk_3` FOREIGN KEY (`event`, `semester`, `year`) REFERENCES `events` (`event`, `semester`, `year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploads`
--

LOCK TABLES `uploads` WRITE;
/*!40000 ALTER TABLE `uploads` DISABLE KEYS */;
INSERT INTO `uploads` VALUES ('choreo-2-Mara Grigg','jpg','2017-02-15 18:56:28',0,'Rehearsal - Choreo','Photos','meg135','Legally Blonde','spring',2017,'2017-02-15 18:56:28','2017-02-15 18:56:28',NULL),('choreo-Mara Grigg','jpg','2017-02-15 18:56:13',0,'Rehearsal - Choreo','Photos','meg135','Legally Blonde','spring',2017,'2017-02-15 18:56:13','2017-02-15 18:56:13',NULL),('choreo-video-2-Mara Grigg','mp4','2017-02-15 18:58:41',0,'Rehearsal - Choreo','Videos','meg135','Legally Blonde','spring',2017,'2017-02-15 18:58:41','2017-02-15 18:58:41',NULL),('choreo-video-Mara Grigg','mp4','2017-02-15 18:58:27',0,'Rehearsal - Choreo','Videos','meg135','Legally Blonde','spring',2017,'2017-02-15 18:58:27','2017-02-15 18:58:27',NULL),('courtroom-Mara Grigg','jpg','2017-02-15 18:56:42',0,'Unique','Graphics - External','meg135','Legally Blonde','spring',2017,'2017-02-15 18:56:42','2017-02-15 18:56:42',NULL),('legally blonde-Alex Meltsner','jpg','2017-02-19 21:19:00',1,'Unique','Graphics - Internal','alm170','Legally Blonde','spring',2017,'2017-03-06 03:07:12','2017-03-06 03:07:12',NULL),('miscast-Zach Palumbo','png','2017-02-15 01:06:00',1,'Unique','Graphics - Internal','ztp3','Legally Blonde','spring',2017,'2017-02-15 19:21:32','2017-02-15 19:21:32',NULL),('prod-staff-1-Mara Grigg','jpg','2017-02-06 14:00:00',0,'Rehearsal - Staff','Photos','meg135','Legally Blonde','spring',2017,'2017-02-08 18:29:03','2017-02-08 18:29:03',NULL),('vocals-1-Mara Grigg','jpg','2017-02-06 14:00:00',0,'Rehearsal - Vocals','Photos','meg135','Legally Blonde','spring',2017,'2017-02-08 18:26:43','2017-02-08 18:26:43',NULL),('vocals-2-Mara Grigg','jpg','2017-02-06 14:00:00',0,'Rehearsal - Vocals','Photos','meg135','Legally Blonde','spring',2017,'2017-02-08 18:28:36','2017-02-08 18:28:36',NULL),('vocals-3-Mara Grigg','jpg','2017-02-15 23:57:07',0,'Rehearsal - Vocals','Photos','meg135','Legally Blonde','spring',2017,'2017-02-15 23:57:07','2017-02-15 23:57:07',NULL);
/*!40000 ALTER TABLE `uploads` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-23 15:13:00
