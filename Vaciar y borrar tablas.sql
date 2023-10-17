USE datavision;

SET FOREIGN_KEY_CHECKS = 0;

SET @tablas = NULL;
SELECT GROUP_CONCAT(table_name) INTO @tablas FROM information_schema.tables WHERE table_schema = DATABASE();
SET @query = CONCAT('DROP TABLE IF EXISTS ', @tablas);
PREPARE stmt FROM @query;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET FOREIGN_KEY_CHECKS = 1;