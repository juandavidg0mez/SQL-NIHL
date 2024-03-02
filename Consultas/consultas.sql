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
order by Percentage;

select Name, LifeExpectancy
from  country
where Continent = "Europe" and LifeExpectancy is not null
order by LifeExpectancy desc, Name
limit 5;

use world;
CREATE TABLE tempPais AS 
	SELECT C.name, C.Population
	FROM world.country AS C
	WHERE C.Population <= 100000000;
    
select * from tempPais;

-- RELACIONES ENTRE TABLAS
-- Relacion de uno a muchos

create schema bibliotecaMenor;
use bibliotecaMenor;

create table Libro (
	id int primary key,
    Titulo varchar(100),
    Autor varchar(100)
);

-- Crear la tabla prestamos

create table Prestamo(
id int primary key,
id_libro int,
fechaPrestamo date,
fechaDevolucion date,
foreign key (id_libro) references libro(id)
);

-- RELAcion DE MUCHO A MUCHOS

--  Estuidiante e Inscripcion a cursos

create table estudiantes(
	id int primary key,
    nombre varchar(100)
);

create table curso (
	id int primary key,
    nombre varchar(100),
    descripcion text

);

create table inscripcion(
	id_estudiante int,
    id_curso int,
    fechaInscripcion date,
    primary key (id_estudiante, id_curso),
    foreign key(id_estudiante) references  estudiantes(id),
    foreign key(id_curso) references  curso(id)
    
);

-- crear las tablas y las relaciones

create table pais(
	id int primary key,
    nombre varchar(20),
    continente varchar(50),
    poblacion int
);

-- REVISION DE LAS ESTRUCTURAS DE UNA TABLA

-- Comando DESCRIBE o desc 

-- Comando SHOW COLUMS FROM
use mundoSQL;
show columns from tempPais;


-- comando SHOW TABLE STATUS --> info general de la tabla

show table status like "inscripcion";

-- Comando Information_Schema.colums or tables de una base de datos da info
select *
from information_schema.columns
where table_name = 'inscripcion';

-- Funciones y comando en campos MySQL
-- 1. CONCAT : concatena dos o mas codenas de texto.alter

use world;
-- el espaciado qu ehay es para que se vea mejor
select concat(name,"  ", region) as Ubicacion 

from country
limit 5;

-- 1. UPPER convierte una cadena a Mayuscula

select upper(concat(name, "  ", region ))as Ubicacion
from country
limit 5;

-- 2. LOWER: convierte una cadena a minusculas
select lower(concat(name, "  ", region)) as ubicacion
from country
limit 5;

-- 3 LENGTH devuelve la longitud de una cadena.
select (concat(name , "  ", region)) as Ubicacion,length(concat(name, "  ", region )) as Largo
from country
limit 5;

select name     , length(name) as largo, region
from country
order by largo desc
limit 3;
-- Comando : SUBSTRING estrae una parte de una cadena.

select substring(concat(name, "  ", region ) , 1 , 3) as "sigla de la ubicacion"
from country
limit 5;

-- 6 LOCATE : encuentra la posicion de una subcadena 

select substring(concat(name, "  ", region), 1 , 3 ) as "siglas de la ubicacion",
	locate('g' , substring(concat(name, "  ", region), 1 , 3 ))as  POS_G
from country
limit 5;


-- contruye un listado con el primer nombre de los paises compuestos ordene el listado por nombre de pais

select name as pais, locate(' ', name) as compuesto, substring(name , 1 , locate(' ', name)) as Primer_nomnbre
from country
where locate(' ' , name ) > 0
order by pais;

-- TRIM quita espacion al principios y al final RTRIM derecha osea el final LTRIM a la izquierda
