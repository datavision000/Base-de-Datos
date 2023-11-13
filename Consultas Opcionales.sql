/*CONSULTA 1: PAQUETES Y SU ESTADO, QUE SE ENCUENTREN EN UNA PLATAFORMA X*/
SELECT
paquete.id_paquete,
paquete.estado,
paquete.fragil,
paquete.tipo,
paquete.detalles,
paquete.volumen,
paquete.peso,
paquete.direccion AS direccion_paquete,
paquete.mail_destinatario,
paquete.fecha_recibido
FROM paquete
INNER JOIN destino ON paquete.id_destino = destino.id_destino
INNER JOIN forma ON paquete.id_paquete = forma.id_paquete
INNER JOIN transporta ON forma.id_lote = transporta.id_lote
INNER JOIN camion ON transporta.id_camion = camion.id_camion
INNER JOIN lleva ON camion.id_camion = lleva.id_camion
INNER JOIN plataforma ON lleva.id_plataforma = plataforma.id_plataforma
WHERE
paquete.estado = "Entregado"
AND plataforma.id_plataforma = 1;

/*CONSULTA 2: LOTES QUE LLEGARON A UNA PLATAFORMA X, 08/2023*/
SELECT
lote.id_lote,
lote.estado,
lote.fragil,
lote.tipo,
lote.detalles,
vehiculo.matricula AS matricula_camion,
lleva.fecha_llegada
FROM lote
INNER JOIN transporta ON lote.id_lote = transporta.id_lote
INNER JOIN camion ON transporta.id_camion = camion.id_camion
INNER JOIN vehiculo ON camion.id_camion = vehiculo.id_vehiculo
INNER JOIN lleva ON camion.id_camion = lleva.id_camion
INNER JOIN plataforma ON lleva.id_plataforma = plataforma.id_plataforma
WHERE
MONTH(lleva.fecha_llegada) = 8
AND YEAR(lleva.fecha_llegada) = 2023
AND plataforma.id_plataforma = 1;


/*CONSULTA 3: CAMIONES QUE ACTUALMENTE SE ENCUENTREN EN RUTA,
JUNTO CON SU CARGA, DESTINO Y HORARIO ESTIMADO DE LLEGADA.*/


/*CONSULTA 4*/
/* NO SE PUEDE HACER: no controlamos cliente final. */

/*CONSULTA 5*/


/*CONSULTA 6: PAQUETES ENTREGADOS, 07/2023, ORDENAR POR FECHA DE ENTREGA (DESC.)*/
SELECT
paquete.id_paquete,
paquete.estado,
paquete.fragil,
paquete.tipo,
paquete.detalles,
paquete.volumen,
paquete.peso,
paquete.direccion AS direccion_paquete,
paquete.mail_destinatario,
paquete.fecha_recibido
FROM paquete
INNER JOIN forma ON paquete.id_paquete = forma.id_paquete
INNER JOIN transporta ON forma.id_lote = transporta.id_lote
INNER JOIN camion ON transporta.id_camion = camion.id_camion
INNER JOIN lleva ON camion.id_camion = lleva.id_camion
WHERE
MONTH(paquete.fecha_recibido) = 7
AND YEAR(paquete.fecha_recibido) = 2023
AND paquete.estado = "Entregado"
ORDER BY
paquete.fecha_recibido DESC;

/*CONSULTA 7*/


/*CONSULTA 8*/


/*CONSULTA 9*/


/*CONSULTA 10*/
