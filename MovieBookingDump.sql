CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	5.7.19-log

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
-- Table structure for table `carddetails`
--

DROP TABLE IF EXISTS `carddetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carddetails` (
  `CreditCardNumber` varchar(45) NOT NULL,
  `TypeOFCard` enum('MasterCard','Visa') NOT NULL,
  `NameOnCard` varchar(45) NOT NULL,
  `ExpiryDate` date NOT NULL,
  `CVV` int(3) NOT NULL,
  PRIMARY KEY (`CreditCardNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carddetails`
--

LOCK TABLES `carddetails` WRITE;
/*!40000 ALTER TABLE `carddetails` DISABLE KEYS */;
INSERT INTO `carddetails` VALUES ('0987654321','Visa','Bill','2021-08-12',113),('1111111111','MasterCard','Riya','2020-11-11',353),('1234567890','MasterCard','Joe','2022-09-12',234),('3456789012','Visa','Tom','2020-09-02',313),('6519939292','MasterCard','Max','2018-01-12',533),('6789012433','Visa','Ruth','2019-11-12',134),('7377371661','Visa','Sia','2019-08-02',233);
/*!40000 ALTER TABLE `carddetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `concessionoffers`
--

DROP TABLE IF EXISTS `concessionoffers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `concessionoffers` (
  `concessionID` int(11) NOT NULL,
  `FoodName` varchar(45) NOT NULL,
  `Price` int(11) NOT NULL,
  `Theater_TheaterID` int(11) NOT NULL,
  PRIMARY KEY (`concessionID`),
  KEY `fk_FoodOffers_Theater1_idx` (`Theater_TheaterID`),
  CONSTRAINT `fk_FoodOffers_Theater1` FOREIGN KEY (`Theater_TheaterID`) REFERENCES `theater` (`TheaterID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `concessionoffers`
--

LOCK TABLES `concessionoffers` WRITE;
/*!40000 ALTER TABLE `concessionoffers` DISABLE KEYS */;
INSERT INTO `concessionoffers` VALUES (1,'Candy',3,5),(2,'PopCorn',2,5),(3,'HotDog',3,5),(23,'PopCorn',3,4),(25,'Candy',4,1),(32,'Coke',4,4),(33,'Coke',2,3),(111,'Coke',3,1),(123,'PopCorn',3,1),(323,'PopCorn',4,3),(345,'PopCorn',5,2),(452,'Coke',2,2),(525,'Candy',3,2);
/*!40000 ALTER TABLE `concessionoffers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(45) NOT NULL,
  `LastName` varchar(45) NOT NULL,
  `contactNumber` varchar(10) NOT NULL,
  `EmailId` varchar(45) NOT NULL,
  `CardDetails_CreditCardNumber` varchar(45) NOT NULL,
  PRIMARY KEY (`CustomerID`,`CardDetails_CreditCardNumber`),
  UNIQUE KEY `contactNumber_UNIQUE` (`contactNumber`),
  UNIQUE KEY `EmailId_UNIQUE` (`EmailId`),
  KEY `fk_Customer_CardDetails1_idx` (`CardDetails_CreditCardNumber`),
  CONSTRAINT `fk_Customer_CardDetails1` FOREIGN KEY (`CardDetails_CreditCardNumber`) REFERENCES `carddetails` (`CreditCardNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'John','Smith','9873653725','js@gmail.com','1234567890'),(2,'Jerry','Shah','7722668823','jrrs@gmail.com','0987654321'),(3,'Max','Hanks','1316388292','Mh@gmail.com','3456789012'),(4,'Ruth','Brown','1636636373','rb@gmail.com','6789012433'),(5,'Max','White','7883929922','MW@gmail.com','6519939292'),(6,'Sia','Ritz','2287737333','SR@gmail.com','7377371661'),(7,'Riya','Shah','8758484939','RS@gmail.com','1111111111');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discontinuedmovies`
--

DROP TABLE IF EXISTS `discontinuedmovies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discontinuedmovies` (
  `MovieId` int(11) NOT NULL,
  `MovieName` varchar(45) NOT NULL,
  `Ratings` int(11) NOT NULL,
  PRIMARY KEY (`MovieId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discontinuedmovies`
--

LOCK TABLES `discontinuedmovies` WRITE;
/*!40000 ALTER TABLE `discontinuedmovies` DISABLE KEYS */;
/*!40000 ALTER TABLE `discontinuedmovies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foodorder`
--

DROP TABLE IF EXISTS `foodorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `foodorder` (
  `F_OrderID` int(11) NOT NULL,
  `TotalAmount` int(11) NOT NULL,
  `Customer_CustomerID` int(11) NOT NULL,
  `ConcessionOffers_concessionID` int(11) NOT NULL,
  PRIMARY KEY (`F_OrderID`),
  KEY `fk_FoodOrder_Customer1_idx` (`Customer_CustomerID`),
  KEY `fk_FoodOrder_ConcessionOffers1_idx` (`ConcessionOffers_concessionID`),
  CONSTRAINT `fk_FoodOrder_ConcessionOffers1` FOREIGN KEY (`ConcessionOffers_concessionID`) REFERENCES `concessionoffers` (`concessionID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_FoodOrder_Customer1` FOREIGN KEY (`Customer_CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foodorder`
--

LOCK TABLES `foodorder` WRITE;
/*!40000 ALTER TABLE `foodorder` DISABLE KEYS */;
INSERT INTO `foodorder` VALUES (123,12,2,25),(345,23,3,345),(567,12,4,1);
/*!40000 ALTER TABLE `foodorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `LocationID` int(11) NOT NULL,
  `Street` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `State` varchar(45) NOT NULL,
  `ZipCode` varchar(45) NOT NULL,
  PRIMARY KEY (`LocationID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'75 roxburry','boston','MA','02120'),(2,'80 queensburry','boston','MA','02115'),(3,'12 smith','Hokoben','NJ','01102'),(4,'20 YesStreet','NYC','NY','03021');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie` (
  `MovieID` int(11) NOT NULL,
  `MovieName` varchar(45) NOT NULL,
  `Ratings` int(11) NOT NULL,
  PRIMARY KEY (`MovieID`),
  UNIQUE KEY `MovieName_UNIQUE` (`MovieName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'Deadpool',4),(2,'Titanic',3),(3,'Insidious',4),(4,'BadMoms',2),(5,'DieHard',4);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger movie_log
before delete on movie
for each row
begin
insert into discontinuedmovies
set MovieId = OLD.MovieID,
MovieName = OLD.MovieName,
Ratings = OLD.Ratings;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `movie_has_screen`
--

DROP TABLE IF EXISTS `movie_has_screen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movie_has_screen` (
  `Movie_MovieID` int(11) NOT NULL,
  `Screen_ScreenNumber` int(11) NOT NULL,
  KEY `fk_Movie_has_Screen_Screen1_idx` (`Screen_ScreenNumber`),
  KEY `fk_Movie_has_Screen_Movie1_idx` (`Movie_MovieID`),
  CONSTRAINT `fk_Movie_has_Screen_Movie1` FOREIGN KEY (`Movie_MovieID`) REFERENCES `movie` (`MovieID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Movie_has_Screen_Screen1` FOREIGN KEY (`Screen_ScreenNumber`) REFERENCES `screen` (`ScreenNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_has_screen`
--

LOCK TABLES `movie_has_screen` WRITE;
/*!40000 ALTER TABLE `movie_has_screen` DISABLE KEYS */;
INSERT INTO `movie_has_screen` VALUES (1,1),(1,2),(1,3),(2,5),(2,6),(2,4),(3,3),(3,11),(4,10),(5,2),(5,5),(5,1);
/*!40000 ALTER TABLE `movie_has_screen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movieinfo`
--

DROP TABLE IF EXISTS `movieinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `movieinfo` (
  `ReleaseDate` date NOT NULL,
  `MovieLenght` int(11) NOT NULL,
  `Category` varchar(45) NOT NULL,
  `Movie_MovieID` int(11) NOT NULL,
  PRIMARY KEY (`Movie_MovieID`),
  KEY `fk_MovieInfo_Movie1_idx` (`Movie_MovieID`),
  CONSTRAINT `fk_MovieInfo_Movie1` FOREIGN KEY (`Movie_MovieID`) REFERENCES `movie` (`MovieID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movieinfo`
--

LOCK TABLES `movieinfo` WRITE;
/*!40000 ALTER TABLE `movieinfo` DISABLE KEYS */;
INSERT INTO `movieinfo` VALUES ('2018-02-12',123,'Comedy',1),('2018-09-02',135,'Romantic',2),('2017-11-11',119,'Horrror',3),('2018-10-09',140,'Comedy',4),('2017-08-08',129,'Action',5);
/*!40000 ALTER TABLE `movieinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platinumcustomeroffer`
--

DROP TABLE IF EXISTS `platinumcustomeroffer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `platinumcustomeroffer` (
  `Customer_CustomerID` int(11) NOT NULL,
  `TicketDiscount` varchar(45) DEFAULT NULL,
  KEY `fk_PlatinumCustomerOffer_Customer1_idx` (`Customer_CustomerID`),
  CONSTRAINT `fk_PlatinumCustomerOffer_Customer1` FOREIGN KEY (`Customer_CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platinumcustomeroffer`
--

LOCK TABLES `platinumcustomeroffer` WRITE;
/*!40000 ALTER TABLE `platinumcustomeroffer` DISABLE KEYS */;
INSERT INTO `platinumcustomeroffer` VALUES (1,'10%'),(2,'20%'),(4,'20%'),(6,'15%');
/*!40000 ALTER TABLE `platinumcustomeroffer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `premiumcustomeroffer`
--

DROP TABLE IF EXISTS `premiumcustomeroffer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `premiumcustomeroffer` (
  `Customer_CustomerID` int(11) NOT NULL,
  `FoodDiscount` varchar(45) DEFAULT NULL,
  KEY `fk_PremiumCustomerOffer_Customer1_idx` (`Customer_CustomerID`),
  CONSTRAINT `fk_PremiumCustomerOffer_Customer1` FOREIGN KEY (`Customer_CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `premiumcustomeroffer`
--

LOCK TABLES `premiumcustomeroffer` WRITE;
/*!40000 ALTER TABLE `premiumcustomeroffer` DISABLE KEYS */;
INSERT INTO `premiumcustomeroffer` VALUES (3,'10%'),(5,'5%'),(7,'15%');
/*!40000 ALTER TABLE `premiumcustomeroffer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screen`
--

DROP TABLE IF EXISTS `screen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screen` (
  `ScreenNumber` int(11) NOT NULL AUTO_INCREMENT,
  `TotalNoOfSeats` int(11) NOT NULL,
  `Theater_TheaterID` int(11) NOT NULL,
  PRIMARY KEY (`ScreenNumber`),
  UNIQUE KEY `ScreenNumber_UNIQUE` (`ScreenNumber`),
  KEY `fk_Screen_Theater1_idx` (`Theater_TheaterID`),
  CONSTRAINT `fk_Screen_Theater1` FOREIGN KEY (`Theater_TheaterID`) REFERENCES `theater` (`TheaterID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screen`
--

LOCK TABLES `screen` WRITE;
/*!40000 ALTER TABLE `screen` DISABLE KEYS */;
INSERT INTO `screen` VALUES (1,126,1),(2,123,1),(3,123,1),(4,89,2),(5,223,2),(6,122,2),(7,109,2),(8,200,2),(9,134,3),(10,200,4),(11,213,4),(12,90,4),(13,99,4),(14,123,2),(15,143,2);
/*!40000 ALTER TABLE `screen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screeninfo`
--

DROP TABLE IF EXISTS `screeninfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `screeninfo` (
  `TypeOFScreen` enum('Imax','Real3D','Digital') NOT NULL,
  `SoundInfo` varchar(45) DEFAULT NULL,
  `Screen_ScreenNumber` int(11) NOT NULL,
  KEY `fk_ScreenInfo_Screen1_idx` (`Screen_ScreenNumber`),
  CONSTRAINT `fk_ScreenInfo_Screen1` FOREIGN KEY (`Screen_ScreenNumber`) REFERENCES `screen` (`ScreenNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screeninfo`
--

LOCK TABLES `screeninfo` WRITE;
/*!40000 ALTER TABLE `screeninfo` DISABLE KEYS */;
INSERT INTO `screeninfo` VALUES ('Imax','Dolby',1),('Real3D','SurroundSound',2),('Digital','Dolby',3),('Digital','Dolby',4),('Imax','Dolby',5),('Digital','SurroundSound',6),('Digital','SurroundSound',7),('Real3D','Dolby',8),('Imax','SurroundSound',9),('Imax','Dolby',10);
/*!40000 ALTER TABLE `screeninfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seat`
--

DROP TABLE IF EXISTS `seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seat` (
  `SeatNumber` varchar(2) NOT NULL,
  `TypeOFSeat` enum('Recliner','Sofa') NOT NULL,
  `PriceOFSeat` varchar(45) NOT NULL,
  `Screen_ScreenNumber` int(11) NOT NULL,
  `Order_OrderID` int(11) NOT NULL,
  PRIMARY KEY (`SeatNumber`),
  KEY `fk_Seat_Screen1_idx` (`Screen_ScreenNumber`),
  KEY `fk_Seat_Order1_idx` (`Order_OrderID`),
  CONSTRAINT `fk_Seat_Order1` FOREIGN KEY (`Order_OrderID`) REFERENCES `ticketorder` (`OrderID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Seat_Screen1` FOREIGN KEY (`Screen_ScreenNumber`) REFERENCES `screen` (`ScreenNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat`
--

LOCK TABLES `seat` WRITE;
/*!40000 ALTER TABLE `seat` DISABLE KEYS */;
INSERT INTO `seat` VALUES ('1A','Recliner','15',1,1),('1B','Recliner','10',1,1),('2D','Recliner','15',2,3),('3S','Sofa','10',5,2),('3T','Sofa','15',5,2),('3U','Sofa','15',5,2),('4F','Sofa','15',2,4),('6A','Recliner','10',4,5),('6B','Recliner','10',4,5);
/*!40000 ALTER TABLE `seat` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger changeinprice
before update on seat
for each row
begin
insert into seat_old
set SeatNumber = OLD.seatNumber,
TypeOFSeat = OLD.TypeOfSeat,
PriceOFSeat = OLD.priceOfSeat,
ScreenNumber = OLD.Screen_ScreenNumber;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `seat_old`
--

DROP TABLE IF EXISTS `seat_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seat_old` (
  `SeatNumber` varchar(2) NOT NULL,
  `TypeOfSeat` varchar(30) NOT NULL,
  `priceOfSeat` int(11) NOT NULL,
  `ScreenNumber` int(11) NOT NULL,
  PRIMARY KEY (`SeatNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seat_old`
--

LOCK TABLES `seat_old` WRITE;
/*!40000 ALTER TABLE `seat_old` DISABLE KEYS */;
INSERT INTO `seat_old` VALUES ('1A','Recliner',10,1);
/*!40000 ALTER TABLE `seat_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `showdetails`
--

DROP TABLE IF EXISTS `showdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `showdetails` (
  `ShowID` int(11) NOT NULL,
  `Show_Date` date NOT NULL,
  `ShowTimings` varchar(45) NOT NULL,
  `MovieID` int(11) NOT NULL,
  `TheaterID` int(11) NOT NULL,
  `Screen_ScreenNumber` int(11) NOT NULL,
  PRIMARY KEY (`ShowID`),
  KEY `fk_ShowDetails_Movie_has_Theater1_idx` (`MovieID`,`TheaterID`),
  KEY `fk_ShowDetails_Screen1_idx` (`Screen_ScreenNumber`),
  CONSTRAINT `fk_ShowDetails_Movie_has_Theater1` FOREIGN KEY (`MovieID`, `TheaterID`) REFERENCES `theater_has_movies` (`Movie_MovieID`, `Theater_TheaterID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ShowDetails_Screen1` FOREIGN KEY (`Screen_ScreenNumber`) REFERENCES `screen` (`ScreenNumber`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `showdetails`
--

LOCK TABLES `showdetails` WRITE;
/*!40000 ALTER TABLE `showdetails` DISABLE KEYS */;
INSERT INTO `showdetails` VALUES (1,'2017-12-05','12:15',1,2,4),(2,'2017-12-06','12:30',1,2,5),(3,'2017-12-07','10:30',2,3,9),(4,'2017-12-08','21:15',2,4,10),(5,'2017-12-05','20:00',2,1,2),(6,'2017-12-08','13:30',3,1,3),(7,'2017-12-11','10:30',4,1,1),(8,'2017-12-12','14:15',4,4,12),(9,'2017-12-04','12:30',5,4,11);
/*!40000 ALTER TABLE `showdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theater`
--

DROP TABLE IF EXISTS `theater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theater` (
  `TheaterID` int(11) NOT NULL AUTO_INCREMENT,
  `TheaterName` varchar(45) NOT NULL,
  `NumberOFScreens` varchar(45) NOT NULL,
  `Location_LocationID` int(11) NOT NULL,
  PRIMARY KEY (`TheaterID`),
  KEY `fk_Theater_Location1_idx` (`Location_LocationID`),
  CONSTRAINT `fk_Theater_Location1` FOREIGN KEY (`Location_LocationID`) REFERENCES `location` (`LocationID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theater`
--

LOCK TABLES `theater` WRITE;
/*!40000 ALTER TABLE `theater` DISABLE KEYS */;
INSERT INTO `theater` VALUES (1,'Cinemax','3',1),(2,'BigCinemas','5',2),(3,'StarCity','1',1),(4,'AMC','4',3),(5,'Regal','2',2),(6,'PVR','1',4);
/*!40000 ALTER TABLE `theater` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theater_has_movies`
--

DROP TABLE IF EXISTS `theater_has_movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `theater_has_movies` (
  `Movie_MovieID` int(11) NOT NULL,
  `Theater_TheaterID` int(11) NOT NULL,
  PRIMARY KEY (`Movie_MovieID`,`Theater_TheaterID`),
  KEY `fk_Movie_has_Theater_Theater1_idx` (`Theater_TheaterID`),
  KEY `fk_Movie_has_Theater_Movie1_idx` (`Movie_MovieID`),
  CONSTRAINT `fk_Movie_has_Theater_Movie1` FOREIGN KEY (`Movie_MovieID`) REFERENCES `movie` (`MovieID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Movie_has_Theater_Theater1` FOREIGN KEY (`Theater_TheaterID`) REFERENCES `theater` (`TheaterID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theater_has_movies`
--

LOCK TABLES `theater_has_movies` WRITE;
/*!40000 ALTER TABLE `theater_has_movies` DISABLE KEYS */;
INSERT INTO `theater_has_movies` VALUES (2,1),(3,1),(4,1),(5,1),(1,2),(3,2),(4,2),(1,3),(2,3),(5,3),(2,4),(4,4),(5,4),(2,5),(3,5),(4,5),(5,5);
/*!40000 ALTER TABLE `theater_has_movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticketorder`
--

DROP TABLE IF EXISTS `ticketorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ticketorder` (
  `OrderID` int(11) NOT NULL,
  `TotalAmount` int(11) NOT NULL,
  `TotalNoSeatsBooked` int(11) NOT NULL,
  `OrderSuccess` varchar(45) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `Customer_CustomerID` int(11) NOT NULL,
  `ShowDetails_ShowID` int(11) NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `fk_Order_Customer1_idx` (`Customer_CustomerID`),
  KEY `fk_Order_ShowDetails1_idx` (`ShowDetails_ShowID`),
  CONSTRAINT `fk_Order_Customer1` FOREIGN KEY (`Customer_CustomerID`) REFERENCES `customer` (`CustomerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Order_ShowDetails1` FOREIGN KEY (`ShowDetails_ShowID`) REFERENCES `showdetails` (`ShowID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticketorder`
--

LOCK TABLES `ticketorder` WRITE;
/*!40000 ALTER TABLE `ticketorder` DISABLE KEYS */;
INSERT INTO `ticketorder` VALUES (1,75,2,'Y',1,1),(2,45,3,'Y',2,5),(3,34,3,'N',3,2),(4,32,2,'Y',4,3),(5,56,1,'N',5,4),(6,34,3,'Y',5,1);
/*!40000 ALTER TABLE `ticketorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_currentshow`
--

DROP TABLE IF EXISTS `vw_currentshow`;
/*!50001 DROP VIEW IF EXISTS `vw_currentshow`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_currentshow` AS SELECT 
 1 AS `TheaterName`,
 1 AS `MovieName`,
 1 AS `ScreenNumber`,
 1 AS `TotalNoOfSeats`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_theaterinfo`
--

DROP TABLE IF EXISTS `vw_theaterinfo`;
/*!50001 DROP VIEW IF EXISTS `vw_theaterinfo`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_theaterinfo` AS SELECT 
 1 AS `TheaterName`,
 1 AS `city`,
 1 AS `MovieName`,
 1 AS `FoodName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_totalcustomerorder`
--

DROP TABLE IF EXISTS `vw_totalcustomerorder`;
/*!50001 DROP VIEW IF EXISTS `vw_totalcustomerorder`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_totalcustomerorder` AS SELECT 
 1 AS `fullName`,
 1 AS `ticketAmount`,
 1 AS `foodAmount`,
 1 AS `TotalAmount`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP PROCEDURE IF EXISTS `proc_getMoviesandTheater` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_getMoviesandTheater`(IN genre varchar(30))
begin
    select movie.MovieName, theater.TheaterName
from movie inner join theater inner join movieinfo
on movie.MovieID = movieinfo.Movie_MovieID
where Category = genre;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_MovieShowDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_MovieShowDetails`(IN MovieNm varchar(30))
begin
select location.City,theater.TheaterName, showdetails.Show_Date,showdetails.ShowTimings
from location
join theater
on location.LocationID = theater.Location_LocationID
join showdetails
on theater.TheaterID = showdetails.TheaterID
join movie
on showdetails.MovieID= movie.MovieID
where MovieName = MovieNm;

End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `proc_schedule` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_schedule`(IN day1 varchar(30))
begin
   SELECT theater.TheaterName,movie.MovieName,ShowTimings
 FROM showdetails 
 join movie
on showdetails.MovieID = movie.MovieID
join theater
on showdetails.TheaterID = theater.TheaterID
 WHERE  dayname(Show_Date) = day1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_currentshow`
--

/*!50001 DROP VIEW IF EXISTS `vw_currentshow`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_currentshow` AS select `theater`.`TheaterName` AS `TheaterName`,`movie`.`MovieName` AS `MovieName`,`screen`.`ScreenNumber` AS `ScreenNumber`,`screen`.`TotalNoOfSeats` AS `TotalNoOfSeats` from (((`theater` join `theater_has_movies` on((`theater`.`TheaterID` = `theater_has_movies`.`Theater_TheaterID`))) join `movie` on((`movie`.`MovieID` = `theater_has_movies`.`Movie_MovieID`))) join `screen` on((`theater`.`TheaterID` = `screen`.`Theater_TheaterID`))) group by `theater`.`TheaterName`,`movie`.`MovieName`,`screen`.`ScreenNumber` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_theaterinfo`
--

/*!50001 DROP VIEW IF EXISTS `vw_theaterinfo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_theaterinfo` AS select `theater`.`TheaterName` AS `TheaterName`,`location`.`City` AS `city`,`movie`.`MovieName` AS `MovieName`,`concessionoffers`.`FoodName` AS `FoodName` from ((((`theater` join `location` on((`theater`.`Location_LocationID` = `location`.`LocationID`))) join `theater_has_movies` on((`theater`.`TheaterID` = `theater_has_movies`.`Theater_TheaterID`))) join `movie` on((`movie`.`MovieID` = `theater_has_movies`.`Movie_MovieID`))) join `concessionoffers` on((`theater`.`TheaterID` = `concessionoffers`.`Theater_TheaterID`))) order by `theater`.`TheaterName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_totalcustomerorder`
--

/*!50001 DROP VIEW IF EXISTS `vw_totalcustomerorder`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_totalcustomerorder` AS select concat(`customer`.`FirstName`,' ',`customer`.`LastName`) AS `fullName`,`ticketorder`.`TotalAmount` AS `ticketAmount`,`foodorder`.`TotalAmount` AS `foodAmount`,coalesce((`ticketorder`.`TotalAmount` + `foodorder`.`TotalAmount`),`foodorder`.`TotalAmount`,`ticketorder`.`TotalAmount`) AS `TotalAmount` from ((`customer` join `ticketorder` on((`customer`.`CustomerID` = `ticketorder`.`Customer_CustomerID`))) left join `foodorder` on((`customer`.`CustomerID` = `foodorder`.`Customer_CustomerID`))) where (`ticketorder`.`OrderSuccess` = 'Y') order by `customer`.`FirstName`,`customer`.`LastName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-14  0:19:30
