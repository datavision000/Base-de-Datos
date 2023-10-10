-- Creacion y uso de la base de datos 'QDS'

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
  `departamento` varchar(35) NOT NULL,
  `telefono` varchar(20) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `camion` (
  `id_camion` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `matricula` varchar(8) NOT NULL UNIQUE,
  `volumen_disponible` int NOT NULL,
  `peso_soportado` int NOT NULL,
  `estado` varchar(20) DEFAULT 'Disponible' NOT NULL
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
  `rut` bigint NOT NULL PRIMARY KEY,
  `nombre_de_empresa` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `lote` (
  `id_lote` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `cant_paquetes` int DEFAULT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `estado` varchar(35) DEFAULT 'En almacén central',
  `volumen` int,
  `peso` int,
  `fragil` varchar(2) NOT NULL,
  `detalles` varchar(150) DEFAULT NULL,
  `fecha_ideal_traslado` date DEFAULT NULL,
  `hora_ideal_traslado` time DEFAULT NULL,
  `fecha_recibido` date DEFAULT NULL,
  `hora_recibido` time DEFAULT NULL
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
  `id_destino` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `destino_paquete` (
  `id_destino` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `departamento_destino` varchar(30) NOT NULL,
  `ciudad_destino` varchar(30) NOT NULL,
  UNIQUE (`departamento_destino`, `ciudad_destino`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `ruta` (
  `id_ruta` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nom_ruta` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `trayecto` (
  `id_trayecto` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `distancia_recorrida` int NOT NULL
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
    `rut` bigint NOT NULL
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
	`id_camion` int NOT NULL,
    `id_camionero` int NOT NULL,
   `fecha_inicio_manejo` DATE NOT NULL,
    `hora_inicio_manejo` TIME NOT NULL,
    `fecha_fin_manejo` DATE NOT NULL,
    `hora_fin_manejo` TIME NOT NULL,
    PRIMARY KEY (id_camion, id_camionero)
);

CREATE TABLE `transporta` (
	`id_lote` int PRIMARY KEY NOT NULL,
  `id_camion` int NOT NULL
);

CREATE TABLE `se_le_asigna` (
	`id_camion` int NOT NULL,
    `id_trayecto` int NOT NULL,
    PRIMARY KEY (id_camion, id_trayecto)
);

CREATE TABLE `llega` (
	`id_trayecto` int NOT NULL,
  `id_plataforma` int NOT NULL,
   PRIMARY KEY (id_trayecto, id_plataforma)
);

CREATE TABLE `abarca` (
	`id_ruta` int NOT NULL,
    `id_trayecto` int NOT NULL,
    PRIMARY KEY (id_ruta, id_trayecto)
);

CREATE TABLE `lleva` (
	`id_lote` int PRIMARY KEY NOT NULL,
  `id_plataforma` int NOT NULL,
  `fecha_llegada` date DEFAULT NULL,
  `hora_llegada` time DEFAULT NULL
);

CREATE TABLE `sale` (
	`id_camion` int PRIMARY KEY NOT NULL,
  `id_almacen_central` int NOT NULL,
  `fecha_salida` date DEFAULT NULL,
  `hora_salida` time DEFAULT NULL
);

-- Constraints de tipo Foreign Key

ALTER TABLE `tiene`
    ADD CONSTRAINT `fk_id_almacen_cliente` FOREIGN KEY (id_almacen_cliente) REFERENCES almacen_cliente(id_almacen_cliente) ON DELETE NO ACTION ON UPDATE NO ACTION,
    ADD CONSTRAINT `fk_rut` FOREIGN KEY (rut) REFERENCES empresa_cliente(rut) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
    ADD CONSTRAINT `fk_id_camion` FOREIGN KEY (id_camion) REFERENCES camion(id_camion) ON DELETE NO ACTION ON UPDATE NO ACTION,
    ADD CONSTRAINT `fk_id_camionero` FOREIGN KEY (id_camionero) REFERENCES camionero(id_camionero) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `transporta`
    ADD CONSTRAINT `fk_id_lote3` FOREIGN KEY (id_lote) REFERENCES forma(id_lote) ON DELETE NO ACTION ON UPDATE NO ACTION,
    ADD CONSTRAINT `fk_id_camion2` FOREIGN KEY (id_camion) REFERENCES camion(id_camion) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `se_le_asigna`
    ADD CONSTRAINT `fk_id_camion3` FOREIGN KEY (id_camion) REFERENCES camion(id_camion) ON DELETE NO ACTION ON UPDATE NO ACTION,
    ADD CONSTRAINT `fk_id_trayecto` FOREIGN KEY (id_trayecto) REFERENCES trayecto(id_trayecto) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `llega`
    ADD CONSTRAINT `fk_id_trayecto3` FOREIGN KEY (id_trayecto) REFERENCES trayecto(id_trayecto) ON DELETE NO ACTION ON UPDATE NO ACTION,
    ADD CONSTRAINT `fk_id_plataforma2` FOREIGN KEY (id_plataforma) REFERENCES plataforma(id_plataforma) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `abarca`
    ADD CONSTRAINT `fk_id_ruta` FOREIGN KEY (id_ruta) REFERENCES ruta(id_ruta) ON DELETE NO ACTION ON UPDATE NO ACTION,
    ADD CONSTRAINT `fk_id_trayecto2` FOREIGN KEY (id_trayecto) REFERENCES trayecto(id_trayecto) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `lleva`
    ADD CONSTRAINT `fk_id_lote4` FOREIGN KEY (id_lote) REFERENCES transporta(id_lote) ON DELETE NO ACTION ON UPDATE NO ACTION,
    ADD CONSTRAINT `fk_id_plataforma` FOREIGN KEY (id_plataforma) REFERENCES plataforma(id_plataforma) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `sale`
    ADD CONSTRAINT `fk_id_camion4` FOREIGN KEY (id_camion) REFERENCES camion(id_camion) ON DELETE NO ACTION ON UPDATE NO ACTION,
    ADD CONSTRAINT `fk_almacen_central2` FOREIGN KEY (id_almacen_central) REFERENCES almacen_central(id_almacen_central) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `paquete`
  ADD KEY `id_destino` (`id_destino`),
  ADD CONSTRAINT `fk_destino_paquete` FOREIGN KEY (`id_destino`) REFERENCES `destino_paquete` (`id_destino`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `trayecto_departamentos`
  ADD KEY `id_trayecto` (`id_trayecto`),
  ADD CONSTRAINT `fk_trayecto_departamentos` FOREIGN KEY (`id_trayecto`) REFERENCES `trayecto` (`id_trayecto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Constraints de tipo Check

ALTER TABLE `camion`
  ADD CONSTRAINT `chk_matricula_formato`
  CHECK (`matricula` REGEXP '^[A-S]T[MP]-[0-9][0-9][0-9][0-9]$');

ALTER TABLE `camionero`
  ADD CONSTRAINT `chk_correo_electronico`
  CHECK (`mail` REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$');
 
ALTER TABLE `login`
  ADD CONSTRAINT `chk_correo_electronico`
  CHECK (`mail` REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$');
 
ALTER TABLE `paquete`
  ADD CONSTRAINT `chk_correo_electronico`
  CHECK (`mail_destinatario` REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$');
 
ALTER TABLE `empresa_cliente`
  ADD CONSTRAINT `chk_correo_electronico`
  CHECK (`mail` REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$');

ALTER TABLE `lote`
  ADD CONSTRAINT `chk_valores_permitidos_tipo`
  CHECK (`tipo` IN (NULL, 'Vidrio', 'Líquido', 'Inflamable')),
  ADD CONSTRAINT `chk_valores_permitidos_fragil`
  CHECK (`fragil` IN ('Si', 'No'));

ALTER TABLE `paquete`
  ADD CONSTRAINT `chk_valores_permitidos_tipo`
  CHECK (`tipo` IN (NULL, 'Vidrio', 'Líquido', 'Inflamable')),
  ADD CONSTRAINT `chk_valores_permitidos_fragil`
  CHECK (`fragil` IN ('Si', 'No'));