/*CONSULTA 1: PAQUETES ENTREGADOS, 05/2023, DESTINO: CIUDAD DE MELO.*/
SELECT
paquete.id_paquete,
paquete.mail_destinatario,
paquete.direccion,
paquete.fragil,
paquete.tipo,
paquete.detalles,
paquete.peso,
paquete.volumen,
CONCAT(destino.ciudad_destino, ', ', destino.departamento_destino) AS destino,
lleva.fecha_llegada
FROM lleva
INNER JOIN forma ON lleva.id_lote = forma.id_lote
INNER JOIN paquete ON forma.id_paquete = paquete.id_paquete
INNER JOIN destino ON paquete.id_destino = destino.id_destino
WHERE
lleva.fecha_llegada IS NOT NULL
AND MONTH(lleva.fecha_llegada) = 5
AND YEAR(lleva.fecha_llegada) = 2023
AND destino.ciudad_destino = "Melo";

/*CONSULTA 2: PLATAFORMAS Y  PAQUETES ENTREGADOS EN LAS MISMAS,
2023, ORDENARLOS: LOS QUE RECIBIERON DE MÁS A MENOS.*/
SELECT
plataforma.id_plataforma
plataforma.direccion as direccion_plataforma
lleva.fecha_llegada,
paquete.id_paquete,
paquete.mail_destinatario,
paquete.direccion,
paquete.fragil,
paquete.tipo,
paquete.detalles,
paquete.peso,
paquete.volumen,
CONCAT(destino.ciudad_destino, ', ', destino.departamento_destino) AS destino_paquete
FROM paquete
INNER JOIN destino ON paquete.id_destino = destino.id_destino
INNER JOIN forma ON paquete.id_paquete = forma.id_paquete
INNER JOIN lleva ON forma.id_lote = lleva.id_lote
INNER JOIN plataforma ON lleva.id_plataforma = plataforma.id_plataforma
INNER JOIN (
    SELECT lleva.id_plataforma, COUNT(paquete.id_paquete) AS cantidad_paquetes
    FROM paquete
    INNER JOIN forma ON paquete.id_paquete = forma.id_paquete
    INNER JOIN lleva ON forma.id_lote = lleva.id_lote
    GROUP BY lleva.id_plataforma
) AS subconsulta ON lleva.id_plataforma = subconsulta.id_plataforma
WHERE
lleva.fecha_llegada IS NOT NULL
AND lleva.hora_llegada IS NOT NULL
AND YEAR(lleva.fecha_llegada) = 2023
ORDER BY subconsulta.cantidad_paquetes DESC;

/*CONSULTA 3: CAMIONES REGISTRADOS Y SU TAREA ACTUAL.*/
SELECT
camion.id_camion,
vehiculo.matricula,
vehiculo.estado
FROM vehiculo
INNER JOIN camion ON camion.id_camion = vehiculo.id_vehiculo;

/*CONSULTA 4: CAMIONES QUE VISITARON X PLATAFORMA (JUNIO).*/
SELECT
plataforma.id_plataforma
plataforma.direccion AS direccion_plataforma,
CONCAT(lleva.fecha_llegada, ' a las ', lleva.hora_llegada) AS fecha_visita,
camion.id_camion,
vehiculo.matricula,
vehiculo.volumen_maximo,
vehiculo.peso_soportado,
vehiculo.estado AS estado_camion
FROM lleva
INNER JOIN transporta ON lleva.id_lote = transporta.id_lote
INNER JOIN camion ON transporta.id_camion = camion.id_camion
INNER JOIN vehiculo ON vehiculo.id_vehiculo = camion.id_camion
INNER JOIN plataforma ON lleva.id_plataforma = plataforma.id_plataforma
WHERE
MONTH(fecha_llegada) = 6
AND lleva.id_plataforma = 4;

