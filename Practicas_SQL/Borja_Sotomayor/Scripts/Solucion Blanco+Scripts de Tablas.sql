CREATE DATABASE practica_basica
GO
USE practica_basica
GO

------------ARTICULOS------------

--1.0 Crear el script de las tablas FABRICANTES Y ARTICULOS

CREATE TABLE FABRICANTES(
Codigo int identity primary key,
Nombre nvarchar(100))

GO

CREATE TABLE ARTICULOS(
Codigo int identity primary key,
Nombre nvarchar(100),
Precio int,
Fabricante int)

GO

ALTER TABLE ARTICULOS ADD FOREIGN KEY(Fabricante) REFERENCES FABRICANTES(Codigo);

------------------------INSERTS------------------------------------------------
INSERT INTO FABRICANTES VALUES('DELL');
INSERT INTO FABRICANTES VALUES('IBM');
INSERT INTO FABRICANTES VALUES('HP');
INSERT INTO FABRICANTES VALUES('INTEL');
INSERT INTO FABRICANTES VALUES('TOSHIBA');

INSERT INTO ARTICULOS VALUES('COMPUTADORA DELL',10000,1);
INSERT INTO ARTICULOS VALUES('MOUSE DELL',20000,1);
INSERT INTO ARTICULOS VALUES('TECLADO DELL',7000,1);
INSERT INTO ARTICULOS VALUES('LAPTOP DELL',50000,1);
INSERT INTO ARTICULOS VALUES('IMPRESORA DELL',30000,1);

INSERT INTO ARTICULOS VALUES('COMPUTADORA IBM',10000,2);
INSERT INTO ARTICULOS VALUES('MOUSE IBM',30000,2);
INSERT INTO ARTICULOS VALUES('TECLADO IBM',9000,2);
INSERT INTO ARTICULOS VALUES('LAPTOP IBM',60000,2);
INSERT INTO ARTICULOS VALUES('IMPRESORA IBM',20000,2);

INSERT INTO ARTICULOS VALUES('COMPUTADORA BASICA HP',500000,3);
INSERT INTO ARTICULOS VALUES('MOUSE HP',30000,3);
INSERT INTO ARTICULOS VALUES('TECLADO PROFESIONAL HP',9000,3);
INSERT INTO ARTICULOS VALUES('LAPTOP HP',60000,3);
INSERT INTO ARTICULOS VALUES('IMPRESORA HP',20000,3);
INSERT INTO ARTICULOS VALUES('COMPUTADORA DOBLE PROCESADOR HP',700000,3);
INSERT INTO ARTICULOS VALUES('MOUSE PROFESIONAL HP',20000,3);
INSERT INTO ARTICULOS VALUES('TECLADO REGULAR HP',4000,3);
INSERT INTO ARTICULOS VALUES('LAPTOP GAMER HP',80000,3);
INSERT INTO ARTICULOS VALUES('IMPRESORA LASER HP',40000,3);

INSERT INTO ARTICULOS VALUES('COMPUTADORA BASICA INTEL',500000,4);
INSERT INTO ARTICULOS VALUES('MOUSE INTEL',30000,4);
INSERT INTO ARTICULOS VALUES('TECLADO PROFESIONAL INTEL',9000,4);
INSERT INTO ARTICULOS VALUES('LAPTOP INTEL',60000,4);
INSERT INTO ARTICULOS VALUES('IMPRESORA INTEL',20000,4);
INSERT INTO ARTICULOS VALUES('COMPUTADORA DOBLE PROCESADOR INTEL',700000,4);
INSERT INTO ARTICULOS VALUES('MOUSE PROFESIONAL INTEL',20000,4);
INSERT INTO ARTICULOS VALUES('TECLADO REGULAR INTEL',4000,4);
INSERT INTO ARTICULOS VALUES('LAPTOP GAMER INTEL',80000,4);
INSERT INTO ARTICULOS VALUES('IMPRESORA LASER INTEL',40000,4);

INSERT INTO ARTICULOS VALUES('COMPUTADORA BASICA TOSHIBA',900000,5);
INSERT INTO ARTICULOS VALUES('MOUSE TOSHIBA',30000,5);
INSERT INTO ARTICULOS VALUES('TECLADO PROFESIONAL TOSHIBA',19000,5);
INSERT INTO ARTICULOS VALUES('LAPTOP TOSHIBA',50000,5);
INSERT INTO ARTICULOS VALUES('IMPRESORA TOSHIBA',10000,5);
INSERT INTO ARTICULOS VALUES('COMPUTADORA DOBLE PROCESADOR TOSHIBA',900000,5);
INSERT INTO ARTICULOS VALUES('MOUSE PROFESIONAL TOSHIBA',10000,5);
INSERT INTO ARTICULOS VALUES('TECLADO REGULAR TOSHIBA',4000,5);
INSERT INTO ARTICULOS VALUES('LAPTOP GAMER TOSHIBA',60000,5);
INSERT INTO ARTICULOS VALUES('IMPRESORA LASER TOSHIBA',40000,5);
------------------------------------------------------------------------------------------------

--1.1. Obtener los nombres de los productos de la tienda(1 SOLUCION).

--1.2. Obtener los nombres y los precios de los productos de la tienda(1 SOLUCION).

--1.3. Obtener el nombre de los productos cuyo precio sea menor o igual a 200(1 SOLUCION).

--1.4. Obtener todos los datos de los articulos cuyo precio este entre los 60 y los 120(2 SOLUCIONES).

