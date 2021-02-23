CREATE DATABASE dbDepartment
GO
USE dbDepartment;
go

CREATE TABLE department(
DepartmentID INT NOT NULL,
DepartmentName VARCHAR(20)
);

CREATE TABLE employee(
LastName VARCHAR(20),
DepartmentID INT
);

ALTER TABLE department ADD PRIMARY KEY(DepartmentID);

ALTER TABLE employee ADD CONSTRAINT FK_employee_department FOREIGN KEY(DepartmentID) REFERENCES department(DepartmentID);

--REGISTROS DE LAS TABLAS

INSERT INTO department VALUES(31,'Sales');

INSERT INTO department VALUES(33,'Engineering');

INSERT INTO department VALUES(34,'Clerical');

INSERT INTO department VALUES(35,'Marketing');

INSERT INTO employee VALUES('Rafferty',31);

INSERT INTO employee VALUES('Jones',33);

INSERT INTO employee VALUES('Heisenberg',33);

INSERT INTO employee VALUES('Robinson',34);

INSERT INTO employee VALUES('Smith',34);

INSERT INTO employee VALUES('Willians',NULL);


---DIFERENTES TIPOS DE JOINS---

---INNER JOIN,Muestra todos los datos de la tabla donde sea crea un enlace

SELECT *
FROM department d INNER JOIN employee e ON d.DepartmentID=e.DepartmentID


---LEFT JOIN,Muestra todoso los datos dela tabla donde se crea un enlace y todos los datos que no tiene enlace(Tabla izquierda)

SELECT *
FROM department d LEFT JOIN employee e ON d.DepartmentID=e.DepartmentID


---RIGHT JOIN,Muestra todoso los datos dela tabla donde se crea un enlace y todos los datos que no tiene enlace(Tabla izquierda)

SELECT *
FROM department d RIGHT JOIN employee e ON d.DepartmentID=e.DepartmentID

--ES LA SUMA DE RIGHT Y LEFT JOIN Y VA A TRAER TANTO LOS DEPARTAMENTOS SIN ASIGNAR A EMPLEADOS COMO LOS EMPLEADOS SIN ASIGNAR A DEPARTAMENTOS

SELECT *
FROM department d FULL JOIN employee e ON d.DepartmentID=e.DepartmentID



