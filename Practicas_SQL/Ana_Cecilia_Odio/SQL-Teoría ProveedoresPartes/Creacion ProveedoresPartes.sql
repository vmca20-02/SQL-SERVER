/* DDL (Data Definition Languaje de la base de Datos*/

use master;
go
drop database dbProveedores;
go
Create database dbProveedores;
go
use dbProveedores;
go
CREATE TABLE  Tproveedor
( 	numeroProv	varchar(5)   	Not Null,
	Nombre		varchar(20) 	Not Null,
	estado		smallint ,
	Ciudad		varchar(15)	Not Null,
	Primary Key ( numeroProv)   )  ;
        

CREATE TABLE  Tpieza
( 	numeroPieza	varchar(5)   	Not Null,
	Nombre		varchar(20) 	Not Null,
	color		varchar(12)      Not Null,
	peso		int ,
	Ciudad		varchar(15),
	Primary Key ( numeroPieza));
        
CREATE TABLE  Tsuministro
( 	numeroProv	varchar(5)   	Not Null , 
	numeroPieza	varchar(5) 	Not Null ,  
	cantidad	int		Not Null,
	Primary Key (numeroProv,numeroPieza),
	Foreign Key(numeroProv) references Tproveedor(numeroProv),
        Foreign key (numeroPieza) references Tpieza(numeroPieza));

/*  Actualización de la base de datos Proveedores/Piezas 
   Sentencias Insert, update y delete*/

Insert into Tproveedor values('S1','Salazar',20,'Londres')
Insert into Tproveedor values('S2','James',  10,'Paris')
Insert into Tproveedor values('S3','Bernal', 30,'Paris')
Insert into Tproveedor values('S4','Corella',10,'Londres')
Insert into Tproveedor values('S5','Alvarez',30,'Atenas')

/* Inclusion de datos en la tabla Tpieza  */

Insert into Tpieza values('P1','Tuerca',  'Rojo',  12,'Londres')
Insert into Tpieza values('P2','Perno',   'Verde', 17,'Paris')
Insert into Tpieza values('P3','Tornillo','Azul',  17,'Roma')
Insert into Tpieza values('P4','Birlo',   'Rojo',  14,'Londres')
Insert into Tpieza values('P5','Leva',    'Azul',  12,'Paris')
Insert into Tpieza values('P6','Engrane', 'Rojo',  19,'Londres')

/*  Inclusión de datos en Tsuministro  */

Insert into Tsuministro values('S1','P1', 300)
Insert into Tsuministro values('S1','P2', 200)
Insert into Tsuministro values('S1','P3', 400)
Insert into Tsuministro values('S1','P4', 200)
Insert into Tsuministro values('S1','P5', 100)
Insert into Tsuministro values('S1','P6', 100)
Insert into Tsuministro values('S2','P1', 300)
Insert into Tsuministro values('S2','P2', 400)
Insert into Tsuministro values('S3','P3', 200)
Insert into Tsuministro values('S4','P2', 200)
Insert into Tsuministro values('S4','P4', 300)
Insert into Tsuministro values('S4','P5', 400)
        


/*SENTENCIAS DE DEFINICIÓN DE DATOS (DDL)


  La proposición Create Database permite crear una base de datos 
  reconocible por el DBMS.
  Antes de crearla se ha incluido la instrucción drop database, la cual se incluye con
  el fin de que si ya la BD existe, se elimine y se vuelva a crear.
  Esta sentencia debe ejecutarse sobre la Base de datos Master,
  ya que esta es la BD madre de todas las BD creadas por el usuario.

  Una vez que se crea una base de datos, es necesario abrirla para 
  trabajar en ella, esto se puede hacer de dos maneras diferentes:
   - Por medio de la sentencia use nombreBasedatos
   - Seleccionándola en el combo que aparece en la barra de herramientas 
     en la parte superior de la pantalla.
  Una vez abierta la base de datos se procede a crear las tablas 
  correspondientes en dicha base. Para crear cada tabla se usa la sentencia
  Create

  En el script anterior, la primer proposición Create crea una tabla vacía llamada Tproveedor
  que contendrá las columnas descritas con el tipo de datos que se indica. 

  La cláusula Not Null indica que en los campos correspondientes
  no se aceptarán valores nulos, es decir, estos campos no se podrán 
  dejar sin asignarles algún valor.
  El atributo estado en esta tabla es el único que permite nulos.

  La cláusula Primary Key, identifica el o los campos que componen 
  la llave primaria de la tabla.

  La cláusula Foreing Key, identifica los campos que son claves foráneas
  y a qué campo(s) de qué tabla hacen referencia.

  ELIMINAR UNA BASE DE DATOS

  Para eliminar la Base de Datos, debe ejecutarse en la BD Master 
  el comando:  

    Drop Database dbProveedores 



 MODIFICACIÓN DE LA ESTRUCTURA DE LAS TABLAS


 Una vez que las tablas se crearon mediante la cláusula CREATE TABLE, 
 éstas se podrán modificar o eliminar mediante las sentencias
 ALTER TABLE  y  DROP TABLE respectivamente


  ALTER  TABLE : Se utiliza para modificar una tabla ya existente.

  Ejemplo: 
	
        ALTER TABLE Tproveedor ADD  descuento INT ;

  Esta instrucción añade una columna descuento a la derecha 
  de la tabla Tproveedor de tipo entero. 

  No se permite el Not Null en Alter Table, ya que la columna agregada 
  contendrá Nulos en todos sus campos en el momento de la creación.

 ELIMINACION DE TABLAS 

 La cláusula DROP TABLE  elimina en cualquier momento una tabla base 
 (siempre que no existan claves ajenas asociadas )

 Ejemplo 
			DROP  TABLE  Tproveedor;

 Eliminará de la base de datos la tabla Tproveedor completamente,
 siempre que no haya claves ajenas asociadas. */


