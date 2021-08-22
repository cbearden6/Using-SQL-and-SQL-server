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
  `Locationcol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`LocationId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Project8`.`Donations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project8`.`Donations` (
  `DonationId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `LocationId` INT UNSIGNED NOT NULL,
  `PatientId` INT UNSIGNED NOT NULL,
  `DonationDate` DATE NOT NULL,
  `DiseaseTest` ENUM('Positive', 'Negative') NOT NULL,
  `DrugTest` ENUM('Positive', 'Negative') NOT NULL,
  INDEX `fk_Donations_Patient_idx` (`PatientId` ASC) VISIBLE,
  INDEX `fk_Donations_Location1_idx` (`LocationId` ASC) VISIBLE,
  PRIMARY KEY (`DonationId`),
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
  `LocationId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `LastName` VARCHAR(45) NOT NULL,
  `FirstName` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `State` CHAR(2) NOT NULL,
  `ZipCode` MEDIUMINT(5) NOT NULL,
  `Department` VARCHAR(45) NOT NULL,
  `Title` VARCHAR(45) NOT NULL,
  INDEX `fk_Employees_Location1_idx` (`LocationId` ASC) VISIBLE,
  CONSTRAINT `fk_Employees_Location1`
    FOREIGN KEY (`LocationId`)
    REFERENCES `Project8`.`Location` (`LocationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Project8`.`DonationUseLocation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Project8`.`DonationUseLocation` (
  `DonationId` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Location Name` VARCHAR(45) NOT NULL,
  INDEX `fk_DonationUseLocation_Donations1_idx` (`DonationId` ASC) VISIBLE,
  CONSTRAINT `fk_DonationUseLocation_Donations1`
    FOREIGN KEY (`DonationId`)
    REFERENCES `Project8`.`Donations` (`DonationId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

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
    (DEFAULT, 'Siemons', 'Colly', '2793 Sheridan Circle', 'Seattle', 'WA', 98105, '9993703913', 'A-');
    
INSERT Location
VALUES
	(DEFAULT, '4 Loomis Center', 'Seattle', 'WA', 98103, 'Malton Blood Banks W'),
    (DEFAULT, '8 Glendale Way', 'Seattle', 'WA', 98103, 'Malton Blood Banks E'),
    (DEFAULT, '31 Sundown Pass', 'Seattle', 'WA', 98103, 'Malton Blood Banks S'),
    (DEFAULT, '58874 Warbler Trail', 'Bellevue', 'WA', 98005, 'Malton Blood Banks N'),
    (DEFAULT, '517 1st Road', 'Renton', 'WA', 98055, 'Malton Blood Banks HQ');
     
INSERT DonationUseLocation
VALUES
	(DEFAULT, 'Umbrella Corporation'),
    (DEFAULT, 'Cyberdyne Systems Corporation'),
    (DEFAULT, 'Omni Consumer Products'),
    (DEFAULT, 'Soylent Corporation'),
    (DEFAULT, 'GeneCo'),
    (DEFAULT, 'Weyland-Yutani'),
    (DEFAULT, 'Yoyodyne '),
    (DEFAULT, 'Tyrell Corporation'),
    (DEFAULT, 'Umbrella Corporation'),
    (DEFAULT, 'Umbrella Corporation');
    


/*INSERT Donations
VALUES
	(DEFAULT, 1, 1, '2021-06-12', 'Negative', 'Negative'),
    (DEFAULT, 2, 2, '2021-05-13', 'Negative', 'Negative'),
    (DEFAULT, 3, 3, '2021-04-14', 'Negative', 'Negative'),
    (DEFAULT, 4, 4, '2021-03-15', 'Negative', 'Negative'),
    (DEFAULT, 1, 5, '2021-02-16', 'Negative', 'Negative'),
    (DEFAULT, 2, 6, '2021-01-17', 'Negative', 'Negative'),
    (DEFAULT, 3, 7, '2020-06-18', 'Negative', 'Negative'),
    (DEFAULT, 4, 8, '2020-06-19', 'Negative', 'Negative'),
    (DEFAULT, 1, 9, '2020-06-20', 'Negative', 'Negative'),
    (DEFAULT, 10, 10, '2020-06-21', 'Negative', 'Negative');
    */
    
    
