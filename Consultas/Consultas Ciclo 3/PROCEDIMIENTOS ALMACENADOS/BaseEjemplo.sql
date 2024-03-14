CREATE DATABASE base_ejemplo;
USE base_ejemplo;

CREATE TABLE productos(
    id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL,
    estado VARCHAR(20) NOT NULL DEFAULT 'disponible',
    precio FLOAT NOT NULL DEFAULT 0.0,
    PRIMARY KEY(id)
);

INSERT INTO productos (nombre, estado, precio) VALUES
('Producto1', 'disponible', 10.99),
('Producto2', 'disponible', 20.49),
('Producto3', 'agotado', 5.99),
('Producto4', 'disponible', 15.29),
('Producto5', 'disponible', 12.99),
('Producto6', 'agotado', 8.99),
('Producto7', 'disponible', 18.79),
('Producto8', 'agotado', 6.49),
('Producto9', 'disponible', 22.99),
('Producto10', 'disponible', 14.99),
('Producto11', 'disponible', 11.99),
('Producto12', 'agotado', 9.99),
('Producto13', 'disponible', 17.99),
('Producto14', 'disponible', 19.99),
('Producto15', 'disponible', 16.99),
('Producto16', 'agotado', 7.99),
('Producto17', 'disponible', 21.99),
('Producto18', 'disponible', 24.99),
('Producto19', 'disponible', 13.99),
('Producto20', 'agotado', 8.49);

-- Procedimiento con Parametros IN
-- Obtener Productos basados en su estdao (por ejemplo, 'disponible' o 'agotado')

DELIMITER $$
CREATE PROCEDURE obtenerProductosPorEstado(IN nombre_estado VARCHAR(255))
BEGIN
    SELECT * FROM productos WHERE estado = nombre_estado;
END$$


-- In es el ingleso de parametros recordemos que es lo que varia en ello
CALL base_ejemplo.obtenerProductosPorEstado('disponible');


-- Prodecimientos Con parametros OUT
-- Contar el numero de prodectos seguin su estado y devolver este numero 

DELIMITER$$ 
CREATE PROCEDURE contarProductosPorEstado(IN nombre_estado VARCHAR(25), OUT numero INT)
BEGIN
SELECT COUNT(id) INTO numero FROM productos WHERE estado = nombre_estado;
END$$
-- SET es una variable donde almacenamos algo comoun contador que inicia en cero

SET @cantidad_dispobibles = 0;
CALL contarProductosPorEstado('disponible', @cantidad_dispobibles);
SELECT @cantidad_dispobibles AS ProductosDispobibles;

-- Procedimiento con Parametros INOUT
DELIMITER $$
CREATE PROCEDURE venderProducto(INOUT beneficio INT(255), in id_producto INT)
BEGIN
DECLARE precio_producto FLOAT;
SELECT precio INTO precio_producto FROM productos WHERE ID = id_producto;
SET beneficio = beneficio + precio_producto;
END$$
DELIMITER;;
SET @beneficio_acumulado = 0;
CALL venderProducto(@beneficio_acumulado, 1);
CALL venderProducto(@beneficio_acumulado, 2);
SELECT @beneficio_acumulado AS BeneficioTotal;
