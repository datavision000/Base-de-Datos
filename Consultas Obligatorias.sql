/*CONSULTA 1*/


/*CONSULTA 2*/


/*CONSULTA 3*/
SELECT id_camion, matricula, estado FROM camion;

/*CONSULTA 4*/
SELECT camion.id_camion, camion.matricula, camion.volumen_disponible, camion.peso_soportado, camion.estado FROM lleva 
INNER JOIN transporta ON lleva.id_lote = transporta.id_lote
INNER JOIN camion ON transporta.id_camion = camion.id_camion
WHERE MONTH(fecha_llegada)=6 AND id_plataforma=1;

/*CONSULTA 5*/


/*CONSULTA 6*/


/*CONSULTA 7*/


/*CONSULTA 8*/
SELECT matricula FROM camion WHERE estado = "Fuera de servicio";

/*CONSULTA 9*/


/*CONSULTA 10*/
SELECT plataforma.id_plataforma, plataforma.departamento, plataforma.direccion, plataforma.volumen_maximo, plataforma.telefono
FROM plataforma INNER JOIN llega ON plataforma.id_plataforma = llega.id_plataforma
WHERE id_trayecto=1;