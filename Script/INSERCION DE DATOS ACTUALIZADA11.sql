USE BarberExpress11;
-- Insertando departamentos
INSERT INTO departments (name, id_country) VALUES 
('Bogotá', 1);

-- Insertando usuarios
INSERT INTO users (email, password) VALUES 
('juan@email.com', 'hash123password'),
('maria@email.com', 'hash456password'),
('carlos@email.com', 'hash789password');

-- Insertando personas
INSERT INTO people (id_user, id_role, id_barber_state, first_name, last_name, phone, profile_image) VALUES 
(1, 1, 1, 'Juan', 'Pérez', '3001234567', 'juan.jpg'),
(2, 2, 2, 'Maria', 'González', '3009876543', 'maria.jpg'),
(3, 3, 1, 'Carlos', 'Rodriguez', '3004567890', 'carlos.jpg');

-- Insertando ubicaciones de personas
INSERT INTO people_location (id_people, id_country, id_department, latitude, longitude) VALUES 
(1, 1, 1, 4.7110, -74.0721),
(1, 1, 1, 19.4326, -99.1332),
(1, 1, 1, -34.6037, -58.3816);

-- Insertando horarios
INSERT INTO schedules (id_day, id_start_hour, id_end_hour) VALUES 
(1, 1, 8),
(2, 2, 9),
(3, 3, 10);

-- Insertando servicios en el banco de servicios
INSERT INTO bank_services (id_classification, name, description, price) VALUES 
(1, 'Corte Clásico', 'Corte de cabello tradicional', 25000.00),
(2, 'Afeitado Premium', 'Afeitado con toalla caliente', 35000.00),
(3, 'Peinado Ejecutivo', 'Peinado formal para eventos', 20000.00);

-- Insertando productos en el banco de productos
INSERT INTO bank_products (id_classification, name, description, price, image) VALUES 
(1, 'Shampoo Premium', 'Shampoo profesional para cabello', 45000.00, 'shampoo.jpg'),
(2, 'Aceite para Barba', 'Aceite hidratante para barba', 35000.00, 'aceite.jpg'),
(3, 'Cera para Cabello', 'Cera modeladora profesional', 25000.00, 'cera.jpg');

-- Insertando barberías
INSERT INTO barbershops (id_people, id_location, id_state_barbershops, id_shedule, name, description, image_banner) VALUES 
(1, 1, 1, 1, 'BarberShop Elite', 'La mejor barbería de la ciudad', 'banner1.jpg'),
(1, 1, 1, 2, 'Cortes Premium', 'Experiencia única en cortes', 'banner2.jpg'),
(1, 1, 1, 3, 'Style Barber', 'Tu estilo, nuestra pasión', 'banner3.jpg');

-- Insertando productos de barbería
INSERT INTO barbershop_products (id_barbershop, id_classification, id_product) VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

-- Insertando servicios de barbería
INSERT INTO barbershop_services (id_barbershop, id_classification, id_service, id_duration) VALUES 
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3);

-- Insertando barberos en barberías
INSERT INTO barbershop_barbers (id_barbershop, id_people) VALUES 
(1, 2),
(2, 3),
(3, 1);

-- Insertando valores de comisión para productos
INSERT INTO commission_value_product (value) VALUES 
(5.00),
(7.50),
(10.00);

-- Insertando valores de comisión para citas
INSERT INTO commission_value_appointment (value) VALUES 
(10.00),
(12.50),
(15.00);

-- Insertando pagos de productos
INSERT INTO product_payments (id_people, id_product, id_payment_status, quantity, total, total_receive_barbershop, id_commission_value_product) VALUES 
(1, 1, 1, 1, 45000.00, 42750.00, 1),
(2, 2, 2, 2, 70000.00, 66500.00, 2),
(3, 3, 1, 1, 25000.00, 23750.00, 3);

-- Insertando pagos de citas
INSERT INTO appointment_payments (id_people, id_appointment, id_payment_status, total, total_receive_barbershop, id_commission_value_appointment) VALUES 
(1, 1, 1, 25000.00, 22500.00, 1),
(2, 2, 2, 35000.00, 31500.00, 2),
(3, 3, 1, 20000.00, 18000.00, 3);

-- Insertando publicaciones
INSERT INTO posts (id_barbershop, id_people, id_classification, title, content, media) VALUES 
(1, 1, 1, 'Promoción del Mes', 'Descuento del 20% en todos los servicios', 'promo1.jpg'),
(2, 2, 2, 'Nuevo Servicio', 'Presentamos nuestro nuevo servicio premium', 'nuevo1.jpg'),
(3, 3, 3, 'Consejos de Cuidado', 'Cómo mantener tu barba perfecta', 'consejo1.jpg');

-- Insertando comentarios
INSERT INTO comments (id_people, id_post, comment) VALUES 
(1, 1, '¡Excelente promoción!'),
(2, 2, 'Me encantó el nuevo servicio'),
(3, 3, 'Muy buenos consejos');

-- Insertando reseñas
INSERT INTO reviews (id_people, id_barbershop, comment, rating) VALUES 
(1, 2, 'Excelente servicio y atención', 5),
(2, 3, 'Muy profesionales', 4),
(3, 1, 'Recomendado totalmente', 5);