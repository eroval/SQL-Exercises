-- MySQL Workbench Synchronization
-- Generated: 2020-09-04 13:52
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: SiF

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER TABLE `school`.`enrollments` 
DROP FOREIGN KEY `fk_enrollments_students`,
DROP FOREIGN KEY `fk_enrollments_courses`;

ALTER TABLE `school`.`courses` 
DROP FOREIGN KEY `fk_courses_instructors1`;

ALTER TABLE `school`.`course_tags` 
DROP FOREIGN KEY `fk_course_tags_courses1`,
DROP FOREIGN KEY `fk_course_tags_tags1`;

ALTER TABLE `school`.`enrollments` 
DROP COLUMN `course_id`,
DROP COLUMN `student_id`,
ADD COLUMN `student_id` INT(11) NOT NULL FIRST,
ADD COLUMN `course_id` INT(11) NOT NULL AFTER `student_id`,
ADD COLUMN `coupon` VARCHAR(45) NULL DEFAULT NULL AFTER `price`,
ADD INDEX `fk_enrollments_students_idx` (`student_id` ASC) VISIBLE,
ADD INDEX `fk_enrollments_Course1_idx` (`course_id` ASC) VISIBLE,
DROP INDEX `fk_enrollments_Course1_idx` ,
DROP INDEX `fk_enrollments_students_idx` ;
ALTER TABLE `school`.`enrollments` ALTER INDEX `PRIMARY` VISIBLE;

ALTER TABLE `school`.`courses` 
DROP COLUMN `instructors_id`,
ADD COLUMN `instructors_id` SMALLINT(6) NOT NULL AFTER `price`,
ADD INDEX `fk_courses_instructors1_idx` (`instructors_id` ASC) VISIBLE,
DROP INDEX `fk_courses_instructors1_idx` ;
ALTER TABLE `school`.`enrollments` ALTER INDEX `PRIMARY` VISIBLE;

ALTER TABLE `school`.`course_tags` 
DROP COLUMN `tag_id`,
DROP COLUMN `course_id`,
ADD COLUMN `course_id` INT(11) NOT NULL FIRST,
ADD COLUMN `tag_id` TINYINT(4) NOT NULL AFTER `course_id`,
ADD INDEX `fk_course_tags_courses1_idx` (`course_id` ASC) VISIBLE,
ADD INDEX `fk_course_tags_tags1_idx` (`tag_id` ASC) VISIBLE,
DROP INDEX `fk_course_tags_tags1_idx` ,
DROP INDEX `fk_course_tags_courses1_idx` ;
ALTER TABLE `school`.`enrollments` ALTER INDEX `PRIMARY` VISIBLE;
ALTER TABLE `school`.`course_tags` ALTER INDEX `PRIMARY` VISIBLE;

ALTER TABLE `school`.`enrollments` 
ADD CONSTRAINT `fk_enrollments_students`
  FOREIGN KEY (`student_id`)
  REFERENCES `school`.`students` (`student_id`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk_enrollments_courses`
  FOREIGN KEY (`course_id`)
  REFERENCES `school`.`courses` (`course_id`)
  ON DELETE RESTRICT
  ON UPDATE CASCADE;

ALTER TABLE `school`.`courses` 
ADD CONSTRAINT `fk_courses_instructors1`
  FOREIGN KEY (`instructors_id`)
  REFERENCES `school`.`instructors` (`instructors_id`)
  ON DELETE NO ACTION
  ON UPDATE CASCADE;

ALTER TABLE `school`.`course_tags` 
ADD CONSTRAINT `fk_course_tags_courses1`
  FOREIGN KEY (`course_id`)
  REFERENCES `school`.`courses` (`course_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_course_tags_tags1`
  FOREIGN KEY (`tag_id`)
  REFERENCES `school`.`tags` (`tag_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
