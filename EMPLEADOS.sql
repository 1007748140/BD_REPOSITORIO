# crear tabla empleados
# adjuntar pantallazos, documentar todos los comandos
# actualizar, insertar, eliminar
# decir porque el tipo de datos para cada atributo
# viernes tenemos exposicion en grupo (tema select en clases)
CREATE DATABASE documentaciondb;

CREATE TABLE empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    edad INT,
    puesto VARCHAR(50),
    fecha_contratacion DATE,
    createdAt DATETIME,
    updatedAt DATETIME
);



