
USE `airline_company`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: airline_company
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `airline`
--

LOCK TABLES `airline` WRITE;
/*!40000 ALTER TABLE `airline` DISABLE KEYS */;
INSERT INTO `airline` VALUES (102,1),(202,2),(86,3),(72,4),(185,5),(45,6),(98,7);
/*!40000 ALTER TABLE `airline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `airplane`
--

LOCK TABLES `airplane` WRITE;
/*!40000 ALTER TABLE `airplane` DISABLE KEYS */;
INSERT INTO `airplane` VALUES (1,'146','CESSNA AIRCRAFT','Beechcraft Queen Air','1958-01-01'),(2,'1223','Boeing','Boeing 767','1981-08-13'),(3,'244','DASSAULT FALCON','Fokker 100','1986-02-14'),(4,'1002','De Havilland Australia','Vickers VC10','2013-05-10'),(5,'232','Sud-Ouest','Sud Aviation SE-210 Caravelle','1999-08-17'),(6,'9709','Airbus','Airbus A320 family','2012-01-19'),(7,'52','Shenyang Sailplane','Comac ARJ21 Xiangfeng','2008-05-01'),(8,'1013','Boeing','Boeing C-17','2004-11-18'),(9,'442','USAF','Lockheed C-5','2001-07-10'),(10,'221','Antonov','Airbus Beluga','2010-04-19'),(11,'2000','MDC','McDonnell Douglas MD-11','1986-10-24');
/*!40000 ALTER TABLE `airplane` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES (1,'Josep Tarradellas Barcelona-El Prat Airport',8001),(2,'Václav Havel Airport',10000),(3,'Malpensa Airport',20019),(4,'Charles de Gaulle Airport',75000),(5,'Sheremetyevo Alexander S. Pushkin International Airport',101000);
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `airport_has_airplane`
--

LOCK TABLES `airport_has_airplane` WRITE;
/*!40000 ALTER TABLE `airport_has_airplane` DISABLE KEYS */;
INSERT INTO `airport_has_airplane` VALUES (2,1),(5,1),(1,2),(2,2),(5,2),(1,3),(3,3),(5,3),(4,4),(5,4),(3,5),(5,5),(2,6),(3,6),(5,6),(1,7),(4,7),(5,7),(2,8),(3,8),(5,8),(1,9),(2,9),(5,9),(2,10),(4,10),(5,10),(3,11),(4,11);
/*!40000 ALTER TABLE `airport_has_airplane` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `airport_has_employee`
--

LOCK TABLES `airport_has_employee` WRITE;
/*!40000 ALTER TABLE `airport_has_employee` DISABLE KEYS */;
INSERT INTO `airport_has_employee` VALUES (1,56430969932),(1,58648146112),(1,91375660100),(2,12274639232),(2,12345678921),(2,28038538308),(2,54324525298),(2,69868776005),(3,10002233445),(3,22223334556),(3,22309574833),(4,55832563434),(4,61686220409),(4,70062994444),(5,11125997311),(5,32444031673),(5,61308323217),(5,93976190400);
/*!40000 ALTER TABLE `airport_has_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `airport_has_hangar`
--

LOCK TABLES `airport_has_hangar` WRITE;
/*!40000 ALTER TABLE `airport_has_hangar` DISABLE KEYS */;
INSERT INTO `airport_has_hangar` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(2,6),(2,7),(2,8),(2,9),(2,10),(3,11),(3,12),(3,13),(3,14),(3,15),(4,16),(4,17),(4,18),(5,19),(5,20),(5,21),(5,22);
/*!40000 ALTER TABLE `airport_has_hangar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `bank`
--

LOCK TABLES `bank` WRITE;
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
INSERT INTO `bank` VALUES (1,'Raiffeisen Bank',' Am Stadtpark 9, 1030 Wien'),(2,'Sberbank','Lazarská 13, 120 00 Nové Město'),(3,'Gazprombank','дом, ул. Наметкина,Moscow');
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'Samolet 1','Aviatická 6',10000,2,'28814289230'),(2,'Samolet 2','Viale dell\'Aviazione 65',20019,3,'20209387201'),(3,'Samolet 3','El Prat de Llobregat 13',8001,1,'90203294833'),(4,'Samolet 4','Roissy-en-France',75000,4,'100003482912'),(5,'Samolet 5',' Khimki 100',101000,5,'93084830487');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `branch_bank_account`
--

LOCK TABLES `branch_bank_account` WRITE;
/*!40000 ALTER TABLE `branch_bank_account` DISABLE KEYS */;
INSERT INTO `branch_bank_account` VALUES ('100003482912',32850839.442,'EUR',1),('20209387201',7483974292.020,'EUR',3),('28814289230',904900345.588,'CZK',2),('90203294833',107402345.622,'EUR',3),('93084830487',309283473.389,'RUB',1);
/*!40000 ALTER TABLE `branch_bank_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (78.120,8),(122.670,9),(47.000,10),(92.500,11);
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (10002233445,'Morgan','Buzz',' Lausitzer Pl. 3','1988-08-13','Leipzig','morgan@gmail.com','+10000000007',2,'123000000006',4200.300,2),(11125997311,'Manuel','Cross','Pikka 32','1982-02-20','Belgrade','manuel@gmail.com','+10000000018',3,'123000000017',2700.200,5),(12274639232,'Sofka','Bulgakova','Zell am See 120','1988-04-24','Austria','sofka@gmail.com','+10000000003',1,'123000000002',6300.000,1),(12345678921,'Ivan','Soski','Jorksheere 14','1974-06-12','England','ivan@gmail.com','+10000000004',1,'123000000003',6200.500,1),(22223334556,'Roslyn','Tran','Sheripov 13','1955-08-19','Lyon','roslyn@gmail.com','+10000000008',3,'123000000007',3200.700,2),(22309574833,'Kerim','Rashid','Sveznije 33','1972-10-15','Istanbul','kerim@hotmail.com','+10000000006',1,'123000000005',6220.050,2),(28038538308,'Izabell','Cudry','Tamworth B77 2QG','1973-02-27','Brighton','izabell@gmail.com','+10000000001',2,'123000000000',4820.300,1),(32444031673,'George','Sharma','Leoplast 199','1964-03-17','Warshawa','george@gmail.com','+10000000017',2,'123000000016',4430.400,5),(54324525298,'Marcos','Butt','Polígono Peri Cast D Juan Este, 44B','1990-11-01','Madrid','marcos@hotmail.com','+10000000005',2,'123000000004',4700.200,1),(55832563434,'Dinu','Mack','Wagner Joship','1973-06-25','Budapest','dinu@gmail.com','+10000000012',1,'123000000011',5500.000,4),(56430969932,'Helvius','Santos','Jiglipaff 44','1988-12-12','Utah','helvius@brap.ge','+10000000011',3,'123000000010',3200.500,3),(58648146112,'Kunthea','Kelley','Allmonpaf 34/12','1989-01-19','Tanfield','kunthea@hotmail.com','+10000000009',1,'123000000008',5230.300,3),(61308323217,'Şadi','Daniel','Wiwaldi 33','1980-10-12','Oldberg','sani@ggp.mne','+10000000016',2,'123000000015',4430.400,5),(61686220409,'Rayno','Alvarez','Strossmeier 90','1964-08-24','Lisabon','rayno@live.com','+10000000014',3,'123000000013',2300.030,4),(69868776005,'Johan','Polski','Skarska ceste 11','1954-09-23','Lublin','johan@live.com','+10000000002',3,'123000000001',3500.180,1),(70062994444,'Antoņina','Wagner','Gobi 114','1970-04-22','Zurich','antonia@hotmail.com','+10000000013',2,'123000000012',4333.400,4),(91375660100,'Dragomir','Clarke','Pseidak 3','1961-05-01','Barcelona','dragormir@live.com','+10000000010',2,'123000000009',4000.100,3),(93976190400,'Hananiah','Mueller','Boglway 1033','1975-05-21','Sankt Peterburg','hananiah@hotmail.com','+10000000015',1,'123000000014',5400.000,5);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (1,32,'2021-09-13','2021-09-13 13:50:00','2021-09-13 14:22:00','D64','B15',1,2,3,0),(2,120,'2021-10-02','2021-10-02 06:15:00','2021-10-02 08:15:00','E73','D11-7',3,1,4,1),(3,220,'2021-11-18','2021-11-18 08:25:00','2021-11-18 11:10:00','C16-12','G102/5',6,5,3,0),(4,220,'2021-11-18','2021-11-18 14:50:00','2021-11-18 17:20:00','B13-44','E92/13',9,5,3,0),(5,105,'2021-08-13','2021-08-13 10:00:00','1000-01-01 00:00:00','A34-7','F8/1-9',10,4,1,2);
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `flight_has_employee`
--

LOCK TABLES `flight_has_employee` WRITE;
/*!40000 ALTER TABLE `flight_has_employee` DISABLE KEYS */;
INSERT INTO `flight_has_employee` VALUES (12274639232,1),(28038538308,1),(54324525298,1),(10002233445,2),(22309574833,2),(58648146112,3),(91375660100,3),(55832563434,4),(70062994444,4),(32444031673,5),(61308323217,5),(93976190400,5);
/*!40000 ALTER TABLE `flight_has_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `flight_has_passenger`
--

LOCK TABLES `flight_has_passenger` WRITE;
/*!40000 ALTER TABLE `flight_has_passenger` DISABLE KEYS */;
INSERT INTO `flight_has_passenger` VALUES (112956105,1),(221095310,1),(281194410,1),(112956105,2),(112956105,3),(221095310,3),(281194410,3),(505999105,3),(1212982100,3),(112956105,4),(281194410,4),(505999105,4),(221095310,5),(505999105,5);
/*!40000 ALTER TABLE `flight_has_passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `hangar`
--

LOCK TABLES `hangar` WRITE;
/*!40000 ALTER TABLE `hangar` DISABLE KEYS */;
INSERT INTO `hangar` VALUES (1,'A-1',0),(2,'A-2',0),(3,'A-3',0),(4,'A-4',0),(5,'A-5',0),(6,'B-1',0),(7,'B-2',0),(8,'B-3',0),(9,'B-4',0),(10,'B-5',0),(11,'C-1',0),(12,'C-2',0),(13,'C-3',0),(14,'C-4',0),(15,'C-5',0),(16,'D-1',0),(17,'D-2',0),(18,'D-3',0),(19,'H-1',0),(20,'H-2',0),(21,'H-3',0),(22,'H-4',0);
/*!40000 ALTER TABLE `hangar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (112956105,'Carmen','Iago','1956-12-01','Carrer de l\'Espaseria 10','YZK8321M',8001),(221095310,'Gaël','Corentin','1953-10-22','15 Av. Claude Vellefaux 22','LP99108S',75000),(281194410,'Ivanov ','Cyrillic','1944-11-28','Academician Korolev 13','22418BK3',101000),(505999105,'Josipa','Hrukova','1999-05-05','Lužického semináře','AA11923C',10000),(1212982100,'Giuseppe','Luigi','1982-12-12','Corso di Porta Romana  80','KM8821FF',20019);
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `passenger_bank_account`
--

LOCK TABLES `passenger_bank_account` WRITE;
/*!40000 ALTER TABLE `passenger_bank_account` DISABLE KEYS */;
INSERT INTO `passenger_bank_account` VALUES (123954,1050.230,'EUR',281194410,3),(11334455,2500.350,'EUR',221095310,2),(12345678,130.400,'EUR',112956105,1),(36752943,2200.879,'EUR',505999105,2),(77385571,10543.634,'EUR',1212982100,3);
/*!40000 ALTER TABLE `passenger_bank_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,'2021-08-18 10:42:13',_binary '1',112956105,1),(2,'2021-05-21 07:36:28',_binary '1',505999105,2),(3,'2021-01-09 00:00:00',_binary '\0',505999105,3);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (8001,'Barcelona','Spain'),(10000,'Prague','Cezch Republic'),(20019,'Milano','Italy'),(75000,'Paris','France'),(101000,'Moscow','Russia');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,68.500,'A','20D',1,112956105),(2,130.400,'A','16C',2,112956105),(3,200.320,'B','21F',3,281194410),(4,118.450,'C','8A',4,505999105),(5,300.700,'B','12E',5,221095310),(6,212.210,'D','18G',3,281194410);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ticket purchase`
--
LOCK TABLES `ticket_purchase` WRITE;
/*!40000 ALTER TABLE `ticket_purchase` DISABLE KEYS */;
INSERT INTO `ticket_purchase` VALUES ('2021-05-04 14:30:20',112956105,'100003482912',4),('2021-07-18 11:08:19',281194410,'100003482912',5),('2021-03-21 23:43:18',281194410,'90203294833',6),('2021-04-04 06:09:22',1212982100,'93084830487',7);
/*!40000 ALTER TABLE `ticket_purchase` ENABLE KEYS */;
UNLOCK TABLES;

-- Dumping events for database 'airline_company'
--

--
-- Dumping routines for database 'airline_company'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-13 22:47:58
