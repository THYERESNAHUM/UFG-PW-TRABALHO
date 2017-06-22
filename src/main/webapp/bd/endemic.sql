SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `dbendemic` DEFAULT CHARACTER SET utf8 ;
USE `dbendemic` ;

-- -----------------------------------------------------
-- Table `dbendemic`.`denuncia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbendemic`.`denuncia` (
  `iddenuncia` INT(11) NOT NULL AUTO_INCREMENT,
  `data_denuncia` DATETIME NOT NULL,
  `bairro` VARCHAR(30) NOT NULL,
  `rua` VARCHAR(45) NOT NULL,
  `quadra` VARCHAR(5) NULL DEFAULT NULL,
  `lote` VARCHAR(5) NULL DEFAULT NULL,
  `numero` VARCHAR(5) NULL DEFAULT NULL,
  `cidade` VARCHAR(30) NOT NULL,
  `tp_imovel` VARCHAR(15) NOT NULL,
  `desc_den` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`iddenuncia`),
  UNIQUE INDEX `iddenuncia_UNIQUE` (`iddenuncia` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `dbendemic`.`funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbendemic`.`funcionario` (
  `idfuncionario` INT(11) NOT NULL AUTO_INCREMENT,
  `matricula` VARCHAR(10) NOT NULL,
  `nome` VARCHAR(60) NOT NULL,
  `funcao` VARCHAR(20) NOT NULL,
  `email` VARCHAR(30) NULL DEFAULT NULL,
  `senha` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idfuncionario`),
  UNIQUE INDEX `matricula_UNIQUE` (`matricula` ASC),
  UNIQUE INDEX `idfuncionario_UNIQUE` (`idfuncionario` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `dbendemic`.`visita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbendemic`.`visita` (
  `idvisita` INT(11) NOT NULL AUTO_INCREMENT,
  `agente` VARCHAR(60) NOT NULL,
  `data_visita` DATETIME NOT NULL,
  `bairro` VARCHAR(30) NOT NULL,
  `rua` VARCHAR(45) NOT NULL,
  `quadra` VARCHAR(5) NOT NULL,
  `lote` INT(11) NOT NULL,
  `numero` VARCHAR(5) NOT NULL,
  `cep` INT(11) NOT NULL,
  `cidade` VARCHAR(30) NOT NULL,
  `latitude` VARCHAR(20) NULL DEFAULT NULL,
  `longitude` VARCHAR(20) NULL DEFAULT NULL,
  `tp_imovel` VARCHAR(15) NOT NULL,
  `estagio` VARCHAR(10) NOT NULL,
  `tp_larvicida` VARCHAR(10) NOT NULL,
  `ac_corretiva` VARCHAR(15) NOT NULL,
  `local_foco` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idvisita`),
  UNIQUE INDEX `idvisita_UNIQUE` (`idvisita` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
