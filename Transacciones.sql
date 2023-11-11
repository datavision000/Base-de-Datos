-- Ingreso de tuplas en tabla 'destino'

START TRANSACTION;

INSERT INTO `destino` (`departamento_destino`, `ciudad_destino`)
VALUES
('Montevideo', 'Montevideo'),
('Maldonado', 'Punta del Este'),
('Canelones', 'Atlántida'),
('Cerro Largo', 'Melo'),
('Maldonado', 'Piriápolis');

COMMIT;

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
("Av. José Batlle y Ordoñez 694", "092849372"),
("Neyra 1492", "097593271"),
("Comodoro Coe", "092456821");

COMMIT;

-- Ingreso de tuplas en tabla 'plataforma'

START TRANSACTION;

INSERT INTO `plataforma` (`direccion`, `volumen_maximo`, `ubicacion`, `telefono`)
VALUES
("Humberto I 3928", 120000, 1, "095837122"),
("Avenida Del Mar 1839", 90000, 1, "092184932"),
("Joaquín Artigas 1456", 110000, 3, "094349548"),
("Milton Rusiñol 567", 100000, 3, "092183926"),
("Neyra 1204", 100000, 1, "097888361"),
("Porongos 213", 100000, 1, "097857214"),
("Leguizamón 1872", 100000, 1, "093349851"),
("José Gómez 222", 100000, 2, "094829183"),
("Vuritos 1432", 100000, 4, "098493821"),
("Avenida Brasil 1832", 100000, 1, "091238495");


COMMIT;

-- Ingreso de tuplas en tabla 'camion'

START TRANSACTION;

INSERT INTO `vehiculo` (`matricula`, `volumen_maximo`, `peso_soportado`)
VALUES
("STP-3444", 150, 18000),
("STP-6934", 150, 16000),
("STP-2644", 145, 15000),
("STP-6500", 180, 20000),
("STM-7765", 110, 80000);

INSERT INTO `vehiculo` (`matricula`, `volumen_maximo`, `peso_soportado`, `estado`)
VALUES
("STM-5743", 1234, 1234, "Fuera de servicio"),
("STM-1234", 225, 373, "Fuera de servicio"),
("STP-1276", 6226, 53, "Fuera de servicio"),
("STM-6663", 54, 5959, "Fuera de servicio"),
("STP-2312", 8448, 1234, "Fuera de servicio"),
("STM-2612", 1234, 353, "Fuera de servicio");

INSERT INTO `camion` (`id_camion`)
VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7);

INSERT INTO `camioneta` (`id_camioneta`)
VALUES
(8),
(9),
(10),
(11);

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
("184937392027", "CRECOM", "crecom23@gmail.com"),
("105839405738", "Top Tecno", "topTecno@gmail.com"),
("195849271845", "Adidas", "adidas@gmail.com"),
("184930281744", "Nike", "nike00@gmail.com"),
("585948302712", "Apple", "apple567@gmail.com");

COMMIT;

-- Ingreso de tuplas en tabla 'lote'

START TRANSACTION;

INSERT INTO `lote` (`tipo`, `fragil`, `id_destino`)
VALUES
('Vidrio', 'Si', 1),
('Líquido', 'Si', 1);
INSERT INTO `lote` (`fragil`, `id_destino`)
VALUES
('No', 1),
('No', 1),
('No', 1),
('No', 1),
('No', 1),
('No', 1),
('No', 1),
('No', 1);

COMMIT;

-- Ingreso de tuplas en tabla 'paquete'

START TRANSACTION;

