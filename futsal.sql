-- MySQL dump 10.13  Distrib 5.7.31, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: futsal
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coach` (
  `team_name` varchar(50) NOT NULL,
  `experience` int DEFAULT '0',
  `gender` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`team_name`),
  CONSTRAINT `coach_ibfk_1` FOREIGN KEY (`team_name`) REFERENCES `team` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach`
--

LOCK TABLES `coach` WRITE;
/*!40000 ALTER TABLE `coach` DISABLE KEYS */;
/*!40000 ALTER TABLE `coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach_name`
--

DROP TABLE IF EXISTS `coach_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coach_name` (
  `first_name` varchar(20) DEFAULT NULL,
  `middle_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `team_name` varchar(50) NOT NULL,
  PRIMARY KEY (`team_name`),
  CONSTRAINT `coach_name_ibfk_1` FOREIGN KEY (`team_name`) REFERENCES `team` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach_name`
--

LOCK TABLES `coach_name` WRITE;
/*!40000 ALTER TABLE `coach_name` DISABLE KEYS */;
/*!40000 ALTER TABLE `coach_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `defence`
--

DROP TABLE IF EXISTS `defence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `defence` (
  `pjn` int NOT NULL,
  `team_name` varchar(50) NOT NULL,
  PRIMARY KEY (`team_name`,`pjn`),
  KEY `pjn` (`pjn`),
  CONSTRAINT `defence_ibfk_1` FOREIGN KEY (`pjn`) REFERENCES `player` (`jersey_no`),
  CONSTRAINT `defence_ibfk_2` FOREIGN KEY (`team_name`) REFERENCES `team` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defence`
--

LOCK TABLES `defence` WRITE;
/*!40000 ALTER TABLE `defence` DISABLE KEYS */;
/*!40000 ALTER TABLE `defence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forward`
--

DROP TABLE IF EXISTS `forward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forward` (
  `pjn` int NOT NULL,
  `team_name` varchar(50) NOT NULL,
  PRIMARY KEY (`team_name`,`pjn`),
  KEY `pjn` (`pjn`),
  CONSTRAINT `forward_ibfk_1` FOREIGN KEY (`pjn`) REFERENCES `player` (`jersey_no`),
  CONSTRAINT `forward_ibfk_2` FOREIGN KEY (`team_name`) REFERENCES `team` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forward`
--

LOCK TABLES `forward` WRITE;
/*!40000 ALTER TABLE `forward` DISABLE KEYS */;
/*!40000 ALTER TABLE `forward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `futsal_match`
--

DROP TABLE IF EXISTS `futsal_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `futsal_match` (
  `match_id` int NOT NULL AUTO_INCREMENT,
  `match_date` date DEFAULT NULL,
  `total_goals` int DEFAULT '0',
  `winner_id` varchar(50) DEFAULT NULL,
  `sfpn` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`match_id`),
  KEY `winner_id` (`winner_id`),
  KEY `sfpn` (`sfpn`),
  CONSTRAINT `futsal_match_ibfk_1` FOREIGN KEY (`winner_id`) REFERENCES `team` (`name`),
  CONSTRAINT `futsal_match_ibfk_2` FOREIGN KEY (`sfpn`) REFERENCES `stadium` (`fpn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `futsal_match`
--

LOCK TABLES `futsal_match` WRITE;
/*!40000 ALTER TABLE `futsal_match` DISABLE KEYS */;
/*!40000 ALTER TABLE `futsal_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goal_scored`
--

DROP TABLE IF EXISTS `goal_scored`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goal_scored` (
  `pjn` int NOT NULL,
  `match_id` int NOT NULL,
  `team_name` varchar(50) NOT NULL,
  `nog` int DEFAULT '0',
  PRIMARY KEY (`team_name`,`pjn`,`match_id`),
  KEY `match_id` (`match_id`),
  KEY `pjn` (`pjn`),
  CONSTRAINT `goal_scored_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `futsal_match` (`match_id`),
  CONSTRAINT `goal_scored_ibfk_2` FOREIGN KEY (`pjn`) REFERENCES `player` (`jersey_no`),
  CONSTRAINT `goal_scored_ibfk_3` FOREIGN KEY (`team_name`) REFERENCES `team` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal_scored`
--

LOCK TABLES `goal_scored` WRITE;
/*!40000 ALTER TABLE `goal_scored` DISABLE KEYS */;
/*!40000 ALTER TABLE `goal_scored` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goalrakshak`
--

DROP TABLE IF EXISTS `goalrakshak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goalrakshak` (
  `pjn` int NOT NULL,
  `team_name` varchar(50) NOT NULL,
  PRIMARY KEY (`team_name`,`pjn`),
  KEY `pjn` (`pjn`),
  CONSTRAINT `goalrakshak_ibfk_1` FOREIGN KEY (`pjn`) REFERENCES `player` (`jersey_no`),
  CONSTRAINT `goalrakshak_ibfk_2` FOREIGN KEY (`team_name`) REFERENCES `team` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goalrakshak`
--

LOCK TABLES `goalrakshak` WRITE;
/*!40000 ALTER TABLE `goalrakshak` DISABLE KEYS */;
/*!40000 ALTER TABLE `goalrakshak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `midfielder`
--

DROP TABLE IF EXISTS `midfielder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `midfielder` (
  `pjn` int NOT NULL,
  `team_name` varchar(50) NOT NULL,
  PRIMARY KEY (`team_name`,`pjn`),
  KEY `pjn` (`pjn`),
  CONSTRAINT `midfielder_ibfk_1` FOREIGN KEY (`pjn`) REFERENCES `player` (`jersey_no`),
  CONSTRAINT `midfielder_ibfk_2` FOREIGN KEY (`team_name`) REFERENCES `team` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `midfielder`
--

LOCK TABLES `midfielder` WRITE;
/*!40000 ALTER TABLE `midfielder` DISABLE KEYS */;
/*!40000 ALTER TABLE `midfielder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player` (
  `team_name` varchar(50) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `middle_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `jersey_no` int NOT NULL,
  `total_goals` int NOT NULL DEFAULT '0',
  `position` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`jersey_no`,`team_name`),
  KEY `team_name` (`team_name`),
  CONSTRAINT `player_ibfk_1` FOREIGN KEY (`team_name`) REFERENCES `team` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_match`
--

DROP TABLE IF EXISTS `player_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_match` (
  `pjn` int NOT NULL,
  `match_id` int NOT NULL,
  `team_name` varchar(50) NOT NULL,
  PRIMARY KEY (`team_name`,`pjn`,`match_id`),
  KEY `match_id` (`match_id`),
  KEY `pjn` (`pjn`),
  CONSTRAINT `player_match_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `futsal_match` (`match_id`),
  CONSTRAINT `player_match_ibfk_2` FOREIGN KEY (`pjn`) REFERENCES `player` (`jersey_no`),
  CONSTRAINT `player_match_ibfk_3` FOREIGN KEY (`team_name`) REFERENCES `team` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_match`
--

LOCK TABLES `player_match` WRITE;
/*!40000 ALTER TABLE `player_match` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referee`
--

DROP TABLE IF EXISTS `referee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referee` (
  `referee_id` int NOT NULL AUTO_INCREMENT,
  `matches_judged` int DEFAULT '0',
  `first_name` varchar(20) DEFAULT NULL,
  `middle_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`referee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referee`
--

LOCK TABLES `referee` WRITE;
/*!40000 ALTER TABLE `referee` DISABLE KEYS */;
/*!40000 ALTER TABLE `referee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referee_match`
--

DROP TABLE IF EXISTS `referee_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `referee_match` (
  `match_id` int NOT NULL,
  `referee_id` int NOT NULL,
  PRIMARY KEY (`match_id`,`referee_id`),
  KEY `referee_id` (`referee_id`),
  CONSTRAINT `referee_match_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `futsal_match` (`match_id`),
  CONSTRAINT `referee_match_ibfk_2` FOREIGN KEY (`referee_id`) REFERENCES `referee` (`referee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referee_match`
--

LOCK TABLES `referee_match` WRITE;
/*!40000 ALTER TABLE `referee_match` DISABLE KEYS */;
/*!40000 ALTER TABLE `referee_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spectator`
--

DROP TABLE IF EXISTS `spectator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spectator` (
  `first_name` varchar(20) DEFAULT NULL,
  `middle_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `fpn` varchar(20) NOT NULL,
  PRIMARY KEY (`fpn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spectator`
--

LOCK TABLES `spectator` WRITE;
/*!40000 ALTER TABLE `spectator` DISABLE KEYS */;
/*!40000 ALTER TABLE `spectator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spectator_match`
--

DROP TABLE IF EXISTS `spectator_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spectator_match` (
  `match_id` int NOT NULL,
  `spfpn` varchar(50) NOT NULL,
  PRIMARY KEY (`match_id`,`spfpn`),
  KEY `spfpn` (`spfpn`),
  CONSTRAINT `spectator_match_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `futsal_match` (`match_id`),
  CONSTRAINT `spectator_match_ibfk_2` FOREIGN KEY (`spfpn`) REFERENCES `spectator` (`fpn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spectator_match`
--

LOCK TABLES `spectator_match` WRITE;
/*!40000 ALTER TABLE `spectator_match` DISABLE KEYS */;
/*!40000 ALTER TABLE `spectator_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spectator_number`
--

DROP TABLE IF EXISTS `spectator_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spectator_number` (
  `fpn` varchar(50) NOT NULL,
  `pn` varchar(20) NOT NULL,
  PRIMARY KEY (`fpn`,`pn`),
  CONSTRAINT `spectator_number_ibfk_1` FOREIGN KEY (`fpn`) REFERENCES `spectator` (`fpn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spectator_number`
--

LOCK TABLES `spectator_number` WRITE;
/*!40000 ALTER TABLE `spectator_number` DISABLE KEYS */;
/*!40000 ALTER TABLE `spectator_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stadium`
--

DROP TABLE IF EXISTS `stadium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stadium` (
  `name` varchar(256) DEFAULT NULL,
  `nomp` int DEFAULT '0',
  `fpn` varchar(20) NOT NULL,
  PRIMARY KEY (`fpn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadium`
--

LOCK TABLES `stadium` WRITE;
/*!40000 ALTER TABLE `stadium` DISABLE KEYS */;
/*!40000 ALTER TABLE `stadium` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stadium_address`
--

DROP TABLE IF EXISTS `stadium_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stadium_address` (
  `building_name` varchar(50) DEFAULT NULL,
  `street_name` varchar(50) DEFAULT NULL,
  `area` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `fpn` varchar(20) NOT NULL,
  PRIMARY KEY (`fpn`),
  CONSTRAINT `stadium_address_ibfk_1` FOREIGN KEY (`fpn`) REFERENCES `stadium` (`fpn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadium_address`
--

LOCK TABLES `stadium_address` WRITE;
/*!40000 ALTER TABLE `stadium_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `stadium_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stadium_number`
--

DROP TABLE IF EXISTS `stadium_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stadium_number` (
  `sfpn` varchar(50) NOT NULL,
  `pn` varchar(20) NOT NULL,
  PRIMARY KEY (`sfpn`,`pn`),
  CONSTRAINT `stadium_number_ibfk_1` FOREIGN KEY (`sfpn`) REFERENCES `stadium` (`fpn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadium_number`
--

LOCK TABLES `stadium_number` WRITE;
/*!40000 ALTER TABLE `stadium_number` DISABLE KEYS */;
/*!40000 ALTER TABLE `stadium_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `name` varchar(50) NOT NULL,
  `wins` int DEFAULT '0',
  `losses` int DEFAULT '0',
  `draw` int DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_captain`
--

DROP TABLE IF EXISTS `team_captain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_captain` (
  `pjn` int DEFAULT NULL,
  `team_name` varchar(50) NOT NULL,
  PRIMARY KEY (`team_name`),
  KEY `pjn` (`pjn`),
  CONSTRAINT `team_captain_ibfk_1` FOREIGN KEY (`pjn`) REFERENCES `player` (`jersey_no`),
  CONSTRAINT `team_captain_ibfk_2` FOREIGN KEY (`team_name`) REFERENCES `team` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_captain`
--

LOCK TABLES `team_captain` WRITE;
/*!40000 ALTER TABLE `team_captain` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_captain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_match`
--

DROP TABLE IF EXISTS `team_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_match` (
  `match_id` int NOT NULL,
  `team_name` varchar(50) NOT NULL,
  PRIMARY KEY (`match_id`,`team_name`),
  KEY `team_name` (`team_name`),
  CONSTRAINT `team_match_ibfk_1` FOREIGN KEY (`match_id`) REFERENCES `futsal_match` (`match_id`),
  CONSTRAINT `team_match_ibfk_2` FOREIGN KEY (`team_name`) REFERENCES `team` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_match`
--

LOCK TABLES `team_match` WRITE;
/*!40000 ALTER TABLE `team_match` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_match` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-04  3:27:23
