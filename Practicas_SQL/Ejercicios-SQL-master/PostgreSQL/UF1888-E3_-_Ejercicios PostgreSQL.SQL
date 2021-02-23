/** EJERCICIO 1
******************************************************************************/

CREATE TABLE "/agenda" (
	apellido VARCHAR(30),
	nombre VARCHAR(20),
	domicilio VARCHAR(30),
	telefono VARCHAR(11)
);

DROP TABLE IF EXISTS agenda;

CREATE TABLE agenda(
	apellido VARCHAR(30),
	nombre VARCHAR(20),
	domicilio VARCHAR(30),
	telefono VARCHAR(11)
); -- Should fail

SELECT table_name,column_name,udt_name,character_maximum_length 
	FROM information_schema.columns 
	WHERE table_name = 'agenda';

DROP TABLE agenda;

DROP TABLE agenda; -- Should fail


/** EJERCICIO 2
******************************************************************************/

DROP TABLE IF EXISTS libros;

CREATE TABLE libros(
	titulo VARCHAR(20),
	autor VARCHAR(30),
	editorial VARCHAR(15)
);

CREATE TABLE libros(
	titulo VARCHAR(20),
	autor VARCHAR(30),
	editorial VARCHAR(15)
); -- Should fail

SELECT table_name,column_name,udt_name,character_maximum_length 
	FROM information_schema.columns 
	WHERE table_name = 'libros';

DROP TABLE libros;

DROP TABLE libros; -- Should fail


/** EJERCICIO 3
******************************************************************************/

DROP TABLE IF EXISTS agenda;

CREATE TABLE agenda (
	apellido VARCHAR(30),
	nombre VARCHAR(20),
	domicilio VARCHAR(30),
	telefono VARCHAR(11)
);
SELECT table_name,column_name,udt_name,character_maximum_length 
	FROM information_schema.columns 
	WHERE table_name = 'agenda';

INSERT INTO agenda (apellido, nombre, domicilio, telefono)
	VALUES	('Moreno','Alberto','Colon 123','4234567'),
		('Torres','Juan','Avellaneda 135','4458787');

SELECT * FROM agenda;

DROP TABLE agenda;

DROP TABLE agenda; -- Should fail


/** EJERCICIO 4
******************************************************************************/

DROP TABLE IF EXISTS libros;

CREATE TABLE libros (
	titulo VARCHAR(20),
	autor VARCHAR(30),
	editorial VARCHAR(15)
);
SELECT table_name,column_name,udt_name,character_maximum_length 
	FROM information_schema.columns 
	WHERE table_name = 'agenda';

INSERT INTO libros (titulo,autor,editorial)
	VALUES	('El aleph','Borges','Planeta'),
		('Martin Fierro','Jose Hernandez','Emece'),
		('Aprenda PHP','Mario Molina','Emece');

SELECT * FROM libros;


/** EJERCICIO 5
******************************************************************************/

DROP TABLE IF EXISTS peliculas;

CREATE TABLE peliculas (
	nombre VARCHAR(20),
	actor VARCHAR(20),
	duracion INTEGER,
	cantidad INTEGER
);

SELECT table_name,column_name,udt_name,character_maximum_length 
	FROM information_schema.columns 
	WHERE table_name = 'peliculas';
	
INSERT INTO peliculas (nombre, actor, duracion, cantidad)
	VALUES	('Mision imposible','Tom Cruise',128,3),
		('Mision imposible 2','Tom Cruise',130,2),
		('Mujer bonita','Julia Roberts',118,3),
		('Elsa y Fred','China Zorrilla',110,2);
		
SELECT *FROM peliculas;


/** EJERCICIO 6
******************************************************************************/

DROP TABLE IF EXISTS empleados;

CREATE TABLE empleados (
	nombre VARCHAR(20),
	documento VARCHAR(8),
	sexo VARCHAR(1),
	domicilio VARCHAR(30),
	sueldobasico FLOAT
);
SELECT table_name,column_name,udt_name,character_maximum_length 
	FROM information_schema.columns 
	WHERE table_name = 'empleados';

INSERT INTO empleados (nombre, documento, sexo, domicilio, sueldobasico)
	VALUES	('Juan Perez','22333444','m','Sarmiento 123',500),
		('Ana Acosta','24555666','f','Colon 134',650),
		('Bartolome Barrios','27888999','m','Urquiza 479',800);

SELECT *FROM empleados;


/** EJERCICIO 7
******************************************************************************/

DROP TABLE IF EXISTS peliculas;

CREATE TABLE peliculas (
	titulo VARCHAR(20),
	actor VARCHAR(20),
	duracion INTEGER,
	cantidad INTEGER
);

SELECT table_name,column_name,udt_name,character_maximum_length 
	FROM information_schema.columns 
	WHERE table_name = 'peliculas';
	
INSERT INTO peliculas (titulo, actor, duracion, cantidad)
	VALUES	('Mision imposible','Tom Cruise',180,3),
		('Mision imposible 2','Tom Cruise',190,2),
		('Mujer bonita','Julia Roberts',118,3),
		('Elsa y Fred','China Zorrilla',110,2);
		
SELECT titulo,actor FROM peliculas;
SELECT titulo,duracion FROM peliculas;
SELECT titulo,cantidad FROM peliculas;


/** EJERCICIO 8
******************************************************************************/

DROP TABLE IF EXISTS empleados;

CREATE TABLE empleados (
	nombre VARCHAR(20),
	documento VARCHAR(8), 
	sexo VARCHAR(1),
	domicilio VARCHAR(30),
	sueldobasico FLOAT
);
SELECT table_name,column_name,udt_name,character_maximum_length 
	FROM information_schema.columns 
	WHERE table_name = 'empleados';
	
INSERT INTO empleados (nombre, documento, sexo, domicilio, sueldobasico)
	VALUES	('Juan Juarez','22333444','m','Sarmiento 123',500),
		('Ana Acosta','27888999','f','Colon 134',700),
		('Carlos Caseres','31222333','m','Urquiza 479',850);
		
SELECT * FROM empleados;
SELECT nombre,documento,domicilio FROM empleados;
SELECT documento,sexo,sueldobasico FROM empleados;


/** EJERCICIO 9
******************************************************************************/

DROP TABLE IF EXISTS agenda;

CREATE TABLE agenda (
	apellido VARCHAR(30),
	nombre VARCHAR(20),
	domicilio VARCHAR(30),
	telefono VARCHAR(11)
);
SELECT table_name,column_name,udt_name,character_maximum_length 
	FROM information_schema.columns 
	WHERE table_name = 'agenda';
INSERT INTO agenda(apellido,nombre,domicilio,telefono) 
	VALUES	('Acosta', 'Ana', 'Colon 123', '4234567'),
		('Bustamante', 'Betina', 'Avellaneda 135', '4458787'),
		('Lopez', 'Hector', 'Salta 545', '4887788'), 
		('Lopez', 'Luis', 'Urquiza 333', '4545454'),
		('Lopez', 'Marisa', 'Urquiza 333', '4545454');
		
SELECT * FROM agenda;

SELECT * FROM agenda
	WHERE nombre='Marisa';
	
SELECT nombre,domicilio FROM agenda
	WHERE apellido='Lopez';
	
SELECT nombre FROM agenda
	WHERE telefono='4545454';


/** EJERCICIO 10
******************************************************************************/

DROP TABLE IF EXISTS libros;

CREATE TABLE libros (
	titulo VARCHAR(20),
	autor VARCHAR(30),
	editorial VARCHAR(15)
);

SELECT table_name,column_name,udt_name,character_maximum_length 
	FROM information_schema.columns 
	WHERE table_name = 'libros';
	
INSERT INTO libros(titulo,autor,editorial)
	VALUES	('El aleph','Borges','Emece'),
		('Martin Fierro','Jose Hernandez','Emece'),
		('Martin Fierro','Jose Hernandez','Planeta'),
		('Aprenda PHP','Mario Molina','Siglo XXI');
		
SELECT * FROM libros
	WHERE autor='Borges';
	
SELECT titulo FROM libros
	WHERE editorial='Emece';
	
SELECT editorial FROM libros
	WHERE titulo='Martin Fierro';


/** EJERCICIO 11
******************************************************************************/

DROP TABLE IF EXISTS articulos;

CREATE TABLE articulos (
	codigo INTEGER,
	nombre VARCHAR(20),
	descripcion VARCHAR(30),
	precio FLOAT,
	cantidad INTEGER
);
INSERT INTO articulos (codigo, nombre, descripcion, precio,cantidad)
	VALUES	(1,'impresora','Epson Stylus C45',400.80,20),
		(2,'impresora','Epson Stylus C85',500,30),
		(3,'monitor','Samsung 14',800,10),
		(4,'teclado','ingles Biswal',100,50),
		(5,'teclado','espaniol Biswal',90,50);
		
SELECT * FROM articulos
	WHERE nombre='impresora';
	
SELECT * FROM articulos
	WHERE precio <>400;
	
SELECT codigo,nombre
	FROM articulos
	WHERE cantidad < 30;
	
SELECT nombre, descripcion
	FROM articulos
	WHERE precio <> 100;


/** EJERCICIO 12
 ******************************************************************************/

DROP TABLE IF EXISTS peliculas;

CREATE TABLE peliculas (
	titulo VARCHAR(20),
	actor VARCHAR(20),
	duracion INTEGER,
	cantidad INTEGER
);

INSERT INTO peliculas (titulo, actor, duracion, cantidad)
	VALUES	('Mision imposible','Tom Cruise',120,3),
		('Mision imposible 2','Tom Cruise',180,4),
		('Mujer bonita','Julia R.',90,1),
		('Elsa y Fred','China Zorrilla',80,2);
		
SELECT * FROM peliculas
	WHERE duracion <>90;
	
SELECT * FROM peliculas
	WHERE actor <> 'Tom Cruise';
	
SELECT titulo,actor,cantidad
	FROM peliculas
	WHERE cantidad > 2;


/** EJERCICIO 13
******************************************************************************/

DROP TABLE IF EXISTS agenda;

CREATE TABLE agenda (
	apellido VARCHAR(30),
	nombre VARCHAR(20),
	domicilio VARCHAR(30),
	telefono VARCHAR(11)
);
INSERT INTO agenda (apellido,nombre,domicilio,telefono)
	VALUES	('Alvarez','Alberto','Colon 123','4234567'),
		('Juarez','Juan','Avellaneda 135','4458787'),
		('Lopez','Maria','Urquiza 333','4545454'),
		('Lopez','Jose','Urquiza 333','4545454'),
		('Salas','Susana','Gral. Paz 1234','4123456');
		
DELETE FROM agenda
	WHERE nombre='Juan';
	
DELETE FROM agenda
	WHERE telefono='4545454';
	
SELECT * FROM agenda;

DELETE FROM agenda;

SELECT * FROM agenda;


/** EJERCICIO 14
 ******************************************************************************/

DROP TABLE IF EXISTS articulos;

CREATE TABLE articulos (
	codigo INTEGER,
	nombre VARCHAR(20),
	descripcion VARCHAR(30),
	precio FLOAT,
	cantidad INTEGER
);

INSERT INTO articulos (codigo, nombre, descripcion, precio,cantidad)
	VALUES	(1,'impresora','Epson Stylus C45',400.80,20),
		(2,'impresora','Epson Stylus C85',500,30),
		(3,'monitor','Samsung 14',800,10),
		(4,'teclado','ingles Biswal',100,50),
		(5,'teclado','espaniol Biswal',90,50);
		
DELETE FROM articulos
	WHERE precio <>500;
	
SELECT * FROM articulos;

DELETE FROM articulos
	WHERE nombre='impresora';
	
SELECT * FROM articulos;

DELETE FROM articulos
	WHERE codigo <> 4;
	
SELECT * FROM articulos;


/** EJERCICIO 15
******************************************************************************/

DROP TABLE IF EXISTS agenda;

CREATE TABLE agenda (
	apellido VARCHAR(30),
	nombre VARCHAR(20),
	domicilio VARCHAR(30),
	telefono VARCHAR(11)
);
INSERT INTO agenda (apellido,nombre,domicilio,telefono)
	VALUES	('Acosta','Alberto','Colon 123','4234567'),
		('Juarez','Juan','Avellaneda 135','4458787'),
		('Lopez','Maria','Urquiza 333','4545454'),
		('Lopez','Jose','Urquiza 333','4545454'),
		('Suarez','Susana','Gral. Paz 1234','4123456');
		
SELECT * FROM agenda;

UPDATE agenda SET nombre='Juan Jose'
	WHERE nombre='Juan';
SELECT * FROM agenda;

UPDATE agenda SET telefono='4445566'
	WHERE telefono='4545454';
SELECT * FROM agenda;

UPDATE agenda SET nombre='Juan Jose'
	WHERE nombre='Juan';
	SELECT * FROM agenda;


/** EJERCICIO 16
 ******************************************************************************/

DROP TABLE IF EXISTS libros;

CREATE TABLE libros (
	titulo VARCHAR(30),
	autor VARCHAR(20),
	editorial VARCHAR(15),
	precio FLOAT
);
INSERT INTO libros (titulo, autor, editorial, precio)
	VALUES	('El aleph','Borges','Emece',25.00),
		('Martin Fierro','Jose Hernandez','Planeta',35.50),
		('Aprenda PHP','Mario Molina','Emece',45.50),
		('Cervantes y el quijote','Borges','Emece',25),
		('Matematica estas ahi','Paenza','Siglo XXI',15);
		
SELECT * FROM libros;

UPDATE libros SET autor='Adrian Paenza'
	WHERE autor='Paenza';
SELECT * FROM libros;

UPDATE libros SET autor='Adrian Paenza'
	WHERE autor='Paenza';
SELECT * FROM libros;

UPDATE libros SET precio=27
	WHERE autor='Mario Molina';
SELECT * FROM libros;

UPDATE libros SET editorial='Emece S.A.'
	WHERE editorial='Emece';
SELECT * FROM libros;


/** EJERCICIO 17
******************************************************************************/

DROP TABLE IF EXISTS medicamentos;

CREATE TABLE medicamentos (
	codigo INTEGER NOT NULL,
	nombre VARCHAR(20) NOT NULL,
	laboratorio VARCHAR(20),
	precio FLOAT,
	cantidad INTEGER NOT NULL
);
SELECT table_name,column_name,udt_name,character_maximum_length,is_NULLable 
	FROM information_schema.columns 
	WHERE table_name = 'medicamentos';
	
INSERT INTO medicamentos (codigo,nombre,laboratorio,precio,cantidad)
	VALUES	(1,'Sertal gotas',NULL,NULL,100),
		(2,'Sertal compuesto',NULL,8.90,150),
		(3,'Buscapina','Roche',NULL,200);
		
SELECT * FROM medicamentos;

INSERT INTO medicamentos (codigo,nombre, laboratorio,precio,cantidad)
	VALUES	(4,'Bayaspirina','',0,150),
		(0,'','Bayer',15.60,0);
	
SELECT * FROM medicamentos;

INSERT INTO medicamentos (codigo,nombre,laboratorio,precio,cantidad)
	VALUES	(NULL,'Amoxidal jarabe','Bayer',25,120); -- Should fail
	
SELECT * FROM medicamentos
	WHERE laboratorio is NULL;
	
