USE `persepolis.proyecto.solucion`;

-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`componente`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (1, 'C0-26. ESB', 'Base', 1000000, 1) on duplicate key update costo_aproximado = 2600000, plazo_aproximado = 1;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (2, 'CO-27. Servidor Aplicaciones', 'Software Base', 1000000, 1) on duplicate key update costo_aproximado = 2600000, plazo_aproximado = 1;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (3, 'CO-28. RDBMS', 'Software Base', 1000000.34, 1) on duplicate key update costo_aproximado = 1300000, plazo_aproximado = 0.5;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (4, 'CO-29. Dispositivo móvil', 'Dispositivo', 1000000.34, 1) on duplicate key update costo_aproximado = 520000, plazo_aproximado = 0.2;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (5, 'CO-30. Servidor de Aplicaciones', 'Dispositivo', 1000000, 1) on duplicate key update costo_aproximado = 2600000, plazo_aproximado = 1;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (6, 'CO-31. Canal Internet', 'Comunicación', 1000000, 1) on duplicate key update costo_aproximado = 4000000, plazo_aproximado = 1;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (8, 'C0-01. Función o App Movil', 'Aplicación', 1000000, 1) on duplicate key update costo_aproximado = 5200000, plazo_aproximado = 2;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (9, 'C0-02. App Web', 'Aplicación', 1000000, 1) on duplicate key update costo_aproximado = 7800000, plazo_aproximado = 3;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (10, 'C0-03. Punto Recepción datos', 'Aplicación', 1000000, 1) on duplicate key update costo_aproximado = 5200000, plazo_aproximado = 2;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (11, 'C0-04. Punto de Integración con <<SI Oficial>>', 'Aplicación', 1000000, 1) on duplicate key update costo_aproximado = 5200000, plazo_aproximado = 2;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (12, 'C0-05. Punto Recepción datos', 'Aplicación', 1000000, 1) on duplicate key update costo_aproximado = 5200000, plazo_aproximado = 2;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (13, 'C0-06. Punto de Integración PERSEPOLIS', 'Aplicación', 1000000, 1) on duplicate key update costo_aproximado = 6500000, plazo_aproximado = 2.5;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (14, 'C0-07. Punto Recepción datos', 'Aplicación', 1000000, 1) on duplicate key update costo_aproximado = 5200000, plazo_aproximado = 2;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (15, 'C0-08. Punto de Integración <<sistema alarmas>>', 'Aplicación', 1000000, 1) on duplicate key update costo_aproximado = 5200000, plazo_aproximado = 2;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (16, 'C0-09. App. Información de Alarmas', 'Aplicación', 1000000, 1) on duplicate key update costo_aproximado = 10400000, plazo_aproximado = 4;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (17, 'C0-10. App. Informe de Eventos', 'Aplicación', 1000000, 1) on duplicate key update costo_aproximado = 10400000, plazo_aproximado = 4;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (18, 'C0-11. App. Informe Operativo', 'Aplicación', 1000000, 1) on duplicate key update costo_aproximado = 5200000, plazo_aproximado = 2;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (19, 'C0-12. Integración - Servidor de Applicaciones Linux', 'Aplicación', 1000000, 1) on duplicate key update costo_aproximado = 2600000, plazo_aproximado = 1;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (20, 'CO-13. Portal de Alarmas - Servidor de Applicaciones Linux', 'Aplicación', 1000000, 1) on duplicate key update costo_aproximado = 2600000, plazo_aproximado = 1;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (21, 'C0-14. Integración - Servidor de Applicaciones Linux', 'Aplicación', 1000000, 1) on duplicate key update costo_aproximado = 2600000, plazo_aproximado = 1;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (22, 'C0-15. MSSQL - Servidor de Base de Datos ', 'Base de datos', 1000000, 1) on duplicate key update costo_aproximado = 1300000, plazo_aproximado = 0.5;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (23, 'C0-16. Integración - Servidor de Applicaciones  Linux / Windows', 'Aplicación', 1000000, 1) on duplicate key update costo_aproximado = 1300000, plazo_aproximado = 0.5;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (24, 'C0-17. MSSQL - Servidor de Base de Datos ', 'Base de datos', 1000000, 1) on duplicate key update costo_aproximado = 1300000, plazo_aproximado = 0.5;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (25, 'C0-18. Tablero de Control - Servidor de Applicaciones  RHES / Windows', 'Aplicación', 1000000, 1) on duplicate key update costo_aproximado = 1300000, plazo_aproximado = 0.5;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (26, 'C0-19. Aplicaciones Personalizadas - Servidor de Applicaciones  RHES / Windows', 'Aplicación', 1000000, 1) on duplicate key update costo_aproximado = 7800000, plazo_aproximado = 3;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (27, 'CO-20. <<Certificado>> SSL 256bits', 'Dispositivo', 1000000, 1) on duplicate key update costo_aproximado = 1800000, plazo_aproximado = 0;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (28, 'CO-21. <<ADSL>> 20 Mbits', 'Comunicación', 1000000, 1) on duplicate key update costo_aproximado = 2200000, plazo_aproximado = 1;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (29, 'CO-22. <<Switch>> Linksys', 'Dispositivo', 1000000, 1) on duplicate key update costo_aproximado = 800000, plazo_aproximado = 0;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (30, 'CO-23. <<Firewall>> Huawei C3', 'Dispositivo', 1000000, 1) on duplicate key update costo_aproximado = 6000000, plazo_aproximado = 0;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (31, 'CO-24. <<Dispositivo>> Balanceador - Servidor de Applicaciones Linux', 'Dispositivo', 1000000, 1) on duplicate key update componente = 'CO-24. <<Dispositivo>> Balanceador - Servidor de Applicaciones Linux', costo_aproximado = 400000, plazo_aproximado = 0;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (32, 'CO-32. <<ADSL>> 20 Mbits', 'Comunicación', 1000000, 1) on duplicate key update costo_aproximado = 2200000, plazo_aproximado = 1;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (33, 'C0-33. MIAS Servidor de Análisis de Datos', 'Dispositivo', 1000000, 1) on duplicate key update costo_aproximado = 400000, plazo_aproximado = 0;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (34, 'C0-34. Analítica Contravenciones y otros Eventos relacionados', 'Dispositivo', 1000000, 1) on duplicate key update costo_aproximado = 10400000, plazo_aproximado = 4;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (35, 'C0-54. App. Información de Juntas', 'Aplicación', 1000000, 1) on duplicate key update costo_aproximado = 7800000, plazo_aproximado = 3;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (36, 'C0-56. Propagador de Mensaje', 'Aplicación', 1000000, 1) on duplicate key update costo_aproximado = 5200000, plazo_aproximado = 2;
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (37, 'C0-57. UPS 5 KVA', 'Dispositivo', 1000000, 1) on duplicate key update costo_aproximado = 2100000, plazo_aproximado = 0;

commit;



-- Nivel Medio: 32GB, 3T, 4 Cores
