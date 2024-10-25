USE BarberExpress11;

----------------------- CONCAT ------------------------------------
-- Ejemplo 1: Combinar nombre y apellido de las personas
SELECT CONCAT(first_name, ' ',last_name) AS nombre_completo
FROM people;
/* Explicación: CONCAT une el first_name con un espacio y last_name para crear un nombre completo */

-- Ejemplo 2: Crear una descripción completa de la barbería
SELECT CONCAT(name, ' - ', description) AS info_barberia 
FROM barbershops;
/* Explicación: Une el nombre de la barbería con su descripción usando un guión como separador */

----------------------- LENGTH ------------------------------------
-- Ejemplo 1: Encontrar emails con más de 20 caracteres
SELECT email, LENGTH(email) AS longitud_email 
FROM users 
WHERE LENGTH(email) > 20;
/* Explicación: LENGTH cuenta el número de caracteres en el email y filtra los que tienen más de 20 */

-- Ejemplo 2: Verificar longitud de números telefónicos
SELECT first_name, phone, LENGTH(phone) AS digitos 
FROM people 
WHERE LENGTH(phone) != 10;
/* Explicación: Encuentra teléfonos que no tienen exactamente 10 dígitos */

----------------------- UPPER ------------------------------------

SELECT UPPER(name) AS nombre_en_mayuscula
from barbershops;

SELECT 
CONCAT( UPPER(first_name),' ', UPPER(last_name)) AS nombre_completo
from people;

-- Ejemplo 1: Mostrar nombres de barberías en mayúsculas
SELECT UPPER(name) AS nombre_mayusculas 
FROM barbershops;
/* Explicación: Convierte el nombre de cada barbería a mayúsculas */

-- Ejemplo 2: Nombres y apellidos en mayúsculas
SELECT UPPER(first_name) AS nombre, UPPER(last_name) AS apellido 
FROM people;
/* Explicación: Convierte tanto el nombre como el apellido a mayúsculas */

----------------------- LOWER ------------------------------------

-- Ejemplo 1: Emails en minúsculas
SELECT LOWER(email) AS email_minusculas 
FROM users;
/* Explicación: Convierte todos los emails a minúsculas */

-- Ejemplo 2: Descripción de servicios en minúsculas
SELECT name, LOWER(description) AS descripcion 
FROM bank_services;
/* Explicación: Muestra el nombre original pero la descripción en minúsculas */


----------------------- SUBSTRING ------------------------------------
-- Ejemplo 1: Primeros 3 caracteres del nombre
SELECT first_name, SUBSTRING(first_name, 1, 3) AS iniciales 
FROM people;
/* Explicación: Extrae los primeros 3 caracteres del nombre, comenzando en posición 1 */

-- Ejemplo 2: Últimos 4 dígitos del teléfono
SELECT phone, SUBSTRING(phone, -4) AS ultimos_digitos 
FROM people;
/* Explicación: Extrae los últimos 4 dígitos del número telefónico */

----------------------- ROUND ------------------------------------
-- Ejemplo 1: Redondear precios de servicios
SELECT name, price, ROUND(price, -3) AS precio_redondeado 
FROM bank_services;
/* Explicación: Redondea el precio al millar más cercano */

-- Ejemplo 2: Redondear comisiones
SELECT total, ROUND(total * 0.15, 2) AS comision 
FROM appointment_payments;
/* Explicación: Calcula el 15% del total y redondea a 2 decimales */

----------------------- ABS ------------------------------------

-- Ejemplo 1: Diferencia absoluta entre precio y precio recibido
SELECT total, total_receive_barbershop, 
       ABS(total - total_receive_barbershop) AS diferencia 
FROM appointment_payments;
/* Explicación: Muestra la diferencia absoluta entre el total y lo recibido */

-- Ejemplo 2: Diferencia absoluta de latitudes
SELECT ABS(p1.latitude - p2.latitude) AS diff_latitud 
FROM people_location p1, people_location p2 
WHERE p1.id != p2.id 
LIMIT 3;
/* Explicación: Calcula la diferencia absoluta entre latitudes de diferentes ubicaciones */

----------------------- COUNT ------------------------------------
-- Ejemplo 1: Contar barberos por barbería
SELECT b.name, COUNT(bb.id_people) AS numero_barberos 
FROM barbershops b 
LEFT JOIN barbershop_barbers bb ON b.id = bb.id_barbershop 
GROUP BY b.name;
/* Explicación: Cuenta cuántos barberos hay en cada barbería */

