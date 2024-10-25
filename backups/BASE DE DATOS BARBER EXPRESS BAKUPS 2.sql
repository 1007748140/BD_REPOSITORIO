-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-10-2024 a las 18:11:50
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `barberexpress2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appointments`
--

CREATE TABLE `appointments` (
  `id` int(20) NOT NULL,
  `id_user` int(20) NOT NULL,
  `id_barber` int(20) NOT NULL,
  `id_service` int(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `appointment_payments`
--

CREATE TABLE `appointment_payments` (
  `id` int(20) NOT NULL,
  `id_user` int(20) NOT NULL,
  `id_appointment` int(20) NOT NULL,
  `id_payment_status` int(20) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barbers`
--

CREATE TABLE `barbers` (
  `id` int(20) NOT NULL,
  `id_barbershop` int(20) NOT NULL,
  `id_barber_state` int(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `profile_picture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `barbers`
--

INSERT INTO `barbers` (`id`, `id_barbershop`, `id_barber_state`, `name`, `last_name`, `email`, `phone`, `profile_picture`) VALUES
(1, 1, 1, 'Pedro', 'López', 'pedro@example.com', '3216549870', 'pedro.jpg'),
(2, 2, 2, 'Santiago', 'Ramirez', 'santiago@example.com', '4561237890', 'santiago.jpg'),
(3, 3, 3, 'María', 'Fernandez', 'maria@example.com', '7891234560', 'maria.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barbershops`
--

CREATE TABLE `barbershops` (
  `id` int(20) NOT NULL,
  `id_user` int(20) NOT NULL,
  `id_location` int(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `barbershops`
--

INSERT INTO `barbershops` (`id`, `id_user`, `id_location`, `name`, `description`, `created_at`) VALUES
(1, 2, 1, 'BarberShop Medellín', 'Una barbería moderna en el corazón de Medellín', '2024-10-20 16:07:40'),
(2, 3, 2, 'Barbería Bogotá', 'La mejor barbería de Bogotá con un excelente servicio', '2024-10-20 16:07:40'),
(3, 2, 3, 'Cali Style', 'Estilo y atención personalizada en el Valle del Cauca', '2024-10-20 16:07:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barber_reviews`
--

CREATE TABLE `barber_reviews` (
  `id` int(20) NOT NULL,
  `id_user` int(20) NOT NULL,
  `id_barber` int(20) NOT NULL,
  `rating` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barber_status`
--

CREATE TABLE `barber_status` (
  `id` int(20) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `barber_status`
--

INSERT INTO `barber_status` (`id`, `status`) VALUES
(1, 'Disponible'),
(2, 'Ocupado'),
(3, 'En descanso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

CREATE TABLE `comments` (
  `id` int(20) NOT NULL,
  `id_user` int(20) NOT NULL,
  `id_post` int(20) NOT NULL,
  `comment` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `countries`
--

CREATE TABLE `countries` (
  `id` int(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `countries`
--

INSERT INTO `countries` (`id`, `name`) VALUES
(1, 'Colombia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `days_week`
--

CREATE TABLE `days_week` (
  `id` int(20) NOT NULL,
  `days` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `days_week`
--

INSERT INTO `days_week` (`id`, `days`) VALUES
(1, 'Lunes'),
(2, 'Martes'),
(3, 'Miercoles'),
(4, 'Jueves'),
(5, 'Viernes'),
(6, 'Sabado'),
(7, 'Domingo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departments`
--

CREATE TABLE `departments` (
  `id` int(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `id_country` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `departments`
--

INSERT INTO `departments` (`id`, `name`, `id_country`) VALUES
(1, 'Antioquia', 1),
(2, 'Cundinamarca', 1),
(3, 'Valle del Cauca', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment_status`
--

CREATE TABLE `payment_status` (
  `id` int(20) NOT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `payment_status`
--

INSERT INTO `payment_status` (`id`, `status`) VALUES
(1, 'Pendiente'),
(2, 'Completado'),
(3, 'Fallido'),
(4, 'Reembolsado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `people`
--

CREATE TABLE `people` (
  `id` int(20) NOT NULL,
  `id_role` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `id` int(20) NOT NULL,
  `id_barbershop` int(20) NOT NULL,
  `id_barber` int(20) NOT NULL,
  `id_classification` int(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `media` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts_classification`
--

CREATE TABLE `posts_classification` (
  `id` int(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `posts_classification`
--

INSERT INTO `posts_classification` (`id`, `name`) VALUES
(1, 'Promociones'),
(2, 'Eventos'),
(3, 'Noticias'),
(4, 'Consejos'),
(5, 'Tendencias'),
(6, 'Historias'),
(7, 'Tutoriales'),
(8, 'Entrevistas'),
(9, 'productos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(20) NOT NULL,
  `id_barbershop` int(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `id_barbershop`, `name`, `description`, `price`, `image`) VALUES
(1, 1, 'Cera para el Cabello', 'Cera de alta fijación para el cabello', 12000.00, 'hair_wax.jpg'),
(2, 2, 'Shampoo para Barba', 'Shampoo especial para el cuidado de la barba', 15000.00, 'beard_shampoo.jpg'),
(3, 3, 'Peine de Madera', 'Peine antienredo de madera natural', 8000.00, 'wooden_comb.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_payments`
--

CREATE TABLE `product_payments` (
  `id` int(20) NOT NULL,
  `id_user` int(20) NOT NULL,
  `id_product` int(20) NOT NULL,
  `id_payment_status` int(20) NOT NULL,
  `quantity` int(20) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reviews`
--

CREATE TABLE `reviews` (
  `id` int(20) NOT NULL,
  `id_user` int(20) NOT NULL,
  `id_barbershop` int(20) NOT NULL,
  `comment` text NOT NULL,
  `rating` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'customer'),
(2, 'barber');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `schedule`
--

CREATE TABLE `schedule` (
  `id` int(20) NOT NULL,
  `id_barbershop` int(20) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `shop_status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `schedule`
--

INSERT INTO `schedule` (`id`, `id_barbershop`, `start_time`, `end_time`, `shop_status`) VALUES
(1, 1, '09:00:00', '18:00:00', 1),
(2, 2, '10:00:00', '19:00:00', 1),
(3, 3, '08:00:00', '17:00:00', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `schedule_days`
--

CREATE TABLE `schedule_days` (
  `id_schedule` int(20) NOT NULL,
  `id_days_week` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `schedule_days`
--

INSERT INTO `schedule_days` (`id_schedule`, `id_days_week`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `services`
--

CREATE TABLE `services` (
  `id` int(20) NOT NULL,
  `id_barbershop` int(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `services`
--

INSERT INTO `services` (`id`, `id_barbershop`, `name`, `description`, `price`) VALUES
(1, 1, 'Corte de Cabello', 'Corte moderno con estilo', 20000.00),
(2, 2, 'Afeitado Clásico', 'Afeitado tradicional con toalla caliente', 15000.00),
(3, 3, 'Peinado', 'Peinado personalizado según la ocasión', 10000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(20) NOT NULL,
  `id_role` int(20) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `id_role`, `first_name`, `last_name`, `email`, `password`, `phone`, `profile_image`, `created_at`) VALUES
(1, 1, 'Carlos', 'Rodriguez', 'carlos@example.com', 'password123', '1234567890', NULL, '2024-10-20 16:07:40'),
(2, 2, 'Juan', 'Perez', 'juan@example.com', 'password123', '0987654321', NULL, '2024-10-20 16:07:40'),
(3, 2, 'Ana', 'Gomez', 'ana@example.com', 'password123', '5678901234', NULL, '2024-10-20 16:07:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_location`
--

CREATE TABLE `users_location` (
  `id` int(20) NOT NULL,
  `id_user` int(20) NOT NULL,
  `id_country` int(20) NOT NULL,
  `id_department` int(20) NOT NULL,
  `latitude` decimal(10,7) NOT NULL,
  `longitude` decimal(10,7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users_location`
--

INSERT INTO `users_location` (`id`, `id_user`, `id_country`, `id_department`, `latitude`, `longitude`) VALUES
(1, 1, 1, 1, 6.2442000, -75.5812000),
(2, 2, 1, 2, 4.6097000, -74.0817000),
(3, 3, 1, 3, 3.4372000, -76.5225000);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_barber` (`id_barber`),
  ADD KEY `id_service` (`id_service`);

--
-- Indices de la tabla `appointment_payments`
--
ALTER TABLE `appointment_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_appointment` (`id_appointment`),
  ADD KEY `id_payment_status` (`id_payment_status`);

--
-- Indices de la tabla `barbers`
--
ALTER TABLE `barbers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_barbershop` (`id_barbershop`),
  ADD KEY `id_barber_state` (`id_barber_state`);

--
-- Indices de la tabla `barbershops`
--
ALTER TABLE `barbershops`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_location` (`id_location`);

--
-- Indices de la tabla `barber_reviews`
--
ALTER TABLE `barber_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_barber` (`id_barber`);

--
-- Indices de la tabla `barber_status`
--
ALTER TABLE `barber_status`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_post` (`id_post`);

--
-- Indices de la tabla `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `days_week`
--
ALTER TABLE `days_week`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_country` (`id_country`);

--
-- Indices de la tabla `payment_status`
--
ALTER TABLE `payment_status`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_role` (`id_role`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_barbershop` (`id_barbershop`),
  ADD KEY `id_barber` (`id_barber`),
  ADD KEY `id_classification` (`id_classification`);

--
-- Indices de la tabla `posts_classification`
--
ALTER TABLE `posts_classification`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_barbershop` (`id_barbershop`);

--
-- Indices de la tabla `product_payments`
--
ALTER TABLE `product_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_payment_status` (`id_payment_status`);

--
-- Indices de la tabla `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_barbershop` (`id_barbershop`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_barbershop` (`id_barbershop`);

--
-- Indices de la tabla `schedule_days`
--
ALTER TABLE `schedule_days`
  ADD PRIMARY KEY (`id_schedule`,`id_days_week`),
  ADD KEY `id_days_week` (`id_days_week`);

--
-- Indices de la tabla `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_barbershop` (`id_barbershop`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_role` (`id_role`);

--
-- Indices de la tabla `users_location`
--
ALTER TABLE `users_location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_country` (`id_country`),
  ADD KEY `id_department` (`id_department`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `appointment_payments`
--
ALTER TABLE `appointment_payments`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `barbers`
--
ALTER TABLE `barbers`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `barbershops`
--
ALTER TABLE `barbershops`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `barber_reviews`
--
ALTER TABLE `barber_reviews`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `barber_status`
--
ALTER TABLE `barber_status`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `days_week`
--
ALTER TABLE `days_week`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `payment_status`
--
ALTER TABLE `payment_status`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `people`
--
ALTER TABLE `people`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `posts_classification`
--
ALTER TABLE `posts_classification`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `product_payments`
--
ALTER TABLE `product_payments`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `schedule`
--
ALTER TABLE `schedule`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `services`
--
ALTER TABLE `services`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `users_location`
--
ALTER TABLE `users_location`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`id_barber`) REFERENCES `barbers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appointments_ibfk_3` FOREIGN KEY (`id_service`) REFERENCES `services` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `appointment_payments`
--
ALTER TABLE `appointment_payments`
  ADD CONSTRAINT `appointment_payments_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appointment_payments_ibfk_2` FOREIGN KEY (`id_appointment`) REFERENCES `appointments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `appointment_payments_ibfk_3` FOREIGN KEY (`id_payment_status`) REFERENCES `payment_status` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `barbers`
--
ALTER TABLE `barbers`
  ADD CONSTRAINT `barbers_ibfk_1` FOREIGN KEY (`id_barbershop`) REFERENCES `barbershops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `barbers_ibfk_2` FOREIGN KEY (`id_barber_state`) REFERENCES `barber_status` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `barbershops`
--
ALTER TABLE `barbershops`
  ADD CONSTRAINT `barbershops_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `barbershops_ibfk_2` FOREIGN KEY (`id_location`) REFERENCES `users_location` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `barber_reviews`
--
ALTER TABLE `barber_reviews`
  ADD CONSTRAINT `barber_reviews_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `barber_reviews_ibfk_2` FOREIGN KEY (`id_barber`) REFERENCES `barbers` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`id_country`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `people`
--
ALTER TABLE `people`
  ADD CONSTRAINT `people_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`id_barbershop`) REFERENCES `barbershops` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`id_barber`) REFERENCES `barbers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `posts_ibfk_3` FOREIGN KEY (`id_classification`) REFERENCES `posts_classification` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_barbershop`) REFERENCES `barbershops` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `product_payments`
--
ALTER TABLE `product_payments`
  ADD CONSTRAINT `product_payments_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_payments_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_payments_ibfk_3` FOREIGN KEY (`id_payment_status`) REFERENCES `payment_status` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`id_barbershop`) REFERENCES `barbershops` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`id_barbershop`) REFERENCES `barbershops` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `schedule_days`
--
ALTER TABLE `schedule_days`
  ADD CONSTRAINT `schedule_days_ibfk_1` FOREIGN KEY (`id_schedule`) REFERENCES `schedule` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `schedule_days_ibfk_2` FOREIGN KEY (`id_days_week`) REFERENCES `days_week` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`id_barbershop`) REFERENCES `barbershops` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_role`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `users_location`
--
ALTER TABLE `users_location`
  ADD CONSTRAINT `users_location_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_location_ibfk_2` FOREIGN KEY (`id_country`) REFERENCES `countries` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_location_ibfk_3` FOREIGN KEY (`id_department`) REFERENCES `departments` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