SELECT * FROM medicamentos
	WHERE laboratorio='';
	
SELECT * FROM medicamentos
	WHERE precio is NULL;
	
SELECT * FROM medicamentos
	WHERE precio=0;
	
SELECT * FROM medicamentos
	WHERE laboratorio <> '';
	
SELECT * FROM medicamentos
	WHERE laboratorio is NOT NULL;
	
SELECT * FROM medicamentos
	WHERE precio <> 0;
	
SELECT * FROM medicamentos
	WHERE precio is NOT NULL;


/** EJERCICIO 18
 ******************************************************************************/

DROP TABLE IF EXISTS peliculas;

CREATE TABLE peliculas (
	codigo INT NOT NULL,
	titulo VARCHAR(40) NOT NULL,
	actor VARCHAR(20),
	duracion INT
);
SELECT table_name,column_name,udt_name,character_maximum_length,is_NULLable 
	FROM information_schema.columns 
	WHERE table_name = 'peliculas';
	
INSERT INTO peliculas (codigo,titulo,actor,duracion)
	VALUES	(1,'Mision imposible','Tom Cruise',120),
		(2,'Harry Potter y la piedra fi	losofal',NULL,180),
		(3,'Harry Potter y la camara secreta','Daniel R.',NULL),
		(0,'Mision imposible 2','',150),
		(4,'','L. Di Caprio',220),
		(5,'Mujer bonita','R. Gere-J. Roberts',0);
		
SELECT * FROM peliculas;

INSERT INTO peliculas (codigo,titulo,actor,duracion)
	VALUES	(NULL,'Mujer bonita','R. Gere-J. Roberts',190);

SELECT * FROM peliculas
	WHERE actor is NULL;
	
UPDATE peliculas SET duracion=120 
	WHERE duracion is NULL;
UPDATE peliculas SET actor='DESConocido'
	WHERE actor='';
SELECT * FROM peliculas;

DELETE FROM peliculas
	WHERE titulo='';

SELECT * FROM peliculas;


/** EJERCICIO 19
******************************************************************************/

DROP TABLE IF EXISTS libros;

CREATE TABLE libros (
	codigo INT NOT NULL,
	titulo VARCHAR(40) NOT NULL,
	autor VARCHAR(20),
	editorial VARCHAR(15),
	PRIMARY KEY(codigo)
);

INSERT INTO libros (codigo,titulo,autor,editorial)
	VALUES	(1,'El aleph','Borges','Emece'),
		(2,'Martin Fierro','Jose Hernandez','Planeta'),
		(3,'Aprenda PHP','Mario Molina','Nuevo Siglo');
		
INSERT INTO libros (codigo,titulo,autor,editorial)
	VALUES	(2,'Alicia en el pais de las maravillas','Lewis Carroll','Planeta');
	
INSERT INTO libros (codigo,titulo,autor,editorial)
	VALUES	(NULL,'Alicia en el pais de las maravillas','Lewis Carroll','Planeta');
	
UPDATE libros SET codigo=1
	WHERE titulo='Martin Fierro';


/** EJERCICIO 20
 ******************************************************************************/

DROP TABLE IF EXISTS alumnos;

CREATE TABLE alumnos (
	legajo VARCHAR(4) NOT NULL,
	documento VARCHAR(8),
	nombre VARCHAR(30),
	domicilio VARCHAR(30),
	PRIMARY KEY(documento),
	PRIMARY KEY(legajo)
);

DROP TABLE IF EXISTS alumnos;

CREATE TABLE alumnos (
	legajo VARCHAR(4) NOT NULL,
	documento VARCHAR(8),
	nombre VARCHAR(30),
	domicilio VARCHAR(30),
	PRIMARY KEY(documento)
);
SELECT table_name,column_name,udt_name,character_maximum_length,is_NULLable 
	FROM information_schema.columns 
	WHERE table_name = 'alumnos';
	
INSERT INTO alumnos (legajo,documento,nombre,domicilio)
	VALUES	('A233','22345345','Perez Mariana','Colon 234'),
		('A567','23545345','Morales Marcos','Avellaneda 348');
		
INSERT INTO alumnos (legajo,documento,nombre,domicilio)
	VALUES	('A642','23545345','Gonzalez Analia','Caseros 444');
	
INSERT INTO alumnos (legajo,documento,nombre,domicilio)
	VALUES	('A685',NULL,'Miranda Carmen','Uspallata 999');


/** EJERCICIO 21
******************************************************************************/

DROP TABLE IF EXISTS medicamentos;

CREATE TABLE medicamentos (
	codigo SERIAL,
	nombre VARCHAR(20),
	laboratorio VARCHAR(20),
	precio FLOAT,
	cantidad INTEGER,
	PRIMARY KEY (codigo)
);
SELECT table_name,column_name,udt_name,character_maximum_length,is_NULLable 
	FROM information_schema.columns 
	WHERE table_name = 'medicamentos';
	
INSERT INTO medicamentos (nombre, laboratorio,precio,cantidad)
	VALUES	('Sertal','Roche',5.2,100),
		('Buscapina','Roche',4.10,200),
		('Amoxidal 500','Bayer',15.60,100);
SELECT * FROM medicamentos;


/** EJERCICIO 22
 ******************************************************************************/

DROP TABLE IF EXISTS peliculas;
CREATE TABLE peliculas (
	codigo SERIAL,
	titulo VARCHAR(40),
	actor VARCHAR(20),
	duracion INT,
	PRIMARY KEY (codigo)
);
SELECT table_name,column_name,udt_name,character_maximum_length,is_NULLable 
	FROM information_schema.columns 
	WHERE table_name = 'peliculas';
	
INSERT INTO peliculas (titulo,actor,duracion)
	VALUES	('Mision imposible','Tom Cruise',120),
		('Harry Potter y la piedra filosofal','xxx',180),
		('Harry Potter y la camara secreta','xxx',190),
		('Mision imposible 2','Tom Cruise',120),
		('La vida es bella','zzz',220);
		
SELECT * FROM peliculas;

UPDATE peliculas SET actor='Daniel R.' WHERE codigo=3;

DELETE FROM peliculas WHERE titulo='La vida es bella';

DELETE FROM peliculas WHERE duracion=120;

SELECT * FROM peliculas;

INSERT INTO peliculas (titulo,actor,duracion)
	VALUES	('Mujer bonita','Richard Gere',120);
	
SELECT * FROM peliculas;


/** EJERCICIO 23
******************************************************************************/

DROP TABLE IF EXISTS medicamentos;

CREATE TABLE medicamentos (
	codigo SERIAL,
	nombre VARCHAR(20),
	laboratorio VARCHAR(20),
	precio FLOAT,
	cantidad INTEGER,
	PRIMARY KEY (codigo)
);

INSERT INTO medicamentos (nombre, laboratorio,precio,cantidad)
	VALUES	('Sertal','Roche',5.2,100),
		('Buscapina','Roche',4.10,200),
		('Amoxidal 500','Bayer',15.60,100);
		
DELETE FROM medicamentos;

INSERT INTO medicamentos (nombre, laboratorio,precio,cantidad)
	VALUES	('Sertal','Roche',5.2,100),
		('Amoxidal 500','Bayer',15.60,100);
		
SELECT * FROM medicamentos;

TRUNCATE TABLE medicamentos RESTART IDENTITY;

INSERT INTO medicamentos (nombre, laboratorio,precio,cantidad)
	VALUES	('Buscapina','Roche',4.10,200);
	
SELECT * FROM medicamentos;


/** EJERCICIO 24
******************************************************************************/

DROP TABLE IF EXISTS autos;

CREATE TABLE autos (
	patente CHAR(6),
	marca VARCHAR(20),
	modelo CHAR(4),
	precio FLOAT,
	PRIMARY KEY (patente)
);

INSERT INTO autos
	VALUES	('ACD123','Fiat 128','1970',15000),
		('ACG234','Renault 11','1990',40000),
		('BCD333','Peugeot 505','1990',80000),
		('GCD123','Renault Clio','1990',70000),
		('BCC333','Renault Megane','1998',95000),
		('BVF543','Fiat 128','1975',20000);
		
SELECT * FROM autos
	WHERE modelo='1990';
	
DROP TABLE autos;

DROP TABLE IF EXISTS autos;

CREATE TABLE autos (
	patente CHARACTER(6),
	marca CHARACTER varying(20),
	modelo CHARACTER(4),
	precio FLOAT,
	PRIMARY KEY (patente)
);

INSERT INTO autos
	VALUES	('ACD123','Fiat 128','1970',15000);
	
SELECT * FROM autos;


/** EJERCICIO 25
 ******************************************************************************/

DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
	documento CHAR(8),
	apellido VARCHAR(20),
	nombre VARCHAR(20),
	domicilio VARCHAR(30),
	telefono VARCHAR (11)
);

INSERT INTO clientes
	VALUES	('2233344','Perez','Juan','Sarmiento 980','4342345'),
		('2333344','Perez','Ana','Colon 234'),
		('2433344','Garcia','Luis','Avellaneda 1454','4558877'),
		('2533344','Juarez','Ana','Urquiza 444','4789900');
		
SELECT * FROM clientes
	WHERE apellido='Perez';


/** EJERCICIO 26
******************************************************************************/

DROP TABLE IF EXISTS cuentas;

CREATE TABLE cuentas (
	numero INT NOT NULL,
	documento CHAR(8) NOT NULL,
	nombre VARCHAR(30),
	saldo DECIMAL(15,2),
	PRIMARY KEY (numero)
);

INSERT INTO cuentas(numero,documento,nombre,saldo)
	VALUES	('1234','25666777','Pedro Perez',500000.60),
		('2234','27888999','Juan Lopez',-250000),
		('3344','27888999','Juan Lopez',4000.50),
		('3346','32111222','Susana Molina',1000);
		
SELECT * FROM cuentas
	WHERE saldo < 4000;
	
SELECT numero,saldo FROM cuentas
	WHERE nombre='Juan Lopez';
	
SELECT * FROM cuentas
	WHERE saldo < 0;
	
SELECT * FROM cuentas
	WHERE numero <>3000;


/** EJERCICIO 27
 ******************************************************************************/

DROP TABLE IF EXISTS empleados;

CREATE TABLE empleados (
	nombre VARCHAR(30),
	documento CHAR(8),
	sexo CHAR(1),
	domicilio VARCHAR(30),
	sueldobasico DECIMAL(7,2),
	cantidadhijos SMALLINT
);

INSERT INTO empleados (nombre,documento,sexo,domicilio,sueldobasico,cantidadhijos)
	VALUES	('Juan Perez','22333444','m','Sarmiento 123',500,2),
		('Ana Acosta','24555666','f','Colon 134',850,0),
		('Bartolome Barrios','27888999','m','Urquiza 479',10000.80,4),
		('Susana Molina','29000555','f','Salta 876',800.888,3),
		('Marta Juarez','32444555','f','Sucre 1086',5000000,2);

SELECT * FROM empleados
	WHERE sueldobasico <>900;
	
SELECT * FROM empleados
	WHERE cantidadhijos > 0;


/** EJERCICIO 28
******************************************************************************/

DROP TABLE IF EXISTS alumnos;

CREATE TABLE alumnos (
	apellido VARCHAR(30),
	nombre VARCHAR(30),
	documento CHAR(8),
	domicilio VARCHAR(30),
	fechaingreso DATE,
	fechanacimiento DATE
);
SET DATESTYLE to 'European';

INSERT INTO alumnos 
	VALUES	('Gonzalez','Ana','22222222','Colon 123','10-08-1990','15/02/1972'),
		('Juarez','Bernardo','25555555','Sucre 456','03-03-1991','15/02/1972'),
		('Perez','Laura','26666666','Bulnes 345','03-03-91',NULL),
		('Lopez','Carlos','27777777','Sarmiento 1254','03-15-1990',NULL);

SELECT * FROM alumnos WHERE fechaingreso < '1-1-91';
SELECT * FROM alumnos WHERE fechanacimiento is NULL;


/** EJERCICIO 29
******************************************************************************/

DROP TABLE IF EXISTS visitantes;

CREATE TABLE visitantes (
	nombre VARCHAR(30),
	edad SMALLINT,
	sexo CHAR(1) DEFAULT 'f',
	domicilio VARCHAR(30),
	ciudad VARCHAR(20) DEFAULT 'Cordoba',
	telefono VARCHAR(11),
	mail VARCHAR(30) DEFAULT 'no tiene',
	montocompra DECIMAL (6,2)
);

SELECT *
	FROM information_schema.columns 
	WHERE table_name = 'visitantes';
	
INSERT INTO visitantes (nombre, domicilio, montocompra)
	VALUES	('Susana Molina','Colon 123',59.80),
		('Marcos Torres',29,'Carlos Paz','marcostorres@hotmail.com');
SELECT * FROM visitantes;

INSERT INTO visitantes
	VALUES	('Marcelo Morales',38,DEFAULT,DEFAULT,DEFAULT,'4255232','marcelomorales@hotmail.com',DEFAULT);

INSERT INTO visitantes DEFAULT VALUES;

SELECT * FROM visitantes;


/** EJERCICIO 30
 ******************************************************************************/

DROP TABLE IF EXISTS prestamos;

CREATE TABLE prestamos (
	titulo VARCHAR(40) NOT NULL,
	documento CHAR(8) NOT NULL,
	fechaprestamo DATE NOT NULL,
	fechadevolucion DATE,
	devuelto CHAR(1) DEFAULT 'n'
);

INSERT INTO prestamos (titulo,documento,fechaprestamo,fechadevolucion)
	VALUES	('Manual de 1 grado','23456789','2006-12-15','2006-12-18'),
		('Alicia en el pais de las maravillas','23456789','2006-12-16'),
		('El aleph','22543987','2006-12-16','2006-08-19'),
		('Manual de geografia 5 grado','25555666','2006-12-18','s');

SELECT *FROM prestamos;

INSERT INTO prestamos
	VALUES	('Manual de historia','32555666','2006-10-25',DEFAULT,DEFAULT);

SELECT *FROM prestamos;

INSERT INTO prestamos DEFAULT VALUES;


/** EJERCICIO 31
******************************************************************************/

DROP TABLE IF EXISTS articulos;

CREATE TABLE articulos (
	codigo SERIAL,
	nombre VARCHAR(20),
	descripcion VARCHAR(30),
	precio DECIMAL(9,2),
	cantidad SMALLINT DEFAULT 0,
	PRIMARY KEY (codigo)
);

INSERT INTO articulos (nombre, descripcion, precio,cantidad)
	VALUES	('impresora','Epson Stylus C45',400.80,20),
		('impresora','Epson Stylus C85',500),
		('monitor','Samsung 14',800),
		('teclado','ingles Biswal',100,50);

UPDATE articulos SET precio=precio+(precio*0.15);
SELECT * FROM articulos;

SELECT nombre||','||descripcion
	FROM articulos;

UPDATE articulos SET cantidad=cantidad-5
	WHERE nombre='teclado';
SELECT * FROM articulos;


/** EJERCICIO 32
******************************************************************************/

DROP TABLE IF EXISTS libros;

