/*CONSULTA 1*/
SELECT paquete.id_paquete, paquete.tipo, paquete.volumen, paquete.peso, paquete.direccion, paquete.fragil, paquete.detalles, paquete.mail_destinatario,
paquete.estado, paquete.id_destino
FROM lleva
INNER JOIN forma ON lleva.id_lote = forma.id_lote
INNER JOIN paquete ON forma.id_paquete = paquete.id_paquete
INNER JOIN destino_paquete ON paquete.id_destino = destino_paquete.id_destino
WHERE MONTH(lleva.fecha_llegada) = 5 AND YEAR(lleva.fecha_llegada) = 2023 AND destino_paquete.ciudad_destino = "Melo";

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
SELECT id_camion, matricula, estado FROM camion;

/*CONSULTA 4*/
SELECT camion.id_camion, camion.matricula, camion.volumen_disponible, camion.peso_soportado, camion.estado FROM lleva 
INNER JOIN transporta ON lleva.id_lote = transporta.id_lote
INNER JOIN camion ON transporta.id_camion = camion.id_camion
WHERE MONTH(fecha_llegada)=6 AND id_plataforma=8;

/*CONSULTA 5*/
SELECT paquete.id_paquete, paquete.direccion, destino_paquete.departamento_destino, destino_paquete.ciudad_destino, forma.id_lote,
lleva.id_plataforma, camion.id_camion, camion.matricula
FROM paquete
INNER JOIN destino_paquete ON paquete.id_destino = destino_paquete.id_destino
INNER JOIN forma ON paquete.id_paquete = forma.id_paquete
INNER JOIN transporta ON forma.id_lote = transporta.id_lote
INNER JOIN lleva ON transporta.id_lote = lleva.id_lote
INNER JOIN camion ON transporta.id_camion = camion.id_camion
WHERE paquete.id_paquete=9;

/*CONSULTA 6*/
SELECT paquete.id_paquete, forma.id_lote, camion.matricula, lleva.id_plataforma, plataforma.direccion, lote.estado
FROM paquete
INNER JOIN forma ON paquete.id_paquete = forma.id_paquete
INNER JOIN transporta ON forma.id_lote = transporta.id_lote
INNER JOIN camion ON transporta.id_camion = camion.id_camion
INNER JOIN lleva ON transporta.id_lote = lleva.id_lote
INNER JOIN plataforma ON lleva.id_plataforma = plataforma.id_plataforma
INNER JOIN lote ON forma.id_lote = lote.id_lote
WHERE DATEDIFF(CURDATE(), lleva.fecha_llegada) > 3;

/*CONSULTA 7*/
SELECT id_paquete, codigo_seguimiento, direccion, mail_destinatario, estado, fecha_recibido
FROM  paquete
WHERE id_paquete not in(select id_paquete from forma);

/*CONSULTA 8*/
SELECT matricula FROM camion WHERE estado = "Fuera de servicio";

/*CONSULTA 9*/
SELECT *
FROM  camion
WHERE id_camion not in(select id_camion from maneja);

/*CONSULTA 10*/
SELECT plataforma.id_plataforma, plataforma.departamento, plataforma.direccion, plataforma.volumen_maximo, plataforma.telefono
FROM plataforma INNER JOIN llega ON plataforma.id_plataforma = llega.id_plataforma
WHERE id_trayecto=1;