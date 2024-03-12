

CREATE TABLE estudiante(
    id int PRIMARY KEY,
    nombre VARCHAR(100)

    
);
-- esto es una relacionde muchos a muchos a muchos

CREATE table telefono(
    id_estidiante int,
    telefono VARCHAR(200),
);


-- ==================NORMALIZACION=====================
CREATE Table Curso(
    CursoID INT PRIMARY KEY,
    NombreCurso VARCHAR(100)
);

CREATE TABLE CursoEstudiante(
    CursoID INT,
    EstudianteID INT,
    Foreign Key (CursoID) REFERENCES CursoEstudiante(CursoID),
    Foreign Key (EstudianteID) REFERENCES Estudiante(EstudianteID)

);

CREATE TABLE Estudiante(
    EstudianteID INT PRIMARY KEY,
    NombreEstudiante VARCHAR(50),
    ApellidoEstudiante VARCHAR(50)
);


-- ==================NORMALIZACION=====================

CREATE TABLE Profesor(
    ProfesorID INT PRIMARY KEY,
    DepartamentoID INT,
    Nombres VARCHAR(50),
    Apellidos VARCHAR(50),
    Foreign Key (DepartamentoID) REFERENCES Departamento(DepartamentoID)
)

CREATE TABLE Departamento(
    DepartamentoID INT PRIMARY,
    NombreDepartamento VARCHAR(100)
)

-- ==================NORMALIZACION=====================

CREATE TABLE Docente(
    DocenteidINT PRIMARY KEY,
    Nombres VARCHAR(50),
    Apellidos VARCHAR(50)
);

CREATE TABLE Asignacion(
    DocenteID INT,
    CursoID INT,
    Foreign Key (DocenteID) REFERENCES Docente(Docenteid),
    Foreign Key (Curso) REFERENCES Curso(CursoID)
    
);

CREATE TABLE horario(
    Horaid INT PRIMARY KEY,
    HoraCurso DATETIME

);

CREATE TABLE curso_Horario(
    Horaid INT,
    CursoID INT,
    Foreign Key (Horaid) REFERENCES horario(Horaid),
    Foreign Key (CursoID) REFERENCES Curso(CursoID)
)

CREATE TABLE Curso(
    CursoID INT PRIMARY KEY,
    nombreCurso VARCHAR (100),
);

-- ==================NORMALIZACION=====================


CREATE TABLE Paciente_ID (
    Paciente_ID INT PRIMARY KEY,
    Nombres_Paciente VARCHAR(100),
    Apellidos_Paciente VARCHAR(100),
    FechaNacimiento DATE
);



CREATE TABLE Medico(
    Medico_ID INT PRIMARY KEY,
    Nombres_Medico VARCHAR(100),
    Apellidos_Medico VARCHAR(100),
    Especialidad VARCHAR(100)
);

CREATE TABLE Tratamiento(
    tratamiento_ID INT PRIMARY KEY,
    DescripcionTra VARCHAR(255),
    cita_ID_Tratamiento INT
    Foreign Key (cita_ID_Tratamiento) REFERENCES Citas(cita_ID)
);


CREATE TABLE Drug_For_Tratamiento(
    tratamiento_ID INT,
    Drugs_id INT,
    PRIMARY KEY(tratamiento_ID,Drugs_id)
    Foreign Key (tratamiento_ID) REFERENCES Tratamiento(tratamiento_ID),
    Foreign Key (Drugs_id) REFERENCES Drugs(Drugs_id)
);

CREATE TABLE Drugs(
    Drugs_id INT,
    descripcion_Drug VARCHAR(100),
    Dosis_Drugs VARCHAR(50)
);

CREATE TABLE Citas(
    cita_ID INT PRIMARY KEY,
    Paciente_ID_Cita INT,
    Medico_ID_Cita INT,
    FechaCita DATETIME,
    Descripcion_Cita VARCHAR(255),
    Tratamiento_citas VARCHAR(100),
    Foreign Key (Paciente_ID_Cita) REFERENCES Paciente_ID(Paciente_ID),
    Foreign Key (Medico_ID_Cita) REFERENCES Medico(Medico_ID)
    
);


-- paciente fueron trataos enel 20022 indique id del paciente 
--el nombredel pacioete fecha consilta
--nombre medico y el tratamiento recibido

SELECT B.Paciente_id, B.Nombre_Paciente, B.FechaCita, B.NombreMedico, T.Tratamiento_ivar
FROM Citas as B
LEFT JOIN Tratamiento as T
ON B.cita_ID =  T.tratamiento_ID
WHERE B.FechaCita = 2022;