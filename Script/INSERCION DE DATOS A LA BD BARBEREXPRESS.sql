use BarberExpress;

-- Insertar en la tabla people
INSERT INTO people (id, first_name, last_name) VALUES
(1, 'Juan', 'Pérez'),
(2, 'Carlos', 'Rodríguez'),
(3, 'Ana', 'Gómez'),
(4, 'María', 'López'),
(5, 'Luis', 'Martínez');

-- Insertar en la tabla state
INSERT INTO `state` (name, country_id) VALUES
('Cundinamarca', 1),
('Antioquia', 1),
('Valle del Cauca', 1),
('Atlántico', 1),
('Bolívar', 1);

-- Insertar en la tabla people_location
INSERT INTO people_location (people_id, country_id, state_id, latitude, longitude) VALUES
(1, 1, 1, 4.7110, -74.0721),
(2, 1, 2, 6.2442, -75.5812),
(3, 1, 3, 3.4372, -76.5225),
(4, 1, 4, 10.9685, -74.7813),
(5, 1, 5, 10.3910, -75.4794);

-- Insertar en la tabla people_info
INSERT INTO people_info (people_id, role_id, location_id, email, password, phone, profile_image) VALUES
(1, 1, 1, 'juan.perez@example.com', 'hashed_password_1', '3101234567', 'https://example.com/profile1.jpg'),
(2, 2, 2, 'carlos.rodriguez@example.com', 'hashed_password_2', '3101234568', 'https://example.com/profile2.jpg'),
(3, 1, 3, 'ana.gomez@example.com', 'hashed_password_3', '3101234569', 'https://example.com/profile3.jpg'),
(4, 1, 4, 'maria.lopez@example.com', 'hashed_password_4', '3101234570', 'https://example.com/profile4.jpg'),
(5, 2, 5, 'luis.martinez@example.com', 'hashed_password_5', '3101234571', 'https://example.com/profile5.jpg');

-- Insertar en la tabla barbershop
INSERT INTO barbershop (people_id, location_id, name, description) VALUES
(2, 2, 'Carlos Barbershop', 'A professional barbershop located in Medellín.'),
(5, 5, 'Luis Cuts', 'Expert haircuts and grooming in Cartagena.'),
(1, 1, 'Juan´s Hair Salon', 'Top-quality haircuts in Bogotá.'),
(3, 3, 'Ana Styles', 'Modern hair salon in Cali.'),
(4, 4, 'María´s Barber', 'Family-friendly barbershop in Barranquilla.');

-- Insertar en la tabla schedule
INSERT INTO schedule (barbershop_id, start_time, end_time, day, shop_status) VALUES
(1, '08:00:00', '18:00:00', 'Monday', 1),
(2, '09:00:00', '19:00:00', 'Tuesday', 1),
(3, '08:00:00', '17:00:00', 'Wednesday', 1),
(4, '10:00:00', '20:00:00', 'Thursday', 1),
(5, '08:30:00', '18:30:00', 'Friday', 1);

-- Insertar en la tabla barbers
INSERT INTO barbers (barbershop_id, name, profile_picture, status) VALUES
(1, 'Pedro Torres', 'https://example.com/barber1.jpg', 1),
(2, 'Miguel Sánchez', 'https://example.com/barber2.jpg', 1),
(3, 'Jorge Ramírez', 'https://example.com/barber3.jpg', 1),
(4, 'Oscar Díaz', 'https://example.com/barber4.jpg', 1),
(5, 'Fernando Mendoza', 'https://example.com/barber5.jpg', 1);

-- Insertar en la tabla banks
INSERT INTO banks (name) VALUES
('BANCOLOMBIA'),
('NEQUI'),
('LULOBANK'),
('DAVIDPLATA');

-- Insertar en la tabla barber_accounts
INSERT INTO barber_accounts (barber_id, bank_id, account_number) VALUES
(1, 1, '1234567890'),
(2, 2, '2345678901'),
(3, 3, '3456789012'),
(4, 4, '4567890123'),
(5, 1, '5678901234');

-- Insertar en la tabla services
INSERT INTO services (barbershop_id, name, description, price, duration) VALUES
(1, 'Basic Haircut', 'A simple haircut for men.', 20.00, '00:30:00'),
(2, 'Beard Trim', 'Beard trimming service.', 15.00, '00:20:00'),
(3, 'Hair Color', 'Hair coloring service.', 40.00, '01:00:00'),
(4, 'Hair Wash', 'Professional hair wash.', 10.00, '00:15:00'),
(5, 'Deluxe Haircut', 'Deluxe haircut with special treatment.', 30.00, '00:45:00');

-- Insertar en la tabla products
INSERT INTO products (barbershop_id, name, description, price, stock) VALUES
(1, 'Shampoo', 'High-quality shampoo.', 10.00, 100),
(2, 'Hair Gel', 'Strong hold hair gel.', 8.00, 50),
(3, 'Beard Oil', 'Beard nourishing oil.', 12.00, 40),
(4, 'Hair Spray', 'Long-lasting hair spray.', 9.00, 30),
(5, 'Conditioner', 'Moisturizing hair conditioner.', 11.00, 20);

-- Insertar en la tabla appointments
INSERT INTO appointments (barbershop_id, people_id, service_id, barber_id, date, status) VALUES
(1, 1, 1, 1, '2024-10-06 10:00:00', 'confirmed'),
(2, 2, 2, 2, '2024-10-07 11:00:00', 'completed'),
(3, 3, 3, 3, '2024-10-08 12:00:00', 'pending'),
(4, 4, 4, 4, '2024-10-09 13:00:00', 'cancelled'),
(5, 5, 5, 5, '2024-10-10 14:00:00', 'confirmed');

-- Insertar en la tabla posts
INSERT INTO posts (barbershop_id, barber_id, title, content, media) VALUES
(1, 1, 'New Haircut Styles', 'Check out our new haircut styles for this season.', 'https://example.com/media1.jpg'),
(2, 2, 'Beard Care Tips', 'Learn how to take care of your beard.', 'https://example.com/media2.jpg'),
(3, 3, 'Hair Coloring Trends', 'The latest trends in hair coloring.', 'https://example.com/media3.jpg'),
(4, 4, 'Special Offers', 'Special offers available this week.', 'https://example.com/media4.jpg'),
(5, 5, 'Deluxe Services', 'Try our new deluxe haircut service.', 'https://example.com/media5.jpg');

-- Insertar en la tabla reviews
INSERT INTO reviews (barbershop_id, people_id, appointment_id, comment, rating) VALUES
(1, 1, 1, 'Great service!', 5),
(2, 2, 2, 'Excellent beard trim.', 4),
(3, 3, 3, 'Loved the hair coloring.', 5),
(4, 4, 4, 'Cancelled, but still good.', 3),
(5, 5, 5, 'Best haircut ever!', 5);

-- Insertar en la tabla payments
INSERT INTO payments (appointment_id, people_id, barbershop_id, barber_id, amount, payment_method, status, receipt_url) VALUES
(1, 1, 1, 1, 20.00, 'cash', 'paid', 'https://example.com/receipt1.jpg'),
(2, 2, 2, 2, 15.00, 'transfer', 'paid', 'https://example.com/receipt2.jpg'),
(3, 3, 3, 3, 40.00, 'cash', 'pending', 'https://example.com/receipt3.jpg'),
(4, 4, 4, 4, 10.00, 'transfer', 'cancelled', 'https://example.com/receipt4.jpg'),
(5, 5, 5, 5, 30.00, 'cash', 'paid', 'https://example.com/receipt5.jpg');
