---TIENDA DE INFORMATICA---

---1.1.Obtener los nombres de los productos de la tienda.

SELECT Nombre
FROM ARTICULOS 

---1.2.Obtener los nombres y los precios de los productos de la tienda.

SELECT Nombre,Precio
FROM ARTICULOS 

---1.3.Obtener el nombre de los productos cuyo precio sea menoro igual a 200.

SELECT Nombre
FROM ARTICULOS
WHERE precio<=200 

--1.4.Obtener todos los datos de los artıculos cuyo precio este entre los 60 y los 120(ambas cantidades incluidas).

--VERSION A

SELECT Nombre
FROM ARTICULOS
WHERE precio BETWEEN 60 AND 120

--VERSION B

SELECT Nombre
FROM ARTICULOS
WHERE precio>=60 AND precio<=120

---1.5.Obtener el nombre y el precio en pesetas(es decir,el precio en euros multiplicado por 166’386)

SELECT Nombre,(Precio*166.386) AS Precio
FROM ARTICULOS

---1.6.Seleccionar el precio medio de todos los productos.

SELECT AVG(Precio) AS 'Promedio'
FROM ARTICULOS

---1.7.Obtener el precio medio de los artıculos cuyo codigo de fabricante sea 2.

SELECT AVG(Precio) AS 'Promedio'
FROM ARTICULOS
WHERE fabricante=2

---1.8.Obtener el numero de artıculos cuyo precio sea mayor o igual a 180

SELECT COUNT(*) AS CAN_ART
FROM  ARTICULOS
WHERE precio>=180

--1.9.Obtener el nombre y precio de los artıculos cuyo precio sea mayor o igual a 180
--y ordenarlos descendentemente por precio,y luego ascendentemente por nombre.

SELECT nombre,Precio
FROM ARTICULOS
WHERE precio>=180
ORDER BY precio DESC,nombre ASC

--1.10.Obtener un listado completo de artıculos,incluyendo por cada articulo los datos
--del articulo y de su fabricante.

---VERSION A
SELECT *
FROM ARTICULOS art,FABRICANTES fab 
WHERE art.Fabricante=fab.Codigo

---VERSION B
SELECT *
FROM ARTICULOS art INNER JOIN FABRICANTES fab ON art.Fabricante=fab.Codigo

--1.11.Obtener un listado de artıculos,incluyendo el nombre del artıculo,su precio,y el
--nombre de su fabricante.

SELECT art.Nombre,art.Precio,fab.Nombre
FROM ARTICULOS art,FABRICANTES fab 
WHERE art.Fabricante=fab.Codigo

--1.12.Obtener el precio medio de los productos de cada fabricante,mostrando solo los
--codigos de fabricante.

SELECT Fabricante,AVG(Precio) AS Promedio
FROM ARTICULOS
GROUP BY Fabricante

---IMPORTANTE---
--1.13.Obtener el precio medio de los productos del fabricante.

SELECT AVG(art.Precio) AS Promedio,art.Nombre
FROM ARTICULOS art,FABRICANTES fab 
WHERE art.Fabricante=fab.Codigo
GROUP BY art.Nombre


---IMPORTANTE---
--1.14.Obtener los nombres de los fabricantes que ofrezcan productos cuyo precio medio
--sea mayor o igual a 150.[SYS]

---VERSION A---
SELECT fab.Nombre,AVG(art.Precio) AS Promedio
FROM ARTICULOS art,FABRICANTES fab 
WHERE art.Fabricante=fab.Codigo
GROUP by fab.Nombre
HAVING AVG(art.Precio)>=150


---VERSION B---
SELECT tblArticulos.Nombre,tblArticulos.Promedio
FROM
(SELECT fab.Nombre,AVG(art.Precio) AS Promedio
FROM ARTICULOS art,FABRICANTES fab 
WHERE art.Fabricante=fab.Codigo
GROUP by fab.Nombre) tblArticulos
WHERE tblArticulos.Promedio>=150

---IMPORTANTE---
--1.15.Obtener el nombre y precio del artıculo mas barato

SELECT Nombre,Precio
FROM ARTICULOS
WHERE Precio=(SELECT MIN(Precio)
              FROM ARTICULOS)
	
---IMPORTANTE---		  
---1.16.Obtener una lista con el nombre y precio de los artıculos mas caros de cada 
--proveedor(incluyendo el nombre del proveedor).

---LOS FABRICANTES QUE APORTAN UNA PIEZA---

---VERSION A---
SELECT fab.Nombre,art.Nombre,art.Precio
FROM ARTICULOS art,FABRICANTES fab 
WHERE art.Fabricante=fab.Codigo AND art.Precio=(SELECT MAX(SubArt.Precio)
                                                FROM ARTICULOS SubArt
                                                WHERE SubArt.Fabricante=fab.Codigo)
---VERSION B---
SELECT fab.Nombre,art.Nombre,art.Precio
FROM ARTICULOS art INNER JOIN FABRICANTES fab 
     ON art.Fabricante=fab.Codigo 
WHERE art.Precio=(SELECT MAX(SubArt.Precio)
                  FROM ARTICULOS SubArt
                  WHERE SubArt.Fabricante=fab.Codigo)


---1.17.Insertar un nuevo producto:Altavoces de 70 (del fabricante 2)

INSERT INTO ARTICULOS VALUES(13,'Altavoces',70,2);

---1.18.Cambiar el nombre del producto 8 'Impresora Laser'

UPDATE ARTICULOS 
SET Nombre='Impresora Laser'
WHERE Codigo=8

---1.19.Aplicar un descuento del 10%(multiplicar el precio por 0.9) a todos los productos.

UPDATE ARTICULOS
SET Precio=(Precio*0.9)

---1.20.Aplicar un descuentode 10 a todos los productos cuyo precio sea mayor o igual a 120.

UPDATE ARTICULOS
SET Precio=(Precio-10)
WHERE  Precio>=120


---EMPLEADOS---

---2.1.Obtener los apellidos de los empleados.

SELECT Apellidos
FROM EMPLEADOS

---2.2.Obtener los apellidos de los empleados sin repeticiones.

SELECT DISTINCT(Apellidos)
FROM EMPLEADOS

---2.3.Obtener todos los datos de los empleados que se apellidan 'Lopez'.

SELECT *
FROM EMPLEADOS
WHERE Apellidos='Lopez'

---2.4.Obtener todos los datos de los empleados que se apellidan 'Lopez' y los que se apellidan 'Perez'.

SELECT *
FROM EMPLEADOS
WHERE Apellidos='Lopez' OR Apellidos='Perez'


---2.5.Obtener todos los datos de los empleados que trabajan para el departamento 14.

SELECT *
FROM EMPLEADOS
WHERE departamento=14

---2.6.Obtener todos los datos de los empleados que trabajan para el departamento 37 y para el departamento 77.

SELECT *
FROM EMPLEADOS
WHERE departamento=37 OR departamento=77 


---2.7.Obtener todos los datos de los empleados cuyo apellido comience por 'P'.

SELECT *
FROM EMPLEADOS
WHERE Apellidos LIKE 'P%'

---2.8.Obtener el presupuesto total de todos los departamentos.

