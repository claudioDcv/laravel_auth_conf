-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: dhtmlx_samples
-- ------------------------------------------------------
-- Server version	5.5.41-0ubuntu0.14.04.1

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
-- Table structure for table `gantt_links`
--

DROP TABLE IF EXISTS `gantt_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gantt_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source` int(11) NOT NULL,
  `target` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gantt_links`
--

LOCK TABLES `gantt_links` WRITE;
/*!40000 ALTER TABLE `gantt_links` DISABLE KEYS */;
INSERT INTO `gantt_links` VALUES (1,10,11,'3'),(2,10,15,'0'),(3,16,17,'1'),(4,17,19,'1');
/*!40000 ALTER TABLE `gantt_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gantt_tasks`
--

DROP TABLE IF EXISTS `gantt_tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gantt_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) NOT NULL,
  `start_date` datetime NOT NULL,
  `duration` int(11) NOT NULL,
  `progress` float NOT NULL,
  `sortorder` double NOT NULL DEFAULT '0',
  `parent` int(11) NOT NULL,
  `deadline` datetime DEFAULT NULL,
  `planned_start` datetime DEFAULT NULL,
  `planned_end` datetime DEFAULT NULL,
  `end_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gantt_tasks`
--

LOCK TABLES `gantt_tasks` WRITE;
/*!40000 ALTER TABLE `gantt_tasks` DISABLE KEYS */;
INSERT INTO `gantt_tasks` VALUES (10,'task 1','2010-08-08 00:00:00',4,0.292857,0,0,NULL,NULL,NULL,'2010-08-12 00:00:00'),(11,'Task 1.2','2010-08-03 00:00:00',4,0,0,10,NULL,NULL,NULL,'2010-08-07 00:00:00'),(15,'Task 1.3','2010-08-10 00:00:00',6,0,0,10,NULL,NULL,NULL,'2010-08-15 00:00:00'),(16,'Task 2','2010-08-18 00:00:00',7,0.469388,0,0,NULL,NULL,NULL,'0000-00-00 00:00:00'),(17,'Task 2.1','2010-08-21 00:00:00',5,0.168571,0,16,NULL,NULL,NULL,'2010-08-26 00:00:00'),(19,'Task 2.2','2010-08-20 00:00:00',3,0.652381,0,16,NULL,NULL,NULL,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `gantt_tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduler_events`
--

DROP TABLE IF EXISTS `scheduler_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduler_events` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `event_name` varchar(255) NOT NULL,
  `details` text,
  PRIMARY KEY (`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduler_events`
--

LOCK TABLES `scheduler_events` WRITE;
/*!40000 ALTER TABLE `scheduler_events` DISABLE KEYS */;
INSERT INTO `scheduler_events` VALUES (5,'2010-08-08 05:45:00','2010-08-08 06:45:00','Cross, 4km',NULL),(6,'2010-08-04 12:15:00','2010-08-04 18:25:00','Free time',''),(7,'2010-07-30 10:15:00','2010-07-30 10:20:00','Any',NULL),(8,'2010-07-27 04:45:00','2010-07-27 09:05:00','My event 1',''),(19,'2010-08-10 04:15:00','2010-08-13 05:00:00','My event 2',NULL);
/*!40000 ALTER TABLE `scheduler_events` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-18 16:22:37
