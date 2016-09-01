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

INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (8, 'C0-01. Función o App Movil', 'Aplicación', 15000000, 1);
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (9, 'C0-02. App Web Pequeña', 'Aplicación', 40000000, 2);
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (10, 'C0-03. Punto Recepción datos', 'Aplicación', 15000000, 1);
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (11, 'C0-04. Punto de Integración con SECAD', 'Aplicación', 15000000, 2);
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (12, 'C0-05. Punto Recepción datos. ', 'Aplicación', 15000000, 1);
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (13, 'C0-06. Punto de Integración PERSEPOLIS', 'Aplicación', 15000000, 2);
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (14, 'C0-07. Punto Recepción datos', 'Aplicación', 15000000, 2);

COMMIT;
