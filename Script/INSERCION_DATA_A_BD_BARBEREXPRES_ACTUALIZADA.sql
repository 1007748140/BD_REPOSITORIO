-- Insertar registros en la tabla departments
INSERT INTO departments (name, id_country) VALUES ('Antioquia', 1), ('Cundinamarca', 1), ('Valle del Cauca', 1);

-- Insertar registros en la tabla users
INSERT INTO users (id_role, first_name, last_name, email, password, phone, profile_image) 
VALUES 
(1, 'Carlos', 'Rodriguez', 'carlos@example.com', 'password123', '1234567890', NULL),
(2, 'Juan', 'Perez', 'juan@example.com', 'password123', '0987654321', NULL),
(2, 'Ana', 'Gomez', 'ana@example.com', 'password123', '5678901234', NULL);

-- Insertar registros en la tabla users_location
INSERT INTO users_location (id_user, id_country, id_department, latitude, longitude)
VALUES 
(1, 1, 1, 6.2442, -75.5812),
(2, 1, 2, 4.6097, -74.0817),
(3, 1, 3, 3.4372, -76.5225);

-- Insertar registros en la tabla barbershops
INSERT INTO barbershops (id_user, id_location, name, description) 
VALUES 
(2, 1, 'BarberShop Medellín', 'Una barbería moderna en el corazón de Medellín'),
(3, 2, 'Barbería Bogotá', 'La mejor barbería de Bogotá con un excelente servicio'),
(2, 3, 'Cali Style', 'Estilo y atención personalizada en el Valle del Cauca');

-- Insertar registros en la tabla schedule
INSERT INTO schedule (id_barbershop, start_time, end_time, shop_status) 
VALUES 
(1, '09:00', '18:00', 1),
(2, '10:00', '19:00', 1),
(3, '08:00', '17:00', 1);

-- Insertar registros en la tabla schedule_days
INSERT INTO schedule_days (id_schedule, id_days_week) 
VALUES 
(1, 1), (1, 2), (1, 3), -- BarberShop 1 opera Lunes, Martes, Miércoles
(2, 4), (2, 5), (2, 6), -- BarberShop 2 opera Jueves, Viernes, Sábado
(3, 7); -- BarberShop 3 opera Domingo

-- Insertar registros en la tabla barbers
INSERT INTO barbers (id_barbershop, id_barber_state, name, last_name, email, phone, profile_picture) 
VALUES 
(1, 1, 'Pedro', 'López', 'pedro@example.com', '3216549870', 'pedro.jpg'),
(2, 2, 'Santiago', 'Ramirez', 'santiago@example.com', '4561237890', 'santiago.jpg'),
(3, 3, 'María', 'Fernandez', 'maria@example.com', '7891234560', 'maria.jpg');

-- Insertar registros en la tabla services
INSERT INTO services (id_barbershop, name, description, price) 
VALUES 
(1, 'Corte de Cabello', 'Corte moderno con estilo', 20000.00),
(2, 'Afeitado Clásico', 'Afeitado tradicional con toalla caliente', 15000.00),
(3, 'Peinado', 'Peinado personalizado según la ocasión', 10000.00);

-- Insertar registros en la tabla products
INSERT INTO products (id_barbershop, name, description, price, image) 
VALUES 
(1, 'Cera para el Cabello', 'Cera de alta fijación para el cabello', 12000.00, 'hair_wax.jpg'),
(2, 'Shampoo para Barba', 'Shampoo especial para el cuidado de la barba', 15000.00, 'beard_shampoo.jpg'),
(3, 'Peine de Madera', 'Peine antienredo de madera natural', 8000.00, 'wooden_comb.jpg');


INSERT INTO posts (id_barbershop, id_barber, id_classification, title, content, media, created_at)
VALUES 
(1, 1, 1, 'Promoción de Descuento', 'Aprovecha un 20% de descuento en todos nuestros servicios este fin de semana.', 'https://example.com/promo.jpg', NOW()),
(1, 2, 2, 'Evento Especial', 'Estamos organizando un evento especial de cortes en vivo el próximo sábado. ¡No te lo pierdas!', 'https://example.com/event.jpg', NOW()),
(1, 1, 5, 'Tendencias en Cortes', 'Descubre las nuevas tendencias de cortes para este verano 2024. ¡Mantente a la moda!', 'https://example.com/tendencias.jpg', NOW());


INSERT INTO appointments (id_user, id_barber, id_service, created_at)
VALUES
(1, 1, 1, NOW()),
(2, 2, 2, NOW()),
(3, 1, 3, NOW());
