-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: librarydatabase
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `BookId` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) NOT NULL,
  `Author` varchar(255) NOT NULL,
  `Pages` int NOT NULL,
  `Classification` varchar(255) NOT NULL,
  PRIMARY KEY (`BookId`),
  KEY `i1` (`BookId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Den ensamma katten','Rudolf Ruskprick',123,'Hce'),(2,'Vägen till Väterås','Kenny Surströmming',244,'Hce'),(3,'Grisarnas julafton','Orvar Satorsson',198,'Hce'),(4,'Blomkålsmördaren','Sara Tryffelsten',55,'uHce'),(5,'Min faster Ingeborg','Inga Skoghorn',763,'Hcf'),(6,'Askorbinsyra utan smör','Tore Tofs',199,'Hcf'),(7,'Lastbilens tankar','Oskar Rudenerg',452,'uHce'),(8,'Benny Bläcks liv','Benny Bläck',111,'Hce'),(11,'Mickes bok','Micke kingen',1337,'Hce');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_borrowed`
--

DROP TABLE IF EXISTS `books_borrowed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_borrowed` (
  `RentedOutId` int NOT NULL AUTO_INCREMENT,
  `BorrowedId` int DEFAULT NULL,
  `Title` varchar(255) NOT NULL,
  `bookid` int DEFAULT NULL,
  PRIMARY KEY (`RentedOutId`),
  UNIQUE KEY `bookid` (`bookid`),
  KEY `BorrowedId` (`BorrowedId`),
  CONSTRAINT `books_borrowed_ibfk_1` FOREIGN KEY (`bookid`) REFERENCES `books` (`BookId`) ON DELETE CASCADE,
  CONSTRAINT `books_borrowed_ibfk_2` FOREIGN KEY (`BorrowedId`) REFERENCES `borrower` (`LibraryCard`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_borrowed`
--

LOCK TABLES `books_borrowed` WRITE;
/*!40000 ALTER TABLE `books_borrowed` DISABLE KEYS */;
INSERT INTO `books_borrowed` VALUES (1,1234,'Den ensamma katten',1),(2,1234,'Blomkålsmördaren',4),(3,3347,'Lastbilens tankar',7),(4,1337,'Benny Bläcks liv',8),(5,1337,'Grisarnas Julafton',3),(6,4536,'Min faster Ingeborg',5);
/*!40000 ALTER TABLE `books_borrowed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `borrower`
--

DROP TABLE IF EXISTS `borrower`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `borrower` (
  `LibraryCard` int NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `PhoneNumber` varchar(255) NOT NULL,
  PRIMARY KEY (`LibraryCard`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `borrower`
--

LOCK TABLES `borrower` WRITE;
/*!40000 ALTER TABLE `borrower` DISABLE KEYS */;
INSERT INTO `borrower` VALUES (1111,'borrower','Vägen 1111, Nollberga','123123'),(1234,'Viggo Filtner','Vägen 1, Nollberga','11111'),(1337,'Explorer Johansson','Vägen 123, Nollberga','44444'),(2112,'Elof Öman','Vägen 24, Nollberga','5555'),(3347,'Bosse Baron','Vägen 5, Nollberga','3333'),(4536,'Pelle Pälsänger','Vägen 20, Nollberga','2222');
/*!40000 ALTER TABLE `borrower` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `EmployeeId` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `PhoneNumber1` int DEFAULT NULL,
  `PhoneNumber2` int DEFAULT NULL,
  `PhoneNumber3` int DEFAULT NULL,
  `Salary` int DEFAULT NULL,
  `Holidays` int DEFAULT NULL,
  PRIMARY KEY (`EmployeeId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Asta Kask','Vägen 2, Nollberga',13647,NULL,67869,12000,10),(2,'Ebba Grön','Vägen 4, Nollberga',365868,6789,NULL,83000,21),(3,'Farbror Blå','Vägen 8, Nollberga',68686,NULL,NULL,7000,0);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journals`
--

DROP TABLE IF EXISTS `journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journals` (
  `Title` varchar(255) NOT NULL,
  `Published` date NOT NULL,
  `Storage` varchar(255) NOT NULL,
  PRIMARY KEY (`Title`,`Published`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journals`
--

LOCK TABLES `journals` WRITE;
/*!40000 ALTER TABLE `journals` DISABLE KEYS */;
INSERT INTO `journals` VALUES ('Burksamlaren','2012-03-05','Hylla C'),('Burksamlaren','2012-03-07','Hylla C'),('Burksamlaren','2012-03-09','Hylla C'),('Dagens Tidning','2008-10-05','Hylla B'),('Dagens Tidning','2010-11-09','Hylla B'),('Dagens Tidning','2010-11-10','Hylla B'),('Dagens Tidning','2010-11-11','Hylla B'),('Dagens Tidning','2012-04-05','Hylla B'),('Gårdagens Tidning','1922-12-01','Hylla C'),('Gårdagens Tidning','1944-02-03','Hylla C'),('Gårdagens Tidning','1957-11-24','Hylla C'),('Gårdagens Tidning','1975-04-05','Hylla C'),('Gårdagens Tidning','1988-10-10','Hylla C'),('Gårdagens Tidning','1992-10-10','Hylla C'),('Illustrerad Ångest','1985-10-11','Hylla A'),('Illustrerad Ångest','1985-10-20','Hylla A'),('Illustrerad Ångest','2020-12-12','Hylla A'),('Moderna trasor','2001-01-05','Hylla A'),('Moderna trasor','2005-08-10','Hylla A'),('Moderna trasor','2005-08-20','Hylla A'),('Moderna trasor','2017-10-17','Hylla A'),('Moderna trasor','2018-02-02','Hylla A'),('Nyheter från Vattenpölen','2000-01-04','Hylla B'),('Nyheter från Vattenpölen','2001-06-13','Hylla B'),('Nyheter från Vattenpölen','2003-11-04','Hylla B'),('Nyheter från Vattenpölen','2010-04-13','Hylla B'),('Nyheter från Vattenpölen','2015-06-26','Hylla B'),('Veckans Tråkigaste','1998-01-01','Hylla A'),('Veckans Tråkigaste','2012-11-05','Hylla A');
/*!40000 ALTER TABLE `journals` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-14 23:36:24