SELECT SUM(Presupuesto) AS 'Presupuesto'
FROM DEPARTAMENTOS


---IMPORTANTE---
---2.9.Obtener el numero de empleados en cada departamento.

---VERSION A---
SELECT Depart.Codigo,Depart.Nombre,COUNT(Emple.DNI) AS [Cantidad_Empleados]
FROM DEPARTAMENTOS Depart INNER JOIN EMPLEADOS Emple ON Depart.Codigo=Emple.Departamento
GROUP BY Depart.Codigo,Depart.Nombre

---VERSION B---
SELECT Departamento,COUNT(*)
FROM EMPLEADOS
GROUP BY Departamento

---2.10.Obtener un listado completo de empleados,incluyendo por cada empleado los datos
---     del empleado y de su departamento.

SELECT Emple.Nombre+' '+Emple.Apellidos AS Empleado,Depart.Nombre AS Departamento
FROM DEPARTAMENTOS Depart INNER JOIN EMPLEADOS Emple ON Depart.Codigo=Emple.Departamento


--2.11.Obtener un listado completo de empleados,incluyendo el nombre y apellidos del
--     empleado junto al nombre y presupuesto de su departamento.

SELECT Emple.Nombre+' '+Emple.Apellidos AS Empleado,Depart.Nombre AS Departamento,Depart.Presupuesto
FROM DEPARTAMENTOS Depart INNER JOIN EMPLEADOS Emple ON Depart.Codigo=Emple.Departamento


--2.12.Obtener los nombres y apellidos de los empleados que trabajen en departamentos
--     cuyo presupuestos sea mayor de 60.000.

--Sin subconsulta--

SELECT Emple.Nombre+' '+Emple.Apellidos AS Empleado,Depart.Nombre AS Departamento,Depart.Presupuesto
FROM DEPARTAMENTOS Depart INNER JOIN EMPLEADOS Emple ON Depart.Codigo=Emple.Departamento
WHERE Depart.Presupuesto>60000

--Con subconsulta--

---IMPORTANTE---
--2.13.Obtener los datos de los departamentos cuyo presupuesto es superior al presupuesto medio de todos los departamentos.

SELECT *
FROM DEPARTAMENTOS
WHERE Presupuesto>(SELECT AVG(Presupuesto)
                   FROM DEPARTAMENTOS)


---IMPORTANTE---
--2.14.Obtener los nombres(unicamente los nombres) de los departamentos que tienen mas de dos empleados.

SELECT Depart.Codigo,Depart.Nombre,COUNT(Emple.DNI) AS [Cantidad_Empleados]
FROM DEPARTAMENTOS Depart INNER JOIN EMPLEADOS Emple ON Depart.Codigo=Emple.Departamento
GROUP BY Depart.Codigo,Depart.Nombre
HAVING COUNT(Emple.DNI)>2

--2.15.Anadir un nuevo departamento:'Calidad',con presupuesto de 40.000 y codigo 11
--Anadir un empleado vinculado al departamento recien creado:Esther Vazquez,DNI:89267109

INSERT INTO DEPARTAMENTOS VALUES(11,'Calidad',40.000);

INSERT INTO EMPLEADOS VALUES('89267109','Esther','Vazquez',11);

---2.16.Aplicar un recorte presupuestario del 10% a todos los departamentos.

UPDATE DEPARTAMENTOS 
SET Presupuesto=(Presupuesto*0.9)


---IMPORTANTE---
--2.17.Reasignar a los empleados del departamento de investigacion(codigo 77) al depar-
--tamento de informatica (codigo 14).

UPDATE EMPLEADOS
SET Departamento=14
WHERE Departamento=77

---IMPORTANTE---
--2.18.Despedir a todos los empleados que trabajan para el departamento de informatica(codigo 14).

---VERSION A(No Elimino la informacion del empleado)---
UPDATE EMPLEADOS
SET Departamento=NULL
WHERE Departamento=14;

---VERSION B(Elimino la informacion del empleado)---
DELETE FROM EMPLEADOS
WHERE Departamento=14

---IMPORTANTE---
---2.19.Despedir a todos los empleados que trabajen para departamentos cuyo presupuesto sea superior a los 60.000.

DELETE FROM EMPLEADOS
WHERE Departamento IN(SELECT Codigo
                      FROM DEPARTAMENTOS
                      WHERE Presupuesto>60.000)

---2.20.Despedir a todos los empleados.

DELETE FROM EMPLEADOS




---LOS ALMACENES---

---3.1.Obtener todos los almacenes

SELECT *
FROM ALMACENES

---3.2.Obtener todas las cajas cuyo contenido tenga un valor superior a 150

SELECT *
FROM CAJAS
WHERE Valor>150

---3.3.Obtener los tipos de contenidos de las cajas.

SELECT DISTINCT(Contenido)
FROM CAJAS

---3.4.Obtener el valor medio de todas las cajas.

SELECT AVG(Valor) AS Promedio
FROM CAJAS

---3.5.Obtener el valor medio de las cajas de cada almacen.

SELECT Almacen,AVG(Valor) AS Promedio
FROM CAJAS
GROUP BY Almacen


---IMPORTANTE---
---3.6.Obtener los codigos de los almacenes en los cuales el valor medio de las cajas sea superior a 150.

SELECT Almacen,AVG(Valor) AS [Promedio]
FROM CAJAS
GROUP BY Almacen
HAVING AVG(Valor)>150

--3.7.Obtener el numero de referencia de cada caja junto con el nombre de la ciudad en la que se encuentra

SELECT caj.NumReferencia,alm.Lugar
FROM CAJAS caj,ALMACENES alm
WHERE caj.Almacen=alm.Codigo

---IMPORTANTE---
---3.8.Obtener el numero de cajas que hay en cada almacen.

---VERSION A---
SELECT alm.Lugar,COUNT(caj.NumReferencia) AS CantCajas
FROM CAJAS caj,ALMACENES alm
WHERE caj.Almacen=alm.Codigo
GROUP BY alm.Lugar

---VERSION B---
SELECT alm.Lugar,COUNT(caj.NumReferencia) AS CantCajas
FROM CAJAS caj INNER JOIN ALMACENES alm ON caj.Almacen=alm.Codigo
GROUP BY alm.Lugar

---VERSION C (Tomar en cuenta los almacenes que no tienen cajas asignadas)---
SELECT alm.Lugar,COUNT(caj.NumReferencia) AS CantCajas
FROM ALMACENES alm LEFT JOIN CAJAS caj  ON caj.Almacen=alm.Codigo
GROUP BY alm.Lugar

---OJO SUPER IMPORTANTE---
--3.9.Obtener los codigos de los almacenes que estan saturados (los almacenes donde el numero de cajas es superior a la capacidad).

---REVISAR BIEN ESTAS 2 SOLUCIONES CONTRA BASTANTES DATOS---

SELECT alm.Codigo,COUNT(caj.NumReferencia) AS CantCajas,SUM(alm.Capacidad) AS Capacidad
FROM ALMACENES alm LEFT JOIN CAJAS caj  ON caj.Almacen=alm.Codigo
GROUP BY alm.Codigo
HAVING SUM(alm.Capacidad)<COUNT(caj.NumReferencia) 


