
--1.Listar el número y nombre de cada proveedor  

SELECT numeroProv,Nombre
FROM Tproveedor

--2.Si en la lista de selección se utiliza el *,este selecciona todos los campos de la tabla

SELECT *
FROM Tproveedor

--3.Al agregar la cláusula Top n , listará los n primeros registros de la tabla seleccionada 

SELECT TOP 3 numeroProv,Nombre
FROM Tproveedor

--4.Listar los números de  proveedor que aportan alguna pieza

SELECT numeroProv
FROM Tsuministro

--5.Aplicar el distinct,para evitar obtener resultados duplicados

SELECT DISTINCT numeroProv
FROM Tsuministro

--6.Listar el número de proveedor y de la pieza que aporta cada uno

SELECT numeroProv,numeroPieza
FROM Tsuministro

--7.Listar los números de proveedor y la cantidad que aportan de cada pieza

SELECT numeroProv,SUM(cantidad) AS 'Cantidad de piezas'
FROM Tsuministro
GROUP BY numeroProv

--8.Obtener los nombres de proveedor y ciudad,para los proveedores de Paris con estado = 10

SELECT Nombre,Ciudad
FROM Tproveedor
WHERE Ciudad='Paris' AND estado=10

--9.Encontrar los números de proveedor y de pieza
--de las que se provee una cantidad mayor o igual a 100 
--pero menor o igual a 300 

SELECT numeroProv,numeroPieza,cantidad
FROM Tsuministro
WHERE cantidad>=100 AND cantidad<=300

SELECT numeroProv,numeroPieza,cantidad
FROM Tsuministro
WHERE cantidad BETWEEN 100 AND 300

--10.Obtener la información de todos los proveedor que tengan el apellido 'Salazar'

SELECT *
FROM Tproveedor
WHERE nombre='Salazar' 

--11.Obtener todos los nombres de Proveedor que tengan la 
--sílaba 'al' dentro de su apellido.  

SELECT *
FROM Tproveedor
WHERE nombre like '%al%' 

--12.Obtener todos los nombres de Pieza que finalicen con la letra 'o'.

SELECT *
FROM Tpieza
WHERE nombre like '%o' 

--13.Obtener todos los nombres de proveedor que habitan
--en una ciudad cuyo nombre tiene como
--tercera letra la 'n'.

SELECT *
FROM Tproveedor
WHERE ciudad like '___n%' 

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
ORDER BY ciudad DESC 

---FUNCIONES INTEGRADAS---

--17.Listar cuantos proveedores viven en París. 

SELECT COUNT(*)
FROM Tproveedor
WHERE Ciudad='Paris'

--18.Listar la cantidad de piezas rojas

SELECT COUNT(*)
FROM Tpieza
WHERE color='rojo'

--19.Obtener la cantidad de proveedores que aportan la pieza P2. 

SELECT COUNT(*) 'Cantidad de provedores que aportan la pieza P2'
FROM Tsuministro
WHERE numeroPieza='P2'

--20.Obtener la cantidad total suministrada de la pieza P2 

SELECT SUM(cantidad) AS 'Cantidad total suministrada de pieza P2'
FROM Tsuministro
WHERE numeroPieza='P2'

--21.Obtener el promedio de las cantidades de piezas que aportan los proveedores.

SELECT AVG(cantidad) AS 'Promedio de la cantidad de piezas suministradas por los provedores'
FROM Tsuministro

--22.Obtener el mayor peso de una pieza

SELECT MAX(Peso)
FROM Tpieza

--23.Obtener la cantidad mínima de piezas que aporta un proveedor

SELECT MIN(cantidad) AS 'Cantidad minima'
FROM Tsuministro tsum

--24.Listar la cantidad de proveedores que aportan piezas

SELECT COUNT(numeroProv) 'Cantidad de proveedores'
FROM Tsuministro 

---AGRUPAMIENTO DE DATOS---

--25.Obtener el número de proveedor y la suma total de piezas que aporta

SELECT numeroProv,SUM(cantidad) AS 'Cantidad Total de piezas que aporta'
FROM Tsuministro 
GROUP BY numeroProv

--26.Obtener la cantidad de piezas diferentes que aporta cada proveedor

SELECT numeroProv,numeroPieza,SUM(cantidad) AS 'Cantidad que aporta de la pieza'
FROM Tsuministro 
GROUP BY numeroProv,numeroPieza

--27.Una forma diferente para crearle una alias a una columna sin nombre

SELECT Nombre AS Nombre
FROM Tproveedor

---USO DEL HAVING---

--28.Listar la cantidad de piezas que aporta cada proveedor
-- pero sin tomar en cuenta al proveedor S2 

--DUDA,QUE ES MEJOR OPCION 1 O OPCION 2?

---HAVING VERSION----

