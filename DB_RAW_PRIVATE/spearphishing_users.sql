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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `email` varchar(255) NOT NULL,
  `fname` varchar(15) NOT NULL,
  `lname` varchar(25) NOT NULL,
  `position` varchar(40) DEFAULT NULL,
  `phonenumber` varchar(10) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `age_category` int DEFAULT NULL,
  `participant_number` int DEFAULT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('93.leo.fia@gmail.com','Fiammetta','Leoni','','','F',0,1),('a.campanelli3@studenti.uniba.it','Aldo','Campanelli','','','M',1,2),('alexkasabian96@gmail.com','Alessio','De Pasquale','Stilista','3319347941','M',0,3),('angelillostella@outlook.it','Stella','Angellillo','','','F',1,4),('anniballomichela@gmail.com','Michela','Anniballo','','','F',0,5),('bysyzeen@gmail.com','Fabio','Paulesu','','','M',0,6),('cinzia.2667@gmail.com','Cinzia','Baldasarre','','','F',1,7),('coluccigiandomenico@gmail.com','Giandomenico','Colucci','','','M',0,8),('cristina.spalletta1991@gmail.com','Cristina','Spalletta','','','F',1,9),('dairecelesti@gmail.com','Daniela','Cozza','','','F',1,10),('dariofanelli18@gmail.com','Dario','Fanelli','','3292021965','M',0,11),('davide.checchia1@gmail.com','Davide','Checchia','','','M',0,12),('davide.colafemmina@gmail.com','Davide','Colafemmina','Youth worker - LinkedIn','','M',0,13),('davide91bari@hotmail.it','Davide','D\'Alba','Ingegnere','3921100634','M',0,14),('deborahroncone98@gmail.com','Deborah','Roncone','Educatrice socio-pedagogica','3774995620','F',0,15),('depasquale.caterina1@gmail.com','Caterina','De Pasquale','','3282810726','F',0,16),('dipalo.martina@gmail.com','Martina','Di Palo','','3664893585','F',0,17),('domdibari@libero.it','Domenico','Di Bari','','','M',1,18),('domi0312@hotmail.it','Domenico','Grittani','','','M',0,19),('Enzamonniello@alice.it','Vincenza','Monniello','','3806460575','F',1,20),('eridb2000@gmail.com','Erica','Di Bari','Studentessa','3463307352','F',0,21),('ermelinda_granato@virgilio.it','Ermelinda','Granato','','','F',1,22),('Fabio1681@live.it','Fabio','Monniello','Impiegato','3204562924','M',1,23),('federicopuleo1@gmail.com','Federico','Puleo','Studente','3895810035','M',0,24),('flafucilli@gmail.com','Flavia','Fucilli','','','F',0,25),('frae.ritrovato@gmail.com','Francesca','Ritrovato','','','F',0,26),('Fraeda@libero.it','Natalia','Godeas','','','F',1,27),('francesco100@hotmail.it','Francesco','Cambi','','','M',0,28),('franco260170@gmail.com','Francesco','Roncone','','','M',1,29),('fraste19@gmail.com','Stefania','Fraddosio','Assistente d\'ufficio Remax','','F',0,30),('g.fanelli1371@gmail.com','Giuseppina','Fanelli','','3496520005','F',1,31),('gabrieleregina98@gmail.com','Linda','Regina','','3898965319','F',0,32),('gaia.ciannamea1997@gmail.com','Gaia','Ciannamea','','','F',0,33),('gaiaattanasi@virgilio.it','Gaia','Attanasi','','','F',0,34),('giacomo.carlucci@gmail.com','Giacomo','Carlucci','','','M',1,35),('giacomo.monniello22@gmail.com','Giacomo','Monniello','','3772262585','M',1,36),('gianfranco.romito@gmail.com','Gianfranco','Romito','','','M',1,37),('giorgiarebecca@hotmail.com','Giorgia','Fanelli','','','F',0,38),('ivanfanelli@gmail.com','Ivan','Fanelli','','3805965836','M',0,39),('jimmy993dock@gmail.com','Agim','Doci','','','M',0,40),('l1d@hotmail.it','Lidia','Riccardi','','','F',1,41),('lorenzo.berni@icloud.com','Lorenzo','Berni','','','M',1,42),('lulucacior@gmail.com','Lucrezia','Amoruso','','','F',1,43),('marcolek24@gmail.com','Marco','Colecchia','','','M',0,44),('mariagiovannaraguso66@gmail.com','Maria Giovanna','Raguso','','','F',1,45),('mariangelazonna82@gmail.com','Mariangela','Zonna','','','F',1,46),('Mariantomagni@gmail.com','Mariantonietta','Magnifico','','','F',1,47),('mariapaolacozzi1993@gmail.com','Maria Paola','Cozzi','','','F',0,48),('mariateresa.m.1993@gmail.com','Mariateresa','Monniello','Psicologo','3270742698','F',0,49),('marmarmar1963@gmail.com','Marcello','Mariani','','','M',1,50),('marmarmar1992@gmail.com','Gianluca','Mariani','','','M',1,51),('martina.roncone14@gmail.com','Martina','Roncone','','','F',0,52),('maurizioroncone60@gmail.com','Maurizio','Roncone','','','M',1,53),('michele-fiore@outlook.it','Michele','Fiore','','3467483418','M',0,54),('mmarinelli00@gmail.com','Marco','Marinelli','Educatore progettista','3460361362','M',1,55),('mon.ik@hotmail.it','Monica','De Musso','Dottorando di ricerca','','F',0,56),('monbiagio@libero.it','Biagio','Monniello','','805373854','M',1,57),('natale.monniello@gmail.com','Natale','Monniello','Impiegato','3316028255','M',1,58),('nataliagodeas@gmail.com',' Natalia','Godeas','','','F',0,59),('nicola.2690@hotmail.it','Nicola','Mizzi','','','M',0,60),('pasqualemonniello1337@gmail.com','Pasquale','Monniello','','3801896997','M',0,61),('raffaelefanelli1005@gmail.com','Raffaele','Fanelli','','','M',0,62),('rilievo951@gmail.com','Gaetano','Rilievo','Studente Universitario','3279551881','M',0,63),('robyarci@hotmail.it','Roberta','Arcidiacono','Ottico','3466860727','F',0,64),('ronconerenata11@gmail.com','Renata','Roncone','','','F',1,65),('rossana.colucci86@gmail.com','Rossana','Colucci','','','F',1,66),('saveriomagaletti29101965@gmail.com','Saverio','Magaletti','','','M',1,67),('silviacapone97@gmail.com','Silvia','Capone','','','F',0,68),('superfurios@gmail.com','Stefano','Mariani','Studente','3393450339','M',0,69),('vitafrascaro@libero.it','Vita','Frascaro','','','F',1,70);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
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
