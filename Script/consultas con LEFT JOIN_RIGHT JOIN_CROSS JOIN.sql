USE BarberExpress;

# Listar todas las personas con su rol
SELECT p.first_name, p.last_name, r.name AS role
FROM people p
LEFT JOIN people_info pi ON p.id = pi.people_id
LEFT JOIN `role` r ON pi.role_id = r.id;

# Listar todos los barberos y sus cuentas bancarias.
SELECT b.name AS barber_name, ba.account_number, bn.name AS bank
FROM barbers b
LEFT JOIN barber_accounts ba ON b.id = ba.barber_id
LEFT JOIN banks bn ON ba.bank_id = bn.id;

# Mostrar todas las barberías con sus servicios, si tienen.
SELECT bs.name AS barbershop_name, s.name AS service_name
FROM barbershop bs
LEFT JOIN services s ON bs.id = s.barbershop_id;

# Mostrar todos los posts hechos por barberos, si existen.
SELECT p.title, b.name AS barber_name
FROM posts p
LEFT JOIN barbers b ON p.barber_id = b.id;

# Listar todas las citas y su estado, si la barbería está disponible.
SELECT a.id, a.date, a.status, bs.name AS barbershop_name
FROM appointments a
LEFT JOIN barbershop bs ON a.barbershop_id = bs.id;

# Listar todos los roles y las personas que tienen ese rol, si
SELECT r.name AS role_name, p.first_name, p.last_name
FROM `role` r
RIGHT JOIN people_info pi ON r.id = pi.role_id
RIGHT JOIN people p ON pi.people_id = p.id;

# Mostrar todas las barberías con sus horarios, si existen.
SELECT bs.name AS barbershop_name, sc.day, sc.start_time, sc.end_time
FROM barbershop bs
RIGHT JOIN schedule sc ON bs.id = sc.barbershop_id;

# Listar todas las citas y los servicios asociados, si existen.
SELECT a.id, a.date, s.name AS service_name
FROM appointments a
RIGHT JOIN services s ON a.service_id = s.id;

# Mostrar todas las combinaciones posibles de personas y servicios.
SELECT p.first_name, p.last_name, s.name AS service_name
FROM people p
CROSS JOIN services s;

# Mostrar todos los productos junto con las barberías que los venden
SELECT pr.name AS product_name, bs.name AS barbershop_name
FROM products pr
RIGHT JOIN barbershop bs ON pr.barbershop_id = bs.id;
