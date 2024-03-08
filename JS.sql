use world;

select * from country;
select * from city;

select * from countrylanguage;

-- mostrar el pais con mayor poblacion

select ID, Name, Population
from city
where Population > 1000000
order by Population desc
limit 2;

select Name , Population, Continent
from country
where Continent = "South America"
order by Population desc
limit 3;

select Language, CountryCode, IsOfficial, Percentage
from countrylanguage
where CountryCode = "COL" AND IsOfficial = "F"
order by Percentage asc;

select Name, LifeExpectancy
from  country
where Continent = "Europe" and LifeExpectancy is not null
order by LifeExpectancy desc, Name
limit 5;


-- creacion de INDEX

CREATE INDEX idx_name 
ON country(name);

-- CREATE INDEX campo o nombre del index COLUMNa
-- on la tabla y el campo 


-- Indeces Compuestos

drop INDEX idx_name on country;
Use world;
CREATE UNIQUE idx_unq_name ON country(name);

SELECT lenguage -- campos que quiero abstrer
FROM countrylanguage as  L
JOIN country as p on L.CountryCode = P.Code
WHERE P.name = "Colombia";

SELECT L.language, L.Percentage,
if(L.IsOfficial = "F", "No Ofiacial", "oficial") as Tipo,
CASE 
    WHEN L.IsOfficial = "F" THEN 'No Oficial'  
    ELSE  "Oficial"
END as Tipo2
-- WHEN edad BETWEEN 18 and 65 THEN CASE WHEN 
