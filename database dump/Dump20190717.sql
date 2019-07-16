-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: recipe
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ingridients`
--

DROP TABLE IF EXISTS `ingridients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ingridients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingridients`
--

LOCK TABLES `ingridients` WRITE;
/*!40000 ALTER TABLE `ingridients` DISABLE KEYS */;
INSERT INTO `ingridients` VALUES (3,'Egg','2019-07-16 05:05:21','2019-07-16 05:05:21'),(4,'Eggsss','2019-07-16 10:53:27','2019-07-16 10:53:27'),(5,'dd','2019-07-16 15:01:47','2019-07-16 15:01:47'),(6,'Potato','2019-07-16 15:11:23','2019-07-16 15:11:23'),(7,'Cabage','2019-07-16 15:14:18','2019-07-16 15:14:18'),(8,'carrot','2019-07-16 15:15:29','2019-07-16 15:15:29');
/*!40000 ALTER TABLE `ingridients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (10,'2014_10_12_000000_create_users_table',1),(11,'2014_10_12_100000_create_password_resets_table',1),(12,'2019_07_15_175847_create_ingridients_table',1),(13,'2019_07_15_181144_create_recipes_table',1),(16,'2019_07_15_182945_create_recipe_ingridient_table',2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe_ingridient`
--

DROP TABLE IF EXISTS `recipe_ingridient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `recipe_ingridient` (
  `recipe_id` int(10) unsigned NOT NULL,
  `ingridient_id` int(10) unsigned NOT NULL,
  `count` double unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `recipe_ingridient_recipe_id_foreign` (`recipe_id`),
  KEY `recipe_ingridient_ingridient_id_foreign` (`ingridient_id`),
  CONSTRAINT `recipe_ingridient_ingridient_id_foreign` FOREIGN KEY (`ingridient_id`) REFERENCES `ingridients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `recipe_ingridient_recipe_id_foreign` FOREIGN KEY (`recipe_id`) REFERENCES `recipes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe_ingridient`
--

LOCK TABLES `recipe_ingridient` WRITE;
/*!40000 ALTER TABLE `recipe_ingridient` DISABLE KEYS */;
INSERT INTO `recipe_ingridient` VALUES (22,3,1,'2019-07-16 12:51:58','2019-07-16 12:51:58'),(22,4,2,'2019-07-16 12:51:58','2019-07-16 12:51:58'),(23,3,3,'2019-07-16 14:12:10','2019-07-16 14:12:10'),(24,3,3,'2019-07-16 14:12:49','2019-07-16 14:12:49'),(24,4,37,'2019-07-16 14:12:49','2019-07-16 14:12:49'),(24,3,5,'2019-07-16 14:12:49','2019-07-16 14:12:49'),(25,3,1,'2019-07-16 15:51:37','2019-07-16 15:51:37'),(25,7,2,'2019-07-16 15:51:37','2019-07-16 15:51:37'),(26,3,1,'2019-07-16 18:08:53','2019-07-16 18:08:53'),(26,5,2,'2019-07-16 18:08:53','2019-07-16 18:08:53'),(27,3,1,'2019-07-16 18:09:41','2019-07-16 18:09:41'),(27,5,2,'2019-07-16 18:09:41','2019-07-16 18:09:41');
/*!40000 ALTER TABLE `recipe_ingridient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `recipes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (1,'Оливье','ВКУСНОЕ','2019-07-16 05:21:56','2019-07-16 05:22:05'),(2,'Item','Item','2019-07-16 12:01:14','2019-07-16 12:01:14'),(3,'fewfesf','sfweg','2019-07-16 12:13:10','2019-07-16 12:13:10'),(4,'aaaa','wdc','2019-07-16 12:20:12','2019-07-16 12:20:12'),(5,'w','e','2019-07-16 12:34:48','2019-07-16 12:34:48'),(6,'w','e','2019-07-16 12:35:45','2019-07-16 12:35:45'),(7,'w','e','2019-07-16 12:36:02','2019-07-16 12:36:02'),(8,'w','e','2019-07-16 12:38:00','2019-07-16 12:38:00'),(9,'w','e','2019-07-16 12:40:55','2019-07-16 12:40:55'),(10,'w','e','2019-07-16 12:41:31','2019-07-16 12:41:31'),(11,'qq','qq','2019-07-16 12:43:03','2019-07-16 12:43:03'),(12,'qq','qq','2019-07-16 12:43:45','2019-07-16 12:43:45'),(13,'qq','qq','2019-07-16 12:43:47','2019-07-16 12:43:47'),(14,'qq','qq','2019-07-16 12:43:52','2019-07-16 12:43:52'),(15,'qq','qq','2019-07-16 12:47:40','2019-07-16 12:47:40'),(16,'qq','qq','2019-07-16 12:47:52','2019-07-16 12:47:52'),(17,'qq','qq','2019-07-16 12:47:53','2019-07-16 12:47:53'),(18,'qq','qq','2019-07-16 12:48:12','2019-07-16 12:48:12'),(19,'qq','wqf','2019-07-16 12:49:03','2019-07-16 12:49:03'),(20,'qq','wqf','2019-07-16 12:49:36','2019-07-16 12:49:36'),(21,'qq','wqf','2019-07-16 12:49:51','2019-07-16 12:49:51'),(22,'qq','wqf','2019-07-16 12:51:58','2019-07-16 12:51:58'),(23,'vcv','hvv','2019-07-16 14:12:10','2019-07-16 14:12:10'),(24,'vcv','hvv','2019-07-16 14:12:49','2019-07-16 14:12:49'),(25,'оливе','оливе','2019-07-16 15:51:37','2019-07-16 15:51:37'),(26,'Каша','вкусная','2019-07-16 18:08:53','2019-07-16 18:08:53'),(27,'Каша2','1234','2019-07-16 18:09:41','2019-07-16 18:39:14');
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'me','alenavereshaka16@gmail.com','$2y$10$K9gNZiaWKV28/7MFbXeTI.zLxGGClWqsTB2lBEN4ww52p7UgjGxLK','iKawJGReacibnZC2gFKzX1gbMOS6kSpQzivbkctDeZg7R03hN6nTL0EpdZ6x','2019-07-16 16:20:24','2019-07-16 16:20:24');
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

-- Dump completed on 2019-07-17  0:55:26
