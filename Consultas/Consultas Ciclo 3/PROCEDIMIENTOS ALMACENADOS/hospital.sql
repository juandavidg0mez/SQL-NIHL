CREATE DATABASE  HOSPITAL;

USE HOSPITAL;

CREATE TABLE Dept (
    Dept_No INT NOT NULL,
    DNombre VARCHAR(255),
    Loc VARCHAR(255),
    PRIMARY KEY (Dept_No)
);

-- Crear tabla Emp
CREATE TABLE Emp (
    Emp_No INT NOT NULL,
    Apellido VARCHAR(255) NULL,
    Oficio VARCHAR(255) NULL,
    Dir INT NULL,
    Fecha_Alt DATE NULL,
    Salario DECIMAL(10,2) NULL,
    Comision DECIMAL(10,2) NULL,
    Dept_No INT NULL,
    PRIMARY KEY (Emp_No),
    FOREIGN KEY (Dept_No) REFERENCES Dept(Dept_No)
);

-- Crear tabla Hospital
CREATE TABLE Hospital (
    Hospital_Cod INT NOT NULL,
    Nombre VARCHAR(255) NULL,
    Direccion VARCHAR(255) NULL,
    Telefono VARCHAR(255) NULL,
    Num_Cama INT NULL,
    PRIMARY KEY (Hospital_Cod)
);

-- Crear tabla Doctor
CREATE TABLE Doctor (
    Hospital_Cod INT NOT NULL,
    Doctor_No INT NOT NULL,
    Apellido VARCHAR(255) NULL,
    Especialidad VARCHAR(255) NULL,
    PRIMARY KEY (Hospital_Cod, Doctor_No),
    FOREIGN KEY (Hospital_Cod) REFERENCES Hospital(Hospital_Cod)
);

-- Crear tabla Sala
CREATE TABLE Sala (
    Sala_Cod INT NOT NULL AUTO_INCREMENT,
    Hospital_Cod INT NOT NULL,
    Nombre VARCHAR(255) NULL,
    Num_Cama INT NULL,
    PRIMARY KEY (Sala_Cod, Hospital_Cod),
    FOREIGN KEY (Hospital_Cod) REFERENCES Hospital(Hospital_Cod)
);

-- Crear tabla Plantilla
CREATE TABLE Plantilla (
    Empleado_No INT NOT NULL,
    Sala_Cod INT NOT NULL,
    Hospital_Cod INT NOT NULL,
    Apellido VARCHAR(50) NULL,
    Funcion VARCHAR(50) NULL,
    T VARCHAR(15) NULL,
    Salario NUMERIC(9,2) NULL,
    PRIMARY KEY (Empleado_No),
    FOREIGN KEY (Sala_Cod, Hospital_Cod) REFERENCES Sala(Sala_Cod, Hospital_Cod)
);

-- Crear tabla Enfermo
CREATE TABLE Enfermo (
    Inscripcion INT NOT NULL AUTO_INCREMENT,
    Apellido VARCHAR(255) NULL,
    Direccion VARCHAR(255) NULL,
    Fecha_Nac DATE NULL,
    S CHAR(1) NULL,
    NSS INT NULL,
    PRIMARY KEY (Inscripcion)
);
-- Insertar datos en la table Dept
INSERT INTO Dept(Dept_No,DNombre,Loc) VALUES(10,'CONTABILIDAD','ELCHE');
INSERT INTO Dept(Dept_No,DNombre,Loc) VALUES(20,'INVESTIGACIÓN','MADRID');
INSERT INTO Dept(Dept_No,DNombre,Loc) VALUES(30,'VENTAS','BARCELONA');
INSERT INTO Dept(Dept_No,DNombre,Loc) VALUES(40,'PRODUCCIÓN','SALAMANCA');

INSERT INTO Emp (Emp_No, Apellido, Oficio, Dir, Fecha_Alt, Salario, Comision, Dept_No)
VALUES
(7369, 'SANCHEZ', 'EMPLEADO', 7902, '1980-12-17', 10400, 0, 20),
(7499, 'ARROYO', 'VENDEDOR', 7698, '1981-02-22', 208000, 39000, 30),
(7521, 'SALA', 'VENDEDOR', 689, '1981-02-22', 162500, 65000, 30),
(7566, 'JIMENEZ', 'DIRECTOR', 7839, '1981-04-02', 386750, 0, 20),
(7654, 'MARTIN', 'VENDEDOR', 7698, '1981-09-28', 182000, 182000, 30),
(7698, 'NEGRO', 'DIRECTOR', 7839, '1981-05-01', 370500, 0, 30),
(7782, 'CEREZO', 'DIRECTOR', 7839, '1981-06-09', 318500, 0, 10),
(7788, 'NINO', 'ANALISTA', 7566, '1987-03-30', 390000, 0, 20),
(7839, 'REY', 'PRESIDENTE', 0, '1981-11-17', 650000, 0, 10),
(7844, 'TOVAR', 'VENDEDOR', 7698, '1981-09-08', 195000, 0, 30),
(7876, 'ALONSO', 'EMPLEADO', 7788, '1987-05-03', 143000, 0, 20),
(7900, 'JIMENO', 'EMPLEADO', 7698, '1981-12-03', 123500, 0, 30),
(7902, 'FERNANDEZ', 'ANALISTA', 7566, '1981-12-03', 390000, 0, 20),
(7934, 'MUÑOZ', 'EMPLEADO', 7782, '1982-06-23', 169000, 0, 10),
(7119, 'SERRA', 'DIRECTOR', 7839, '1983-11-19', 225000, 39000, 20),
(7322, 'GARCIA', 'EMPLEADO', 7119, '1982-10-12', 129000, 0, 20);

