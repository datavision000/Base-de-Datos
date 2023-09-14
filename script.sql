-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema prueba1409
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema prueba1409
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `prueba1409` DEFAULT CHARACTER SET utf8 ;
USE `prueba1409` ;

-- -----------------------------------------------------
-- Table `prueba1409`.`camionero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prueba1409`.`camionero` (
  `cedula` VARCHAR(8) NOT NULL,
  `nombre_completo` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(20) NOT NULL,
  `mail` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`cedula`),
  UNIQUE INDEX `mail_UNIQUE` (`mail` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prueba1409`.`almacen_central`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prueba1409`.`almacen_central` (
  `id_almacen_central` INT NOT NULL AUTO_INCREMENT,
  `direccion` VARCHAR(65) NOT NULL,
  `telefono` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_almacen_central`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prueba1409`.`lote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prueba1409`.`lote` (
  `id_lote` INT NOT NULL AUTO_INCREMENT,
  `cant_paquetes` INT NOT NULL,
  `tipo` VARCHAR(20) NOT NULL,
  `volumen` INT NOT NULL,
  `peso` INT NOT NULL,
  `fragil` VARCHAR(2) NOT NULL,
  `detalles` VARCHAR(150) NULL,
  `fecha_ideal_traslado` DATE NULL,
  `hora_ideal_traslado` TIME NULL,
  `almacen_central_id_almacen_central` INT NOT NULL,
  PRIMARY KEY (`id_lote`, `almacen_central_id_almacen_central`),
  INDEX `fk_lote_almacen_central1_idx` (`almacen_central_id_almacen_central` ASC) VISIBLE,
  CONSTRAINT `fk_lote_almacen_central1`
    FOREIGN KEY (`almacen_central_id_almacen_central`)
    REFERENCES `prueba1409`.`almacen_central` (`id_almacen_central`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prueba1409`.`camion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prueba1409`.`camion` (
  `id_camion` INT NOT NULL AUTO_INCREMENT,
  `matricula` VARCHAR(10) NOT NULL,
  `volumen_disponible` INT NOT NULL,
  `peso_soportado` INT NOT NULL,
  `estado` VARCHAR(20) NOT NULL,
  `lote_id_lote` INT NOT NULL,
  `almacen_central_id_almacen_central` INT NOT NULL,
  PRIMARY KEY (`id_camion`, `lote_id_lote`, `almacen_central_id_almacen_central`),
  UNIQUE INDEX `matricula_UNIQUE` (`matricula` ASC) VISIBLE,
  INDEX `fk_camion_lote1_idx` (`lote_id_lote` ASC) VISIBLE,
  INDEX `fk_camion_almacen_central1_idx` (`almacen_central_id_almacen_central` ASC) VISIBLE,
  CONSTRAINT `fk_camion_lote1`
    FOREIGN KEY (`lote_id_lote`)
    REFERENCES `prueba1409`.`lote` (`id_lote`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_camion_almacen_central1`
    FOREIGN KEY (`almacen_central_id_almacen_central`)
    REFERENCES `prueba1409`.`almacen_central` (`id_almacen_central`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prueba1409`.`maneja`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prueba1409`.`maneja` (
  `camionero_cedula` VARCHAR(8) NOT NULL,
  `camion_id_camion` INT NOT NULL,
  `hora_inicio_manejo` TIME NULL,
  `hora_fin_manejo` TIME NULL,
  `fecha_inicio_manejo` DATE NULL,
  `fecha_fin_manejo` DATE NULL,
  PRIMARY KEY (`camionero_cedula`, `camion_id_camion`),
  INDEX `fk_camionero_has_camion_camion1_idx` (`camion_id_camion` ASC) VISIBLE,
  INDEX `fk_camionero_has_camion_camionero_idx` (`camionero_cedula` ASC) VISIBLE,
  CONSTRAINT `fk_camionero_has_camion_camionero`
    FOREIGN KEY (`camionero_cedula`)
    REFERENCES `prueba1409`.`camionero` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_camionero_has_camion_camion1`
    FOREIGN KEY (`camion_id_camion`)
    REFERENCES `prueba1409`.`camion` (`id_camion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prueba1409`.`empresa_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prueba1409`.`empresa_cliente` (
  `rut` INT NOT NULL,
  `nombre_de_empresa` VARCHAR(45) NOT NULL,
  `mail` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`rut`),
  UNIQUE INDEX `mail_UNIQUE` (`mail` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prueba1409`.`almacen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prueba1409`.`almacen` (
  `id_almacen` INT NOT NULL AUTO_INCREMENT,
  `telefono` VARCHAR(20) NOT NULL,
  `direccion` VARCHAR(65) NOT NULL,
  `empresa_cliente_rut` INT NOT NULL,
  PRIMARY KEY (`id_almacen`, `empresa_cliente_rut`),
  INDEX `fk_almacen_empresa_cliente1_idx` (`empresa_cliente_rut` ASC) VISIBLE,
  CONSTRAINT `fk_almacen_empresa_cliente1`
    FOREIGN KEY (`empresa_cliente_rut`)
    REFERENCES `prueba1409`.`empresa_cliente` (`rut`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prueba1409`.`paquete`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prueba1409`.`paquete` (
  `id_paquete` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(30) NOT NULL,
  `volumen` VARCHAR(10) NOT NULL,
  `peso` VARCHAR(10) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `fragil` VARCHAR(2) NOT NULL,
  `detalles` VARCHAR(150) NULL,
  `mail_destinatario` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(20) NOT NULL,
  `lote_id_lote` INT NOT NULL,
  `almacen_id_almacen` INT NOT NULL,
  PRIMARY KEY (`id_paquete`, `lote_id_lote`, `almacen_id_almacen`),
  INDEX `fk_paquete_lote1_idx` (`lote_id_lote` ASC) VISIBLE,
  INDEX `fk_paquete_almacen1_idx` (`almacen_id_almacen` ASC) VISIBLE,
  CONSTRAINT `fk_paquete_lote1`
    FOREIGN KEY (`lote_id_lote`)
    REFERENCES `prueba1409`.`lote` (`id_lote`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_paquete_almacen1`
    FOREIGN KEY (`almacen_id_almacen`)
    REFERENCES `prueba1409`.`almacen` (`id_almacen`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prueba1409`.`plataforma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prueba1409`.`plataforma` (
  `id_plataforma` INT NOT NULL AUTO_INCREMENT,
  `direccion` VARCHAR(65) NOT NULL,
  `volumen_maximo` INT NOT NULL,
  `telefono` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_plataforma`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
