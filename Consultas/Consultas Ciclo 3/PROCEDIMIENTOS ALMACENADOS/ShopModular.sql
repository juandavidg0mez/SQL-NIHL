USE ShopModular;
DELIMITER //

CREATE PROCEDURE AñadirProducto(IN nombre VARCHAR(255), IN precio DECIMAL(10, 2), IN stock INT)
BEGIN
    INSERT INTO Productos(nombre, precio, stock) VALUES (nombre, precio, stock);
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE RegistrarCliente(IN nombre VARCHAR(255), IN email VARCHAR(255))
BEGIN
    INSERT INTO Clientes(nombre, email) VALUES (nombre, email);
END //

DELIMITER ;
DELIMITER //

CREATE PROCEDURE RealizarVenta(IN productoID INT, IN clienteID INT, IN cantidad INT)
BEGIN
    -- Aquí podrías añadir lógica para actualizar el stock, verificar disponibilidad, etc.
    INSERT INTO Ventas(producto_id, cliente_id, cantidad, fecha_venta) VALUES (productoID, clienteID, cantidad, CURDATE());
END //

DELIMITER ;
-- insertar productos
CALL AñadirProducto('Producto 1', 10.99, 50);
CALL AñadirProducto('Producto 2', 15.49, 30);
CALL AñadirProducto('Producto 3', 8.99, 20);
CALL AñadirProducto('Producto 4', 20.99, 40);
CALL AñadirProducto('Producto 5', 12.99, 60);

-- insertar clientes 

CALL RegistrarCliente('Cliente 1', 'cliente1@example.com');
CALL RegistrarCliente('Cliente 2', 'cliente2@example.com');
CALL RegistrarCliente('Cliente 3', 'cliente3@example.com');
CALL RegistrarCliente('Cliente 4', 'cliente4@example.com');
CALL RegistrarCliente('Cliente 5', 'cliente5@example.com');