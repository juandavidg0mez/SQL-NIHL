CREATE TABLE orchestras (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    rating DECIMAL(3, 2),
    city_origin VARCHAR(255),
    country_origin VARCHAR(255),
    year_founded INT
);
CREATE TABLE concerts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    city VARCHAR(255),
    country VARCHAR(255),
    year INT,
    rating DECIMAL(3, 2),
    orchestra_id INT,
    FOREIGN KEY (orchestra_id) REFERENCES orchestras(id)
);
CREATE TABLE members (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    position VARCHAR(255),
    wage DECIMAL(10, 2),
    experience INT,
    orchestra_id INT,
    FOREIGN KEY (orchestra_id) REFERENCES orchestras(id)
);

INSERT INTO orchestras (name, rating, city_origin, country_origin, year_founded) 
VALUES 
    ('Orquesta Sinfónica Nacional', 4.5, 'Ciudad de México', 'México', 1930),
    ('Orquesta Filarmónica de Berlín', 4.8, 'Berlín', 'Alemania', 1882),
    ('Orquesta Sinfónica de Londres', 4.7, 'Londres', 'Reino Unido', 1904),
    ('Orquesta Sinfónica de Boston', 4.6, 'Boston', 'Estados Unidos', 1881),
    ('Orquesta Sinfónica de Viena', 4.9, 'Viena', 'Austria', 1900),
    ('Orquesta Filarmónica de Nueva York', 4.7, 'Nueva York', 'Estados Unidos', 1842);

    INSERT INTO members (name, position, wage, experience, orchestra_id) 
VALUES 
    ('Juan Pérez', 'Violinista', 2000, 10, 1),
    ('María González', 'Flautista', 1800, 8, 2),
    ('Carlos López', 'Violonchelista', 2100, 12, 3),
    ('Ana Martínez', 'Trompetista', 1900, 7, 4),
    ('Luis Rodríguez', 'Clarinetista', 1950, 9, 5),
    ('Laura Sánchez', 'Percusionista', 2050, 11, 6);

INSERT INTO concerts (city, country, year, rating, orchestra_id) 
VALUES 
    ('Ciudad de México', 'México', 2023, 4.6, 1),
    ('Berlín', 'Alemania', 2022, 4.7, 2),
    ('Londres', 'Reino Unido', 2021, 4.8, 3),
    ('Boston', 'Estados Unidos', 2020, 4.5, 4),
    ('Viena', 'Austria', 2019, 4.9, 5),
    ('Nueva York', 'Estados Unidos', 2018, 4.7, 6);

SELECT * FROM members;
SELECT * FROM concerts;
SELECT * FROM orchestras;

/*I. Seleccionar los nombres de todas las orquestas que tengan la misma ciudad
de origen que alguna ciudad en la que se haya celebrado algún concierto en
2013.*/


-- ========================================================================



/* Seleccionar los nombres y cargos (es decir, el instrumento que tocan) de
todos los miembros de orquesta que tengan más de 10 años de experiencia y
no pertenezcan a orquestas con una calificación inferior a 8,0. */

-- Para fines practicos lo hare por encima de 4.7

SELECT M.name  , M.position, M.experience ,O.rating as Raiten_Orchesta
from members as M
INNER JOIN orchestras as O 
ON O.id = M.orchestra_id
WHERE  M.experience >= 10 AND O.rating >= 4.7;


/*Mostrar el nombre y el cargo de los miembros de la orquesta que ganan más
que el salario medio de todos los violinistas.*/


SELECT name, position, wage
FROM members
WHERE wage > (SELECT AVG(wage) FROM members WHERE position = 'Violinista');
/*Mostrar los nombres de las orquestas que se crearon después de la
'Orquesta Sinfónica de Boston' y tienen una valoración superior a 7.5.*/

SELECT name, year_founded, rating
FROM orchestras
WHERE  year_founded > (SELECT year_founded FROM orchestras WHERE name = 'Orquesta Sinfónica de Boston') AND rating > 4.6 ;