SELECT alm.Codigo,alm.Lugar,COUNT(caj.NumReferencia) AS CantCajas
FROM CAJAS caj INNER JOIN ALMACENES alm ON caj.Almacen=alm.Codigo
GROUP BY alm.Codigo,alm.Lugar
HAVING COUNT(caj.NumReferencia)>(SELECT Capacidad
                                 FROM ALMACENES
                                 WHERE Codigo=alm.Codigo)


SELECT caj.Almacen,COUNT(caj.NumReferencia) AS [Cantidad]
FROM CAJAS caj
GROUP BY caj.Almacen
HAVING COUNT(caj.NumReferencia)>(SELECT Capacidad
                                 FROM ALMACENES
							     WHERE Codigo=caj.Almacen)

---3.10.Obtener los numeros de referencia de las cajas que estan en Bilbao.

SELECT caj.NumReferencia 
FROM CAJAS caj INNER JOIN ALMACENES alm ON caj.Almacen=alm.Codigo
WHERE alm.Lugar='Bilbao'

---3.11.Insertar un nuevo almacen en Barcelona con capacidad para 3 cajas.

INSERT INTO ALMACENES VALUES(5,'Barcelona',3);


---3.12.Insertar una nueva caja,con numero de referencia 'H5RT',con contenido 'Papel', valor 200, y situada en el almacen 2.

INSERT INTO CAJAS VALUES('H5RT','Papel',200,1);

---3.13.Rebajar el valor de todas las cajas un 15%.

UPDATE CAJAS SET Valor=Valor-(Valor*0.85)

--3.14.Rebajar un 20% el valor de todas las cajas cuyo valor sea superior al valor medio de todas las cajas.

UPDATE CAJAS 
SET Valor=Valor-(Valor*0.2)
WHERE valor> (SELECT AVG(valor)
              FROM CAJAS)

---3.15.Eliminar todas las cajas cuyo valor sea inferior a 100

DELETE
FROM CAJAS
WHERE valor<100


---IMPORTANTE---
---3.16.Vaciar el contenido de los almacenes que estan saturados.

DELETE FROM CAJAS
WHERE Almacen IN(SELECT caj.Almacen
				 FROM CAJAS caj
				 GROUP BY caj.Almacen
				 HAVING COUNT(caj.NumReferencia)>(SELECT Capacidad
												  FROM ALMACENES
												  WHERE Codigo=caj.Almacen))


---PELICULAS Y SALAS---

---4.1.Mostrar el nombre de todas las pelıculas.

SELECT Nombre
FROM PELICULAS

---4.2.Mostrar las distintas caliﬁcaciones de edad que existen.

SELECT DISTINCT(CalificacionEdad)
FROM PELICULAS

---IMPORTANTE---
---4.3.Mostrar todas las pelıculas que no han sido caliﬁcadas.

SELECT *
FROM PELICULAS
WHERE CalificacionEdad IS NULL

---IMPORTANTE---
---4.4.Mostrar todas las salas que no proyectan ninguna pelıcula.

SELECT *
FROM SALAS
WHERE Pelicula IS NULL

---IMPORTANTE---
--4.5.Mostrar la informacion de todas las salas y,si se proyecta alguna pelıcula en la
--    sala,mostrar tambien la informacion de la pelıcula.

SELECT sal.Codigo,sal.Nombre AS Sala,pel.Nombre AS Pelicula,pel.CalificacionEdad AS Calificacion
FROM SALAS sal LEFT JOIN PELICULAS pel ON sal.Pelicula=pel.Codigo

---IMPORTANTE---
--4.6.Mostrar la informacion de todas las pelıculas y,si se proyecta en alguna sala,
--    mostrar tambien la informacion de la sala.

SELECT pel.Nombre AS Pelicula,pel.CalificacionEdad AS Calificacion,sal.Codigo,sal.Nombre AS Sala
FROM SALAS sal RIGHT JOIN PELICULAS pel ON sal.Pelicula=pel.Codigo

---IMPORTANTE---
--4.7.Mostrar los nombres de las pelıculas que no se proyectan en ninguna sala.

---Con JOIN---
SELECT pel.Nombre AS Pelicula,pel.CalificacionEdad AS Calificacion,sal.Codigo,sal.Nombre AS Sala
FROM SALAS sal RIGHT JOIN PELICULAS pel ON sal.Pelicula=pel.Codigo
WHERE sal.Codigo IS NULL

---4.8.Anadir una nueva pelıcula 'Uno,Dos,Tres',para mayores de 7 anios.

INSERT INTO PELICULAS VALUES(8,'Uno,Dos,Tres',7);

---IMPORTANTE---
---4.9.Hacer constar que todas las pelıculas no caliﬁcadas han sido caliﬁcadas 'no reco-mendables para menores de 13 anios'.

INSERT INTO PELICULAS VALUES(9,'Mad Max',NULL);

---APLICAR UN UPDATE---
UPDATE PELICULAS 
SET Calificacion Edad=13 
WHERE Calificacion Edad IS NULL


---INDICAR MEDIANTE SELECT---
SELECT Codigo,Nombre,CASE WHEN CalificacionEdad IS NULL THEN 'No recomendable para menores de 13' ELSE CONVERT(VARCHAR(10),CalificacionEdad) END AS 'Calificacion'
FROM PELICULAS

---IMPORTANTE---
---4.10.Eliminar todas las salas que proyectan pelıculas recomendadas para todos los publicos.

---CON JOINS---
DELETE sal
FROM SALAS sal INNER JOIN PELICULAS pel ON sal.Pelicula=pel.Codigo
WHERE pel.CalificacionEdad<18

---CON SUBCONSULTA---


---LOS DIRECTORES---

---5.1.Mostrar el DNI,nombre y apellidos de todos los directores.

SELECT DNI,NomApels
FROM DIRECTORES

---IMPORTANTE---
---5.2.Mostrar los datos de los directores que no tienen jefes.

SELECT *
FROM DIRECTORES
WHERE DNIJefe IS NULL


--5.3.Mostrar el nombre y apellidos de cada director,junto con la capacidad del despacho
--    en el que se encuentra.

SELECT direct.DNI,direct.NomApels,desp.Capacidad
FROM DIRECTORES direct INNER JOIN DESPACHOS desp ON direct.Despacho=desp.Numero

---IMPORTANTE---
---5.4.Mostrar el numero de directores que hay en cada despacho.

---SIN TENER EN CUENTA DESPACHOS VACIOS---
SELECT Despacho,COUNT(DNI) AS [Cant_Directores]
FROM DIRECTORES
GROUP BY Despacho

---TENIENDO EN CUENTA DESPACHOS VACIOS---

SELECT desp.Numero AS [Despacho],COUNT(direc.DNI) AS [Cant_Directores]
FROM DIRECTORES direc RIGHT JOIN DESPACHOS desp ON direc.Despacho=desp.Numero
GROUP BY desp.Numero


---IMPORTANTE---
---5.5.Mostrar los datos de los directores cuyos jefes no tienen jefes.

---SIN SUB-CONSULTA---
SELECT direct.DNI,direct.NomApels,jef.DNI,jef.NomApels
FROM DIRECTORES direct INNER JOIN DIRECTORES jef ON direct.DNIJefe=jef.DNI
WHERE jef.DNIJefe IS NULL

