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
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'CityFinder','0001_initial','2017-09-21 22:46:56.739351'),(2,'CityFinder','0002_auto_20170906_1515','2017-09-21 22:46:57.894683'),(3,'CityFinder','0003_auto_20170906_1525','2017-09-21 22:46:59.519218'),(4,'CityFinder','0004_auto_20170906_1533','2017-09-21 22:46:59.838468'),(5,'CityFinder','0005_auto_20170906_2321','2017-09-21 22:47:00.798857'),(6,'CityFinder','0006_cities_data','2017-09-21 22:47:02.005672'),(7,'CityFinder','0007_auto_20170906_2326','2017-09-21 22:47:02.139512'),(8,'CityFinder','0008_auto_20170906_2331','2017-09-21 22:47:03.921797'),(9,'CityFinder','0009_auto_20170906_2333','2017-09-21 22:47:06.655222'),(10,'CityFinder','0010_cities_data_departments_users','2017-09-21 22:47:09.057459'),(11,'CityFinder','0011_auto_20170920_1038','2017-09-21 22:47:10.332722'),(12,'CityFinder','0012_auto_20170920_1121','2017-09-21 22:47:11.418880'),(13,'CityFinder','0013_auto_20170920_2109','2017-09-21 22:47:13.374650'),(14,'CityFinder','0014_auto_20170920_2116','2017-09-21 22:47:14.537872'),(15,'contenttypes','0001_initial','2017-09-21 22:47:15.502610'),(16,'auth','0001_initial','2017-09-21 22:47:28.356321'),(17,'admin','0001_initial','2017-09-21 22:47:30.182311'),(18,'admin','0002_logentry_remove_auto_add','2017-09-21 22:47:30.450436'),(19,'contenttypes','0002_remove_content_type_name','2017-09-21 22:47:31.812452'),(20,'auth','0002_alter_permission_name_max_length','2017-09-21 22:47:33.150428'),(21,'auth','0003_alter_user_email_max_length','2017-09-21 22:47:33.969586'),(22,'auth','0004_alter_user_username_opts','2017-09-21 22:47:34.018110'),(23,'auth','0005_alter_user_last_login_null','2017-09-21 22:47:34.797405'),(24,'auth','0006_require_contenttypes_0002','2017-09-21 22:47:34.933605'),(25,'auth','0007_alter_validators_add_error_messages','2017-09-21 22:47:35.004112'),(26,'auth','0008_alter_user_username_max_length','2017-09-21 22:47:35.892070'),(27,'sessions','0001_initial','2017-09-21 22:47:36.779871'),(28,'CityFinder','0015_auto_20171009_1211','2017-10-09 12:16:24.718180'),(29,'CityFinder','0016_auto_20171009_1216','2017-10-09 12:16:27.986012'),(30,'CityFinder','0017_auto_20171009_1219','2017-10-09 12:20:19.989610'),(31,'CityFinder','0018_auto_20171009_1220','2017-10-09 12:20:21.931062'),(32,'CityFinder','0019_auto_20171015_1454','2017-10-19 03:40:55.951018'),(33,'CityFinder','0020_auto_20171015_1456','2017-10-19 03:40:56.801427'),(34,'CityFinder','0021_users_salt','2017-10-19 03:40:57.479550'),(35,'CityFinder','0022_auto_20171015_2013','2017-10-19 03:40:57.619831'),(36,'CityFinder','0023_auto_20171015_2034','2017-10-19 03:40:58.296428'),(37,'CityFinder','0024_auto_20171015_2143','2017-10-19 03:40:58.666706'),(38,'CityFinder','0025_auto_20171018_1715','2017-10-19 03:40:58.870892'),(40,'CityFinder','0026_auto_20171019_1409','2017-10-19 17:11:05.450020'),(41,'CityFinder','0027_address','2017-10-19 17:11:50.137120'),(42,'CityFinder','0028_auto_20171019_1722','2017-10-19 17:23:02.691876'),(43,'CityFinder','0029_auto_20171019_1727','2017-10-19 17:27:57.208777'),(44,'CityFinder','0030_auto_20171019_1728','2017-10-19 17:28:20.401468'),(45,'CityFinder','0031_auto_20171019_1912','2017-10-19 19:12:19.962678'),(46,'CityFinder','0032_auto_20171019_2147','2017-10-19 21:47:24.415851'),(47,'CityFinder','0002_data_city_id','2017-10-21 13:18:52.512497'),(48,'CityFinder','0003_auto_20171021_1324','2017-10-21 13:24:15.089669'),(49,'CityFinder','0004_auto_20171021_1328','2017-10-21 13:28:25.901086'),(50,'CityFinder','0005_auto_20171021_1329','2017-10-21 13:29:26.797027'),(51,'CityFinder','0006_auto_20171021_1354','2017-10-21 13:54:42.184473'),(52,'CityFinder','0007_auto_20171021_1355','2017-10-21 13:55:54.714214');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
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
