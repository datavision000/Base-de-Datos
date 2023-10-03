-- Ingreso de tuplas en tabla 'almacen_central'

START TRANSACTION;

INSERT INTO `almacen_central` (`numero_almacen`, `telefono`)
VALUES
(44, "095937281"),
(55, "093569372"),
(78, "095101834"),
(198, "095291482"),
(77, "095493174");

COMMIT;

-- Ingreso de tuplas en tabla 'almacen_cliente'

START TRANSACTION;

INSERT INTO `almacen_cliente` (`direccion`, `telefono`)
VALUES
("Felipe Sanguinetti 2474", "095086226"),
("Av. Italia 7777", "094839173"),
("Bv. José Batlle y Ordoñez 694", "092849372"),
("Neyra 1492", "097593271"),
("Comodoro Coe", "092456821");

COMMIT;

 -- Ingreso de tuplas en tabla 'plataforma'

START TRANSACTION;

INSERT INTO `plataforma` (`direccion`, `volumen_maximo`, `departamento`, `telefono`)
VALUES
("Humberto I 3928", 120000, "Montevideo", "095837122"),
("Av. Del Mar 1839", 90000, "Maldonado", "092184932"),
("Joaquín Artigas 1456", 110000, "Treinta y Tres", "094349548"),
("Milton Rusiñol 567", 100000, "Flores", "092183926"),
("José Gómez 1832", 100000, "Durazno", "097857361");

COMMIT;

 -- Ingreso de tuplas en tabla 'camion'

START TRANSACTION;

INSERT INTO `camion` (`matricula`, `volumen_disponible`, `peso_soportado`)
VALUES
("STP-3444", 150, 18000),
("STP-6934", 150, 16000),
("STP-2644", 145, 15000),
("STP-6500", 180, 20000),
("STM-7765", 110, 80000);
INSERT INTO `camion` (`matricula`, `volumen_disponible`, `peso_soportado`, `estado`)
VALUES
("STM-1234", 1234, 1234, "Fuera de servicio");

COMMIT;

-- Ingreso de tuplas en tabla 'camionero'

START TRANSACTION;

INSERT INTO `camionero` (`cedula`, `nombre_completo`, `mail`, `telefono`)
VALUES
("55114266", "Franco Martín Turiello Pérez", "francoturiello.soss@gmail.com", "093349851"),
("51859372", "Carlos Pérez Rodríguez", "carlosp23@gmail.com", "095281365"),
("48592027", "Rosa De Las Nieves Nevada", "RositaHola55@gmail.com", "092394839"),
("58349207", "José María Darín Pereira", "JosemaOh@gmail.com", "094739272"),
("58329271", "Marcelo Carlos Chubascos González", "Marcelito78@gmail.com", "096864323");

COMMIT;

-- Ingreso de tuplas en tabla 'empresa_cliente'

START TRANSACTION;

INSERT INTO `empresa_cliente` (`rut`, `nombre_de_empresa`, `mail`)
VALUES
("184937392027", "Crecom", "crecom23@gmail.com"),
("105839405738", "Top Tecno", "topTecno@gmail.com"),
("195849271845", "Adidas", "adidas@gmail.com"),
("184930281744", "Nike", "nike00@gmail.com"),
("585948302712", "Apple", "apple567@gmail.com");

COMMIT;

-- Ingreso de tuplas en tabla 'lote'

START TRANSACTION;

INSERT INTO `lote` (`tipo`, `volumen`, `peso`, `fragil`)
VALUES
('Vidrio', '37', '2', 'Si'),
('Líquido', '800', '5', 'Si');
INSERT INTO `lote` (`volumen`, `peso`, `fragil`, `fecha_ideal_traslado`, `hora_ideal_traslado`)
VALUES
('67', '8', 'No', '2023-09-22', '16:00:00'),
('70', '56', 'No', '2023-10-31', '23:00:00'),
('100', '40', 'No', '2023-11-15', '20:00:00');

COMMIT;

-- Ingreso de tuplas en tabla 'destino_paquete'

START TRANSACTION;

INSERT INTO `destino_paquete` (`departamento_destino`, `ciudad_destino`)
VALUES
('Montevideo', 'Montevideo'),
('Maldonado', 'Punta del Este'),
('Canelones', 'Atlántida');

