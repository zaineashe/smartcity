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
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-10-19 17:26:16.237336','10','Data object',3,'',2,1),(2,'2017-10-19 17:26:16.352472','9','Data object',3,'',2,1),(3,'2017-10-19 17:26:16.434247','8','Data object',3,'',2,1),(4,'2017-10-19 17:26:16.518557','3','Data object',3,'',2,1),(5,'2017-10-19 17:26:16.556282','2','Data object',3,'',2,1),(6,'2017-10-19 17:26:16.589315','1','Data object',3,'',2,1),(7,'2017-10-19 18:39:46.847860','2','Address object',1,'[{\"added\": {}}]',11,1),(8,'2017-10-19 18:39:58.869994','3','Address object',1,'[{\"added\": {}}]',11,1),(9,'2017-10-19 18:40:20.777849','4','Address object',1,'[{\"added\": {}}]',11,1),(10,'2017-10-19 18:41:23.268130','5','Address object',1,'[{\"added\": {}}]',11,1),(11,'2017-10-19 18:41:23.489626','6','Address object',1,'[{\"added\": {}}]',11,1),(12,'2017-10-19 18:41:47.424486','7','Address object',1,'[{\"added\": {}}]',11,1),(13,'2017-10-19 18:42:03.066662','8','Address object',1,'[{\"added\": {}}]',11,1),(14,'2017-10-19 18:42:27.808001','9','Address object',1,'[{\"added\": {}}]',11,1),(15,'2017-10-19 18:42:50.767845','10','Address object',1,'[{\"added\": {}}]',11,1),(16,'2017-10-19 18:43:21.686393','11','Address object',1,'[{\"added\": {}}]',11,1),(17,'2017-10-19 18:43:49.535412','12','Address object',1,'[{\"added\": {}}]',11,1),(18,'2017-10-19 18:44:36.187907','13','Address object',1,'[{\"added\": {}}]',11,1),(19,'2017-10-19 18:45:18.232175','14','Address object',1,'[{\"added\": {}}]',11,1),(20,'2017-10-19 18:45:36.386914','15','Address object',1,'[{\"added\": {}}]',11,1),(21,'2017-10-19 18:45:53.323963','16','Address object',1,'[{\"added\": {}}]',11,1),(22,'2017-10-19 18:46:36.209243','17','Address object',1,'[{\"added\": {}}]',11,1),(23,'2017-10-19 18:46:55.773666','18','Address object',1,'[{\"added\": {}}]',11,1),(24,'2017-10-19 18:47:33.123923','19','Address object',1,'[{\"added\": {}}]',11,1),(25,'2017-10-19 18:47:56.387769','20','Address object',1,'[{\"added\": {}}]',11,1),(26,'2017-10-19 18:48:30.158147','21','Address object',1,'[{\"added\": {}}]',11,1),(27,'2017-10-19 18:48:54.688950','22','Address object',1,'[{\"added\": {}}]',11,1),(28,'2017-10-19 18:49:21.943188','23','Address object',1,'[{\"added\": {}}]',11,1),(29,'2017-10-19 18:51:51.044023','24','Address object',1,'[{\"added\": {}}]',11,1),(30,'2017-10-19 18:52:38.534208','25','Address object',1,'[{\"added\": {}}]',11,1),(31,'2017-10-19 18:52:54.630251','26','Address object',1,'[{\"added\": {}}]',11,1),(32,'2017-10-19 18:54:51.794405','27','Address object',1,'[{\"added\": {}}]',11,1),(33,'2017-10-19 18:55:15.661262','28','Address object',1,'[{\"added\": {}}]',11,1),(34,'2017-10-19 18:55:38.066888','29','Address object',1,'[{\"added\": {}}]',11,1),(35,'2017-10-19 18:55:56.299712','30','Address object',1,'[{\"added\": {}}]',11,1),(36,'2017-10-19 18:56:13.801315','31','Address object',1,'[{\"added\": {}}]',11,1),(37,'2017-10-19 18:56:38.974422','32','Address object',1,'[{\"added\": {}}]',11,1),(38,'2017-10-19 18:57:03.129028','33','Address object',1,'[{\"added\": {}}]',11,1),(39,'2017-10-19 18:58:19.411734','34','Address object',1,'[{\"added\": {}}]',11,1),(40,'2017-10-19 18:58:42.765165','35','Address object',1,'[{\"added\": {}}]',11,1),(41,'2017-10-19 18:58:57.262945','36','Address object',1,'[{\"added\": {}}]',11,1),(42,'2017-10-19 18:59:15.189483','37','Address object',1,'[{\"added\": {}}]',11,1),(43,'2017-10-19 18:59:34.540002','38','Address object',1,'[{\"added\": {}}]',11,1),(44,'2017-10-19 18:59:58.334728','39','Address object',1,'[{\"added\": {}}]',11,1),(45,'2017-10-19 19:00:12.561983','40','Address object',1,'[{\"added\": {}}]',11,1),(46,'2017-10-19 19:00:37.727796','41','Address object',1,'[{\"added\": {}}]',11,1),(47,'2017-10-19 19:00:59.380662','42','Address object',1,'[{\"added\": {}}]',11,1),(48,'2017-10-19 19:01:16.025145','43','Address object',1,'[{\"added\": {}}]',11,1),(49,'2017-10-19 19:01:33.941154','44','Address object',1,'[{\"added\": {}}]',11,1),(50,'2017-10-19 19:02:04.903926','45','Address object',1,'[{\"added\": {}}]',11,1),(51,'2017-10-19 19:02:24.142971','46','Address object',1,'[{\"added\": {}}]',11,1),(52,'2017-10-19 19:02:54.337531','47','Address object',1,'[{\"added\": {}}]',11,1),(53,'2017-10-19 19:03:05.955538','48','Address object',1,'[{\"added\": {}}]',11,1),(54,'2017-10-19 19:03:22.770844','49','Address object',1,'[{\"added\": {}}]',11,1),(55,'2017-10-19 19:03:35.599972','50','Address object',1,'[{\"added\": {}}]',11,1),(56,'2017-10-19 19:03:52.664865','51','Address object',1,'[{\"added\": {}}]',11,1),(57,'2017-10-19 19:04:14.683931','52','Address object',1,'[{\"added\": {}}]',11,1),(58,'2017-10-19 19:04:28.538159','53','Address object',1,'[{\"added\": {}}]',11,1),(59,'2017-10-19 19:04:44.999422','54','Address object',1,'[{\"added\": {}}]',11,1),(60,'2017-10-19 19:05:15.004087','55','Address object',1,'[{\"added\": {}}]',11,1),(61,'2017-10-19 19:05:35.847181','56','Address object',1,'[{\"added\": {}}]',11,1),(62,'2017-10-19 19:05:51.570919','57','Address object',1,'[{\"added\": {}}]',11,1),(63,'2017-10-19 19:07:12.356560','58','Address object',1,'[{\"added\": {}}]',11,1),(64,'2017-10-19 19:07:41.300506','59','Address object',1,'[{\"added\": {}}]',11,1),(65,'2017-10-19 19:08:05.827438','60','Address object',1,'[{\"added\": {}}]',11,1),(66,'2017-10-19 19:09:06.567263','61','Address object',1,'[{\"added\": {}}]',11,1),(67,'2017-10-19 19:09:37.647964','6','Cities object',2,'[{\"changed\": {\"fields\": [\"latitude\", \"longitude\"]}}]',1,1),(68,'2017-10-19 19:09:53.008593','5','Cities object',2,'[{\"changed\": {\"fields\": [\"latitude\", \"longitude\"]}}]',1,1),(69,'2017-10-19 19:10:05.595049','4','Cities object',2,'[{\"changed\": {\"fields\": [\"latitude\", \"longitude\"]}}]',1,1),(70,'2017-10-19 19:10:18.537850','3','Cities object',2,'[{\"changed\": {\"fields\": [\"latitude\", \"longitude\"]}}]',1,1),(71,'2017-10-19 19:10:34.129238','2','Cities object',2,'[{\"changed\": {\"fields\": [\"latitude\", \"longitude\"]}}]',1,1),(72,'2017-10-19 19:10:52.908401','1','Cities object',2,'[{\"changed\": {\"fields\": [\"latitude\", \"longitude\"]}}]',1,1),(73,'2017-10-19 19:15:48.888540','1','Data object',1,'[{\"added\": {}}]',2,1),(74,'2017-10-19 19:16:47.221231','2','Data object',1,'[{\"added\": {}}]',2,1),(75,'2017-10-19 19:17:58.888198','3','Data object',1,'[{\"added\": {}}]',2,1),(76,'2017-10-19 19:18:45.337773','4','Data object',1,'[{\"added\": {}}]',2,1),(77,'2017-10-19 19:19:28.643799','5','Data object',1,'[{\"added\": {}}]',2,1),(78,'2017-10-19 19:20:14.196625','6','Data object',1,'[{\"added\": {}}]',2,1),(79,'2017-10-19 19:21:10.454206','7','Data object',1,'[{\"added\": {}}]',2,1),(80,'2017-10-19 19:21:39.458881','7','Address object',2,'[]',11,1),(81,'2017-10-19 19:22:21.678551','8','Data object',1,'[{\"added\": {}}]',2,1),(82,'2017-10-19 19:23:08.706028','9','Data object',1,'[{\"added\": {}}]',2,1),(83,'2017-10-19 19:25:41.524717','10','Data object',1,'[{\"added\": {}}]',2,1),(84,'2017-10-19 19:26:06.799713','18','Address object',2,'[]',11,1),(85,'2017-10-19 19:26:26.947267','11','Data object',1,'[{\"added\": {}}]',2,1),(86,'2017-10-19 19:27:17.848823','12','Data object',1,'[{\"added\": {}}]',2,1),(87,'2017-10-19 19:28:20.706752','13','Data object',1,'[{\"added\": {}}]',2,1),(88,'2017-10-19 19:29:37.322032','14','Data object',1,'[{\"added\": {}}]',2,1),(89,'2017-10-19 19:30:48.338915','15','Data object',1,'[{\"added\": {}}]',2,1),(90,'2017-10-19 19:31:38.718816','16','Data object',1,'[{\"added\": {}}]',2,1),(91,'2017-10-19 19:33:08.536972','17','Data object',1,'[{\"added\": {}}]',2,1),(92,'2017-10-19 19:34:41.136009','18','Data object',1,'[{\"added\": {}}]',2,1),(93,'2017-10-19 19:35:48.155212','19','Data object',1,'[{\"added\": {}}]',2,1),(94,'2017-10-19 19:36:47.556410','20','Data object',1,'[{\"added\": {}}]',2,1),(95,'2017-10-19 19:37:56.267590','21','Data object',1,'[{\"added\": {}}]',2,1),(96,'2017-10-19 19:38:45.794816','22','Data object',1,'[{\"added\": {}}]',2,1),(97,'2017-10-19 19:39:37.834720','23','Data object',1,'[{\"added\": {}}]',2,1),(98,'2017-10-19 19:40:20.976961','24','Data object',1,'[{\"added\": {}}]',2,1),(99,'2017-10-19 19:41:18.246457','25','Data object',1,'[{\"added\": {}}]',2,1),(100,'2017-10-19 19:42:17.859094','26','Data object',1,'[{\"added\": {}}]',2,1),(101,'2017-10-19 19:54:08.967165','27','Data object',1,'[{\"added\": {}}]',2,1),(102,'2017-10-21 13:48:53.513494','56','Data object',2,'[]',2,1),(103,'2017-10-21 13:48:58.014923','60','Data object',2,'[]',2,1),(104,'2017-10-21 13:49:01.605337','59','Data object',2,'[]',2,1),(105,'2017-10-21 13:49:04.999061','58','Data object',2,'[]',2,1),(106,'2017-10-21 13:49:09.015838','57','Data object',2,'[]',2,1),(107,'2017-10-21 13:49:12.949958','56','Data object',2,'[]',2,1),(108,'2017-10-21 13:49:15.946073','56','Data object',2,'[]',2,1),(109,'2017-10-21 13:50:13.393272','1','Data object',2,'[]',2,1),(110,'2017-10-21 13:50:17.861382','2','Data object',2,'[]',2,1),(111,'2017-10-21 13:50:20.243281','3','Data object',2,'[]',2,1),(112,'2017-10-21 13:50:22.096943','4','Data object',2,'[]',2,1),(113,'2017-10-21 13:50:23.958739','5','Data object',2,'[]',2,1),(114,'2017-10-21 13:50:25.936406','6','Data object',2,'[]',2,1),(115,'2017-10-21 13:50:27.881011','7','Data object',2,'[]',2,1),(116,'2017-10-21 13:50:29.846115','8','Data object',2,'[]',2,1),(117,'2017-10-21 13:50:31.661503','9','Data object',2,'[]',2,1),(118,'2017-10-21 13:50:33.021363','10','Data object',2,'[]',2,1),(119,'2017-10-21 13:50:34.807811','11','Data object',2,'[]',2,1),(120,'2017-10-21 13:50:36.559831','12','Data object',2,'[]',2,1),(121,'2017-10-21 13:50:38.238661','13','Data object',2,'[]',2,1),(122,'2017-10-21 13:50:39.958021','14','Data object',2,'[]',2,1),(123,'2017-10-21 13:50:41.833276','15','Data object',2,'[]',2,1),(124,'2017-10-21 13:50:43.687583','16','Data object',2,'[]',2,1),(125,'2017-10-21 13:50:45.559303','17','Data object',2,'[]',2,1),(126,'2017-10-21 13:50:47.640169','18','Data object',2,'[]',2,1),(127,'2017-10-21 13:50:49.631993','19','Data object',2,'[]',2,1),(128,'2017-10-21 13:50:51.334170','20','Data object',2,'[]',2,1),(129,'2017-10-21 13:50:53.864151','21','Data object',2,'[]',2,1),(130,'2017-10-21 13:50:55.867093','22','Data object',2,'[]',2,1),(131,'2017-10-21 13:50:57.984319','23','Data object',2,'[]',2,1),(132,'2017-10-21 13:50:59.724783','24','Data object',2,'[]',2,1),(133,'2017-10-21 13:51:01.446060','25','Data object',2,'[]',2,1),(134,'2017-10-21 13:51:04.261478','26','Data object',2,'[]',2,1),(135,'2017-10-21 13:51:06.264088','27','Data object',2,'[]',2,1),(136,'2017-10-21 13:51:08.067886','28','Data object',2,'[]',2,1),(137,'2017-10-21 13:51:10.273695','29','Data object',2,'[]',2,1),(138,'2017-10-21 13:51:11.958270','30','Data object',2,'[]',2,1),(139,'2017-10-21 13:51:17.569458','31','Data object',2,'[]',2,1),(140,'2017-10-21 13:51:19.702079','32','Data object',2,'[]',2,1),(141,'2017-10-21 13:51:21.763170','33','Data object',2,'[]',2,1),(142,'2017-10-21 13:51:23.816216','34','Data object',2,'[]',2,1),(143,'2017-10-21 13:51:25.978156','36','Data object',2,'[]',2,1),(144,'2017-10-21 13:51:27.779413','37','Data object',2,'[]',2,1),(145,'2017-10-21 13:51:29.794629','38','Data object',2,'[]',2,1),(146,'2017-10-21 13:51:53.254070','39','Data object',2,'[]',2,1),(147,'2017-10-21 13:51:55.353599','40','Data object',2,'[]',2,1),(148,'2017-10-21 13:51:56.927377','41','Data object',2,'[]',2,1),(149,'2017-10-21 13:51:58.457047','42','Data object',2,'[]',2,1),(150,'2017-10-21 13:51:59.984793','43','Data object',2,'[]',2,1),(151,'2017-10-21 13:52:01.597873','44','Data object',2,'[]',2,1),(152,'2017-10-21 13:52:03.358689','45','Data object',2,'[]',2,1),(153,'2017-10-21 13:52:04.992785','46','Data object',2,'[]',2,1),(154,'2017-10-21 13:52:07.106437','47','Data object',2,'[]',2,1),(155,'2017-10-21 13:52:08.773543','48','Data object',2,'[]',2,1),(156,'2017-10-21 13:52:10.363821','49','Data object',2,'[]',2,1),(157,'2017-10-21 13:52:11.934976','50','Data object',2,'[]',2,1),(158,'2017-10-21 13:52:13.479865','51','Data object',2,'[]',2,1),(159,'2017-10-21 13:52:15.022096','52','Data object',2,'[]',2,1),(160,'2017-10-21 13:52:16.697743','53','Data object',2,'[]',2,1),(161,'2017-10-21 13:52:18.371553','54','Data object',2,'[]',2,1),(162,'2017-10-21 13:52:20.046170','55','Data object',2,'[]',2,1),(163,'2017-10-21 13:52:22.107036','56','Data object',2,'[]',2,1),(164,'2017-10-21 13:52:23.895000','57','Data object',2,'[]',2,1),(165,'2017-10-21 13:52:25.542438','58','Data object',2,'[]',2,1),(166,'2017-10-21 13:52:27.271054','59','Data object',2,'[]',2,1),(167,'2017-10-21 13:52:28.900944','60','Data object',2,'[]',2,1);
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

-- Dump completed on 2017-10-22  0:07:06