---USANDO UNA SUB-CONSULTA---
SELECT * FROM DIRECTORES
WHERE DNIJefe IN (SELECT DNI 
                  FROM DIRECTORES 
				  WHERE DNIJefe IS NULL)

---IMPORTANTE---
---5.6.Mostrar los nombres y apellidos de los directores junto con los de su jefe.

---NO MOSTRAR DIRECTORES QUE NO TENGAN JEFES---
SELECT direct.DNI,direct.NomApels,jef.DNI+'-'+jef.NomApels AS [Jefe Encargado]
FROM DIRECTORES direct INNER JOIN DIRECTORES jef ON direct.DNIJefe=jef.DNI


---MOSTRAR DIRECTORES AUN CUANDO NO TENGAN JEFES---

---IMPORTANTE---
---5.7.Mostrar el numero de despachos que estan sobreutilizados.

---USANDO SUB-CONSULTA---

---VERSION A---
SELECT direct.Despacho,COUNT(direct.DNI)
FROM  DIRECTORES direct
GROUP BY direct.Despacho
HAVING COUNT(direct.DNI)>(SELECT desp.Capacidad
                          FROM DESPACHOS desp
				          WHERE desp.Numero=direct.Despacho)

---VERSION B---
SELECT Numero
FROM DESPACHOS
WHERE Capacidad<(SELECT COUNT(*)
                 FROM DIRECTORES
                 WHERE Despacho=Numero)

---5.8.Anadir un nuevo director llamado Paco Perez,DNI 28301700,sin jefe,y situado en el despacho 2.

INSERT INTO DIRECTORES VALUES('28301700','Paco Perez',NULL,2);


---IMPORTANTE---
--5.9.Asignar a todos los empleados apellidados Perez un nuevo jefe con DNI 74568521.

UPDATE DIRECTORES 
SET DNIJefe='74568521'
WHERE NomApels LIKE '%Perez%'

---IMPORTANTE---
---5.10.Despedir a todos los directores,excepto a los que no tienen jefe.

DELETE Direc
FROM DIRECTORES Direc
WHERE Direc.DNIJefe IS NULL


---PIEZAS Y PROVEEDORES---

---6.1.Obtener los nombres de todas las piezas.

SELECT Nombre
FROM PIEZAS

---6.2.Obtener todos los datos de todos los proveedores.

SELECT *
FROM PROVEEDORES

---6.3.Obtener el precio medio al que se nos suministran las piezas.

SELECT CodigoPieza,AVG(Precio)
FROM SUMINISTRA
GROUP BY CodigoPieza

---IMPORTANTE---
---6.4.Obtener los nombres de los proveedores que suministran la pieza 1.

---SIN SUB-CONSULTA---
SELECT Prov.Nombre
FROM SUMINISTRA Sumnis INNER JOIN PROVEEDORES Prov ON Sumnis.IdProveedor=Prov.Id
WHERE Sumnis.CodigoPieza=1


---CON SUB-CONSULTA---
SELECT Prov.Nombre
FROM PROVEEDORES Prov 
WHERE Prov.Id IN(SELECT Sumnis.IdProveedor
                 FROM SUMINISTRA Sumnis
				 WHERE Sumnis.CodigoPieza=1)


---6.5.Obtener los nombres de las piezas suministradas por el proveedor cuyo codigo es HAL.

---SIN SUB-CONSULTA---
SELECT Piez.Nombre 
FROM SUMINISTRA Sumnis INNER JOIN PIEZAS Piez ON Sumnis.CodigoPieza=Piez.Codigo
WHERE Sumnis.IdProveedor='HAL'


---CON SUB-CONSULTA---
SELECT Piez.Nombre 
FROM PIEZAS Piez 
WHERE Piez.Codigo IN (SELECT Sumnis.CodigoPieza
                      FROM SUMINISTRA Sumnis 
					  WHERE Sumnis.IdProveedor='HAL')


---CON SUB-CONSULTA EXISTS---

---IMPORTANTE(PREGUNTAR ESTO EN FOROS!!! SOLO PARA VERIFICAR EL RENDIMIENTO)---
--6.6.Obtener los nombres de los proveedores que suministran las piezas mas caras,
--    indicando el nombre de la pieza y el precio al que la suministran.

---OJO LA PIEZA MAS CARA POR PROVEEDOR---
SELECT Prov.Id,Prov.Nombre,Piez.Nombre,Sumnis.Precio
FROM SUMINISTRA Sumnis INNER JOIN PIEZAS Piez ON Sumnis.CodigoPieza=Piez.Codigo 
     INNER JOIN PROVEEDORES Prov ON Sumnis.IdProveedor=Prov.Id
WHERE Sumnis.Precio=(SELECT MAX(subSuministra.Precio)
                     FROM SUMINISTRA subSuministra
					 WHERE subSuministra.IdProveedor=Prov.Id)
ORDER BY Prov.Id

---ANALIZAR ESTA QUERY---
SELECT p1.Nombre,pr1.Nombre,Precio
FROM PIEZAS p1 INNER JOIN
(SUMINISTRA s1 INNER JOIN PROVEEDORES pr1
 ON s1.IdProveedor=pr1.Id) ON p1.Codigo=s1.CodigoPieza
WHERE Precio IN(SELECT MAX(Precio)
                FROM SUMINISTRA s2
                GROUP BY s2.CodigoPieza
                HAVING s2.CodigoPieza=p1.Codigo)


--6.7.Hacer constar en la base de datos que la empresa 'Skellington Supplies'(codigo TNBC)
--    va a empezar a suministrarnos tuercas(codigo 1) a 7 pesetas cada tuerca.

INSERT INTO PROVEEDORES VALUES('TNBC','Skellington Supplies');

INSERT INTO SUMINISTRA VALUES(1,'TNBC',7);

---6.8.Aumentar los precios en una unidad.

UPDATE SUMINISTRA
SET Precio=Precio+1;

--6.9.Hacer constar en la base de datos que la empresa 'Susan Calvin Corp.'(RBT) no
--    va a suministrarnos ninguna pieza(aunque la empresa en sı va a seguir constando en nuestra base de datos).

INSERT INTO PROVEEDORES VALUES('RBT','Susan Calvin Corp');

--6.10.Hacer constar en la base de datos que la empresa 'Susan Calvin Corp.'(RBT)ya no va a suministrarnos clavos(codigo 4)

DELETE 
FROM SUMINISTRA
WHERE IdProveedor='RBT' AND CodigoPieza=4


---LOS CIENTIFICOS---

---IMPORTANTE---
--7.1.Sacar una relacion completa de los cientıﬁcos asignados a cada proyecto.Mostrar
--    DNI,Nombre del cientıﬁco,Identiﬁcador del proyecto y nombre del proyecto.

---USANDO JOIN---
SELECT cient.DNI,cient.NomApels,proyect.Id,proyect.Nombre
FROM CIENTIFICOS cient INNER JOIN  ASIGNADO_A asign ON cient.DNI=asign.Cientifico 
     INNER JOIN PROYECTO proyect ON asign.Proyecto=proyect.Id

