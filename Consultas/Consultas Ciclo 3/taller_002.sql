USE world;
SELECT * FROM country;

SELECT * FROM countrylanguage;
SELECT * FROM city;

/*Listar nombres de países y sus respectivas ciudades:
• Mostrar todas las ciudades de Colombia.*/

SELECT B.Name AS Ciudades_de_Colombnia
FROM city as B
LEFT JOIN country as C
ON C.Code = B.countryCode
WHERE countryCode = 'COL';

/*Continentes y sus poblaciones:
• Mostrar la 5 ciudades más pobladas de América, Europa, Asia y África. Ordenar el
informe por Continente, luego descendentemente por ciudades*/

(SELECT C.Continent AS Continente_Americano, FORMAT(B.Population, 0) AS Poblacion_Ciudad, B.Name AS Ciudad
FROM country AS C
LEFT JOIN City AS B 
ON C.Code = B.countryCode
WHERE continent LIKE '%America'
ORDER BY Poblacion_Ciudad DESC
LIMIT 5
)
UNION
(
SELECT C.Continent AS Continente_Europeo, FORMAT(B.Population, 0) AS Poblacion_Ciudad, B.Name AS Ciudad
FROM country AS C
LEFT JOIN City AS B 
ON C.Code = B.countryCode
WHERE continent = 'Europe'
ORDER BY Poblacion_Ciudad DESC
LIMIT 5
)
UNION
(
SELECT C.Continent AS Continente_Africano, FORMAT(B.Population, 0) AS Poblacion_Ciudad, B.Name AS Ciudad
FROM country AS C
LEFT JOIN City AS B 
ON C.Code = B.countryCode
WHERE continent = 'Africa'
ORDER BY Poblacion_Ciudad DESC
LIMIT 5
)
UNION
(
SELECT C.Continent AS Continente_Asiatico, FORMAT(B.Population, 0) AS Poblacion_Ciudad, B.Name AS Ciudad
FROM country AS C
LEFT JOIN City AS B 
ON C.Code = B.countryCode
WHERE continent = 'Asia'
ORDER BY Poblacion_Ciudad DESC
LIMIT 5  
);

/*Idiomas oficiales:
• Mostrar todos los países de África y sus idiomas oficiales. Ordenar el listado
alfabéticamente por el nombre del idioma.*/
SELECT C.Name AS Paises_Africanos , L.Language, L.IsOfficial AS Lenguajes_Oficiales
FROM country AS C
LEFT JOIN countrylanguage AS L
ON C.Code = L.countryCode
WHERE IsOfficial = 'T' AND Continent = 'Africa'
ORDER BY Language;

/*Países sin lenguaje oficial:
• Encontrar los países que no tienen idioma oficial registrado.*/

SELECT C.Name AS Paises, L.Language, L.IsOfficial AS Lenguajes_NO_Oficiales
FROM country AS C
LEFT JOIN countrylanguage AS L
ON C.Code = L.countryCode
WHERE IsOfficial = 'F'
ORDER BY Language;

/*Capitales e idiomas:
• Listar todos los idiomas no oficiales hablados en Santander Colombia.*/
SELECT C.Name AS Paises, L.Language, L.IsOfficial AS Lenguajes_NO_Oficiales
FROM country AS C
LEFT JOIN countrylanguage AS L
ON C.Code = L.countryCode
WHERE IsOfficial = 'F' AND C.Code = "COL"
ORDER BY Language;

/*Ciudades habla hispanas de Asia:
• Mostrar la ciudades de Asia y su país, ordenadas por la cantidad de habitantes, que
tienen como idioma español.*/


SELECT C.Continent, C.Name, L.Language , C.Population
FROM country as C
LEFT JOIN countrylanguage as L
ON C.Code = L.CountryCode
WHERE Continent = 'Asia' 
ORDER BY  L.Language DESC;
-- AND  Language = 'Spanish'

