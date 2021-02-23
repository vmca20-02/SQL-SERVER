--PRACTICA DE REPASO DE INSTRUCCIONES BASICAS DE SQL SERVER

--1.Listar el número y nombre de cada proveedor 

SELECT numeroProv,Nombre
FROM Tproveedor

--2.Si en la lista de selección se utiliza el *,este selecciona todos los campos de la tabla

SELECT *
FROM Tproveedor

--3.Al agregar la cláusula Top n , listará los n primeros registros de la tabla seleccionada 

SELECT TOP 3 *
FROM Tproveedor 

--4.Listar los números de  proveedor que aportan alguna pieza

SELECT numeroProv
FROM Tsuministro 

--5.Aplicar el distinct,para evitar obtener resultados

SELECT DISTINCT(numeroProv)
FROM Tsuministro 

--6.Listar el número de proveedor y de la pieza que aporta cada uno

SELECT DISTINCT numeroProv,numeroPieza
FROM Tsuministro 

--7.Listar los números de proveedor y la cantidad que aportan de cada pieza

SELECT DISTINCT  numeroProv,numeroPieza, cantidad
FROM Tsuministro; 

--8.Obtener los nombres de proveedor y ciudad,para los proveedores de Paris con estado = 10

SELECT nombre,Ciudad,estado
FROM Tproveedor
WHERE Ciudad='Paris' AND estado=10

--9.Encontrar los números de proveedor y de pieza
--de las que se provee una cantidad mayor o igual a 100 
--pero menor o igual a 300 

SELECT numeroProv,numeroPieza,cantidad
FROM Tsuministro 
WHERE cantidad BETWEEN 100 AND 300

--10.Obtener la información de todos los proveedor que tengan el apellido 'Salazar'

SELECT numeroProv,Nombre
FROM Tproveedor
WHERE Nombre LIKE 'Salazar'

--11.Obtener todos los nombres de Proveedor que tengan la 
--sílaba 'al' dentro de su apellido.  

SELECT numeroProv,Nombre
FROM Tproveedor
WHERE Nombre LIKE '%al%'

--12.Obtener todos los nombres de Pieza que finalicen con la letra 'o'.

SELECT Nombre
FROM Tpieza
WHERE Nombre LIKE '%o'

--13.Obtener todos los nombres de proveedor que habitan
--en una ciudad cuyo nombre tiene como
--tercera letra la 'n'.

SELECT Nombre
FROM Tproveedor
WHERE Nombre LIKE '__n%'

--14.Obtener la información de los proveedores en orden
--descendente de estado.

SELECT *
FROM Tproveedor
ORDER BY estado DESC

--15.Obtener la información de las piezas en orden ascendente de peso. 

SELECT *
FROM Tpieza
ORDER BY peso ASC

--16.Obtener la información de los proveedores en orden
--ascendente de ciudad; y de manera que,los proveedores

SELECT *
FROM Tproveedor
ORDER BY Ciudad ASC,estado DESC


---FUNCIONES INTEGRADAS---

--17.Listar cuantos proveedores viven en París. 

SELECT COUNT(*) as 'Cantidad de proveedores de Paris'
FROM Tproveedor
WHERE Ciudad='Paris'

--18.Listar la cantidad de piezas rojas

SELECT *
FROM Tpieza
WHERE color='rojo'

--19.Obtener la cantidad de proveedores que aportan la pieza P2. 

SELECT COUNT(*) AS 'Cantidad de provedores de la pieza P2'
FROM Tsuministro
WHERE numeroPieza='P2'

--20.Obtener la cantidad total suministrada de la pieza P2 

SELECT SUM(cantidad) AS 'Cantidad suministrada de la pieza P2'
FROM Tsuministro
WHERE numeroPieza='P2'

--21.Obtener el promedio de las cantidades de piezas que aportan los proveedores.

SELECT AVG(cantidad) AS 'Promedio de cantidad de piezas'
FROM Tsuministro

--22.Obtener el mayor peso de una pieza

SELECT MAX(peso) AS 'Maximo peso de una pieza'
FROM Tpieza

--23.Obtener la cantidad mínima de piezas que aporta un proveedor 


SELECT MIN(cantidad) AS 'Cantidad minima de piezas de un proveedor'
FROM Tsuministro


--24.Listar la cantidad de proveedores que aportan piezas


SELECT COUNT(DISTINCT(numeroProv)) AS 'Provedores que suministran una pieza'
FROM Tsuministro
WHERE cantidad>0


---AGRUPAMIENTO DE DATOS---

