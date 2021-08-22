# Cody Bearden - Project 8
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


-- -----------------------------------------------------
-- Schema Project8
-- -----------------------------------------------------

DROP DATABASE IF EXISTS Project8;
CREATE DATABASE Project8;
USE Project8;

-- -----------------------------------------------------
-- Table `Project8`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project8`.`Patient` (
  `PatientId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `LastName` VARCHAR(45) NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `State` CHAR(2) NOT NULL,
  `ZipCode` MEDIUMINT(5) NOT NULL,
  `PhoneNumber` VARCHAR(45) NOT NULL,
  `BloodType` ENUM('A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-') NOT NULL,
  PRIMARY KEY (`PatientId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project8`.`Location`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project8`.`Location` (
  `LocationId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Address` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `State` CHAR(2) NOT NULL,
  `ZipCode` MEDIUMINT(5) NOT NULL,
  `LocationName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`LocationId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project8`.`Donations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project8`.`Donations` (
  `PatientId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `LocationId` INT UNSIGNED NOT NULL,
  `DonationId` INT UNSIGNED NOT NULL,
  `DonationDate` DATE NOT NULL,
  `DiseaseTest` ENUM('Positive', 'Negative') NOT NULL,
  `DrugTest` ENUM('Positive', 'Negative') NOT NULL,
  `DonationUseLocation` VARCHAR(45) NOT NULL,
  INDEX `fk_Donations_Patient_idx` (`PatientId` ASC) VISIBLE,
  INDEX `fk_Donations_Location1_idx` (`LocationId` ASC) VISIBLE,
  PRIMARY KEY (`PatientId`),
  CONSTRAINT `fk_Donations_Patient`
    FOREIGN KEY (`PatientId`)
    REFERENCES `Project8`.`Patient` (`PatientId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Donations_Location1`
    FOREIGN KEY (`LocationId`)
    REFERENCES `Project8`.`Location` (`LocationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project8`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project8`.`Employees` (
  `LocationId` INT UNSIGNED NOT NULL,
  `EmployeeId` INT UNSIGNED NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `PhoneNumber` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `State` CHAR(2) NOT NULL,
  `ZipCode` MEDIUMINT(5) NOT NULL,
  `Title` VARCHAR(45) NOT NULL,
  INDEX `fk_Employees_Location1_idx` (`LocationId` ASC) VISIBLE,
  CONSTRAINT `fk_Employees_Location1`
    FOREIGN KEY (`LocationId`)
    REFERENCES `Project8`.`Location` (`LocationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data
-- -----------------------------------------------------

INSERT Patient 
VALUES
	(DEFAULT, 'Kuhn', 'Cale', '7 Burrows Circle', 'Seattle', 'WA', 98105, '9993703913', 'A+'),
    (DEFAULT, 'Simmank', 'Jaime', '530 Loeprich Terrace', 'Auburn', 'WA', 98092, '9993703913', 'A-'),
    (DEFAULT, 'Durram', 'Jasmina', '38802 Vera Junction', 'Belleview', 'WA', 98004, '9993703913', 'B+'),
    (DEFAULT, 'Rout', 'Zea', '91299 Nova Terrace', 'Seattle', 'WA', 98108, '9993703913', 'B-'),
    (DEFAULT, 'Hagley', 'Nealy', '82883 Walton Drive', 'Belleview', 'WA', 98005, '9993703913', 'AB+'),
    (DEFAULT, 'Petz', 'Giuseppe', '925 Eagle Crest Circle', 'Seattle', 'WA', 98112, '9993703913', 'AB-'),
    (DEFAULT, 'Radbourne', 'Hersch', '2 Corscot Lane', 'Renton', 'WA', 98055, '9993703913', 'O+'),
    (DEFAULT, 'Kemble', 'Norbie', '20 Arrowood Parkway', 'Cottage Lake', 'WA', 98077, '9993703913', 'O-'),
    (DEFAULT, 'Timblett', 'Juli', '87015 Sundown Park', 'Seattle', 'WA', 98105, '9993703913', 'A+'),
    (DEFAULT, 'Siemons', 'Colly', '2793 Sheridan Circle', 'Seattle', 'WA', 98105, '9993703913', 'O-');
    
INSERT Location
VALUES
	(DEFAULT, '4 Loomis Center', 'Seattle', 'WA', 98103, 'Malton Blood Banks N'),
    (DEFAULT, '8 Glendale Way', 'Seattle', 'WA', 98103, 'Malton Blood Banks S'),
    (DEFAULT, '31 Sundown Pass', 'Seattle', 'WA', 98103, 'Malton Blood Banks E'),
    (DEFAULT, '58874 Warbler Trail', 'Bellevue', 'WA', 98005, 'Malton Blood Banks W'),
    (DEFAULT, '517 1st Road', 'Renton', 'WA', 98055, 'Malton Blood Banks HQ');

INSERT Donations
VALUES
	(DEFAULT, 1, 1, '2021-06-12', 'Negative', 'Negative', 'Umbrella Corporation'),
    (DEFAULT, 2, 2, '2021-05-13', 'Negative', 'Negative', 'Cyberdyne Systems Corporation'),
    (DEFAULT, 3, 3, '2021-04-14', 'Negative', 'Negative', 'Omni Consumer Products'),
    (DEFAULT, 4, 4, '2021-03-15', 'Negative', 'Negative', 'Soylent Corporation'),
    (DEFAULT, 1, 5, '2021-02-16', 'Negative', 'Negative', 'GeneCo'),
    (DEFAULT, 2, 6, '2021-01-17', 'Negative', 'Negative', 'Weyland-Yutani'),
    (DEFAULT, 3, 7, '2020-06-18', 'Negative', 'Negative', 'Yoyodyne'),
    (DEFAULT, 4, 8, '2020-06-19', 'Negative', 'Negative', 'Tyrell Corporation'),
    (DEFAULT, 1, 9, '2020-06-20', 'Negative', 'Negative', 'Umbrella Corporation'),
    (DEFAULT, 1, 10, '2020-06-21', 'Positive', 'Positive', 'Umbrella Corporation');
    
INSERT Employees
VALUES
	(1, 1, 'Fannin', 'Richard', '8028759931', '19 Odd Lane Apt 21', 'Seattle', 'WA', 98105, 'Staff Accountant III'),
    (2, 2, 'Padick', 'Walter', '3792734853', '19 Odd Lane Apt 1', 'Seattle', 'WA', 98105, 'Recruiter'),
    (3, 3, 'Hodji', 'Walter', '1855217218', '19 Odd Lane Apt 12', 'Seattle', 'WA', 98105, 'Budget/Accounting Analyst III'),
    (4, 4, 'Broadcloak', 'Marten', '7964512761', '19 Odd Lane Apt 19', 'Seattle', 'WA', 98105, 'Help Desk Technician'),
    (5, 5, 'Hinch', 'Bill', '9413627025', '19 Odd Lane Apt 7', 'Seattle', 'WA', 98105, 'Human Resources Manager'),
    (2, 6, 'Faraday', 'Russell', '5567034878', '19 Odd Lane Apt 6', 'Seattle', 'WA', 98105, 'Project Manager'),
    (3, 7, 'Flagg', 'Randall', '6778611054', '19 Odd Lane Apt 5', 'Seattle', 'WA', 98105, 'General Manager'),
    (4, 8, 'O'' Dim', 'Walter', '7711742823', '19 Odd Lane Apt 4', 'Seattle', 'WA', 98105, 'Electrical Engineer'),
    (5, 9, 'Filaro', 'Rudin', '7366047089', '19 Odd Lane Apt 3', 'Seattle', 'WA', 98105, 'VP Accounting'),
    (2, 10, 'Fiegler', 'Raymond', '6192459903', '19 Odd Lane Apt 2', 'Seattle', 'WA', 98105, 'Blood Bank Technician');
    
-- -----------------------------------------------------
-- Views
-- -----------------------------------------------------
    
CREATE VIEW HQEmployeeContactInfo AS
SELECT FirstName, LastName, PhoneNumber
FROM Employees
WHERE LocationID = 5;
    
CREATE VIEW ONegBloodType AS
SELECT FirstName, LastName, BloodType
FROM Patient
WHERE BloodType = 'O-';


-- -----------------------------------------------------
-- Sample queries
-- -----------------------------------------------------
    
SELECT Patient.LastName, Patient.FirstName, BloodType, DonationId, DonationDate, LocationName
FROM Patient JOIN donations USING (PatientId)
	JOIN Location USING (LocationId)
ORDER BY DonationDate DESC;

SELECT DonationUseLocation, LocationName AS `Blood Bank`, DonationId, PatientId
FROM Location JOIN Donations USING (LocationId)
	JOIN patient USING (PatientId)
WHERE DonationUseLocation = 'Umbrella Corporation';

SELECT Employees.FirstName, Employees.LastName, Title, LocationName
FROM Employees JOIN Location USING (LocationId)
ORDER BY LocationName;

SELECT PatientId, DonationId, BloodType
FROM Patient JOIN Donations USING (PatientId)
WHERE DiseaseTest = 'Positive' || DrugTest = 'Positive';




    
    