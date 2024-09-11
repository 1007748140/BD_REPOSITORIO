create database ecommerce_db;
use ecommerce_db;

-- Tabla Usuarios
CREATE TABLE Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    contraseña VARCHAR(255) NOT NULL,
    telefono VARCHAR(20),
    direccion TEXT,
    createdAt DATETIME,
    updatedAt DATETIME 
);

-- Creación de la tabla Categorías
CREATE TABLE Categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Creación de la tabla Proveedores
CREATE TABLE Proveedores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    direccion TEXT,
    telefono VARCHAR(20),
    email VARCHAR(255),
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Creación de la tabla Productos con relación a Categorías y Proveedores
CREATE TABLE Productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    categoria_id INT,
    proveedor_id INT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (categoria_id) REFERENCES Categorias(id),
    FOREIGN KEY (proveedor_id) REFERENCES Proveedores(id)
);

-- Creación de la tabla Órdenes con relación a Usuarios
CREATE TABLE Ordenes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    estado ENUM('Pendiente', 'Enviado', 'Entregado', 'Cancelado') NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    direccion_envio TEXT NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);

-- Creación de la tabla Detalles de Órdenes con relación a Órdenes y Productos
CREATE TABLE Detalles_Ordenes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    orden_id INT,
    producto_id INT,
    cantidad INT NOT NULL,
    precio_unitario DECIMAL(10, 2) NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (orden_id) REFERENCES Ordenes(id),
    FOREIGN KEY (producto_id) REFERENCES Productos(id)
);

-- Creación de la tabla Métodos de Pago
CREATE TABLE Metodos_Pago (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Creación de la tabla Pagos con relación a Órdenes y Métodos de Pago
CREATE TABLE Pagos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    orden_id INT,
    metodo_pago_id INT,
    monto DECIMAL(10, 2) NOT NULL,
    estado_pago ENUM('Pendiente', 'Completado', 'Fallido') NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (orden_id) REFERENCES Ordenes(id),
    FOREIGN KEY (metodo_pago_id) REFERENCES Metodos_Pago(id)
);

-- Creación de la tabla Envíos con relación a Órdenes
CREATE TABLE Envios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    orden_id INT,
    direccion_envio TEXT NOT NULL,
    estado_envio ENUM('Pendiente', 'Enviado', 'Entregado') NOT NULL,
    fecha_envio DATETIME,
    fecha_entrega DATETIME,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (orden_id) REFERENCES Ordenes(id)
);

-- Creación de la tabla Carritos de Compra con relación a Usuarios
CREATE TABLE Carritos_Compra (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);

-- Creación de la tabla Detalles del Carrito con relación a Carritos de Compra y Productos
CREATE TABLE Detalles_Carrito (
    id INT AUTO_INCREMENT PRIMARY KEY,
    carrito_id INT,
    producto_id INT,
    cantidad INT NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (carrito_id) REFERENCES Carritos_Compra(id),
    FOREIGN KEY (producto_id) REFERENCES Productos(id)
);

-- Creación de la tabla Descuentos
CREATE TABLE Descuentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(50) NOT NULL,
    porcentaje_descuento DECIMAL(5, 2) NOT NULL,
    fecha_inicio DATETIME,
    fecha_fin DATETIME,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Creación de la tabla Reseñas de Productos con relación a Usuarios y Productos
CREATE TABLE Reseñas_Productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    producto_id INT,
    comentario TEXT,
    calificacion INT CHECK (calificacion >= 1 AND calificacion <= 5),
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id),
    FOREIGN KEY (producto_id) REFERENCES Productos(id)
);

-- Creación de la tabla Direcciones de Envío con relación a Usuarios
CREATE TABLE Direcciones_Envio (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    direccion TEXT NOT NULL,
    ciudad VARCHAR(100),
    codigo_postal VARCHAR(20),
    pais VARCHAR(100),
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);
