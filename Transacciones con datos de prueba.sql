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
("Avenida Del Mar 1839", 90000, "Maldonado", "092184932"),
("Joaquín Artigas 1456", 110000, "Treinta y Tres", "094349548"),
("Milton Rusiñol 567", 100000, "Flores", "092183926"),
("Neyra 1204", 100000, "Durazno", "097888361"),
("Porongos 213", 100000, "Montevideo", "097857214"),
("Leguizamón 1872", 100000, "Montevideo", "093349851"),
("José Gómez 222", 100000, "Montevideo", "094829183"),
("Vuritos 1432", 100000, "Montevideo", "098493821"),
("Avenida Brasil 1832", 100000, "Montevideo", "091238495");


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
("STM-5743", 1234, 1234, "Fuera de servicio"),
("STM-1234", 225, 373, "Fuera de servicio"),
("STP-1276", 6226, 53, "Fuera de servicio"),
("STM-6663", 54, 5959, "Fuera de servicio"),
("STP-2312", 8448, 1234, "Fuera de servicio"),
("STM-2612", 1234, 353, "Fuera de servicio");

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
('100', '34', 'No', '2023-11-15', '20:00:00'),
('130', '22', 'No', '2023-11-18', '20:00:00'),
('43224', '5', 'No', '2023-11-25', '20:00:00'),
('104320', '66', 'No', '2023-10-10', '20:00:00'),
('41', '17', 'No', '2023-12-15', '20:00:00'),
('222', '88', 'No', '2023-12-24', '20:00:00'),
('100', '200', 'No', '2023-11-11', '20:00:00');


COMMIT;

-- Ingreso de tuplas en tabla 'destino_paquete'

START TRANSACTION;

INSERT INTO `destino_paquete` (`departamento_destino`, `ciudad_destino`)
VALUES
('Montevideo', 'Montevideo'),
('Maldonado', 'Punta del Este'),
('Canelones', 'Atlántida'),
('Cerro Largo', 'Melo'),
('Maldonado', 'Piriápolis');

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
("GLAPRO492032", '55', '500', 'Av. Italia 3423', 'No', 'jelou763@gmail.com'),
("FALF928FKAPW", '8030', '500', 'Thiebaut 4532', 'No', 'carl@gmail.com'),
("HLFK33456LAK", '8020', '500', 'Estivao 222', 'No', 'ruti@gmail.com'),
("FLAOPLDJSPOA", '22', '500', 'Laureles 2111', 'No', 'nast@gmail.com'),
("FAPO34OJI348", '66', '500', 'Juaripé 2312', 'No', 'fartux@gmail.com'),
("XMCPAO4IO3J2", '99', '400', 'Calle 3242', 'No', 'lalo2312@gmail.com');

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


INSERT INTO `forma` (`id_paquete`, `id_lote`)
VALUES
('1', '5'),
('3', '3'),
('6', '3'),
('7', '3'),
('4', '5'),
('2', '5'),
('5', '6'),
('8', '9'),
('9', '9'),
('10', '8');

INSERT INTO `transporta` (`id_lote`, `id_camion`)
VALUES
('3', '3'),
('5', '3'),
('6', '9'),
('8', '9'),
('9', '4');

INSERT INTO `lleva` (`id_lote`, `id_plataforma`, `fecha_llegada`)
VALUES
('9', '9', '2023-05-23'),
('8', '9', '2023-05-23'),
('6', '8', '2023-06-08'),
('5', '5', NULL);


INSERT INTO `maneja` (`id_camion`, `id_camionero`, `fecha_inicio_manejo`, `hora_inicio_manejo`, `fecha_fin_manejo`, `hora_fin_manejo`)
VALUES
('1', '1', '2023-10-02', '15:31:42', '2023-10-03', '00:31:42'),
('2', '2', '2023-10-02', '15:31:42', '2023-10-03', '00:31:42');