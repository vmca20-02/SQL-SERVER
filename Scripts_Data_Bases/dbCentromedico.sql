--#1.A PARTIR DEL MODELADO DE LA BASE DE DATOS(dbCentroMedico) CREAR LOS SCRIPTS NECESARIOS
--    PARA RECREAR EL MISMO MODELADO SIN NECESIDAD DE USAR EL ASISTENTE

     --#1.1 CREAR EL DIAGRAMA SOLO USANDO SCRIPTS
     --#1.2 CREAR EL DIAGRAMA USANDO EL ASISTENTE Y DESPUES GENERANDO LOS SCRIPTS

CREATE DATABASE dbcentromedico;
GO
USE dbcentromedico;
GO

-----------------CREATING TABLES-----------------

CREATE TABLE Medico(
idMedico INT NOT NULL,
nombre   VARCHAR(50),
apellido VARCHAR(50))

GO

CREATE TABLE Historia(
idHistoria INT NOT NULL,
fechaHistoria DATETIME,
observacion VARCHAR(1000),
fechaAlta DATETIME)

GO

CREATE TABLE HistoriaPaciente(
idHistoria INT NOT NULL,
idMedico INT NOT NULL,
idPaciente INT NOT NULL) 

GO

CREATE TABLE Especialidad(
idEspecialidad INT NOT NULL,
nombre VARCHAR(50))

GO

CREATE TABLE MedicoEspecialidad(
idMedico INT NOT NULL,
idEspecialidad INT NOT NULL,
descripcion VARCHAR(100))

GO

CREATE TABLE Paciente(
idPaciente INT NOT NULL,
nombre VARCHAR(50),
apellido VARCHAR(50),
fNacimiento DATE,
domicilio VARCHAR(200),
idPais INT,
telefono VARCHAR(30),
email VARCHAR(30),
observacion VARCHAR(1000),
fechaAlta DATETIME)

GO

CREATE TABLE TurnoPaciente(
idTurno INT NOT NULL,
idPaciente INT NOT NULL,
idMedico INT NOT NULL)

GO

CREATE TABLE Turno(
idTurno INT NOT NULL,
fechaTurno DATETIME,
fechaAlta DATETIME,
estado INT)

GO

CREATE TABLE Pais(
idPais INT NOT NULL,
nombre VARCHAR(50))

----------------------------------------------

-----------------ADD PRIMARY KEYS AND FOREIGN KEYS-----------------

ALTER TABLE Medico ADD CONSTRAINT PK_Medico PRIMARY KEY(idMedico);

ALTER TABLE Historia ADD CONSTRAINT PK_Historia PRIMARY KEY(idHistoria);

ALTER TABLE HistoriaPaciente ADD CONSTRAINT PK_HistoriaPaciente PRIMARY KEY(idHistoria,idPaciente,idMedico);

ALTER TABLE Especialidad ADD CONSTRAINT PK_idEspecialidad PRIMARY KEY(idEspecialidad);

ALTER TABLE MedicoEspecialidad ADD CONSTRAINT PK_MedicoEspecialidad PRIMARY KEY(idMedico,idEspecialidad);

ALTER TABLE Paciente ADD CONSTRAINT PK_Paciente PRIMARY KEY(idPaciente);

ALTER TABLE TurnoPaciente ADD CONSTRAINT PK_TurnoPaciente PRIMARY KEY(idTurno,idPaciente,idMedico);

ALTER TABLE Turno ADD CONSTRAINT PK_Turno PRIMARY KEY(idTurno);

ALTER TABLE Pais ADD CONSTRAINT PK_Pais PRIMARY KEY(idPais);


ALTER TABLE HistoriaPaciente ADD CONSTRAINT FK_HistoriaPaciente_Historia FOREIGN KEY(idHistoria) REFERENCES Historia(idHistoria);

ALTER TABLE HistoriaPaciente ADD CONSTRAINT FK_HistoriaPaciente_Medico FOREIGN KEY(idMedico) REFERENCES Medico(idMedico);

ALTER TABLE MedicoEspecialidad ADD CONSTRAINT FK_MedicoEspecialidad_Medico FOREIGN KEY(idMedico) REFERENCES Medico(idMedico);

ALTER TABLE MedicoEspecialidad ADD CONSTRAINT FK_MedicoEspecialidad_Especialidad FOREIGN KEY(idEspecialidad) REFERENCES Especialidad(idEspecialidad)

ALTER TABLE HistoriaPaciente ADD CONSTRAINT FK_HistoriaPaciente_Paciente FOREIGN KEY(idPaciente) REFERENCES Paciente(idPaciente);

ALTER TABLE TurnoPaciente ADD CONSTRAINT FK_TurnoPaciente_Turno FOREIGN KEY(idTurno) REFERENCES Turno(idTurno);

ALTER TABLE TurnoPaciente ADD CONSTRAINT FK_TurnoPaciente_Paciente FOREIGN KEY(idPaciente) REFERENCES Paciente(idPaciente);

ALTER TABLE TurnoPaciente ADD CONSTRAINT Fk_TurnoPaciente_Medico FOREIGN KEY(idMedico) REFERENCES Medico(idMedico);

ALTER TABLE Paciente ADD CONSTRAINT FK_Paciente_Pais FOREIGN KEY(idPais) REFERENCES Pais(idPais);

--------------------------------------------------------------------



