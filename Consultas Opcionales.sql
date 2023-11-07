/*CONSULTA 1*/
SELECT paquete.id_paquete, destino.departamento_destino, destino.ciudad_destino, paquete.estado
FROM almacena
INNER JOIN paquete ON almacena.id_paquete = paquete.id_paquete
INNER JOIN destino ON paquete.id_destino = destino.id_destino
WHERE almacena.id_almacen_cliente = 1;

/*CONSULTA 2*/
SELECT lote.id_lote, lote.cant_paquetes, lote.volumen, lote.peso, lote.fragil, lote.tipo, lote.detalles, lleva.fecha_llegada, lleva.hora_llegada
FROM lleva
INNER JOIN lote ON lleva.id_lote = lote.id_lote
WHERE MONTH(lleva.fecha_llegada) = 8 AND YEAR(lleva.fecha_llegada) = 2023 AND lleva.id_plataforma = 1;

/*CONSULTA 3*/


/*CONSULTA 4*/
/* NO SE PUEDE HACER: no controlamos cliente final. */

/*CONSULTA 5*/


/*CONSULTA 6*/


/*CONSULTA 7*/


/*CONSULTA 8*/
SELECT plataforma.id_plataforma, plataforma.direccion, destino.departamento_destino, destino.ciudad_destino, plataforma.telefono, trayecto.distancia_recorrida, trayecto.duracion_total
FROM llega
INNER JOIN trayecto ON llega.id_trayecto = trayecto.id_trayecto
INNER JOIN plataforma ON llega.id_plataforma = plataforma.id_plataforma
INNER JOIN destino ON plataforma.ubicacion = destino.id_destino
WHERE llega.id_trayecto = 1;

/*CONSULTA 9*/


/*CONSULTA 10*/

