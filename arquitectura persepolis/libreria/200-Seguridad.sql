SET @vertical = 200;
SET @servicio = @vertical;
SET @especializado = @vertical;
SET @funcionalidad = @vertical;
SET @solucion = @vertical;
SET @caracteristica = @vertical;
SET @implementacion = @vertical;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`vertical`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
delete from `persepolis.servicio.vertical`.solucion
	where idsolucion in (
	select solucion_idsolucion from `persepolis.servicio.vertical`.funcionalidad_has_solucion
	where funcionalidad_idfuncionalidad in (
		select idfuncionalidad from `persepolis.servicio.vertical`.funcionalidad
		where s_especializado_ids_especializado in (
			select ids_especializado from `persepolis.servicio.vertical`.s_especializado
			where servicio_idservicio in (
				select idservicio from `persepolis.servicio.vertical`.servicio
				where vertical_idvertical = @vertical
			)
		)
	)
)
and idsolucion > 0;

COMMIT;

START TRANSACTION;
USE `persepolis.servicio.vertical`;
delete from `persepolis.servicio.vertical`.vertical
where idvertical = @vertical;

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`vertical`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`vertical` (`idvertical`) VALUES (@vertical);

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`servicio`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`servicio` VALUES (@servicio, 'Seguridad Ciudadana', @vertical);

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`s_especializado`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` VALUES (@especializado, 'Alarmas Ciudadanas', @servicio);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` VALUES (@especializado+1, 'Apoyo a Comisarias', @servicio);
INSERT INTO `persepolis.servicio.vertical`.`s_especializado` VALUES (@especializado+2, 'Juntas Vecinales', @servicio);

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`funcionalidad`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad, @especializado, 'Alertas y Alarmas Electrónicas');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+1, @especializado+1, 'Apoyo electrónico Comisarias');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+2, @especializado+2, 'Organización de Juntas Vecinales');
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad` VALUES (@funcionalidad+3, @especializado, 'Soporte al Observatorio de Contravenciones');

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`solucion`
-- -----------------------------------------------------



START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (@solucion, 'SOLX200 AAE', 'Alertas y Alarmas') on duplicate key update solucion = rtrim(solucion);
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (@solucion+1, 'SOLX201 COM', 'Comisarias') on duplicate key update solucion = rtrim(solucion);
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (@solucion+2, 'SOLX202 JVE', 'Juntas Vecinales') on duplicate key update solucion = rtrim(solucion);
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (@solucion+3, 'SOLX203 OBC', 'Observatorio de Contravenciones') on duplicate key update solucion = rtrim(solucion);
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (@solucion+4, 'SOLX204 RAP', 'Red de Apoyo a Vigilantes') on duplicate key update solucion = rtrim(solucion);
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (@solucion+5, 'SOLX205 CTE', 'Control Tenencia de Armas') on duplicate key update solucion = rtrim(solucion);
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (@solucion+6, 'SOLX206 INF', 'Informes Especiales') on duplicate key update solucion = rtrim(solucion);

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`funcionalidad_has_solucion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad_has_solucion` VALUES (@funcionalidad, @solucion);
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad_has_solucion` VALUES (@funcionalidad+1, @solucion+1);
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad_has_solucion` VALUES (@funcionalidad+2, @solucion+2);
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad_has_solucion` VALUES (@funcionalidad+3, @solucion+3);

COMMIT;



-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
delete from `persepolis.proyecto.solucion`.implementacion_has_proveedor
where implementacion_idimplementacion in (
	select idimplementacion from `persepolis.proyecto.solucion`.implementacion
	where idimplementacion in (
		select implementacion_idimplementacion from `persepolis.proyecto.solucion`.requerimiento_caracteristica_has_implementacion
		where requerimiento_caracteristica_idrequerimiento_caracteristica in (
			select idrequerimiento_caracteristica from `persepolis.proyecto.solucion`.requerimiento_caracteristica
			where solucion_idsolucion in (
				select idsolucion from `persepolis.servicio.vertical`.solucion
				where idsolucion in (
                	select solucion_idsolucion from `persepolis.servicio.vertical`.funcionalidad_has_solucion
					where funcionalidad_idfuncionalidad in (
						select idfuncionalidad from `persepolis.servicio.vertical`.funcionalidad
						where s_especializado_ids_especializado in (
							select ids_especializado from `persepolis.servicio.vertical`.s_especializado
							where servicio_idservicio in (
								select idservicio from `persepolis.servicio.vertical`.servicio
								where vertical_idvertical = @vertical 
							)
						)
					)
				)
			)
		)
	)
)
and implementacion_idimplementacion > 0;

COMMIT;

START TRANSACTION;
USE `persepolis.proyecto.solucion`;

