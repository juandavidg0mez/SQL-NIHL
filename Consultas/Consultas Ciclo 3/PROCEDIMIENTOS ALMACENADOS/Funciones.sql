USe tienda;

CREATE PROCEDURE calcularTotal( in precio DECIMAL(10, 2),in cantidad INT, out total decimal(10, 2))
BEGIN
    SET total = precio * cantidad;
END;

set @total = 0;
call tienda.calcularTotal