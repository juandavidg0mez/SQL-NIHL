CREATE database prueba1;
use prueba1;

create table vehiculo(
    vhc_id INT primary key,
    Marca varchar(50) not null,
    Modelo varchar(50) not null,
    Matricula varchar(10) not null,
    Aniofabricacion int not null
);

create Table Empleado(
    e_id int primary key,
    Apellidos varchar(50) not null,
    Nombre varchar(50) not null,
    vhc_id int,
    foreign key (vhc_id) references vehiculo(vhc_id)
);

-- insercion de datos en la tabla vehiculo

INSERT INTO vehiculo(vhc_id,marca,modelo,matricula,  Aniofabricacion) VALUES
(1,"VW",'Caddy','C 0000 YZ',2016),
(2,'Opel','Astra','C 0001 YZ',2010),
(3,'BMW','X6','C 0002 YZ', 2017),
(4,'Porsche','Boxster','C 0003 YZ',2018);

-- INSERCION DE DATOS EN LA TABLA EMPLEADO 
INSERT INTO Empleado(e_id,apellidos,nombre,vhc_id)VALUES
(1,'García Hurtado','Macarena',3),
(2,'Ocaña Martínez','Francisco',1),
(3,'Gutiérrez Doblado','Elena',1),
(4,'Hernández Soria','Manuela',2),
(5,'Oliva Cansino','Andrea',NULL);




-- EJEMPLO LEFT JOIN

-- MUESTRE TODOS LOS EMPLEADOS CON SUS VEHICULOS.

USE prueba;
SELECT * FROM Empleado
LEFT JOIN vehiculo ON Empleado.vhc_id = vehiculo.vhc_id;

-- MUESTRE TODOS LOS EMPLEADOS QUE TIENEN UN VEHICULO ASIGNADO Y LA INFORMACIÓN DEL VEHICULO

SELECT * FROM Empleado
LEFT JOIN vehiculo V ON Empleado.vhc_id = V.vhc_id
WHERE V.vhc_id IS NOT NULL;

-- EJEMPLOS RIGHT JOIN
-- MUESTRE TODOS LOS EMPLEADOS CON LOS VEHICULOS QUE TENGAN ASIGNADOS.
-- SI HAY ALGUN VEHICULO QUE NO HAYA SIDO ASIGNADO TAMBIEN MOSTRARLPO

SELECT * 
FROM Empleado E
RIGHT JOIN vehiculo V ON E.vhc_id = V.vhc_id;

-- FULL JOIN
-- COMBINACION ENTRE LEFT Y RIGHT JOIN

-- CUAL ES EL CONJUNTO COMPLETO DE EMPLEADOS Y VEHICULOS, INCLUYENDO AQUELLOS EMPLEADOS SIN VEHICULO ASIGNADO
-- Y AQUELLOS VEHICULOS  SIN UN EMPLEADO ASOCIADO

-- SIMULACION DE FULL JOIN CON LEFT JOIN Y RIGHT JOIN COMBINADOS CON UNION

SELECT E.*, V.*
FROM empleado E
LEFT JOIN vehiculo V ON E.vch_id = V.vch_id

UNION