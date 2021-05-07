-- MySQL dump 10.13  Distrib 8.0.5, for Win64 (x86_64)
--
-- Host: localhost    Database: tiktok
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `filtry`
--

DROP TABLE IF EXISTS `filtry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `filtry` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(30) DEFAULT NULL,
  `id_tworcy` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_tworcy` (`id_tworcy`),
  CONSTRAINT `filtry_ibfk_1` FOREIGN KEY (`id_tworcy`) REFERENCES `pracownicy` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filtry`
--

LOCK TABLES `filtry` WRITE;
/*!40000 ALTER TABLE `filtry` DISABLE KEYS */;
INSERT INTO `filtry` VALUES (1,'very happy face',1),(2,'dog face',1),(3,'green screen',1),(4,'2077',2),(5,'nowy filtr',2),(6,'makeup',3),(7,'zoom face',4);
/*!40000 ALTER TABLE `filtry` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr1` AFTER UPDATE ON `filtry` FOR EACH ROW begin
INSERT INTO filtry_archiw ( stara_nazwa, nowa_nazwa)
values ( old.nazwa, new.nazwa);
  end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `filtry_archiw`
--

DROP TABLE IF EXISTS `filtry_archiw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `filtry_archiw` (
  `stara_nazwa` varchar(30) DEFAULT NULL,
  `nowa_nazwa` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filtry_archiw`
--

