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
-- Table structure for table `cityfinder_departments`
--

DROP TABLE IF EXISTS `cityfinder_departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cityfinder_departments` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(200) NOT NULL,
  `college_id` int(11) NOT NULL,
  PRIMARY KEY (`department_id`),
  KEY `CityFinder_departments_college_id_4e0f6b58_fk` (`college_id`),
  CONSTRAINT `CityFinder_departments_college_id_4e0f6b58_fk` FOREIGN KEY (`college_id`) REFERENCES `cityfinder_data` (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cityfinder_departments`
--

LOCK TABLES `cityfinder_departments` WRITE;
/*!40000 ALTER TABLE `cityfinder_departments` DISABLE KEYS */;
INSERT INTO `cityfinder_departments` VALUES (1,'Hufflepuff',3),(2,'Slytherin',3),(3,'Ravenclaw',3),(4,'Gryffindor',3),(5,'Department of Academia',10),(6,'Department of Philosophy',10),(7,'Department of Education',10),(8,'Department of The Arts',10),(9,'Department of Science and Engineering',10),(10,'SEF',19),(11,'Creative Industries',19),(12,'Law',19),(13,'Health and Nursing',19),(14,'Education',19),(15,'Law Faculty',28),(16,'Science and Engineering Faculty',28),(17,'Creative Industries Faculty',28),(18,'Information Technology Faculty',28),(19,'Films and Entertainment',37),(20,'Visual Arts',37),(21,'Chemistry',37),(22,'Biology',37),(23,'Physics',37),(24,'Information Technology',37),(25,'Mathematics',37),(26,'Humanities',37),(27,'Education',37),(28,'Health',37),(29,'SEF',45),(30,'Law',45),(31,'Health',45),(32,'Education',45),(33,'Creative Industries',45),(34,'Arts',53),(35,'Philosophy',53),(36,'Engineering',53),(37,'Sciences',53),(38,'Information Technolog',53);
/*!40000 ALTER TABLE `cityfinder_departments` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-22  0:07:08