INSERT INTO `paquete` (`codigo_seguimiento`, `tipo`, `volumen`, `peso`, `direccion`, `fragil`, `detalles`, `mail_destinatario`, `estado`, `id_destino`)
VALUES
("FK2L5KSD30FL", 'Liquido', '88', '100', 'Av. Italia 3474', 'Si', 'Nitrógeno líquido', 'hhamilton@gmail.com', 'En almacén central (Lote)', 1),
("39ALFJ281745", 'Vidrio', '80', '22', 'Estivao 1204', 'Si', 'Ventanas blancas', 'peterparker44@gmail.com', 'En almacén central (Lote)', 1);
INSERT INTO `paquete` (`codigo_seguimiento`,`tipo`, `volumen`, `peso`, `direccion`, `fragil`, `detalles`, `mail_destinatario`, `id_destino`, `estado`)
VALUES
("3KA9GL2759AJ", 'Vidrio', '78', '66', 'Rivera 5675', 'Si', 'Ventanas negras', 'charlesion566@gmail.com', 1, 'En almacén central (Lote)');
INSERT INTO `paquete` (`codigo_seguimiento`, `volumen`, `peso`, `direccion`, `fragil`, `mail_destinatario`, `estado`, `id_destino`)
VALUES
("FKALO83NAK17", '800', '500', 'Av. José Batlle y Ordoñez 1302', 'No', 'fredericJhonson@gmail.com', 'En almacén central (Lote)', 1),
("GLAPRO492032", '55', '500', 'Av. Italia 3423', 'No', 'jelou763@gmail.com', 'En almacén central (Lote)', 1),
("FALF928FKAPW", '8030', '500', 'Thiebaut 4532', 'No', 'carl@gmail.com', 'En almacén central (Lote)', 1),
("HLFK33456LAK", '8020', '500', 'Estivao 222', 'No', 'ruti@gmail.com', 'En almacén central (Lote)', 1);
INSERT INTO `paquete` (`codigo_seguimiento`, `volumen`, `peso`, `direccion`, `fragil`, `mail_destinatario`, `id_destino`, `estado`)
VALUES
("FLAOPLDJSPOA", '22', '500', 'Laureles 2111', 'No', 'nast@gmail.com', 4, 'En almacén central (Lote)'),
("FAPO34OJI348", '66', '500', 'Juaripé 2312', 'No', 'fartux@gmail.com', 4, 'En almacén central (Lote)'),
("XMCPAO4IO3J2", '99', '400', 'Calle 3242', 'No', 'lalo2312@gmail.com', 1, 'En almacén central (Lote)');

COMMIT;

-- Ingreso de tuplas en tabla 'login'

START TRANSACTION;

INSERT INTO `login` (`nom_usu`, `mail`, `tipo_usu`, `contrasenia`)
VALUES
('admin', 'administrador@gmail.com', 'admin', '$2y$10$BHT0gjB.xj1G7T4FiIwT9eQxrf1WhPglvpfxWQf5mxkj57/aoyIdS'),
('camionero', 'camionero@gmail.com', 'camionero', '$2y$10$oq4/wuuDS5QVSOczxdXBpOO81hgo.pj74362vLJ1ykb3trYadQiWu'),
('almacenero', 'almacenero@gmail.com', 'almacenero', '$2y$10$E2gOyv9I0xaHHxGVFw6FV.GhF.kWvR1mdL7bbCBjxkgLu/QI2I6He'),
('CRECOM', 'crecom23@gmail.com', 'empresa', '$2y$10$6.Q8/cRTAEuA06N7.9ieSupmIT1V.KuU4SIkuldvHw6p9gyyIg0nW');

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
('9', '9');

INSERT INTO `transporta` (`id_lote`, `id_camion`)
VALUES
('3', '1'),
('5', '1'),
('6', '2'),
('9', '3');

INSERT INTO `trayecto` (`destino`, `destinos_intermedios`, `distancia_recorrida`, `duracion_total`)
VALUES
('Tacuarembó', 'Canelones', 13000, 400),
('Artigas', NULL, 25000, 1000),
('Estadio Centenario', 'Thiebaut 1869', 6, 25),
('Paysandú', 'Estadio Centenario', 18000, 700),
('Felipe Sanguinetti 1884', 'Thiebaut 1869, Laureles 101', 13000, 400);

INSERT INTO `llega` (`id_trayecto`, `id_plataforma`)
VALUES
('1', '1'),
('1', '2'),
('2', '1');

-- Ingreso de tuplas en tabla 'tiene'

START TRANSACTION;

INSERT INTO `tiene` (`id_almacen_cliente`, `id_empresa_cliente`)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

COMMIT;

-- Ingreso de tuplas en tabla 'almacena'

START TRANSACTION;

INSERT INTO `almacena` (`id_almacen_cliente`, `id_paquete`)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(5, 6),
(5, 7),
(5, 8),
(5, 9),
(5, 10);

COMMIT;