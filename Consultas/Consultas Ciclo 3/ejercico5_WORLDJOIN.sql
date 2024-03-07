use world;
select * from country;


select * from city; 




--  Listar nombres de países y sus respectivas ciudades:
--  Mostrar todas las ciudades de Colombia.

select  B.Name
from country as C
LEFT JOIN city as B 
ON C.Code = B.countryCode
where C.Name = 'Colombia';


-- continentes y sus poblaciones
-- Mostrar la 5 ciudades más pobladas de América, Europa, Asia y África. Ordenar el
-- informe por Continente, luego descendentemente por ciudades

SELECT C.continent,  B.Name , B.Population
FROM country as C
LEFT JOIN city as B
ON C.Code = B.countryCode
ORDER BY B.Population desc
limit 5;

-- Idiomas oficiales:
-- Mostrar todos los países de África y sus idiomas oficiales. Ordenar el listado
-- alfabéticamente por el nombre del idioma.






-- Subconsulta

select Name , Population
FROM country
where Population > (select AVG(Population) FROM country);

-- se puede utlizar en la subconsulta en elfrom
select AVG(Population)
FROM(select Population from city where countryCode = "VEN") as CiudadesPais1;

-- Select locampos Calculos de una tabla
-- PSts Ptopotvionst fsyod sdivionslrd rn sd volumnsd fr los resultados

select name , (SELECT COUNT(*)
                from city C
                WHERE C.countrycode = P.code) As NumeroCiudades
FROM country P
where P.continent = "North America"  or P.continent = "South America"
order BY NumeroCiudades desc;

-- SubConsulta Correlacionada
-- Se refere a elementos de la consulta exterior para compretar su operecion y se ejecuta una vez por cada fila procesada por la consulta Exterior

select C1.name, C1.Population
FROM city as C1
INNER JOIN country as P
ON C1.countrycode = P.Code
Where (P.continent = "North America" or P.continent = "South America") and
c1.Population > (SELECT 
AVG(C2.Population)
FROM city as C2
where C2.countryCode = C1.country);