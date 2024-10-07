USE BarberExpress;

-- Obtener todos los clientes con sus ubicaciones
SELECT p.first_name, p.last_name, c.name AS country, s.name AS state
FROM people p
INNER JOIN people_location pl ON p.id = pl.people_id
INNER JOIN country c ON pl.country_id = c.id
INNER JOIN state s ON pl.state_id = s.id;


-- Listar todas las barbershops con sus dueños
SELECT b.name AS barbershop_name, p.first_name, p.last_name
FROM barbershop b
INNER JOIN people p ON b.people_id = p.id;


-- Mostrar todas las citas con información del cliente y servicio
SELECT p.first_name, p.last_name, s.name AS service_name, a.date
FROM appointments a
INNER JOIN people p ON a.people_id = p.id
INNER JOIN services s ON a.service_id = s.id;


-- Obtener todos los barberos con sus barbershops
SELECT br.name AS barber_name, b.name AS barbershop_name
FROM barbers br
INNER JOIN barbershop b ON br.barbershop_id = b.id;


-- Listar todos los pagos con información del cliente y la barbería
SELECT p.first_name, p.last_name, b.name AS barbershop, py.amount
FROM payments py
INNER JOIN people p ON py.people_id = p.id
INNER JOIN barbershop b ON py.barbershop_id = b.id;

-- Mostrar todas las reseñas con el nombre del cliente y la barbería
SELECT p.first_name, p.last_name, b.name AS barbershop, r.rating, r.comment
FROM reviews r
INNER JOIN people p ON r.people_id = p.id
INNER JOIN barbershop b ON r.barbershop_id = b.id;

-- Obtener todos los posts con información del barbero y la barbería
SELECT b.name AS barbershop, br.name AS barber, p.title
FROM posts p
INNER JOIN barbershop b ON p.barbershop_id = b.id
INNER JOIN barbers br ON p.barber_id = br.id;

-- Listar los horarios de cada barbería
SELECT b.name AS barbershop, s.day, s.start_time, s.end_time
FROM schedule s
INNER JOIN barbershop b ON s.barbershop_id = b.id;


-- Mostrar las cuentas bancarias de los barberos
SELECT br.name AS barber, b.name AS barbershop, bk.name AS bank, ba.account_number
FROM barber_accounts ba
INNER JOIN barbers br ON ba.barber_id = br.id
INNER JOIN banks bk ON ba.bank_id = bk.id
INNER JOIN barbershop b ON br.barbershop_id = b.id;

-- Obtener todos los servicios con su barbería correspondiente
SELECT b.name AS barbershop, s.name AS service, s.price
FROM services s
INNER JOIN barbershop b ON s.barbershop_id = b.id;

-- Listar todos los productos con su barbería
SELECT b.name AS barbershop, p.name AS product, p.price, p.stock
FROM products p
INNER JOIN barbershop b ON p.barbershop_id = b.id;


-- Mostrar todas las citas pendientes con información del cliente y barbero
SELECT p.first_name AS client_name, br.name AS barber, a.date
FROM appointments a
INNER JOIN people p ON a.people_id = p.id
INNER JOIN barbers br ON a.barber_id = br.id
WHERE a.status = 'pending';

-- Obtener información de contacto de los clientes con citas
SELECT p.first_name, p.last_name, pi.email, pi.phone, a.date
FROM appointments a
INNER JOIN people p ON a.people_id = p.id
INNER JOIN people_info pi ON p.id = pi.people_id;

-- Listar todas las barberías con su ubicación
SELECT b.name AS barbershop, c.name AS country, s.name AS state
FROM barbershop b
INNER JOIN people_location pl ON b.location_id = pl.id
INNER JOIN country c ON pl.country_id = c.id
INNER JOIN state s ON pl.state_id = s.id;


-- Mostrar todos los pagos completados con información del servicio
SELECT p.first_name, s.name AS service, py.amount, py.payment_method
FROM payments py
INNER JOIN appointments a ON py.appointment_id = a.id
INNER JOIN services s ON a.service_id = s.id
INNER JOIN people p ON py.people_id = p.id
WHERE py.status = 'paid';

-- Obtener el rol de cada persona en el sistema
SELECT p.first_name, p.last_name, r.name AS role
FROM people p
INNER JOIN people_info pi ON p.id = pi.people_id
INNER JOIN role r ON pi.role_id = r.id;

-- Listar todas las reseñas de citas completadas
SELECT p.first_name, b.name AS barbershop, r.rating, a.date
FROM reviews r
INNER JOIN appointments a ON r.appointment_id = a.id
INNER JOIN people p ON r.people_id = p.id
INNER JOIN barbershop b ON r.barbershop_id = b.id
WHERE a.status = 'completed';

-- Mostrar todos los barberos con sus servicios ofrecidos
SELECT br.name AS barber, s.name AS service, s.price
FROM barbers br
INNER JOIN barbershop b ON br.barbershop_id = b.id
INNER JOIN services s ON b.id = s.barbershop_id;

-- Obtener información de los clientes que han dejado reseñas
SELECT p.first_name, p.last_name, pi.email, r.rating, r.comment
FROM reviews r
INNER JOIN people p ON r.people_id = p.id
INNER JOIN people_info pi ON p.id = pi.people_id;
