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
-- Table structure for table `email_attr`
--

DROP TABLE IF EXISTS `email_attr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `email_attr` (
  `ID` int NOT NULL,
  `email_name` varchar(255) DEFAULT NULL,
  `reciprocity` int DEFAULT NULL,
  `scarcity` int DEFAULT NULL,
  `authority` int DEFAULT NULL,
  `consistency` int DEFAULT NULL,
  `liking` int DEFAULT NULL,
  `social_proof` int DEFAULT NULL,
  `earning` int DEFAULT NULL,
  `hidden_link` int DEFAULT NULL,
  `grammar_mistakes` int DEFAULT NULL,
  `spoofing` int DEFAULT NULL,
  `isPhish` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `email_attr`
--

LOCK TABLES `email_attr` WRITE;
/*!40000 ALTER TABLE `email_attr` DISABLE KEYS */;
INSERT INTO `email_attr` VALUES (0,'Amazon_Account_P',30,25,50,10,70,70,0,80,80,20,1),(1,'Amazon_Account2_P',70,55,20,10,70,70,0,0,80,20,1),(2,'Amazon_BuonoPrime',80,65,10,10,70,70,50,80,10,80,0),(3,'Amazon_ModificaAccount_P',30,30,70,60,70,70,0,0,20,100,1),(4,'Amazon_PasswordReset',60,30,20,80,70,70,0,30,0,100,0),(5,'Amazon_Password_P',60,30,20,80,70,70,0,80,0,100,1),(6,'Amazon_ScontoRitiroAmazon',80,40,30,50,70,70,50,50,0,100,0),(7,'Amazon_Sconto_P',70,40,50,20,70,70,70,70,2,100,1),(8,'Enel_Bolletta_P',20,80,80,30,40,60,0,80,0,100,1),(9,'Facebook_AttivitàSospette_P',80,30,60,10,30,30,0,80,0,100,1),(10,'Facebook_Lotteria_P',80,80,30,0,30,30,100,80,80,30,1),(11,'Facebook_ModificaPassword',70,40,70,10,30,30,0,60,30,80,0),(12,'Google_AccountDisattivato',0,60,90,0,60,80,0,60,0,70,0),(13,'Google_AccountDisattivato_P',20,60,100,0,60,80,0,0,0,70,1),(14,'Google_AccountSettings',40,0,70,40,60,80,0,20,0,70,0),(15,'Google_AvvisoSicurezza',80,30,70,40,60,80,0,80,20,80,0),(16,'Google_PasswordTrovateOnline',80,30,80,30,60,80,0,30,50,40,0),(17,'Google_Password_P',80,30,70,40,60,80,0,0,70,40,1),(18,'Google_Questioanri_P',50,40,60,0,60,80,50,80,50,30,1),(19,'Instagram_Accesso_P',60,20,50,10,50,60,0,0,70,60,1),(20,'Instagram_AttivitàSospette_P',70,30,70,20,50,60,0,80,60,60,1),(21,'LucaCoscioni_Donazioni_P',40,20,10,20,70,70,0,60,0,90,1),(22,'LucaCoscioni_Template',40,20,10,20,70,70,0,0,0,90,0),(23,'Netflix_Password',40,10,40,20,50,80,0,60,0,40,0),(24,'Netflix_Password_P',60,30,70,20,50,80,0,60,80,90,1),(25,'Poste_Cashback',70,10,20,20,30,100,60,40,10,50,0),(26,'Poste_Password_P',40,30,30,20,30,100,0,90,20,70,1),(27,'Poste_PosteId',40,30,30,20,30,100,0,0,20,50,0),(28,'Poste_Saldi',70,40,10,10,30,100,50,30,20,50,0),(29,'STC_Template',30,50,40,20,100,70,0,10,30,80,0),(30,'STC_Template_P',30,50,40,20,100,70,0,90,30,80,1);
/*!40000 ALTER TABLE `email_attr` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-03 20:58:16