--1.5.Obtener el nombre y el precio en pesetas(es decir,el precio en euros multiplicado por 166’386)(1 SOLUCION).

--1.6.Seleccionar el precio medio de todos los productos(1 SOLUCION).

--1.7.Obtener el precio medio de los articulos cuyo codigo de fabricante sea 2(1 SOLUCION).

--1.8. Obtener el numero de articulos cuyo precio sea mayor o igual a 180(1 SOLUCION).

--1.9. Obtener el nombre y precio de los articulos cuyo precio sea mayor o igual a 180 
     --y ordenarlos descendentemente por precio, y luego ascendentemente por nombre(1 SOLUCION).

--1.10. Obtener un listado completo de articulos, incluyendo por cada articulo los datos del articulo y de su fabricante(3 SOLUCIONES).

---VERSION CON WHERE---

---VERSION CON JOIN---

---VERSION CON SUB-QUERY---

--1.11. Obtener un listado de articulos, incluyendo el nombre del articulo, su precio, y el nombre de su fabricante(3 SOLUCIONES).

---VERSION CON WHERE---

---VERSION CON INNER JOIN---

---VERSION CON SUB-QUERY---

--1.12. Obtener el precio medio de los productos de cada fabricante, mostrando solo los codigos de fabricante(3 SOLUCIONES).

---VERSION CON WHERE---

---VERSION CON JOIN---

---VERSION CON SUB-QUERY---

--1.13. Obtener el precio medio de los productos de cada fabricante, mostrando el nombre del fabricante(3 SOLUCIONES).

---VERSION CON WHERE---

---VERSION CON JOIN---

---VERSION CON SUB-QUERY---

--1.14. Obtener los nombres de los fabricantes que ofrezcan productos cuyo precio medio sea mayor o igual a 150(3 SOLUCIONES).

---VERSION CON WHERE---

---VERSION CON JOIN---

---VERSION CON SUB-QUERY---

--1.15. Obtener el nombre y precio del articulo mas barato(1 SOLUCION).

--1.16. Obtener una lista con el nombre y precio de los articulos 
      --mas caros de cada pro-veedor (incluyendo el nombre del proveedor)(3 SOLUCIONES).

---VERSION CON WHERE---

---VERSION CON JOIN---

---VERSION CON SUB-QUERY---

--1.17. Anadir un nuevo producto: Altavoces de 70 (del fabricante 2)(1 SOLUCION).

--1.18. Cambiar el nombre del producto 8 a ’Impresora Laser’(1 SOLUCION).

--1.19. Aplicar un descuento del 10 % (multiplicar el precio por 0’9) a todos los productos(1 SOLUCION).

--1.20. Aplicar un descuento de 10 a todos los productos cuyo precio sea mayor o igual a 120(1 SOLUCION).

------------DEPARTAMENTOS------------

CREATE TABLE DEPARTAMENTOS(
Codigo int primary key,
Nombre nvarchar(100),
Presupuesto int)

GO

CREATE TABLE EMPLEADOS(
DNI varchar(8) primary key,
Nombre nvarchar(100),
Apellidos nvarchar(255),
Departamento int)

ALTER TABLE EMPLEADOS ADD FOREIGN KEY (Departamento) REFERENCES DEPARTAMENTOS(Codigo)

------------------------INSERTS------------------------------------------------
INSERT INTO DEPARTAMENTOS VALUES(14,'Informatica',6.000000);
INSERT INTO DEPARTAMENTOS VALUES(2,'Diseño Grafico',4.000000);
INSERT INTO DEPARTAMENTOS VALUES(77,'Investigacion',2.000000);
INSERT INTO DEPARTAMENTOS VALUES(11,'Contabilidad',1.000000);

INSERT INTO EMPLEADOS VALUES(43543540,'Jimmy','Lopez',14);
INSERT INTO EMPLEADOS VALUES(43543541,'Juan','Perez',14);
INSERT INTO EMPLEADOS VALUES(43543542,'Sebastian','Perez',14);

INSERT INTO EMPLEADOS VALUES(23543540,'Jimmy','Lopez',77);
INSERT INTO EMPLEADOS VALUES(23543541,'Juan','Perez',77);
INSERT INTO EMPLEADOS VALUES(23543542,'Sebastian','Perez',77);
INSERT INTO EMPLEADOS VALUES(23543522,'Teresa','Lopez',77);
INSERT INTO EMPLEADOS VALUES(33543541,'Juan','Jimenez',77);
INSERT INTO EMPLEADOS VALUES(33543542,'Nestor','Argudas',77);
INSERT INTO EMPLEADOS VALUES(33543540,'Trevor','Carvajal',77);
INSERT INTO EMPLEADOS VALUES(33543541,'Alchivaldo','Rojas',77);
INSERT INTO EMPLEADOS VALUES(33543542,'Rita','Vargas',77);

INSERT INTO EMPLEADOS VALUES(235434343,'James','Guzman',2);
INSERT INTO EMPLEADOS VALUES(23576788,'Eduardo','Betancur',2);
INSERT INTO EMPLEADOS VALUES(23589898,'Joshua','Jimenez',2);
INSERT INTO EMPLEADOS VALUES(23567676,'Matias','Carvajal',2);
INSERT INTO EMPLEADOS VALUES(33549090,'Luis','Gonzales',2);
INSERT INTO EMPLEADOS VALUES(33540909,'Nestor','Diaz',2);
INSERT INTO EMPLEADOS VALUES(33543656,'Fedrico','Carvajal',2);
INSERT INTO EMPLEADOS VALUES(33543545,'Timmy','Rojas',2);
INSERT INTO EMPLEADOS VALUES(33544343,'Jonny','Vargas',2);

