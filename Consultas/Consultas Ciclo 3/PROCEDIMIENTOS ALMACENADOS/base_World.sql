USE world;


CREATE PROCEDURE listarCiudadesdePais(in nombrePais VARCHAR(100))
BEGIN
    SELECT city.name
    FROM country
    INNER JOIN city on city.countryCode = country.Code
    WHERE UPPER(country.name) = UPPER(nombrePais);
END;

SELECT * FROM city;
SELECT * FROM country;
SELECT * FROM countrylanguage;
CALL listarCiudadesdePais('Venezuela');

-- crear un procedimiento almacenado para 
--contar el numero de ciudades en un pais especifico

CREATE PROCEDURE countCitys(in nombrePais VARCHAR(100), OUT numero_city INT )
BEGIN
    SELECT COUNT(id) INTO numero_city FROM city WHERE id = nombrePais;
END;

SET @ciudades_count = 0;
CALL countCitys('Colombia', @ciudades_count);
SELECT @ciudades_count AS totalciudad;

/*
Hacer un procedimiento almacenado que calcule la poblacion total de ciertos paises que hablen español como idioma oficial.
Cada uno de estos Paiese se pasan por parametro
*/

CREATE PROCEDURE countIdiomas(IN nombrePais VARCHAR(100), OUT numero_Hablantes INT)
BEGIN
    SELECT COUNT(L.Language) INTO numero_Hablantes
    FROM country AS C
    LEFT JOIN countrylanguage AS L ON C.Code = L.CountryCode 
    WHERE C.Name = nombrePais AND L.IsOfficial = 'T';
END;

DROP PROCEDURE countIdiomas;

SET @idiomas_count = 0;
CALL countIdiomas('Colombia', @idiomas_count);
SELECT @idiomas_count AS TotalHablantes;