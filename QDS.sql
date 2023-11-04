CREATE DATABASE `QDS`;
USE `QDS`;

-- Creacion de las estructuras de las tablas

CREATE TABLE `almacen_central` (
  `id_almacen_central` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `numero_almacen` int UNIQUE NOT NULL,
  `telefono` varchar(20) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `almacen_cliente` (
  `id_almacen_cliente` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `telefono` varchar(20) NOT NULL UNIQUE,
  `direccion` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `plataforma` (
  `id_plataforma` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `direccion` varchar(65) NOT NULL,
  `volumen_maximo` int NOT NULL,
  `ubicacion` int NOT NULL,
  `telefono` varchar(20) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `vehiculo` (
  `id_vehiculo` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `matricula` varchar(8) NOT NULL UNIQUE,
  `volumen_disponible` int NOT NULL,
  `peso_soportado` int NOT NULL,
  `estado` varchar(20) DEFAULT 'Disponible' NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `camion` (
  `id_camion` int NOT NULL PRIMARY KEY
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `camioneta` (
  `id_camioneta` int NOT NULL PRIMARY KEY
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `camionero` (
  `id_camionero` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `cedula` varchar(8) UNIQUE NOT NULL,
  `nombre_completo` varchar(45) NOT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `mail` varchar(45) NOT NULL UNIQUE,
  `telefono` varchar(20) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `empresa_cliente` (
  `id_empresa_cliente` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `rut` bigint(12) NOT NULL,
  `nombre_de_empresa` varchar(50) NOT NULL,
  `mail` varchar(45) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `lote` (
  `id_lote` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `cant_paquetes` int DEFAULT '0',
  `tipo` varchar(20) DEFAULT NULL,
  `estado` varchar(35) DEFAULT 'En almacén central',
  `volumen` int DEFAULT '0',
  `peso` int DEFAULT '0',
  `fragil` varchar(2) NOT NULL,
  `detalles` varchar(150) DEFAULT NULL,
  `fecha_ideal_traslado` date DEFAULT NULL,
  `hora_ideal_traslado` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `paquete` (
  `id_paquete` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `codigo_seguimiento` varchar (12) UNIQUE NOT NULL,
  `tipo` varchar(30) DEFAULT NULL,
  `volumen` varchar(10) NOT NULL,
  `peso` varchar(10) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `fragil` varchar(2) NOT NULL,
  `detalles` varchar(150) DEFAULT NULL,
  `mail_destinatario` varchar(45) NOT NULL,
  `estado` varchar(35) DEFAULT 'En almacén cliente',
  `id_destino` int NOT NULL,
  `fecha_recibido` date DEFAULT NULL,
  `hora_recibido` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `destino_paquete` (
  `id_destino` int NOT NULL AUTO_INCREMENT,
  `departamento_destino` varchar(30) NOT NULL,
  `ciudad_destino` varchar(35) NOT NULL,
  PRIMARY KEY (`id_destino`, `departamento_destino`, `ciudad_destino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `trayecto` (
  `id_trayecto` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `destino` varchar(80) NOT NULL,
  `destinos_intermedios` MEDIUMTEXT DEFAULT NULL,
  `distancia_recorrida` int NOT NULL,
  `duracion_total` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `trayecto_departamentos` (
  `id_trayecto` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `departamento_atravesado` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `login` (
  `nom_usu` varchar(30) NOT NULL PRIMARY KEY,
  `mail` varchar(45) NOT NULL UNIQUE,
  `tipo_usu` varchar(30) NOT NULL,
  `contrasenia` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `tiene` (
	`id_almacen_cliente` int PRIMARY KEY NOT NULL,
  `id_empresa_cliente` int NOT NULL
);

CREATE TABLE `almacena` (
	`id_paquete` int PRIMARY KEY NOT NULL,
  `id_almacen_cliente` int NOT NULL
);

CREATE TABLE `forma` (
	`id_paquete` int PRIMARY KEY NOT NULL,
  `id_lote` int NOT NULL
);

CREATE TABLE `almacena1` (
	`id_lote` int PRIMARY KEY NOT NULL,
  `id_almacen_central` int NOT NULL
);

CREATE TABLE `maneja` (
	`id_vehiculo` int NOT NULL,
    `id_camionero` int NOT NULL,
   `fecha_inicio_manejo` DATE NOT NULL,
    `hora_inicio_manejo` TIME NOT NULL,
    `fecha_fin_manejo` DATE NOT NULL,
    `hora_fin_manejo` TIME NOT NULL,
    PRIMARY KEY (id_vehiculo, id_camionero)
);

CREATE TABLE `transporta` (
	`id_lote` int PRIMARY KEY NOT NULL,
  `id_camion` int NOT NULL
);

CREATE TABLE `llega` (
	`id_trayecto` int NOT NULL,
  `id_plataforma` int NOT NULL,
   PRIMARY KEY (id_trayecto, id_plataforma)
);

CREATE TABLE `lleva` (
	`id_lote` int PRIMARY KEY NOT NULL,
  `id_plataforma` int NOT NULL,
  `fecha_llegada` date DEFAULT NULL,
  `hora_llegada` time DEFAULT NULL
);

CREATE TABLE `recoge` (
	`id_camioneta` int NOT NULL,
  `id_almacen_cliente` int NOT NULL,
  `fecha_recogida_ideal` date NOT NULL,
  `hora_recogida_ideal` time NOT NULL,
  `fecha_recogida` date DEFAULT NULL,
  `hora_recogida` time DEFAULT NULL,
  `fecha_salida` date NOT NULL,
  `hora_salida` time NOT NULL,
  `almacen_central_salida` int NOT NULL,
  PRIMARY KEY (id_camioneta, id_almacen_cliente, fecha_recogida_ideal, hora_recogida_ideal, fecha_salida, hora_salida, almacen_central_salida)
);

-- Constraints de tipo Foreign Key

ALTER TABLE `camion`
    ADD CONSTRAINT `fk_id_camion` FOREIGN KEY (id_camion) REFERENCES vehiculo(id_vehiculo) ON DELETE NO ACTION ON UPDATE NO ACTION;
  
ALTER TABLE `camioneta`
    ADD CONSTRAINT `fk_id_camioneta` FOREIGN KEY (id_camioneta) REFERENCES vehiculo(id_vehiculo) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `tiene`
    ADD CONSTRAINT `fk_id_almacen_cliente` FOREIGN KEY (id_almacen_cliente) REFERENCES almacen_cliente(id_almacen_cliente) ON DELETE NO ACTION ON UPDATE NO ACTION,
    ADD CONSTRAINT `fk_id_empresa_cliente` FOREIGN KEY (id_empresa_cliente) REFERENCES empresa_cliente(id_empresa_cliente) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `almacena`
    ADD CONSTRAINT `fk_id_paquete` FOREIGN KEY (id_paquete) REFERENCES paquete(id_paquete) ON DELETE NO ACTION ON UPDATE NO ACTION,
    ADD CONSTRAINT `fk_id_almacen_cliente2` FOREIGN KEY (id_almacen_cliente) REFERENCES almacen_cliente(id_almacen_cliente) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `forma`
    ADD CONSTRAINT `fk_id_paquete2` FOREIGN KEY (id_paquete) REFERENCES paquete(id_paquete) ON DELETE NO ACTION ON UPDATE NO ACTION,
    ADD CONSTRAINT `fk_id_lote` FOREIGN KEY (id_lote) REFERENCES lote(id_lote) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `almacena1`
    ADD CONSTRAINT `fk_id_lote2` FOREIGN KEY (id_lote) REFERENCES lote(id_lote) ON DELETE NO ACTION ON UPDATE NO ACTION,
    ADD CONSTRAINT `fk_id_almacen_central` FOREIGN KEY (id_almacen_central) REFERENCES almacen_central(id_almacen_central) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `maneja`
    ADD CONSTRAINT `fk_id_vehiculo` FOREIGN KEY (id_vehiculo) REFERENCES vehiculo(id_vehiculo) ON DELETE NO ACTION ON UPDATE NO ACTION,
    ADD CONSTRAINT `fk_id_camionero` FOREIGN KEY (id_camionero) REFERENCES camionero(id_camionero) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `transporta`
    ADD CONSTRAINT `fk_id_lote3` FOREIGN KEY (id_lote) REFERENCES lote(id_lote) ON DELETE NO ACTION ON UPDATE NO ACTION,
    ADD CONSTRAINT `fk_id_camion2` FOREIGN KEY (id_camion) REFERENCES camion(id_camion) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `llega`
    ADD CONSTRAINT `fk_id_trayecto3` FOREIGN KEY (id_trayecto) REFERENCES trayecto(id_trayecto) ON DELETE NO ACTION ON UPDATE NO ACTION,
    ADD CONSTRAINT `fk_id_plataforma2` FOREIGN KEY (id_plataforma) REFERENCES plataforma(id_plataforma) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `lleva`
    ADD CONSTRAINT `fk_id_lote4` FOREIGN KEY (id_lote) REFERENCES transporta(id_lote) ON DELETE NO ACTION ON UPDATE NO ACTION,
    ADD CONSTRAINT `fk_id_plataforma` FOREIGN KEY (id_plataforma) REFERENCES plataforma(id_plataforma) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `recoge`
  ADD CONSTRAINT `fk_id_camioneta2` FOREIGN KEY (id_camioneta) REFERENCES camioneta(id_camioneta) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_almacen_cliente3` FOREIGN KEY (id_almacen_cliente) REFERENCES almacen_cliente(id_almacen_cliente) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_almacen_central_salida` FOREIGN KEY (almacen_central_salida) REFERENCES almacen_central(id_almacen_central) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `paquete`
  ADD KEY `id_destino` (`id_destino`),
  ADD CONSTRAINT `fk_destino_paquete` FOREIGN KEY (`id_destino`) REFERENCES `destino_paquete` (`id_destino`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `plataforma`
  ADD CONSTRAINT `fk_ubicacion_plataforma` FOREIGN KEY (`ubicacion`) REFERENCES `destino_paquete` (`id_destino`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `trayecto_departamentos`
  ADD KEY `id_trayecto` (`id_trayecto`),
  ADD CONSTRAINT `fk_trayecto_departamentos` FOREIGN KEY (`id_trayecto`) REFERENCES `trayecto` (`id_trayecto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Constraints de tipo Check

ALTER TABLE `vehiculo`
  ADD CONSTRAINT `chk_matricula_formato`
  CHECK (`matricula` REGEXP '^[A-S]T[MP]-[0-9][0-9][0-9][0-9]$');

ALTER TABLE `camionero`
  ADD CONSTRAINT `chk_correo_electronico`
  CHECK (`mail` REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$');
 
ALTER TABLE `login`
  ADD CONSTRAINT `chk_correo_electronico2`
  CHECK (`mail` REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$');
 
ALTER TABLE `paquete`
  ADD CONSTRAINT `chk_correo_electronico3`
  CHECK (`mail_destinatario` REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$');
 
ALTER TABLE `empresa_cliente`
  ADD CONSTRAINT `chk_correo_electronico4`
  CHECK (`mail` REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$');

ALTER TABLE `lote`
  ADD CONSTRAINT `chk_valores_permitidos_tipo`
  CHECK (`tipo` IN (NULL, 'Vidrio', 'Líquido', 'Inflamable')),
  ADD CONSTRAINT `chk_valores_permitidos_fragil`
  CHECK (`fragil` IN ('Si', 'No'));

ALTER TABLE `paquete`
  ADD CONSTRAINT `chk_valores_permitidos_tipo2`
  CHECK (`tipo` IN (NULL, 'Vidrio', 'Líquido', 'Inflamable')),
  ADD CONSTRAINT `chk_valores_permitidos_fragil2`
  CHECK (`fragil` IN ('Si', 'No'));

ALTER TABLE `login`
  ADD CONSTRAINT `chk_valores_permitidos_tipo_usu`
  CHECK (`tipo_usu` IN ('admin', 'almacenero', 'camionero', 'empresa'));


ALTER TABLE `paquete`
  ADD CONSTRAINT `chk_paquete_positivo_peso`
  CHECK (`peso` >= 0);

ALTER TABLE `paquete`
  ADD CONSTRAINT `chk_paquete_positivo_volumen`
  CHECK (`volumen` >= 0);

ALTER TABLE `lote`
  ADD CONSTRAINT `chk_lote_positivo_peso`
  CHECK (`peso` >= 0);

ALTER TABLE `lote`
  ADD CONSTRAINT `chk_lote_positivo_volumen`
  CHECK (`volumen` >= 0);

ALTER TABLE `lote`
  ADD CONSTRAINT `chk_lote_cant_paquetes`
  CHECK (`cant_paquetes` >= 0);

ALTER TABLE `paquete`
  ADD CONSTRAINT `chk_valores_permitidos_estado_paquete`
  CHECK (`estado` IN ('En almacén cliente', 'En camioneta (central)', 'En almacén central',
  'En almacén central (lote)', 'En almacén central (camión)', 'En camión (plataforma)', 'Entregado'));

ALTER TABLE `lote`
  ADD CONSTRAINT `chk_valores_permitidos_estado_lote`
  CHECK (`estado` IN ('En almacén central', 'En almacén central (camión)', 'En camión (plataforma)', 'Entregado'));


-- Creación de triggers

DELIMITER //
CREATE TRIGGER `tr_actualizar_lote`
AFTER INSERT
ON `transporta`
FOR EACH ROW
BEGIN
  UPDATE `lote`
  SET estado = 'En almacén central (camión)'
  WHERE id_lote = NEW.id_lote;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER `tr_actualizar_lote2`
AFTER DELETE
ON `transporta`
FOR EACH ROW
BEGIN
  UPDATE `lote`
  SET estado = 'En almacén central'
  WHERE id_lote = OLD.id_lote;
END;
//
DELIMITER ;

/*

DELIMITER //
CREATE TRIGGER `tr_actualizar_estado_lote`
BEFORE UPDATE
ON `lote`
FOR EACH ROW
BEGIN
    IF NEW.fecha_recibido IS NOT NULL AND OLD.fecha_recibido IS NULL
    THEN
        SET NEW.estado = 'Entregado';
    END IF;
END;
//
DELIMITER ;

*/


/*
CREATE TRIGGER tr_actualizar_paquetes
BEFORE UPDATE ON lote
FOR EACH ROW
BEGIN
    -- Verificar si el estado de lote ha cambiado a "Entregado"
    IF NEW.estado = 'Entregado' AND OLD.estado != 'Entregado'
    THEN
        -- Actualizar el estado de los paquetes asociados
        UPDATE paquete
        SET estado = 'Entregado'
        WHERE id_lote = NEW.id_lote;
    END IF;
END;
*/

DELIMITER //
CREATE TRIGGER `estado_paquete1`
AFTER INSERT
ON `forma`
FOR EACH ROW
BEGIN
  UPDATE `paquete`
  SET estado = 'En almacén central (lote)'
  WHERE id_paquete = NEW.id_paquete;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER `estado_paquete2`
AFTER DELETE
ON `forma`
FOR EACH ROW
BEGIN
  UPDATE `paquete`
  SET estado = 'En almacén central'
  WHERE id_paquete = OLD.id_paquete;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER `suma_peso_lote`
AFTER INSERT
ON `forma`
FOR EACH ROW
BEGIN
  SET @total_peso := (
    SELECT SUM(CAST(paquete.peso AS SIGNED))
    FROM `paquete`
    WHERE paquete.id_paquete = NEW.id_paquete
  );

  UPDATE `lote`
  SET peso = peso + @total_peso
  WHERE lote.id_lote = NEW.id_lote;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER `resta_peso_lote`
AFTER DELETE
ON `forma`
FOR EACH ROW
BEGIN
  SET @total_peso := (
    SELECT SUM(CAST(paquete.peso AS SIGNED))
    FROM `paquete`
    WHERE paquete.id_paquete = OLD.id_paquete
  );

  UPDATE `lote`
  SET peso = peso - @total_peso
  WHERE lote.id_lote = OLD.id_lote;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER `suma_volumen_lote`
AFTER INSERT
ON `forma`
FOR EACH ROW
BEGIN
  SET @total_volumen := (
    SELECT SUM(CAST(paquete.volumen AS SIGNED))
    FROM `paquete`
    WHERE paquete.id_paquete = NEW.id_paquete
  );

  UPDATE `lote`
  SET volumen = volumen + @total_volumen
  WHERE lote.id_lote = NEW.id_lote;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER `resta_volumen_lote`
AFTER DELETE
ON `forma`
FOR EACH ROW
BEGIN
  SET @total_volumen := (
    SELECT SUM(CAST(paquete.volumen AS SIGNED))
    FROM `paquete`
    WHERE paquete.id_paquete = OLD.id_paquete
  );

  UPDATE `lote`
  SET volumen = volumen - @total_volumen
  WHERE lote.id_lote = OLD.id_lote;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER `cant_paquetes_lote_agregar`
AFTER INSERT
ON `forma`
FOR EACH ROW
BEGIN
  UPDATE `lote`
  SET cant_paquetes = (
    SELECT COUNT(*)
    FROM `forma`
    WHERE id_lote = NEW.id_lote
  )
  WHERE lote.id_lote = NEW.id_lote;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER `cant_paquetes_lote_eliminar`
AFTER DELETE
ON `forma`
FOR EACH ROW
BEGIN
  UPDATE `lote`
  SET cant_paquetes = (
    SELECT COUNT(*)
    FROM `forma`
    WHERE id_lote = OLD.id_lote
  )
  WHERE lote.id_lote = OLD.id_lote;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER `evita_duplicados_camion`
BEFORE INSERT ON camion
FOR EACH ROW
BEGIN
    DECLARE vehiculo_existente INT;
  
    SELECT COUNT(*) INTO vehiculo_existente
    FROM camioneta
    WHERE id_camioneta = NEW.id_camion;

    IF vehiculo_existente > 0 THEN
        SIGNAL SQLSTATE '45000';
    END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER `evita_duplicados_camioneta`
BEFORE INSERT ON camioneta
FOR EACH ROW
BEGIN
    DECLARE vehiculo_existente INT;
    
    SELECT COUNT(*) INTO vehiculo_existente
    FROM camion
    WHERE id_camion = NEW.id_camioneta;

    IF vehiculo_existente > 0 THEN
        SIGNAL SQLSTATE '45000';
    END IF;
END;
//
DELIMITER ;