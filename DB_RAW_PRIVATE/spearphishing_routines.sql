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
-- Temporary view structure for view `results`
--

DROP TABLE IF EXISTS `results`;
/*!50001 DROP VIEW IF EXISTS `results`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `results` AS SELECT 
 1 AS `ParticipantID`,
 1 AS `Gender`,
 1 AS `IsOver30`,
 1 AS `isPhishing`,
 1 AS `IsJudgedAsPhishing`,
 1 AS `Extraversion`,
 1 AS `Agreeableness`,
 1 AS `Openness`,
 1 AS `Neuroticism`,
 1 AS `Conscientiousness`,
 1 AS `email_ID`,
 1 AS `Reciprocity`,
 1 AS `Scarcity`,
 1 AS `Authority`,
 1 AS `Consistency`,
 1 AS `SocialProof`,
 1 AS `Liking`,
 1 AS `Earning`,
 1 AS `HiddenLinks`,
 1 AS `GrammarMistakes`,
 1 AS `Spoofing`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `emails_filtered`
--

DROP TABLE IF EXISTS `emails_filtered`;
/*!50001 DROP VIEW IF EXISTS `emails_filtered`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `emails_filtered` AS SELECT 
 1 AS `evaluation_ID`,
 1 AS `email_ID`,
 1 AS `isPhishing`,
 1 AS `Reciprocity`,
 1 AS `Scarcity`,
 1 AS `Authority`,
 1 AS `Consistency`,
 1 AS `Liking`,
 1 AS `SocialProof`,
 1 AS `Earning`,
 1 AS `HiddenLinks`,
 1 AS `GrammarMistakes`,
 1 AS `Spoofing`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `valid_users`
--

DROP TABLE IF EXISTS `valid_users`;
/*!50001 DROP VIEW IF EXISTS `valid_users`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `valid_users` AS SELECT 
 1 AS `email`,
 1 AS `participant_number`,
 1 AS `sex`,
 1 AS `age_category`,
 1 AS `extraversion`,
 1 AS `agreebleness`,
 1 AS `imagination`,
 1 AS `nevroticism`,
 1 AS `consciousness`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `results`
--

/*!50001 DROP VIEW IF EXISTS `results`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `results` AS select `vu`.`participant_number` AS `ParticipantID`,`vu`.`sex` AS `Gender`,`vu`.`age_category` AS `IsOver30`,`ef`.`isPhishing` AS `isPhishing`,`e`.`is_eval_phish` AS `IsJudgedAsPhishing`,`vu`.`extraversion` AS `Extraversion`,`vu`.`agreebleness` AS `Agreeableness`,`vu`.`imagination` AS `Openness`,`vu`.`nevroticism` AS `Neuroticism`,`vu`.`consciousness` AS `Conscientiousness`,`ef`.`email_ID` AS `email_ID`,`ef`.`Reciprocity` AS `Reciprocity`,`ef`.`Scarcity` AS `Scarcity`,`ef`.`Authority` AS `Authority`,`ef`.`Consistency` AS `Consistency`,`ef`.`SocialProof` AS `SocialProof`,`ef`.`Liking` AS `Liking`,`ef`.`Earning` AS `Earning`,`ef`.`HiddenLinks` AS `HiddenLinks`,`ef`.`GrammarMistakes` AS `GrammarMistakes`,`ef`.`Spoofing` AS `Spoofing` from ((`valid_users` `vu` join `evals` `e`) join `emails_filtered` `ef`) where ((`vu`.`email` = `e`.`FK_email`) and (`e`.`FK_id` = `ef`.`evaluation_ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `emails_filtered`
--

/*!50001 DROP VIEW IF EXISTS `emails_filtered`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `emails_filtered` AS select `e`.`id` AS `evaluation_ID`,`a`.`ID` AS `email_ID`,`a`.`isPhish` AS `isPhishing`,`a`.`reciprocity` AS `Reciprocity`,`a`.`scarcity` AS `Scarcity`,`a`.`authority` AS `Authority`,`a`.`consistency` AS `Consistency`,`a`.`liking` AS `Liking`,`a`.`social_proof` AS `SocialProof`,`a`.`earning` AS `Earning`,`a`.`hidden_link` AS `HiddenLinks`,`a`.`grammar_mistakes` AS `GrammarMistakes`,`a`.`spoofing` AS `Spoofing` from (`emails` `e` join `email_attr` `a`) where (`a`.`ID` = (`e`.`id` % 31)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `valid_users`
--

/*!50001 DROP VIEW IF EXISTS `valid_users`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `valid_users` AS select `users`.`email` AS `email`,`users`.`participant_number` AS `participant_number`,`users`.`sex` AS `sex`,`users`.`age_category` AS `age_category`,`bigfive`.`extraversion` AS `extraversion`,`bigfive`.`agreebleness` AS `agreebleness`,`bigfive`.`imagination` AS `imagination`,`bigfive`.`nevroticism` AS `nevroticism`,`bigfive`.`consciousness` AS `consciousness` from (`users` join `bigfive`) where ((`users`.`email` = `bigfive`.`u_email`) and `users`.`email` in (select `evals`.`FK_email` from `evals` group by `evals`.`FK_email`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-03 20:58:17
