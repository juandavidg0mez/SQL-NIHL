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
