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
  `data_id` int(11) NOT NULL AUTO_INCREMENT,
  `dataType` varchar(200) NOT NULL,
  `industryType` varchar(200) DEFAULT NULL,
  `data_name` varchar(200) NOT NULL,
  `address_id` int(11) DEFAULT NULL,
  `phone` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `latitude` decimal(18,14) DEFAULT NULL,
  `longitude` decimal(18,14) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`data_id`),
  KEY `CityFinder_data_address_id_265aecb1` (`address_id`),
  CONSTRAINT `CityFinder_data_address_id_265aecb1_fk_CityFinde` FOREIGN KEY (`address_id`) REFERENCES `cityfinder_address` (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cityfinder_data`
--

LOCK TABLES `cityfinder_data` WRITE;
/*!40000 ALTER TABLE `cityfinder_data` DISABLE KEYS */;
INSERT INTO `cityfinder_data` VALUES (1,'In','publishing','Johns book stall',1,'0434345345','contact@johns.com',-35.24883900000000,149.13443900000000,1),(2,'Li','-1','Quiet old library',2,'0424444444','contact@library.com',-35.28179500000000,149.12786900000000,1),(3,'Co','-1','Hogwarts',3,'0422235234','hogwarts@gmail.com',-35.28272700000000,149.22020300000000,6),(4,'Ho','-1','new motel',4,'0465345345','contact@motel.com',-35.28273700000000,149.12173300000000,6),(5,'Pa','-1','new park lane',6,'0422333252','contact@parkplace.com',-35.23393900000000,149.12739300000000,6),(6,'Zo','-1','Zoo Town',5,'0422847282','zoo@contact.com',-35.28394830000000,149.11113240000000,6),(7,'Mu','-1','Museum of Scientific Discovery',5,'0423885774','contact@museum.net',-35.28002900000000,149.12928400000000,6),(8,'Ma','-1','great st mall',7,'0455949383','contact@email.com',-12.43385800000000,130.84234200000000,6),(9,'Re','-1','new eats place',12,'0422447228','john@email.email',-12.46313100000000,130.84561600000000,6),(10,'Co','-1','institute of academia',10,'0428233733','johnshouse@gmail.com',-12.46313100000000,130.84561600000000,6),(11,'Li','-1','study central shh',18,'0422858383','this@gmail.net',-37.81831000000000,144.96002500000000,5),(12,'In','Pillow Manufacturing','Franks old pillow fort',50,'0422344633','contact@pillow.com',-35.28179500000000,149.12786900000000,1),(13,'Ho','-1','botel motel',61,'0477385939','this@contact.this',-37.83033920000000,144.29292840000000,5),(14,'Pa','-1','fresh old park land',19,'0433875848','this@contact.net',-37.83039300000000,144.96456700000000,5),(15,'Zo','-1','Come have a peep at these animals',3,'0423337337','contact@zooplace.net',-12.46342340000000,130.83939390000000,6),(16,'Mu','-1','big old dinosaur bones buddy',5,'0422847376','contact@darwinzooman.net',-12.46313100000000,130.84561600000000,6),(17,'Ma','-1','shop central',46,'0433948938','contact@brisbaneshop.com',-27.43333300000000,153.03453400000000,2),(18,'Re','-1','eats here',35,'0483769372','data@entry.com',-33.83454300000000,151.20453400000000,3),(19,'Co','-1','new education suite',24,'0482937283','adelaideuni@uni.com.au',-34.94503400000000,138.61049400000000,4),(20,'Li','-1','studyzone AU',15,'0455836592','contact@place.com',-37.83939300000000,144.98765300000000,5),(21,'In','Web Service Provider','Johns old server hut',36,'0455829293','contact@serverhut.com',-33.86545600000000,151.20234300000000,3),(22,'Ho','-1','new stay hotel',13,'0427883992','john@contact.com',-12.43939300000000,130.83444200000000,6),(23,'Pa','-1','parkland playzone',42,'0482737372','contact@brisbanepark.net',-27.92929200000000,153.02234300000000,2),(24,'Zo','-1','new zoo',15,'04829392','contact@zooland.com',-37.81831000000000,144.93939300000000,5),(25,'Mu','-1','new museum of the modern arts',19,'0488372737','contact@museumart.com',-37.83030300000000,144.92343300000000,5),(26,'Re','-1','eat good',22,'0493888222','new@email.com',-34.93939300000000,138.48484200000000,4),(27,'Ma','-1','shop till you drop',45,'0423222444','this@email.email',-27.42342300000000,153.23244200000000,2),(28,'Co','-1','Sydney college of academia',28,'045634534','contact@sydneycollege.edu.au',-33.86495800000000,151.23948500000000,3),(29,'Li','-1','Sydney Library',29,'0444938504','library@sydneylibrary.net',-33.58395000000000,151.59483700000000,3),(30,'Ho','-1','Joint Back Motel',30,'0433958475','motel@gmail.com',-33.50386000000000,151.05938600000000,3),(31,'In','Tax Brokering','Sydney Brokers Assocation',30,'0430495837','contact@customdomain.com.au',-33.40592800000000,151.05948300000000,3),(32,'Zo','-1','Sydney Zoo',31,'0433049284','zoo@Sydneyzoo.com',-33.50395800000000,151.05986000000000,3),(33,'Mu','-1','Museum of the Sydney Arts',33,'0444039283','contact@sydneymuseum.net',-33.40583700000000,151.99583700000000,3),(34,'Ma','-1','Blast St Mall',34,'0495729593','mall@contact.com',-33.50968000000000,151.92847300000000,3),(36,'Re','-1','Sydneys best food joint',36,'0444093845','contact@restaurant.com',-33.04857200000000,151.93374800000000,3),(37,'Co','-1','Canberra University',47,'0466958049','canberrau@gmail.com',-35.40583900000000,149.40593800000000,1),(38,'Li','-1','ACT State Library',48,'0499483759','CanberraLibrary@contact.net',-35.50938400000000,149.11928400000000,1),(39,'In','Manufacturing','John\'s Sock factroy',49,'0444938859','contact@sockfactory.com',-35.99504800000000,149.48392000000000,1),(40,'Ho','-1','Hotel California',50,'0422839440','contact@hotelcanberra.net',-35.15039500000000,149.49382000000000,1),(41,'Zo','-1','Newpark National Reserve',51,'0412503293','contact@canberrazoo',-35.22948200000000,149.19283400000000,1),(42,'Mu','-1','Museum of Science',52,'0411928737','museum@gmail.com',-35.40493800000000,149.22029300000000,1),(43,'Ma','-1','Lunar Way Shopping Center',53,'0484930493','contact@canberramall.com',-35.48293000000000,149.09482800000000,1),(44,'Re','-1','New Eats Canberra',54,'0422930284','restaurant@gmail.com',-35.04857300000000,149.19283600000000,1),(45,'Co','-1','Queensland University of Technology',38,'04112039423','contact@qut.edu.au',-27.59408300000000,153.11928300000000,2),(46,'Li','-1','Queensland State Library',39,'0400219234','contact@library.com',-27.49382000000000,153.18234900000000,2),(47,'In','Retail','ALDI Queensland HQ',40,'0485740384','contact@aldi.com',-27.85940200000000,153.48593000000000,2),(48,'Ho','-1','Hotel Brisbane',41,'04448292','brisbanehotel@gmail.com',-27.30393900000000,153.22839200000000,2),(49,'Zo','-1','Queensland Zoo',42,'0455938204','contact@brisbanezoo.com',-27.04837100000000,153.09382900000000,2),(50,'Mu','-1','Queensland Museum of Art and Technology',43,'0465903945','contact@queenslandmuseum.net',-27.80039400000000,153.12312300000000,2),(51,'Ma','-1','Queen St Mall',45,'0411234234','contact@queenstmanagement.com',-27.68403800000000,153.60937200000000,2),(52,'Re','-1','Ginga Southbank',46,'0422345435','contact@ginga.com',-27.95840800000000,153.11234500000000,2),(53,'Co','-1','University of Adelaide',22,'0420394039','contact@ua.edu.com',-34.95873900000000,138.95847300000000,4),(54,'Li','-1','Adelaide Library',23,'0411928394','contact@library.com.au',-34.00393800000000,138.19384300000000,4),(55,'In','Mining','Adelaide Mining Co',24,'0450493849','contact@miningadelaide.com',-34.11029400000000,138.85934900000000,4),(56,'Ho','-1','Main Stay Adelaide',25,'0411235948','contact@mainstay.com.au',-34.20393800000000,138.09837400000000,4),(57,'Zo','-1','Adelaide National Reserve',26,'0469485930','contact@reserve.com.au',-34.00938300000000,138.12312300000000,4),(58,'Mu','-1','Great Museum of the National Arts',58,'0444232333','contact@adelaidemuseum.com',-34.95848300000000,138.00493800000000,4),(59,'Ma','-1','Adelaide Mall',59,'0412394493','contact@adelaidemall.com.au',-34.23232300000000,138.96840300000000,4),(60,'Re','-1','Jamie Olivers Adelaide',60,'0466059305','contact@oliveradelaide.com.au',-34.12469400000000,138.05839500000000,4);
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

-- Dump completed on 2017-10-22  0:07:07
