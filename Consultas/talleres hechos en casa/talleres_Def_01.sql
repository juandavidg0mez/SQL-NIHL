USE tienda;

SELECT * FROM fabricante;
SELECT * FROM producto;

/*
1. Calcula el número total de productos que hay en la tabla productos.
*/


SELECT COUNT(nombre) AS Numero_Neto_Producs
FROM producto;

/*
2. Calcula el número total de fabricantes que hay en la tabla fabricante.
*/

SELECT COUNT(nombre) AS Numero_Fabricantes
FROM fabricante;

/*
3. Calcula el número de valores distintos de identificador de fabricante aparecen en la
tabla productos.
*/

SELECT  F.nombre, P.id_fabricante, COUNT(P.id_fabricante) AS Numero_Neto_Fabricantes
FROM producto  AS P
JOIN fabricante AS F 
ON F.id = P.id_fabricante
GROUP BY id_fabricante; 

/*
4. Calcula la media del precio de todos los productos.
*/

SELECT AVG(precio) AS Media_Products_Price
FROM producto;

/*
5. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que
tiene el fabricante Crucial.
*/

SELECT  F.nombre, 
        MIN(P.precio) AS  Precio_Mínimo,
        MAX(P.precio) AS Precio_Máximo, 
        AVG(P.precio) AS Precio_Medio,
        COUNT(P.id_fabricante) AS Cantidad_Products
FROM producto  AS P
JOIN fabricante AS F 
ON F.id = P.id_fabricante
WHERE F.nombre = 'Crucial';

/*
6. Muestra el número total de productos que tiene cada uno de los fabricantes. El listado
también debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará
dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene.
Ordene el resultado descendentemente por el número de productos.
*/

SELECT  F.nombre, COUNT(P.nombre) AS Numero_Neto_Productos
FROM producto  AS P
LEFT JOIN fabricante AS F 
ON F.id = P.id_fabricante
GROUP BY F.nombre
ORDER BY Numero_Neto_Productos DESC;        

/*
7. Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los
fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se
solicitan.
*/

SELECT  F.id,
        F.nombre, 
        MIN(P.precio) AS  Precio_Mínimo,
        MAX(P.precio) AS Precio_Máximo, 
        AVG(P.precio) AS Precio_Medio,
        COUNT(P.id_fabricante) AS Cantidad_Products
FROM producto  AS P
JOIN fabricante AS F 
ON F.id = P.id_fabricante
GROUP BY P.id_fabricante
ORDER BY Cantidad_Products DESC;

/*
8. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de
los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el
nombre del fabricante, con el identificador del fabricante es suficiente.
*/

SELECT  F.id,
        MIN(P.precio) AS  Precio_Mínimo,
        MAX(P.precio) AS Precio_Máximo, 
        AVG(P.precio) AS Precio_Medio,
        COUNT(P.id_fabricante) AS Cantidad_Products
FROM producto  AS P
JOIN fabricante AS F 
ON F.id = P.id_fabricante
GROUP BY P.id_fabricante
HAVING AVG(P.precio)  >= 200;

/*
9. Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio
medio y el número total de productos de los fabricantes que tienen un precio medio superior
a 200€. Es necesario mostrar el nombre del fabricante.
*/

SELECT  F.id,
        F.nombre, 
        MIN(P.precio) AS  Precio_Mínimo,
        MAX(P.precio) AS Precio_Máximo, 
        AVG(P.precio) AS Precio_Medio,
        COUNT(P.id_fabricante) AS Cantidad_Products
FROM producto  AS P
LEFT JOIN fabricante AS F 
ON F.id = P.id_fabricante
GROUP BY P.id_fabricante
HAVING AVG(P.precio)  > 200;                
        
/*
10. Calcula el número de productos que tienen un precio mayor o igual a 180€.
*/

SELECT  nombre , precio AS Cantidad_Precio_200
FROM producto
WHERE precio >= 180;


/*
11. Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a
180€.
*/

SELECT  F.nombre AS Fabricante, COUNT(P.id_fabricante) AS Numero_Neto_Productos
FROM fabricante  AS F
RIGHT JOIN producto AS P
ON F.id = P.id_fabricante
WHERE P.precio >= 180 
GROUP BY F.nombre;

-- EN LO POSIBLE AGRUPAR POR LLAVES POR PRIMARIAS
