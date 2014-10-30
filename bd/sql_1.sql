SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `sitap` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `sitap` ;

-- -----------------------------------------------------
-- Table `sitap`.`tbl_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sitap`.`tbl_usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(35) NULL,
  `senha` VARCHAR(30) NULL,
  `email` VARCHAR(40) NULL,
  `foto` VARCHAR(45) NULL,
  `sexo` VARCHAR(45) NULL,
  `cidade` VARCHAR(45) NULL,
  `estado` VARCHAR(45) NULL,
  `endereco` VARCHAR(45) NULL,
  `cep` VARCHAR(45) NULL,
  PRIMARY KEY (`idusuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`tbl_admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sitap`.`tbl_admin` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `senha` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`tbl_artigo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sitap`.`tbl_artigo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NULL,
  `corpo` TEXT NULL,
  `data` DATETIME NULL,
  `idusuario` INT NOT NULL,
  `like` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tbl_artigo_tbl_usuario1_idx` (`idusuario` ASC),
  CONSTRAINT `fk_tbl_artigo_tbl_usuario1`
    FOREIGN KEY (`idusuario`)
    REFERENCES `sitap`.`tbl_usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`tbl_fotos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sitap`.`tbl_fotos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fotos` VARCHAR(60) NULL,
  `idartigo` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tbl_fotos_tbl_artigo1_idx` (`idartigo` ASC),
  CONSTRAINT `fk_tbl_fotos_tbl_artigo1`
    FOREIGN KEY (`idartigo`)
    REFERENCES `sitap`.`tbl_artigo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`tbl_artigo_fotos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sitap`.`tbl_artigo_fotos` (
  `tbl_artigo_id` INT NOT NULL,
  `tbl_fotos_id` INT NOT NULL,
  PRIMARY KEY (`tbl_artigo_id`, `tbl_fotos_id`),
  INDEX `fk_tbl_artigo_has_tbl_fotos_tbl_fotos1_idx` (`tbl_fotos_id` ASC),
  INDEX `fk_tbl_artigo_has_tbl_fotos_tbl_artigo1_idx` (`tbl_artigo_id` ASC),
  CONSTRAINT `fk_tbl_artigo_has_tbl_fotos_tbl_artigo1`
    FOREIGN KEY (`tbl_artigo_id`)
    REFERENCES `sitap`.`tbl_artigo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_artigo_has_tbl_fotos_tbl_fotos1`
    FOREIGN KEY (`tbl_fotos_id`)
    REFERENCES `sitap`.`tbl_fotos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`tbl_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sitap`.`tbl_categoria` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `descricao` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`tbl_categoria_artigo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sitap`.`tbl_categoria_artigo` (
  `tbl_categoria_id` INT NOT NULL,
  `tbl_artigo_id` INT NOT NULL,
  PRIMARY KEY (`tbl_categoria_id`, `tbl_artigo_id`),
  INDEX `fk_tbl_categoria_has_tbl_artigo_tbl_artigo1_idx` (`tbl_artigo_id` ASC),
  INDEX `fk_tbl_categoria_has_tbl_artigo_tbl_categoria1_idx` (`tbl_categoria_id` ASC),
  CONSTRAINT `fk_tbl_categoria_has_tbl_artigo_tbl_categoria1`
    FOREIGN KEY (`tbl_categoria_id`)
    REFERENCES `sitap`.`tbl_categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_categoria_has_tbl_artigo_tbl_artigo1`
    FOREIGN KEY (`tbl_artigo_id`)
    REFERENCES `sitap`.`tbl_artigo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `sitap`.`tbl_comentario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sitap`.`tbl_comentario` (
  `idcomentario` INT NOT NULL AUTO_INCREMENT,
  `idusuario` INT NOT NULL,
  `idartigo` INT NOT NULL,
  `corpo` VARCHAR(45) NULL,
  `data` DATETIME NULL,
  INDEX `fk_tbl_artigo_has_tbl_usuario_tbl_usuario1_idx` (`idusuario` ASC),
  INDEX `fk_tbl_comentario_tbl_artigo1_idx` (`idartigo` ASC),
  PRIMARY KEY (`idcomentario`),
  CONSTRAINT `fk_tbl_artigo_has_tbl_usuario_tbl_usuario1`
    FOREIGN KEY (`idusuario`)
    REFERENCES `sitap`.`tbl_usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_comentario_tbl_artigo1`
    FOREIGN KEY (`idartigo`)
    REFERENCES `sitap`.`tbl_artigo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
