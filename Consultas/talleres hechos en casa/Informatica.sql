USE tienda;
/* Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los
productos de la base de datosa. */
SELECT * FROM fabricante;
SELECT * FROM producto;

/* Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los
productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden
alfabético. */

select  C.Nombre as Nombre_Fabricante , B.nombre AS Nombre_Producto, B.precio 
from fabricante as C
JOIN producto as B 
ON C.id = B.id_fabricante
ORDER BY Nombre_Fabricante;


/* Devuelve una lista con el identificador del producto, nombre del producto, identificador del
fabricante y nombre del fabricante, de todos los productos de la base de datos.*/
select B.id as Identificador_producto, B.nombre AS Nombre_Producto, C.id as identificador_Fabricante,  C.Nombre as Nombre_Fabricante
from producto as B 
JOIN fabricante as C 
ON C.id = B.id_fabricante;
 
 /* Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más
barato.*/
select  C.Nombre as Nombre_Fabricante , B.nombre AS Nombre_Producto, B.precio 
from fabricante as C
JOIN producto as B 
ORDER BY B.precio
LIMIT 1;

/*Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más
caro.*/

select  C.Nombre as Nombre_Fabricante , B.nombre AS Nombre_Producto, B.precio 
from fabricante as C
JOIN producto as B 
ON C.id = B.id_fabricante
ORDER BY B.precio DESC
LIMIT 1;


/*Devuelve una lista de todos los productos del fabricante Lenovo.*/

select  C.Nombre as Nombre_Fabricante , B.nombre AS Nombre_Producto
from fabricante as C
JOIN producto as B
ON C.id = B.id_fabricante
WHERE C.nombre = 'Lenovo';

/* Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor
que 200€.*/

select  C.Nombre as Nombre_Fabricante , B.nombre AS Nombre_Producto, B.precio
from fabricante as C
JOIN producto as B
ON C.id = B.id_fabricante
WHERE C.nombre = 'Crucial' AND B.precio > 200;
