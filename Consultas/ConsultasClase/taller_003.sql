USE tienda;
SELECT * FROM fabricante;
SELECT * FROM producto;


-- Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.


SELECT C.nombre, LENGTH(B.nombre) AS length_of_product_name
FROM fabricante AS C
JOIN producto AS B 
ON C.id = B.id_fabricante;

/*Devuelve un listado con los nombres de los fabricantes y el número de productos que
tiene cada uno con un precio superior o igual a 220 €. No es necesario mostrar el nombre
de los fabricantes que no tienen productos que cumplan la condición.*/

--Devuelve el producto más barato que existe en la tabla producto sin hacer uso

SELECT nombre, precio
FROM producto
WHERE precio = (SELECT MIN(precio) FROM producto);