---SIN USAR JOIN---

---IMPORTANTE---
--7.2.Obtener el numero de proyectos al que esta asignado cada cientıﬁco(mostrar el DNI y el nombre).

---TOMAR EN CUENTA TODOS LOS CIENTIFICOS---
SELECT cient.DNI,cient.NomApels,COUNT(asign.Proyecto) AS 'Proyectos en los que trabaja'
FROM CIENTIFICOS cient INNER JOIN ASIGNADO_A asign ON cient.DNI=asign.Cientifico 
GROUP BY cient.DNI,cient.NomApels

---TOMAR EN CUENTA TODOS LOS CIENTIFICOS,SIN TOMAR EN CUENTA SI TIENEN PROYECTOS ASIGNADOS---
SELECT cient.DNI,cient.NomApels,COUNT(asign.Proyecto) AS 'Proyectos en los que trabaja'
FROM CIENTIFICOS cient LEFT JOIN ASIGNADO_A asign ON cient.DNI=asign.Cientifico 
GROUP BY cient.DNI,cient.NomApels

---IMPORTANTE---
--7.3.Obtener el numero de cientıﬁcos asignados a cada proyecto(mostrar el identiﬁcador de proyecto y el nombre del proyecto).

---TOMAR EN CUENTA LOS PROYECTOS CON CIENTIFICOS ASOCIADOS---
SELECT proyec.Id,proyec.Nombre,COUNT(asign.Cientifico) AS 'Cientificos en el proyecto'
FROM PROYECTO proyec INNER JOIN ASIGNADO_A asign ON proyec.Id=asign.Proyecto
GROUP BY proyec.Id,proyec.Nombre

---TOMAR EN CUENTA TODOS LOS PROYECTOS---
SELECT proyec.Id,proyec.Nombre,COUNT(asign.Cientifico) AS 'Cientificos en el proyecto'
FROM PROYECTO proyec LEFT JOIN ASIGNADO_A asign ON proyec.Id=asign.Proyecto
GROUP BY proyec.Id,proyec.Nombre

---IMPORTANTE---
---7.4.Obtener el numero de horas de dedicacion de cada cientiﬁco.

---TOMAR EN CUENTA TODOS LOS CIENTIFICOS---
SELECT cient.DNI,cient.NomApels,SUM(proyect.Horas) AS [Total Horas]
FROM CIENTIFICOS cient LEFT JOIN (ASIGNADO_A asign INNER JOIN PROYECTO proyect ON proyect.Id=asign.Proyecto)
     ON cient.DNI=asign.Cientifico 
GROUP BY cient.DNI,cient.NomApels

---TOMAR EN CUENTA SOLO LOS CIENTIFICOS QUE APORTAN HORAS EN ALGUN PROYECTO---
SELECT cient.DNI,cient.NomApels,SUM(proyect.Horas) AS [Total Horas]
FROM CIENTIFICOS cient INNER JOIN (ASIGNADO_A asign INNER JOIN PROYECTO proyect ON proyect.Id=asign.Proyecto)
     ON cient.DNI=asign.Cientifico 
GROUP BY cient.DNI,cient.NomApels

---IMPORTANTE(VERIFICAR OPTIMIZACION PARA ESTE TIPO DE CONSULTAS)---
--7.5.Obtener el DNI y nombre de los cientıﬁcos que se dedican a mas de un proyecto y
--    cuya dedicacion media a cada proyecto sea superior a las 80 horas.

---CON INNER JOIN---
SELECT cient.DNI,cient.NomApels,AVG(proyect.Horas)
FROM CIENTIFICOS cient INNER JOIN ASIGNADO_A asign ON cient.DNI=asign.Cientifico  
     INNER JOIN PROYECTO proyect ON proyect.Id=asign.Proyecto
GROUP BY cient.DNI,cient.NomApels
HAVING COUNT(proyect.Id)>1 AND AVG(proyect.Horas)>10

---CON WHERE---
SELECT DNI,NomApels
FROM CIENTIFICOS C,ASIGNADO_A A,PROYECTO P
WHERE C.DNI=A.Cientifico AND P.Id=A.Proyecto
GROUP BY DNI,NomApels
HAVING COUNT(Proyecto)>1 AND AVG(Horas)>80

---CON SUB-CONSULTA---
SELECT cient.DNI,cient.NomApels
FROM CIENTIFICOS cient 
GROUP BY cient.DNI,cient.NomApels
HAVING 1<(SELECT COUNT(asign.Proyecto)
          FROM ASIGNADO_A asign
          GROUP BY asign.Cientifico
          HAVING asign.Cientifico=cient.DNI AND 80 < (SELECT AVG(proyect.Horas)
													  FROM PROYECTO proyect INNER JOIN ASIGNADO_A asign ON proyect.Id=asign.Proyecto
													  GROUP BY asign.Cientifico
													  HAVING asign.Cientifico=cient.DNI))

---LOS GRANDES ALMACENES---

---IMPORTANTE---
---8.1.Mostrar el numero de ventas de cada producto,ordenado de mas a menos ventas.

---MOSTRAR SOLO EL CODIGO DEL PRODUCTO---

SELECT vent.Producto,COUNT(vent.Producto) AS 'Cantidad de productos'
FROM VENTA vent
GROUP BY vent.Producto
ORDER BY COUNT(vent.Producto) DESC;

---MOSTRAR LA INFORMACION DEL PRODUCTO---

SELECT vent.Producto,produc.Nombre,COUNT(vent.Producto) AS 'Cantidad de productos'
FROM VENTA vent RIGHT JOIN PRODUCTOS produc ON vent.Producto=produc.Codigo
GROUP BY vent.Producto,produc.Nombre
ORDER BY COUNT(vent.Producto) DESC;


---IMPORTANTE---
--8.2.Obtener un informe completo de ventas,indicando el nombre del cajero que realizo la venta,
--    nombre y precios de los productos vendidos,y piso en el que se encuentra la 
--    maquina registradora donde se realizo la venta.

---CON JOIN---
SELECT caj.NomApels,produc.Nombre,produc.Precio,maq_regist.Piso
FROM VENTA vent INNER JOIN PRODUCTOS produc ON vent.Producto=produc.Codigo INNER JOIN CAJEROS caj ON vent.Cajero=caj.Codigo
     INNER JOIN MAQUINAS_REGISTRADORAS maq_regist ON vent.Maquina=maq_regist.Codigo

---SIN JOIN---
SELECT caj.NomApels,produc.Nombre,produc.Precio,maq_regist.Piso
FROM VENTA vent,PRODUCTOS produc,CAJEROS caj,MAQUINAS_REGISTRADORAS maq_regist
WHERE vent.Producto=produc.Codigo AND vent.Cajero=caj.Codigo AND vent.Maquina=maq_regist.Codigo

---IMPORTANTE---
---8.3.Obtener las ventas totales realizadas en cada piso.

SELECT maq_regist.Piso,SUM(produc.Precio) AS 'Total Ventas'
FROM MAQUINAS_REGISTRADORAS maq_regist LEFT JOIN (VENTA vent INNER JOIN PRODUCTOS produc ON vent.Producto=produc.Codigo)  
     ON vent.Maquina=maq_regist.Codigo 