INSERT INTO EMPLEADOS VALUES(2355454,'Cindy','Springs',11);
INSERT INTO EMPLEADOS VALUES(2357777,'Tammy','Springs',11);
INSERT INTO EMPLEADOS VALUES(2358888,'Wally','West',11);
--------------------------------------------------------------------------------------

--2.1. Obtener los apellidos de los empleados(1 SOLUCION).

--2.2. Obtener los apellidos de los empleados sin repeticiones(1 SOLUCION).

--2.3. Obtener todos los datos de los empleados que se apellidan 'Lopez’(1 SOLUCION).

--2.4. Obtener todos los datos de los empleados que se apellidan 'Lopez’ y los que se apellidan ’Perez’(2 SOLUCIONES).

--2.5. Obtener todos los datos de los empleados que trabajan para el departamento 14(1 SOLUCION).

--2.6. Obtener todos los datos de los empleados que trabajan para el departamento 37 y para el departamento 77(2 SOLUCIONES).

--2.7. Obtener todos los datos de los empleados cuyo apellido comience por 'P'(1 SOLUCION).

--2.8. Obtener el presupuesto total de todos los departamentos(1 SOLUCION).

--2.9. Obtener el numero de empleados en cada departamento(1 SOLUCION).

--2.10. Obtener un listado completo de empleados, incluyendo por cada 
      --empleado los datos del empleado y de su departamento(3 SOLUCIONES).

---VERSION CON WHERE---

---VERSION CON JOIN---

---VERSION CON SUB-QUERY---


--2.11. Obtener un listado completo de empleados, incluyendo el nombre y 
      --apellidos del empleado junto al nombre y presupuesto de su departamento(3 SOLUCIONES).

---VERSION CON WHERE---

---VERSION CON JOIN---

---VERSION CON SUB-QUERY---

--2.12. Obtener los nombres y apellidos de los empleados que trabajen en departamentos 
      --cuyo presupuesto sea mayor de 60.000(3 SOLUCIONES).

---VERSION CON WHERE---

---VERSION CON JOIN---

---VERSION CON SUB-QUERY---

--2.13. Obtener los datos de los departamentos cuyo presupuesto es 
      --superior al presupuesto medio de todos los departamentos(1 SOLUCION).

--2.14. Obtener los nombres (´unicamente los nombres) de los departamentos que tienen mas de dos empleados(3 SOLUCIONES)

---VERSION CON WHERE---

---VERSION CON JOIN---

---VERSION CON SUB-QUERY---

--2.15. Anadir un nuevo departamento: ‘Calidad’, con presupuesto de 40.000 y codigo
      --11. Anadir un empleado vinculado al departamento reci ´en creado: Esther Vazquez,DNI: 89267109(1 SOLUCION).

--2.16. Aplicar un recorte presupuestario del 10 % a todos los departamentos(1 SOLUCION).

--2.17. Reasignar a los empleados del departamento de investigacion (codigo 77) al departamento de informatica (codigo 14)(1 SOLUCION).

--2.18. Despedir a todos los empleados que trabajan para el departamento de informatica(codigo 14)(1 SOLUCION).

--2.19. Despedir a todos los empleados que trabajen para departamentos cuyo presupuesto sea superior a los 60.000(1 SOLUCION).

--2.20. Despedir a todos los empleados(1 SOLUCION).

------------ALMACENES------------

--1.0 Crear el script de las tablas ALMACENES Y CAJAS

CREATE TABLE ALMACENES(
Codigo int identity primary key,
Lugar nvarchar(100),
Capacidad int)

CREATE TABLE CAJAS(
NumReferencia char(5) primary key,
Contenido nvarchar(100),
Valor int,
Almacen int)

ALTER TABLE CAJAS ADD FOREIGN KEY(Almacen) REFERENCES ALMACENES(Codigo);

------------------------INSERTS------------------------------------------------
INSERT INTO DEPARTAMENTOS VALUES(14,'Informatica',6.000000);
INSERT INTO DEPARTAMENTOS VALUES(2,'Diseño Grafico',4.000000);
INSERT INTO DEPARTAMENTOS VALUES(77,'Investigacion',2.000000);
INSERT INTO DEPARTAMENTOS VALUES(11,'Contabilidad',1.000000);

INSERT INTO EMPLEADOS VALUES(43543540,'Jimmy','Lopez',14);
INSERT INTO EMPLEADOS VALUES(43543541,'Juan','Perez',14);
INSERT INTO EMPLEADOS VALUES(43543542,'Sebastian','Perez',14);

INSERT INTO EMPLEADOS VALUES(23543540,'Jimmy','Lopez',77);
INSERT INTO EMPLEADOS VALUES(23543541,'Juan','Perez',77);
INSERT INTO EMPLEADOS VALUES(23543542,'Sebastian','Perez',77);
INSERT INTO EMPLEADOS VALUES(23543522,'Teresa','Lopez',77);
INSERT INTO EMPLEADOS VALUES(33543541,'Juan','Jimenez',77);
INSERT INTO EMPLEADOS VALUES(33543542,'Nestor','Argudas',77);
INSERT INTO EMPLEADOS VALUES(33543540,'Trevor','Carvajal',77);
INSERT INTO EMPLEADOS VALUES(33543541,'Alchivaldo','Rojas',77);
INSERT INTO EMPLEADOS VALUES(33543542,'Rita','Vargas',77);

