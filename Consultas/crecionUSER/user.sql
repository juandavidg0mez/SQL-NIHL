-- CREAR USUARIO
CREATE user 'cacas'@localhost; IDENTIFIED by 'cacas2024';
-- LISTAR USUARIO
select user , host
from mysql.user;



GRANT SELECT, INSERT, UPDATE on prueba.* to 'cacas'@localhost;
-- SELECCIONAS PERMISOS A {X-USUARIO} 
GRANT SELECT on prueba.* to 'cacas'@172.162.1.128;
-- mostrar permisos
SHOW GRANTS for 'cacas'@localhost;
-- eliminar usuarios
DROP USER 'cacas'@localhost;
-- limitar accesos en ciertas tablas
GRANT INSERT on prueba.empleado TO 'cacas'@localhost;

-- limitar cunsulta
GRANT USAGE ON prueba.* to 'cacas'@localhosT ;
ALTER USER 'cacas'@localhosT  WITH MAX_CONNECTIONS_PER_HOUR 100;
-- AUMENTAR LA SEGURIDAD DE USUARIOS
-- RENOVAR LA CONTRASEÑAS CADA MES 

--USUARIOS ANONIMOS 
select user , host
from mysql.user
WHERE USER = '';
-- mostrar bases de datos
SHOW DATABASES;
SHOW TABLES;
-- =======================================================

CREATE user 'cacas'@localhost; IDENTIFIED by 'cacas2024';
-- editar contraseñas

ALTER USER  'cacas'@localhost IDENTIFIED by 'monda2024-03';
REVOKE all PRIVILEGES ON *.* FROM  'cacas'@localhost;

GRANT SELECT ON prueba.* to'cacas'@localhost;


-- PREPARE Y EXECUTE
use world;

PREPARE stmt FROM 'select * from city where countrycode = ?';
set @pais = 'COL';
EXECUTE  stmt USING @pais;

