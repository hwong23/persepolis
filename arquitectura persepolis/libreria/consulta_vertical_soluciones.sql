use `persepolis.servicio.vertical`;


select *
from servicio ss 
	join s_especializado esp on ss.idservicio = esp.servicio_idservicio
    join funcionalidad fun on esp.ids_especializado = fun.s_especializado_ids_especializado
    join solucion sol on sol.funcionalidad_idfuncionalidad = fun.idfuncionalidad
where ss.vertical_idvertical = 200;


select *
from servicio ss 
	join s_especializado esp on ss.idservicio = esp.servicio_idservicio
    join funcionalidad fun on esp.ids_especializado = fun.s_especializado_ids_especializado
    join solucion sol on sol.funcionalidad_idfuncionalidad = fun.idfuncionalidad
    join `persepolis.proyecto.solucion`.requerimiento_caracteristica car on car.solucion_idsolucion = sol.idsolucion
    join `persepolis.proyecto.solucion`.requerimiento_caracteristica_has_implementacion carimpl on requerimiento_caracteristica_idrequerimiento_caracteristica = car.idrequerimiento_caracteristica
    join `persepolis.proyecto.solucion`.implementacion impl on impl.idimplementacion = carimpl.implementacion_idimplementacion
where ss.vertical_idvertical = 200;


