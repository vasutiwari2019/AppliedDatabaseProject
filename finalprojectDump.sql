create database project_vasutiwari;

use project_vasutiwari;

-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: project_vasutiwari
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `billing`
--

DROP TABLE IF EXISTS `billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing` (
  `bid` int NOT NULL AUTO_INCREMENT,
  `cid` int NOT NULL,
  `dateOfBill` datetime NOT NULL,
  `items` varchar(200) NOT NULL,
  `amount` float NOT NULL,
  PRIMARY KEY (`bid`),
  KEY `cid_idx` (`cid`),
  KEY `cid_idx2` (`cid`),
  CONSTRAINT `cid_bill` FOREIGN KEY (`cid`) REFERENCES `clinicalcare` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing`
--

LOCK TABLES `billing` WRITE;
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
INSERT INTO `billing` VALUES (1,1,'2022-10-08 05:26:00','1. Paracetamol - 5 pills, 2. DCold Total - 7 pills',130.9),(2,3,'2021-11-04 13:48:00','1. Voltaflam - 200 pills',1512.5),(3,2,'2021-11-04 13:48:00','1. Crochin - 50 pills, 2. Tylenol - 20 pills',143.5),(4,5,'2021-11-04 13:48:00','1. Ibuprofen - 10 pills, 2. Equate - 5 pills',110.4),(5,4,'2021-11-04 13:48:00','1. Digene - 1 bottle, 2. Pudin Hara - 1 bottle',150.9),(6,2,'2022-10-08 05:26:00','1 Paracetamol',150.7);
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinicalcare`
--

DROP TABLE IF EXISTS `clinicalcare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinicalcare` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL,
  `facilityId` int NOT NULL,
  `consultaindId` int NOT NULL,
  `illness` varchar(100) NOT NULL,
  `tempAtVisit` float NOT NULL,
  `advice` varchar(100) NOT NULL,
  `heartRate` int NOT NULL,
  `bloodPressure` varchar(10) NOT NULL,
  `dateOfVisit` datetime NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `pid_idx` (`cid`),
  KEY `pid_idx1` (`pid`),
  KEY `facilityId_idx` (`facilityId`),
  KEY `facilityId_idx2` (`facilityId`),
  KEY `clinicalcare_pid_idx` (`pid`),
  CONSTRAINT `facilityId_Clic` FOREIGN KEY (`facilityId`) REFERENCES `facility` (`facilityId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pid` FOREIGN KEY (`pid`) REFERENCES `patient` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinicalcare`
--

LOCK TABLES `clinicalcare` WRITE;
/*!40000 ALTER TABLE `clinicalcare` DISABLE KEYS */;
INSERT INTO `clinicalcare` VALUES (1,1,1,2,'Heart',102,'Bed Rest and general medicines',70,'120-90','2022-05-13 07:28:00'),(2,1,4,4,'Lung',99,'Eye drops given',75,'130-40','2020-10-12 09:50:00'),(3,2,3,1,'Kidney',100,'Took Under ICU',150,'150-100','2021-04-23 11:28:00'),(4,3,2,5,'Brain',102,'Kidney Replacement suggested',130,'120-90','2022-05-13 09:20:00'),(5,4,4,3,'Tumor',102,'General medicines and bed rest',120,'110-70','2022-05-13 11:35:00');
/*!40000 ALTER TABLE `clinicalcare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clinicalcare_consultant`
--

DROP TABLE IF EXISTS `clinicalcare_consultant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinicalcare_consultant` (
  `clinicalcare_consultantId` int NOT NULL AUTO_INCREMENT,
  `cid` int NOT NULL,
  `consultandId` int NOT NULL,
  PRIMARY KEY (`clinicalcare_consultantId`),
  KEY `cid_idx` (`cid`),
  KEY `consultandId_idx` (`consultandId`),
  CONSTRAINT `cid` FOREIGN KEY (`cid`) REFERENCES `clinicalcare` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `consultandId` FOREIGN KEY (`consultandId`) REFERENCES `consultant` (`consultantId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinicalcare_consultant`
--

LOCK TABLES `clinicalcare_consultant` WRITE;
/*!40000 ALTER TABLE `clinicalcare_consultant` DISABLE KEYS */;
INSERT INTO `clinicalcare_consultant` VALUES (1,1,3),(2,3,2),(3,1,4),(4,2,5),(5,1,4);
/*!40000 ALTER TABLE `clinicalcare_consultant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultant`
--

DROP TABLE IF EXISTS `consultant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultant` (
  `consultantId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `experience` int NOT NULL,
  PRIMARY KEY (`consultantId`),
  KEY `consultant_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultant`
--

LOCK TABLES `consultant` WRITE;
/*!40000 ALTER TABLE `consultant` DISABLE KEYS */;
INSERT INTO `consultant` VALUES (2,'Dr Ravi Khanna',10),(3,'Dr Ravi Bishnoi',14),(4,'Dr Preeti Agrawal',5),(5,'Dr Mahima Choudhary',25),(6,'Dr Nidhi Sharma',3),(10,'Dr Ramesh Batra',6);
/*!40000 ALTER TABLE `consultant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facility`
--

DROP TABLE IF EXISTS `facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facility` (
  `facilityId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(150) NOT NULL,
  `numberOfEmployees` int NOT NULL,
  `beds` int NOT NULL,
  PRIMARY KEY (`facilityId`),
  KEY `facility_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facility`
--

LOCK TABLES `facility` WRITE;
/*!40000 ALTER TABLE `facility` DISABLE KEYS */;
INSERT INTO `facility` VALUES (1,'ICU','Intensice Care Unit',50,200),(2,'CCU','Critical Care Unit',30,100),(3,'Emergeny','Emergeny department ',250,300),(4,'Burn Unit','Department for burn related patients',50,20),(5,'Surgery','Department for surgery',90,40);
/*!40000 ALTER TABLE `facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facility_consultant`
--

DROP TABLE IF EXISTS `facility_consultant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facility_consultant` (
  `facility_consultant_Id` int NOT NULL AUTO_INCREMENT,
  `facilityId` int NOT NULL,
  `consultandId` int NOT NULL,
  PRIMARY KEY (`facility_consultant_Id`),
  KEY `facilityId_idx` (`facilityId`),
  KEY `cid_fac_idx` (`consultandId`),
  CONSTRAINT `consultantId` FOREIGN KEY (`consultandId`) REFERENCES `consultant` (`consultantId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `facilityId` FOREIGN KEY (`facilityId`) REFERENCES `facility` (`facilityId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facility_consultant`
--

LOCK TABLES `facility_consultant` WRITE;
/*!40000 ALTER TABLE `facility_consultant` DISABLE KEYS */;
INSERT INTO `facility_consultant` VALUES (1,2,2),(2,2,10),(3,4,10),(4,1,3),(5,3,2);
/*!40000 ALTER TABLE `facility_consultant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance`
--

DROP TABLE IF EXISTS `insurance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurance` (
  `insuranceID` int NOT NULL AUTO_INCREMENT,
  `healthInsuranceNumber` int NOT NULL,
  `insuranceGroupNumber` varchar(45) NOT NULL,
  `insuranceName` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `validity` date NOT NULL,
  PRIMARY KEY (`insuranceID`),
  KEY `insurance_name_idx` (`insuranceName`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance`
--

LOCK TABLES `insurance` WRITE;
/*!40000 ALTER TABLE `insurance` DISABLE KEYS */;
INSERT INTO `insurance` VALUES (1,2131212,'2729212','Berkshire Hathway','2313 Jersey','2021-10-09'),(2,126574,'21873811','Statefarm','2135 Charlotte','2028-10-05'),(3,287642,'72173292','Bank of America','2317 Atlanta','2023-07-02'),(4,987334,'21983122','JP Morgan Chase','8763 Chicago','2025-04-15'),(5,738721,'23182828','Goldman Sachs','3122 Miami','2034-11-07'),(6,123121,'21318271','Truist','3737 Omaha','2033-09-03'),(7,127382,'23172731','LIC','6747 Redmond','2030-10-09'),(8,2131278,'31872187','State Bank','Delhi','2040-08-03'),(16,342456,'275372','LIC','Charlotte','2012-01-01'),(17,12314,'21312','dummy','skdakd','2020-08-07'),(18,7218731,'1231313','dummy','shbajhd','2020-01-01'),(19,1231,'9882','jhfbsd','djs jhsdbj','2020-01-01'),(20,1234,'7866','ABC','Newyork','2020-01-01');
/*!40000 ALTER TABLE `insurance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicine`
--

DROP TABLE IF EXISTS `medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicine` (
  `mid` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `inventory` int NOT NULL,
  `specification` varchar(20) NOT NULL,
  `producer` varchar(20) NOT NULL,
  `price` float NOT NULL,
  `category` varchar(20) NOT NULL,
  PRIMARY KEY (`mid`),
  KEY `medicine_name_idx` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicine`
--

LOCK TABLES `medicine` WRITE;
/*!40000 ALTER TABLE `medicine` DISABLE KEYS */;
INSERT INTO `medicine` VALUES (1,'Paracetamol',167213,'Cures fever','Novartis',17.4,'General'),(2,'Crocin',326178,'Headache','Pfizer',14.2,'General'),(3,'DCold Total',213212,'Cough and Cold','AbbVie',20.6,'General'),(4,'Voltaflam',123112,'Pain Killer','Roche',190,'PainReliever'),(5,'Digene',21233,'Improves Digestion','GlaxoSmithKline',567,'Antacid');
/*!40000 ALTER TABLE `medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `phoneNum` varchar(15) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `bloodGroup` varchar(2) NOT NULL,
  `gender` char(1) NOT NULL,
  `height` float NOT NULL,
  `weight` float NOT NULL,
  `insuranceID` int NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `insuranceID_idx` (`insuranceID`),
  KEY `patient_fname_idx` (`fname`),
  KEY `patient_lname_idx` (`lname`),
  CONSTRAINT `insuranceID` FOREIGN KEY (`insuranceID`) REFERENCES `insurance` (`insuranceID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES (1,'Vasu','Tiwari','9803278940','vasu.tiwari@gmail.com','Charlotte','1995-01-13','A+','M',179,100,1),(2,'Prasenjeet','Paul','1287391827','ppaul@gmail.com','Dubai','1994-09-10','B-','M',183,97,2),(3,'Rajat','Maheshwari','2187391291','rmahesh@yahoo.com','Colombo','1998-10-05','O+','M',172,65,3),(4,'Akshdeep','Rajawat','3211321088','aaksh@hotmail.m','Newyork','2000-06-14','O-','M',180,63,4),(5,'Amruth','Nag','6201828492','amruthnag@microsoft.com','Sanfransico','1997-04-03','A-','M',183,90,5),(6,'Rishabh','Mehta','2213123883','rmehta4@google.com','Omaha','1994-04-12','B+','M',165,65,6),(7,'Shivani','Sathe','7217321632','shivanisathe@dubai.com','Dubai','1996-05-04','O-','F',168,72,7),(11,'Divam','Arora','9876541243','divam.arora@gmail.com','Charlotte','1995-12-13','B-','M',179,110,8),(13,'Amruth','Nag','3422342','sada','sajdas','2012-01-01','A+','M',180,95,16),(14,'dummy','dummy','327129781','vj@ty.com','askjdksa','1996-07-14','B+','M',180,65,17),(15,'hdbjs','jsah','3123112','hbdjh','hsdbjhsb dbfjdshb','2020-01-01','A+','M',180,89,18),(16,'dahsba','djasjdh','1232','sab','jdhbj jdhbs','2020-01-01','A+','M',180,54,19),(17,'xyz','pqr','145433','dummy@gmail.com','dummy','1995-01-01','A+','M',180,79,20);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription`
--

DROP TABLE IF EXISTS `prescription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription` (
  `prescriptionId` int NOT NULL AUTO_INCREMENT,
  `cid` int NOT NULL,
  `quantity` int NOT NULL,
  `customUsage` varchar(200) NOT NULL,
  PRIMARY KEY (`prescriptionId`),
  KEY `cid_clic_idx` (`cid`),
  CONSTRAINT `cid_clic` FOREIGN KEY (`cid`) REFERENCES `clinicalcare` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription`
--

LOCK TABLES `prescription` WRITE;
/*!40000 ALTER TABLE `prescription` DISABLE KEYS */;
INSERT INTO `prescription` VALUES (1,1,5,'Two pills in the morning and night'),(2,3,10,'Two pills after taking food in the morning'),(3,2,7,'1 pill in moring before eating food'),(4,1,2,'1 drop in the morning in the left eye'),(5,2,1,'1 drop in the right eye at night');
/*!40000 ALTER TABLE `prescription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescription_medicine`
--

DROP TABLE IF EXISTS `prescription_medicine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prescription_medicine` (
  `pres_med_id` int NOT NULL AUTO_INCREMENT,
  `precriptionId` int NOT NULL,
  `mid` int NOT NULL,
  PRIMARY KEY (`pres_med_id`),
  KEY `precriptionId_idx` (`precriptionId`),
  KEY `mid_idx` (`mid`),
  CONSTRAINT `mid` FOREIGN KEY (`mid`) REFERENCES `medicine` (`mid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `precriptionId` FOREIGN KEY (`precriptionId`) REFERENCES `prescription` (`prescriptionId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescription_medicine`
--

LOCK TABLES `prescription_medicine` WRITE;
/*!40000 ALTER TABLE `prescription_medicine` DISABLE KEYS */;
INSERT INTO `prescription_medicine` VALUES (1,2,1),(2,2,2),(3,1,1),(4,3,2),(5,1,3);
/*!40000 ALTER TABLE `prescription_medicine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'project_vasutiwari'
--

--
-- Dumping routines for database 'project_vasutiwari'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_billing` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_billing`(in cid INT,
in dateOfBill datetime,
in items varchar(200),
in amount float)
BEGIN
INSERT INTO `project_vasutiwari`.`billing`
(`cid`,
`dateOfBill`,
`items`,
`amount`)
VALUES
(cid,
dateOfBill,
items,
amount);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_clinicalcare` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_clinicalcare`(in pid int,
in facilityId int,
in consultaindId int,
in illness VARCHAR(100),
in tempAtVisit FLOAT,
in advice VARCHAR(100),
in heartRate int,
in bloodPressure VARCHAR(10),
in dateOfVisit DATETIME)
BEGIN
INSERT INTO `project_vasutiwari`.`clinicalcare`
(`pid`,
`facilityId`,
`consultaindId`,
`illness`,
`tempAtVisit`,
`advice`,
`heartRate`,
`bloodPressure`,
`dateOfVisit`)
VALUES
(pid,
facilityId,
consultaindId,
illness,
tempAtVisit,
advice,
heartRate,
bloodPressure,
dateOfVisit);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_consultant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_consultant`(in name VARCHAR(20),
in experience int)
BEGIN
INSERT INTO `project_vasutiwari`.`consultant`
(`name`,
`experience`)
VALUES
(name,
experience);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_facility` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_facility`(in name VARCHAR(50),
in description VARCHAR(100),
in numberOfEmployees int,
in beds int)
BEGIN
INSERT INTO `project_vasutiwari`.`facility`
(`name`,
`description`,
`numberOfEmployees`,
`beds`)
VALUES
(name,
description,
numberOfEmployees,
beds);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_insurance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_insurance`(in healthInsuranceNumber int,
in insuranceGroupNumber VARCHAR(45),
in insuranceName VARCHAR(45),
in address VARCHAR(45),
in validity DATE)
BEGIN
INSERT INTO `project_vasutiwari`.`insurance`
(`healthInsuranceNumber`,
`insuranceGroupNumber`,
`insuranceName`,
`address`,
`validity`)
VALUES
(healthInsuranceNumber,
insuranceGroupNumber,
insuranceName,
address,
validity);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_medicine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_medicine`(in name VARCHAR(20),
in inventory int,
in specification VARCHAR(20),
in producer VARCHAR(20),
in price FLOAT,
in category VARCHAR(20))
BEGIN
INSERT INTO `project_vasutiwari`.`medicine`
(`name`,
`inventory`,
`specification`,
`producer`,
`price`,
`category`)
VALUES
(name,
inventory,
specification,
producer,
price,
category);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_patient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_patient`(in fname varchar(20),
in lname varchar(30),in phoneNum varchar(15),in email varchar(30),
in address varchar(100),in dateOfBirth DATE,in bloodGroup varchar(2),
in gender char(1),in height FLOAT,in weight FLOAT,in insuranceID INT)
BEGIN
INSERT INTO `project_vasutiwari`.`patient`
(`fname`,
`lname`,
`phoneNum`,
`email`,
`address`,
`dateOfBirth`,
`bloodGroup`,
`gender`,
`height`,
`weight`,
`insuranceID`)
VALUES
(fname,
lname,
phoneNum,
email,
address,
dateOfBirth,
bloodGroup,
gender,
height,
weight,
insuranceID);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_prescription` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_prescription`(in cid int,
in quantity int,
in customUsage VARCHAR(200))
BEGIN
INSERT INTO `project_vasutiwari`.`prescription`
(`cid`,
`quantity`,
`customUsage`)
VALUES
(cid,
quantity,
customUsage);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_billing` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_billing`()
BEGIN
select * from project_vasutiwari.billing;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_clinicalcare` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_clinicalcare`()
BEGIN
select * from project_vasutiwari.clinicalcare;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_clinicalcare_consultant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_clinicalcare_consultant`()
BEGIN
select * from project_vasutiwari.clinicalcare_consultant;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_consultant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_consultant`()
BEGIN
select * from project_vasutiwari.consultant;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_facility` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_facility`()
BEGIN
select * from project_vasutiwari.facility;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_facility_consultant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_facility_consultant`()
BEGIN
select * from project_vasutiwari.facility_consultant;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_insurance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_insurance`()
BEGIN
select * from project_vasutiwari.insurance;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_insurance_last_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_insurance_last_id`()
BEGIN
select insuranceID from project_vasutiwari.insurance ORDER BY insuranceID DESC LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_medicine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_medicine`()
BEGIN
select * from project_vasutiwari.medicine;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_patients` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_patients`()
BEGIN
	select * from project_vasutiwari.patient;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_patient_fname` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_patient_fname`(in fname varchar(20))
BEGIN
	select * from project_vasutiwari.patient where patient.fname = fname;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_prescription` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_prescription`()
BEGIN
select * from project_vasutiwari.prescription;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_prescription_medicine` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_prescription_medicine`()
BEGIN
select * from project_vasutiwari.prescription_medicine;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_clinicalcare` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_clinicalcare`(in ill varchar(100),
in dVisit datetime,in id int)
BEGIN
UPDATE `project_vasutiwari`.`clinicalcare`
SET
`illness` = ill
WHERE `pid` = id and `dateOfVisit` = dVisit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-14 21:11:33
