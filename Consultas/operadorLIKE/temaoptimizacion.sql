-- TRANSACCIONES: son operaciones que se consideran o se tratan como si fueran una sola entocnes si falla se deshace
USE prueba;
START TRANSACTION;
INSERT INTO employees VALUES
    (NULL, 'Yulieth', 'Taylor', 3 ,2);
-- el commit asegura que todo se hace bien
COMMIT;

CREATE TABLE ordene(
    idOrden INT  PRIMARY KEY,
    estado VARCHAR(50)
);

CREATE TABLE factura(
    idfactura INT PRIMARY KEY,
    idOrden INT,
    cantidad INT,
    Foreign Key (idOrden) REFERENCES ordene(idOrden)
);

START TRANSACTION;
INSERT INTO ordene VALUES(100, "Completada");
INSERT INTO factura VALUES(1, 100, 3);

COMMIT;

SELECT * FROM ordene;
SELECT * FROM factura;

ROLLBACK;

-- kill -9 ###
