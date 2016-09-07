
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
				where vertical_idvertical = 200
			)
		)
	)
)
and idsolucion > 0;

COMMIT;

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
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (200, 'SOLX200 AAE', 'Alertas y Alarmas');
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (201, 'SOLX201 COM', 'Comisarias');
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (202, 'SOLX202 JVE', 'Juntas Vecinales');
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (203, 'SOLX203 OBC', 'Observatorio de Contravenciones');
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (204, 'SOLX204 RAP', 'Red de Apoyo a Vigilantes');
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (205, 'SOLX205 CTE', 'Control Tenencia de Armas');
INSERT INTO `persepolis.servicio.vertical`.`solucion` VALUES (206, 'SOLX206 INF', 'Informes Especiales');

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.servicio.vertical`.`funcionalidad_has_solucion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.servicio.vertical`;
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad_has_solucion` VALUES (298, 200);
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad_has_solucion` VALUES (298, 201);
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad_has_solucion` VALUES (298, 203);
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad_has_solucion` VALUES (298, 204);
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad_has_solucion` VALUES (298, 205);
INSERT INTO `persepolis.servicio.vertical`.`funcionalidad_has_solucion` VALUES (298, 206);

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
								where vertical_idvertical = 200
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
							where vertical_idvertical = 200
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
						where vertical_idvertical = 200
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
						where vertical_idvertical = 200
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
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` (`idrequerimiento_caracteristica`, `solucion_idsolucion`, `tipo`, `nombre`) 
VALUES (45, 20, 'caracteristica', 'registro de alarma');
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica` (`idrequerimiento_caracteristica`, `solucion_idsolucion`, `tipo`, `nombre`) 
VALUES (46, 20, 'caracteristica', 'seguimiento de alarmas');

COMMIT;


-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`implementacion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`implementacion` (`idimplementacion`, `implementacion`, `diagrama`) 
VALUES (5, 'PRY Alarma ciudadana', 'https://www.lucidchart.com/publicSegments/view/3b8db7e5-16f6-4886-b276-b2dc818535d5/image.jpeg');

COMMIT;



-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` (`requerimiento_caracteristica_idrequerimiento_caracteristica`, `implementacion_idimplementacion`) 
VALUES (45, 5);
INSERT INTO `persepolis.proyecto.solucion`.`requerimiento_caracteristica_has_implementacion` (`requerimiento_caracteristica_idrequerimiento_caracteristica`, `implementacion_idimplementacion`) 
VALUES (46, 5);



-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`proveedor`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;
INSERT INTO `persepolis.proyecto.solucion`.`proveedor` (`idproveedor`, `proveedor`, `implementacion_idimplementacion`, `direccion`, `telefono`, `contacto`, `correo`) 
VALUES (1, 'OyG', 5, 'Bogota DC', '55555555', 'John Appleseed', 'ja@nec.com');

COMMIT;



-- -----------------------------------------------------
-- Data for table `persepolis.proyecto.solucion`.`componente`
-- -----------------------------------------------------
START TRANSACTION;
USE `persepolis.proyecto.solucion`;

INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (8, 'C0-01. Función o App Movil', 'Aplicación', 1000000, 1);
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (9, 'C0-02. App Web', 'Aplicación', 4000000, 2);
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (10, 'C0-03. Punto Recepción datos', 'Aplicación', 1000000, 1);
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (11, 'C0-04. Punto de Integración con SECAD', 'Aplicación', 1000000, 2);
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (12, 'C0-05. Punto Recepción datos. ', 'Aplicación', 1000000, 1);
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (13, 'C0-06. Punto de Integración PERSEPOLIS', 'Aplicación', 1000000, 2);
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (14, 'C0-07. Punto Recepción datos', 'Aplicación', 1000000, 2);
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (15, 'C0-08. Punto de Integración <<sistema alarmas>>', 'Aplicación', 1000000, 2);
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (16, 'C0-09. App. Información de Alarmas', 'Aplicación', 1000000, 2);
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (17, 'C0-10. App. Informe de Eventos', 'Aplicación', 1000000, 2);
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (18, 'C0-11. App. Informe Operativo', 'Aplicación', 1000000, 2);
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (19, 'C0-12. Integración - Servidor de Applicaciones Linux', 'Aplicación', 1000000, 2);
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (20, 'CO-13. Portal de Alarmas - Servidor de Applicaciones Linux', 'Aplicación', 1000000, 2);
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (21, 'C0-14. Integración - Servidor de Applicaciones Linux', 'Aplicación', 1000000, 2);
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (22, 'C0-15. MSSQL - Servidor de Base de Datos ', 'Base de datos', 1000000, 2);
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (23, 'C0-16. Integración - Servidor de Applicaciones  Linux / Windows', 'Aplicación', 1000000, 2);
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (24, 'C0-17. MSSQL - Servidor de Base de Datos ', 'Base de datos', 1000000, 2);
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (25, 'C0-18. Tablero de Control - Servidor de Applicaciones  RHES / Windows', 'Aplicación', 1000000, 2);
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (26, 'C0-19. Aplicaciones Personalizadas - Servidor de Applicaciones  RHES / Windows', 'Aplicación', 1000000, 2);
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (27, 'CO-20. <<Certificado>> SSL', 'Dispositivo', 1000000, 2);
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (28, 'CO-21. <<ADSL>> 20 Mbits', 'Comunicación', 1000000, 2);
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (29, 'CO-22. <<Switch>> Linksys ', 'Dispositivo', 1000000, 2);
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (30, 'CO-23. <<Firewall>> Cisco', 'Dispositivo', 1000000, 2);
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (31, 'CO-24. Balanceador - Servidor de Applicaciones Linux', 'Dispositivo', 1000000, 2);
INSERT INTO `persepolis.proyecto.solucion`.`componente` VALUES (32, 'CO-25. <<ADSL>> 20 Mbits', 'Comunicación', 1000000, 2);

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
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (5, 15);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (5, 16);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (5, 17);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (5, 18);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (5, 19);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (5, 20);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (5, 21);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (5, 22);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (5, 23);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (5, 24);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (5, 25);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (5, 26);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (5, 27);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (5, 28);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (5, 29);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (5, 30);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (5, 31);
INSERT INTO `persepolis.proyecto.solucion`.`implementacion_has_componente` VALUES (5, 32);

COMMIT;