GROUP BY maq_regist.Piso

---IMPORTANTE(COMPARAR CONTRA LA SOLUCION OFICIAL)---
---8.4.Obtener el codigo y nombre de cada empleado junto con el importe total de sus ventas.

SELECT caj.Codigo,caj.NomApels,SUM(product.Precio) AS 'Importe Total de Ventas'
FROM CAJEROS caj LEFT JOIN (VENTA vent INNER JOIN PRODUCTOS product ON vent.Producto=product.Codigo) ON caj.Codigo=vent.Cajero
GROUP BY caj.Codigo,caj.NomApels

---IMPORTANTE---
---8.5.Obtener el codigo y nombre de aquellos cajeros cuyas ventas totales sean inferiores a los 500

---CON JOIN---
SELECT caj.Codigo,caj.NomApels,SUM(product.Precio) AS 'Importe Total de Ventas'
FROM CAJEROS caj LEFT JOIN (VENTA vent INNER JOIN PRODUCTOS product ON vent.Producto=product.Codigo) ON caj.Codigo=vent.Cajero
GROUP BY caj.Codigo,caj.NomApels
HAVING SUM(product.Precio)<500

---CON SUB-CONSULTA--

SELECT Codigo,NomApels
FROM CAJEROS
WHERE Codigo IN(SELECT Cajero
                FROM VENTA
                WHERE Maquina IN(SELECT Codigo 
				                 FROM MAQUINAS_REGISTRADORAS
                                 WHERE Piso IN(SELECT Piso
                                               FROM VENTA V,PRODUCTOS P,MAQUINAS_REGISTRADORAS M
                                               WHERE V.Producto=P.Codigo AND V.Maquina=M.Codigo
                                               GROUP BY Piso
                                               HAVING SUM(Precio)<500)))

---9.LOS INVESTIGADORES---

---IMPORTANTE---
---9.1.Obtener el DNI y nombre de aquellos investigadores que han realizado mas de una reserva.

---CON JOIN---
SELECT invest.DNI,invest.NomApels,COUNT(reserv.DNI) AS 'Cantidad de Reservas'
FROM INVESTIGADORES invest INNER JOIN RESERVA reserv ON invest.DNI=reserv.DNI
GROUP BY invest.DNI,invest.NomApels
HAVING COUNT(reserv.DNI)>1

---USANDO SUB-CONSULTA---

---IMPORTANTE---
--9.2.Obtener un listado completo de reservas,incluyendo los siguientes datos:
  --1.DNI y nombre del investigador,junto con el nombre de su facultad.
  --2.Numero de serie y nombre del equipo reservado,junto con el nombre de la facultad a la que pertenece.
  --3.Fecha de comienzo y ﬁn de la reserva.

---CON JOIN---
SELECT investig.DNI,investig.NomApels,facultInvest.Nombre,equip.NumSerie,
       equip.Nombre,facultEquip.Nombre,reserv.Comienzo,reserv.Fin
FROM RESERVA reserv INNER JOIN INVESTIGADORES investig ON reserv.DNI=investig.DNI
     INNER JOIN EQUIPOS equip ON reserv.NumSerie=equip.NumSerie
	 INNER JOIN FACULTAD facultInvest ON investig.Facultad=facultInvest.Codigo
	 INNER JOIN FACULTAD facultEquip ON equip.Facultad=facultEquip.Codigo

---CON WHERE---
SELECT investig.DNI,investig.NomApels,facultInvest.Nombre,equip.NumSerie,
       equip.Nombre,facultEquip.Nombre,reserv.Comienzo,reserv.Fin
FROM RESERVA reserv,INVESTIGADORES investig,EQUIPOS equip,FACULTAD facultInvest,FACULTAD facultEquip
WHERE reserv.DNI=investig.DNI AND
      reserv.NumSerie=equip.NumSerie AND
	  investig.Facultad=facultInvest.Codigo AND
	  equip.Facultad=facultEquip.Codigo

---IMPORTANTE---
---9.3.Obtener el DNI y el nombre de los investigadores que han reservado equipos que no son de su facultad.

SELECT DISTINCT(investig.DNI),investig.NomApels
FROM RESERVA reserv,INVESTIGADORES investig,EQUIPOS equip
WHERE reserv.DNI=investig.DNI AND
      reserv.NumSerie=equip.NumSerie AND
	  equip.Facultad<>investig.Facultad

---IMPORTANTE---
---9.4.Obtener los nombres de las facultades en las que ningun investigador ha realizado una reserva.

SELECT Nombre 
FROM FACULTAD
WHERE Codigo IN(SELECT Facultad
                FROM INVESTIGADORES I LEFT JOIN RESERVA R ON I.DNI=R.DNI
                GROUP BY Facultad
                HAVING COUNT(R.DNI)=0)

---NOTA(SUB-CONSULTA):

---GROUP BY : AGRUPAR LOS REGISTROS POR FACULTAD

---HAVING : CONOCER LA CANTIDAD DE LA AGRUPACION PREVIAMENTE REALIZADA


---IMPORTANTE---
---9.5.Obtener los nombres de las facultades con investigadores 'ociosos'(investigadores que no han realizado ninguna reserva).

---CON SUB-CONSULTA---
SELECT facult.Nombre
FROM FACULTAD facult
WHERE facult.Codigo IN(SELECT DISTINCT(Invest.Facultad)
                       FROM INVESTIGADORES Invest LEFT JOIN RESERVA Reserv ON Invest.DNI=Reserv.DNI
                       GROUP BY Invest.Facultad,Invest.DNI
                       HAVING COUNT(Reserv.DNI)=0)

---CON SUB-CONSULTA(SEGUNDA VERSION)---
SELECT Nombre 
FROM FACULTAD
WHERE Codigo IN(SELECT Facultad 
                FROM INVESTIGADORES
                WHERE DNI NOT IN(SELECT DNI FROM RESERVA))

---IMPORTANTE---
---9.6.Obtener el numero de serie y nombre de los equipos que nunca han sido reservados.

---CON JOIN---
SELECT Equip.NumSerie,Equip.Nombre,COUNT(Reserv.DNI) AS 'Cantidad de Reservas'
FROM EQUIPOS Equip LEFT JOIN RESERVA Reserv ON Equip.NumSerie=Reserv.NumSerie
GROUP BY Equip.NumSerie,Equip.Nombre
HAVING COUNT(Reserv.DNI)=0

---CON SUB-SUBCONSULTA IN---

---CON EXIST---


---10.PLANILLA EMPRESA---

CREATE DATABASE dbPlanillaEmpresa
GO
USE dbPlanillaEmpresa
GO

CREATE TABLE temple1 (
nuempl CHAR(6) NOT NULL,
nombre CHAR(12) NOT NULL,
inicial CHAR(1) NOT NULL,
apellido CHAR(15) NOT NULL,
dept CHAR(3) NOT NULL,
tlfn CHAR(4),
feching  DATE NOT NULL,
codtra SMALLINT NOT NULL,
niveduc SMALLINT NOT NULL,
sexo CHAR(1) NOT NULL,
fechnac DATE  NOT NULL,
salario DECIMAL(9,2) NOT NULL);

