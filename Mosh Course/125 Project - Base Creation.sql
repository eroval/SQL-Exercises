-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema videoRental
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema videoRental
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `videoRental` DEFAULT CHARACTER SET utf8 ;
USE `videoRental` ;

-- -----------------------------------------------------
-- Table `videoRental`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoRental`.`roles` (
  `role_id` TINYINT NOT NULL AUTO_INCREMENT,
  `rolename` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`role_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videoRental`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoRental`.`users` (
  `user_id` BIGINT NOT NULL AUTO_INCREMENT,
  `role_id` TINYINT NOT NULL,
  `username` VARCHAR(50) NOT NULL,
  `password` VARCHAR(50) NOT NULL,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`user_id`),
  INDEX `fk_users_roles_idx` (`role_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_roles`
    FOREIGN KEY (`role_id`)
    REFERENCES `videoRental`.`roles` (`role_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videoRental`.`movies`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoRental`.`movies` (
  `barcode` VARCHAR(12) NOT NULL,
  `rental_rate` FLOAT NOT NULL,
  `numbers_in_stock` INT NOT NULL,
  PRIMARY KEY (`barcode`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videoRental`.`coupons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoRental`.`coupons` (
  `code` VARCHAR(25) NOT NULL,
  `description` VARCHAR(50) NULL,
  `discount` DECIMAL(5,4) NOT NULL,
  PRIMARY KEY (`code`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videoRental`.`rentals`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `videoRental`.`rentals` (
  `rent_id` INT NOT NULL AUTO_INCREMENT,
  `date_taken` DATETIME NOT NULL,
  `date_returned` DATETIME NULL,
  `user_id` BIGINT NOT NULL,
  `movie_barcode` VARCHAR(12) NOT NULL,
  `coupon_code` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`rent_id`),
  INDEX `fk_rentals_users1_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_rentals_movies1_idx` (`movie_barcode` ASC) VISIBLE,
  INDEX `fk_rentals_coupons1_idx` (`coupon_code` ASC) VISIBLE,
  CONSTRAINT `fk_rentals_users1`
    FOREIGN KEY (`user_id`)
    REFERENCES `videoRental`.`users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_rentals_movies1`
    FOREIGN KEY (`movie_barcode`)
    REFERENCES `videoRental`.`movies` (`barcode`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_rentals_coupons1`
    FOREIGN KEY (`coupon_code`)
    REFERENCES `videoRental`.`coupons` (`code`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