CREATE TABLE libros (
	codigo SERIAL,
	titulo VARCHAR(40) NOT NULL,
	autor VARCHAR(20) DEFAULT 'DESConocido',
	editorial VARCHAR(20),
	precio DECIMAL(6,2),
	cantidad SMALLINT DEFAULT 0,
	PRIMARY KEY (codigo)
);
INSERT INTO libros (titulo,autor,editorial,precio)
	VALUES	('El aleph','Borges','Emece',25),
		('Java en 10 MINutos','Mario Molina','Siglo XXI',50.40,100),
		('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50);

SELECT titulo, autor,editorial,precio,cantidad,precio*cantidad AS monto_total
	FROM libros;

SELECT titulo,autor,precio,
	precio*0.1 AS descuento,
	precio-(precio*0.1) AS precio_final
	FROM libros
	WHERE editorial='Emece';

SELECT titulo||'-'||autor AS titulo_y_autor
 	FROM libros;


/** EJERCICIO 33
******************************************************************************/

DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
	documento CHAR(8),
	apellido VARCHAR(20),
	nombre VARCHAR(20),
	domicilio VARCHAR(30),
	telefono VARCHAR (11)
);
INSERT INTO clientes(documento,apellido,nombre,domicilio,telefono)
	VALUES	('2233344','Perez','Juan','Sarmiento 980','4342345'),
		('2333344','Perez','Ana','Colon 234','2345123'),
		('2433344','Garcia','Luis','Avellaneda 1454','4558877'),
		('2533344','Juarez','Ana','Urquiza 444','4789900');

SELECT documento,upper(apellido),upper(nombre),domicilio,telefono 
	FROM clientes;
	
SELECT documento,apellido,substr(nombre,1,1),domicilio,telefono 
	FROM clientes;


/** EJERCICIO 34
******************************************************************************/

DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
	codigo SERIAL,
	nombre VARCHAR(30) NOT NULL,
	domicilio VARCHAR(30),
	ciudad VARCHAR(20),
	provincia VARCHAR (20),
	credito DECIMAL(9,2),
	PRIMARY KEY(codigo)
);
INSERT INTO clientes(nombre,domicilio,ciudad,provincia,credito)
	VALUES	('Lopez Marcos','Colon 111','Cordoba','Cordoba',1900.56),
		('Perez Ana','San Martin 222','Cruz del Eje','Cordoba',450.33),
		('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba',190),
		('Olmos Luis','Sarmiento 444','Rosario','Santa Fe',670.22),
		('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba',500.55);

SELECT * FROM clientes;

SELECT codigo,nombre,domicilio,ciudad,provincia,ceil(credito) 
	FROM clientes;


/** EJERCICIO 35
******************************************************************************/

DROP TABLE IF EXISTS alumnos;

CREATE TABLE alumnos (
	apellido VARCHAR(30),
	nombre VARCHAR(30),
	documento CHAR(8),
	domicilio VARCHAR(30),
	fechaingreso DATE,
	fechanacimiento DATE
);

SET DATESTYLE to 'European';

INSERT INTO alumnos 
	VALUES	('Gonzalez','Ana','22222222','Colon 123','10-08-1990','15/02/1972'),
		('Juarez','Bernardo','25555555','Sucre 456','03-03-1991','15/02/1972'),
		('Perez','Laura','26666666','Bulnes 345','03-03-91',NULL);
		
SELECT * FROM alumnos 
	WHERE fechanacimiento is NULL;

SELECT apellido,nombre,EXTRACT(year FROM fechanacimiento) 
	FROM alumnos;


/** EJERCICIO 36
******************************************************************************/

DROP TABLE IF EXISTS visitas;

CREATE TABLE visitas (
	numero SERIAL,
	nombre VARCHAR(30) DEFAULT 'Anonimo',
	mail VARCHAR(50),
	pais VARCHAR (20),
	fecha TIMESTAMP,
	PRIMARY KEY(numero)
);
INSERT INTO visitas (nombre,mail,pais,fecha)
	VALUES	('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10'),
		('Gustavo Gonzalez','GustavoGGonzalez@hotmail.com','Chile','2006-10-10 21:30'),
		('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45'),
		('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15'),
		('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45'),
		('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-12 16:20'),
		('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25');

SELECT * FROM visitas
	ORDER BY fecha DESC;
	
SELECT nombre,pais,EXTRACT(month FROM fecha)
	FROM visitas
	ORDER BY pais,EXTRACT(month FROM fecha) DESC;
	
SELECT nombre,mail,
	EXTRACT(month FROM fecha) AS mes,
	EXTRACT(day FROM fecha) AS dia,
	EXTRACT(hour FROM fecha) AS hora
	FROM visitas
	ORDER BY 3,4,5;
	
SELECT mail, pais
	FROM visitas
	WHERE EXTRACT(month FROM fecha)=10
	ORDER BY 2;


/** EJERCICIO 37
******************************************************************************/

DROP TABLE IF EXISTS medicamentos;

CREATE TABLE medicamentos (
	codigo SERIAL,
	nombre VARCHAR(20),
	laboratorio VARCHAR(20),
	precio DECIMAL(5,2),
	cantidad SMALLINT,
	PRIMARY KEY(codigo)
);
INSERT INTO medicamentos (nombre,laboratorio,precio,cantidad)
	VALUES	('Sertal','Roche',5.2,100),
		('Buscapina','Roche',4.10,200),
		('Amoxidal 500','Bayer',15.60,100),
		('Paracetamol 500','Bago',1.90,200),
		('Bayaspirina','Bayer',2.10,150); 

INSERT INTO medicamentos (nombre,laboratorio,precio,cantidad)
	VALUES	('Amoxidal jarabe','Bayer',5.10,250); 

SELECT codigo,nombre
	FROM medicamentos
	WHERE laboratorio='Roche' AND precio < 5;

SELECT * FROM medicamentos
	WHERE laboratorio='Roche' OR precio < 5;

SELECT * FROM medicamentos
	WHERE NOT laboratorio='Bayer' AND cantidad=100;
	
SELECT * FROM medicamentos
	WHERE laboratorio='Bayer' AND NOT cantidad=100;
	
DELETE FROM medicamentos
	WHERE laboratorio='Bayer' AND precio > 10;
	
UPDATE medicamentos SET cantidad=200
	WHERE laboratorio='Roche' AND precio > 5;
	
DELETE FROM medicamentos
	WHERE laboratorio='Bayer' OR precio < 3;


/** EJERCICIO 38
 ******************************************************************************/

DROP TABLE IF EXISTS peliculas;

CREATE TABLE peliculas (
	codigo SERIAL,
	titulo VARCHAR(40) NOT NULL,
	actor VARCHAR(20),
	duracion SMALLINT,
	PRIMARY KEY (codigo)
);
INSERT INTO peliculas (titulo,actor,duracion)
	VALUES	('Mision imposible','Tom Cruise',120),
		('Harry Potter y la piedra filosofal','Daniel R.',180),
		('Harry Potter y la camara secreta','Daniel R.',190),
		('Mision imposible 2','Tom Cruise',120),
		('Mujer bonita','Richard Gere',120),
		('Tootsie','D. Hoffman',90),
		('Un oso rojo','Julio Chavez',100),
		('Elsa y Fred','China Zorrilla',110);

SELECT * FROM peliculas
	WHERE actor='Tom Cruise' OR actor='Richard Gere';
	
SELECT * FROM peliculas
	WHERE actor='Tom Cruise' AND duracion < 100;
	
UPDATE peliculas SET duracion=200
	WHERE actor='Daniel R.' AND duracion=180;
	
DELETE FROM peliculas
	WHERE NOT actor='Tom Cruise' AND duracion <>100;


/** EJERCICIO 39
******************************************************************************/

DROP TABLE IF EXISTS peliculas;

CREATE TABLE peliculas (
	codigo SERIAL,
	titulo VARCHAR(40) NOT NULL,
	actor VARCHAR(20),
	duracion SMALLINT,
	PRIMARY KEY (codigo)
);
INSERT INTO peliculas(titulo,actor,duracion)
	VALUES	('Mision imposible','Tom Cruise',120),
		('Harry Potter y la piedra filosofal','Daniel R.',NULL),
		('Harry Potter y la camara secreta','Daniel R.',190),
		('Mision imposible 2','Tom Cruise',120),
		('Mujer bonita',NULL,120),
		('Tootsie','D. Hoffman',90),
		('Un oso rojo');
		
SELECT * FROM peliculas
	WHERE actor is NULL;
	
UPDATE peliculas SET duracion=0
	WHERE duracion is NULL;
	
DELETE FROM peliculas
	WHERE actor is NULL AND duracion=0;
	
SELECT * FROM peliculas;


/** EJERCICIO 40
******************************************************************************/

DROP TABLE IF EXISTS visitas;

CREATE TABLE visitas (
	numero SERIAL,
	nombre VARCHAR(30) DEFAULT 'Anonimo',
	mail VARCHAR(50),
	pais VARCHAR (20),
	fechayhora TIMESTAMP,
	PRIMARY KEY(numero)
);
INSERT INTO visitas (nombre,mail,pais,fechayhora)
	VALUES	('Ana Maria Lopez','AnaMaria@hotmail.com','Argentina','2006-10-10 10:10'),
		('Gustavo Gonzalez','GustavoGGonzalez@gotmail.com','Chile','2006-10-10 21:30'),
		('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-10-11 15:45'),
		('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-10-12 08:15'),
		('Fabiola Martinez','MartinezFabiola@hotmail.com','Mexico','2006-09-12 20:45'),
		('Juancito','JuanJosePerez@gmail.com','Argentina','2006-09-12 16:20'),
		('Juancito','JuanJosePerez@hotmail.com','Argentina','2006-09-15 16:25'),
		('Federico1','federicogarcia@xaxamail.com','Argentina');
		
SELECT * FROM visitas
	WHERE fechayhora BETWEEN '2006-09-12' AND '2006-10-11';
	
SELECT * FROM visitas
	WHERE numero BETWEEN 2 AND 5;


/** EJERCICIO 41
 ******************************************************************************/

DROP TABLE IF EXISTS autos;

CREATE TABLE autos (
	patente CHAR(6),
	marca VARCHAR(20),
	modelo CHAR(4),
	precio DECIMAL(8,2),
	PRIMARY KEY(patente)
);

INSERT INTO autos
	VALUES	('ACD123','Fiat 128','1970',15000),
			('ACG234','Renault 11','1980',40000),
			('BCD333','Peugeot 505','1990',80000),
			('GCD123','Renault Clio','1995',70000),
			('BCC333','Renault Megane','1998',95000),
			('BVF543','Fiat 128','1975',20000);
SELECT * FROM autos
	WHERE modelo BETWEEN '1970' AND '1990'
	ORDER BY modelo;
	
SELECT * FROM autos
	WHERE precio BETWEEN 50000 AND 100000; 


/** EJERCICIO 42
******************************************************************************/

DROP TABLE IF EXISTS medicamentos;

CREATE TABLE medicamentos (
	codigo SERIAL,
	nombre VARCHAR(20),
	laboratorio VARCHAR(20),
	precio DECIMAL(6,2),
	cantidad SMALLINT,
	fechavencimiento DATE NOT NULL,
	PRIMARY KEY(codigo)
);

INSERT INTO medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento)
	VALUES	('Sertal','Roche',5.2,1,'2005-02-01'),
		('Buscapina','Roche',4.10,3,'2006-03-01'),
		('Amoxidal 500','Bayer',15.60,100,'2007-05-01'),
		('Paracetamol 500','Bago',1.90,20,'2008-02-01'),
		('Bayaspirina','Bayer',2.10,150,'2009-12-01'),
		('Amoxidal jarabe','Bayer',5.10,250,'2010-10-01'); 
		
SELECT nombre,precio FROM medicamentos
	WHERE laboratorio in ('Bayer','Bago');
	
SELECT * FROM medicamentos
	WHERE cantidad BETWEEN 1 AND 5;
	
SELECT * FROM medicamentos
	WHERE cantidad in (1,2,3,4,5);


/** EJERCICIO 43
******************************************************************************/

DROP TABLE IF EXISTS empleados;

CREATE TABLE empleados (
	nombre VARCHAR(30),
	documento CHAR(8),
	domicilio VARCHAR(30),
	fechaingreso DATE,
	seccion VARCHAR(20),
	sueldo DECIMAL(6,2),
	PRIMARY KEY(documento)
);
INSERT INTO empleados
	VALUES	('Juan Perez','22333444','Colon 123','1990-10-08','Gerencia',900.50),
		('Ana Acosta','23444555','Caseros 987','1995-12-18','Secretaria',590.30),
		('Lucas Duarte','25666777','Sucre 235','2005-05-15','Sistemas',790),
		('Pamela Gonzalez','26777888','Sarmiento 873','1999-02-12','Secretaria',550),
		('Marcos Juarez','30000111','Rivadavia 801','2002-09-22','Contaduria',630.70),
		('Yolanda Perez','35111222','Colon 180','1990-10-08','AdMINistracion',400),
		('Rodolfo Perez','35555888','Coronel Olmedo 588','1990-05-28','Sistemas',800);

SELECT * FROM empleados
	WHERE nombre like '%Perez%';
	
SELECT * FROM empleados
	WHERE domicilio like 'Co%8%';
	
SELECT nombre,sueldo FROM empleados
	WHERE sueldo NOT like '%.00';
	
SELECT * FROM empleados
	WHERE fechaingreso like '%1990%';


/** EJERCICIO 44
******************************************************************************/

DROP TABLE IF EXISTS medicamentos;

CREATE TABLE medicamentos (
	codigo SERIAL,
	nombre VARCHAR(20),
	laboratorio VARCHAR(20),
	precio DECIMAL(6,2),
	cantidad SMALLINT,
	fechavencimiento DATE NOT NULL,
	numerolote INT DEFAULT NULL,
	PRIMARY KEY(codigo)
);

INSERT INTO medicamentos(nombre,laboratorio,precio,cantidad,fechavencimiento,numerolote)
	VALUES	('Sertal','Roche',5.2,1,'2005-02-01',NULL),
		('Buscapina','Roche',4.10,3,'2006-03-01',NULL),
		('Amoxidal 500','Bayer',15.60,100,'2007-05-01',NULL),
		('Paracetamol 500','Bago',1.90,20,'2008-02-01',NULL),
		('Bayaspirina',NULL,2.10,NULL,'2009-12-01',NULL),
		('Amoxidal jarabe','Bayer',NULL,250,'2009-12-15',NULL); 
		
SELECT COUNT(*)
	FROM medicamentos;
	
SELECT COUNT(laboratorio)
	FROM medicamentos;
	
SELECT COUNT(precio) AS conprecio,
	COUNT(cantidad) AS concantidad
	FROM medicamentos;
	
SELECT COUNT(precio)
	FROM medicamentos
	WHERE laboratorio like 'B%';
	
SELECT COUNT(numerolote) 
	FROM medicamentos;


/** EJERCICIO 45
******************************************************************************/

DROP TABLE IF EXISTS empleados;

CREATE TABLE empleados (
	nombre VARCHAR(30),
	documento CHAR(8),
	domicilio VARCHAR(30),
	seccion VARCHAR(20),
	sueldo DECIMAL(6,2),
	cantidadhijos SMALLINT,
	PRIMARY KEY(documento)
);