INSERT INTO EMPLEADOS VALUES(235434343,'James','Guzman',2);
INSERT INTO EMPLEADOS VALUES(23576788,'Eduardo','Betancur',2);
INSERT INTO EMPLEADOS VALUES(23589898,'Joshua','Jimenez',2);
INSERT INTO EMPLEADOS VALUES(23567676,'Matias','Carvajal',2);
INSERT INTO EMPLEADOS VALUES(33549090,'Luis','Gonzales',2);
INSERT INTO EMPLEADOS VALUES(33540909,'Nestor','Diaz',2);
INSERT INTO EMPLEADOS VALUES(33543656,'Fedrico','Carvajal',2);
INSERT INTO EMPLEADOS VALUES(33543545,'Timmy','Rojas',2);
INSERT INTO EMPLEADOS VALUES(33544343,'Jonny','Vargas',2);

INSERT INTO EMPLEADOS VALUES(2355454,'Cindy','Springs',11);
INSERT INTO EMPLEADOS VALUES(2357777,'Tammy','Springs',11);
INSERT INTO EMPLEADOS VALUES(2358888,'Wally','West',11);
------------------------------------------------------------------------------------------

--3.1. Obtener todos los almacenes(1 SOLUCION).

--3.2. Obtener todas las cajas cuyo contenido tenga un valor superior a 150(1 SOLUCION).

--3.3. Obtener los tipos de contenidos de las cajas(1 SOLUCION).

--3.4. Obtener el valor medio de todas las cajas(1 SOLUCION).

--3.5. Obtener el valor medio de las cajas de cada almacen(1 SOLUCION).

--3.6. Obtener los codigos de los almacenes en los cuales el valor medio de las cajas sea superior a 150(1 SOLUCION).

--3.7. Obtener el numero de referencia de cada caja junto con el nombre de la ciudad en el que se encuentra(3 SOLUCIONES).

---VERSION CON WHERE---

---VERSION CON JOIN---

---VERSION CON SUB-QUERY---

--3.8. Obtener el numero de cajas que hay en cada almacen.

/* Esta consulta no tiene en cuenta los almacenes vacıos*/

/*Esta consulta tiene en cuenta los almacenes vacios*/

--3.9. Obtener los codigos de los almacenes que estan saturados (los almacenes donde el numero de cajas es superior a la capacidad)(1 SOLUCION).

--3.10. Obtener los numeros de referencia de las cajas que est ´an en Bilbao(3 SOLUCIONES).

---VERSION CON WHERE---

---VERSION CON JOIN---

---VERSION CON SUB-QUERY---

--3.11. Insertar un nuevo almac ´en en Barcelona con capacidad para 3 cajas(1 SOLUCION).

--3.12. Insertar una nueva caja, con numero de referencia ‘H5RT’, con contenido ‘Papel’,valor 200, y situada en el almacen 2(1 SOLUCION).

--3.13. Rebajar el valor de todas las cajas un 15 %(1 SOLUCION).

--3.14. Rebajar un 20 % el valor de todas las cajas cuyo valor sea superior al valor medio de todas las cajas(1 SOLUCION).

--3.15. Eliminar todas las cajas cuyo valor sea inferior a 100(1 SOLUCION).

--3.16. Vaciar el contenido de los almacenes que estan saturados(1 SOLUCION).

------------PELICULAS------------

CREATE TABLE SALAS(
Codigo int identity primary key,
Nombre nvarchar(100),
Pelicula int
)

CREATE TABLE PELICULAS(
Codigo int identity primary key,
Nombre nvarchar(100),
CalificacionEdad int
)

ALTER TABLE SALAS ADD FOREIGN KEY(Pelicula) REFERENCES PELICULAS(Codigo)

------------INSERTS------------

INSERT SALAS VALUES('01',6);
INSERT SALAS VALUES('02',7);
INSERT SALAS VALUES('03',8);
INSERT SALAS VALUES('04',9);
INSERT SALAS VALUES('05',10);
INSERT SALAS VALUES('06',NULL);
INSERT SALAS VALUES('07',NULL);


INSERT PELICULAS VALUES('Duro de matar',18);
INSERT PELICULAS VALUES('Depredador',18);
INSERT PELICULAS VALUES('Alien',18);
INSERT PELICULAS VALUES('Back to the future',10);
INSERT PELICULAS VALUES('Viernes 13',18);
INSERT PELICULAS VALUES('Masacre en Texas',18);
INSERT PELICULAS VALUES('Pinocho',8);
INSERT PELICULAS VALUES('Boggie Nights',NULL);
INSERT PELICULAS VALUES('Se lo que hicieron el verano pasado',NULL);
INSERT PELICULAS VALUES('Scream',NULL);

--4.1. Mostrar el nombre de todas las peliculas(1 SOLUCION).

--4.2. Mostrar las distintas calificaciones de edad que existen(1 SOLUCION).

--4.3. Mostrar todas las peliculas que no han sido calificadas(1 SOLUCION).

--4.4. Mostrar todas las salas que no proyectan ninguna pelicula(1 SOLUCION).