SELECT numeroProv,SUM(cantidad) AS 'Cantidad de piezas'
FROM Tsuministro 
GROUP BY numeroProv
HAVING numeroProv<>'S2'

---WHERE VERSION----

SELECT numeroProv,SUM(cantidad) AS 'Cantidad de piezas'
FROM Tsuministro 
WHERE numeroProv<>'S2'
GROUP BY numeroProv

--29 Listar para cada proveedor la suma de todas las piezas suministradas,
--   pero de manera que únicamente aparezcan los que aportan en total más
--   de 500 piezas

---HAVING VERSION---

SELECT numeroProv,SUM(cantidad) AS 'Cantidad de piezas'
FROM Tsuministro 
GROUP BY numeroProv
HAVING SUM(cantidad)>500

---WHERE VERSION----

SELECT resultTable.numeroProv,resultTable.Cant_Piezas
FROM
(SELECT numeroProv,SUM(cantidad) AS 'Cant_Piezas'
 FROM Tsuministro 
 GROUP BY numeroProv) AS resultTable
 WHERE resultTable.Cant_Piezas>500

 
--30 Listar para cada pieza, la cantidad total que de ella aportan
--   entre todos los proveedores, pero, de manera que aparezcan 
--   únicamente las piezas de las que se aporta más de 600 piezas en total

---HAVING VERSION---

SELECT numeroProv,SUM(cantidad) 'Cantidad Total de piezas'
FROM Tsuministro 
GROUP BY numeroProv
HAVING SUM(cantidad)>600

---WHERE VERSION---
SELECT numeroProv,Cant_Piz
FROM
(SELECT numeroProv,SUM(cantidad) 'Cant_Piz'
FROM Tsuministro 
GROUP BY numeroProv) provPartes
WHERE provPartes.Cant_Piz>600

--30 VERSION OPCIONAL
--Listar para cada pieza, la cantidad total que de ella aportan
--entre todos los proveedores, pero, de manera que aparezcan 
--únicamente las piezas con número mayor a P2

---HAVING VERSION---

SELECT numeroProv,SUM(cantidad) 'Cantidad Total de piezas'
FROM Tsuministro 
GROUP BY numeroProv
HAVING SUM(cantidad)>=(SELECT SUM(cantidad) FROM Tsuministro WHERE numeroPieza='P2')

---WHERE VERSION

SELECT numeroProv,Cant_Piz
FROM
(SELECT numeroProv,SUM(cantidad) 'Cant_Piz'
FROM Tsuministro 
GROUP BY numeroProv) provPartes
WHERE provPartes.Cant_Piz>=(SELECT SUM(cantidad) FROM Tsuministro WHERE numeroPieza='P2')

---CONSULTA DE MAS DE UNA TABLA---

--31,32,33  Listar el número, nombre de cada pieza suministrada, junto a
--          la cantidad  que se aporta de dicha pieza.


SELECT tpieza.numeroPieza,tpieza.nombre,tsum.cantidad
FROM Tsuministro tsum,Tpieza tpieza
WHERE tsum.numeroPieza=tpieza.numeroPieza

--34  Listar el número y nombre de cada pieza suministrada,
--    junto al número de proveedor que la suministra y a la
--    cantidad que aporta de dicha pieza.

SELECT tpieza.numeroPieza,tpieza.nombre,tprov.numeroProv,tsum.cantidad
FROM Tsuministro tsum,Tpieza tpieza,Tproveedor tprov
WHERE tsum.numeroPieza=tpieza.numeroPieza AND tsum.numeroProv=tprov.numeroProv


--35 Obtener el nombre del proveedor , de la parte que suministra 
--   y la cantidad, para los proveedores que residen en Londres

SELECT tpieza.numeroPieza,tpieza.nombre,tprov.numeroProv,tsum.cantidad
FROM Tsuministro tsum,Tpieza tpieza,Tproveedor tprov
WHERE tsum.numeroPieza=tpieza.numeroPieza AND tsum.numeroProv=tprov.numeroProv AND tprov.Ciudad='Londres'


--36 Listar para cada proveedor (por nombre),la cantidad de 
--   tipos de piezas que aporta, en orden de nombre del proveedor

SELECT tprov.numeroProv,tprov.Nombre,tpieza.numeroPieza,tpieza.nombre,tsum.cantidad
FROM Tsuministro tsum,Tpieza tpieza,Tproveedor tprov
WHERE tsum.numeroPieza=tpieza.numeroPieza AND tsum.numeroProv=tprov.numeroProv 
GROUP BY tprov.numeroProv,tprov.Nombre,tpieza.numeroPieza,tpieza.nombre,tsum.cantidad
ORDER BY tprov.Nombre

--CANTIDAD DE PIEZAS QUE APORTA POR CADA TIPO 