INSERT INTO empleados
	VALUES	('Juan Perez','22333444','Colon 123','Gerencia',5000,2),
		('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0),
		('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1),
		('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3),
		('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0),
		('Yolanda Perez','35111222','Colon 180','AdMINistracion',3200,1),
		('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3),
		('Martina Rodriguez','30141414','Sarmiento 1234','AdMINistracion',3800,4),
		('Andres Costa','28444555',DEFAULT,'Secretaria',NULL,NULL);
		
SELECT COUNT(*)
	FROM empleados;
	
SELECT COUNT(sueldo)
	FROM empleados
	WHERE seccion='Secretaria';
	
SELECT MAX(sueldo) AS Mayorsueldo,
	MIN(sueldo) AS Menorsueldo
	FROM empleados;
	
SELECT MAX(cantidadhijos)
	FROM empleados
	WHERE nombre like '%Perez%';
	
SELECT AVG(sueldo)
	FROM empleados;
	
SELECT AVG(sueldo)
	FROM empleados
	WHERE seccion='Secretaria';
	
SELECT AVG(cantidadhijos)
	FROM empleados
	WHERE seccion='Sistemas';


/** EJERCICIO 46
******************************************************************************/

DROP TABLE IF EXISTS visitantes;

CREATE TABLE visitantes (
	nombre VARCHAR(30),
	edad SMALLINT,
	sexo CHAR(1) DEFAULT 'f',
	domicilio VARCHAR(30),
	ciudad VARCHAR(20) DEFAULT 'Cordoba',
	telefono VARCHAR(11),
	mail VARCHAR(30) DEFAULT 'no tiene',
	montocompra DECIMAL (6,2)
);
INSERT INTO visitantes
	VALUES	('Susana Molina',35,DEFAULT,'Colon 123',DEFAULT,NULL,NULL,59.80),
		('Marcos Torres',29,'m',DEFAULT,'Carlos Paz',DEFAULT,'marcostorres@hotmail.com',150.50),
		('Mariana Juarez',45,DEFAULT,DEFAULT,'Carlos Paz',NULL,DEFAULT,23.90),
		('Fabian Perez',36,'m','4556677','fabianperez@xaxamail.com'),
		('Alejandra Gonzalez','La Falda',280.50),
		('Gaston Perez',29,'m','Carlos Paz','gastonperez1@gmail.com',95.40),
		('Liliana Torres',40,DEFAULT,'Sarmiento 876',DEFAULT,DEFAULT,DEFAULT,85),
		('Gabriela Duarte',21,NULL,NULL,'Rio Tercero',DEFAULT,'gabrielaltorres@hotmail.com',321.50);
		
SELECT ciudad, COUNT(*)
	FROM visitantes
	GROUP BY ciudad;
	
SELECT ciudad, COUNT(telefono)
	FROM visitantes
	GROUP BY ciudad;
	
SELECT sexo, SUM(montocompra)
	FROM visitantes
	GROUP BY sexo;
	
SELECT sexo,ciudad,
	MAX(montocompra) AS mayor,
	MIN(montocompra) AS menor 	FROM visitantes
	GROUP BY sexo,ciudad;
	
SELECT ciudad,
	AVG(montocompra) AS promediodecompras
	FROM visitantes
	GROUP BY ciudad;
	
SELECT ciudad,
	COUNT(*) AS cantidadconmail
	FROM visitantes
	WHERE mail is NOT NULL AND mail <> 'no tiene'
	GROUP BY ciudad;


/** EJERCICIO 47
 ******************************************************************************/

DROP TABLE IF EXISTS empleados;

CREATE TABLE empleados (
	nombre VARCHAR(30),
	documento CHAR(8),
	domicilio VARCHAR(30),
	seccion VARCHAR(20),
	sueldo DECIMAL(6,2),
	cantidadhijos SMALLINT,
	fechaingreso DATE,
	PRIMARY KEY(documento)
);

INSERT INTO empleados
	VALUES	('Juan Perez','22333444','Colon 123','Gerencia',5000,2,'1980-05-10'),
		('Ana Acosta','23444555','Caseros 987','Secretaria',2000,0,'1980-10-12'),
		('Lucas Duarte','25666777','Sucre 235','Sistemas',4000,1,'1985-05-25'),
		('Pamela Gonzalez','26777888','Sarmiento 873','Secretaria',2200,3,'1990-06-25'),
		('Marcos Juarez','30000111','Rivadavia 801','Contaduria',3000,0,'1996-05-01'),
		('Yolanda Perez','35111222','Colon 180','AdMINistracion',3200,1,'1996-05-01'),
		('Rodolfo Perez','35555888','Coronel Olmedo 588','Sistemas',4000,3,'1996-05-01'),
		('Martina Rodriguez','30141414','Sarmiento 1234','AdMINistracion',3800,4,'2000-09-01'),
		('Andres Costa','28444555',DEFAULT,'Secretaria',NULL,NULL,NULL);
		
SELECT seccion, COUNT(*)
	FROM empleados
	GROUP BY seccion;
	
SELECT seccion, AVG(cantidadhijos) AS promediodehijos
	FROM empleados
	GROUP BY seccion;
	
SELECT EXTRACT(year FROM fechaingreso), COUNT(*)
	FROM empleados
	GROUP BY EXTRACT(year FROM fechaingreso);
	
SELECT seccion, AVG(sueldo) AS promediodesueldo
	FROM empleados
	WHERE cantidadhijos > 0 AND cantidadhijos is NOT NULL
	GROUP BY seccion;


/** EJERCICIO 48
******************************************************************************/

DROP TABLE IF EXISTS clientes;
CREATE TABLE clientes (
	codigo SERIAL,
	nombre VARCHAR(30) NOT NULL,
	domicilio VARCHAR(30),
	ciudad VARCHAR(20),
	provincia VARCHAR (20),
	telefono VARCHAR(11),
	PRIMARY KEY(codigo)
);

INSERT INTO clientes(nombre,domicilio,ciudad,provincia,telefono)
	VALUES	('Lopez Marcos','Colon 111','Cordoba','Cordoba','NULL'),
		('Perez Ana','San Martin 222','Cruz del Eje','Cordoba','4578585'),
		('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba','4578445'),
		('Perez Luis','Sarmiento 444','Rosario','Santa Fe',NULL),
		('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba','4253685'),
		('Gomez Ines','San Martin 666','Santa Fe','Santa Fe','0345252525'),
		('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba','4554455'),
		('Lopez Carlos',NULL,'Cruz del Eje','Cordoba',NULL),
		('Ramos Betina','San Martin 999','Cordoba','Cordoba','4223366'),
		('Lopez Lucas','San Martin 1010','Posadas','Misiones','0457858745');
		
SELECT ciudad, provincia,
	COUNT(*) AS cantidad
	FROM clientes
	GROUP BY ciudad,provincia;
	
SELECT ciudad, provincia,
	COUNT(*) AS cantidad
	FROM clientes
	GROUP BY ciudad,provincia
	HAVING COUNT(*) > 1;


/** EJERCICIO 49
 ******************************************************************************/

DROP TABLE IF EXISTS visitantes;

CREATE TABLE visitantes (
	nombre VARCHAR(30),
	edad SMALLINT,
	sexo CHAR(1),
	domicilio VARCHAR(30),
	ciudad VARCHAR(20),
	telefono VARCHAR(11),
	montocompra DECIMAL(6,2) NOT NULL
);
INSERT INTO visitantes
	VALUES	('Susana Molina',28,'f',NULL,'Cordoba',NULL,45.50),
		('Marcela Mercado',36,'f','Avellaneda 345','Cordoba','4545454',22.40),
		('Alberto Garcia',35,'m','Gral. Paz 123','Alta Gracia','03547123456',25),
		('Teresa Garcia',33,'f',DEFAULT,'Alta Gracia','03547123456',120),
		('Roberto Perez',45,'m','Urquiza 335','Cordoba','4123456',33.20),
		('Marina Torres',22,'f','Colon 222','Villa Dolores','03544112233',95),
		('Julieta Gomez',24,'f','San Martin 333','Alta Gracia',NULL,53.50),
		('Roxana Lopez',20,'f','NULL','Alta Gracia',NULL,240),
		('Liliana Garcia',50,'f','Paso 999','Cordoba','4588778',48),
		('Juan Torres',43,'m','Sarmiento 876','Cordoba',NULL,15.30);
		
SELECT ciudad,sexo,
	SUM(montocompra) AS Total
	FROM visitantes
	GROUP BY ciudad,sexo
	HAVING SUM(montocompra) > 50;

SELECT ciudad,sexo, COUNT(*) AS cantidad,
	SUM(montocompra) AS total,
	AVG(montocompra) AS promedio
	FROM visitantes
	GROUP BY ciudad,sexo
	HAVING AVG(montocompra) > 30
	ORDER BY total;


/** EJERCICIO 50
******************************************************************************/

DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
	codigo SERIAL,
	nombre VARCHAR(30) NOT NULL,
	domicilio VARCHAR(30),
	ciudad VARCHAR(20),
	provincia VARCHAR (20),
	PRIMARY KEY(codigo)
);

INSERT INTO clientes(nombre,domicilio,ciudad,provincia)
	VALUES	('Lopez Marcos','Colon 111','Cordoba','Cordoba'),
		('Perez Ana','San Martin 222','Cruz del Eje','Cordoba'),
		('Garcia Juan','Rivadavia 333','Villa del Rosario','Cordoba'),
		('Perez Luis','Sarmiento 444','Rosario','Santa Fe'),
		('Pereyra Lucas','San Martin 555','Cruz del Eje','Cordoba'),
		('Gomez Ines','San Martin 666','Santa Fe','Santa Fe'),
		('Torres Fabiola','Alem 777','Villa del Rosario','Cordoba'),
		('Lopez Carlos',NULL,'Cruz del Eje','Cordoba'),
		('Ramos Betina','San Martin 999','Cordoba','Cordoba'),
		('Lopez Lucas','San Martin 1010','Posadas','Misiones');

SELECT distinct provincia FROM clientes;

SELECT COUNT(distinct provincia) AS cantidad
	FROM clientes;

SELECT distinct ciudad FROM clientes;

SELECT COUNT(distinct ciudad) FROM clientes;

SELECT distinct ciudad FROM clientes
	WHERE provincia='Cordoba';

SELECT provincia,COUNT(distinct ciudad)
	FROM clientes
	GROUP BY provincia;


/** EJERCICIO 51
 ******************************************************************************/

DROP TABLE IF EXISTS inmuebles;

CREATE TABLE inmuebles (
	documento VARCHAR(8) NOT NULL,
	apellido VARCHAR(30),
	nombre VARCHAR(30),
	domicilio VARCHAR(20),
	barrio VARCHAR(20),
	ciudad VARCHAR(20),
	tipo CHAR(1),
	superficie DECIMAL (8,2)
);

INSERT INTO inmuebles
	VALUES	('11000000','Perez','Alberto','San Martin 800','Centro','Cordoba','e',100),
		('11000000','Perez','Alberto','Sarmiento 245','Gral. Paz','Cordoba','e',200),
		('12222222','Lopez','Maria','San Martin 202','Centro','Cordoba','e',250),
		('13333333','Garcia','Carlos','Paso 1234','Alberdi','Cordoba','b',200),
		('13333333','Garcia','Carlos','Guemes 876','Alberdi','Cordoba','b',300),
		('14444444','Perez','Mariana','Caseros 456','Flores','Cordoba','b',200),
		('15555555','Lopez','Luis','San Martin 321','Centro','Carlos Paz','e',500),
		('15555555','Lopez','Luis','Lopez y Planes 853','Flores','Carlos Paz','e',350),
		('16666666','Perez','Alberto','Sucre 1877','Flores','Cordoba','e',150);

SELECT distinct apellido FROM inmuebles;

SELECT distinct documento FROM inmuebles;

SELECT COUNT(distinct documento)
	FROM inmuebles
	WHERE ciudad='Cordoba';

SELECT COUNT(ciudad)
	FROM inmuebles
	WHERE domicilio like 'San Martin %';

SELECT distinct apellido,nombre 
	FROM inmuebles;

SELECT documento,COUNT(distinct barrio) AS cantidad
	FROM inmuebles
	GROUP BY documento;


/** EJERCICIO 52
******************************************************************************/

DROP TABLE IF EXISTS consultas;

CREATE TABLE consultas (
	fechayhora TIMESTAMP NOT NULL,
	medico VARCHAR(30) NOT NULL,
	documento CHAR(8) NOT NULL,
	paciente VARCHAR(30),
	obrasocial VARCHAR(30),
	PRIMARY KEY(fechayhora,medico)
);
INSERT INTO consultas
	VALUES	('2006/11/05 8:00','Lopez','12222222','Acosta Betina','PAMI');

INSERT INTO consultas
	VALUES	('2006/11/05 8:30','Lopez','23333333','Fuentes Carlos','PAMI');

INSERT INTO consultas
	VALUES	('2006/11/05 8:00','Perez','34444444','Garcia Marisa','IPAM');

INSERT INTO consultas
	VALUES	('2006/11/05 8:00','Duarte','45555555','Pereyra Luis','PAMI');

INSERT INTO consultas
	VALUES	('2006/11/05 8:00','Perez','23333333','Fuentes Carlos','PAMI');


/** EJERCICIO 53
 ******************************************************************************/

DROP TABLE IF EXISTS inscritos;

CREATE TABLE inscritos (
	documento CHAR(8) NOT NULL, 
	nombre VARCHAR(30),
	deporte VARCHAR(15) NOT NULL,
	anio SMALLINT,
	matricula CHAR(1),
	PRIMARY KEY(documento,deporte,anio)
);
INSERT INTO inscritos
	VALUES	('12222222','Juan Perez','tenis','2005','s'),
		('23333333','Marta Garcia','tenis','2005','s'),
		('34444444','Luis Perez','tenis','2005','n');

INSERT INTO inscritos
	VALUES	('12222222','Juan Perez','futbol','2005','s');

INSERT INTO inscritos
	VALUES	('12222222','Juan Perez','natacion','2005','s');

INSERT INTO inscritos
	VALUES	('12222222','Juan Perez','basquet','2005','n');

INSERT INTO inscritos
	VALUES	('12222222','Juan Perez','tenis','2006','s');

INSERT INTO inscritos
	VALUES	('12222222','Juan Perez','tenis','2007','s');

INSERT INTO inscritos
	VALUES	('12222222','Juan Perez','tenis','2005','s');

UPDATE inscritos SET deporte='tenis'
	WHERE documento='12222222' AND deporte='futbol' AND anio='2005';


/** EJERCICIO 54
******************************************************************************/

DROP TABLE IF EXISTS empleados;

CREATE TABLE empleados (
	documento VARCHAR(8),
	nombre VARCHAR(30),
	fechanacimiento DATE,
	cantidadhijos SMALLINT,
	seccion VARCHAR(20),
	sueldo DECIMAL(6,2)
);

ALTER TABLE empleados
	ADD CONSTRAINT CK_empelados_sueldo_positivo
	CHECK (sueldo > 0);
	
INSERT INTO empleados 
	VALUES	('22222222','Alberto Lopez','1965/10/05',1,'Sistemas',1000),
		('33333333','Beatriz Garcia','1972/08/15',2,'AdMINistracion',3000),
		('34444444','Carlos Caseres','1980/10/05',0,'Contadur&iacute;a',6000);
		
ALTER TABLE empleados
	ADD CONSTRAINT CK_empleados_sueldo_maximo
	CHECK (sueldo <>5000);
	
DELETE FROM empleados WHERE sueldo=6000;

ALTER TABLE empleados
	ADD CONSTRAINT CK_empleados_sueldo_maximo
	CHECK (sueldo <>5000); 
	
ALTER TABLE empleados
	ADD CONSTRAINT CK_fechanacimiento_actual
	CHECK (fechanacimiento < CURRENT_DATE);
	
ALTER TABLE empleados
	ADD CONSTRAINT CK_cantidadhijos_valores
	CHECK (cantidadhijos BETWEEN 0 AND 15);
	
SELECT *
	FROM information_schema.table_constraints
	WHERE table_name = 'empleados';
	
INSERT INTO empleados
	VALUES	('24444444','Carlos Fuentes','1980/02/05',2,'AdMINistracion',-1500);
	
INSERT INTO empleados
	VALUES	('25555555','Daniel Garcia','2007/05/05',2,'Sistemas',1550);
	
UPDATE empleados SET cantidadhijos=21 WHERE documento='22222222';


/** EJERCICIO 55
 ******************************************************************************/

DROP TABLE IF EXISTS vehiculos;

CREATE TABLE vehiculos (
	numero SERIAL,
	patente CHAR(6),
	tipo CHAR(4),
	fechahoraentrada TIMESTAMP,
	fechahorasalida TIMESTAMP,
	PRIMARY KEY(numero)
);

INSERT INTO vehiculos (patente,tipo,fechahoraentrada,fechahorasalida)
	VALUES	('AIC124','auto','2007/01/17 8:05','2007/01/17 12:30'),
		('CAA258','auto','2007/01/17 8:10',NULL),
		('DSE367','moto','2007/01/17 8:30','2007/01/17 18:00');

ALTER TABLE vehiculos
	ADD CONSTRAINT CK_vehiculos_fechahoraentrada_actual
	CHECK (fechahoraentrada <>CURRENT_DATE);

ALTER TABLE vehiculos
	ADD CONSTRAINT CK_vehiculos_fechahoraentradasalida
	CHECK (fechahoraentrada <>fechahorasalida);

INSERT INTO vehiculos (patente,tipo,fechahoraentrada,fechahorasalida)
	VALUES	('ABC123','auto','2007/05/05 10:10',NULL);

UPDATE vehiculos SET fechahorasalida='2007/01/17 7:30'
	WHERE patente='CAA258';

SELECT *
	FROM information_schema.table_constraints
	WHERE table_name = 'vehiculos';

SELECT * FROM vehiculos;


/** EJERCICIO 56
******************************************************************************/

DROP TABLE IF EXISTS empleados;

CREATE TABLE empleados (
	documento VARCHAR(8) NOT NULL,
	nombre VARCHAR(30),
	seccion VARCHAR(20)
);
INSERT INTO empleados
	VALUES	('22222222','Alberto Lopez','Sistemas'),
		('23333333','Beatriz Garcia','AdMINistracion'),
		('23333333','Carlos Fuentes','AdMINistracion');

ALTER TABLE empleados
	ADD CONSTRAINT PK_empleados_documento
	PRIMARY KEY(documento);

DELETE FROM empleados
	WHERE nombre='Carlos Fuentes';

ALTER TABLE empleados
	ADD CONSTRAINT PK_empleados_documento
	PRIMARY KEY(documento);

UPDATE empleados SET documento='22222222'
	WHERE documento='23333333';

ALTER TABLE empleados
	ADD CONSTRAINT PK_empleados_nombre
	PRIMARY KEY(nombre);

INSERT INTO empleados VALUES	(NULL,'Marcelo Juarez','Sistemas');

SELECT * FROM empleados;

SELECT *
	FROM information_schema.table_constraints
	WHERE table_name = 'empleados';


/** EJERCICIO 57
 ******************************************************************************/

DROP TABLE IF EXISTS remis;

CREATE TABLE remis (
	numero SERIAL,
	patente CHAR(6),
	marca VARCHAR(15),
	modelo CHAR(4)
);

INSERT INTO remis (patente,marca,modelo)VALUES	('ABC123','Renault 12','1990');

INSERT INTO remis (patente,marca,modelo)VALUES	('DEF456','Fiat Duna','1995');

ALTER TABLE remis
	ADD CONSTRAINT PK_remis_patente
	PRIMARY KEY(patente);
	
ALTER TABLE remis
	ADD CONSTRAINT PK_remis_numero
	PRIMARY KEY(numero);
	
SELECT *
	FROM information_schema.table_constraints
	WHERE table_name = 'remis';


/** EJERCICIO 58
******************************************************************************/

DROP TABLE IF EXISTS remis;

CREATE TABLE remis (
	numero SERIAL,
	patente CHAR(6),
	marca VARCHAR(15),
	modelo CHAR(4)
);

INSERT INTO remis(patente,marca,modelo) 
	VALUES	('ABC123','Renault clio','1990'),
		('DEF456','Peugeot 504','1995'),
		('DEF456','Fiat Duna','1998'),
		('GHI789','Fiat Duna','1995'),
		(NULL,'Fiat Duna','1995');

ALTER TABLE remis
	ADD CONSTRAINT UQ_remis_patente
	UNIQUE(patente); 

DELETE FROM remis WHERE numero=3;

ALTER TABLE remis
	ADD CONSTRAINT UQ_remis_patente
	UNIQUE(patente); 

INSERT INTO remis (patente,marca,modelo)VALUES	('ABC123','Renault 11','1995');

INSERT INTO remis(patente,marca,modelo) VALUES	(NULL,'Renault 11','1995');

SELECT *
	FROM information_schema.table_constraints
	WHERE table_name = 'remis';


/** EJERCICIO 59
******************************************************************************/

DROP TABLE IF EXISTS vehiculos;

CREATE TABLE vehiculos (
	patente CHAR(6) NOT NULL,
	tipo CHAR(1),
	horallegada TIMESTAMP NOT NULL,
	horasalida TIMESTAMP
);

ALTER TABLE vehiculos
	ADD CONSTRAINT PK_vehiculos_patentellegada
	PRIMARY KEY(patente,horallegada);

INSERT INTO vehiculos 
	VALUES	('SDR456','a','2005/10/10 10:10',NULL),
		('SDR456','m','2005/10/10 10:10',NULL),
		('SDR456','m','2005/10/10 12:10',NULL),
		('SDR111','m','2005/10/10 10:10',NULL);

SELECT *
	FROM information_schema.table_constraints
	WHERE table_name = 'vehiculos';

ALTER TABLE vehiculos
	DROP CONSTRAINT PK_vehiculos_patentellegada;

SELECT *
	FROM information_schema.table_constraints
	WHERE table_name = 'vehiculos';


/** EJERCICIO 60
******************************************************************************/

DROP TABLE IF EXISTS agenda;

CREATE TABLE agenda (
	apellido VARCHAR(30),
	nombre VARCHAR(20) NOT NULL,
	domicilio VARCHAR(30),
	telefono VARCHAR(11),
	mail VARCHAR(30)
);

INSERT INTO agenda 
	VALUES	('Perez','Juan','Sarmiento 345','4334455','juancito@gmail.com'),
		('Garcia','Ana','Urquiza 367','4226677','anamariagarcia@hotmail.com'),
		('Lopez','Juan','Avellaneda 900',NULL,'juancitoLopez@gmail.com'),
		('Juarez','Mariana','Sucre 123','0525657687','marianaJuarez2@gmail.com'),
		('Molinari','Lucia','Peru 1254','4590987','molinarilucia@hotmail.com'),
		('Ferreyra','Patricia','Colon 1534','4585858',NULL),
		('Perez','Susana','San Martin 333',NULL,NULL),
		('Perez','Luis','Urquiza 444','0354545256','perezluisalberto@hotmail.com'),
		('Lopez','Maria','Salta 314',NULL,'lopezmariayo@gmail.com');

CREATE INDEX I_agenda_apellido ON agenda(apellido);

CREATE 	UNIQUE INDEX I_agenda_mail ON agenda(mail);

DROP INDEX I_agenda_apellido;

DROP INDEX I_agenda_mail;


/** EJERCICIO 61
******************************************************************************/

DROP TABLE IF EXISTS agenda;

CREATE TABLE agenda (
	apellido VARCHAR(30),
	nombre VARCHAR(20) NOT NULL,
	domicilio VARCHAR(30),
	telefono VARCHAR(11),
	mail VARCHAR(30)
);

INSERT INTO agenda(apellido,nombre,domicilio,telefono,mail) 
	VALUES	('Martinez','Pablo','Colon 233','236712','mpablo@gmail.com'),
		('Rodriguez','Luis','Dean Funes 345','451111','rluis@yahoo.com.ar'),
		('Lopez','Ana','Peron 344','349696','alopez@hotmail.com'),
		('Cosario','Carla','Leones 334','349595','ccorsario@gmail.com'),
		('Revol','Carlos','Lima 333','6712343','crevol@gmail.com');

SELECT * FROM agenda LIMIT 3;

SELECT * FROM agenda LIMIT 3 OFFSET 2;

SELECT * FROM agenda ORDER BY apellido LIMIT 4 OFFSET 2;


/** EJERCICIO 62
******************************************************************************/

DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
	codigo SERIAL,
	nombre VARCHAR(30),
	domicilio VARCHAR(30),
	ciudad VARCHAR(20),
	codigoprovincia SMALLINT NOT NULL,
	PRIMARY KEY(codigo)
);
DROP TABLE IF EXISTS provincias;

CREATE TABLE provincias (
	codigo SERIAL,
	nombre VARCHAR(20),
	PRIMARY KEY (codigo)
);

INSERT INTO provincias (nombre) 
	VALUES	('Cordoba'),
		('Santa Fe'),
		('Corrientes');
		
INSERT INTO clientes(nombre,domicilio,ciudad,codigoprovincia) 
	VALUES	('Lopez Marcos','Colon 111','Córdoba',1),
		('Perez Ana','San Martin 222','Cruz del Eje',1),
		('Garcia Juan','Rivadavia 333','Villa Maria',1),
		('Perez Luis','Sarmiento 444','Rosario',2),
		('Pereyra Lucas','San Martin 555','Cruz del Eje',1),
		('Gomez Ines','San Martin 666','Santa Fe',2),
		('Torres Fabiola','Alem 777','Ibera',3);
		
SELECT c.nombre,domicilio,ciudad,p.nombre
	FROM clientes AS c
	JOIN provincias AS p
	ON c.codigoprovincia=p.codigo;
	
SELECT c.nombre,domicilio,ciudad,p.nombre
	FROM clientes AS c
	JOIN provincias AS p
	ON c.codigoprovincia=p.codigo
	ORDER BY p.nombre;
	
SELECT c.nombre,domicilio,ciudad
	FROM clientes AS c
	JOIN provincias AS p
	ON c.codigoprovincia=p.codigo
	WHERE p.nombre='Santa Fe';


/** EJERCICIO 63
 ******************************************************************************/

DROP TABLE IF EXISTS inscritos;

CREATE TABLE inscritos (
	nombre VARCHAR(30),
	documento CHAR(8),
	deporte VARCHAR(15),
	matricula CHAR(1),
	PRIMARY KEY(documento,deporte)
);
DROP TABLE IF EXISTS inasistencias;

CREATE TABLE inasistencias (
	documento CHAR(8),
	deporte VARCHAR(15),
	fecha DATE
);

INSERT INTO inscritos 
	VALUES	('Juan Perez','22222222','tenis','s'),
		('Maria Lopez','23333333','tenis','s'),
		('Agustin Juarez','24444444','tenis','n'),
		('Marta Garcia','25555555','natacion','s'),
		('Juan Perez','22222222','natacion','s'),
		('Maria Lopez','23333333','natacion','n');

INSERT INTO inasistencias 
	VALUES	('22222222','tenis','2006-12-01'),
		('22222222','tenis','2006-12-08'),
		('23333333','tenis','2006-12-01'),
		('24444444','tenis','2006-12-08'),
		('22222222','natacion','2006-12-02'),
		('23333333','natacion','2006-12-02');

SELECT nombre,insc.deporte,ina.fecha
	FROM inscritos AS insc
	JOIN inasistencias AS ina
	ON insc.documento=ina.documento AND insc.deporte=ina.deporte
	ORDER BY nombre, insc.deporte;

SELECT nombre,insc.deporte, ina.fecha
	FROM inscritos AS insc
	JOIN inasistencias AS ina
	ON insc.documento=ina.documento AND insc.deporte=ina.deporte
	WHERE insc.documento='22222222';

SELECT nombre,insc.deporte, ina.fecha
	FROM inscritos AS insc
	JOIN inasistencias AS ina
	ON insc.documento=ina.documento AND insc.deporte=ina.deporte
	WHERE insc.matricula='s';


/** EJERCICIO 64
******************************************************************************/

DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
	codigo SERIAL,
	nombre VARCHAR(30),
	domicilio VARCHAR(30),
	ciudad VARCHAR(20),
	codigoprovincia SMALLINT NOT NULL,
	PRIMARY KEY(codigo)
);
DROP TABLE IF EXISTS provincias;

CREATE TABLE provincias (
	codigo SERIAL,
	nombre VARCHAR(20),
	PRIMARY KEY (codigo)
);

INSERT INTO provincias (nombre) 
	VALUES	('Cordoba'),
		('Santa Fe'),
		('Corrientes');

INSERT INTO clientes(nombre,domicilio,ciudad,codigoprovincia) 
	VALUES	('Lopez Marcos','Colon 111','Córdoba',1),
		('Perez Ana','San Martin 222','Cruz del Eje',1),
		('Garcia Juan','Rivadavia 333','Villa Maria',1),
		('Perez Luis','Sarmiento 444','Rosario',2),
		('Gomez Ines','San Martin 666','Santa Fe',2),
		('Torres Fabiola','Alem 777','La Plata',4),
		('Garcia Luis','Sucre 475','Santa Rosa',5);

SELECT c.nombre,domicilio,ciudad, p.nombre
	FROM clientes AS c
	LEFT JOIN provincias AS p
	ON codigoprovincia = p.codigo;

SELECT c.nombre,domicilio,ciudad, p.nombre
	FROM provincias AS p
	LEFT JOIN clientes AS c
	ON codigoprovincia = p.codigo;

SELECT c.nombre,domicilio,ciudad, p.nombre
	FROM clientes AS c
	LEFT JOIN provincias AS p
	ON codigoprovincia = p.codigo
	WHERE p.codigo is NOT NULL;

SELECT c.nombre,domicilio,ciudad, p.nombre
	FROM clientes AS c
	LEFT JOIN provincias AS p
	ON codigoprovincia = p.codigo
	WHERE p.codigo is NULL
	ORDER BY c.nombre;

SELECT c.nombre,domicilio,ciudad, p.nombre
	FROM clientes AS c
	LEFT JOIN provincias AS p
	ON codigoprovincia = p.codigo
	WHERE p.nombre='Cordoba';


/** EJERCICIO 65
******************************************************************************/

DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
	codigo SERIAL,
	nombre VARCHAR(30),
	domicilio VARCHAR(30),
	ciudad VARCHAR(20),
	codigoprovincia SMALLINT NOT NULL,
	PRIMARY KEY(codigo)
);

DROP TABLE IF EXISTS provincias;

CREATE TABLE provincias (
	codigo SERIAL,
	nombre VARCHAR(20),
	PRIMARY KEY (codigo)
);

INSERT INTO provincias (nombre) 
	VALUES	('Cordoba'),
		('Santa Fe'),
		('Corrientes');
		
INSERT INTO clientes(nombre,domicilio,ciudad,codigoprovincia) 
	VALUES	('Lopez Marcos','Colon 111','Córdoba',1),
		('Perez Ana','San Martin 222','Cruz del Eje',1),
		('Garcia Juan','Rivadavia 333','Villa Maria',1),
		('Perez Luis','Sarmiento 444','Rosario',2),
		('Gomez Ines','San Martin 666','Santa Fe',2), 
		('Torres Fabiola','Alem 777','La Plata',4),
		('Garcia Luis','Sucre 475','Santa Rosa',5);
		
SELECT c.nombre,domicilio,ciudad, p.nombre
	FROM provincias AS p
	RIGHT JOIN clientes AS c
	ON codigoprovincia = p.codigo;
	
SELECT c.nombre,domicilio,ciudad, p.nombre
	FROM clientes AS c
	LEFT JOIN provincias AS p
	ON codigoprovincia = p.codigo;
	
SELECT c.nombre,domicilio,ciudad, p.nombre
	FROM provincias AS p
	RIGHT JOIN clientes AS c
	ON codigoprovincia = p.codigo
	WHERE p.codigo is NOT NULL;

SELECT c.nombre,domicilio,ciudad, p.nombre
	FROM provincias AS p
	RIGHT JOIN clientes AS c
	ON codigoprovincia = p.codigo
	WHERE p.codigo is NULL
	ORDER BY ciudad;


/** EJERCICIO 66
******************************************************************************/

DROP TABLE IF EXISTS deportes;

CREATE TABLE deportes (
	codigo SERIAL,
	nombre VARCHAR(30),
	profesor VARCHAR(30),
	PRIMARY KEY (codigo)
);

DROP TABLE IF EXISTS inscritos;

CREATE TABLE inscritos (
	documento CHAR(8),
	codigodeporte SMALLINT NOT NULL,
	matricula CHAR(1)
);

INSERT INTO deportes(nombre,profesor) 
	VALUES	('tenis','Marcelo Roca'),
		('natacion','Marta Torres'),
		('basquet','Luis Garcia'),
		('futbol','Marcelo Roca');

INSERT INTO inscritos 
	VALUES	('22222222',3,'s'),
		('23333333',3,'s'),
		('24444444',3,'n'),
		('22222222',2,'s'),
		('23333333',2,'s'),
		('22222222',4,'n'),
		('22222222',5,'n'); 

SELECT documento,d.nombre,matricula
	FROM inscritos AS i
	JOIN deportes AS d
	ON codigodeporte=codigo;

SELECT documento,d.nombre,matricula
	FROM inscritos AS i
	LEFT JOIN deportes AS d
	ON codigodeporte=codigo;

SELECT documento,d.nombre,matricula
	FROM deportes AS d
	RIGHT JOIN inscritos AS i
	ON codigodeporte=codigo;

SELECT nombre
	FROM deportes AS d
	LEFT JOIN inscritos AS i
	ON codigodeporte=codigo
	WHERE codigodeporte is NULL;

SELECT documento
	FROM inscritos AS i
	LEFT JOIN deportes AS d
	ON codigodeporte=codigo
	WHERE codigo is NULL;

SELECT documento,nombre,profesor,matricula
	FROM inscritos AS i
	FULL JOIN deportes AS d
	ON codigodeporte=codigo; 


/** EJERCICIO 67
******************************************************************************/

DROP TABLE IF EXISTS mujeres;

CREATE TABLE mujeres (
	nombre VARCHAR(30),
	domicilio VARCHAR(30),
	edad INT
);

DROP TABLE IF EXISTS varones;

CREATE TABLE varones (
	nombre VARCHAR(30),
	domicilio VARCHAR(30),
	edad INT
);

INSERT INTO mujeres 
	VALUES	('Maria Lopez','Colon 123',45),
		('Liliana Garcia','Sucre 456',35),
		('Susana Lopez','Avellaneda 98',41);
INSERT INTO varones 
	VALUES	('Juan Torres','Sarmiento 755',44),
		('Marcelo Oliva','San Martin 874',56),
		('Federico Pereyra','Colon 234',38),
		('Juan Garcia','Peru 333',50);

SELECT m.nombre,m.edad,v.nombre,v.edad
	FROM mujeres AS m
	CROSS JOIN varones AS v;

SELECT m.nombre,m.edad,v.nombre,v.edad
	FROM mujeres AS m
	CROSS JOIN varones AS v
	WHERE m.edad > 40 AND v.edad > 40;

SELECT m.nombre,m.edad,v.nombre,v.edad
	FROM mujeres AS m
	CROSS JOIN varones AS v
	WHERE m.edad-v.edad BETWEEN -10 AND 10;


/** EJERCICIO 68
 ******************************************************************************/

DROP TABLE IF EXISTS guardias;

CREATE TABLE guardias (
	documento CHAR(8),
	nombre VARCHAR(30),
	sexo CHAR(1),
	domicilio VARCHAR(30),
	PRIMARY KEY (documento)
);
DROP TABLE IF EXISTS tareas;

CREATE TABLE tareas (
	codigo SERIAL,
	domicilio VARCHAR(30),
	descripcion VARCHAR(30),
	horario CHAR(2),
	PRIMARY KEY (codigo)
);

INSERT INTO guardias 
	VALUES	('22333444','Juan Perez','m','Colon 123'),
		('24333444','Alberto Torres','m','San Martin 567'),
		('25333444','Luis Ferreyra','m','Chacabuco 235'),
		('23333444','Lorena Viale','f','Sarmiento 988'),
		('26333444','Irma Gonzalez','f','Mariano Moreno 111');
		
INSERT INTO tareas(domicilio,descripcion,horario) 
	VALUES	('Colon 1111','vigilancia exterior','AM'),
		('Urquiza 234','vigilancia exterior','PM'),
		('Peru 345','vigilancia interior','AM'),
		('Avellaneda 890','vigilancia interior','PM');
		
SELECT nombre,t.domicilio,descripcion
	FROM guardias
	CROSS JOIN tareas AS t;
	
SELECT nombre,t.domicilio,descripcion
	FROM guardias AS g
	CROSS JOIN tareas AS t
	WHERE (g.sexo='f' AND t.descripcion='vigilancia interior') OR 	(g.sexo='m' AND t.descripcion='vigilancia exterior');


/** EJERCICIO 69
******************************************************************************/

DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
	nombre VARCHAR(30),
	sexo CHAR(1),
	edad INT,
	domicilio VARCHAR(30)
);

