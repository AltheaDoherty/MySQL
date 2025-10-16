CREATE DATABASE  IF NOT EXISTS `final exam` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `final exam`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: final exam
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities` (
  `activityID` int NOT NULL AUTO_INCREMENT,
  `activityName` varchar(25) NOT NULL,
  `description` text NOT NULL,
  `Instructors_instructorsID` int NOT NULL,
  PRIMARY KEY (`activityID`),
  KEY `fk_Activities_Instructors1_idx` (`Instructors_instructorsID`),
  CONSTRAINT `fk_Activities_Instructors1` FOREIGN KEY (`Instructors_instructorsID`) REFERENCES `instructors` (`instructorsID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (13,'Advanced Golf Lessons','An advanced golf class specialized to elevate your game to the next level.',4),(14,'Tennis','Professional-grade tennis courts for singles and doubles matches.',1),(15,'Swimming','Indoor and outdoor pools for recreational and competitive swimming.',6),(16,'Yoga','Weekly yoga classes for relaxation and fitness, catering to all skill levels.',7),(17,'Fitness Classes','Group fitness sessions including aerobics, Pilates, and spin classes.',9),(18,'Personal Training','One-on-one training sessions with certified fitness instructors.',10),(19,'Dance Classes','Ballroom and modern dance lessons for all ages and skill levels.',3),(20,'Art Workshops','Painting, pottery, and other creative workshops led by local artists.',2),(21,'Pickleball','Access to pickleball courts with tournaments for members.',5),(22,'Junior Golf','Monthly Tournaments for junior golfers.',4),(23,'Running Club','Group runs along scenic routes with various distance options.',9),(24,'Intermediate Golf Lessons','Training sessions for intermediate players looking to improve.',4),(25,'Social Events','Birthday parties, receptions, and other events hosted on country club property.',8);
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employeeID` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `phoneNumber` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `jobTitle` varchar(35) NOT NULL,
  `department` varchar(20) NOT NULL,
  `annualSalary` int NOT NULL,
  `dateOfBirth` date NOT NULL,
  `address1` varchar(45) NOT NULL,
  `address2` varchar(45) DEFAULT NULL,
  `city` varchar(20) NOT NULL,
  `state` char(2) NOT NULL,
  `zipCode` varchar(10) NOT NULL,
  `JobRequirements_jobRequiremnetsID` int DEFAULT NULL,
  `Instructors_instructorsID` int DEFAULT NULL,
  PRIMARY KEY (`employeeID`),
  KEY `fk_Employees_JobRequirements1_idx` (`JobRequirements_jobRequiremnetsID`),
  KEY `fk_Employees_Instructors1_idx` (`Instructors_instructorsID`),
  CONSTRAINT `fk_Employees_Instructors1` FOREIGN KEY (`Instructors_instructorsID`) REFERENCES `instructors` (`instructorsID`),
  CONSTRAINT `fk_Employees_JobRequirements1` FOREIGN KEY (`JobRequirements_jobRequiremnetsID`) REFERENCES `jobrequirements` (`jobRequiremnetsID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Michael','Green','5081234567','michael.green@club.com','General Manager','Administration',85000,'1980-04-12','123 Maple Street','Apt 4B','Springfield','MA','001103',NULL,NULL),(2,'Jessica','Adams','4012345678','jessica.adams@club.com','Head Chef','Administration',70000,'1992-03-05','456 Oak Avenue','Suite 300','Providence','RI','002903',NULL,NULL),(3,'Kevin','Taylor','5083456789','kevin.taylor@club.com','Sports Manager','Administration',55000,'1985-07-21','789 Pine Lane','','Worcester','MA','001610',NULL,NULL),(4,'Linda','Martinez','4014567890','linda.martinez@club.com','Event Manager','Administration',48000,'1990-11-30','321 Elm Drive','','Cranston','RI','002910',NULL,NULL),(5,'Chris','Harris','5085678901','chris.harris@club.com','Maintenance Manager','Administration',60000,'1982-02-18','654 Cedar Boulevard','Unit 12A','Boston','MA','002118',NULL,NULL),(6,'Rachel','Green','5086789012','rachel.green@club.com','Janitor','Facilities',11000,'1993-01-22','890 Birch Lane','','Cambridge','MA','002139',NULL,NULL),(7,'Jennifer','Taylor','4017890123','jennifer.taylor@club.com','IT Technician','IT',45000,'1995-05-03','123 Cherry Lane','','Pawtucket','RI','002860',NULL,NULL),(8,'Mark','Anderson','5088901234','mark.anderson@club.com','Golf Overseer','Administration',52000,'1987-10-14','567 Maple Lane','','New Bedford','MA','002740',NULL,NULL),(9,'Olivia','Martinez','4018902345','olivia.martinez@club.com','Receptionist','Administration',40000,'1998-09-30','135 Oak Street','Apt 2B','Providence','RI','002908',NULL,NULL),(10,'James','Parker','5082345678','james.parker@club.com','Pool Attendant','Facilities',12000,'1989-12-05','202 Birch Road','','Lowell','MA','001852',NULL,NULL),(11,'Sophia','Brown','4011234567','sophia.brown@club.com','Membership Manager','Administration',60000,'1990-06-18','400 Elm Street','','Warwick','RI','002886',NULL,NULL),(12,'Daniel','Wilson','5082346789','daniel.wilson@club.com','IT Specialist','IT',72000,'1983-11-08','220 Maple Drive','Apt 5C','Attleboro','MA','002703',NULL,NULL),(13,'Anna','White','4015678901','anna.white@club.com','IT Technician','IT',42000,'1986-01-15','345 River Road','','East Providence','RI','002914',NULL,NULL),(14,'Emily','Davis','5086781234','emily.davis@club.com','IT Technician','IT',42000,'1997-03-27','789 Main Street','','Framingham','MA','001701',NULL,NULL),(15,'Rachel','Adams','4014256789','rachel.adams@club.com','IT Technician','IT',42000,'1992-07-30','678 Birch Road','','Cumberland','RI','002864',NULL,NULL);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facilities`
