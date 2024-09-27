DROP DATABASE IF EXISTS ecommerce_db;
CREATE DATABASE ecommerce_db;
USE ecommerce_db;

-- Tabla Users
CREATE TABLE Users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    createdAt DATETIME,
    updatedAt DATETIME
);

-- Tabla Categories
CREATE TABLE Categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT,
    createdAt DATETIME,
    updatedAt DATETIME
);

-- Tabla Suppliers
CREATE TABLE Suppliers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    address TEXT,
    phone VARCHAR(20),
    email VARCHAR(255),
    createdAt DATETIME,
    updatedAt DATETIME
);

-- Tabla Discounts con campos y llaves foráneas relacionadas
CREATE TABLE Discounts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `code` VARCHAR(50) NOT NULL,
    discount_percentage DECIMAL(5, 2) NOT NULL,
    start_date DATETIME,
    end_date DATETIME,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla Products con relaciones a Categories y Suppliers
CREATE TABLE Products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    category_id INT,
    supplier_id INT,
    discount_id INT,  -- Relación con Discounts
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (category_id) REFERENCES Categories(id),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(id),
    FOREIGN KEY (discount_id) REFERENCES Discounts(id) -- Relación con Discounts
);

-- Tabla Orders con relaciones a Users
CREATE TABLE Orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    discount_id INT,  -- Relación con Discounts
    `status` ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    shipping_address TEXT NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (discount_id) REFERENCES Discounts(id) -- Relación con Discounts
);

-- Tabla Order_Details con relaciones a Orders y Products
CREATE TABLE Order_Details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    createdAt DATETIME,
    updatedAt DATETIME,
    FOREIGN KEY (order_id) REFERENCES Orders(id),
    FOREIGN KEY (product_id) REFERENCES Products(id)
);

-- Tabla Payment_Methods
CREATE TABLE Payment_Methods (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT,
    createdAt DATETIME,
    updatedAt DATETIME
);

-- Tabla Payments con relaciones a Orders y Payment_Methods
CREATE TABLE Payments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_method_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    payment_status ENUM('Pending', 'Completed', 'Failed') NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES Orders(id),
    FOREIGN KEY (payment_method_id) REFERENCES Payment_Methods(id)
);

-- Tabla Shipments con relaciones a Orders
CREATE TABLE Shipments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    shipping_address TEXT NOT NULL,
    shipping_status ENUM('Pending', 'Shipped', 'Delivered') NOT NULL,
    shipping_date DATETIME,
    delivery_date DATETIME,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES Orders(id)
);

-- Tabla Shopping_Carts con relaciones a Users
CREATE TABLE Shopping_Carts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

-- Tabla Cart_Details con relaciones a Shopping_Carts y Products
CREATE TABLE Cart_Details (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cart_id INT,
    product_id INT,
    quantity INT NOT NULL,
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (cart_id) REFERENCES Shopping_Carts(id),
    FOREIGN KEY (product_id) REFERENCES Products(id)
);

-- Tabla Product_Reviews con relaciones a Users y Products
CREATE TABLE Product_Reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_id INT,
    `comment` TEXT,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (product_id) REFERENCES Products(id)
);

-- Tabla Shipping_Addresses con relaciones a Users
CREATE TABLE Shipping_Addresses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    address TEXT NOT NULL,
    city VARCHAR(100),
    postal_code VARCHAR(20),
    country VARCHAR(100),
    createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);
