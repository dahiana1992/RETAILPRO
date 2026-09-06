USE ventas_tech_db

SELECT * FROM ventas

--Consulta 1 — 

SELECT SUM(cantidad * precio_unitario) AS total_facturado,COUNT(id_venta)as cantidad_pedidos,
 AVG(cantidad * precio_unitario) AS tiket_promedio,  MONTH(fecha_venta) AS MES
FROM ventas  GROUP BY MONTH(fecha_venta)


--Consulta 2 — 

SELECT TOP 5 id_producto, sum(cantidad) AS unidades_vendidas, sum(cantidad*precio_unitario) AS total_facturado FROM ventas
GROUP BY id_producto ORDER BY total_facturado DESC;


--Consulta 3 — 

SELECT id_cliente,COUNT (id_venta) AS cantidad_pedido,SUM (cantidad*precio_unitario)
AS total_gastado FROM ventas GROUP BY id_cliente HAVING COUNT(id_venta) >1;


--Consulta 4 — 

SELECT* FROM (SELECT SUM(cantidad * precio_unitario) AS total_facturado,
  MONTH(fecha_venta) AS MES
FROM ventas  GROUP BY MONTH(fecha_venta)) AS facturado_mes;

SELECT* FROM (SELECT AVG(total_facturado) AS promedio_mensual FROM (SELECT SUM(cantidad * precio_unitario) AS total_facturado,
  MONTH(fecha_venta) AS MES
FROM ventas  GROUP BY MONTH(fecha_venta)) AS tabla_meses) AS promedio_mes;


WITH facturado_mes AS (SELECT* FROM (SELECT SUM(cantidad * precio_unitario) AS total_facturado,
  MONTH(fecha_venta) AS MES
FROM ventas  GROUP BY MONTH(fecha_venta)) AS facturado_mes) , 

promedio_mes AS (SELECT AVG(total_facturado) AS promedio_mensual 
FROM (SELECT SUM(cantidad * precio_unitario) AS total_facturado,MONTH(fecha_venta) AS MES
FROM ventas  GROUP BY MONTH(fecha_venta)) AS tabla_meses)  

SELECT MES,total_facturado , promedio_mensual,
CASE WHEN total_facturado > promedio_mensual THEN 'Por encima'
WHEN total_facturado < promedio_mensual THEN 'Por debajo'
ELSE 'Igual'
END AS comparacion
FROM facturado_mes
CROSS JOIN promedio_mes;


--Bloque de cierre 


--1)El 55% de la facturación correspondiente a los primeros 15 días de Marzo proviene del producto ID 1(Laptop pro15).
--2)El producto ID 4(Auriculares BT Pro) fue el menos vendido y representa un 3% de la facturación total de la primera quincena de Marzo.
--3)El cliente ID 1 fue el mayor comprador y represento el 40% de la facturación total de la primera quincena de Marzo.
