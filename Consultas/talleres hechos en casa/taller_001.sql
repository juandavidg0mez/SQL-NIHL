USE world;
SELECT * FROM  city;
SELECT * FROM country;
SELECT *  FROM countrylanguage;




--  CONSULTAS TALLER 001
-- Cual es el idioma con el nombre más largo hablado en el mundo. También indique
-- que países hablan ese idioma. El listado debe estar ordenado alfabéticamente por
-- nombre de país.


SELECT  C.Name AS Pais , P.Language, CHAR_LENGTH(P.Language ) as Cantidad
FROM countrylanguage as P
JOIN country as C
ON C.Code = P.CountryCode
ORDER BY  Cantidad DESC;

/*  Muestre un listado del año de independencia de cada país. Si aún no se ha
independizado muestre el vano “N/A” */

SELECT Name AS Pais , IndepYear AS  Año_independencia
FROM country;

/* Muestre un listado con los países “recién independizado” y “antiguamente
independizados”. Es recién independizado si su fecha de independizado es
posterior a 1899. */

-- CUANDO UTILICEMOS CASE COLOMAOS COMAS DEPUES DE LA SENTENCIA SELECT

SELECT Name AS Pais , IndepYear,
CASE 
    WHEN  IndepYear >  1899 THEN  'Recién independizado'
    WHEN  IndepYear <  1899 THEN  'antiguamente
independizados' 
    ELSE  'No Especificado'
END AS EstadoIndependecia
FROM country;

/* Cual es el promedio de nivel d vida de los países africanos. */
-- LIKE espara que el campo de Contiennte Si coincide algo de Africa lo Tengo en consulta
SELECT Name as PaisAfricano , LifeExpectancy
FROM Country
WHERE Continent LIKE '%Africa';

/*Cuál es el país con menor nivel de vida.*/
SELECT Name as Pais , LifeExpectancy as Nivel_Vida
FROM Country
WHERE LifeExpectancy IS NOT NULL
ORDER BY Nivel_Vida
LIMIT 1;

/* Cuál es el país con mayor nivel de vida.*/

SELECT Name as Pais , LifeExpectancy as Nivel_Vida
FROM Country
WHERE LifeExpectancy IS NOT NULL
ORDER BY Nivel_Vida DESC
LIMIT 1;
/*Muestre un listado de los países de América y cuanta es la capacidad de repartir su
riqueza entre su densidad de población. GNP = PIB. El listado debe estar ordenado
descendentemente por capacidad de repartir riqueza, luego por nombre
ascendentemente. La capacidad de repartir riqueza debe mostrarse en separación
de miles y con dos decimales.*/


SELECT Name AS Pau,  FORMAT(GNP/(Population / SurfaceArea), 2) AS Riqueza_Poblacion , Continent
FROM Country
WHERE Continent LIKE '%America'
ORDER BY Riqueza_Poblacion DESC;

/*Muestre los segundos nombres de los países de Europa. El listado debe estar
ordenado alfabéticamente por este segundo nombre*/

SELECT * FROM country;
SELECT SUBSTRING_INDEX(Name, ' ', -1) AS Pais
FROM country
WHERE Continent = 'Europe'
ORDER BY Pais;

-- SELECT 
--     SUBSTRING_INDEX(SUBSTRING_INDEX(Name, ' ', -2), ' ', 1) AS Segundo_Nombre,
--     Name AS Pais
-- FROM 
--     Country
-- WHERE 
--     Continent = 'Europe'
-- ORDER BY 
--     Segundo_Nombre ASC;

/*Muestre un listado de los países America y la cantidad de veces que aparece la
letra “A” en ellos. El listado debe estar ordenado por la cantidad de veces que
aparece la letra A en el nombre del país.*/

/*Restamos la longitud total del nombre del país menos la longitud del nombre sin la letra "A" para obtener la cantidad de veces que aparece la letra "A".*/

SELECT 
    Name AS Pais,
    LENGTH(Name) - LENGTH(REPLACE(Name, 'a', '')) AS Aparece_A
FROM 
    Country
WHERE 
    Continent LIKE '%America%'
ORDER BY 
    Aparece_A DESC;
/*Muestre un listado de todos los países con un solo nombre que terminan en “bia”.
Ordene este listado alfabéticamente por el nombre del pais.*/

SELECT Name AS Pais, REPLACE(Name, 'bia', '') AS Nombres 
FROM Country;

SELECT 
    Name AS Pais
FROM 
    Country
WHERE 
    Name LIKE '%bia' AND  -- nombres que tenirman en
    Name NOT LIKE '% %' -- Espacios en el nombre lo que indica que el nombre tiene una palabra
ORDER BY 
    Pais ASC;