--36(B) Obtener la información del proveedor y la pieza que están 
--      situados en la misma ciudad, pero que no aparezcan proveedores
--      cuyo estado sea 20.

SELECT tprov.numeroProv,tprov.Nombre,tpieza.numeroPieza,tpieza.nombre,tsum.cantidad,tprov.estado
FROM Tsuministro tsum,Tpieza tpieza,Tproveedor tprov
WHERE tsum.numeroPieza=tpieza.numeroPieza AND tsum.numeroProv=tprov.numeroProv 
      AND tprov.Ciudad=tpieza.Ciudad AND tprov.estado<>20
GROUP BY tprov.numeroProv,tprov.Nombre,tpieza.numeroPieza,tpieza.nombre,tsum.cantidad,tprov.estado

--37.Obtener todas las posibles parejas de proveedor que residan en la misma ciudad

--prov1.numeroProv<prov2.numeroProv(EXPLICACION)

--ELIMINA LOS REGISTROS CLONADOS

---S4	Corella	 Londres <  S4	Corella	 Londres -->ESTO SE ELIMINARA

--ELIMINA LAS COMBINACIONES REPETIDAS

---S4	Corella	Londres < S1 Salazar Londres  -->ESTO SE ELIMINARA

---S1	Salazar	Londres < S4 Corella Londres  -->ESTA COMBINACION PERSISTIRA

SELECT prov1.numeroProv,prov1.Nombre,prov1.Ciudad,prov2.numeroProv,prov2.Nombre,prov2.Ciudad
FROM Tproveedor prov1,Tproveedor prov2
WHERE prov1.Ciudad=prov2.Ciudad AND prov1.numeroProv<prov2.numeroProv


--38.Obtener los nombres de los proveedores que estén situados en la misma ciudad que el proveedor S1

SELECT numeroProv,Nombre,Ciudad
FROM Tproveedor
WHERE Ciudad=(SELECT Ciudad
              FROM Tproveedor
			  WHERE numeroProv='S1')

--39 Obtener la información de los proveedores que tienen en null el atributo estado(INVESTIGAR)

SELECT numeroProv,Nombre,Ciudad
FROM Tproveedor
WHERE estado is null

--40 Obtener la información de los proveedores que no tienen null en el atributo estado

SELECT numeroProv,Nombre,Ciudad
FROM Tproveedor
WHERE estado is not null


--41,42.Obtener los nombres de proveedores que suministran la pieza P2  

---VERSION WHERE---

SELECT tprov.numeroProv,tprov.Nombre,tprov.Ciudad
FROM Tproveedor tprov,Tsuministro tsum
WHERE tsum.numeroProv=tprov.numeroProv AND tsum.numeroPieza='P2'

---VERSION JOIN---

SELECT tprov.numeroProv,tprov.Nombre,tprov.Ciudad
FROM Tproveedor tprov INNER JOIN Tsuministro tsum ON tprov.numeroProv=tsum.numeroProv  AND tsum.numeroPieza='P2'

---VERSION SUB QUERY---

SELECT tprov.numeroProv,tprov.Nombre,tprov.Ciudad
FROM  Tproveedor tprov 
WHERE tprov.numeroProv IN(SELECT  tsum.numeroProv 
                          FROM Tsuministro tsum
						  WHERE tsum.numeroPieza='P2')

--43. Obtener los nombres de proveedores que no suministran ninguna pieza

---VERSION SUB QUERY---

SELECT tprov.numeroProv,tprov.Nombre,tprov.Ciudad
FROM Tproveedor tprov
WHERE tprov.numeroProv NOT IN(SELECT numeroProv
                              FROM Tsuministro)

--44 Obtener los nombres de proveedores que no suministran la pieza P2

---VERSION SUB QUERY---

SELECT tprov.numeroProv,tprov.Nombre,tprov.Ciudad
FROM Tproveedor tprov
WHERE tprov.numeroProv NOT IN(SELECT numeroProv
                              FROM Tsuministro
							  WHERE numeroPieza='P2')


--45.Obtener los números de proveedor situados en la misma ciudad que el proveedor  S1

---VERSION SUB QUERY---

SELECT tprov.numeroProv,tprov.Nombre,tprov.Ciudad
FROM Tproveedor tprov
WHERE  tprov.Ciudad IN(SELECT tprov.Ciudad
                        FROM Tproveedor tprov
					    WHERE tprov.numeroProv='S1')


--46 Obtener los números de proveedor que posean el mayor estado

SELECT tprov.numeroProv,tprov.Nombre,tprov.Ciudad,tprov.estado
FROM Tproveedor tprov
WHERE tprov.estado=(SELECT MAX(estado)
                    FROM  Tproveedor)

--47,48 Listar el número de pieza de la que menos unidades aporta un proveedor

