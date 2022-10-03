CREATE DATABASE  IF NOT EXISTS `spearphishing` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `spearphishing`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: spearphishing
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bigfive`
--

DROP TABLE IF EXISTS `bigfive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bigfive` (
  `u_email` varchar(255) DEFAULT NULL,
  `extraversion` int DEFAULT NULL,
  `agreebleness` int DEFAULT NULL,
  `imagination` int DEFAULT NULL,
  `nevroticism` int DEFAULT NULL,
  `consciousness` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bigfive`
--

LOCK TABLES `bigfive` WRITE;
/*!40000 ALTER TABLE `bigfive` DISABLE KEYS */;
INSERT INTO `bigfive` VALUES ('enzamonniello@alice.it',12,13,13,13,13),('fabio1681@live.it',14,17,19,18,17),('monbiagio@libero.it',12,12,16,14,15),('giacomo.monniello22@gmail.com',13,14,15,12,18),('g.fanelli1371@gmail.com',10,13,11,12,15),('davide.colafemmina@gmail.com',9,14,14,17,9),('nicola.2690@hotmail.it',14,16,20,6,16),('dipalo.martina@gmail.com',12,18,14,18,7),('anniballomichela@gmail.com',17,20,16,18,9),('a.campanelli3@studenti.uniba.it',17,18,18,13,14),('ermelinda_granato@virgilio.it',12,16,16,14,13),('raffaelefanelli1005@gmail.com',12,15,14,16,13),('ivanfanelli@gmail.com',12,19,18,13,11),('dariofanelli18@gmail.com',10,17,15,14,18),('superfurios@gmail.com',13,16,9,5,12),('rilievo951@gmail.com',8,16,15,14,11),('eridb2000@gmail.com',7,14,19,13,13),('gianfranco.romito@gmail.com',13,18,18,11,15),('cristina.spalletta1991@gmail.com',9,14,13,8,15),('mariateresa.m.1993@gmail.com',14,18,14,14,16),('pasqualemonniello1337@gmail.com',15,16,14,15,11),('flafucilli@gmail.com',9,20,18,14,8),('gabrieleregina98@gmail.com',13,13,17,15,14),('davide.checchia1@gmail.com',16,10,17,11,7),('dairecelesti@gmail.com',18,20,16,6,17),('domdibari@libero.it',13,16,19,14,17),('frae.ritrovato@gmail.com',13,17,15,13,15),('marmarmar1992@gmail.com',15,18,19,14,15),('robyarci@hotmail.it',11,18,16,10,15),('gaia.ciannamea1997@gmail.com',10,20,14,14,14),('coluccigiandomenico@gmail.com',17,16,13,9,15),('93.leo.fia@gmail.com',11,16,15,14,12),('mariagiovannaraguso66@gmail.com',12,13,16,11,12),('l1d@hotmail.it',14,16,13,16,14),('fraeda@libero.it',14,20,8,12,11),('davide91bari@hotmail.it',11,11,13,9,14),('gaiaattanasi@virgilio.it',13,20,14,15,16),('fraste19@gmail.com',8,20,10,16,17),('marcolek24@gmail.com',13,20,17,14,13),('silviacapone97@gmail.com',12,18,17,16,12),('lulucacior@gmail.com',14,18,19,11,14),('mariangelazonna82@gmail.com',12,19,11,16,14),('giorgiarebecca@hotmail.com',9,19,15,16,16),('rossana.colucci86@gmail.com',8,14,15,11,14),('vitafrascaro@libero.it',12,13,12,14,16),('bysyzeen@gmail.com',8,20,16,12,13),('lorenzo.berni@icloud.com',19,18,17,17,17),('francesco100@hotmail.it',5,13,14,14,13),('deborahroncone98@gmail.com',13,20,16,12,18),('depasquale.caterina1@gmail.com',12,14,13,11,15),('domi0312@hotmail.it',11,20,18,13,19),('nataliagodeas@gmail.com',11,12,14,14,12),('ronconerenata11@gmail.com',20,18,12,18,14),('marmarmar1963@gmail.com',15,14,12,12,14);
/*!40000 ALTER TABLE `bigfive` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-03 20:58:17
