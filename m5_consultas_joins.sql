USE ventas_tech_db

--consulta 1--

SELECT * FROM ventas
SELECT*FROM productos
SELECT*FROM clientes
SELECT*FROM categorias


SELECT
ventas.fecha_venta,
ventas.id_cliente,
clientes.nombre,
productos.nombre_producto,
ventas.cantidad,
ventas.precio_unitario,
cantidad * precio_unitario AS total_venta
FROM ventas INNER JOIN productos
ON ventas.id_producto=productos.id_producto
INNER JOIN clientes ON ventas.id_cliente =clientes.id_cliente;

--Consulta 2,clientes sin ventas--

SELECT
c.nombre,
c.email,
c.fecha_registro,
v.id_venta
FROM clientes AS c LEFT JOIN ventas AS v
ON c.id_cliente=v.id_cliente
WHERE v.id_venta IS NULL

--Consulta 3, productos sin venta--

SELECT 
p.nombre_producto,
ca.nombre_categoria,
p.precio
FROM productos AS P 
LEFT JOIN ventas AS V 
ON p.id_producto=v.id_producto
LEFT JOIN categorias AS ca ON ca.id_categoria=p.id_categoria
WHERE v.id_venta IS NULL;

--Consulta 4,consolidado por canal--

SELECT canal ,SUM(total_venta) as Total_por_canal FROM 
(SELECT 'primera mitad' AS canal, cantidad * precio_unitario AS total_venta
FROM ventas
WHERE fecha_venta<'2024-03-10' UNION ALL 
SELECT
'segunda mitad' AS canal, cantidad * precio_unitario AS total_venta
FROM ventas
WHERE fecha_venta>='2024-03-10' ) as resumen 
GROUP BY canal;