-- Ejemplo 2: Contar servicios por clasificación
SELECT sc.name, COUNT(bs.id) AS numero_servicios 
FROM services_classification sc 
LEFT JOIN bank_services bs ON sc.id = bs.id_classification 
GROUP BY sc.name;
/* Explicación: Cuenta cuántos servicios hay en cada clasificación */

----------------------- SUM ------------------------------------

-- Ejemplo 1: Total de ventas por barbería
SELECT b.name, SUM(ap.total) AS ventas_totales 
FROM barbershops b 
INNER JOIN barbershop_services bs ON b.id = bs.id_barbershop 
INNER JOIN appointment_payments ap ON bs.id = ap.id_appointment 
GROUP BY b.name;
/* Explicación: Suma todos los pagos recibidos por cada barbería */

----------------------- AVG ------------------------------------

-- Ejemplo 1: Promedio de calificaciones por barbería
SELECT b.name, AVG(r.rating) AS calificacion_promedio 
FROM barbershops b 
INNER JOIN reviews r ON b.id = r.id_barbershop 
GROUP BY b.name;
/* Explicación: Calcula el promedio de las calificaciones para cada barbería */

-- Ejemplo 2: Promedio de precios por clasificación de servicios
SELECT sc.name, AVG(bs.price) AS precio_promedio 
FROM services_classification sc 
INNER JOIN bank_services bs ON sc.id = bs.id_classification 
GROUP BY sc.name;
/* Explicación: Calcula el precio promedio de los servicios por clasificación */

----------------------- MIN ------------------------------------
-- Ejemplo 1: Servicio más económico por clasificación
SELECT sc.name, MIN(bs.price) AS precio_minimo 
FROM services_classification sc 
INNER JOIN bank_services bs ON sc.id = bs.id_classification 
GROUP BY sc.name;
/* Explicación: Encuentra el precio más bajo de los servicios en cada clasificación */

-- Ejemplo 2: Primera cita del día por barbería
SELECT b.name, MIN(ap.created_at) AS primera_cita 
FROM barbershops b 
INNER JOIN barbershop_services bs ON b.id = bs.id_barbershop 
INNER JOIN appointment_payments ap ON bs.id = ap.id_appointment 
GROUP BY b.name;
/* Explicación: Encuentra la hora de la primera cita registrada para cada barbería */

-----------------------  GROUP BY con HAVING ------------------------------------

-- Ejemplo 1: Barberías con más de 3 barberos
SELECT b.name, COUNT(bb.id_people) AS numero_barberos 
FROM barbershops b 
JOIN barbershop_barbers bb ON b.id = bb.id_barbershop 
GROUP BY b.name 
HAVING numero_barberos >=1;
/* Explicación: Agrupa por barbería y filtra las si es mayor a igual a 1 barberos */

-- Ejemplo 2: Clasificaciones de servicios con precio promedio mayor a 15000
SELECT sc.name, AVG(bs.price) AS precio_promedio 
FROM services_classification sc 
JOIN bank_services bs ON sc.id = bs.id_classification 
GROUP BY sc.name 
HAVING precio_promedio > 15000;
/* Explicación: Agrupa por clasificación y muestra solo las que tienen precio promedio superior a 30000 */

----------------------- IN ------------------------------------
-- Ejemplo 1: Encontrar personas en roles específicos
SELECT first_name, last_name 
FROM people 
WHERE id_role IN (SELECT id FROM roles WHERE name IN ('Barbero', 'Administrador'));
/* Explicación: Encuentra personas que tienen rol de barbero o administrador */

-- Ejemplo 2: Servicios en categorías populares
SELECT name 
FROM bank_services 
WHERE id_classification IN (
    SELECT id FROM services_classification 
    WHERE name IN ('Corte de cabello', 'Barba', 'Afeitado')
);
/* Explicación: Encuentra servicios que pertenecen a las categorías especificadas */

----------------------- EXISTS ------------------------------------
-- Ejemplo 1: Barberías que tienen al menos un barbero disponible
SELECT b.name 
FROM barbershops b 
WHERE EXISTS (
    SELECT 1 
    FROM barbershop_barbers bb 
    JOIN people p ON bb.id_people = p.id 
    WHERE bb.id_barbershop = b.id 
    AND p.id_barber_state = 1
);
/* Explicación: Encuentra barberías que tienen al menos un barbero en estado disponible */

