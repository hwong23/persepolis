
-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`vertical`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
delete from `persepolis.servicio.vertical`.vertical
where idvertical = 500;

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`vertical`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`vertical` (`idvertical`) VALUES (500);

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`servicio`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`servicio` (`idservicio`, `servicio`, `vertical_idvertical`) VALUES (58, 'Monitoreo Plan de Desarrollo Municipal', 500);
INSERT INTO `persepolis.servicio.vertical`.`servicio` (`idservicio`, `servicio`, `vertical_idvertical`) VALUES (59, 'Gestión Financiera Municipal', 500);

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`s_especializado`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` (`ids_especializado`, `especializado`, `servicio_idservicio`) VALUES (33, 'Cumplimiento de Metas del PDM', 58);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` (`ids_especializado`, `especializado`, `servicio_idservicio`) VALUES (34, 'Rendición de Cuentas de la Gestión Municipal', 58);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` (`ids_especializado`, `especializado`, `servicio_idservicio`) VALUES (35, 'PES del Presupuesto anual municipal', 59);

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`funcionalidad`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (231, 33, 'Dar cuenta de los logros anuales del PMD');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (232, 33, 'Generación de Información para la planificación y la toma de decisiones');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (233, 33, 'Medición en tiempo real  del avance del PDM');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (234, 33, 'Medición y explicación de la capacidad de Administración Municipal');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (235, 33, 'Focalización de recursos y acciones de asistencia técnica de la Administración municipal');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (236, 34, 'Informar sobre el desarrollo de gestión a la ciudadanía');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (237, 34, 'Difundir el plan de desarrollo del municipio');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (238, 34, 'Facilita la participación de los ciudadanos en la elaboración y ejecución del PDM');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (239, 35, 'Apoyar y mejorar la Programación del presupuesto');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (240, 35, 'Apoyar y mejorar la Ejecución del presupuesto');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` (`idfuncionalidad`, `s_especializado_ids_especializado`, `funcionalidad`) VALUES (241, 35, 'Apoyar y mejorar el Seguimiento del presupuesto');

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`solucion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`solucion` 
VALUES (19, 239, 'SOLX21 PRES', 'Presupuesto');

COMMIT;



-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
delete from componente 
where idcomponente in (
	select componente_idcomponente from implementacion_has_componente
	where implementacion_idimplementacion in (
		select idimplementacion from implementacion
		where idimplementacion in (
			select implementacion_idimplementacion from requerimiento_caracteristica_has_implementacion
			where requerimiento_caracteristica_idrequerimiento_caracteristica in (
				select idrequerimiento_caracteristica from `persepolis.proyecto.solucion`.requerimiento_caracteristica
				where solucion_idsolucion in (
					select idsolucion from `persepolis.servicio.vertical`.solucion
					where funcionalidad_idfuncionalidad in (
						select idfuncionalidad from `persepolis.servicio.vertical`.funcionalidad
						where s_especializado_ids_especializado in (
							select ids_especializado from `persepolis.servicio.vertical`.s_especializado
							where servicio_idservicio in (
								select idservicio from `persepolis.servicio.vertical`.servicio
								where vertical_idvertical = 500
								)
						)
					)
				)
			)
		)
	)
)
and idcomponente > 0;

COMMIT;

START TRANSACTION;
USE `persepolis.proyecto.solucion`;
delete from implementacion
where idimplementacion in (
	select implementacion_idimplementacion from requerimiento_caracteristica_has_implementacion
	where requerimiento_caracteristica_idrequerimiento_caracteristica in (
		select idrequerimiento_caracteristica from `persepolis.proyecto.solucion`.requerimiento_caracteristica
		where solucion_idsolucion in (
			select idsolucion from `persepolis.servicio.vertical`.solucion
			where funcionalidad_idfuncionalidad in (
				select idfuncionalidad from `persepolis.servicio.vertical`.funcionalidad
				where s_especializado_ids_especializado in (
					select ids_especializado from `persepolis.servicio.vertical`.s_especializado
					where servicio_idservicio in (
						select idservicio from `persepolis.servicio.vertical`.servicio
						where vertical_idvertical = 500
						)
				)
			)
		)
	)
)
and idimplementacion > 0;

COMMIT;

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
				where vertical_idvertical = 500
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
VALUES (44, 19, 'Funcionalidad', 'SOLX21 PRES');

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`implementacion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`implementacion` 
VALUES (4, 'NEC', 'https://www.lucidchart.com/publicSegments/view/cd825ff5-7fcc-45e6-9865-db36a1aa741c/image.jpeg');

COMMIT;



-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` (`requerimiento_caracteristica_idrequerimiento_caracteristica`, `implementacion_idimplementacion`) 
VALUES (44, 4);



-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`proveedor`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`proveedor` (`idproveedor`, `proveedor`, `implementacion_idimplementacion`, `direccion`, `telefono`, `contacto`, `correo`) 
VALUES (5, 'NEC', 4, 'Bogota DC', '55555555', 'John Appleseed', 'ja@nec.com');

COMMIT;



-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`implementacion_has_componente`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` (`implementacion_idimplementacion`, `componente_idcomponente`) 
VALUES (4, 1);


COMMIT;

