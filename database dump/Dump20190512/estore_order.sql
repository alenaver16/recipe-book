-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: estore
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
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_price` double unsigned NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `first_name` varchar(40) DEFAULT NULL,
  `last_name` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `country` varchar(40) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `address` varchar(40) DEFAULT NULL,
  `postcode` varchar(40) DEFAULT NULL,
  `note` text,
  `shipping_method` varchar(40) DEFAULT 'Free Shipping',
  `order_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_order_fk` (`user_id`),
  CONSTRAINT `user_order_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,1066,NULL,'Алена','Верещака','alona.vereshchaka@hneu.net','0993507724','Украина','Харьков','проспект Науки 7','61000','','Free Shipping','2019-05-10 19:17:24'),(2,1066,NULL,'Vereschaka','YUrevna','alenavereshaka16@gmail.com','0993507724','Украина','ХАРЬКОВ','ЦЕЛИНОГРАДСКАЯ 40, ','64703','','Free Shipping','2019-05-10 19:20:58'),(3,1066,NULL,'Vereschaka','YUrevna','alenavereshaka16@gmail.com','0993507724','Украина','ХАРЬКОВ','ЦЕЛИНОГРАДСКАЯ 40, ','64703','','Free Shipping','2019-05-10 19:25:58'),(4,1066,NULL,'Vereschaka','YUrevna','alenavereshaka16@gmail.com','0993507724','Украина','ХАРЬКОВ','ЦЕЛИНОГРАДСКАЯ 40, ','64703','','Free Shipping','2019-05-10 19:26:14'),(5,1066,NULL,'Vereschaka','YUrevna','alenavereshaka16@gmail.com','0993507724','Украина','ХАРЬКОВ','ЦЕЛИНОГРАДСКАЯ 40, ','64703','','Free Shipping','2019-05-10 19:26:29'),(6,1066,NULL,'Vereschaka','YUrevna','alenavereshaka16@gmail.com','0993507724','Украина','ХАРЬКОВ','ЦЕЛИНОГРАДСКАЯ 40, ','64703','','Free Shipping','2019-05-10 19:29:08'),(7,1066,NULL,'Vereschaka','YUrevna','alenavereshaka16@gmail.com','0993507724','Украина','ХАРЬКОВ','ЦЕЛИНОГРАДСКАЯ 40, ','64703','','Free Shipping','2019-05-10 19:30:01'),(8,1066,NULL,'Vereschaka','YUrevna','alenavereshaka16@gmail.com','0993507724','Украина','ХАРЬКОВ','ЦЕЛИНОГРАДСКАЯ 40, ','64703','','Free Shipping','2019-05-10 19:30:12'),(9,2066,NULL,'Алена','Верещака','alona.vereshchaka@hneu.net','0993507724','Украина','Харьков','проспект Науки 7','61000','','Free Shipping','2019-05-10 19:30:46'),(10,2066,NULL,'Алена','Верещака','alona.vereshchaka@hneu.net','0993507724','Украина','Харьков','проспект Науки 7','61000','','Free Shipping','2019-05-10 19:32:48'),(11,2066,NULL,'Алена','Верещака','alona.vereshchaka@hneu.net','0993507724','Украина','Харьков','проспект Науки 7','61000','','Free Shipping','2019-05-10 19:34:09'),(12,2066,NULL,'Алена','Верещака','alona.vereshchaka@hneu.net','0993507724','Украина','Харьков','проспект Науки 7','61000','','Free Shipping','2019-05-10 19:39:02'),(13,1066,NULL,'Vereschaka','YUrevna','alenavereshaka16@gmail.com','0993507724','Украина','ХАРЬКОВ','ЦЕЛИНОГРАДСКАЯ 40, ','64703','','Free Shipping','2019-05-10 19:40:17'),(14,1066,NULL,'Алена','Верещака','alona.vereshchaka@hneu.net','0993507724','Украина','Харьков','проспект Науки 7','61000','','Free Shipping','2019-05-10 19:55:10'),(15,1066,NULL,'Алена','Верещака','alona.vereshchaka@hneu.net','0993507724','Украина','Харьков','проспект Науки 7','61000','','Free Shipping','2019-05-10 19:56:04'),(16,1066,NULL,'Vereschaka','YUrevna','alenavereshaka16@gmail.com','0993507724','Украина','ХАРЬКОВ','ЦЕЛИНОГРАДСКАЯ 40, ','64703','','Free Shipping','2019-05-10 19:56:34'),(17,1066,NULL,'Vereschaka','YUrevna','alenavereshaka16@gmail.com','0993507724','Украина','ХАРЬКОВ','ЦЕЛИНОГРАДСКАЯ 40, ','64703','','Free Shipping','2019-05-10 20:11:07'),(18,1066,3,'Алена','Верещака','alona.vereshchaka@hneu.net','0993507724','Украина','Харьков','проспект Науки 7','61000','','Free Shipping','2019-05-10 20:31:25');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-12 15:14:36
