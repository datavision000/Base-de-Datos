/*CONSULTA 1*/
SELECT paquete.id_paquete, paquete.tipo, paquete.volumen, paquete.peso, paquete.direccion, paquete.fragil, paquete.detalles, paquete.mail_destinatario,
paquete.estado, paquete.id_destino
FROM lleva
INNER JOIN forma ON lleva.id_lote = forma.id_lote
INNER JOIN paquete ON forma.id_paquete = paquete.id_paquete
INNER JOIN destino ON paquete.id_destino = destino.id_destino
WHERE MONTH(lleva.fecha_llegada) = 5 AND YEAR(lleva.fecha_llegada) = 2023 AND destino.ciudad_destino = "Melo";

/*CONSULTA 2*/
SELECT paquete.id_paquete, paquete.codigo_seguimiento, paquete.direccion, paquete.mail_destinatario, paquete.estado, lleva.id_plataforma, plataforma.direccion, lleva.fecha_llegada, lleva.hora_llegada
FROM paquete
INNER JOIN forma ON paquete.id_paquete = forma.id_paquete
INNER JOIN lleva ON forma.id_lote = lleva.id_lote
INNER JOIN plataforma ON lleva.id_plataforma = plataforma.id_plataforma
WHERE YEAR(lleva.fecha_llegada) = 2023
ORDER BY (
  SELECT COUNT(*)
  FROM lleva AS ord
  WHERE ord.id_plataforma = lleva.id_plataforma
) DESC;

/*CONSULTA 3*/
SELECT camion.id_camion, vehiculo.matricula, vehiculo.estado
FROM vehiculo
INNER JOIN camion ON camion.id_camion = vehiculo.id_vehiculo;

/*CONSULTA 4*/
SELECT camion.id_camion, vehiculo.matricula, vehiculo.volumen_disponible, vehiculo.peso_soportado, vehiculo.estado, lleva.id_plataforma, plataforma.direccion
FROM lleva
INNER JOIN transporta ON lleva.id_lote = transporta.id_lote
INNER JOIN camion ON transporta.id_camion = camion.id_camion
INNER JOIN vehiculo ON vehiculo.id_vehiculo = camion.id_camion
INNER JOIN plataforma ON lleva.id_plataforma = plataforma.id_plataforma
WHERE MONTH(fecha_llegada)=6 AND lleva.id_plataforma=8;

/*CONSULTA 5*/
SELECT paquete.id_paquete, paquete.direccion, destino.departamento_destino, forma.id_lote,
lleva.id_plataforma, camion.id_camion, vehiculo.matricula
FROM paquete
INNER JOIN destino ON paquete.id_destino = destino.id_destino
INNER JOIN forma ON paquete.id_paquete = forma.id_paquete
INNER JOIN transporta ON forma.id_lote = transporta.id_lote
INNER JOIN lleva ON transporta.id_lote = lleva.id_lote
INNER JOIN camion ON transporta.id_camion = camion.id_camion
INNER JOIN vehiculo ON vehiculo.id_vehiculo = camion.id_camion
WHERE paquete.id_paquete=9;

/*CONSULTA 6*/
SELECT paquete.id_paquete, forma.id_lote, vehiculo.matricula, lleva.id_plataforma, plataforma.direccion, lote.estado
FROM paquete
INNER JOIN forma ON paquete.id_paquete = forma.id_paquete
INNER JOIN transporta ON forma.id_lote = transporta.id_lote
INNER JOIN camion ON transporta.id_camion = camion.id_camion
INNER JOIN vehiculo ON vehiculo.id_vehiculo = camion.id_camion
INNER JOIN lleva ON transporta.id_lote = lleva.id_lote
INNER JOIN plataforma ON lleva.id_plataforma = plataforma.id_plataforma
INNER JOIN lote ON forma.id_lote = lote.id_lote
WHERE DATEDIFF(CURDATE(), lleva.fecha_llegada) > 3;

/*CONSULTA 7*/
SELECT id_paquete, codigo_seguimiento, direccion, mail_destinatario, estado, fecha_recibido, hora_recibido
FROM paquete
WHERE id_paquete not in(select id_paquete from forma);

/*CONSULTA 8*/
SELECT matricula FROM vehiculo WHERE estado = "Fuera de servicio";

/*CONSULTA 9*/
SELECT *
FROM vehiculo
WHERE id_vehiculo not in(select id_vehiculo from maneja);

/*CONSULTA 10*/
SELECT plataforma.id_plataforma, destino.departamento_destino, destino.ciudad_destino, plataforma.direccion, plataforma.volumen_maximo, plataforma.telefono
FROM plataforma
INNER JOIN llega ON plataforma.id_plataforma = llega.id_plataforma
INNER JOIN destino ON plataforma.ubicacion = destino.id_destino
WHERE id_trayecto=1;