--25.Obtener el número de proveedor y la suma total de piezas que aporta

SELECT numeroProv,SUM(cantidad) AS 'Cantidad de piezas'
FROM Tsuministro
GROUP BY numeroProv

--26.Obtener la cantidad de piezas diferentes que aporta cada proveedor

SELECT numeroProv,COUNT(numeroPieza) AS 'Cantidad piezas'
FROM Tsuministro
GROUP BY numeroProv

--27.Una forma diferente para crearle una alias a una columna sin nombre

SELECT numeroProv, count(*) as [Cantidad de tipos de Piezas]
FROM Tsuministro
GROUP BY numeroProv


---USO DEL HAVING---

--28.Listar la cantidad de piezas que aporta cada proveedor
-- pero sin tomar en cuenta al proveedor S2 

--OJO REVISAR CUAL DE LOS 2 TIENE MAYOR RENDIMIENTO

SELECT numeroProv,SUM(cantidad) AS 'Cantidad de piezas'
FROM Tsuministro
GROUP BY numeroProv
HAVING numeroProv<>'S2'


SELECT numeroProv,SUM(cantidad) AS 'Cantidad de piezas'
FROM Tsuministro
WHERE numeroProv<>'S2'
GROUP BY numeroProv

--29 Listar para cada proveedor la suma de todas las piezas suministradas,
--   pero de manera que únicamente aparezcan los que aportan en total más
--   de 500 piezas


--RECORDAR QUE DENTRO DEL HAVING SE PUEDEN USAR FUNCIONES INTEGRADAS
SELECT numeroProv,SUM(cantidad) AS [CANT_SUM]
FROM Tsuministro
GROUP BY numeroProv
HAVING SUM(cantidad)>500


--MANERA MAS COMPLICADA,DONDE SE LLEGA AL MISMO RESULTADO
SELECT tResult.numeroProv,tResult.CANT_SUM
FROM
(SELECT numeroProv,SUM(cantidad) AS [CANT_SUM]
FROM Tsuministro
GROUP BY numeroProv) tResult
WHERE tResult.CANT_SUM>500

--30 Listar para cada pieza, la cantidad total que de ella aportan
--   entre todos los proveedores, pero, de manera que aparezcan 
--   únicamente las piezas de las que se aporta más de 600 piezas en total

SELECT numeroPieza,SUM(cantidad) AS 'Cantidad'
FROM Tsuministro
GROUP BY numeroPieza
HAVING SUM(cantidad)>600

--30 VERSION OPCIONAL
--Listar para cada pieza, la cantidad total que de ella aportan
--entre todos los proveedores, pero, de manera que aparezcan 
--únicamente las piezas con número mayor a P2

SELECT  numeroPieza, sum(cantidad)
FROM  Tsuministro
GROUP BY numeroPieza
HAVING numeroPieza > 'P2'

--ESTA SOLUCUION ES MUCHO MAS OPTIMA,YA QUE NO TOTALIZA LOS RESULTADOS QUE SE QUIEREN DESCARTAR DE ACUERDO
--A LA CONDICION(OJO ESTO HAY QUE VERIFICARLO)
SELECT  numeroPieza, sum(cantidad)
FROM  Tsuministro
WHERE numeroPieza > 'P2'
GROUP BY numeroPieza

--SUB CONSULTA QUE APLICA SI SE HUBIERA CONSULTADO POR LOS REGISTROS CON UNA CANTIDAD MAYOR 
--DE PIEZAS QUE LAS QUE TIENE 'P2'
SELECT numeroPieza,SUM(cantidad) AS 'Cantidad'
FROM Tsuministro
WHERE numeroPieza<>'P2'
GROUP BY numeroPieza
HAVING SUM(cantidad)>(SELECT SUM(cantidad) FROM Tsuministro WHERE numeroPieza='P2')

---CONSULTA DE MAS DE UNA TABLA---

--31,32,33  Listar el número, nombre de cada pieza suministrada, junto a
--          la cantidad  que se aporta de dicha pieza.

SELECT p.numeroPieza,p.Nombre,s.cantidad
FROM Tsuministro s,Tpieza p
WHERE p.numeroPieza=s.numeroPieza

--34  Listar el número y nombre de cada pieza suministrada,
--    junto al número de proveedor que la suministra y a la
--    cantidad que aporta de dicha pieza.

SELECT p.numeroPieza,p.Nombre,prov.numeroProv,prov.Nombre,s.cantidad
FROM Tsuministro s,Tpieza p,Tproveedor prov
WHERE p.numeroPieza=s.numeroPieza AND prov.numeroProv=s.numeroProv