LOCK TABLES `filtry_archiw` WRITE;
/*!40000 ALTER TABLE `filtry_archiw` DISABLE KEYS */;
INSERT INTO `filtry_archiw` VALUES ('happy face','very happy face');
/*!40000 ALTER TABLE `filtry_archiw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filtry_zmiana`
--

DROP TABLE IF EXISTS `filtry_zmiana`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `filtry_zmiana` (
  `id` tinyint DEFAULT NULL,
  `stara_nazwa` varchar(30) DEFAULT NULL,
  `nowa_nazwa` varchar(30) DEFAULT NULL,
  `id_tworcy` tinyint DEFAULT NULL,
  KEY `id_tworcy` (`id_tworcy`),
  KEY `id` (`id`),
  CONSTRAINT `filtry_zmiana_ibfk_1` FOREIGN KEY (`id_tworcy`) REFERENCES `pracownicy` (`id`) ON DELETE CASCADE,
  CONSTRAINT `filtry_zmiana_ibfk_2` FOREIGN KEY (`id`) REFERENCES `filtry` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filtry_zmiana`
--

LOCK TABLES `filtry_zmiana` WRITE;
/*!40000 ALTER TABLE `filtry_zmiana` DISABLE KEYS */;
/*!40000 ALTER TABLE `filtry_zmiana` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filtry_zmianine`
--

DROP TABLE IF EXISTS `filtry_zmianine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `filtry_zmianine` (
  `stara_nazwa` varchar(30) DEFAULT NULL,
  `nowa_nazwa` varchar(30) DEFAULT NULL,
  `id_tworcy` tinyint DEFAULT NULL,
  KEY `id_tworcy` (`id_tworcy`),
  CONSTRAINT `filtry_zmianine_ibfk_1` FOREIGN KEY (`id_tworcy`) REFERENCES `pracownicy` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filtry_zmianine`
--

LOCK TABLES `filtry_zmianine` WRITE;
/*!40000 ALTER TABLE `filtry_zmianine` DISABLE KEYS */;
/*!40000 ALTER TABLE `filtry_zmianine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pracownicy`
--

DROP TABLE IF EXISTS `pracownicy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pracownicy` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `Imien_I_Nazwisko` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pracownicy`
--

LOCK TABLES `pracownicy` WRITE;
/*!40000 ALTER TABLE `pracownicy` DISABLE KEYS */;
INSERT INTO `pracownicy` VALUES (1,'Ada Najman'),(2,'Jan Jankowski'),(3,'Anna Piotrkowska'),(4,'Karol Wrona'),(5,'nowy czlowiek'),(6,'HR Wita');
/*!40000 ALTER TABLE `pracownicy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiktoki`
--

DROP TABLE IF EXISTS `tiktoki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tiktoki` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(30) DEFAULT NULL,
  `polubien` int DEFAULT NULL,
  `czas_trwania` int DEFAULT NULL,
  `filtr_id` tinyint DEFAULT NULL,
  `tworca_id` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `filtr_id` (`filtr_id`),
  KEY `tworca_id` (`tworca_id`),
  CONSTRAINT `tiktoki_ibfk_1` FOREIGN KEY (`filtr_id`) REFERENCES `filtry` (`id`) ON DELETE CASCADE,
  CONSTRAINT `tiktoki_ibfk_2` FOREIGN KEY (`tworca_id`) REFERENCES `uzytkownicy` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiktoki`
--

LOCK TABLES `tiktoki` WRITE;
/*!40000 ALTER TABLE `tiktoki` DISABLE KEYS */;
INSERT INTO `tiktoki` VALUES (1,'t1',100,30,7,1),(2,'t2',5,10,6,1),(3,'diy',300,50,3,2),(4,'diy2',1000,50,3,2),(5,'diy3',2000,30,3,2),(6,'travel tips',9500,20,4,3),(7,'travel tips2',9500,20,1,3),(8,'travel tips3',9500,20,3,3),(9,'recenzja',10,10,7,4),(10,'recenzja2',5,7,6,4),(11,'recenzja3',3000,25,3,4),(12,'RECENZJA CZEGOS',10,10,7,4),(13,'HAHAHE',20,20,1,1);
/*!40000 ALTER TABLE `tiktoki` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr2` BEFORE INSERT ON `tiktoki` FOR EACH ROW set new.nazwa = upper (new.nazwa) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `uzytkownicy`
--

DROP TABLE IF EXISTS `uzytkownicy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `uzytkownicy` (
  `id` tinyint NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(30) DEFAULT NULL,
  `obserwujacych` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uzytkownicy`
--

LOCK TABLES `uzytkownicy` WRITE;
/*!40000 ALTER TABLE `uzytkownicy` DISABLE KEYS */;
INSERT INTO `uzytkownicy` VALUES (1,'user1','100'),(2,'jan123','2000'),(3,'super123','9000'),(4,'siema_tu_karol','305');
/*!40000 ALTER TABLE `uzytkownicy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `widok_filrty_twórcy`
--

DROP TABLE IF EXISTS `widok_filrty_twórcy`;
/*!50001 DROP VIEW IF EXISTS `widok_filrty_twórcy`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `widok_filrty_twórcy` AS SELECT 
 1 AS `id`,
 1 AS `nazwa`,
 1 AS `imie_nazwisko`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `widok_filrty_uzycie`
--

DROP TABLE IF EXISTS `widok_filrty_uzycie`;
/*!50001 DROP VIEW IF EXISTS `widok_filrty_uzycie`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `widok_filrty_uzycie` AS SELECT 
 1 AS `id`,
 1 AS `nazwa`,
 1 AS `count(*)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `widok_nieuzywane_filrty`
--

DROP TABLE IF EXISTS `widok_nieuzywane_filrty`;
/*!50001 DROP VIEW IF EXISTS `widok_nieuzywane_filrty`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `widok_nieuzywane_filrty` AS SELECT 
 1 AS `id`,
 1 AS `nazwa`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `widok_pelny`
--

DROP TABLE IF EXISTS `widok_pelny`;
/*!50001 DROP VIEW IF EXISTS `widok_pelny`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `widok_pelny` AS SELECT 
 1 AS `id`,
 1 AS `nazwa`,
 1 AS `polubien`,
 1 AS `czas_trwania`,
 1 AS `filtry`,
 1 AS `tworca`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `widok_uzytkownicy_i_pracownicy`
--

DROP TABLE IF EXISTS `widok_uzytkownicy_i_pracownicy`;
/*!50001 DROP VIEW IF EXISTS `widok_uzytkownicy_i_pracownicy`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `widok_uzytkownicy_i_pracownicy` AS SELECT 
 1 AS `id`,
 1 AS `nazwa`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `widok_filrty_twórcy`
--

/*!50001 DROP VIEW IF EXISTS `widok_filrty_twórcy`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `widok_filrty_twórcy` AS select `filtry`.`id` AS `id`,`filtry`.`nazwa` AS `nazwa`,`pracownicy`.`Imien_I_Nazwisko` AS `imie_nazwisko` from (`filtry` join `pracownicy` on((`filtry`.`id_tworcy` = `pracownicy`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `widok_filrty_uzycie`
--

/*!50001 DROP VIEW IF EXISTS `widok_filrty_uzycie`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `widok_filrty_uzycie` AS select `filtry`.`id` AS `id`,`filtry`.`nazwa` AS `nazwa`,count(0) AS `count(*)` from (`tiktoki` join `filtry` on((`tiktoki`.`filtr_id` = `filtry`.`id`))) group by `filtry`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `widok_nieuzywane_filrty`
--

/*!50001 DROP VIEW IF EXISTS `widok_nieuzywane_filrty`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `widok_nieuzywane_filrty` AS select `filtry`.`id` AS `id`,`filtry`.`nazwa` AS `nazwa` from `filtry` where `filtry`.`id` in (select `tiktoki`.`filtr_id` from `tiktoki`) is false */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `widok_pelny`
--

/*!50001 DROP VIEW IF EXISTS `widok_pelny`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `widok_pelny` AS select `tiktoki`.`id` AS `id`,`tiktoki`.`nazwa` AS `nazwa`,`tiktoki`.`polubien` AS `polubien`,`tiktoki`.`czas_trwania` AS `czas_trwania`,`filtry`.`nazwa` AS `filtry`,`uzytkownicy`.`nazwa` AS `tworca` from ((`tiktoki` join `uzytkownicy` on((`tiktoki`.`tworca_id` = `uzytkownicy`.`id`))) join `filtry` on((`tiktoki`.`filtr_id` = `filtry`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `widok_uzytkownicy_i_pracownicy`
--

/*!50001 DROP VIEW IF EXISTS `widok_uzytkownicy_i_pracownicy`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `widok_uzytkownicy_i_pracownicy` AS select `pracownicy`.`id` AS `id`,`pracownicy`.`Imien_I_Nazwisko` AS `nazwa` from `pracownicy` union select `uzytkownicy`.`id` AS `id`,`uzytkownicy`.`nazwa` AS `nazwa` from `uzytkownicy` */;
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

-- Dump completed on 2021-05-07 21:21:42