/*CONSULTA 5: DESTINO, LOTE, PLATAFORMA DESTINO Y CAMIÓN QUE TRANSPORTA UN PAQUETE X.*/
SELECT
paquete.id_paquete,
paquete.direccion AS direccion_paquete,
paquete.mail_destinatario,
CONCAT(destino.ciudad_destino, ', ', destino.departamento_destino) AS destino_paquete,
forma.id_lote,
lleva.id_plataforma,
plataforma.direccion as direccion_plataforma,
camion.id_camion,
vehiculo.matricula AS camion_matricula
FROM paquete
INNER JOIN destino ON paquete.id_destino = destino.id_destino
LEFT JOIN forma ON paquete.id_paquete = forma.id_paquete
LEFT JOIN transporta ON forma.id_lote = transporta.id_lote
LEFT JOIN lleva ON transporta.id_lote = lleva.id_lote
LEFT JOIN plataforma ON lleva.id_plataforma = plataforma.id_plataforma
LEFT JOIN camion ON transporta.id_camion = camion.id_camion
LEFT JOIN vehiculo ON vehiculo.id_vehiculo = camion.id_camion
WHERE
paquete.id_paquete = 9;

/*CONSULTA 6: ID PAQUETE, ID LOTE, MATRICULA DEL CAMION QUE LO TRANSPORTA,
PLATAFORMA DESTINO, DIRECCIÓN FINAL Y EL ESTADO DEL ENVÍO,
PARA LOS PAQUETES QUE SE RECIBIERON HACE MAS DE 3 DÍAS.*/
SELECT
paquete.id_paquete,
forma.id_lote,
vehiculo.matricula AS matricula_camion,
lleva.id_plataforma,
plataforma.direccion AS direccion_plataforma,
paquete.direccion AS direccion_final_paquete,
lote.estado
FROM paquete
INNER JOIN forma ON paquete.id_paquete = forma.id_paquete
INNER JOIN transporta ON forma.id_lote = transporta.id_lote
INNER JOIN camion ON transporta.id_camion = camion.id_camion
INNER JOIN vehiculo ON vehiculo.id_vehiculo = camion.id_camion
INNER JOIN lleva ON transporta.id_lote = lleva.id_lote
INNER JOIN plataforma ON lleva.id_plataforma = plataforma.id_plataforma
INNER JOIN lote ON forma.id_lote = lote.id_lote
WHERE
lleva.fecha_llegada IS NOT NULL
AND lleva.hora_llegada IS NOT NULL
AND DATEDIFF(CURDATE(), lleva.fecha_llegada) > 3;

/*CONSULTA 7: PAQUETES SIN LOTE ASIGNADO Y SUS FECHAS RECIBIDO.*/
SELECT
id_paquete,
mail_destinatario,
direccion,
fragil,
tipo,
detalles,
peso,
volumen,
CONCAT(fecha_recibido, ' a las ', hora_recibido) AS fecha_recibido
FROM paquete
WHERE
id_paquete not in (select id_paquete from forma);

/*CONSULTA 8: MATRICULA DE LOS CAMIONES QUE SE ENCUENTRAN FUERA DE SERVICIO.*/
SELECT
matricula,
estado
FROM vehiculo
WHERE
estado = "Fuera de servicio";

/*CONSULTA 9: CAMIONES SIN CONDUCTOR ASIGNADO Y SU ESTADO OPERATIVO.*/
SELECT *
FROM vehiculo
WHERE id_vehiculo not in(select id_vehiculo from maneja);

/*CONSULTA 10: PLATAFORMAS QUE SE ENCUENTRAN EN UN RECORRIDO X.*/
SELECT plataforma.id_plataforma,
plataforma.direccion,
CONCAT(destino.ciudad_destino, ', ', destino.departamento_destino) AS ubicacion,
plataforma.volumen_maximo,
plataforma.telefono
FROM plataforma
INNER JOIN llega ON plataforma.id_plataforma = llega.id_plataforma
INNER JOIN destino ON plataforma.ubicacion = destino.id_destino
WHERE
id_trayecto = 1;