--4.5. Mostrar la informacion de todas las salas y, si se proyecta alguna pelicula en la sala, mostrar tambien la informacion de la pelicula.

--4.6. Mostrar la informacion de todas las peliculas y, si se proyecta en alguna sala,mostrar tambi ´en la informacion de la sala.

--4.7. Mostrar los nombres de las peliculas que no se proyectan en ninguna sala(2 SOLUCIONES).

---VERSION CON JOIN

---VERSION CON SUBCONSULTA

--4.8. Anadir una nueva pelicula Uno, Dos, Tres’, para mayores de 7 anos(1 SOLUCION).

--4.9. Hacer constar que todas las peliculas no calificadas han sido calificadas ‘no reco-mendables para menores de 13 anos’(1 SOLUCION).

--4.10. Eliminar todas las salas que proyectan pel ´iculas recomendadas para todos los publicos(1 SOLUCION).


------------LOS DIRECTORES------------

---NOTAS IMPORTANTES--

---LOS DIRECTORES QUE NO TIENEN JEFE(DNIJefe IS NULL)

---LOS JEFES QUE NO TIENEN JEFE(DNIJefe IS NULL)

---SE SABE QUE UN REGISTRO PERTENECE A UN JEFE POR EL HECHO DE QUE ES EL DNIJefe DE OTROS REGISTROS

--5.0 Crear el script de las tablas DIRECTORES Y DESPACHOS

CREATE TABLE DIRECTORES(
DNI varchar(8),
NombApels nvarchar(255),
DNIJefe   varchar(8),
Despacho  int
Primary key(DNI))

CREATE TABLE DESPACHOS(
Numero    int,
Capacidad int
Primary key(Numero))

ALTER TABLE DIRECTORES ADD FOREIGN KEY(Despacho) REFERENCES DESPACHOS(Numero)

ALTER TABLE DIRECTORES ADD FOREIGN KEY(DNIJefe) REFERENCES DIRECTORES(DNI)

------------INSERTS------------

INSERT INTO DESPACHOS VALUES(1,10)
INSERT INTO DESPACHOS VALUES(2,50)
INSERT INTO DESPACHOS VALUES(3,150)
INSERT INTO DESPACHOS VALUES(4,250)

---ESTOS SON JEFES---
INSERT INTO DIRECTORES VALUES('222222','Jhon Jefferson',NULL,1)
INSERT INTO DIRECTORES VALUES('111111','Eduardo Rodriguez',NULL,2)
INSERT INTO DIRECTORES VALUES('434343','Ricardo Arjona',NULL,3)
INSERT INTO DIRECTORES VALUES('888888','Jhon Cena',NULL,3)
INSERT INTO DIRECTORES VALUES('124444','Jay Leeno',NULL,3)
INSERT INTO DIRECTORES VALUES('111222','Bobby Stevenson',NULL,3)

---ESTOS SON DIRECTORES QUE NO TIENEN JEFES---
INSERT INTO DIRECTORES VALUES('777777','Tony Mendez',NULL,3)
INSERT INTO DIRECTORES VALUES('999999','Sabrina Reyes',NULL,1)
INSERT INTO DIRECTORES VALUES('122999','Brenda Gomez',NULL,2)
INSERT INTO DIRECTORES VALUES('122333','James Roberson',NULL,2)

---ESTOS SON DIRECTORES CON JEFES---

INSERT INTO DIRECTORES VALUES('776666','Roy Mendez','222222',3)
INSERT INTO DIRECTORES VALUES('998888','Greivin Reyes','222222',1)
INSERT INTO DIRECTORES VALUES('124EWE','Roberto Gomez','222222',2)
INSERT INTO DIRECTORES VALUES('123234','Antony Roberson','434343',2)

------------INSERTS------------

--5.1. Mostrar el DNI, nombre y apellidos de todos los directores(1 SOLUCION).

--5.2. Mostrar los datos de los directores que no tienen jefes(1 SOLUCION).

--5.3. Mostrar el nombre y apellidos de cada director, junto con la capacidad del despacho en el que se encuentra(3 SOLUCIONES).

---VERSION CON WHERE---

---VERSION CON JOIN---

---VERSION CON SUB-QUERY---

--5.4. Mostrar el numero de directores que hay en cada despacho(2 SOLUCIONES).

/* Sin tener en cuenta despachos vacios */

/* Teniendo en cuenta despachos vacios */

--5.5. Mostrar los datos de los directores cuyos jefes no tienen jefes(1 SOLUCION).

--5.6. Mostrar los nombres y apellidos de los directores junto con los de su jefe(2 SOLUCIONES).

/* No muestra directores que no tienen jefes. */

/* Mostrar directores sin jefe. */

--5.7. Mostrar el numero de despachos que estan sobreutilizados(1 SOLUCION).
---ESTO OCURRE CUANDO LA CANTIDAD DE EMPLEADOS SOBREPASALA CAPACIDAD DE SU RESPECTIVO DESPACHO


--5.8. Anadir un nuevo director llamado Paco P ´erez, DNI 28301700, sin jefe, y situado en el despacho 124(1 SOLUCION).

--5.9. Asignar a todos los empleados apellidados Perez un nuevo jefe con DNI 74568521(1 SOLUCION).

--5.10. Despedir a todos los directores, excepto a los que no tienen jefe(1 SOLUCION).

------------PIEZAS Y PROVEEDORES------------

--5.0 Crear el script de las tablas PIEZAS Y PROVEDORES