COMMIT;

-- Ingreso de tuplas en tabla 'paquete'

START TRANSACTION;

INSERT INTO `paquete` (`codigo_seguimiento`, `tipo`, `volumen`, `peso`, `direccion`, `fragil`, `detalles`, `mail_destinatario`)
VALUES
("FK2L5KSD30FL", 'Liquido', '88', '100', 'Av. Italia 3474', 'Si', 'Nitrógeno líquido', 'hhamilton@gmail.com'),
("39ALFJ281745", 'Vidrio', '80', '22', 'Estivao 1204', 'Si', 'Ventanas blancas', 'peterparker44@gmail.com');
INSERT INTO `paquete` (`codigo_seguimiento`,`tipo`, `volumen`, `peso`, `direccion`, `fragil`, `detalles`, `mail_destinatario`, `id_destino`)
VALUES
("3KA9GL2759AJ", 'Vidrio', '78', '66', 'Rivera 5675', 'Si', 'Ventanas negras', 'charlesion566@gmail.com', 3);
INSERT INTO `paquete` (`codigo_seguimiento`, `volumen`, `peso`, `direccion`, `fragil`, `mail_destinatario`)
VALUES
("FKALO83NAK17", '800', '500', 'Bv. José Batlle y Ordoñez 1302', 'No', 'fredericJhonson@gmail.com'),
("40396LAJFIQ3", '260', '400', 'Felipe Sanguinetti 2043', 'No', 'filtungis@gmail.com');

COMMIT;

-- Ingreso de tuplas en tabla 'ruta'

START TRANSACTION;

INSERT INTO `ruta` (`nom_ruta`)
VALUES
('Ruta 8'),
('Ruta 12'),
('Ruta 66'),
('Ruta 9'),
('Ruta Interbalnearia');

COMMIT;

-- Ingreso de tuplas en tabla 'login'

START TRANSACTION;

INSERT INTO `login` (`nom_usu`, `mail`, `tipo_usu`, `contrasenia`)
VALUES
('admin', 'administrador@gmail.com', 'admin', 'qds000L'),
('camionero', 'camionero@gmail.com', 'camionero', 'HsuC32199'),
('almacenero', 'almacenero@gmail.com', 'almacenero', 'HsuAL32199');

COMMIT;


INSERT INTO `destino_paquete` (`departamento_destino`, `ciudad_destino`)
VALUES
('Cerro Largo', 'Melo');

INSERT INTO `paquete` (`id_paquete`, `codigo_seguimiento`, `tipo`, `volumen`, `peso`, `direccion`, `fragil`, `detalles`, `mail_destinatario`, `estado`, `fecha_recibido`, `id_destino`) VALUES (NULL, '3KF8ALWO2918', NULL, '465', '232', 'Hola 1234', 'No', NULL, 'hola@gmail.com', 'En almacén cliente', NULL, '4'), (NULL, '39AL29GK39AK', NULL, '777', '23', 'que paso 2351', 'No', NULL, 'gor@gmail.com', 'En almacén cliente', NULL, '4');
INSERT INTO `forma` (`id_paquete`, `id_lote`) VALUES ('3', '3');
INSERT INTO `forma` (`id_paquete`, `id_lote`) VALUES ('6', '3');
INSERT INTO `forma` (`id_paquete`, `id_lote`) VALUES ('7', '3');
INSERT INTO `forma` (`id_paquete`, `id_lote`) VALUES ('4', '5');
INSERT INTO `transporta` (`id_lote`, `id_camion`) VALUES ('3', '6');
INSERT INTO `transporta` (`id_lote`, `id_camion`) VALUES ('5', '6');

INSERT INTO `lleva` (`id_lote`, `id_plataforma`, `fecha_llegada`, `hora_llegada`) VALUES ('3', '3', '2023-05-23', '17:46:06');
INSERT INTO `lleva` (`id_lote`, `id_plataforma`, `fecha_llegada`, `hora_llegada`) VALUES ('5', '3', '2023-10-04', '14:47:17');
INSERT INTO `forma` (`id_paquete`, `id_lote`) VALUES ('1', '5');