--

DROP TABLE IF EXISTS `facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facilities` (
  `facilityID` int NOT NULL AUTO_INCREMENT,
  `facilityName` varchar(20) NOT NULL,
  `availibility` text NOT NULL,
  `Activities_activityID` int NOT NULL,
  PRIMARY KEY (`facilityID`),
  KEY `fk_Facilities_Activities1_idx` (`Activities_activityID`),
  CONSTRAINT `Activities_activityID` FOREIGN KEY (`Activities_activityID`) REFERENCES `activities` (`activityID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facilities`
--

LOCK TABLES `facilities` WRITE;
/*!40000 ALTER TABLE `facilities` DISABLE KEYS */;
INSERT INTO `facilities` VALUES (1,'Tennis Courts','Open daily from 7:00 AM to 7:00 PM, weather permitting.',14),(2,'Golf Courts','Open daily from 6:00 AM to 10:00 PM; reservation required for peak hours.',13),(3,'Fitness Center','Open 24/7 with member access cards.',17),(4,'Swimming Pool','Open daily from 8:00 AM to 8:00 PM; closed during maintenance hours every Monday morning.',15),(5,'Yoga Studio','Open during scheduled class hours; check weekly schedule.',16),(6,'Event Hall','Available for private events; reservations required at least two weeks in advance.',25),(7,'Pickleball Courts','Open daily from 6:00 AM to 9:00 PM; reservations recommended during peak hours.',21),(8,'Outdoor Patio','Open during suitable weather. Available for rent for social events.',25),(9,'Art Workshop Room','Open during scheduled workshop hours or by prior booking.',20),(10,'Running Trail','Open daily from dawn to dusk; weather-dependent.',23),(11,'Poolside Cabana','Available for rent during pool hours; reservations required.',25);
/*!40000 ALTER TABLE `facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructors`
--

DROP TABLE IF EXISTS `instructors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructors` (
  `instructorsID` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `phoneNumber` char(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `joinDate` date NOT NULL,
  `address1` varchar(45) NOT NULL,
  `address2` varchar(45) DEFAULT NULL,
  `city` varchar(20) NOT NULL,
  `zip` varchar(6) NOT NULL,
  `state` char(2) NOT NULL,
  PRIMARY KEY (`instructorsID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructors`
--

LOCK TABLES `instructors` WRITE;
/*!40000 ALTER TABLE `instructors` DISABLE KEYS */;
INSERT INTO `instructors` VALUES (1,'John','Smith','4015810583','jsmith@yahoo.com','2020-06-01','123 Tennis Court Ave','Apt 2B','Forestdale','002909','RI'),(2,'Sarah','Johnson','4018991523','sjohnson@gmail.com','2021-02-11','100 Golf Course Rd','','Forestdale','002909','RI'),(3,'Emily','Brown','5087321956','emilybrown@gmail.com','2021-03-07','45 Yoga St','Apt 3C','Lentenville','002118','MA'),(4,'James','Williams','4014228773','jwilliams@gmail.com','2019-04-15','88 Poolside Ave','','Exeter','002903','RI'),(5,'Olivia','Davis','5088321647','odavis@gmail.com','2022-07-20','32 Fitness Blvd','Apt 4A','Brockton','002127','MA'),(6,'Thomas','Harris','3393244567','tharris@gmail.com','2020-01-05','150 Golf Drive','Suite 2','Lynn','002143','MA'),(7,'Billy','Williams','4018915632','bwilliams@clubmail.com','2020-01-18','10 Harlington Drive','','Wakefield','009019','RI'),(8,'Ava','Green','4015007689','avagreen@clubmail.com','2021-11-08','99 Strength Lane','Apt 5D','Forestdale','002909','RI'),(9,'Lucas','Turner','4019815264','lucas.turner@club.com','2021-08-18','15 Aqua Circle','','Forestdale','002909','RI'),(10,'Grace','Stevens','5086729153','graces@foodandfitness.com','2020-05-10','220 Wellness Way','','Taunton','002108','MA');
/*!40000 ALTER TABLE `instructors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobrequirements`
--

DROP TABLE IF EXISTS `jobrequirements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobrequirements` (
  `jobRequiremnetsID` int NOT NULL AUTO_INCREMENT,
  `jobRequiremnetsName` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `Instructors_instructorsID` int DEFAULT NULL,
  PRIMARY KEY (`jobRequiremnetsID`),
  KEY `fk_JobRequirements_Instructors1_idx` (`Instructors_instructorsID`),
  CONSTRAINT `fk_JobRequirements_Instructors1` FOREIGN KEY (`Instructors_instructorsID`) REFERENCES `instructors` (`instructorsID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobrequirements`
--

LOCK TABLES `jobrequirements` WRITE;
/*!40000 ALTER TABLE `jobrequirements` DISABLE KEYS */;
INSERT INTO `jobrequirements` VALUES (1,'Tennis Coach','Must have certification from a recognized tennis association. Ability to teach individual and group lessons. Strong interpersonal and communication skills.',1),(2,'Fitness Instructor','Requires a certification in personal training or group fitness instruction. Must have knowledge of various fitness equipment and exercises.',9),(3,'Yoga Manager','Must have experience in leading Yoga exercises. Must have knowledge of relaxation tactics and perform well in leading a group of others.',7),(4,'Golf Pro','Must be a certified PGA instructor. Requires experience in golf coaching, including individual lessons and group clinics. Strong communication skills required.',4),(5,'Pickleball Instructor','Must have experience in the sport of pickleball. Preferably played competitively and is willing to teach lessons to others.',5),(6,'Art Instructor','Must be talented artistically with the ability to lead classes in which others can easily follow to produce artwork.',2),(7,'Personal Trainer','Must have the ability to effectively train one-on-one. Must be a good supporter and be able to connect with clients.',10),(8,'Dance Instructors','Responsible for holding ballroom dance classes to any and all members. Requires the ability to dance themselves.',3),(9,'Event Coordinator','Must have experience in event planning, from initial consultation to event execution. Strong organizational skills and the ability to manage multiple events at once.',8),(10,'Swim Instructor','Requires certification in pool operations and safety procedures. Must be able to effectively teach people of all ages how to swim.',6);
/*!40000 ALTER TABLE `jobrequirements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `memberlessons`
--

DROP TABLE IF EXISTS `memberlessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `memberlessons` (
  `Members_membershipID` int NOT NULL,
  `Lessons_lessonID` int NOT NULL,
  PRIMARY KEY (`Members_membershipID`,`Lessons_lessonID`),
  KEY `fk_Members_has_Lessons_Lessons1_idx` (`Lessons_lessonID`),
  KEY `fk_Members_has_Lessons_Members1_idx` (`Members_membershipID`),
  CONSTRAINT `fk_Members_has_Lessons_Lessons1` FOREIGN KEY (`Lessons_lessonID`) REFERENCES `privatelessons` (`privateLessonID`),
  CONSTRAINT `fk_Members_has_Lessons_Members1` FOREIGN KEY (`Members_membershipID`) REFERENCES `members` (`membershipID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `memberlessons`
--

LOCK TABLES `memberlessons` WRITE;
/*!40000 ALTER TABLE `memberlessons` DISABLE KEYS */;
INSERT INTO `memberlessons` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30);
/*!40000 ALTER TABLE `memberlessons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `membershipID` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `phoneNumber` varchar(10) NOT NULL,
  `email` varchar(30) NOT NULL,
  `joinDate` date NOT NULL,
  `address1` varchar(45) NOT NULL,
  `address2` varchar(45) DEFAULT NULL,
  `city` varchar(20) NOT NULL,
  `zipCode` varchar(10) NOT NULL,
  `state` char(2) NOT NULL,
  `notes` text NOT NULL,
  `MembershipTypes_membershipTypesID` int NOT NULL,
  PRIMARY KEY (`membershipID`),
  KEY `fk_Members_MembershipTypes_idx` (`MembershipTypes_membershipTypesID`),
  CONSTRAINT `fk_Members_MembershipTypes` FOREIGN KEY (`MembershipTypes_membershipTypesID`) REFERENCES `membershiptypes` (`membershipTypesID`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'John','Smith','4015810583','jsmith@yahoo.com','2018-12-05','5 Cozy Lane','','Providence','002921','RI','',1),(2,'Camilla ','Zavala','4019991023','czavala@gmail.com','2018-12-19','1 Frenzy Farm Road','','Providence','002921','RI','',4),(3,'Ross','Gittell','4014215627','rgittell@yahoo.com','2017-12-03','3 Corridor Road','','Warren','008591','RI','',5),(4,'Ophelia ','Flores','4018979019','oflores@gmail.com','2017-04-15','19 Atwells Avenue','','Bristol','008901','RI','Needs orientation on club facilities.',1),(5,'Salvador ','Witt','4017432819','salwitt@gmail.com','2017-06-04','10 Sleep Street','','Warren','008591','RI','',4),(6,'Phoebe','Vaughan','4018957390','pvaughan@yahoo.com','2018-09-10','2 Doubt Road','','Warren','008591','RI','Inquired about fitness trainer availability',3),(7,'Armani','Hutchinson','4014218908','ahutchinson6@gmail.com','2017-12-01','22 Tilt Street','','Providence','002921','RI','',2),(8,'Dakota','Marlow','4011238901','dmarlow@gmail.com','2018-12-09','55 Elm Avenue','','Warren','008591','RI','Interested in private lessons for golf.',1),(9,'Dorian','Layton','4012178905','dlayton@gmail.com','2017-02-01','919 Anniston Avenue','','Providence','002921','RI','',1),(10,'Rosa','Langston','4019089089','rlangston@gmail.com','2018-02-07','1 Lowney Street','','Providence','002921','RI','',4),(11,'Tanner','Malone','4015185621','tmalone@gmail.com','2017-07-03','7 Central Avenue','Suite 9A','Providence','002921','RI','',3),(12,'Riley','Leblanc','4014297856','rleblanc@yahoo.com','2018-07-21','3 Finch Court','','Providence','002921','RI','Interested in upcoming social events.',2),(13,'William','Chase','4013209410','wchase@yahoo.com','2017-09-18','8 Bluebird Lane','','Warren','008591','RI','',5),(14,'Nora','Gutherie','4017607201','ngutherie@gmail.com','2017-10-09','2 Clown Street','','Warren','008591','RI','Enjoys poolside activities and fitness classes.',4),(15,'Rowan','Livingston','4012719481','rlivingston@gmail.com','2017-09-10','4 Cass Avenue','','Warren','008591','RI','',3),(16,'Dale','Bishop','4019801571','dbishop0@yahoo.com','2017-08-05','85 Jay Court','','Warren','008591','RI','',5),(17,'Hunter','Whitley','4019015710','hwhitley@gmail.com','2018-05-09','10 Slip Street','','Warren','008591','RI','Ask about family membership options.',2),(18,'Frankie','Heller','4019105491','fheller@yahoo.com','2017-08-22','801 Funk Lane','','Warren','008591','RI','',1),(19,'Brooklyn','Pepper','3398194912','bpepper@gmail.com','2018-05-16','110 Alaska Ave','','Fall River','003313','MA','',3),(20,'Teagan','Owens','3390199810','teagowens@gmail.com','2018-04-29','159 Berkshire Road','','Fall River','003313','MA','',1),(21,'Landry','Atwood','3390981234','landatwood@gmail.com','2018-03-12','23104 Carolwood Lane','','Fall River','003313','MA','Has dietary restrictions, might be interested in personal training.',2),(22,'Jamie','Kendall','3395813902','jamikendall@gmail.com','2017-11-18','136 Olive Avenue','','Seekonk','004591','MA','',1),(23,'Hunter','Duffy','3390294591','huntduffy@gmail.com','2019-06-07','34 Spring Drive','','Seekonk','004591','MA','',4),(24,'Landen','Shea','3390294587','landshea@gmail.com','2020-09-09','210 Riverview Drive','','Fall River','003313','MA','',1),(25,'Remington','Newberry','3391418095','reminewberry@gmail.com','2021-08-20','50 Freedman Drive','','Seekonk','004591','MA','Active in yoga classes, prefers morning sessions.',4),(26,'Dominic','Dawson','3394518568','domidawson@gmail.com','2020-09-14','28 30th Street','','Seekonk','004591','MA','',5),(27,'Jess','Turner','3398729090','jessturner@gmail.com','2020-01-20','8190 County Road','','Pawtucket','003313','MA','',3),(28,'Brendan','Dean','3397645399','brendean@gmail.com','2020-02-14','1729 County Road','Apt 11','Pawtucket','003313','MA','New member, has some questions about guest pass privileges.',5),(29,'Carlin','Chambers','3391114532','carlchambers@gmail.com','2021-02-21','3030 NW 15th Street','','Pawtucket','003313','MA','',4),(30,'Isabella','Carmichael','3391108963','isabcarmichael@gmail.com','2020-05-17','1108 Spruce Road','','Pawtucket','003313','MA','Recently joined as a regular member, enjoys swimming and tennis',3),(31,'Harper','James','3399102189','harpjames@gmail.com','2022-07-17','1029 Fells Avenue','','Warren','008591','RI','',2),(32,'Cassian','Wilbur','3518894567','casswilbur@gmail.com','2022-08-19','700 Dickinson Road','','Swansea','007810','MA','',2),(33,'Persephone','McCall','3518907632','persmccall@gmail.com','2023-10-01','255 Echo Lane','','Swansea','007810','MA','',2),(34,'Adeline','King','3513260436','adelking@gmail.com','2023-11-20','1302 Fyler Road','','Swansea','007810','MA',' Interested in group sports activities.',1),(35,'Ethan','Curry','3513132844','ecurry@gmail.com','2024-01-16','815 Saints Avenue','','Swansea','007810','MA','',2),(36,'Marcel','Poole','3518094761','marcpoole@gmail.com','2024-01-15','30 Foxboro Road','','Swansea','007810','MA','',2),(37,'Zachary','Carter','3512247610','zachcarter@gmail.com','2024-08-01','818 North Street','','Swansea','007810','MA','',1),(38,'Juliette','Croft','3518190923','julicroft@gmail.com','2023-04-13','4801 Schneider Drive','','Tauton','009821','MA','Prefers one-on-one sessions during weekdays.',1),(39,'Brighton','Harrington','3518321900','brigharrington@gmail.com','2024-06-10','90 Pine Street','','Tauton','009821','MA','',1),(40,'isaiah','Klemens','5082891344','klemens508@yahoo.com','2019-11-04','6 Bower Drive','','New Bedford','002740','MA','',1),(41,'Olivia','Williams','5089982312','olivia.williams@email.com','2024-05-15','34 Oak Street','Apt 101','New Bedford','002740','MA','Possibly interested in upgrading membership.',4),(42,'Lucas','Mendez','4017632419','lucas.mendez@email.com','2024-06-30','21 Apple Street','','Warren','008591','RI','',5),(43,'Sofia','Hernandez','5087891234','sofia.hernandez@email.com','2024-02-22','45 Birch Avenue','Suite 2B','Oxford','001721','MA','',4),(44,'Leo','Jackson','3391035678','leo.jackson@email.com','2024-03-05','56 Walnut Road','Apt 4C','Fall River','003313','MA','Likely to become a frequent member.',3),(45,'Isabella','Reed','4018904725','isabella.reed@email.com','2024-07-02','87 Hillcrest Avenue','','Conventry','002909','RI','',3),(46,'Matteo','Benson','5086739241','matteo.benson@email.com','2024-04-17','123 Maplewood Drive','','Attleboro','002169','MA','',4),(47,'Eleanor','Price','3394157632','eleanor.price@email.com','2024-08-25','902 Birchwood Blvd','','New Bedford','002740','MA','Inquired about the fitness center\'s advanced equipment.',3),(48,'Henry','Sanders','4015874321','henry.sanders@email.com','2024-06-18','1210 Atlantic Ave','','Bristol','002908','RI','',4),(49,'Victoria','Greene','5087495263','victoria.greene@email.com','2024-05-11','231 Oceanview Drive','','Rehoboth','002139','MA','',1),(50,'Mason','Brooks','3395674381','mason.brooks@email.com','2024-07-14','500 Castle Hill Road','','Fall River','003313','MA','Has expressed interest in family-oriented activities and events.',5),(51,'Clara','Simmons','5089128364','clara.simmons@email.com','2024-08-12','33 Riverstone Blvd','','Raynham','002720','MA','',3),(52,'Joshua','Thompson','4016889354','joshua.thompson@email.com','2024-05-08','39 Horizon Road','Suite 2A','Cranston','002910','RI','Inquired about discounts for personal training sessions.',5),(53,'Scarlett','Cooper','5084536721','scarlett.cooper@email.com','2024-06-25','56 Highland Park','','Fairhaven','001801','MA','',2),(54,'Samuel','Harper','3398547021','samuel.harper@email.com','2024-09-03','130 Pine Ridge Road','','Fall River','003313','MA','',5),(55,'Abigail','Foster','5083476598','abigail.foster@email.com','2024-10-14','98 Meadow Lane','','Franklin','002150','MA','Interested in learning about upcoming community events.',2);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membershiptypes`
--

DROP TABLE IF EXISTS `membershiptypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membershiptypes` (
  `membershipTypesID` int NOT NULL AUTO_INCREMENT,
  `typeName` varchar(10) NOT NULL,
  `privileges` text NOT NULL,
  `restrictions` text NOT NULL,
  `monthlyDues` decimal(4,0) NOT NULL,
  PRIMARY KEY (`membershipTypesID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membershiptypes`
--

LOCK TABLES `membershiptypes` WRITE;
/*!40000 ALTER TABLE `membershiptypes` DISABLE KEYS */;
INSERT INTO `membershiptypes` VALUES (1,'Individual','Access to all facilities, discounted event tickets.','Cannot transfer membership to others.',100),(2,'Family','Full access for two adults and dependent children under 21.','Limited to immediate family members only.',200),(3,'Senior','Discounted rates on golf and fitness classes for members 60 and older.','Excludes family privileges.',80),(4,'Corporate','Shared membership for up to five employees of a business.','Limited to specified employees; additional members extra.',300),(5,'Student','Access to fitness facilities and sports for members under 25.','Limited facility access; no spa privileges.',50);
/*!40000 ALTER TABLE `membershiptypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privatelessons`
--

DROP TABLE IF EXISTS `privatelessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `privatelessons` (
  `privateLessonID` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `costPerSession` decimal(10,0) NOT NULL,
  `location` varchar(25) NOT NULL,
  `Activities_activityID` int NOT NULL,
  `Instructors_instructorsID` int NOT NULL,
  PRIMARY KEY (`privateLessonID`),
  KEY `fk_Lessons_Activities1_idx` (`Activities_activityID`),
  KEY `fk_PrivateLessons_Instructors1_idx` (`Instructors_instructorsID`),
  CONSTRAINT `fk_Lessons_Activities1` FOREIGN KEY (`Activities_activityID`) REFERENCES `activities` (`activityID`),
  CONSTRAINT `fk_PrivateLessons_Instructors1` FOREIGN KEY (`Instructors_instructorsID`) REFERENCES `instructors` (`instructorsID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privatelessons`
--

LOCK TABLES `privatelessons` WRITE;
/*!40000 ALTER TABLE `privatelessons` DISABLE KEYS */;
INSERT INTO `privatelessons` VALUES (1,'John','Smith','2004-04-12','10:00:00',50,'Tennis Court 1',14,1),(2,'Camila','Zavala','2024-01-01','11:00:00',60,'Golf Course',13,4),(3,'Ross','Gittell','2024-08-05','04:00:00',40,'Yoga Studio',16,7),(4,'Ophelia','Flores','2024-02-09','03:00:00',70,'Poolside Training',15,6),(5,'Salvador','Witt','2024-07-05','12:30:00',45,'Fitness Center Room',17,9),(6,'Phoebe','Vaughan','2024-08-06','09:45:00',55,'Golf Course',13,4),(7,'Armani','Hutchinson','2024-09-07','10:30:00',50,'Tennis Court 2',14,1),(8,'Dakokta','Marlow','2023-09-17','09:00:00',60,'Poolside Cabana',15,6),(9,'Dorian','Layton','2024-12-09','10:00:00',70,'Fitness Center Room',17,9),(10,'Rosa','Langston','2024-11-10','11:00:00',40,'Yoga Studio',16,7),(11,'Tanner','Malone','2024-06-06','01:30:00',65,'Golf Course',13,4),(12,'Riley','Leblanc','2024-03-12','01:00:00',50,'Tennis Court 3',14,1),(13,'William','Chase','2024-05-16','02:00:00',55,'Poolside Training',15,6),(14,'Nora','Gutherie','2024-06-14','01:00:00',50,'Tennis Court 1',14,1),(15,'Rowan','Livingston','2024-06-11','03:45:00',70,'Fitness Center Room',17,9),(16,'Dale','Bishop','2024-07-14','05:00:00',60,'Golf Course',13,4),(17,'Hunter','Whitley','2024-05-17','03:00:00',40,'Yoga Studio',16,7),(18,'Frankie','Heller','2024-06-18','02:00:00',65,'Poolside Cabana',15,6),(19,'Brooklyn','Pepper','2024-02-22','03:30:00',45,'Tennis Court 2',14,1),(20,'Teagan','Owens','2024-06-02','10:00:00',50,'Golf Course',24,4),(21,'Landry','Atwood','2024-03-21','02:30:00',60,'Yoga Studio',16,7),(22,'Jamie','Kendall','2024-04-22','09:30:00',40,'Fitness Center Room',17,9),(23,'Hunter','Duffy','2024-06-23','10:00:00',70,'Poolside Training',15,6),(24,'Landen','Shea','2024-01-02','12:30:00',55,'Tennis Court 3',14,1),(25,'Remington','Newberry','2024-06-03','03:00:00',50,'Golf Course',22,4),(26,'Rachel','Adams','2024-01-12','01:45:00',45,'Poolside Training',15,6),(27,'Jess','Turner','2024-02-13','01:30:00',40,'Yoga Studio',16,7),(28,'Brendan','Dean','2024-11-01','02:00:00',60,'Tennis Court 1',14,1),(29,'Carlin','Chambers','2024-12-22','11:30:00',70,'Poolside Cabana',15,6),(30,'Isabella','Carmichael','2024-09-30','03:30:00',50,'Fitness Center Room',17,9);
/*!40000 ALTER TABLE `privatelessons` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-12 18:42:08