CREATE TABLE PIEZAS(
Codigo int primary key identity,
Nombre nvarchar(100)) 

CREATE TABLE PROVEDORES(
Id char(4) primary key,
Nombre nvarchar(100))

CREATE TABLE SUMINISTRA(
CodigoPieza int,
IdProveedor char(4),
Precio int
PRIMARY KEY(CodigoPieza,IdProveedor))

ALTER TABLE SUMINISTRA ADD FOREIGN KEY(CodigoPieza) REFERENCES PIEZAS(Codigo)

ALTER TABLE SUMINISTRA ADD FOREIGN KEY(IdProveedor) REFERENCES PROVEDORES(Id)

------------INSERTS------------

INSERT INTO PIEZAS VALUES('Tuercas');
INSERT INTO PIEZAS VALUES('Clavos');
INSERT INTO PIEZAS VALUES('Tornillos');
INSERT INTO PIEZAS VALUES('Grapas');
INSERT INTO PIEZAS VALUES('Torniquetes');
INSERT INTO PIEZAS VALUES('Bombillo');
INSERT INTO PIEZAS VALUES('Cable');
INSERT INTO PIEZAS VALUES('Alambre');
INSERT INTO PIEZAS VALUES('Perilla');
INSERT INTO PIEZAS VALUES('Union');

INSERT INTO PROVEDORES VALUES('001','Skellington Supplies');
INSERT INTO PROVEDORES VALUES('002','Susan Calvin Corp.');
INSERT INTO PROVEDORES VALUES('003','Ultimate Supplies');
INSERT INTO PROVEDORES VALUES('004','Ferreteria Gomez');
INSERT INTO PROVEDORES VALUES('005','Repuestos Gigante');
INSERT INTO PROVEDORES VALUES('006','Ferreterias Carvajal');
INSERT INTO PROVEDORES VALUES('007','Ferreteria Wallmart');
INSERT INTO PROVEDORES VALUES('008','Ferreteria Yellow');
INSERT INTO PROVEDORES VALUES('009','Sullivan Corp');
INSERT INTO PROVEDORES VALUES('010','Stark Industries');
INSERT INTO PROVEDORES VALUES('011','Meburn Company');
INSERT INTO PROVEDORES VALUES('012','The Black Company');
INSERT INTO PROVEDORES VALUES('HAL','HAL LABTORY');

INSERT INTO SUMINISTRA VALUES(1,'001',1000);
INSERT INTO SUMINISTRA VALUES(1,'002',9000);
INSERT INTO SUMINISTRA VALUES(1,'003',1500);
INSERT INTO SUMINISTRA VALUES(1,'004',3500);
INSERT INTO SUMINISTRA VALUES(1,'005',3500);
INSERT INTO SUMINISTRA VALUES(2,'003',1500);
INSERT INTO SUMINISTRA VALUES(2,'004',3500);
INSERT INTO SUMINISTRA VALUES(2,'005',3500);
INSERT INTO SUMINISTRA VALUES(3,'002',9000);
INSERT INTO SUMINISTRA VALUES(3,'003',1500);
INSERT INTO SUMINISTRA VALUES(3,'004',3500);
INSERT INTO SUMINISTRA VALUES(3,'005',3500);
INSERT INTO SUMINISTRA VALUES(3,'006',1500);
INSERT INTO SUMINISTRA VALUES(3,'007',3500);
INSERT INTO SUMINISTRA VALUES(3,'008',3500);
INSERT INTO SUMINISTRA VALUES(5,'HAL',500);

------------INSERTS------------

--6.1. Obtener los nombres de todas las piezas(1 SOLUCION).

--6.2. Obtener todos los datos de todos los proveedores(1 SOLUCION).

--6.3. Obtener el precio medio al que se nos suministran las piezas(1 SOLUCION).

--6.4. Obtener los nombres de los proveedores que suministran la pieza 1(3 SOLUCIONES).

---VERSION CON WHERE---

---VERSION CON JOIN---

---VERSION CON SUB-QUERY---

--6.5. Obtener los nombres de las piezas suministradas por el proveedor cuyo codigo es HAL(4 SOLUCIONES).

---VERSION CON WHERE---

---VERSION CON JOIN---

---VERSION CON SUB-QUERY---

---VERSION EXIST

--6.6. Obtener los nombres de los proveedores que suministran las piezas mas 
     --caras,indicando el nombre de la pieza y el precio al que la suministran(1 SOLUCION).

--6.7. Hacer constar en la base de datos que la empresa ”Skellington Supplies”(codigo TNBC) va 
    --a empezar a suministrarnos tuercas (codigo 1) a 7 pesetas cada tuerca.(1 SOLUCION).

--6.8. Aumentar los precios en una unidad(1 SOLUCION).

--6.9. Hacer constar en la base de datos que la empresa ”Susan Calvin Corp.”(RBT) nova a 
    --suministrarnos ninguna pieza (aunque la empresa en s ´i va a seguir constando en nuestra base de datos)(1 SOLUCION).

--6.10. Hacer constar en la base de datos que la empresa ”Susan Calvin Corp.”(RBT) 
    --ya no va a suministrarnos clavos (codigo 4)(1 SOLUCION).


------------LOS CIENTIFICOS------------

--5.0 Crear el script de las tablas CIENTIFICOS,ASIGNADO_A Y PROYECTO

CREATE TABLE CIENTIFICOS(
DNI varchar(8) primary key,
NomApels nvarchar(255))

