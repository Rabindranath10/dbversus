-- MySQL Script generated by MySQL Workbench
-- Wed May 29 10:17:17 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema cafeteria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cafeteria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cafeteria` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `cafeteria` ;

-- -----------------------------------------------------
-- Table `cafeteria`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cafeteria`.`categorias` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(145) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cafeteria`.`ordenes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cafeteria`.`ordenes` (
  `id` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `total` DECIMAL(8,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cafeteria`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cafeteria`.`productos` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(145) NOT NULL,
  `precio` DECIMAL(8,2) NULL DEFAULT '0.00',
  `idCategoria` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fkcategoria_idx` (`idCategoria` ASC) VISIBLE,
  CONSTRAINT `fkcategoria`
    FOREIGN KEY (`idCategoria`)
    REFERENCES `cafeteria`.`categorias` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `cafeteria`.`detalleordenes`  OJO LLEVA S AL FINAL POR SEQUELIZE
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cafeteria`.`detalleordenes` (
  `idorden` INT NOT NULL,
  `idproducto` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `precio` DECIMAL(8,2) NOT NULL,
  PRIMARY KEY (`idorden`, `idproducto`),
  INDEX `fkproductos_idx` (`idproducto` ASC) VISIBLE,
  CONSTRAINT `fkordenes`
    FOREIGN KEY (`idorden`)
    REFERENCES `cafeteria`.`ordenes` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fkproductos`
    FOREIGN KEY (`idproducto`)
    REFERENCES `cafeteria`.`productos` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
