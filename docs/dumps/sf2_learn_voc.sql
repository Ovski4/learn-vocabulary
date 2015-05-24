-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: sf2_learn_voc
-- ------------------------------------------------------
-- Server version	5.5.41-0+wheezy1

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
-- Table structure for table `ext_translations`
--

DROP TABLE IF EXISTS `ext_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ext_translations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `locale` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `object_class` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `field` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `foreign_key` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lookup_unique_idx` (`locale`,`object_class`,`field`,`foreign_key`),
  KEY `translations_lookup_idx` (`locale`,`object_class`,`foreign_key`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ext_translations`
--

LOCK TABLES `ext_translations` WRITE;
/*!40000 ALTER TABLE `ext_translations` DISABLE KEYS */;
INSERT INTO `ext_translations` VALUES (1,'fr','Ovski\\LanguageBundle\\Entity\\Language','name','1','allemand'),(2,'en_US','Ovski\\LanguageBundle\\Entity\\Language','name','1','german'),(3,'fr','Ovski\\LanguageBundle\\Entity\\Language','name','2','anglais'),(4,'en_US','Ovski\\LanguageBundle\\Entity\\Language','name','2','english'),(5,'fr','Ovski\\LanguageBundle\\Entity\\Language','name','3','espagnol'),(6,'en_US','Ovski\\LanguageBundle\\Entity\\Language','name','3','spanish'),(7,'fr','Ovski\\LanguageBundle\\Entity\\Language','name','4','français'),(8,'en_US','Ovski\\LanguageBundle\\Entity\\Language','name','4','french'),(9,'fr','Ovski\\LanguageBundle\\Entity\\WordType','value','1','nom'),(10,'en_US','Ovski\\LanguageBundle\\Entity\\WordType','value','1','name'),(11,'fr','Ovski\\LanguageBundle\\Entity\\WordType','value','2','phrase'),(12,'en_US','Ovski\\LanguageBundle\\Entity\\WordType','value','2','sentence'),(13,'fr','Ovski\\LanguageBundle\\Entity\\WordType','value','3','préposition'),(14,'en_US','Ovski\\LanguageBundle\\Entity\\WordType','value','3','preposition'),(15,'fr','Ovski\\LanguageBundle\\Entity\\WordType','value','4','verbe'),(16,'en_US','Ovski\\LanguageBundle\\Entity\\WordType','value','4','verb'),(17,'fr','Ovski\\LanguageBundle\\Entity\\WordType','value','5','adverb'),(18,'en_US','Ovski\\LanguageBundle\\Entity\\WordType','value','5','adverb'),(19,'fr','Ovski\\LanguageBundle\\Entity\\WordType','value','6','interjection'),(20,'en_US','Ovski\\LanguageBundle\\Entity\\WordType','value','6','interjection'),(21,'fr','Ovski\\LanguageBundle\\Entity\\WordType','value','7','article'),(22,'en_US','Ovski\\LanguageBundle\\Entity\\WordType','value','7','article'),(23,'fr','Ovski\\LanguageBundle\\Entity\\WordType','value','8','conjonction'),(24,'en_US','Ovski\\LanguageBundle\\Entity\\WordType','value','8','conjunction'),(25,'fr','Ovski\\LanguageBundle\\Entity\\WordType','value','9','pronom'),(26,'en_US','Ovski\\LanguageBundle\\Entity\\WordType','value','9','pronoun'),(27,'fr','Ovski\\LanguageBundle\\Entity\\WordType','value','10','adjectif'),(28,'en_US','Ovski\\LanguageBundle\\Entity\\WordType','value','10','adjective');
/*!40000 ALTER TABLE `ext_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ovski_article`
--

DROP TABLE IF EXISTS `ovski_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ovski_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_article_idx` (`value`,`language_id`),
  KEY `IDX_40D7A10582F1BAF4` (`language_id`),
  CONSTRAINT `FK_40D7A10582F1BAF4` FOREIGN KEY (`language_id`) REFERENCES `ovski_language` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ovski_article`
--

LOCK TABLES `ovski_article` WRITE;
/*!40000 ALTER TABLE `ovski_article` DISABLE KEYS */;
INSERT INTO `ovski_article` VALUES (6,1,'das'),(4,1,'der'),(5,1,'die'),(10,1,'ein'),(11,1,'eine'),(2,3,'el'),(9,4,'l\''),(3,3,'la'),(8,4,'la'),(17,3,'las'),(7,4,'le'),(16,4,'les'),(18,3,'los'),(1,2,'the'),(14,3,'un'),(12,4,'un'),(15,3,'una'),(13,4,'une');
/*!40000 ALTER TABLE `ovski_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ovski_language`
--

DROP TABLE IF EXISTS `ovski_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ovski_language` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `require_articles` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_language_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ovski_language`
--

LOCK TABLES `ovski_language` WRITE;
/*!40000 ALTER TABLE `ovski_language` DISABLE KEYS */;
INSERT INTO `ovski_language` VALUES (1,'german',1),(2,'english',0),(3,'spanish',1),(4,'french',1);
/*!40000 ALTER TABLE `ovski_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ovski_learning`
--

DROP TABLE IF EXISTS `ovski_learning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ovski_learning` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language1_id` int(11) NOT NULL,
  `language2_id` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_language_idx` (`language1_id`,`language2_id`),
  KEY `IDX_1BFC798F6C3EEA2C` (`language1_id`),
  KEY `IDX_1BFC798F7E8B45C2` (`language2_id`),
  CONSTRAINT `FK_1BFC798F6C3EEA2C` FOREIGN KEY (`language1_id`) REFERENCES `ovski_language` (`id`),
  CONSTRAINT `FK_1BFC798F7E8B45C2` FOREIGN KEY (`language2_id`) REFERENCES `ovski_language` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ovski_learning`
--

LOCK TABLES `ovski_learning` WRITE;
/*!40000 ALTER TABLE `ovski_learning` DISABLE KEYS */;
INSERT INTO `ovski_learning` VALUES (1,3,4,'french-spanish'),(2,1,4,'french-german'),(3,4,2,'english-french'),(4,2,1,'english-german');
/*!40000 ALTER TABLE `ovski_learning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ovski_translation`
--

DROP TABLE IF EXISTS `ovski_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ovski_translation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word1_id` int(11) NOT NULL,
  `word2_id` int(11) NOT NULL,
  `word_type_id` int(11) DEFAULT NULL,
  `learning_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `is_starred` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_translation_idx` (`word1_id`,`word2_id`,`learning_id`,`user_id`,`word_type_id`),
  KEY `IDX_3CDCAAC24586854D` (`word1_id`),
  KEY `IDX_3CDCAAC257332AA3` (`word2_id`),
  KEY `IDX_3CDCAAC2CF3EFB60` (`word_type_id`),
  KEY `IDX_3CDCAAC24E6B0AB3` (`learning_id`),
  KEY `IDX_3CDCAAC2A76ED395` (`user_id`),
  CONSTRAINT `FK_3CDCAAC24586854D` FOREIGN KEY (`word1_id`) REFERENCES `ovski_word` (`id`),
  CONSTRAINT `FK_3CDCAAC24E6B0AB3` FOREIGN KEY (`learning_id`) REFERENCES `ovski_learning` (`id`),
  CONSTRAINT `FK_3CDCAAC257332AA3` FOREIGN KEY (`word2_id`) REFERENCES `ovski_word` (`id`),
  CONSTRAINT `FK_3CDCAAC2A76ED395` FOREIGN KEY (`user_id`) REFERENCES `ovski_user` (`id`),
  CONSTRAINT `FK_3CDCAAC2CF3EFB60` FOREIGN KEY (`word_type_id`) REFERENCES `ovski_word_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=473 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ovski_translation`
--

LOCK TABLES `ovski_translation` WRITE;
/*!40000 ALTER TABLE `ovski_translation` DISABLE KEYS */;
INSERT INTO `ovski_translation` VALUES (1,1,2,4,3,2,'2014-10-12 13:59:29',0),(2,3,4,1,3,2,'2014-10-12 13:59:29',0),(3,5,6,1,1,2,'2014-10-12 14:00:12',0),(4,7,8,1,1,2,'2014-10-12 14:00:12',0),(5,9,10,4,1,2,'2014-10-12 14:00:12',0),(6,11,12,1,1,2,'2014-10-12 14:00:12',0),(7,13,14,4,1,2,'2014-10-12 14:00:12',0),(8,15,16,5,1,2,'2014-10-12 14:00:12',0),(9,17,18,7,1,2,'2014-10-12 14:00:12',0),(10,19,20,1,1,2,'2014-10-12 14:00:12',0),(11,21,22,4,1,2,'2014-10-12 14:00:12',0),(12,23,24,4,1,2,'2014-10-12 14:00:12',0),(13,25,26,1,1,2,'2014-10-12 14:00:12',0),(14,27,28,5,1,2,'2014-10-12 14:00:12',0),(15,29,30,4,1,2,'2014-10-12 14:00:12',0),(16,31,32,5,1,2,'2014-10-12 14:00:12',0),(17,33,34,1,1,2,'2014-10-12 14:00:12',0),(18,35,36,1,1,2,'2014-10-12 14:00:12',0),(19,37,38,4,1,2,'2014-10-12 14:00:12',0),(20,39,40,4,1,2,'2014-10-12 14:00:12',0),(21,41,42,1,1,2,'2014-10-12 14:00:12',0),(22,43,44,7,1,2,'2014-10-12 14:00:12',0),(23,45,46,7,1,2,'2014-10-12 14:00:12',0),(24,47,48,9,1,2,'2014-10-12 14:00:12',0),(25,49,50,2,1,2,'2014-10-12 14:00:12',0),(26,51,52,2,1,2,'2014-10-12 14:00:12',0),(27,53,54,9,1,2,'2014-10-12 14:00:12',0),(28,55,56,2,1,2,'2014-10-12 14:00:12',0),(29,57,58,9,1,2,'2014-10-12 14:00:12',0),(30,59,60,2,1,2,'2014-10-12 14:00:12',0),(31,61,62,2,1,2,'2014-10-12 14:00:12',0),(32,63,64,2,1,2,'2014-10-12 14:00:12',0),(33,65,66,6,1,2,'2014-10-12 14:00:12',0),(34,67,68,2,1,2,'2014-10-12 14:00:12',0),(35,69,70,2,1,2,'2014-10-12 14:00:12',0),(36,71,72,6,1,2,'2014-10-12 14:00:12',0),(37,73,74,2,1,2,'2014-10-12 14:00:12',0),(38,75,76,2,1,2,'2014-10-12 14:00:12',0),(39,77,78,2,1,2,'2014-10-12 14:00:12',0),(40,79,80,6,1,2,'2014-10-12 14:00:12',0),(41,81,82,6,1,2,'2014-10-12 14:00:13',0),(42,83,84,6,1,2,'2014-10-12 14:00:13',0),(43,85,86,6,1,2,'2014-10-12 14:00:13',0),(44,87,88,6,1,2,'2014-10-12 14:00:13',0),(45,89,90,1,1,2,'2014-10-12 14:00:13',0),(46,91,92,1,1,2,'2014-10-12 14:00:13',0),(47,93,94,4,1,2,'2014-10-12 14:00:13',0),(48,95,96,4,1,2,'2014-10-12 14:00:13',0),(49,97,98,4,1,2,'2014-10-12 14:00:13',0),(50,99,100,9,1,2,'2014-10-12 14:00:13',0),(51,101,102,2,1,2,'2014-10-12 14:00:13',0),(52,103,104,2,1,2,'2014-10-12 14:00:13',0),(53,105,106,1,1,2,'2014-10-12 14:00:13',0),(54,107,108,2,1,2,'2014-10-12 14:00:13',0),(55,109,110,1,1,2,'2014-10-12 14:00:13',0),(56,111,112,1,1,2,'2014-10-12 14:00:13',0),(57,113,114,1,1,2,'2014-10-12 14:00:13',0),(58,115,116,4,1,2,'2014-10-12 14:00:13',0),(59,117,118,4,1,2,'2014-10-12 14:00:13',0),(60,119,120,1,1,2,'2014-10-12 14:00:13',0),(61,121,122,1,1,3,'2014-10-12 14:01:06',0),(62,123,124,4,1,3,'2014-10-12 14:01:06',0),(63,125,126,4,1,3,'2014-10-12 14:01:06',0),(64,127,128,4,1,3,'2014-10-12 14:01:06',0),(65,129,130,1,1,3,'2014-10-12 14:01:06',0),(66,131,132,1,1,3,'2014-10-12 14:01:06',1),(67,133,134,1,1,3,'2014-10-12 14:01:06',0),(68,135,136,1,1,3,'2014-10-12 14:01:06',1),(69,137,138,4,1,3,'2014-10-12 14:01:06',1),(70,139,140,4,1,3,'2014-10-12 14:01:06',1),(71,141,142,2,1,3,'2014-10-12 14:01:06',0),(72,143,144,4,1,3,'2014-10-12 14:01:06',0),(73,145,146,1,1,2,'2014-10-12 14:06:35',0),(74,5,6,1,1,5,'2014-10-12 14:10:21',0),(75,7,8,1,1,5,'2014-10-12 14:10:21',0),(76,9,10,4,1,5,'2014-10-12 14:10:21',0),(77,11,12,1,1,5,'2014-10-12 14:10:21',0),(78,13,14,4,1,5,'2014-10-12 14:10:21',0),(79,15,16,5,1,5,'2014-10-12 14:10:21',0),(80,17,18,7,1,5,'2014-10-12 14:10:21',0),(81,19,20,1,1,5,'2014-10-12 14:10:21',0),(82,21,22,4,1,5,'2014-10-12 14:10:21',0),(83,23,24,4,1,5,'2014-10-12 14:10:21',0),(84,25,26,1,1,5,'2014-10-12 14:10:21',0),(85,27,28,5,1,5,'2014-10-12 14:10:21',0),(86,29,30,4,1,5,'2014-10-12 14:10:21',0),(87,31,32,5,1,5,'2014-10-12 14:10:21',0),(88,33,34,1,1,5,'2014-10-12 14:10:21',0),(89,35,36,1,1,5,'2014-10-12 14:10:21',0),(90,37,38,4,1,5,'2014-10-12 14:10:21',0),(91,39,40,4,1,5,'2014-10-12 14:10:21',0),(92,41,42,1,1,5,'2014-10-12 14:10:21',0),(93,43,44,7,1,5,'2014-10-12 14:10:21',0),(94,45,46,7,1,5,'2014-10-12 14:10:21',0),(95,47,48,9,1,5,'2014-10-12 14:10:21',0),(96,49,50,2,1,5,'2014-10-12 14:10:21',0),(97,51,52,2,1,5,'2014-10-12 14:10:21',0),(98,53,54,9,1,5,'2014-10-12 14:10:21',0),(99,55,56,2,1,5,'2014-10-12 14:10:21',0),(100,57,58,9,1,5,'2014-10-12 14:10:21',0),(101,59,60,2,1,5,'2014-10-12 14:10:21',0),(102,61,62,2,1,5,'2014-10-12 14:10:21',0),(103,63,64,2,1,5,'2014-10-12 14:10:21',0),(104,65,66,6,1,5,'2014-10-12 14:10:21',0),(105,67,68,2,1,5,'2014-10-12 14:10:21',0),(106,69,70,2,1,5,'2014-10-12 14:10:21',0),(107,71,72,6,1,5,'2014-10-12 14:10:21',0),(108,73,74,2,1,5,'2014-10-12 14:10:21',0),(109,75,76,2,1,5,'2014-10-12 14:10:21',0),(110,77,78,2,1,5,'2014-10-12 14:10:21',0),(111,79,80,6,1,5,'2014-10-12 14:10:21',0),(112,81,82,6,1,5,'2014-10-12 14:10:21',0),(113,83,84,6,1,5,'2014-10-12 14:10:21',0),(114,85,86,6,1,5,'2014-10-12 14:10:21',0),(115,87,88,6,1,5,'2014-10-12 14:10:21',0),(116,89,90,1,1,5,'2014-10-12 14:10:21',0),(117,91,92,1,1,5,'2014-10-12 14:10:21',0),(118,93,94,4,1,5,'2014-10-12 14:10:21',0),(119,95,96,4,1,5,'2014-10-12 14:10:21',0),(120,97,98,4,1,5,'2014-10-12 14:10:21',0),(121,99,100,9,1,5,'2014-10-12 14:10:21',0),(122,101,102,2,1,5,'2014-10-12 14:10:21',0),(123,103,104,2,1,5,'2014-10-12 14:10:21',0),(124,105,106,1,1,5,'2014-10-12 14:10:21',0),(125,107,108,2,1,5,'2014-10-12 14:10:21',0),(126,109,110,1,1,5,'2014-10-12 14:10:21',0),(127,111,112,1,1,5,'2014-10-12 14:10:21',0),(128,113,114,1,1,5,'2014-10-12 14:10:21',0),(129,115,116,4,1,5,'2014-10-12 14:10:21',0),(130,117,118,4,1,5,'2014-10-12 14:10:21',0),(131,119,120,1,1,5,'2014-10-12 14:10:21',0),(132,147,148,5,1,5,'2014-10-12 16:45:56',0),(133,149,150,1,1,2,'2014-10-12 23:24:16',0),(134,151,152,4,1,2,'2014-10-12 23:26:00',0),(135,153,154,1,1,2,'2014-10-12 23:28:27',0),(136,155,156,1,1,2,'2014-10-12 23:37:28',0),(137,157,158,4,1,2,'2014-10-12 23:41:32',0),(138,159,160,1,1,2,'2014-10-12 23:42:22',0),(139,161,162,1,1,2,'2014-10-12 23:43:00',0),(140,163,164,1,1,2,'2014-10-12 23:58:06',0),(141,165,166,1,1,2,'2014-10-13 00:06:09',0),(142,167,168,1,1,2,'2014-10-13 00:06:42',0),(143,169,170,1,1,2,'2014-10-13 00:07:41',0),(144,171,172,1,1,2,'2014-10-13 00:08:17',0),(145,173,174,1,1,2,'2014-10-13 00:10:59',0),(146,175,176,1,1,2,'2014-10-13 00:11:40',0),(147,177,178,1,1,2,'2014-10-13 00:12:21',0),(148,179,180,1,1,2,'2014-10-13 00:12:56',0),(149,181,182,1,1,2,'2014-10-13 00:13:58',0),(150,183,184,4,3,2,'2014-10-13 00:18:51',0),(151,185,186,4,3,2,'2014-10-13 00:19:09',0),(152,187,188,4,3,2,'2014-10-13 00:19:30',0),(153,189,190,NULL,3,2,'2014-10-13 00:20:00',0),(154,191,192,4,3,2,'2014-10-13 00:20:38',0),(155,193,194,1,1,2,'2014-10-13 00:21:54',0),(156,195,196,1,1,2,'2014-10-13 00:22:26',0),(157,197,198,1,1,2,'2014-10-13 00:23:04',0),(158,199,200,1,1,2,'2014-10-13 00:23:40',0),(159,201,202,4,3,3,'2014-10-13 21:54:23',0),(160,203,204,NULL,3,3,'2014-10-13 21:54:53',0),(161,205,206,1,3,3,'2014-10-13 21:55:57',0),(162,207,208,NULL,3,3,'2014-10-13 21:56:18',0),(163,209,210,NULL,3,3,'2014-10-13 21:56:34',0),(164,211,212,4,3,3,'2014-10-13 21:57:01',1),(165,213,214,1,3,3,'2014-10-13 21:59:07',0),(166,215,216,NULL,3,3,'2014-10-13 22:00:46',0),(167,217,218,NULL,3,3,'2014-10-13 22:01:32',1),(168,219,220,NULL,3,3,'2014-10-13 22:02:26',0),(169,221,222,10,3,3,'2014-10-13 22:03:22',1),(170,223,224,1,3,3,'2014-10-13 22:04:25',0),(171,225,226,NULL,3,3,'2014-10-13 22:05:41',0),(172,227,228,NULL,3,3,'2014-10-13 22:07:01',1),(173,229,230,4,3,3,'2014-10-13 22:07:36',0),(174,231,232,NULL,3,3,'2014-10-13 22:08:20',0),(175,233,234,NULL,3,3,'2014-10-13 22:08:59',0),(176,235,236,NULL,3,3,'2014-10-13 22:09:26',0),(177,237,238,NULL,3,3,'2014-10-13 22:09:59',0),(178,239,240,NULL,3,3,'2014-10-13 22:10:22',0),(179,241,242,NULL,3,3,'2014-10-13 22:10:43',0),(180,243,244,4,3,3,'2014-10-13 22:11:50',0),(181,10,245,4,3,3,'2014-10-13 22:12:12',0),(182,246,247,2,3,3,'2014-10-13 22:14:06',0),(183,248,249,NULL,3,3,'2014-10-13 22:14:51',0),(184,250,251,2,3,3,'2014-10-13 22:15:27',1),(185,252,253,NULL,3,3,'2014-10-13 22:15:50',1),(186,254,255,NULL,3,3,'2014-10-13 22:16:17',1),(187,256,257,1,1,2,'2014-10-14 00:14:28',0),(188,258,259,1,1,2,'2014-10-14 00:15:34',0),(189,260,261,1,1,2,'2014-10-14 00:16:09',0),(190,262,263,1,1,2,'2014-10-14 00:19:42',0),(191,264,265,1,1,2,'2014-10-14 00:20:31',0),(192,266,267,1,1,2,'2014-10-14 00:23:27',0),(193,268,269,1,1,2,'2014-10-14 00:24:07',0),(194,270,271,1,1,2,'2014-10-14 00:24:53',0),(195,272,273,1,1,2,'2014-10-14 00:25:16',0),(196,274,275,1,1,2,'2014-10-14 00:26:16',0),(197,276,277,1,1,2,'2014-10-14 00:26:44',0),(198,278,279,1,1,2,'2014-10-14 00:29:44',0),(199,280,281,1,1,2,'2014-10-14 00:30:34',0),(200,282,283,1,1,2,'2014-10-14 00:34:10',0),(201,284,285,1,1,2,'2014-10-14 00:34:42',0),(202,286,287,1,1,2,'2014-10-14 00:35:19',0),(203,288,289,1,1,2,'2014-10-14 00:36:14',0),(204,290,291,1,3,2,'2014-10-15 01:48:32',0),(205,292,293,10,3,2,'2014-10-15 01:53:58',0),(206,294,295,1,1,2,'2014-10-15 13:09:09',0),(207,296,297,1,1,2,'2014-10-15 13:09:25',0),(208,298,299,9,1,2,'2014-10-15 23:08:27',0),(209,300,301,9,1,2,'2014-10-15 23:10:04',0),(210,302,303,9,1,2,'2014-10-15 23:10:55',0),(211,304,305,9,1,2,'2014-10-15 23:12:25',0),(212,306,307,9,1,2,'2014-10-15 23:13:19',0),(213,308,309,9,1,2,'2014-10-15 23:13:29',0),(214,310,311,9,1,2,'2014-10-15 23:14:53',0),(215,312,313,9,1,2,'2014-10-15 23:17:47',0),(216,314,315,9,1,2,'2014-10-15 23:18:38',0),(217,316,317,9,1,2,'2014-10-15 23:20:53',0),(218,318,319,9,1,2,'2014-10-15 23:22:38',0),(219,320,321,9,1,2,'2014-10-15 23:23:39',0),(220,320,322,9,1,2,'2014-10-15 23:24:13',1),(221,323,324,1,1,2,'2014-10-15 23:27:47',0),(222,325,326,1,1,2,'2014-10-15 23:28:11',0),(223,327,328,1,1,2,'2014-10-15 23:28:42',0),(224,329,330,1,1,2,'2014-10-15 23:29:24',0),(225,331,332,1,1,2,'2014-10-15 23:30:06',0),(226,333,334,1,1,2,'2014-10-15 23:30:41',0),(227,335,336,5,1,2,'2014-10-15 23:35:24',0),(228,337,338,5,1,2,'2014-10-15 23:35:59',0),(229,339,340,5,1,2,'2014-10-15 23:36:29',0),(230,341,342,5,1,2,'2014-10-15 23:37:20',0),(231,343,344,5,1,2,'2014-10-15 23:37:57',0),(236,353,354,1,1,2,'2014-10-19 00:21:09',0),(237,355,356,1,1,2,'2014-10-19 00:28:13',0),(238,357,358,1,1,2,'2014-10-19 00:29:08',0),(239,359,360,1,1,2,'2014-10-19 00:31:12',0),(240,361,362,1,1,2,'2014-10-19 00:32:59',0),(241,363,360,1,1,2,'2014-10-19 00:33:53',0),(242,364,365,1,1,2,'2014-10-19 00:36:33',0),(243,366,367,1,1,2,'2014-10-19 10:24:42',0),(244,368,369,5,1,2,'2014-10-19 10:26:06',0),(245,370,371,5,1,2,'2014-10-19 10:26:33',0),(246,372,373,5,1,2,'2014-10-19 10:28:20',0),(247,374,375,5,1,2,'2014-10-19 10:30:24',0),(248,376,377,NULL,1,2,'2014-10-19 22:42:08',0),(249,378,379,NULL,1,2,'2014-10-19 22:42:19',0),(250,380,381,1,1,2,'2014-10-19 22:45:41',1),(251,382,383,1,1,2,'2014-10-19 22:46:18',0),(252,384,385,NULL,1,2,'2014-10-19 22:46:54',1),(253,386,387,1,1,2,'2014-10-19 22:49:13',1),(254,388,389,1,1,2,'2014-10-19 22:51:19',0),(255,390,391,1,1,2,'2014-10-19 22:52:05',0),(256,392,387,1,1,2,'2014-10-19 22:55:12',1),(257,393,394,4,1,2,'2014-10-19 22:59:23',0),(258,395,396,4,1,2,'2014-10-19 23:00:47',0),(259,397,398,4,1,2,'2014-10-19 23:03:25',0),(261,401,402,4,1,2,'2014-10-19 23:05:57',0),(262,403,404,4,1,2,'2014-10-19 23:07:15',0),(263,405,406,4,1,2,'2014-10-19 23:08:44',0),(264,407,408,4,1,2,'2014-10-19 23:09:25',0),(265,409,410,4,1,2,'2014-10-19 23:12:06',0),(266,411,412,1,2,2,'2014-10-20 15:03:56',0),(267,413,414,1,2,2,'2014-10-20 15:04:22',0),(268,415,116,4,2,2,'2014-10-20 15:05:04',0),(269,416,94,4,2,2,'2014-10-20 15:05:19',0),(270,417,120,1,2,2,'2014-10-20 15:17:19',0),(271,418,365,1,1,2,'2014-10-20 23:24:39',0),(272,419,420,1,1,2,'2014-10-20 23:42:36',0),(273,421,422,NULL,1,2,'2014-10-20 23:43:08',0),(274,423,424,NULL,1,2,'2014-10-20 23:43:44',0),(275,425,426,NULL,1,2,'2014-10-20 23:43:54',0),(276,427,428,NULL,1,2,'2014-10-20 23:44:25',0),(277,429,430,NULL,1,2,'2014-10-20 23:44:52',0),(278,431,432,4,1,2,'2014-10-20 23:48:22',0),(279,433,434,4,1,2,'2014-10-20 23:49:16',0),(280,435,436,4,1,2,'2014-10-20 23:50:00',0),(281,437,438,4,1,2,'2014-10-20 23:51:47',0),(282,439,440,8,1,2,'2014-10-20 23:58:36',0),(283,441,442,8,1,2,'2014-10-21 00:00:27',0),(284,443,444,8,1,2,'2014-10-21 00:01:17',0),(285,445,446,2,3,2,'2014-10-21 11:12:40',0),(286,447,448,4,3,2,'2014-10-21 11:19:09',0),(287,449,450,8,1,2,'2014-10-22 16:04:45',1),(288,451,452,8,1,2,'2014-10-22 16:08:09',0),(289,453,412,1,1,2,'2014-10-22 16:26:56',0),(290,454,455,1,1,2,'2014-10-22 16:34:25',0),(291,456,457,1,1,2,'2014-10-22 16:34:59',0),(293,460,461,1,1,2,'2014-10-22 16:35:54',0),(294,462,463,1,1,2,'2014-10-22 16:37:00',0),(295,464,465,1,1,2,'2014-10-22 17:26:50',0),(297,468,469,1,1,2,'2014-10-22 17:28:45',1),(298,470,471,1,1,2,'2014-10-22 17:29:21',0),(299,472,473,1,1,2,'2014-10-22 17:29:54',0),(300,474,475,1,1,2,'2014-10-22 17:31:12',0),(301,476,477,1,1,2,'2014-10-22 17:31:52',0),(302,478,479,1,1,2,'2014-10-22 17:33:27',0),(303,480,481,3,1,2,'2014-10-22 23:46:37',0),(304,482,483,3,1,2,'2014-10-22 23:47:07',0),(305,484,485,3,1,2,'2014-10-22 23:54:35',0),(306,486,487,3,1,2,'2014-10-23 00:01:29',0),(307,488,489,3,1,2,'2014-10-23 00:01:46',0),(308,490,491,3,1,2,'2014-10-23 00:04:35',0),(309,492,493,3,1,2,'2014-10-23 00:05:59',0),(310,494,495,3,1,2,'2014-10-23 00:06:30',0),(311,496,497,3,1,2,'2014-10-23 00:07:26',1),(312,498,499,3,1,2,'2014-10-23 00:07:49',0),(313,500,501,3,1,2,'2014-10-23 00:11:10',0),(314,502,503,3,1,2,'2014-10-23 00:12:06',0),(315,504,505,3,1,2,'2014-10-23 00:12:36',1),(316,506,507,3,1,2,'2014-10-23 00:13:18',1),(317,508,509,3,1,2,'2014-10-23 00:14:53',0),(318,510,511,3,1,2,'2014-10-23 00:15:05',0),(319,512,513,NULL,1,2,'2014-10-25 00:27:59',0),(320,514,515,NULL,1,2,'2014-10-25 00:28:29',0),(321,516,517,1,1,2,'2014-10-25 00:28:59',0),(322,518,519,NULL,1,2,'2014-10-25 00:29:35',0),(323,520,521,NULL,1,2,'2014-10-25 00:30:21',0),(324,522,523,NULL,1,2,'2014-10-25 00:33:13',0),(325,524,525,NULL,1,2,'2014-10-25 00:33:28',0),(326,526,527,NULL,1,2,'2014-10-25 00:33:55',0),(327,528,529,1,1,2,'2014-10-25 00:36:14',0),(328,530,531,2,1,2,'2014-10-25 10:04:11',0),(329,532,533,1,1,2,'2014-10-25 10:07:21',0),(330,534,535,1,1,2,'2014-10-25 10:10:17',0),(331,536,537,1,1,2,'2014-10-25 10:10:35',0),(332,538,539,1,1,2,'2014-10-25 10:11:08',0),(333,540,541,2,1,2,'2014-10-25 10:13:03',1),(334,542,543,2,1,2,'2014-10-25 10:14:22',0),(335,544,545,2,1,2,'2014-10-25 10:20:56',1),(336,546,547,NULL,1,2,'2014-10-25 10:38:31',1),(337,548,549,NULL,1,2,'2014-10-25 10:38:37',0),(338,550,551,NULL,1,2,'2014-10-25 10:39:09',1),(339,552,553,NULL,1,2,'2014-10-25 10:39:19',0),(340,554,555,NULL,1,2,'2014-10-25 10:52:03',0),(341,556,557,NULL,1,2,'2014-10-25 10:52:14',0),(342,558,559,NULL,1,2,'2014-10-25 10:53:08',0),(343,560,561,NULL,1,2,'2014-10-25 11:00:50',0),(344,562,563,NULL,1,2,'2014-10-25 11:01:09',1),(345,564,565,NULL,1,2,'2014-10-25 11:02:01',1),(346,566,567,NULL,1,2,'2014-10-25 11:02:14',0),(347,568,569,NULL,1,2,'2014-10-25 11:03:00',1),(348,570,571,2,1,2,'2014-10-25 11:03:53',0),(349,572,573,NULL,1,2,'2014-10-25 11:04:19',0),(350,574,575,2,1,2,'2014-10-25 11:06:37',0),(351,576,577,1,1,2,'2014-10-25 11:21:52',0),(352,578,579,NULL,1,2,'2014-10-25 11:22:14',0),(353,580,581,NULL,1,2,'2014-10-25 11:22:35',1),(354,582,583,NULL,1,2,'2014-10-25 11:23:18',0),(355,584,583,NULL,1,2,'2014-10-25 11:24:19',0),(356,585,586,1,1,2,'2014-10-25 11:24:40',1),(357,587,588,NULL,1,2,'2014-10-25 11:27:25',0),(358,589,590,1,1,2,'2014-10-25 11:27:47',0),(359,591,592,1,1,2,'2014-10-25 11:29:32',0),(360,593,594,1,1,2,'2014-10-25 11:30:21',1),(361,595,596,2,1,2,'2014-10-25 11:31:52',0),(362,597,598,1,1,2,'2014-10-25 11:32:21',1),(363,599,600,1,1,2,'2014-10-25 11:32:53',1),(364,601,602,1,1,2,'2014-10-25 22:54:56',1),(365,603,604,8,1,2,'2014-10-25 22:59:49',0),(366,605,606,1,1,2,'2014-10-25 23:05:22',0),(367,607,608,1,1,2,'2014-10-25 23:05:55',0),(368,609,610,1,1,2,'2014-10-25 23:06:23',0),(369,611,612,1,1,2,'2014-10-25 23:06:58',0),(370,613,614,1,1,2,'2014-10-25 23:07:37',0),(371,615,616,1,1,2,'2014-10-25 23:08:23',0),(372,617,618,1,1,2,'2014-10-25 23:09:11',0),(373,619,106,1,2,2,'2014-10-25 23:18:40',0),(374,620,146,1,2,2,'2014-10-25 23:36:16',0),(375,621,90,1,2,2,'2014-10-25 23:37:30',0),(376,622,623,1,2,2,'2014-10-26 11:33:05',0),(377,624,625,1,2,2,'2014-10-26 11:34:58',0),(378,626,627,1,2,2,'2014-10-26 11:39:02',0),(379,628,629,1,1,2,'2014-10-30 00:05:06',0),(380,630,631,1,1,2,'2014-10-30 00:05:47',0),(381,632,633,4,1,2,'2014-10-30 00:06:25',1),(382,634,635,1,1,2,'2014-10-30 00:06:41',0),(383,636,637,1,1,2,'2014-10-30 00:07:05',0),(384,638,639,1,1,2,'2014-10-30 00:35:47',0),(385,640,641,10,1,2,'2014-10-30 00:44:02',0),(386,642,643,10,1,2,'2014-10-30 01:07:39',0),(387,644,645,10,1,2,'2014-10-30 01:07:57',0),(388,646,647,10,1,2,'2014-10-30 01:08:16',0),(389,648,649,10,1,2,'2014-10-30 01:08:46',0),(390,650,651,2,1,2,'2014-10-30 01:11:54',1),(391,652,653,1,1,2,'2014-10-30 23:53:09',0),(392,654,655,1,1,2,'2014-10-30 23:53:52',0),(393,656,657,1,1,2,'2014-10-30 23:54:35',0),(394,658,659,1,1,2,'2014-10-30 23:57:27',0),(395,660,661,1,1,2,'2014-10-30 23:58:04',0),(396,662,663,1,1,2,'2014-10-30 23:58:42',0),(397,664,665,1,1,2,'2014-10-31 00:01:05',0),(398,666,667,1,1,2,'2014-10-31 00:01:54',1),(399,668,669,1,1,2,'2014-10-31 00:02:22',0),(400,670,671,1,1,2,'2014-10-31 00:03:36',0),(401,672,673,1,1,2,'2014-10-31 00:04:16',0),(402,674,675,1,1,2,'2014-10-31 00:05:06',0),(403,676,677,1,1,2,'2014-10-31 00:05:34',1),(404,678,679,1,1,2,'2014-10-31 00:09:29',1),(405,680,681,1,1,2,'2014-10-31 00:19:15',1),(406,682,683,1,1,2,'2014-10-31 00:19:53',0),(407,684,685,1,1,2,'2014-10-31 00:20:26',0),(408,686,442,8,1,2,'2014-11-04 00:23:00',0),(409,687,688,1,1,2,'2014-11-04 00:25:01',1),(410,689,690,1,1,2,'2014-11-04 00:26:36',0),(411,691,692,1,1,2,'2014-11-04 00:27:07',0),(412,693,694,1,1,2,'2014-11-04 00:29:15',0),(413,695,696,1,1,2,'2014-11-05 00:55:11',0),(414,697,698,1,1,2,'2014-11-05 00:55:55',0),(415,699,700,1,1,2,'2014-11-05 00:56:19',0),(416,701,702,1,1,2,'2014-11-05 00:56:57',0),(417,703,704,1,1,2,'2014-11-05 00:57:41',0),(418,705,706,1,1,2,'2014-11-05 01:03:33',0),(419,707,708,1,1,2,'2014-11-05 01:04:08',0),(420,709,710,1,1,2,'2014-11-05 01:04:57',0),(421,711,712,2,1,2,'2014-11-05 01:05:41',0),(422,713,714,1,1,2,'2014-11-05 01:06:34',0),(423,715,716,2,1,2,'2014-11-05 01:07:22',0),(424,717,718,1,1,2,'2014-11-05 01:07:51',0),(425,719,720,1,1,2,'2014-11-05 01:09:00',0),(426,721,722,2,1,2,'2014-11-05 23:18:51',0),(427,723,724,4,1,2,'2014-11-05 23:19:32',0),(428,725,726,4,1,2,'2014-11-05 23:20:05',0),(429,727,728,4,1,2,'2014-11-05 23:20:51',0),(430,729,730,1,1,2,'2014-11-05 23:22:22',0),(431,731,732,1,1,2,'2014-11-05 23:22:41',0),(432,733,734,1,1,2,'2014-11-05 23:23:40',0),(433,735,736,1,1,2,'2014-11-05 23:24:41',0),(434,737,738,1,1,2,'2014-11-05 23:25:22',0),(435,739,740,1,1,2,'2014-11-05 23:30:02',0),(436,741,742,1,1,2,'2014-11-05 23:30:26',0),(437,743,744,1,1,2,'2014-11-05 23:30:58',0),(438,745,746,1,1,2,'2014-11-05 23:31:33',0),(439,747,748,2,1,2,'2014-11-05 23:31:50',0),(440,749,744,1,1,2,'2014-11-05 23:33:36',0),(441,750,751,1,1,2,'2014-11-05 23:43:49',0),(442,752,753,1,1,2,'2014-11-05 23:44:56',0),(443,754,755,1,1,2,'2014-11-05 23:46:55',0),(444,756,757,1,1,2,'2014-11-05 23:47:13',0),(445,758,759,1,1,2,'2014-11-05 23:48:45',0),(446,760,761,1,1,2,'2014-11-05 23:49:13',0),(447,762,763,1,1,2,'2014-11-05 23:50:00',0),(448,764,765,1,1,2,'2014-11-05 23:52:23',0),(449,766,765,1,1,2,'2014-11-05 23:53:51',1),(450,767,768,1,1,2,'2014-11-05 23:56:01',0),(451,769,770,1,1,2,'2014-11-05 23:56:40',0),(452,771,772,1,1,2,'2014-11-05 23:57:11',0),(453,773,774,4,3,2,'2014-11-06 08:55:48',0),(454,775,776,3,1,2,'2014-11-06 23:21:40',1),(455,777,671,1,1,2,'2014-11-06 23:49:40',0),(456,778,779,10,1,2,'2014-11-06 23:59:11',0),(457,780,781,10,1,2,'2014-11-06 23:59:47',0),(458,782,783,10,1,2,'2014-11-07 00:00:45',0),(459,784,785,10,1,2,'2014-11-07 00:06:47',0),(460,786,787,10,1,2,'2014-11-07 00:09:14',0),(461,788,789,10,1,2,'2014-11-07 00:15:00',0),(462,790,791,2,1,2,'2014-11-07 00:15:45',0),(463,792,793,10,1,2,'2014-11-07 00:16:28',0),(464,794,795,10,1,2,'2014-11-07 00:17:05',0),(465,796,797,10,1,2,'2014-11-07 00:19:25',0),(466,798,799,10,1,2,'2014-11-07 00:21:02',1),(467,800,801,10,1,2,'2014-11-07 00:21:47',0),(468,802,803,10,1,2,'2014-11-07 00:23:26',1),(469,804,805,10,1,2,'2014-11-07 00:28:53',0),(470,806,807,10,1,2,'2014-11-07 00:29:27',0),(471,808,809,10,1,2,'2014-11-07 00:35:33',0),(472,810,811,1,4,5,'2015-02-10 10:17:13',0);
/*!40000 ALTER TABLE `ovski_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ovski_user`
--

DROP TABLE IF EXISTS `ovski_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ovski_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  `max_items_per_page` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D2DE0C6592FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_D2DE0C65A0D96FBF` (`email_canonical`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ovski_user`
--

LOCK TABLES `ovski_user` WRITE;
/*!40000 ALTER TABLE `ovski_user` DISABLE KEYS */;
INSERT INTO `ovski_user` VALUES (1,'baptiste','baptiste','baptiste@example.com','baptiste@example.com',1,'c9vgpx3x7sow4c8444ok88ckco00wkk','xcVHMhCx6YGd3FuDOHI94Vn4UsHfKeVLfHxuiaoPC+pqwx0m5wXhqHgIOn5oGm6jF1Gn3IlIDC/fh51J+4tSKw==','2014-10-12 13:49:22',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,20),(2,'ovski4','ovski4','baptiste.bouchereau@gmail.com','baptiste.bouchereau@gmail.com',1,'mjgt3j0xwlwo4gcowogksogkg0kgw8','QjC8TwLMo8TzZP+pK3fLdQiAGOYa9orjSz2l0i7dnHtxBpJnr7wdiPWpBdThEzytCJWEsJqmfL/eZF69mZq2eA==','2015-01-25 17:15:36',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,100),(3,'Lise Bchr','lise bchr','lise-bou@hotmail.fr','lise-bou@hotmail.fr',1,'1xs44vnyxvy80k8s0c4wcoc8c8w04w4','yyFqrl6l+uEjLgxYQc5NBdsINwkmXLPcLbKXPikSgob/iGH2GIH5S9y7KXp1rmiz0rBl/XTni/kzDpZDs/E7Zw==','2014-10-13 21:52:30',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,20),(4,'test','test','test@test.fr','test@test.fr',1,'8letopjhl2o8ccscwgw8gksgockcc80','h34v84D/Gs22x1vGnSzCy1p7lffj6hgkhDOQ0CpgN7LQHCcdeqhMaf2s5Ju8KqZKq9+xiOgm5WqUAATmf23SgA==','2014-10-05 02:51:25',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,20),(5,'demo','demo','demo@yopmail.com','demo@yopmail.com',1,'lrdqc688eu8gkw08sks8k4ogc88ss0c','64qpzIgvYQJzQk4HhMNzy2ypYeL5IcKVF0vbmyp77Ue6rGQ1gdXXyppcETVB2KJ8nuBTRlnpbqZrL0AmKsUZ8w==','2015-02-10 10:16:39',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,20),(6,'Caligone','caligone','caligone@gmx.fr','caligone@gmx.fr',1,'3o1c8gf95vswc0goo40w8kw8c0gg8ow','3hLmrVT08Liqu8JJrIxBRYq273DfTGV/1JuVrJQ75NoY2lizzJNRg86DBKaBX6afHjwscP6sR3Bha51O9l1GSg==','2014-10-12 11:46:35',0,0,NULL,NULL,NULL,'a:0:{}',0,NULL,20);
/*!40000 ALTER TABLE `ovski_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ovski_user_learning`
--

DROP TABLE IF EXISTS `ovski_user_learning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ovski_user_learning` (
  `learning_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`learning_id`,`user_id`),
  KEY `IDX_494F53A4E6B0AB3` (`learning_id`),
  KEY `IDX_494F53AA76ED395` (`user_id`),
  CONSTRAINT `FK_494F53A4E6B0AB3` FOREIGN KEY (`learning_id`) REFERENCES `ovski_learning` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_494F53AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `ovski_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ovski_user_learning`
--

LOCK TABLES `ovski_user_learning` WRITE;
/*!40000 ALTER TABLE `ovski_user_learning` DISABLE KEYS */;
INSERT INTO `ovski_user_learning` VALUES (1,1),(1,2),(1,3),(1,5),(2,1),(2,2),(3,2),(3,3),(3,5),(3,6),(4,5);
/*!40000 ALTER TABLE `ovski_user_learning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ovski_user_word`
--

DROP TABLE IF EXISTS `ovski_user_word`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ovski_user_word` (
  `word_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`word_id`,`user_id`),
  KEY `IDX_B1C9FD28E357438D` (`word_id`),
  KEY `IDX_B1C9FD28A76ED395` (`user_id`),
  CONSTRAINT `FK_B1C9FD28A76ED395` FOREIGN KEY (`user_id`) REFERENCES `ovski_user` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B1C9FD28E357438D` FOREIGN KEY (`word_id`) REFERENCES `ovski_word` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ovski_user_word`
--

LOCK TABLES `ovski_user_word` WRITE;
/*!40000 ALTER TABLE `ovski_user_word` DISABLE KEYS */;
/*!40000 ALTER TABLE `ovski_user_word` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ovski_word`
--

DROP TABLE IF EXISTS `ovski_word`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ovski_word` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) DEFAULT NULL,
  `word_type_id` int(11) DEFAULT NULL,
  `language_id` int(11) NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_word_idx` (`article_id`,`word_type_id`,`language_id`,`value`),
  KEY `IDX_9CBCAF3D7294869C` (`article_id`),
  KEY `IDX_9CBCAF3DCF3EFB60` (`word_type_id`),
  KEY `IDX_9CBCAF3D82F1BAF4` (`language_id`),
  CONSTRAINT `FK_9CBCAF3D7294869C` FOREIGN KEY (`article_id`) REFERENCES `ovski_article` (`id`),
  CONSTRAINT `FK_9CBCAF3D82F1BAF4` FOREIGN KEY (`language_id`) REFERENCES `ovski_language` (`id`),
  CONSTRAINT `FK_9CBCAF3DCF3EFB60` FOREIGN KEY (`word_type_id`) REFERENCES `ovski_word_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=812 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ovski_word`
--

LOCK TABLES `ovski_word` WRITE;
/*!40000 ALTER TABLE `ovski_word` DISABLE KEYS */;
INSERT INTO `ovski_word` VALUES (216,NULL,NULL,2,'\"dot\".com'),(255,NULL,NULL,2,'a happy hubbub'),(236,NULL,NULL,2,'backword'),(234,NULL,NULL,2,'breathtaking'),(218,NULL,NULL,2,'bright side'),(242,NULL,NULL,2,'degree'),(208,NULL,NULL,2,'fair'),(220,NULL,NULL,2,'increase'),(226,NULL,NULL,2,'nowadays'),(240,NULL,NULL,2,'owing to'),(190,NULL,NULL,2,'personnes d\'une même famille'),(238,NULL,NULL,2,'rate'),(249,NULL,NULL,2,'slice of pizza'),(253,NULL,NULL,2,'taking a nap'),(228,NULL,NULL,2,'to shy away from something'),(210,NULL,NULL,2,'unfair'),(232,NULL,NULL,2,'wilderness'),(204,NULL,NULL,2,'youth'),(554,NULL,NULL,3,'abril'),(564,NULL,NULL,3,'agosto'),(427,NULL,NULL,3,'amarillos'),(518,NULL,NULL,3,'ayer'),(423,NULL,NULL,3,'azul'),(384,NULL,NULL,3,'botas'),(376,NULL,NULL,3,'calcetines'),(568,NULL,NULL,3,'desde'),(562,NULL,NULL,3,'diciembre'),(524,NULL,NULL,3,'domingo'),(550,NULL,NULL,3,'enero'),(552,NULL,NULL,3,'febrero'),(378,NULL,NULL,3,'gafas'),(558,NULL,NULL,3,'julio'),(556,NULL,NULL,3,'junio'),(520,NULL,NULL,3,'lunes'),(514,NULL,NULL,3,'martes'),(546,NULL,NULL,3,'marzo'),(548,NULL,NULL,3,'mayo'),(587,NULL,NULL,3,'mediodia'),(512,NULL,NULL,3,'miércoles'),(429,NULL,NULL,3,'negro'),(572,NULL,NULL,3,'Noviembre'),(560,NULL,NULL,3,'octubre'),(425,NULL,NULL,3,'roja / rojo'),(522,NULL,NULL,3,'sábado'),(566,NULL,NULL,3,'septiembre'),(399,NULL,NULL,3,'tener'),(347,NULL,NULL,3,'test'),(421,NULL,NULL,3,'verde'),(526,NULL,NULL,3,'viernes'),(215,NULL,NULL,4,'\"point\".com'),(239,NULL,NULL,4,'à cause de'),(565,NULL,NULL,4,'août'),(219,NULL,NULL,4,'augmentation'),(225,NULL,NULL,4,'aujourd\'hui'),(400,NULL,NULL,4,'avoir'),(555,NULL,NULL,4,'avril'),(424,NULL,NULL,4,'bleu'),(217,NULL,NULL,4,'bon coté'),(385,NULL,NULL,4,'bottes'),(377,NULL,NULL,4,'chaussettes'),(563,NULL,NULL,4,'décembre'),(569,NULL,NULL,4,'depuis'),(525,NULL,NULL,4,'dimanche'),(241,NULL,NULL,4,'diplome'),(203,NULL,NULL,4,'enfance'),(252,NULL,NULL,4,'faire la sieste'),(553,NULL,NULL,4,'fevrier'),(519,NULL,NULL,4,'hier'),(209,NULL,NULL,4,'injuste'),(551,NULL,NULL,4,'janvier'),(428,NULL,NULL,4,'jaune'),(559,NULL,NULL,4,'juillet'),(557,NULL,NULL,4,'juin'),(207,NULL,NULL,4,'juste'),(521,NULL,NULL,4,'lundi'),(379,NULL,NULL,4,'lunettes'),(549,NULL,NULL,4,'mai'),(515,NULL,NULL,4,'mardi'),(547,NULL,NULL,4,'mars'),(513,NULL,NULL,4,'mercredi'),(588,NULL,NULL,4,'midi'),(231,NULL,NULL,4,'nature sauvage'),(430,NULL,NULL,4,'noir'),(573,NULL,NULL,4,'Novembre'),(561,NULL,NULL,4,'octobre'),(248,NULL,NULL,4,'part de pizza'),(227,NULL,NULL,4,'répugner à faire quelque chose'),(235,NULL,NULL,4,'retardé'),(426,NULL,NULL,4,'rouge'),(523,NULL,NULL,4,'samedi'),(567,NULL,NULL,4,'septembre'),(189,NULL,NULL,4,'sibs'),(233,NULL,NULL,4,'stupéfiant'),(237,NULL,NULL,4,'taux'),(348,NULL,NULL,4,'test'),(254,NULL,NULL,4,'un brouahah'),(527,NULL,NULL,4,'vendredi'),(422,NULL,NULL,4,'vert'),(206,NULL,1,2,'ladder'),(4,NULL,1,2,'outskirt'),(224,NULL,1,2,'phenomenon'),(214,NULL,1,2,'skill'),(6,NULL,1,4,'argent (banque)'),(92,NULL,1,4,'eau'),(110,NULL,1,4,'homme'),(12,NULL,1,4,'idée'),(247,NULL,2,2,'it\'s a real mess'),(251,NULL,2,2,'you are a pain'),(650,NULL,2,3,'anoche'),(55,NULL,2,3,'Bebemos'),(544,NULL,2,3,'de momento'),(530,NULL,2,3,'En un año'),(61,NULL,2,3,'espanõl'),(715,NULL,2,3,'especialidad'),(711,NULL,2,3,'especialistas'),(721,NULL,2,3,'habitación'),(59,NULL,2,3,'Hablas inglés'),(570,NULL,2,3,'Hasta cuándo?'),(574,NULL,2,3,'Hasta mañana!'),(63,NULL,2,3,'inglés'),(747,NULL,2,3,'jabón'),(77,NULL,2,3,'Je ne suis pas'),(103,NULL,2,3,'La mujer come'),(75,NULL,2,3,'Lo siento'),(595,NULL,2,3,'mañana por la mañana'),(141,NULL,2,3,'me cuesta'),(790,NULL,2,3,'Mi hermano menor'),(540,NULL,2,3,'por el momento'),(73,NULL,2,3,'Por favor'),(349,NULL,2,3,'ro'),(49,NULL,2,3,'Somos'),(107,NULL,2,3,'Soy'),(345,NULL,2,3,'test'),(101,NULL,2,3,'Tú eres'),(67,NULL,2,3,'tú hablas'),(69,NULL,2,3,'tú no tomas'),(542,NULL,2,3,'una vez a la semana'),(51,NULL,2,3,'Ustedes son hombres'),(575,NULL,2,4,'A demain!'),(64,NULL,2,4,'anglais'),(246,NULL,2,4,'c\'est un vrai basarre'),(722,NULL,2,4,'chambre (hotel, hopital)'),(531,NULL,2,4,'Dans un an'),(596,NULL,2,4,'demain matin'),(62,NULL,2,4,'espagnol'),(651,NULL,2,4,'hier soir'),(142,NULL,2,4,'j\'ai du mal à'),(108,NULL,2,4,'Je suis'),(76,NULL,2,4,'Je suis désolé'),(571,NULL,2,4,'Jusqu\'à quand?'),(104,NULL,2,4,'La femme mange'),(791,NULL,2,4,'Mon petit frère'),(56,NULL,2,4,'Nous buvons'),(50,NULL,2,4,'Nous sommes'),(445,NULL,2,4,'on the verge of'),(60,NULL,2,4,'parles tu anglais'),(545,NULL,2,4,'pour l\'instant'),(541,NULL,2,4,'pour le moment'),(350,NULL,2,4,'ro'),(74,NULL,2,4,'S\'il te plait'),(748,NULL,2,4,'savon'),(712,NULL,2,4,'spécialistes'),(716,NULL,2,4,'spécialité'),(346,NULL,2,4,'test'),(102,NULL,2,4,'Tu es'),(250,NULL,2,4,'tu es pénible'),(70,NULL,2,4,'tu ne bois pas'),(68,NULL,2,4,'tu parles'),(543,NULL,2,4,'une fois par semaine'),(52,NULL,2,4,'Vous êtes des hommes'),(78,NULL,2,4,'Yo no soy'),(492,NULL,3,3,'a las mujeres'),(510,NULL,3,3,'abajo'),(500,NULL,3,3,'acerca'),(498,NULL,3,3,'au'),(508,NULL,3,3,'bajo'),(504,NULL,3,3,'cerca'),(488,NULL,3,3,'con'),(494,NULL,3,3,'contra'),(486,NULL,3,3,'durante'),(480,NULL,3,3,'entre'),(496,NULL,3,3,'hacia'),(506,NULL,3,3,'la lado'),(484,NULL,3,3,'para'),(502,NULL,3,3,'según'),(490,NULL,3,3,'sin'),(482,NULL,3,3,'sobre'),(775,NULL,3,3,'veces'),(507,NULL,3,4,'à coté'),(501,NULL,3,4,'à propos de'),(499,NULL,3,4,'al'),(493,NULL,3,4,'aux femmes'),(489,NULL,3,4,'avec'),(495,NULL,3,4,'contre'),(511,NULL,3,4,'en dessous'),(481,NULL,3,4,'entre, parmi'),(776,NULL,3,4,'parfois'),(487,NULL,3,4,'pendant'),(485,NULL,3,4,'pour'),(505,NULL,3,4,'prêt'),(491,NULL,3,4,'sans'),(503,NULL,3,4,'selon / d\'après'),(509,NULL,3,4,'sous'),(483,NULL,3,4,'sur'),(497,NULL,3,4,'vers (en direction de)'),(415,NULL,4,1,'essen'),(416,NULL,4,1,'trinken'),(230,NULL,4,2,'apply'),(212,NULL,4,2,'drop out'),(2,NULL,4,2,'entreprendre'),(244,NULL,4,2,'looking after'),(245,NULL,4,2,'looking at'),(202,NULL,4,2,'to afford'),(184,NULL,4,2,'to dangle'),(192,NULL,4,2,'to hoard'),(188,NULL,4,2,'to shrink'),(186,NULL,4,2,'tu peek'),(29,NULL,4,3,'aprender algo'),(93,NULL,4,3,'beber'),(397,NULL,4,3,'caminar'),(157,NULL,4,3,'cocinar'),(115,NULL,4,3,'comer'),(405,NULL,4,3,'correr'),(143,NULL,4,3,'costar'),(139,NULL,4,3,'cruzar'),(21,NULL,4,3,'dar algo'),(409,NULL,4,3,'dormir'),(125,NULL,4,3,'escalar'),(37,NULL,4,3,'escribir'),(95,NULL,4,3,'estar'),(117,NULL,4,3,'hablar'),(437,NULL,4,3,'hacer'),(137,NULL,4,3,'hundirse'),(127,NULL,4,3,'intentar'),(13,NULL,4,3,'ir'),(725,NULL,4,3,'lavar'),(151,NULL,4,3,'leer'),(723,NULL,4,3,'limpiar'),(9,NULL,4,3,'mirar'),(393,NULL,4,3,'nadar'),(431,NULL,4,3,'oír'),(727,NULL,4,3,'ordenar'),(407,NULL,4,3,'pagar'),(39,NULL,4,3,'pensar'),(433,NULL,4,3,'poder'),(403,NULL,4,3,'querer'),(97,NULL,4,3,'Ser'),(401,NULL,4,3,'tener'),(435,NULL,4,3,'tocar'),(23,NULL,4,3,'trabajar'),(395,NULL,4,3,'ver'),(123,NULL,4,3,'vigilar'),(632,NULL,4,3,'voy'),(211,NULL,4,4,'abandonner'),(14,NULL,4,4,'aller'),(191,NULL,4,4,'amasser'),(229,NULL,4,4,'appliquer'),(30,NULL,4,4,'apprendre quelque chose'),(402,NULL,4,4,'avoir'),(94,NULL,4,4,'boire'),(406,NULL,4,4,'courrir'),(144,NULL,4,4,'coûter'),(158,NULL,4,4,'cuisiner'),(22,NULL,4,4,'donner quelque chose'),(410,NULL,4,4,'dormir'),(38,NULL,4,4,'écrire'),(432,NULL,4,4,'entendre'),(126,NULL,4,4,'escalader'),(128,NULL,4,4,'essayer de'),(98,NULL,4,4,'Être (permament)'),(96,NULL,4,4,'être (transitoire)'),(447,NULL,4,4,'exprimer son support'),(438,NULL,4,4,'faire / fabriquer / être l\'auteur de'),(633,NULL,4,4,'je vais'),(185,NULL,4,4,'jeter un coup d\'oeil'),(726,NULL,4,4,'laver'),(152,NULL,4,4,'lire'),(116,NULL,4,4,'manger'),(398,NULL,4,4,'marcher'),(394,NULL,4,4,'nager'),(724,NULL,4,4,'nettoyer'),(183,NULL,4,4,'pandouiller'),(118,NULL,4,4,'parler'),(408,NULL,4,4,'payer'),(40,NULL,4,4,'penser'),(773,NULL,4,4,'planer'),(434,NULL,4,4,'pouvoir'),(728,NULL,4,4,'ranger'),(10,NULL,4,4,'regarder'),(187,NULL,4,4,'rétrécir'),(138,NULL,4,4,'se blesser'),(201,NULL,4,4,'se permettre de'),(124,NULL,4,4,'surveiller'),(243,NULL,4,4,'surveiller (des enfants)'),(436,NULL,4,4,'toucher'),(24,NULL,4,4,'travailler'),(140,NULL,4,4,'traverser'),(1,NULL,4,4,'undertake'),(396,NULL,4,4,'voir'),(404,NULL,4,4,'vouloir'),(335,NULL,5,3,'cómo'),(374,NULL,5,3,'cuál'),(368,NULL,5,3,'cualé'),(343,NULL,5,3,'cualés'),(372,NULL,5,3,'cuándo'),(370,NULL,5,3,'cuantós'),(15,NULL,5,3,'derecha'),(27,NULL,5,3,'hoy'),(147,NULL,5,3,'izquierda'),(31,NULL,5,3,'mañana'),(337,NULL,5,3,'qué'),(341,NULL,5,3,'quién'),(339,NULL,5,3,'quiénes'),(28,NULL,5,4,'aujourd\'hui'),(371,NULL,5,4,'combien'),(336,NULL,5,4,'comment'),(32,NULL,5,4,'demain'),(16,NULL,5,4,'droite'),(148,NULL,5,4,'gauche'),(373,NULL,5,4,'quand'),(375,NULL,5,4,'quel'),(369,NULL,5,4,'quel / quelle'),(344,NULL,5,4,'quelles'),(340,NULL,5,4,'qui (plusieurs)'),(342,NULL,5,4,'qui (seul)'),(338,NULL,5,4,'quoi'),(83,NULL,6,3,'adiós'),(79,NULL,6,3,'buenas noches'),(85,NULL,6,3,'buenos días'),(65,NULL,6,3,'disculpe'),(87,NULL,6,3,'Gracias'),(81,NULL,6,3,'Mucho gusto'),(71,NULL,6,3,'perdón'),(84,NULL,6,4,'au revoir'),(86,NULL,6,4,'bonjour'),(80,NULL,6,4,'bonsoir'),(82,NULL,6,4,'enchanté'),(66,NULL,6,4,'excusez moi'),(88,NULL,6,4,'Merci'),(72,NULL,6,4,'pardon'),(45,NULL,7,3,'las'),(43,NULL,7,3,'los'),(17,NULL,7,3,'viejo'),(46,NULL,7,4,'les, celles'),(44,NULL,7,4,'les, ceux'),(18,NULL,7,4,'vieux'),(603,NULL,8,3,'aunque'),(451,NULL,8,3,'como'),(449,NULL,8,3,'mientras'),(443,NULL,8,3,'o'),(441,NULL,8,3,'pero'),(686,NULL,8,3,'sino'),(439,NULL,8,3,'y'),(452,NULL,8,4,'comme'),(440,NULL,8,4,'et'),(442,NULL,8,4,'mais'),(604,NULL,8,4,'même si'),(444,NULL,8,4,'ou'),(450,NULL,8,4,'pendant (que)'),(306,NULL,9,3,'mi'),(316,NULL,9,3,'mía'),(318,NULL,9,3,'mío'),(308,NULL,9,3,'mis'),(53,NULL,9,3,'nosotros'),(314,NULL,9,3,'nuestra'),(298,NULL,9,3,'nuestro'),(312,NULL,9,3,'nuestros'),(304,NULL,9,3,'su'),(310,NULL,9,3,'sus'),(320,NULL,9,3,'suyo'),(300,NULL,9,3,'tu'),(302,NULL,9,3,'tus'),(99,NULL,9,3,'Usted'),(57,NULL,9,3,'Ustedes'),(47,NULL,9,3,'vosostros'),(321,NULL,9,4,'à eux'),(322,NULL,9,4,'à lui'),(319,NULL,9,4,'à moi (le mien)'),(317,NULL,9,4,'à moi / la mienne (féminin)'),(299,NULL,9,4,'à nous / nôtre (masculin)'),(309,NULL,9,4,'mes'),(307,NULL,9,4,'mon'),(313,NULL,9,4,'nos (masculin)'),(315,NULL,9,4,'nôtre (féminin)'),(54,NULL,9,4,'nous/on'),(305,NULL,9,4,'son'),(303,NULL,9,4,'tes'),(301,NULL,9,4,'ton'),(311,NULL,9,4,'vos'),(48,NULL,9,4,'vous (tutoiement plusieurs)'),(58,NULL,9,4,'Vouvoiement plusieurs personne'),(100,NULL,9,4,'Vouvoiement une seule personne'),(222,NULL,10,2,'sharply'),(644,NULL,10,3,'alto'),(646,NULL,10,3,'bajo'),(782,NULL,10,3,'bilingüe'),(778,NULL,10,3,'buen'),(802,NULL,10,3,'cierto'),(648,NULL,10,3,'corta'),(808,NULL,10,3,'dura'),(784,NULL,10,3,'feo'),(780,NULL,10,3,'la misma'),(642,NULL,10,3,'largo'),(792,NULL,10,3,'mayores'),(788,NULL,10,3,'mejor'),(804,NULL,10,3,'necesarios'),(640,NULL,10,3,'pequeñas'),(798,NULL,10,3,'positivo'),(786,NULL,10,3,'primero'),(800,NULL,10,3,'reales'),(806,NULL,10,3,'solo'),(796,NULL,10,3,'último'),(794,NULL,10,3,'útil'),(793,NULL,10,4,'âgés'),(783,NULL,10,4,'billingue'),(779,NULL,10,4,'bon'),(649,NULL,10,4,'courte'),(797,NULL,10,4,'dernier'),(809,NULL,10,4,'dure'),(645,NULL,10,4,'grand'),(781,NULL,10,4,'la même'),(785,NULL,10,4,'laid'),(643,NULL,10,4,'long'),(789,NULL,10,4,'meilleur'),(805,NULL,10,4,'nécessaires'),(647,NULL,10,4,'petit'),(641,NULL,10,4,'petites'),(799,NULL,10,4,'positif'),(787,NULL,10,4,'premier'),(221,NULL,10,4,'rapidement'),(292,NULL,10,4,'rassi / pas frais'),(801,NULL,10,4,'réels'),(807,NULL,10,4,'seul'),(795,NULL,10,4,'utile'),(803,NULL,10,4,'vrai / certain'),(810,1,1,2,'d'),(291,1,1,2,'thrust'),(446,1,2,2,'sur le point de'),(448,1,4,2,'to root for'),(774,1,4,2,'to soar'),(293,1,10,2,'stale'),(760,2,NULL,3,'cajero'),(591,2,NULL,3,'cumpleaños'),(458,2,NULL,3,'de'),(580,2,NULL,3,'invernio'),(333,2,1,3,'abrigo'),(464,2,1,3,'abuelo'),(717,2,1,3,'agente'),(91,2,1,3,'agua'),(177,2,1,3,'almuerzo'),(266,2,1,3,'animal'),(528,2,1,3,'año'),(161,2,1,3,'arroz'),(364,2,1,3,'ave (classe)'),(199,2,1,3,'caballo'),(516,2,1,3,'calendario'),(359,2,1,3,'cangrejo'),(697,2,1,3,'capitán'),(762,2,1,3,'carpintero'),(731,2,1,3,'cepillo'),(270,2,1,3,'cerdo'),(388,2,1,3,'cinturón'),(767,2,1,3,'cocinero'),(419,2,1,3,'color'),(713,2,1,3,'comandante'),(272,2,1,3,'conejo'),(701,2,1,3,'coronel'),(605,2,1,3,'cuchillo'),(133,2,1,3,'dedo'),(353,2,1,3,'desayuno'),(149,2,1,3,'diario'),(5,2,1,3,'dinero'),(672,2,1,3,'dormitorio'),(707,2,1,3,'dueño'),(258,2,1,3,'elephante'),(282,2,1,3,'emparedado'),(703,2,1,3,'empleado'),(689,2,1,3,'empresario'),(658,2,1,3,'escritorio'),(654,2,1,3,'espejo'),(687,2,1,3,'gardia'),(193,2,1,3,'gato'),(758,2,1,3,'granjero'),(25,2,1,3,'hermano'),(462,2,1,3,'hijo'),(109,2,1,3,'hombre'),(668,2,1,3,'horno'),(159,2,1,3,'huevo'),(680,2,1,3,'jefe'),(693,2,1,3,'juez'),(167,2,1,3,'jugo'),(276,2,1,3,'léon'),(35,2,1,3,'libro'),(601,2,1,3,'los anteojos'),(470,2,1,3,'marido'),(284,2,1,3,'menú'),(532,2,1,3,'mes'),(536,2,1,3,'minuto'),(274,2,1,3,'mono'),(111,2,1,3,'niño'),(264,2,1,3,'oso'),(418,2,1,3,'pájaro'),(119,2,1,3,'pan'),(756,2,1,3,'panadero'),(743,2,1,3,'paraguas'),(260,2,1,3,'pato'),(197,2,1,3,'perro'),(155,2,1,3,'pescado'),(705,2,1,3,'pintor'),(666,2,1,3,'piso'),(617,2,1,3,'plato'),(468,2,1,3,'primo'),(709,2,1,3,'principe'),(361,2,1,3,'puerco / chancho'),(165,2,1,3,'queso'),(268,2,1,3,'ratón'),(733,2,1,3,'refrigerador'),(682,2,1,3,'rey'),(750,2,1,3,'sacerdote'),(684,2,1,3,'secretario'),(576,2,1,3,'segundo'),(691,2,1,3,'soldado'),(323,2,1,3,'sombrero'),(670,2,1,3,'sótano'),(390,2,1,3,'suéter'),(638,2,1,3,'tamaño'),(664,2,1,3,'techo'),(678,2,1,3,'tejado'),(630,2,1,3,'teléfono'),(131,2,1,3,'tiburó'),(454,2,1,3,'tío'),(754,2,1,3,'trabajo'),(380,2,1,3,'traje'),(613,2,1,3,'vaso'),(294,2,1,3,'vegetariano'),(597,2,1,3,'verano'),(329,2,1,3,'vestido'),(41,2,1,3,'vino'),(327,2,1,3,'zapato'),(582,3,NULL,3,'estación'),(578,3,NULL,3,'primavera'),(719,3,NULL,3,'propriétaire'),(584,3,NULL,3,'temporada'),(476,3,1,3,'abuela'),(262,3,1,3,'araña'),(695,3,1,3,'avogada'),(777,3,1,3,'bodega'),(609,3,1,3,'cama'),(121,3,1,3,'cámaras'),(766,3,1,3,'camarera'),(325,3,1,3,'camisa'),(163,3,1,3,'carne'),(33,3,1,3,'carta'),(745,3,1,3,'cartera'),(19,3,1,3,'casa'),(357,3,1,3,'cebolla'),(286,3,1,3,'cena'),(179,3,1,3,'comida'),(382,3,1,3,'corbata'),(615,3,1,3,'cuchara'),(351,3,1,3,'ddd'),(769,3,1,3,'enfermera'),(674,3,1,3,'escalera'),(652,3,1,3,'esponja'),(460,3,1,3,'esposa'),(386,3,1,3,'falda'),(599,3,1,3,'fecha'),(173,3,1,3,'fresa'),(195,3,1,3,'gata'),(135,3,1,3,'herida'),(453,3,1,3,'hija'),(538,3,1,3,'hora'),(11,3,1,3,'idea'),(363,3,1,3,'jaiba'),(660,3,1,3,'lámpara'),(735,3,1,3,'lavadora'),(89,3,1,3,'leche'),(280,3,1,3,'llave'),(456,3,1,3,'madre'),(593,3,1,3,'madrugada'),(478,3,1,3,'mamà'),(145,3,1,3,'manzana'),(607,3,1,3,'mesa'),(764,3,1,3,'mesera'),(105,3,1,3,'mujer'),(355,3,1,3,'naranja'),(113,3,1,3,'niña'),(474,3,1,3,'novia'),(278,3,1,3,'palabra'),(175,3,1,3,'papa'),(676,3,1,3,'pared'),(169,3,1,3,'pasta'),(699,3,1,3,'periodista'),(153,3,1,3,'persona'),(634,3,1,3,'piscina'),(392,3,1,3,'pollera'),(366,3,1,3,'pregunta'),(752,3,1,3,'profesión'),(739,3,1,3,'rasuradora'),(331,3,1,3,'ropa'),(288,3,1,3,'sal'),(181,3,1,3,'salsa'),(737,3,1,3,'secadora'),(534,3,1,3,'semana'),(611,3,1,3,'silla'),(749,3,1,3,'sombrilla'),(171,3,1,3,'sopa'),(636,3,1,3,'taza'),(472,3,1,3,'tìa'),(256,3,1,3,'tortuga'),(129,3,1,3,'valla'),(296,3,1,3,'vegetariana'),(7,3,1,3,'ventana'),(741,3,2,3,'sábana'),(620,4,1,1,'Apfel'),(413,4,1,1,'Junge'),(624,5,1,1,'die Männer'),(619,5,1,1,'Frau'),(626,5,1,1,'Frauen'),(621,5,1,1,'Milch'),(417,6,1,1,'Brot'),(811,6,1,1,'dasdfs'),(622,6,1,1,'die Kinder'),(411,6,1,1,'Mädchen'),(761,7,NULL,4,'caissier'),(579,7,NULL,4,'printemps'),(757,7,1,4,'boulanger'),(659,7,1,4,'bureau (meuble)'),(517,7,1,4,'calendrier'),(261,7,1,4,'canard'),(698,7,1,4,'capitaine'),(324,7,1,4,'chapeau'),(763,7,1,4,'charpentier'),(194,7,1,4,'chat'),(681,7,1,4,'chef'),(200,7,1,4,'cheval'),(198,7,1,4,'chien'),(271,7,1,4,'cochon / porc'),(702,7,1,4,'colonel'),(714,7,1,4,'commandant'),(381,7,1,4,'costume'),(469,7,1,4,'cousin'),(606,7,1,4,'couteau'),(360,7,1,4,'crabe'),(768,7,1,4,'cuisinier'),(178,7,1,4,'déjeuner'),(287,7,1,4,'dîner'),(134,7,1,4,'doigt'),(20,7,1,4,'domicile'),(759,7,1,4,'fermier'),(463,7,1,4,'fils'),(669,7,1,4,'four'),(26,7,1,4,'frêre'),(166,7,1,4,'fromage'),(414,7,1,4,'garçon'),(688,7,1,4,'garde'),(465,7,1,4,'grand-père'),(150,7,1,4,'journal'),(694,7,1,4,'juge'),(168,7,1,4,'jus'),(90,7,1,4,'lait'),(273,7,1,4,'lapin'),(332,7,1,4,'linge / les vêtements'),(277,7,1,4,'lion'),(610,7,1,4,'lit'),(36,7,1,4,'livre'),(334,7,1,4,'manteau'),(471,7,1,4,'mari'),(285,7,1,4,'menu'),(655,7,1,4,'miroir'),(533,7,1,4,'mois'),(279,7,1,4,'mot / parole'),(677,7,1,4,'mur'),(120,7,1,4,'pain'),(744,7,1,4,'parapluie'),(706,7,1,4,'peintre'),(112,7,1,4,'petit garçon'),(354,7,1,4,'petit-déjeuner'),(223,7,1,4,'phénomène'),(665,7,1,4,'plafond'),(618,7,1,4,'plat / l\'assiette'),(156,7,1,4,'poisson'),(362,7,1,4,'porc'),(746,7,1,4,'portefeuille'),(751,7,1,4,'prêtre'),(710,7,1,4,'prince'),(708,7,1,4,'propriétaire'),(391,7,1,4,'pull'),(740,7,1,4,'rasoir'),(734,7,1,4,'réfrigérateur'),(132,7,1,4,'requin'),(162,7,1,4,'riz'),(683,7,1,4,'roi'),(283,7,1,4,'sandwich'),(738,7,1,4,'sèche-linge'),(685,7,1,4,'secrétaire'),(289,7,1,4,'sel'),(275,7,1,4,'singe'),(667,7,1,4,'sol'),(692,7,1,4,'soldat'),(631,7,1,4,'téléphone'),(679,7,1,4,'toit'),(755,7,1,4,'travail'),(295,7,1,4,'végétarien'),(614,7,1,4,'verre'),(42,7,1,4,'vin'),(742,7,2,4,'drap'),(720,8,NULL,4,'dueña'),(583,8,NULL,4,'saison'),(114,8,1,4,'(petite) fille'),(136,8,1,4,'blessure'),(732,8,1,4,'brosse'),(122,8,1,4,'camera'),(671,8,1,4,'cave'),(389,8,1,4,'ceinture'),(612,8,1,4,'chaise'),(673,8,1,4,'chambre'),(196,8,1,4,'chatte'),(328,8,1,4,'chaussure'),(326,8,1,4,'chemise'),(281,8,1,4,'clef'),(130,8,1,4,'cloture'),(213,8,1,4,'compétence'),(420,8,1,4,'couleur'),(383,8,1,4,'cravate'),(616,8,1,4,'cuillère'),(600,8,1,4,'date'),(106,8,1,4,'femme'),(8,8,1,4,'fenêtre'),(412,8,1,4,'fille'),(174,8,1,4,'fraise'),(477,8,1,4,'grand-mère'),(700,8,1,4,'journaliste'),(387,8,1,4,'jupe'),(608,8,1,4,'la table'),(661,8,1,4,'lampe'),(627,8,1,4,'les femmes'),(602,8,1,4,'les lunettes'),(170,8,1,4,'les pâtes'),(34,8,1,4,'lettre / charte / carte'),(736,8,1,4,'machine à laver'),(479,8,1,4,'maman'),(457,8,1,4,'mère'),(537,8,1,4,'minute'),(180,8,1,4,'nourriture'),(3,8,1,4,'périphérie'),(154,8,1,4,'personne'),(475,8,1,4,'petite amie'),(635,8,1,4,'piscine'),(146,8,1,4,'pomme'),(176,8,1,4,'pomme de terre'),(290,8,1,4,'pousée (vaisseau)'),(753,8,1,4,'profession'),(367,8,1,4,'question'),(330,8,1,4,'robe'),(182,8,1,4,'sauce'),(577,8,1,4,'seconde'),(535,8,1,4,'semaine'),(765,8,1,4,'serveuse'),(172,8,1,4,'soupe'),(269,8,1,4,'souris'),(352,8,1,4,'ssss'),(639,8,1,4,'taille'),(473,8,1,4,'tante'),(637,8,1,4,'tasse'),(257,8,1,4,'tortue'),(297,8,1,4,'végétarienne'),(164,8,1,4,'viande'),(592,9,NULL,4,'anniversaire'),(459,9,NULL,4,'de'),(581,9,NULL,4,'hiver'),(718,9,1,4,'agent'),(267,9,1,4,'animal'),(529,9,1,4,'année'),(263,9,1,4,'araignée'),(594,9,1,4,'aube'),(696,9,1,4,'avocate (métier)'),(205,9,1,4,'échelle'),(259,9,1,4,'éléphant'),(704,9,1,4,'employé'),(690,9,1,4,'entrepreneur'),(653,9,1,4,'éponge'),(461,9,1,4,'épouse'),(675,9,1,4,'escalier / échelle'),(598,9,1,4,'été'),(539,9,1,4,'heure'),(770,9,1,4,'infirmière'),(623,9,1,4,'Les enfants'),(625,9,1,4,'les hommes'),(160,9,1,4,'oeuf'),(358,9,1,4,'oignon'),(365,9,1,4,'oiseau'),(455,9,1,4,'oncle'),(356,9,1,4,'orange'),(265,9,1,4,'ours'),(586,12,NULL,4,'moment'),(772,12,1,4,'athlète'),(730,12,1,4,'bain'),(467,12,1,4,'bébé'),(629,12,1,4,'berceau'),(590,12,1,4,'rendez-vous'),(663,13,1,4,'poêle'),(657,13,1,4,'porte'),(585,14,NULL,3,'rato'),(771,14,1,3,'atleta'),(729,14,1,3,'baño'),(466,15,1,3,'bébé'),(589,15,1,3,'cita'),(628,15,1,3,'cuna'),(656,15,1,3,'puerta'),(662,15,1,3,'sárten');
/*!40000 ALTER TABLE `ovski_word` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ovski_word_type`
--

DROP TABLE IF EXISTS `ovski_word_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ovski_word_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ovski_word_type`
--

LOCK TABLES `ovski_word_type` WRITE;
/*!40000 ALTER TABLE `ovski_word_type` DISABLE KEYS */;
INSERT INTO `ovski_word_type` VALUES (1,'name'),(2,'sentence'),(3,'preposition'),(4,'verb'),(5,'adverb'),(6,'interjection'),(7,'article'),(8,'conjunction'),(9,'pronoun'),(10,'adjective');
/*!40000 ALTER TABLE `ovski_word_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-02-15 16:21:30
