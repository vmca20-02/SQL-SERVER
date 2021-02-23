---ARTICULOS---

---0.1 CREAR UNA BASE DE DATOS (dbTiendaInformatica) Y SUS RESPECTIVAS CLASES (Fabricantes y Articulos) 

CREATE DATABASE dbTiendaInformatica
GO
USE dbTiendaInformatica
GO

CREATE TABLE FABRICANTES(
Codigo int NOT NULL,
Nombre nvarchar(100))

GO

CREATE TABLE ARTICULOS(
Codigo int NOT NULL,
Nombre nvarchar(100),
Precio decimal(5,2),
Fabricante int)

---0.2 BORRAR LAS TABLAS ANTERIORMENTE CREADA

DROP TABLE FABRICANTES;

DROP TABLE ARTICULOS;

---0.3 CREAR LAS LLAVES PRIMARIAS DE LAS TABLAS ANTERIORMENTE CREADAS

ALTER TABLE FABRICANTES ADD CONSTRAINT PK_FABRICANTES PRIMARY KEY(Codigo);

ALTER TABLE ARTICULOS ADD CONSTRAINT PK_ARTICULOS PRIMARY KEY(Codigo);

--0.3 AGREGAR UNA LLAVE FORANEA PARA LA TABLA ARTICULOS

ALTER TABLE ARTICULOS ADD CONSTRAINT FK_ARTICULOS_FABRICANTES FOREIGN KEY(Fabricante) REFERENCES ARTICULOS(Codigo);

--0.4 INSERTAR INFORCION PARA LAS TABLAS FABRICANTES Y ARTICULOS (ALTERNE LAS DIFERENTES SINTAXIS DE LOS INSERTS)

---INSERT FABRICANTES---

INSERT INTO FABRICANTES VALUES(1,'Ricardo Hernandes y asociados');

INSERT INTO FABRICANTES (Codigo,Nombre) VALUES(2,'Hermanos Zamora SA');

INSERT INTO FABRICANTES VALUES(3,'Electronica Futura');

INSERT INTO FABRICANTES (Codigo,Nombre) VALUES(4,'Ultimate Computers')


---INSERT ARTICULOS---

INSERT INTO ARTICULOS VALUES(1,'Computadora',7.000,1);

INSERT INTO ARTICULOS VALUES(2,'Teclado',1.000,1);

INSERT INTO ARTICULOS VALUES(3,'Mouse',5.00,1);

INSERT INTO ARTICULOS VALUES(4,'Ventilador',4.000,1);

INSERT INTO ARTICULOS VALUES(5,'Control de video juegos',1.000,1);

INSERT INTO ARTICULOS VALUES(6,'Tapete para mouse',5.0,1);

INSERT INTO ARTICULOS VALUES(7,'Play Station 3',9.000,2);

INSERT INTO ARTICULOS VALUES(8,'Control de Play Station 3',1.000,2);

INSERT INTO ARTICULOS VALUES(9,'Juego de Play Station 3',5.00,2);

INSERT INTO ARTICULOS VALUES(10,'Maletin para computadora',2.000,2);

INSERT INTO ARTICULOS VALUES(11,'Nintendo Switch',11.000,2);

INSERT INTO ARTICULOS VALUES(12,'Nintendo Wii',5.0,2);