INSERT INTO clientes 
	VALUES	('Maria Lopez','f',45,'Colon 123'),
		('Liliana Garcia','f',35,'Sucre 456'),
		('Susana Lopez','f',41,'Avellaneda 98'),
		('Juan Torres','m',44,'Sarmiento 755'),
		('Marcelo Oliva','m',56,'San Martin 874'),
		('Federico Pereyra','m',38,'Colon 234'),
		('Juan Garcia','m',50,'Peru 333');
		
SELECT cm.nombre,cm.edad,cv.nombre,cv.edad
	FROM clientes AS cm
	CROSS JOIN clientes cv
	WHERE cm.sexo='f' AND cv.sexo='m';
	
SELECT cm.nombre,cm.edad,cv.nombre,cv.edad
	FROM clientes AS cm
	JOIN clientes cv
	ON cm.nombre <> cv.nombre
	WHERE cm.sexo='f' AND cv.sexo='m';
	
SELECT cm.nombre,cm.edad,cv.nombre,cv.edad
	FROM clientes AS cm
	CROSS JOIN clientes cv
	WHERE cm.sexo='f' AND cv.sexo='m' AND cm.edad-cv.edad BETWEEN -5 AND 5;


/** EJERCICIO 70
 ******************************************************************************/

DROP TABLE IF EXISTS equipos;