GO

CREATE TABLE tdepar2 (
numdep CHAR(3) NOT NULL,
nomdep CHAR(36) NOT NULL,
numdirec CHAR(6) NOT NULL);


---INSERT temple1---

INSERT INTO temple1 VALUES(10, 'CRISTINA', 'I', 'HERNANDEZ', 'A00', 2070, '01/01/1965', 66, 18, 'M', '08/14/1933', 5275 );
INSERT INTO temple1 VALUES( 20, 'MIGUEL', 'L', 'TAPIA', 'B01', 2140, '10/10/1973', 61, 18, 'H', '02/02/1948', 4125 );
INSERT INTO temple1 VALUES( 30, 'SALOME', 'A', 'KEMPES', 'C01', 2080, '04/05/1975', 60, 20, 'M', '05/11/1941', 3825 );
INSERT INTO temple1 VALUES( 50, 'JUAN', 'B', 'GARRIDO', 'E01', 1507, '08/17/1949', 58, 16, 'H', '09/15/1925', 4017 );
INSERT INTO temple1 VALUES( 60, 'ISIDRO', 'F', 'SUAREZ', 'D11', 2290, '09/14/1973', 55, 16, 'H', '07/07/1945', 3225 );
INSERT INTO temple1 VALUES( 70, 'EVA', 'D', 'PUENTE', 'D21', 2400, '09/30/1980', 56, 16, 'M', '05/26/1953', 3617 );
INSERT INTO temple1 VALUES( 90, 'ELENA', 'W', 'HERRANZ', 'E11', 2230, '08/15/1970', 55, 16, 'M', '05/15/1941', 2945 );
INSERT INTO temple1 VALUES( 100, 'TOMAS', 'Q', 'SOLER', 'E21', 2170, '06/19/1980', 54, 14, 'H', '12/18/1956', 2615 );
INSERT INTO temple1 VALUES( 110, 'VICENTE', 'G', 'LUENGO', 'A00', 1140, '05/16/1958', 58, 19, 'H', '11/05/1929', 4650 );
INSERT INTO temple1 VALUES( 120, 'SIMON', '', 'OTERO', 'A00', 2022, '12/05/1963', 58, 14, 'H', '10/18/1942', 2925 );
INSERT INTO temple1 VALUES( 130, 'DOLORES', 'M', 'QUINTANA', 'C01', 2140, '07/28/1971', 55, 16, 'M', '09/15/1925', 2380 );
INSERT INTO temple1 VALUES( 140, 'HELIODORA', 'A', 'NIETO', 'C01', 2210, '12/15/1976', 56, 18, 'M', '01/19/1946', 2842 );
INSERT INTO temple1 VALUES( 150, 'BRUNO', '', 'ALVAREZ', 'D11', 2250, '02/12/1971', 55, 16, 'H', '05/17/1947', 2528 );
INSERT INTO temple1 VALUES( 160, 'ELISA', 'R', 'PINTO', 'D11', 1307, '10/11/1977', 54, 17, 'M', '04/12/1955', 2225 );
INSERT INTO temple1 VALUES( 170, 'MATEO', 'J', 'YARZA', 'D11', 2050, '09/15/1978', 54, 16, 'H', '01/05/1951', 2468 );
INSERT INTO temple1 VALUES( 180, 'MARINA', 'S', 'SANDOVAL', 'D11', 1050, '07/07/1973', 53, 17, 'M', '02/21/1949', 2134 );
INSERT INTO temple1 VALUES( 190, 'JAIME', 'H', 'WALKER', 'D11', 2100, '07/27/1974', 53, 16, 'H', '06/25/1952', 2045 );
INSERT INTO temple1 VALUES( 200, 'DAVID', '', 'BONDIA', 'D11', 2340, '03/03/1966', 55, 16, 'H', '05/29/1941', 2774 );
INSERT INTO temple1 VALUES( 210, 'WENCESLAO', 'T', 'JURADO', 'D11', 2310, '04/11/1979', 52, 17, 'H', '02/23/1953', 1827 );
INSERT INTO temple1 VALUES( 220, 'JIMENA', 'K', 'LUQUE', 'D11', 2300, '08/29/1968', 55, 18, 'M', '03/19/1948', 2984 );
INSERT INTO temple1 VALUES( 230, 'JAIME', 'J', 'JIMENEZ', 'D21', 1080, '11/21/1966', 53, 14, 'H', '05/30/1935', 2218 );
INSERT INTO temple1 VALUES( 240, 'SALVADOR', 'M', 'MARTINEZ', 'D21', 2260, '12/05/1979', 55, 17, 'H', '03/31/1954', 2876 );
INSERT INTO temple1 VALUES( 250, 'DANIEL', 'S', 'SIERRA', 'D21', 2357, '10/30/1969', 52, 15, 'H', '11/12/1939', 1918 );
INSERT INTO temple1 VALUES( 260, 'SUSANA', 'P', 'JUNQUERA', 'D21', 2302, '09/11/1975', 52, 16, 'M', '10/05/1936', 1725 );
INSERT INTO temple1 VALUES( 270, 'MARIA', 'L', 'PEREZ', 'D21', 2217, '09/30/1980', 55, 15, 'M', '05/23/1953', 2738 );
INSERT INTO temple1 VALUES( 280, 'ENGRACIA', 'R', 'SANCHEZ', 'E11', 2007, '03/24/1967', 54, 17, 'M', '05/15/1941', 2598 );
INSERT INTO temple1 VALUES( 290, 'JUAN', 'R', 'PALACIOS', 'E11', 2192, '05/30/1980', 42, 12, 'H', '07/09/1946', 1380 );
INSERT INTO temple1 VALUES( 300, 'PEDRO', 'I', 'SIERRA', 'E11', 3522, '06/19/1972', 48, 14, 'H', '10/27/1936', 1775 );
INSERT INTO temple1 VALUES( 310, 'MATILDE', 'F', 'SERNA', 'E11', 2130, '09/12/1964', 43, 12, 'M', '04/21/1931', 1574 );
INSERT INTO temple1 VALUES( 320, 'RAMON', 'V', 'MORAN', 'E21', 7112, '07/07/1965', 52, 16, 'H', '08/11/1932', 1995 );
INSERT INTO temple1 VALUES( 330, 'WILLY', '', 'LERMA', 'E21', 1132, '02/23/1976', 55, 14, 'H', '07/18/1941', 2537 );
INSERT INTO temple1 VALUES( 340, 'JAVIER', 'R', 'GIL', 'E21', 1162, '05/05/1947', 54, 16, 'H', '05/17/1926', 2384 );


---INSERT tdepar2---

INSERT INTO tdepar2 ( numdep, nomdep, numdirec ) 
VALUES 	( 'A00', 'CENTRO PROCESOS', 000010 ),
( 'B01', 'PLANIFICACION', 000020 ),
( 'C01', 'INFORMACION', 000030 ),
( 'D01', 'DESARROLLO', '' ),
( 'D11', 'FABRICACION', 000060 ),
( 'D21', 'ADMINISTRACION', 000070 ),
( 'E01', 'SERVICIOS', 000050 ),
( 'E11', 'OPERACIONES', 000090 ), 
( 'E21', 'SOFTWARE', 000100 );

