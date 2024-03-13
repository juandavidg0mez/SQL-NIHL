drop SCHEMA if EXISTS Funciones_DE_agrupacion;
CREATE SCHEMA if NOT EXISTS Funciones_DE_agrupacion;
USE Funciones_DE_agrupacion;

-- TABLE 
DROP TABLE IF EXISTS coches;

CREATE TABLE IF NOt EXISTS coches(
    id int(11) not NULL AUTO_INCREMENT,
    Marca VARCHAR(45) NOT NULL,
    Modelo VARCHAR(45) NOT NULL,
    Kilometros INT(11) NOT NULL,
    PRIMARY KEY(id)
);
-- AUTO_INCREMENT = 10;
INSERT INTO coches(id, Marca, Modelo, Kilometros)VALUES
(1, 'Renault', 'Clio', 10),
(2, 'Renault', 'Megane', 23000),
(3, 'Seat', 'Ibiza', 9000),
(4, 'Seat', 'Leon', 20),
(5, 'Opel', 'Corsa', 999),
(6, 'Renault', 'Clio', 34000),
(7, 'Seat', 'Ibiza', 2000),
(8, 'Seat', 'Cordoba', 99999),
(9, 'Renault', 'Clio', 88888);

SELECT * FROM coches;
-- me agrupo las cosas comunes de la tabla 
SELECT Marca
FROM coches
GROUP BY Marca;
-- saca o subtrae uno de cada grupo me saca un registro unico de ese grupo
SELECT Marca, Modelo
FROM coches
GROUP BY Marca, Modelo;
-- Agrupacion de Datos

SELECT Marca, COUNT(*) AS Contador
FROM coches
GROUP BY Marca
ORDER BY Contador DESC;


-- Sumar el kilometraje de cada Marca
SELECT Marca, SUM(Kilometros) AS Kilometraje
FROM coches
GROUP BY Marca;

SELECT Marca, MAX(Kilometros) AS Kilometraje
FROM coches
GROUP BY Marca;

SELECT Marca, MIN(Kilometros) AS Kilometraje
FROM coches
GROUP BY Marca;

-- El HAVING es el filtro de los group BY es el WHERE