---ALERTA!!! OJO CON ESTA QUERY INCORRECTA,HAY INCONSISTENCIA YA QUE NO SE ESTA AMARRANDO LA LLAVE PRIMARIA(COMPUESTA) DE LA TABLA(Tsuministro)
SELECT tprov.Nombre,tSum.numeroPieza
FROM Tproveedor tprov,Tsuministro tSum
WHERE tprov.numeroProv=tSum.numeroProv
-----------------------------------------------------------------------------------------------------------------------------------------------

--SI OMITO LA SUB-QUERY TENDRIA QUE AGRUPAR POR ALGO(POR ENDE NO A PODER TRAER SOLO UN NUMERO DE PIEZA POR CADA PROVEEDOR)
SELECT tprov.numeroProv,tprov.Nombre,tprov.Ciudad,MIN(tsum.cantidad) AS 'Cantidad Suministrada'
FROM Tproveedor tprov,Tsuministro tsum,Tpieza tpiez
WHERE tsum.numeroPieza=tpiez.numeroPieza AND tsum.numeroProv=tprov.numeroProv 
GROUP BY tprov.numeroProv,tprov.Nombre,tprov.Ciudad,tsum.cantidad

--VERSION CON SUBQUERY(PARA SOLO TRAER UN NUMERO DE PIEZA POR PROVEEDOR)
--NOTA:OJO EN ESTE CASO EN PARTICULAR HAY UN DUPLICADO YA QUE LA MENOR CANTIDAD DE PIEZAS SUMINISTRADA POR UNO DE LOS PROVEDORES
--     ES 100 COSA QUE LE PASA CON OTRA PIEZA DIFERENTE CUYA CANTIDAD ES 100 TAMBIEN

SELECT tprov.numeroProv,tprov.Nombre,tprov.Ciudad,tpiez.numeroPieza,tpiez.Nombre,
       tsum.cantidad AS 'Pieza de la que menos cantidades se aportan'
FROM Tproveedor tprov,Tsuministro tsum,Tpieza tpiez
WHERE tsum.numeroPieza=tpiez.numeroPieza AND tsum.numeroProv=tprov.numeroProv 
      AND cantidad=(SELECT MIN(tsum.cantidad) 
                    FROM Tproveedor tprovSub,Tsuministro tsum,Tpieza tpiez
				    WHERE tsum.numeroPieza=tpiez.numeroPieza 
				          AND tsum.numeroProv=tprovSub.numeroProv 
					      AND tprovSub.numeroProv=tprov.numeroProv)

---AL PARECER ESTO ESTA MUCHO MAS OPTIMIZADO(SERIA BUENO COMPARAR)
---NOTA:PUEDO OMITIR LA LINEA DE GROUP BY

SELECT tprov.numeroProv,tprov.Nombre,tprov.Ciudad,tpiez.numeroPieza,tpiez.Nombre,
       tsum.cantidad AS 'Pieza de la que menos cantidades se aportan'
FROM Tproveedor tprov,Tsuministro tsum,Tpieza tpiez
WHERE tsum.numeroPieza=tpiez.numeroPieza AND tsum.numeroProv=tprov.numeroProv 
      AND cantidad=(SELECT MIN(tsum.cantidad) 
                    FROM Tsuministro tsum
				    WHERE tsum.numeroProv=tprov.numeroProv)

--50 Obtener los nombres de los proveedores que suministren al menos una pieza roja

---VERSION CON WHERE---
SELECT DISTINCT(tprov.Nombre)
FROM  Tproveedor tprov,Tsuministro tsum,Tpieza tpieza
WHERE tprov.numeroProv=tsum.numeroProv AND tsum.numeroPieza=tpieza.numeroPieza AND Tpieza.color='Rojo'

---VERSION CON SUBCONSULTA---

SELECT tprov.Nombre
FROM  Tproveedor tprov
WHERE tprov.numeroProv IN (SELECT tsum.numeroProv
                           FROM Tsuministro tsum
						   WHERE tsum.numeroPieza IN (SELECT tpiz.numeroPieza 
						                              FROM Tpieza tpiz
												      WHERE tpiz.color='Rojo'))


--51 Listar el número de proveedor que no aporta ni la pieza P4 ni la P5 

--VERSION CON SUBCONSULTA---

SELECT tprov.Nombre
FROM  Tproveedor tprov
WHERE tprov.numeroProv NOT IN (SELECT tsum.numeroProv
                              FROM Tsuministro tsum
						      WHERE tsum.numeroPieza='P4' or tsum.numeroPieza='P5');


--52- Eliminar de la base de datos al proveedor que posea el estado menor

DELETE FROM Tproveedor  WHERE estado=(SELECT MIN(tprov.estado) FROM Tproveedor tprov WHERE tprov.numeroProv=numeroProv)


