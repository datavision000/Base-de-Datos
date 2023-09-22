-- Ingreso de tuplas en tabla 'almacen_central'

START TRANSACTION;

INSERT INTO `almacen_central` (`direccion`, `telefono`)
VALUES
("Rivera 2902", "095937281"),
("Av. Italia 6934", "093569372"),
("Burgues 1032", "095101834"),
("Thieabut 1856", "095291482"),
("Iguá 220", "095493174");

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

INSERT INTO `paquete` (`tipo`, `volumen`, `peso`, `direccion`, `fragil`, `detalles`, `mail_destinatario`)
VALUES
('Liquido', '88', '100', 'Av. Italia 3474', 'Si', 'Nitrógeno líquido', 'hhamilton@gmail.com'),
('Vidrio', '80', '22', 'Estivao 1204', 'Si', 'Ventanas blancas', 'peterparker44@gmail.com');
INSERT INTO `paquete` (`tipo`, `volumen`, `peso`, `direccion`, `fragil`, `detalles`, `mail_destinatario`, `id_destino`)
VALUES
('Vidrio', '78', '66', 'Rivera 5675', 'Si', 'Ventanas negras', 'charlesion566@gmail.com', 3);
INSERT INTO `paquete` (`volumen`, `peso`, `direccion`, `fragil`, `mail_destinatario`)
VALUES
('800', '500', 'Bv. José Batlle y Ordoñez 1302', 'No', 'fredericJhonson@gmail.com'),
('260', '400', 'Felipe Sanguinetti 2043', 'No', 'filtungis@gmail.com');

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
('Amadeus', 'amadeus@gmail.com', 'almacenero', 'amadeus2005'),
('Franco', 'franco@gmail.com', 'camionero', 'franco2005'),
('Gaston', 'gastongolero@gmail.com', 'admin', 'gaston2006');

COMMIT;