/*CONSULTA 1*/


/*CONSULTA 2*/
SELECT lote.id_lote, lote.cant_paquetes, lote.volumen, lote.peso, lote.fragil, lote.tipo, lote.detalles, lleva.fecha_llegada, lleva.hora_llegada
FROM lleva
INNER JOIN lote ON lleva.id_lote = lote.id_lote
WHERE MONTH(lleva.fecha_llegada) = 8 AND YEAR(lleva.fecha_llegada) = 2023 AND lleva.id_plataforma = 1;

/*CONSULTA 3*/


/*CONSULTA 4*/


/*CONSULTA 5*/


/*CONSULTA 6*/


/*CONSULTA 7*/


/*CONSULTA 8*/
SELECT plataforma.id_plataforma, plataforma.direccion, plataforma.departamento, plataforma.telefono, trayecto.distancia_recorrida, trayecto.duracion_total
FROM llega
INNER JOIN trayecto ON llega.id_trayecto = trayecto.id_trayecto
INNER JOIN plataforma ON llega.id_plataforma = plataforma.id_plataforma
WHERE llega.id_trayecto = 1;

/*CONSULTA 9*/
SELECT DISTINCT trayecto.id_trayecto, trayecto.destino, trayecto.distancia_recorrida, trayecto.duracion_total
FROM llega
INNER JOIN trayecto ON llega.id_trayecto = trayecto.id_trayecto
INNER JOIN se_le_asigna ON llega.id_trayecto = se_le_asigna.id_trayecto
WHERE MONTH(se_le_asigna.fecha_asig_inicio) = 5 AND YEAR(se_le_asigna.fecha_asig_inicio) = 2023
ORDER BY (
  SELECT COUNT(*)
  FROM se_le_asigna AS ord
  WHERE ord.id_camion = se_le_asigna.id_camion
) DESC;

/*CONSULTA 10*/

