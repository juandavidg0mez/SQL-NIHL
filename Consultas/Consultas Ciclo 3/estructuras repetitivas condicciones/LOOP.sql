Use tienda;
DROP Procedure insertarFabricante;

CREATE Procedure insertarFabricante(in idfab int, in nomfab VARCHAR(100))
begin
    DECLARE EXIT HANDLER for 1062 SELECT CONCAT('Error, el fabricante existe', nomfab ) as Error;
    INSERT INTO fabricante VALUES(idfab, nomfab);
END;

USE tienda;
CALL insertarFabricante(10, 'motorola');
/*
transacciones solo las tiene las bses SQL, se hace todas o no se hacen
hace una cntidad de consultas o incerciones a la tabla y las ejecuta y el va hacer todas estas consultas y una de llas no se pudo hacer por x y razon ROLLBACK osea desase lo antes hecho por seguridad ,se hace todo o no se hace nada

*/



