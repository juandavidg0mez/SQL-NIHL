USE tienda;
DELIMITER $$
CREATE FUNCTION calcularDescuento(precio DECIMAL(10, 2), porc DECIMAL(10, 2))
RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE descuento DECIMAL(10, 2);
    
    IF porc > 0 AND precio <= 100 THEN
        SET descuento = precio * (porc / 100);
        RETURN descuento;
    ELSE 
        RETURN 0;
    END IF;
END$$
DELIMITER;
  SELECT nombre , precio, calcularDescuento(precio, 20)as descuento
  from producto;


  CREATE TABLE ventas(
    id INT AUTO_INCREMENT,
    vendedor_id INT,
    monto_venta DECIMAL(10, 2),
    PRIMARY KEY(id)
  );

DELIMITER //

CREATE FUNCTION promedio(productos INT, cantidad INT) 
RETURNS decimal(10,2)
DETERMINISTIC
BEGIN
    DECLARE resultado DECIMAL(10, 2);
    SELECT SUM(monto_venta) INTO productos FROM ventas;
    SELECT COUNT(monto_ventas) INTO cantidad FROM ventas;

     IF cantidad > 0 THEN
        SET resultado = productos / cantidad;
    ELSE
        SET resultado = 0;
    END IF;

    RETURN resultado;
END;
//

DELIMITER ;

-- FUNCION CALCULAR EL DESCUENTO DEPENDIENDO DE LA CATEGORIA DEL CLIENTE

CREATE TABLE ordenes(
    id INT AUTO_INCREMENT,
    cliente_id INT,
    precio DECIMAL(10 , 2),
    categoria_cliente VARCHAR(10),
    PRIMARY KEY(id)
);

DELIMITER $$
CREATE FUNCTION DesCat(categoria VARCHAR(10),valor DECIMAL(10 , 2)) 
RETURNS decimal(10,2)
DETERMINISTIC
BEGIN
    DECLARE resultado DECIMAL(10, 2);
    SELECT categoria_cliente INTO categoria FROM ordenes;
    SELECT precio INTO valor FROM ordenes;
    CASE 
        WHEN categoria = "Vendedor" THEN  SET resultado = valor / 0.5
        WHEN categoria
    
        ELSE  
    END

END$$
DELIMITER;

DELIMITER $$

CREATE FUNCTION calDeste(dividendo DOUBLE, divisor DOUBLE)
RETURNS DOUBLE
DETERMINISTIC
BEGIN
    DECLARE resultado DOUBLE;

    IF divisor = 0 THEN
        SIGNAL SQLSTATE '75000' SET MESSAGE_TEXT = 'Error: El divisor no puede ser cero.';
    ELSE
        SET resultado = dividendo / divisor;
    END IF;

    RETURN resultado;
END$$

DELIMITER ;


SELECT calDeste(6,0) as Result;