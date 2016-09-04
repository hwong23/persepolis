USE `persepolis.proyecto.solucion`;
delete from `persepolis.proyecto.solucion`.`componente` where idcomponente > 0;


-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`componente`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`componente` (`idcomponente`, `componente`, `tipo_tecnologia`, `costo_aproximado`, `plazo_aproximado`) 
VALUES (1, 'ESB', 'Integración', 450000000.34, 6);
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (3, 'Servidor Aplicaciones', 'Software Base', 150000000.34, 3);
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (4, 'RDBMS', 'Software Base', 170000000.34, 3);
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (5, 'Dispositivo móvil', 'Dispositivo', 10000000.34, 2);
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (6, 'Servidor de Aplicaciones', 'Software Base', 450000000.34, 5);
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (7, 'Canal Internet', 'Comunicación', 150000000.34, 5);

COMMIT;
