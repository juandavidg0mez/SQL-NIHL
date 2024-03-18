USE tienda;
SELECT * FROM fabricante;
SELECT * FROM producto;
/*
1. Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
*/
SELECT F.nombre 
FROM fabricante AS F
RIGHT JOIN producto AS P
ON F.id = P.id_fabricante
GROUP BY F.nombre
HAVING COUNT(P.id_fabricante) >= 2;

-- aca me estoy llevando todos los fabricantes que tienen un producto y asi sea NULL o no los trae
-- en el caso de RIGHT me trae todos los productos que tienen en comun un fabricante de la tabla-fabricante


/*
2. Devuelve un listado con los nombres de los fabricantes y el número de productos que
tiene cada uno con un precio superior o igual a 220 €. No es necesario mostrar el nombre
de los fabricantes que no tienen productos que cumplan la condición.
*/

SELECT F.nombre AS Nombre_Fabricante, COUNT(P.id) AS Numero_Productos
FROM fabricante AS F
JOIN producto AS P ON F.id = P.id_fabricante
WHERE P.precio >= 220
GROUP BY F.nombre;
-- cuando utilizamos las funciones de agrgascion y utilizamos el group by utilizamos la agrupacion  
-- osea vamos a grupart por ai y contamos que cuentas tiene por cada id ente caso COUNT or AVG OR MAx OR MIN la cuestion es que organizamos estos valores y los agrupamos y sacamos un represnetante de este valor

