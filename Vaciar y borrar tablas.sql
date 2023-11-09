USE datavision;

-- Desactivar verificación de claves foráneas
SET FOREIGN_KEY_CHECKS = 0;

-- Borrar tablas
SET @tablas = NULL;
SELECT GROUP_CONCAT(table_name) INTO @tablas FROM information_schema.tables WHERE table_schema = DATABASE();
SET @query = CONCAT('DROP TABLE IF EXISTS ', @tablas);
PREPARE stmt FROM @query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Borrar vistas
SET @vistas = NULL;
SELECT GROUP_CONCAT(table_name) INTO @vistas FROM information_schema.views WHERE table_schema = DATABASE();
SET @query = CONCAT('DROP VIEW IF EXISTS ', @vistas);
PREPARE stmt FROM @query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Activar verificación de claves foráneas
SET FOREIGN_KEY_CHECKS = 1;