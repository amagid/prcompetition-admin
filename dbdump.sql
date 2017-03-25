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
-- Table structure for table `ad_requests`
--

DROP TABLE IF EXISTS `ad_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ad_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `wants` tinyint(1) DEFAULT NULL,
  `ad_type_id` int(11) DEFAULT NULL,
  `creator` enum('us','them') DEFAULT NULL,
  `paid` tinyint(1) DEFAULT NULL,
  `comment` varchar(64) DEFAULT NULL,
  `initial_contact_date` datetime DEFAULT NULL,
  `final_contact_date` datetime DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `p_id` (`p_id`),
  KEY `ad_type_id` (`ad_type_id`),
  CONSTRAINT `ad_requests_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `participants` (`id`),
  CONSTRAINT `ad_requests_ibfk_2` FOREIGN KEY (`ad_type_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad_requests`
--

LOCK TABLES `ad_requests` WRITE;
/*!40000 ALTER TABLE `ad_requests` DISABLE KEYS */;
INSERT INTO `ad_requests` VALUES (1,19,'Buffalo Wild Wings',NULL,14,NULL,NULL,NULL,'2017-02-27 06:30:00',NULL,NULL,'2017-02-27 06:38:30','2017-02-27 06:38:30'),(2,19,'Bamboo Gardens',NULL,14,NULL,NULL,NULL,'2017-02-27 06:30:00',NULL,NULL,'2017-02-27 06:38:42','2017-02-27 06:38:42'),(3,19,'Potbelly',NULL,14,NULL,NULL,NULL,'2017-02-27 06:30:00',NULL,NULL,'2017-02-27 06:38:51','2017-02-27 06:38:51'),(4,19,'Corner Alley',NULL,14,NULL,NULL,NULL,'2017-02-27 06:30:00',NULL,NULL,'2017-02-27 06:39:00','2017-02-27 06:39:00'),(5,19,'Lincoln Moving & Storage Company',NULL,14,NULL,NULL,NULL,'2017-02-27 06:30:00',NULL,NULL,'2017-02-27 06:39:24','2017-02-27 06:39:24'),(6,19,'Cleveland Playhouse',NULL,14,NULL,NULL,NULL,'2017-02-27 06:30:00',NULL,NULL,'2017-02-27 06:39:35','2017-02-27 06:39:35'),(7,19,'Cleveland Yoga',NULL,14,NULL,NULL,NULL,'2017-02-27 06:30:00',NULL,NULL,'2017-02-27 06:39:45','2017-02-27 06:39:45'),(8,19,'CIM',NULL,14,NULL,NULL,NULL,'2017-02-27 06:30:00',NULL,NULL,'2017-02-27 06:39:54','2017-02-27 06:39:54'),(9,19,'CIA',NULL,14,NULL,NULL,NULL,'2017-02-27 06:30:00',NULL,NULL,'2017-02-27 06:39:58','2017-02-27 06:39:58'),(10,19,'John Carroll',NULL,14,NULL,NULL,NULL,'2017-02-27 06:30:00',NULL,NULL,'2017-02-27 06:40:14','2017-02-27 06:40:14'),(11,19,'Cleveland State',NULL,14,NULL,NULL,NULL,'2017-02-27 06:30:00',NULL,NULL,'2017-02-27 06:40:20','2017-02-27 06:40:20'),(12,19,'MOCA',NULL,14,NULL,NULL,NULL,'2017-02-27 06:30:00',NULL,NULL,'2017-02-27 06:40:29','2017-02-27 06:40:29'),(13,19,'Cleveland Museum of Art',NULL,14,NULL,NULL,NULL,'2017-02-27 06:30:00',NULL,NULL,'2017-02-27 06:40:40','2017-02-27 06:40:40'),(14,19,'Cleveland Botanical Gardens',NULL,14,NULL,NULL,NULL,'2017-02-27 06:30:00',NULL,NULL,'2017-02-27 06:40:50','2017-02-27 06:40:50'),(15,19,'Natural History Museum',NULL,14,NULL,NULL,NULL,'2017-02-27 06:30:00',NULL,NULL,'2017-02-27 06:40:59','2017-02-27 06:40:59'),(16,19,'Aladdin\'s',NULL,14,NULL,NULL,NULL,'2017-02-27 06:30:00',NULL,NULL,'2017-02-27 06:41:12','2017-02-27 06:41:12'),(17,19,'The Coffee House',NULL,14,NULL,NULL,NULL,'2017-02-27 06:30:00',NULL,NULL,'2017-02-27 06:41:24','2017-02-27 06:41:24'),(18,19,'Algebra Tea House',NULL,14,NULL,NULL,NULL,'2017-02-27 06:30:00',NULL,NULL,'2017-02-27 06:41:31','2017-02-27 06:41:31'),(19,19,'Bookstore',NULL,14,NULL,NULL,NULL,'2017-02-27 06:30:00',NULL,NULL,'2017-02-27 06:41:39','2017-02-27 06:41:39'),(20,19,'Chapati',NULL,14,NULL,NULL,NULL,'2017-02-27 06:30:00',NULL,NULL,'2017-02-27 06:41:45','2017-02-27 06:41:45'),(21,19,'Picadilly',NULL,14,NULL,NULL,NULL,'2017-02-27 06:30:00',NULL,NULL,'2017-02-27 06:41:57','2017-02-27 06:41:57'),(22,19,'Cleveland Clothing Co.',NULL,14,NULL,NULL,NULL,'2017-02-27 06:30:00',NULL,NULL,'2017-02-27 06:42:12','2017-02-27 06:42:12'),(23,19,'Liquid Planet',NULL,14,NULL,NULL,NULL,'2017-02-27 06:30:00',NULL,NULL,'2017-02-27 06:42:20','2017-02-27 06:42:20'),(25,19,'Otani Noodle',NULL,14,NULL,NULL,NULL,'2017-02-27 06:30:00',NULL,NULL,'2017-02-27 06:43:58','2017-02-27 06:43:58');
/*!40000 ALTER TABLE `ad_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `additional_points`
--

DROP TABLE IF EXISTS `additional_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `additional_points` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `value` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `group_id` int(11) NOT NULL,
  `comment` varchar(128) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `p_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  KEY `group_id` (`group_id`),
  KEY `p_id` (`p_id`),
  CONSTRAINT `additional_points_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
  CONSTRAINT `additional_points_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `participants` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `additional_points`
--

LOCK TABLES `additional_points` WRITE;
/*!40000 ALTER TABLE `additional_points` DISABLE KEYS */;
INSERT INTO `additional_points` VALUES (1,'Resize Miscast Graphic for Website',10,'2017-02-15 01:36:00',8,'Resized the Miscast graphic that he designed from FB cover photo-size to website carousel-size.','2017-02-15 19:42:17','2017-02-15 19:42:17',NULL,12);
/*!40000 ALTER TABLE `additional_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance` (
  `p_id` int(11) NOT NULL,
  `o_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `comment` varchar(64) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`p_id`,`o_id`),
  KEY `o_id` (`o_id`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `participants` (`id`),
  CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`o_id`) REFERENCES `opportunities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,3,'2017-01-18 19:00:00',NULL,'2017-02-08 18:07:48','2017-02-08 18:07:48',NULL),(1,4,'2017-02-26 19:00:00',NULL,'2017-02-27 05:48:43','2017-02-27 05:48:43',NULL),(12,4,'2017-02-26 19:00:00',NULL,'2017-02-27 05:48:49','2017-02-27 05:48:49',NULL),(16,1,'2017-02-05 20:00:00',NULL,'2017-02-08 18:05:57','2017-02-08 18:05:57',NULL),(20,4,'2017-02-26 19:00:00',NULL,'2017-02-27 05:48:54','2017-02-27 05:48:54',NULL),(21,1,'2017-02-05 20:00:00',NULL,'2017-02-08 18:05:52','2017-02-08 18:05:52',NULL),(21,4,'2017-02-26 19:00:00',NULL,'2017-02-27 05:48:58','2017-02-27 05:48:58',NULL),(27,3,'2017-01-18 19:00:00',NULL,'2017-02-08 18:07:57','2017-02-08 18:07:57',NULL),(29,3,'2017-01-18 19:00:00',NULL,'2017-02-08 18:08:01','2017-02-08 18:08:01',NULL),(30,1,'2017-02-05 20:00:00',NULL,'2017-02-08 18:06:12','2017-02-08 18:06:12',NULL),(31,4,'2017-02-26 19:00:00',NULL,'2017-02-27 05:49:02','2017-02-27 05:49:02',NULL),(34,1,'2017-02-05 20:00:00',NULL,'2017-02-08 18:06:02','2017-02-08 18:06:02',NULL),(38,1,'2017-02-05 20:00:00',NULL,'2017-02-08 18:06:19','2017-02-08 18:06:19',NULL),(39,1,'2017-02-05 20:00:00',NULL,'2017-02-08 18:06:15','2017-02-08 18:06:15',NULL),(40,1,'2017-02-05 20:00:00',NULL,'2017-02-08 18:06:07','2017-02-08 18:06:07',NULL),(41,3,'2017-01-18 19:00:00',NULL,'2017-02-08 18:07:52','2017-02-08 18:07:52',NULL),(41,4,'2017-02-26 19:00:00',NULL,'2017-02-27 05:49:06','2017-02-27 05:49:06',NULL),(44,4,'2017-02-26 19:00:00',NULL,'2017-02-27 05:49:12','2017-02-27 05:49:12',NULL);
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `multiplier` int(11) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Test Group 1 - UPDATED',2,'2017-02-02 20:05:14','2017-02-02 20:20:59',NULL),(2,'PR Committee Meetings',1,'2017-02-08 17:06:32','2017-02-08 17:06:32',NULL),(3,'Chalking',1,'2017-02-08 17:58:28','2017-02-08 17:58:28',NULL),(4,'Rehearsal - Vocals',1,'2017-02-08 18:15:43','2017-02-08 18:15:43',NULL),(5,'Rehearsal - Staff',1,'2017-02-15 18:52:29','2017-02-15 18:52:29',NULL),(6,'Rehearsal - Acting',1,'2017-02-15 18:52:37','2017-02-15 18:52:37',NULL),(7,'Rehearsal - Choreo',1,'2017-02-15 18:52:47','2017-02-15 18:52:47',NULL),(8,'Spring 2017 Cabaret',1,'2017-02-15 19:00:50','2017-02-15 19:00:50',NULL),(9,'Misc',1,'2017-02-15 19:17:20','2017-02-15 19:17:20',NULL),(10,'Ads - 1/4 Page',2,'2017-02-27 06:27:45','2017-02-27 06:27:45',NULL),(11,'Ads - 1/2 Page',3,'2017-02-27 06:27:56','2017-02-27 06:27:56',NULL),(12,'Ads - Full Page',5,'2017-02-27 06:28:10','2017-02-27 06:28:10',NULL),(13,'Ads - Inside Cover',7,'2017-02-27 06:28:29','2017-02-27 06:28:29',NULL),(14,'Ads - Initial Contact',1,'2017-02-27 06:45:23','2017-02-27 06:45:23',NULL),(15,'Legally Blonde',2,'2017-03-06 03:01:38','2017-03-06 03:01:38',NULL);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opportunities`
--

DROP TABLE IF EXISTS `opportunities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `opportunities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `value` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `group_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_2` (`name`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `opportunities_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opportunities`
--

LOCK TABLES `opportunities` WRITE;
/*!40000 ALTER TABLE `opportunities` DISABLE KEYS */;
INSERT INTO `opportunities` VALUES (1,'Pseudo-PR Committee Meeting 2/5/17',75,'2017-02-05 20:00:00',2,'2017-02-08 17:54:14','2017-02-08 17:54:14',NULL),(3,'Chalking for LB Auditions',100,'2017-01-18 19:00:00',3,'2017-02-08 17:58:31','2017-02-08 17:58:31',NULL),(4,'PR Committee Meeting 2/26/17',150,'2017-02-26 19:00:00',2,'2017-02-27 05:45:55','2017-02-27 05:45:55',NULL);
/*!40000 ALTER TABLE `opportunities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participants`
--

DROP TABLE IF EXISTS `participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `caseid` varchar(8) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `caseid` (`caseid`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participants`
--

LOCK TABLES `participants` WRITE;
/*!40000 ALTER TABLE `participants` DISABLE KEYS */;
INSERT INTO `participants` VALUES (1,'Angelina Masetta','aem99',250,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(2,'Roland Baumann','rjb223',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(3,'Leah Neustadt','lcn12',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(4,'Laura Mosteller','ljm107',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(5,'Sissi Chen','rxc454',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(6,'Jack O\'Brien','jso33',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(7,'Steve Kerby','sek93',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(8,'Jack Boatman','jrb228',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(9,'Ann Wang','ajw177',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(10,'Beth McKay','erm91',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(11,'Julia Pilla','jrp161',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(12,'Zachary Palumbo','ztp3',340,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(13,'Cindy Dong','cxd283',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(14,'Jessica Dickson','jmd269',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(15,'Madison Hillyard','mmh146',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(16,'Jenn Miller','jlm246',75,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(17,'Stephen Finnegan','sjf57',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(18,'Anna Ashley','ama238',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(19,'Julia Bianco','jab318',720,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(20,'Nick Charles','nac71',150,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(21,'Harper Case','hec42',225,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(22,'Courtney Capra','cac211',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(23,'Samantha Chrin','src94',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(24,'Brice Smith','bgs27',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(25,'Andy Ogrinc','alo30',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(26,'Mary Schroeder','mrs246',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(27,'Madi Burhenn','mjb304',100,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(28,'Melissa Nakazawa','min9',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(29,'Michelle Rackish','mmr103',100,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(30,'Paulina Martz','pmm93',75,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(31,'Mara Grigg','meg135',390,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(32,'Devin Ohlson','dpo21',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(33,'Sarah Glieberman','sag103',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(34,'Maddy Yankell','mhy8',75,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(35,'Lexi Polykarpov','aap110',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(36,'Annika Chura','asc122',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(37,'Evelyn Bravo','exb324',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(38,'Taylor Smith','tps45',75,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(39,'Rich Pannullo','rap157',75,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(40,'Alice Li','mxl624',75,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(41,'Briana Litchholt','bxl353',250,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(42,'Keith Dona','krd37',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(43,'Katrina Claflin','kmc177',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(44,'Alex Meltsner','alm170',510,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(45,'Casey Lockridge','cml155',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(46,'Sabrina Tay','sxt467',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(47,'Jonah Roth','jer135',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(48,'Morgan Fox','mdf63',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(49,'Ryan Rose','rtr29',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(50,'Natalie El Dabh','nme17',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(51,'Logan Trask','lgt7',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(52,'Sam Armm','ssa87',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(53,'Amanda Rulis','amr187',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(54,'Beca Dennis','rfd27',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(55,'Victoria Radcliffe','vxr134',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(56,'Paige Yepko','pmy8',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(57,'Brandon McCourt','bam133',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(58,'Will Erickson','wre8',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(59,'Vincenzo Volpe','vgv2',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(60,'Ethan Smilg','ebs55',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(61,'Bessie Bulman','erb77',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(62,'Keifer Wiley','kaw115',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(63,'Margaret Kowalski','mjk211',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(64,'Molly Pfefferkorn','mrp101',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(65,'Ruth Johnson','rej41',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(66,'Brittany Stern','bfs22',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(67,'Malcolm Reitmeyer','mhr35',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(68,'Lily Gould','lmg85',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(69,'Reno Tarquinio','rdt44',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(70,'Merit Glover','mbg63',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(71,'Maggie McClarren','mhm62',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(72,'Frances Harrison','fih5',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(73,'Rachel Arvizu','raa116',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(74,'Jackson Routhier','jtr76',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(75,'Ashley Roberson','anr41',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(76,'Morihisa Nagai','mxn257',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(77,'Samantha Gallup','sbg53',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(78,'Kristal Scott','kms283',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(79,'Jonathan O\'Brien','jfo26',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(80,'Aaron Mann','azm3',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(81,'Kevin Kwock','kwk24',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL),(82,'Michelle Berg','mjb292',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL);
/*!40000 ALTER TABLE `participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_types`
--

DROP TABLE IF EXISTS `upload_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upload_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `value` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_types`
--

LOCK TABLES `upload_types` WRITE;
/*!40000 ALTER TABLE `upload_types` DISABLE KEYS */;
INSERT INTO `upload_types` VALUES (1,'Photos',20,'2017-02-08 18:22:10','2017-02-08 18:22:10',NULL),(2,'Videos',50,'2017-02-08 18:23:09','2017-02-08 18:23:09',NULL),(3,'Graphics - External',20,'2017-02-15 19:13:12','2017-02-15 19:13:12',NULL),(4,'Graphics - Internal',60,'2017-02-15 19:13:55','2017-02-15 19:13:55',NULL);
/*!40000 ALTER TABLE `upload_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploads`
--

DROP TABLE IF EXISTS `uploads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uploads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` int(11) NOT NULL,
  `filename` varchar(64) NOT NULL,
  `type_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `extension` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filename` (`filename`),
  KEY `p_id` (`p_id`),
  KEY `type_id` (`type_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `uploads_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `participants` (`id`),
  CONSTRAINT `uploads_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `upload_types` (`id`),
  CONSTRAINT `uploads_ibfk_3` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploads`
--

LOCK TABLES `uploads` WRITE;
/*!40000 ALTER TABLE `uploads` DISABLE KEYS */;
INSERT INTO `uploads` VALUES (1,31,'vocals-1-Mara Grigg',1,4,0,'2017-02-06 14:00:00','2017-02-08 18:26:43','2017-02-08 18:26:43',NULL,'jpg'),(2,31,'vocals-2-Mara Grigg',1,4,0,'2017-02-06 14:00:00','2017-02-08 18:28:36','2017-02-08 18:28:36',NULL,'jpg'),(3,31,'prod-staff-1-Mara Grigg',1,5,0,'2017-02-06 14:00:00','2017-02-08 18:29:03','2017-02-08 18:29:03',NULL,'jpg'),(4,31,'choreo-Mara Grigg',1,7,0,'2017-02-15 18:56:13','2017-02-15 18:56:13','2017-02-15 18:56:13',NULL,'jpg'),(5,31,'choreo-2-Mara Grigg',1,7,0,'2017-02-15 18:56:28','2017-02-15 18:56:28','2017-02-15 18:56:28',NULL,'jpg'),(6,31,'courtroom-Mara Grigg',3,9,0,'2017-02-15 18:56:42','2017-02-15 18:56:42','2017-02-15 18:56:42',NULL,'jpg'),(8,31,'choreo-video-Mara Grigg',2,7,0,'2017-02-15 18:58:27','2017-02-15 18:58:27','2017-02-15 18:58:27',NULL,'mp4'),(9,31,'choreo-video-2-Mara Grigg',2,7,0,'2017-02-15 18:58:41','2017-02-15 18:58:41','2017-02-15 18:58:41',NULL,'mp4'),(10,12,'miscast-Zach Palumbo',4,8,1,'2017-02-15 01:06:00','2017-02-15 19:21:32','2017-02-15 19:21:32',NULL,'png'),(11,31,'vocals-3-Mara Grigg',1,4,0,'2017-02-15 23:57:07','2017-02-15 23:57:07','2017-02-15 23:57:07',NULL,'jpg'),(12,44,'legally blonde-Alex Meltsner',4,15,1,'2017-02-19 21:19:00','2017-03-06 03:07:12','2017-03-06 03:07:12',NULL,'jpg');
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

-- Dump completed on 2017-03-25 17:49:10