-- Ejemplo 2: Clientes que han hecho comentarios
SELECT p.first_name, p.last_name 
FROM people p 
WHERE EXISTS (
    SELECT 1 
    FROM comments c 
    WHERE c.id_people = p.id
);
/* Explicación: Encuentra personas que han realizado al menos un comentario */

----------------------- ANY ------------------------------------
-- Ejemplo 1: Servicios más caros que cualquier producto
SELECT name, price 
FROM bank_services 
WHERE price > ANY (
    SELECT price FROM bank_products
);
/* Explicación: Encuentra servicios cuyo precio es mayor que al menos un producto */

-- Ejemplo 2: Barberos con más reseñas que cualquier cliente
SELECT p.first_name, p.last_name 
FROM people p 
WHERE p.id_role = 2 
AND (
    SELECT COUNT(*) FROM reviews r WHERE r.id_people = p.id
) > ANY (
    SELECT COUNT(*) FROM reviews r2 
    JOIN people p2 ON r2.id_people = p2.id 
    WHERE p2.id_role = 1 
    GROUP BY p2.id
);
/* Explicación: Encuentra barberos que tienen más reseñas que al menos un cliente */

----------------------- Subconsulta en WHERE ------------------------------------
-- Ejemplo 1: Barberías que tienen más servicios que el promedio
SELECT b.name 
FROM barbershops b 
WHERE (
    SELECT COUNT(*) 
    FROM barbershop_services bs 
    WHERE bs.id_barbershop = b.id
) > (
    SELECT AVG(service_count) 
    FROM (
        SELECT COUNT(*) as service_count 
        FROM barbershop_services 
        GROUP BY id_barbershop
    ) t
);
/* Explicación: Encuentra barberías con más servicios que el promedio general */

-- Ejemplo 2: Clientes que han gastado más que el promedio
SELECT p.first_name, p.last_name 
FROM people p 
WHERE p.id_role = 1 
AND (
    SELECT SUM(total) 
    FROM appointment_payments ap 
    WHERE ap.id_people = p.id
) > (
    SELECT AVG(total_spent) 
    FROM (
        SELECT SUM(total) as total_spent 
        FROM appointment_payments 
        GROUP BY id_people
    ) t
);
/* Explicación: Encuentra clientes que han gastado más que el promedio de gastos por cliente */

----------------------- Subconsulta en FROM ------------------------------------
-- Ejemplo 1: Ranking de barberías por ingresos
SELECT b.name, t.ingresos_totales,
       RANK() OVER (ORDER BY t.ingresos_totales DESC) as ranking 
FROM barbershops b 
JOIN (
    SELECT bs.id_barbershop, SUM(ap.total) as ingresos_totales 
    FROM barbershop_services bs 
    JOIN appointment_payments ap ON bs.id = ap.id_appointment 
    GROUP BY bs.id_barbershop
) t ON b.id = t.id_barbershop;
/* Explicación: Crea un ranking de barberías basado en sus ingresos totales */

-- Ejemplo 2: Promedio de calificaciones mensual
SELECT mes, AVG(rating) as promedio_calificacion 
FROM (
    SELECT DATE_FORMAT(created_at, '%Y-%m') as mes, rating 
    FROM reviews
) t 
GROUP BY mes;
/* Explicación: Calcula el promedio de calificaciones por mes usando una subconsulta en FROM */

----------------------- Subconsulta en SELECT ------------------------------------

-- Ejemplo 1: Información detallada de barberías
SELECT b.name,
       (SELECT COUNT(*) FROM barbershop_barbers bb WHERE bb.id_barbershop = b.id) as total_barberos,
       (SELECT AVG(rating) FROM reviews r WHERE r.id_barbershop = b.id) as calificacion_promedio 
FROM barbershops b;
/* Explicación: Muestra nombre de barbería junto con total de barberos y calificación promedio */

-- Ejemplo 2: Estadísticas de clientes
SELECT p.first_name, p.last_name,
       (SELECT COUNT(*) FROM appointment_payments ap WHERE ap.id_people = p.id) as total_citas,
       (SELECT SUM(total) FROM appointment_payments ap2 WHERE ap2.id_people = p.id) as gasto_total 
FROM people p 
WHERE p.id_role = 1;
/* Explicación: Muestra nombre del cliente junto con su total de citas y gasto total */