INSERT INTO Hospital(Hospital_Cod,Nombre,Direccion,Telefono, Num_Cama) VALUES
(19,'Provincial','O Donell 50','964-4256',502),
(18,'General','Atocha s/n','595-3111',987),
(22,'La Paz','Castellana 1000','923-5411',412),
(45,'San Carlos','Ciudad Universitaria','597-1500',845);


INSERT INTO Doctor(Hospital_Cod,Doctor_No,Apellido,Especialidad) VALUES
(22,386,'Cabeza D.','Psiquiatría'),
(22,398,'Best D.','Urología'),
(19,435,'López A.','Cardiología'),
(22,453,'Galo D.','Pediatría'),
(45,522,'Adams C.','Neurología'),
(18,585,'Miller G.','Ginecología'),
(45,607,'Chuki P.','Pediatría'),
(18,982,'Cajal R.','Cardiología');

INSERT INTO Sala (Sala_Cod, Hospital_Cod, Nombre, Num_Cama) VALUES
(1, 22, 'Recuperación', 10),
(1, 45, 'Recuperación', 15),
(2, 22, 'Maternidad', 34),
(2, 45, 'Maternidad', 24),
(3, 19, 'Cuidados Intensivos', 21),
(3, 18, 'Cuidados Intensivos', 10),
(4, 18, 'Cardiología', 53),
(4, 45, 'Cardiología', 55),
(6, 19, 'Psiquiátricos', 67),
(6, 22, 'Psiquiátricos', 118);

DROP TABLE  Sala;
DROP TABLE Plantilla;
INSERT INTO Plantilla(Hospital_Cod, Sala_Cod, Empleado_No, Apellido, Funcion, T, Salario)
VALUES
(22, 6, 1009, 'Higueras D.', 'Enfermera', 'T', 200500),
(45, 4, 1280, 'Amigo R.', 'Interino', 'N', 221000),
(19, 6, 3106, 'Hernández', 'Enfermero', 'T', 275000),
(19, 6, 3754, 'Díaz B.', 'Enfermera', 'T', 226200), 
(22, 1, 6065, 'Rivera G.', 'Enfermera', 'N', 162600),
(18, 4, 6357, 'Karplus W.', 'Interino', 'T', 337900),
(22, 1, 7379, 'Carlos R.', 'Enfermera', 'T', 211900),
(22, 6, 8422, 'Bocina G.', 'Enfermero', 'M', 183800),
(45, 1, 8526, 'Frank H.', 'Enfermera', 'T', 252200),
(22, 2, 9901, 'Núñez C.', 'Interino', 'M', 221000);

--Insertar datos en la tabla Enfermo
INSERT INTO Enfermo (Inscripcion, Apellido, Direccion, Fecha_Nac, S, NSS)
VALUES
(10995, 'Laguía M.', 'Goya 20', '1956-05-16', 'M', 280862422),
(14024, 'Fernández M.', 'Recoletos 50', '1960-05-21', 'F', 284991452),
(18004, 'Serrano V.', 'Alcalá 12', '1967-06-23', 'F', 321790059),
(36658, 'Domin S.', 'Mayor 71', '1942-01-01', 'M', 160654471),
(38702, 'Neal R.', 'Orense 11', '1940-06-18', 'F', 380010217),
(39217, 'Cervantes M.', 'Perón 38', '1952-02-29', 'M', 440294390),
(59076, 'Miller B.', 'López de Hoyos 2', '1945-09-16', 'F', 311969044),
(63827, 'Ruiz P.', 'Ezquerdo 103', '1980-12-26', 'M', 100973253),
(64823, 'Fraiser A.', 'Soto 3', '1980-07-10', 'F', 285201776),
(74835, 'Benítez E.', 'Argentina', '1957-10-05', 'M', 154811767);


SELECT * FROM Sala;

SELECT FORMAT(Salario , 0)  as Salario FROM Plantilla ;
