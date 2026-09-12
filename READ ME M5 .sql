

--Consulta 1 - Vista base del proyecto
--Se realizó un INNER JOIN entre las tablas ventas, productos y clientes para obtener información detallada de cada venta.
--Resultado: se obtuvo la fecha de venta, cliente, producto, cantidad, precio unitario y total de venta.

--Consulta 2 - Clientes sin ventas
--Se utilizó LEFT JOIN para identificar clientes que no realizaron compras.
--Resultado: no se encontraron clientes sin ventas en los datos actuales.

-- Consulta 3 - Productos sin ventas
--Se utilizó LEFT JOIN para identificar productos que no registran ventas.
--Resultado: no se encontraron productos sin ventas en los datos actuales.

--Consulta 4 - Consolidado por canal
--Se dividieron las ventas en dos períodos y se combinaron mediante UNION ALL.
--Resultado: se obtuvo el total de ventas correspondiente a cada período.