CREATE TABLE equipos (
	nombre VARCHAR(30),
	barrio VARCHAR(20),
	domicilio VARCHAR(30),
	entrenador VARCHAR(30)
);

INSERT INTO equipos 
	VALUES	('Los tigres','Gral. Paz','Sarmiento 234','Juan Lopez'),
		('Los leones','Centro','Colon 123','Gustavo Fuentes'),
		('Campeones','Pueyrredon','Guemes 346','Carlos Moreno'),
		('Cebollitas','Alberdi','Colon 1234','Luis Duarte');
		
SELECT e1.nombre,e2.nombre,e1.barrio AS sede
	FROM equipos AS e1
	CROSS JOIN equipos AS e2
	WHERE e1.nombre <> e2.nombre;
	
SELECT e1.nombre,e2.nombre,e1.barrio AS sede
	FROM equipos AS e1
	JOIN equipos AS e2
	ON e1.nombre <> e2.nombre;
	
SELECT e1.nombre,e2.nombre,e1.barrio AS sede
	FROM equipos AS e1
	CROSS JOIN equipos AS e2
	WHERE e1.nombre > e2.nombre;


/** EJERCICIO 71
******************************************************************************/

DROP TABLE IF EXISTS visitantes;

CREATE TABLE visitantes (
	nombre VARCHAR(30),
	edad SMALLINT,
	sexo CHAR(1) DEFAULT 'f',
	domicilio VARCHAR(30),
	codigociudad SMALLINT NOT NULL,
	mail VARCHAR(30),
	montocompra DECIMAL (6,2)
);

DROP TABLE IF EXISTS ciudades;

CREATE TABLE ciudades (
	codigo SERIAL,
	nombre VARCHAR(20),
	PRIMARY KEY(codigo)
);

INSERT INTO ciudades(nombre) 
	VALUES	('Cordoba'),
		('Carlos Paz'),
		('La Falda'),
		('Cruz del Eje');

INSERT INTO visitantes 
	VALUES 	('Susana Molina', 35,'f','Colon 123', 1, NULL,59.80),
		('Marcos Torres', 29,'m','Sucre 56', 1, 'marcostorres@hotmail.com',150.50),
		('Mariana Juarez', 45,'f','San Martin 111',2,NULL,23.90),
		('Fabian Perez',36,'m','Avellaneda 213',3,'fabianperez@xaxamail.com',0),
		('Alejandra Garcia',28,'f',NULL,2,NULL,280.50),
		('Gaston Perez',29,'m',NULL,5,'gastonperez1@gmail.com',95.40),
		('Mariana Juarez',33,'f',NULL,2,NULL,90);
 	
SELECT c.nombre,
	COUNT(*) AS cantidad
	FROM ciudades AS c
	JOIN visitantes AS v
	ON codigociudad=c.codigo
	GROUP BY c.nombre;

SELECT c.nombre,sexo,
	AVG(montocompra) AS promediodecompra
	FROM ciudades AS c
	JOIN visitantes AS v
	ON codigociudad=c.codigo
	GROUP BY c.nombre,sexo;

SELECT c.nombre,
	COUNT(mail) AS tienenmail
	FROM ciudades AS c
	JOIN visitantes AS v
	ON codigociudad=c.codigo
	GROUP BY c.nombre;

SELECT c.nombre,
	MAX(montocompra)
	FROM visitantes AS v
	JOIN ciudades AS c
	ON codigociudad=c.codigo
	GROUP BY c.nombre;


/** EJERCICIO 72
******************************************************************************/

DROP TABLE IF EXISTS socios;

CREATE TABLE socios (
	documento CHAR(8) NOT NULL, 
	nombre VARCHAR(30),
	domicilio VARCHAR(30),
	PRIMARY KEY(documento)
);
DROP TABLE IF EXISTS deportes;

CREATE TABLE deportes (
	codigo SERIAL,
	nombre VARCHAR(20),
	profesor VARCHAR(15),
	PRIMARY KEY(codigo)
);
DROP TABLE IF EXISTS inscritos;

CREATE TABLE inscritos (
	documento CHAR(8) NOT NULL, 
	codigodeporte SMALLINT NOT NULL,
	anio CHAR(4),
	matricula CHAR(1),--'s'=paga, 'n'=impaga
	PRIMARY KEY(documento,codigodeporte,anio)
);
INSERT INTO socios 
	VALUES	('22222222','Ana Acosta','Avellaneda 111'),
		('23333333','Betina Bustos','Bulnes 222'),
		('24444444','Carlos Castro','Caseros 333'),
		('25555555','Daniel Duarte','Dinamarca 44');

INSERT INTO deportes(nombre,profesor) 
	VALUES	('basquet','Juan Juarez'),
		('futbol','Pedro Perez'),
		('natacion','Marina Morales'),
		('tenis','Marina Morales');

INSERT INTO inscritos 
	VALUES	('22222222',3,'2006','s'),
		('23333333',3,'2006','s'),
		('24444444',3,'2006','n'),
		('22222222',3,'2005','s'),
		('22222222',3,'2007','n'),
		('24444444',1,'2006','s'),
		('24444444',2,'2006','s'),
		('26666666',0,'2006','s');

SELECT s.nombre,d.nombre,anio
	FROM deportes AS d
	RIGHT JOIN inscritos AS i
	ON codigodeporte=d.codigo
	LEFT JOIN socios AS s
	ON i.documento=s.documento;

SELECT s.nombre,d.nombre,anio,matricula
	FROM deportes AS d
	FULL JOIN inscritos AS i
	ON codigodeporte=d.codigo
	FULL JOIN socios AS s
	ON s.documento=i.documento;

SELECT s.nombre,d.nombre,anio,matricula
	FROM deportes AS d
	JOIN inscritos AS i
	ON codigodeporte=d.codigo
	JOIN socios AS s
	ON s.documento=i.documento
	WHERE s.documento='22222222';


/** EJERCICIO 73
******************************************************************************/

DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
	codigo SERIAL,
	nombre VARCHAR(30),
	domicilio VARCHAR(30),
	ciudad VARCHAR(20),
	codigoprovincia SMALLINT,
	PRIMARY KEY(codigo)
);
DROP TABLE IF EXISTS provincias;

CREATE TABLE provincias (
	codigo SERIAL,
	nombre VARCHAR(20)
);

ALTER TABLE clientes
	ADD CONSTRAINT FK_clientes_codigoprovincia
	FOREIGN KEY (codigoprovincia)
	REFERENCES provincias(codigo);

ALTER TABLE provincias
	ADD CONSTRAINT PK_provincias_codigo
	PRIMARY KEY (codigo);

INSERT INTO provincias VALUES	(1,'Cordoba');
INSERT INTO provincias VALUES	(2,'Santa Fe');
INSERT INTO provincias VALUES	(3,'Misiones');
INSERT INTO provincias VALUES	(4,'Rio Negro');

INSERT INTO clientes(nombre,domicilio,ciudad,codigoprovincia) 
	VALUES	('Perez Juan','San Martin 123','Carlos Paz',1),
		('Moreno Marcos','Colon 234','Rosario',2),
		('Acosta Ana','Avellaneda 333','Posadas',3),
		('Luisa Lopez','Juarez 555','La Plata',6);

