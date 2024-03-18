USE HOSPITAL;
SELECT * FROM Dept;
SELECT * FROM Doctor;
SELECT * FROM Emp;
SELECT * FROM Enfermo;
SELECT * FROM Hospital;
SELECT * FROM Plantilla;
SELECT * FROM Sala;


/*
1. Construya el procedimiento almacenado que saque todos los empleados que se dieron de
alta entre una determinada fecha inicial y fecha final y que pertenecen a un determinado
departamento.
*/

DELIMITER$$
CREATE PROCEDURE Dado_Alta(IN fecha_inicial DATE, IN fecha_final DATE, IN Dept_No INT)
BEGIN
    
END$$

