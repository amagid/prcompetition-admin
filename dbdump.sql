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
INSERT INTO `additional_points` VALUES ('2 Classroom Announcements',NULL,'2017-03-28 18:00:00',100,'aap110','Legally Blonde','spring',2017,'2017-04-30 04:36:47','2017-04-30 04:36:47',NULL),('Extra Effort in LB Chalking','Came back for another route after first was finished.','2017-03-28 18:00:00',200,'cac211','Legally Blonde','spring',2017,'2017-04-30 04:29:24','2017-04-30 04:29:24',NULL),('Extra LB Chalking Help','Came back for another route after first was finished.','2017-03-28 18:00:00',200,'meg135','Legally Blonde','spring',2017,'2017-04-30 04:28:34','2017-04-30 04:28:34',NULL),('First to Arrive for LB Chalking','Came before anyone else.','2017-03-28 18:00:00',400,'cac211','Legally Blonde','spring',2017,'2017-04-30 04:29:57','2017-04-30 04:29:57',NULL),('Got Flyers to UH','Sent flyers to her mom who works at UH','2017-03-28 18:00:00',200,'aap110','Legally Blonde','spring',2017,'2017-04-30 04:35:21','2017-04-30 04:35:21',NULL),('Helped clean vandalism on spirit wall','After vandals messed with our spirit wall painting some people stayed late to clean up.','2017-03-26 04:00:00',300,'aem99','Legally Blonde','spring',2017,'2017-04-30 05:29:32','2017-04-30 05:29:32',NULL),('Helped remove vandalism from spirit wall','After vandals messed with our spirit wall painting some people stayed late to clean up.','2017-03-26 04:00:00',300,'sag103','Legally Blonde','spring',2017,'2017-04-30 05:30:06','2017-04-30 05:30:06',NULL),('LOTS of photos and videos','413 files - 40 videos, 373 photos, gave 1/3 credit since MANY duplicates','2017-03-28 18:00:00',9460,'jab318','Legally Blonde','spring',2017,'2017-04-30 04:46:38','2017-04-30 04:46:38',NULL),('Posted Flyers around Campus','13 flyers around campus including Potbelly board','2017-03-28 18:00:00',150,'aap110','Legally Blonde','spring',2017,'2017-04-30 04:36:00','2017-04-30 04:36:00',NULL),('Posting in Classrooms','Wrote reminders about the show in 7 PBL classrooms.','2017-03-28 18:00:00',210,'meg135','Legally Blonde','spring',2017,'2017-04-30 04:31:49','2017-04-30 04:31:49',NULL),('Printing Flyers','Took flyer files to distribute.','2017-03-28 18:00:00',150,'mjc243','Legally Blonde','spring',2017,'2017-04-30 04:33:35','2017-04-30 04:33:35',NULL),('Resized Miscast Cabaret Graphic for Website','Resized the Miscast graphic that he designed from FB cover photo-size to website carousel-size.','2017-02-15 01:36:00',10,'ztp3','Miscast Cabaret','spring',2017,'2017-02-15 19:42:17','2017-02-15 19:42:17',NULL),('Sent info to Tri-Sig',NULL,'2017-03-28 18:00:00',100,'rxc454','Legally Blonde','spring',2017,'2017-04-30 04:34:30','2017-04-30 04:34:30',NULL);
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
INSERT INTO `advertisements` VALUES ('ABC The Tavern','Legally Blonde','spring',2017,NULL,'THEY WANT TO DONATE FOOD! Just not interested in ads.',0,NULL,NULL,NULL,NULL,'ahm64',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Aladdin?s','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jab318',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Algebra Teahouse','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jab318',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Athletics Department','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jab318',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'university organization'),('BAJA SAE','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ahm64',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('Big Brothers Big Sisters at Case','Legally Blonde','spring',2017,NULL,'We\'ll have to crop to fit 1/4 page',1,1,1,NULL,NULL,'ahm64','1/4 Page','2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('Big Games Club (HvZ, etc)','Legally Blonde','spring',2017,NULL,'Contact Adam Doros (ahd28@case.edu)',NULL,NULL,NULL,NULL,NULL,'ahm64',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('Bioethics','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jab318',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'university organization'),('Bon Appetit','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'alw121',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'university organization'),('Bookstore','Legally Blonde','spring',2017,NULL,'Fiscal year ends April 30. Must contact VERY early. They REALLY want an ad for next show though!',0,NULL,NULL,NULL,NULL,'jab318',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Bowling Club','Legally Blonde','spring',2017,NULL,'Sounds like they might be shutting down...?',0,NULL,NULL,NULL,NULL,'ahm64',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('Boys and Girls Clubs of Cleveland','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ahm64',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Bruegger?s Bagels (in exchange for food?)','Legally Blonde','spring',2017,NULL,'Already donated too much to Case',0,NULL,NULL,NULL,NULL,'mxl624',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Buffalo Wild Wings','Legally Blonde','spring',2017,NULL,'Aaron has ad in email',1,1,1,NULL,NULL,'jab318','1/2 Page','2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Campus Departments (English?)','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'UNF',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'university organization'),('Career Center','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,0,NULL,NULL,'jab318',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'university organization'),('Case College Trivia Club','Legally Blonde','spring',2017,NULL,NULL,0,NULL,NULL,NULL,NULL,'ahm64',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('Case Democrats','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ahm64',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('Case EMS','Legally Blonde','spring',2017,NULL,NULL,0,NULL,NULL,NULL,NULL,'jab318',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'university organization'),('Case in Point','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bxl353',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('Case Kismat','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'UNF',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('Chabad','Legally Blonde','spring',2017,NULL,'Sounds like they don\'t want to endorse a show in general.',0,NULL,NULL,NULL,NULL,'ahm64',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('Chapati / Bamboo Gardens','Legally Blonde','spring',2017,NULL,NULL,1,1,1,NULL,NULL,'jab318','Full Page','2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('CIA','Legally Blonde','spring',2017,NULL,'Sent Invoice',1,1,1,NULL,NULL,'jab318','Full Page','2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('CIM','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jab318',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Cleveland Botanical Gardens','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jab318',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Cleveland Clothing Co.','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jab318',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Cleveland Kids\' Book Bank','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ahm64',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Cleveland Museum of Art','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jab318',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Cleveland Playhouse','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jab318',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Cleveland State','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jab318',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Cleveland Yoga- lauren@clevelandyoga.com','Legally Blonde','spring',2017,NULL,'responded and said ad budget has been reached-- should contact earlier next time',0,NULL,NULL,NULL,NULL,'jab318',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Club Sports Department of Student Affairs','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'UNF',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('Co-Op Office','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jab318',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'university organization'),('COC','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bxl353',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('College Republicans','Legally Blonde','spring',2017,NULL,'Ad in Aaron\'s email',1,1,1,NULL,NULL,'ahm64','1/2 Page','2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('Constantinos','Legally Blonde','spring',2017,NULL,'Jim says he\'ll look over the email tonight / tomorrow.',NULL,NULL,NULL,NULL,NULL,'ahm64',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Coquette Patisserie','Legally Blonde','spring',2017,NULL,'Has info, will email Aaron if interested.',NULL,NULL,NULL,NULL,NULL,'ahm64',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Corner Alley','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jab318',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Counseling Center','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,0,NULL,NULL,'jab318',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'university organization'),('Culinary Club','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ahm64',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('CWRU LaunchNet','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jab318',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'university organization'),('CWRUbotix','Legally Blonde','spring',2017,NULL,'Bug if we haven\'t gotten the ad by Friday.',1,1,0,NULL,NULL,'ahm64','1/2 Page','2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('Dhamakapella','Legally Blonde','spring',2017,NULL,'They\'re deciding what size they want',1,1,0,NULL,NULL,'ahm64','1/2 Page','2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('Dynomite','Legally Blonde','spring',2017,NULL,'Has info, will email Aaron if interested.',NULL,NULL,NULL,NULL,NULL,'ahm64',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Eldred','Legally Blonde','spring',2017,NULL,'Confirmed but waiting on contact',1,0,0,NULL,NULL,'ztp3',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'university organization'),('English, Law, Business Fraternities','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'alw121',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'university organization'),('ESS','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jab318',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'university organization'),('Eurowafel','Legally Blonde','spring',2017,NULL,'Just charging them - no waffle deal',NULL,NULL,NULL,NULL,NULL,'ztp3',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Falafel Cafe','Legally Blonde','spring',2017,NULL,NULL,0,NULL,NULL,NULL,NULL,'ahm64',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Fencing Club','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'alw121',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('Film Society','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'alw121',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('Habitat for Humanity','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'UNF',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('Happy Dog','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'alw121',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Hillel','Legally Blonde','spring',2017,NULL,'Waiting for ad.',1,1,1,NULL,NULL,'ahm64','1/4 Page','2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('IMPROVment','Legally Blonde','spring',2017,NULL,'IMPROVment has no funds left. -Zach',0,NULL,NULL,NULL,NULL,'ztp3',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('Impulse','Legally Blonde','spring',2017,NULL,'Ad in Aaron\'s email',1,1,0,NULL,NULL,'ahm64','1/2 Page','2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('ITS (UTECH?)','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jab318',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'university organization'),('Jimmy Johns','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ahm64',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('John Carroll','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jab318',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Juggling Club','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ahm64',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('Kantina','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ahm64',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Kenko','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bxl353',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Kung Fu Club','Legally Blonde','spring',2017,'ahm64',NULL,1,1,1,NULL,NULL,'mxl624','1/2 Page','2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('Lincoln Moving & Storage Company','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jab318',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Liquid Planet','Legally Blonde','spring',2017,NULL,NULL,0,NULL,NULL,NULL,NULL,'jab318',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Little Italy Wine Store','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'UNF',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Masters Programs','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'UNF',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'university organization'),('Men?s Glee Club','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'alw121',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('Mitchells','Legally Blonde','spring',2017,NULL,'Manager has no authority. Emailed corporate office (info@mitchellshomemade.com).',NULL,NULL,NULL,NULL,NULL,'ahm64',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('MOCA','Legally Blonde','spring',2017,NULL,NULL,0,NULL,NULL,NULL,NULL,'jab318',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Model UN','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ahm64',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('Natural History Museum','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jab318',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Ninja City','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ahm64',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Nritya Dance Team','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ahm64',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('Office of Multicultural Affairs','Legally Blonde','spring',2017,NULL,'they decide at the beginning of each semester so they say they have to be contacted in like that first month',0,NULL,NULL,NULL,NULL,'jab318',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'university organization'),('Office of Sustainability','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jab318',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'university organization'),('OneToOne','Legally Blonde','spring',2017,NULL,'Uptown Cycle, their new location, opens ON OPENING NIGHT',1,1,1,NULL,NULL,'ahm64','1/2 Page','2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'university organization'),('Otani Noodle','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jab318',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Picadilly','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jab318',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Police Department','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'alw121',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'university organization'),('Potbelly','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jab318',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('PTG','Legally Blonde','spring',2017,NULL,NULL,0,NULL,NULL,NULL,NULL,'bxl353',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('Quidditch Club','Legally Blonde','spring',2017,NULL,NULL,1,1,1,NULL,NULL,'bxl353','1/4 Page','2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('Rascal House','Legally Blonde','spring',2017,NULL,'Wants one next semester.',0,NULL,NULL,NULL,NULL,'ahm64',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('RHA','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bxl353',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('Rocket Team','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ahm64',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('Rough Rider Productions?','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'alw121',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('Salsa Dance Club','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ahm64',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('Schubert Center for Child Studies','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,0,NULL,NULL,'jab318',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'university organization'),('Simply Greek','Legally Blonde','spring',2017,NULL,'Get ad from Dave at the Athenian',1,1,1,NULL,NULL,'ahm64','Back Cover','2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Solstice','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'alw121',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('Spartan Dance Team','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'bxl353',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('Speakeasy','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'alw121',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('Starbucks (Cedar-Fairmount)','Legally Blonde','spring',2017,NULL,NULL,0,NULL,NULL,NULL,NULL,'aem99',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Starbucks (Euclid)','Legally Blonde','spring',2017,NULL,NULL,0,NULL,NULL,NULL,NULL,'aem99',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Study Abroad','Legally Blonde','spring',2017,NULL,'were very nice, should def contact again next time',0,NULL,NULL,NULL,NULL,'jab318',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'university organization'),('The Athenian','Legally Blonde','spring',2017,NULL,'They also have Simply Greek\'s ad apparently...',NULL,NULL,NULL,NULL,NULL,'alw121',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('The Coffee House','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jab318',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('The Jolly Scholar (in exchange for food?)','Legally Blonde','spring',2017,NULL,'Will talk about food / ads at the end of spring break. Might use previous ads.',1,0,0,NULL,NULL,'mxl624',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('The Midnight Slander','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'ztp3',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Thinkbox','Legally Blonde','spring',2017,'ahm64','I will be listing them as a sponsor because we got thinkbox funding',1,1,1,NULL,NULL,'mxl624','Full Page','2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'university organization'),('Tink','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'jab318',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'university organization'),('Tropical Smoothie','Legally Blonde','spring',2017,NULL,NULL,1,1,0,NULL,NULL,'ahm64','Full Page','2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'business'),('Undergraduate Studies Department','Legally Blonde','spring',2017,NULL,NULL,0,NULL,NULL,NULL,NULL,'jab318',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'university organization'),('Voices Of Glory','Legally Blonde','spring',2017,NULL,NULL,1,1,1,NULL,NULL,'ahm64','1/2 Page','2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('Weatherhead','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'alw121',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'university organization'),('Women?s Center','Legally Blonde','spring',2017,NULL,NULL,1,1,1,NULL,NULL,'bxl353','1/4 Page','2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'university organization'),('WRUW','Legally Blonde','spring',2017,NULL,'Interested for next year. Email student GM directly at their case email for quick response.',NULL,NULL,NULL,NULL,NULL,'alw121',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('Young Americans for Liberty','Legally Blonde','spring',2017,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'aem99',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization'),('Young Democratic Socialists','Legally Blonde','spring',2017,NULL,NULL,0,NULL,NULL,NULL,NULL,'aem99',NULL,'2017-04-23 19:09:26','2017-04-23 19:09:26',NULL,'student organization');
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
INSERT INTO `attendance` VALUES ('aap110','Share Cabaret Event','Miscast Cabaret','spring',2017,'2017-03-04 12:00:00','2017-04-30 02:40:55','2017-04-30 02:40:55',NULL,'Shared to class of groups.'),('aem99','Chalking for LB Auditions','Legally Blonde','spring',2017,'2017-01-18 19:00:00','2017-02-08 18:07:48','2017-02-08 18:07:48',NULL,NULL),('aem99','LB Spirit Wall Painting','Legally Blonde','spring',2017,'2017-03-25 22:00:00','2017-04-30 05:26:33','2017-04-30 05:26:33',NULL,'Stayed late to help clean up vandalism.'),('aem99','PR Committee Meeting 2/26/17','Legally Blonde','spring',2017,'2017-02-26 19:00:00','2017-02-27 05:48:43','2017-02-27 05:48:43',NULL,NULL),('alm170','PR Committee Meeting 2/26/17','Legally Blonde','spring',2017,'2017-02-26 19:00:00','2017-02-27 05:49:12','2017-02-27 05:49:12',NULL,NULL),('alw121','LB Spirit Wall Painting','Legally Blonde','spring',2017,'2017-03-25 22:00:00','2017-04-30 05:26:10','2017-04-30 05:26:10',NULL,NULL),('bxl353','Chalking for LB Auditions','Legally Blonde','spring',2017,'2017-01-18 19:00:00','2017-02-08 18:07:52','2017-02-08 18:07:52',NULL,NULL),('bxl353','LB Spirit Wall Painting','Legally Blonde','spring',2017,'2017-03-25 22:00:00','2017-04-30 05:32:04','2017-04-30 05:32:04',NULL,NULL),('bxl353','PR Committee Meeting 2/26/17','Legally Blonde','spring',2017,'2017-02-26 19:00:00','2017-02-27 05:49:06','2017-02-27 05:49:06',NULL,NULL),('cac211','Chalking for Legally Blonde','Legally Blonde','spring',2017,'2017-03-28 17:00:00','2017-04-30 04:26:36','2017-04-30 04:26:36',NULL,'Additional Points for coming back for more and for being first to arrive.'),('hec42','PR Committee Meeting 2/26/17','Legally Blonde','spring',2017,'2017-02-26 19:00:00','2017-02-27 05:48:58','2017-02-27 05:48:58',NULL,NULL),('hec42','Pseudo-PR Committee Meeting 2/5/17','Legally Blonde','spring',2017,'2017-02-05 20:00:00','2017-02-08 18:05:52','2017-02-08 18:05:52',NULL,NULL),('jlm246','Pseudo-PR Committee Meeting 2/5/17','Legally Blonde','spring',2017,'2017-02-05 20:00:00','2017-02-08 18:05:57','2017-02-08 18:05:57',NULL,NULL),('meg135','Chalking for Legally Blonde','Legally Blonde','spring',2017,'2017-03-28 17:00:00','2017-04-30 04:26:10','2017-04-30 04:26:10',NULL,'Additional Points for coming back for more.'),('meg135','PR Committee Meeting 2/26/17','Legally Blonde','spring',2017,'2017-02-26 19:00:00','2017-02-27 05:49:02','2017-02-27 05:49:02',NULL,NULL),('meg135','Share Cabaret Event','Miscast Cabaret','spring',2017,'2017-03-04 12:00:00','2017-04-30 02:40:17','2017-04-30 02:40:17',NULL,'Shared to class of groups.'),('mhy8','LB Spirit Wall Painting','Legally Blonde','spring',2017,'2017-03-25 22:00:00','2017-04-30 05:27:49','2017-04-30 05:27:49',NULL,NULL),('mhy8','Pseudo-PR Committee Meeting 2/5/17','Legally Blonde','spring',2017,'2017-02-05 20:00:00','2017-02-08 18:06:02','2017-02-08 18:06:02',NULL,NULL),('min9','LB Spirit Wall Painting','Legally Blonde','spring',2017,'2017-03-25 22:00:00','2017-04-30 05:30:56','2017-04-30 05:30:56',NULL,NULL),('mjb304','Chalking for LB Auditions','Legally Blonde','spring',2017,'2017-01-18 19:00:00','2017-02-08 18:07:57','2017-02-08 18:07:57',NULL,NULL),('mmr103','Chalking for LB Auditions','Legally Blonde','spring',2017,'2017-01-18 19:00:00','2017-02-08 18:08:01','2017-02-08 18:08:01',NULL,NULL),('mmr103','LB Spirit Wall Painting','Legally Blonde','spring',2017,'2017-03-25 22:00:00','2017-04-30 05:30:46','2017-04-30 05:30:46',NULL,NULL),('mxl624','Pseudo-PR Committee Meeting 2/5/17','Legally Blonde','spring',2017,'2017-02-05 20:00:00','2017-02-08 18:06:07','2017-02-08 18:06:07',NULL,NULL),('nac71','PR Committee Meeting 2/26/17','Legally Blonde','spring',2017,'2017-02-26 19:00:00','2017-02-27 05:48:54','2017-02-27 05:48:54',NULL,NULL),('pmm93','Pseudo-PR Committee Meeting 2/5/17','Legally Blonde','spring',2017,'2017-02-05 20:00:00','2017-02-08 18:06:12','2017-02-08 18:06:12',NULL,NULL),('rap157','Pseudo-PR Committee Meeting 2/5/17','Legally Blonde','spring',2017,'2017-02-05 20:00:00','2017-02-08 18:06:15','2017-02-08 18:06:15',NULL,NULL),('sag103','LB Spirit Wall Painting','Legally Blonde','spring',2017,'2017-03-25 22:00:00','2017-04-30 05:25:54','2017-04-30 05:25:54',NULL,'Came back to help with cleanup.'),('sjf57','LB Spirit Wall Painting','Legally Blonde','spring',2017,'2017-03-25 22:00:00','2017-04-30 05:31:29','2017-04-30 05:31:29',NULL,NULL),('tps45','Pseudo-PR Committee Meeting 2/5/17','Legally Blonde','spring',2017,'2017-02-05 20:00:00','2017-02-08 18:06:19','2017-02-08 18:06:19',NULL,NULL),('ztp3','PR Committee Meeting 2/26/17','Legally Blonde','spring',2017,'2017-02-26 19:00:00','2017-02-27 05:48:49','2017-02-27 05:48:49',NULL,NULL);
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
INSERT INTO `content` VALUES ('Blooper',2,'2017-04-30 04:01:01','2017-04-30 04:01:01',NULL),('Build',1,'2017-04-30 04:02:50','2017-04-30 04:02:50',NULL),('Performances',2,'2017-04-30 02:15:10','2017-04-30 02:15:10',NULL),('Rehearsal - Acting',1,'2017-02-15 18:52:37','2017-02-15 18:52:37',NULL),('Rehearsal - Choreo',1,'2017-02-15 18:52:47','2017-02-15 18:52:47',NULL),('Rehearsal - Sitzprobe',1,'2017-04-30 02:24:18','2017-04-30 02:24:18',NULL),('Rehearsal - Staff',1,'2017-02-15 18:52:29','2017-02-15 18:52:29',NULL),('Rehearsal - Vocals',1,'2017-02-08 18:15:43','2017-02-08 18:15:43',NULL),('Unchecked',1,'2017-04-30 02:54:00','2017-04-30 02:54:00',NULL),('Unique',1,'2017-04-22 00:28:04','2017-04-22 00:28:04',NULL);
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
INSERT INTO `opportunities` VALUES ('Chalking for LB Auditions',100,'2017-01-18 19:00:00','8 in attendance, RSVPify worked well.','Legally Blonde','spring',2017,'2017-02-08 17:58:31','2017-02-08 17:58:31',NULL),('Chalking for Legally Blonde',200,'2017-03-28 17:00:00','','Legally Blonde','spring',2017,'2017-04-30 04:24:44','2017-04-30 04:24:44',NULL),('LB Spirit Wall Painting',150,'2017-03-25 22:00:00','Painting the spirit wall for LB.','Legally Blonde','spring',2017,'2017-04-30 05:24:08','2017-04-30 05:24:08',NULL),('PR Committee Meeting 2/26/17',150,'2017-02-26 19:00:00','Scheduled PR Committee meeting #1.','Legally Blonde','spring',2017,'2017-02-27 05:45:55','2017-02-27 05:45:55',NULL),('Pseudo-PR Committee Meeting 2/5/17',75,'2017-02-05 20:00:00','Exec meeting / hangout turned into PR meeting. Half value because it was unannounced.','Legally Blonde','spring',2017,'2017-02-08 17:54:14','2017-02-08 17:54:14',NULL),('Share Cabaret Event',20,'2017-03-04 12:00:00','','Miscast Cabaret','spring',2017,'2017-04-30 02:38:28','2017-04-30 02:38:28',NULL);
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
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`caseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participants`
--

LOCK TABLES `participants` WRITE;
/*!40000 ALTER TABLE `participants` DISABLE KEYS */;
INSERT INTO `participants` VALUES ('aap110','Lexi Polykarpov',1110,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('aem99','Angelina Masetta',820,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('ahm64','Aaron Magid',1930,'2017-04-23 18:06:46','2017-04-23 18:06:46',NULL,0),('ajw177','Ann Wang',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('alm170','Alex Meltsner',510,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('alo30','Andy Ogrinc',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('alw121','Amy Weaver',640,'2017-04-23 18:03:18','2017-04-23 18:03:18',NULL,0),('ama238','Anna Ashley',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('amr187','Amanda Rulis',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('anr41','Ashley Roberson',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('asc122','Annika Chura',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('azm3','Aaron Mann',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('bam133','Brandon McCourt',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('bfs22','Brittany Stern',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('bgs27','Brice Smith',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('bxl353','Briana Litchholt',700,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,0),('cac211','Courtney Capra',800,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('cml155','Casey Lockridge',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('cxd283','Cindy Dong',90,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('dpo21','Devin Ohlson',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('ebs55','Ethan Smilg',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('erb77','Bessie Bulman',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('erm91','Beth McKay',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('exb324','Evelyn Bravo',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('fih5','Frances Harrison',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('hec42','Harper Case',225,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('jab318','Julia Bianco',10900,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('jer135','Jonah Roth',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('jfo26','Jonathan O\'Brien',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('jlm246','Jenn Miller',75,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('jmd269','Jessica Dickson',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('jrb228','Jack Boatman',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('jrp161','Julia Pilla',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('jso33','Jack O\'Brien',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('jtr76','Jackson Routhier',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('kaw115','Keifer Wiley',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('kmc177','Katrina Claflin',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('kms283','Kristal Scott',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('krd37','Keith Dona',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('kwk24','Kevin Kwock',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('lcn12','Leah Neustadt',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('lgt7','Logan Trask',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('ljm107','Laura Mosteller',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('lmg85','Lily Gould',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('mbg63','Merit Glover',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('mdf63','Morgan Fox',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('meg135','Mara Grigg',1880,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('mhm62','Maggie McClarren',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('mhr35','Malcolm Reitmeyer',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('mhy8','Maddy Yankell',225,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('min9','Melissa Nakazawa',150,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('mjb292','Michelle Berg',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('mjb304','Madi Burhenn',100,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('mjc243','Matthew Canel',1570,'2017-04-30 02:56:12','2017-04-30 02:56:12',NULL,1),('mjk211','Margaret Kowalski',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('mmh146','Madison Hillyard',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('mmr103','Michelle Rackish',250,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('mrp101','Molly Pfefferkorn',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('mrs246','Mary Schroeder',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('mxl624','Alice Li',525,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('mxn257','Morihisa Nagai',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('nac71','Nick Charles',150,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('nme17','Natalie El Dabh',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('notreal','not real',0,'1994-03-05 08:05:19','2017-04-25 23:00:30',NULL,0),('pmm93','Paulina Martz',375,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('pmy8','Paige Yepko',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('raa116','Rachel Arvizu',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('rap157','Rich Pannullo',75,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('rdt44','Reno Tarquinio',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('rej41','Ruth Johnson',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('rfd27','Beca Dennis',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('rjb223','Roland Baumann',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('rtr29','Ryan Rose',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('rxc454','Sissi Chen',100,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('sag103','Sarah Glieberman',450,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('sbg53','Samantha Gallup',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('sek93','Steve Kerby',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('sjf57','Stephen Finnegan',150,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('src94','Samantha Chrin',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('ssa87','Sam Armm',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('sxt467','Sabrina Tay',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('tps45','Taylor Smith',75,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('UNF','Unfinished',180,'2017-04-23 18:45:44','2017-04-23 18:45:44',NULL,0),('unknown','Unknown',0,'2017-04-23 18:45:18','2017-04-23 18:45:18',NULL,0),('vgv2','Vincenzo Volpe',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('vxr134','Victoria Radcliffe',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('wre8','Will Erickson',0,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1),('ztp3','Zachary Palumbo',640,'2017-02-01 15:48:08','2017-02-01 15:48:08',NULL,1);
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
INSERT INTO `uploads` VALUES ('aaron julia irish dance','mp4','2017-04-30 05:18:15',0,'Rehearsal - Choreo','Videos','meg135','Legally Blonde','spring',2017,'2017-04-30 05:18:15','2017-04-30 05:18:15',NULL),('aaron, dance','mp4','2017-04-30 05:18:44',0,'Rehearsal - Choreo','Videos','meg135','Legally Blonde','spring',2017,'2017-04-30 05:18:44','2017-04-30 05:18:44',NULL),('amanda keith','jpg','2017-04-30 05:20:37',0,'Rehearsal - Acting','Photos','meg135','Legally Blonde','spring',2017,'2017-04-30 05:20:37','2017-04-30 05:20:37',NULL),('amy build','jpg','2017-04-30 03:31:09',0,'Misc','Photos','jlm246','Legally Blonde','spring',2017,'2017-04-30 03:31:09','2017-04-30 03:31:09',NULL),('bend and snap','mp4','2017-04-30 03:20:53',0,'Rehearsal - Videos','Videos','aap110','Legally Blonde','spring',2017,'2017-04-30 03:20:53','2017-04-30 03:20:53',NULL),('brice jump dance move','mov','2017-04-30 04:20:43',0,'Build','Videos','cxd283','Legally Blonde','spring',2017,'2017-04-30 04:20:43','2017-04-30 04:20:43',NULL),('brice nick dance','jpg','2017-04-30 04:20:05',0,'Build','Photos','cxd283','Legally Blonde','spring',2017,'2017-04-30 04:20:05','2017-04-30 04:20:05',NULL),('brice nick outfits','jpg','2017-04-30 04:21:23',0,'Build','Photos','cxd283','Legally Blonde','spring',2017,'2017-04-30 04:21:23','2017-04-30 04:21:23',NULL),('build pose','jpg','2017-04-30 03:53:43',0,'Misc','Photos','mxl624','Legally Blonde','spring',2017,'2017-04-30 03:53:43','2017-04-30 03:53:43',NULL),('cabaret 02','jpg','2017-04-30 03:41:36',0,'Performances','Photos','aap110','Miscast Cabaret','spring',2017,'2017-04-30 03:41:36','2017-04-30 03:41:36',NULL),('cabaret 03','jpg','2017-04-30 03:41:46',0,'Performances','Photos','aap110','Miscast Cabaret','spring',2017,'2017-04-30 03:41:46','2017-04-30 03:41:46',NULL),('cabaret 04','jpg','2017-04-30 03:41:56',0,'Performances','Photos','aap110','Miscast Cabaret','spring',2017,'2017-04-30 03:41:56','2017-04-30 03:41:56',NULL),('cast in chairs','jpg','2017-04-30 05:20:47',0,'Rehearsal - Acting','Photos','meg135','Legally Blonde','spring',2017,'2017-04-30 05:20:47','2017-04-30 05:20:47',NULL),('choreo-2-Mara Grigg','jpg','2017-02-15 18:56:28',0,'Rehearsal - Choreo','Photos','meg135','Legally Blonde','spring',2017,'2017-02-15 18:56:28','2017-02-15 18:56:28',NULL),('choreo-Mara Grigg','jpg','2017-02-15 18:56:13',0,'Rehearsal - Choreo','Photos','meg135','Legally Blonde','spring',2017,'2017-02-15 18:56:13','2017-02-15 18:56:13',NULL),('choreo-video-2-Mara Grigg','mp4','2017-02-15 18:58:41',0,'Rehearsal - Choreo','Videos','meg135','Legally Blonde','spring',2017,'2017-02-15 18:58:41','2017-02-15 18:58:41',NULL),('choreo-video-Mara Grigg','mp4','2017-02-15 18:58:27',0,'Rehearsal - Choreo','Videos','meg135','Legally Blonde','spring',2017,'2017-02-15 18:58:27','2017-02-15 18:58:27',NULL),('cinderella proposal video','mp4','2017-04-30 03:13:06',0,'Misc','Videos','amr187','Legally Blonde','spring',2017,'2017-04-30 03:13:06','2017-04-30 03:13:06',NULL),('colorful shoes','jpg','2017-04-30 03:54:11',0,'Misc','Photos','mxl624','Legally Blonde','spring',2017,'2017-04-30 03:54:11','2017-04-30 03:54:11',NULL),('courtroom-Mara Grigg','jpg','2017-02-15 18:56:42',0,'Unique','Graphics - External','meg135','Misc','spring',2017,'2017-02-15 18:56:42','2017-02-15 18:56:42',NULL),('douchemen 01','mp4','2017-04-30 03:21:02',0,'Rehearsal - Videos','Videos','aap110','Legally Blonde','spring',2017,'2017-04-30 03:21:02','2017-04-30 03:21:02',NULL),('douchemen entrance','mp4','2017-04-30 03:21:10',0,'Rehearsal - Videos','Videos','aap110','Legally Blonde','spring',2017,'2017-04-30 03:21:10','2017-04-30 03:21:10',NULL),('early vocals Rich Sabrina Casey','jpg','2017-04-30 02:10:34',0,'Rehearsal - Vocals','Photos','meg135','Legally Blonde','spring',2017,'2017-04-30 02:10:34','2017-04-30 02:10:34',NULL),('elle woods trump','jpg','2017-04-30 02:09:28',0,'Unique','Graphics - External','meg135','Legally Blonde','spring',2017,'2017-04-30 02:09:28','2017-04-30 02:09:28',NULL),('every line is pompous creep','mp4','2017-04-30 05:19:39',0,'Blooper','Videos','meg135','Legally Blonde','spring',2017,'2017-04-30 05:19:39','2017-04-30 05:19:39',NULL),('Form Submission 01','mov','2017-04-30 02:58:11',0,'Unchecked','Videos','mjc243','Legally Blonde','spring',2017,'2017-04-30 02:58:11','2017-04-30 02:58:11',NULL),('Form Submission 02','mov','2017-04-30 02:58:46',0,'Unchecked','Videos','mjc243','Legally Blonde','spring',2017,'2017-04-30 02:58:46','2017-04-30 02:58:46',NULL),('Form Submission 03','mov','2017-04-30 02:58:54',0,'Unchecked','Videos','mjc243','Legally Blonde','spring',2017,'2017-04-30 02:58:54','2017-04-30 02:58:54',NULL),('Form Submission 04','mov','2017-04-30 02:58:59',0,'Unchecked','Videos','mjc243','Legally Blonde','spring',2017,'2017-04-30 02:58:59','2017-04-30 02:58:59',NULL),('Form Submission 05','mov','2017-04-30 02:59:04',0,'Unchecked','Videos','mjc243','Legally Blonde','spring',2017,'2017-04-30 02:59:04','2017-04-30 02:59:04',NULL),('Form Submission 06','mov','2017-04-30 02:59:09',0,'Unchecked','Videos','mjc243','Legally Blonde','spring',2017,'2017-04-30 02:59:09','2017-04-30 02:59:09',NULL),('Form Submission 07','mov','2017-04-30 02:59:13',0,'Unchecked','Videos','mjc243','Legally Blonde','spring',2017,'2017-04-30 02:59:13','2017-04-30 02:59:13',NULL),('Form Submission 08','mov','2017-04-30 02:59:19',0,'Unchecked','Videos','mjc243','Legally Blonde','spring',2017,'2017-04-30 02:59:19','2017-04-30 02:59:19',NULL),('Form Submission 09','mov','2017-04-30 02:59:23',0,'Unchecked','Videos','mjc243','Legally Blonde','spring',2017,'2017-04-30 02:59:23','2017-04-30 02:59:23',NULL),('Form Submission 10','mov','2017-04-30 02:59:28',0,'Unchecked','Videos','mjc243','Legally Blonde','spring',2017,'2017-04-30 02:59:28','2017-04-30 02:59:28',NULL),('Form Submission 11','mov','2017-04-30 02:59:32',0,'Unchecked','Videos','mjc243','Legally Blonde','spring',2017,'2017-04-30 02:59:32','2017-04-30 02:59:32',NULL),('Form Submission 12','mov','2017-04-30 02:59:37',0,'Unchecked','Videos','mjc243','Legally Blonde','spring',2017,'2017-04-30 02:59:37','2017-04-30 02:59:37',NULL),('Form Submission 13','mov','2017-04-30 02:59:44',0,'Unchecked','Videos','mjc243','Legally Blonde','spring',2017,'2017-04-30 02:59:44','2017-04-30 02:59:44',NULL),('Form Submission 14','mov','2017-04-30 03:01:22',0,'Unchecked','Videos','mxl624','Legally Blonde','spring',2017,'2017-04-30 03:01:22','2017-04-30 03:01:22',NULL),('Form Submission 15','mov','2017-04-30 03:01:28',0,'Unchecked','Videos','mxl624','Legally Blonde','spring',2017,'2017-04-30 03:01:28','2017-04-30 03:01:28',NULL),('Form Submission 16','mov','2017-04-30 03:01:40',0,'Unchecked','Videos','mxl624','Legally Blonde','spring',2017,'2017-04-30 03:01:40','2017-04-30 03:01:40',NULL),('Form Submission 17','jpg','2017-04-30 03:03:14',0,'Unchecked','Videos','mjc243','Legally Blonde','spring',2017,'2017-04-30 03:03:14','2017-04-30 03:03:14',NULL),('Form Submission 18','jpg','2017-04-30 03:03:18',0,'Unchecked','Videos','mjc243','Legally Blonde','spring',2017,'2017-04-30 03:03:18','2017-04-30 03:03:18',NULL),('Form Submission 19','jpg','2017-04-30 03:03:23',0,'Unchecked','Videos','mjc243','Legally Blonde','spring',2017,'2017-04-30 03:03:23','2017-04-30 03:03:23',NULL),('Form Submission 20','jpg','2017-04-30 03:03:26',0,'Unchecked','Videos','mjc243','Legally Blonde','spring',2017,'2017-04-30 03:03:26','2017-04-30 03:03:26',NULL),('Form Submission 21','jpg','2017-04-30 03:03:31',0,'Unchecked','Videos','mjc243','Legally Blonde','spring',2017,'2017-04-30 03:03:31','2017-04-30 03:03:31',NULL),('Form Submission 22','jpg','2017-04-30 03:03:35',0,'Unchecked','Videos','mjc243','Legally Blonde','spring',2017,'2017-04-30 03:03:35','2017-04-30 03:03:35',NULL),('Form Submission 23','jpg','2017-04-30 03:03:39',0,'Unchecked','Videos','mjc243','Legally Blonde','spring',2017,'2017-04-30 03:03:39','2017-04-30 03:03:39',NULL),('Form Submission 24','jpg','2017-04-30 03:03:43',0,'Unchecked','Videos','mjc243','Legally Blonde','spring',2017,'2017-04-30 03:03:43','2017-04-30 03:03:43',NULL),('Form Submission 25','jpg','2017-04-30 03:03:48',0,'Unchecked','Videos','mjc243','Legally Blonde','spring',2017,'2017-04-30 03:03:48','2017-04-30 03:03:48',NULL),('Form Submission 26','jpg','2017-04-30 03:03:53',0,'Unchecked','Videos','mjc243','Legally Blonde','spring',2017,'2017-04-30 03:03:53','2017-04-30 03:03:53',NULL),('Form Submission 27','jpg','2017-04-30 03:03:56',0,'Unchecked','Videos','mjc243','Legally Blonde','spring',2017,'2017-04-30 03:03:56','2017-04-30 03:03:56',NULL),('havent had any jaeger','mp4','2017-04-30 02:22:19',0,'Rehearsal - Choreo','Videos','meg135','Legally Blonde','spring',2017,'2017-04-30 02:22:19','2017-04-30 02:22:19',NULL),('keith elle woods','mp4','2017-04-30 03:06:53',0,'Rehearsal - Vocals','Videos','alw121','Legally Blonde','spring',2017,'2017-04-30 03:06:53','2017-04-30 03:06:53',NULL),('LB directing staff','jpg','2017-04-30 02:10:58',0,'Rehearsal - Staff','Photos','meg135','Legally Blonde','spring',2017,'2017-04-30 02:10:58','2017-04-30 02:10:58',NULL),('lb remix dance','jpg','2017-04-30 02:11:26',0,'Rehearsal - Choreo','Photos','meg135','Legally Blonde','spring',2017,'2017-04-30 02:11:26','2017-04-30 02:11:26',NULL),('legally blonde dress-Alex Meltsner','jpg','2017-02-19 21:19:00',1,'Unique','Graphics - Internal','alm170','Legally Blonde','spring',2017,'2017-04-23 19:31:17','2017-04-23 19:31:17',NULL),('Legally Blonde Poster','png','2017-04-30 01:48:35',1,'Unique','Graphics - Internal','ztp3','Legally Blonde','spring',2017,'2017-04-30 01:48:35','2017-04-30 01:48:35',NULL),('legally blonde-Alex Meltsner','jpg','2017-02-19 21:19:00',1,'Unique','Graphics - Internal','alm170','Legally Blonde','spring',2017,'2017-03-06 03:07:12','2017-03-06 03:07:12',NULL),('logan cabaret','jpg','2017-04-30 03:42:08',0,'Performances','Photos','aap110','Miscast Cabaret','spring',2017,'2017-04-30 03:42:08','2017-04-30 03:42:08',NULL),('lost cabaret photos','jpg','2017-04-30 03:33:40',0,'Misc','Photos','jlm246','Miscast Cabaret','spring',2017,'2017-04-30 03:33:40','2017-04-30 03:33:40',NULL),('lost cabaret photos 02','jpg','2017-04-30 03:33:47',0,'Misc','Photos','jlm246','Miscast Cabaret','spring',2017,'2017-04-30 03:33:47','2017-04-30 03:33:47',NULL),('lost cabaret photos 03','jpg','2017-04-30 03:33:50',0,'Misc','Photos','jlm246','Miscast Cabaret','spring',2017,'2017-04-30 03:33:50','2017-04-30 03:33:50',NULL),('lost cabaret photos 04','jpg','2017-04-30 03:33:53',0,'Misc','Photos','jlm246','Miscast Cabaret','spring',2017,'2017-04-30 03:33:53','2017-04-30 03:33:53',NULL),('lost cabaret photos 05','jpg','2017-04-30 03:33:56',0,'Misc','Photos','jlm246','Miscast Cabaret','spring',2017,'2017-04-30 03:33:56','2017-04-30 03:33:56',NULL),('lost cabaret photos 06','jpg','2017-04-30 03:34:00',0,'Misc','Photos','jlm246','Miscast Cabaret','spring',2017,'2017-04-30 03:34:00','2017-04-30 03:34:00',NULL),('lost cabaret photos 07','jpg','2017-04-30 03:34:04',0,'Misc','Photos','jlm246','Miscast Cabaret','spring',2017,'2017-04-30 03:34:04','2017-04-30 03:34:04',NULL),('lost cabaret photos 08','jpg','2017-04-30 03:34:08',0,'Misc','Photos','jlm246','Miscast Cabaret','spring',2017,'2017-04-30 03:34:08','2017-04-30 03:34:08',NULL),('lost cabaret photos 09','jpg','2017-04-30 03:34:14',0,'Misc','Photos','jlm246','Miscast Cabaret','spring',2017,'2017-04-30 03:34:14','2017-04-30 03:34:14',NULL),('love to watch her walk away sitzprobe','mp4','2017-04-30 02:23:00',0,'Rehearsal - Sitzprobe','Videos','meg135','Legally Blonde','spring',2017,'2017-04-30 02:23:00','2017-04-30 02:23:00',NULL),('madi casey cabaret','jpg','2017-04-30 03:42:24',0,'Performances','Photos','aap110','Miscast Cabaret','spring',2017,'2017-04-30 03:42:24','2017-04-30 03:42:24',NULL),('madi jafar build','jpg','2017-04-30 04:03:07',0,'Build','Photos','mjc243','Legally Blonde','spring',2017,'2017-04-30 04:03:07','2017-04-30 04:03:07',NULL),('mara aaron','jpg','2017-04-30 05:20:58',0,'Rehearsal - Acting','Photos','meg135','Legally Blonde','spring',2017,'2017-04-30 05:20:58','2017-04-30 05:20:58',NULL),('mara beth jenn','jpg','2017-04-30 02:12:54',0,'Rehearsal - Staff','Photos','meg135','Legally Blonde','spring',2017,'2017-04-30 02:12:54','2017-04-30 02:12:54',NULL),('mara logan','jpg','2017-04-30 03:42:46',0,'Performances','Photos','aap110','Miscast Cabaret','spring',2017,'2017-04-30 03:42:46','2017-04-30 03:42:46',NULL),('mara logan 2','jpg','2017-04-30 03:42:36',0,'Performances','Photos','aap110','Miscast Cabaret','spring',2017,'2017-04-30 03:42:36','2017-04-30 03:42:36',NULL),('miscast-Zach Palumbo','png','2017-02-15 01:06:00',1,'Unique','Graphics - Internal','ztp3','Legally Blonde','spring',2017,'2017-02-15 19:21:32','2017-02-15 19:21:32',NULL),('paulina build','jpg','2017-04-30 04:03:18',0,'Build','Photos','mjc243','Legally Blonde','spring',2017,'2017-04-30 04:03:18','2017-04-30 04:03:18',NULL),('paulina cabaret','jpg','2017-04-30 02:13:39',0,'Performances','Photos','meg135','Miscast Cabaret','spring',2017,'2017-04-30 02:13:39','2017-04-30 02:13:39',NULL),('paulina running','mov','2017-04-30 04:14:14',1,'Blooper','Videos','pmm93','Legally Blonde','spring',2017,'2017-04-30 04:14:14','2017-04-30 04:14:14',NULL),('paulina steven build','jpg','2017-04-30 04:03:30',0,'Build','Photos','mjc243','Legally Blonde','spring',2017,'2017-04-30 04:03:30','2017-04-30 04:03:30',NULL),('positive cabaret','jpg','2017-04-30 03:43:06',0,'Performances','Photos','aap110','Miscast Cabaret','spring',2017,'2017-04-30 03:43:06','2017-04-30 03:43:06',NULL),('positive cabaret 02','jpg','2017-04-30 03:42:56',0,'Performances','Photos','aap110','Miscast Cabaret','spring',2017,'2017-04-30 03:42:56','2017-04-30 03:42:56',NULL),('prod-staff-1-Mara Grigg','jpg','2017-02-06 14:00:00',0,'Rehearsal - Staff','Photos','meg135','Legally Blonde','spring',2017,'2017-02-08 18:29:03','2017-02-08 18:29:03',NULL),('rich cabaret','jpg','2017-04-30 02:17:45',0,'Performance','Photos','meg135','Miscast Cabaret','spring',2017,'2017-04-30 02:17:45','2017-04-30 02:17:45',NULL),('rich mulan miscast','mp4','2017-04-30 02:25:15',0,'Performances','Videos','meg135','Miscast Cabaret','spring',2017,'2017-04-30 02:25:15','2017-04-30 02:25:15',NULL),('rich paulina cabaret','jpg','2017-04-30 03:43:39',0,'Performances','Photos','aap110','Miscast Cabaret','spring',2017,'2017-04-30 03:43:39','2017-04-30 03:43:39',NULL),('rich paulina cabaret 02','jpg','2017-04-30 03:43:15',0,'Performances','Photos','aap110','Miscast Cabaret','spring',2017,'2017-04-30 03:43:15','2017-04-30 03:43:15',NULL),('rich paulina cabaret 03','jpg','2017-04-30 03:43:30',0,'Performances','Photos','aap110','Miscast Cabaret','spring',2017,'2017-04-30 03:43:30','2017-04-30 03:43:30',NULL),('ryan cabaret','jpg','2017-04-30 02:18:05',0,'Performance','Photos','meg135','Miscast Cabaret','spring',2017,'2017-04-30 02:18:05','2017-04-30 02:18:05',NULL),('stage facing','jpg','2017-04-30 04:03:45',0,'Build','Photos','mjc243','Legally Blonde','spring',2017,'2017-04-30 04:03:45','2017-04-30 04:03:45',NULL),('steven jumprope','mp4','2017-04-30 04:02:09',0,'Blooper','Videos','mjc243','Legally Blonde','spring',2017,'2017-04-30 04:02:09','2017-04-30 04:02:09',NULL),('stylish and relaxed','mp4','2017-04-30 02:26:02',0,'Rehearsal - Choreo','Videos','meg135','Legally Blonde','spring',2017,'2017-04-30 02:26:02','2017-04-30 02:26:02',NULL),('tarp','jpg','2017-04-30 04:16:44',1,'Misc','Photos','pmm93','Legally Blonde','spring',2017,'2017-04-30 04:16:44','2017-04-30 04:16:44',NULL),('taylor lb remix','mp4','2017-04-30 02:26:22',0,'Rehearsal - Choreo','Videos','meg135','Legally Blonde','spring',2017,'2017-04-30 02:26:22','2017-04-30 02:26:22',NULL),('turntable base','jpg','2017-04-30 04:04:06',0,'Build','Photos','mjc243','Legally Blonde','spring',2017,'2017-04-30 04:04:06','2017-04-30 04:04:06',NULL),('turntable base 02','jpg','2017-04-30 04:03:59',0,'Build','Photos','mjc243','Legally Blonde','spring',2017,'2017-04-30 04:03:59','2017-04-30 04:03:59',NULL),('vocal rehearsal early 01','jpg','2017-04-30 02:18:30',0,'Rehearsal - Vocals','Photos','meg135','Legally Blonde','spring',2017,'2017-04-30 02:18:30','2017-04-30 02:18:30',NULL),('vocals 05','jpg','2017-04-30 05:21:35',0,'Rehearsal - Vocals','Photos','meg135','Legally Blonde','spring',2017,'2017-04-30 05:21:35','2017-04-30 05:21:35',NULL),('vocals-1-Mara Grigg','jpg','2017-02-06 14:00:00',0,'Rehearsal - Vocals','Photos','meg135','Legally Blonde','spring',2017,'2017-02-08 18:26:43','2017-02-08 18:26:43',NULL),('vocals-2-Mara Grigg','jpg','2017-02-06 14:00:00',0,'Rehearsal - Vocals','Photos','meg135','Legally Blonde','spring',2017,'2017-02-08 18:28:36','2017-02-08 18:28:36',NULL),('vocals-3-Mara Grigg','jpg','2017-02-15 23:57:07',0,'Rehearsal - Vocals','Photos','meg135','Legally Blonde','spring',2017,'2017-02-15 23:57:07','2017-02-15 23:57:07',NULL),('zach alex cabaret','jpg','2017-04-30 03:44:03',0,'Performances','Photos','aap110','Miscast Cabaret','spring',2017,'2017-04-30 03:44:03','2017-04-30 03:44:03',NULL),('zach alex cabaret 02','jpg','2017-04-30 03:43:53',0,'Performances','Photos','aap110','Miscast Cabaret','spring',2017,'2017-04-30 03:43:53','2017-04-30 03:43:53',NULL),('zach amanda cabaret','jpg','2017-04-30 03:44:35',0,'Performances','Photos','aap110','Miscast Cabaret','spring',2017,'2017-04-30 03:44:35','2017-04-30 03:44:35',NULL),('zach amanda cabaret 2','jpg','2017-04-30 03:44:23',0,'Performances','Photos','aap110','Miscast Cabaret','spring',2017,'2017-04-30 03:44:23','2017-04-30 03:44:23',NULL),('zach bendy','jpg','2017-04-30 02:19:15',0,'Unique','Photos','meg135','Legally Blonde','spring',2017,'2017-04-30 02:19:15','2017-04-30 02:19:15',NULL),('zach gibberish','mp4','2017-04-30 05:20:02',0,'Blooper','Videos','meg135','Legally Blonde','spring',2017,'2017-04-30 05:20:02','2017-04-30 05:20:02',NULL),('zach keith amanda sitz','mp4','2017-04-30 03:07:08',0,'Rehearsal - Vocals','Videos','alw121','Legally Blonde','spring',2017,'2017-04-30 03:07:08','2017-04-30 03:07:08',NULL);
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

-- Dump completed on 2017-05-02 11:56:53
