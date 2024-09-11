use ecommerce_db;

SELECT *
FROM Usuarios
WHERE nombre BETWEEN 'A' AND 'M';


SELECT *
FROM Usuarios
WHERE nombre LIKE '%e%';

SELECT *
FROM Usuarios
WHERE nombre LIKE '%z';


SELECT *
FROM Productos
WHERE nombre LIKE 'T%';


SELECT *
FROM Proveedores
WHERE nombre LIKE '%o%';


SELECT *
FROM Usuarios
WHERE nombre = 'Carlos García';


SELECT *
FROM Productos
WHERE nombre = 'Televisor';


SELECT *
FROM Usuarios
WHERE nombre BETWEEN 'A' AND 'M';


SELECT *
FROM Usuarios
WHERE nombre LIKE 'J%' AND nombre LIKE '%a%';

#Consulta: Ver las órdenes pendientes de ser enviadas
SELECT Ordenes.id, Usuarios.nombre, Ordenes.total, Envios.estado_envio
FROM Ordenes
JOIN Usuarios ON Ordenes.usuario_id = Usuarios.id
JOIN Envios ON Ordenes.id = Envios.orden_id
WHERE Envios.estado_envio = 'Pendiente';

#Consultar detalles de los productos y proveedores para una orden específica
SELECT Ordenes.id, Productos.nombre, Proveedores.nombre, Detalles_Ordenes.cantidad, Detalles_Ordenes.precio_unitario
FROM Detalles_Ordenes
JOIN Ordenes ON Detalles_Ordenes.orden_id = Ordenes.id
JOIN Productos ON Detalles_Ordenes.producto_id = Productos.id
JOIN Proveedores ON Productos.proveedor_id = Proveedores.id
WHERE Ordenes.id = 1;


#Listar todos los métodos de pago utilizados en las órdenes
SELECT Ordenes.id, Metodos_Pago.nombre, Pagos.monto, Pagos.estado_pago
FROM Pagos
JOIN Ordenes ON Pagos.orden_id = Ordenes.id
JOIN Metodos_Pago ON Pagos.metodo_pago_id = Metodos_Pago.id;


#Obtener el total de productos vendidos (cantidad) por cada categoría
SELECT Categorias.nombre, SUM(Detalles_Ordenes.cantidad)
FROM Detalles_Ordenes
JOIN Productos ON Detalles_Ordenes.producto_id = Productos.id
JOIN Categorias ON Productos.categoria_id = Categorias.id
GROUP BY Categorias.nombre;


#Obtener información de todas las órdenes junto con el nombre del usuario que las realizó
SELECT Ordenes.id, Usuarios.nombre, Ordenes.total, Ordenes.estado
FROM Ordenes
JOIN Usuarios ON Ordenes.usuario_id = Usuarios.id;