--35 Obtener el nombre del proveedor , de la parte que suministra 
--   y la cantidad, para los proveedores que residen en Londres


SELECT p.Nombre,prov.Nombre,s.cantidad,prov.Ciudad
FROM Tsuministro s,Tpieza p,Tproveedor prov
WHERE p.numeroPieza=s.numeroPieza AND prov.numeroProv=s.numeroProv AND prov.Ciudad='Londres'

--36 Listar para cada proveedor (por nombre),la cantidad de 
--   tipos de piezas que aporta, en orden de nombre del proveedor

--CANTIDAD DE DE TIPOS DE PIEZA QUE APORTA CADA PROVEEDOR
SELECT prov.numeroProv,prov.Nombre,COUNT(*) [Cantidad de tipos de piezas]
FROM Tsuministro s,Tproveedor prov
WHERE prov.numeroProv=s.numeroProv
GROUP BY prov.numeroProv,prov.Nombre

--CANTIDAD DE PIEZAS QUE APORTA POR CADA TIPO 


SELECT prov.Nombre,P.numeroPieza,p.Nombre,SUM(s.cantidad) [Cantidad]
FROM Tsuministro s,Tpieza p,Tproveedor prov
WHERE p.numeroPieza=s.numeroPieza AND prov.numeroProv=s.numeroProv
GROUP BY prov.Nombre,P.numeroPieza,p.Nombre
ORDER BY prov.Nombre

--36(B) Obtener la información del proveedor y la pieza que están 
--      situados en la misma ciudad, pero que no aparezcan proveedores
--      cuyo estado sea 20.

--SI QUEREMOS VER EL RESULTADO CON EL PROOVEDOR QUE LAS APORTA
SELECT prov.numeroProv,prov.Nombre,prov.Ciudad AS 'Ciudad Provedor',prov.estado,p.Ciudad AS 'Ciudad Pieza',p.color,p.Nombre,p.numeroPieza,p.peso
FROM Tsuministro s,Tpieza p,Tproveedor prov
WHERE p.numeroPieza=s.numeroPieza AND prov.numeroProv=s.numeroProv AND p.Ciudad=prov.Ciudad AND prov.estado=20

--SI QUEREMOS VER EL RESULTADO SIN IMPORTAR SI LAS APORTA O NO

SELECT prov.numeroProv,prov.Nombre,prov.Ciudad AS 'Ciudad Provedor',prov.estado,p.Ciudad AS 'Ciudad Pieza',p.color,p.Nombre,p.numeroPieza,p.peso
FROM Tpieza p,Tproveedor prov
WHERE p.Ciudad=prov.Ciudad AND prov.estado<>20


--37.Obtener todas las posibles parejas de proveedor que residan en la misma ciudad

SELECT prov1.numeroProv,prov1.Nombre,prov1.Ciudad,prov2.numeroProv,prov2.Nombre,prov2.Ciudad
FROM Tproveedor prov1,Tproveedor prov2
WHERE prov1.Ciudad=prov2.Ciudad AND prov1.numeroProv<prov2.numeroProv


--38.Obtener los nombres de los proveedores que estén situados en la misma ciudad que el proveedor S1

SELECT t1.Nombre,t1.Ciudad,t2.Nombre,t2.Ciudad
FROM  Tproveedor t1,Tproveedor t2
WHERE t1.Ciudad=t2.Ciudad AND t1.numeroProv='S1' AND t1.numeroProv < t2.numeroProv


--39 Obtener la información de los proveedores que tienen en null el atributo estado(INVESTIGAR)


SELECT numeroProv,Nombre,Ciudad
FROM Tproveedor
WHERE estado is null

--40 Obtener la información de los proveedores que no tienen null en el atributo estado

SELECT numeroProv,Nombre,Ciudad
FROM Tproveedor
WHERE estado is not null

--41.Obtener los nombres de proveedores que suministran la pieza P2  

SELECT Nombre
FROM Tproveedor
WHERE numeroProv IN(SELECT Tsuministro.numeroProv
                    FROM Tsuministro
				    WHERE numeroPieza='P2')


--42.Esta es la consulta anterior pero sin necesidad de la subconsulta

SELECT prov.Nombre
FROM Tsuministro s,Tproveedor prov
WHERE prov.numeroProv=s.numeroProv AND s.numeroPieza='P2'


--43. Obtener los nombres de proveedores que no suministran ninguna pieza

SELECT Nombre
FROM Tproveedor
WHERE numeroProv NOT IN(SELECT Tsuministro.numeroProv
                        FROM Tsuministro)