---10.1.Obtener una lista de todas las empleadas de los departamentos que empiecen por D y por E. 
---     La lista anterior debe contener información sobre el número de personal, nombre, apellido y número de teléfono.

SELECT emmpleado.nuempl,emmpleado.nombre,emmpleado.apellido,emmpleado.tlfn,departamento.numdep,departamento.nomdep
FROM temple1 emmpleado INNER JOIN tdepar2 departamento ON emmpleado.dept=departamento.numdep
WHERE emmpleado.sexo='M' AND (departamento.numdep LIKE 'D%' OR departamento.numdep LIKE 'E%')

---10.2.Obtener un listado de todos los empleados (nombre y apellido) que ganan más de 2000 al mes 
---     y que entraron en la compañía después del 1 de Enero de 1975. También se quiere la información
---     correspondiente a su código de trabajo y al número de personal de sus directores.

SELECT empleado.nombre,empleado.apellido,empleado.salario,empleado.codtra,empleado.feching,departamento.numdirec
FROM temple1 empleado  INNER JOIN tdepar2 departamento ON empleado.dept=departamento.numdep
WHERE empleado.salario>2000 AND empleado.feching>'1975-01-01'

---10.3.Obtener una lista con el apellido, número de departamento y salario mensual de los empleados de los departamentos 
---    'A00’, ‘B01’, ‘C01’ y ‘D01’. La salida se quiere en orden descendente de salario dentro de cada departamento.

---USANDO CONDICION---
SELECT empleado.apellido,empleado.dept, empleado.salario
FROM temple1 empleado
WHERE empleado.dept='A00' OR 
      empleado.dept='B01' OR 
	  empleado.dept='C01' OR 
	  empleado.dept='D01'
ORDER BY empleado.salario DESC;

---USANDO CLAUSULA 'IN'---
SELECT empleado.apellido,empleado.dept, empleado.salario
FROM temple1 empleado
WHERE empleado.dept IN ('A00','B01','C01','D01')
ORDER BY empleado.salario DESC;

---10.4.Se pide una lista que recupere el salario medio de cada departamento junto con el número de empleados que tiene. 
---     El resultado no debe incluir empleados que tengan un código de trabajo mayor que 54, ni departamentos con menos de 
---	    tres empleados. Se quiere ordenada por número de departamento.

---TOMAR EN CUENTA TODOS LOS DEPARTAMENTOS---
SELECT departamento.numdep,COUNT(empleado.nuempl) AS 'Cantidad Empleados',AVG(empleado.salario) AS 'Salario Promedio'
FROM temple1 empleado RIGHT JOIN tdepar2 departamento ON empleado.dept=departamento.numdep
WHERE empleado.codtra<=54
GROUP BY departamento.numdep
HAVING COUNT(empleado.nuempl)>2

---TOMAR EN CUENTA SOLO LOS DEPARTAMENTOS QUE TENGAN EMPLEADOS---
SELECT dept, AVG(salario) , COUNT(*)
FROM temple1
WHERE codtra <= 54
GROUP BY dept
HAVING COUNT(*) > 2
ORDER BY dept

---10.5.Seleccionar todos los empleados de los departamentos 'D11' y 'E11' cuyo primer apellido empiece por S.

SELECT empleado.nombre,empleado.apellido,empleado.dept
FROM temple1 empleado
WHERE empleado.apellido LIKE 'S%' AND (empleado.dept='D11' OR empleado.dept='E11')

---10.6.Obtener el nombre, apellido y fecha de ingreso de los directores de departamento ordenados por número de personal.

---CON JOIN---
SELECT emple_direct.nuempl,emple_direct.nombre,emple_direct.apellido,emple_direct.feching
FROM temple1 emple_direct INNER JOIN tdepar2 depart ON emple_direct.nuempl=depart.numdirec
ORDER BY CAST(emple_direct.nuempl AS INT)

---CON SUB-CONSULTA---
SELECT emple_direct.nuempl,emple_direct.nombre,emple_direct.apellido,emple_direct.feching
FROM temple1 emple_direct 
WHERE emple_direct.nuempl IN(SELECT depart.numdirec
                             FROM tdepar2 depart)
ORDER BY CAST(emple_direct.nuempl AS INT)

---10.7.Obtener un listado de las mujeres de los departamentos que empiecen por D y por E cuyo nivel de educación 
---     sea superior a la media; en este caso también ordenados por número de personal.

SELECT empleado.nombre,empleado.apellido,empleado.dept
FROM temple1 empleado INNER JOIN  tdepar2 departamento ON empleado.dept=departamento.numdep
WHERE empleado.sexo='M' AND (departamento.nomdep LIKE 'D%' OR departamento.nomdep LIKE 'E%')
      AND empleado.niveduc > (SELECT AVG(temple1.niveduc) FROM temple1)
ORDER BY CAST(empleado.nuempl AS INT)

---10.8.Seleccionar todos los empleados cuyo nombre sea igual al de algunas personas del departamento D21 y cuyo 
---     código de trabajo sea diferente de todos los del E21 (la lista debe contener el número 
---     de personal, nombre, apellido, departamento y código de trabajo).

SELECT empleado.nuempl,empleado.nombre,empleado.apellido,empleado.dept,empleado.codtra
FROM temple1 empleado
WHERE empleado.nombre IN (SELECT nombre FROM temple1 WHERE dept='D21') 
     AND 
	 empleado.codtra NOT IN (SELECT codtra FROM temple1 WHERE dept='E21')
	 AND empleado.dept <> 'D21';

---NOTA: Se han excluido a los del propio departamento ya que son la referencia o patrón de comparación.

---10.9.Listar los empleados que no sean directores (la información que debe aparecer es el número de personal, 
---     apellido y departamento).

SELECT empleado.nuempl,empleado.nombre,empleado.apellido,empleado.dept
FROM temple1 empleado
WHERE empleado.nuempl NOT IN(SELECT numdirec 
                             FROM tdepar2)

---VERIFICAR---
---10.10.Seleccionar parejas de empleados (de sexo opuesto) que hayan nacido el mismo día 
---     (con información acerca de apellido y fecha de nacimiento).

SELECT emple_masc.nombre+' '+emple_masc.apellido AS 'Nombre Empleada',emple_masc.fechnac,emple_femen.nombre+' '+emple_femen.apellido AS 'Nombre Empleado',emple_femen.fechnac
FROM temple1 emple_masc INNER JOIN temple1 emple_femen ON emple_masc.sexo<>emple_femen.sexo AND (emple_masc.sexo<>'F' AND emple_femen.sexo<>'M')
WHERE emple_femen.fechnac=emple_masc.fechnac
---WHERE DAY(emple_femen.fechnac)=DAY(emple_masc.fechnac)

---10.11.Obtener un listado de todos los empleados que pertenecen al mismo departamento que Tomás Soler.

SELECT empleado.nuempl,empleado.nombre,empleado.apellido,empleado.dept,empleado.codtra
FROM temple1 empleado
WHERE empleado.dept IN (SELECT dept
                        FROM temple1
						WHERE nombre LIKE '%Tomas%' AND apellido LIKE '%Soler%')