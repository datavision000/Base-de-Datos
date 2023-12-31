CREATE DATABASE QDS;
USE QDS;

-- Borrado de tablas

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `almacen_central`;
DROP TABLE IF EXISTS `almacen_cliente`;
DROP TABLE IF EXISTS `plataforma`;
DROP TABLE IF EXISTS `vehiculo`;
DROP TABLE IF EXISTS `camion`;
DROP TABLE IF EXISTS `camioneta`;
DROP TABLE IF EXISTS `camionero`;
DROP TABLE IF EXISTS `almacena`;
DROP TABLE IF EXISTS `almacena1`;
DROP TABLE IF EXISTS `destino`;
DROP TABLE IF EXISTS `empresa_cliente`;
DROP TABLE IF EXISTS `forma`;
DROP TABLE IF EXISTS `lleva`;
DROP TABLE IF EXISTS `login`;
DROP TABLE IF EXISTS `lote`;
DROP TABLE IF EXISTS `maneja`;
DROP TABLE IF EXISTS `paquete`;
DROP TABLE IF EXISTS `recoge`;
DROP TABLE IF EXISTS `solicitud`;
DROP TABLE IF EXISTS `tiene`;
DROP TABLE IF EXISTS `transporta`;
DROP TABLE IF EXISTS `mensaje`;
DROP VIEW IF EXISTS `mostrar_camiones`;
DROP VIEW IF EXISTS `mostrar_camionetas`;
DROP VIEW IF EXISTS `mostrar_lotes`;
DROP VIEW IF EXISTS `mostrar_paquetes_empresa`;

SET FOREIGN_KEY_CHECKS = 1;

-- Creacion de las estructuras de las tablas