/*LENGUAJE DE MANIPULACION DE DATOS (DML)


Existen 3 operaciones básicas de actualización (DML)  son: 
  - INSERT (inserción de datos)
  - DELETE (borrado de datos)
  - UPDATE (modificación de datos)
 
INSERT :  Permite insertar nuevos registros a la BD.

Ejemplo 1:  Insertar un solo registro  

			INSERT  
			INTO Tpieza ( numeroPieza,   nombre,   color )
			VALUES ( 'P7', 'molde', 'verde' ) ;

Permite insertar un nuevo registro en la tabla de Piezas de manera que
  los atributos:número de pieza, nombre y color registren los
  valores 'P7' , 'molde' y 'verde' respectivamente, y
  asignará nulos en los campos ciudad y peso.  
  Para que esto se ejecute, es necesario que los campos ciudad y peso
  no hayan sido definidos Not Null en la proposición CREATE de la 
  tabla pieza.

 Ejemplo 2:  Insertar un solo registro omitiendo nombres de campo:

			INSERT
			INTO Tpieza
			VALUES ( 'P8', 'Cadena' , 'rojo', 14, 'Niza'); 

   Omitir la lista de los nombres de los campos, es equivalente a 
   especificar una lista con todos los campos de la tabla,es decir, 
   si el registro a insertar contiene todos los campos del registro
   de la tabla, no es obligatorio especificar los nombres de 
   todos los campos.



 UPDATE :  Permite modificar datos de registros ya existentes en la BD.

Ejemplo 1:  (Modificación de un solo registro)

			UPDATE  Tpieza
			SET	color = 'amarillo',
				Peso = Peso + 5,
				Ciudad = Null
			Where   numeroPieza =  'P2';

Cambiará el color , el peso y la ciudad a la pieza P2.

Ejemplo 2: ( Modificación de varios registros)

			UPDATE   Tproveedor
			SET	Estado = 2  *  Estado
			where Ciudad = 'Londres' ;	

Si no utilizamos la cláusula where, se actualizarán todos los registros de la tabla.

DELETE :  Permite eliminar registros existentes en la BD.

Ejemplo 1 : ( Eliminación de un solo registro)

			DELETE    FROM   Tproveedor
			Where   numeroProv  =  'S5' ;

  Se borrará la tupla de la tablaTproveedor donde el número de 
  proveedor sea 'S5’ siempre que dicha acción no viole las reglas de integridad referencial.



Ejemplo2  :  ( Eliminación de varios registros )

			DELETE  FROM  Tsuministro
			where Cantidad > 300 ;

  Se borrarán todas aquellas tuplas de la tabla de Proveedores y Piezas que 
  tengan una cantidad mayor a 300.

Ejemplo 3:  ( Eliminación de todos los registros )

			DELETE  FROM   Tsuministro;

  Borrará todas las tuplas de la tabla Tsuministro, ya que no 
  se indicó una condición para la eliminación de registros.  
  Esta operación no es lo mismo que decir  Drop Table  Tsuministro;
  ya que en el caso del DELETE, la tabla Tsuministro permanece 
  existiendo pero está vacía. 

*/
  



