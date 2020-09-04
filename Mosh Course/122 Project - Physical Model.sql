-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema FlightsProject
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema FlightsProject
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `FlightsProject` DEFAULT CHARACTER SET utf8 ;
USE `FlightsProject` ;

-- -----------------------------------------------------
-- Table `FlightsProject`.`passengers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FlightsProject`.`passengers` (
  `passenger_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`passenger_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FlightsProject`.`flightclass`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FlightsProject`.`flightclass` (
  `class_id` TINYINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`class_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FlightsProject`.`airlines`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FlightsProject`.`airlines` (
  `airline_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`airline_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FlightsProject`.`flights`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FlightsProject`.`flights` (
  `flight_id` VARCHAR(50) NOT NULL,
  `airline_id` INT NOT NULL,
  `departure_date_time` DATETIME NOT NULL,
  `arrival_date_time` DATETIME NOT NULL,
  `duration_in_minutes` INT NOT NULL,
  `distance_in_miles` INT NOT NULL,
  `departure_airport_id` INT NOT NULL,
  `arrival_airport_id` INT NOT NULL,
  PRIMARY KEY (`flight_id`),
  INDEX `fk_flights_airlines1_idx` (`airline_id` ASC) VISIBLE,
  CONSTRAINT `fk_flights_airlines1`
    FOREIGN KEY (`airline_id`)
    REFERENCES `FlightsProject`.`airlines` (`airline_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FlightsProject`.`tickets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FlightsProject`.`tickets` (
  `ticket_number` VARCHAR(50) NOT NULL,
  `confirmation_number` VARCHAR(50) NOT NULL,
  `price` FLOAT NOT NULL,
  `passenger_id` INT NOT NULL,
  `class_id` TINYINT NOT NULL,
  `flight_id` VARCHAR(50) NOT NULL,
  INDEX `fk_tickets_flightclass1_idx` (`class_id` ASC) VISIBLE,
  PRIMARY KEY (`class_id`, `passenger_id`, `flight_id`),
  INDEX `fk_tickets_flights1_idx` (`flight_id` ASC) VISIBLE,
  CONSTRAINT `fk_tickets_passengers1`
    FOREIGN KEY (`passenger_id`)
    REFERENCES `FlightsProject`.`passengers` (`passenger_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_tickets_flightclass1`
    FOREIGN KEY (`class_id`)
    REFERENCES `FlightsProject`.`flightclass` (`class_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_tickets_flights1`
    FOREIGN KEY (`flight_id`)
    REFERENCES `FlightsProject`.`flights` (`flight_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `FlightsProject`.`airport`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `FlightsProject`.`airport` (
  `airport_id` INT NOT NULL,
  `iatacode` VARCHAR(50) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `city` VARCHAR(50) NOT NULL,
  `state` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`airport_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
