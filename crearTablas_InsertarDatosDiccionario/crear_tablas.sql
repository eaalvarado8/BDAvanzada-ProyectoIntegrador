-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`ciudad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ciudad` (
  `idCiudad` INT NOT NULL COMMENT 'Identificador de la ciudad',
  `nombre` VARCHAR(100) NOT NULL COMMENT 'Es larepresentación gráfica de un centro poblado, ciudades cabeceras cantonales.',
  PRIMARY KEY (`idCiudad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`periodo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`periodo` (
  `idPeriodo` INT NOT NULL COMMENT 'Identificador del periodo',
  `valor_periodo` VARCHAR(100) NULL COMMENT 'Periodo en el que se realizo la encuesta',
  PRIMARY KEY (`idPeriodo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ViaAccesoPrincipalVivienda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ViaAccesoPrincipalVivienda` (
  `idViaAccesoPrincipalVivienda` INT NOT NULL COMMENT 'Identificador del la via de acceso principal a la vivienda',
  `opcion` VARCHAR(100) NULL COMMENT 'Opciones de la via de acceso principal a la vivienda',
  PRIMARY KEY (`idViaAccesoPrincipalVivienda`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TipoVivienda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TipoVivienda` (
  `idTipoVivienda` INT NOT NULL COMMENT 'Identificador del tipo de vivienda',
  `opcion` VARCHAR(100) NULL COMMENT 'TipoVivienda\n',
  PRIMARY KEY (`idTipoVivienda`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`vivienda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`vivienda` (
  `idVivienda` VARCHAR(25) NOT NULL COMMENT 'Identificador de la vivienda',
  `conglomerado` INT NULL COMMENT 'El concepto de conglomerados estará entendido como un conjunto de viviendas que cumplan cierta característica particular, principalmente la del número de viviendas. Para que las viviendas pertenezcan al mismo conjunto deben pertenecer a la misma parroquia (de acuerdo a la a la División Político Administrativa del Ecuador), además que cada parroquia estará dividida en dos tipos de zonas, la amanzanada y la dispersa.',
  `area` VARCHAR(45) NULL COMMENT 'Representa el sitio de estudio y esta dividido en dos partes:\nÁrea Urbana.- El área urbana para efectos de esta investigación está determinada por el núcleo urbano de las capitales provinciales, cabeceras cantonales y cabeceras parroquiales, que tengan una población de\n2.000 y más habitantes.\nÁrea Rural.- Se considera en esta alternativa las periferias de las cabeceras cantonales de 2.000 o más habitantes, las cabeceras cantonales con menos de 2.000 habitantes y sus periferias, así como las parroquias rurales, tanto en su parte amanzanada (menos de 2.000 habitantes) como en su área dispersa.',
  `numero` INT NULL COMMENT 'Número de vivienda, la vivienda puede ser una casa, un departamento, un cuarto, un grupo de cuartos, una choza, una cabaña o cualquier refugio ocupado o disponible, para ser utilizado como lugar de alojamiento.',
  `ciudad_idCiudad` INT NULL,
  `periodo_idPeriodo` INT NULL,
  `ViaAccesoPrincipalVivienda_idViaAccesoPrincipalVivienda` INT NULL,
  `TipoVivienda_idTipoVivienda` INT NULL,
  PRIMARY KEY (`idVivienda`),
  INDEX `fk_vivienda_ciudad_idx` (`ciudad_idCiudad` ASC) VISIBLE,
  INDEX `fk_vivienda_periodo1_idx` (`periodo_idPeriodo` ASC) VISIBLE,
  INDEX `fk_vivienda_ViaAccesoPrincipalVivienda1_idx` (`ViaAccesoPrincipalVivienda_idViaAccesoPrincipalVivienda` ASC) VISIBLE,
  INDEX `fk_vivienda_TipoVivienda1_idx` (`TipoVivienda_idTipoVivienda` ASC) VISIBLE,
  CONSTRAINT `fk_vivienda_ciudad`
    FOREIGN KEY (`ciudad_idCiudad`)
    REFERENCES `mydb`.`ciudad` (`idCiudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vivienda_periodo1`
    FOREIGN KEY (`periodo_idPeriodo`)
    REFERENCES `mydb`.`periodo` (`idPeriodo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vivienda_ViaAccesoPrincipalVivienda1`
    FOREIGN KEY (`ViaAccesoPrincipalVivienda_idViaAccesoPrincipalVivienda`)
    REFERENCES `mydb`.`ViaAccesoPrincipalVivienda` (`idViaAccesoPrincipalVivienda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vivienda_TipoVivienda1`
    FOREIGN KEY (`TipoVivienda_idTipoVivienda`)
    REFERENCES `mydb`.`TipoVivienda` (`idTipoVivienda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MaterialTechoCubierta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MaterialTechoCubierta` (
  `idMaterialTechoCubierta` INT NOT NULL COMMENT 'Identificador material techo cubierta',
  `opcion` VARCHAR(100) NULL COMMENT 'Opciones de materiales de techo cubierta',
  PRIMARY KEY (`idMaterialTechoCubierta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EstadoTecho`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EstadoTecho` (
  `idEstadoTecho` INT NOT NULL COMMENT 'Identificador del estado del techo',
  `opcion` VARCHAR(100) NULL COMMENT 'Opciones del estado del techo',
  PRIMARY KEY (`idEstadoTecho`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MaterialPiso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MaterialPiso` (
  `idMaterialPiso` INT NOT NULL COMMENT 'Identificador del material del piso',
  `opcion` VARCHAR(100) NULL COMMENT 'Opciones del material del piso',
  PRIMARY KEY (`idMaterialPiso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EstadoPiso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EstadoPiso` (
  `idEstadoPiso` INT NOT NULL COMMENT 'Identificador del estado del piso',
  `opcion` VARCHAR(100) NULL COMMENT 'Identificador de las opciones de estado del piso',
  PRIMARY KEY (`idEstadoPiso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MaterialParedes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MaterialParedes` (
  `idMaterialParedes` INT NOT NULL COMMENT 'Identificador del material de las paredes',
  `opcion` VARCHAR(100) NULL COMMENT 'Opciones del material de las paredes',
  PRIMARY KEY (`idMaterialParedes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EstadoParedes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EstadoParedes` (
  `idEstadoParedes` INT NOT NULL COMMENT 'Identificador del estado de las paredes',
  `opcion` VARCHAR(100) NULL COMMENT 'Opciones del estado de las paredes',
  PRIMARY KEY (`idEstadoParedes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MiembrosSinServicioHigienico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MiembrosSinServicioHigienico` (
  `idMiembrosSinServicioHigienico` INT NOT NULL COMMENT 'Identificador de lo que realizan los miembros del hogar sin acceso a servicio higienico',
  `opcion` VARCHAR(100) NULL COMMENT 'Puesto que mencionó que NO TIENE Servicio Higiénico, los miembros del hogar',
  PRIMARY KEY (`idMiembrosSinServicioHigienico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`InstalacionSanitariaPrincipal`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`InstalacionSanitariaPrincipal` (
  `idInstalacionSanitariaPrincipal` INT NOT NULL COMMENT 'Identificador de la instalacion sanitaria principal',
  `opcion` VARCHAR(100) NULL COMMENT 'Opciones de instalacion sanitaria principal',
  PRIMARY KEY (`idInstalacionSanitariaPrincipal`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TipoAguaVivienda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TipoAguaVivienda` (
  `idTipoAguaVivienda` INT NOT NULL COMMENT 'Identificador del tipo de agua que tiene el hogar',
  `opcion` VARCHAR(100) NULL COMMENT 'Opciones sobre el tipo de agua que tiene el hogar',
  PRIMARY KEY (`idTipoAguaVivienda`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`EliminacionBasura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`EliminacionBasura` (
  `idEliminacionBasura` INT NOT NULL COMMENT 'Identificador del tipo de eliminación de basura',
  `opcion` VARCHAR(100) NULL COMMENT 'Opciones sobre el tipo de eliminación de basura',
  PRIMARY KEY (`idEliminacionBasura`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FormaTenenciaVivienda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FormaTenenciaVivienda` (
  `idFormaTenenciaVivienda` INT NOT NULL COMMENT 'Identificación sobre la forma de tenecia de vivienda',
  `opcion` VARCHAR(100) NULL COMMENT 'Opciones sobre la forma de tenecia de vivienda',
  PRIMARY KEY (`idFormaTenenciaVivienda`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TipoServicioHigienico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TipoServicioHigienico` (
  `idTipoServicioHigienico` INT NOT NULL COMMENT 'Identificador sobre tipo de servicio higienico',
  `opcion` VARCHAR(100) NULL COMMENT 'Opciones sobre tipo de servicio higienico',
  PRIMARY KEY (`idTipoServicioHigienico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FuenteAgua`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FuenteAgua` (
  `idFuenteAgua` INT NOT NULL COMMENT 'Identificador de la fuente agua',
  `opcion` VARCHAR(100) NULL COMMENT 'Opciones de las fuentes de agua',
  PRIMARY KEY (`idFuenteAgua`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TipoAlumbrado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TipoAlumbrado` (
  `idTipoAlumbrado` INT NOT NULL COMMENT 'Identificador del tipo de alumbrado',
  `opcion` VARCHAR(100) NULL COMMENT 'Opciones del tipo de alumbrado',
  PRIMARY KEY (`idTipoAlumbrado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MaterialCocina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MaterialCocina` (
  `idMaterialCocina` INT NOT NULL COMMENT 'Identificador del material de Cocina',
  `opcion` VARCHAR(100) NULL COMMENT 'Opciones sobre el material que se usa para cocinar',
  PRIMARY KEY (`idMaterialCocina`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`ServicioDucha`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`ServicioDucha` (
  `idServicioDucha` INT NOT NULL,
  `opcion` VARCHAR(100) NULL,
  PRIMARY KEY (`idServicioDucha`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Hogar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Hogar` (
  `idHogar` VARCHAR(25) NOT NULL COMMENT 'Identificador del hogar',
  `NumVehiculos` INT NULL COMMENT 'Número de vehículos ',
  `tieneEspacioCocina` TINYINT NULL COMMENT 'El hogar tiene espacio de cocina',
  `NumMotos` INT NULL COMMENT 'Número de motos',
  `IncluyePagoAguaArriendo` TINYINT NULL COMMENT 'El arriendo del hogar incluye el pago de agua',
  `IncluyePagoLuzArriendo` TINYINT NULL COMMENT 'El arriendo del hogar incluye el pago de luz',
  `ValorArriendoMensual` DOUBLE NULL COMMENT 'Valor del arriendo mensual',
  `NumCuartos` INT NULL COMMENT 'Número de cuartos del hogar',
  `NumDormitorios` INT NULL COMMENT 'Número de dormitorios del hogar',
  `NumCuartosNegocio` INT NULL COMMENT 'Número de cuartos destinados para negocio',
  `MiembrosSinServicioHigienico_idMiembrosSinServicioHigienico` INT NULL,
  `InstalacionSanitariaPrincipal_idInstalacionSanitariaPrincipal` INT NULL,
  `TipoAguaVivienda_idTipoAguaVivienda` INT NULL,
  `EliminacionBasura_idEliminacionBasura` INT NULL,
  `FormaTenenciaVivienda_idFormaTenenciaVivienda` INT NULL,
  `TipoServicioHigienico_idTipoServicioHigienico` INT NULL,
  `MaterialPiso_idMaterialPiso` INT NULL,
  `MaterialParedes_idMaterialParedes` INT NULL,
  `MaterialTechoCubierta_idMaterialTechoCubierta` INT NULL,
  `EstadoPiso_idEstadoPiso` INT NULL,
  `EstadoParedes_idEstadoParedes` INT NULL,
  `EstadoTecho_idEstadoTecho` INT NULL,
  `FuenteAgua_idFuenteAgua` INT NULL,
  `TipoAlumbrado_idTipoAlumbrado` INT NULL,
  `MaterialCocina_idMaterialCocina` INT NULL,
  `ServicioDucha_idServicioDucha` INT NULL,
  `vivienda_idVivienda` VARCHAR(25) NULL,
  PRIMARY KEY (`idHogar`),
  INDEX `fk_Hogar_MiembrosSinServicioHigienico1_idx` (`MiembrosSinServicioHigienico_idMiembrosSinServicioHigienico` ASC) VISIBLE,
  INDEX `fk_Hogar_InstalacionSanitariaPrincipal1_idx` (`InstalacionSanitariaPrincipal_idInstalacionSanitariaPrincipal` ASC) VISIBLE,
  INDEX `fk_Hogar_TipoAguaVivienda1_idx` (`TipoAguaVivienda_idTipoAguaVivienda` ASC) VISIBLE,
  INDEX `fk_Hogar_EliminacionBasura1_idx` (`EliminacionBasura_idEliminacionBasura` ASC) VISIBLE,
  INDEX `fk_Hogar_ FormaTenenciaVivienda1_idx` (`FormaTenenciaVivienda_idFormaTenenciaVivienda` ASC) VISIBLE,
  INDEX `fk_Hogar_TipoServicioHigienico1_idx` (`TipoServicioHigienico_idTipoServicioHigienico` ASC) VISIBLE,
  INDEX `fk_Hogar_MaterialPiso1_idx` (`MaterialPiso_idMaterialPiso` ASC) VISIBLE,
  INDEX `fk_Hogar_MaterialParedes1_idx` (`MaterialParedes_idMaterialParedes` ASC) VISIBLE,
  INDEX `fk_Hogar_MaterialTechoCubierta1_idx` (`MaterialTechoCubierta_idMaterialTechoCubierta` ASC) VISIBLE,
  INDEX `fk_Hogar_EstadoPiso1_idx` (`EstadoPiso_idEstadoPiso` ASC) VISIBLE,
  INDEX `fk_Hogar_EstadoParedes1_idx` (`EstadoParedes_idEstadoParedes` ASC) VISIBLE,
  INDEX `fk_Hogar_EstadoTecho1_idx` (`EstadoTecho_idEstadoTecho` ASC) VISIBLE,
  INDEX `fk_Hogar_FuenteAgua1_idx` (`FuenteAgua_idFuenteAgua` ASC) VISIBLE,
  INDEX `fk_Hogar_TipoAlumbrado1_idx` (`TipoAlumbrado_idTipoAlumbrado` ASC) VISIBLE,
  INDEX `fk_Hogar_MaterialCocina1_idx` (`MaterialCocina_idMaterialCocina` ASC) VISIBLE,
  INDEX `fk_Hogar_ServicioDucha1_idx` (`ServicioDucha_idServicioDucha` ASC) VISIBLE,
  INDEX `fk_Hogar_vivienda1_idx` (`vivienda_idVivienda` ASC) VISIBLE,
  CONSTRAINT `fk_Hogar_MiembrosSinServicioHigienico1`
    FOREIGN KEY (`MiembrosSinServicioHigienico_idMiembrosSinServicioHigienico`)
    REFERENCES `mydb`.`MiembrosSinServicioHigienico` (`idMiembrosSinServicioHigienico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hogar_InstalacionSanitariaPrincipal1`
    FOREIGN KEY (`InstalacionSanitariaPrincipal_idInstalacionSanitariaPrincipal`)
    REFERENCES `mydb`.`InstalacionSanitariaPrincipal` (`idInstalacionSanitariaPrincipal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hogar_TipoAguaVivienda1`
    FOREIGN KEY (`TipoAguaVivienda_idTipoAguaVivienda`)
    REFERENCES `mydb`.`TipoAguaVivienda` (`idTipoAguaVivienda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hogar_EliminacionBasura1`
    FOREIGN KEY (`EliminacionBasura_idEliminacionBasura`)
    REFERENCES `mydb`.`EliminacionBasura` (`idEliminacionBasura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hogar_ FormaTenenciaVivienda1`
    FOREIGN KEY (`FormaTenenciaVivienda_idFormaTenenciaVivienda`)
    REFERENCES `mydb`.`FormaTenenciaVivienda` (`idFormaTenenciaVivienda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hogar_TipoServicioHigienico1`
    FOREIGN KEY (`TipoServicioHigienico_idTipoServicioHigienico`)
    REFERENCES `mydb`.`TipoServicioHigienico` (`idTipoServicioHigienico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hogar_MaterialPiso1`
    FOREIGN KEY (`MaterialPiso_idMaterialPiso`)
    REFERENCES `mydb`.`MaterialPiso` (`idMaterialPiso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hogar_MaterialParedes1`
    FOREIGN KEY (`MaterialParedes_idMaterialParedes`)
    REFERENCES `mydb`.`MaterialParedes` (`idMaterialParedes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hogar_MaterialTechoCubierta1`
    FOREIGN KEY (`MaterialTechoCubierta_idMaterialTechoCubierta`)
    REFERENCES `mydb`.`MaterialTechoCubierta` (`idMaterialTechoCubierta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hogar_EstadoPiso1`
    FOREIGN KEY (`EstadoPiso_idEstadoPiso`)
    REFERENCES `mydb`.`EstadoPiso` (`idEstadoPiso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hogar_EstadoParedes1`
    FOREIGN KEY (`EstadoParedes_idEstadoParedes`)
    REFERENCES `mydb`.`EstadoParedes` (`idEstadoParedes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hogar_EstadoTecho1`
    FOREIGN KEY (`EstadoTecho_idEstadoTecho`)
    REFERENCES `mydb`.`EstadoTecho` (`idEstadoTecho`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hogar_FuenteAgua1`
    FOREIGN KEY (`FuenteAgua_idFuenteAgua`)
    REFERENCES `mydb`.`FuenteAgua` (`idFuenteAgua`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hogar_TipoAlumbrado1`
    FOREIGN KEY (`TipoAlumbrado_idTipoAlumbrado`)
    REFERENCES `mydb`.`TipoAlumbrado` (`idTipoAlumbrado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hogar_MaterialCocina1`
    FOREIGN KEY (`MaterialCocina_idMaterialCocina`)
    REFERENCES `mydb`.`MaterialCocina` (`idMaterialCocina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hogar_ServicioDucha1`
    FOREIGN KEY (`ServicioDucha_idServicioDucha`)
    REFERENCES `mydb`.`ServicioDucha` (`idServicioDucha`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Hogar_vivienda1`
    FOREIGN KEY (`vivienda_idVivienda`)
    REFERENCES `mydb`.`vivienda` (`idVivienda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Combustible`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Combustible` (
  `idCombustible` INT NOT NULL COMMENT 'Identificador del combustible ',
  `combustible` VARCHAR(100) NULL COMMENT 'Tipo de combustible',
  PRIMARY KEY (`idCombustible`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`HogarCombustible`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`HogarCombustible` (
  `idHogarCombustible` INT NOT NULL AUTO_INCREMENT COMMENT 'Identificador del hogar y del combustible que utiliza',
  `Hogar_idHogar` VARCHAR(25) NULL COMMENT 'Identificador del hogar',
  `Combustible_idCombustible` INT NULL COMMENT 'Identificador del combustible',
  `gasto` DOUBLE NULL COMMENT 'Valor del gasto del hogar',
  PRIMARY KEY (`idHogarCombustible`),
  INDEX `fk_HogarCombustible_Hogar1_idx` (`Hogar_idHogar` ASC) VISIBLE,
  INDEX `fk_HogarCombustible_Combustible1_idx` (`Combustible_idCombustible` ASC) VISIBLE,
  CONSTRAINT `fk_HogarCombustible_Hogar1`
    FOREIGN KEY (`Hogar_idHogar`)
    REFERENCES `mydb`.`Hogar` (`idHogar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_HogarCombustible_Combustible1`
    FOREIGN KEY (`Combustible_idCombustible`)
    REFERENCES `mydb`.`Combustible` (`idCombustible`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
