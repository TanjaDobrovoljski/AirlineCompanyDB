-- MySQL Workbench Forwar-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema airline_company
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema airline_company
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `airline_company` DEFAULT CHARACTER SET utf8 ;
USE `airline_company` ;

-- -----------------------------------------------------
-- Table `airline_company`.`airplane`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airline_company`.`airplane` ;

CREATE TABLE IF NOT EXISTS `airline_company`.`airplane` (
  `AirplaneID` INT(11) NOT NULL AUTO_INCREMENT,
  `Airplane_number` VARCHAR(6) NOT NULL,
  `Manufacturer` VARCHAR(45) NOT NULL,
  `Model` VARCHAR(45) NOT NULL,
  `Manufactured_date` DATE NOT NULL,
  PRIMARY KEY (`AirplaneID`),
  UNIQUE INDEX `Airplane_number_UNIQUE` (`Airplane_number` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `airline_company`.`airline`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airline_company`.`airline` ;

CREATE TABLE IF NOT EXISTS `airline_company`.`airline` (
  `Capacity` INT(11) NOT NULL,
  `Airplane_AirplaneID` INT(11) NOT NULL,
  PRIMARY KEY (`Airplane_AirplaneID`),
  CONSTRAINT `fk_Airline_Airplane1`
    FOREIGN KEY (`Airplane_AirplaneID`)
    REFERENCES `airline_company`.`airplane` (`AirplaneID`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `airline_company`.`state`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airline_company`.`state` ;

CREATE TABLE IF NOT EXISTS `airline_company`.`state` (
  `Zip_code` INT(11) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Zip_code`),
  UNIQUE INDEX `Zip code_UNIQUE` (`Zip_code` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `airline_company`.`airport`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airline_company`.`airport` ;

CREATE TABLE IF NOT EXISTS `airline_company`.`airport` (
  `AirportID` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(120) NOT NULL,
  `State_Zip_code` INT(11) NOT NULL,
  PRIMARY KEY (`AirportID`),
  INDEX `fk_Airport_State1_idx` (`State_Zip_code` ASC) VISIBLE,
  CONSTRAINT `fk_Airport_State1`
    FOREIGN KEY (`State_Zip_code`)
    REFERENCES `airline_company`.`state` (`Zip_code`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `airline_company`.`airport_has_airplane`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airline_company`.`airport_has_airplane` ;

CREATE TABLE IF NOT EXISTS `airline_company`.`airport_has_airplane` (
  `Airport_AirportID` INT(11) NOT NULL,
  `Airplane_AirplaneID` INT(11) NOT NULL,
  PRIMARY KEY (`Airport_AirportID`, `Airplane_AirplaneID`),
  INDEX `fk_Airport_has_Airplane_Airplane1_idx` (`Airplane_AirplaneID` ASC) VISIBLE,
  INDEX `fk_Airport_has_Airplane_Airport1_idx` (`Airport_AirportID` ASC) VISIBLE,
  CONSTRAINT `fk_Airport_has_Airplane_Airplane1`
    FOREIGN KEY (`Airplane_AirplaneID`)
    REFERENCES `airline_company`.`airplane` (`AirplaneID`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_Airport_has_Airplane_Airport1`
    FOREIGN KEY (`Airport_AirportID`)
    REFERENCES `airline_company`.`airport` (`AirportID`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `airline_company`.`airport_has_employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airline_company`.`airport_has_employee` ;

CREATE TABLE IF NOT EXISTS `airline_company`.`airport_has_employee` (
  `Airport_AirportID` INT(11) NOT NULL,
  `Employee_EmpID` BIGINT(11) NOT NULL,
  PRIMARY KEY (`Airport_AirportID`, `Employee_EmpID`),
  INDEX `fk_Airport_has_Employee_Employee1_idx` (`Employee_EmpID` ASC) VISIBLE,
  INDEX `fk_Airport_has_Employee_Airport1_idx` (`Airport_AirportID` ASC) VISIBLE,
  CONSTRAINT `fk_Airport_has_Employee_Airport1`
    FOREIGN KEY (`Airport_AirportID`)
    REFERENCES `airline_company`.`airport` (`AirportID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `airline_company`.`hangar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airline_company`.`hangar` ;

CREATE TABLE IF NOT EXISTS `airline_company`.`hangar` (
  `HangarID` INT(11) NOT NULL AUTO_INCREMENT,
  `Code` VARCHAR(20) NOT NULL,
  `AirplaneID` INT(11) UNSIGNED NULL DEFAULT '0',
  PRIMARY KEY (`HangarID`),
  INDEX `fk_Hangar_Airplane1_idx` (`AirplaneID` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 23
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `airline_company`.`airport_has_hangar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airline_company`.`airport_has_hangar` ;

CREATE TABLE IF NOT EXISTS `airline_company`.`airport_has_hangar` (
  `AirportID` INT(11) NOT NULL,
  `HangarID` INT(11) NOT NULL,
  PRIMARY KEY (`AirportID`, `HangarID`),
  INDEX `fk_Airport_has_Hangar_Hangar1_idx` (`HangarID` ASC) VISIBLE,
  INDEX `fk_Airport_has_Hangar_Airport1_idx` (`AirportID` ASC) VISIBLE,
  CONSTRAINT `fk_Airport_has_Hangar_Airport1`
    FOREIGN KEY (`AirportID`)
    REFERENCES `airline_company`.`airport` (`AirportID`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_Airport_has_Hangar_Hangar1`
    FOREIGN KEY (`HangarID`)
    REFERENCES `airline_company`.`hangar` (`HangarID`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `airline_company`.`bank`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airline_company`.`bank` ;

CREATE TABLE IF NOT EXISTS `airline_company`.`bank` (
  `BankID` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`BankID`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `airline_company`.`branch`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airline_company`.`branch` ;

CREATE TABLE IF NOT EXISTS `airline_company`.`branch` (
  `BranchID` INT(11) NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `Zip code` INT(11) NOT NULL,
  `AirportID` INT(11) NOT NULL,
  `Branch_bank_account_number` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`BranchID`),
  INDEX `fk_Branch_State1_idx` (`Zip code` ASC) VISIBLE,
  INDEX `fk_Branch_Airport1_idx` (`AirportID` ASC) VISIBLE,
  INDEX `fk_Branch_Branch_bank_account1_idx` (`Branch_bank_account_number` ASC) VISIBLE,
  CONSTRAINT `fk_Branch_Airport1`
    FOREIGN KEY (`AirportID`)
    REFERENCES `airline_company`.`airport` (`AirportID`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_Branch_State1`
    FOREIGN KEY (`Zip code`)
    REFERENCES `airline_company`.`state` (`Zip_code`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `airline_company`.`branch_bank_account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airline_company`.`branch_bank_account` ;

CREATE TABLE IF NOT EXISTS `airline_company`.`branch_bank_account` (
  `Branch_bank_account_number` VARCHAR(20) NOT NULL,
  `Account_balance` DECIMAL(30,3) NULL DEFAULT NULL,
  `Currency` VARCHAR(10) NOT NULL DEFAULT 'EUR',
  `BankID` INT(11) NOT NULL,
  PRIMARY KEY (`Branch_bank_account_number`),
  UNIQUE INDEX `Branch_bank_account_number_UNIQUE` (`Branch_bank_account_number` ASC) VISIBLE,
  INDEX `fk_Branch_bank_account_Bank1_idx` (`BankID` ASC) VISIBLE,
  CONSTRAINT `fk_Branch_bank_account_Bank1`
    FOREIGN KEY (`BankID`)
    REFERENCES `airline_company`.`bank` (`BankID`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `airline_company`.`cargo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airline_company`.`cargo` ;

CREATE TABLE IF NOT EXISTS `airline_company`.`cargo` (
  `Capacity` DECIMAL(10,3) NOT NULL,
  `Airplane_AirplaneID` INT(11) NOT NULL,
  PRIMARY KEY (`Airplane_AirplaneID`),
  CONSTRAINT `fk_Cargo_Airplane1`
    FOREIGN KEY (`Airplane_AirplaneID`)
    REFERENCES `airline_company`.`airplane` (`AirplaneID`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `airline_company`.`employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airline_company`.`employee` ;

CREATE TABLE IF NOT EXISTS `airline_company`.`employee` (
  `EmpID` BIGINT(11) NOT NULL,
  `Name` VARCHAR(30) NOT NULL,
  `Surname` VARCHAR(40) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `Birth_date` DATE NOT NULL,
  `Birth_place` VARCHAR(30) NOT NULL,
  `Email` VARCHAR(32) NOT NULL,
  `Tel` VARCHAR(30) NOT NULL,
  `Duty` TINYINT(1) UNSIGNED NULL DEFAULT NULL,
  `Bank_account_number` VARCHAR(20) NOT NULL,
  `Salary` DECIMAL(10,3) NOT NULL,
  `BranchID` INT(11) NOT NULL,
  PRIMARY KEY (`EmpID`),
  INDEX `fk_Employee_Branch1_idx` (`BranchID` ASC) VISIBLE,
  CONSTRAINT `fk_Employee_Branch1`
    FOREIGN KEY (`BranchID`)
    REFERENCES `airline_company`.`branch` (`BranchID`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `airline_company`.`flight`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airline_company`.`flight` ;

CREATE TABLE IF NOT EXISTS `airline_company`.`flight` (
  `FlightID` INT(11) NOT NULL AUTO_INCREMENT,
  `Duration` INT(5) NOT NULL,
  `Date` DATE NOT NULL,
  `Departure_moment` DATETIME NOT NULL,
  `Arrival_moment` DATETIME NOT NULL,
  `Departure_gate` VARCHAR(45) NOT NULL,
  `Arrival_gate` VARCHAR(45) NOT NULL,
  `AirplaneID` INT(11) NOT NULL,
  `Departure_AirportID` INT(11) NOT NULL,
  `Arrival_AirportID` INT(11) NOT NULL,
  `Status` TINYINT(1) UNSIGNED NULL DEFAULT '0',
  PRIMARY KEY (`FlightID`),
  INDEX `fk_Flight_Airplane1_idx` (`AirplaneID` ASC) VISIBLE,
  INDEX `fk_Flight_Airport1_idx` (`Departure_AirportID` ASC) VISIBLE,
  INDEX `fk_Flight_Airport2_idx` (`Arrival_AirportID` ASC) VISIBLE,
  CONSTRAINT `fk_Flight_Airplane1`
    FOREIGN KEY (`AirplaneID`)
    REFERENCES `airline_company`.`airplane` (`AirplaneID`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_Flight_Airport1`
    FOREIGN KEY (`Departure_AirportID`)
    REFERENCES `airline_company`.`airport` (`AirportID`),
  CONSTRAINT `fk_Flight_Airport2`
    FOREIGN KEY (`Arrival_AirportID`)
    REFERENCES `airline_company`.`airport` (`AirportID`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `airline_company`.`flight_has_employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airline_company`.`flight_has_employee` ;

CREATE TABLE IF NOT EXISTS `airline_company`.`flight_has_employee` (
  `EmployeeID` BIGINT(11) NOT NULL,
  `FlightID` INT(11) NOT NULL,
  PRIMARY KEY (`EmployeeID`, `FlightID`),
  INDEX `fk_Employee_has_Flight_Flight1_idx` (`FlightID` ASC) VISIBLE,
  INDEX `fk_Employee_has_Flight_Employee1_idx` (`EmployeeID` ASC) VISIBLE,
  CONSTRAINT `fk_Employee_has_Flight_Flight1`
    FOREIGN KEY (`FlightID`)
    REFERENCES `airline_company`.`flight` (`FlightID`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `airline_company`.`passenger`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airline_company`.`passenger` ;

CREATE TABLE IF NOT EXISTS `airline_company`.`passenger` (
  `PassengerPID` INT(11) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Surname` VARCHAR(45) NOT NULL,
  `Date_of_birth` DATE NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `Passport_number` VARCHAR(20) NOT NULL,
  `State_Zip code` INT(11) NOT NULL,
  PRIMARY KEY (`PassengerPID`),
  INDEX `fk_Passenger_State1_idx` (`State_Zip code` ASC) VISIBLE,
  CONSTRAINT `fk_Passenger_State1`
    FOREIGN KEY (`State_Zip code`)
    REFERENCES `airline_company`.`state` (`Zip_code`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `airline_company`.`flight_has_passenger`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airline_company`.`flight_has_passenger` ;

CREATE TABLE IF NOT EXISTS `airline_company`.`flight_has_passenger` (
  `PassengerID` INT(11) NOT NULL,
  `FlightID` INT(11) NOT NULL,
  PRIMARY KEY (`PassengerID`, `FlightID`),
  INDEX `fk_Passenger_has_Flight_Flight1_idx` (`FlightID` ASC) VISIBLE,
  INDEX `fk_Passenger_has_Flight_Passenger1_idx` (`PassengerID` ASC) VISIBLE,
  CONSTRAINT `fk_Passenger_has_Flight_Flight1`
    FOREIGN KEY (`FlightID`)
    REFERENCES `airline_company`.`flight` (`FlightID`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_Passenger_has_Flight_Passenger1`
    FOREIGN KEY (`PassengerID`)
    REFERENCES `airline_company`.`passenger` (`PassengerPID`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `airline_company`.`passenger_bank_account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airline_company`.`passenger_bank_account` ;

CREATE TABLE IF NOT EXISTS `airline_company`.`passenger_bank_account` (
  `Passenger_bank_account_number` INT(20) NOT NULL,
  `Account_balance` DECIMAL(10,3) NULL DEFAULT NULL,
  `Currency` VARCHAR(10) NOT NULL DEFAULT 'EUR',
  `PassengerPID` INT(11) NOT NULL,
  `BankID` INT(11) NOT NULL,
  PRIMARY KEY (`Passenger_bank_account_number`),
  INDEX `fk_Passenger_bank_account_Passenger1_idx` (`PassengerPID` ASC) VISIBLE,
  INDEX `fk_Passenger_bank_account_Bank1_idx` (`BankID` ASC) VISIBLE,
  CONSTRAINT `fk_Passenger_bank_account_Bank1`
    FOREIGN KEY (`BankID`)
    REFERENCES `airline_company`.`bank` (`BankID`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_Passenger_bank_account_Passenger1`
    FOREIGN KEY (`PassengerPID`)
    REFERENCES `airline_company`.`passenger` (`PassengerPID`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `airline_company`.`ticket`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airline_company`.`ticket` ;

CREATE TABLE IF NOT EXISTS `airline_company`.`ticket` (
  `TicketID` INT(11) NOT NULL AUTO_INCREMENT,
  `Price` DECIMAL(10,3) NOT NULL,
  `Class` VARCHAR(45) NOT NULL,
  `Seat` VARCHAR(45) NOT NULL,
  `FlightID` INT(11) NOT NULL,
  PRIMARY KEY (`TicketID`),
  INDEX `fk_Ticket_Flight1_idx` (`FlightID` ASC) VISIBLE,
  CONSTRAINT `fk_Ticket_Flight1`
    FOREIGN KEY (`FlightID`)
    REFERENCES `airline_company`.`flight` (`FlightID`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `airline_company`.`reservation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airline_company`.`reservation` ;

CREATE TABLE IF NOT EXISTS `airline_company`.`reservation` (
  `ReservationID` INT(11) NOT NULL AUTO_INCREMENT,
  `Date` DATETIME NOT NULL,
  `Type` BIT(1) NULL DEFAULT NULL,
  `PassengerPID` INT(11) NOT NULL,
  `FlightID` INT(11) NOT NULL,
  `ticket_TicketID` INT(11) NOT NULL,
  PRIMARY KEY (`ReservationID`),
  INDEX `fk_Transaction_Passenger1_idx` (`PassengerPID` ASC) VISIBLE,
  INDEX `fk_Transaction_Flight1_idx` (`FlightID` ASC) VISIBLE,
  INDEX `fk_reservation_ticket1_idx` (`ticket_TicketID` ASC) VISIBLE,
  CONSTRAINT `fk_Transaction_Flight1`
    FOREIGN KEY (`FlightID`)
    REFERENCES `airline_company`.`flight` (`FlightID`)
    ON DELETE CASCADE,
  CONSTRAINT `fk_Transaction_Passenger1`
    FOREIGN KEY (`PassengerPID`)
    REFERENCES `airline_company`.`passenger` (`PassengerPID`),
  CONSTRAINT `fk_reservation_ticket1`
    FOREIGN KEY (`ticket_TicketID`)
    REFERENCES `airline_company`.`ticket` (`TicketID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `airline_company`.`ticket_purchase`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `airline_company`.`ticket_purchase` ;

CREATE TABLE IF NOT EXISTS `airline_company`.`ticket_purchase` (
  `Date` DATETIME NOT NULL,
  `PassengerPID` INT(11) NOT NULL,
  `FlightID` INT(11) NOT NULL,
  `Branch_bank_account_number` VARCHAR(20) NOT NULL,
  `ticket_TicketID` INT(11) NOT NULL,
  PRIMARY KEY (`PassengerPID`, `FlightID`, `Branch_bank_account_number`),
  INDEX `fk_Ticket purchase_Flight1_idx` (`FlightID` ASC) VISIBLE,
  INDEX `fk_Ticket purchase_Branch_bank_account1_idx` (`Branch_bank_account_number` ASC) VISIBLE,
  INDEX `fk_ticket_purchase_ticket1_idx` (`ticket_TicketID` ASC) VISIBLE,
  CONSTRAINT `fk_Ticket purchase_Flight1`
    FOREIGN KEY (`FlightID`)
    REFERENCES `airline_company`.`flight` (`FlightID`),
  CONSTRAINT `fk_Ticket purchase_Passenger1`
    FOREIGN KEY (`PassengerPID`)
    REFERENCES `airline_company`.`passenger` (`PassengerPID`),
  CONSTRAINT `fk_ticket_purchase_ticket1`
    FOREIGN KEY (`ticket_TicketID`)
    REFERENCES `airline_company`.`ticket` (`TicketID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

--
-- Table structure for table `airline`
--


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
-- Table structure for table `airport`
--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES (1,'Josep Tarradellas Barcelona-El Prat Airport',8001),(2,'Václav Havel Airport',10000),(3,'Malpensa Airport',20019),(4,'Charles de Gaulle Airport',75000),(5,'Sheremetyevo Alexander S. Pushkin International Airport',101000);
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airport_has_airplane`
--

-- Dumping data for table `airport_has_airplane`
--

LOCK TABLES `airport_has_airplane` WRITE;
/*!40000 ALTER TABLE `airport_has_airplane` DISABLE KEYS */;
INSERT INTO `airport_has_airplane` VALUES (2,1),(5,1),(1,2),(2,2),(5,2),(1,3),(3,3),(5,3),(4,4),(5,4),(3,5),(5,5),(2,6),(3,6),(5,6),(1,7),(4,7),(5,7),(2,8),(3,8),(5,8),(1,9),(2,9),(5,9),(2,10),(4,10),(5,10),(3,11),(4,11);
/*!40000 ALTER TABLE `airport_has_airplane` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airport_has_employee`
--
-- Dumping data for table `airport_has_employee`
--

LOCK TABLES `airport_has_employee` WRITE;
/*!40000 ALTER TABLE `airport_has_employee` DISABLE KEYS */;
INSERT INTO `airport_has_employee` VALUES (1,56430969932),(1,58648146112),(1,91375660100),(2,12274639232),(2,12345678921),(2,28038538308),(2,54324525298),(2,69868776005),(3,10002233445),(3,22223334556),(3,22309574833),(4,55832563434),(4,61686220409),(4,70062994444),(5,11125997311),(5,32444031673),(5,61308323217),(5,93976190400);
/*!40000 ALTER TABLE `airport_has_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airport_has_hangar`

-- Dumping data for table `airport_has_hangar`
--

LOCK TABLES `airport_has_hangar` WRITE;
/*!40000 ALTER TABLE `airport_has_hangar` DISABLE KEYS */;
INSERT INTO `airport_has_hangar` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(2,6),(2,7),(2,8),(2,9),(2,10),(3,11),(3,12),(3,13),(3,14),(3,15),(4,16),(4,17),(4,18),(5,19),(5,20),(5,21),(5,22);
/*!40000 ALTER TABLE `airport_has_hangar` ENABLE KEYS */;
UNLOCK TABLES;

--

--
-- Dumping data for table `bank`
--

LOCK TABLES `bank` WRITE;
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
INSERT INTO `bank` VALUES (1,'Raiffeisen Bank',' Am Stadtpark 9, 1030 Wien'),(2,'Sberbank','Lazarská 13, 120 00 Nové Město'),(3,'Gazprombank','дом, ул. Наметкина,Moscow');
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (1,'Samolet 1','Aviatická 6',10000,2,'28814289230'),(2,'Samolet 2','Viale dell\'Aviazione 65',20019,3,'20209387201'),(3,'Samolet 3','El Prat de Llobregat 13',8001,1,'90203294833'),(4,'Samolet 4','Roissy-en-France',75000,4,'100003482912'),(5,'Samolet 5',' Khimki 100',101000,5,'93084830487');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_bank_account`
--

--
-- Dumping data for table `branch_bank_account`
--

LOCK TABLES `branch_bank_account` WRITE;
/*!40000 ALTER TABLE `branch_bank_account` DISABLE KEYS */;
INSERT INTO `branch_bank_account` VALUES ('100003482912',1411.682,'EUR',1),('20209387201',7483974292.020,'EUR',3),('28814289230',904900345.588,'CZK',2),('90203294833',107402345.622,'EUR',3),('93084830487',309283473.389,'RUB',1);
/*!40000 ALTER TABLE `branch_bank_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`

-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (78.120,8),(122.670,9),(47.000,10),(92.500,11);
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`

-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (10002233445,'Morgan','Buzz','Lausitzer Pl. 3','1988-08-13','Leipzig','morgan@gmail.com','+10000000007',2,'123000000006',4200.300,2),(10100101001,'bla','b','b','1999-09-09','b','b','b',1,'bb',12.000,1),(11125997311,'Manuel','Cross','Pikka 32','1982-02-20','Belgrade','manuel@gmail.com','+10000000018',3,'123000000017',2700.200,5),(12274639232,'Sofka','Bulgakova','Zell am See 120','1988-04-24','Austria','sofka@gmail.com','+10000000003',1,'123000000002',6300.000,1),(12345678921,'Ivan','Soski','Jorksheere 14','1974-06-12','England','ivan@gmail.com','+10000000004',1,'123000000003',6200.500,1),(22223334556,'Roslyn','Tran','Sheripov 13','1955-08-19','Lyon','roslyn@gmail.com','+10000000008',3,'123000000007',3200.700,2),(22309574833,'Kerim','Rashid','Sveznije 33','1972-10-15','Istanbul','kerim@hotmail.com','+10000000006',1,'123000000005',6220.050,2),(28038538308,'Izabell','Cudry','Tamworth B77 2QG','1973-02-27','Brighton','izabell@gmail.com','+10000000001',2,'123000000000',4820.300,1),(32444031673,'George','Sharma','Leoplast 199','1964-03-17','Warshawa','george@gmail.com','+10000000017',2,'123000000016',4430.400,5),(54324525298,'Marcos','Butt','Polígono Peri Cast D Juan Este, 44B','1990-11-01','Madrid','marcos@hotmail.com','+10000000005',2,'123000000004',4700.200,1),(55832563434,'Dinu','Mack','Wagner Joship','1973-06-25','Budapest','dinu@gmail.com','+10000000012',1,'123000000011',5500.000,4),(56430969932,'Helvius','Santos','Jiglipaff 44','1988-12-12','Utah','helvius@brap.ge','+10000000011',3,'123000000010',3200.500,3),(58648146112,'Kunthea','Kelley','Allmonpaf 34/12','1989-01-19','Tanfield','kunthea@hotmail.com','+10000000009',1,'123000000008',5230.300,3),(61308323217,'Şadi','Daniel','Wiwaldi 33','1980-10-12','Oldberg','sani@ggp.mne','+10000000016',2,'123000000015',4430.400,5),(61686220409,'Rayno','Alvarez','Strossmeier 90','1964-08-24','Lisabon','rayno@live.com','+10000000014',3,'123000000013',2300.030,4),(69868776005,'Johan','Polski','Skarska ceste 11','1954-09-23','Lublin','johan@live.com','+10000000002',3,'123000000001',3500.180,1),(70062994444,'Antoņina','Wagner','Gobi 114','1970-04-22','Zurich','antonia@hotmail.com','+10000000013',2,'123000000012',4333.400,4),(91375660100,'Dragomir','Clarke','Pseidak 3','1961-05-01','Barcelona','dragormir@live.com','+10000000010',2,'123000000009',4000.100,3),(93976190400,'Hananiah','Mueller','Boglway 1033','1975-05-21','Sankt Peterburg','hananiah@hotmail.com','+10000000015',1,'123000000014',5400.000,5);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Temporary view structure for view `employee_info`


--
-- Temporary view structure for view `employee_table`
--



--
-- Table structure for table `flight`
--


--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES (1,32,'2021-09-13','2021-09-13 13:50:00','2021-09-13 14:22:00','D64','B15',1,2,3,0),(2,120,'2021-10-02','2021-10-02 06:15:00','2021-10-02 08:15:00','E73','D11-7',3,1,4,1),(3,220,'2021-11-18','2021-11-18 08:25:00','2021-11-18 11:10:00','C16-12','G102/5',6,5,3,0),(4,220,'2021-11-18','2021-11-18 14:50:00','2021-11-18 17:20:00','B13-44','E92/13',9,5,3,0),(5,105,'2021-08-13','2021-08-13 10:00:00','1000-01-01 00:00:00','A34-7','F8/1-9',10,4,1,2);
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight_has_employee`
--


--
-- Dumping data for table `flight_has_employee`
--

LOCK TABLES `flight_has_employee` WRITE;
/*!40000 ALTER TABLE `flight_has_employee` DISABLE KEYS */;
INSERT INTO `flight_has_employee` VALUES (12274639232,1),(28038538308,1),(54324525298,1),(10002233445,2),(22309574833,2),(58648146112,3),(91375660100,3),(55832563434,4),(70062994444,4),(32444031673,5),(61308323217,5),(93976190400,5);
/*!40000 ALTER TABLE `flight_has_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight_has_passenger`
--

--
-- Dumping data for table `flight_has_passenger`
--

LOCK TABLES `flight_has_passenger` WRITE;
/*!40000 ALTER TABLE `flight_has_passenger` DISABLE KEYS */;
INSERT INTO `flight_has_passenger` VALUES (112956105,1),(221095310,1),(281194410,1),(112956105,2),(112956105,3),(221095310,3),(281194410,3),(505999105,3),(1212982100,3),(112956105,4),(281194410,4),(505999105,4),(221095310,5),(505999105,5);
/*!40000 ALTER TABLE `flight_has_passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `flight_table`
--



--
-- Temporary view structure for view `flight_view`
--



--
-- Temporary view structure for view `flight_view_with_employee`
--



--
-- Temporary view structure for view `flight_view_with_stewart`
--


--
-- Table structure for table `hangar`
--




--
-- Dumping data for table `hangar`
--

LOCK TABLES `hangar` WRITE;
/*!40000 ALTER TABLE `hangar` DISABLE KEYS */;
INSERT INTO `hangar` VALUES (1,'A-1',0),(2,'A-2',0),(3,'A-3',0),(4,'A-4',0),(5,'A-5',0),(6,'B-1',0),(7,'B-2',0),(8,'B-3',0),(9,'B-4',0),(10,'B-5',0),(11,'C-1',0),(12,'C-2',0),(13,'C-3',0),(14,'C-4',0),(15,'C-5',0),(16,'D-1',0),(17,'D-2',0),(18,'D-3',0),(19,'H-1',0),(20,'H-2',0),(21,'H-3',0),(22,'H-4',0);
/*!40000 ALTER TABLE `hangar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pass_bank_account`
--

--
-- Table structure for table `passenger`
--


--
-- Dumping data for table `passenger`
--

LOCK TABLES `passenger` WRITE;
/*!40000 ALTER TABLE `passenger` DISABLE KEYS */;
INSERT INTO `passenger` VALUES (112956105,'Carmen','Iago','1956-12-01','Carrer de l\'Espaseria 10','YZK8321M',8001),(221095310,'Gaël','Corentin','1953-10-22','15 Av. Claude Vellefaux 22','LP99108S',75000),(281194410,'Ivanov ','Cyrillic','1944-11-28','Academician Korolev 13','22418BK3',101000),(505999105,'Josipa','Hrukova','1999-05-05','Lužického semináře','AA11923C',10000),(1212982100,'Giuseppe','Luigi','1982-12-12','Corso di Porta Romana  80','KM8821FF',20019);
/*!40000 ALTER TABLE `passenger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passenger_bank_account`
--


--
-- Dumping data for table `passenger_bank_account`
--

LOCK TABLES `passenger_bank_account` WRITE;
/*!40000 ALTER TABLE `passenger_bank_account` DISABLE KEYS */;
INSERT INTO `passenger_bank_account` VALUES (123954,649.590,'EUR',281194410,3),(11334455,2500.350,'EUR',221095310,2),(12345678,120.400,'EUR',112956105,1),(36752943,2200.879,'EUR',505999105,2),(77385571,10543.634,'EUR',1212982100,3);
/*!40000 ALTER TABLE `passenger_bank_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `passenger_info`
--


--
-- Table structure for table `reservation`
--


--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,'2021-08-18 10:42:13',_binary '',112956105,1,1),(2,'2021-05-21 07:36:28',_binary '',505999105,2,2),(3,'2021-01-09 00:00:00',_binary '\0',505999105,5,3);
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--


--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (8001,'Barcelona','Spain'),(10000,'Prague','Cezch Republic'),(20019,'Milano','Italy'),(75000,'Paris','France'),(101000,'Moscow','Russia');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `table1`
--


--
-- Table structure for table `ticket`


--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,68.500,'A','20D',1),(2,130.400,'A','16C',2),(3,200.320,'B','21F',3),(4,118.450,'C','8A',4),(5,300.700,'B','12E',5),(6,68.500,'A','2A',1),(7,68.500,'B','13F',1),(8,68.500,'B','45G',1),(9,130.400,'B','20A',2),(10,130.400,'C','20B',2),(11,130.400,'C','3D',2),(12,200.320,'A','82G',3),(13,200.320,'A','5H',3),(14,200.320,'D','32C',3),(15,118.450,'C','16L',4),(16,118.450,'C','332D',4),(17,118.450,'C','8P',4),(18,300.700,'A','19T',5);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ticket_info`
--


--
-- Table structure for table `ticket_purchase`
--

--
-- Dumping data for table `ticket_purchase`
--

LOCK TABLES `ticket_purchase` WRITE;
/*!40000 ALTER TABLE `ticket_purchase` DISABLE KEYS */;
INSERT INTO `ticket_purchase` VALUES ('2021-05-04 14:30:20',112956105,4,'100003482912',4),('2021-07-18 11:08:19',281194410,1,'100003482912',5),('2021-03-21 23:43:18',281194410,2,'90203294833',6),('2021-08-27 12:12:12',281194410,3,'100003482912',7),('2021-08-27 12:12:12',1212982100,1,'100003482912',8);
/*!40000 ALTER TABLE `ticket_purchase` ENABLE KEYS */;
UNLOCK TABLES;


DELIMITER ;;
/*!50003

 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_balance_for_passenger` BEFORE INSERT ON `ticket_purchase` FOR EACH ROW BEGIN
	declare pcijena decimal(10,3);
    declare stanje decimal(10.3);
    
    
	select Price
    into pcijena
	from ticket
    where NEW.FlightID = FlightID
    group by FlightID;
    
    select Account_balance
    into stanje
	from passenger_bank_account
    where NEW.PassengerPID = PassengerPID
    group by PassengerPID;
    
    
    if ( stanje > pcijena) then
    update passenger_bank_account
    set Account_balance = Account_balance - pcijena
	where PassengerPID=new.PassengerPID;
    end if;
END */;;
DELIMITER ;
;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ticket_purchase` BEFORE INSERT ON `ticket_purchase` FOR EACH ROW BEGIN
	declare pcijena decimal(10,3);
    declare stanje decimal(10,3);
    declare bstanje decimal(10,3);
    
    
	select Price
    into pcijena
	from ticket
    where NEW.FlightID = FlightID
    group by FlightID;
    
    select Account_balance
    into stanje
	from passenger_bank_account
    where NEW.PassengerPID = PassengerPID
    group by PassengerPID;
    
    
    if ( stanje > pcijena) then
    update passenger_bank_account
    set Account_balance = Account_balance - pcijena
	where PassengerPID=new.PassengerPID;
    
    update branch_bank_account
    set Account_balance = Account_balance + pcijena
	where Branch_bank_account_number=new.Branch_bank_account_number;
    end if;
END */;;
DELIMITER ;

DELIMITER ;;
/*!50003 CREATE*/ /*!50017 
DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_balance_for_company3` AFTER INSERT ON `ticket_purchase` FOR EACH ROW BEGIN
	declare pcijena decimal(10,3);
    
    
	select Price
    into pcijena
	from ticket
    where NEW.FlightID = FlightID
    group by FlightID;
    
    
    update branch_bank_account
    set Account_balance = Account_balance + pcijena
	where Branch_bank_account_number=new.Branch_bank_account_number;
    
END */;;
DELIMITER ;


--
-- Final view structure for view `employee_info`
--

--
-- Final view structure for view `ticket_table`
--



-- Dump completed on 2021-08-29 23:26:24
