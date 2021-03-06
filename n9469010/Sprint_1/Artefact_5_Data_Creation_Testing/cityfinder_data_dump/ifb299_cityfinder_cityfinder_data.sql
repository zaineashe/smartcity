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
-- Table structure for table `cityfinder_data`
--

DROP TABLE IF EXISTS `cityfinder_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cityfinder_data` (
  `data_id` int(11) NOT NULL,
  `dataType` varchar(200) NOT NULL,
  `industryType` varchar(200) DEFAULT NULL,
  `collegeID` int(11) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `city_id` int(11) NOT NULL,
  `latitude` int(11) DEFAULT NULL,
  `longitude` int(11) DEFAULT NULL,
  PRIMARY KEY (`data_id`),
  KEY `CityFinder_data_city_id_daa85b0b_fk_CityFinder_cities_city_id` (`city_id`),
  CONSTRAINT `CityFinder_data_city_id_daa85b0b_fk_CityFinder_cities_city_id` FOREIGN KEY (`city_id`) REFERENCES `cityfinder_cities` (`city_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cityfinder_data`
--

LOCK TABLES `cityfinder_data` WRITE;
/*!40000 ALTER TABLE `cityfinder_data` DISABLE KEYS */;
INSERT INTO `cityfinder_data` VALUES (1,'Co','-1',1,'Darwin College of Excellence','12 Johnson St, Darwin','0422 345 094','contact@dce.edu.au',1,3768455,1766455),(2,'Ho','-1',-1,'Chug N\' Squeeze motel','22 Ruthwick Ave.','4155 654 334','squeezemotel@gmail.com',1,6945830,4958305),(3,'Zo','-1',-1,'Darwin Zoo','44 Etterton Ave, Darwin','0422 535 355','contact@darwinzoo.com',1,4038843,2299483),(6,'Mu','-1',-1,'Melbourne Museum of Moden Art','13 Alexandra Rd, City Centre','0444 335 665','contactus@melbourneart.com',2,59386730,53976749),(7,'Re','-1',-1,'Old Lounge Cafe','22 example st','0549458483','contact@example.com',3,5039840,394867),(8,'Ma','-1',-1,'John Street Mall','88 John Street','0499386729','contact@customdomain.com',4,5938272,59387010),(9,'Pa','-1',-1,'Perrin Park','125 Perrin St','0499332332','example-contact@gmail.com',6,588583,3300404);
/*!40000 ALTER TABLE `cityfinder_data` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-22 14:11:27
