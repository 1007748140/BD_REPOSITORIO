use BarberExpress2;

-- Mostrar nombres de las barberías que ofrecen servicios disponibles en cualquier barbería
-- donde un usuario específico (ID 2) haya agendado una cita.

SELECT name
FROM barbershops
WHERE id IN (
  SELECT id_barbershop
  FROM services
  WHERE id IN (
    SELECT id_service
    FROM appointments
    WHERE id_user = 2
  )
);

-- Mostrar los nombres de los barberos que están asignados a barberías que tienen más de 1
-- servicios disponibles.

SELECT name, last_name
FROM barbers
WHERE EXISTS (
  SELECT 3
  FROM services
  WHERE services.id_barbershop = barbers.id_barbershop
  GROUP BY id_barbershop
  HAVING COUNT(*) >= 1
);


-- Encuentra los barberos cuyo estado es igual a cualquier estado de los barberos con el
-- estado "Disponible".
SELECT name, last_name 
FROM barbers 
WHERE id_barber_state = ANY (SELECT id FROM barber_status WHERE status = 'Disponible');



-- Obtener las barberías que tienen al menos un post en la categoría de "Promociones".
SELECT name
FROM barbershops
WHERE EXISTS (
  SELECT 1
  FROM posts
  WHERE posts.id_barbershop = barbershops.id
  AND posts.id_classification = (
    SELECT id
    FROM posts_classification
    WHERE name = 'Promociones'
  )
);



