-- MySQL dump 10.13  Distrib 8.0.21, for Linux (x86_64)
--
-- Host: localhost    Database: futsal
-- ------------------------------------------------------
-- Server version	8.0.21-0ubuntu0.20.04.4

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `coach` VALUES ('TEAM A',10,'M'),('TEAM B',15,'M'),('TEAM C',2,'M'),('TEAM D',5,'M');
/*!40000 ALTER TABLE `coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coach_name`
--

DROP TABLE IF EXISTS `coach_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `coach_name` VALUES ('AC','AC','AC','TEAM A'),('BC','BC','BC','TEAM B'),('CC','CC','CC','TEAM C'),('DC','DC','DC','TEAM D');
/*!40000 ALTER TABLE `coach_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `defence`
--

DROP TABLE IF EXISTS `defence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `defence` (
  `pjn` int NOT NULL,
  `team_name` varchar(50) NOT NULL,
  PRIMARY KEY (`team_name`,`pjn`),
  KEY `pjn` (`pjn`,`team_name`),
  CONSTRAINT `defence_ibfk_1` FOREIGN KEY (`pjn`, `team_name`) REFERENCES `player` (`jersey_no`, `team_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `defence`
--

LOCK TABLES `defence` WRITE;
/*!40000 ALTER TABLE `defence` DISABLE KEYS */;
INSERT INTO `defence` VALUES (4,'TEAM A'),(9,'TEAM B'),(14,'TEAM C'),(19,'TEAM D');
/*!40000 ALTER TABLE `defence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forward`
--

DROP TABLE IF EXISTS `forward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forward` (
  `pjn` int NOT NULL,
  `team_name` varchar(50) NOT NULL,
  PRIMARY KEY (`team_name`,`pjn`),
  KEY `pjn` (`pjn`,`team_name`),
  CONSTRAINT `forward_ibfk_1` FOREIGN KEY (`pjn`, `team_name`) REFERENCES `player` (`jersey_no`, `team_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forward`
--

LOCK TABLES `forward` WRITE;
/*!40000 ALTER TABLE `forward` DISABLE KEYS */;
INSERT INTO `forward` VALUES (1,'TEAM A'),(2,'TEAM A'),(6,'TEAM B'),(7,'TEAM B'),(11,'TEAM C'),(12,'TEAM C'),(16,'TEAM D'),(17,'TEAM D');
/*!40000 ALTER TABLE `forward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `futsal_match`
--

DROP TABLE IF EXISTS `futsal_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `futsal_match`
--

LOCK TABLES `futsal_match` WRITE;
/*!40000 ALTER TABLE `futsal_match` DISABLE KEYS */;
INSERT INTO `futsal_match` VALUES (1,'2020-01-01',0,NULL,'1111111111'),(2,'2020-02-02',0,NULL,'1111111111'),(3,'2020-03-03',0,NULL,'2222222222'),(4,'2021-01-01',0,NULL,'2222222222'),(5,'2021-02-02',0,NULL,'3333333333'),(6,'2021-03-03',0,NULL,'3333333333');
/*!40000 ALTER TABLE `futsal_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goal_scored`
--

DROP TABLE IF EXISTS `goal_scored`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goal_scored` (
  `pjn` int NOT NULL,
  `match_id` int NOT NULL,
  `team_name` varchar(50) NOT NULL,
  `nog` int DEFAULT NULL,
  PRIMARY KEY (`pjn`,`team_name`,`match_id`),
  KEY `team_name` (`team_name`,`pjn`),
  KEY `match_id` (`match_id`),
  CONSTRAINT `goal_scored_ibfk_1` FOREIGN KEY (`team_name`, `pjn`) REFERENCES `player` (`team_name`, `jersey_no`),
  CONSTRAINT `goal_scored_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `futsal_match` (`match_id`)
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goalrakshak` (
  `pjn` int NOT NULL,
  `team_name` varchar(50) NOT NULL,
  PRIMARY KEY (`team_name`,`pjn`),
  KEY `pjn` (`pjn`,`team_name`),
  CONSTRAINT `goalrakshak_ibfk_1` FOREIGN KEY (`pjn`, `team_name`) REFERENCES `player` (`jersey_no`, `team_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goalrakshak`
--

LOCK TABLES `goalrakshak` WRITE;
/*!40000 ALTER TABLE `goalrakshak` DISABLE KEYS */;
INSERT INTO `goalrakshak` VALUES (5,'TEAM A'),(10,'TEAM B'),(15,'TEAM C'),(20,'TEAM D');
/*!40000 ALTER TABLE `goalrakshak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `midfielder`
--

DROP TABLE IF EXISTS `midfielder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `midfielder` (
  `pjn` int NOT NULL,
  `team_name` varchar(50) NOT NULL,
  PRIMARY KEY (`team_name`,`pjn`),
  KEY `pjn` (`pjn`,`team_name`),
  CONSTRAINT `midfielder_ibfk_1` FOREIGN KEY (`pjn`, `team_name`) REFERENCES `player` (`jersey_no`, `team_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `midfielder`
--

LOCK TABLES `midfielder` WRITE;
/*!40000 ALTER TABLE `midfielder` DISABLE KEYS */;
INSERT INTO `midfielder` VALUES (3,'TEAM A'),(8,'TEAM B'),(13,'TEAM C'),(18,'TEAM D');
/*!40000 ALTER TABLE `midfielder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `player` VALUES ('TEAM A','A','A','A','1990-10-10',1,10,'forward'),('TEAM A','B','B','B','1996-01-10',2,4,'forward'),('TEAM A','C','C','C','1993-10-10',3,0,'midfielder'),('TEAM A','D','D','D','1990-10-10',4,6,'defence'),('TEAM A','E','E','E','1989-10-07',5,9,'goalrakshak'),('TEAM B','F','F','F','1970-10-10',6,14,'forward'),('TEAM B','G','G','G','1993-10-07',7,19,'forward'),('TEAM B','H','H','H','1994-10-03',8,4,'midfielder'),('TEAM B','I','I','I','1964-10-09',9,20,'defence'),('TEAM B','J','J','J','1990-10-04',10,15,'goalrakshak'),('TEAM C','K','K','K','1990-10-03',11,4,'forward'),('TEAM C','L','L','L','1990-10-03',12,30,'forward'),('TEAM C','M','M','M','1990-11-10',13,4,'midfielder'),('TEAM C','N','N','N','1980-10-10',14,6,'defence'),('TEAM C','O','O','O','1995-10-10',15,15,'goalrakshak'),('TEAM D','P','P','P','2001-10-10',16,10,'forward'),('TEAM D','Q','Q','Q','1990-10-10',17,17,'forward'),('TEAM D','R','R','R','1990-10-15',18,10,'midfielder'),('TEAM D','S','S','S','1998-10-19',19,5,'defence'),('TEAM D','T','T','T','1995-10-20',20,1,'goalrakshak');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_match`
--

DROP TABLE IF EXISTS `player_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player_match` (
  `pjn` int NOT NULL,
  `match_id` int NOT NULL,
  `team_name` varchar(50) NOT NULL,
  PRIMARY KEY (`pjn`,`team_name`,`match_id`),
  KEY `team_name` (`team_name`,`pjn`),
  KEY `match_id` (`match_id`),
  CONSTRAINT `player_match_ibfk_1` FOREIGN KEY (`team_name`, `pjn`) REFERENCES `player` (`team_name`, `jersey_no`),
  CONSTRAINT `player_match_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `futsal_match` (`match_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_match`
--

LOCK TABLES `player_match` WRITE;
/*!40000 ALTER TABLE `player_match` DISABLE KEYS */;
INSERT INTO `player_match` VALUES (1,1,'TEAM A'),(2,1,'TEAM A'),(3,1,'TEAM A'),(4,1,'TEAM A'),(5,1,'TEAM A'),(6,1,'TEAM B'),(7,1,'TEAM B'),(8,1,'TEAM B'),(9,1,'TEAM B'),(10,1,'TEAM B'),(1,2,'TEAM A'),(2,2,'TEAM A'),(3,2,'TEAM A'),(4,2,'TEAM A'),(5,2,'TEAM A'),(11,2,'TEAM C'),(12,2,'TEAM C'),(13,2,'TEAM C'),(14,2,'TEAM C'),(15,2,'TEAM C'),(1,3,'TEAM A'),(2,3,'TEAM A'),(3,3,'TEAM A'),(4,3,'TEAM A'),(5,3,'TEAM A'),(16,3,'TEAM D'),(17,3,'TEAM D'),(18,3,'TEAM D'),(19,3,'TEAM D'),(20,3,'TEAM D'),(6,4,'TEAM B'),(7,4,'TEAM B'),(8,4,'TEAM B'),(9,4,'TEAM B'),(10,4,'TEAM B'),(11,4,'TEAM C'),(12,4,'TEAM C'),(13,4,'TEAM C'),(14,4,'TEAM C'),(15,4,'TEAM C'),(6,5,'TEAM B'),(7,5,'TEAM B'),(8,5,'TEAM B'),(9,5,'TEAM B'),(10,5,'TEAM B'),(16,5,'TEAM D'),(17,5,'TEAM D'),(18,5,'TEAM D'),(19,5,'TEAM D'),(20,5,'TEAM D'),(11,6,'TEAM C'),(12,6,'TEAM C'),(13,6,'TEAM C'),(14,6,'TEAM C'),(15,6,'TEAM C'),(16,6,'TEAM D'),(17,6,'TEAM D'),(18,6,'TEAM D'),(19,6,'TEAM D'),(20,6,'TEAM D');
/*!40000 ALTER TABLE `player_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referee`
--

DROP TABLE IF EXISTS `referee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `referee` (
  `referee_id` int NOT NULL AUTO_INCREMENT,
  `matches_judged` int DEFAULT '0',
  `first_name` varchar(20) DEFAULT NULL,
  `middle_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`referee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `referee`
--

LOCK TABLES `referee` WRITE;
/*!40000 ALTER TABLE `referee` DISABLE KEYS */;
INSERT INTO `referee` VALUES (1,8,'AR','AR','AR'),(2,10,'BR','BR','BR');
/*!40000 ALTER TABLE `referee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referee_match`
--

DROP TABLE IF EXISTS `referee_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `referee_match` VALUES (1,1),(2,1),(5,1),(3,2),(4,2),(6,2);
/*!40000 ALTER TABLE `referee_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spectator`
--

DROP TABLE IF EXISTS `spectator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `spectator` VALUES ('CC','CC','CC','6666666666'),('BB','BB','BB','8888888888'),('AA','AA','AA','9999999999');
/*!40000 ALTER TABLE `spectator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spectator_match`
--

DROP TABLE IF EXISTS `spectator_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `spectator_match` VALUES (3,'6666666666'),(2,'8888888888'),(1,'9999999999');
/*!40000 ALTER TABLE `spectator_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spectator_number`
--

DROP TABLE IF EXISTS `spectator_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `spectator_number` VALUES ('9999999999','7890123456');
/*!40000 ALTER TABLE `spectator_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stadium`
--

DROP TABLE IF EXISTS `stadium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `stadium` VALUES ('AS',9,'1111111111'),('BS',8,'2222222222'),('CS',5,'3333333333'),('D',1,'7890123456');
/*!40000 ALTER TABLE `stadium` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stadium_address`
--

DROP TABLE IF EXISTS `stadium_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `stadium_address` VALUES ('AAS','AAS','AAS','AAS','1111111111'),('BBS','BBS','BBS','BBS','2222222222'),('CCS','CCS','CCS','CCS','3333333333'),('D','D','D','D','7890123456');
/*!40000 ALTER TABLE `stadium_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stadium_number`
--

DROP TABLE IF EXISTS `stadium_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `stadium_number` VALUES ('1111111111','4567890123'),('1111111111','5678901234'),('7890123456','2345678901');
/*!40000 ALTER TABLE `stadium_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `team` VALUES ('TEAM A',4,2,1),('TEAM B',5,1,0),('TEAM C',0,0,0),('TEAM D',3,5,1);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_captain`
--

DROP TABLE IF EXISTS `team_captain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `team_captain` (
  `pjn` int NOT NULL,
  `team_name` varchar(50) NOT NULL,
  PRIMARY KEY (`team_name`,`pjn`),
  KEY `pjn` (`pjn`,`team_name`),
  CONSTRAINT `team_captain_ibfk_1` FOREIGN KEY (`pjn`, `team_name`) REFERENCES `player` (`jersey_no`, `team_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_captain`
--

LOCK TABLES `team_captain` WRITE;
/*!40000 ALTER TABLE `team_captain` DISABLE KEYS */;
INSERT INTO `team_captain` VALUES (1,'TEAM A'),(6,'TEAM B'),(11,'TEAM C'),(16,'TEAM D');
/*!40000 ALTER TABLE `team_captain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_match`
--

DROP TABLE IF EXISTS `team_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
INSERT INTO `team_match` VALUES (1,'TEAM A'),(2,'TEAM A'),(3,'TEAM A'),(1,'TEAM B'),(4,'TEAM B'),(5,'TEAM B'),(2,'TEAM C'),(4,'TEAM C'),(6,'TEAM C'),(3,'TEAM D'),(5,'TEAM D'),(6,'TEAM D');
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

-- Dump completed on 2020-10-08 22:05:06
