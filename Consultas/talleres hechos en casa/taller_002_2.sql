USE tienda;
SELECT * FROM fabricante;
SELECT * FROM Producto;

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

/*
8. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy
Seagate. Sin utilizar el operador IN.
*/
 

SELECT F.nombre AS Nombre_Fabricante , P.nombre AS Nombre_Producto
FROM fabricante as F 
LEFT JOIN Producto as P ON F.id = P.id_fabricante
WHERE F.nombre = 'Asus' OR F.nombre = 'Hewlett-Packard' OR F.nombre = 'Seagate';





/*
9. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy  Seagate. Utilizando el operador IN. 
*/

SELECT F.nombre AS Nombre_Fabricante , P.nombre AS Nombre_Producto
FROM fabricante as F 
RIGHT JOIN Producto as P ON F.id = P.id_fabricante
WHERE  F.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');
-- WHERE F.nombre = 'Asus' OR F.nombre = 'Hewlett-Packard' OR F.nombre = 'Seagate';

/*
10. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo  nombre termine por la vocal e. 
*/

SELECT  nombre , precio
FROM Producto
WHERE RIGHT(nombre, 1) = 'e';

/*
11. Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de  fabricante contenga el carácter w en su nombre. 
*/

SELECT F.nombre AS Nombre_Fabricante,
         P.precio AS Precio,
         P.nombre AS Nombre_producto
FROM fabricante as F 
RIGHT JOIN Producto as P ON F.id = P.id_fabricante
WHERE F.nombre LIKE '%w%';

/*
12. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los  productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar  por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente) 
*/


    SELECT  P.nombre AS Nombre_producto,
        P.precio AS Precio,
        F.nombre AS Nombre_Fabricante       
FROM fabricante as F 
RIGHT JOIN Producto as P 
ON F.id = P.id_fabricante
WHERE P.precio >= 180
ORDER BY P.precio DESC , F.nombre ASC;

/*
13. Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos  fabricantes que tienen productos asociados en la base de datos. 
*/

SELECT DISTINCT F.id , F.nombre, P.nombre AS Nombre_Producto
FROM fabricante as F 
INNER JOIN Producto as P 
ON F.id = P.id_fabricante;


/*
14. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los  productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes  que no tienen productos asociados. 
*/


SELECT DISTINCT F.nombre, P.nombre AS Nombre_Producto
FROM fabricante as F 
LEFT JOIN Producto as P 
ON F.id = P.id_fabricante;

/*
15. Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún  producto asociado. 
*/

SELECT DISTINCT F.nombre, P.nombre AS Nombre_Producto
FROM fabricante as F 
LEFT JOIN Producto as P 
ON F.id = P.id_fabricante
WHERE P.nombre is NULL;

/*
17. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
*/

SELECT DISTINCT F.nombre, P.nombre AS Nombre_Producto
FROM Fabricante AS F, Producto AS P
WHERE F.id = P.id_fabricante and  F.nombre = 'Lenovo';

/*
Devuelve todos los datos de los productos que tienen el mismo precio que el producto más  caro del fabricante Lenovo. (Sin utilizar INNER JOIN). 
*/

SELECT *
FROM Producto
WHERE precio = (SELECT MAX(precio) 
                FROM Producto 
                WHERE id_fabricante = (SELECT id 
                                        FROM Fabricante 
                                        WHERE nombre = 'Lenovo'));

/*
. Lista el nombre del producto más caro del fabricante Lenovo. 
*/

SELECT F.nombre, P.nombre AS Nombre_Producto, MAX(P.precio) AS Precio_Mas_Alto
FROM fabricante AS F 
LEFT JOIN Producto AS P ON F.id = P.id_fabricante
WHERE F.nombre = 'Lenovo'
GROUP BY F.nombre, P.nombre
LIMIT 1;

/*
. Lista el nombre del producto más barato del fabricante Hewlett-Packard. 
*/

SELECT F.nombre, P.nombre AS Nombre_Producto, MIN(P.precio) AS Precio_Mas_Alto
FROM fabricante AS F 
LEFT JOIN Producto AS P ON F.id = P.id_fabricante
WHERE F.nombre = 'Hewlett-Packard'
GROUP BY F.nombre, P.nombre
LIMIT 1;

/*
Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio  de todos sus productos.
*/
SELECT DISTINCT F.nombre, P.nombre AS Nombre_Producto
FROM Fabricante AS F, Producto AS P
WHERE F.id = P.id_fabricante and  F.nombre = 'Asus';

SELECT P.nombre AS Nombre_Producto, P.precio AS Precio
FROM producto AS P
JOIN fabricante AS F ON F.id = P.id_fabricante
WHERE F.nombre = 'Asus'
AND P.precio > (
    SELECT AVG(precio)
    FROM producto
    WHERE id_fabricante = F.id
);