CREATE TABLE `almacen_central` (
  `id_almacen_central` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `numero_almacen` int UNIQUE NOT NULL,
  `telefono` varchar(20) NOT NULL UNIQUE,
  `estado` varchar(7) DEFAULT 'En uso' NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `almacen_cliente` (
  `id_almacen_cliente` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `telefono` varchar(20) NOT NULL UNIQUE,
  `direccion` varchar(65) NOT NULL,
  `estado` varchar(7) DEFAULT 'En uso' NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `plataforma` (
  `id_plataforma` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `direccion` varchar(65) NOT NULL,
  `volumen_maximo` int NOT NULL,
  `ubicacion` int NOT NULL,
  `telefono` varchar(20) NOT NULL UNIQUE,
  `estado` varchar(7) DEFAULT 'En uso' NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `vehiculo` (
  `id_vehiculo` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `matricula` varchar(8) NOT NULL UNIQUE,
  `volumen_maximo` int NOT NULL,
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
  `estado` varchar(20) DEFAULT 'Disponible',
  `mail` varchar(45) NOT NULL UNIQUE,
  `telefono` varchar(20) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `empresa_cliente` (
  `id_empresa_cliente` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `rut` varchar(12) NOT NULL,
  `nombre_de_empresa` varchar(50) NOT NULL,
  `mail` varchar(45) NOT NULL UNIQUE,
  `estado` varchar(10) DEFAULT 'Disponible' NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `lote` (
  `id_lote` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `tipo` varchar(20) DEFAULT NULL,
  `estado` varchar(35) DEFAULT 'En almacén central',
  `fragil` varchar(2) NOT NULL,
  `detalles` varchar(150) DEFAULT NULL,
  `id_destino` int NOT NULL
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
  `fecha_recibido` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `destino` (
  `id_destino` int NOT NULL AUTO_INCREMENT,
  `departamento_destino` varchar(30) NOT NULL,
  `ciudad_destino` varchar(35) NOT NULL,
  PRIMARY KEY (`id_destino`, `departamento_destino`, `ciudad_destino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `login` (
  `id_usuario` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `nom_usu` varchar(30) NOT NULL UNIQUE,
  `mail` varchar(45) NOT NULL UNIQUE,
  `tipo_usu` varchar(30) NOT NULL,
  `contrasenia` varchar(75) NOT NULL
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
  `id_maneja` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`id_vehiculo` int NOT NULL,
  `id_camionero` int NOT NULL,
  `fecha_inicio_manejo` DATE NOT NULL,
  `fecha_fin_manejo` DATE NOT NULL,
  CONSTRAINT chk_fechas_maneja CHECK (fecha_inicio_manejo <= fecha_fin_manejo),
  -- CONSTRAINT fecha_valida_inicio_maneja CHECK (fecha_inicio_manejo >= NOW()),
  -- CONSTRAINT fecha_valida_fin_maneja CHECK (fecha_fin_manejo >= NOW()),
  UNIQUE (id_vehiculo, fecha_inicio_manejo, fecha_fin_manejo),
  UNIQUE (id_camionero, fecha_inicio_manejo, fecha_fin_manejo)
);

CREATE TABLE `transporta` (
	`id_lote` int PRIMARY KEY NOT NULL,
  `id_camion` int NOT NULL
);

CREATE TABLE `lleva` (
  `id_camion` int NOT NULL,
  `id_plataforma` int NOT NULL,
  `fecha_entrega_ideal` datetime NOT NULL,
  `fecha_llegada` datetime DEFAULT NULL,
  `fecha_salida` datetime NOT NULL,
  `almacen_central_salida` int NOT NULL,
  CONSTRAINT chk_fechas_lleva CHECK (fecha_salida < fecha_entrega_ideal),
  -- CONSTRAINT fecha_valida_entrega_ideal CHECK (fecha_entrega_ideal >= NOW()),
  -- CONSTRAINT fecha_valida_salida CHECK (fecha_salida >= NOW()),
  PRIMARY KEY (id_camion, fecha_entrega_ideal)
);

CREATE TABLE `recoge` (
	`id_camioneta` int NOT NULL,
  `id_almacen_cliente` int NOT NULL,
  `fecha_recogida_ideal` datetime NOT NULL,
  `fecha_recogida` datetime DEFAULT NULL,
  `fecha_salida` datetime NOT NULL,
  `fecha_vuelta` datetime DEFAULT NULL,
  `almacen_central_salida` int NOT NULL,
  CONSTRAINT chk_fechas_recoge CHECK (fecha_salida < fecha_recogida_ideal),
  -- CONSTRAINT fecha_valida_recogida_ideal CHECK (fecha_recogida_ideal >= NOW()),
  -- CONSTRAINT fecha_valida_salida2 CHECK (fecha_salida >= NOW()),
  PRIMARY KEY (id_camioneta, fecha_recogida_ideal)
);

CREATE TABLE `solicitud` (
	`id_solicitud` int AUTO_INCREMENT PRIMARY KEY NOT NULL,
  `usuario` varchar(30) NOT NULL,
  `usuario_destino` varchar(30) NOT NULL,
  `detalles` varchar(150) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `id_almacen_cliente` int NOT NULL,
  `fecha_recogida_ideal` datetime NOT NULL,
  `fecha_solicitud` datetime NOT NULL
  -- CONSTRAINT fecha_valida_recogida_ideal2 CHECK (fecha_recogida_ideal >= NOW()),
);

CREATE TABLE `mensaje` (
	`id_mensaje` int AUTO_INCREMENT PRIMARY KEY NOT NULL,
  `nombre_remitente` varchar(35) NOT NULL,
  `mail_remitente` varchar(45) NOT NULL,
  `mensaje` varchar(300) NOT NULL,
  `estado` varchar(14) DEFAULT 'Sin responder' NOT NULL,
  `fecha_mensaje` datetime NOT NULL
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

ALTER TABLE `lleva`
    ADD CONSTRAINT `fk_id_camion3` FOREIGN KEY (id_camion) REFERENCES camion(id_camion) ON DELETE NO ACTION ON UPDATE NO ACTION,
    ADD CONSTRAINT `fk_id_plataforma` FOREIGN KEY (id_plataforma) REFERENCES plataforma(id_plataforma) ON DELETE NO ACTION ON UPDATE NO ACTION,
    ADD CONSTRAINT `fk_id_almacen_central_salida2` FOREIGN KEY (almacen_central_salida) REFERENCES almacen_central(id_almacen_central) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `recoge`
  ADD CONSTRAINT `fk_id_camioneta2` FOREIGN KEY (id_camioneta) REFERENCES camioneta(id_camioneta) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_almacen_cliente3` FOREIGN KEY (id_almacen_cliente) REFERENCES almacen_cliente(id_almacen_cliente) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_almacen_central_salida` FOREIGN KEY (almacen_central_salida) REFERENCES almacen_central(id_almacen_central) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `paquete`
  ADD KEY `id_destino` (`id_destino`),
  ADD CONSTRAINT `fk_destino` FOREIGN KEY (`id_destino`) REFERENCES `destino` (`id_destino`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `plataforma`
  ADD CONSTRAINT `fk_ubicacion_plataforma` FOREIGN KEY (`ubicacion`) REFERENCES `destino` (`id_destino`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `lote`
  ADD CONSTRAINT `fk_destino_lote` FOREIGN KEY (`id_destino`) REFERENCES `destino` (`id_destino`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ALTER TABLE `solicitud`
--     ADD CONSTRAINT `fk_usuario_solicitud` FOREIGN KEY (`usuario`) REFERENCES `login` (`nom_usu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
--     ADD CONSTRAINT `fk_usuario_destino_solicitud` FOREIGN KEY (`usuario_destino`) REFERENCES `login` (`nom_usu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
--     ADD CONSTRAINT `fk_almacen_cliente_solicitud` FOREIGN KEY (`id_almacen_cliente`) REFERENCES `almacen_cliente` (`id_almacen_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- -- Constraints de tipo Check

-- Checks vehiculo

ALTER TABLE `vehiculo`
  ADD CONSTRAINT `chk_matricula_formato`
  CHECK (`matricula` REGEXP '^[A-S]T[MP]-[0-9][0-9][0-9][0-9]$'),
  ADD CONSTRAINT chk_volumen_maximo_vehiculo
  CHECK (volumen_maximo > 0),
  ADD CONSTRAINT chk_peso_soportado_vehiculo
  CHECK (peso_soportado > 0),
  ADD CONSTRAINT `chk_valores_permitidos_estado_vehiculo`
  CHECK (`estado` IN ('Disponible', 'Fuera de servicio', 'En transcurso', 'De baja'));

-- Checks camionero

ALTER TABLE `camionero`
  ADD CONSTRAINT `chk_correo_electronico`
  CHECK (`mail` REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$'),
  ADD CONSTRAINT chk_nombre_camionero
  CHECK (nombre_completo REGEXP '^[a-zA-ZÁÉÍÓÚáéíóúÑñ ]*$'),
  ADD CONSTRAINT `chk_telefono1`
  CHECK (`telefono` REGEXP '^[0-9]+$' OR `telefono` REGEXP '^\\+[0-9]+$'),
  ADD CONSTRAINT `chk_cedula`
  CHECK (`cedula` REGEXP '^[0-9]+$'),
  ADD CONSTRAINT `chk_valores_permitidos_estado_camionero`
  CHECK (`estado` IN ('Disponible', 'En transcurso', 'No disponible', 'De baja'));

-- Checks almacen central

ALTER TABLE `almacen_central`
  ADD CONSTRAINT `chk_telefono2`
  CHECK (`telefono` REGEXP '^[0-9]+$'),
  ADD CONSTRAINT chk_numero_almacen_central
  CHECK (numero_almacen >= 0),
  ADD CONSTRAINT `chk_valores_permitidos_estado_almacen_central`
  CHECK (`estado` IN ('En uso', 'De baja'));

-- Checks almacen cliente

ALTER TABLE `almacen_cliente`
  ADD CONSTRAINT `chk_telefono3`
  CHECK (`telefono` REGEXP '^[0-9]+$'),
  ADD CONSTRAINT `chk_valores_permitidos_estado_almacen_cliente`
  CHECK (`estado` IN ('En uso', 'De baja'));

-- Checks plataforma

ALTER TABLE `plataforma`
  ADD CONSTRAINT `chk_telefono4`
  CHECK (`telefono` REGEXP '^[0-9]+$'),
  ADD CONSTRAINT chk_volumen_maximo_plataforma
  CHECK (volumen_maximo > 0),
  ADD CONSTRAINT `chk_valores_permitidos_estado_plataforma`
  CHECK (`estado` IN ('En uso', 'De baja'));

-- Checks empresa cliente

ALTER TABLE empresa_cliente
  ADD CONSTRAINT chk_empresa_cliente_rut
  CHECK (rut REGEXP '^[0-9]+$'),
  ADD CONSTRAINT chk_empresa_cliente_rut2
  CHECK (rut > 0),
  ADD CONSTRAINT `chk_correo_electronico4`
  CHECK (`mail` REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$'),
  ADD CONSTRAINT `chk_valores_permitidos_estado_empresa_cliente`
  CHECK (`estado` IN ('Disponible', 'De baja'));

-- Checks paquete

ALTER TABLE `paquete`
  ADD CONSTRAINT `chk_valores_permitidos_tipo2`
  CHECK (`tipo` IN (NULL, 'Vidrio', 'Líquido', 'Inflamable')),
  ADD CONSTRAINT `chk_valores_permitidos_fragil2`
  CHECK (`fragil` IN ('Si', 'No')),
  ADD CONSTRAINT `chk_correo_electronico3`
  CHECK (`mail_destinatario` REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$'),
  ADD CONSTRAINT `chk_paquete_positivo_volumen`
  CHECK (`volumen` >= 0),
  ADD CONSTRAINT `chk_paquete_positivo_peso`
  CHECK (`peso` >= 0),
  ADD CONSTRAINT chk_codigo_seguimiento
  CHECK (codigo_seguimiento REGEXP '^[A-Z0-9]*$'),
  ADD CONSTRAINT `chk_valores_permitidos_estado_paquete`
  CHECK (`estado` IN ('En almacén cliente', 'En camioneta (central)', 'En almacén central',
  'En almacén central (lote)', 'En almacén central (camión)', 'En camión (plataforma)', 'Entregado'));

-- Checks destino

ALTER TABLE destino
  ADD CONSTRAINT chk_departamento_destino
  CHECK (departamento_destino REGEXP '^[a-zA-ZÁÉÍÓÚáéíóúÑñ ]*$'),
  ADD CONSTRAINT chk_ciudad_destino
  CHECK (ciudad_destino REGEXP '^[a-zA-ZÁÉÍÓÚáéíóúÑñ ]*$');

ALTER TABLE `login`
  ADD CONSTRAINT `chk_correo_electronico2`
  CHECK (`mail` REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$'),
  ADD CONSTRAINT `chk_valores_permitidos_tipo_usu`
  CHECK (`tipo_usu` IN ('admin', 'almacenero', 'camionero', 'empresa'));

-- Checks lote

ALTER TABLE `lote`
  ADD CONSTRAINT `chk_valores_permitidos_tipo`
  CHECK (`tipo` IN (NULL, 'Vidrio', 'Líquido', 'Inflamable')),
  ADD CONSTRAINT `chk_valores_permitidos_fragil`
  CHECK (`fragil` IN ('Si', 'No')),
  ADD CONSTRAINT `chk_valores_permitidos_estado_lote`
  CHECK (`estado` IN ('En almacén central', 'En almacén central (camión)', 'En camión (plataforma)', 'Entregado'));

-- Checks solicitud

ALTER TABLE `solicitud`
  ADD CONSTRAINT `chk_valores_permitidos_estado_solicitud`
  CHECK (`estado` IN ('En espera', 'Aceptada', 'Denegada'));

-- Checks mensaje

ALTER TABLE `mensaje`
  ADD CONSTRAINT `chk_correo_electronico5`
  CHECK (`mail_remitente` REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$'),
  ADD CONSTRAINT chk_nombre_remitente
  CHECK (nombre_remitente REGEXP '^[a-zA-ZÁÉÍÓÚáéíóúÑñ ]*$'),
  ADD CONSTRAINT chk_estado_mensaje
  CHECK (`estado` IN ('Sin responder', 'En curso', 'Resuelto'));

-- Triggers bajas lógicas

DELIMITER //
CREATE TRIGGER baja_logica_camionero
BEFORE INSERT ON maneja
FOR EACH ROW
BEGIN
  IF (SELECT estado FROM camionero WHERE id_camionero = NEW.id_camionero) = 'De baja'
  THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se puede asignar un camionero que esté dado de baja...';
  END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER baja_logica_camionero2
BEFORE UPDATE ON maneja
FOR EACH ROW
BEGIN
  IF (SELECT estado FROM camionero WHERE id_camionero = NEW.id_camionero) = 'De baja'
  THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se puede asignar un camionero que esté dado de baja...';
  END IF;
END;
//
DELIMITER ;


DELIMITER //
CREATE TRIGGER baja_logica_vehiculo
BEFORE INSERT ON maneja
FOR EACH ROW
BEGIN
  IF (SELECT estado FROM vehiculo WHERE id_vehiculo = NEW.id_vehiculo) = 'De baja'
  THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se puede asignar un vehiculo que esté dado de baja...';
  END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER baja_logica_vehiculo2
BEFORE UPDATE ON maneja
FOR EACH ROW
BEGIN
  IF (SELECT estado FROM vehiculo WHERE id_vehiculo = NEW.id_vehiculo) = 'De baja'
  THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se puede asignar un vehiculo que esté dado de baja...';
  END IF;
END;
//
DELIMITER ;


DELIMITER //
CREATE TRIGGER baja_logica_almacen_central
BEFORE INSERT ON almacena1
FOR EACH ROW
BEGIN
  IF (SELECT estado FROM almacen_central WHERE id_almacen_central = NEW.id_almacen_central) = 'De baja'
  THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se puede asignar un almacén central que esté dado de baja...';
  END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER baja_logica_almacen_central2
BEFORE UPDATE ON almacena1
FOR EACH ROW
BEGIN
  IF (SELECT estado FROM almacen_central WHERE id_almacen_central = NEW.id_almacen_central) = 'De baja'
  THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se puede asignar un almacén central que esté dado de baja...';
  END IF;
END;
//
DELIMITER ;


DELIMITER //
CREATE TRIGGER baja_logica_almacen_cliente
BEFORE INSERT ON almacena
FOR EACH ROW
BEGIN
  IF (SELECT estado FROM almacen_cliente WHERE id_almacen_cliente = NEW.id_almacen_cliente) = 'De baja'
  THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se puede asignar un almacén cliente que esté dado de baja...';
  END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER baja_logica_almacen_cliente2
BEFORE UPDATE ON almacena
FOR EACH ROW
BEGIN
  IF (SELECT estado FROM almacen_cliente WHERE id_almacen_cliente = NEW.id_almacen_cliente) = 'De baja'
  THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se puede asignar un almacén cliente que esté dado de baja...';
  END IF;
END;
//
DELIMITER ;


DELIMITER //
CREATE TRIGGER baja_logica_almacen_cliente3
BEFORE INSERT ON tiene
FOR EACH ROW
BEGIN
  IF (SELECT estado FROM almacen_cliente WHERE id_almacen_cliente = NEW.id_almacen_cliente) = 'De baja'
  THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se puede asignar un almacén cliente que esté dado de baja...';
  END IF;
END;
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER baja_logica_almacen_cliente4
BEFORE UPDATE ON tiene
FOR EACH ROW
BEGIN
  IF (SELECT estado FROM almacen_cliente WHERE id_almacen_cliente = NEW.id_almacen_cliente) = 'De baja'
  THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se puede asignar un almacén cliente que esté dado de baja...';
  END IF;
END;
//
DELIMITER ;


DELIMITER //
CREATE TRIGGER baja_logica_almacen_cliente5
BEFORE INSERT ON recoge
FOR EACH ROW
BEGIN
  IF (SELECT estado FROM almacen_cliente WHERE id_almacen_cliente = NEW.id_almacen_cliente) = 'De baja'
  THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se puede asignar un almacén cliente que esté dado de baja...';
  END IF;
END;
//
DELIMITER ;

DELIMITER //

CREATE TRIGGER baja_logica_almacen_cliente6 
BEFORE UPDATE ON recoge
FOR EACH ROW
BEGIN
  IF (SELECT estado FROM almacen_cliente WHERE id_almacen_cliente = NEW.id_almacen_cliente) = 'De baja'
  THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se puede asignar un almacén cliente que esté dado de baja...';
  END IF;
END;
//
DELIMITER ;

DELIMITER //


DELIMITER //

CREATE TRIGGER baja_logica_plataforma1
BEFORE INSERT ON lleva
FOR EACH ROW
BEGIN
  IF (SELECT estado FROM plataforma WHERE id_plataforma = NEW.id_plataforma) = 'De baja'
  THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se puede asignar una plataforma que esté dada de baja...';
  END IF;
END;
//
DELIMITER ;

DELIMITER //

CREATE TRIGGER baja_logica_plataforma2
BEFORE UPDATE ON lleva
FOR EACH ROW
BEGIN
  IF (SELECT estado FROM plataforma WHERE id_plataforma = NEW.id_plataforma) = 'De baja'
  THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se puede asignar una plataforma que esté dada de baja...';
  END IF;
END;
//
DELIMITER ;


DELIMITER //

CREATE TRIGGER baja_logica_empresa_cliente
BEFORE INSERT ON tiene
FOR EACH ROW
BEGIN
  IF (SELECT estado FROM empresa_cliente WHERE id_empresa_cliente = NEW.id_empresa_cliente) = 'De baja'
  THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se puede asignar una empresa que esté dada de baja...';
  END IF;
END;
//
DELIMITER ;

DELIMITER //

CREATE TRIGGER baja_logica_empresa_cliente2
BEFORE UPDATE ON tiene
FOR EACH ROW
BEGIN
  IF (SELECT estado FROM empresa_cliente WHERE id_empresa_cliente = NEW.id_empresa_cliente) = 'De baja'
  THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se puede asignar una empresa que esté dada de baja...';
  END IF;
END;
//
DELIMITER ;

DELIMITER //

CREATE TRIGGER baja_logica_camion
BEFORE INSERT ON transporta
FOR EACH ROW
BEGIN
  IF (SELECT estado FROM vehiculo WHERE id_vehiculo = NEW.id_camion) = 'De baja'
  THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se puede asignar un camión que esté dado de baja...';
  END IF;
END;
//
DELIMITER ;

DELIMITER //

CREATE TRIGGER baja_logica_camion2
BEFORE UPDATE ON transporta
FOR EACH ROW
BEGIN
  IF (SELECT estado FROM vehiculo WHERE id_vehiculo = NEW.id_camion) = 'De baja'
  THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se puede asignar un camión que esté dado de baja...';
  END IF;
END;
//
DELIMITER ;

DELIMITER //

CREATE TRIGGER baja_logica_camion3
BEFORE INSERT ON lleva
FOR EACH ROW
BEGIN
  IF (SELECT estado FROM vehiculo WHERE id_vehiculo = NEW.id_camion) = 'De baja'
  THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se puede asignar un camión que esté dado de baja...';
  END IF;
END;
//
DELIMITER ;

DELIMITER //

CREATE TRIGGER baja_logica_camion4
BEFORE UPDATE ON lleva
FOR EACH ROW
BEGIN
  IF (SELECT estado FROM vehiculo WHERE id_vehiculo = NEW.id_camion) = 'De baja'
  THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se puede asignar un camión que esté dado de baja...';
  END IF;
END;
//
DELIMITER ;

DELIMITER //

CREATE TRIGGER baja_logica_camioneta
BEFORE INSERT ON recoge
FOR EACH ROW
BEGIN
  IF (SELECT estado FROM vehiculo WHERE id_vehiculo = NEW.id_camioneta) = 'De baja'
  THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se puede asignar una camioneta que esté dada de baja...';
  END IF;
END;
//
DELIMITER ;

DELIMITER //

CREATE TRIGGER baja_logica_camioneta2
BEFORE UPDATE ON recoge
FOR EACH ROW
BEGIN
  IF (SELECT estado FROM vehiculo WHERE id_vehiculo = NEW.id_camioneta) = 'De baja'
  THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se puede asignar una camioneta que esté dada de baja...';
  END IF;
END;
//
DELIMITER ;

-- Otros triggers

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

-- VISTAS

CREATE VIEW `mostrar_camiones`
AS
SELECT camion.id_camion, vehiculo.matricula, vehiculo.volumen_maximo, vehiculo.peso_soportado, vehiculo.estado
FROM `vehiculo`
INNER JOIN camion ON vehiculo.id_vehiculo = camion.id_camion;

CREATE VIEW `mostrar_camionetas`
AS
SELECT camioneta.id_camioneta, vehiculo.matricula, vehiculo.volumen_maximo, vehiculo.peso_soportado, vehiculo.estado
FROM `vehiculo`
INNER JOIN camioneta ON vehiculo.id_vehiculo = camioneta.id_camioneta;

CREATE VIEW `mostrar_lotes`
AS
SELECT
    lote.id_lote,
    COALESCE(SUM(paquete.peso), 0) AS peso,
    COALESCE(SUM(paquete.volumen), 0) AS volumen,
    COALESCE(COUNT(forma.id_paquete), 0) AS cant_paquetes,
    lote.tipo,
    lote.estado,
    lote.fragil,
    lote.detalles,
    transporta.id_camion
FROM lote
LEFT JOIN forma ON lote.id_lote = forma.id_lote
LEFT JOIN paquete ON forma.id_paquete = paquete.id_paquete
LEFT JOIN transporta ON lote.id_lote = transporta.id_lote
GROUP BY lote.id_lote;

CREATE VIEW `mostrar_paquetes_empresa`
AS
SELECT paquete.id_paquete, paquete.codigo_seguimiento, paquete.tipo, paquete.volumen, paquete.peso, paquete.fragil, paquete.detalles, paquete.mail_destinatario, paquete.estado, destino.departamento_destino, destino.ciudad_destino, paquete.fecha_recibido, almacen_cliente.direccion AS almacen_cliente_direccion, paquete.direccion AS paquete_direccion, almacen_cliente.telefono, almacen_cliente.id_almacen_cliente, empresa_cliente.id_empresa_cliente, empresa_cliente.rut, empresa_cliente.nombre_de_empresa, empresa_cliente.mail AS mail_empresa
FROM paquete
INNER JOIN destino ON paquete.id_destino = destino.id_destino
INNER JOIN almacena ON paquete.id_paquete = almacena.id_paquete
INNER JOIN almacen_cliente ON almacen_cliente.id_almacen_cliente = almacena.id_almacen_cliente
INNER JOIN tiene ON almacena.id_almacen_cliente = tiene.id_almacen_cliente
INNER JOIN empresa_cliente ON tiene.id_empresa_cliente = empresa_cliente.id_empresa_cliente;