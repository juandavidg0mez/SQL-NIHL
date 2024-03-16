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

CALL RealizarVenta(1, 1, 2); -- Venta del Producto 1 al Cliente 1 con cantidad 2
CALL RealizarVenta(2, 2, 1); -- Venta del Producto 2 al Cliente 2 con cantidad 1
CALL RealizarVenta(3, 3, 3); -- Venta del Producto 3 al Cliente 3 con cantidad 3
CALL RealizarVenta(4, 4, 2); -- Venta del Producto 4 al Cliente 4 con cantidad 2
CALL RealizarVenta(5, 5, 1); -- Venta del Producto 5 al Cliente 5 con cantidad 1
CALL RealizarVenta(1, 2, 1); -- Venta del Producto 1 al Cliente 2 con cantidad 1
CALL RealizarVenta(2, 3, 2); -- Venta del Producto 2 al Cliente 3 con cantidad 2
CALL RealizarVenta(3, 4, 1); -- Venta del Producto 3 al Cliente 4 con cantidad 1
CALL RealizarVenta(4, 5, 3); -- Venta del Producto 4 al Cliente 5 con cantidad 3
CALL RealizarVenta(5, 1, 2); -- Venta del Producto 5 al Cliente 1 con cantidad 2

