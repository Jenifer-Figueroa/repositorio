-- MySQL Script generated by MySQL Workbench
-- Thu Nov  5 01:55:07 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema sensegaming
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema sensegaming
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `sensegaming` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci ;
USE `sensegaming` ;

-- -----------------------------------------------------
-- Table `sensegaming`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sensegaming`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `sensegaming`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sensegaming`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `precio` INT NOT NULL,
  `descripcion` VARCHAR(400) NOT NULL,
  `imagen` VARCHAR(100) NOT NULL,
  `id_categoria` INT NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_categoria_idx` (`id_categoria` ASC) VISIBLE,
  CONSTRAINT `id_categoria`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `sensegaming`.`categories` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `sensegaming`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sensegaming`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `avatar` VARCHAR(45) NOT NULL,
  `rol` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(100) NULL DEFAULT NULL,
  `localidad` VARCHAR(45) NULL DEFAULT NULL,
  `provincia` VARCHAR(45) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `sensegaming`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sensegaming`.`cart` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_user` INT NOT NULL,
  `id_product` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `cantidad` INT NOT NULL,
  `remito` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_user_idx` (`id_user` ASC) VISIBLE,
  INDEX `id_product_idx` (`id_product` ASC) VISIBLE,
  CONSTRAINT `id_product`
    FOREIGN KEY (`id_product`)
    REFERENCES `sensegaming`.`products` (`id`),
  CONSTRAINT `id_user`
    FOREIGN KEY (`id_user`)
    REFERENCES `sensegaming`.`users` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
