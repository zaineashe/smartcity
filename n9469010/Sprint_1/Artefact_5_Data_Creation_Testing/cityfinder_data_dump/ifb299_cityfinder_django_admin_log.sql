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
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-09-21 22:54:24.688064','1','Cities object',1,'[{\"added\": {}}]',3,1),(2,'2017-09-21 22:54:30.123814','2','Cities object',1,'[{\"added\": {}}]',3,1),(3,'2017-09-21 22:54:35.747470','3','Cities object',1,'[{\"added\": {}}]',3,1),(4,'2017-09-21 22:54:43.463681','4','Cities object',1,'[{\"added\": {}}]',3,1),(5,'2017-09-21 22:56:34.835225','1','Data object',1,'[{\"added\": {}}]',2,1),(6,'2017-09-22 02:31:55.500769','1','Data object',3,'',2,1),(7,'2017-09-22 02:32:09.624709','4','Cities object',3,'',3,1),(8,'2017-09-22 02:32:09.773861','3','Cities object',3,'',3,1),(9,'2017-09-22 02:32:09.862296','2','Cities object',3,'',3,1),(10,'2017-09-22 02:32:09.917724','1','Cities object',3,'',3,1),(11,'2017-09-22 02:43:28.087926','1','Cities object',1,'[{\"added\": {}}]',3,1),(12,'2017-09-22 02:43:35.186687','2','Cities object',1,'[{\"added\": {}}]',3,1),(13,'2017-09-22 02:43:50.340329','3','Cities object',1,'[{\"added\": {}}]',3,1),(14,'2017-09-22 02:44:53.861429','4','Cities object',1,'[{\"added\": {}}]',3,1),(15,'2017-09-22 02:44:58.985796','5','Cities object',1,'[{\"added\": {}}]',3,1),(16,'2017-09-22 02:45:03.879098','6','Cities object',1,'[{\"added\": {}}]',3,1),(17,'2017-09-22 02:47:31.929063','1','Data object',1,'[{\"added\": {}}]',2,1),(18,'2017-09-22 02:49:05.813788','2','Data object',1,'[{\"added\": {}}]',2,1),(19,'2017-09-22 02:51:44.247644','3','Data object',1,'[{\"added\": {}}]',2,1),(20,'2017-09-22 02:54:25.582321','6','Data object',1,'[{\"added\": {}}]',2,1),(21,'2017-09-22 02:55:27.529572','7','Data object',1,'[{\"added\": {}}]',2,1),(22,'2017-09-22 02:56:26.533473','8','Data object',1,'[{\"added\": {}}]',2,1),(23,'2017-09-22 02:57:36.373087','9','Data object',1,'[{\"added\": {}}]',2,1),(24,'2017-09-22 02:59:55.756352','6','Data object',2,'[{\"changed\": {\"fields\": [\"dataType\"]}}]',2,1),(25,'2017-09-22 03:07:14.811864','1','Users object',1,'[{\"added\": {}}]',4,1),(26,'2017-09-22 03:08:00.654544','2','Users object',1,'[{\"added\": {}}]',4,1),(27,'2017-09-22 03:10:01.184965','3','Users object',1,'[{\"added\": {}}]',4,1),(28,'2017-09-22 03:11:02.516218','4','Users object',1,'[{\"added\": {}}]',4,1),(29,'2017-09-22 03:12:01.682504','5','Users object',1,'[{\"added\": {}}]',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-22 14:11:26