ALTER TABLE clientes
	ADD CONSTRAINT FK_clientes_codigoprovincia
	FOREIGN KEY (codigoprovincia)
	REFERENCES provincias(codigo);

DELETE FROM clientes WHERE codigoprovincia=6;

ALTER TABLE clientes
	ADD CONSTRAINT FK_clientes_codigoprovincia
	FOREIGN KEY (codigoprovincia)
	REFERENCES provincias(codigo);

INSERT INTO clientes(nombre,domicilio,ciudad,codigoprovincia) 
	VALUES	('Garcia Marcos','Colon 877','Lules',9);

DELETE FROM provincias WHERE codigo=3;

DELETE FROM provincias WHERE codigo=4;

UPDATE provincias SET codigo=7 WHERE codigo=1;


/** EJERCICIO 74
******************************************************************************/

DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
	codigo INT,
	nombre VARCHAR(30),
	domicilio VARCHAR(30),
	ciudad VARCHAR(20),
	referenciadopor INT,
	PRIMARY KEY(codigo)
);

INSERT INTO clientes 
	VALUES	(50,'Juan Perez','Sucre 123','Cordoba',NULL),
		(90,'Marta Juarez','Colon 345','Carlos Paz',NULL),
		(110,'Fabian Torres','San Martin 987','Cordoba',50),
		(125,'Susana Garcia','Colon 122','Carlos Paz',90),
		(140,'Ana Herrero','Colon 890','Carlos Paz',9);

ALTER TABLE clientes
	ADD CONSTRAINT FK_clientes_referenciadopor FOREIGN KEY (referenciadopor)
	REFERENCES clientes (codigo);

UPDATE clientes SET referenciadopor=90 WHERE referenciadopor=9;

ALTER TABLE clientes
	ADD CONSTRAINT FK_clientes_referenciadopor FOREIGN KEY (referenciadopor)
	REFERENCES clientes (codigo);

INSERT INTO clientes VALUES	(150,'Karina Gomez','Caseros 444','Cruz del Eje',8);

UPDATE clientes SET codigo=180 WHERE codigo=90;

DELETE FROM clientes WHERE nombre='Marta Juarez';

UPDATE clientes SET codigo=180 WHERE codigo=125;

DELETE FROM clientes WHERE codigo=110;


/** EJERCICIO 75
******************************************************************************/

DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
	codigo SERIAL,
	nombre VARCHAR(30),
	domicilio VARCHAR(30),
	ciudad VARCHAR(20),
	codigoprovincia SMALLINT,
	PRIMARY KEY(codigo)
);

DROP TABLE IF EXISTS provincias;

CREATE TABLE provincias (
	codigo SERIAL,
	nombre VARCHAR(20),
	PRIMARY KEY(codigo)
);
INSERT INTO provincias 
	VALUES	(1,'Cordoba'),
		(2,'Santa Fe'),
		(3,'Misiones'),
		(4,'Rio Negro');

INSERT INTO clientes(nombre,domicilio,ciudad,codigoprovincia) 
	VALUES	('Perez Juan','San Martin 123','Carlos Paz',1),
		('Moreno Marcos','Colon 234','Rosario',2),
		('Acosta Ana','Avellaneda 333','Posadas',3);
		
ALTER TABLE clientes
	ADD CONSTRAINT FK_clientes_codigoprovincia
	FOREIGN KEY (codigoprovincia)
	REFERENCES provincias(codigo)
	ON UPDATE casCade
	ON DELETE no action;

DELETE FROM provincias WHERE codigo=3;

UPDATE provincias SET codigo=9 WHERE codigo=3;

SELECT *FROM provincias;

SELECT *FROM clientes;

ALTER TABLE clientes
	ADD CONSTRAINT FK_clientes_codigoprovincia
	FOREIGN KEY (codigoprovincia)
	REFERENCES provincias(codigo)
	ON UPDATE casCade
	ON DELETE casCade;

DROP TABLE provincias;


/** EJERCICIO 76
******************************************************************************/

DROP TABLE IF EXISTS proveedores;

CREATE TABLE proveedores (
	codigo SERIAL,
	nombre VARCHAR (30),
	domicilio VARCHAR(30),
	PRIMARY KEY(codigo)
);

DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
	codigo SERIAL,
	nombre VARCHAR (30),
	domicilio VARCHAR(30),
	PRIMARY KEY(codigo)
);

DROP TABLE IF EXISTS empleados;

CREATE TABLE empleados (
	documento CHAR(8) NOT NULL,
	nombre VARCHAR(20),
	apellido VARCHAR(20),
	domicilio VARCHAR(30),
	PRIMARY KEY(documento)
);

INSERT INTO proveedores(nombre,domicilio) 
	VALUES	('Bebida cola','Colon 123'),
		('Carnes Unica','Caseros 222'),
		('Lacteos Blanca','San Martin 987'),
		('Supermercado Lopez','Avellaneda 34'),
		('Almacen Anita','Colon 987'),
		('Garcia Juan','Sucre 345'),
		('23333333','Federico','Lopez','Colon 987'),
		('28888888','Ana','Marquez','Sucre 333'),
		('30111111','Luis','Perez','Caseros 956');

SELECT nombre, domicilio FROM proveedores
	UNION
	SELECT nombre, domicilio FROM clientes
		UNION
		SELECT (apellido||' '||nombre), domicilio FROM empleados;

SELECT nombre, domicilio, 'proveedor' AS categoria FROM proveedores
	UNION
	SELECT nombre, domicilio, 'cliente' FROM clientes
		UNION
		SELECT (apellido||' '||nombre), domicilio , 'empleado' FROM empleados
			ORDER BY categoria;


/** EJERCICIO 77
******************************************************************************/

DROP TABLE IF EXISTS alumnos;

CREATE TABLE alumnos (
	documento CHAR(8),
	nombre VARCHAR(30),
	nota DECIMAL(4,2),
	PRIMARY KEY(documento)
);

INSERT INTO alumnos 
	VALUES	('30111111','Ana Algarbe',5.1),
		('30222222','Bernardo Bustamante',3.2),
		('30333333','Carolina Conte',4.5),
		('30444444','Diana DoMINguez',9.7),
		('30555555','Fabian Fuentes',8.5),
		('30666666','Gaston Gonzalez',9.70);

SELECT alumnos.*
	FROM alumnos
	WHERE nota=
	(SELECT MAX(nota) FROM alumnos);

SELECT titulo,autor, precio
	FROM libros
	WHERE precio=
	(SELECT titulo, MAX(precio) FROM libros);

SELECT alumnos.*,
	(SELECT AVG(nota) FROM alumnos)-nota AS diferencia
	FROM alumnos
	WHERE nota < 
	(SELECT AVG(nota) FROM alumnos);

UPDATE alumnos SET nota=4
	WHERE nota=
	(SELECT MIN(nota) FROM alumnos);

DELETE FROM alumnos
	WHERE nota < 
	(SELECT AVG(nota) FROM alumnos);


/** EJERCICIO 78
******************************************************************************/

DROP TABLE IF EXISTS ciudades;

CREATE TABLE ciudades (
	codigo SERIAL,
	nombre VARCHAR(20),
	PRIMARY KEY (codigo)
);

DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
	codigo SERIAL,
	nombre VARCHAR(30),
	domicilio VARCHAR(30),
	codigociudad SMALLINT NOT NULL,
	PRIMARY KEY(codigo)
);

INSERT INTO ciudades (nombre) 
	VALUES	('Cordoba'),
		('Cruz del Eje'),
		('Carlos Paz'),
		('La Falda'),
		('Villa Maria');

INSERT INTO clientes(nombre,domicilio,codigociudad) 
	VALUES	('Lopez Marcos','Colon 111',1),
		('Lopez Hector','San Martin 222',1),
		('Perez Ana','San Martin 333',2),
		('Garcia Juan','Rivadavia 444',3),
		('Perez Luis','Sarmiento 555',3),
		('Gomez Ines','San Martin 666',4),
		('Torres Fabiola','Alem 777',5),
		('Garcia Luis','Sucre 888',5);
		
SELECT nombre
	FROM ciudades
	WHERE codigo in
	(SELECT codigociudad
		 FROM clientes
		 WHERE domicilio like 'San Martin %');
		 
SELECT distinct ci.nombre
	FROM ciudades AS ci
	JOIN clientes AS cl
	ON codigociudad=ci.codigo
	WHERE domicilio like 'San Martin%';
	
SELECT nombre
	FROM ciudades
	WHERE codigo NOT in
	(SELECT codigociudad
		 FROM clientes
		 WHERE nombre like 'G%');
		 
SELECT codigociudad
	FROM clientes
	WHERE nombre like 'G%';


/** EJERCICIO 79
******************************************************************************/

DROP TABLE IF EXISTS socios;

CREATE TABLE socios (
	numero SERIAL,
	documento CHAR(8),
	nombre VARCHAR(30),
	domicilio VARCHAR(30),
	PRIMARY KEY (numero)
);

DROP TABLE IF EXISTS inscritos;

CREATE TABLE inscritos (
	numerosocio INT NOT NULL,
	deporte VARCHAR(20) NOT NULL,
	cuotas SMALLINT,
	PRIMARY KEY(numerosocio,deporte)
);

INSERT INTO socios(documento,nombre,domicilio) 
	VALUES	('23333333','Alberto Paredes','Colon 111'),
		('24444444','Carlos Conte','Sarmiento 755'),
		('25555555','Fabian Fuentes','Caseros 987'),
		('26666666','Hector Lopez','Sucre 344');

INSERT INTO inscritos 
	VALUES	(1,'tenis',1),
		(1,'basquet',2),
		(1,'natacion',1),
		(2,'tenis',9),
		(2,'natacion',1),
		(2,'basquet',DEFAULT),
		(2,'futbol',2),
		(3,'tenis',8),
		(3,'basquet',9),
		(3,'natacion',0),
		(4,'basquet',10);

SELECT numero,nombre,deporte
	FROM socios AS s
	JOIN inscritos AS i
	ON numerosocio=numero;

SELECT nombre
	FROM socios
	JOIN inscritos AS i
	ON numero=numerosocio
	WHERE deporte='natacion' AND numero= any
	(SELECT numerosocio
		FROM inscritos AS i
		WHERE deporte='tenis');

SELECT deporte
	FROM inscritos AS i
	WHERE numerosocio=1 AND deporte= any
	(SELECT deporte
		FROM inscritos AS i
		WHERE numerosocio=2);

SELECT i1.deporte
	FROM inscritos AS i1
	JOIN inscritos AS i2
	ON i1.deporte=i2.deporte
	WHERE i1.numerosocio=1 AND i2.numerosocio=2;
SELECT deporte
	FROM inscritos AS i
	WHERE numerosocio=2 AND cuotas > any
	(SELECT cuotas
		FROM inscritos
		WHERE numerosocio=1);

SELECT deporte
	FROM inscritos AS i
	WHERE numerosocio=2 AND cuotas > all
	(SELECT cuotas
		FROM inscritos
		WHERE numerosocio=1);

DELETE FROM inscritos
	WHERE numerosocio=any
	(SELECT numerosocio 
		FROM inscritos
		WHERE cuotas=0);


/** EJERCICIO 80
******************************************************************************/

DROP TABLE IF EXISTS socios;

CREATE TABLE socios (
	numero SERIAL,
	documento CHAR(8),
	nombre VARCHAR(30),
	domicilio VARCHAR(30),
	PRIMARY KEY (numero)
);

DROP TABLE IF EXISTS inscritos;

CREATE TABLE inscritos (
	numerosocio INT NOT NULL,
	deporte VARCHAR(20) NOT NULL,
	cuotas SMALLINT,
	PRIMARY KEY(numerosocio,deporte)
);

INSERT INTO socios(documento,nombre,domicilio) 
	VALUES	('23333333','Alberto Paredes','Colon 111'),
		('24444444','Carlos Conte','Sarmiento 755'),
		('25555555','Fabian Fuentes','Caseros 987'),
		('26666666','Hector Lopez','Sucre 344');

INSERT INTO inscritos 
	VALUES	(1,'tenis',1),
		(1,'basquet',2),
		(1,'natacion',1),
		(2,'tenis',9),
		(2,'natacion',1),
		(2,'basquet',DEFAULT),
		(2,'futbol',2),
		(3,'tenis',8),
		(3,'basquet',9),
		(3,'natacion',0),
		(4,'basquet',10);

SELECT nombre,domicilio,
	(SELECT COUNT(*)
		FROM inscritos AS i
		WHERE s.numero=i.numerosocio) AS deportes
		FROM socios AS s;

SELECT nombre,
	(SELECT (COUNT(*)*10)
		FROM inscritos AS i
		WHERE s.numero=i.numerosocio) AS total,
	(SELECT SUM(i.cuotas)
		FROM inscritos AS i
		WHERE s.numero=i.numerosocio) AS pagas
		FROM socios AS s;

SELECT nombre,
	COUNT(i.deporte)*10 AS total,
	SUM(i.cuotas) AS pagas
	FROM socios AS s
	JOIN inscritos AS i
	ON numero=numerosocio
	GROUP BY nombre;


/** EJERCICIO 81
******************************************************************************/

DROP TABLE IF EXISTS socios;

CREATE TABLE socios (
	numero SERIAL,
	documento CHAR(8),
	nombre VARCHAR(30),
	domicilio VARCHAR(30),
	PRIMARY KEY (numero)
);

DROP TABLE IF EXISTS inscritos;

CREATE TABLE inscritos (
	numerosocio INT NOT NULL,
	deporte VARCHAR(20) NOT NULL,
	cuotas SMALLINT,
	PRIMARY KEY(numerosocio,deporte)
);

INSERT INTO socios(documento,nombre,domicilio) 
	VALUES	('23333333','Alberto Paredes','Colon 111'),
		('24444444','Carlos Conte','Sarmiento 755'),
		('25555555','Fabian Fuentes','Caseros 987'),
		('26666666','Hector Lopez','Sucre 344');

INSERT INTO inscritos 
	VALUES	(1,'tenis',1),
		(1,'basquet',2),
		(1,'natacion',1),
		(2,'tenis',9),
		(2,'natacion',1),
		(2,'basquet',DEFAULT),
		(2,'futbol',2),
		(3,'tenis',8),
		(3,'basquet',9),
		(3,'natacion',0),
		(4,'basquet',10);
		
SELECT nombre
	FROM socios AS s
	WHERE exists
	(SELECT *FROM inscritos AS i
		 WHERE s.numero=i.numerosocio
		 AND i.deporte='natacion');
		 
SELECT nombre
	FROM socios AS s
	WHERE NOT exists
	(SELECT *FROM inscritos AS i
		 WHERE s.numero=i.numerosocio
		 AND i.deporte='natacion');
		 
SELECT s.*
	FROM socios AS s
	WHERE exists
	(SELECT *FROM inscritos AS i
		 WHERE s.numero=i.numerosocio
		 AND i.cuotas=10);


/** EJERCICIO 82
******************************************************************************/

DROP TABLE IF EXISTS deportes;

CREATE TABLE deportes (
	nombre VARCHAR(15),
	profesor VARCHAR(30),
	dia VARCHAR(10),
	cuota DECIMAL(5,2)
);