CREATE TABLE PROYECTO(
Id char(4) primary key,
Nombre nvarchar(255),
Horas int)

CREATE TABLE ASIGNADO_A(
Cientifico varchar(8),
Proyecto char(4),
Primary Key(Cientifico,Proyecto))

ALTER TABLE ASIGNADO_A ADD FOREIGN KEY(Cientifico) REFERENCES CIENTIFICOS(DNI);

ALTER TABLE ASIGNADO_A ADD FOREIGN KEY(Proyecto) REFERENCES PROYECTO(Id);

------------INSERTS------------

INSERT INTO CIENTIFICOS VALUES('000001','Billie Idol');
INSERT INTO CIENTIFICOS VALUES('000002','James Roberts');
INSERT INTO CIENTIFICOS VALUES('000003','Tony Curtis');
INSERT INTO CIENTIFICOS VALUES('000004','Robert Englud');
INSERT INTO CIENTIFICOS VALUES('000005','Bobby Bumpers');
INSERT INTO CIENTIFICOS VALUES('000006','Michael Myers');

INSERT INTO PROYECTO VALUES('001','Investigacion de Celulas',80);
INSERT INTO PROYECTO VALUES('002','Piel Artificial',120);
INSERT INTO PROYECTO VALUES('003','Ojos Artificiales',420);
INSERT INTO PROYECTO VALUES('004','Protesis Cyberneticas',520);
INSERT INTO PROYECTO VALUES('005','Manos Cyberneticas',900);

INSERT INTO ASIGNADO_A VALUES('000001','001');
INSERT INTO ASIGNADO_A VALUES('000002','001');
INSERT INTO ASIGNADO_A VALUES('000003','001');
INSERT INTO ASIGNADO_A VALUES('000002','002');

------------INSERTS------------

--7.1. Sacar una relacion completa de los cientificos asignados a cada proyecto. 
     --Mostrar DNI, Nombre del cientifico, Identificador del proyecto y nombre del proyecto(3 SOLUCIONES)

---VERSION CON WHERE---

---VERSION CON JOIN---

---VERSION CON SUB-QUERY---

--7.2. Obtener el numero de proyectos al que est ´a asignado cada cientifico (mostrar el DNI y el nombre)(1 SOLUCION).

---VERSION CON JOIN---

--7.3. Obtener el numero de cientificos asignados a cada proyecto (mostrar el identificador de proyecto y el nombre del proyecto)(1 SOLUCION).

---VERSION CON JOIN---

--7.4. Obtener el numero de horas de dedicacion de cada cientifico.

---VERSION CON JOIN---

--7.5. Obtener el DNI y nombre de los cientificos que se dedican a mas de un proyecto 
     --y cuya dedicacion media a cada proyecto sea superior a las 80 horas.

---VERSION CON SUB-QUERY---

---VERSION CON JOIN---

------------LOS GRANDES ALMACENES------------

--8.0 Crear el script de las tablas

CREATE TABLE CAJEROS(
Codigo   int identity Primary key,
NomApels nvarchar(255));

CREATE TABLE PRODUCTOS(
Codigo int identity Primary Key,
Nombre nvarchar(100),
Precio int);

CREATE TABLE MAQUINAS_REGISTRADORAS(
Codigo int identity Primary key,
Piso  int);

CREATE TABLE VENTA(
Cajero   int,
Maquina  int,
Producto int,
Primary Key(Cajero,Maquina,Producto));

ALTER TABLE VENTA ADD FOREIGN KEY(Cajero)   REFERENCES CAJEROS(Codigo); 

ALTER TABLE VENTA ADD FOREIGN KEY(Maquina)  REFERENCES MAQUINAS_REGISTRADORAS(Codigo); 

ALTER TABLE VENTA ADD FOREIGN KEY(Producto) REFERENCES PRODUCTOS(Codigo); 

------------INSERTS------------

INSERT INTO CAJEROS VALUES('Billie Idol');
INSERT INTO CAJEROS VALUES('James Roberts');
INSERT INTO CAJEROS VALUES('Tony Curtis');
INSERT INTO CAJEROS VALUES('Robert Englud');
INSERT INTO CAJEROS VALUES('Bobby Bumpers');
INSERT INTO CAJEROS VALUES('Michael Myers');

INSERT INTO PRODUCTOS VALUES('Manzanas',1000);
INSERT INTO PRODUCTOS VALUES('Brocolli',6000);
INSERT INTO PRODUCTOS VALUES('Bananas',500);
INSERT INTO PRODUCTOS VALUES('Cereal',1000);
INSERT INTO PRODUCTOS VALUES('Lecha Condesada',2000);
INSERT INTO PRODUCTOS VALUES('Leche en polvo',400);

INSERT INTO MAQUINAS_REGISTRADORAS VALUES(1);
INSERT INTO MAQUINAS_REGISTRADORAS VALUES(2);
INSERT INTO MAQUINAS_REGISTRADORAS VALUES(3);
INSERT INTO MAQUINAS_REGISTRADORAS VALUES(4);
INSERT INTO MAQUINAS_REGISTRADORAS VALUES(5);

INSERT INTO VENTA VALUES(1,1,1);
INSERT INTO VENTA VALUES(2,2,2);
INSERT INTO VENTA VALUES(3,3,3);
INSERT INTO VENTA VALUES(4,4,4);
INSERT INTO VENTA VALUES(4,4,1);
INSERT INTO VENTA VALUES(4,4,2);
INSERT INTO VENTA VALUES(4,4,3);