delete from `persepolis.proyecto.solucion`.implementacion_has_componente
where implementacion_idimplementacion in (
	select idimplementacion from `persepolis.proyecto.solucion`.implementacion
	where idimplementacion in (
		select implementacion_idimplementacion from `persepolis.proyecto.solucion`.requerimiento_caracteristica_has_implementacion
		where requerimiento_caracteristica_idrequerimiento_caracteristica in (
			select idrequerimiento_caracteristica from `persepolis.proyecto.solucion`.requerimiento_caracteristica
			where solucion_idsolucion in (
				select idsolucion from `persepolis.servicio.vertical`.solucion
				where idsolucion in (
				select solucion_idsolucion from `persepolis.servicio.vertical`.funcionalidad_has_solucion
				where funcionalidad_idfuncionalidad in (
					select idfuncionalidad from `persepolis.servicio.vertical`.funcionalidad
					where s_especializado_ids_especializado in (
						select ids_especializado from `persepolis.servicio.vertical`.s_especializado
						where servicio_idservicio in (
							select idservicio from `persepolis.servicio.vertical`.servicio
							where vertical_idvertical = @vertical 
							)
						)
					)
				)
			)
		)
	)
)
and implementacion_idimplementacion > 0;

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
			where idsolucion in (
            select solucion_idsolucion from `persepolis.servicio.vertical`.funcionalidad_has_solucion
            where funcionalidad_idfuncionalidad in (
				select idfuncionalidad from `persepolis.servicio.vertical`.funcionalidad
				where s_especializado_ids_especializado in (
					select ids_especializado from `persepolis.servicio.vertical`.s_especializado
					where servicio_idservicio in (
						select idservicio from `persepolis.servicio.vertical`.servicio
						where vertical_idvertical = @vertical 
						)
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
			where idsolucion in (
            select solucion_idsolucion from `persepolis.servicio.vertical`.funcionalidad_has_solucion
            where funcionalidad_idfuncionalidad in (
				select idfuncionalidad from `persepolis.servicio.vertical`.funcionalidad
				where s_especializado_ids_especializado in (
					select ids_especializado from `persepolis.servicio.vertical`.s_especializado
					where servicio_idservicio in (
						select idservicio from `persepolis.servicio.vertical`.servicio
						where vertical_idvertical = @vertical 
				)
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
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica, @solucion, 'Caracteristica', 'Registro de alarma');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica+1, @solucion, 'Caracteristica', 'Seguimiento de alarmas');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica+2, @solucion, 'Caracteristica', 'Análisis de datos de Alarmas');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica+3, @solucion+1, 'Caracteristica', 'Registro y Asignación del Caso');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica+4, @solucion+1, 'Caracteristica', 'Actualización o Cierre del Caso');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` VALUES (@caracteristica+5, @solucion+1, 'Caracteristica', 'Seguimiento del Caso');

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`implementacion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`implementacion` VALUES (@implementacion, 'PRY Alarma ciudadana', 'https://www.lucidchart.com/publicSegments/view/3b8db7e5-16f6-4886-b276-b2dc818535d5/image.jpeg');
INSERT INTO `persepolis.proyecto.solucion`.`implementacion` VALUES (@implementacion+1, 'PRY Comisaria', 'https://www.lucidchart.com/publicSegments/view/3b8db7e5-16f6-4886-b276-b2dc818535d5/image.jpeg');
COMMIT;



-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica, @implementacion);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica+1, @implementacion);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica+2, @implementacion);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica+3, @implementacion+1);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica+4, @implementacion+1);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` VALUES (@caracteristica+5, @implementacion+1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`implementacion_has_proveedor`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_proveedor` VALUES (@implementacion, 2);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_proveedor` VALUES (@implementacion+1, 2);

COMMIT;



-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`implementacion_has_componente`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;

-- componentes de la implementacion 200
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion, 8);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion, 9);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion, 10);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion, 11);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion, 12);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion, 13);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion, 14);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion, 15);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion, 16);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion, 17);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion, 18);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion, 19);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion, 20);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion, 21);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion, 22);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion, 23);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion, 24);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion, 25);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion, 26);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion, 27);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion, 28);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion, 29);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion, 30);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion, 31);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion, 32);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion, 33);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion, 34);
-- componentes de la implementacion 201
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+1, 8);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+1, 9);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+1, 10);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+1, 11);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+1, 12);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+1, 13);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+1, 14);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+1, 15);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+1, 16);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+1, 17);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+1, 18);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+1, 19);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+1, 20);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+1, 21);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+1, 22);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+1, 23);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+1, 24);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+1, 25);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+1, 26);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+1, 27);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+1, 28);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+1, 29);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+1, 30);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+1, 31);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (@implementacion+1, 32);


COMMIT;


