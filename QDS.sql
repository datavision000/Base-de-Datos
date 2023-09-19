-- Creacion y uso de la base de datos 'QDS'

CREATE DATABASE `QDS`;
USE `QDS`;

-- Estructura de tabla para la tabla 'almacen_central'

CREATE TABLE `almacen_central` (
  `id_almacen_central` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `direccion` varchar(65) NOT NULL,
  `telefono` varchar(20) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Estructura de tabla para la tabla 'almacen_cliente'

CREATE TABLE `almacen_cliente` (
  `id_almacen_cliente` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `telefono` varchar(20) NOT NULL UNIQUE,
  `direccion` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Estructura de tabla para la tabla 'plataforma'

CREATE TABLE `plataforma` (
  `id_plataforma` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `direccion` varchar(65) NOT NULL,
  `volumen_maximo` int NOT NULL,
  `telefono` varchar(20) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Estructura de tabla para la tabla `camion`

CREATE TABLE `camion` (
  `id_camion` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `matricula` varchar(10) NOT NULL UNIQUE,
  `volumen_disponible` int NOT NULL,
  `peso_soportado` int NOT NULL,
  `estado` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Estructura de tabla para la tabla 'camionero'

CREATE TABLE `camionero` (
  `id_camionero` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `cedula` varchar(8) UNIQUE NOT NULL,
  `nombre_completo` varchar(45) NOT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `mail` varchar(45) NOT NULL UNIQUE,
  `telefono` varchar(20) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Estructura de tabla para la tabla 'empresa_cliente'

CREATE TABLE `empresa_cliente` (
  `rut` int NOT NULL PRIMARY KEY,
  `nombre_de_empresa` varchar(45) NOT NULL,
  `mail` varchar(45) NOT NULL UNIQUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Estructura de tabla para la tabla 'lote'

CREATE TABLE `lote` (
  `id_lote` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `cant_paquetes` int NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `volumen` int NOT NULL,
  `peso` int NOT NULL,
  `fragil` varchar(2) NOT NULL,
  `detalles` varchar(150) DEFAULT NULL,
  `fecha_ideal_traslado` date DEFAULT NULL,
  `hora_ideal_traslado` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Estructura de tabla para la tabla 'paquete'

CREATE TABLE `paquete` (
  `id_paquete` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `tipo` varchar(30) NOT NULL,
  `volumen` varchar(10) NOT NULL,
  `peso` varchar(10) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `fragil` varchar(2) NOT NULL,
  `detalles` varchar(150) DEFAULT NULL,
  `mail_destinatario` varchar(45) NOT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `id_destino` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Estructura de tabla para la tabla 'destino_paquete'

CREATE TABLE `destino_paquete` (
  `id_destino` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `departamento_destino` varchar(30) NOT NULL,
  `ciudad_destino` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Estructura de tabla para la tabla 'ruta'

CREATE TABLE `ruta` (
  `id_ruta` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nom_ruta` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Estructura de tabla para la tabla 'trayecto'

CREATE TABLE `trayecto` (
  `id_trayecto` int NOT NULL PRIMARY KEY AUTO_INCREMENT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Estructura de tabla para la tabla 'trayecto_departamentos'

CREATE TABLE `trayecto_departamentos` (
  `id_trayecto` int NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `departamento_atravesado` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- Estructura de tabla para la tabla 'login'

CREATE TABLE `login` (
  `nom_usu` varchar(30) NOT NULL PRIMARY KEY,
  `mail` varchar(45) NOT NULL UNIQUE,
  `tipo_usu` varchar(30) NOT NULL,
  `contrasenia` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `tiene` (
	`id_almacen_cliente` int PRIMARY KEY NOT NULL,
    `rut` int NOT NULL
);

ALTER TABLE `tiene`
    ADD CONSTRAINT `fk_id_almacen_cliente` FOREIGN KEY (id_almacen_cliente) REFERENCES almacen_cliente(id_almacen_cliente) ON DELETE NO ACTION ON UPDATE NO ACTION,
    ADD CONSTRAINT `fk_rut` FOREIGN KEY (rut) REFERENCES empresa_cliente(rut) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE `almacena` (
	`id_paquete` int PRIMARY KEY NOT NULL,
    `id_almacen_cliente` int NOT NULL
);

ALTER TABLE `almacena`
    ADD CONSTRAINT `fk_id_paquete` FOREIGN KEY (id_paquete) REFERENCES paquete(id_paquete) ON DELETE NO ACTION ON UPDATE NO ACTION,
    ADD CONSTRAINT `fk_id_almacen_cliente2` FOREIGN KEY (id_almacen_cliente) REFERENCES almacen_cliente(id_almacen_cliente) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE `forma` (
	`id_paquete` int PRIMARY KEY NOT NULL,
    `id_lote` int NOT NULL
);

ALTER TABLE `forma`
    ADD CONSTRAINT `fk_id_paquete2` FOREIGN KEY (id_paquete) REFERENCES paquete(id_paquete) ON DELETE NO ACTION ON UPDATE NO ACTION,
    ADD CONSTRAINT `fk_id_lote` FOREIGN KEY (id_lote) REFERENCES lote(id_lote) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE `almacena1` (
	`id_lote` int PRIMARY KEY NOT NULL,
  `id_almacen_central` int NOT NULL
);

ALTER TABLE `almacena1`
    ADD CONSTRAINT `fk_id_lote2` FOREIGN KEY (id_lote) REFERENCES lote(id_lote) ON DELETE NO ACTION ON UPDATE NO ACTION,
    ADD CONSTRAINT `fk_id_almacen_central` FOREIGN KEY (id_almacen_central) REFERENCES almacen_central(id_almacen_central) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE `maneja` (
	`id_camion` int NOT NULL,
    `id_camionero` int NOT NULL,
   `fecha_inicio_manejo` DATE NOT NULL,
    `hora_inicio_manejo` TIME NOT NULL,
    `fecha_fin_manejo` DATE NOT NULL,
    `hora_fin_manejo` TIME NOT NULL,
    PRIMARY KEY (id_camion, id_camionero)
);

ALTER TABLE `maneja`
    ADD CONSTRAINT `fk_id_camion` FOREIGN KEY (id_camion) REFERENCES camion(id_camion) ON DELETE NO ACTION ON UPDATE NO ACTION,
    ADD CONSTRAINT `fk_id_camionero` FOREIGN KEY (id_camionero) REFERENCES camionero(id_camionero) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE `transporta` (
	`id_lote` int PRIMARY KEY NOT NULL,
  `id_camion` int NOT NULL
);

ALTER TABLE `transporta`
    ADD CONSTRAINT `fk_id_lote3` FOREIGN KEY (id_lote) REFERENCES lote(id_lote) ON DELETE NO ACTION ON UPDATE NO ACTION,
    ADD CONSTRAINT `fk_id_camion2` FOREIGN KEY (id_camion) REFERENCES camion(id_camion) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE `se_le_asigna` (
	`id_camion` int NOT NULL,
    `id_trayecto` int NOT NULL,
    PRIMARY KEY (id_camion, id_trayecto)
);

ALTER TABLE `se_le_asigna`
    ADD CONSTRAINT `fk_id_camion3` FOREIGN KEY (id_camion) REFERENCES camion(id_camion) ON DELETE NO ACTION ON UPDATE NO ACTION,
    ADD CONSTRAINT `fk_id_trayecto` FOREIGN KEY (id_trayecto) REFERENCES trayecto(id_trayecto) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE `abarca` (
	`id_ruta` int NOT NULL,
    `id_trayecto` int NOT NULL,
    PRIMARY KEY (id_ruta, id_trayecto)
);

ALTER TABLE `abarca`
    ADD CONSTRAINT `fk_id_ruta` FOREIGN KEY (id_ruta) REFERENCES ruta(id_ruta) ON DELETE NO ACTION ON UPDATE NO ACTION,
    ADD CONSTRAINT `fk_id_trayecto2` FOREIGN KEY (id_trayecto) REFERENCES trayecto(id_trayecto) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE `lleva` (
	`id_lote` int PRIMARY KEY NOT NULL,
  `id_plataforma` int NOT NULL,
  `fecha_llegada` date DEFAULT NULL,
  `hora_llegada` time DEFAULT NULL
);

ALTER TABLE `lleva`
    ADD CONSTRAINT `fk_id_lote4` FOREIGN KEY (id_lote) REFERENCES transporta(id_lote) ON DELETE NO ACTION ON UPDATE NO ACTION,
    ADD CONSTRAINT `fk_id_plataforma` FOREIGN KEY (id_plataforma) REFERENCES plataforma(id_plataforma) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE TABLE `sale` (
	`id_camion` int PRIMARY KEY NOT NULL,
  `id_almacen_central` int NOT NULL,
  `fecha_salida` date DEFAULT NULL,
  `hora_salida` time DEFAULT NULL
);

ALTER TABLE `sale`
    ADD CONSTRAINT `fk_id_camion4` FOREIGN KEY (id_camion) REFERENCES camion(id_camion) ON DELETE NO ACTION ON UPDATE NO ACTION,
    ADD CONSTRAINT `fk_almacen_central2` FOREIGN KEY (id_almacen_central) REFERENCES almacen_central(id_almacen_central) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Foreign key para la tabla 'paquete'

ALTER TABLE `paquete`
  ADD KEY `id_destino` (`id_destino`),
  ADD CONSTRAINT `fk_destino_paquete` FOREIGN KEY (`id_destino`) REFERENCES `destino_paquete` (`id_destino`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Foreign key para la tabla 'trayecto_departamentos'

ALTER TABLE `trayecto_departamentos`
  ADD KEY `id_trayecto` (`id_trayecto`),
  ADD CONSTRAINT `fk_trayecto_departamentos` FOREIGN KEY (`id_trayecto`) REFERENCES `trayecto` (`id_trayecto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Formato a matricula para la tabla 'camion'

ALTER TABLE `camion`
  ADD CONSTRAINT chk_matricula_formato
  CHECK ('matricula' REGEXP '^[A-Z]T[A-Z]-[0-9]{4}$');