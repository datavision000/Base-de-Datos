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
paquete.fecha_recibido
FROM paquete
INNER JOIN destino ON paquete.id_destino = destino.id_destino
WHERE
paquete.estado = "Entregado"
AND MONTH(paquete.fecha_recibido) = 5
AND YEAR(paquete.fecha_recibido) = 2023
AND destino.ciudad_destino = "Melo";

/*CONSULTA 2: PLATAFORMAS Y PAQUETES ENTREGADOS EN LAS MISMAS,
2023, ORDENARLOS: LOS QUE RECIBIERON DE MÁS A MENOS.*/
SELECT
plataforma.id_plataforma,
plataforma.direccion AS direccion_plataforma,
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
INNER JOIN transporta ON forma.id_lote = transporta.id_lote
INNER JOIN camion ON transporta.id_camion = camion.id_camion
INNER JOIN vehiculo ON vehiculo.id_vehiculo = camion.id_camion
INNER JOIN lleva ON camion.id_camion = lleva.id_camion
INNER JOIN plataforma ON lleva.id_plataforma = plataforma.id_plataforma
INNER JOIN (
    SELECT lleva.id_plataforma, COUNT(paquete.id_paquete) AS cantidad_paquetes
    FROM paquete
    INNER JOIN forma ON paquete.id_paquete = forma.id_paquete
    INNER JOIN transporta ON forma.id_lote = transporta.id_lote
    INNER JOIN lleva ON transporta.id_camion = lleva.id_camion
    GROUP BY lleva.id_plataforma
) AS subconsulta ON lleva.id_plataforma = subconsulta.id_plataforma
WHERE
lleva.fecha_llegada IS NOT NULL
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
plataforma.id_plataforma,
plataforma.direccion AS direccion_plataforma,
lleva.fecha_llegada AS fecha_visita,
vehiculo.id_vehiculo AS id_camion,
vehiculo.matricula,
vehiculo.volumen_maximo,
vehiculo.peso_soportado,
vehiculo.estado AS estado_camion
FROM lleva
INNER JOIN vehiculo ON lleva.id_camion = vehiculo.id_vehiculo
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
LEFT JOIN camion ON transporta.id_camion = camion.id_camion
LEFT JOIN vehiculo ON vehiculo.id_vehiculo = camion.id_camion
LEFT JOIN lleva ON camion.id_camion = lleva.id_camion
LEFT JOIN plataforma ON lleva.id_plataforma = plataforma.id_plataforma
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
lote.estado,
lleva.fecha_llegada
FROM paquete
INNER JOIN destino ON paquete.id_destino = destino.id_destino
INNER JOIN forma ON paquete.id_paquete = forma.id_paquete
INNER JOIN transporta ON forma.id_lote = transporta.id_lote
INNER JOIN camion ON transporta.id_camion = camion.id_camion
INNER JOIN vehiculo ON vehiculo.id_vehiculo = camion.id_camion
INNER JOIN lleva ON camion.id_camion = lleva.id_camion
INNER JOIN plataforma ON lleva.id_plataforma = plataforma.id_plataforma
INNER JOIN lote ON forma.id_lote = lote.id_lote
WHERE
lleva.fecha_llegada IS NOT NULL
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
fecha_recibido
FROM paquete
WHERE
id_paquete NOT IN (SELECT id_paquete FROM forma);

/*CONSULTA 8: MATRICULA DE LOS CAMIONES QUE SE ENCUENTRAN FUERA DE SERVICIO.*/
SELECT
matricula,
estado
FROM vehiculo
WHERE
estado = "Fuera de servicio";

/*CONSULTA 9: CAMIONES SIN CONDUCTOR ASIGNADO Y SU ESTADO OPERATIVO.*/
SELECT
camion.id_camion,
vehiculo.matricula,
vehiculo.volumen_maximo,
vehiculo.peso_soportado,
vehiculo.estado AS estado_operativo_camion
FROM vehiculo
LEFT JOIN camion ON vehiculo.id_vehiculo = camion.id_camion
LEFT JOIN maneja ON vehiculo.id_vehiculo = maneja.id_vehiculo
WHERE
id_camion IS NOT NULL
AND (maneja.id_maneja IS NULL OR maneja.fecha_fin_manejo < CURDATE() OR maneja.fecha_fin_manejo IS NULL);

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