-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ifb299_cityfinder
-- ------------------------------------------------------
-- Server version	5.7.13-log

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
-- Table structure for table `cityfinder_address`
--

DROP TABLE IF EXISTS `cityfinder_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cityfinder_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `street_number` int(11) DEFAULT NULL,
  `street_name` varchar(200) DEFAULT NULL,
  `suburb` varchar(200) DEFAULT NULL,
  `postcode` int(11) DEFAULT NULL,
  `city` varchar(200) NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `CityFinder_address_city_id_f5475b0d_fk_CityFinder_cities_city_id` (`city`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cityfinder_address`
--

LOCK TABLES `cityfinder_address` WRITE;
/*!40000 ALTER TABLE `cityfinder_address` DISABLE KEYS */;
INSERT INTO `cityfinder_address` VALUES (1,14,'newpark','elfington',4025,'Canberra'),(2,128,'johnson rd','hampshire',2948,'Canberra'),(3,999,'example st','new suburb',2234,'Darwin'),(4,95,'Pretty Sweet Avenue','this suburb',1092,'Darwin'),(5,24,'lotte st','coolington',4352,'Darwin'),(6,24,'lotte st','coolington',4352,'Darwin'),(7,90,'barthe rd','new authorton',2023,'Darwin'),(8,22,'sartre st','exitsville',5584,'Darwin'),(9,98,'quentin ave','shedston',3934,'Darwin'),(10,11,'smith rd','kevland',9493,'Darwin'),(11,88,'huxley way','socsborough',3857,'Darwin'),(12,98,'contribution ave','Projects',1111,'Darwin'),(13,44,'roasthammond ave','newsburg',2222,'Darwin'),(14,5,'shack st','hobbiton',6543,'Melbourne'),(15,34,'shovel rd','torchton',3342,'Melbourne'),(16,87,'main st','CBD',1102,'Melbourne'),(17,6,'streets rd','headington',3333,'Melbourne'),(18,22,'glover st','Bino',8292,'Melbourne'),(19,1,'berette st','Lucestere',9656,'Melbourne'),(20,33,'walkie ave','coffton',4435,'Melbourne'),(21,90,'daylight blvd','lifesend',9493,'Melbourne'),(22,88,'place rd','thisSuburb',2343,'Adelaide'),(23,99,'main rd','City Centre',1111,'Adelaide'),(24,10,'placeland ave','downtown',1111,'Adelaide'),(25,55,'music st','punshire',3242,'Adelaide'),(26,89,'bass ave','funkton',8902,'Adelaide'),(27,66,'daft st','punkerton',6353,'Sydney'),(28,88,'oasis ave','wavesville',7876,'Sydney'),(29,99,'pitch st','city centre',3342,'Sydney'),(30,66,'driver st','new shire',3423,'Sydney'),(31,1,'fidelity ave','waveton',2232,'Sydney'),(32,22,'smoke st','grettaston',7272,'Sydney'),(33,66,'boyland ave','dwarvesvill',8722,'Sydney'),(34,74,'folly st','hairton',2222,'Sydney'),(35,49,'gotts rd','newland',2838,'Sydney'),(36,3,'barry ave','jeanston',7622,'Sydney'),(37,44,'gundren dr','phandolin',7722,'Sydney'),(38,3,'loops ave','fabuloso',7362,'Brisbane'),(39,11,'journals st','sadsville',1111,'Brisbane'),(40,43,'mcelroy drive','clintsville',8276,'Brisbane'),(41,22,'natalie drive','conterton',7722,'Brisbane'),(42,8,'matthew dr','muscletown',8768,'Brisbane'),(43,2,'woolie way','darlington',3828,'Brisbane'),(44,69,'nice st','nice',6969,'Brisbane'),(45,9,'hurley way','rockport',1111,'Brisbane'),(46,99,'sloane ave','rockport',1111,'Brisbane'),(47,9,'this rd','suburbia',3421,'Canberra'),(48,8,'place st','placeton',1232,'Canberra'),(49,7,'example drive','exampleston',9393,'Canberra'),(50,8,'new ave','cbd',2111,'Canberra'),(51,7,'jonnos place','jonniston',2222,'Canberra'),(52,6,'hildebrand way','suburbia',1111,'Canberra'),(53,5,'jesus st','goodgod',1123,'Canberra'),(54,4,'almost rd','there',2213,'Canberra'),(55,3,'nyquil ave','weirdston',3252,'Canberra'),(56,22,'main st','cbd',1111,'Canberra'),(57,63,'newton rd','isaacston',2241,'Canberra'),(58,33,'joust ave','jouston',1111,'Adelaide'),(59,22,'adelaide ave','newston',9392,'Adelaide'),(60,12,'example ave','newplace',2212,'Adelaide'),(61,66,'melbourne st','cbd',1123,'Melbourne');
/*!40000 ALTER TABLE `cityfinder_address` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-25 19:22:35
