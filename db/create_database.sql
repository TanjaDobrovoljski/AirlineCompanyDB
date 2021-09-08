-- MySQL Workbench Forward Engineering

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