---43B.VERSION CON JOINS

SELECT Nombre
FROM Tproveedor p LEFT JOIN Tsuministro s ON p.numeroProv=s.numeroProv
WHERE s.numeroProv IS NULL


--44 Obtener los nombres de proveedores que no suministran la pieza P2

SELECT *
FROM Tproveedor
WHERE numeroProv NOT IN(SELECT numeroProv
                        FROM Tsuministro
						WHERE numeroPieza='P2')

/*ENTENDER QUE ES LO QUE ESTA PASANDO ACA*/
--SELECT DISTINCT(prov.Nombre)
SELECT *
FROM Tsuministro s,Tproveedor prov
WHERE prov.numeroProv=s.numeroProv AND s.numeroPieza<>'P2' 


--45.Obtener los números de proveedor situados en la misma ciudad que el proveedor  S1

SELECT numeroProv,Nombre
FROM Tproveedor
WHERE numeroProv<>'S1' AND Ciudad =(SELECT Ciudad
                                    FROM Tproveedor
			                        WHERE numeroProv='S1')


SELECT t1.numeroProv,t1.Nombre,t1.Ciudad
FROM Tproveedor t1,Tproveedor t2
WHERE t1.Ciudad=t2.Ciudad AND t1.numeroProv<>'S1' AND t2.numeroProv='S1' 


--46 Obtener los números de proveedor que posean el mayor estado 

SELECT numeroProv,Nombre,Ciudad,numeroProv,Nombre,Ciudad,estado
FROM Tproveedor 
WHERE estado=(SELECT MAX(estado)
              FROM Tproveedor)


--47 Listar el número de pieza de la que menos unidades aporta un proveedor

SELECT *
FROM Tsuministro s
WHERE s.cantidad=(SELECT MIN(cantidad)
                  FROM Tsuministro)

--48 Listar el número y nombre de la pieza de la que menos unidades aporta un proveedor
SELECT p.numeroPieza,p.Nombre
FROM Tpieza p,Tsuministro s
WHERE p.numeroPieza=s.numeroPieza AND s.cantidad=(SELECT MIN(cantidad)
                                                  FROM Tsuministro)


--49 Obtener el nombre de todos los proveedores que tienen
--   un estado mayor a todos los proveedores que viven en Londres.

SELECT numeroProv,Nombre,Ciudad,numeroProv,Nombre,Ciudad,estado
FROM Tproveedor 
WHERE estado> ALL(SELECT estado
                  FROM Tproveedor 
                  WHERE Ciudad='Londres')


--50 Obtener los nombres de los proveedores que suministren al menos una pieza roja
SELECT numeroProv,Nombre,estado,Ciudad
FROM Tproveedor
WHERE numeroProv IN (SELECT numeroProv
                     FROM Tpieza p,Tsuministro s
                     WHERE p.numeroPieza=s.numeroPieza AND p.color='Rojo')

--OTRA MANERA DE HACERLO
--OJO PREGUNTAR POR LA POSIBLE VENTAJA DE LAS SUBCONSULTAS A NIVEL DE DESEMPEÑO
--VER SI LA PRIMERA SUBCONSULTA INTERIOR ME AHORRARIA PROCESAMIENTO EN LOS OTROS 2 QUERYS
SELECT  nombre
	FROM  Tproveedor
	WHERE   numeroProv IN
			    (SELECT  numeroProv
			     FROM  Tsuministro	
			     WHERE  numeroPieza IN
						 ( SELECT  numeroPieza
						   FROM  Tpieza
						   WHERE   color  = 'rojo'));

--51 Version reuniendo todas las tablas en una sola consulta (OJO PREGUNTAR ESTO EN ALGUN FORO)

SELECT  distinct Pr.nombre
		FROM  	Tproveedor Pr, Tsuministro S,  Tpieza P
		WHERE  	Pr.numeroProv  = S.numeroProv AND
			S.numeroPieza = P.numeroPieza AND P.color  =  'rojo';

--52 Listar el número de proveedor que no aporta ni la pieza P4 ni la P5 

SELECT nombre
FROM Tproveedor
WHERE numeroProv NOT IN
					(SELECT  numeroProv
					 FROM  Tsuministro	
					 WHERE numeroPieza='P4' OR numeroPieza='P5')


--53- Eliminar de la base de datos al proveedor que posea el estado menor

   DELETE  
   FROM  Tproveedor
   WHERE estado =(SELECT  min (estado)
                  FROM Tproveedor)