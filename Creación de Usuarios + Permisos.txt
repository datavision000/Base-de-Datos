CREATE USER 'admin-backoffice'@'localhost' IDENTIFIED BY 'qds000Admin-L';
CREATE USER 'login'@'localhost' IDENTIFIED BY 'qdsLoginAuth000-L';
CREATE USER 'almacenes'@'localhost' IDENTIFIED BY 'qdsAlmAcEnEs000-L';
CREATE USER 'transito'@'localhost' IDENTIFIED BY 'qdsTransito000-L';

GRANT SELECT, INSERT, UPDATE, DELETE ON QDS.* TO 'admin-backoffice'@'localhost';

GRANT SELECT ON QDS.login TO 'login'@'localhost';

GRANT SELECT, INSERT, UPDATE, DELETE ON QDS.paquete TO 'almacenes'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON QDS.lote TO 'almacenes'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON QDS.forma TO 'almacenes'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON QDS.transporta TO 'almacenes'@'localhost';
GRANT SELECT ON QDS.destino_paquete TO 'almacenes'@'localhost';
GRANT SELECT ON QDS.camion TO 'almacenes'@'localhost';
GRANT SELECT ON QDS.plataforma TO 'almacenes'@'localhost';
GRANT SELECT ON QDS.almacen_central TO 'almacenes'@'localhost';
GRANT SELECT ON QDS.almacen_cliente TO 'almacenes'@'localhost';
