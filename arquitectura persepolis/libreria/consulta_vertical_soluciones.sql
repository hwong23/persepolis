use `persepolis.servicio.vertical`;


select *
from servicio ss 
	join s_especializado esp on ss.idservicio = esp.servicio_idservicio
    join funcionalidad fun on esp.ids_especializado = fun.s_especializado_ids_especializado
    join solucion sol on sol.funcionalidad_idfuncionalidad = fun.idfuncionalidad
where ss.vertical_idvertical = 200;