------------INSERTS------------

--8.1. Mostrar el numero de ventas de cada producto, ordenado de mas a menos ventas(1 SOLUCION).

--8.2. Obtener un informe completo de ventas, indicando el nombre del cajero que rea-lizon de la venta, 
     --nombre y precios de los productos vendidos, y piso en el que se encuentra la maquina registradora donde se realizo la venta(2 SOLUCIONES)

---VERSION CON WHERE---

---VERSION CON JOIN---


--8.3. Obtener las ventas totales realizadas en cada piso(1 SOLUCION).

---VERSION CON WHERE---

---VERSION CON JOIN---


--8.4. Obtener el codigo y nombre de cada empleado junto con el importe total de sus ventas(1 SOLUCION).

--8.5. Obtener el codigo y nombre de aquellos cajeros que hayan realizado ventas en 
      --pisos cuyas ventas totales sean inferiores a los 500


------------LOS INVESTIGADORES------------

---9.0 Crear el script de las tablas

CREATE TABLE FACULTAD(
Codigo int,
Nombre nvarchar(100),
Primary Key(Codigo));

CREATE TABLE INVESTIGADORES(
DNI      varchar(8),
NomApels nvarchar(255),
Facultad int,
Primary Key(DNI),
Foreign Key(Facultad) References FACULTAD(Codigo));

CREATE TABLE EQUIPOS(
NumSerie  char(4),
Nombre    nvarchar(100),
Facultad  int,
Primary Key(NumSerie),
Foreign Key(Facultad) References FACULTAD(Codigo));

CREATE TABLE RESERVA(
DNI       varchar(8),
NumSerie  char(4),
Comienzo  datetime,
Fin       datetime,
Primary key(DNI,NumSerie),
Foreign Key(DNI) References INVESTIGADORES(DNI),
Foreign Key(NumSerie) References EQUIPOS(NumSerie));

------------INSERTS------------

INSERT INTO FACULTAD VALUES(1,'Alfa Beta');
INSERT INTO FACULTAD VALUES(2,'New Castle');
INSERT INTO FACULTAD VALUES(3,'Lion King');
INSERT INTO FACULTAD VALUES(4,'INA');

INSERT INTO INVESTIGADORES VALUES('0001','Ricky Ricardo',1);
INSERT INTO INVESTIGADORES VALUES('0002','James Rolfe',1);
INSERT INTO INVESTIGADORES VALUES('0003','Bobby Brown',1);
INSERT INTO INVESTIGADORES VALUES('0004','Tony Curtis',1);
INSERT INTO INVESTIGADORES VALUES('0007','Rick Jones',2);


INSERT INTO EQUIPOS VALUES('001A','Labtop TOSHIBA',1);
INSERT INTO EQUIPOS VALUES('002A','Labtop DELL',1);
INSERT INTO EQUIPOS VALUES('003A','Labtop IBM',1);
INSERT INTO EQUIPOS VALUES('001B','Labtop TOSHIBA',2);
INSERT INTO EQUIPOS VALUES('002B','Labtop DELL',2);
INSERT INTO EQUIPOS VALUES('003B','Labtop IBM',2);
INSERT INTO EQUIPOS VALUES('004B','Proyector Deluxe	',3);


INSERT INTO RESERVA VALUES('0001','001A','5/10/2019 10:00 AM','5/10/2019 10:00 AM');
INSERT INTO RESERVA VALUES('0002','002A','5/10/2019 10:00 AM','5/10/2019 10:00 AM');
INSERT INTO RESERVA VALUES('0003','003A','5/11/2019 10:00 AM','5/11/2019 11:00 PM');
INSERT INTO RESERVA VALUES('0004','001B','5/10/2019 10:00 AM','5/10/2019 10:00 AM');
INSERT INTO RESERVA VALUES('0004','002B','5/10/2019 10:00 AM','5/10/2019 10:00 AM');
INSERT INTO RESERVA VALUES('0004','003B','5/11/2019 10:00 AM','5/11/2019 11:00 PM');

------------INSERTS------------

--9.1. Obtener el DNI y nombre de aquellos investigadores que han realizado m ´as de una reserva(2 SOLUCIONES).

---VERSION CON WHERE---

---VERSION CON JOIN---

--9.2. Obtener un listado completa de reservas, incluyendo los siguientes datos:(2 SOLUCIONES)

       --DNI y nombre del investigador, junto con el nombre de su facultad.
       --Numero de serie y nombre del equipo reservado, junto con el nombre de la facultad a la que pertenece.
       --Fecha de comienzo y fin de la reserva.

---VERSION CON WHERE---

---VERSION CON JOIN---

--9.3. Obtener el DNI y el nombre de los investigadores que han reservado equipos que no son de su facultad(3 SOLUCIONES).

---VERSION CON WHERE---

---VERSION CON JOIN---

---VERSION CON EXISTS--

--9.4. Obtener los nombres de las facultades en las que ningun investigador ha realizado una reserva(1 SOLUCION).

--9.5. Obtener los nombres de las facultades con investigadores ’ociosos’ (investigadores que no han realizado ninguna reserva)(1 SOLUCION).

--9.6. Obtener el numero de serie y nombre de los equipos que nunca han sido reservados(3 SOLUCIONES).

---VERSION CON WHERE---

---VERSION CON JOIN---

---VERSION CON EXISTS--








