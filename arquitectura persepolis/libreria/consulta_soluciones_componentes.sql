use `persepolis.proyecto.solucion`;


select * 
from 
`persepolis.servicio.vertical`.solucion a 
	join `persepolis.proyecto.solucion`.requerimiento_caracteristica b	on a.idsolucion = b.solucion_idsolucion 
    join `persepolis.proyecto.solucion`.implementacion aa on b.idrequerimiento_caracteristica = aa.requerimiento_caracteristica_idrequerimiento_caracteristica 
    left join `persepolis.proyecto.solucion`.proveedor prov on aa.idimplementacion = prov.implementacion_idimplementacion
    left join `persepolis.proyecto.solucion`.implementacion_has_componente c on aa.idimplementacion = c.implementacion_idimplementacion
    left join `persepolis.proyecto.solucion`.componente d on c.componente_idcomponente = d.idcomponente
;

