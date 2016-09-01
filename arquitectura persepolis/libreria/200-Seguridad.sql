
-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`vertical`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
delete from `persepolis.servicio.vertical`.vertical
where idvertical = 200;

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`vertical`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`vertical` (`idvertical`) VALUES (200);

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`servicio`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`servicio` (`idservicio`, `servicio`, `vertical_idvertical`) 
VALUES (63, 'Seguridad Ciudadana', 200);

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`s_especializado`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` (`ids_especializado`, `especializado`, `servicio_idservicio`) 
VALUES (49, 'Alarmas Ciudadanas', 63);

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`funcionalidad`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) 
VALUES (298, 49, 'Alertas y Alarmas Electrónicas');

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`solucion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`solucion` (`idsolucion`, `funcionalidad_idfuncionalidad`, `solucion`, `descripcion`) 
VALUES (20, 298, 'SOLX100 AAE', 'Alertas y Alarmas ');

COMMIT;



-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
delete from requerimiento_caracteristica
where solucion_idsolucion in (
	select idsolucion from `persepolis.servicio.vertical`.solucion
	where funcionalidad_idfuncionalidad in (
		select idfuncionalidad from `persepolis.servicio.vertical`.funcionalidad
		where s_especializado_ids_especializado in (
			select ids_especializado from `persepolis.servicio.vertical`.s_especializado
			where servicio_idservicio in (
				select idservicio from `persepolis.servicio.vertical`.servicio
				where vertical_idvertical = 200
				)
		)
	)
)
and idrequerimiento_caracteristica > 0;


COMMIT;



-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`requerimiento_caracteristica`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` (`idrequerimiento_caracteristica`, `solucion_idsolucion`, `tipo`, `nombre`) 
VALUES (45, 20, 'Característica', 'Registro de Alarma');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` 
VALUES (46, 20, 'Característica', 'Seguimiento de Alarma y Despacho');

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`implementacion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`implementacion` (`idimplementacion`, `requerimiento_caracteristica_idrequerimiento_caracteristica`, `implementacion`, `diagrama`) 
VALUES (5, 45, 'PRY Alarma Ciudadana', 'https://www.lucidchart.com/publicSegments/view/002cffa6-7044-4d5a-ae3c-ce507816441f/image.jpeg');
INSERT INTO `persepolis.proyecto.solucion`.`implementacion`
VALUES (6, 46, 'PRY Alarma Ciudadana', 'https://www.lucidchart.com/publicSegments/view/002cffa6-7044-4d5a-ae3c-ce507816441f/image.jpeg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`proveedor`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`proveedor` (`idproveedor`, `proveedor`, `implementacion_idimplementacion`, `direccion`, `telefono`, `contacto`, `correo`) 
VALUES (6, 'OyG', 5, 'Bogota DC', '55555555', 'Boris Uzkategui', 'ja@nec.com');
INSERT INTO `persepolis.proyecto.solucion`.`proveedor` 
VALUES (6, 'OyG', 6, 'Bogota DC', '55555555', 'Boris Uzkategui', 'ja@nec.com');

COMMIT;



-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`implementacion_has_componente`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;

INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (5, 8);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (5, 9);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (5, 10);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (5, 11);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (5, 12);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (5, 13);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (5, 14);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (5, 3);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (5, 4);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (5, 7);

COMMIT;


