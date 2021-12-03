-- MySQL Script generated by MySQL Workbench
-- Wed Dec  1 10:12:49 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema WSSC_Data_Catalog
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS 

WSSC_Data_Catalog ;

-- -----------------------------------------------------
-- Schema WSSC_Data_Catalog
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS WSSC_Data_Catalog DEFAULT CHARACTER SET utf8 ;
USE WSSC_Data_Catalog ;

-- -----------------------------------------------------
-- Table WSSC_Data_Catalog.strategic_priority
-- -----------------------------------------------------
DROP TABLE IF EXISTS WSSC_Data_Catalog.strategic_priority ;

CREATE TABLE IF NOT EXISTS WSSC_Data_Catalog.strategic_priority (
  strategic_priority_ID INT NOT NULL AUTO_INCREMENT,
  strategic_priority_name VARCHAR(45) DEFAULT NULL,
  PRIMARY KEY (strategic_priority_ID))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table WSSC_Data_Catalog.kpi
-- -----------------------------------------------------
DROP TABLE IF EXISTS WSSC_Data_Catalog.kpi ;

CREATE TABLE IF NOT EXISTS WSSC_Data_Catalog.kpi (
  kpi_ID INT NOT NULL AUTO_INCREMENT,
  kpi_name VARCHAR(45) NOT NULL,
  kpi_description VARCHAR(3000) DEFAULT NULL,
  permission_status VARCHAR(45) DEFAULT('inactive'),
  kpi_owner_ID INT NOT NULL DEFAULT 0,
  strategic_priority_ID INT NOT NULL,
  PRIMARY KEY (kpi_ID, strategic_priority_ID),
  INDEX strategic_priority_ID_idx (strategic_priority_ID ASC) VISIBLE,
  CONSTRAINT con_strategic_priority_ID
    FOREIGN KEY (strategic_priority_ID)
    REFERENCES WSSC_Data_Catalog.strategic_priority (strategic_priority_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

-- -----------------------------------------------------
-- Table WSSC_Data_Catalog.dataset
-- -----------------------------------------------------
DROP TABLE IF EXISTS WSSC_Data_Catalog.dataset ;

CREATE TABLE IF NOT EXISTS WSSC_Data_Catalog.dataset (
  dataset_ID INT NOT NULL AUTO_INCREMENT,
  dataset_name VARCHAR(45) NULL DEFAULT NULL,
  dataset_owner_ID INT NOT NULL DEFAULT 0,
  dataset_steward_ID VARCHAR(45) NULL DEFAULT NULL,
  internal_external VARCHAR(45) NULL DEFAULT NULL,
  kpi_ID INT NOT NULL DEFAULT 0,
  PRIMARY KEY (dataset_ID),
  INDEX dataset_owner_ID_idx (dataset_owner_ID ASC) VISIBLE,
  INDEX dataset_steward_ID_idx (dataset_steward_ID ASC) VISIBLE,
  INDEX kpi_ID_idx (kpi_ID ASC) VISIBLE,
  CONSTRAINT con2_kpi_ID
    FOREIGN KEY (kpi_ID)
    REFERENCES WSSC_Data_Catalog.kpi (kpi_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;
-- -----------------------------------------------------
-- Table WSSC_Data_Catalog.data_user
-- -----------------------------------------------------
DROP TABLE IF EXISTS WSSC_Data_Catalog.data_user ;

CREATE TABLE IF NOT EXISTS WSSC_Data_Catalog.data_user (
  data_user_name VARCHAR(45) NOT NULL DEFAULT ('USER'),
  data_user_phone VARCHAR(45) NULL DEFAULT NULL,
  data_user_email VARCHAR(45) NULL DEFAULT NULL,
  dataset_ID INT NOT NULL DEFAULT 0,
  data_user_ID INT NOT NULL AUTO_INCREMENT,
  permission_ID VARCHAR(45) DEFAULT ('inactive'),
  PRIMARY KEY (data_user_ID, dataset_ID),
  INDEX dataset_ID_idx (dataset_ID ASC) VISIBLE,
  CONSTRAINT con3_dataset_ID
    FOREIGN KEY (dataset_ID)
    REFERENCES WSSC_Data_Catalog.dataset (dataset_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

-- -----------------------------------------------------
-- Table WSSC_Data_Catalog.dataset_owner
-- -----------------------------------------------------
DROP TABLE IF EXISTS WSSC_Data_Catalog.dataset_owner ;

CREATE TABLE IF NOT EXISTS WSSC_Data_Catalog.dataset_owner (
  dataset_owner_ID INT NOT NULL AUTO_INCREMENT,
  dataset_owner_name VARCHAR(45) NULL DEFAULT NULL,
  dataset_owner_phone VARCHAR(45) NULL DEFAULT NULL,
  dataset_owner_email VARCHAR(45) NULL DEFAULT NULL,
  dataset_ID INT NOT NULL,
  PRIMARY KEY (dataset_owner_ID),
  INDEX dataset_owner_ID_idx (dataset_owner_ID ASC) VISIBLE,
  CONSTRAINT con_dataset_ID
    FOREIGN KEY (dataset_ID)
    REFERENCES WSSC_Data_Catalog.dataset(dataset_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

-- -----------------------------------------------------
-- Table WSSC_Data_Catalog.dataset_steward
-- -----------------------------------------------------
DROP TABLE IF EXISTS WSSC_Data_Catalog.dataset_steward ;

CREATE TABLE IF NOT EXISTS WSSC_Data_Catalog.dataset_steward (
  dataset_steward_ID INT NOT NULL AUTO_INCREMENT,
  dataset_steward_name VARCHAR(45) NULL DEFAULT NULL,
  dataset_steward_phone VARCHAR(45) NULL DEFAULT NULL,
  dataset_steward_email VARCHAR(45) NULL DEFAULT NULL,
  dataset_ID INT DEFAULT 0,
  PRIMARY KEY (dataset_steward_ID),
  INDEX dataset_ID_idx (dataset_ID ASC) VISIBLE,
  CONSTRAINT con2_dataset_ID
    FOREIGN KEY (dataset_ID)
    REFERENCES WSSC_Data_Catalog.dataset (dataset_ID))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

-- -----------------------------------------------------
-- Table WSSC_Data_Catalog.kpi_owner
-- -----------------------------------------------------
DROP TABLE IF EXISTS WSSC_Data_Catalog.kpi_owner ;

CREATE TABLE IF NOT EXISTS WSSC_Data_Catalog.kpi_owner (
  kpi_owner_ID INT NOT NULL AUTO_INCREMENT,
  kpi_owner_name VARCHAR(45) NULL DEFAULT NULL,
  kpi_owner_phone VARCHAR(45) NULL DEFAULT NULL,
  kpi_owner_email VARCHAR(45) NULL DEFAULT NULL,
  kpi_ID INT DEFAULT 0,
  PRIMARY KEY (kpi_owner_ID),
  INDEX kpi_ID_idx (kpi_ID ASC) VISIBLE,
  CONSTRAINT con_kpi_ID
    FOREIGN KEY (kpi_ID)
    REFERENCES WSSC_Data_Catalog.kpi (kpi_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table WSSC_Data_Catalog.permissions
-- -----------------------------------------------------
DROP TABLE IF EXISTS WSSC_Data_Catalog.permissions ;

CREATE TABLE IF NOT EXISTS WSSC_Data_Catalog.permissions (
  permission_ID INT NOT NULL AUTO_INCREMENT,
  permission_status VARCHAR(45) NULL DEFAULT NULL,
  dataset_ID INT NOT NULL,
  dataset_owner_ID INT NOT NULL,
  data_user_ID INT DEFAULT 0,
  date_granted DATE NULL DEFAULT NULL,
  date_expires DATE NULL DEFAULT NULL,
  dataset_steward_ID INT NOT NULL,
  PRIMARY KEY (permission_ID, dataset_owner_ID, data_user_ID, dataset_steward_ID),
  INDEX dataset_owner_ID_idx (dataset_owner_ID ASC) VISIBLE,
  INDEX data_user_ID_idx (data_user_ID ASC) VISIBLE,
  INDEX dataset_steward_ID_idx (dataset_steward_ID ASC) VISIBLE,
  CONSTRAINT con_dataset_owner_ID
    FOREIGN KEY (dataset_owner_ID)
    REFERENCES WSSC_Data_Catalog.dataset_owner (dataset_owner_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT con_data_user_ID
    FOREIGN KEY (data_user_ID)
    REFERENCES WSSC_Data_Catalog.data_user (dataset_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT con_dataset_steward_ID
    FOREIGN KEY (dataset_steward_ID)
    REFERENCES WSSC_Data_Catalog.dataset_steward (dataset_steward_ID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

INSERT INTO dataset (dataset_ID, dataset_name, dataset_owner_ID, dataset_steward_ID) VALUES
(2, 'Iris dataset', 1, 1),
(3, 'Car dataset', 2, 2),
(4, 'Faces dataset', 3, 3);

INSERT INTO dataset_owner (dataset_id, dataset_owner_ID, dataset_owner_name, dataset_owner_email, dataset_owner_phone) VALUES
(1, 1, 'Nicole Horvath', 'nh@email.com', '+123-456-7890'),
(2, 2, 'Ayanna Castro', 'ac@email.com', '+123-000-0000'),
(3, 3, 'Steve Nice', 'sn@email.com', '+172-349-8482');

INSERT INTO dataset_steward (dataset_steward_ID, dataset_steward_name, dataset_steward_email, dataset_steward_phone) VALUES
(1, 'Angela Ballard-Landers', 'abl@email.com', '+001-123-4567'),
(2, 'Paula Schisler', 'ps@email.com', '+999-999-9999'),
(3, 'Garry Barry', 'gb@email.com', '+166-656-8836');

INSERT INTO kpi (kpi_ID, kpi_name, kpi_owner_ID, kpi_description, permission_status, strategic_priority_ID) VALUES
(1, 'Education Programs (Number)', 1, 'The number of education programs offered by WSSC on a yearly basis. Measuring the reach to local schools and the ability to reach students in the local service area.', 'active', 1),
(2, 'Education Programs (Attendance)', 1, 'The number of youth WSSC has engaged with on an annual basis. Measuring the impact of WSSC free programs for local students that promote understanding of water as a valuable natural resource.', 'inactive', 1),
(3, 'DEI Offerings', 1, 'The number of WSSC employees that have engaged with Diversity, Equity and Inclusion offered programs. Measruing the number of opportunities provided to employees in relation to the number of employees who attended.', 'active', 5);

INSERT INTO kpi_owner (kpi_owner_ID, kpi_owner_name, kpi_owner_email, kpi_owner_phone) VALUES
(1, 'Nicole Horvath', 'nh@email.com', '+123-456-7890'),
(2, 'Ayanna Castro', 'ac@email.com', '+123-000-0000');

INSERT INTO permissions (permission_ID, permission_status, dataset_ID, dataset_owner_ID, dataset_steward_ID, date_granted, date_expires) VALUES
(1, 'active', 2, 1, 1, '2021-11-18', '2022-11-18'),
(2, 'inactive', 3, 2, 2, '2021-11-18', '2022-11-18'),
(3, 'pending', 4, 3, 3, '2021-11-18', '2022-11-18');

INSERT INTO strategic_priority (strategic_priority_ID, strategic_priority_name) VALUES
(1, 'Enhance Customer Experience'),
(2, 'Optimize Infrastructure'),
(3, 'Protect Our Resources'),
(4, 'Spend Customer Dollars Wisely'),
(5, 'Transform Employee Engagement');

INSERT INTO data_user (data_user_ID, data_user_name, permission_ID, data_user_phone, data_user_email) VALUES
(1, 'Jack Me', 1, '+190-283-7374', 'jm@email.com.com'),
(2, 'Kim Sparrow', 2, '+165-634-4894', 'sp@email.com'),
(3, 'Gary Swift', 3, '+145-688-7874', 'gs@email.com');


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