INSERT INTO deportes 
	VALUES	('tenis','Ana Lopez','lunes',20),
		('natacion','Ana Lopez','martes',15),
		('futbol','Carlos Fuentes','miercoles',10),
		('basquet','Gaston Garcia','jueves',15),
		('padle','Juan Huerta','lunes',15),
		('handball','Juan Huerta','martes',10);
		
SELECT distinct d1.profesor 	FROM deportes AS d1
	WHERE d1.profesor in
	(SELECT d2.profesor 	FROM deportes AS d2 
		WHERE d1.nombre <> d2.nombre);
		
SELECT distinct d1.profesor 	FROM deportes AS d1
	JOIN deportes AS d2
	ON d1.profesor=d2.profesor 	WHERE d1.nombre <> d2.nombre;
	
SELECT nombre
	FROM deportes
	WHERE nombre <> 'natacion' AND dia =
	(SELECT dia
		 FROM deportes
		 WHERE nombre='natacion');
		 
SELECT d1.nombre
	FROM deportes AS d1
	JOIN deportes AS d2
	ON d1.dia=d2.dia
	WHERE d2.nombre='natacion' AND d1.nombre <> d2.nombre;


/** EJERCICIO 83
******************************************************************************/

DROP TABLE IF EXISTS socios;

CREATE TABLE socios (
	documento CHAR(8) NOT NULL, 
	nombre VARCHAR(30),
	domicilio VARCHAR(30),
	PRIMARY KEY(documento)
);

DROP TABLE IF EXISTS deportes;

CREATE TABLE deportes (
	codigo SERIAL,
	nombre VARCHAR(20),
	profesor VARCHAR(15),
	PRIMARY KEY(codigo)
);

DROP TABLE IF EXISTS inscritos;

CREATE TABLE inscritos (
	documento CHAR(8) NOT NULL, 
	codigodeporte SMALLINT NOT NULL,
	anio CHAR(4),
	matricula CHAR(1),--'s'=paga, 'n'=impaga
	PRIMARY KEY(documento,codigodeporte,anio)
);

INSERT INTO socios 
	VALUES	('22222222','Ana Acosta','Avellaneda 111'),
		('23333333','Betina Bustos','Bulnes 222'),
		('24444444','Carlos Castro','Caseros 333'),
		('25555555','Daniel Duarte','Dinamarca 44');

INSERT INTO deportes(nombre,profesor) 
	VALUES	('basquet','Juan Juarez'),
		('futbol','Pedro Perez'),
		('natacion','Marina Morales'),
		('tenis','Marina Morales');

INSERT INTO inscritos 
	VALUES	('22222222',3,'2006','s'),
		('23333333',3,'2006','s'),
		('24444444',3,'2006','n'),
		('22222222',3,'2005','s'),
		('22222222',3,'2007','n'),
		('24444444',1,'2006','s'),
		('24444444',2,'2006','s');

SELECT i.documento,i.codigodeporte,d.nombre AS deporte, anio, matricula, d.profesor 	
	FROM deportes AS d
	JOIN inscritos AS i
	ON d.codigo=i.codigodeporte;

SELECT s.nombre,td.deporte,td.profesor,td.anio,td.matricula
	FROM socios AS s
	JOIN (SELECT i.documento,i.codigodeporte,d.nombre AS deporte, anio, matricula, d.profesor 	
	FROM deportes AS d
	JOIN inscritos AS i
	ON d.codigo=i.codigodeporte) AS td
	ON td.documento=s.documento;


/** EJERCICIO 84
******************************************************************************/

DROP TABLE IF EXISTS socios;

CREATE TABLE socios (
	numero SERIAL,
	documento CHAR(8),
	nombre VARCHAR(30),
	domicilio VARCHAR(30),
	PRIMARY KEY (numero)
);
DROP TABLE IF EXISTS inscritos;

CREATE TABLE inscritos (
	numerosocio INT NOT NULL,
	deporte VARCHAR(20) NOT NULL,
	matricula CHAR(1),-- 'n' o 's'
	PRIMARY KEY(numerosocio,deporte)
);

INSERT INTO socios(documento,nombre,domicilio) 
	VALUES	('23333333','Alberto Paredes','Colon 111'),
		('24444444','Carlos Conte','Sarmiento 755'),
		('25555555','Fabian Fuentes','Caseros 987'),
		('26666666','Hector Lopez','Sucre 344');
		
INSERT INTO inscritos 
	VALUES	(1,'tenis','s'),
		(1,'basquet','s'),
		(1,'natacion','s'),
		(2,'tenis','s'),
		(2,'natacion','s'),
		(2,'basquet','n'),
		(2,'futbol','n'),
		(3,'tenis','s'),
		(3,'basquet','s'),
		(3,'natacion','n'),
		(4,'basquet','n');
		
UPDATE inscritos SET matricula='s'
	WHERE numerosocio=
	(SELECT numero
		 FROM socios
		 WHERE documento='25555555');
		 
DELETE FROM inscritos
	WHERE numerosocio in
	(SELECT numero
		FROM socios AS s
		JOIN inscritos
		ON numerosocio=numero
		WHERE matricula='n');


/** EJERCICIO 85
******************************************************************************/

DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes (
	codigo SERIAL,
	nombre VARCHAR(30),
	domicilio VARCHAR(30),
	PRIMARY KEY(codigo)
);
DROP TABLE IF EXISTS facturas;

CREATE TABLE facturas (
	numero INT NOT NULL,
	fecha DATE,
	codigocliente INT NOT NULL,
	total DECIMAL(6,2),
	PRIMARY KEY(numero)
);
INSERT INTO clientes(nombre,domicilio) 
	VALUES	('Juan Lopez','Colon 123'),
		('Luis Torres','Sucre 987'),
		('Ana Garcia','Sarmiento 576'),
		('Susana Molina','San Martin 555');
INSERT INTO facturas 
	VALUES	(1200,'2007-01-15',1,300),
		(1201,'2007-01-15',2,550),
		(1202,'2007-01-15',3,150),
		(1300,'2007-01-20',1,350),
		(1310,'2007-01-22',3,100);
DROP TABLE IF EXISTS clientespref;

CREATE TABLE clientespref (
	nombre VARCHAR(30),
	domicilio VARCHAR(30)
);

INSERT INTO clientespref
	SELECT nombre,domicilio
		FROM clientes 
		WHERE codigo in 
		(SELECT codigocliente
			 FROM clientes AS c
			 JOIN facturas AS f
			 ON codigocliente=codigo
			 GROUP BY codigocliente
			 HAVING SUM(total) > 500);

SELECT *FROM clientespref;


/** EJERCICIO 86
******************************************************************************/

DROP TABLE IF EXISTS socios;

CREATE TABLE socios (
	documento CHAR(8) NOT NULL,
	nombre VARCHAR(40),
	domicilio VARCHAR(30),
	PRIMARY KEY (documento)
);

DROP TABLE IF EXISTS profesores;

CREATE TABLE profesores (
	documento CHAR(8) NOT NULL,
	nombre VARCHAR(40),
	domicilio VARCHAR(30),
	PRIMARY KEY (documento)
);
DROP TABLE IF EXISTS cursos;

CREATE TABLE cursos (
	numero SERIAL,
	deporte VARCHAR(20),
	dia VARCHAR(15),
	documentoprofesor CHAR(8),
	PRIMARY KEY (numero)
);
DROP TABLE IF EXISTS inscritos;

CREATE TABLE inscritos (
	documentosocio CHAR(8) NOT NULL,
	numero SMALLINT NOT NULL,
	matricula CHAR(1),
	PRIMARY KEY (documentosocio,numero)
);

INSERT INTO socios 
	VALUES	('30000000','Fabian Fuentes','Caseros 987'),
		('31111111','Gaston Garcia','Guemes 65'),
		('32222222','Hector Huerta','Sucre 534'),
		('33333333','Ines Irala','Bulnes 345');
		
INSERT INTO profesores 
	VALUES	('22222222','Ana Acosta','Avellaneda 231'),
		('23333333','Carlos Caseres','Colon 245'),
		('24444444','Daniel Duarte','Sarmiento 987'),
		('25555555','Esteban Lopez','Sucre 1204');
		
INSERT INTO cursos(deporte,dia,documentoprofesor) 
	VALUES	('tenis','lunes','22222222'),
		('tenis','martes','22222222'),
		('natacion','miercoles','22222222'),
		('natacion','jueves','23333333'),
		('natacion','viernes','23333333'),
		('futbol','sabado','24444444'),
		('futbol','lunes','24444444'),
		('basquet','martes','24444444');
		
INSERT INTO inscritos 
	VALUES	('30000000',1,'s'),
		('30000000',3,'n'),
		('30000000',6,NULL),
		('31111111',1,'s'),
		('31111111',4,'s'),
		('32222222',8,'s');
		
CREATE view vista_club as
	SELECT s.nombre AS socio,s.documento AS docsocio,s.domicilio AS domsocio,c.deporte,dia,
	p.nombre AS profesor, matricula
		FROM socios AS s
		FULL JOIN inscritos AS i
		ON s.documento=i.documentosocio
		FULL JOIN cursos AS c
		ON i.numero=c.numero
		FULL JOIN profesores AS p
		ON c.documentoprofesor=p.documento;
		
SELECT *FROM vista_club;

SELECT deporte,dia,COUNT(socio) AS cantidad
	FROM vista_club
	WHERE deporte is NOT NULL
	GROUP BY deporte,dia
	ORDER BY cantidad;
	
SELECT deporte,dia FROM vista_club
	WHERE socio is NULL AND deporte is NOT NULL;
	
SELECT socio FROM vista_club
	WHERE deporte is NULL AND socio is NOT NULL;
	
SELECT profesor FROM vista_club WHERE deporte is NULL AND profesor is NOT NULL;

SELECT socio, docsocio FROM vista_club WHERE deporte is NOT NULL AND matricula <> 's';

SELECT distinct profesor,dia
	FROM vista_club WHERE profesor is NOT NULL;

SELECT distinct profesor,dia
	FROM vista_club WHERE profesor is NOT NULL
	ORDER BY dia;

SELECT socio FROM vista_club
	WHERE deporte='tenis' AND dia='lunes';


/** EJERCICIO 87
******************************************************************************/

CREATE SEQUENCE sec_legajoempleados
	START WITH 100
	MINVALUE 1
	MAXVALUE 999
	INCREMENT BY 2;

DROP TABLE IF EXISTS empleados;

CREATE TABLE empleados (
	legajo bigINT DEFAULT NEXTVAL('sec_legajoempleados'),
	documento CHAR(8) NOT NULL,
	nombre VARCHAR(30) NOT NULL,
	PRIMARY KEY(legajo)
);

INSERT INTO empleados(documento,nombre)
	VALUES	('22333444','Ana Acosta'),
		('23444555','Betina Bustamante'),
		('24555666','Carlos Caseros'),
		('25666777','Diana DoMINguez'),
		('26777888','Estela Esper');

SELECT * FROM empleados;

SELECT * FROM sec_legajoempleados;

DROP SEQUENCE sec_legajoempleados;


/** EJERCICIO 88
 ******************************************************************************/

CREATE SEQUENCE sec_codigoaulainscritos
	START WITH 1
	MINVALUE 1
	MAXVALUE 2
	CYCLE;

DROP TABLE IF EXISTS inscritos;

CREATE TABLE inscritos (
	documento CHAR(8) NOT NULL,
	nombre VARCHAR(30) NOT NULL,
	codigocurso INT DEFAULT NEXTVAL('sec_codigoaulainscritos'),
	PRIMARY KEY(documento)
);
INSERT INTO inscritos(documento,nombre) 
	VALUES	('20000000','Rodriguez Pablo'),
		('30000000','Mercado Ana'),
		('40000000','Morello Luis'),
		('50000000','Prado Juan'),
		('60000000','Solis Maria');

SELECT * FROM inscritos WHERE codigocurso=1;
SELECT * FROM inscritos WHERE codigocurso=2;


/** EJERCICIO 89
******************************************************************************/

DROP TABLE IF EXISTS medicamentos;

CREATE TABLE medicamentos (
	codigo SERIAL,
	nombre VARCHAR(20),
	laboratorio VARCHAR(20),
	precio DECIMAL(5,2),
	cantidad SMALLINT,
	PRIMARY KEY(codigo)
);

INSERT INTO medicamentos (nombre,laboratorio,precio,cantidad)
	VALUES	('Sertal','Roche',5.2,100),
		('Buscapina','Roche',4.10,200),
		('Amoxidal 500','Bayer',15.60,100),
		('Paracetamol 500','Bago',1.90,200),
		('Bayaspirina','Bayer',2.10,150),
		('Amoxidal jarabe','Bayer',5.10,250); 

CREATE OR REPLACE FUNCTION preciopromedio() RETURNS DECIMAL
	as
	'SELECT AVG(precio) FROM medicamentos;'
	LANGUAGE SQL;

SELECT preciopromedio();

SELECT * FROM medicamentos;

SELECT * FROM medicamentos WHERE precio > preciopromedio();


/** EJERCICIO 90
******************************************************************************/

DROP TABLE IF EXISTS medicamentos;

CREATE TABLE medicamentos (
	codigo SERIAL,
	nombre VARCHAR(20),
	laboratorio VARCHAR(20),
	precio DECIMAL(5,2),
	cantidad SMALLINT,
	PRIMARY KEY(codigo)
);

INSERT INTO medicamentos (nombre,laboratorio,precio,cantidad)
	VALUES	('Sertal','Roche',5.2,100),
		('Buscapina','Roche',4.10,200),
		('Amoxidal 500','Bayer',15.60,100),
		('Paracetamol 500','Bago',1.90,200),
		('Bayaspirina','Bayer',2.10,150),
		('Amoxidal jarabe','Bayer',5.10,250); 

CREATE OR REPLACE FUNCTION borrarmedicamento(INTEGER) RETURNS void
	as
		'DELETE FROM medicamentos WHERE codigo=$1;'
	LANGUAGE SQL;

SELECT borrarmedicamento(1);

SELECT * FROM medicamentos;


/** EJERCICIO 91
******************************************************************************/

DROP TABLE IF EXISTS medicamentos;

CREATE TABLE medicamentos (
	codigo SERIAL,
	nombre VARCHAR(20),
	laboratorio VARCHAR(20),
	precio DECIMAL(5,2),
	cantidad SMALLINT,
	PRIMARY KEY(codigo)
);

INSERT INTO medicamentos (nombre,laboratorio,precio,cantidad)
	VALUES	('Sertal','Roche',5.2,100),
		('Buscapina','Roche',4.10,200),
		('Amoxidal 500','Bayer',15.60,100),
		('Paracetamol 500','Bago',1.90,200),
		('Bayaspirina','Bayer',2.10,150); 

INSERT INTO medicamentos (nombre,laboratorio,precio,cantidad)
	VALUES	('Amoxidal jarabe','Bayer',5.10,250); 

CREATE OR REPLACE FUNCTION medicamentomasCaro() RETURNS medicamentos
	as
		'SELECT * FROM medicamentos WHERE precio=(SELECT MAX(precio) FROM medicamentos);'
	LANGUAGE SQL;

SELECT medicamentomasCaro();



