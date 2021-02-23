use master;
go
create database dbMatricula;
go
use dbMatricula;

CREATE TABLE Testudiante
(Carnet 	varchar(8) Not Null,
 Nombre 	varchar(15),
 Carrera 	varchar(15),
 Primary Key	(Carnet));

CREATE TABLE Tprofesor
(Cedula 	varchar(10)	Not Null,
 Nombre 	varchar(15),
 Telefono	varchar(8),
 Primary Key	(Cedula));

CREATE TABLE Tmateria
(CodMateria	varchar(5)	Not Null,
 Nombre 	varchar(15),
 Creditos 	int,
 Primary Key 	(CodMateria));

CREATE TABLE Tgrupo
(CodMateria	varchar(5)	Not Null,
 Grupo  	int 	Not Null,
 CedulaProf  		varchar(10),
 Primary Key 	(CodMateria,Grupo),
 Foreign Key 	(CodMateria) references Tmateria (CodMateria),
 Foreign Key 	(CedulaProf) references Tprofesor (Cedula));

CREATE TABLE Tmatricula
(Carnet 	varchar(8    )Not Null,
 CodMateria	varchar(5)	Not Null,
 Grupo  	int 	Not Null,
 Nota  		int,
 Primary Key 	(Carnet,CodMateria,Grupo),
 Foreign Key 	(Carnet) references Testudiante (Carnet),
 Foreign Key 	(CodMateria,grupo) references Tgrupo(CodMateria,grupo));
 

/* Inserción de datos en la tabla Tprofesor */

insert into Tprofesor (Cedula,Nombre,Telefono)values ('1111','Chacon','441-0926');
insert into Tprofesor (Cedula,Nombre,Telefono)values ('2222','Arce','442-6578');
insert into Tprofesor (Cedula,Nombre,Telefono)values ('3333','Alvarez','246-7865');
insert into Tprofesor (Cedula,Nombre,Telefono)values ('4444','Méndez','872-1567');

/* Inserción de datos en la tabla Testudiante */

insert into Testudiante (Carnet,Nombre,Carrera)values ('500000','Jiménez','Física');
insert into Testudiante (Carnet,Nombre,Carrera)values ('600000','Rojas','Química');
insert into Testudiante (Carnet,Nombre,Carrera)values ('700000','Mendez','Historia');
insert into Testudiante (Carnet,Nombre,Carrera)values ('800000','Castro','Matemáticas');
insert into Testudiante (Carnet,Nombre,Carrera)values ('900000','Murillo','Química');


/* Inserción de datos en la tabla Tmateria */

insert into Tmateria (CodMateria,Nombre,Creditos)values ('A20','Ciencias',4);
insert into Tmateria (CodMateria,Nombre,Creditos)values ('A21','Biologia',3);
insert into Tmateria (CodMateria,Nombre,Creditos)values ('B20','Matematica',5);
insert into Tmateria (CodMateria,Nombre,Creditos)values ('C20','Español',4);
insert into Tmateria (CodMateria,Nombre,Creditos)values ('D20','Ingles',2);

/* Inserción de datos en la tabla Tgrupo */

insert into Tgrupo(CodMateria,Grupo,CedulaProf)values ('A20',01,'2222');
insert into Tgrupo(CodMateria,Grupo,CedulaProf)values ('A20',02,'1111');
insert into Tgrupo(CodMateria,Grupo,CedulaProf)values ('A21',01,'3333');
insert into Tgrupo(CodMateria,Grupo,CedulaProf)values ('B20',01,'1111');
insert into Tgrupo(CodMateria,Grupo,CedulaProf)values ('C20',01,'2222');
insert into Tgrupo(CodMateria,Grupo,CedulaProf)values ('C20',02,'2222');
insert into Tgrupo(CodMateria,Grupo,CedulaProf)values ('D20',01,'3333');


/* Inserción de datos en la tabla Tmatricula */

insert into Tmatricula (Carnet,CodMateria,Grupo,Nota) values ('500000', 'A20',02,70);
insert into Tmatricula (Carnet,CodMateria,Grupo,Nota) values ('500000', 'C20',02,85);
insert into Tmatricula (Carnet,CodMateria,Grupo,Nota) values ('500000', 'D20',01,95);

insert into Tmatricula (Carnet,CodMateria,Grupo,Nota) values ('600000','A20',01,100);
insert into Tmatricula (Carnet,CodMateria,Grupo,Nota) values ('600000','A21',01,95);
insert into Tmatricula (Carnet,CodMateria,Grupo,Nota) values ('600000','C20',01,50);
insert into Tmatricula (Carnet,CodMateria,Grupo,Nota) values ('600000','D20',01,95);

insert into Tmatricula (Carnet,CodMateria,Grupo,Nota) values ('700000','A20',01,80);
insert into Tmatricula (Carnet,CodMateria,Grupo,Nota) values ('700000','B20',01,80);
insert into Tmatricula (Carnet,CodMateria,Grupo,Nota) values ('700000','C20',01,75);
insert into Tmatricula (Carnet,CodMateria,Grupo,Nota) values ('700000','D20',01,100);

insert into Tmatricula (Carnet,CodMateria,Grupo,Nota) values ('800000','A20',01,100);
insert into Tmatricula (Carnet,CodMateria,Grupo,Nota) values ('800000','B20',01,70);
insert into Tmatricula (Carnet,CodMateria,Grupo,Nota) values ('800000','D20',01,50);

insert into Tmatricula (Carnet,CodMateria,Grupo,Nota) values ('900000','A20',02,60);
insert into Tmatricula (Carnet,CodMateria,Grupo,Nota) values ('900000','C20',02,80);

